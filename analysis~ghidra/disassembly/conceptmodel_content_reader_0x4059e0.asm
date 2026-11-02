
/mnt/data/IS2_RE_Stage2_MVP_2026-11-01/original/IS.exe:     file format pei-i386


Disassembly of section .text:

004059e0 <.text+0x49e0>:
  4059e0:	55                   	push   ebp
  4059e1:	8b ec                	mov    ebp,esp
  4059e3:	6a ff                	push   0xffffffff
  4059e5:	68 5c 5f 41 00       	push   0x415f5c
  4059ea:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  4059f0:	50                   	push   eax
  4059f1:	83 ec 20             	sub    esp,0x20
  4059f4:	53                   	push   ebx
  4059f5:	56                   	push   esi
  4059f6:	57                   	push   edi
  4059f7:	a1 cc 90 46 00       	mov    eax,ds:0x4690cc
  4059fc:	33 c5                	xor    eax,ebp
  4059fe:	50                   	push   eax
  4059ff:	8d 45 f4             	lea    eax,[ebp-0xc]
  405a02:	64 a3 00 00 00 00    	mov    fs:0x0,eax
  405a08:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
  405a0b:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
  405a0e:	53                   	push   ebx
  405a0f:	e8 1c ff ff ff       	call   0x405930
  405a14:	8b 3d a8 93 41 00    	mov    edi,DWORD PTR ds:0x4193a8
  405a1a:	6a 02                	push   0x2
  405a1c:	68 10 7c 45 00       	push   0x457c10
  405a21:	ff d7                	call   edi
  405a23:	83 c4 10             	add    esp,0x10
  405a26:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
  405a29:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  405a2c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
  405a33:	ff 15 d8 93 41 00    	call   DWORD PTR ds:0x4193d8
  405a39:	50                   	push   eax
  405a3a:	8d 45 f0             	lea    eax,[ebp-0x10]
  405a3d:	c6 45 fc 01          	mov    BYTE PTR [ebp-0x4],0x1
  405a41:	50                   	push   eax
  405a42:	8d 45 e8             	lea    eax,[ebp-0x18]
  405a45:	8b cb                	mov    ecx,ebx
  405a47:	8b 1d 7c 9b 41 00    	mov    ebx,DWORD PTR ds:0x419b7c
  405a4d:	50                   	push   eax
  405a4e:	ff d3                	call   ebx
  405a50:	8b 35 d0 92 41 00    	mov    esi,DWORD PTR ds:0x4192d0
  405a56:	8b c8                	mov    ecx,eax
  405a58:	6a 0a                	push   0xa
  405a5a:	6a 00                	push   0x0
  405a5c:	c6 45 fc 02          	mov    BYTE PTR [ebp-0x4],0x2
  405a60:	ff d6                	call   esi
  405a62:	8d 4d e8             	lea    ecx,[ebp-0x18]
  405a65:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
  405a68:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  405a6e:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  405a71:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  405a77:	8d 4d f0             	lea    ecx,[ebp-0x10]
  405a7a:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
  405a81:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  405a87:	6a 02                	push   0x2
  405a89:	68 14 7c 45 00       	push   0x457c14
  405a8e:	ff d7                	call   edi
  405a90:	83 c4 08             	add    esp,0x8
  405a93:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
  405a96:	8d 4d e8             	lea    ecx,[ebp-0x18]
  405a99:	c7 45 fc 03 00 00 00 	mov    DWORD PTR [ebp-0x4],0x3
  405aa0:	ff 15 d8 93 41 00    	call   DWORD PTR ds:0x4193d8
  405aa6:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  405aa9:	50                   	push   eax
  405aaa:	8d 45 f0             	lea    eax,[ebp-0x10]
  405aad:	c6 45 fc 04          	mov    BYTE PTR [ebp-0x4],0x4
  405ab1:	50                   	push   eax
  405ab2:	8d 45 e4             	lea    eax,[ebp-0x1c]
  405ab5:	50                   	push   eax
  405ab6:	ff d3                	call   ebx
  405ab8:	6a 0a                	push   0xa
  405aba:	6a 00                	push   0x0
  405abc:	8b c8                	mov    ecx,eax
  405abe:	c6 45 fc 05          	mov    BYTE PTR [ebp-0x4],0x5
  405ac2:	ff d6                	call   esi
  405ac4:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  405ac7:	8b f8                	mov    edi,eax
  405ac9:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  405acf:	8d 4d e8             	lea    ecx,[ebp-0x18]
  405ad2:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  405ad8:	8d 4d f0             	lea    ecx,[ebp-0x10]
  405adb:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
  405ae2:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  405ae8:	6a 04                	push   0x4
  405aea:	68 50 79 45 00       	push   0x457950
  405aef:	ff 15 a8 93 41 00    	call   DWORD PTR ds:0x4193a8
  405af5:	83 c4 08             	add    esp,0x8
  405af8:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
  405afb:	8d 4d e8             	lea    ecx,[ebp-0x18]
  405afe:	c7 45 fc 06 00 00 00 	mov    DWORD PTR [ebp-0x4],0x6
  405b05:	ff 15 d8 93 41 00    	call   DWORD PTR ds:0x4193d8
  405b0b:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  405b0e:	50                   	push   eax
  405b0f:	8d 45 f0             	lea    eax,[ebp-0x10]
  405b12:	c6 45 fc 07          	mov    BYTE PTR [ebp-0x4],0x7
  405b16:	50                   	push   eax
  405b17:	8d 45 e4             	lea    eax,[ebp-0x1c]
  405b1a:	50                   	push   eax
  405b1b:	ff d3                	call   ebx
  405b1d:	6a 0a                	push   0xa
  405b1f:	6a 00                	push   0x0
  405b21:	8b c8                	mov    ecx,eax
  405b23:	c6 45 fc 08          	mov    BYTE PTR [ebp-0x4],0x8
  405b27:	ff d6                	call   esi
  405b29:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  405b2c:	88 45 d8             	mov    BYTE PTR [ebp-0x28],al
  405b2f:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  405b35:	8d 4d e8             	lea    ecx,[ebp-0x18]
  405b38:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  405b3e:	8d 4d f0             	lea    ecx,[ebp-0x10]
  405b41:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
  405b48:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  405b4e:	6a 05                	push   0x5
  405b50:	68 1c 7c 45 00       	push   0x457c1c
  405b55:	ff 15 a8 93 41 00    	call   DWORD PTR ds:0x4193a8
  405b5b:	83 c4 08             	add    esp,0x8
  405b5e:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
  405b61:	8d 4d dc             	lea    ecx,[ebp-0x24]
  405b64:	c7 45 fc 09 00 00 00 	mov    DWORD PTR [ebp-0x4],0x9
  405b6b:	ff 15 d8 93 41 00    	call   DWORD PTR ds:0x4193d8
  405b71:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  405b74:	50                   	push   eax
  405b75:	8d 45 ec             	lea    eax,[ebp-0x14]
  405b78:	c6 45 fc 0a          	mov    BYTE PTR [ebp-0x4],0xa
  405b7c:	50                   	push   eax
  405b7d:	8d 45 e0             	lea    eax,[ebp-0x20]
  405b80:	50                   	push   eax
  405b81:	ff d3                	call   ebx
  405b83:	6a 0a                	push   0xa
  405b85:	6a 00                	push   0x0
  405b87:	8b c8                	mov    ecx,eax
  405b89:	c6 45 fc 0b          	mov    BYTE PTR [ebp-0x4],0xb
  405b8d:	ff d6                	call   esi
  405b8f:	8d 4d e0             	lea    ecx,[ebp-0x20]
  405b92:	8b f0                	mov    esi,eax
  405b94:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  405b9a:	8d 4d dc             	lea    ecx,[ebp-0x24]
  405b9d:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  405ba3:	8d 4d ec             	lea    ecx,[ebp-0x14]
  405ba6:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
  405bad:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  405bb3:	ff 75 d8             	push   DWORD PTR [ebp-0x28]
  405bb6:	8b 4d 14             	mov    ecx,DWORD PTR [ebp+0x14]
  405bb9:	57                   	push   edi
  405bba:	ff 15 70 90 41 00    	call   DWORD PTR ds:0x419070
  405bc0:	8b 4d 10             	mov    ecx,DWORD PTR [ebp+0x10]
  405bc3:	50                   	push   eax
  405bc4:	ff 75 d4             	push   DWORD PTR [ebp-0x2c]
  405bc7:	ff 15 44 91 41 00    	call   DWORD PTR ds:0x419144
  405bcd:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
  405bd0:	50                   	push   eax
  405bd1:	ff 15 e4 90 41 00    	call   DWORD PTR ds:0x4190e4
  405bd7:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
  405bda:	56                   	push   esi
  405bdb:	ff 15 f0 90 41 00    	call   DWORD PTR ds:0x4190f0
  405be1:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
  405be4:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  405beb:	59                   	pop    ecx
  405bec:	5f                   	pop    edi
  405bed:	5e                   	pop    esi
  405bee:	5b                   	pop    ebx
  405bef:	8b e5                	mov    esp,ebp
  405bf1:	5d                   	pop    ebp
  405bf2:	c3                   	ret
  405bf3:	cc                   	int3
  405bf4:	cc                   	int3
  405bf5:	cc                   	int3
  405bf6:	cc                   	int3
  405bf7:	cc                   	int3
  405bf8:	cc                   	int3
  405bf9:	cc                   	int3
  405bfa:	cc                   	int3
  405bfb:	cc                   	int3
  405bfc:	cc                   	int3
  405bfd:	cc                   	int3
  405bfe:	cc                   	int3
  405bff:	cc                   	int3
