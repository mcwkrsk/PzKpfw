; Stage 1.17 — SCBinaryLink allocation, endpoint layout and factory semantics
; Source: MAIWmodels.dll SHA-256 80ccc6678bdf057152f473369a56eb3b76a1ce643edca2832345f7b53e09c525
; Addresses are image VAs; listing is a literal excerpt from the pinned PE32 disassembly.

; ==== 0x1000F9B0 factory addArragmentLink ====
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

; ==== 0x1000FA50 factory addCompositionLink ====
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

; ==== 0x1000FB10 factory addOrderLink ====
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

; ==== 0x10010480 SCBinaryLink constructor ====
10010480:	55                   	push   ebp
10010481:	8b ec                	mov    ebp,esp
10010483:	51                   	push   ecx
10010484:	56                   	push   esi
10010485:	8b f1                	mov    esi,ecx
10010487:	89 75 fc             	mov    DWORD PTR [ebp-0x4],esi
1001048a:	e8 71 c1 ff ff       	call   0x1000c600
1001048f:	c7 06 d4 73 01 10    	mov    DWORD PTR [esi],0x100173d4
10010495:	8b c6                	mov    eax,esi
10010497:	5e                   	pop    esi
10010498:	8b e5                	mov    esp,ebp
1001049a:	5d                   	pop    ebp
1001049b:	c3                   	ret
1001049c:	cc                   	int3
1001049d:	cc                   	int3
1001049e:	cc                   	int3
1001049f:	cc                   	int3

; ==== 0x1000C600 AIEBinaryLink constructor ====
1000c600:	55                   	push   ebp
1000c601:	8b ec                	mov    ebp,esp
1000c603:	6a ff                	push   0xffffffff
1000c605:	68 7f 68 01 10       	push   0x1001687f
1000c60a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000c610:	50                   	push   eax
1000c611:	51                   	push   ecx
1000c612:	56                   	push   esi
1000c613:	57                   	push   edi
1000c614:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000c619:	33 c5                	xor    eax,ebp
1000c61b:	50                   	push   eax
1000c61c:	8d 45 f4             	lea    eax,[ebp-0xc]
1000c61f:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000c625:	8b f1                	mov    esi,ecx
1000c627:	89 75 f0             	mov    DWORD PTR [ebp-0x10],esi
1000c62a:	6a 30                	push   0x30
1000c62c:	e8 bf 86 00 00       	call   0x10014cf0
1000c631:	8b f8                	mov    edi,eax
1000c633:	83 c4 04             	add    esp,0x4
1000c636:	89 7d f0             	mov    DWORD PTR [ebp-0x10],edi
1000c639:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000c640:	85 ff                	test   edi,edi
1000c642:	74 16                	je     0x1000c65a
1000c644:	6a 30                	push   0x30
1000c646:	6a 00                	push   0x0
1000c648:	57                   	push   edi
1000c649:	e8 66 94 00 00       	call   0x10015ab4
1000c64e:	83 c4 0c             	add    esp,0xc
1000c651:	8b cf                	mov    ecx,edi
1000c653:	e8 88 00 00 00       	call   0x1000c6e0
1000c658:	eb 02                	jmp    0x1000c65c
1000c65a:	33 c0                	xor    eax,eax
1000c65c:	50                   	push   eax
1000c65d:	8b ce                	mov    ecx,esi
1000c65f:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
1000c666:	e8 15 65 ff ff       	call   0x10002b80
1000c66b:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
1000c66e:	c7 06 10 73 01 10    	mov    DWORD PTR [esi],0x10017310
1000c674:	c7 40 1c 00 00 00 00 	mov    DWORD PTR [eax+0x1c],0x0
1000c67b:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
1000c67e:	c7 40 20 00 00 00 00 	mov    DWORD PTR [eax+0x20],0x0
1000c685:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
1000c688:	c7 40 24 00 00 00 00 	mov    DWORD PTR [eax+0x24],0x0
1000c68f:	8b c6                	mov    eax,esi
1000c691:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000c694:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000c69b:	59                   	pop    ecx
1000c69c:	5f                   	pop    edi
1000c69d:	5e                   	pop    esi
1000c69e:	8b e5                	mov    esp,ebp
1000c6a0:	5d                   	pop    ebp
1000c6a1:	c3                   	ret
1000c6a2:	cc                   	int3
1000c6a3:	cc                   	int3
1000c6a4:	cc                   	int3
1000c6a5:	cc                   	int3
1000c6a6:	cc                   	int3
1000c6a7:	cc                   	int3
1000c6a8:	cc                   	int3
1000c6a9:	cc                   	int3
1000c6aa:	cc                   	int3
1000c6ab:	cc                   	int3
1000c6ac:	cc                   	int3
1000c6ad:	cc                   	int3
1000c6ae:	cc                   	int3
1000c6af:	cc                   	int3

; ==== 0x1000CA50 AIEBinaryLink scalar deleting destructor ====
1000ca50:	55                   	push   ebp
1000ca51:	8b ec                	mov    ebp,esp
1000ca53:	6a ff                	push   0xffffffff
1000ca55:	68 30 66 01 10       	push   0x10016630
1000ca5a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000ca60:	50                   	push   eax
1000ca61:	53                   	push   ebx
1000ca62:	56                   	push   esi
1000ca63:	57                   	push   edi
1000ca64:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000ca69:	33 c5                	xor    eax,ebp
1000ca6b:	50                   	push   eax
1000ca6c:	8d 45 f4             	lea    eax,[ebp-0xc]
1000ca6f:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000ca75:	8b f1                	mov    esi,ecx
1000ca77:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
1000ca7a:	f6 c3 02             	test   bl,0x2
1000ca7d:	74 43                	je     0x1000cac2
1000ca7f:	68 d0 c8 00 10       	push   0x1000c8d0
1000ca84:	ff 76 fc             	push   DWORD PTR [esi-0x4]
1000ca87:	8d 7e fc             	lea    edi,[esi-0x4]
1000ca8a:	6a 30                	push   0x30
1000ca8c:	56                   	push   esi
1000ca8d:	e8 77 81 00 00       	call   0x10014c09
1000ca92:	f6 c3 01             	test   bl,0x1
1000ca95:	74 15                	je     0x1000caac
1000ca97:	8b 0f                	mov    ecx,DWORD PTR [edi]
1000ca99:	8d 0c 49             	lea    ecx,[ecx+ecx*2]
1000ca9c:	c1 e1 04             	shl    ecx,0x4
1000ca9f:	83 c1 04             	add    ecx,0x4
1000caa2:	51                   	push   ecx
1000caa3:	57                   	push   edi
1000caa4:	e8 96 82 00 00       	call   0x10014d3f
1000caa9:	83 c4 08             	add    esp,0x8
1000caac:	8b c7                	mov    eax,edi
1000caae:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000cab1:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000cab8:	59                   	pop    ecx
1000cab9:	5f                   	pop    edi
1000caba:	5e                   	pop    esi
1000cabb:	5b                   	pop    ebx
1000cabc:	8b e5                	mov    esp,ebp
1000cabe:	5d                   	pop    ebp
1000cabf:	c2 04 00             	ret    0x4
1000cac2:	c7 06 10 73 01 10    	mov    DWORD PTR [esi],0x10017310
1000cac8:	e8 d3 63 ff ff       	call   0x10002ea0
1000cacd:	f6 c3 01             	test   bl,0x1
1000cad0:	74 0b                	je     0x1000cadd
1000cad2:	6a 30                	push   0x30
1000cad4:	56                   	push   esi
1000cad5:	e8 4e 82 00 00       	call   0x10014d28
1000cada:	83 c4 08             	add    esp,0x8
1000cadd:	8b c6                	mov    eax,esi
1000cadf:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000cae2:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000cae9:	59                   	pop    ecx
1000caea:	5f                   	pop    edi
1000caeb:	5e                   	pop    esi
1000caec:	5b                   	pop    ebx
1000caed:	8b e5                	mov    esp,ebp
1000caef:	5d                   	pop    ebp
1000caf0:	c2 04 00             	ret    0x4
1000caf3:	cc                   	int3
1000caf4:	cc                   	int3
1000caf5:	cc                   	int3
1000caf6:	cc                   	int3
1000caf7:	cc                   	int3
1000caf8:	cc                   	int3
1000caf9:	cc                   	int3
1000cafa:	cc                   	int3
1000cafb:	cc                   	int3
1000cafc:	cc                   	int3
1000cafd:	cc                   	int3
1000cafe:	cc                   	int3
1000caff:	cc                   	int3

; ==== 0x1000D0F0 setArragmentLink ====
1000d0f0:	55                   	push   ebp
1000d0f1:	8b ec                	mov    ebp,esp
1000d0f3:	56                   	push   esi
1000d0f4:	ff 75 08             	push   DWORD PTR [ebp+0x8]
1000d0f7:	8b f1                	mov    esi,ecx
1000d0f9:	6a 00                	push   0x0
1000d0fb:	e8 80 5f ff ff       	call   0x10003080
1000d100:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
1000d103:	8b ce                	mov    ecx,esi
1000d105:	6a 01                	push   0x1
1000d107:	e8 74 5f ff ff       	call   0x10003080
1000d10c:	ff 75 10             	push   DWORD PTR [ebp+0x10]
1000d10f:	8b ce                	mov    ecx,esi
1000d111:	6a 02                	push   0x2
1000d113:	e8 68 5f ff ff       	call   0x10003080
1000d118:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
1000d11b:	5e                   	pop    esi
1000d11c:	c7 40 28 03 00 00 00 	mov    DWORD PTR [eax+0x28],0x3
1000d123:	5d                   	pop    ebp
1000d124:	c2 0c 00             	ret    0xc
1000d127:	cc                   	int3
1000d128:	cc                   	int3
1000d129:	cc                   	int3
1000d12a:	cc                   	int3
1000d12b:	cc                   	int3
1000d12c:	cc                   	int3
1000d12d:	cc                   	int3
1000d12e:	cc                   	int3
1000d12f:	cc                   	int3

; ==== 0x1000D130 setCompositionLink ====
1000d130:	55                   	push   ebp
1000d131:	8b ec                	mov    ebp,esp
1000d133:	56                   	push   esi
1000d134:	ff 75 08             	push   DWORD PTR [ebp+0x8]
1000d137:	8b f1                	mov    esi,ecx
1000d139:	6a 00                	push   0x0
1000d13b:	e8 40 5f ff ff       	call   0x10003080
1000d140:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
1000d143:	8b ce                	mov    ecx,esi
1000d145:	6a 01                	push   0x1
1000d147:	e8 34 5f ff ff       	call   0x10003080
1000d14c:	6a 00                	push   0x0
1000d14e:	6a 02                	push   0x2
1000d150:	8b ce                	mov    ecx,esi
1000d152:	e8 29 5f ff ff       	call   0x10003080
1000d157:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
1000d15a:	5e                   	pop    esi
1000d15b:	c7 40 28 02 00 00 00 	mov    DWORD PTR [eax+0x28],0x2
1000d162:	5d                   	pop    ebp
1000d163:	c2 08 00             	ret    0x8
1000d166:	cc                   	int3
1000d167:	cc                   	int3
1000d168:	cc                   	int3
1000d169:	cc                   	int3
1000d16a:	cc                   	int3
1000d16b:	cc                   	int3
1000d16c:	cc                   	int3
1000d16d:	cc                   	int3
1000d16e:	cc                   	int3
1000d16f:	cc                   	int3

; ==== 0x1000D170 setOrderLink ====
1000d170:	55                   	push   ebp
1000d171:	8b ec                	mov    ebp,esp
1000d173:	56                   	push   esi
1000d174:	6a 00                	push   0x0
1000d176:	6a 00                	push   0x0
1000d178:	8b f1                	mov    esi,ecx
1000d17a:	e8 01 5f ff ff       	call   0x10003080
1000d17f:	ff 75 08             	push   DWORD PTR [ebp+0x8]
1000d182:	8b ce                	mov    ecx,esi
1000d184:	6a 01                	push   0x1
1000d186:	e8 f5 5e ff ff       	call   0x10003080
1000d18b:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
1000d18e:	8b ce                	mov    ecx,esi
1000d190:	6a 02                	push   0x2
1000d192:	e8 e9 5e ff ff       	call   0x10003080
1000d197:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
1000d19a:	5e                   	pop    esi
1000d19b:	c7 40 28 01 00 00 00 	mov    DWORD PTR [eax+0x28],0x1
1000d1a2:	5d                   	pop    ebp
1000d1a3:	c2 08 00             	ret    0x8

; ==== 0x10003080 endpoint slot setter ====
10003080:	55                   	push   ebp
10003081:	8b ec                	mov    ebp,esp
10003083:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10003086:	53                   	push   ebx
10003087:	56                   	push   esi
10003088:	8b 75 0c             	mov    esi,DWORD PTR [ebp+0xc]
1000308b:	57                   	push   edi
1000308c:	8b f9                	mov    edi,ecx
1000308e:	8d 1c 85 1c 00 00 00 	lea    ebx,[eax*4+0x1c]
10003095:	8b 47 04             	mov    eax,DWORD PTR [edi+0x4]
10003098:	8b 04 03             	mov    eax,DWORD PTR [ebx+eax*1]
1000309b:	3b c6                	cmp    eax,esi
1000309d:	0f 84 a8 00 00 00    	je     0x1000314b
100030a3:	85 c0                	test   eax,eax
100030a5:	74 08                	je     0x100030af
100030a7:	6a 01                	push   0x1
100030a9:	50                   	push   eax
100030aa:	e8 61 01 00 00       	call   0x10003210
100030af:	8b 47 04             	mov    eax,DWORD PTR [edi+0x4]
100030b2:	89 34 03             	mov    DWORD PTR [ebx+eax*1],esi
100030b5:	33 c0                	xor    eax,eax
100030b7:	8b 76 04             	mov    esi,DWORD PTR [esi+0x4]
100030ba:	8b 4e 14             	mov    ecx,DWORD PTR [esi+0x14]
100030bd:	8b d1                	mov    edx,ecx
100030bf:	8b 5e 10             	mov    ebx,DWORD PTR [esi+0x10]
100030c2:	2b d3                	sub    edx,ebx
100030c4:	c1 fa 02             	sar    edx,0x2
100030c7:	85 d2                	test   edx,edx
100030c9:	74 13                	je     0x100030de
100030cb:	2b cb                	sub    ecx,ebx
100030cd:	c1 f9 02             	sar    ecx,0x2
100030d0:	3b c8                	cmp    ecx,eax
100030d2:	76 50                	jbe    0x10003124
100030d4:	39 3c 83             	cmp    DWORD PTR [ebx+eax*4],edi
100030d7:	74 72                	je     0x1000314b
100030d9:	40                   	inc    eax
100030da:	3b c2                	cmp    eax,edx
100030dc:	72 f2                	jb     0x100030d0
100030de:	8b 46 14             	mov    eax,DWORD PTR [esi+0x14]
100030e1:	8d 4d 08             	lea    ecx,[ebp+0x8]
100030e4:	89 7d 08             	mov    DWORD PTR [ebp+0x8],edi
100030e7:	3b c8                	cmp    ecx,eax
100030e9:	73 44                	jae    0x1000312f
100030eb:	8b cb                	mov    ecx,ebx
100030ed:	8d 55 08             	lea    edx,[ebp+0x8]
100030f0:	3b ca                	cmp    ecx,edx
100030f2:	77 3b                	ja     0x1000312f
100030f4:	8b fa                	mov    edi,edx
100030f6:	2b f9                	sub    edi,ecx
100030f8:	c1 ff 02             	sar    edi,0x2
100030fb:	3b 46 18             	cmp    eax,DWORD PTR [esi+0x18]
100030fe:	75 0a                	jne    0x1000310a
10003100:	6a 01                	push   0x1
10003102:	8d 4e 10             	lea    ecx,[esi+0x10]
10003105:	e8 06 ff ff ff       	call   0x10003010
1000310a:	8b 4e 14             	mov    ecx,DWORD PTR [esi+0x14]
1000310d:	85 c9                	test   ecx,ecx
1000310f:	74 36                	je     0x10003147
10003111:	8b 46 10             	mov    eax,DWORD PTR [esi+0x10]
10003114:	8b 04 b8             	mov    eax,DWORD PTR [eax+edi*4]
10003117:	5f                   	pop    edi
10003118:	89 01                	mov    DWORD PTR [ecx],eax
1000311a:	83 46 14 04          	add    DWORD PTR [esi+0x14],0x4
1000311e:	5e                   	pop    esi
1000311f:	5b                   	pop    ebx
10003120:	5d                   	pop    ebp
10003121:	c2 08 00             	ret    0x8
10003124:	68 ec 71 01 10       	push   0x100171ec
10003129:	ff 15 38 70 01 10    	call   DWORD PTR ds:0x10017038
1000312f:	3b 46 18             	cmp    eax,DWORD PTR [esi+0x18]
10003132:	75 0a                	jne    0x1000313e
10003134:	6a 01                	push   0x1
10003136:	8d 4e 10             	lea    ecx,[esi+0x10]
10003139:	e8 d2 fe ff ff       	call   0x10003010
1000313e:	8b 46 14             	mov    eax,DWORD PTR [esi+0x14]
10003141:	85 c0                	test   eax,eax
10003143:	74 02                	je     0x10003147
10003145:	89 38                	mov    DWORD PTR [eax],edi
10003147:	83 46 14 04          	add    DWORD PTR [esi+0x14],0x4
1000314b:	5f                   	pop    edi
1000314c:	5e                   	pop    esi
1000314d:	5b                   	pop    ebx
1000314e:	5d                   	pop    ebp
1000314f:	c2 08 00             	ret    0x8
10003152:	cc                   	int3
10003153:	cc                   	int3
10003154:	cc                   	int3
10003155:	cc                   	int3
10003156:	cc                   	int3
10003157:	cc                   	int3
10003158:	cc                   	int3
10003159:	cc                   	int3
1000315a:	cc                   	int3
1000315b:	cc                   	int3
1000315c:	cc                   	int3
1000315d:	cc                   	int3
1000315e:	cc                   	int3
1000315f:	cc                   	int3

; ==== 0x10003160 endpoint slot getter ====
10003160:	55                   	push   ebp
10003161:	8b ec                	mov    ebp,esp
10003163:	8b 49 04             	mov    ecx,DWORD PTR [ecx+0x4]
10003166:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10003169:	8b 44 81 1c          	mov    eax,DWORD PTR [ecx+eax*4+0x1c]
1000316d:	5d                   	pop    ebp
1000316e:	c2 04 00             	ret    0x4

; ==== 0x10003180 link type getter ====
10003180:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
10003183:	8b 40 28             	mov    eax,DWORD PTR [eax+0x28]
10003186:	c3                   	ret
10003187:	cc                   	int3
10003188:	cc                   	int3
10003189:	cc                   	int3
1000318a:	cc                   	int3
1000318b:	cc                   	int3
1000318c:	cc                   	int3
1000318d:	cc                   	int3
1000318e:	cc                   	int3
1000318f:	cc                   	int3

; ==== 0x1000D050 getAIE1 ====
1000d050:	6a 00                	push   0x0
1000d052:	e8 09 61 ff ff       	call   0x10003160
1000d057:	c3                   	ret

; ==== 0x1000D060 getAIE3 ====
1000d060:	6a 02                	push   0x2
1000d062:	e8 f9 60 ff ff       	call   0x10003160
1000d067:	c3                   	ret

; ==== 0x10003610 getAIE2 ====
10003610:	6a 01                	push   0x1
10003612:	e8 49 fb ff ff       	call   0x10003160
10003617:	c3                   	ret

; Stage 1.17 — SCBinaryLink derived deletion chain
; Source SHA-256: 80ccc6678bdf057152f473369a56eb3b76a1ce643edca2832345f7b53e09c525
; SCBinaryLink vtable 0x100173D4 slot 0 -> 0x1000F740 (from pinned RTTI/vtable inventory).

; ==== 0x1000F740 SCBinaryLink vtable slot-0 scalar deleting destructor ====
1000f740:	55                   	push   ebp
1000f741:	8b ec                	mov    ebp,esp
1000f743:	6a ff                	push   0xffffffff
1000f745:	68 30 66 01 10       	push   0x10016630
1000f74a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000f750:	50                   	push   eax
1000f751:	53                   	push   ebx
1000f752:	56                   	push   esi
1000f753:	57                   	push   edi
1000f754:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000f759:	33 c5                	xor    eax,ebp
1000f75b:	50                   	push   eax
1000f75c:	8d 45 f4             	lea    eax,[ebp-0xc]
1000f75f:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000f765:	8b f1                	mov    esi,ecx
1000f767:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
1000f76a:	f6 c3 02             	test   bl,0x2
1000f76d:	74 43                	je     0x1000f7b2
1000f76f:	68 a0 04 01 10       	push   0x100104a0
1000f774:	ff 76 fc             	push   DWORD PTR [esi-0x4]
1000f777:	8d 7e fc             	lea    edi,[esi-0x4]
1000f77a:	6a 30                	push   0x30
1000f77c:	56                   	push   esi
1000f77d:	e8 87 54 00 00       	call   0x10014c09
1000f782:	f6 c3 01             	test   bl,0x1
1000f785:	74 15                	je     0x1000f79c
1000f787:	8b 0f                	mov    ecx,DWORD PTR [edi]
1000f789:	8d 0c 49             	lea    ecx,[ecx+ecx*2]
1000f78c:	c1 e1 04             	shl    ecx,0x4
1000f78f:	83 c1 04             	add    ecx,0x4
1000f792:	51                   	push   ecx
1000f793:	57                   	push   edi
1000f794:	e8 a6 55 00 00       	call   0x10014d3f
1000f799:	83 c4 08             	add    esp,0x8
1000f79c:	8b c7                	mov    eax,edi
1000f79e:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000f7a1:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000f7a8:	59                   	pop    ecx
1000f7a9:	5f                   	pop    edi
1000f7aa:	5e                   	pop    esi
1000f7ab:	5b                   	pop    ebx
1000f7ac:	8b e5                	mov    esp,ebp
1000f7ae:	5d                   	pop    ebp
1000f7af:	c2 04 00             	ret    0x4
1000f7b2:	e8 e9 0c 00 00       	call   0x100104a0
1000f7b7:	f6 c3 01             	test   bl,0x1
1000f7ba:	74 0b                	je     0x1000f7c7
1000f7bc:	6a 30                	push   0x30
1000f7be:	56                   	push   esi
1000f7bf:	e8 64 55 00 00       	call   0x10014d28
1000f7c4:	83 c4 08             	add    esp,0x8
1000f7c7:	8b c6                	mov    eax,esi
1000f7c9:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000f7cc:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000f7d3:	59                   	pop    ecx
1000f7d4:	5f                   	pop    edi
1000f7d5:	5e                   	pop    esi
1000f7d6:	5b                   	pop    ebx
1000f7d7:	8b e5                	mov    esp,ebp
1000f7d9:	5d                   	pop    ebp
1000f7da:	c2 04 00             	ret    0x4
1000f7dd:	cc                   	int3
1000f7de:	cc                   	int3
1000f7df:	cc                   	int3

; ==== 0x100104A0 SCBinaryLink non-deleting destructor thunk ====
100104a0:	c7 01 d4 73 01 10    	mov    DWORD PTR [ecx],0x100173d4
100104a6:	e9 25 c4 ff ff       	jmp    0x1000c8d0
100104ab:	cc                   	int3
100104ac:	cc                   	int3
100104ad:	cc                   	int3
100104ae:	cc                   	int3
100104af:	cc                   	int3

; ==== 0x1000C8D0 AIEBinaryLink non-deleting destructor ====
1000c8d0:	c7 01 10 73 01 10    	mov    DWORD PTR [ecx],0x10017310
1000c8d6:	e9 c5 65 ff ff       	jmp    0x10002ea0
1000c8db:	cc                   	int3
1000c8dc:	cc                   	int3
1000c8dd:	cc                   	int3
1000c8de:	cc                   	int3
1000c8df:	cc                   	int3

; ==== 0x10002EA0 AElement destructor dispatch to private dtor ====
10002ea0:	56                   	push   esi
10002ea1:	8b f1                	mov    esi,ecx
10002ea3:	57                   	push   edi
10002ea4:	8d 7e 08             	lea    edi,[esi+0x8]
10002ea7:	c7 06 6c 71 01 10    	mov    DWORD PTR [esi],0x1001716c
10002ead:	8b 4f 24             	mov    ecx,DWORD PTR [edi+0x24]
10002eb0:	85 c9                	test   ecx,ecx
10002eb2:	74 15                	je     0x10002ec9
10002eb4:	8b 11                	mov    edx,DWORD PTR [ecx]
10002eb6:	3b cf                	cmp    ecx,edi
10002eb8:	0f 95 c0             	setne  al
10002ebb:	0f b6 c0             	movzx  eax,al
10002ebe:	50                   	push   eax
10002ebf:	ff 52 10             	call   DWORD PTR [edx+0x10]
10002ec2:	c7 47 24 00 00 00 00 	mov    DWORD PTR [edi+0x24],0x0
10002ec9:	5f                   	pop    edi
10002eca:	8b ce                	mov    ecx,esi
10002ecc:	5e                   	pop    esi
10002ecd:	e9 0e 09 00 00       	jmp    0x100037e0
10002ed2:	cc                   	int3
10002ed3:	cc                   	int3
10002ed4:	cc                   	int3
10002ed5:	cc                   	int3
10002ed6:	cc                   	int3
10002ed7:	cc                   	int3
10002ed8:	cc                   	int3
10002ed9:	cc                   	int3
10002eda:	cc                   	int3
10002edb:	cc                   	int3
10002edc:	cc                   	int3
10002edd:	cc                   	int3
10002ede:	cc                   	int3
10002edf:	cc                   	int3

; ==== 0x100037E0 AElementPrivate deleting-dtor dispatch ====
100037e0:	c7 01 04 71 01 10    	mov    DWORD PTR [ecx],0x10017104
100037e6:	8b 49 04             	mov    ecx,DWORD PTR [ecx+0x4]
100037e9:	85 c9                	test   ecx,ecx
100037eb:	74 06                	je     0x100037f3
100037ed:	8b 01                	mov    eax,DWORD PTR [ecx]
100037ef:	6a 01                	push   0x1
100037f1:	ff 10                	call   DWORD PTR [eax]
100037f3:	c3                   	ret
