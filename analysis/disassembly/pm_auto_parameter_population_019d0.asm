
/mnt/data/is2_work/original/IS2_PMauto_beta/modules/PM_auto.dll:     file format pei-i386


Disassembly of section .text:

100019d0 <.text+0x9d0>:
100019d0:	55                   	push   ebp
100019d1:	8b ec                	mov    ebp,esp
100019d3:	6a ff                	push   0xffffffff
100019d5:	68 0f e7 01 10       	push   0x1001e70f
100019da:	64 a1 00 00 00 00    	mov    eax,fs:0x0
100019e0:	50                   	push   eax
100019e1:	81 ec a0 00 00 00    	sub    esp,0xa0
100019e7:	a1 cc f0 06 10       	mov    eax,ds:0x1006f0cc
100019ec:	33 c5                	xor    eax,ebp
100019ee:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
100019f1:	53                   	push   ebx
100019f2:	56                   	push   esi
100019f3:	57                   	push   edi
100019f4:	50                   	push   eax
100019f5:	8d 45 f4             	lea    eax,[ebp-0xc]
100019f8:	64 a3 00 00 00 00    	mov    fs:0x0,eax
100019fe:	8b d9                	mov    ebx,ecx
10001a00:	89 5d 94             	mov    DWORD PTR [ebp-0x6c],ebx
10001a03:	6a 01                	push   0x1
10001a05:	e8 c6 72 00 00       	call   0x10008cd0
10001a0a:	81 c3 5c 01 00 00    	add    ebx,0x15c
10001a10:	8b cb                	mov    ecx,ebx
10001a12:	89 9d 78 ff ff ff    	mov    DWORD PTR [ebp-0x88],ebx
10001a18:	ff 15 a4 24 02 10    	call   DWORD PTR ds:0x100224a4
10001a1e:	6a 01                	push   0x1
10001a20:	8b cb                	mov    ecx,ebx
10001a22:	ff 15 a8 24 02 10    	call   DWORD PTR ds:0x100224a8
10001a28:	6a 08                	push   0x8
10001a2a:	e8 4c b2 01 00       	call   0x1001cc7b
10001a2f:	8b f0                	mov    esi,eax
10001a31:	83 c4 04             	add    esp,0x4
10001a34:	89 75 90             	mov    DWORD PTR [ebp-0x70],esi
10001a37:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10001a3e:	85 f6                	test   esi,esi
10001a40:	74 10                	je     0x10001a52
10001a42:	8b ce                	mov    ecx,esi
10001a44:	ff 15 9c 24 02 10    	call   DWORD PTR ds:0x1002249c
10001a4a:	c7 06 64 76 05 10    	mov    DWORD PTR [esi],0x10057664
10001a50:	eb 02                	jmp    0x10001a54
10001a52:	33 f6                	xor    esi,esi
10001a54:	68 f4 79 05 10       	push   0x100579f4
10001a59:	8d 4d 98             	lea    ecx,[ebp-0x68]
10001a5c:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
10001a63:	ff 15 54 23 02 10    	call   DWORD PTR ds:0x10022354
10001a69:	8b 06                	mov    eax,DWORD PTR [esi]
10001a6b:	8d 4d 98             	lea    ecx,[ebp-0x68]
10001a6e:	6a 02                	push   0x2
10001a70:	51                   	push   ecx
10001a71:	8b ce                	mov    ecx,esi
10001a73:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [ebp-0x4],0x1
10001a7a:	ff 50 08             	call   DWORD PTR [eax+0x8]
10001a7d:	8b 3d 5c 23 02 10    	mov    edi,DWORD PTR ds:0x1002235c
10001a83:	8d 4d 98             	lea    ecx,[ebp-0x68]
10001a86:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
10001a8d:	ff d7                	call   edi
10001a8f:	6a 00                	push   0x0
10001a91:	8d 4d 98             	lea    ecx,[ebp-0x68]
10001a94:	ff 15 58 23 02 10    	call   DWORD PTR ds:0x10022358
10001a9a:	8b 06                	mov    eax,DWORD PTR [esi]
10001a9c:	8d 4d 98             	lea    ecx,[ebp-0x68]
10001a9f:	68 01 01 00 00       	push   0x101
10001aa4:	51                   	push   ecx
10001aa5:	8b ce                	mov    ecx,esi
10001aa7:	c7 45 fc 02 00 00 00 	mov    DWORD PTR [ebp-0x4],0x2
10001aae:	ff 50 08             	call   DWORD PTR [eax+0x8]
10001ab1:	8d 4d 98             	lea    ecx,[ebp-0x68]
10001ab4:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
10001abb:	ff d7                	call   edi
10001abd:	56                   	push   esi
10001abe:	8b cb                	mov    ecx,ebx
10001ac0:	ff 15 ac 24 02 10    	call   DWORD PTR ds:0x100224ac
10001ac6:	33 db                	xor    ebx,ebx
10001ac8:	33 c0                	xor    eax,eax
10001aca:	33 ff                	xor    edi,edi
10001acc:	89 5d b0             	mov    DWORD PTR [ebp-0x50],ebx
10001acf:	89 5d 9c             	mov    DWORD PTR [ebp-0x64],ebx
10001ad2:	89 7d a0             	mov    DWORD PTR [ebp-0x60],edi
10001ad5:	89 45 b8             	mov    DWORD PTR [ebp-0x48],eax
10001ad8:	89 45 a4             	mov    DWORD PTR [ebp-0x5c],eax
10001adb:	8b 45 94             	mov    eax,DWORD PTR [ebp-0x6c]
10001ade:	c7 45 fc 03 00 00 00 	mov    DWORD PTR [ebp-0x4],0x3
10001ae5:	8b 80 1c 01 00 00    	mov    eax,DWORD PTR [eax+0x11c]
10001aeb:	8b c8                	mov    ecx,eax
10001aed:	89 45 ac             	mov    DWORD PTR [ebp-0x54],eax
10001af0:	ff 15 98 20 02 10    	call   DWORD PTR ds:0x10022098
10001af6:	8b c8                	mov    ecx,eax
10001af8:	ff 15 a0 20 02 10    	call   DWORD PTR ds:0x100220a0
10001afe:	33 f6                	xor    esi,esi
10001b00:	89 45 a8             	mov    DWORD PTR [ebp-0x58],eax
10001b03:	89 75 b4             	mov    DWORD PTR [ebp-0x4c],esi
10001b06:	85 c0                	test   eax,eax
10001b08:	0f 8e 24 01 00 00    	jle    0x10001c32
10001b0e:	66 90                	xchg   ax,ax
10001b10:	8b 4d ac             	mov    ecx,DWORD PTR [ebp-0x54]
10001b13:	56                   	push   esi
10001b14:	ff 15 98 20 02 10    	call   DWORD PTR ds:0x10022098
10001b1a:	8b c8                	mov    ecx,eax
10001b1c:	ff 15 9c 20 02 10    	call   DWORD PTR ds:0x1002209c
10001b22:	8d 4d bc             	lea    ecx,[ebp-0x44]
10001b25:	89 45 bc             	mov    DWORD PTR [ebp-0x44],eax
10001b28:	3b cf                	cmp    ecx,edi
10001b2a:	73 7f                	jae    0x10001bab
10001b2c:	3b d9                	cmp    ebx,ecx
10001b2e:	77 7b                	ja     0x10001bab
10001b30:	8b 55 b8             	mov    edx,DWORD PTR [ebp-0x48]
10001b33:	8b d9                	mov    ebx,ecx
10001b35:	8b 4d b0             	mov    ecx,DWORD PTR [ebp-0x50]
10001b38:	2b d9                	sub    ebx,ecx
10001b3a:	c1 fb 02             	sar    ebx,0x2
10001b3d:	3b fa                	cmp    edi,edx
10001b3f:	75 61                	jne    0x10001ba2
10001b41:	8b c2                	mov    eax,edx
10001b43:	2b c7                	sub    eax,edi
10001b45:	c1 f8 02             	sar    eax,0x2
10001b48:	83 f8 01             	cmp    eax,0x1
10001b4b:	73 55                	jae    0x10001ba2
10001b4d:	2b f9                	sub    edi,ecx
10001b4f:	b8 ff ff ff 3f       	mov    eax,0x3fffffff
10001b54:	c1 ff 02             	sar    edi,0x2
10001b57:	2b c7                	sub    eax,edi
10001b59:	83 f8 01             	cmp    eax,0x1
10001b5c:	0f 82 3a 01 00 00    	jb     0x10001c9c
10001b62:	2b d1                	sub    edx,ecx
10001b64:	8d 77 01             	lea    esi,[edi+0x1]
10001b67:	c1 fa 02             	sar    edx,0x2
10001b6a:	b9 ff ff ff 3f       	mov    ecx,0x3fffffff
10001b6f:	8b c2                	mov    eax,edx
10001b71:	89 55 b8             	mov    DWORD PTR [ebp-0x48],edx
10001b74:	d1 e8                	shr    eax,1
10001b76:	2b c8                	sub    ecx,eax
10001b78:	03 c2                	add    eax,edx
10001b7a:	33 d2                	xor    edx,edx
10001b7c:	3b 4d b8             	cmp    ecx,DWORD PTR [ebp-0x48]
10001b7f:	8d 4d 9c             	lea    ecx,[ebp-0x64]
10001b82:	0f 43 d0             	cmovae edx,eax
10001b85:	3b d6                	cmp    edx,esi
10001b87:	0f 43 f2             	cmovae esi,edx
10001b8a:	56                   	push   esi
10001b8b:	e8 e0 6f 00 00       	call   0x10008b70
10001b90:	8b 45 a4             	mov    eax,DWORD PTR [ebp-0x5c]
10001b93:	8b 4d 9c             	mov    ecx,DWORD PTR [ebp-0x64]
10001b96:	8b 7d a0             	mov    edi,DWORD PTR [ebp-0x60]
10001b99:	8b 75 b4             	mov    esi,DWORD PTR [ebp-0x4c]
10001b9c:	89 45 b8             	mov    DWORD PTR [ebp-0x48],eax
10001b9f:	89 4d b0             	mov    DWORD PTR [ebp-0x50],ecx
10001ba2:	85 ff                	test   edi,edi
10001ba4:	74 76                	je     0x10001c1c
10001ba6:	8b 04 99             	mov    eax,DWORD PTR [ecx+ebx*4]
10001ba9:	eb 6f                	jmp    0x10001c1a
10001bab:	8b 55 b8             	mov    edx,DWORD PTR [ebp-0x48]
10001bae:	3b fa                	cmp    edi,edx
10001bb0:	75 64                	jne    0x10001c16
10001bb2:	8b c2                	mov    eax,edx
10001bb4:	2b c7                	sub    eax,edi
10001bb6:	c1 f8 02             	sar    eax,0x2
10001bb9:	83 f8 01             	cmp    eax,0x1
10001bbc:	73 55                	jae    0x10001c13
10001bbe:	2b fb                	sub    edi,ebx
10001bc0:	b8 ff ff ff 3f       	mov    eax,0x3fffffff
10001bc5:	c1 ff 02             	sar    edi,0x2
10001bc8:	2b c7                	sub    eax,edi
10001bca:	83 f8 01             	cmp    eax,0x1
10001bcd:	0f 82 c9 00 00 00    	jb     0x10001c9c
10001bd3:	2b d3                	sub    edx,ebx
10001bd5:	8d 77 01             	lea    esi,[edi+0x1]
10001bd8:	c1 fa 02             	sar    edx,0x2
10001bdb:	b9 ff ff ff 3f       	mov    ecx,0x3fffffff
10001be0:	8b c2                	mov    eax,edx
10001be2:	89 55 b8             	mov    DWORD PTR [ebp-0x48],edx
10001be5:	d1 e8                	shr    eax,1
10001be7:	2b c8                	sub    ecx,eax
10001be9:	03 c2                	add    eax,edx
10001beb:	33 d2                	xor    edx,edx
10001bed:	3b 4d b8             	cmp    ecx,DWORD PTR [ebp-0x48]
10001bf0:	8d 4d 9c             	lea    ecx,[ebp-0x64]
10001bf3:	0f 43 d0             	cmovae edx,eax
10001bf6:	3b d6                	cmp    edx,esi
10001bf8:	0f 43 f2             	cmovae esi,edx
10001bfb:	56                   	push   esi
10001bfc:	e8 6f 6f 00 00       	call   0x10008b70
10001c01:	8b 45 a4             	mov    eax,DWORD PTR [ebp-0x5c]
10001c04:	8b 4d 9c             	mov    ecx,DWORD PTR [ebp-0x64]
10001c07:	8b 7d a0             	mov    edi,DWORD PTR [ebp-0x60]
10001c0a:	8b 75 b4             	mov    esi,DWORD PTR [ebp-0x4c]
10001c0d:	89 45 b8             	mov    DWORD PTR [ebp-0x48],eax
10001c10:	89 4d b0             	mov    DWORD PTR [ebp-0x50],ecx
10001c13:	8b 45 bc             	mov    eax,DWORD PTR [ebp-0x44]
10001c16:	85 ff                	test   edi,edi
10001c18:	74 02                	je     0x10001c1c
10001c1a:	89 07                	mov    DWORD PTR [edi],eax
10001c1c:	8b 5d b0             	mov    ebx,DWORD PTR [ebp-0x50]
10001c1f:	46                   	inc    esi
10001c20:	83 c7 04             	add    edi,0x4
10001c23:	89 75 b4             	mov    DWORD PTR [ebp-0x4c],esi
10001c26:	89 7d a0             	mov    DWORD PTR [ebp-0x60],edi
10001c29:	3b 75 a8             	cmp    esi,DWORD PTR [ebp-0x58]
10001c2c:	0f 8c de fe ff ff    	jl     0x10001b10
10001c32:	a1 a4 20 02 10       	mov    eax,ds:0x100220a4
10001c37:	89 45 a8             	mov    DWORD PTR [ebp-0x58],eax
10001c3a:	8d 45 a8             	lea    eax,[ebp-0x58]
10001c3d:	50                   	push   eax
10001c3e:	8b c7                	mov    eax,edi
10001c40:	2b c3                	sub    eax,ebx
10001c42:	c1 f8 02             	sar    eax,0x2
10001c45:	50                   	push   eax
10001c46:	57                   	push   edi
10001c47:	53                   	push   ebx
10001c48:	e8 c3 20 00 00       	call   0x10003d10
10001c4d:	83 c4 10             	add    esp,0x10
10001c50:	8b f3                	mov    esi,ebx
10001c52:	3b df                	cmp    ebx,edi
10001c54:	0f 84 27 04 00 00    	je     0x10002081
10001c5a:	66 0f 1f 44 00 00    	nop    WORD PTR [eax+eax*1+0x0]
10001c60:	8b 1e                	mov    ebx,DWORD PTR [esi]
10001c62:	8d 45 8c             	lea    eax,[ebp-0x74]
10001c65:	50                   	push   eax
10001c66:	8b cb                	mov    ecx,ebx
10001c68:	89 5d b4             	mov    DWORD PTR [ebp-0x4c],ebx
10001c6b:	ff 15 ac 20 02 10    	call   DWORD PTR ds:0x100220ac
10001c71:	8b c8                	mov    ecx,eax
10001c73:	c6 45 fc 04          	mov    BYTE PTR [ebp-0x4],0x4
10001c77:	ff 15 90 20 02 10    	call   DWORD PTR ds:0x10022090
10001c7d:	8b d0                	mov    edx,eax
10001c7f:	c7 45 ec 07 00 00 00 	mov    DWORD PTR [ebp-0x14],0x7
10001c86:	33 c0                	xor    eax,eax
10001c88:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
10001c8f:	66 89 45 d8          	mov    WORD PTR [ebp-0x28],ax
10001c93:	66 39 02             	cmp    WORD PTR [edx],ax
10001c96:	75 0f                	jne    0x10001ca7
10001c98:	33 c9                	xor    ecx,ecx
10001c9a:	eb 26                	jmp    0x10001cc2
10001c9c:	68 fc 79 05 10       	push   0x100579fc
10001ca1:	ff 15 9c 21 02 10    	call   DWORD PTR ds:0x1002219c
10001ca7:	8b ca                	mov    ecx,edx
10001ca9:	8d 59 02             	lea    ebx,[ecx+0x2]
10001cac:	0f 1f 40 00          	nop    DWORD PTR [eax+0x0]
10001cb0:	66 8b 01             	mov    ax,WORD PTR [ecx]
10001cb3:	83 c1 02             	add    ecx,0x2
10001cb6:	66 85 c0             	test   ax,ax
10001cb9:	75 f5                	jne    0x10001cb0
10001cbb:	2b cb                	sub    ecx,ebx
10001cbd:	8b 5d b4             	mov    ebx,DWORD PTR [ebp-0x4c]
10001cc0:	d1 f9                	sar    ecx,1
10001cc2:	51                   	push   ecx
10001cc3:	52                   	push   edx
10001cc4:	8d 4d d8             	lea    ecx,[ebp-0x28]
10001cc7:	e8 b4 07 00 00       	call   0x10002480
10001ccc:	8d 45 d8             	lea    eax,[ebp-0x28]
10001ccf:	c6 45 fc 05          	mov    BYTE PTR [ebp-0x4],0x5
10001cd3:	50                   	push   eax
10001cd4:	8d 45 a8             	lea    eax,[ebp-0x58]
10001cd7:	50                   	push   eax
10001cd8:	ff 15 88 23 02 10    	call   DWORD PTR ds:0x10022388
10001cde:	83 c4 08             	add    esp,0x8
10001ce1:	8d 4d ac             	lea    ecx,[ebp-0x54]
10001ce4:	c6 45 fc 06          	mov    BYTE PTR [ebp-0x4],0x6
10001ce8:	51                   	push   ecx
10001ce9:	8b c8                	mov    ecx,eax
10001ceb:	ff 15 9c 23 02 10    	call   DWORD PTR ds:0x1002239c
10001cf1:	8d 4d a8             	lea    ecx,[ebp-0x58]
10001cf4:	ff 15 a4 23 02 10    	call   DWORD PTR ds:0x100223a4
10001cfa:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
10001cfd:	c6 45 fc 09          	mov    BYTE PTR [ebp-0x4],0x9
10001d01:	83 f8 08             	cmp    eax,0x8
10001d04:	72 4b                	jb     0x10001d51
10001d06:	8b 4d d8             	mov    ecx,DWORD PTR [ebp-0x28]
10001d09:	40                   	inc    eax
10001d0a:	3d ff ff ff 7f       	cmp    eax,0x7fffffff
10001d0f:	0f 87 91 03 00 00    	ja     0x100020a6
10001d15:	03 c0                	add    eax,eax
10001d17:	3d 00 10 00 00       	cmp    eax,0x1000
10001d1c:	72 2a                	jb     0x10001d48
10001d1e:	f6 c1 1f             	test   cl,0x1f
10001d21:	0f 85 7f 03 00 00    	jne    0x100020a6
10001d27:	8b 41 fc             	mov    eax,DWORD PTR [ecx-0x4]
10001d2a:	3b c1                	cmp    eax,ecx
10001d2c:	0f 83 74 03 00 00    	jae    0x100020a6
10001d32:	2b c8                	sub    ecx,eax
10001d34:	83 f9 04             	cmp    ecx,0x4
10001d37:	0f 82 69 03 00 00    	jb     0x100020a6
10001d3d:	83 f9 23             	cmp    ecx,0x23
10001d40:	0f 87 60 03 00 00    	ja     0x100020a6
10001d46:	8b c8                	mov    ecx,eax
10001d48:	51                   	push   ecx
10001d49:	e8 60 af 01 00       	call   0x1001ccae
10001d4e:	83 c4 04             	add    esp,0x4
10001d51:	33 c0                	xor    eax,eax
10001d53:	c7 45 ec 07 00 00 00 	mov    DWORD PTR [ebp-0x14],0x7
10001d5a:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
10001d61:	66 89 45 d8          	mov    WORD PTR [ebp-0x28],ax
10001d65:	8d 4d 8c             	lea    ecx,[ebp-0x74]
10001d68:	c6 45 fc 0a          	mov    BYTE PTR [ebp-0x4],0xa
10001d6c:	ff 15 48 21 02 10    	call   DWORD PTR ds:0x10022148
10001d72:	8b 03                	mov    eax,DWORD PTR [ebx]
10001d74:	8d 4d 84             	lea    ecx,[ebp-0x7c]
10001d77:	51                   	push   ecx
10001d78:	8b cb                	mov    ecx,ebx
10001d7a:	ff 50 14             	call   DWORD PTR [eax+0x14]
10001d7d:	8b c8                	mov    ecx,eax
10001d7f:	c6 45 fc 0b          	mov    BYTE PTR [ebp-0x4],0xb
10001d83:	ff 15 90 20 02 10    	call   DWORD PTR ds:0x10022090
10001d89:	8b d0                	mov    edx,eax
10001d8b:	c7 45 d4 07 00 00 00 	mov    DWORD PTR [ebp-0x2c],0x7
10001d92:	33 c0                	xor    eax,eax
10001d94:	c7 45 d0 00 00 00 00 	mov    DWORD PTR [ebp-0x30],0x0
10001d9b:	66 89 45 c0          	mov    WORD PTR [ebp-0x40],ax
10001d9f:	66 39 02             	cmp    WORD PTR [edx],ax
10001da2:	75 04                	jne    0x10001da8
10001da4:	33 c9                	xor    ecx,ecx
10001da6:	eb 1a                	jmp    0x10001dc2
10001da8:	8b ca                	mov    ecx,edx
10001daa:	8d 59 02             	lea    ebx,[ecx+0x2]
10001dad:	0f 1f 00             	nop    DWORD PTR [eax]
10001db0:	66 8b 01             	mov    ax,WORD PTR [ecx]
10001db3:	83 c1 02             	add    ecx,0x2
10001db6:	66 85 c0             	test   ax,ax
10001db9:	75 f5                	jne    0x10001db0
10001dbb:	2b cb                	sub    ecx,ebx
10001dbd:	8b 5d b4             	mov    ebx,DWORD PTR [ebp-0x4c]
10001dc0:	d1 f9                	sar    ecx,1
10001dc2:	51                   	push   ecx
10001dc3:	52                   	push   edx
10001dc4:	8d 4d c0             	lea    ecx,[ebp-0x40]
10001dc7:	e8 b4 06 00 00       	call   0x10002480
10001dcc:	8d 45 c0             	lea    eax,[ebp-0x40]
10001dcf:	c6 45 fc 0c          	mov    BYTE PTR [ebp-0x4],0xc
10001dd3:	50                   	push   eax
10001dd4:	8d 45 88             	lea    eax,[ebp-0x78]
10001dd7:	50                   	push   eax
10001dd8:	ff 15 88 23 02 10    	call   DWORD PTR ds:0x10022388
10001dde:	68 f8 79 05 10       	push   0x100579f8
10001de3:	50                   	push   eax
10001de4:	8d 45 bc             	lea    eax,[ebp-0x44]
10001de7:	c6 45 fc 0d          	mov    BYTE PTR [ebp-0x4],0xd
10001deb:	50                   	push   eax
10001dec:	e8 5f f9 ff ff       	call   0x10001750
10001df1:	83 c4 14             	add    esp,0x14
10001df4:	8d 4d 88             	lea    ecx,[ebp-0x78]
10001df7:	ff 15 a4 23 02 10    	call   DWORD PTR ds:0x100223a4
10001dfd:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
10001e00:	c6 45 fc 10          	mov    BYTE PTR [ebp-0x4],0x10
10001e04:	83 f8 08             	cmp    eax,0x8
10001e07:	72 4b                	jb     0x10001e54
10001e09:	8b 4d c0             	mov    ecx,DWORD PTR [ebp-0x40]
10001e0c:	40                   	inc    eax
10001e0d:	3d ff ff ff 7f       	cmp    eax,0x7fffffff
10001e12:	0f 87 8e 02 00 00    	ja     0x100020a6
10001e18:	03 c0                	add    eax,eax
10001e1a:	3d 00 10 00 00       	cmp    eax,0x1000
10001e1f:	72 2a                	jb     0x10001e4b
10001e21:	f6 c1 1f             	test   cl,0x1f
10001e24:	0f 85 7c 02 00 00    	jne    0x100020a6
10001e2a:	8b 41 fc             	mov    eax,DWORD PTR [ecx-0x4]
10001e2d:	3b c1                	cmp    eax,ecx
10001e2f:	0f 83 71 02 00 00    	jae    0x100020a6
10001e35:	2b c8                	sub    ecx,eax
10001e37:	83 f9 04             	cmp    ecx,0x4
10001e3a:	0f 82 66 02 00 00    	jb     0x100020a6
10001e40:	83 f9 23             	cmp    ecx,0x23
10001e43:	0f 87 5d 02 00 00    	ja     0x100020a6
10001e49:	8b c8                	mov    ecx,eax
10001e4b:	51                   	push   ecx
10001e4c:	e8 5d ae 01 00       	call   0x1001ccae
10001e51:	83 c4 04             	add    esp,0x4
10001e54:	33 c0                	xor    eax,eax
10001e56:	c7 45 d4 07 00 00 00 	mov    DWORD PTR [ebp-0x2c],0x7
10001e5d:	c7 45 d0 00 00 00 00 	mov    DWORD PTR [ebp-0x30],0x0
10001e64:	66 89 45 c0          	mov    WORD PTR [ebp-0x40],ax
10001e68:	8d 4d 84             	lea    ecx,[ebp-0x7c]
10001e6b:	c6 45 fc 11          	mov    BYTE PTR [ebp-0x4],0x11
10001e6f:	ff 15 48 21 02 10    	call   DWORD PTR ds:0x10022148
10001e75:	68 4e 76 05 10       	push   0x1005764e
10001e7a:	8d 4d ac             	lea    ecx,[ebp-0x54]
10001e7d:	ff 15 8c 23 02 10    	call   DWORD PTR ds:0x1002238c
10001e83:	84 c0                	test   al,al
10001e85:	74 30                	je     0x10001eb7
10001e87:	68 f8 79 05 10       	push   0x100579f8
10001e8c:	8d 45 ac             	lea    eax,[ebp-0x54]
10001e8f:	50                   	push   eax
10001e90:	8d 45 80             	lea    eax,[ebp-0x80]
10001e93:	50                   	push   eax
10001e94:	e8 b7 f8 ff ff       	call   0x10001750
10001e99:	83 c4 0c             	add    esp,0xc
10001e9c:	50                   	push   eax
10001e9d:	8d 4d bc             	lea    ecx,[ebp-0x44]
10001ea0:	c6 45 fc 12          	mov    BYTE PTR [ebp-0x4],0x12
10001ea4:	ff 15 98 23 02 10    	call   DWORD PTR ds:0x10022398
10001eaa:	8d 4d 80             	lea    ecx,[ebp-0x80]
10001ead:	c6 45 fc 11          	mov    BYTE PTR [ebp-0x4],0x11
10001eb1:	ff 15 a4 23 02 10    	call   DWORD PTR ds:0x100223a4
10001eb7:	8d 45 90             	lea    eax,[ebp-0x70]
10001eba:	8b cb                	mov    ecx,ebx
10001ebc:	50                   	push   eax
10001ebd:	ff 15 a8 20 02 10    	call   DWORD PTR ds:0x100220a8
10001ec3:	8b c8                	mov    ecx,eax
10001ec5:	c6 45 fc 13          	mov    BYTE PTR [ebp-0x4],0x13
10001ec9:	ff 15 90 20 02 10    	call   DWORD PTR ds:0x10022090
10001ecf:	8b d0                	mov    edx,eax
10001ed1:	c7 45 ec 07 00 00 00 	mov    DWORD PTR [ebp-0x14],0x7
10001ed8:	33 c0                	xor    eax,eax
10001eda:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
10001ee1:	66 89 45 d8          	mov    WORD PTR [ebp-0x28],ax
10001ee5:	66 39 02             	cmp    WORD PTR [edx],ax
10001ee8:	75 04                	jne    0x10001eee
10001eea:	33 c9                	xor    ecx,ecx
10001eec:	eb 14                	jmp    0x10001f02
10001eee:	8b ca                	mov    ecx,edx
10001ef0:	8d 59 02             	lea    ebx,[ecx+0x2]
10001ef3:	66 8b 01             	mov    ax,WORD PTR [ecx]
10001ef6:	83 c1 02             	add    ecx,0x2
10001ef9:	66 85 c0             	test   ax,ax
10001efc:	75 f5                	jne    0x10001ef3
10001efe:	2b cb                	sub    ecx,ebx
10001f00:	d1 f9                	sar    ecx,1
10001f02:	51                   	push   ecx
10001f03:	52                   	push   edx
10001f04:	8d 4d d8             	lea    ecx,[ebp-0x28]
10001f07:	e8 74 05 00 00       	call   0x10002480
10001f0c:	8d 45 d8             	lea    eax,[ebp-0x28]
10001f0f:	c6 45 fc 14          	mov    BYTE PTR [ebp-0x4],0x14
10001f13:	50                   	push   eax
10001f14:	8d 85 7c ff ff ff    	lea    eax,[ebp-0x84]
10001f1a:	50                   	push   eax
10001f1b:	ff 15 88 23 02 10    	call   DWORD PTR ds:0x10022388
10001f21:	83 c4 08             	add    esp,0x8
10001f24:	50                   	push   eax
10001f25:	8d 4d bc             	lea    ecx,[ebp-0x44]
10001f28:	c6 45 fc 15          	mov    BYTE PTR [ebp-0x4],0x15
10001f2c:	ff 15 98 23 02 10    	call   DWORD PTR ds:0x10022398
10001f32:	8d 8d 7c ff ff ff    	lea    ecx,[ebp-0x84]
10001f38:	ff 15 a4 23 02 10    	call   DWORD PTR ds:0x100223a4
10001f3e:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
10001f41:	c6 45 fc 13          	mov    BYTE PTR [ebp-0x4],0x13
10001f45:	83 f8 08             	cmp    eax,0x8
10001f48:	72 4b                	jb     0x10001f95
10001f4a:	8b 4d d8             	mov    ecx,DWORD PTR [ebp-0x28]
10001f4d:	40                   	inc    eax
10001f4e:	3d ff ff ff 7f       	cmp    eax,0x7fffffff
10001f53:	0f 87 4d 01 00 00    	ja     0x100020a6
10001f59:	03 c0                	add    eax,eax
10001f5b:	3d 00 10 00 00       	cmp    eax,0x1000
10001f60:	72 2a                	jb     0x10001f8c
10001f62:	f6 c1 1f             	test   cl,0x1f
10001f65:	0f 85 3b 01 00 00    	jne    0x100020a6
10001f6b:	8b 41 fc             	mov    eax,DWORD PTR [ecx-0x4]
10001f6e:	3b c1                	cmp    eax,ecx
10001f70:	0f 83 30 01 00 00    	jae    0x100020a6
10001f76:	2b c8                	sub    ecx,eax
10001f78:	83 f9 04             	cmp    ecx,0x4
10001f7b:	0f 82 25 01 00 00    	jb     0x100020a6
10001f81:	83 f9 23             	cmp    ecx,0x23
10001f84:	0f 87 1c 01 00 00    	ja     0x100020a6
10001f8a:	8b c8                	mov    ecx,eax
10001f8c:	51                   	push   ecx
10001f8d:	e8 1c ad 01 00       	call   0x1001ccae
10001f92:	83 c4 04             	add    esp,0x4
10001f95:	33 c0                	xor    eax,eax
10001f97:	c7 45 ec 07 00 00 00 	mov    DWORD PTR [ebp-0x14],0x7
10001f9e:	8d 4d 90             	lea    ecx,[ebp-0x70]
10001fa1:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
10001fa8:	66 89 45 d8          	mov    WORD PTR [ebp-0x28],ax
10001fac:	c6 45 fc 11          	mov    BYTE PTR [ebp-0x4],0x11
10001fb0:	ff 15 48 21 02 10    	call   DWORD PTR ds:0x10022148
10001fb6:	6a 08                	push   0x8
10001fb8:	e8 be ac 01 00       	call   0x1001cc7b
10001fbd:	8b d8                	mov    ebx,eax
10001fbf:	83 c4 04             	add    esp,0x4
10001fc2:	89 9d 74 ff ff ff    	mov    DWORD PTR [ebp-0x8c],ebx
10001fc8:	c6 45 fc 16          	mov    BYTE PTR [ebp-0x4],0x16
10001fcc:	85 db                	test   ebx,ebx
10001fce:	74 10                	je     0x10001fe0
10001fd0:	8b cb                	mov    ecx,ebx
10001fd2:	ff 15 9c 24 02 10    	call   DWORD PTR ds:0x1002249c
10001fd8:	c7 03 64 76 05 10    	mov    DWORD PTR [ebx],0x10057664
10001fde:	eb 02                	jmp    0x10001fe2
10001fe0:	33 db                	xor    ebx,ebx
10001fe2:	8d 45 bc             	lea    eax,[ebp-0x44]
10001fe5:	c6 45 fc 11          	mov    BYTE PTR [ebp-0x4],0x11
10001fe9:	50                   	push   eax
10001fea:	8d 8d 64 ff ff ff    	lea    ecx,[ebp-0x9c]
10001ff0:	ff 15 50 23 02 10    	call   DWORD PTR ds:0x10022350
10001ff6:	8b 03                	mov    eax,DWORD PTR [ebx]
10001ff8:	8d 8d 64 ff ff ff    	lea    ecx,[ebp-0x9c]
10001ffe:	6a 02                	push   0x2
10002000:	51                   	push   ecx
10002001:	8b cb                	mov    ecx,ebx
10002003:	c6 45 fc 17          	mov    BYTE PTR [ebp-0x4],0x17
10002007:	ff 50 08             	call   DWORD PTR [eax+0x8]
1000200a:	8d 8d 64 ff ff ff    	lea    ecx,[ebp-0x9c]
10002010:	c6 45 fc 11          	mov    BYTE PTR [ebp-0x4],0x11
10002014:	ff 15 5c 23 02 10    	call   DWORD PTR ds:0x1002235c
1000201a:	ff 75 b4             	push   DWORD PTR [ebp-0x4c]
1000201d:	8d 8d 54 ff ff ff    	lea    ecx,[ebp-0xac]
10002023:	ff 15 58 23 02 10    	call   DWORD PTR ds:0x10022358
10002029:	8b 03                	mov    eax,DWORD PTR [ebx]
1000202b:	8d 8d 54 ff ff ff    	lea    ecx,[ebp-0xac]
10002031:	68 01 01 00 00       	push   0x101
10002036:	51                   	push   ecx
10002037:	8b cb                	mov    ecx,ebx
10002039:	c6 45 fc 18          	mov    BYTE PTR [ebp-0x4],0x18
1000203d:	ff 50 08             	call   DWORD PTR [eax+0x8]
10002040:	8d 8d 54 ff ff ff    	lea    ecx,[ebp-0xac]
10002046:	c6 45 fc 11          	mov    BYTE PTR [ebp-0x4],0x11
1000204a:	ff 15 5c 23 02 10    	call   DWORD PTR ds:0x1002235c
10002050:	8b 8d 78 ff ff ff    	mov    ecx,DWORD PTR [ebp-0x88]
10002056:	53                   	push   ebx
10002057:	ff 15 ac 24 02 10    	call   DWORD PTR ds:0x100224ac
1000205d:	8d 4d bc             	lea    ecx,[ebp-0x44]
10002060:	ff 15 a4 23 02 10    	call   DWORD PTR ds:0x100223a4
10002066:	8d 4d ac             	lea    ecx,[ebp-0x54]
10002069:	c6 45 fc 03          	mov    BYTE PTR [ebp-0x4],0x3
1000206d:	ff 15 a4 23 02 10    	call   DWORD PTR ds:0x100223a4
10002073:	83 c6 04             	add    esi,0x4
10002076:	3b f7                	cmp    esi,edi
10002078:	0f 85 e2 fb ff ff    	jne    0x10001c60
1000207e:	8b 5d b0             	mov    ebx,DWORD PTR [ebp-0x50]
10002081:	8b 4d 94             	mov    ecx,DWORD PTR [ebp-0x6c]
10002084:	6a 00                	push   0x0
10002086:	e8 45 6c 00 00       	call   0x10008cd0
1000208b:	8b 4d 94             	mov    ecx,DWORD PTR [ebp-0x6c]
1000208e:	e8 bd 63 00 00       	call   0x10008450
10002093:	85 db                	test   ebx,ebx
10002095:	74 5a                	je     0x100020f1
10002097:	8b 45 b8             	mov    eax,DWORD PTR [ebp-0x48]
1000209a:	2b c3                	sub    eax,ebx
1000209c:	c1 f8 02             	sar    eax,0x2
1000209f:	3d ff ff ff 3f       	cmp    eax,0x3fffffff
100020a4:	76 06                	jbe    0x100020ac
100020a6:	ff 15 c4 2f 02 10    	call   DWORD PTR ds:0x10022fc4
100020ac:	c1 e0 02             	shl    eax,0x2
100020af:	3d                   	.byte 0x3d
