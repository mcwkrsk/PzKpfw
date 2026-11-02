; Stage 1.7: IsModule descriptor/factory/widget virtual implementations

; Extracted from SHA-pinned PE32 images; GNU objdump; static evidence only.


; ===== PM_auto.dll =====

; loadModule 0x10002850

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/PM_auto.dll:     file format pei-i386


Disassembly of section .text:

10002850 <.text+0x1850>:
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
1000289e:	ff                   	.byte 0xff
1000289f:	25                   	.byte 0x25

; IsModule slot[0] no-op 0x10002c70


/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/PM_auto.dll:     file format pei-i386


Disassembly of section .text:

10002c70 <.text+0x1c70>:
10002c70:	c3                   	ret
10002c71:	cc                   	int3
10002c72:	cc                   	int3
10002c73:	cc                   	int3
10002c74:	cc                   	int3
10002c75:	cc                   	int3
10002c76:	cc                   	int3
10002c77:	cc                   	int3
10002c78:	cc                   	int3
10002c79:	cc                   	int3
10002c7a:	cc                   	int3
10002c7b:	cc                   	int3
10002c7c:	cc                   	int3
10002c7d:	cc                   	int3
10002c7e:	cc                   	int3
10002c7f:	cc                   	int3

; IsModule slot[1] create-widget 0x100027d0

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
100028ce:	ff 25 c4 24 02 10    	jmp    DWORD PTR ds:0x100224c4
100028d4:	ff 25 c8 24 02 10    	jmp    DWORD PTR ds:0x100224c8
100028da:	ff 25 a0 26 02 10    	jmp    DWORD PTR ds:0x100226a0
100028e0:	ff 25 9c 26 02 10    	jmp    DWORD PTR ds:0x1002269c
100028e6:	ff 25 98 26 02 10    	jmp    DWORD PTR ds:0x10022698
100028ec:	ff 25 94 26 02 10    	jmp    DWORD PTR ds:0x10022694
100028f2:	ff 25 90 26 02 10    	jmp    DWORD PTR ds:0x10022690
100028f8:	ff 25 8c 26 02 10    	jmp    DWORD PTR ds:0x1002268c
100028fe:	ff 25 88 26 02 10    	jmp    DWORD PTR ds:0x10022688
10002904:	ff 25 84 26 02 10    	jmp    DWORD PTR ds:0x10022684
1000290a:	ff 25 80 26 02 10    	jmp    DWORD PTR ds:0x10022680
10002910:	ff 25 7c 26 02 10    	jmp    DWORD PTR ds:0x1002267c
10002916:	ff 25 78 26 02 10    	jmp    DWORD PTR ds:0x10022678
1000291c:	ff 25 74 26 02 10    	jmp    DWORD PTR ds:0x10022674
10002922:	ff 25 70 26 02 10    	jmp    DWORD PTR ds:0x10022670
10002928:	ff 25 6c 26 02 10    	jmp    DWORD PTR ds:0x1002266c
1000292e:	ff 25 68 26 02 10    	jmp    DWORD PTR ds:0x10022668
10002934:	ff 25 2c 28 02 10    	jmp    DWORD PTR ds:0x1002282c
1000293a:	ff 25 60 26 02 10    	jmp    DWORD PTR ds:0x10022660
10002940:	ff 25 5c 26 02 10    	jmp    DWORD PTR ds:0x1002265c
10002946:	ff 25 64 26 02 10    	jmp    DWORD PTR ds:0x10022664
1000294c:	ff                   	.byte 0xff
1000294d:	25                   	.byte 0x25
1000294e:	a4                   	movs   BYTE PTR es:[edi],BYTE PTR ds:[esi]
1000294f:	26                   	es

; IsModule slot[2] descriptor 0x100027b0

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/PM_auto.dll:     file format pei-i386


Disassembly of section .text:

100027b0 <.text+0x17b0>:
100027b0:	6a 0c                	push   0xc
100027b2:	e8 c4 a4 01 00       	call   0x1001cc7b
100027b7:	83 c4 04             	add    esp,0x4
100027ba:	c7 40 08 68 79 05 10 	mov    DWORD PTR [eax+0x8],0x10057968
100027c1:	c7 40 04 cd cc cc 3d 	mov    DWORD PTR [eax+0x4],0x3dcccccd
100027c8:	c7 00 68 79 05 10    	mov    DWORD PTR [eax],0x10057968
100027ce:	c3                   	ret
100027cf:	cc                   	int3
100027d0:	55                   	push   ebp
100027d1:	8b ec                	mov    ebp,esp
100027d3:	6a ff                	push   0xffffffff
100027d5:	68 a2 e7 01 10       	push   0x1001e7a2
100027da:	64 a1 00 00 00 00    	mov    eax,fs:0x0


; ===== PM_params.dll =====

; loadModule 0x10007390

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/PM_params.dll:     file format pei-i386


Disassembly of section .text:

10007390 <.text+0x6390>:
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
100073de:	ff                   	.byte 0xff
100073df:	25                   	.byte 0x25

; IsModule slot[0] no-op 0x10007e10


/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/PM_params.dll:     file format pei-i386


Disassembly of section .text:

10007e10 <.text+0x6e10>:
10007e10:	c3                   	ret
10007e11:	cc                   	int3
10007e12:	cc                   	int3
10007e13:	cc                   	int3
10007e14:	cc                   	int3
10007e15:	cc                   	int3
10007e16:	cc                   	int3
10007e17:	cc                   	int3
10007e18:	cc                   	int3
10007e19:	cc                   	int3
10007e1a:	cc                   	int3
10007e1b:	cc                   	int3
10007e1c:	cc                   	int3
10007e1d:	cc                   	int3
10007e1e:	cc                   	int3
10007e1f:	cc                   	int3

; IsModule slot[1] create-widget 0x10007310

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
1000740e:	ff 25 c4 a1 00 10    	jmp    DWORD PTR ds:0x1000a1c4
10007414:	ff 25 c0 a1 00 10    	jmp    DWORD PTR ds:0x1000a1c0
1000741a:	ff 25 b0 a1 00 10    	jmp    DWORD PTR ds:0x1000a1b0
10007420:	ff 25 ac a1 00 10    	jmp    DWORD PTR ds:0x1000a1ac
10007426:	ff 25 a8 a1 00 10    	jmp    DWORD PTR ds:0x1000a1a8
1000742c:	ff 25 a4 a1 00 10    	jmp    DWORD PTR ds:0x1000a1a4
10007432:	ff 25 a0 a1 00 10    	jmp    DWORD PTR ds:0x1000a1a0
10007438:	ff 25 9c a1 00 10    	jmp    DWORD PTR ds:0x1000a19c
1000743e:	ff 25 90 a2 00 10    	jmp    DWORD PTR ds:0x1000a290
10007444:	ff 25 8c a2 00 10    	jmp    DWORD PTR ds:0x1000a28c
1000744a:	ff 25 88 a2 00 10    	jmp    DWORD PTR ds:0x1000a288
10007450:	ff 25 84 a2 00 10    	jmp    DWORD PTR ds:0x1000a284
10007456:	ff 25 80 a2 00 10    	jmp    DWORD PTR ds:0x1000a280
1000745c:	ff 25 7c a2 00 10    	jmp    DWORD PTR ds:0x1000a27c
10007462:	ff 25 78 a2 00 10    	jmp    DWORD PTR ds:0x1000a278
10007468:	ff 25 74 a2 00 10    	jmp    DWORD PTR ds:0x1000a274
1000746e:	ff 25 70 a2 00 10    	jmp    DWORD PTR ds:0x1000a270
10007474:	ff 25 6c a2 00 10    	jmp    DWORD PTR ds:0x1000a26c
1000747a:	ff 25 68 a2 00 10    	jmp    DWORD PTR ds:0x1000a268
10007480:	ff 25 64 a2 00 10    	jmp    DWORD PTR ds:0x1000a264
10007486:	ff 25 60 a2 00 10    	jmp    DWORD PTR ds:0x1000a260
1000748c:	ff                   	.byte 0xff
1000748d:	25                   	.byte 0x25
1000748e:	5c                   	pop    esp
1000748f:	a2                   	.byte 0xa2

; IsModule slot[2] descriptor 0x100072f0

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/PM_params.dll:     file format pei-i386


Disassembly of section .text:

100072f0 <.text+0x62f0>:
100072f0:	6a 0c                	push   0xc
100072f2:	e8 fa 0e 00 00       	call   0x100081f1
100072f7:	83 c4 04             	add    esp,0x4
100072fa:	c7 40 08 3c 8d 01 10 	mov    DWORD PTR [eax+0x8],0x10018d3c
10007301:	c7 40 04 cd cc cc 3d 	mov    DWORD PTR [eax+0x4],0x3dcccccd
10007308:	c7 00 3c 8d 01 10    	mov    DWORD PTR [eax],0x10018d3c
1000730e:	c3                   	ret
1000730f:	cc                   	int3
10007310:	55                   	push   ebp
10007311:	8b ec                	mov    ebp,esp
10007313:	6a ff                	push   0xffffffff
10007315:	68 bf 9c 00 10       	push   0x10009cbf
1000731a:	64 a1 00 00 00 00    	mov    eax,fs:0x0


; ===== PM_spec_WEB.dll =====

; loadModule 0x10006450

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/PM_spec_WEB.dll:     file format pei-i386


Disassembly of section .text:

10006450 <.text+0x5450>:
10006450:	6a 1c                	push   0x1c
10006452:	e8 49 26 00 00       	call   0x10008aa0
10006457:	83 c4 04             	add    esp,0x4
1000645a:	85 c0                	test   eax,eax
1000645c:	74 1f                	je     0x1000647d
1000645e:	c7 00 bc c7 00 10    	mov    DWORD PTR [eax],0x1000c7bc
10006464:	8b 0d 64 c1 00 10    	mov    ecx,DWORD PTR ds:0x1000c164
1000646a:	89 48 08             	mov    DWORD PTR [eax+0x8],ecx
1000646d:	8b 0d 00 c1 00 10    	mov    ecx,DWORD PTR ds:0x1000c100
10006473:	89 48 0c             	mov    DWORD PTR [eax+0xc],ecx
10006476:	c7 00 e4 c8 00 10    	mov    DWORD PTR [eax],0x1000c8e4
1000647c:	c3                   	ret
1000647d:	33 c0                	xor    eax,eax
1000647f:	c3                   	ret
10006480:	ff 25 80 c1 00 10    	jmp    DWORD PTR ds:0x1000c180
10006486:	ff 25 7c c1 00 10    	jmp    DWORD PTR ds:0x1000c17c
1000648c:	ff 25 78 c1 00 10    	jmp    DWORD PTR ds:0x1000c178
10006492:	ff 25 74 c1 00 10    	jmp    DWORD PTR ds:0x1000c174
10006498:	ff 25 70 c1 00 10    	jmp    DWORD PTR ds:0x1000c170
1000649e:	ff                   	.byte 0xff
1000649f:	25                   	.byte 0x25

; IsModule slot[0] no-op 0x10001040


/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/PM_spec_WEB.dll:     file format pei-i386


Disassembly of section .text:

10001040 <.text+0x40>:
10001040:	c3                   	ret
10001041:	cc                   	int3
10001042:	cc                   	int3
10001043:	cc                   	int3
10001044:	cc                   	int3
10001045:	cc                   	int3
10001046:	cc                   	int3
10001047:	cc                   	int3
10001048:	cc                   	int3
10001049:	cc                   	int3
1000104a:	cc                   	int3
1000104b:	cc                   	int3
1000104c:	cc                   	int3
1000104d:	cc                   	int3
1000104e:	cc                   	int3
1000104f:	cc                   	int3

; IsModule slot[1] create-widget 0x100062c0

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
100063c0:	8b 42 0c             	mov    eax,DWORD PTR [edx+0xc]
100063c3:	8d 0c b0             	lea    ecx,[eax+esi*4]
100063c6:	03 ca                	add    ecx,edx
100063c8:	51                   	push   ecx
100063c9:	8b cf                	mov    ecx,edi
100063cb:	e8 10 c0 ff ff       	call   0x100023e0
100063d0:	8b 13                	mov    edx,DWORD PTR [ebx]
100063d2:	46                   	inc    esi
100063d3:	3b 72 04             	cmp    esi,DWORD PTR [edx+0x4]
100063d6:	7c e8                	jl     0x100063c0
100063d8:	8b c7                	mov    eax,edi
100063da:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
100063dd:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
100063e4:	59                   	pop    ecx
100063e5:	5f                   	pop    edi
100063e6:	5e                   	pop    esi
100063e7:	5b                   	pop    ebx
100063e8:	8b e5                	mov    esp,ebp
100063ea:	5d                   	pop    ebp
100063eb:	c2 04 00             	ret    0x4
100063ee:	cc                   	int3
100063ef:	cc                   	int3
100063f0:	64 a1 2c 00 00 00    	mov    eax,fs:0x2c
100063f6:	8b 0d 08 64 01 10    	mov    ecx,DWORD PTR ds:0x10016408
100063fc:	8b 0c 88             	mov    ecx,DWORD PTR [eax+ecx*4]
100063ff:	a1 d8 63 01 10       	mov    eax,ds:0x100163d8
10006404:	3b 81 04 00 00 00    	cmp    eax,DWORD PTR [ecx+0x4]
1000640a:	7f 06                	jg     0x10006412
1000640c:	b8 d0 63 01 10       	mov    eax,0x100163d0
10006411:	c3                   	ret
10006412:	68 d8 63 01 10       	push   0x100163d8
10006417:	e8 02 28 00 00       	call   0x10008c1e
1000641c:	83 c4 04             	add    esp,0x4
1000641f:	83 3d d8 63 01 10 ff 	cmp    DWORD PTR ds:0x100163d8,0xffffffff
10006426:	75 e4                	jne    0x1000640c
10006428:	68 d8 63 01 10       	push   0x100163d8
1000642d:	c7 05 d0 63 01 10 02 	mov    DWORD PTR ds:0x100163d0,0x2
10006434:	00 00 00 
10006437:	c7                   	.byte 0xc7
10006438:	05 d4 63 01 10       	add    eax,0x100163d4
1000643d:	00 00                	add    BYTE PTR [eax],al
	...

; IsModule slot[2] descriptor 0x100062a0

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/PM_spec_WEB.dll:     file format pei-i386


Disassembly of section .text:

100062a0 <.text+0x52a0>:
100062a0:	6a 0c                	push   0xc
100062a2:	e8 f9 27 00 00       	call   0x10008aa0
100062a7:	83 c4 04             	add    esp,0x4
100062aa:	c7 40 08 f0 c8 00 10 	mov    DWORD PTR [eax+0x8],0x1000c8f0
100062b1:	c7 40 04 cd cc cc 3d 	mov    DWORD PTR [eax+0x4],0x3dcccccd
100062b8:	c7 00 f0 c8 00 10    	mov    DWORD PTR [eax],0x1000c8f0
100062be:	c3                   	ret
100062bf:	cc                   	int3
100062c0:	55                   	push   ebp
100062c1:	8b ec                	mov    ebp,esp
100062c3:	6a ff                	push   0xffffffff
100062c5:	68 ef ab 00 10       	push   0x1000abef
100062ca:	64 a1 00 00 00 00    	mov    eax,fs:0x0


; ===== PM_matrix_web.dll =====

; loadModule 0x100028f0

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/PM_matrix_web.dll:     file format pei-i386


Disassembly of section .text:

100028f0 <.text+0x18f0>:
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

; IsModule slot[0] no-op 0x10001020


/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/PM_matrix_web.dll:     file format pei-i386


Disassembly of section .text:

10001020 <.text+0x20>:
10001020:	c3                   	ret
10001021:	cc                   	int3
10001022:	cc                   	int3
10001023:	cc                   	int3
10001024:	cc                   	int3
10001025:	cc                   	int3
10001026:	cc                   	int3
10001027:	cc                   	int3
10001028:	cc                   	int3
10001029:	cc                   	int3
1000102a:	cc                   	int3
1000102b:	cc                   	int3
1000102c:	cc                   	int3
1000102d:	cc                   	int3
1000102e:	cc                   	int3
1000102f:	cc                   	int3

; IsModule slot[1] create-widget 0x10002840

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
1000293e:	ff 25 64 81 00 10    	jmp    DWORD PTR ds:0x10008164
10002944:	ff 25 60 81 00 10    	jmp    DWORD PTR ds:0x10008160
1000294a:	ff 25 5c 81 00 10    	jmp    DWORD PTR ds:0x1000815c
10002950:	ff 25 58 81 00 10    	jmp    DWORD PTR ds:0x10008158
10002956:	ff 25 50 85 00 10    	jmp    DWORD PTR ds:0x10008550
1000295c:	ff 25 4c 85 00 10    	jmp    DWORD PTR ds:0x1000854c
10002962:	ff 25 48 85 00 10    	jmp    DWORD PTR ds:0x10008548
10002968:	ff 25 44 85 00 10    	jmp    DWORD PTR ds:0x10008544
1000296e:	ff 25 40 85 00 10    	jmp    DWORD PTR ds:0x10008540
10002974:	ff 25 3c 85 00 10    	jmp    DWORD PTR ds:0x1000853c
1000297a:	ff 25 38 85 00 10    	jmp    DWORD PTR ds:0x10008538
10002980:	ff 25 34 85 00 10    	jmp    DWORD PTR ds:0x10008534
10002986:	ff 25 30 85 00 10    	jmp    DWORD PTR ds:0x10008530
1000298c:	ff 25 9c 83 00 10    	jmp    DWORD PTR ds:0x1000839c
10002992:	ff 25 a4 82 00 10    	jmp    DWORD PTR ds:0x100082a4
10002998:	ff 25 a0 82 00 10    	jmp    DWORD PTR ds:0x100082a0
1000299e:	ff 25 9c 82 00 10    	jmp    DWORD PTR ds:0x1000829c
100029a4:	ff 25 98 82 00 10    	jmp    DWORD PTR ds:0x10008298
100029aa:	ff 25 94 82 00 10    	jmp    DWORD PTR ds:0x10008294
100029b0:	ff 25 90 82 00 10    	jmp    DWORD PTR ds:0x10008290
100029b6:	ff 25 8c 82 00 10    	jmp    DWORD PTR ds:0x1000828c
100029bc:	ff                   	.byte 0xff
100029bd:	25                   	.byte 0x25
100029be:	88                   	.byte 0x88
100029bf:	82                   	.byte 0x82

; IsModule slot[2] descriptor 0x10002820

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/PM_matrix_web.dll:     file format pei-i386


Disassembly of section .text:

10002820 <.text+0x1820>:
10002820:	6a 0c                	push   0xc
10002822:	e8 64 32 00 00       	call   0x10005a8b
10002827:	83 c4 04             	add    esp,0x4
1000282a:	c7 40 08 a4 87 00 10 	mov    DWORD PTR [eax+0x8],0x100087a4
10002831:	c7 40 04 cd cc cc 3d 	mov    DWORD PTR [eax+0x4],0x3dcccccd
10002838:	c7 00 a4 87 00 10    	mov    DWORD PTR [eax],0x100087a4
1000283e:	c3                   	ret
1000283f:	cc                   	int3
10002840:	55                   	push   ebp
10002841:	8b ec                	mov    ebp,esp
10002843:	6a ff                	push   0xffffffff
10002845:	68 3f 70 00 10       	push   0x1000703f
1000284a:	64 a1 00 00 00 00    	mov    eax,fs:0x0


; ===== Model_Visualiser.dll =====

; loadModule 0x10009d20

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/Model_Visualiser.dll:     file format pei-i386


Disassembly of section .text:

10009d20 <.text+0x8d20>:
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
10009d5c:	ff 25 a0 d0 00 10    	jmp    DWORD PTR ds:0x1000d0a0
10009d62:	ff 25 a4 d0 00 10    	jmp    DWORD PTR ds:0x1000d0a4
10009d68:	ff 25 a8 d0 00 10    	jmp    DWORD PTR ds:0x1000d0a8
10009d6e:	ff                   	.byte 0xff
10009d6f:	25                   	.byte 0x25

; IsModule slot[0] no-op 0x10001c50


/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/Model_Visualiser.dll:     file format pei-i386


Disassembly of section .text:

10001c50 <.text+0xc50>:
10001c50:	c3                   	ret
10001c51:	cc                   	int3
10001c52:	cc                   	int3
10001c53:	cc                   	int3
10001c54:	cc                   	int3
10001c55:	cc                   	int3
10001c56:	cc                   	int3
10001c57:	cc                   	int3
10001c58:	cc                   	int3
10001c59:	cc                   	int3
10001c5a:	cc                   	int3
10001c5b:	cc                   	int3
10001c5c:	cc                   	int3
10001c5d:	cc                   	int3
10001c5e:	cc                   	int3
10001c5f:	cc                   	int3

; IsModule slot[1] create-widget 0x10009c60

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
10009d5c:	ff 25 a0 d0 00 10    	jmp    DWORD PTR ds:0x1000d0a0
10009d62:	ff 25 a4 d0 00 10    	jmp    DWORD PTR ds:0x1000d0a4
10009d68:	ff 25 a8 d0 00 10    	jmp    DWORD PTR ds:0x1000d0a8
10009d6e:	ff 25 ac d0 00 10    	jmp    DWORD PTR ds:0x1000d0ac
10009d74:	ff 25 20 d1 00 10    	jmp    DWORD PTR ds:0x1000d120
10009d7a:	ff 25 3c d5 00 10    	jmp    DWORD PTR ds:0x1000d53c
10009d80:	ff 25 38 d5 00 10    	jmp    DWORD PTR ds:0x1000d538
10009d86:	ff 25 34 d5 00 10    	jmp    DWORD PTR ds:0x1000d534
10009d8c:	ff 25 30 d5 00 10    	jmp    DWORD PTR ds:0x1000d530
10009d92:	ff 25 2c d5 00 10    	jmp    DWORD PTR ds:0x1000d52c
10009d98:	ff 25 28 d5 00 10    	jmp    DWORD PTR ds:0x1000d528
10009d9e:	ff 25 24 d5 00 10    	jmp    DWORD PTR ds:0x1000d524
10009da4:	ff 25 20 d5 00 10    	jmp    DWORD PTR ds:0x1000d520
10009daa:	ff 25 1c d5 00 10    	jmp    DWORD PTR ds:0x1000d51c
10009db0:	ff 25 18 d5 00 10    	jmp    DWORD PTR ds:0x1000d518
10009db6:	ff 25 14 d5 00 10    	jmp    DWORD PTR ds:0x1000d514
10009dbc:	ff 25 10 d5 00 10    	jmp    DWORD PTR ds:0x1000d510
10009dc2:	ff 25 0c d5 00 10    	jmp    DWORD PTR ds:0x1000d50c
10009dc8:	ff 25 08 d5 00 10    	jmp    DWORD PTR ds:0x1000d508
10009dce:	ff 25 04 d5 00 10    	jmp    DWORD PTR ds:0x1000d504
10009dd4:	ff 25 00 d5 00 10    	jmp    DWORD PTR ds:0x1000d500
10009dda:	ff 25 fc d4 00 10    	jmp    DWORD PTR ds:0x1000d4fc

; IsModule slot[2] descriptor 0x100092b0

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/Model_Visualiser.dll:     file format pei-i386


Disassembly of section .text:

100092b0 <.text+0x82b0>:
100092b0:	6a 0c                	push   0xc
100092b2:	e8 e9 10 00 00       	call   0x1000a3a0
100092b7:	83 c4 04             	add    esp,0x4
100092ba:	c7 40 08 b4 e5 00 10 	mov    DWORD PTR [eax+0x8],0x1000e5b4
100092c1:	c7 40 04 cd cc cc 3d 	mov    DWORD PTR [eax+0x4],0x3dcccccd
100092c8:	c7 00 c8 e5 00 10    	mov    DWORD PTR [eax],0x1000e5c8
100092ce:	c3                   	ret
100092cf:	cc                   	int3
100092d0:	55                   	push   ebp
100092d1:	8b ec                	mov    ebp,esp
100092d3:	6a ff                	push   0xffffffff
100092d5:	68 70 bf 00 10       	push   0x1000bf70
100092da:	64 a1 00 00 00 00    	mov    eax,fs:0x0
