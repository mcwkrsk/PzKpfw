
/mnt/data/is2_work/original/IS2_PMauto_beta/modules/PM_auto.dll:     file format pei-i386


Disassembly of section .text:

10006bf0 <.text+0x5bf0>:
10006bf0:	55                   	push   ebp
10006bf1:	8b ec                	mov    ebp,esp
10006bf3:	6a ff                	push   0xffffffff
10006bf5:	68 db eb 01 10       	push   0x1001ebdb
10006bfa:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10006c00:	50                   	push   eax
10006c01:	83 ec 54             	sub    esp,0x54
10006c04:	53                   	push   ebx
10006c05:	56                   	push   esi
10006c06:	57                   	push   edi
10006c07:	a1 cc f0 06 10       	mov    eax,ds:0x1006f0cc
10006c0c:	33 c5                	xor    eax,ebp
10006c0e:	50                   	push   eax
10006c0f:	8d 45 f4             	lea    eax,[ebp-0xc]
10006c12:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10006c18:	8b d9                	mov    ebx,ecx
10006c1a:	89 5d f0             	mov    DWORD PTR [ebp-0x10],ebx
10006c1d:	8b 03                	mov    eax,DWORD PTR [ebx]
10006c1f:	83 78 38 00          	cmp    DWORD PTR [eax+0x38],0x0
10006c23:	0f 84 4d 01 00 00    	je     0x10006d76
10006c29:	8d 45 ec             	lea    eax,[ebp-0x14]
10006c2c:	50                   	push   eax
10006c2d:	6a 00                	push   0x0
10006c2f:	6a 00                	push   0x0
10006c31:	6a 00                	push   0x0
10006c33:	8d 4d a0             	lea    ecx,[ebp-0x60]
10006c36:	ff 15 4c 24 02 10    	call   DWORD PTR ds:0x1002244c
10006c3c:	8b c8                	mov    ecx,eax
10006c3e:	ff 15 50 24 02 10    	call   DWORD PTR ds:0x10022450
10006c44:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10006c47:	8b c8                	mov    ecx,eax
10006c49:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10006c50:	68 a0 ac 05 10       	push   0x1005aca0
10006c55:	ff 15 38 22 02 10    	call   DWORD PTR ds:0x10022238
10006c5b:	8b c8                	mov    ecx,eax
10006c5d:	ff 15 40 22 02 10    	call   DWORD PTR ds:0x10022240
10006c63:	8d 4d ec             	lea    ecx,[ebp-0x14]
10006c66:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
10006c6d:	ff 15 48 22 02 10    	call   DWORD PTR ds:0x10022248
10006c73:	8b 0b                	mov    ecx,DWORD PTR [ebx]
10006c75:	6a 00                	push   0x0
10006c77:	8b 89 1c 01 00 00    	mov    ecx,DWORD PTR [ecx+0x11c]
10006c7d:	ff 15 bc 20 02 10    	call   DWORD PTR ds:0x100220bc
10006c83:	8b 0b                	mov    ecx,DWORD PTR [ebx]
10006c85:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
10006c88:	ff 71 38             	push   DWORD PTR [ecx+0x38]
10006c8b:	8d 4d e4             	lea    ecx,[ebp-0x1c]
10006c8e:	51                   	push   ecx
10006c8f:	8b c8                	mov    ecx,eax
10006c91:	ff 15 68 20 02 10    	call   DWORD PTR ds:0x10022068
10006c97:	33 f6                	xor    esi,esi
10006c99:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [ebp-0x4],0x1
10006ca0:	39 75 e4             	cmp    DWORD PTR [ebp-0x1c],esi
10006ca3:	7e 43                	jle    0x10006ce8
10006ca5:	8b 1d f8 20 02 10    	mov    ebx,DWORD PTR ds:0x100220f8
10006cab:	0f 1f 44 00 00       	nop    DWORD PTR [eax+eax*1+0x0]
10006cb0:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
10006cb3:	8b 3c b0             	mov    edi,DWORD PTR [eax+esi*4]
10006cb6:	8b cf                	mov    ecx,edi
10006cb8:	ff d3                	call   ebx
10006cba:	3c 2a                	cmp    al,0x2a
10006cbc:	74 08                	je     0x10006cc6
10006cbe:	46                   	inc    esi
10006cbf:	3b 75 e4             	cmp    esi,DWORD PTR [ebp-0x1c]
10006cc2:	7c ec                	jl     0x10006cb0
10006cc4:	eb 1f                	jmp    0x10006ce5
10006cc6:	6a 00                	push   0x0
10006cc8:	6a 2a                	push   0x2a
10006cca:	8b cf                	mov    ecx,edi
10006ccc:	ff 15 fc 20 02 10    	call   DWORD PTR ds:0x100220fc
10006cd2:	50                   	push   eax
10006cd3:	8b cf                	mov    ecx,edi
10006cd5:	ff 15 00 21 02 10    	call   DWORD PTR ds:0x10022100
10006cdb:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
10006cde:	50                   	push   eax
10006cdf:	ff 15 5c 20 02 10    	call   DWORD PTR ds:0x1002205c
10006ce5:	8b 5d f0             	mov    ebx,DWORD PTR [ebp-0x10]
10006ce8:	8b 7d 08             	mov    edi,DWORD PTR [ebp+0x8]
10006ceb:	85 ff                	test   edi,edi
10006ced:	7e 69                	jle    0x10006d58
10006cef:	8b 03                	mov    eax,DWORD PTR [ebx]
10006cf1:	8d 4d c4             	lea    ecx,[ebp-0x3c]
10006cf4:	68 01 01 00 00       	push   0x101
10006cf9:	8b b0 5c 01 00 00    	mov    esi,DWORD PTR [eax+0x15c]
10006cff:	ff 15 bc 23 02 10    	call   DWORD PTR ds:0x100223bc
10006d05:	8b 0b                	mov    ecx,DWORD PTR [ebx]
10006d07:	50                   	push   eax
10006d08:	6a 00                	push   0x0
10006d0a:	57                   	push   edi
10006d0b:	8d 45 b4             	lea    eax,[ebp-0x4c]
10006d0e:	81 c1 5c 01 00 00    	add    ecx,0x15c
10006d14:	50                   	push   eax
10006d15:	ff 56 2c             	call   DWORD PTR [esi+0x2c]
10006d18:	8b 0b                	mov    ecx,DWORD PTR [ebx]
10006d1a:	50                   	push   eax
10006d1b:	8d 45 d4             	lea    eax,[ebp-0x2c]
10006d1e:	81 c1 5c 01 00 00    	add    ecx,0x15c
10006d24:	50                   	push   eax
10006d25:	ff 56 44             	call   DWORD PTR [esi+0x44]
10006d28:	6a 00                	push   0x0
10006d2a:	8b c8                	mov    ecx,eax
10006d2c:	c6 45 fc 02          	mov    BYTE PTR [ebp-0x4],0x2
10006d30:	ff 15 c4 23 02 10    	call   DWORD PTR ds:0x100223c4
10006d36:	8d 4d d4             	lea    ecx,[ebp-0x2c]
10006d39:	c6 45 fc 01          	mov    BYTE PTR [ebp-0x4],0x1
10006d3d:	8b f0                	mov    esi,eax
10006d3f:	ff 15 5c 23 02 10    	call   DWORD PTR ds:0x1002235c
10006d45:	8b 0b                	mov    ecx,DWORD PTR [ebx]
10006d47:	6a 01                	push   0x1
10006d49:	6a 2a                	push   0x2a
10006d4b:	ff 71 38             	push   DWORD PTR [ecx+0x38]
10006d4e:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
10006d51:	56                   	push   esi
10006d52:	ff 15 64 20 02 10    	call   DWORD PTR ds:0x10022064
10006d58:	8b 0b                	mov    ecx,DWORD PTR [ebx]
10006d5a:	8b 89 fc 00 00 00    	mov    ecx,DWORD PTR [ecx+0xfc]
10006d60:	ff 15 b0 28 02 10    	call   DWORD PTR ds:0x100228b0
10006d66:	8b c8                	mov    ecx,eax
10006d68:	e8 13 d5 00 00       	call   0x10014280
10006d6d:	8d 4d e4             	lea    ecx,[ebp-0x1c]
10006d70:	ff 15 cc 20 02 10    	call   DWORD PTR ds:0x100220cc
10006d76:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10006d79:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10006d80:	59                   	pop    ecx
10006d81:	5f                   	pop    edi
10006d82:	5e                   	pop    esi
10006d83:	5b                   	pop    ebx
10006d84:	8b e5                	mov    esp,ebp
10006d86:	5d                   	pop    ebp
10006d87:	c2 04 00             	ret    0x4
10006d8a:	cc                   	int3
10006d8b:	cc                   	int3
10006d8c:	cc                   	int3
10006d8d:	cc                   	int3
10006d8e:	cc                   	int3
10006d8f:	cc                   	int3
10006d90:	55                   	push   ebp
10006d91:	8b ec                	mov    ebp,esp
10006d93:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10006d96:	c7 00 6c 95 05 10    	mov    DWORD PTR [eax],0x1005956c
10006d9c:	5d                   	pop    ebp
10006d9d:	c2 04 00             	ret    0x4
10006da0:	55                   	push   ebp
10006da1:	8b ec                	mov    ebp,esp
10006da3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10006da6:	c7 00 74 8e 05 10    	mov    DWORD PTR [eax],0x10058e74
10006dac:	5d                   	pop    ebp
10006dad:	c2 04 00             	ret    0x4
10006db0:	55                   	push   ebp
10006db1:	8b ec                	mov    ebp,esp
10006db3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10006db6:	c7 00 00 b5 05 10    	mov    DWORD PTR [eax],0x1005b500
10006dbc:	5d                   	pop    ebp
10006dbd:	c2 04 00             	ret    0x4
10006dc0:	55                   	push   ebp
10006dc1:	8b ec                	mov    ebp,esp
10006dc3:	6a ff                	push   0xffffffff
10006dc5:	68 09 ec 01 10       	push   0x1001ec09
10006dca:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10006dd0:	50                   	push   eax
10006dd1:	83 ec 10             	sub    esp,0x10
10006dd4:	53                   	push   ebx
10006dd5:	56                   	push   esi
10006dd6:	57                   	push   edi
10006dd7:	a1 cc f0 06 10       	mov    eax,ds:0x1006f0cc
10006ddc:	33 c5                	xor    eax,ebp
10006dde:	50                   	push   eax
10006ddf:	8d 45 f4             	lea    eax,[ebp-0xc]
10006de2:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10006de8:	8b f1                	mov    esi,ecx
10006dea:	8b 0e                	mov    ecx,DWORD PTR [esi]
10006dec:	6a 00                	push   0x0
10006dee:	8b                   	.byte 0x8b
10006def:	89                   	.byte 0x89
