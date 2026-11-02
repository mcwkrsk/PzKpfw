
/mnt/data/is2_re_analysis_kit_stage1_17_continuation_2026-11-01/original/is.exe:     file format pei-i386


disassembly of section .text:

004147d0 <.text+0x137d0>:
  4147d0:	a0 0f 00 00 68       	mov    al,ds:0x6800000f
  4147d5:	0c 97                	or     al,0x97
  4147d7:	46                   	inc    esi
  4147d8:	00 e8                	add    al,ch
  4147da:	3e 0c 00             	ds or  al,0x0
  4147dd:	00 83 c4 0c 68 9c    	add    byte ptr [ebx-0x6397f33c],al
  4147e3:	b2 45                	mov    dl,0x45
  4147e5:	00 ff                	add    bh,bh
  4147e7:	15 64 90 41 00       	adc    eax,0x419064
  4147ec:	8b f0                	mov    esi,eax
  4147ee:	85 f6                	test   esi,esi
  4147f0:	0f 84 8c 00 00 00    	je     0x414882
  4147f6:	68 b8 b2 45 00       	push   0x45b2b8
  4147fb:	56                   	push   esi
  4147fc:	ff 15 3c 90 41 00    	call   dword ptr ds:0x41903c
  414802:	68 d4 b2 45 00       	push   0x45b2d4
  414807:	56                   	push   esi
  414808:	8b d8                	mov    ebx,eax
  41480a:	ff 15 3c 90 41 00    	call   dword ptr ds:0x41903c
  414810:	68 f0 b2 45 00       	push   0x45b2f0
  414815:	56                   	push   esi
  414816:	8b f8                	mov    edi,eax
  414818:	ff 15 3c 90 41 00    	call   dword ptr ds:0x41903c
  41481e:	8b f0                	mov    esi,eax
  414820:	85 db                	test   ebx,ebx
  414822:	74 37                	je     0x41485b
  414824:	85 ff                	test   edi,edi
  414826:	74 33                	je     0x41485b
  414828:	85 f6                	test   esi,esi
  41482a:	74 2f                	je     0x41485b
  41482c:	83 25 28 97 46 00 00 	and    dword ptr ds:0x469728,0x0
  414833:	8b cb                	mov    ecx,ebx
  414835:	68 24 97 46 00       	push   0x469724
  41483a:	e8 c4 07 00 00       	call   0x415003
  41483f:	ff d3                	call   ebx
  414841:	57                   	push   edi
  414842:	e8 43 00 00 00       	call   0x41488a
  414847:	56                   	push   esi
  414848:	a3 2c 97 46 00       	mov    ds:0x46972c,eax
  41484d:	e8 38 00 00 00       	call   0x41488a
  414852:	59                   	pop    ecx
  414853:	59                   	pop    ecx
  414854:	a3 30 97 46 00       	mov    ds:0x469730,eax
  414859:	eb 16                	jmp    0x414871
  41485b:	33 c0                	xor    eax,eax
  41485d:	50                   	push   eax
  41485e:	50                   	push   eax
  41485f:	6a 01                	push   0x1
  414861:	50                   	push   eax
  414862:	ff 15 40 90 41 00    	call   dword ptr ds:0x419040
  414868:	a3 28 97 46 00       	mov    ds:0x469728,eax
  41486d:	85 c0                	test   eax,eax
  41486f:	74 11                	je     0x414882
  414871:	68 a7 48 41 00       	push   0x4148a7
  414876:	e8 e8 fe ff ff       	call   0x414763
  41487b:	59                   	pop    ecx
  41487c:	5f                   	pop    edi
  41487d:	5e                   	pop    esi
  41487e:	33 c0                	xor    eax,eax
  414880:	5b                   	pop    ebx
  414881:	c3                   	ret
  414882:	6a 07                	push   0x7
  414884:	e8 98 05 00 00       	call   0x414e21
  414889:	cc                   	int3
  41488a:	55                   	push   ebp
  41488b:	8b ec                	mov    ebp,esp
  41488d:	a1                   	.byte 0xa1
  41488e:	cc                   	int3
  41488f:	90                   	nop
