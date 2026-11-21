"""Sign in with ChatGPT for the open-source desktop application.

The implementation follows OpenAI's public-client OAuth flow: dynamic client
registration, loopback redirect, PKCE, ID-token verification and rotating
refresh tokens. Credentials are protected with Windows DPAPI at rest.
"""
from __future__ import annotations

import base64
import ctypes
from ctypes import wintypes
import hashlib
import json
import os
from pathlib import Path
import secrets
import tempfile
import threading
import time
from typing import Any, Callable, Mapping
from urllib.error import HTTPError, URLError
from urllib.parse import parse_qs, urlencode, urlparse
from urllib.request import Request, urlopen
import uuid
import webbrowser
from http.server import BaseHTTPRequestHandler, HTTPServer


AUTHORIZATION_ENDPOINT = "https://auth.openai.com/api/accounts/authorize"
TOKEN_ENDPOINT = "https://auth.openai.com/api/accounts/oauth/token"
JWKS_ENDPOINT = "https://auth.openai.com/.well-known/jwks.json"
ISSUER = "https://auth.openai.com"
RESOURCE = "https://api.openai.com/v1"
SCOPES = "openid profile email offline_access resource.invoke chatgpt.tokens.use.direct"
REQUIRED_PLAN_SCOPE = "chatgpt.tokens.use.direct"


class ChatGPTAuthError(RuntimeError):
    """Raised when ChatGPT sign-in or token renewal cannot complete safely."""


def _default_config_dir() -> Path:
    root = os.environ.get("LOCALAPPDATA")
    if root:
        return Path(root) / "PzKpfw"
    return Path.home() / ".pzkpfw"


class _DataBlob(ctypes.Structure):
    _fields_ = [("cbData", wintypes.DWORD), ("pbData", ctypes.POINTER(ctypes.c_byte))]


def _blob(data: bytes) -> tuple[_DataBlob, Any]:
    buffer = ctypes.create_string_buffer(data)
    return _DataBlob(len(data), ctypes.cast(buffer, ctypes.POINTER(ctypes.c_byte))), buffer


def _dpapi_protect(data: bytes) -> bytes:
    if os.name != "nt":
        raise ChatGPTAuthError("Защищённое хранение входа поддерживается только в Windows.")
    source, source_buffer = _blob(data)
    entropy, entropy_buffer = _blob(b"PzKpfw ChatGPT OAuth v1")
    output = _DataBlob()
    crypt32 = ctypes.windll.crypt32
    kernel32 = ctypes.windll.kernel32
    crypt32.CryptProtectData.argtypes = [
        ctypes.POINTER(_DataBlob), wintypes.LPCWSTR, ctypes.POINTER(_DataBlob),
        ctypes.c_void_p, ctypes.c_void_p, wintypes.DWORD, ctypes.POINTER(_DataBlob),
    ]
    crypt32.CryptProtectData.restype = wintypes.BOOL
    kernel32.LocalFree.argtypes = [ctypes.c_void_p]
    kernel32.LocalFree.restype = ctypes.c_void_p
    if not crypt32.CryptProtectData(
        ctypes.byref(source), "PzKpfw ChatGPT", ctypes.byref(entropy), None, None,
        0x01, ctypes.byref(output),
    ):
        raise ChatGPTAuthError("Windows не смогла защитить данные входа ChatGPT.")
    try:
        return ctypes.string_at(output.pbData, output.cbData)
    finally:
        kernel32.LocalFree(ctypes.cast(output.pbData, ctypes.c_void_p))
        del source_buffer, entropy_buffer


def _dpapi_unprotect(data: bytes) -> bytes:
    if os.name != "nt":
        raise ChatGPTAuthError("Защищённое хранение входа поддерживается только в Windows.")
    source, source_buffer = _blob(data)
    entropy, entropy_buffer = _blob(b"PzKpfw ChatGPT OAuth v1")
    output = _DataBlob()
    crypt32 = ctypes.windll.crypt32
    kernel32 = ctypes.windll.kernel32
    crypt32.CryptUnprotectData.argtypes = [
        ctypes.POINTER(_DataBlob), ctypes.c_void_p, ctypes.POINTER(_DataBlob),
        ctypes.c_void_p, ctypes.c_void_p, wintypes.DWORD, ctypes.POINTER(_DataBlob),
    ]
    crypt32.CryptUnprotectData.restype = wintypes.BOOL
    kernel32.LocalFree.argtypes = [ctypes.c_void_p]
    kernel32.LocalFree.restype = ctypes.c_void_p
    if not crypt32.CryptUnprotectData(
        ctypes.byref(source), None, ctypes.byref(entropy), None, None,
        0x01, ctypes.byref(output),
    ):
        raise ChatGPTAuthError("Сохранённый вход ChatGPT повреждён или принадлежит другому пользователю Windows.")
    try:
        return ctypes.string_at(output.pbData, output.cbData)
    finally:
        kernel32.LocalFree(ctypes.cast(output.pbData, ctypes.c_void_p))
        del source_buffer, entropy_buffer


class ChatGPTCredentialStore:
    """Small atomic credential store encrypted for the current Windows user."""

    def __init__(
        self,
        directory: str | Path | None = None,
        *,
        protect: Callable[[bytes], bytes] = _dpapi_protect,
        unprotect: Callable[[bytes], bytes] = _dpapi_unprotect,
    ) -> None:
        self.directory = Path(directory) if directory is not None else _default_config_dir()
        self.credentials_path = self.directory / "chatgpt_credentials.bin"
        self.host_path = self.directory / "chatgpt_host.json"
        self._protect = protect
        self._unprotect = unprotect

    def host_id(self) -> str:
        try:
            value = json.loads(self.host_path.read_text(encoding="utf-8")).get("ext_agent_host_id")
            if isinstance(value, str) and value.startswith("urn:uuid:"):
                return value
        except (OSError, UnicodeError, json.JSONDecodeError, AttributeError):
            pass
        value = "urn:uuid:" + str(uuid.uuid4())
        self._atomic_write(self.host_path, json.dumps({"ext_agent_host_id": value}).encode("utf-8"))
        return value

    def load(self) -> dict[str, Any] | None:
        try:
            raw = self._unprotect(self.credentials_path.read_bytes())
            value = json.loads(raw.decode("utf-8"))
        except FileNotFoundError:
            return None
        except (OSError, UnicodeError, json.JSONDecodeError) as exc:
            raise ChatGPTAuthError("Не удалось прочитать сохранённый вход ChatGPT.") from exc
        if not isinstance(value, dict):
            raise ChatGPTAuthError("Сохранённый вход ChatGPT имеет неверный формат.")
        return value

    def save(self, record: Mapping[str, Any]) -> None:
        encoded = json.dumps(dict(record), ensure_ascii=False, separators=(",", ":")).encode("utf-8")
        self._atomic_write(self.credentials_path, self._protect(encoded))

    def clear_tokens(self) -> None:
        try:
            record = self.load()
        except ChatGPTAuthError:
            self.discard()
            return
        if record is None:
            return
        for key in ("access_token", "refresh_token", "id_token", "expires_in", "saved_at"):
            record.pop(key, None)
        self.save(record)

    def discard(self) -> None:
        try:
            self.credentials_path.unlink()
        except FileNotFoundError:
            pass

    def _atomic_write(self, path: Path, data: bytes) -> None:
        path.parent.mkdir(parents=True, exist_ok=True)
        fd, temporary = tempfile.mkstemp(prefix=path.name + ".", dir=path.parent)
        try:
            with os.fdopen(fd, "wb") as stream:
                stream.write(data)
                stream.flush()
                os.fsync(stream.fileno())
            os.replace(temporary, path)
        finally:
            try:
                os.unlink(temporary)
            except FileNotFoundError:
                pass


class OAuthHttpClient:
    """Bounded HTTPS client used only for OpenAI OAuth metadata and tokens."""

    def get_json(self, url: str, *, timeout: float = 30.0) -> dict[str, Any]:
        return self._request_json("GET", url, None, {}, timeout)

    def post_form(self, url: str, form: Mapping[str, str], *, timeout: float = 30.0) -> dict[str, Any]:
        body = urlencode(form).encode("ascii")
        return self._request_json(
            "POST", url, body,
            {"Content-Type": "application/x-www-form-urlencoded", "Accept": "application/json"},
            timeout,
        )

    def _request_json(
        self, method: str, url: str, body: bytes | None,
        headers: Mapping[str, str], timeout: float,
    ) -> dict[str, Any]:
        parsed = urlparse(url)
        if parsed.scheme != "https" or not parsed.hostname:
            raise ChatGPTAuthError("OAuth допускает только защищённое соединение HTTPS.")
        request = Request(url, data=body, headers=dict(headers), method=method)
        try:
            with urlopen(request, timeout=timeout) as response:
                status = response.status
                raw = response.read(2 * 1024 * 1024 + 1)
        except HTTPError as exc:
            status = exc.code
            raw = exc.read(2 * 1024 * 1024 + 1)
        except (OSError, TimeoutError, URLError) as exc:
            raise ChatGPTAuthError(f"Не удалось связаться со службой входа ChatGPT: {exc}") from exc
        if len(raw) > 2 * 1024 * 1024:
            raise ChatGPTAuthError("Ответ службы входа ChatGPT слишком большой.")
        try:
            value = json.loads(raw.decode("utf-8")) if raw else {}
        except (UnicodeError, json.JSONDecodeError) as exc:
            raise ChatGPTAuthError("Служба входа ChatGPT вернула некорректный ответ.") from exc
        if not isinstance(value, dict):
            raise ChatGPTAuthError("Служба входа ChatGPT вернула некорректный ответ.")
        if not 200 <= status < 300:
            error = value.get("error_description") or value.get("detail") or value.get("error")
            if isinstance(error, dict):
                error = error.get("message") or error.get("code")
            if isinstance(error, str) and "country, region, or territory not supported" in error.lower():
                raise ChatGPTAuthError(
                    "OpenAI не поддерживает вход из определённого текущего региона. "
                    "Это ограничение на стороне OpenAI, а не ошибка PzKpfw."
                )
            raise ChatGPTAuthError(f"Вход ChatGPT отклонён: {error or 'HTTP ' + str(status)}")
        return value


class _CallbackState:
    query: dict[str, list[str]] | None = None


def _callback_handler(state: _CallbackState) -> type[BaseHTTPRequestHandler]:
    class Handler(BaseHTTPRequestHandler):
        def do_GET(self) -> None:  # noqa: N802 - BaseHTTPRequestHandler API
            parsed = urlparse(self.path)
            if parsed.path != "/auth/callback":
                self.send_error(404)
                return
            state.query = parse_qs(parsed.query, keep_blank_values=True)
            body = (
                "<!doctype html><meta charset='utf-8'><title>PzKpfw</title>"
                "<style>body{font:18px system-ui;margin:4rem;max-width:42rem}</style>"
                "<h1>Вход завершён</h1><p>Вернитесь в PzKpfw. Это окно можно закрыть.</p>"
            ).encode("utf-8")
            self.send_response(200)
            self.send_header("Content-Type", "text/html; charset=utf-8")
            self.send_header("Content-Length", str(len(body)))
            self.end_headers()
            self.wfile.write(body)

        def log_message(self, _format: str, *_args: object) -> None:
            return

    return Handler


def _b64url_decode(value: str) -> bytes:
    return base64.urlsafe_b64decode(value + "=" * (-len(value) % 4))


def verify_id_token(
    token: str, *, client_id: str, nonce: str,
    jwks: Mapping[str, Any], now: float | None = None,
) -> dict[str, Any]:
    """Verify an OpenAI RS256 ID token and its required OIDC claims."""
    try:
        header_part, payload_part, signature_part = token.split(".")
        header = json.loads(_b64url_decode(header_part))
        payload = json.loads(_b64url_decode(payload_part))
        signature = _b64url_decode(signature_part)
    except (ValueError, UnicodeError, json.JSONDecodeError) as exc:
        raise ChatGPTAuthError("ChatGPT вернул некорректный токен личности.") from exc
    if not isinstance(header, dict) or header.get("alg") != "RS256" or not isinstance(payload, dict):
        raise ChatGPTAuthError("Токен личности ChatGPT использует неподдерживаемый формат.")
    key = next((item for item in jwks.get("keys", []) if item.get("kid") == header.get("kid")), None)
    if not isinstance(key, dict) or key.get("kty") != "RSA":
        raise ChatGPTAuthError("Не найден ключ OpenAI для проверки токена личности.")
    try:
        _verify_rs256_signature(
            signature,
            (header_part + "." + payload_part).encode("ascii"),
            modulus=int.from_bytes(_b64url_decode(str(key["n"])), "big"),
            exponent=int.from_bytes(_b64url_decode(str(key["e"])), "big"),
        )
    except (KeyError, ValueError) as exc:
        raise ChatGPTAuthError("Подпись токена личности ChatGPT не прошла проверку.") from exc
    current = time.time() if now is None else now
    audience = payload.get("aud")
    audience_ok = audience == client_id or isinstance(audience, list) and client_id in audience
    if payload.get("iss") != ISSUER or not audience_ok:
        raise ChatGPTAuthError("Издатель или получатель токена личности не совпадает.")
    if not isinstance(payload.get("sub"), str) or not payload["sub"]:
        raise ChatGPTAuthError("В токене личности отсутствует идентификатор пользователя.")
    if not isinstance(payload.get("exp"), (int, float)) or payload["exp"] < current - 5:
        raise ChatGPTAuthError("Токен личности уже истёк.")
    if not isinstance(payload.get("iat"), (int, float)) or payload["iat"] > current + 5:
        raise ChatGPTAuthError("Время выпуска токена личности некорректно.")
    if payload.get("nonce") != nonce:
        raise ChatGPTAuthError("Проверочный код входа ChatGPT не совпадает.")
    return payload


def _verify_rs256_signature(signature: bytes, message: bytes, *, modulus: int, exponent: int) -> None:
    """Verify RSASSA-PKCS1-v1_5 with SHA-256 using Python integer arithmetic."""
    if modulus <= 0 or exponent < 3 or exponent % 2 == 0:
        raise ValueError("invalid RSA public key")
    width = (modulus.bit_length() + 7) // 8
    if len(signature) != width:
        raise ValueError("invalid RSA signature size")
    signature_number = int.from_bytes(signature, "big")
    if signature_number >= modulus:
        raise ValueError("RSA signature is outside the modulus")
    encoded = pow(signature_number, exponent, modulus).to_bytes(width, "big")
    digest_info = bytes.fromhex("3031300d060960864801650304020105000420") + hashlib.sha256(message).digest()
    padding_length = width - len(digest_info) - 3
    if padding_length < 8:
        raise ValueError("RSA modulus is too short")
    expected = b"\x00\x01" + b"\xff" * padding_length + b"\x00" + digest_info
    if not secrets.compare_digest(encoded, expected):
        raise ValueError("invalid RSA signature")


class ChatGPTAuthManager:
    """Own one active ChatGPT registration and renewable OAuth session."""

    def __init__(
        self,
        store: ChatGPTCredentialStore | None = None,
        *,
        http: OAuthHttpClient | None = None,
        browser_open: Callable[[str], bool] = webbrowser.open,
    ) -> None:
        self.store = store or ChatGPTCredentialStore()
        self.http = http or OAuthHttpClient()
        self.browser_open = browser_open
        self._lock = threading.Lock()

    def record(self) -> dict[str, Any] | None:
        return self.store.load()

    def is_signed_in(self) -> bool:
        try:
            record = self.record()
        except ChatGPTAuthError:
            return False
        return bool(record and record.get("access_token") and REQUIRED_PLAN_SCOPE in record.get("scopes", []))

    def account_label(self) -> str:
        try:
            record = self.record()
        except ChatGPTAuthError:
            return "Сохранённый вход повреждён — войдите снова"
        if not record or not record.get("access_token"):
            return "ChatGPT не подключён"
        return "Подключён ChatGPT: " + str(record.get("email") or "учётная запись")

    def sign_in(self, *, timeout_seconds: float = 300.0) -> dict[str, Any]:
        try:
            existing = self.record() or {}
        except ChatGPTAuthError:
            self.store.discard()
            existing = {}
        issued_client_id = existing.get("client_id")
        client_id = str(issued_client_id or "dynamic_agent_client")
        state = secrets.token_urlsafe(32)
        nonce = secrets.token_urlsafe(32)
        verifier = secrets.token_urlsafe(64)
        challenge = base64.urlsafe_b64encode(hashlib.sha256(verifier.encode("ascii")).digest()).rstrip(b"=").decode("ascii")
        callback_state = _CallbackState()
        server = HTTPServer(("127.0.0.1", 0), _callback_handler(callback_state))
        server.timeout = 0.25
        redirect_uri = f"http://127.0.0.1:{server.server_port}/auth/callback"
        params = {
            "client_id": client_id,
            "ext_agent_host_id": self.store.host_id(),
            "response_type": "code",
            "redirect_uri": redirect_uri,
            "scope": SCOPES,
            "resource": RESOURCE,
            "state": state,
            "nonce": nonce,
            "code_challenge_method": "S256",
            "code_challenge": challenge,
        }
        if not issued_client_id:
            params["agent_name_hint"] = "PzKpfw"
        else:
            if existing.get("id_token"):
                params["id_token_hint"] = str(existing["id_token"])
            if existing.get("email"):
                params["login_hint"] = str(existing["email"])
        if not self.browser_open(AUTHORIZATION_ENDPOINT + "?" + urlencode(params)):
            server.server_close()
            raise ChatGPTAuthError("Не удалось открыть браузер для входа в ChatGPT.")
        deadline = time.monotonic() + timeout_seconds
        try:
            while callback_state.query is None and time.monotonic() < deadline:
                server.handle_request()
        finally:
            server.server_close()
        query = callback_state.query
        if query is None:
            raise ChatGPTAuthError("Время ожидания входа ChatGPT истекло.")
        if query.get("state", [None])[0] != state:
            raise ChatGPTAuthError("Ответ входа ChatGPT не прошёл проверку состояния.")
        if query.get("error"):
            detail = query.get("error_description", query["error"])[0]
            if "country, region, or territory not supported" in detail.lower():
                raise ChatGPTAuthError(
                    "OpenAI не поддерживает вход из определённого текущего региона. "
                    "Это ограничение на стороне OpenAI, а не ошибка PzKpfw."
                )
            raise ChatGPTAuthError("Вход ChatGPT отменён или отклонён: " + detail)
        code = query.get("code", [None])[0]
        callback_client_id = query.get("client_id", [None])[0]
        exchange_client_id = str(callback_client_id or issued_client_id or "")
        if not code or not exchange_client_id or exchange_client_id == "dynamic_agent_client":
            raise ChatGPTAuthError("Регистрация PzKpfw в ChatGPT не была завершена.")
        if issued_client_id and callback_client_id and callback_client_id != issued_client_id:
            raise ChatGPTAuthError("ChatGPT вернул идентификатор другой регистрации.")
        tokens = self.http.post_form(TOKEN_ENDPOINT, {
            "grant_type": "authorization_code",
            "client_id": exchange_client_id,
            "code": str(code),
            "code_verifier": verifier,
            "redirect_uri": redirect_uri,
            "resource": RESOURCE,
        })
        id_token = tokens.get("id_token")
        if not isinstance(id_token, str):
            raise ChatGPTAuthError("ChatGPT не вернул токен личности.")
        claims = verify_id_token(
            id_token, client_id=exchange_client_id, nonce=nonce,
            jwks=self.http.get_json(JWKS_ENDPOINT),
        )
        scopes = str(tokens.get("scope") or query.get("scope", [""])[0]).split()
        if REQUIRED_PLAN_SCOPE not in scopes:
            raise ChatGPTAuthError("Доступ к лимиту ChatGPT не разрешён. Повторите вход и подтвердите доступ.")
        record = {
            "email": claims.get("email"),
            "issuer": claims.get("iss"),
            "subject": claims.get("sub"),
            "client_id": exchange_client_id,
            "ext_agent_host_id": self.store.host_id(),
            "id_token": id_token,
            "access_token": tokens.get("access_token"),
            "refresh_token": tokens.get("refresh_token"),
            "token_type": tokens.get("token_type", "Bearer"),
            "expires_in": tokens.get("expires_in", 3600),
            "scopes": scopes,
            "saved_at": time.time(),
        }
        if not isinstance(record["access_token"], str) or not isinstance(record["refresh_token"], str):
            raise ChatGPTAuthError("ChatGPT не вернул данные для продолжения сеанса.")
        self.store.save(record)
        return record

    def access_token(self) -> str:
        with self._lock:
            record = self.record()
            if not record or not record.get("access_token"):
                raise ChatGPTAuthError("Сначала войдите через ChatGPT.")
            expires_at = float(record.get("saved_at", 0)) + float(record.get("expires_in", 0))
            if time.time() >= expires_at - 120:
                record = self._refresh(record)
            if REQUIRED_PLAN_SCOPE not in record.get("scopes", []):
                raise ChatGPTAuthError("Для этой учётной записи не разрешено использование лимита ChatGPT.")
            return str(record["access_token"])

    def _refresh(self, record: dict[str, Any]) -> dict[str, Any]:
        refresh_token = record.get("refresh_token")
        if not refresh_token:
            raise ChatGPTAuthError("Сеанс ChatGPT истёк. Выполните вход ещё раз.")
        tokens = self.http.post_form(TOKEN_ENDPOINT, {
            "grant_type": "refresh_token",
            "client_id": str(record["client_id"]),
            "refresh_token": str(refresh_token),
            "resource": RESOURCE,
        })
        updated = dict(record)
        for key in ("access_token", "refresh_token", "id_token", "token_type", "expires_in"):
            if tokens.get(key) is not None:
                updated[key] = tokens[key]
        if tokens.get("scope"):
            updated["scopes"] = str(tokens["scope"]).split()
        updated["saved_at"] = time.time()
        if not updated.get("access_token") or not updated.get("refresh_token"):
            raise ChatGPTAuthError("ChatGPT не смог обновить сеанс.")
        self.store.save(updated)
        return updated

    def sign_out(self) -> None:
        self.store.clear_tokens()
