; Static disassembly evidence for the reconstructed inline TreeHandle32.
; Analytical name only; not an original symbol. Binary SHA-256: 80ccc6678bdf057152f473369a56eb3b76a1ce643edca2832345f7b53e09c525
; outer_node+0x14..+0x1b = { nested-header pointer, nested tree node_count }

; ===== 1000dbf0 .. 1000dc1f =====

/mnt/data/work_stage117/original/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

1000dbf0 <.text+0xcbf0>:
1000dbf0:	6a 1c                	push   0x1c
1000dbf2:	e8 f9 70 00 00       	call   0x10014cf0
1000dbf7:	83 c4 04             	add    esp,0x4
1000dbfa:	85 c0                	test   eax,eax
1000dbfc:	75 06                	jne    0x1000dc04
1000dbfe:	ff 25 b8 70 01 10    	jmp    DWORD PTR ds:0x100170b8
1000dc04:	8d 48 04             	lea    ecx,[eax+0x4]
1000dc07:	89 00                	mov    DWORD PTR [eax],eax
1000dc09:	85 c9                	test   ecx,ecx
1000dc0b:	74 02                	je     0x1000dc0f
1000dc0d:	89 01                	mov    DWORD PTR [ecx],eax
1000dc0f:	8d 48 08             	lea    ecx,[eax+0x8]
1000dc12:	85 c9                	test   ecx,ecx
1000dc14:	74 02                	je     0x1000dc18
1000dc16:	89 01                	mov    DWORD PTR [ecx],eax
1000dc18:	66 c7 40 0c 01 01    	mov    WORD PTR [eax+0xc],0x101
1000dc1e:	c3                   	ret

; ===== 10001c10 .. 10001c78 =====

/mnt/data/work_stage117/original/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

10001c10 <.text+0xc10>:
10001c10:	6a 18                	push   0x18
10001c12:	e8 d9 30 01 00       	call   0x10014cf0
10001c17:	83 c4 04             	add    esp,0x4
10001c1a:	85 c0                	test   eax,eax
10001c1c:	75 06                	jne    0x10001c24
10001c1e:	ff 25 b8 70 01 10    	jmp    DWORD PTR ds:0x100170b8
10001c24:	8d 48 04             	lea    ecx,[eax+0x4]
10001c27:	89 00                	mov    DWORD PTR [eax],eax
10001c29:	85 c9                	test   ecx,ecx
10001c2b:	74 02                	je     0x10001c2f
10001c2d:	89 01                	mov    DWORD PTR [ecx],eax
10001c2f:	8d 48 08             	lea    ecx,[eax+0x8]
10001c32:	85 c9                	test   ecx,ecx
10001c34:	74 02                	je     0x10001c38
10001c36:	89 01                	mov    DWORD PTR [ecx],eax
10001c38:	66 c7 40 0c 01 01    	mov    WORD PTR [eax+0xc],0x101
10001c3e:	c3                   	ret
10001c3f:	cc                   	int3
10001c40:	56                   	push   esi
10001c41:	6a 18                	push   0x18
10001c43:	8b f1                	mov    esi,ecx
10001c45:	e8 a6 30 01 00       	call   0x10014cf0
10001c4a:	8b d0                	mov    edx,eax
10001c4c:	83 c4 04             	add    esp,0x4
10001c4f:	85 d2                	test   edx,edx
10001c51:	75 06                	jne    0x10001c59
10001c53:	ff 15 b8 70 01 10    	call   DWORD PTR ds:0x100170b8
10001c59:	8b 06                	mov    eax,DWORD PTR [esi]
10001c5b:	8d 4a 04             	lea    ecx,[edx+0x4]
10001c5e:	89 02                	mov    DWORD PTR [edx],eax
10001c60:	85 c9                	test   ecx,ecx
10001c62:	74 04                	je     0x10001c68
10001c64:	8b 06                	mov    eax,DWORD PTR [esi]
10001c66:	89 01                	mov    DWORD PTR [ecx],eax
10001c68:	8d 4a 08             	lea    ecx,[edx+0x8]
10001c6b:	85 c9                	test   ecx,ecx
10001c6d:	74 04                	je     0x10001c73
10001c6f:	8b 06                	mov    eax,DWORD PTR [esi]
10001c71:	89 01                	mov    DWORD PTR [ecx],eax
10001c73:	8b c2                	mov    eax,edx
10001c75:	5e                   	pop    esi
10001c76:	c3                   	ret
10001c77:	cc                   	int3

; ===== 10001000 .. 10001090 =====

/mnt/data/work_stage117/original/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

10001000 <.text>:
10001000:	55                   	push   ebp
10001001:	8b ec                	mov    ebp,esp
10001003:	6a ff                	push   0xffffffff
10001005:	68 48 5b 01 10       	push   0x10015b48
1000100a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10001010:	50                   	push   eax
10001011:	83 ec 08             	sub    esp,0x8
10001014:	53                   	push   ebx
10001015:	56                   	push   esi
10001016:	57                   	push   edi
10001017:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000101c:	33 c5                	xor    eax,ebp
1000101e:	50                   	push   eax
1000101f:	8d 45 f4             	lea    eax,[ebp-0xc]
10001022:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10001028:	89 65 f0             	mov    DWORD PTR [ebp-0x10],esp
1000102b:	8b f1                	mov    esi,ecx
1000102d:	89 75 ec             	mov    DWORD PTR [ebp-0x14],esi
10001030:	c7 06 00 00 00 00    	mov    DWORD PTR [esi],0x0
10001036:	c7 46 04 00 00 00 00 	mov    DWORD PTR [esi+0x4],0x0
1000103d:	e8 ce 0b 00 00       	call   0x10001c10
10001042:	89 06                	mov    DWORD PTR [esi],eax
10001044:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10001047:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000104e:	8b ce                	mov    ecx,esi
10001050:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10001053:	c6 45 fc 01          	mov    BYTE PTR [ebp-0x4],0x1
10001057:	e8 64 00 00 00       	call   0x100010c0
1000105c:	8b c6                	mov    eax,esi
1000105e:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10001061:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10001068:	59                   	pop    ecx
10001069:	5f                   	pop    edi
1000106a:	5e                   	pop    esi
1000106b:	5b                   	pop    ebx
1000106c:	8b e5                	mov    esp,ebp
1000106e:	5d                   	pop    ebp
1000106f:	c2 08 00             	ret    0x8
10001072:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
10001075:	8b 01                	mov    eax,DWORD PTR [ecx]
10001077:	50                   	push   eax
10001078:	ff 30                	push   DWORD PTR [eax]
1000107a:	8d 45 08             	lea    eax,[ebp+0x8]
1000107d:	50                   	push   eax
1000107e:	e8 4d 2b 01 00       	call   0x10013bd0
10001083:	6a 00                	push   0x0
10001085:	6a 00                	push   0x0
10001087:	e8 1c 4a 01 00       	call   0x10015aa8
1000108c:	cc                   	int3
1000108d:	cc                   	int3
1000108e:	cc                   	int3
1000108f:	cc                   	int3

; ===== 10001090 .. 100010c0 =====

/mnt/data/work_stage117/original/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

10001090 <.text+0x90>:
10001090:	55                   	push   ebp
10001091:	8b ec                	mov    ebp,esp
10001093:	56                   	push   esi
10001094:	e8 a7 0b 00 00       	call   0x10001c40
10001099:	8b d0                	mov    edx,eax
1000109b:	8d 72 10             	lea    esi,[edx+0x10]
1000109e:	66 c7 42 0c 00 00    	mov    WORD PTR [edx+0xc],0x0
100010a4:	85 f6                	test   esi,esi
100010a6:	74 0f                	je     0x100010b7
100010a8:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
100010ab:	8b 08                	mov    ecx,DWORD PTR [eax]
100010ad:	89 0e                	mov    DWORD PTR [esi],ecx
100010af:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
100010b2:	89 46 04             	mov    DWORD PTR [esi+0x4],eax
100010b5:	8b c2                	mov    eax,edx
100010b7:	5e                   	pop    esi
100010b8:	5d                   	pop    ebp
100010b9:	c2 04 00             	ret    0x4
100010bc:	cc                   	int3
100010bd:	cc                   	int3
100010be:	cc                   	int3
100010bf:	cc                   	int3

; ===== 100010c0 .. 10001134 =====

/mnt/data/work_stage117/original/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

100010c0 <.text+0xc0>:
100010c0:	55                   	push   ebp
100010c1:	8b ec                	mov    ebp,esp
100010c3:	53                   	push   ebx
100010c4:	56                   	push   esi
100010c5:	57                   	push   edi
100010c6:	8b 7d 08             	mov    edi,DWORD PTR [ebp+0x8]
100010c9:	8b d9                	mov    ebx,ecx
100010cb:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
100010ce:	8b 07                	mov    eax,DWORD PTR [edi]
100010d0:	8b 33                	mov    esi,DWORD PTR [ebx]
100010d2:	56                   	push   esi
100010d3:	ff 70 04             	push   DWORD PTR [eax+0x4]
100010d6:	e8 65 00 00 00       	call   0x10001140
100010db:	89 46 04             	mov    DWORD PTR [esi+0x4],eax
100010de:	8b 47 04             	mov    eax,DWORD PTR [edi+0x4]
100010e1:	89 43 04             	mov    DWORD PTR [ebx+0x4],eax
100010e4:	8b 13                	mov    edx,DWORD PTR [ebx]
100010e6:	8b 4a 04             	mov    ecx,DWORD PTR [edx+0x4]
100010e9:	80 79 0d 00          	cmp    BYTE PTR [ecx+0xd],0x0
100010ed:	75 37                	jne    0x10001126
100010ef:	8b 01                	mov    eax,DWORD PTR [ecx]
100010f1:	80 78 0d 00          	cmp    BYTE PTR [eax+0xd],0x0
100010f5:	75 0a                	jne    0x10001101
100010f7:	8b c8                	mov    ecx,eax
100010f9:	8b 01                	mov    eax,DWORD PTR [ecx]
100010fb:	80 78 0d 00          	cmp    BYTE PTR [eax+0xd],0x0
100010ff:	74 f6                	je     0x100010f7
10001101:	89 0a                	mov    DWORD PTR [edx],ecx
10001103:	8b 13                	mov    edx,DWORD PTR [ebx]
10001105:	8b 4a 04             	mov    ecx,DWORD PTR [edx+0x4]
10001108:	8b 41 08             	mov    eax,DWORD PTR [ecx+0x8]
1000110b:	80 78 0d 00          	cmp    BYTE PTR [eax+0xd],0x0
1000110f:	75 0b                	jne    0x1000111c
10001111:	8b c8                	mov    ecx,eax
10001113:	8b 41 08             	mov    eax,DWORD PTR [ecx+0x8]
10001116:	80 78 0d 00          	cmp    BYTE PTR [eax+0xd],0x0
1000111a:	74 f5                	je     0x10001111
1000111c:	5f                   	pop    edi
1000111d:	5e                   	pop    esi
1000111e:	89 4a 08             	mov    DWORD PTR [edx+0x8],ecx
10001121:	5b                   	pop    ebx
10001122:	5d                   	pop    ebp
10001123:	c2 08 00             	ret    0x8
10001126:	89 12                	mov    DWORD PTR [edx],edx
10001128:	8b 03                	mov    eax,DWORD PTR [ebx]
1000112a:	5f                   	pop    edi
1000112b:	5e                   	pop    esi
1000112c:	5b                   	pop    ebx
1000112d:	89 40 08             	mov    DWORD PTR [eax+0x8],eax
10001130:	5d                   	pop    ebp
10001131:	c2 08 00             	ret    0x8

; ===== 1000d470 .. 1000d4f1 =====

/mnt/data/work_stage117/original/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

1000d470 <.text+0xc470>:
1000d470:	55                   	push   ebp
1000d471:	8b ec                	mov    ebp,esp
1000d473:	6a ff                	push   0xffffffff
1000d475:	68 91 66 01 10       	push   0x10016691
1000d47a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000d480:	50                   	push   eax
1000d481:	83 ec 10             	sub    esp,0x10
1000d484:	53                   	push   ebx
1000d485:	56                   	push   esi
1000d486:	57                   	push   edi
1000d487:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000d48c:	33 c5                	xor    eax,ebp
1000d48e:	50                   	push   eax
1000d48f:	8d 45 f4             	lea    eax,[ebp-0xc]
1000d492:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000d498:	89 65 f0             	mov    DWORD PTR [ebp-0x10],esp
1000d49b:	e8 50 24 00 00       	call   0x1000f8f0
1000d4a0:	8b f0                	mov    esi,eax
1000d4a2:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000d4a9:	89 75 ec             	mov    DWORD PTR [ebp-0x14],esi
1000d4ac:	8d 56 10             	lea    edx,[esi+0x10]
1000d4af:	66 c7 46 0c 00 00    	mov    WORD PTR [esi+0xc],0x0
1000d4b5:	89 55 e8             	mov    DWORD PTR [ebp-0x18],edx
1000d4b8:	89 55 e4             	mov    DWORD PTR [ebp-0x1c],edx
1000d4bb:	c6 45 fc 01          	mov    BYTE PTR [ebp-0x4],0x1
1000d4bf:	85 d2                	test   edx,edx
1000d4c1:	74 1a                	je     0x1000d4dd
1000d4c3:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
1000d4c6:	8b 01                	mov    eax,DWORD PTR [ecx]
1000d4c8:	89 02                	mov    DWORD PTR [edx],eax
1000d4ca:	8d 41 04             	lea    eax,[ecx+0x4]
1000d4cd:	8d 4a 04             	lea    ecx,[edx+0x4]
1000d4d0:	8d 55 0b             	lea    edx,[ebp+0xb]
1000d4d3:	89 4d 08             	mov    DWORD PTR [ebp+0x8],ecx
1000d4d6:	52                   	push   edx
1000d4d7:	50                   	push   eax
1000d4d8:	e8 23 3b ff ff       	call   0x10001000
1000d4dd:	8b c6                	mov    eax,esi
1000d4df:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000d4e2:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000d4e9:	59                   	pop    ecx
1000d4ea:	5f                   	pop    edi
1000d4eb:	5e                   	pop    esi
1000d4ec:	5b                   	pop    ebx
1000d4ed:	8b e5                	mov    esp,ebp
1000d4ef:	5d                   	pop    ebp
1000d4f0:	c2                   	.byte 0xc2

; ===== 1000dcb0 .. 1000dd13 =====

/mnt/data/work_stage117/original/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

1000dcb0 <.text+0xccb0>:
1000dcb0:	55                   	push   ebp
1000dcb1:	8b ec                	mov    ebp,esp
1000dcb3:	51                   	push   ecx
1000dcb4:	53                   	push   ebx
1000dcb5:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
1000dcb8:	8b c1                	mov    eax,ecx
1000dcba:	56                   	push   esi
1000dcbb:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
1000dcbe:	8b f3                	mov    esi,ebx
1000dcc0:	80 7b 0d 00          	cmp    BYTE PTR [ebx+0xd],0x0
1000dcc4:	75 45                	jne    0x1000dd0b
1000dcc6:	57                   	push   edi
1000dcc7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [eax+eax*1+0x0]
1000dcce:	00 00 
1000dcd0:	ff 76 08             	push   DWORD PTR [esi+0x8]
1000dcd3:	8b c8                	mov    ecx,eax
1000dcd5:	e8 d6 ff ff ff       	call   0x1000dcb0
1000dcda:	8b 43 14             	mov    eax,DWORD PTR [ebx+0x14]
1000dcdd:	8d 4b 14             	lea    ecx,[ebx+0x14]
1000dce0:	8b 36                	mov    esi,DWORD PTR [esi]
1000dce2:	50                   	push   eax
1000dce3:	ff 30                	push   DWORD PTR [eax]
1000dce5:	8d 45 08             	lea    eax,[ebp+0x8]
1000dce8:	50                   	push   eax
1000dce9:	e8 e2 5e 00 00       	call   0x10013bd0
1000dcee:	ff 73 14             	push   DWORD PTR [ebx+0x14]
1000dcf1:	e8 2d 70 00 00       	call   0x10014d23
1000dcf6:	53                   	push   ebx
1000dcf7:	e8 27 70 00 00       	call   0x10014d23
1000dcfc:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
1000dcff:	83 c4 08             	add    esp,0x8
1000dd02:	80 7e 0d 00          	cmp    BYTE PTR [esi+0xd],0x0
1000dd06:	8b de                	mov    ebx,esi
1000dd08:	74 c6                	je     0x1000dcd0
1000dd0a:	5f                   	pop    edi
1000dd0b:	5e                   	pop    esi
1000dd0c:	5b                   	pop    ebx
1000dd0d:	8b e5                	mov    esp,ebp
1000dd0f:	5d                   	pop    ebp
1000dd10:	c2 04 00             	ret    0x4
