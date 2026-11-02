
/mnt/data/is2_work/original/IS2_PMauto_beta/modules/PM_auto.dll:     file format pei-i386


Disassembly of section .text:

10008cd0 <.text+0x7cd0>:
10008cd0:	55                   	push   ebp
10008cd1:	8b ec                	mov    ebp,esp
10008cd3:	6a ff                	push   0xffffffff
10008cd5:	68 6a ef 01 10       	push   0x1001ef6a
10008cda:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10008ce0:	50                   	push   eax
10008ce1:	83 ec 1c             	sub    esp,0x1c
10008ce4:	53                   	push   ebx
10008ce5:	56                   	push   esi
10008ce6:	57                   	push   edi
10008ce7:	a1 cc f0 06 10       	mov    eax,ds:0x1006f0cc
10008cec:	33 c5                	xor    eax,ebp
10008cee:	50                   	push   eax
10008cef:	8d 45 f4             	lea    eax,[ebp-0xc]
10008cf2:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10008cf8:	8b f1                	mov    esi,ecx
10008cfa:	89 75 ec             	mov    DWORD PTR [ebp-0x14],esi
10008cfd:	8b 8e 48 01 00 00    	mov    ecx,DWORD PTR [esi+0x148]
10008d03:	8b 7d 08             	mov    edi,DWORD PTR [ebp+0x8]
10008d06:	8b 1d 6c 23 02 10    	mov    ebx,DWORD PTR ds:0x1002236c
10008d0c:	57                   	push   edi
10008d0d:	8b 49 20             	mov    ecx,DWORD PTR [ecx+0x20]
10008d10:	ff d3                	call   ebx
10008d12:	8d 4d f0             	lea    ecx,[ebp-0x10]
10008d15:	ff 15 3c 24 02 10    	call   DWORD PTR ds:0x1002243c
10008d1b:	51                   	push   ecx
10008d1c:	8b cc                	mov    ecx,esp
10008d1e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10008d25:	50                   	push   eax
10008d26:	8d 45 08             	lea    eax,[ebp+0x8]
10008d29:	50                   	push   eax
10008d2a:	c7 01 01 00 00 00    	mov    DWORD PTR [ecx],0x1
10008d30:	8b 8e 54 01 00 00    	mov    ecx,DWORD PTR [esi+0x154]
10008d36:	e8 75 b9 ff ff       	call   0x100046b0
10008d3b:	50                   	push   eax
10008d3c:	8d 45 d8             	lea    eax,[ebp-0x28]
10008d3f:	50                   	push   eax
10008d40:	e8 fb ba ff ff       	call   0x10004840
10008d45:	83 c4 08             	add    esp,0x8
10008d48:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10008d4b:	c6 45 fc 01          	mov    BYTE PTR [ebp-0x4],0x1
10008d4f:	8b 08                	mov    ecx,DWORD PTR [eax]
10008d51:	85 c9                	test   ecx,ecx
10008d53:	74 16                	je     0x10008d6b
10008d55:	83 f9 ff             	cmp    ecx,0xffffffff
10008d58:	74 1b                	je     0x10008d75
10008d5a:	83 c9 ff             	or     ecx,0xffffffff
10008d5d:	f0 0f c1 08          	lock xadd DWORD PTR [eax],ecx
10008d61:	0f 95 c0             	setne  al
10008d64:	84 c0                	test   al,al
10008d66:	75 0d                	jne    0x10008d75
10008d68:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10008d6b:	50                   	push   eax
10008d6c:	ff 15 7c 23 02 10    	call   DWORD PTR ds:0x1002237c
10008d72:	83 c4 04             	add    esp,0x4
10008d75:	8d 4d f0             	lea    ecx,[ebp-0x10]
10008d78:	ff 15 a4 23 02 10    	call   DWORD PTR ds:0x100223a4
10008d7e:	8b 75 e4             	mov    esi,DWORD PTR [ebp-0x1c]
10008d81:	85 f6                	test   esi,esi
10008d83:	74 29                	je     0x10008dae
10008d85:	8b 55 dc             	mov    edx,DWORD PTR [ebp-0x24]
10008d88:	3b 55 e0             	cmp    edx,DWORD PTR [ebp-0x20]
10008d8b:	0f 95 c0             	setne  al
10008d8e:	84 c0                	test   al,al
10008d90:	74 1c                	je     0x10008dae
10008d92:	8b 0a                	mov    ecx,DWORD PTR [edx]
10008d94:	85 f6                	test   esi,esi
10008d96:	74 08                	je     0x10008da0
10008d98:	57                   	push   edi
10008d99:	ff d3                	call   ebx
10008d9b:	8b 55 dc             	mov    edx,DWORD PTR [ebp-0x24]
10008d9e:	33 f6                	xor    esi,esi
10008da0:	83 c2 04             	add    edx,0x4
10008da3:	83 f6 01             	xor    esi,0x1
10008da6:	89 55 dc             	mov    DWORD PTR [ebp-0x24],edx
10008da9:	89 75 e4             	mov    DWORD PTR [ebp-0x1c],esi
10008dac:	75 da                	jne    0x10008d88
10008dae:	8b 4d d8             	mov    ecx,DWORD PTR [ebp-0x28]
10008db1:	c7 45 fc 02 00 00 00 	mov    DWORD PTR [ebp-0x4],0x2
10008db8:	8b 01                	mov    eax,DWORD PTR [ecx]
10008dba:	85 c0                	test   eax,eax
10008dbc:	74 16                	je     0x10008dd4
10008dbe:	83 f8 ff             	cmp    eax,0xffffffff
10008dc1:	74 1f                	je     0x10008de2
10008dc3:	83 c8 ff             	or     eax,0xffffffff
10008dc6:	f0 0f c1 01          	lock xadd DWORD PTR [ecx],eax
10008dca:	0f 95 c0             	setne  al
10008dcd:	84 c0                	test   al,al
10008dcf:	75 11                	jne    0x10008de2
10008dd1:	8b 4d d8             	mov    ecx,DWORD PTR [ebp-0x28]
10008dd4:	8b 35 7c 23 02 10    	mov    esi,DWORD PTR ds:0x1002237c
10008dda:	51                   	push   ecx
10008ddb:	ff d6                	call   esi
10008ddd:	83 c4 04             	add    esp,0x4
10008de0:	eb 06                	jmp    0x10008de8
10008de2:	8b 35 7c 23 02 10    	mov    esi,DWORD PTR ds:0x1002237c
10008de8:	8d 4d f0             	lea    ecx,[ebp-0x10]
10008deb:	ff 15 3c 24 02 10    	call   DWORD PTR ds:0x1002243c
10008df1:	51                   	push   ecx
10008df2:	8b cc                	mov    ecx,esp
10008df4:	c7 45 fc 03 00 00 00 	mov    DWORD PTR [ebp-0x4],0x3
10008dfb:	50                   	push   eax
10008dfc:	8d 45 08             	lea    eax,[ebp+0x8]
10008dff:	50                   	push   eax
10008e00:	c7 01 01 00 00 00    	mov    DWORD PTR [ecx],0x1
10008e06:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
10008e09:	8b 89 58 01 00 00    	mov    ecx,DWORD PTR [ecx+0x158]
10008e0f:	e8 9c b8 ff ff       	call   0x100046b0
10008e14:	50                   	push   eax
10008e15:	8d 45 d8             	lea    eax,[ebp-0x28]
10008e18:	50                   	push   eax
10008e19:	e8 22 ba ff ff       	call   0x10004840
10008e1e:	83 c4 08             	add    esp,0x8
10008e21:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10008e24:	c6 45 fc 04          	mov    BYTE PTR [ebp-0x4],0x4
10008e28:	8b 08                	mov    ecx,DWORD PTR [eax]
10008e2a:	85 c9                	test   ecx,ecx
10008e2c:	74 16                	je     0x10008e44
10008e2e:	83 f9 ff             	cmp    ecx,0xffffffff
10008e31:	74 17                	je     0x10008e4a
10008e33:	83 c9 ff             	or     ecx,0xffffffff
10008e36:	f0 0f c1 08          	lock xadd DWORD PTR [eax],ecx
10008e3a:	0f 95 c0             	setne  al
10008e3d:	84 c0                	test   al,al
10008e3f:	75 09                	jne    0x10008e4a
10008e41:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10008e44:	50                   	push   eax
10008e45:	ff d6                	call   esi
10008e47:	83 c4 04             	add    esp,0x4
10008e4a:	8d 4d f0             	lea    ecx,[ebp-0x10]
10008e4d:	ff 15 a4 23 02 10    	call   DWORD PTR ds:0x100223a4
10008e53:	8b 75 e4             	mov    esi,DWORD PTR [ebp-0x1c]
10008e56:	85 f6                	test   esi,esi
10008e58:	74 2c                	je     0x10008e86
10008e5a:	8b 55 dc             	mov    edx,DWORD PTR [ebp-0x24]
10008e5d:	0f 1f 00             	nop    DWORD PTR [eax]
10008e60:	3b 55 e0             	cmp    edx,DWORD PTR [ebp-0x20]
10008e63:	0f 95 c0             	setne  al
10008e66:	84 c0                	test   al,al
10008e68:	74 1c                	je     0x10008e86
10008e6a:	8b 0a                	mov    ecx,DWORD PTR [edx]
10008e6c:	85 f6                	test   esi,esi
10008e6e:	74 08                	je     0x10008e78
10008e70:	57                   	push   edi
10008e71:	ff d3                	call   ebx
10008e73:	8b 55 dc             	mov    edx,DWORD PTR [ebp-0x24]
10008e76:	33 f6                	xor    esi,esi
10008e78:	83 c2 04             	add    edx,0x4
10008e7b:	83 f6 01             	xor    esi,0x1
10008e7e:	89                   	.byte 0x89
10008e7f:	55                   	push   ebp
