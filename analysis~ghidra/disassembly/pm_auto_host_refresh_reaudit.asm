
; ===== IS.exe host_context_allocate 0x4050f0..0x40511e =====

/mnt/data/work_stage117/re_inputs/IS.exe:     file format pei-i386


Disassembly of section .text:

004050f0 <.text+0x40f0>:
  4050f0:	56                   	push   esi
  4050f1:	6a 14                	push   0x14
  4050f3:	e8 91 f6 00 00       	call   0x414789
  4050f8:	8b f0                	mov    esi,eax
  4050fa:	83 c4 04             	add    esp,0x4
  4050fd:	85 f6                	test   esi,esi
  4050ff:	74 11                	je     0x405112
  405101:	8d 4e 04             	lea    ecx,[esi+0x4]
  405104:	ff 15 2c 94 41 00    	call   DWORD PTR ds:0x41942c
  40510a:	89 35 ac 96 46 00    	mov    DWORD PTR ds:0x4696ac,esi
  405110:	5e                   	pop    esi
  405111:	c3                   	ret
  405112:	c7 05 ac 96 46 00 00 	mov    DWORD PTR ds:0x4696ac,0x0
  405119:	00 00 00 
  40511c:	5e                   	pop    esi
  40511d:	c3                   	ret


; ===== IS.exe app_state_primary_model 0x408ef6..0x408f50 =====

/mnt/data/work_stage117/re_inputs/IS.exe:     file format pei-i386


Disassembly of section .text:

00408ef6 <.text+0x7ef6>:
  408ef6:	a1 ac 96 46 00       	mov    eax,ds:0x4696ac
  408efb:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  408f01:	6a 0c                	push   0xc
  408f03:	89 08                	mov    DWORD PTR [eax],ecx
  408f05:	e8 7f b8 00 00       	call   0x414789
  408f0a:	8b f0                	mov    esi,eax
  408f0c:	83 c4 04             	add    esp,0x4
  408f0f:	89 75 88             	mov    DWORD PTR [ebp-0x78],esi
  408f12:	c6 45 fc 13          	mov    BYTE PTR [ebp-0x4],0x13
  408f16:	85 f6                	test   esi,esi
  408f18:	74 10                	je     0x408f2a
  408f1a:	8b ce                	mov    ecx,esi
  408f1c:	ff 15 08 91 41 00    	call   DWORD PTR ds:0x419108
  408f22:	c7 06 78 79 45 00    	mov    DWORD PTR [esi],0x457978
  408f28:	eb 02                	jmp    0x408f2c
  408f2a:	33 f6                	xor    esi,esi
  408f2c:	a1 a4 96 46 00       	mov    eax,ds:0x4696a4
  408f31:	8b 1d a8 93 41 00    	mov    ebx,DWORD PTR ds:0x4193a8
  408f37:	6a 06                	push   0x6
  408f39:	68 24 7a 45 00       	push   0x457a24
  408f3e:	c6 45 fc 0a          	mov    BYTE PTR [ebp-0x4],0xa
  408f42:	89 70 08             	mov    DWORD PTR [eax+0x8],esi
  408f45:	ff d3                	call   ebx
  408f47:	83 c4 08             	add    esp,0x8
  408f4a:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
  408f4d:	8d 45 dc             	lea    eax,[ebp-0x24]


; ===== IS.exe host_widget_register 0x410b10..0x410b4c =====

/mnt/data/work_stage117/re_inputs/IS.exe:     file format pei-i386


Disassembly of section .text:

00410b10 <.text+0xfb10>:
  410b10:	55                   	push   ebp
  410b11:	8b ec                	mov    ebp,esp
  410b13:	83 ec 08             	sub    esp,0x8
  410b16:	56                   	push   esi
  410b17:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
  410b1a:	57                   	push   edi
  410b1b:	8b f9                	mov    edi,ecx
  410b1d:	8b ce                	mov    ecx,esi
  410b1f:	89 7d fc             	mov    DWORD PTR [ebp-0x4],edi
  410b22:	ff 15 ec 97 41 00    	call   DWORD PTR ds:0x4197ec
  410b28:	8b 06                	mov    eax,DWORD PTR [esi]
  410b2a:	8b ce                	mov    ecx,esi
  410b2c:	ff 35 ac 96 46 00    	push   DWORD PTR ds:0x4696ac
  410b32:	ff 90 cc 00 00 00    	call   DWORD PTR [eax+0xcc]
  410b38:	8b 06                	mov    eax,DWORD PTR [esi]
  410b3a:	8b ce                	mov    ecx,esi
  410b3c:	ff 90 c8 00 00 00    	call   DWORD PTR [eax+0xc8]
  410b42:	8b 06                	mov    eax,DWORD PTR [esi]
  410b44:	8b ce                	mov    ecx,esi
  410b46:	ff 90 b8 00 00 00    	call   DWORD PTR [eax+0xb8]


; ===== IS.exe host_tab_changed 0x4115c0..0x411692 =====

/mnt/data/work_stage117/re_inputs/IS.exe:     file format pei-i386


Disassembly of section .text:

004115c0 <.text+0x105c0>:
  4115c0:	55                   	push   ebp
  4115c1:	8b ec                	mov    ebp,esp
  4115c3:	6a ff                	push   0xffffffff
  4115c5:	68 5e 81 41 00       	push   0x41815e
  4115ca:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  4115d0:	50                   	push   eax
  4115d1:	83 ec 10             	sub    esp,0x10
  4115d4:	53                   	push   ebx
  4115d5:	56                   	push   esi
  4115d6:	57                   	push   edi
  4115d7:	a1 cc 90 46 00       	mov    eax,ds:0x4690cc
  4115dc:	33 c5                	xor    eax,ebp
  4115de:	50                   	push   eax
  4115df:	8d 45 f4             	lea    eax,[ebp-0xc]
  4115e2:	64 a3 00 00 00 00    	mov    fs:0x0,eax
  4115e8:	8b f9                	mov    edi,ecx
  4115ea:	8d 47 30             	lea    eax,[edi+0x30]
  4115ed:	50                   	push   eax
  4115ee:	8d 45 e4             	lea    eax,[ebp-0x1c]
  4115f1:	50                   	push   eax
  4115f2:	e8 d9 24 ff ff       	call   0x403ad0
  4115f7:	83 c4 08             	add    esp,0x8
  4115fa:	8b 75 f0             	mov    esi,DWORD PTR [ebp-0x10]
  4115fd:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
  411604:	85 f6                	test   esi,esi
  411606:	74 2e                	je     0x411636
  411608:	8b 1d ec 97 41 00    	mov    ebx,DWORD PTR ds:0x4197ec
  41160e:	8b 55 e8             	mov    edx,DWORD PTR [ebp-0x18]
  411611:	3b 55 ec             	cmp    edx,DWORD PTR [ebp-0x14]
  411614:	0f 95 c0             	setne  al
  411617:	84 c0                	test   al,al
  411619:	74 1b                	je     0x411636
  41161b:	8b 0a                	mov    ecx,DWORD PTR [edx]
  41161d:	85 f6                	test   esi,esi
  41161f:	74 07                	je     0x411628
  411621:	ff d3                	call   ebx
  411623:	8b 55 e8             	mov    edx,DWORD PTR [ebp-0x18]
  411626:	33 f6                	xor    esi,esi
  411628:	83 c2 04             	add    edx,0x4
  41162b:	83 f6 01             	xor    esi,0x1
  41162e:	89 55 e8             	mov    DWORD PTR [ebp-0x18],edx
  411631:	89 75 f0             	mov    DWORD PTR [ebp-0x10],esi
  411634:	75 db                	jne    0x411611
  411636:	8b 4d e4             	mov    ecx,DWORD PTR [ebp-0x1c]
  411639:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [ebp-0x4],0x1
  411640:	8b 01                	mov    eax,DWORD PTR [ecx]
  411642:	85 c0                	test   eax,eax
  411644:	74 16                	je     0x41165c
  411646:	83 f8 ff             	cmp    eax,0xffffffff
  411649:	74 1b                	je     0x411666
  41164b:	83 c8 ff             	or     eax,0xffffffff
  41164e:	f0 0f c1 01          	lock xadd DWORD PTR [ecx],eax
  411652:	0f 95 c0             	setne  al
  411655:	84 c0                	test   al,al
  411657:	75 0d                	jne    0x411666
  411659:	8b 4d e4             	mov    ecx,DWORD PTR [ebp-0x1c]
  41165c:	51                   	push   ecx
  41165d:	ff 15 98 93 41 00    	call   DWORD PTR ds:0x419398
  411663:	83 c4 04             	add    esp,0x4
  411666:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
  411669:	8b 8f 80 00 00 00    	mov    ecx,DWORD PTR [edi+0x80]
  41166f:	56                   	push   esi
  411670:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
  411677:	ff 15 8c 98 41 00    	call   DWORD PTR ds:0x41988c
  41167d:	8b 58 18             	mov    ebx,DWORD PTR [eax+0x18]
  411680:	8b cb                	mov    ecx,ebx
  411682:	ff 15 e8 97 41 00    	call   DWORD PTR ds:0x4197e8
  411688:	8b 03                	mov    eax,DWORD PTR [ebx]
  41168a:	8b cb                	mov    ecx,ebx
  41168c:	ff 90 bc 00 00 00    	call   DWORD PTR [eax+0xbc]


; ===== PM_auto.dll pm_auto_context_getter 0x10002bd0..0x10002beb =====

/mnt/data/work_stage117/re_inputs/modules/PM_auto.dll:     file format pei-i386


Disassembly of section .text:

10002bd0 <.text+0x1bd0>:
10002bd0:	a1 2c 05 07 10       	mov    eax,ds:0x1007052c
10002bd5:	8b 00                	mov    eax,DWORD PTR [eax]
10002bd7:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
10002bda:	c3                   	ret
10002bdb:	cc                   	int3
10002bdc:	cc                   	int3
10002bdd:	cc                   	int3
10002bde:	cc                   	int3
10002bdf:	cc                   	int3
10002be0:	55                   	push   ebp
10002be1:	8b ec                	mov    ebp,esp
10002be3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10002be6:	a3 2c 05 07 10       	mov    ds:0x1007052c,eax


; ===== PM_auto.dll pm_auto_context_setter 0x10002be0..0x10002bed =====

/mnt/data/work_stage117/re_inputs/modules/PM_auto.dll:     file format pei-i386


Disassembly of section .text:

10002be0 <.text+0x1be0>:
10002be0:	55                   	push   ebp
10002be1:	8b ec                	mov    ebp,esp
10002be3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10002be6:	a3 2c 05 07 10       	mov    ds:0x1007052c,eax
10002beb:	5d                   	pop    ebp
10002bec:	c3                   	ret


; ===== PM_auto.dll pm_auto_model_binding 0x100019b0..0x100019ca =====

/mnt/data/work_stage117/re_inputs/modules/PM_auto.dll:     file format pei-i386


Disassembly of section .text:

100019b0 <.text+0x9b0>:
100019b0:	56                   	push   esi
100019b1:	6a 00                	push   0x0
100019b3:	8b f1                	mov    esi,ecx
100019b5:	e8 16 12 00 00       	call   0x10002bd0
100019ba:	50                   	push   eax
100019bb:	8b ce                	mov    ecx,esi
100019bd:	e8 ae cc 00 00       	call   0x1000e670
100019c2:	8b ce                	mov    ecx,esi
100019c4:	5e                   	pop    esi
100019c5:	e9 b6 68 00 00       	jmp    0x10008280


; ===== PM_auto.dll pm_auto_model_pointer_store 0x1000e670..0x1000e689 =====

/mnt/data/work_stage117/re_inputs/modules/PM_auto.dll:     file format pei-i386


Disassembly of section .text:

1000e670 <.text+0xd670>:
1000e670:	55                   	push   ebp
1000e671:	8b ec                	mov    ebp,esp
1000e673:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000e676:	89 81 1c 01 00 00    	mov    DWORD PTR [ecx+0x11c],eax
1000e67c:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
1000e67f:	89 81 18 01 00 00    	mov    DWORD PTR [ecx+0x118],eax
1000e685:	5d                   	pop    ebp
1000e686:	c2 08 00             	ret    0x8


; ===== PM_auto.dll pm_auto_refresh 0x100019d0..0x10002082 =====

/mnt/data/work_stage117/re_inputs/modules/PM_auto.dll:     file format pei-i386


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
10002081:	8b                   	.byte 0x8b


; ===== PM_auto.dll pm_auto_base_workwidget_stub 0x10002c70..0x10002c72 =====

/mnt/data/work_stage117/re_inputs/modules/PM_auto.dll:     file format pei-i386


Disassembly of section .text:

10002c70 <.text+0x1c70>:
10002c70:	c3                   	ret
10002c71:	cc                   	int3


; ===== PM_params.dll pm_params_context_getter 0x10007c70..0x10007c7b =====

/mnt/data/work_stage117/re_inputs/modules/PM_params.dll:     file format pei-i386


Disassembly of section .text:

10007c70 <.text+0x6c70>:
10007c70:	a1 44 35 02 10       	mov    eax,ds:0x10023544
10007c75:	8b 00                	mov    eax,DWORD PTR [eax]
10007c77:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
10007c7a:	c3                   	ret


; ===== PM_params.dll pm_params_context_setter 0x10007c80..0x10007c8d =====

/mnt/data/work_stage117/re_inputs/modules/PM_params.dll:     file format pei-i386


Disassembly of section .text:

10007c80 <.text+0x6c80>:
10007c80:	55                   	push   ebp
10007c81:	8b ec                	mov    ebp,esp
10007c83:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10007c86:	a3 44 35 02 10       	mov    ds:0x10023544,eax
10007c8b:	5d                   	pop    ebp
10007c8c:	c3                   	ret


; ===== PM_params.dll pm_params_primary_model_use 0x10004510..0x10004570 =====

/mnt/data/work_stage117/re_inputs/modules/PM_params.dll:     file format pei-i386


Disassembly of section .text:

10004510 <.text+0x3510>:
10004510:	55                   	push   ebp
10004511:	8b ec                	mov    ebp,esp
10004513:	6a ff                	push   0xffffffff
10004515:	68 89 95 00 10       	push   0x10009589
1000451a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10004520:	50                   	push   eax
10004521:	81 ec ac 02 00 00    	sub    esp,0x2ac
10004527:	53                   	push   ebx
10004528:	56                   	push   esi
10004529:	57                   	push   edi
1000452a:	a1 50 30 02 10       	mov    eax,ds:0x10023050
1000452f:	33 c5                	xor    eax,ebp
10004531:	50                   	push   eax
10004532:	8d 45 f4             	lea    eax,[ebp-0xc]
10004535:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000453b:	89 4d f0             	mov    DWORD PTR [ebp-0x10],ecx
1000453e:	8b 3d 08 a3 00 10    	mov    edi,DWORD PTR ds:0x1000a308
10004544:	b9 fc 34 02 10       	mov    ecx,0x100234fc
10004549:	6a 00                	push   0x0
1000454b:	ff d7                	call   edi
1000454d:	e8 1e 37 00 00       	call   0x10007c70
10004552:	8b 1d d4 a0 00 10    	mov    ebx,DWORD PTR ds:0x1000a0d4
10004558:	8b c8                	mov    ecx,eax
1000455a:	a3 f0 34 02 10       	mov    ds:0x100234f0,eax
1000455f:	ff d3                	call   ebx
10004561:	8b c8                	mov    ecx,eax
10004563:	ff 15 8c a0 00 10    	call   DWORD PTR ds:0x1000a08c
10004569:	33 c9                	xor    ecx,ecx
1000456b:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
1000456e:	89                   	.byte 0x89
1000456f:	4d                   	dec    ebp


; ===== PM_params.dll pm_params_workwidget_stub 0x10007e10..0x10007e12 =====

/mnt/data/work_stage117/re_inputs/modules/PM_params.dll:     file format pei-i386


Disassembly of section .text:

10007e10 <.text+0x6e10>:
10007e10:	c3                   	ret
10007e11:	cc                   	int3


; ===== PM_params.dll pm_params_delete_handler 0x10005a80..0x10005b3b =====

/mnt/data/work_stage117/re_inputs/modules/PM_params.dll:     file format pei-i386


Disassembly of section .text:

10005a80 <.text+0x4a80>:
10005a80:	f0 ff 15 1c a2 00 10 	lock call DWORD PTR ds:0x1000a21c
10005a87:	8b 13                	mov    edx,DWORD PTR [ebx]
10005a89:	8d 45 e8             	lea    eax,[ebp-0x18]
10005a8c:	50                   	push   eax
10005a8d:	8b cb                	mov    ecx,ebx
10005a8f:	ff 52 0c             	call   DWORD PTR [edx+0xc]
10005a92:	33 f6                	xor    esi,esi
10005a94:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [ebp-0x4],0x1
10005a9b:	39 75 e8             	cmp    DWORD PTR [ebp-0x18],esi
10005a9e:	7e 4c                	jle    0x10005aec
10005aa0:	8b 3d 94 a0 00 10    	mov    edi,DWORD PTR ds:0x1000a094
10005aa6:	8b 1d 98 a0 00 10    	mov    ebx,DWORD PTR ds:0x1000a098
10005aac:	0f 1f 40 00          	nop    DWORD PTR [eax+0x0]
10005ab0:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
10005ab3:	8b 0c b0             	mov    ecx,DWORD PTR [eax+esi*4]
10005ab6:	ff d7                	call   edi
10005ab8:	83 f8 04             	cmp    eax,0x4
10005abb:	75 26                	jne    0x10005ae3
10005abd:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
10005ac0:	6a 01                	push   0x1
10005ac2:	8b 0c b1             	mov    ecx,DWORD PTR [ecx+esi*4]
10005ac5:	ff d3                	call   ebx
10005ac7:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
10005aca:	8b 0c b1             	mov    ecx,DWORD PTR [ecx+esi*4]
10005acd:	ff 15 90 a0 00 10    	call   DWORD PTR ds:0x1000a090
10005ad3:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
10005ad6:	8b 0c b0             	mov    ecx,DWORD PTR [eax+esi*4]
10005ad9:	85 c9                	test   ecx,ecx
10005adb:	74 06                	je     0x10005ae3
10005add:	8b 01                	mov    eax,DWORD PTR [ecx]
10005adf:	6a 01                	push   0x1
10005ae1:	ff 10                	call   DWORD PTR [eax]
10005ae3:	46                   	inc    esi
10005ae4:	3b 75 e8             	cmp    esi,DWORD PTR [ebp-0x18]
10005ae7:	7c c7                	jl     0x10005ab0
10005ae9:	8b 5d f0             	mov    ebx,DWORD PTR [ebp-0x10]
10005aec:	8b 0d f0 34 02 10    	mov    ecx,DWORD PTR ds:0x100234f0
10005af2:	53                   	push   ebx
10005af3:	ff 15 d4 a0 00 10    	call   DWORD PTR ds:0x1000a0d4
10005af9:	8b c8                	mov    ecx,eax
10005afb:	ff 15 70 a0 00 10    	call   DWORD PTR ds:0x1000a070
10005b01:	8d 4d 98             	lea    ecx,[ebp-0x68]
10005b04:	ff 15 00 a2 00 10    	call   DWORD PTR ds:0x1000a200
10005b0a:	50                   	push   eax
10005b0b:	8d 4d d8             	lea    ecx,[ebp-0x28]
10005b0e:	ff 15 fc a1 00 10    	call   DWORD PTR ds:0x1000a1fc
10005b14:	50                   	push   eax
10005b15:	b9 fc 34 02 10       	mov    ecx,0x100234fc
10005b1a:	ff 15 f4 a1 00 10    	call   DWORD PTR ds:0x1000a1f4
10005b20:	8d 4d e8             	lea    ecx,[ebp-0x18]
10005b23:	ff 15 9c a0 00 10    	call   DWORD PTR ds:0x1000a09c
10005b29:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10005b2c:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10005b33:	59                   	pop    ecx
10005b34:	5f                   	pop    edi
10005b35:	5e                   	pop    esi
10005b36:	5b                   	pop    ebx
10005b37:	8b e5                	mov    esp,ebp
10005b39:	5d                   	pop    ebp
10005b3a:	c3                   	ret


; ===== MAIWmodels.dll parameters_list_delete_thunk 0x10013bc0..0x10013bc9 =====

/mnt/data/work_stage117/re_inputs/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

10013bc0 <.text+0x12bc0>:
10013bc0:	55                   	push   ebp
10013bc1:	8b ec                	mov    ebp,esp
10013bc3:	5d                   	pop    ebp
10013bc4:	e9 97 a2 ff ff       	jmp    0x1000de60


; ===== MAIWmodels.dll parameter_vector_erase 0x1000de60..0x1000deb7 =====

/mnt/data/work_stage117/re_inputs/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

1000de60 <.text+0xce60>:
1000de60:	55                   	push   ebp
1000de61:	8b ec                	mov    ebp,esp
1000de63:	53                   	push   ebx
1000de64:	8b d9                	mov    ebx,ecx
1000de66:	8d 4d 08             	lea    ecx,[ebp+0x8]
1000de69:	56                   	push   esi
1000de6a:	57                   	push   edi
1000de6b:	51                   	push   ecx
1000de6c:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
1000de6f:	8b 70 18             	mov    esi,DWORD PTR [eax+0x18]
1000de72:	56                   	push   esi
1000de73:	ff 70 14             	push   DWORD PTR [eax+0x14]
1000de76:	e8 65 c5 ff ff       	call   0x1000a3e0
1000de7b:	8b 4b 04             	mov    ecx,DWORD PTR [ebx+0x4]
1000de7e:	8b f8                	mov    edi,eax
1000de80:	83 c1 14             	add    ecx,0x14
1000de83:	83 c4 0c             	add    esp,0xc
1000de86:	89 4d 08             	mov    DWORD PTR [ebp+0x8],ecx
1000de89:	8b 01                	mov    eax,DWORD PTR [ecx]
1000de8b:	3b f8                	cmp    edi,eax
1000de8d:	75 05                	jne    0x1000de94
1000de8f:	3b 71 04             	cmp    esi,DWORD PTR [ecx+0x4]
1000de92:	74 1b                	je     0x1000deaf
1000de94:	3b fe                	cmp    edi,esi
1000de96:	74 1a                	je     0x1000deb2
1000de98:	8b 59 04             	mov    ebx,DWORD PTR [ecx+0x4]
1000de9b:	2b de                	sub    ebx,esi
1000de9d:	53                   	push   ebx
1000de9e:	56                   	push   esi
1000de9f:	57                   	push   edi
1000dea0:	ff 15 4c 70 01 10    	call   DWORD PTR ds:0x1001704c
1000dea6:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
1000dea9:	8d 04 3b             	lea    eax,[ebx+edi*1]
1000deac:	83 c4 0c             	add    esp,0xc
1000deaf:	89 41 04             	mov    DWORD PTR [ecx+0x4],eax
1000deb2:	5f                   	pop    edi
1000deb3:	5e                   	pop    esi
1000deb4:	5b                   	pop    ebx
1000deb5:	5d                   	pop    ebp
1000deb6:	c2                   	.byte 0xc2


; ===== MAIWmodels.dll parameters_list_add 0x100139d0..0x10013a3e =====

/mnt/data/work_stage117/re_inputs/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

100139d0 <.text+0x129d0>:
100139d0:	55                   	push   ebp
100139d1:	8b ec                	mov    ebp,esp
100139d3:	6a ff                	push   0xffffffff
100139d5:	68 2f 6e 01 10       	push   0x10016e2f
100139da:	64 a1 00 00 00 00    	mov    eax,fs:0x0
100139e0:	50                   	push   eax
100139e1:	51                   	push   ecx
100139e2:	56                   	push   esi
100139e3:	57                   	push   edi
100139e4:	a1 04 10 02 10       	mov    eax,ds:0x10021004
100139e9:	33 c5                	xor    eax,ebp
100139eb:	50                   	push   eax
100139ec:	8d 45 f4             	lea    eax,[ebp-0xc]
100139ef:	64 a3 00 00 00 00    	mov    fs:0x0,eax
100139f5:	8b f9                	mov    edi,ecx
100139f7:	6a 08                	push   0x8
100139f9:	e8 f2 12 00 00       	call   0x10014cf0
100139fe:	83 c4 04             	add    esp,0x4
10013a01:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
10013a04:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10013a0b:	85 c0                	test   eax,eax
10013a0d:	74 0b                	je     0x10013a1a
10013a0f:	8b c8                	mov    ecx,eax
10013a11:	e8 3a f0 ff ff       	call   0x10012a50
10013a16:	8b f0                	mov    esi,eax
10013a18:	eb 02                	jmp    0x10013a1c
10013a1a:	33 f6                	xor    esi,esi
10013a1c:	56                   	push   esi
10013a1d:	8b cf                	mov    ecx,edi
10013a1f:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
10013a26:	e8 85 a3 ff ff       	call   0x1000ddb0
10013a2b:	8b c6                	mov    eax,esi
10013a2d:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10013a30:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10013a37:	59                   	pop    ecx
10013a38:	5f                   	pop    edi
10013a39:	5e                   	pop    esi
10013a3a:	8b e5                	mov    esp,ebp
10013a3c:	5d                   	pop    ebp
10013a3d:	c3                   	ret


; ===== MAIWmodels.dll parameters_list_append_vector 0x1000ddb0..0x1000dddf =====

/mnt/data/work_stage117/re_inputs/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

1000ddb0 <.text+0xcdb0>:
1000ddb0:	55                   	push   ebp
1000ddb1:	8b ec                	mov    ebp,esp
1000ddb3:	56                   	push   esi
1000ddb4:	8b f1                	mov    esi,ecx
1000ddb6:	8d 45 08             	lea    eax,[ebp+0x8]
1000ddb9:	50                   	push   eax
1000ddba:	8b 4e 04             	mov    ecx,DWORD PTR [esi+0x4]
1000ddbd:	83 c1 14             	add    ecx,0x14
1000ddc0:	e8 9b 4c ff ff       	call   0x10002a60
1000ddc5:	8b 56 04             	mov    edx,DWORD PTR [esi+0x4]
1000ddc8:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000ddcb:	5e                   	pop    esi
1000ddcc:	ff 42 0c             	inc    DWORD PTR [edx+0xc]
1000ddcf:	8b 48 04             	mov    ecx,DWORD PTR [eax+0x4]
1000ddd2:	8b 42 0c             	mov    eax,DWORD PTR [edx+0xc]
1000ddd5:	89 41 04             	mov    DWORD PTR [ecx+0x4],eax
1000ddd8:	b8 01 00 00 00       	mov    eax,0x1
1000dddd:	5d                   	pop    ebp
1000ddde:	c2                   	.byte 0xc2


; ===== MAIWmodels.dll parameters_list_destructor 0x1000d8e0..0x1000d96a =====

/mnt/data/work_stage117/re_inputs/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

1000d8e0 <.text+0xc8e0>:
1000d8e0:	56                   	push   esi
1000d8e1:	8b f1                	mov    esi,ecx
1000d8e3:	57                   	push   edi
1000d8e4:	33 ff                	xor    edi,edi
1000d8e6:	8b 56 04             	mov    edx,DWORD PTR [esi+0x4]
1000d8e9:	c7 06 fc 70 01 10    	mov    DWORD PTR [esi],0x100170fc
1000d8ef:	8b 42 18             	mov    eax,DWORD PTR [edx+0x18]
1000d8f2:	2b 42 14             	sub    eax,DWORD PTR [edx+0x14]
1000d8f5:	a9 fc ff ff ff       	test   eax,0xfffffffc
1000d8fa:	7e 28                	jle    0x1000d924
1000d8fc:	0f 1f 40 00          	nop    DWORD PTR [eax+0x0]
1000d900:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
1000d903:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
1000d906:	8b 0c b8             	mov    ecx,DWORD PTR [eax+edi*4]
1000d909:	85 c9                	test   ecx,ecx
1000d90b:	74 06                	je     0x1000d913
1000d90d:	8b 01                	mov    eax,DWORD PTR [ecx]
1000d90f:	6a 01                	push   0x1
1000d911:	ff 10                	call   DWORD PTR [eax]
1000d913:	8b 4e 04             	mov    ecx,DWORD PTR [esi+0x4]
1000d916:	47                   	inc    edi
1000d917:	8b 41 18             	mov    eax,DWORD PTR [ecx+0x18]
1000d91a:	2b 41 14             	sub    eax,DWORD PTR [ecx+0x14]
1000d91d:	c1 f8 02             	sar    eax,0x2
1000d920:	3b f8                	cmp    edi,eax
1000d922:	7c dc                	jl     0x1000d900
1000d924:	8b 4e 04             	mov    ecx,DWORD PTR [esi+0x4]
1000d927:	33 ff                	xor    edi,edi
1000d929:	8b 41 24             	mov    eax,DWORD PTR [ecx+0x24]
1000d92c:	2b 41 20             	sub    eax,DWORD PTR [ecx+0x20]
1000d92f:	c1 f8 02             	sar    eax,0x2
1000d932:	85 c0                	test   eax,eax
1000d934:	74 24                	je     0x1000d95a
1000d936:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
1000d939:	8b 40 20             	mov    eax,DWORD PTR [eax+0x20]
1000d93c:	8b 0c b8             	mov    ecx,DWORD PTR [eax+edi*4]
1000d93f:	85 c9                	test   ecx,ecx
1000d941:	74 06                	je     0x1000d949
1000d943:	8b 01                	mov    eax,DWORD PTR [ecx]
1000d945:	6a 01                	push   0x1
1000d947:	ff 10                	call   DWORD PTR [eax]
1000d949:	8b 4e 04             	mov    ecx,DWORD PTR [esi+0x4]
1000d94c:	47                   	inc    edi
1000d94d:	8b 41 24             	mov    eax,DWORD PTR [ecx+0x24]
1000d950:	2b 41 20             	sub    eax,DWORD PTR [ecx+0x20]
1000d953:	c1 f8 02             	sar    eax,0x2
1000d956:	3b f8                	cmp    edi,eax
1000d958:	72 dc                	jb     0x1000d936
1000d95a:	8b 4e 04             	mov    ecx,DWORD PTR [esi+0x4]
1000d95d:	5f                   	pop    edi
1000d95e:	5e                   	pop    esi
1000d95f:	85 c9                	test   ecx,ecx
1000d961:	74 06                	je     0x1000d969
1000d963:	8b 01                	mov    eax,DWORD PTR [ecx]
1000d965:	6a 01                	push   0x1
1000d967:	ff 10                	call   DWORD PTR [eax]
1000d969:	c3                   	ret


; ===== MAIWmodels.dll parameters_list_private_destructor 0x1000d970..0x1000da30 =====

/mnt/data/work_stage117/re_inputs/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

1000d970 <.text+0xc970>:
1000d970:	55                   	push   ebp
1000d971:	8b ec                	mov    ebp,esp
1000d973:	6a ff                	push   0xffffffff
1000d975:	68 d6 66 01 10       	push   0x100166d6
1000d97a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000d980:	50                   	push   eax
1000d981:	51                   	push   ecx
1000d982:	56                   	push   esi
1000d983:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000d988:	33 c5                	xor    eax,ebp
1000d98a:	50                   	push   eax
1000d98b:	8d 45 f4             	lea    eax,[ebp-0xc]
1000d98e:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000d994:	8b f1                	mov    esi,ecx
1000d996:	c7 06 60 73 01 10    	mov    DWORD PTR [esi],0x10017360
1000d99c:	8b 4e 20             	mov    ecx,DWORD PTR [esi+0x20]
1000d99f:	85 c9                	test   ecx,ecx
1000d9a1:	74 29                	je     0x1000d9cc
1000d9a3:	8b 46 28             	mov    eax,DWORD PTR [esi+0x28]
1000d9a6:	2b c1                	sub    eax,ecx
1000d9a8:	c1 f8 02             	sar    eax,0x2
1000d9ab:	6a 04                	push   0x4
1000d9ad:	50                   	push   eax
1000d9ae:	51                   	push   ecx
1000d9af:	e8 cc 42 ff ff       	call   0x10001c80
1000d9b4:	c7 46 20 00 00 00 00 	mov    DWORD PTR [esi+0x20],0x0
1000d9bb:	83 c4 0c             	add    esp,0xc
1000d9be:	c7 46 24 00 00 00 00 	mov    DWORD PTR [esi+0x24],0x0
1000d9c5:	c7 46 28 00 00 00 00 	mov    DWORD PTR [esi+0x28],0x0
1000d9cc:	8b 4e 14             	mov    ecx,DWORD PTR [esi+0x14]
1000d9cf:	85 c9                	test   ecx,ecx
1000d9d1:	74 29                	je     0x1000d9fc
1000d9d3:	8b 46 1c             	mov    eax,DWORD PTR [esi+0x1c]
1000d9d6:	2b c1                	sub    eax,ecx
1000d9d8:	c1 f8 02             	sar    eax,0x2
1000d9db:	6a 04                	push   0x4
1000d9dd:	50                   	push   eax
1000d9de:	51                   	push   ecx
1000d9df:	e8 9c 42 ff ff       	call   0x10001c80
1000d9e4:	c7 46 14 00 00 00 00 	mov    DWORD PTR [esi+0x14],0x0
1000d9eb:	83 c4 0c             	add    esp,0xc
1000d9ee:	c7 46 18 00 00 00 00 	mov    DWORD PTR [esi+0x18],0x0
1000d9f5:	c7 46 1c 00 00 00 00 	mov    DWORD PTR [esi+0x1c],0x0
1000d9fc:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
1000d9ff:	8d 4e 04             	lea    ecx,[esi+0x4]
1000da02:	50                   	push   eax
1000da03:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000da0a:	ff 30                	push   DWORD PTR [eax]
1000da0c:	8d 45 f0             	lea    eax,[ebp-0x10]
1000da0f:	50                   	push   eax
1000da10:	e8 1b 05 00 00       	call   0x1000df30
1000da15:	6a 1c                	push   0x1c
1000da17:	6a 01                	push   0x1
1000da19:	ff 76 04             	push   DWORD PTR [esi+0x4]
1000da1c:	e8 5f 42 ff ff       	call   0x10001c80
1000da21:	83 c4 0c             	add    esp,0xc
1000da24:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000da27:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000da2e:	59                   	pop    ecx
1000da2f:	5e                   	pop    esi


; ===== MAIWmodels.dll parameters_list_destructor_thunk 0x100136b0..0x100136c8 =====

/mnt/data/work_stage117/re_inputs/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

100136b0 <.text+0x126b0>:
100136b0:	c7 01 a4 75 01 10    	mov    DWORD PTR [ecx],0x100175a4
100136b6:	e9 25 a2 ff ff       	jmp    0x1000d8e0
100136bb:	cc                   	int3
100136bc:	cc                   	int3
100136bd:	cc                   	int3
100136be:	cc                   	int3
100136bf:	cc                   	int3
100136c0:	c7 01 ac 75 01 10    	mov    DWORD PTR [ecx],0x100175ac
100136c6:	e9                   	.byte 0xe9
100136c7:	a5                   	movs   DWORD PTR es:[edi],DWORD PTR ds:[esi]
