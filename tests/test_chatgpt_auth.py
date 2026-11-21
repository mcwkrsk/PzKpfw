from pathlib import Path
import tempfile
import time
import unittest

from is2_re.assistant.chatgpt_auth import (
    ChatGPTAuthError,
    ChatGPTAuthManager,
    ChatGPTCredentialStore,
    REQUIRED_PLAN_SCOPE,
    _verify_rs256_signature,
)


class FakeOAuthHttp:
    def __init__(self):
        self.forms = []

    def post_form(self, url, form, *, timeout=30.0):
        self.forms.append((url, dict(form)))
        return {
            "access_token": "new-access",
            "refresh_token": "new-refresh",
            "expires_in": 3600,
            "scope": "openid " + REQUIRED_PLAN_SCOPE,
        }


class ChatGPTAuthTests(unittest.TestCase):
    def test_builtin_rs256_verifier_accepts_valid_signature_and_rejects_tampering(self):
        modulus = int(
            "aa635582094216a25c69845f576b3360b0fd5f9974bbd01c6fef56333452ab05"
            "ca889e83617ecc6a52d793348a29adb80950532a8a28d2fa41b735c9f0ddaf6c"
            "fde34031e43c4a8f49d265b97fec747b7b7e378c23c79ccc08ca9e0889b15d4b"
            "3bd9b174c2b5cc96a5d9505464167e96c2f50051ea9f86395fa3ee34126bb003",
            16,
        )
        signature = bytes.fromhex(
            "05f42b7562f8f33eb157febeaeeb82a5174d38583d4a35d76ab217b2f00e29df"
            "0f7501b8b74cb85c534df407595123358b170c68d8f62599378059a9d3d6f9da"
            "9e8d37cbc4762838b476ff527845ea420bee178d2497013f112c7de1433248400c"
            "679330f4b78034a310110fd83e2f41582502e6e2dbba5c4901c18e9c5192c9"
        )

        _verify_rs256_signature(signature, b"pzkpfw-test", modulus=modulus, exponent=65537)
        with self.assertRaises(ValueError):
            _verify_rs256_signature(signature, b"tampered", modulus=modulus, exponent=65537)

    def _store(self, directory):
        return ChatGPTCredentialStore(
            directory,
            protect=lambda value: value[::-1],
            unprotect=lambda value: value[::-1],
        )

    def test_store_round_trip_and_stable_host_id(self):
        with tempfile.TemporaryDirectory() as directory:
            store = self._store(directory)
            host_id = store.host_id()
            store.save({"client_id": "oaiapp_test", "access_token": "secret"})

            self.assertEqual(store.load()["access_token"], "secret")
            self.assertEqual(store.host_id(), host_id)
            self.assertTrue(host_id.startswith("urn:uuid:"))
            self.assertNotIn(b"secret", Path(store.credentials_path).read_bytes())

    def test_access_token_refreshes_and_rotates_credentials(self):
        with tempfile.TemporaryDirectory() as directory:
            store = self._store(directory)
            store.save({
                "client_id": "oaiapp_test",
                "access_token": "old-access",
                "refresh_token": "old-refresh",
                "expires_in": 3600,
                "saved_at": time.time() - 4000,
                "scopes": [REQUIRED_PLAN_SCOPE],
            })
            http = FakeOAuthHttp()
            manager = ChatGPTAuthManager(store, http=http)

            self.assertEqual(manager.access_token(), "new-access")
            saved = store.load()
            self.assertEqual(saved["refresh_token"], "new-refresh")
            self.assertEqual(http.forms[0][1]["grant_type"], "refresh_token")

    def test_missing_plan_scope_is_never_used_for_inference(self):
        with tempfile.TemporaryDirectory() as directory:
            store = self._store(directory)
            store.save({
                "client_id": "oaiapp_test",
                "access_token": "access",
                "refresh_token": "refresh",
                "expires_in": 3600,
                "saved_at": time.time(),
                "scopes": ["openid"],
            })
            manager = ChatGPTAuthManager(store, http=FakeOAuthHttp())

            with self.assertRaisesRegex(ChatGPTAuthError, "не разрешено"):
                manager.access_token()


if __name__ == "__main__":
    unittest.main()
