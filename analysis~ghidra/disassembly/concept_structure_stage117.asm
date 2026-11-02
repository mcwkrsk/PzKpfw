; MAIWmodels.dll GNU objdump excerpt. Original PE32 image base 0x10000000.
; Source SHA-256: 80ccc6678bdf057152f473369a56eb3b76a1ce643edca2832345f7b53e09c525
; This is a literal evidence excerpt, not decompiler output.

; ==== ConceptStructure link/category factories: 0x1000f9b0..0x1000fc0e ====
1000f9b0:	55                   	push   ebp
1000f9b1:	8b ec                	mov    ebp,esp
1000f9b3:	6a ff                	push   0xffffffff
1000f9b5:	68 7f 68 01 10       	push   0x1001687f
1000f9ba:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000f9c0:	50                   	push   eax
1000f9c1:	51                   	push   ecx
1000f9c2:	53                   	push   ebx
1000f9c3:	57                   	push   edi
1000f9c4:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000f9c9:	33 c5                	xor    eax,ebp
1000f9cb:	50                   	push   eax
1000f9cc:	8d 45 f4             	lea    eax,[ebp-0xc]
1000f9cf:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000f9d5:	8b d9                	mov    ebx,ecx
1000f9d7:	6a 30                	push   0x30
1000f9d9:	e8 12 53 00 00       	call   0x10014cf0
1000f9de:	83 c4 04             	add    esp,0x4
1000f9e1:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
1000f9e4:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000f9eb:	85 c0                	test   eax,eax
1000f9ed:	74 0b                	je     0x1000f9fa
1000f9ef:	8b c8                	mov    ecx,eax
1000f9f1:	e8 8a 0a 00 00       	call   0x10010480
1000f9f6:	8b f8                	mov    edi,eax
1000f9f8:	eb 02                	jmp    0x1000f9fc
1000f9fa:	33 ff                	xor    edi,edi
1000f9fc:	ff 75 10             	push   DWORD PTR [ebp+0x10]
1000f9ff:	8b cf                	mov    ecx,edi
1000fa01:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
1000fa08:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
1000fa0b:	ff 75 08             	push   DWORD PTR [ebp+0x8]
1000fa0e:	e8 5d 17 00 00       	call   0x10011170
1000fa13:	57                   	push   edi
1000fa14:	8b cb                	mov    ecx,ebx
1000fa16:	e8 15 e3 ff ff       	call   0x1000dd30
1000fa1b:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
1000fa1f:	8b cf                	mov    ecx,edi
1000fa21:	74 04                	je     0x1000fa27
1000fa23:	6a 63                	push   0x63
1000fa25:	eb 02                	jmp    0x1000fa29
1000fa27:	6a 01                	push   0x1
1000fa29:	e8 82 d7 ff ff       	call   0x1000d1b0
1000fa2e:	8b c7                	mov    eax,edi
1000fa30:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000fa33:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000fa3a:	59                   	pop    ecx
1000fa3b:	5f                   	pop    edi
1000fa3c:	5b                   	pop    ebx
1000fa3d:	8b e5                	mov    esp,ebp
1000fa3f:	5d                   	pop    ebp
1000fa40:	c2 0c 00             	ret    0xc
1000fa43:	cc                   	int3
1000fa44:	cc                   	int3
1000fa45:	cc                   	int3
1000fa46:	cc                   	int3
1000fa47:	cc                   	int3
1000fa48:	cc                   	int3
1000fa49:	cc                   	int3
1000fa4a:	cc                   	int3
1000fa4b:	cc                   	int3
1000fa4c:	cc                   	int3
1000fa4d:	cc                   	int3
1000fa4e:	cc                   	int3
1000fa4f:	cc                   	int3
1000fa50:	55                   	push   ebp
1000fa51:	8b ec                	mov    ebp,esp
1000fa53:	6a ff                	push   0xffffffff
1000fa55:	68 af 68 01 10       	push   0x100168af
1000fa5a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000fa60:	50                   	push   eax
1000fa61:	51                   	push   ecx
1000fa62:	53                   	push   ebx
1000fa63:	56                   	push   esi
1000fa64:	57                   	push   edi
1000fa65:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000fa6a:	33 c5                	xor    eax,ebp
1000fa6c:	50                   	push   eax
1000fa6d:	8d 45 f4             	lea    eax,[ebp-0xc]
1000fa70:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000fa76:	8b d9                	mov    ebx,ecx
1000fa78:	6a 30                	push   0x30
1000fa7a:	e8 71 52 00 00       	call   0x10014cf0
1000fa7f:	83 c4 04             	add    esp,0x4
1000fa82:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
1000fa85:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000fa8c:	85 c0                	test   eax,eax
1000fa8e:	74 0b                	je     0x1000fa9b
1000fa90:	8b c8                	mov    ecx,eax
1000fa92:	e8 e9 09 00 00       	call   0x10010480
1000fa97:	8b f0                	mov    esi,eax
1000fa99:	eb 02                	jmp    0x1000fa9d
1000fa9b:	33 f6                	xor    esi,esi
1000fa9d:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
1000faa0:	8b 7d 08             	mov    edi,DWORD PTR [ebp+0x8]
1000faa3:	8b ce                	mov    ecx,esi
1000faa5:	57                   	push   edi
1000faa6:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
1000faad:	e8 ce 16 00 00       	call   0x10011180
1000fab2:	56                   	push   esi
1000fab3:	8b cb                	mov    ecx,ebx
1000fab5:	e8 76 e2 ff ff       	call   0x1000dd30
1000faba:	8b cf                	mov    ecx,edi
1000fabc:	e8 7f 19 00 00       	call   0x10011440
1000fac1:	83 f8 01             	cmp    eax,0x1
1000fac4:	74 1c                	je     0x1000fae2
1000fac6:	8b cf                	mov    ecx,edi
1000fac8:	e8 73 19 00 00       	call   0x10011440
1000facd:	83 f8 03             	cmp    eax,0x3
1000fad0:	74 10                	je     0x1000fae2
1000fad2:	8b cf                	mov    ecx,edi
1000fad4:	e8 67 19 00 00       	call   0x10011440
1000fad9:	83 f8 05             	cmp    eax,0x5
1000fadc:	74 04                	je     0x1000fae2
1000fade:	6a 63                	push   0x63
1000fae0:	eb 02                	jmp    0x1000fae4
1000fae2:	6a 01                	push   0x1
1000fae4:	8b ce                	mov    ecx,esi
1000fae6:	e8 c5 d6 ff ff       	call   0x1000d1b0
1000faeb:	8b c6                	mov    eax,esi
1000faed:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000faf0:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000faf7:	59                   	pop    ecx
1000faf8:	5f                   	pop    edi
1000faf9:	5e                   	pop    esi
1000fafa:	5b                   	pop    ebx
1000fafb:	8b e5                	mov    esp,ebp
1000fafd:	5d                   	pop    ebp
1000fafe:	c2 08 00             	ret    0x8
1000fb01:	cc                   	int3
1000fb02:	cc                   	int3
1000fb03:	cc                   	int3
1000fb04:	cc                   	int3
1000fb05:	cc                   	int3
1000fb06:	cc                   	int3
1000fb07:	cc                   	int3
1000fb08:	cc                   	int3
1000fb09:	cc                   	int3
1000fb0a:	cc                   	int3
1000fb0b:	cc                   	int3
1000fb0c:	cc                   	int3
1000fb0d:	cc                   	int3
1000fb0e:	cc                   	int3
1000fb0f:	cc                   	int3
1000fb10:	55                   	push   ebp
1000fb11:	8b ec                	mov    ebp,esp
1000fb13:	6a ff                	push   0xffffffff
1000fb15:	68 7f 68 01 10       	push   0x1001687f
1000fb1a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000fb20:	50                   	push   eax
1000fb21:	51                   	push   ecx
1000fb22:	56                   	push   esi
1000fb23:	57                   	push   edi
1000fb24:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000fb29:	33 c5                	xor    eax,ebp
1000fb2b:	50                   	push   eax
1000fb2c:	8d 45 f4             	lea    eax,[ebp-0xc]
1000fb2f:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000fb35:	8b f9                	mov    edi,ecx
1000fb37:	6a 30                	push   0x30
1000fb39:	e8 b2 51 00 00       	call   0x10014cf0
1000fb3e:	83 c4 04             	add    esp,0x4
1000fb41:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
1000fb44:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000fb4b:	85 c0                	test   eax,eax
1000fb4d:	74 0b                	je     0x1000fb5a
1000fb4f:	8b c8                	mov    ecx,eax
1000fb51:	e8 2a 09 00 00       	call   0x10010480
1000fb56:	8b f0                	mov    esi,eax
1000fb58:	eb 02                	jmp    0x1000fb5c
1000fb5a:	33 f6                	xor    esi,esi
1000fb5c:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
1000fb5f:	8b ce                	mov    ecx,esi
1000fb61:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
1000fb68:	ff 75 08             	push   DWORD PTR [ebp+0x8]
1000fb6b:	e8 20 16 00 00       	call   0x10011190
1000fb70:	56                   	push   esi
1000fb71:	8b cf                	mov    ecx,edi
1000fb73:	e8 b8 e1 ff ff       	call   0x1000dd30
1000fb78:	6a 63                	push   0x63
1000fb7a:	8b ce                	mov    ecx,esi
1000fb7c:	e8 2f d6 ff ff       	call   0x1000d1b0
1000fb81:	8b c6                	mov    eax,esi
1000fb83:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000fb86:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000fb8d:	59                   	pop    ecx
1000fb8e:	5f                   	pop    edi
1000fb8f:	5e                   	pop    esi
1000fb90:	8b e5                	mov    esp,ebp
1000fb92:	5d                   	pop    ebp
1000fb93:	c2 08 00             	ret    0x8
1000fb96:	cc                   	int3
1000fb97:	cc                   	int3
1000fb98:	cc                   	int3
1000fb99:	cc                   	int3
1000fb9a:	cc                   	int3
1000fb9b:	cc                   	int3
1000fb9c:	cc                   	int3
1000fb9d:	cc                   	int3
1000fb9e:	cc                   	int3
1000fb9f:	cc                   	int3
1000fba0:	55                   	push   ebp
1000fba1:	8b ec                	mov    ebp,esp
1000fba3:	6a ff                	push   0xffffffff
1000fba5:	68 2f 6e 01 10       	push   0x10016e2f
1000fbaa:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000fbb0:	50                   	push   eax
1000fbb1:	51                   	push   ecx
1000fbb2:	56                   	push   esi
1000fbb3:	57                   	push   edi
1000fbb4:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000fbb9:	33 c5                	xor    eax,ebp
1000fbbb:	50                   	push   eax
1000fbbc:	8d 45 f4             	lea    eax,[ebp-0xc]
1000fbbf:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000fbc5:	8b f9                	mov    edi,ecx
1000fbc7:	6a 08                	push   0x8
1000fbc9:	e8 22 51 00 00       	call   0x10014cf0
1000fbce:	83 c4 04             	add    esp,0x4
1000fbd1:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
1000fbd4:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000fbdb:	85 c0                	test   eax,eax
1000fbdd:	74 0b                	je     0x1000fbea
1000fbdf:	8b c8                	mov    ecx,eax
1000fbe1:	e8 4a 16 00 00       	call   0x10011230
1000fbe6:	8b f0                	mov    esi,eax
1000fbe8:	eb 02                	jmp    0x1000fbec
1000fbea:	33 f6                	xor    esi,esi
1000fbec:	56                   	push   esi
1000fbed:	8b cf                	mov    ecx,edi
1000fbef:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
1000fbf6:	e8 b5 e1 ff ff       	call   0x1000ddb0
1000fbfb:	8b c6                	mov    eax,esi
1000fbfd:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000fc00:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000fc07:	59                   	pop    ecx
1000fc08:	5f                   	pop    edi
1000fc09:	5e                   	pop    esi
1000fc0a:	8b e5                	mov    esp,ebp
1000fc0c:	5d                   	pop    ebp
1000fc0d:	c3                   	ret
1000fc0e:	cc                   	int3

; ==== ConceptStructure::codeStructure: 0x1000fc10..0x10010358 ====
1000fc10:	55                   	push   ebp
1000fc11:	8b ec                	mov    ebp,esp
1000fc13:	6a ff                	push   0xffffffff
1000fc15:	68 f0 68 01 10       	push   0x100168f0
1000fc1a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000fc20:	50                   	push   eax
1000fc21:	83 ec 68             	sub    esp,0x68
1000fc24:	53                   	push   ebx
1000fc25:	56                   	push   esi
1000fc26:	57                   	push   edi
1000fc27:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000fc2c:	33 c5                	xor    eax,ebp
1000fc2e:	50                   	push   eax
1000fc2f:	8d 45 f4             	lea    eax,[ebp-0xc]
1000fc32:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000fc38:	8b d9                	mov    ebx,ecx
1000fc3a:	89 5d dc             	mov    DWORD PTR [ebp-0x24],ebx
1000fc3d:	8d 4d c4             	lea    ecx,[ebp-0x3c]
1000fc40:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [ebp-0x3c],0x0
1000fc47:	c7 45 c8 00 00 00 00 	mov    DWORD PTR [ebp-0x38],0x0
1000fc4e:	e8 9d df ff ff       	call   0x1000dbf0
1000fc53:	89 45 c4             	mov    DWORD PTR [ebp-0x3c],eax
1000fc56:	8d 4d bc             	lea    ecx,[ebp-0x44]
1000fc59:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000fc60:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [ebp-0x44],0x0
1000fc67:	c7 45 c0 00 00 00 00 	mov    DWORD PTR [ebp-0x40],0x0
1000fc6e:	e8 7d df ff ff       	call   0x1000dbf0
1000fc73:	89 45 bc             	mov    DWORD PTR [ebp-0x44],eax
1000fc76:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
1000fc79:	c6 45 fc 01          	mov    BYTE PTR [ebp-0x4],0x1
1000fc7d:	8b 70 14             	mov    esi,DWORD PTR [eax+0x14]
1000fc80:	3b 70 18             	cmp    esi,DWORD PTR [eax+0x18]
1000fc83:	73 56                	jae    0x1000fcdb
1000fc85:	8b 3e                	mov    edi,DWORD PTR [esi]
1000fc87:	8b cf                	mov    ecx,edi
1000fc89:	89 7d d4             	mov    DWORD PTR [ebp-0x2c],edi
1000fc8c:	e8 cf d6 ff ff       	call   0x1000d360
1000fc91:	85 c0                	test   eax,eax
1000fc93:	75 3b                	jne    0x1000fcd0
1000fc95:	8b cf                	mov    ecx,edi
1000fc97:	e8 c4 19 00 00       	call   0x10011660
1000fc9c:	8b cf                	mov    ecx,edi
1000fc9e:	8b d8                	mov    ebx,eax
1000fca0:	e8 db 32 00 00       	call   0x10012f80
1000fca5:	8b 4d d4             	mov    ecx,DWORD PTR [ebp-0x2c]
1000fca8:	8b f8                	mov    edi,eax
1000fcaa:	e8 91 17 00 00       	call   0x10011440
1000fcaf:	ff 75 cc             	push   DWORD PTR [ebp-0x34]
1000fcb2:	89 45 94             	mov    DWORD PTR [ebp-0x6c],eax
1000fcb5:	8d 4d bc             	lea    ecx,[ebp-0x44]
1000fcb8:	8d 45 8c             	lea    eax,[ebp-0x74]
1000fcbb:	89 5d 8c             	mov    DWORD PTR [ebp-0x74],ebx
1000fcbe:	50                   	push   eax
1000fcbf:	6a 00                	push   0x0
1000fcc1:	8d 45 9c             	lea    eax,[ebp-0x64]
1000fcc4:	89 7d 90             	mov    DWORD PTR [ebp-0x70],edi
1000fcc7:	50                   	push   eax
1000fcc8:	e8 f3 f4 ff ff       	call   0x1000f1c0
1000fccd:	8b 5d dc             	mov    ebx,DWORD PTR [ebp-0x24]
1000fcd0:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
1000fcd3:	83 c6 04             	add    esi,0x4
1000fcd6:	3b 70 18             	cmp    esi,DWORD PTR [eax+0x18]
1000fcd9:	72 aa                	jb     0x1000fc85
1000fcdb:	6a 00                	push   0x0
1000fcdd:	6a 00                	push   0x0
1000fcdf:	8d 4d b4             	lea    ecx,[ebp-0x4c]
1000fce2:	c7 45 b4 00 00 00 00 	mov    DWORD PTR [ebp-0x4c],0x0
1000fce9:	c7 45 b8 00 00 00 00 	mov    DWORD PTR [ebp-0x48],0x0
1000fcf0:	e8 bb fb ff ff       	call   0x1000f8b0
1000fcf5:	8b f0                	mov    esi,eax
1000fcf7:	89 75 e8             	mov    DWORD PTR [ebp-0x18],esi
1000fcfa:	89 75 b4             	mov    DWORD PTR [ebp-0x4c],esi
1000fcfd:	8b 4b 04             	mov    ecx,DWORD PTR [ebx+0x4]
1000fd00:	c6 45 fc 02          	mov    BYTE PTR [ebp-0x4],0x2
1000fd04:	8b 79 14             	mov    edi,DWORD PTR [ecx+0x14]
1000fd07:	89 7d d4             	mov    DWORD PTR [ebp-0x2c],edi
1000fd0a:	3b 79 18             	cmp    edi,DWORD PTR [ecx+0x18]
1000fd0d:	0f 83 93 02 00 00    	jae    0x1000ffa6
1000fd13:	8b 1f                	mov    ebx,DWORD PTR [edi]
1000fd15:	8b cb                	mov    ecx,ebx
1000fd17:	89 5d e4             	mov    DWORD PTR [ebp-0x1c],ebx
1000fd1a:	e8 21 17 00 00       	call   0x10011440
1000fd1f:	83 f8 05             	cmp    eax,0x5
1000fd22:	75 3f                	jne    0x1000fd63
1000fd24:	8d 45 e4             	lea    eax,[ebp-0x1c]
1000fd27:	50                   	push   eax
1000fd28:	ff 76 04             	push   DWORD PTR [esi+0x4]
1000fd2b:	8d 4d b4             	lea    ecx,[ebp-0x4c]
1000fd2e:	56                   	push   esi
1000fd2f:	e8 6c ec ff ff       	call   0x1000e9a0
1000fd34:	8b 55 b8             	mov    edx,DWORD PTR [ebp-0x48]
1000fd37:	b9 54 55 55 15       	mov    ecx,0x15555554
1000fd3c:	2b ca                	sub    ecx,edx
1000fd3e:	8b f0                	mov    esi,eax
1000fd40:	83 f9 01             	cmp    ecx,0x1
1000fd43:	0f 82 ef 02 00 00    	jb     0x10010038
1000fd49:	8b 5d e8             	mov    ebx,DWORD PTR [ebp-0x18]
1000fd4c:	42                   	inc    edx
1000fd4d:	89 55 b8             	mov    DWORD PTR [ebp-0x48],edx
1000fd50:	89 73 04             	mov    DWORD PTR [ebx+0x4],esi
1000fd53:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
1000fd56:	89 30                	mov    DWORD PTR [eax],esi
1000fd58:	8b 75 b4             	mov    esi,DWORD PTR [ebp-0x4c]
1000fd5b:	89 75 e8             	mov    DWORD PTR [ebp-0x18],esi
1000fd5e:	e9 2e 02 00 00       	jmp    0x1000ff91
1000fd63:	8b cb                	mov    ecx,ebx
1000fd65:	e8 d6 16 00 00       	call   0x10011440
1000fd6a:	83 f8 04             	cmp    eax,0x4
1000fd6d:	75 3f                	jne    0x1000fdae
1000fd6f:	8b cb                	mov    ecx,ebx
1000fd71:	e8 fa 18 00 00       	call   0x10011670
1000fd76:	85 c0                	test   eax,eax
1000fd78:	74 34                	je     0x1000fdae
1000fd7a:	8b cb                	mov    ecx,ebx
1000fd7c:	e8 ef 18 00 00       	call   0x10011670
1000fd81:	8b c8                	mov    ecx,eax
1000fd83:	e8 e8 18 00 00       	call   0x10011670
1000fd88:	85 c0                	test   eax,eax
1000fd8a:	74 22                	je     0x1000fdae
1000fd8c:	8b cb                	mov    ecx,ebx
1000fd8e:	e8 dd 18 00 00       	call   0x10011670
1000fd93:	8b c8                	mov    ecx,eax
1000fd95:	e8 d6 18 00 00       	call   0x10011670
1000fd9a:	8b c8                	mov    ecx,eax
1000fd9c:	e8 df 31 00 00       	call   0x10012f80
1000fda1:	50                   	push   eax
1000fda2:	8b cb                	mov    ecx,ebx
1000fda4:	e8 17 32 00 00       	call   0x10012fc0
1000fda9:	e9 e3 01 00 00       	jmp    0x1000ff91
1000fdae:	8b cb                	mov    ecx,ebx
1000fdb0:	e8 cb 31 00 00       	call   0x10012f80
1000fdb5:	83 f8 ff             	cmp    eax,0xffffffff
1000fdb8:	0f 84 d3 01 00 00    	je     0x1000ff91
1000fdbe:	8b cb                	mov    ecx,ebx
1000fdc0:	e8 9b d5 ff ff       	call   0x1000d360
1000fdc5:	85 c0                	test   eax,eax
1000fdc7:	0f 84 c4 01 00 00    	je     0x1000ff91
1000fdcd:	8b cb                	mov    ecx,ebx
1000fdcf:	e8 ac 31 00 00       	call   0x10012f80
1000fdd4:	8b f0                	mov    esi,eax
1000fdd6:	8b cb                	mov    ecx,ebx
1000fdd8:	89 75 e4             	mov    DWORD PTR [ebp-0x1c],esi
1000fddb:	e8 60 16 00 00       	call   0x10011440
1000fde0:	8b d0                	mov    edx,eax
1000fde2:	89 75 b0             	mov    DWORD PTR [ebp-0x50],esi
1000fde5:	8b 45 c4             	mov    eax,DWORD PTR [ebp-0x3c]
1000fde8:	8b f0                	mov    esi,eax
1000fdea:	89 55 ac             	mov    DWORD PTR [ebp-0x54],edx
1000fded:	8b 48 04             	mov    ecx,DWORD PTR [eax+0x4]
1000fdf0:	80 79 0d 00          	cmp    BYTE PTR [ecx+0xd],0x0
1000fdf4:	75 46                	jne    0x1000fe3c
1000fdf6:	8b 7d e4             	mov    edi,DWORD PTR [ebp-0x1c]
1000fdf9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [eax+0x0]
1000fe00:	8b 41 10             	mov    eax,DWORD PTR [ecx+0x10]
1000fe03:	3b c2                	cmp    eax,edx
1000fe05:	75 03                	jne    0x1000fe0a
1000fe07:	39 79 14             	cmp    DWORD PTR [ecx+0x14],edi
1000fe0a:	0f 9c c0             	setl   al
1000fe0d:	84 c0                	test   al,al
1000fe0f:	74 05                	je     0x1000fe16
1000fe11:	8b 49 08             	mov    ecx,DWORD PTR [ecx+0x8]
1000fe14:	eb 04                	jmp    0x1000fe1a
1000fe16:	8b f1                	mov    esi,ecx
1000fe18:	8b 09                	mov    ecx,DWORD PTR [ecx]
1000fe1a:	80 79 0d 00          	cmp    BYTE PTR [ecx+0xd],0x0
1000fe1e:	74 e0                	je     0x1000fe00
1000fe20:	8b 7d d4             	mov    edi,DWORD PTR [ebp-0x2c]
1000fe23:	3b 75 c4             	cmp    esi,DWORD PTR [ebp-0x3c]
1000fe26:	74 14                	je     0x1000fe3c
1000fe28:	8b 46 10             	mov    eax,DWORD PTR [esi+0x10]
1000fe2b:	8b 4e 14             	mov    ecx,DWORD PTR [esi+0x14]
1000fe2e:	3b d0                	cmp    edx,eax
1000fe30:	75 03                	jne    0x1000fe35
1000fe32:	39 4d e4             	cmp    DWORD PTR [ebp-0x1c],ecx
1000fe35:	0f 9c c0             	setl   al
1000fe38:	84 c0                	test   al,al
1000fe3a:	74 30                	je     0x1000fe6c
1000fe3c:	8d 45 ac             	lea    eax,[ebp-0x54]
1000fe3f:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
1000fe42:	8d 4d c4             	lea    ecx,[ebp-0x3c]
1000fe45:	8d 45 f0             	lea    eax,[ebp-0x10]
1000fe48:	50                   	push   eax
1000fe49:	8d 45 e4             	lea    eax,[ebp-0x1c]
1000fe4c:	50                   	push   eax
1000fe4d:	68 a4 73 01 10       	push   0x100173a4
1000fe52:	e8 69 eb ff ff       	call   0x1000e9c0
1000fe57:	50                   	push   eax
1000fe58:	83 c0 10             	add    eax,0x10
1000fe5b:	8d 4d c4             	lea    ecx,[ebp-0x3c]
1000fe5e:	50                   	push   eax
1000fe5f:	56                   	push   esi
1000fe60:	8d 45 d0             	lea    eax,[ebp-0x30]
1000fe63:	50                   	push   eax
1000fe64:	e8 97 ef ff ff       	call   0x1000ee00
1000fe69:	8b 75 d0             	mov    esi,DWORD PTR [ebp-0x30]
1000fe6c:	8b 46 18             	mov    eax,DWORD PTR [esi+0x18]
1000fe6f:	8b cb                	mov    ecx,ebx
1000fe71:	40                   	inc    eax
1000fe72:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
1000fe75:	e8 06 31 00 00       	call   0x10012f80
1000fe7a:	8b cb                	mov    ecx,ebx
1000fe7c:	8b f0                	mov    esi,eax
1000fe7e:	e8 bd 15 00 00       	call   0x10011440
1000fe83:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
1000fe86:	8b 4d e4             	mov    ecx,DWORD PTR [ebp-0x1c]
1000fe89:	89 45 a0             	mov    DWORD PTR [ebp-0x60],eax
1000fe8c:	8d 45 98             	lea    eax,[ebp-0x68]
1000fe8f:	50                   	push   eax
1000fe90:	89 75 9c             	mov    DWORD PTR [ebp-0x64],esi
1000fe93:	8d 45 d8             	lea    eax,[ebp-0x28]
1000fe96:	8b 75 bc             	mov    esi,DWORD PTR [ebp-0x44]
1000fe99:	56                   	push   esi
1000fe9a:	89 4d 98             	mov    DWORD PTR [ebp-0x68],ecx
1000fe9d:	ff 36                	push   DWORD PTR [esi]
1000fe9f:	50                   	push   eax
1000fea0:	e8 9b eb ff ff       	call   0x1000ea40
1000fea5:	83 c4 14             	add    esp,0x14
1000fea8:	39 75 d8             	cmp    DWORD PTR [ebp-0x28],esi
1000feab:	74 41                	je     0x1000feee
1000fead:	8b 7d e4             	mov    edi,DWORD PTR [ebp-0x1c]
1000feb0:	8b cb                	mov    ecx,ebx
1000feb2:	47                   	inc    edi
1000feb3:	e8 c8 30 00 00       	call   0x10012f80
1000feb8:	8b cb                	mov    ecx,ebx
1000feba:	8b f0                	mov    esi,eax
1000febc:	e8 7f 15 00 00       	call   0x10011440
1000fec1:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
1000fec4:	89 45 a0             	mov    DWORD PTR [ebp-0x60],eax
1000fec7:	8d 45 98             	lea    eax,[ebp-0x68]
1000feca:	50                   	push   eax
1000fecb:	89 75 9c             	mov    DWORD PTR [ebp-0x64],esi
1000fece:	8d 45 d8             	lea    eax,[ebp-0x28]
1000fed1:	8b 75 bc             	mov    esi,DWORD PTR [ebp-0x44]
1000fed4:	56                   	push   esi
1000fed5:	89 7d 98             	mov    DWORD PTR [ebp-0x68],edi
1000fed8:	ff 36                	push   DWORD PTR [esi]
1000feda:	50                   	push   eax
1000fedb:	e8 60 eb ff ff       	call   0x1000ea40
1000fee0:	83 c4 14             	add    esp,0x14
1000fee3:	39 75 d8             	cmp    DWORD PTR [ebp-0x28],esi
1000fee6:	75 c8                	jne    0x1000feb0
1000fee8:	89 7d e4             	mov    DWORD PTR [ebp-0x1c],edi
1000feeb:	8b 7d d4             	mov    edi,DWORD PTR [ebp-0x2c]
1000feee:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
1000fef1:	8b cb                	mov    ecx,ebx
1000fef3:	e8 b8 18 00 00       	call   0x100117b0
1000fef8:	8b cb                	mov    ecx,ebx
1000fefa:	e8 81 30 00 00       	call   0x10012f80
1000feff:	8b cb                	mov    ecx,ebx
1000ff01:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
1000ff04:	e8 37 15 00 00       	call   0x10011440
1000ff09:	8b 5d d4             	mov    ebx,DWORD PTR [ebp-0x2c]
1000ff0c:	8b d0                	mov    edx,eax
1000ff0e:	8b 45 c4             	mov    eax,DWORD PTR [ebp-0x3c]
1000ff11:	8b f0                	mov    esi,eax
1000ff13:	89 55 a4             	mov    DWORD PTR [ebp-0x5c],edx
1000ff16:	89 5d a8             	mov    DWORD PTR [ebp-0x58],ebx
1000ff19:	8b 48 04             	mov    ecx,DWORD PTR [eax+0x4]
1000ff1c:	80 79 0d 00          	cmp    BYTE PTR [ecx+0xd],0x0
1000ff20:	75 36                	jne    0x1000ff58
1000ff22:	8b 41 10             	mov    eax,DWORD PTR [ecx+0x10]
1000ff25:	3b c2                	cmp    eax,edx
1000ff27:	75 03                	jne    0x1000ff2c
1000ff29:	39 59 14             	cmp    DWORD PTR [ecx+0x14],ebx
1000ff2c:	0f 9c c0             	setl   al
1000ff2f:	84 c0                	test   al,al
1000ff31:	74 05                	je     0x1000ff38
1000ff33:	8b 49 08             	mov    ecx,DWORD PTR [ecx+0x8]
1000ff36:	eb 04                	jmp    0x1000ff3c
1000ff38:	8b f1                	mov    esi,ecx
1000ff3a:	8b 09                	mov    ecx,DWORD PTR [ecx]
1000ff3c:	80 79 0d 00          	cmp    BYTE PTR [ecx+0xd],0x0
1000ff40:	74 e0                	je     0x1000ff22
1000ff42:	3b 75 c4             	cmp    esi,DWORD PTR [ebp-0x3c]
1000ff45:	74 11                	je     0x1000ff58
1000ff47:	8b 46 10             	mov    eax,DWORD PTR [esi+0x10]
1000ff4a:	3b d0                	cmp    edx,eax
1000ff4c:	75 03                	jne    0x1000ff51
1000ff4e:	3b 5e 14             	cmp    ebx,DWORD PTR [esi+0x14]
1000ff51:	0f 9c c0             	setl   al
1000ff54:	84 c0                	test   al,al
1000ff56:	74 30                	je     0x1000ff88
1000ff58:	8d 45 a4             	lea    eax,[ebp-0x5c]
1000ff5b:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
1000ff5e:	8d 4d c4             	lea    ecx,[ebp-0x3c]
1000ff61:	8d 45 ef             	lea    eax,[ebp-0x11]
1000ff64:	50                   	push   eax
1000ff65:	8d 45 d4             	lea    eax,[ebp-0x2c]
1000ff68:	50                   	push   eax
1000ff69:	68 a4 73 01 10       	push   0x100173a4
1000ff6e:	e8 4d ea ff ff       	call   0x1000e9c0
1000ff73:	50                   	push   eax
1000ff74:	83 c0 10             	add    eax,0x10
1000ff77:	8d 4d c4             	lea    ecx,[ebp-0x3c]
1000ff7a:	50                   	push   eax
1000ff7b:	56                   	push   esi
1000ff7c:	8d 45 cc             	lea    eax,[ebp-0x34]
1000ff7f:	50                   	push   eax
1000ff80:	e8 7b ee ff ff       	call   0x1000ee00
1000ff85:	8b 75 cc             	mov    esi,DWORD PTR [ebp-0x34]
1000ff88:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
1000ff8b:	89 46 18             	mov    DWORD PTR [esi+0x18],eax
1000ff8e:	8b 75 e8             	mov    esi,DWORD PTR [ebp-0x18]
1000ff91:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
1000ff94:	83 c7 04             	add    edi,0x4
1000ff97:	89 7d d4             	mov    DWORD PTR [ebp-0x2c],edi
1000ff9a:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
1000ff9d:	3b 78 18             	cmp    edi,DWORD PTR [eax+0x18]
1000ffa0:	0f 82 6d fd ff ff    	jb     0x1000fd13
1000ffa6:	8b 3e                	mov    edi,DWORD PTR [esi]
1000ffa8:	89 7d d8             	mov    DWORD PTR [ebp-0x28],edi
1000ffab:	3b fe                	cmp    edi,esi
1000ffad:	0f 84 b4 01 00 00    	je     0x10010167
1000ffb3:	8b 5f 08             	mov    ebx,DWORD PTR [edi+0x8]
1000ffb6:	8b cb                	mov    ecx,ebx
1000ffb8:	e8 b3 16 00 00       	call   0x10011670
1000ffbd:	85 c0                	test   eax,eax
1000ffbf:	74 16                	je     0x1000ffd7
1000ffc1:	8b cb                	mov    ecx,ebx
1000ffc3:	e8 a8 16 00 00       	call   0x10011670
1000ffc8:	8b c8                	mov    ecx,eax
1000ffca:	e8 91 16 00 00       	call   0x10011660
1000ffcf:	50                   	push   eax
1000ffd0:	8b cb                	mov    ecx,ebx
1000ffd2:	e8 e9 2f 00 00       	call   0x10012fc0
1000ffd7:	8b cb                	mov    ecx,ebx
1000ffd9:	e8 a2 2f 00 00       	call   0x10012f80
1000ffde:	83 f8 ff             	cmp    eax,0xffffffff
1000ffe1:	0f 84 73 01 00 00    	je     0x1001015a
1000ffe7:	8b cb                	mov    ecx,ebx
1000ffe9:	e8 72 d3 ff ff       	call   0x1000d360
1000ffee:	85 c0                	test   eax,eax
1000fff0:	0f 84 64 01 00 00    	je     0x1001015a
1000fff6:	8b cb                	mov    ecx,ebx
1000fff8:	e8 83 2f 00 00       	call   0x10012f80
1000fffd:	8b f0                	mov    esi,eax
1000ffff:	8b cb                	mov    ecx,ebx
10010001:	89 75 e4             	mov    DWORD PTR [ebp-0x1c],esi
10010004:	e8 37 14 00 00       	call   0x10011440
10010009:	8b d0                	mov    edx,eax
1001000b:	89 75 a8             	mov    DWORD PTR [ebp-0x58],esi
1001000e:	8b 45 c4             	mov    eax,DWORD PTR [ebp-0x3c]
10010011:	8b f0                	mov    esi,eax
10010013:	89 55 a4             	mov    DWORD PTR [ebp-0x5c],edx
10010016:	8b 48 04             	mov    ecx,DWORD PTR [eax+0x4]
10010019:	80 79 0d 00          	cmp    BYTE PTR [ecx+0xd],0x0
1001001d:	75 4a                	jne    0x10010069
1001001f:	8b 7d e4             	mov    edi,DWORD PTR [ebp-0x1c]
10010022:	8b 41 10             	mov    eax,DWORD PTR [ecx+0x10]
10010025:	3b c2                	cmp    eax,edx
10010027:	75 03                	jne    0x1001002c
10010029:	39 79 14             	cmp    DWORD PTR [ecx+0x14],edi
1001002c:	0f 9c c0             	setl   al
1001002f:	84 c0                	test   al,al
10010031:	74 10                	je     0x10010043
10010033:	8b 49 08             	mov    ecx,DWORD PTR [ecx+0x8]
10010036:	eb 0f                	jmp    0x10010047
10010038:	68 f0 73 01 10       	push   0x100173f0
1001003d:	ff 15 34 70 01 10    	call   DWORD PTR ds:0x10017034
10010043:	8b f1                	mov    esi,ecx
10010045:	8b 09                	mov    ecx,DWORD PTR [ecx]
10010047:	80 79 0d 00          	cmp    BYTE PTR [ecx+0xd],0x0
1001004b:	74 d5                	je     0x10010022
1001004d:	8b 7d d8             	mov    edi,DWORD PTR [ebp-0x28]
10010050:	3b 75 c4             	cmp    esi,DWORD PTR [ebp-0x3c]
10010053:	74 14                	je     0x10010069
10010055:	8b 46 10             	mov    eax,DWORD PTR [esi+0x10]
10010058:	8b 4e 14             	mov    ecx,DWORD PTR [esi+0x14]
1001005b:	3b d0                	cmp    edx,eax
1001005d:	75 03                	jne    0x10010062
1001005f:	39 4d e4             	cmp    DWORD PTR [ebp-0x1c],ecx
10010062:	0f 9c c0             	setl   al
10010065:	84 c0                	test   al,al
10010067:	74 30                	je     0x10010099
10010069:	8d 45 a4             	lea    eax,[ebp-0x5c]
1001006c:	89 45 cc             	mov    DWORD PTR [ebp-0x34],eax
1001006f:	8d 4d c4             	lea    ecx,[ebp-0x3c]
10010072:	8d 45 ef             	lea    eax,[ebp-0x11]
10010075:	50                   	push   eax
10010076:	8d 45 cc             	lea    eax,[ebp-0x34]
10010079:	50                   	push   eax
1001007a:	68 a4 73 01 10       	push   0x100173a4
1001007f:	e8 3c e9 ff ff       	call   0x1000e9c0
10010084:	50                   	push   eax
10010085:	83 c0 10             	add    eax,0x10
10010088:	8d 4d c4             	lea    ecx,[ebp-0x3c]
1001008b:	50                   	push   eax
1001008c:	56                   	push   esi
1001008d:	8d 45 d0             	lea    eax,[ebp-0x30]
10010090:	50                   	push   eax
10010091:	e8 6a ed ff ff       	call   0x1000ee00
10010096:	8b 75 d0             	mov    esi,DWORD PTR [ebp-0x30]
10010099:	8b 46 18             	mov    eax,DWORD PTR [esi+0x18]
1001009c:	8b cb                	mov    ecx,ebx
1001009e:	40                   	inc    eax
1001009f:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
100100a2:	e8 d9 2e 00 00       	call   0x10012f80
100100a7:	8b cb                	mov    ecx,ebx
100100a9:	8b f0                	mov    esi,eax
100100ab:	e8 90 13 00 00       	call   0x10011440
100100b0:	ff 75 cc             	push   DWORD PTR [ebp-0x34]
100100b3:	8b 4d e4             	mov    ecx,DWORD PTR [ebp-0x1c]
100100b6:	89 45 94             	mov    DWORD PTR [ebp-0x6c],eax
100100b9:	8d 45 8c             	lea    eax,[ebp-0x74]
100100bc:	50                   	push   eax
100100bd:	89 75 90             	mov    DWORD PTR [ebp-0x70],esi
100100c0:	8d 45 d4             	lea    eax,[ebp-0x2c]
100100c3:	8b 75 bc             	mov    esi,DWORD PTR [ebp-0x44]
100100c6:	56                   	push   esi
100100c7:	89 4d 8c             	mov    DWORD PTR [ebp-0x74],ecx
100100ca:	ff 36                	push   DWORD PTR [esi]
100100cc:	50                   	push   eax
100100cd:	e8 6e e9 ff ff       	call   0x1000ea40
100100d2:	83 c4 14             	add    esp,0x14
100100d5:	39 75 d4             	cmp    DWORD PTR [ebp-0x2c],esi
100100d8:	74 44                	je     0x1001011e
100100da:	8b 7d e4             	mov    edi,DWORD PTR [ebp-0x1c]
100100dd:	0f 1f 00             	nop    DWORD PTR [eax]
100100e0:	8b cb                	mov    ecx,ebx
100100e2:	47                   	inc    edi
100100e3:	e8 98 2e 00 00       	call   0x10012f80
100100e8:	8b cb                	mov    ecx,ebx
100100ea:	8b f0                	mov    esi,eax
100100ec:	e8 4f 13 00 00       	call   0x10011440
100100f1:	ff 75 cc             	push   DWORD PTR [ebp-0x34]
100100f4:	89 45 94             	mov    DWORD PTR [ebp-0x6c],eax
100100f7:	8d 45 8c             	lea    eax,[ebp-0x74]
100100fa:	50                   	push   eax
100100fb:	89 75 90             	mov    DWORD PTR [ebp-0x70],esi
100100fe:	8d 45 d4             	lea    eax,[ebp-0x2c]
10010101:	8b 75 bc             	mov    esi,DWORD PTR [ebp-0x44]
10010104:	56                   	push   esi
10010105:	89 7d 8c             	mov    DWORD PTR [ebp-0x74],edi
10010108:	ff 36                	push   DWORD PTR [esi]
1001010a:	50                   	push   eax
1001010b:	e8 30 e9 ff ff       	call   0x1000ea40
10010110:	83 c4 14             	add    esp,0x14
10010113:	39 75 d4             	cmp    DWORD PTR [ebp-0x2c],esi
10010116:	75 c8                	jne    0x100100e0
10010118:	89 7d e4             	mov    DWORD PTR [ebp-0x1c],edi
1001011b:	8b 7d d8             	mov    edi,DWORD PTR [ebp-0x28]
1001011e:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
10010121:	8b cb                	mov    ecx,ebx
10010123:	e8 88 16 00 00       	call   0x100117b0
10010128:	8b cb                	mov    ecx,ebx
1001012a:	e8 51 2e 00 00       	call   0x10012f80
1001012f:	8b cb                	mov    ecx,ebx
10010131:	8b f0                	mov    esi,eax
10010133:	e8 08 13 00 00       	call   0x10011440
10010138:	89 45 ac             	mov    DWORD PTR [ebp-0x54],eax
1001013b:	8d 4d c4             	lea    ecx,[ebp-0x3c]
1001013e:	8d 45 ac             	lea    eax,[ebp-0x54]
10010141:	89 75 b0             	mov    DWORD PTR [ebp-0x50],esi
10010144:	50                   	push   eax
10010145:	8d 45 9c             	lea    eax,[ebp-0x64]
10010148:	50                   	push   eax
10010149:	e8 42 f3 ff ff       	call   0x1000f490
1001014e:	8b 45 9c             	mov    eax,DWORD PTR [ebp-0x64]
10010151:	8b 4d e4             	mov    ecx,DWORD PTR [ebp-0x1c]
10010154:	8b 75 e8             	mov    esi,DWORD PTR [ebp-0x18]
10010157:	89 48 18             	mov    DWORD PTR [eax+0x18],ecx
1001015a:	8b 3f                	mov    edi,DWORD PTR [edi]
1001015c:	89 7d d8             	mov    DWORD PTR [ebp-0x28],edi
1001015f:	3b fe                	cmp    edi,esi
10010161:	0f 85 4c fe ff ff    	jne    0x1000ffb3
10010167:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
1001016a:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
1001016d:	8b 78 14             	mov    edi,DWORD PTR [eax+0x14]
10010170:	3b 78 18             	cmp    edi,DWORD PTR [eax+0x18]
10010173:	0f 83 58 01 00 00    	jae    0x100102d1
10010179:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [eax+0x0]
10010180:	8b 37                	mov    esi,DWORD PTR [edi]
10010182:	8b ce                	mov    ecx,esi
10010184:	e8 07 12 00 00       	call   0x10011390
10010189:	84 c0                	test   al,al
1001018b:	0f 84 2b 01 00 00    	je     0x100102bc
10010191:	6a 00                	push   0x0
10010193:	6a 00                	push   0x0
10010195:	8d 4d e0             	lea    ecx,[ebp-0x20]
10010198:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
1001019f:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
100101a6:	e8 05 f7 ff ff       	call   0x1000f8b0
100101ab:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
100101ae:	8b 06                	mov    eax,DWORD PTR [esi]
100101b0:	33 db                	xor    ebx,ebx
100101b2:	8b ce                	mov    ecx,esi
100101b4:	c6 45 fc 03          	mov    BYTE PTR [ebp-0x4],0x3
100101b8:	89 5d d4             	mov    DWORD PTR [ebp-0x2c],ebx
100101bb:	ff 50 04             	call   DWORD PTR [eax+0x4]
100101be:	85 c0                	test   eax,eax
100101c0:	7e 7e                	jle    0x10010240
100101c2:	8b 06                	mov    eax,DWORD PTR [esi]
100101c4:	8d 4d a4             	lea    ecx,[ebp-0x5c]
100101c7:	53                   	push   ebx
100101c8:	51                   	push   ecx
100101c9:	8b ce                	mov    ecx,esi
100101cb:	ff 50 08             	call   DWORD PTR [eax+0x8]
100101ce:	8b 45 a8             	mov    eax,DWORD PTR [ebp-0x58]
100101d1:	8b c8                	mov    ecx,eax
100101d3:	89 45 cc             	mov    DWORD PTR [ebp-0x34],eax
100101d6:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
100101d9:	e8 a2 2f ff ff       	call   0x10003180
100101de:	83 f8 03             	cmp    eax,0x3
100101e1:	75 4e                	jne    0x10010231
100101e3:	8b 4d cc             	mov    ecx,DWORD PTR [ebp-0x34]
100101e6:	e8 75 ce ff ff       	call   0x1000d060
100101eb:	85 c0                	test   eax,eax
100101ed:	75 42                	jne    0x10010231
100101ef:	39 45 a4             	cmp    DWORD PTR [ebp-0x5c],eax
100101f2:	75 3d                	jne    0x10010231
100101f4:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
100101f7:	8d 4d d0             	lea    ecx,[ebp-0x30]
100101fa:	51                   	push   ecx
100101fb:	8d 4d e0             	lea    ecx,[ebp-0x20]
100101fe:	89 45 cc             	mov    DWORD PTR [ebp-0x34],eax
10010201:	ff 70 04             	push   DWORD PTR [eax+0x4]
10010204:	50                   	push   eax
10010205:	e8 96 e7 ff ff       	call   0x1000e9a0
1001020a:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
1001020d:	b9 54 55 55 15       	mov    ecx,0x15555554
10010212:	2b ca                	sub    ecx,edx
10010214:	8b d8                	mov    ebx,eax
10010216:	83 f9 01             	cmp    ecx,0x1
10010219:	0f 82 19 fe ff ff    	jb     0x10010038
1001021f:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
10010222:	42                   	inc    edx
10010223:	89 55 e4             	mov    DWORD PTR [ebp-0x1c],edx
10010226:	89 58 04             	mov    DWORD PTR [eax+0x4],ebx
10010229:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
1001022c:	89 18                	mov    DWORD PTR [eax],ebx
1001022e:	8b 5d d4             	mov    ebx,DWORD PTR [ebp-0x2c]
10010231:	8b 06                	mov    eax,DWORD PTR [esi]
10010233:	43                   	inc    ebx
10010234:	8b ce                	mov    ecx,esi
10010236:	89 5d d4             	mov    DWORD PTR [ebp-0x2c],ebx
10010239:	ff 50 04             	call   DWORD PTR [eax+0x4]
1001023c:	3b d8                	cmp    ebx,eax
1001023e:	7c 82                	jl     0x100101c2
10010240:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
10010243:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
10010246:	8d 4d f0             	lea    ecx,[ebp-0x10]
10010249:	51                   	push   ecx
1001024a:	50                   	push   eax
1001024b:	c6 45 f0 00          	mov    BYTE PTR [ebp-0x10],0x0
1001024f:	8d 4d e0             	lea    ecx,[ebp-0x20]
10010252:	ff 30                	push   DWORD PTR [eax]
10010254:	8d 45 d8             	lea    eax,[ebp-0x28]
10010257:	50                   	push   eax
10010258:	e8 33 f1 ff ff       	call   0x1000f390
1001025d:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
10010260:	33 db                	xor    ebx,ebx
10010262:	8b 30                	mov    esi,DWORD PTR [eax]
10010264:	3b f0                	cmp    esi,eax
10010266:	74 13                	je     0x1001027b
10010268:	8b 4e 08             	mov    ecx,DWORD PTR [esi+0x8]
1001026b:	43                   	inc    ebx
1001026c:	53                   	push   ebx
1001026d:	e8 3e cf ff ff       	call   0x1000d1b0
10010272:	8b 36                	mov    esi,DWORD PTR [esi]
10010274:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
10010277:	3b f0                	cmp    esi,eax
10010279:	75 ed                	jne    0x10010268
1001027b:	8b 08                	mov    ecx,DWORD PTR [eax]
1001027d:	89 00                	mov    DWORD PTR [eax],eax
1001027f:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
10010282:	c6 45 fc 02          	mov    BYTE PTR [ebp-0x4],0x2
10010286:	89 40 04             	mov    DWORD PTR [eax+0x4],eax
10010289:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
1001028c:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
10010293:	3b c8                	cmp    ecx,eax
10010295:	74 18                	je     0x100102af
10010297:	8b 31                	mov    esi,DWORD PTR [ecx]
10010299:	6a 0c                	push   0xc
1001029b:	6a 01                	push   0x1
1001029d:	51                   	push   ecx
1001029e:	e8 dd 19 ff ff       	call   0x10001c80
100102a3:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
100102a6:	83 c4 0c             	add    esp,0xc
100102a9:	8b ce                	mov    ecx,esi
100102ab:	3b f0                	cmp    esi,eax
100102ad:	75 e8                	jne    0x10010297
100102af:	6a 0c                	push   0xc
100102b1:	6a 01                	push   0x1
100102b3:	50                   	push   eax
100102b4:	e8 c7 19 ff ff       	call   0x10001c80
100102b9:	83 c4 0c             	add    esp,0xc
100102bc:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
100102bf:	83 c7 04             	add    edi,0x4
100102c2:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
100102c5:	3b 78 18             	cmp    edi,DWORD PTR [eax+0x18]
100102c8:	0f 82 b2 fe ff ff    	jb     0x10010180
100102ce:	8b 75 e8             	mov    esi,DWORD PTR [ebp-0x18]
100102d1:	8b 06                	mov    eax,DWORD PTR [esi]
100102d3:	89 36                	mov    DWORD PTR [esi],esi
100102d5:	89 76 04             	mov    DWORD PTR [esi+0x4],esi
100102d8:	3b c6                	cmp    eax,esi
100102da:	74 1c                	je     0x100102f8
100102dc:	8b 5d e8             	mov    ebx,DWORD PTR [ebp-0x18]
100102df:	90                   	nop
100102e0:	8b 30                	mov    esi,DWORD PTR [eax]
100102e2:	6a 0c                	push   0xc
100102e4:	6a 01                	push   0x1
100102e6:	50                   	push   eax
100102e7:	e8 94 19 ff ff       	call   0x10001c80
100102ec:	83 c4 0c             	add    esp,0xc
100102ef:	8b c6                	mov    eax,esi
100102f1:	3b f3                	cmp    esi,ebx
100102f3:	75 eb                	jne    0x100102e0
100102f5:	8b 75 e8             	mov    esi,DWORD PTR [ebp-0x18]
100102f8:	6a 0c                	push   0xc
100102fa:	6a 01                	push   0x1
100102fc:	56                   	push   esi
100102fd:	e8 7e 19 ff ff       	call   0x10001c80
10010302:	8b 45 bc             	mov    eax,DWORD PTR [ebp-0x44]
10010305:	8d 4d bc             	lea    ecx,[ebp-0x44]
10010308:	83 c4 0c             	add    esp,0xc
1001030b:	50                   	push   eax
1001030c:	ff 30                	push   DWORD PTR [eax]
1001030e:	8d 45 cc             	lea    eax,[ebp-0x34]
10010311:	50                   	push   eax
10010312:	e8 b9 38 00 00       	call   0x10013bd0
10010317:	6a 1c                	push   0x1c
10010319:	6a 01                	push   0x1
1001031b:	ff 75 bc             	push   DWORD PTR [ebp-0x44]
1001031e:	e8 5d 19 ff ff       	call   0x10001c80
10010323:	8b 45 c4             	mov    eax,DWORD PTR [ebp-0x3c]
10010326:	8d 4d c4             	lea    ecx,[ebp-0x3c]
10010329:	83 c4 0c             	add    esp,0xc
1001032c:	50                   	push   eax
1001032d:	ff 30                	push   DWORD PTR [eax]
1001032f:	8d 45 cc             	lea    eax,[ebp-0x34]
10010332:	50                   	push   eax
10010333:	e8 98 38 00 00       	call   0x10013bd0
10010338:	6a 1c                	push   0x1c
1001033a:	6a 01                	push   0x1
1001033c:	ff 75 c4             	push   DWORD PTR [ebp-0x3c]
1001033f:	e8 3c 19 ff ff       	call   0x10001c80
10010344:	83 c4 0c             	add    esp,0xc
10010347:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1001034a:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10010351:	59                   	pop    ecx
10010352:	5f                   	pop    edi
10010353:	5e                   	pop    esi
10010354:	5b                   	pop    ebx
10010355:	8b e5                	mov    esp,ebp
10010357:	5d                   	pop    ebp
10010358:	c2 04 00             	ret    0x4

; ==== Temporary RB-tree insertion helper: 0x1000f1c0..0x1000f2de ====
1000f1c0:	55                   	push   ebp
1000f1c1:	8b ec                	mov    ebp,esp
1000f1c3:	6a ff                	push   0xffffffff
1000f1c5:	68 20 68 01 10       	push   0x10016820
1000f1ca:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000f1d0:	50                   	push   eax
1000f1d1:	83 ec 14             	sub    esp,0x14
1000f1d4:	53                   	push   ebx
1000f1d5:	56                   	push   esi
1000f1d6:	57                   	push   edi
1000f1d7:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000f1dc:	33 c5                	xor    eax,ebp
1000f1de:	50                   	push   eax
1000f1df:	8d 45 f4             	lea    eax,[ebp-0xc]
1000f1e2:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000f1e8:	89 65 f0             	mov    DWORD PTR [ebp-0x10],esp
1000f1eb:	8b c1                	mov    eax,ecx
1000f1ed:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
1000f1f0:	8b 38                	mov    edi,DWORD PTR [eax]
1000f1f2:	b3 01                	mov    bl,0x1
1000f1f4:	8b 75 10             	mov    esi,DWORD PTR [ebp+0x10]
1000f1f7:	8b cf                	mov    ecx,edi
1000f1f9:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000f200:	89 7d e0             	mov    DWORD PTR [ebp-0x20],edi
1000f203:	8b 57 04             	mov    edx,DWORD PTR [edi+0x4]
1000f206:	89 4d ec             	mov    DWORD PTR [ebp-0x14],ecx
1000f209:	88 5d e8             	mov    BYTE PTR [ebp-0x18],bl
1000f20c:	80 7a 0d 00          	cmp    BYTE PTR [edx+0xd],0x0
1000f210:	0f 85 8c 00 00 00    	jne    0x1000f2a2
1000f216:	8b 7e 08             	mov    edi,DWORD PTR [esi+0x8]
1000f219:	8a 7d 0c             	mov    bh,BYTE PTR [ebp+0xc]
1000f21c:	0f 1f 40 00          	nop    DWORD PTR [eax+0x0]
1000f220:	8b 42 18             	mov    eax,DWORD PTR [edx+0x18]
1000f223:	8b ca                	mov    ecx,edx
1000f225:	89 4d ec             	mov    DWORD PTR [ebp-0x14],ecx
1000f228:	84 ff                	test   bh,bh
1000f22a:	74 39                	je     0x1000f265
1000f22c:	3b c7                	cmp    eax,edi
1000f22e:	7c 22                	jl     0x1000f252
1000f230:	3b f8                	cmp    edi,eax
1000f232:	7c 17                	jl     0x1000f24b
1000f234:	8b 42 14             	mov    eax,DWORD PTR [edx+0x14]
1000f237:	8b 4e 04             	mov    ecx,DWORD PTR [esi+0x4]
1000f23a:	3b c1                	cmp    eax,ecx
1000f23c:	7c 11                	jl     0x1000f24f
1000f23e:	3b c8                	cmp    ecx,eax
1000f240:	8b ca                	mov    ecx,edx
1000f242:	7c 07                	jl     0x1000f24b
1000f244:	8b 42 10             	mov    eax,DWORD PTR [edx+0x10]
1000f247:	3b 06                	cmp    eax,DWORD PTR [esi]
1000f249:	7c 07                	jl     0x1000f252
1000f24b:	33 c0                	xor    eax,eax
1000f24d:	eb 08                	jmp    0x1000f257
1000f24f:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
1000f252:	b8 01 00 00 00       	mov    eax,0x1
1000f257:	84 c0                	test   al,al
1000f259:	0f 94 c3             	sete   bl
1000f25c:	88 5d e8             	mov    BYTE PTR [ebp-0x18],bl
1000f25f:	84 db                	test   bl,bl
1000f261:	74 27                	je     0x1000f28a
1000f263:	eb 32                	jmp    0x1000f297
1000f265:	3b f8                	cmp    edi,eax
1000f267:	7c 29                	jl     0x1000f292
1000f269:	3b c7                	cmp    eax,edi
1000f26b:	7c 18                	jl     0x1000f285
1000f26d:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
1000f270:	8b 4a 14             	mov    ecx,DWORD PTR [edx+0x14]
1000f273:	3b c1                	cmp    eax,ecx
1000f275:	7c 18                	jl     0x1000f28f
1000f277:	3b c8                	cmp    ecx,eax
1000f279:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
1000f27c:	7c 07                	jl     0x1000f285
1000f27e:	8b 06                	mov    eax,DWORD PTR [esi]
1000f280:	3b 42 10             	cmp    eax,DWORD PTR [edx+0x10]
1000f283:	7c 0d                	jl     0x1000f292
1000f285:	32 db                	xor    bl,bl
1000f287:	88 5d e8             	mov    BYTE PTR [ebp-0x18],bl
1000f28a:	8b 52 08             	mov    edx,DWORD PTR [edx+0x8]
1000f28d:	eb 0a                	jmp    0x1000f299
1000f28f:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
1000f292:	b3 01                	mov    bl,0x1
1000f294:	88 5d e8             	mov    BYTE PTR [ebp-0x18],bl
1000f297:	8b 12                	mov    edx,DWORD PTR [edx]
1000f299:	80 7a 0d 00          	cmp    BYTE PTR [edx+0xd],0x0
1000f29d:	74 81                	je     0x1000f220
1000f29f:	8b 7d e0             	mov    edi,DWORD PTR [ebp-0x20]
1000f2a2:	8b c1                	mov    eax,ecx
1000f2a4:	89 45 0c             	mov    DWORD PTR [ebp+0xc],eax
1000f2a7:	84 db                	test   bl,bl
1000f2a9:	74 41                	je     0x1000f2ec
1000f2ab:	3b 0f                	cmp    ecx,DWORD PTR [edi]
1000f2ad:	75 32                	jne    0x1000f2e1
1000f2af:	ff 75 14             	push   DWORD PTR [ebp+0x14]
1000f2b2:	56                   	push   esi
1000f2b3:	51                   	push   ecx
1000f2b4:	6a 01                	push   0x1
1000f2b6:	8b 4d e4             	mov    ecx,DWORD PTR [ebp-0x1c]
1000f2b9:	8d 45 0c             	lea    eax,[ebp+0xc]
1000f2bc:	50                   	push   eax
1000f2bd:	e8 ae f9 ff ff       	call   0x1000ec70
1000f2c2:	8b 08                	mov    ecx,DWORD PTR [eax]
1000f2c4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000f2c7:	89 08                	mov    DWORD PTR [eax],ecx
1000f2c9:	c6 40 04 01          	mov    BYTE PTR [eax+0x4],0x1
1000f2cd:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000f2d0:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000f2d7:	59                   	pop    ecx
1000f2d8:	5f                   	pop    edi
1000f2d9:	5e                   	pop    esi
1000f2da:	5b                   	pop    ebx
1000f2db:	8b e5                	mov    esp,ebp
1000f2dd:	5d                   	pop    ebp
1000f2de:	c2 10 00             	ret    0x10

; ==== SubjectCategory::SCcompare: 0x10011330..0x10011388 ====
10011330:	55                   	push   ebp
10011331:	8b ec                	mov    ebp,esp
10011333:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10011336:	85 c0                	test   eax,eax
10011338:	75 04                	jne    0x1001133e
1001133a:	32 c0                	xor    al,al
1001133c:	5d                   	pop    ebp
1001133d:	c3                   	ret
1001133e:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
10011341:	85 c9                	test   ecx,ecx
10011343:	75 04                	jne    0x10011349
10011345:	b0 01                	mov    al,0x1
10011347:	5d                   	pop    ebp
10011348:	c3                   	ret
10011349:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
1001134c:	53                   	push   ebx
1001134d:	56                   	push   esi
1001134e:	57                   	push   edi
1001134f:	8b 70 38             	mov    esi,DWORD PTR [eax+0x38]
10011352:	8b 78 44             	mov    edi,DWORD PTR [eax+0x44]
10011355:	8b 50 40             	mov    edx,DWORD PTR [eax+0x40]
10011358:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
1001135b:	8b 58 44             	mov    ebx,DWORD PTR [eax+0x44]
1001135e:	8b 48 40             	mov    ecx,DWORD PTR [eax+0x40]
10011361:	8b 40 38             	mov    eax,DWORD PTR [eax+0x38]
10011364:	3b f0                	cmp    esi,eax
10011366:	7c 17                	jl     0x1001137f
10011368:	3b c6                	cmp    eax,esi
1001136a:	7c 0c                	jl     0x10011378
1001136c:	3b d1                	cmp    edx,ecx
1001136e:	7c 0f                	jl     0x1001137f
10011370:	3b ca                	cmp    ecx,edx
10011372:	7c 04                	jl     0x10011378
10011374:	3b fb                	cmp    edi,ebx
10011376:	7c 07                	jl     0x1001137f
10011378:	5f                   	pop    edi
10011379:	5e                   	pop    esi
1001137a:	33 c0                	xor    eax,eax
1001137c:	5b                   	pop    ebx
1001137d:	5d                   	pop    ebp
1001137e:	c3                   	ret
1001137f:	5f                   	pop    edi
10011380:	5e                   	pop    esi
10011381:	b8 01 00 00 00       	mov    eax,0x1
10011386:	5b                   	pop    ebx
10011387:	5d                   	pop    ebp
10011388:	c3                   	ret

; ==== SubjectCategory class getter/char mapping: 0x10011440..0x1001147c ====
10011440:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
10011443:	8b 40 38             	mov    eax,DWORD PTR [eax+0x38]
10011446:	c3                   	ret
10011447:	cc                   	int3
10011448:	cc                   	int3
10011449:	cc                   	int3
1001144a:	cc                   	int3
1001144b:	cc                   	int3
1001144c:	cc                   	int3
1001144d:	cc                   	int3
1001144e:	cc                   	int3
1001144f:	cc                   	int3
10011450:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
10011453:	8b 40 38             	mov    eax,DWORD PTR [eax+0x38]
10011456:	48                   	dec    eax
10011457:	83 f8 06             	cmp    eax,0x6
1001145a:	77 1c                	ja     0x10011478
1001145c:	ff 24 85 7c 14 01 10 	jmp    DWORD PTR [eax*4+0x1001147c]
10011463:	b0 53                	mov    al,0x53
10011465:	c3                   	ret
10011466:	b0 50                	mov    al,0x50
10011468:	c3                   	ret
10011469:	b0 5a                	mov    al,0x5a
1001146b:	c3                   	ret
1001146c:	b0 4b                	mov    al,0x4b
1001146e:	c3                   	ret
1001146f:	b0 4f                	mov    al,0x4f
10011471:	c3                   	ret
10011472:	b0 52                	mov    al,0x52
10011474:	c3                   	ret
10011475:	b0 43                	mov    al,0x43
10011477:	c3                   	ret
10011478:	b0 2d                	mov    al,0x2d
1001147a:	c3                   	ret
1001147b:	90                   	nop
1001147c:	63 14 01             	arpl   WORD PTR [ecx+eax*1],edx

; ==== SubjectCategory construction: 0x10011230..0x100112e4 ====
10011230:	55                   	push   ebp
10011231:	8b ec                	mov    ebp,esp
10011233:	6a ff                	push   0xffffffff
10011235:	68 9f 6a 01 10       	push   0x10016a9f
1001123a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10011240:	50                   	push   eax
10011241:	51                   	push   ecx
10011242:	56                   	push   esi
10011243:	57                   	push   edi
10011244:	a1 04 10 02 10       	mov    eax,ds:0x10021004
10011249:	33 c5                	xor    eax,ebp
1001124b:	50                   	push   eax
1001124c:	8d 45 f4             	lea    eax,[ebp-0xc]
1001124f:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10011255:	8b f9                	mov    edi,ecx
10011257:	89 7d f0             	mov    DWORD PTR [ebp-0x10],edi
1001125a:	6a 5c                	push   0x5c
1001125c:	e8 8f 3a 00 00       	call   0x10014cf0
10011261:	8b f0                	mov    esi,eax
10011263:	83 c4 04             	add    esp,0x4
10011266:	89 75 f0             	mov    DWORD PTR [ebp-0x10],esi
10011269:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10011270:	85 f6                	test   esi,esi
10011272:	74 3d                	je     0x100112b1
10011274:	8b ce                	mov    ecx,esi
10011276:	e8 b5 b5 ff ff       	call   0x1000c830
1001127b:	c7 06 f8 74 01 10    	mov    DWORD PTR [esi],0x100174f8
10011281:	c7 46 40 ff ff ff ff 	mov    DWORD PTR [esi+0x40],0xffffffff
10011288:	c7 46 44 ff ff ff ff 	mov    DWORD PTR [esi+0x44],0xffffffff
1001128f:	c7 46 48 ff ff ff ff 	mov    DWORD PTR [esi+0x48],0xffffffff
10011296:	c7 46 4c ff ff ff ff 	mov    DWORD PTR [esi+0x4c],0xffffffff
1001129d:	c7 46 50 ff ff ff ff 	mov    DWORD PTR [esi+0x50],0xffffffff
100112a4:	c7 46 54 ff ff ff ff 	mov    DWORD PTR [esi+0x54],0xffffffff
100112ab:	c6 46 58 01          	mov    BYTE PTR [esi+0x58],0x1
100112af:	eb 02                	jmp    0x100112b3
100112b1:	33 f6                	xor    esi,esi
100112b3:	56                   	push   esi
100112b4:	8b cf                	mov    ecx,edi
100112b6:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
100112bd:	e8 fe be ff ff       	call   0x1000d1c0
100112c2:	8b 47 04             	mov    eax,DWORD PTR [edi+0x4]
100112c5:	c7 07 b4 73 01 10    	mov    DWORD PTR [edi],0x100173b4
100112cb:	c7 40 4c 00 00 00 00 	mov    DWORD PTR [eax+0x4c],0x0
100112d2:	8b c7                	mov    eax,edi
100112d4:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
100112d7:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
100112de:	59                   	pop    ecx
100112df:	5f                   	pop    edi
100112e0:	5e                   	pop    esi
100112e1:	8b e5                	mov    esp,ebp
100112e3:	5d                   	pop    ebp
100112e4:	c3                   	ret

; ==== SubjectCategory field setters: 0x10011780..0x100117bc ====
10011780:	55                   	push   ebp
10011781:	8b ec                	mov    ebp,esp
10011783:	8b 49 04             	mov    ecx,DWORD PTR [ecx+0x4]
10011786:	8a 45 08             	mov    al,BYTE PTR [ebp+0x8]
10011789:	88 41 58             	mov    BYTE PTR [ecx+0x58],al
1001178c:	5d                   	pop    ebp
1001178d:	c2 04 00             	ret    0x4
10011790:	55                   	push   ebp
10011791:	8b ec                	mov    ebp,esp
10011793:	8b 49 04             	mov    ecx,DWORD PTR [ecx+0x4]
10011796:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10011799:	89 41 38             	mov    DWORD PTR [ecx+0x38],eax
1001179c:	5d                   	pop    ebp
1001179d:	c2 04 00             	ret    0x4
100117a0:	55                   	push   ebp
100117a1:	8b ec                	mov    ebp,esp
100117a3:	8b 49 04             	mov    ecx,DWORD PTR [ecx+0x4]
100117a6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
100117a9:	89 41 3c             	mov    DWORD PTR [ecx+0x3c],eax
100117ac:	5d                   	pop    ebp
100117ad:	c2 04 00             	ret    0x4
100117b0:	55                   	push   ebp
100117b1:	8b ec                	mov    ebp,esp
100117b3:	8b 49 04             	mov    ecx,DWORD PTR [ecx+0x4]
100117b6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
100117b9:	89 41 44             	mov    DWORD PTR [ecx+0x44],eax
100117bc:	5d                   	pop    ebp

; ==== SubjectCategory group getters/setters: 0x10012f80..0x10012fdc ====
10012f80:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
10012f83:	8b 40 40             	mov    eax,DWORD PTR [eax+0x40]
10012f86:	c3                   	ret
10012f87:	cc                   	int3
10012f88:	cc                   	int3
10012f89:	cc                   	int3
10012f8a:	cc                   	int3
10012f8b:	cc                   	int3
10012f8c:	cc                   	int3
10012f8d:	cc                   	int3
10012f8e:	cc                   	int3
10012f8f:	cc                   	int3
10012f90:	55                   	push   ebp
10012f91:	8b ec                	mov    ebp,esp
10012f93:	51                   	push   ecx
10012f94:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
10012f97:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
10012f9a:	83 c0 48             	add    eax,0x48
10012f9d:	50                   	push   eax
10012f9e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10012fa5:	e8 b6 ec ff ff       	call   0x10011c60
10012faa:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10012fad:	8b e5                	mov    esp,ebp
10012faf:	5d                   	pop    ebp
10012fb0:	c2 04 00             	ret    0x4
10012fb3:	cc                   	int3
10012fb4:	cc                   	int3
10012fb5:	cc                   	int3
10012fb6:	cc                   	int3
10012fb7:	cc                   	int3
10012fb8:	cc                   	int3
10012fb9:	cc                   	int3
10012fba:	cc                   	int3
10012fbb:	cc                   	int3
10012fbc:	cc                   	int3
10012fbd:	cc                   	int3
10012fbe:	cc                   	int3
10012fbf:	cc                   	int3
10012fc0:	55                   	push   ebp
10012fc1:	8b ec                	mov    ebp,esp
10012fc3:	8b 49 04             	mov    ecx,DWORD PTR [ecx+0x4]
10012fc6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10012fc9:	89 41 40             	mov    DWORD PTR [ecx+0x40],eax
10012fcc:	5d                   	pop    ebp
10012fcd:	c2 04 00             	ret    0x4
10012fd0:	55                   	push   ebp
10012fd1:	8b ec                	mov    ebp,esp
10012fd3:	8b 49 04             	mov    ecx,DWORD PTR [ecx+0x4]
10012fd6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10012fd9:	89 41 4c             	mov    DWORD PTR [ecx+0x4c],eax
10012fdc:	5d                   	pop    ebp
