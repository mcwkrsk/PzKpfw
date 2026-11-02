; Stage 1.8: IsModule abstract base vtable and widget-list ownership audit

; Static analysis only; SHA-pinned PE32 images; GNU objdump.


; PM_auto.dll: base vtable slot2 -> _purecall; slot1 -> QListData append


/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/PM_auto.dll:     file format pei-i386


Disassembly of section .text:

1001db60 <.text+0x1cb60>:
1001db60:	ff 25 60 2f 02 10    	jmp    DWORD PTR ds:0x10022f60


/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/PM_auto.dll:     file format pei-i386


Disassembly of section .text:

100027d0 <.text+0x17d0>:
100027d0:	55                   	push   ebp
100027d1:	8b ec                	mov    ebp,esp
100027d3:	6a ff                	push   0xffffffff
100027d5:	68 a2 e7 01 10       	push   0x1001e7a2
100027da:	64 a1 00 00 00 00    	mov    eax,fs:0x0
100027e0:	50                   	push   eax
100027e1:	51                   	push   ecx
100027e2:	56                   	push   esi
100027e3:	a1 cc f0 06 10       	mov    eax,ds:0x1006f0cc
100027e8:	33 c5                	xor    eax,ebp
100027ea:	50                   	push   eax
100027eb:	8d 45 f4             	lea    eax,[ebp-0xc]
100027ee:	64 a3 00 00 00 00    	mov    fs:0x0,eax
100027f4:	8b f1                	mov    esi,ecx
100027f6:	68 74 01 00 00       	push   0x174
100027fb:	e8 7b a4 01 00       	call   0x1001cc7b
10002800:	83 c4 04             	add    esp,0x4
10002803:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
10002806:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000280d:	85 c0                	test   eax,eax
1000280f:	74 0b                	je     0x1000281c
10002811:	6a 00                	push   0x0
10002813:	8b c8                	mov    ecx,eax
10002815:	e8 46 ed ff ff       	call   0x10001560
1000281a:	eb 02                	jmp    0x1000281e
1000281c:	33 c0                	xor    eax,eax
1000281e:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
10002821:	8d 4e 0c             	lea    ecx,[esi+0xc]
10002824:	8d 45 f0             	lea    eax,[ebp-0x10]
10002827:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
1000282e:	50                   	push   eax
1000282f:	e8 7c 6d 00 00       	call   0x100095b0
10002834:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10002837:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000283e:	59                   	pop    ecx
1000283f:	5e                   	pop    esi
10002840:	8b e5                	mov    esp,ebp
10002842:	5d                   	pop    ebp
10002843:	c3                   	ret
10002844:	cc                   	int3
10002845:	cc                   	int3
10002846:	cc                   	int3
10002847:	cc                   	int3
10002848:	cc                   	int3
10002849:	cc                   	int3
1000284a:	cc                   	int3
1000284b:	cc                   	int3
1000284c:	cc                   	int3
1000284d:	cc                   	int3
1000284e:	cc                   	int3
1000284f:	cc                   	int3
10002850:	6a 1c                	push   0x1c
10002852:	e8 24 a4 01 00       	call   0x1001cc7b
10002857:	83 c4 04             	add    esp,0x4
1000285a:	85 c0                	test   eax,eax
1000285c:	74 1f                	je     0x1000287d
1000285e:	c7 00 54 76 05 10    	mov    DWORD PTR [eax],0x10057654
10002864:	8b 0d 30 23 02 10    	mov    ecx,DWORD PTR ds:0x10022330
1000286a:	89 48 08             	mov    DWORD PTR [eax+0x8],ecx
1000286d:	8b 0d 34 23 02 10    	mov    ecx,DWORD PTR ds:0x10022334
10002873:	89 48 0c             	mov    DWORD PTR [eax+0xc],ecx
10002876:	c7 00 5c 79 05 10    	mov    DWORD PTR [eax],0x1005795c
1000287c:	c3                   	ret
1000287d:	33 c0                	xor    eax,eax
1000287f:	c3                   	ret
10002880:	ff 25 2c 23 02 10    	jmp    DWORD PTR ds:0x1002232c
10002886:	ff 25 b0 23 02 10    	jmp    DWORD PTR ds:0x100223b0
1000288c:	ff 25 4c 23 02 10    	jmp    DWORD PTR ds:0x1002234c
10002892:	ff 25 48 23 02 10    	jmp    DWORD PTR ds:0x10022348
10002898:	ff 25 44 23 02 10    	jmp    DWORD PTR ds:0x10022344
1000289e:	ff 25 40 23 02 10    	jmp    DWORD PTR ds:0x10022340
100028a4:	ff 25 3c 23 02 10    	jmp    DWORD PTR ds:0x1002233c
100028aa:	ff 25 38 23 02 10    	jmp    DWORD PTR ds:0x10022338
100028b0:	ff 25 b0 24 02 10    	jmp    DWORD PTR ds:0x100224b0
100028b6:	ff 25 b4 24 02 10    	jmp    DWORD PTR ds:0x100224b4
100028bc:	ff 25 b8 24 02 10    	jmp    DWORD PTR ds:0x100224b8
100028c2:	ff 25 bc 24 02 10    	jmp    DWORD PTR ds:0x100224bc
100028c8:	ff 25 c0 24 02 10    	jmp    DWORD PTR ds:0x100224c0
100028ce:	ff                   	.byte 0xff
100028cf:	25                   	.byte 0x25


/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/PM_auto.dll:     file format pei-i386


Disassembly of section .text:

100095b0 <.text+0x85b0>:
100095b0:	55                   	push   ebp
100095b1:	8b ec                	mov    ebp,esp
100095b3:	6a ff                	push   0xffffffff
100095b5:	68 50 f0 01 10       	push   0x1001f050
100095ba:	64 a1 00 00 00 00    	mov    eax,fs:0x0
100095c0:	50                   	push   eax
100095c1:	51                   	push   ecx
100095c2:	53                   	push   ebx
100095c3:	56                   	push   esi
100095c4:	57                   	push   edi
100095c5:	a1 cc f0 06 10       	mov    eax,ds:0x1006f0cc
100095ca:	33 c5                	xor    eax,ebp
100095cc:	50                   	push   eax
100095cd:	8d 45 f4             	lea    eax,[ebp-0xc]
100095d0:	64 a3 00 00 00 00    	mov    fs:0x0,eax
100095d6:	89 65 f0             	mov    DWORD PTR [ebp-0x10],esp
100095d9:	8b 01                	mov    eax,DWORD PTR [ecx]
100095db:	8b 00                	mov    eax,DWORD PTR [eax]
100095dd:	83 f8 01             	cmp    eax,0x1
100095e0:	74 2b                	je     0x1000960d
100095e2:	85 c0                	test   eax,eax
100095e4:	74 27                	je     0x1000960d
100095e6:	6a 01                	push   0x1
100095e8:	68 ff ff ff 7f       	push   0x7fffffff
100095ed:	e8 4e 11 00 00       	call   0x1000a740
100095f2:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
100095f5:	8b 09                	mov    ecx,DWORD PTR [ecx]
100095f7:	89 08                	mov    DWORD PTR [eax],ecx
100095f9:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
100095fc:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10009603:	59                   	pop    ecx
10009604:	5f                   	pop    edi
10009605:	5e                   	pop    esi
10009606:	5b                   	pop    ebx
10009607:	8b e5                	mov    esp,ebp
10009609:	5d                   	pop    ebp
1000960a:	c2 04 00             	ret    0x4
1000960d:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
10009610:	c7 45 fc 04 00 00 00 	mov    DWORD PTR [ebp-0x4],0x4
10009617:	8b 36                	mov    esi,DWORD PTR [esi]
10009619:	ff 15 78 23 02 10    	call   DWORD PTR ds:0x10022378
1000961f:	89 30                	mov    DWORD PTR [eax],esi
10009621:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10009624:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000962b:	59                   	pop    ecx
1000962c:	5f                   	pop    edi
1000962d:	5e                   	pop    esi
1000962e:	5b                   	pop    ebx
1000962f:	8b e5                	mov    esp,ebp
10009631:	5d                   	pop    ebp
10009632:	c2 04 00             	ret    0x4
10009635:	6a 00                	push   0x0
10009637:	6a 00                	push   0x0
10009639:	e8 28 45 01 00       	call   0x1001db66
1000963e:	cc                   	int3
1000963f:	cc                   	int3
10009640:	55                   	push   ebp
10009641:	8b ec                	mov    ebp,esp
10009643:	53                   	push   ebx
10009644:	8b d9                	mov    ebx,ecx
10009646:	57                   	push   edi
10009647:	8b 13                	mov    edx,DWORD PTR [ebx]
10009649:	8b 7a 08             	mov    edi,DWORD PTR [edx+0x8]
1000964c:	8b 4a 04             	mov    ecx,DWORD PTR [edx+0x4]
1000964f:	81 e7 ff ff ff 7f    	and    edi,0x7fffffff
10009655:	8b 02                	mov    eax,DWORD PTR [edx]
10009657:	41                   	inc    ecx
10009658:	83 f8 01             	cmp    eax,0x1
1000965b:	74 04                	je     0x10009661
1000965d:	85 c0                	test   eax,eax
1000965f:	75 20                	jne    0x10009681
10009661:	3b cf                	cmp    ecx,edi
10009663:	77 1c                	ja     0x10009681
10009665:	8b 42 0c             	mov    eax,DWORD PTR [edx+0xc]
10009668:	8b 4a 04             	mov    ecx,DWORD PTR [edx+0x4]
1000966b:	5f                   	pop    edi
1000966c:	8d 0c 88             	lea    ecx,[eax+ecx*4]
1000966f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10009672:	8b 00                	mov    eax,DWORD PTR [eax]
10009674:	89 04 11             	mov    DWORD PTR [ecx+edx*1],eax
10009677:	8b 03                	mov    eax,DWORD PTR [ebx]
10009679:	5b                   	pop    ebx
1000967a:	ff 40 04             	inc    DWORD PTR [eax+0x4]
1000967d:	5d                   	pop    ebp
1000967e:	c2 04 00             	ret    0x4
10009681:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10009684:	3b f9                	cmp    edi,ecx
10009686:	56                   	push   esi
10009687:	8b 30                	mov    esi,DWORD PTR [eax]
10009689:	1b c0                	sbb    eax,eax
1000968b:	83 e0 08             	and    eax,0x8
1000968e:	3b cf                	cmp    ecx,edi
10009690:	50                   	push   eax
10009691:	0f 47 f9             	cmova  edi,ecx
10009694:	8b cb                	mov    ecx,ebx
10009696:	57                   	push   edi
10009697:	ff 72 04             	push   DWORD PTR [edx+0x4]
1000969a:	e8 91 41 00 00       	call   0x1000d830
1000969f:	8b 13                	mov    edx,DWORD PTR [ebx]
100096a1:	8b 4a 04             	mov    ecx,DWORD PTR [edx+0x4]
100096a4:	8b 42 0c             	mov    eax,DWORD PTR [edx+0xc]
100096a7:	8d 04 88             	lea    eax,[eax+ecx*4]
100096aa:	89 34 10             	mov    DWORD PTR [eax+edx*1],esi
100096ad:	8b 03                	mov    eax,DWORD PTR [ebx]
100096af:	5e                   	pop    esi
100096b0:	5f                   	pop    edi
100096b1:	5b                   	pop    ebx
100096b2:	ff 40 04             	inc    DWORD PTR [eax+0x4]
100096b5:	5d                   	pop    ebp
100096b6:	c2 04 00             	ret    0x4
100096b9:	cc                   	int3
100096ba:	cc                   	int3
100096bb:	cc                   	int3
100096bc:	cc                   	int3
100096bd:	cc                   	int3
100096be:	cc                   	int3
100096bf:	cc                   	int3
100096c0:	55                   	push   ebp
100096c1:	8b ec                	mov    ebp,esp
100096c3:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
100096c6:	8b 08                	mov    ecx,DWORD PTR [eax]
100096c8:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
100096cb:	89 08                	mov    DWORD PTR [eax],ecx
100096cd:	5d                   	pop    ebp
100096ce:	c3                   	ret
100096cf:	cc                   	int3
100096d0:	56                   	push   esi
100096d1:	8b f1                	mov    esi,ecx
100096d3:	8b 06                	mov    eax,DWORD PTR [esi]
100096d5:	8b 08                	mov    ecx,DWORD PTR [eax]
100096d7:	83 f9 01             	cmp    ecx,0x1
100096da:	74 47                	je     0x10009723
100096dc:	85 c9                	test   ecx,ecx
100096de:	74 43                	je     0x10009723
100096e0:	f7 40 08 ff ff ff 7f 	test   DWORD PTR [eax+0x8],0x7fffffff
100096e7:	75 1c                	jne    0x10009705
100096e9:	6a 02                	push   0x2
100096eb:	6a 00                	push   0x0
100096ed:	6a 04                	push   0x4
100096ef:	6a 04                	push   0x4
100096f1:	ff 15 64 24 02 10    	call   DWORD PTR ds:0x10022464
100096f7:	8b c8                	mov    ecx,eax
100096f9:	89 06                	mov    DWORD PTR [esi],eax
100096fb:	83 c4 10             	add    esp,0x10
100096fe:	8b 41 0c             	mov    eax,DWORD PTR [ecx+0xc]
10009701:	03 c1                	add    eax,ecx
10009703:	5e                   	pop    esi
10009704:	c3                   	ret
10009705:	51                   	push   ecx
10009706:	8b c4                	mov    eax,esp
10009708:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
1000970e:	8b 0e                	mov    ecx,DWORD PTR [esi]
10009710:	8b 41 08             	mov    eax,DWORD PTR [ecx+0x8]
10009713:	25 ff ff ff 7f       	and    eax,0x7fffffff
10009718:	50                   	push   eax
10009719:	ff 71 04             	push   DWORD PTR [ecx+0x4]
1000971c:	8b ce                	mov    ecx,esi
1000971e:	e8 0d 41 00 00       	call   0x1000d830
10009723:	8b 0e                	mov    ecx,DWORD PTR [esi]
10009725:	5e                   	pop    esi
10009726:	8b 41 0c             	mov    eax,DWORD PTR [ecx+0xc]
10009729:	03 c1                	add    eax,ecx
1000972b:	c3                   	ret
1000972c:	cc                   	int3
1000972d:	cc                   	int3
1000972e:	cc                   	int3
1000972f:	cc                   	int3


; PM_params.dll: base vtable slot2 -> _purecall; slot1 -> QListData append


/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/PM_params.dll:     file format pei-i386


Disassembly of section .text:

10008edc <.text+0x7edc>:
10008edc:	ff 25 f0 a8 00 10    	jmp    DWORD PTR ds:0x1000a8f0


/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/PM_params.dll:     file format pei-i386


Disassembly of section .text:

10007310 <.text+0x6310>:
10007310:	55                   	push   ebp
10007311:	8b ec                	mov    ebp,esp
10007313:	6a ff                	push   0xffffffff
10007315:	68 bf 9c 00 10       	push   0x10009cbf
1000731a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10007320:	50                   	push   eax
10007321:	51                   	push   ecx
10007322:	56                   	push   esi
10007323:	a1 50 30 02 10       	mov    eax,ds:0x10023050
10007328:	33 c5                	xor    eax,ebp
1000732a:	50                   	push   eax
1000732b:	8d 45 f4             	lea    eax,[ebp-0xc]
1000732e:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10007334:	8b f1                	mov    esi,ecx
10007336:	6a 4c                	push   0x4c
10007338:	e8 b4 0e 00 00       	call   0x100081f1
1000733d:	83 c4 04             	add    esp,0x4
10007340:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
10007343:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000734a:	85 c0                	test   eax,eax
1000734c:	74 0b                	je     0x10007359
1000734e:	6a 00                	push   0x0
10007350:	8b c8                	mov    ecx,eax
10007352:	e8 09 c1 ff ff       	call   0x10003460
10007357:	eb 02                	jmp    0x1000735b
10007359:	33 c0                	xor    eax,eax
1000735b:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
1000735e:	8d 4e 0c             	lea    ecx,[esi+0xc]
10007361:	8d 45 f0             	lea    eax,[ebp-0x10]
10007364:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
1000736b:	50                   	push   eax
1000736c:	e8 7f fd ff ff       	call   0x100070f0
10007371:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10007374:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000737b:	59                   	pop    ecx
1000737c:	5e                   	pop    esi
1000737d:	8b e5                	mov    esp,ebp
1000737f:	5d                   	pop    ebp
10007380:	c3                   	ret
10007381:	cc                   	int3
10007382:	cc                   	int3
10007383:	cc                   	int3
10007384:	cc                   	int3
10007385:	cc                   	int3
10007386:	cc                   	int3
10007387:	cc                   	int3
10007388:	cc                   	int3
10007389:	cc                   	int3
1000738a:	cc                   	int3
1000738b:	cc                   	int3
1000738c:	cc                   	int3
1000738d:	cc                   	int3
1000738e:	cc                   	int3
1000738f:	cc                   	int3
10007390:	6a 1c                	push   0x1c
10007392:	e8 5a 0e 00 00       	call   0x100081f1
10007397:	83 c4 04             	add    esp,0x4
1000739a:	85 c0                	test   eax,eax
1000739c:	74 1f                	je     0x100073bd
1000739e:	c7 00 20 8d 01 10    	mov    DWORD PTR [eax],0x10018d20
100073a4:	8b 0d bc a1 00 10    	mov    ecx,DWORD PTR ds:0x1000a1bc
100073aa:	89 48 08             	mov    DWORD PTR [eax+0x8],ecx
100073ad:	8b 0d 50 a1 00 10    	mov    ecx,DWORD PTR ds:0x1000a150
100073b3:	89 48 0c             	mov    DWORD PTR [eax+0xc],ecx
100073b6:	c7 00 30 8d 01 10    	mov    DWORD PTR [eax],0x10018d30
100073bc:	c3                   	ret
100073bd:	33 c0                	xor    eax,eax
100073bf:	c3                   	ret
100073c0:	ff 25 50 a2 00 10    	jmp    DWORD PTR ds:0x1000a250
100073c6:	ff 25 48 a2 00 10    	jmp    DWORD PTR ds:0x1000a248
100073cc:	ff 25 f0 a1 00 10    	jmp    DWORD PTR ds:0x1000a1f0
100073d2:	ff 25 ec a1 00 10    	jmp    DWORD PTR ds:0x1000a1ec
100073d8:	ff 25 e8 a1 00 10    	jmp    DWORD PTR ds:0x1000a1e8
100073de:	ff 25 e4 a1 00 10    	jmp    DWORD PTR ds:0x1000a1e4
100073e4:	ff 25 e0 a1 00 10    	jmp    DWORD PTR ds:0x1000a1e0
100073ea:	ff 25 dc a1 00 10    	jmp    DWORD PTR ds:0x1000a1dc
100073f0:	ff 25 d8 a1 00 10    	jmp    DWORD PTR ds:0x1000a1d8
100073f6:	ff 25 d4 a1 00 10    	jmp    DWORD PTR ds:0x1000a1d4
100073fc:	ff 25 d0 a1 00 10    	jmp    DWORD PTR ds:0x1000a1d0
10007402:	ff 25 cc a1 00 10    	jmp    DWORD PTR ds:0x1000a1cc
10007408:	ff 25 c8 a1 00 10    	jmp    DWORD PTR ds:0x1000a1c8
1000740e:	ff                   	.byte 0xff
1000740f:	25                   	.byte 0x25


/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/PM_params.dll:     file format pei-i386


Disassembly of section .text:

100070f0 <.text+0x60f0>:
100070f0:	55                   	push   ebp
100070f1:	8b ec                	mov    ebp,esp
100070f3:	6a ff                	push   0xffffffff
100070f5:	68 70 9c 00 10       	push   0x10009c70
100070fa:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10007100:	50                   	push   eax
10007101:	51                   	push   ecx
10007102:	53                   	push   ebx
10007103:	56                   	push   esi
10007104:	57                   	push   edi
10007105:	a1 50 30 02 10       	mov    eax,ds:0x10023050
1000710a:	33 c5                	xor    eax,ebp
1000710c:	50                   	push   eax
1000710d:	8d 45 f4             	lea    eax,[ebp-0xc]
10007110:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10007116:	89 65 f0             	mov    DWORD PTR [ebp-0x10],esp
10007119:	8b 01                	mov    eax,DWORD PTR [ecx]
1000711b:	8b 00                	mov    eax,DWORD PTR [eax]
1000711d:	83 f8 01             	cmp    eax,0x1
10007120:	74 2b                	je     0x1000714d
10007122:	85 c0                	test   eax,eax
10007124:	74 27                	je     0x1000714d
10007126:	6a 01                	push   0x1
10007128:	68 ff ff ff 7f       	push   0x7fffffff
1000712d:	e8 4e 00 00 00       	call   0x10007180
10007132:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
10007135:	8b 09                	mov    ecx,DWORD PTR [ecx]
10007137:	89 08                	mov    DWORD PTR [eax],ecx
10007139:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000713c:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10007143:	59                   	pop    ecx
10007144:	5f                   	pop    edi
10007145:	5e                   	pop    esi
10007146:	5b                   	pop    ebx
10007147:	8b e5                	mov    esp,ebp
10007149:	5d                   	pop    ebp
1000714a:	c2 04 00             	ret    0x4
1000714d:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
10007150:	c7 45 fc 04 00 00 00 	mov    DWORD PTR [ebp-0x4],0x4
10007157:	8b 36                	mov    esi,DWORD PTR [esi]
10007159:	ff 15 44 a1 00 10    	call   DWORD PTR ds:0x1000a144
1000715f:	89 30                	mov    DWORD PTR [eax],esi
10007161:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10007164:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000716b:	59                   	pop    ecx
1000716c:	5f                   	pop    edi
1000716d:	5e                   	pop    esi
1000716e:	5b                   	pop    ebx
1000716f:	8b e5                	mov    esp,ebp
10007171:	5d                   	pop    ebp
10007172:	c2 04 00             	ret    0x4
10007175:	6a 00                	push   0x0
10007177:	6a 00                	push   0x0
10007179:	e8 52 1d 00 00       	call   0x10008ed0
1000717e:	cc                   	int3
1000717f:	cc                   	int3
10007180:	55                   	push   ebp
10007181:	8b ec                	mov    ebp,esp
10007183:	6a ff                	push   0xffffffff
10007185:	68 90 9c 00 10       	push   0x10009c90
1000718a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10007190:	50                   	push   eax
10007191:	83 ec 0c             	sub    esp,0xc
10007194:	53                   	push   ebx
10007195:	56                   	push   esi
10007196:	57                   	push   edi
10007197:	a1 50 30 02 10       	mov    eax,ds:0x10023050
1000719c:	33 c5                	xor    eax,ebp
1000719e:	50                   	push   eax
1000719f:	8d 45 f4             	lea    eax,[ebp-0xc]
100071a2:	64 a3 00 00 00 00    	mov    fs:0x0,eax
100071a8:	89 65 f0             	mov    DWORD PTR [ebp-0x10],esp
100071ab:	8b f1                	mov    esi,ecx
100071ad:	89 75 ec             	mov    DWORD PTR [ebp-0x14],esi
100071b0:	ff 15 48 a1 00 10    	call   DWORD PTR ds:0x1000a148
100071b6:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
100071b9:	8b d8                	mov    ebx,eax
100071bb:	8b ce                	mov    ecx,esi
100071bd:	8d 45 08             	lea    eax,[ebp+0x8]
100071c0:	50                   	push   eax
100071c1:	ff 15 3c a1 00 10    	call   DWORD PTR ds:0x1000a13c
100071c7:	8b f8                	mov    edi,eax
100071c9:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
100071d0:	53                   	push   ebx
100071d1:	8b ce                	mov    ecx,esi
100071d3:	89 7d e8             	mov    DWORD PTR [ebp-0x18],edi
100071d6:	ff 15 48 a1 00 10    	call   DWORD PTR ds:0x1000a148
100071dc:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
100071df:	8d 0c 88             	lea    ecx,[eax+ecx*4]
100071e2:	51                   	push   ecx
100071e3:	8b ce                	mov    ecx,esi
100071e5:	ff 15 48 a1 00 10    	call   DWORD PTR ds:0x1000a148
100071eb:	50                   	push   eax
100071ec:	8b ce                	mov    ecx,esi
100071ee:	e8 cd 00 00 00       	call   0x100072c0
100071f3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
100071f6:	8b ce                	mov    ecx,esi
100071f8:	c7 45 fc 02 00 00 00 	mov    DWORD PTR [ebp-0x4],0x2
100071ff:	8d 04 83             	lea    eax,[ebx+eax*4]
10007202:	50                   	push   eax
10007203:	ff 15 4c a1 00 10    	call   DWORD PTR ds:0x1000a14c
10007209:	50                   	push   eax
1000720a:	8b ce                	mov    ecx,esi
1000720c:	ff 15 48 a1 00 10    	call   DWORD PTR ds:0x1000a148
10007212:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
10007215:	03 4d 0c             	add    ecx,DWORD PTR [ebp+0xc]
10007218:	8d 04 88             	lea    eax,[eax+ecx*4]
1000721b:	8b ce                	mov    ecx,esi
1000721d:	50                   	push   eax
1000721e:	e8 9d 00 00 00       	call   0x100072c0
10007223:	8b 07                	mov    eax,DWORD PTR [edi]
10007225:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
1000722c:	85 c0                	test   eax,eax
1000722e:	74 13                	je     0x10007243
10007230:	83 f8 ff             	cmp    eax,0xffffffff
10007233:	74 18                	je     0x1000724d
10007235:	83 c8 ff             	or     eax,0xffffffff
10007238:	f0 0f c1 07          	lock xadd DWORD PTR [edi],eax
1000723c:	0f 95 c0             	setne  al
1000723f:	84 c0                	test   al,al
10007241:	75 0a                	jne    0x1000724d
10007243:	57                   	push   edi
10007244:	ff 15 40 a1 00 10    	call   DWORD PTR ds:0x1000a140
1000724a:	83 c4 04             	add    esp,0x4
1000724d:	8b ce                	mov    ecx,esi
1000724f:	ff 15 48 a1 00 10    	call   DWORD PTR ds:0x1000a148
10007255:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
10007258:	8d 04 88             	lea    eax,[eax+ecx*4]
1000725b:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000725e:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10007265:	59                   	pop    ecx
10007266:	5f                   	pop    edi
10007267:	5e                   	pop    esi
10007268:	5b                   	pop    ebx
10007269:	8b e5                	mov    esp,ebp
1000726b:	5d                   	pop    ebp
1000726c:	c2 08 00             	ret    0x8
1000726f:	8b                   	.byte 0x8b


; PM_spec_WEB.dll: base vtable slot2 -> _purecall; slot1 -> QListData append


/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/PM_spec_WEB.dll:     file format pei-i386


Disassembly of section .text:

10009a98 <.text+0x8a98>:
10009a98:	ff 25 8c c6 00 10    	jmp    DWORD PTR ds:0x1000c68c


/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/PM_spec_WEB.dll:     file format pei-i386


Disassembly of section .text:

100062c0 <.text+0x52c0>:
100062c0:	55                   	push   ebp
100062c1:	8b ec                	mov    ebp,esp
100062c3:	6a ff                	push   0xffffffff
100062c5:	68 ef ab 00 10       	push   0x1000abef
100062ca:	64 a1 00 00 00 00    	mov    eax,fs:0x0
100062d0:	50                   	push   eax
100062d1:	51                   	push   ecx
100062d2:	56                   	push   esi
100062d3:	a1 68 60 01 10       	mov    eax,ds:0x10016068
100062d8:	33 c5                	xor    eax,ebp
100062da:	50                   	push   eax
100062db:	8d 45 f4             	lea    eax,[ebp-0xc]
100062de:	64 a3 00 00 00 00    	mov    fs:0x0,eax
100062e4:	8b f1                	mov    esi,ecx
100062e6:	6a 64                	push   0x64
100062e8:	e8 b3 27 00 00       	call   0x10008aa0
100062ed:	83 c4 04             	add    esp,0x4
100062f0:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
100062f3:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
100062fa:	85 c0                	test   eax,eax
100062fc:	74 0b                	je     0x10006309
100062fe:	6a 00                	push   0x0
10006300:	8b c8                	mov    ecx,eax
10006302:	e8 19 b8 ff ff       	call   0x10001b20
10006307:	eb 02                	jmp    0x1000630b
10006309:	33 c0                	xor    eax,eax
1000630b:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
1000630e:	8d 4e 0c             	lea    ecx,[esi+0xc]
10006311:	8d 45 f0             	lea    eax,[ebp-0x10]
10006314:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
1000631b:	50                   	push   eax
1000631c:	e8 bf c0 ff ff       	call   0x100023e0
10006321:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10006324:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000632b:	59                   	pop    ecx
1000632c:	5e                   	pop    esi
1000632d:	8b e5                	mov    esp,ebp
1000632f:	5d                   	pop    ebp
10006330:	c3                   	ret
10006331:	cc                   	int3
10006332:	cc                   	int3
10006333:	cc                   	int3
10006334:	cc                   	int3
10006335:	cc                   	int3
10006336:	cc                   	int3
10006337:	cc                   	int3
10006338:	cc                   	int3
10006339:	cc                   	int3
1000633a:	cc                   	int3
1000633b:	cc                   	int3
1000633c:	cc                   	int3
1000633d:	cc                   	int3
1000633e:	cc                   	int3
1000633f:	cc                   	int3
10006340:	55                   	push   ebp
10006341:	8b ec                	mov    ebp,esp
10006343:	6a ff                	push   0xffffffff
10006345:	68 29 ac 00 10       	push   0x1000ac29
1000634a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10006350:	50                   	push   eax
10006351:	51                   	push   ecx
10006352:	53                   	push   ebx
10006353:	56                   	push   esi
10006354:	57                   	push   edi
10006355:	a1 68 60 01 10       	mov    eax,ds:0x10016068
1000635a:	33 c5                	xor    eax,ebp
1000635c:	50                   	push   eax
1000635d:	8d 45 f4             	lea    eax,[ebp-0xc]
10006360:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10006366:	8b d9                	mov    ebx,ecx
10006368:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
1000636f:	8b 7d 08             	mov    edi,DWORD PTR [ebp+0x8]
10006372:	a1 00 c1 00 10       	mov    eax,ds:0x1000c100
10006377:	89 07                	mov    DWORD PTR [edi],eax
10006379:	8b 03                	mov    eax,DWORD PTR [ebx]
1000637b:	8b 0f                	mov    ecx,DWORD PTR [edi]
1000637d:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10006384:	c7 45 f0 01 00 00 00 	mov    DWORD PTR [ebp-0x10],0x1
1000638b:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
1000638e:	39 41 04             	cmp    DWORD PTR [ecx+0x4],eax
10006391:	7d 1e                	jge    0x100063b1
10006393:	8b 09                	mov    ecx,DWORD PTR [ecx]
10006395:	83 f9 01             	cmp    ecx,0x1
10006398:	74 0e                	je     0x100063a8
1000639a:	85 c9                	test   ecx,ecx
1000639c:	74 0a                	je     0x100063a8
1000639e:	50                   	push   eax
1000639f:	8b cf                	mov    ecx,edi
100063a1:	e8 ca c0 ff ff       	call   0x10002470
100063a6:	eb 09                	jmp    0x100063b1
100063a8:	50                   	push   eax
100063a9:	8b cf                	mov    ecx,edi
100063ab:	ff 15 a4 c1 00 10    	call   DWORD PTR ds:0x1000c1a4
100063b1:	8b 13                	mov    edx,DWORD PTR [ebx]
100063b3:	33 f6                	xor    esi,esi
100063b5:	39 72 04             	cmp    DWORD PTR [edx+0x4],esi
100063b8:	7e 1e                	jle    0x100063d8
100063ba:	66 0f 1f 44 00 00    	nop    WORD PTR [eax+eax*1+0x0]


/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/PM_spec_WEB.dll:     file format pei-i386


Disassembly of section .text:

100023e0 <.text+0x13e0>:
100023e0:	55                   	push   ebp
100023e1:	8b ec                	mov    ebp,esp
100023e3:	6a ff                	push   0xffffffff
100023e5:	68 10 a0 00 10       	push   0x1000a010
100023ea:	64 a1 00 00 00 00    	mov    eax,fs:0x0
100023f0:	50                   	push   eax
100023f1:	51                   	push   ecx
100023f2:	53                   	push   ebx
100023f3:	56                   	push   esi
100023f4:	57                   	push   edi
100023f5:	a1 68 60 01 10       	mov    eax,ds:0x10016068
100023fa:	33 c5                	xor    eax,ebp
100023fc:	50                   	push   eax
100023fd:	8d 45 f4             	lea    eax,[ebp-0xc]
10002400:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10002406:	89 65 f0             	mov    DWORD PTR [ebp-0x10],esp
10002409:	8b 01                	mov    eax,DWORD PTR [ecx]
1000240b:	8b 00                	mov    eax,DWORD PTR [eax]
1000240d:	83 f8 01             	cmp    eax,0x1
10002410:	74 2b                	je     0x1000243d
10002412:	85 c0                	test   eax,eax
10002414:	74 27                	je     0x1000243d
10002416:	6a 01                	push   0x1
10002418:	68 ff ff ff 7f       	push   0x7fffffff
1000241d:	e8 1e 01 00 00       	call   0x10002540
10002422:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
10002425:	8b 09                	mov    ecx,DWORD PTR [ecx]
10002427:	89 08                	mov    DWORD PTR [eax],ecx
10002429:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000242c:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10002433:	59                   	pop    ecx
10002434:	5f                   	pop    edi
10002435:	5e                   	pop    esi
10002436:	5b                   	pop    ebx
10002437:	8b e5                	mov    esp,ebp
10002439:	5d                   	pop    ebp
1000243a:	c2 04 00             	ret    0x4
1000243d:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
10002440:	c7 45 fc 04 00 00 00 	mov    DWORD PTR [ebp-0x4],0x4
10002447:	8b 36                	mov    esi,DWORD PTR [esi]
10002449:	ff 15 9c c1 00 10    	call   DWORD PTR ds:0x1000c19c
1000244f:	89 30                	mov    DWORD PTR [eax],esi
10002451:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10002454:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000245b:	59                   	pop    ecx
1000245c:	5f                   	pop    edi
1000245d:	5e                   	pop    esi
1000245e:	5b                   	pop    ebx
1000245f:	8b e5                	mov    esp,ebp
10002461:	5d                   	pop    ebp
10002462:	c2 04 00             	ret    0x4
10002465:	6a 00                	push   0x0
10002467:	6a 00                	push   0x0
10002469:	e8 36 76 00 00       	call   0x10009aa4
1000246e:	cc                   	int3
1000246f:	cc                   	int3
10002470:	55                   	push   ebp
10002471:	8b ec                	mov    ebp,esp
10002473:	6a ff                	push   0xffffffff
10002475:	68 30 a0 00 10       	push   0x1000a030
1000247a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10002480:	50                   	push   eax
10002481:	83 ec 08             	sub    esp,0x8
10002484:	53                   	push   ebx
10002485:	56                   	push   esi
10002486:	57                   	push   edi
10002487:	a1 68 60 01 10       	mov    eax,ds:0x10016068
1000248c:	33 c5                	xor    eax,ebp
1000248e:	50                   	push   eax
1000248f:	8d 45 f4             	lea    eax,[ebp-0xc]
10002492:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10002498:	89 65 f0             	mov    DWORD PTR [ebp-0x10],esp
1000249b:	8b f9                	mov    edi,ecx
1000249d:	89 7d ec             	mov    DWORD PTR [ebp-0x14],edi
100024a0:	ff 15 98 c1 00 10    	call   DWORD PTR ds:0x1000c198
100024a6:	ff 75 08             	push   DWORD PTR [ebp+0x8]
100024a9:	8b cf                	mov    ecx,edi
100024ab:	8b d8                	mov    ebx,eax
100024ad:	ff 15 ac c1 00 10    	call   DWORD PTR ds:0x1000c1ac
100024b3:	8b f0                	mov    esi,eax
100024b5:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
100024bc:	53                   	push   ebx
100024bd:	8b cf                	mov    ecx,edi
100024bf:	89 75 08             	mov    DWORD PTR [ebp+0x8],esi
100024c2:	ff 15 94 c1 00 10    	call   DWORD PTR ds:0x1000c194
100024c8:	50                   	push   eax
100024c9:	8b cf                	mov    ecx,edi
100024cb:	ff 15 98 c1 00 10    	call   DWORD PTR ds:0x1000c198
100024d1:	50                   	push   eax
100024d2:	8b cf                	mov    ecx,edi
100024d4:	e8 87 3b 00 00       	call   0x10006060
100024d9:	8b 06                	mov    eax,DWORD PTR [esi]
100024db:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
100024e2:	85 c0                	test   eax,eax
100024e4:	74 13                	je     0x100024f9
100024e6:	83 f8 ff             	cmp    eax,0xffffffff
100024e9:	74 18                	je     0x10002503
100024eb:	83 c8 ff             	or     eax,0xffffffff
100024ee:	f0 0f c1 06          	lock xadd DWORD PTR [esi],eax
100024f2:	0f 95 c0             	setne  al
100024f5:	84 c0                	test   al,al
100024f7:	75 0a                	jne    0x10002503
100024f9:	56                   	push   esi
100024fa:	ff 15 a0 c1 00 10    	call   DWORD PTR ds:0x1000c1a0
10002500:	83 c4 04             	add    esp,0x4
10002503:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10002506:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000250d:	59                   	pop    ecx
1000250e:	5f                   	pop    edi
1000250f:	5e                   	pop    esi
10002510:	5b                   	pop    ebx
10002511:	8b e5                	mov    esp,ebp
10002513:	5d                   	pop    ebp
10002514:	c2 04 00             	ret    0x4
10002517:	8b 75 ec             	mov    esi,DWORD PTR [ebp-0x14]
1000251a:	ff 36                	push   DWORD PTR [esi]
1000251c:	ff 15 a0 c1 00 10    	call   DWORD PTR ds:0x1000c1a0
10002522:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10002525:	83 c4 04             	add    esp,0x4
10002528:	89 06                	mov    DWORD PTR [esi],eax
1000252a:	6a 00                	push   0x0
1000252c:	6a 00                	push   0x0
1000252e:	e8 71 75 00 00       	call   0x10009aa4
10002533:	cc                   	int3
10002534:	cc                   	int3
10002535:	cc                   	int3
10002536:	cc                   	int3
10002537:	cc                   	int3
10002538:	cc                   	int3
10002539:	cc                   	int3
1000253a:	cc                   	int3
1000253b:	cc                   	int3
1000253c:	cc                   	int3
1000253d:	cc                   	int3
1000253e:	cc                   	int3
1000253f:	cc                   	int3
10002540:	55                   	push   ebp
10002541:	8b ec                	mov    ebp,esp
10002543:	6a ff                	push   0xffffffff
10002545:	68 50 a0 00 10       	push   0x1000a050
1000254a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10002550:	50                   	push   eax
10002551:	83 ec 0c             	sub    esp,0xc
10002554:	53                   	push   ebx
10002555:	56                   	push   esi
10002556:	57                   	push   edi
10002557:	a1 68 60 01 10       	mov    eax,ds:0x10016068
1000255c:	33 c5                	xor    eax,ebp
1000255e:	50                   	push   eax
1000255f:	8d                   	.byte 0x8d


; PM_matrix_web.dll: base vtable slot2 -> _purecall; slot1 -> QListData append


/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/PM_matrix_web.dll:     file format pei-i386


Disassembly of section .text:

10006a88 <.text+0x5a88>:
10006a88:	ff 25 64 85 00 10    	jmp    DWORD PTR ds:0x10008564


/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/PM_matrix_web.dll:     file format pei-i386


Disassembly of section .text:

10002840 <.text+0x1840>:
10002840:	55                   	push   ebp
10002841:	8b ec                	mov    ebp,esp
10002843:	6a ff                	push   0xffffffff
10002845:	68 3f 70 00 10       	push   0x1000703f
1000284a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10002850:	50                   	push   eax
10002851:	83 ec 08             	sub    esp,0x8
10002854:	56                   	push   esi
10002855:	57                   	push   edi
10002856:	a1 34 f0 00 10       	mov    eax,ds:0x1000f034
1000285b:	33 c5                	xor    eax,ebp
1000285d:	50                   	push   eax
1000285e:	8d 45 f4             	lea    eax,[ebp-0xc]
10002861:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10002867:	8b f9                	mov    edi,ecx
10002869:	6a 60                	push   0x60
1000286b:	e8 1b 32 00 00       	call   0x10005a8b
10002870:	8b f0                	mov    esi,eax
10002872:	83 c4 04             	add    esp,0x4
10002875:	89 75 ec             	mov    DWORD PTR [ebp-0x14],esi
10002878:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000287f:	85 f6                	test   esi,esi
10002881:	74 3b                	je     0x100028be
10002883:	6a 00                	push   0x0
10002885:	8b ce                	mov    ecx,esi
10002887:	e8 04 10 00 00       	call   0x10003890
1000288c:	8d 45 ec             	lea    eax,[ebp-0x14]
1000288f:	c7 06 9c 86 00 10    	mov    DWORD PTR [esi],0x1000869c
10002895:	50                   	push   eax
10002896:	8d 4d f3             	lea    ecx,[ebp-0xd]
10002899:	c7 46 08 78 87 00 10 	mov    DWORD PTR [esi+0x8],0x10008778
100028a0:	c6 45 f3 00          	mov    BYTE PTR [ebp-0xd],0x0
100028a4:	e8 37 ee ff ff       	call   0x100016e0
100028a9:	50                   	push   eax
100028aa:	8d 4e 1c             	lea    ecx,[esi+0x1c]
100028ad:	ff 15 f0 80 00 10    	call   DWORD PTR ds:0x100080f0
100028b3:	8d 4d ec             	lea    ecx,[ebp-0x14]
100028b6:	ff 15 e8 80 00 10    	call   DWORD PTR ds:0x100080e8
100028bc:	eb 02                	jmp    0x100028c0
100028be:	33 f6                	xor    esi,esi
100028c0:	8d 45 ec             	lea    eax,[ebp-0x14]
100028c3:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
100028ca:	50                   	push   eax
100028cb:	8d 4f 0c             	lea    ecx,[edi+0xc]
100028ce:	89 75 ec             	mov    DWORD PTR [ebp-0x14],esi
100028d1:	e8 3a f1 ff ff       	call   0x10001a10
100028d6:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
100028d9:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
100028e0:	59                   	pop    ecx
100028e1:	5f                   	pop    edi
100028e2:	5e                   	pop    esi
100028e3:	8b e5                	mov    esp,ebp
100028e5:	5d                   	pop    ebp
100028e6:	c3                   	ret
100028e7:	cc                   	int3
100028e8:	cc                   	int3
100028e9:	cc                   	int3
100028ea:	cc                   	int3
100028eb:	cc                   	int3
100028ec:	cc                   	int3
100028ed:	cc                   	int3
100028ee:	cc                   	int3
100028ef:	cc                   	int3
100028f0:	6a 1c                	push   0x1c
100028f2:	e8 94 31 00 00       	call   0x10005a8b
100028f7:	83 c4 04             	add    esp,0x4
100028fa:	85 c0                	test   eax,eax
100028fc:	74 31                	je     0x1000292f
100028fe:	0f 57 c0             	xorps  xmm0,xmm0
10002901:	0f 11 00             	movups XMMWORD PTR [eax],xmm0
10002904:	66 0f d6 40 10       	movq   QWORD PTR [eax+0x10],xmm0
10002909:	c7 40 18 00 00 00 00 	mov    DWORD PTR [eax+0x18],0x0
10002910:	c7 00 8c 86 00 10    	mov    DWORD PTR [eax],0x1000868c
10002916:	8b 0d 50 81 00 10    	mov    ecx,DWORD PTR ds:0x10008150
1000291c:	89 48 08             	mov    DWORD PTR [eax+0x8],ecx
1000291f:	8b 0d 54 81 00 10    	mov    ecx,DWORD PTR ds:0x10008154
10002925:	89 48 0c             	mov    DWORD PTR [eax+0xc],ecx
10002928:	c7 00 98 87 00 10    	mov    DWORD PTR [eax],0x10008798
1000292e:	c3                   	ret
1000292f:	33 c0                	xor    eax,eax
10002931:	c3                   	ret
10002932:	ff 25 6c 81 00 10    	jmp    DWORD PTR ds:0x1000816c
10002938:	ff 25 68 81 00 10    	jmp    DWORD PTR ds:0x10008168
1000293e:	ff                   	.byte 0xff
1000293f:	25                   	.byte 0x25


/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/PM_matrix_web.dll:     file format pei-i386


Disassembly of section .text:

10001a10 <.text+0xa10>:
10001a10:	55                   	push   ebp
10001a11:	8b ec                	mov    ebp,esp
10001a13:	6a ff                	push   0xffffffff
10001a15:	68 a0 6e 00 10       	push   0x10006ea0
10001a1a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10001a20:	50                   	push   eax
10001a21:	51                   	push   ecx
10001a22:	53                   	push   ebx
10001a23:	56                   	push   esi
10001a24:	57                   	push   edi
10001a25:	a1 34 f0 00 10       	mov    eax,ds:0x1000f034
10001a2a:	33 c5                	xor    eax,ebp
10001a2c:	50                   	push   eax
10001a2d:	8d 45 f4             	lea    eax,[ebp-0xc]
10001a30:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10001a36:	89 65 f0             	mov    DWORD PTR [ebp-0x10],esp
10001a39:	8b 01                	mov    eax,DWORD PTR [ecx]
10001a3b:	8b 00                	mov    eax,DWORD PTR [eax]
10001a3d:	83 f8 01             	cmp    eax,0x1
10001a40:	74 2b                	je     0x10001a6d
10001a42:	85 c0                	test   eax,eax
10001a44:	74 27                	je     0x10001a6d
10001a46:	6a 01                	push   0x1
10001a48:	68 ff ff ff 7f       	push   0x7fffffff
10001a4d:	e8 ce 00 00 00       	call   0x10001b20
10001a52:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
10001a55:	8b 09                	mov    ecx,DWORD PTR [ecx]
10001a57:	89 08                	mov    DWORD PTR [eax],ecx
10001a59:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10001a5c:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10001a63:	59                   	pop    ecx
10001a64:	5f                   	pop    edi
10001a65:	5e                   	pop    esi
10001a66:	5b                   	pop    ebx
10001a67:	8b e5                	mov    esp,ebp
10001a69:	5d                   	pop    ebp
10001a6a:	c2 04 00             	ret    0x4
10001a6d:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
10001a70:	c7 45 fc 04 00 00 00 	mov    DWORD PTR [ebp-0x4],0x4
10001a77:	8b 36                	mov    esi,DWORD PTR [esi]
10001a79:	ff 15 44 81 00 10    	call   DWORD PTR ds:0x10008144
10001a7f:	89 30                	mov    DWORD PTR [eax],esi
10001a81:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10001a84:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10001a8b:	59                   	pop    ecx
10001a8c:	5f                   	pop    edi
10001a8d:	5e                   	pop    esi
10001a8e:	5b                   	pop    ebx
10001a8f:	8b e5                	mov    esp,ebp
10001a91:	5d                   	pop    ebp
10001a92:	c2 04 00             	ret    0x4
10001a95:	6a 00                	push   0x0
10001a97:	6a 00                	push   0x0
10001a99:	e8 f6 4f 00 00       	call   0x10006a94
10001a9e:	cc                   	int3
10001a9f:	cc                   	int3
10001aa0:	55                   	push   ebp
10001aa1:	8b ec                	mov    ebp,esp
10001aa3:	6a ff                	push   0xffffffff
10001aa5:	68 c0 6e 00 10       	push   0x10006ec0
10001aaa:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10001ab0:	50                   	push   eax
10001ab1:	53                   	push   ebx
10001ab2:	56                   	push   esi
10001ab3:	57                   	push   edi
10001ab4:	a1 34 f0 00 10       	mov    eax,ds:0x1000f034
10001ab9:	33 c5                	xor    eax,ebp
10001abb:	50                   	push   eax
10001abc:	8d 45 f4             	lea    eax,[ebp-0xc]
10001abf:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10001ac5:	8b f9                	mov    edi,ecx
10001ac7:	8b 07                	mov    eax,DWORD PTR [edi]
10001ac9:	8b 58 04             	mov    ebx,DWORD PTR [eax+0x4]
10001acc:	8b f3                	mov    esi,ebx
10001ace:	80 7b 0d 00          	cmp    BYTE PTR [ebx+0xd],0x0
10001ad2:	75 1d                	jne    0x10001af1
10001ad4:	ff 76 08             	push   DWORD PTR [esi+0x8]
10001ad7:	8b cf                	mov    ecx,edi
10001ad9:	e8 62 fd ff ff       	call   0x10001840
10001ade:	8b 36                	mov    esi,DWORD PTR [esi]
10001ae0:	53                   	push   ebx
10001ae1:	e8 d8 3f 00 00       	call   0x10005abe
10001ae6:	83 c4 04             	add    esp,0x4
10001ae9:	8b de                	mov    ebx,esi
10001aeb:	80 7e 0d 00          	cmp    BYTE PTR [esi+0xd],0x0
10001aef:	74 e3                	je     0x10001ad4
10001af1:	8b 07                	mov    eax,DWORD PTR [edi]
10001af3:	89 40 04             	mov    DWORD PTR [eax+0x4],eax
10001af6:	8b 07                	mov    eax,DWORD PTR [edi]
10001af8:	89 00                	mov    DWORD PTR [eax],eax
10001afa:	8b 07                	mov    eax,DWORD PTR [edi]
10001afc:	89 40 08             	mov    DWORD PTR [eax+0x8],eax
10001aff:	c7 47 04 00 00 00 00 	mov    DWORD PTR [edi+0x4],0x0
10001b06:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10001b09:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10001b10:	59                   	pop    ecx
10001b11:	5f                   	pop    edi
10001b12:	5e                   	pop    esi
10001b13:	5b                   	pop    ebx
10001b14:	8b e5                	mov    esp,ebp
10001b16:	5d                   	pop    ebp
10001b17:	c3                   	ret
10001b18:	cc                   	int3
10001b19:	cc                   	int3
10001b1a:	cc                   	int3
10001b1b:	cc                   	int3
10001b1c:	cc                   	int3
10001b1d:	cc                   	int3
10001b1e:	cc                   	int3
10001b1f:	cc                   	int3
10001b20:	55                   	push   ebp
10001b21:	8b ec                	mov    ebp,esp
10001b23:	6a ff                	push   0xffffffff
10001b25:	68 e0 6e 00 10       	push   0x10006ee0
10001b2a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10001b30:	50                   	push   eax
10001b31:	83 ec 0c             	sub    esp,0xc
10001b34:	53                   	push   ebx
10001b35:	56                   	push   esi
10001b36:	57                   	push   edi
10001b37:	a1 34 f0 00 10       	mov    eax,ds:0x1000f034
10001b3c:	33 c5                	xor    eax,ebp
10001b3e:	50                   	push   eax
10001b3f:	8d 45 f4             	lea    eax,[ebp-0xc]
10001b42:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10001b48:	89 65 f0             	mov    DWORD PTR [ebp-0x10],esp
10001b4b:	8b f1                	mov    esi,ecx
10001b4d:	89 75 ec             	mov    DWORD PTR [ebp-0x14],esi
10001b50:	ff 15 48 81 00 10    	call   DWORD PTR ds:0x10008148
10001b56:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
10001b59:	8b d8                	mov    ebx,eax
10001b5b:	8b ce                	mov    ecx,esi
10001b5d:	8d 45 08             	lea    eax,[ebp+0x8]
10001b60:	50                   	push   eax
10001b61:	ff 15 3c 81 00 10    	call   DWORD PTR ds:0x1000813c
10001b67:	8b f8                	mov    edi,eax
10001b69:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10001b70:	53                   	push   ebx
10001b71:	8b ce                	mov    ecx,esi
10001b73:	89 7d e8             	mov    DWORD PTR [ebp-0x18],edi
10001b76:	ff 15 48 81 00 10    	call   DWORD PTR ds:0x10008148
10001b7c:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
10001b7f:	8d 0c 88             	lea    ecx,[eax+ecx*4]
10001b82:	51                   	push   ecx
10001b83:	8b ce                	mov    ecx,esi
10001b85:	ff 15 48 81 00 10    	call   DWORD PTR ds:0x10008148
10001b8b:	50                   	push   eax
10001b8c:	8b ce                	mov    ecx,esi
10001b8e:	e8                   	.byte 0xe8
10001b8f:	bd                   	.byte 0xbd


; Model_Visualiser.dll: base vtable slot2 -> _purecall; slot1 -> QListData append


/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/Model_Visualiser.dll:     file format pei-i386


Disassembly of section .text:

1000b17e <.text+0xa17e>:
1000b17e:	ff 25 80 d5 00 10    	jmp    DWORD PTR ds:0x1000d580


/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/Model_Visualiser.dll:     file format pei-i386


Disassembly of section .text:

10009c60 <.text+0x8c60>:
10009c60:	55                   	push   ebp
10009c61:	8b ec                	mov    ebp,esp
10009c63:	6a ff                	push   0xffffffff
10009c65:	68 a7 bf 00 10       	push   0x1000bfa7
10009c6a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10009c70:	50                   	push   eax
10009c71:	83 ec 08             	sub    esp,0x8
10009c74:	56                   	push   esi
10009c75:	57                   	push   edi
10009c76:	a1 6c 50 01 10       	mov    eax,ds:0x1001506c
10009c7b:	33 c5                	xor    eax,ebp
10009c7d:	50                   	push   eax
10009c7e:	8d 45 f4             	lea    eax,[ebp-0xc]
10009c81:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10009c87:	8b f9                	mov    edi,ecx
10009c89:	6a 64                	push   0x64
10009c8b:	e8 10 07 00 00       	call   0x1000a3a0
10009c90:	8b f0                	mov    esi,eax
10009c92:	83 c4 04             	add    esp,0x4
10009c95:	89 75 ec             	mov    DWORD PTR [ebp-0x14],esi
10009c98:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10009c9f:	85 f6                	test   esi,esi
10009ca1:	74 48                	je     0x10009ceb
10009ca3:	6a 00                	push   0x0
10009ca5:	8b ce                	mov    ecx,esi
10009ca7:	e8 f4 04 00 00       	call   0x1000a1a0
10009cac:	56                   	push   esi
10009cad:	8d 4e 28             	lea    ecx,[esi+0x28]
10009cb0:	c6 45 fc 01          	mov    BYTE PTR [ebp-0x4],0x1
10009cb4:	c7 06 b4 e4 00 10    	mov    DWORD PTR [esi],0x1000e4b4
10009cba:	c7 46 08 88 e5 00 10 	mov    DWORD PTR [esi+0x8],0x1000e588
10009cc1:	e8 0a f6 ff ff       	call   0x100092d0
10009cc6:	8d 45 ec             	lea    eax,[ebp-0x14]
10009cc9:	c6 45 f3 00          	mov    BYTE PTR [ebp-0xd],0x0
10009ccd:	50                   	push   eax
10009cce:	8d 4d f3             	lea    ecx,[ebp-0xd]
10009cd1:	e8 9a db ff ff       	call   0x10007870
10009cd6:	50                   	push   eax
10009cd7:	8d 4e 1c             	lea    ecx,[esi+0x1c]
10009cda:	ff 15 64 d1 00 10    	call   DWORD PTR ds:0x1000d164
10009ce0:	8d 4d ec             	lea    ecx,[ebp-0x14]
10009ce3:	ff 15 68 d1 00 10    	call   DWORD PTR ds:0x1000d168
10009ce9:	eb 02                	jmp    0x10009ced
10009ceb:	33 f6                	xor    esi,esi
10009ced:	8d 45 ec             	lea    eax,[ebp-0x14]
10009cf0:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
10009cf7:	50                   	push   eax
10009cf8:	8d 4f 0c             	lea    ecx,[edi+0xc]
10009cfb:	89 75 ec             	mov    DWORD PTR [ebp-0x14],esi
10009cfe:	e8 2d e2 ff ff       	call   0x10007f30
10009d03:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10009d06:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10009d0d:	59                   	pop    ecx
10009d0e:	5f                   	pop    edi
10009d0f:	5e                   	pop    esi
10009d10:	8b e5                	mov    esp,ebp
10009d12:	5d                   	pop    ebp
10009d13:	c3                   	ret
10009d14:	cc                   	int3
10009d15:	cc                   	int3
10009d16:	cc                   	int3
10009d17:	cc                   	int3
10009d18:	cc                   	int3
10009d19:	cc                   	int3
10009d1a:	cc                   	int3
10009d1b:	cc                   	int3
10009d1c:	cc                   	int3
10009d1d:	cc                   	int3
10009d1e:	cc                   	int3
10009d1f:	cc                   	int3
10009d20:	6a 1c                	push   0x1c
10009d22:	e8 79 06 00 00       	call   0x1000a3a0
10009d27:	83 c4 04             	add    esp,0x4
10009d2a:	85 c0                	test   eax,eax
10009d2c:	74 1f                	je     0x10009d4d
10009d2e:	c7 00 a4 e4 00 10    	mov    DWORD PTR [eax],0x1000e4a4
10009d34:	8b 0d b4 d0 00 10    	mov    ecx,DWORD PTR ds:0x1000d0b4
10009d3a:	89 48 08             	mov    DWORD PTR [eax+0x8],ecx
10009d3d:	8b 0d b0 d0 00 10    	mov    ecx,DWORD PTR ds:0x1000d0b0
10009d43:	89 48 0c             	mov    DWORD PTR [eax+0xc],ecx
10009d46:	c7 00 a8 e5 00 10    	mov    DWORD PTR [eax],0x1000e5a8
10009d4c:	c3                   	ret
10009d4d:	33 c0                	xor    eax,eax
10009d4f:	c3                   	ret
10009d50:	ff 25 98 d0 00 10    	jmp    DWORD PTR ds:0x1000d098
10009d56:	ff 25 9c d0 00 10    	jmp    DWORD PTR ds:0x1000d09c
10009d5c:	ff                   	.byte 0xff
10009d5d:	25                   	.byte 0x25
10009d5e:	a0                   	.byte 0xa0
10009d5f:	d0                   	.byte 0xd0


/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/Model_Visualiser.dll:     file format pei-i386


Disassembly of section .text:

10007f30 <.text+0x6f30>:
10007f30:	55                   	push   ebp
10007f31:	8b ec                	mov    ebp,esp
10007f33:	6a ff                	push   0xffffffff
10007f35:	68 d0 ba 00 10       	push   0x1000bad0
10007f3a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10007f40:	50                   	push   eax
10007f41:	51                   	push   ecx
10007f42:	53                   	push   ebx
10007f43:	56                   	push   esi
10007f44:	57                   	push   edi
10007f45:	a1 6c 50 01 10       	mov    eax,ds:0x1001506c
10007f4a:	33 c5                	xor    eax,ebp
10007f4c:	50                   	push   eax
10007f4d:	8d 45 f4             	lea    eax,[ebp-0xc]
10007f50:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10007f56:	89 65 f0             	mov    DWORD PTR [ebp-0x10],esp
10007f59:	8b 01                	mov    eax,DWORD PTR [ecx]
10007f5b:	8b 00                	mov    eax,DWORD PTR [eax]
10007f5d:	83 f8 01             	cmp    eax,0x1
10007f60:	74 2b                	je     0x10007f8d
10007f62:	85 c0                	test   eax,eax
10007f64:	74 27                	je     0x10007f8d
10007f66:	6a 01                	push   0x1
10007f68:	68 ff ff ff 7f       	push   0x7fffffff
10007f6d:	e8 4e 02 00 00       	call   0x100081c0
10007f72:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
10007f75:	8b 09                	mov    ecx,DWORD PTR [ecx]
10007f77:	89 08                	mov    DWORD PTR [eax],ecx
10007f79:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10007f7c:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10007f83:	59                   	pop    ecx
10007f84:	5f                   	pop    edi
10007f85:	5e                   	pop    esi
10007f86:	5b                   	pop    ebx
10007f87:	8b e5                	mov    esp,ebp
10007f89:	5d                   	pop    ebp
10007f8a:	c2 04 00             	ret    0x4
10007f8d:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
10007f90:	c7 45 fc 04 00 00 00 	mov    DWORD PTR [ebp-0x4],0x4
10007f97:	8b 36                	mov    esi,DWORD PTR [esi]
10007f99:	ff 15 ec d0 00 10    	call   DWORD PTR ds:0x1000d0ec
10007f9f:	89 30                	mov    DWORD PTR [eax],esi
10007fa1:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10007fa4:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10007fab:	59                   	pop    ecx
10007fac:	5f                   	pop    edi
10007fad:	5e                   	pop    esi
10007fae:	5b                   	pop    ebx
10007faf:	8b e5                	mov    esp,ebp
10007fb1:	5d                   	pop    ebp
10007fb2:	c2 04 00             	ret    0x4
10007fb5:	6a 00                	push   0x0
10007fb7:	6a 00                	push   0x0
10007fb9:	e8 a2 31 00 00       	call   0x1000b160
10007fbe:	cc                   	int3
10007fbf:	cc                   	int3
10007fc0:	55                   	push   ebp
10007fc1:	8b ec                	mov    ebp,esp
10007fc3:	6a ff                	push   0xffffffff
10007fc5:	68 f0 ba 00 10       	push   0x1000baf0
10007fca:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10007fd0:	50                   	push   eax
10007fd1:	51                   	push   ecx
10007fd2:	53                   	push   ebx
10007fd3:	56                   	push   esi
10007fd4:	57                   	push   edi
10007fd5:	a1 6c 50 01 10       	mov    eax,ds:0x1001506c
10007fda:	33 c5                	xor    eax,ebp
10007fdc:	50                   	push   eax
10007fdd:	8d 45 f4             	lea    eax,[ebp-0xc]
10007fe0:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10007fe6:	89 65 f0             	mov    DWORD PTR [ebp-0x10],esp
10007fe9:	8b f1                	mov    esi,ecx
10007feb:	8b 06                	mov    eax,DWORD PTR [esi]
10007fed:	8b 00                	mov    eax,DWORD PTR [eax]
10007fef:	83 f8 01             	cmp    eax,0x1
10007ff2:	74 33                	je     0x10008027
10007ff4:	85 c0                	test   eax,eax
10007ff6:	74 2f                	je     0x10008027
10007ff8:	6a 01                	push   0x1
10007ffa:	68 ff ff ff 7f       	push   0x7fffffff
10007fff:	e8 fc 02 00 00       	call   0x10008300
10008004:	85 c0                	test   eax,eax
10008006:	74 0b                	je     0x10008013
10008008:	ff 75 08             	push   DWORD PTR [ebp+0x8]
1000800b:	8b c8                	mov    ecx,eax
1000800d:	ff 15 6c d1 00 10    	call   DWORD PTR ds:0x1000d16c
10008013:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10008016:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000801d:	59                   	pop    ecx
1000801e:	5f                   	pop    edi
1000801f:	5e                   	pop    esi
10008020:	5b                   	pop    ebx
10008021:	8b e5                	mov    esp,ebp
10008023:	5d                   	pop    ebp
10008024:	c2 04 00             	ret    0x4
10008027:	ff 75 08             	push   DWORD PTR [ebp+0x8]
1000802a:	8d 4d 08             	lea    ecx,[ebp+0x8]
1000802d:	ff 15 6c d1 00 10    	call   DWORD PTR ds:0x1000d16c
10008033:	8b ce                	mov    ecx,esi
10008035:	c7 45 fc 04 00 00 00 	mov    DWORD PTR [ebp-0x4],0x4
1000803c:	ff 15 ec d0 00 10    	call   DWORD PTR ds:0x1000d0ec
10008042:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
10008045:	89 08                	mov    DWORD PTR [eax],ecx
10008047:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000804a:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10008051:	59                   	pop    ecx
10008052:	5f                   	pop    edi
10008053:	5e                   	pop    esi
10008054:	5b                   	pop    ebx
10008055:	8b e5                	mov    esp,ebp
10008057:	5d                   	pop    ebp
10008058:	c2 04 00             	ret    0x4
1000805b:	8d 4d 08             	lea    ecx,[ebp+0x8]
1000805e:	ff 15 68 d1 00 10    	call   DWORD PTR ds:0x1000d168
10008064:	6a 00                	push   0x0
10008066:	6a 00                	push   0x0
10008068:	e8 f3 30 00 00       	call   0x1000b160
1000806d:	cc                   	int3
1000806e:	cc                   	int3
1000806f:	cc                   	int3
10008070:	56                   	push   esi
10008071:	8b f1                	mov    esi,ecx
10008073:	8b 06                	mov    eax,DWORD PTR [esi]
10008075:	8b 08                	mov    ecx,DWORD PTR [eax]
10008077:	83 f9 01             	cmp    ecx,0x1
1000807a:	74 47                	je     0x100080c3
1000807c:	85 c9                	test   ecx,ecx
1000807e:	74 43                	je     0x100080c3
10008080:	f7 40 08 ff ff ff 7f 	test   DWORD PTR [eax+0x8],0x7fffffff
10008087:	75 1c                	jne    0x100080a5
10008089:	6a 02                	push   0x2
1000808b:	6a 00                	push   0x0
1000808d:	6a 04                	push   0x4
1000808f:	6a 04                	push   0x4
10008091:	ff 15 7c d1 00 10    	call   DWORD PTR ds:0x1000d17c
10008097:	8b c8                	mov    ecx,eax
10008099:	89 06                	mov    DWORD PTR [esi],eax
1000809b:	83 c4 10             	add    esp,0x10
1000809e:	8b 41 0c             	mov    eax,DWORD PTR [ecx+0xc]
100080a1:	03 c1                	add    eax,ecx
100080a3:	5e                   	pop    esi
100080a4:	c3                   	ret
100080a5:	51                   	push   ecx
100080a6:	8b c4                	mov    eax,esp
100080a8:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
100080ae:	8b 0e                	mov    ecx,DWORD PTR [esi]


; IS.exe: module-registry cleanup function 0x00418740


/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/IS.exe:     file format pei-i386


Disassembly of section .text:

00418740 <.text+0x17740>:
  418740:	8b 0d b8 96 46 00    	mov    ecx,DWORD PTR ds:0x4696b8
  418746:	8b 01                	mov    eax,DWORD PTR [ecx]
  418748:	85 c0                	test   eax,eax
  41874a:	74 19                	je     0x418765
  41874c:	83 f8 ff             	cmp    eax,0xffffffff
  41874f:	74 22                	je     0x418773
  418751:	83 c8 ff             	or     eax,0xffffffff
  418754:	f0 0f c1 01          	lock xadd DWORD PTR [ecx],eax
  418758:	0f 95 c0             	setne  al
  41875b:	84 c0                	test   al,al
  41875d:	75 14                	jne    0x418773
  41875f:	8b 0d b8 96 46 00    	mov    ecx,DWORD PTR ds:0x4696b8
  418765:	6a 04                	push   0x4
  418767:	6a 04                	push   0x4
  418769:	51                   	push   ecx
  41876a:	ff 15 e0 92 41 00    	call   DWORD PTR ds:0x4192e0
  418770:	83 c4 0c             	add    esp,0xc
  418773:	c3                   	ret
