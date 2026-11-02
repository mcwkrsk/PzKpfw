
/mnt/data/is2_re_analysis_kit_stage1_17_continuation_2026-11-01/original/is.exe:     file format pei-i386


disassembly of section .text:

00402b50 <.text+0x1b50>:
  402b50:	55                   	push   ebp
  402b51:	8b ec                	mov    ebp,esp
  402b53:	6a ff                	push   0xffffffff
  402b55:	68 0b 5b 41 00       	push   0x415b0b
  402b5a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  402b60:	50                   	push   eax
  402b61:	83 ec 5c             	sub    esp,0x5c
  402b64:	53                   	push   ebx
  402b65:	56                   	push   esi
  402b66:	57                   	push   edi
  402b67:	a1 cc 90 46 00       	mov    eax,ds:0x4690cc
  402b6c:	33 c5                	xor    eax,ebp
  402b6e:	50                   	push   eax
  402b6f:	8d 45 f4             	lea    eax,[ebp-0xc]
  402b72:	64 a3 00 00 00 00    	mov    fs:0x0,eax
  402b78:	8b c1                	mov    eax,ecx
  402b7a:	89 45 e8             	mov    dword ptr [ebp-0x18],eax
  402b7d:	05 b0 00 00 00       	add    eax,0xb0
  402b82:	8d 4d dc             	lea    ecx,[ebp-0x24]
  402b85:	51                   	push   ecx
  402b86:	8b c8                	mov    ecx,eax
  402b88:	89 45 d8             	mov    dword ptr [ebp-0x28],eax
  402b8b:	e8 b0 f6 ff ff       	call   0x402240
  402b90:	50                   	push   eax
  402b91:	8d 45 98             	lea    eax,[ebp-0x68]
  402b94:	50                   	push   eax
  402b95:	e8 d6 e6 ff ff       	call   0x401270
  402b9a:	83 c4 08             	add    esp,0x8
  402b9d:	8b 45 dc             	mov    eax,dword ptr [ebp-0x24]
  402ba0:	83 cb ff             	or     ebx,0xffffffff
  402ba3:	8b 3d 98 93 41 00    	mov    edi,dword ptr ds:0x419398
  402ba9:	c7 45 fc 01 00 00 00 	mov    dword ptr [ebp-0x4],0x1
  402bb0:	8b 08                	mov    ecx,dword ptr [eax]
  402bb2:	85 c9                	test   ecx,ecx
  402bb4:	74 14                	je     0x402bca
  402bb6:	3b cb                	cmp    ecx,ebx
  402bb8:	74 16                	je     0x402bd0
  402bba:	8b cb                	mov    ecx,ebx
  402bbc:	f0 0f c1 08          	lock xadd dword ptr [eax],ecx
  402bc0:	0f 95 c0             	setne  al
  402bc3:	84 c0                	test   al,al
  402bc5:	75 09                	jne    0x402bd0
  402bc7:	8b 45 dc             	mov    eax,dword ptr [ebp-0x24]
  402bca:	50                   	push   eax
  402bcb:	ff d7                	call   edi
  402bcd:	83 c4 04             	add    esp,0x4
  402bd0:	8b 75 a4             	mov    esi,dword ptr [ebp-0x5c]
  402bd3:	c6 45 fc 00          	mov    byte ptr [ebp-0x4],0x0
  402bd7:	85 f6                	test   esi,esi
  402bd9:	74 34                	je     0x402c0f
  402bdb:	8b 3d 74 93 41 00    	mov    edi,dword ptr ds:0x419374
  402be1:	8b 55 9c             	mov    edx,dword ptr [ebp-0x64]
  402be4:	3b 55 a0             	cmp    edx,dword ptr [ebp-0x60]
  402be7:	0f 95 c0             	setne  al
  402bea:	84 c0                	test   al,al
  402bec:	74 1b                	je     0x402c09
  402bee:	8b 0a                	mov    ecx,dword ptr [edx]
  402bf0:	85 f6                	test   esi,esi
  402bf2:	74 07                	je     0x402bfb
  402bf4:	ff d7                	call   edi
  402bf6:	8b 55 9c             	mov    edx,dword ptr [ebp-0x64]
  402bf9:	33 f6                	xor    esi,esi
  402bfb:	83 c2 04             	add    edx,0x4
  402bfe:	83 f6 01             	xor    esi,0x1
  402c01:	89 55 9c             	mov    dword ptr [ebp-0x64],edx
  402c04:	89 75 a4             	mov    dword ptr [ebp-0x5c],esi
  402c07:	75 db                	jne    0x402be4
  402c09:	8b 3d 98 93 41 00    	mov    edi,dword ptr ds:0x419398
  402c0f:	8b 4d 98             	mov    ecx,dword ptr [ebp-0x68]
  402c12:	c7 45 fc 02 00 00 00 	mov    dword ptr [ebp-0x4],0x2
  402c19:	8b 01                	mov    eax,dword ptr [ecx]
  402c1b:	85 c0                	test   eax,eax
  402c1d:	74 15                	je     0x402c34
  402c1f:	83 f8 ff             	cmp    eax,0xffffffff
  402c22:	74 16                	je     0x402c3a
  402c24:	8b c3                	mov    eax,ebx
  402c26:	f0 0f c1 01          	lock xadd dword ptr [ecx],eax
  402c2a:	0f 95 c0             	setne  al
  402c2d:	84 c0                	test   al,al
  402c2f:	75 09                	jne    0x402c3a
  402c31:	8b 4d 98             	mov    ecx,dword ptr [ebp-0x68]
  402c34:	51                   	push   ecx
  402c35:	ff d7                	call   edi
  402c37:	83 c4 04             	add    esp,0x4
  402c3a:	8b 45 d8             	mov    eax,dword ptr [ebp-0x28]
  402c3d:	8b 35 10 93 41 00    	mov    esi,dword ptr ds:0x419310
  402c43:	8b 38                	mov    edi,dword ptr [eax]
  402c45:	89 30                	mov    dword ptr [eax],esi
  402c47:	8b 07                	mov    eax,dword ptr [edi]
  402c49:	c7 45 fc 03 00 00 00 	mov    dword ptr [ebp-0x4],0x3
