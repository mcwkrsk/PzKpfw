
/mnt/data/is2_re_analysis_kit_stage1_17_continuation_2026-11-01/original/modules/pm_params.dll:     file format pei-i386


disassembly of section .text:

10008260 <.text+0x7260>:
10008260:	a0 0f 00 00 68       	mov    al,ds:0x6800000f
10008265:	6c                   	ins    byte ptr es:[edi],dx
10008266:	35 02 10 e8 74       	xor    eax,0x74e81002
1000826b:	0c 00                	or     al,0x0
1000826d:	00 83 c4 0c 68 cc    	add    byte ptr [ebx-0x3397f33c],al
10008273:	8f 01                	pop    dword ptr [ecx]
10008275:	10 ff                	adc    bh,bh
10008277:	15 30 a0 00 10       	adc    eax,0x1000a030
1000827c:	8b f0                	mov    esi,eax
1000827e:	85 f6                	test   esi,esi
10008280:	0f 84 8c 00 00 00    	je     0x10008312
10008286:	68 e8 8f 01 10       	push   0x10018fe8
1000828b:	56                   	push   esi
1000828c:	ff 15 2c a0 00 10    	call   dword ptr ds:0x1000a02c
10008292:	68 04 90 01 10       	push   0x10019004
10008297:	56                   	push   esi
10008298:	8b d8                	mov    ebx,eax
1000829a:	ff 15 2c a0 00 10    	call   dword ptr ds:0x1000a02c
100082a0:	68 20 90 01 10       	push   0x10019020
100082a5:	56                   	push   esi
100082a6:	8b f8                	mov    edi,eax
100082a8:	ff 15 2c a0 00 10    	call   dword ptr ds:0x1000a02c
100082ae:	8b f0                	mov    esi,eax
100082b0:	85 db                	test   ebx,ebx
100082b2:	74 37                	je     0x100082eb
100082b4:	85 ff                	test   edi,edi
100082b6:	74 33                	je     0x100082eb
100082b8:	85 f6                	test   esi,esi
100082ba:	74 2f                	je     0x100082eb
100082bc:	83 25 88 35 02 10 00 	and    dword ptr ds:0x10023588,0x0
100082c3:	8b cb                	mov    ecx,ebx
100082c5:	68 84 35 02 10       	push   0x10023584
100082ca:	e8 d0 07 00 00       	call   0x10008a9f
100082cf:	ff d3                	call   ebx
100082d1:	57                   	push   edi
100082d2:	e8 43 00 00 00       	call   0x1000831a
100082d7:	56                   	push   esi
100082d8:	a3 8c 35 02 10       	mov    ds:0x1002358c,eax
100082dd:	e8 38 00 00 00       	call   0x1000831a
100082e2:	59                   	pop    ecx
100082e3:	59                   	pop    ecx
100082e4:	a3 90 35 02 10       	mov    ds:0x10023590,eax
100082e9:	eb 16                	jmp    0x10008301
100082eb:	33 c0                	xor    eax,eax
100082ed:	50                   	push   eax
100082ee:	50                   	push   eax
100082ef:	6a 01                	push   0x1
100082f1:	50                   	push   eax
100082f2:	ff 15 34 a0 00 10    	call   dword ptr ds:0x1000a034
100082f8:	a3 88 35 02 10       	mov    ds:0x10023588,eax
100082fd:	85 c0                	test   eax,eax
100082ff:	74 11                	je     0x10008312
10008301:	68 37 83 00 10       	push   0x10008337
10008306:	e8 c0 fe ff ff       	call   0x100081cb
1000830b:	59                   	pop    ecx
1000830c:	5f                   	pop    edi
1000830d:	5e                   	pop    esi
1000830e:	33 c0                	xor    eax,eax
10008310:	5b                   	pop    ebx
10008311:	c3                   	ret
10008312:	6a 07                	push   0x7
10008314:	e8 6b 06 00 00       	call   0x10008984
10008319:	cc                   	int3
1000831a:	55                   	push   ebp
1000831b:	8b ec                	mov    ebp,esp
1000831d:	a1                   	.byte 0xa1
1000831e:	50                   	push   eax
1000831f:	30                   	.byte 0x30
