
/mnt/data/IS2_RE_Stage2_MVP_2026-11-01/original/IS.exe:     file format pei-i386


Disassembly of section .text:

00405d70 <.text+0x4d70>:
  405d70:	55                   	push   ebp
  405d71:	8b ec                	mov    ebp,esp
  405d73:	6a ff                	push   0xffffffff
  405d75:	68 51 60 41 00       	push   0x416051
  405d7a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  405d80:	50                   	push   eax
  405d81:	83 ec 20             	sub    esp,0x20
  405d84:	53                   	push   ebx
  405d85:	56                   	push   esi
  405d86:	57                   	push   edi
  405d87:	a1 cc 90 46 00       	mov    eax,ds:0x4690cc
  405d8c:	33 c5                	xor    eax,ebp
  405d8e:	50                   	push   eax
  405d8f:	8d 45 f4             	lea    eax,[ebp-0xc]
  405d92:	64 a3 00 00 00 00    	mov    fs:0x0,eax
  405d98:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
  405d9b:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
  405d9e:	56                   	push   esi
  405d9f:	e8 8c fb ff ff       	call   0x405930
  405da4:	8b 1d a8 93 41 00    	mov    ebx,DWORD PTR ds:0x4193a8
  405daa:	6a 02                	push   0x2
  405dac:	68 10 7c 45 00       	push   0x457c10
  405db1:	ff d3                	call   ebx
  405db3:	83 c4 10             	add    esp,0x10
  405db6:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
  405db9:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  405dbc:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
  405dc3:	ff 15 d8 93 41 00    	call   DWORD PTR ds:0x4193d8
  405dc9:	8b 3d 7c 9b 41 00    	mov    edi,DWORD PTR ds:0x419b7c
  405dcf:	8b ce                	mov    ecx,esi
  405dd1:	50                   	push   eax
  405dd2:	8d 45 f0             	lea    eax,[ebp-0x10]
  405dd5:	c6 45 fc 01          	mov    BYTE PTR [ebp-0x4],0x1
  405dd9:	50                   	push   eax
  405dda:	8d 45 e8             	lea    eax,[ebp-0x18]
  405ddd:	50                   	push   eax
  405dde:	ff d7                	call   edi
  405de0:	8b 35 d0 92 41 00    	mov    esi,DWORD PTR ds:0x4192d0
  405de6:	8b c8                	mov    ecx,eax
  405de8:	6a 0a                	push   0xa
  405dea:	6a 00                	push   0x0
  405dec:	c6 45 fc 02          	mov    BYTE PTR [ebp-0x4],0x2
  405df0:	ff d6                	call   esi
  405df2:	8d 4d e8             	lea    ecx,[ebp-0x18]
  405df5:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
  405df8:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  405dfe:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  405e01:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  405e07:	8d 4d f0             	lea    ecx,[ebp-0x10]
  405e0a:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
  405e11:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  405e17:	6a 02                	push   0x2
  405e19:	68 14 7c 45 00       	push   0x457c14
  405e1e:	ff d3                	call   ebx
  405e20:	83 c4 08             	add    esp,0x8
  405e23:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
  405e26:	8d 4d e8             	lea    ecx,[ebp-0x18]
  405e29:	c7 45 fc 03 00 00 00 	mov    DWORD PTR [ebp-0x4],0x3
  405e30:	ff 15 d8 93 41 00    	call   DWORD PTR ds:0x4193d8
  405e36:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  405e39:	50                   	push   eax
  405e3a:	8d 45 f0             	lea    eax,[ebp-0x10]
  405e3d:	c6 45 fc 04          	mov    BYTE PTR [ebp-0x4],0x4
  405e41:	50                   	push   eax
  405e42:	8d 45 e4             	lea    eax,[ebp-0x1c]
  405e45:	50                   	push   eax
  405e46:	ff d7                	call   edi
  405e48:	6a 0a                	push   0xa
  405e4a:	6a 00                	push   0x0
  405e4c:	8b c8                	mov    ecx,eax
  405e4e:	c6 45 fc 05          	mov    BYTE PTR [ebp-0x4],0x5
  405e52:	ff d6                	call   esi
  405e54:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  405e57:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
  405e5a:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  405e60:	8d 4d e8             	lea    ecx,[ebp-0x18]
  405e63:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  405e69:	8d 4d f0             	lea    ecx,[ebp-0x10]
  405e6c:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
  405e73:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  405e79:	6a 02                	push   0x2
  405e7b:	68 18 7c 45 00       	push   0x457c18
  405e80:	ff d3                	call   ebx
  405e82:	83 c4 08             	add    esp,0x8
  405e85:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
  405e88:	8d 4d dc             	lea    ecx,[ebp-0x24]
  405e8b:	c7 45 fc 06 00 00 00 	mov    DWORD PTR [ebp-0x4],0x6
  405e92:	ff 15 d8 93 41 00    	call   DWORD PTR ds:0x4193d8
  405e98:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  405e9b:	50                   	push   eax
  405e9c:	8d 45 ec             	lea    eax,[ebp-0x14]
  405e9f:	c6 45 fc 07          	mov    BYTE PTR [ebp-0x4],0x7
  405ea3:	50                   	push   eax
  405ea4:	8d 45 e0             	lea    eax,[ebp-0x20]
  405ea7:	50                   	push   eax
  405ea8:	ff d7                	call   edi
  405eaa:	6a 0a                	push   0xa
  405eac:	6a 00                	push   0x0
  405eae:	8b c8                	mov    ecx,eax
  405eb0:	c6 45 fc 08          	mov    BYTE PTR [ebp-0x4],0x8
  405eb4:	ff d6                	call   esi
  405eb6:	8d 4d e0             	lea    ecx,[ebp-0x20]
  405eb9:	8b d8                	mov    ebx,eax
  405ebb:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  405ec1:	8d 4d dc             	lea    ecx,[ebp-0x24]
  405ec4:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  405eca:	8d 4d ec             	lea    ecx,[ebp-0x14]
  405ecd:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
  405ed4:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  405eda:	ff 75 d8             	push   DWORD PTR [ebp-0x28]
  405edd:	8b 7d 10             	mov    edi,DWORD PTR [ebp+0x10]
  405ee0:	8b cf                	mov    ecx,edi
  405ee2:	8b 35 44 91 41 00    	mov    esi,DWORD PTR ds:0x419144
  405ee8:	ff d6                	call   esi
  405eea:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
  405eed:	50                   	push   eax
  405eee:	ff 15 b4 90 41 00    	call   DWORD PTR ds:0x4190b4
  405ef4:	ff 75 d4             	push   DWORD PTR [ebp-0x2c]
  405ef7:	8b cf                	mov    ecx,edi
  405ef9:	ff d6                	call   esi
  405efb:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
  405efe:	50                   	push   eax
  405eff:	ff 15 b8 90 41 00    	call   DWORD PTR ds:0x4190b8
  405f05:	53                   	push   ebx
  405f06:	8b cf                	mov    ecx,edi
  405f08:	ff d6                	call   esi
  405f0a:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
  405f0d:	50                   	push   eax
  405f0e:	ff 15 bc 90 41 00    	call   DWORD PTR ds:0x4190bc
  405f14:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
  405f17:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  405f1e:	59                   	pop    ecx
  405f1f:	5f                   	pop    edi
  405f20:	5e                   	pop    esi
  405f21:	5b                   	pop    ebx
  405f22:	8b e5                	mov    esp,ebp
  405f24:	5d                   	pop    ebp
  405f25:	c3                   	ret
  405f26:	cc                   	int3
  405f27:	cc                   	int3
  405f28:	cc                   	int3
  405f29:	cc                   	int3
  405f2a:	cc                   	int3
  405f2b:	cc                   	int3
  405f2c:	cc                   	int3
  405f2d:	cc                   	int3
  405f2e:	cc                   	int3
  405f2f:	cc                   	int3
