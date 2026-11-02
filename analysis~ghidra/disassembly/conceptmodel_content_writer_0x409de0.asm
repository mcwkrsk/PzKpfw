
../original/is.exe:     file format pei-i386


disassembly of section .text:

00409de0 <.text+0x8de0>:
  409de0:	55                   	push   ebp
  409de1:	8b ec                	mov    ebp,esp
  409de3:	6a ff                	push   0xffffffff
  409de5:	68 79 6d 41 00       	push   0x416d79
  409dea:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  409df0:	50                   	push   eax
  409df1:	83 ec 08             	sub    esp,0x8
  409df4:	a1 cc 90 46 00       	mov    eax,ds:0x4690cc
  409df9:	33 c5                	xor    eax,ebp
  409dfb:	50                   	push   eax
  409dfc:	8d 45 f4             	lea    eax,[ebp-0xc]
  409dff:	64 a3 00 00 00 00    	mov    fs:0x0,eax
  409e05:	6a 07                	push   0x7
  409e07:	68 b0 7b 45 00       	push   0x457bb0
  409e0c:	c7 45 ec 00 00 00 00 	mov    dword ptr [ebp-0x14],0x0
  409e13:	ff 15 a8 93 41 00    	call   dword ptr ds:0x4193a8
  409e19:	83 c4 08             	add    esp,0x8
  409e1c:	89 45 f0             	mov    dword ptr [ebp-0x10],eax
  409e1f:	8b 0d b0 96 46 00    	mov    ecx,dword ptr ds:0x4696b0
  409e25:	8d 45 f0             	lea    eax,[ebp-0x10]
  409e28:	50                   	push   eax
  409e29:	ff 75 08             	push   dword ptr [ebp+0x8]
  409e2c:	c7 45 fc 00 00 00 00 	mov    dword ptr [ebp-0x4],0x0
  409e33:	ff 15 74 9b 41 00    	call   dword ptr ds:0x419b74
  409e39:	8d 4d f0             	lea    ecx,[ebp-0x10]
  409e3c:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  409e42:	8b 45 08             	mov    eax,dword ptr [ebp+0x8]
  409e45:	8b 4d f4             	mov    ecx,dword ptr [ebp-0xc]
  409e48:	64 89 0d 00 00 00 00 	mov    dword ptr fs:0x0,ecx
  409e4f:	59                   	pop    ecx
  409e50:	8b e5                	mov    esp,ebp
  409e52:	5d                   	pop    ebp
  409e53:	c3                   	ret
  409e54:	cc                   	int3
  409e55:	cc                   	int3
  409e56:	cc                   	int3
  409e57:	cc                   	int3
  409e58:	cc                   	int3
  409e59:	cc                   	int3
  409e5a:	cc                   	int3
  409e5b:	cc                   	int3
  409e5c:	cc                   	int3
  409e5d:	cc                   	int3
  409e5e:	cc                   	int3
  409e5f:	cc                   	int3
  409e60:	55                   	push   ebp
  409e61:	8b ec                	mov    ebp,esp
  409e63:	6a ff                	push   0xffffffff
  409e65:	68 02 6e 41 00       	push   0x416e02
  409e6a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  409e70:	50                   	push   eax
  409e71:	83 ec 20             	sub    esp,0x20
  409e74:	53                   	push   ebx
  409e75:	56                   	push   esi
  409e76:	57                   	push   edi
  409e77:	a1 cc 90 46 00       	mov    eax,ds:0x4690cc
  409e7c:	33 c5                	xor    eax,ebp
  409e7e:	50                   	push   eax
  409e7f:	8d 45 f4             	lea    eax,[ebp-0xc]
  409e82:	64 a3 00 00 00 00    	mov    fs:0x0,eax
  409e88:	c7 45 e4 00 00 00 00 	mov    dword ptr [ebp-0x1c],0x0
  409e8f:	8b 7d 0c             	mov    edi,dword ptr [ebp+0xc]
  409e92:	57                   	push   edi
  409e93:	ff 75 08             	push   dword ptr [ebp+0x8]
  409e96:	c7 45 fc 00 00 00 00 	mov    dword ptr [ebp-0x4],0x0
  409e9d:	e8 7e 02 00 00       	call   0x40a120
  409ea2:	83 c4 08             	add    esp,0x8
  409ea5:	c7 45 fc 00 00 00 00 	mov    dword ptr [ebp-0x4],0x0
  409eac:	33 f6                	xor    esi,esi
  409eae:	c7 45 e4 01 00 00 00 	mov    dword ptr [ebp-0x1c],0x1
  409eb5:	56                   	push   esi
  409eb6:	8b cf                	mov    ecx,edi
  409eb8:	ff 15 a0 90 41 00    	call   dword ptr ds:0x4190a0
  409ebe:	85 c0                	test   eax,eax
  409ec0:	0f 84 88 00 00 00    	je     0x409f4e
  409ec6:	6a 0a                	push   0xa
  409ec8:	8d 5e 01             	lea    ebx,[esi+0x1]
  409ecb:	8d 45 dc             	lea    eax,[ebp-0x24]
  409ece:	53                   	push   ebx
  409ecf:	50                   	push   eax
  409ed0:	ff 15 c0 92 41 00    	call   dword ptr ds:0x4192c0
  409ed6:	8b f8                	mov    edi,eax
  409ed8:	a1 a8 93 41 00       	mov    eax,ds:0x4193a8
  409edd:	6a 01                	push   0x1
  409edf:	68 04 7c 45 00       	push   0x457c04
  409ee4:	c7 45 fc 01 00 00 00 	mov    dword ptr [ebp-0x4],0x1
  409eeb:	ff d0                	call   eax
  409eed:	89 45 f0             	mov    dword ptr [ebp-0x10],eax
  409ef0:	57                   	push   edi
  409ef1:	8d 45 f0             	lea    eax,[ebp-0x10]
  409ef4:	c6 45 fc 02          	mov    byte ptr [ebp-0x4],0x2
  409ef8:	50                   	push   eax
  409ef9:	8d 45 e0             	lea    eax,[ebp-0x20]
  409efc:	50                   	push   eax
  409efd:	e8 7e 75 ff ff       	call   0x401480
  409f02:	83 c4 20             	add    esp,0x20
  409f05:	8b f8                	mov    edi,eax
  409f07:	8b 4d 0c             	mov    ecx,dword ptr [ebp+0xc]
  409f0a:	56                   	push   esi
  409f0b:	c6 45 fc 03          	mov    byte ptr [ebp-0x4],0x3
  409f0f:	ff 15 a0 90 41 00    	call   dword ptr ds:0x4190a0
  409f15:	8b 4d 08             	mov    ecx,dword ptr [ebp+0x8]
  409f18:	6a 00                	push   0x0
  409f1a:	8b 40 04             	mov    eax,dword ptr [eax+0x4]
  409f1d:	ff 70 04             	push   dword ptr [eax+0x4]
  409f20:	57                   	push   edi
  409f21:	ff 15 bc 9b 41 00    	call   dword ptr ds:0x419bbc
  409f27:	8d 4d e0             	lea    ecx,[ebp-0x20]
  409f2a:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  409f30:	8d 4d f0             	lea    ecx,[ebp-0x10]
  409f33:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  409f39:	8d 4d dc             	lea    ecx,[ebp-0x24]
  409f3c:	c6 45 fc 00          	mov    byte ptr [ebp-0x4],0x0
  409f40:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  409f46:	8b 7d 0c             	mov    edi,dword ptr [ebp+0xc]
  409f49:	e9 8d 00 00 00       	jmp    0x409fdb
  409f4e:	6a 01                	push   0x1
  409f50:	68 9c 7b 45 00       	push   0x457b9c
  409f55:	ff 15 a8 93 41 00    	call   dword ptr ds:0x4193a8
  409f5b:	89 45 e8             	mov    dword ptr [ebp-0x18],eax
  409f5e:	6a 0a                	push   0xa
  409f60:	8d 5e 01             	lea    ebx,[esi+0x1]
  409f63:	c7 45 fc 04 00 00 00 	mov    dword ptr [ebp-0x4],0x4
  409f6a:	8d 45 d4             	lea    eax,[ebp-0x2c]
  409f6d:	53                   	push   ebx
  409f6e:	50                   	push   eax
  409f6f:	ff 15 c0 92 41 00    	call   dword ptr ds:0x4192c0
  409f75:	8b f0                	mov    esi,eax
  409f77:	a1 a8 93 41 00       	mov    eax,ds:0x4193a8
  409f7c:	6a 01                	push   0x1
  409f7e:	68 04 7c 45 00       	push   0x457c04
  409f83:	c6 45 fc 05          	mov    byte ptr [ebp-0x4],0x5
  409f87:	ff d0                	call   eax
  409f89:	89 45 ec             	mov    dword ptr [ebp-0x14],eax
  409f8c:	56                   	push   esi
  409f8d:	8d 45 ec             	lea    eax,[ebp-0x14]
  409f90:	c6 45 fc 06          	mov    byte ptr [ebp-0x4],0x6
  409f94:	50                   	push   eax
  409f95:	8d 45 d8             	lea    eax,[ebp-0x28]
  409f98:	50                   	push   eax
  409f99:	e8 e2 74 ff ff       	call   0x401480
  409f9e:	83 c4 28             	add    esp,0x28
  409fa1:	8d 4d e8             	lea    ecx,[ebp-0x18]
  409fa4:	c6 45 fc 07          	mov    byte ptr [ebp-0x4],0x7
  409fa8:	51                   	push   ecx
  409fa9:	8b 4d 08             	mov    ecx,dword ptr [ebp+0x8]
  409fac:	50                   	push   eax
  409fad:	ff 15 80 9b 41 00    	call   dword ptr ds:0x419b80
  409fb3:	8d 4d d8             	lea    ecx,[ebp-0x28]
  409fb6:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  409fbc:	8d 4d ec             	lea    ecx,[ebp-0x14]
  409fbf:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  409fc5:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  409fc8:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  409fce:	8d 4d e8             	lea    ecx,[ebp-0x18]
  409fd1:	c6 45 fc 00          	mov    byte ptr [ebp-0x4],0x0
  409fd5:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  409fdb:	8b f3                	mov    esi,ebx
  409fdd:	83 fe 03             	cmp    esi,0x3
  409fe0:	0f 8c cf fe ff ff    	jl     0x409eb5
  409fe6:	6a 04                	push   0x4
  409fe8:	68 34 7b 45 00       	push   0x457b34
  409fed:	ff 15 a8 93 41 00    	call   dword ptr ds:0x4193a8
  409ff3:	83 c4 08             	add    esp,0x8
  409ff6:	89 45 0c             	mov    dword ptr [ebp+0xc],eax
  409ff9:	8b 47 04             	mov    eax,dword ptr [edi+0x4]
  409ffc:	8b 4d 08             	mov    ecx,dword ptr [ebp+0x8]
  409fff:	c7 45 fc 08 00 00 00 	mov    dword ptr [ebp-0x4],0x8
  40a006:	8b 40 28             	mov    eax,dword ptr [eax+0x28]
  40a009:	99                   	cdq
  40a00a:	52                   	push   edx
  40a00b:	50                   	push   eax
  40a00c:	8d 45 0c             	lea    eax,[ebp+0xc]
  40a00f:	50                   	push   eax
  40a010:	ff 15 4c 9b 41 00    	call   dword ptr ds:0x419b4c
  40a016:	8d 4d 0c             	lea    ecx,[ebp+0xc]
  40a019:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  40a01f:	8b 45 08             	mov    eax,dword ptr [ebp+0x8]
  40a022:	8b 4d f4             	mov    ecx,dword ptr [ebp-0xc]
  40a025:	64 89 0d 00 00 00 00 	mov    dword ptr fs:0x0,ecx
  40a02c:	59                   	pop    ecx
  40a02d:	5f                   	pop    edi
  40a02e:	5e                   	pop    esi
  40a02f:	5b                   	pop    ebx
  40a030:	8b e5                	mov    esp,ebp
  40a032:	5d                   	pop    ebp
  40a033:	c3                   	ret
  40a034:	cc                   	int3
  40a035:	cc                   	int3
  40a036:	cc                   	int3
  40a037:	cc                   	int3
  40a038:	cc                   	int3
  40a039:	cc                   	int3
  40a03a:	cc                   	int3
  40a03b:	cc                   	int3
  40a03c:	cc                   	int3
  40a03d:	cc                   	int3
  40a03e:	cc                   	int3
  40a03f:	cc                   	int3
