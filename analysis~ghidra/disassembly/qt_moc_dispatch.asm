; Static GNU objdump excerpts. Addresses are image VAs in the supplied PE32 DLLs.
; These are MOC dispatchers and Qt connect callsites, not source-level decompilation.


; ===== PM_auto.dll: DecompositionWidget static metacall (18 methods) (0x10002e90..0x10002f80) =====
Disassembly of section .text:

10002e90 <.text+0x1e90>:
10002e90:	55                   	push   ebp
10002e91:	8b ec                	mov    ebp,esp
10002e93:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10002e96:	85 c0                	test   eax,eax
10002e98:	0f 85 ec 00 00 00    	jne    0x10002f8a
10002e9e:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
10002ea1:	83 f8 11             	cmp    eax,0x11
10002ea4:	0f 87 07 01 00 00    	ja     0x10002fb1
10002eaa:	ff 24 85 b4 2f 00 10 	jmp    DWORD PTR [eax*4+0x10002fb4]
10002eb1:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
10002eb4:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
10002eb7:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
10002eba:	ff 30                	push   DWORD PTR [eax]
10002ebc:	e8 2f 02 00 00       	call   0x100030f0
10002ec1:	5d                   	pop    ebp
10002ec2:	c3                   	ret
10002ec3:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
10002ec6:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
10002ec9:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
10002ecc:	ff 30                	push   DWORD PTR [eax]
10002ece:	e8 dd 44 00 00       	call   0x100073b0
10002ed3:	5d                   	pop    ebp
10002ed4:	c3                   	ret
10002ed5:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
10002ed8:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
10002edb:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
10002ede:	ff 30                	push   DWORD PTR [eax]
10002ee0:	e8 eb e4 00 00       	call   0x100113d0
10002ee5:	5d                   	pop    ebp
10002ee6:	c3                   	ret
10002ee7:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
10002eea:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
10002eed:	ff 70 04             	push   DWORD PTR [eax+0x4]
10002ef0:	e8 cb e8 00 00       	call   0x100117c0
10002ef5:	5d                   	pop    ebp
10002ef6:	c3                   	ret
10002ef7:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
10002efa:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
10002efd:	ff 70 04             	push   DWORD PTR [eax+0x4]
10002f00:	e8 2b 83 00 00       	call   0x1000b230
10002f05:	5d                   	pop    ebp
10002f06:	c3                   	ret
10002f07:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
10002f0a:	5d                   	pop    ebp
10002f0b:	e9 90 94 00 00       	jmp    0x1000c3a0
10002f10:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
10002f13:	5d                   	pop    ebp
10002f14:	e9 57 99 00 00       	jmp    0x1000c870
10002f19:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
10002f1c:	5d                   	pop    ebp
10002f1d:	e9 3e 8c 00 00       	jmp    0x1000bb60
10002f22:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
10002f25:	5d                   	pop    ebp
10002f26:	e9 45 e5 00 00       	jmp    0x10011470
10002f2b:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
10002f2e:	5d                   	pop    ebp
10002f2f:	e9 4c 93 00 00       	jmp    0x1000c280
10002f34:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
10002f37:	5d                   	pop    ebp
10002f38:	e9 23 92 00 00       	jmp    0x1000c160
10002f3d:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
10002f40:	5d                   	pop    ebp
10002f41:	e9 9a 75 00 00       	jmp    0x1000a4e0
10002f46:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
10002f49:	5d                   	pop    ebp
10002f4a:	e9 c1 69 00 00       	jmp    0x10009910
10002f4f:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
10002f52:	5d                   	pop    ebp
10002f53:	e9 58 70 00 00       	jmp    0x10009fb0
10002f58:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
10002f5b:	5d                   	pop    ebp
10002f5c:	e9 df 70 00 00       	jmp    0x1000a040
10002f61:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
10002f64:	5d                   	pop    ebp
10002f65:	e9 06 fd ff ff       	jmp    0x10002c70
10002f6a:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
10002f6d:	5d                   	pop    ebp
10002f6e:	e9 bd 9e 00 00       	jmp    0x1000ce30
10002f73:	8b 4d 14             	mov    ecx,DWORD PTR [ebp+0x14]
10002f76:	8b 41 08             	mov    eax,DWORD PTR [ecx+0x8]
10002f79:	ff 30                	push   DWORD PTR [eax]
10002f7b:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
10002f7e:	8b                   	.byte 0x8b
10002f7f:	4d                   	dec    ebp

; ===== PM_auto.dll: FunctionalDiagram static metacall (4 signals) (0x100177a0..0x100178a8) =====
Disassembly of section .text:

100177a0 <.text+0x167a0>:
100177a0:	55                   	push   ebp
100177a1:	8b ec                	mov    ebp,esp
100177a3:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
100177a6:	85 c0                	test   eax,eax
100177a8:	75 6a                	jne    0x10017814
100177aa:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
100177ad:	83 f8 03             	cmp    eax,0x3
100177b0:	0f 87 cf 00 00 00    	ja     0x10017885
100177b6:	ff 24 85 88 78 01 10 	jmp    DWORD PTR [eax*4+0x10017888]
100177bd:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
100177c0:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
100177c3:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
100177c6:	ff 30                	push   DWORD PTR [eax]
100177c8:	e8 73 02 00 00       	call   0x10017a40
100177cd:	5d                   	pop    ebp
100177ce:	c3                   	ret
100177cf:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
100177d2:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
100177d5:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
100177d8:	ff 30                	push   DWORD PTR [eax]
100177da:	e8 e1 00 00 00       	call   0x100178c0
100177df:	5d                   	pop    ebp
100177e0:	c3                   	ret
100177e1:	8b 4d 14             	mov    ecx,DWORD PTR [ebp+0x14]
100177e4:	8b 41 08             	mov    eax,DWORD PTR [ecx+0x8]
100177e7:	ff 30                	push   DWORD PTR [eax]
100177e9:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
100177ec:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
100177ef:	ff 30                	push   DWORD PTR [eax]
100177f1:	e8 fa 00 00 00       	call   0x100178f0
100177f6:	5d                   	pop    ebp
100177f7:	c3                   	ret
100177f8:	c7 45 14 00 00 00 00 	mov    DWORD PTR [ebp+0x14],0x0
100177ff:	c7 45 10 03 00 00 00 	mov    DWORD PTR [ebp+0x10],0x3
10017806:	c7 45 0c 90 bc 05 10 	mov    DWORD PTR [ebp+0xc],0x1005bc90
1001780d:	5d                   	pop    ebp
1001780e:	ff 25 44 24 02 10    	jmp    DWORD PTR ds:0x10022444
10017814:	83 f8 0a             	cmp    eax,0xa
10017817:	75 6c                	jne    0x10017885
10017819:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
1001781c:	8b 48 04             	mov    ecx,DWORD PTR [eax+0x4]
1001781f:	8b 10                	mov    edx,DWORD PTR [eax]
10017821:	8b 01                	mov    eax,DWORD PTR [ecx]
10017823:	3d 40 7a 01 10       	cmp    eax,0x10017a40
10017828:	75 12                	jne    0x1001783c
1001782a:	85 c0                	test   eax,eax
1001782c:	74 06                	je     0x10017834
1001782e:	83 79 04 00          	cmp    DWORD PTR [ecx+0x4],0x0
10017832:	75 08                	jne    0x1001783c
10017834:	c7 02 00 00 00 00    	mov    DWORD PTR [edx],0x0
1001783a:	5d                   	pop    ebp
1001783b:	c3                   	ret
1001783c:	3d c0 78 01 10       	cmp    eax,0x100178c0
10017841:	75 12                	jne    0x10017855
10017843:	85 c0                	test   eax,eax
10017845:	74 06                	je     0x1001784d
10017847:	83 79 04 00          	cmp    DWORD PTR [ecx+0x4],0x0
1001784b:	75 08                	jne    0x10017855
1001784d:	c7 02 01 00 00 00    	mov    DWORD PTR [edx],0x1
10017853:	5d                   	pop    ebp
10017854:	c3                   	ret
10017855:	3d f0 78 01 10       	cmp    eax,0x100178f0
1001785a:	75 12                	jne    0x1001786e
1001785c:	85 c0                	test   eax,eax
1001785e:	74 06                	je     0x10017866
10017860:	83 79 04 00          	cmp    DWORD PTR [ecx+0x4],0x0
10017864:	75 08                	jne    0x1001786e
10017866:	c7 02 02 00 00 00    	mov    DWORD PTR [edx],0x2
1001786c:	5d                   	pop    ebp
1001786d:	c3                   	ret
1001786e:	3d a0 78 01 10       	cmp    eax,0x100178a0
10017873:	75 10                	jne    0x10017885
10017875:	85 c0                	test   eax,eax
10017877:	74 06                	je     0x1001787f
10017879:	83 79 04 00          	cmp    DWORD PTR [ecx+0x4],0x0
1001787d:	75 06                	jne    0x10017885
1001787f:	c7 02 03 00 00 00    	mov    DWORD PTR [edx],0x3
10017885:	5d                   	pop    ebp
10017886:	c3                   	ret
10017887:	90                   	nop
10017888:	bd 77 01 10 cf       	mov    ebp,0xcf100177
1001788d:	77 01                	ja     0x10017890
1001788f:	10 e1                	adc    cl,ah
10017891:	77 01                	ja     0x10017894
10017893:	10 f8                	adc    al,bh
10017895:	77 01                	ja     0x10017898
10017897:	10 cc                	adc    ah,cl
10017899:	cc                   	int3
1001789a:	cc                   	int3
1001789b:	cc                   	int3
1001789c:	cc                   	int3
1001789d:	cc                   	int3
1001789e:	cc                   	int3
1001789f:	cc                   	int3
100178a0:	6a 00                	push   0x0
100178a2:	6a 03                	push   0x3
100178a4:	68                   	.byte 0x68
100178a5:	90                   	nop
100178a6:	bc                   	.byte 0xbc
100178a7:	05                   	.byte 0x5

; ===== PM_auto.dll: BaseDiagram static metacall (0x1001c590..0x1001c5b0) =====
Disassembly of section .text:

1001c590 <.text+0x1b590>:
1001c590:	55                   	push   ebp
1001c591:	8b ec                	mov    ebp,esp
1001c593:	83 7d 0c 00          	cmp    DWORD PTR [ebp+0xc],0x0
1001c597:	75 0f                	jne    0x1001c5a8
1001c599:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
1001c59d:	75 09                	jne    0x1001c5a8
1001c59f:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
1001c5a2:	5d                   	pop    ebp
1001c5a3:	e9 48 fb ff ff       	jmp    0x1001c0f0
1001c5a8:	5d                   	pop    ebp
1001c5a9:	c3                   	ret
1001c5aa:	cc                   	int3
1001c5ab:	cc                   	int3
1001c5ac:	cc                   	int3
1001c5ad:	cc                   	int3
1001c5ae:	cc                   	int3
1001c5af:	cc                   	int3

; ===== PM_auto.dll: CbWithBtn and CbWithBtnContainer static metacalls (0x1001c900..0x1001c93a) =====
Disassembly of section .text:

1001c900 <.text+0x1b900>:
1001c900:	55                   	push   ebp
1001c901:	8b ec                	mov    ebp,esp
1001c903:	83 7d 0c 00          	cmp    DWORD PTR [ebp+0xc],0x0
1001c907:	75 0f                	jne    0x1001c918
1001c909:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
1001c90d:	75 09                	jne    0x1001c918
1001c90f:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
1001c912:	5d                   	pop    ebp
1001c913:	e9 58 63 fe ff       	jmp    0x10002c70
1001c918:	5d                   	pop    ebp
1001c919:	c3                   	ret
1001c91a:	cc                   	int3
1001c91b:	cc                   	int3
1001c91c:	cc                   	int3
1001c91d:	cc                   	int3
1001c91e:	cc                   	int3
1001c91f:	cc                   	int3
1001c920:	55                   	push   ebp
1001c921:	8b ec                	mov    ebp,esp
1001c923:	83 7d 0c 00          	cmp    DWORD PTR [ebp+0xc],0x0
1001c927:	75 0f                	jne    0x1001c938
1001c929:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
1001c92d:	75 09                	jne    0x1001c938
1001c92f:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
1001c932:	5d                   	pop    ebp
1001c933:	e9 48 ed ff ff       	jmp    0x1001b680
1001c938:	5d                   	pop    ebp
1001c939:	c3                   	ret

; ===== PM_params.dll: ObjectsEditWidget and ParamsWidget static metacalls (0x10001190..0x10001240) =====
Disassembly of section .text:

10001190 <.text+0x190>:
10001190:	55                   	push   ebp
10001191:	8b ec                	mov    ebp,esp
10001193:	83 7d 0c 00          	cmp    DWORD PTR [ebp+0xc],0x0
10001197:	75 33                	jne    0x100011cc
10001199:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
1000119c:	83 f8 03             	cmp    eax,0x3
1000119f:	77 2b                	ja     0x100011cc
100011a1:	ff 24 85 d0 11 00 10 	jmp    DWORD PTR [eax*4+0x100011d0]
100011a8:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
100011ab:	5d                   	pop    ebp
100011ac:	e9 9f 12 00 00       	jmp    0x10002450
100011b1:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
100011b4:	5d                   	pop    ebp
100011b5:	e9 16 10 00 00       	jmp    0x100021d0
100011ba:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
100011bd:	5d                   	pop    ebp
100011be:	e9 dd 14 00 00       	jmp    0x100026a0
100011c3:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
100011c6:	5d                   	pop    ebp
100011c7:	e9 e4 13 00 00       	jmp    0x100025b0
100011cc:	5d                   	pop    ebp
100011cd:	c3                   	ret
100011ce:	66 90                	xchg   ax,ax
100011d0:	a8 11                	test   al,0x11
100011d2:	00 10                	add    BYTE PTR [eax],dl
100011d4:	b1 11                	mov    cl,0x11
100011d6:	00 10                	add    BYTE PTR [eax],dl
100011d8:	ba 11 00 10 c3       	mov    edx,0xc3100011
100011dd:	11 00                	adc    DWORD PTR [eax],eax
100011df:	10 55 8b             	adc    BYTE PTR [ebp-0x75],dl
100011e2:	ec                   	in     al,dx
100011e3:	83 7d 0c 00          	cmp    DWORD PTR [ebp+0xc],0x0
100011e7:	75 1d                	jne    0x10001206
100011e9:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
100011ec:	83 f8 03             	cmp    eax,0x3
100011ef:	77 15                	ja     0x10001206
100011f1:	ff 24 85 24 12 00 10 	jmp    DWORD PTR [eax*4+0x10001224]
100011f8:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
100011fb:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
100011fe:	ff 70 04             	push   DWORD PTR [eax+0x4]
10001201:	e8 3a 44 00 00       	call   0x10005640
10001206:	5d                   	pop    ebp
10001207:	c3                   	ret
10001208:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
1000120b:	5d                   	pop    ebp
1000120c:	e9 bf 47 00 00       	jmp    0x100059d0
10001211:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
10001214:	5d                   	pop    ebp
10001215:	e9 36 44 00 00       	jmp    0x10005650
1000121a:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
1000121d:	5d                   	pop    ebp
1000121e:	e9 1d 49 00 00       	jmp    0x10005b40
10001223:	90                   	nop
10001224:	f8                   	clc
10001225:	11 00                	adc    DWORD PTR [eax],eax
10001227:	10 08                	adc    BYTE PTR [eax],cl
10001229:	12 00                	adc    al,BYTE PTR [eax]
1000122b:	10 11                	adc    BYTE PTR [ecx],dl
1000122d:	12 00                	adc    al,BYTE PTR [eax]
1000122f:	10 1a                	adc    BYTE PTR [edx],bl
10001231:	12 00                	adc    al,BYTE PTR [eax]
10001233:	10 cc                	adc    ah,cl
10001235:	cc                   	int3
10001236:	cc                   	int3
10001237:	cc                   	int3
10001238:	cc                   	int3
10001239:	cc                   	int3
1000123a:	cc                   	int3
1000123b:	cc                   	int3
1000123c:	cc                   	int3
1000123d:	cc                   	int3
1000123e:	cc                   	int3
1000123f:	cc                   	int3

; ===== PM_spec_WEB.dll: Am_spec_widget static metacall (0x100065d0..0x100065f5) =====
Disassembly of section .text:

100065d0 <.text+0x55d0>:
100065d0:	55                   	push   ebp
100065d1:	8b ec                	mov    ebp,esp
100065d3:	83 7d 0c 00          	cmp    DWORD PTR [ebp+0xc],0x0
100065d7:	75 16                	jne    0x100065ef
100065d9:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
100065dd:	75 10                	jne    0x100065ef
100065df:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
100065e2:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
100065e5:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
100065e8:	ff 30                	push   DWORD PTR [eax]
100065ea:	e8 a1 12 00 00       	call   0x10007890
100065ef:	5d                   	pop    ebp
100065f0:	c3                   	ret
100065f1:	cc                   	int3
100065f2:	cc                   	int3
100065f3:	cc                   	int3
100065f4:	cc                   	int3

; ===== Model_Visualiser.dll: Deca::QDecomposeTab signal activation (0x100073e0..0x100074a0) =====
Disassembly of section .text:

100073e0 <.text+0x63e0>:
100073e0:	55                   	push   ebp
100073e1:	8b ec                	mov    ebp,esp
100073e3:	6a ff                	push   0xffffffff
100073e5:	68 b9 b9 00 10       	push   0x1000b9b9
100073ea:	64 a1 00 00 00 00    	mov    eax,fs:0x0
100073f0:	50                   	push   eax
100073f1:	83 ec 08             	sub    esp,0x8
100073f4:	a1 6c 50 01 10       	mov    eax,ds:0x1001506c
100073f9:	33 c5                	xor    eax,ebp
100073fb:	50                   	push   eax
100073fc:	8d 45 f4             	lea    eax,[ebp-0xc]
100073ff:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10007405:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10007408:	85 c0                	test   eax,eax
1000740a:	75 57                	jne    0x10007463
1000740c:	39 45 10             	cmp    DWORD PTR [ebp+0x10],eax
1000740f:	75 79                	jne    0x1000748a
10007411:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
10007414:	8d 4d 0c             	lea    ecx,[ebp+0xc]
10007417:	ff 70 04             	push   DWORD PTR [eax+0x4]
1000741a:	ff 15 6c d1 00 10    	call   DWORD PTR ds:0x1000d16c
10007420:	8d 45 0c             	lea    eax,[ebp+0xc]
10007423:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000742a:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
1000742d:	8d 45 ec             	lea    eax,[ebp-0x14]
10007430:	50                   	push   eax
10007431:	6a 00                	push   0x0
10007433:	68 18 50 01 10       	push   0x10015018
10007438:	ff 75 08             	push   DWORD PTR [ebp+0x8]
1000743b:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
10007442:	ff 15 b8 d0 00 10    	call   DWORD PTR ds:0x1000d0b8
10007448:	83 c4 10             	add    esp,0x10
1000744b:	8d 4d 0c             	lea    ecx,[ebp+0xc]
1000744e:	ff 15 68 d1 00 10    	call   DWORD PTR ds:0x1000d168
10007454:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10007457:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000745e:	59                   	pop    ecx
1000745f:	8b e5                	mov    esp,ebp
10007461:	5d                   	pop    ebp
10007462:	c3                   	ret
10007463:	83 f8 0a             	cmp    eax,0xa
10007466:	75 22                	jne    0x1000748a
10007468:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
1000746b:	8b 10                	mov    edx,DWORD PTR [eax]
1000746d:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
10007470:	8b 08                	mov    ecx,DWORD PTR [eax]
10007472:	81 f9 80 72 00 10    	cmp    ecx,0x10007280
10007478:	75 10                	jne    0x1000748a
1000747a:	85 c9                	test   ecx,ecx
1000747c:	74 06                	je     0x10007484
1000747e:	83 78 04 00          	cmp    DWORD PTR [eax+0x4],0x0
10007482:	75 06                	jne    0x1000748a
10007484:	c7 02 00 00 00 00    	mov    DWORD PTR [edx],0x0
1000748a:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000748d:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10007494:	59                   	pop    ecx
10007495:	8b e5                	mov    esp,ebp
10007497:	5d                   	pop    ebp
10007498:	c3                   	ret
10007499:	cc                   	int3
1000749a:	cc                   	int3
1000749b:	cc                   	int3
1000749c:	cc                   	int3
1000749d:	cc                   	int3
1000749e:	cc                   	int3
1000749f:	cc                   	int3

; ===== Model_Visualiser.dll: Model_Visualiser static metacall (9 slots) (0x100074a0..0x10007570) =====
Disassembly of section .text:

100074a0 <.text+0x64a0>:
100074a0:	55                   	push   ebp
100074a1:	8b ec                	mov    ebp,esp
100074a3:	83 7d 0c 00          	cmp    DWORD PTR [ebp+0xc],0x0
100074a7:	0f 85 98 00 00 00    	jne    0x10007545
100074ad:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
100074b0:	83 f8 08             	cmp    eax,0x8
100074b3:	0f 87 8c 00 00 00    	ja     0x10007545
100074b9:	ff 24 85 48 75 00 10 	jmp    DWORD PTR [eax*4+0x10007548]
100074c0:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
100074c3:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
100074c6:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
100074c9:	ff 30                	push   DWORD PTR [eax]
100074cb:	e8 10 19 00 00       	call   0x10008de0
100074d0:	5d                   	pop    ebp
100074d1:	c3                   	ret
100074d2:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
100074d5:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
100074d8:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
100074db:	0f b6 00             	movzx  eax,BYTE PTR [eax]
100074de:	50                   	push   eax
100074df:	e8 bc 18 00 00       	call   0x10008da0
100074e4:	5d                   	pop    ebp
100074e5:	c3                   	ret
100074e6:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
100074e9:	5d                   	pop    ebp
100074ea:	e9 51 17 00 00       	jmp    0x10008c40
100074ef:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
100074f2:	5d                   	pop    ebp
100074f3:	e9 48 14 00 00       	jmp    0x10008940
100074f8:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
100074fb:	51                   	push   ecx
100074fc:	8b cc                	mov    ecx,esp
100074fe:	ff 70 04             	push   DWORD PTR [eax+0x4]
10007501:	ff 15 6c d1 00 10    	call   DWORD PTR ds:0x1000d16c
10007507:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
1000750a:	e8 c1 0b 00 00       	call   0x100080d0
1000750f:	5d                   	pop    ebp
10007510:	c3                   	ret
10007511:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
10007514:	5d                   	pop    ebp
10007515:	e9 a6 13 00 00       	jmp    0x100088c0
1000751a:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
1000751d:	5d                   	pop    ebp
1000751e:	e9 dd 13 00 00       	jmp    0x10008900
10007523:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
10007526:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
10007529:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
1000752c:	ff 30                	push   DWORD PTR [eax]
1000752e:	e8 0d 13 00 00       	call   0x10008840
10007533:	5d                   	pop    ebp
10007534:	c3                   	ret
10007535:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
10007538:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
1000753b:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
1000753e:	ff 30                	push   DWORD PTR [eax]
10007540:	e8 3b 13 00 00       	call   0x10008880
10007545:	5d                   	pop    ebp
10007546:	c3                   	ret
10007547:	90                   	nop
10007548:	c0 74 00 10 d2       	shl    BYTE PTR [eax+eax*1+0x10],0xd2
1000754d:	74 00                	je     0x1000754f
1000754f:	10 e6                	adc    dh,ah
10007551:	74 00                	je     0x10007553
10007553:	10 ef                	adc    bh,ch
10007555:	74 00                	je     0x10007557
10007557:	10 f8                	adc    al,bh
10007559:	74 00                	je     0x1000755b
1000755b:	10 11                	adc    BYTE PTR [ecx],dl
1000755d:	75 00                	jne    0x1000755f
1000755f:	10 1a                	adc    BYTE PTR [edx],bl
10007561:	75 00                	jne    0x10007563
10007563:	10 23                	adc    BYTE PTR [ebx],ah
10007565:	75 00                	jne    0x10007567
10007567:	10 35 75 00 10 cc    	adc    BYTE PTR ds:0xcc100075,dh
1000756d:	cc                   	int3
1000756e:	cc                   	int3
1000756f:	cc                   	int3

; ===== Model_Visualiser.dll: Model_Visualiser QObject::connect signal/slot pair (first callsite) (0x10007c49..0x10007c65) =====
Disassembly of section .text:

10007c49 <.text+0x6c49>:
10007c49:	6a 00                	push   0x0
10007c4b:	68 34 e6 00 10       	push   0x1000e634
10007c50:	53                   	push   ebx
10007c51:	68 50 e6 00 10       	push   0x1000e650
10007c56:	8d 45 e8             	lea    eax,[ebp-0x18]
10007c59:	57                   	push   edi
10007c5a:	50                   	push   eax
10007c5b:	ff 15 fc d0 00 10    	call   DWORD PTR ds:0x1000d0fc
10007c61:	83 c4 18             	add    esp,0x18
10007c64:	8d                   	.byte 0x8d

; ===== Model_Visualiser.dll: Model_Visualiser QObject::connect signal/slot pair (second callsite) (0x10007e6e..0x10007e8b) =====
Disassembly of section .text:

10007e6e <.text+0x6e6e>:
10007e6e:	6a 00                	push   0x0
10007e70:	68 34 e6 00 10       	push   0x1000e634
10007e75:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
10007e78:	8d 45 e0             	lea    eax,[ebp-0x20]
10007e7b:	68 50 e6 00 10       	push   0x1000e650
10007e80:	57                   	push   edi
10007e81:	50                   	push   eax
10007e82:	ff 15 fc d0 00 10    	call   DWORD PTR ds:0x1000d0fc
10007e88:	83 c4 18             	add    esp,0x18

; ===== PM_auto.dll: PM_auto legacy QObject::connect signal/slot callsites (0x10004bb0..0x10004c30) =====
Disassembly of section .text:

10004bb0 <.text+0x3bb0>:
10004bb0:	f8                   	clc
10004bb1:	23 02                	and    eax,DWORD PTR [edx]
10004bb3:	10 8d 45 c4 6a 00    	adc    BYTE PTR [ebp+0x6ac445],cl
10004bb9:	68 e8 ac 05 10       	push   0x1005ace8
10004bbe:	53                   	push   ebx
10004bbf:	68 00 ad 05 10       	push   0x1005ad00
10004bc4:	ff b3 fc 00 00 00    	push   DWORD PTR [ebx+0xfc]
10004bca:	50                   	push   eax
10004bcb:	ff d6                	call   esi
10004bcd:	8b 3d ac 23 02 10    	mov    edi,DWORD PTR ds:0x100223ac
10004bd3:	8d 4d c4             	lea    ecx,[ebp-0x3c]
10004bd6:	83 c4 18             	add    esp,0x18
10004bd9:	ff d7                	call   edi
10004bdb:	6a 00                	push   0x0
10004bdd:	68 18 ad 05 10       	push   0x1005ad18
10004be2:	53                   	push   ebx
10004be3:	68 44 ad 05 10       	push   0x1005ad44
10004be8:	ff b3 ec 00 00 00    	push   DWORD PTR [ebx+0xec]
10004bee:	8d 45 c4             	lea    eax,[ebp-0x3c]
10004bf1:	50                   	push   eax
10004bf2:	ff d6                	call   esi
10004bf4:	83 c4 18             	add    esp,0x18
10004bf7:	8d 4d c4             	lea    ecx,[ebp-0x3c]
10004bfa:	ff d7                	call   edi
10004bfc:	6a 00                	push   0x0
10004bfe:	68 68 ad 05 10       	push   0x1005ad68
10004c03:	53                   	push   ebx
10004c04:	68 44 ad 05 10       	push   0x1005ad44
10004c09:	ff b3 f8 00 00 00    	push   DWORD PTR [ebx+0xf8]
10004c0f:	8d 45 c4             	lea    eax,[ebp-0x3c]
10004c12:	50                   	push   eax
10004c13:	ff d6                	call   esi
10004c15:	83 c4 18             	add    esp,0x18
10004c18:	8d 4d c4             	lea    ecx,[ebp-0x3c]
10004c1b:	ff d7                	call   edi
10004c1d:	8b 35 a8 29 02 10    	mov    esi,DWORD PTR ds:0x100229a8
10004c23:	8d 45 c4             	lea    eax,[ebp-0x3c]
10004c26:	6a 00                	push   0x0
10004c28:	6a 00                	push   0x0
10004c2a:	68 70 c8 00 10       	push   0x1000c870
10004c2f:	53                   	push   ebx
