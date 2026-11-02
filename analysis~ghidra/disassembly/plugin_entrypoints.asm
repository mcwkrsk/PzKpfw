### PM_auto.dll: descriptor and widget virtual implementation

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

### PM_params.dll: descriptor and widget virtual implementation

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

### PM_spec_WEB.dll: descriptor and widget virtual implementation

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
10006437:	c7 05 d4 63 01 10 00 	mov    DWORD PTR ds:0x100163d4,0x0
1000643e:	00 00 00 
10006441:	e8 99 27 00 00       	call   0x10008bdf
10006446:	83 c4 04             	add    esp,0x4
10006449:	eb c1                	jmp    0x1000640c
1000644b:	cc                   	int3
1000644c:	cc                   	int3
1000644d:	cc                   	int3
1000644e:	cc                   	int3
1000644f:	cc                   	int3
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

### PM_matrix_web.dll: descriptor and widget virtual implementation

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

### Model_Visualiser.dll: descriptor and widget virtual implementation

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
100092e0:	50                   	push   eax
100092e1:	83 ec 10             	sub    esp,0x10
100092e4:	53                   	push   ebx
100092e5:	56                   	push   esi
100092e6:	57                   	push   edi
100092e7:	a1 6c 50 01 10       	mov    eax,ds:0x1001506c
100092ec:	33 c5                	xor    eax,ebp
100092ee:	50                   	push   eax
100092ef:	8d 45 f4             	lea    eax,[ebp-0xc]
100092f2:	64 a3 00 00 00 00    	mov    fs:0x0,eax
100092f8:	8b f9                	mov    edi,ecx
100092fa:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
100092fd:	8d 45 ec             	lea    eax,[ebp-0x14]
10009300:	50                   	push   eax
10009301:	ff 15 f0 d0 00 10    	call   DWORD PTR ds:0x1000d0f0
10009307:	8d 4d ec             	lea    ecx,[ebp-0x14]
1000930a:	8b 00                	mov    eax,DWORD PTR [eax]
1000930c:	8b 70 04             	mov    esi,DWORD PTR [eax+0x4]
1000930f:	ff 15 68 d1 00 10    	call   DWORD PTR ds:0x1000d168
10009315:	8b 1d f4 d0 00 10    	mov    ebx,DWORD PTR ds:0x1000d0f4
1000931b:	85 f6                	test   esi,esi
1000931d:	75 31                	jne    0x10009350
1000931f:	8d 45 ec             	lea    eax,[ebp-0x14]
10009322:	c6 45 f3 00          	mov    BYTE PTR [ebp-0xd],0x0
10009326:	50                   	push   eax
10009327:	8d 4d f3             	lea    ecx,[ebp-0xd]
1000932a:	e8 21 e5 ff ff       	call   0x10007850
1000932f:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
10009332:	8b ce                	mov    ecx,esi
10009334:	50                   	push   eax
10009335:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000933c:	ff d3                	call   ebx
1000933e:	8d 4d ec             	lea    ecx,[ebp-0x14]
10009341:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
10009348:	ff 15 68 d1 00 10    	call   DWORD PTR ds:0x1000d168
1000934e:	eb 03                	jmp    0x10009353
10009350:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
10009353:	68 1f 02 00 00       	push   0x21f
10009358:	68 1d 04 00 00       	push   0x41d
1000935d:	8b ce                	mov    ecx,esi
1000935f:	ff 15 a0 d2 00 10    	call   DWORD PTR ds:0x1000d2a0
10009365:	6a 10                	push   0x10
10009367:	e8 34 10 00 00       	call   0x1000a3a0
1000936c:	8b f0                	mov    esi,eax
1000936e:	83 c4 04             	add    esp,0x4
10009371:	89 75 e4             	mov    DWORD PTR [ebp-0x1c],esi
10009374:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [ebp-0x4],0x1
1000937b:	85 f6                	test   esi,esi
1000937d:	74 1a                	je     0x10009399
1000937f:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10009382:	8b ce                	mov    ecx,esi
10009384:	ff 15 d4 d2 00 10    	call   DWORD PTR ds:0x1000d2d4
1000938a:	c7 06 cc de 00 10    	mov    DWORD PTR [esi],0x1000decc
10009390:	c7 46 08 14 df 00 10 	mov    DWORD PTR [esi+0x8],0x1000df14
10009397:	eb 02                	jmp    0x1000939b
10009399:	33 f6                	xor    esi,esi
1000939b:	6a 06                	push   0x6
1000939d:	8b ce                	mov    ecx,esi
1000939f:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
100093a6:	89 37                	mov    DWORD PTR [edi],esi
100093a8:	ff 15 60 d5 00 10    	call   DWORD PTR ds:0x1000d560
100093ae:	8b 0f                	mov    ecx,DWORD PTR [edi]
100093b0:	8b 35 c0 d2 00 10    	mov    esi,DWORD PTR ds:0x1000d2c0
100093b6:	6a 0b                	push   0xb
100093b8:	6a 0b                	push   0xb
100093ba:	6a 0b                	push   0xb
100093bc:	6a 0b                	push   0xb
100093be:	ff d6                	call   esi
100093c0:	8d 45 ec             	lea    eax,[ebp-0x14]
100093c3:	50                   	push   eax
100093c4:	8d 4d f3             	lea    ecx,[ebp-0xd]
100093c7:	e8 24 e4 ff ff       	call   0x100077f0
100093cc:	8b 0f                	mov    ecx,DWORD PTR [edi]
100093ce:	50                   	push   eax
100093cf:	c7 45 fc 02 00 00 00 	mov    DWORD PTR [ebp-0x4],0x2
100093d6:	ff d3                	call   ebx
100093d8:	8d 4d ec             	lea    ecx,[ebp-0x14]
100093db:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
100093e2:	ff 15 68 d1 00 10    	call   DWORD PTR ds:0x1000d168
100093e8:	8b 0f                	mov    ecx,DWORD PTR [edi]
100093ea:	6a 00                	push   0x0
100093ec:	ff 15 e0 d2 00 10    	call   DWORD PTR ds:0x1000d2e0
100093f2:	8b 0f                	mov    ecx,DWORD PTR [edi]
100093f4:	6a 05                	push   0x5
100093f6:	ff 15 e4 d2 00 10    	call   DWORD PTR ds:0x1000d2e4
100093fc:	8b 0f                	mov    ecx,DWORD PTR [edi]
100093fe:	6a 05                	push   0x5
10009400:	6a 05                	push   0x5
10009402:	6a 05                	push   0x5
10009404:	6a 05                	push   0x5
10009406:	ff d6                	call   esi
10009408:	6a 10                	push   0x10
1000940a:	e8 91 0f 00 00       	call   0x1000a3a0
1000940f:	8b f0                	mov    esi,eax
10009411:	83 c4 04             	add    esp,0x4
10009414:	89 75 e4             	mov    DWORD PTR [ebp-0x1c],esi
10009417:	c7 45 fc 03 00 00 00 	mov    DWORD PTR [ebp-0x4],0x3
1000941e:	85 f6                	test   esi,esi
10009420:	74 17                	je     0x10009439
10009422:	8b ce                	mov    ecx,esi
10009424:	ff 15 d8 d2 00 10    	call   DWORD PTR ds:0x1000d2d8
1000942a:	c7 06 cc de 00 10    	mov    DWORD PTR [esi],0x1000decc
10009430:	c7 46 08 14 df 00 10 	mov    DWORD PTR [esi+0x8],0x1000df14
10009437:	eb 02                	jmp    0x1000943b
10009439:	33 f6                	xor    esi,esi
1000943b:	6a 06                	push   0x6
1000943d:	8b ce                	mov    ecx,esi
1000943f:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
10009446:	89 77 04             	mov    DWORD PTR [edi+0x4],esi
10009449:	ff 15 60 d5 00 10    	call   DWORD PTR ds:0x1000d560
1000944f:	8d 45 ec             	lea    eax,[ebp-0x14]
10009452:	50                   	push   eax
10009453:	8d 4d f3             	lea    ecx,[ebp-0xd]
10009456:	e8 05 e4 ff ff       	call   0x10007860
1000945b:	8b 4f 04             	mov    ecx,DWORD PTR [edi+0x4]
1000945e:	50                   	push   eax
1000945f:	c7 45 fc 04 00 00 00 	mov    DWORD PTR [ebp-0x4],0x4
10009466:	ff d3                	call   ebx
10009468:	8d 4d ec             	lea    ecx,[ebp-0x14]
1000946b:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
10009472:	ff 15 68 d1 00 10    	call   DWORD PTR ds:0x1000d168
10009478:	6a 18                	push   0x18
1000947a:	e8 21 0f 00 00       	call   0x1000a3a0
1000947f:	8b f0                	mov    esi,eax
10009481:	83 c4 04             	add    esp,0x4
10009484:	89 75 e4             	mov    DWORD PTR [ebp-0x1c],esi
10009487:	c7 45 fc 05 00 00 00 	mov    DWORD PTR [ebp-0x4],0x5
1000948e:	85 f6                	test   esi,esi
10009490:	74 1a                	je     0x100094ac
10009492:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10009495:	8b ce                	mov    ecx,esi
10009497:	ff 15 f4 d2 00 10    	call   DWORD PTR ds:0x1000d2f4
1000949d:	c7 06 5c df 00 10    	mov    DWORD PTR [esi],0x1000df5c
100094a3:	c7 46 08 1c e0 00 10 	mov    DWORD PTR [esi+0x8],0x1000e01c
100094aa:	eb 02                	jmp    0x100094ae
100094ac:	33 f6                	xor    esi,esi
100094ae:	8d 45 ec             	lea    eax,[ebp-0x14]
100094b1:	89 77 08             	mov    DWORD PTR [edi+0x8],esi
100094b4:	50                   	push   eax
100094b5:	8d 4d f3             	lea    ecx,[ebp-0xd]
100094b8:	e8 d3 e3 ff ff       	call   0x10007890
100094bd:	50                   	push   eax
100094be:	8b ce                	mov    ecx,esi
100094c0:	c7 45 fc 06 00 00 00 	mov    DWORD PTR [ebp-0x4],0x6
100094c7:	ff d3                	call   ebx
100094c9:	8d 4d ec             	lea    ecx,[ebp-0x14]
100094cc:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
100094d3:	ff 15 68 d1 00 10    	call   DWORD PTR ds:0x1000d168
100094d9:	68 48 e3 00 10       	push   0x1000e348
100094de:	6a 28                	push   0x28
100094e0:	8d 4d ec             	lea    ecx,[ebp-0x14]
100094e3:	ff 15 c8 d0 00 10    	call   DWORD PTR ds:0x1000d0c8
100094e9:	8b 4f 08             	mov    ecx,DWORD PTR [edi+0x8]
100094ec:	8d 45 ec             	lea    eax,[ebp-0x14]
100094ef:	50                   	push   eax
100094f0:	c7 45 fc 07 00 00 00 	mov    DWORD PTR [ebp-0x4],0x7
100094f7:	ff 15 9c d2 00 10    	call   DWORD PTR ds:0x1000d29c
100094fd:	8d 4d ec             	lea    ecx,[ebp-0x14]
10009500:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
10009507:	ff 15 68 d1 00 10    	call   DWORD PTR ds:0x1000d168
1000950d:	6a 18                	push   0x18
1000950f:	e8 8c 0e 00 00       	call   0x1000a3a0
10009514:	8b f0                	mov    esi,eax
10009516:	83 c4 04             	add    esp,0x4
10009519:	89 75 e4             	mov    DWORD PTR [ebp-0x1c],esi
1000951c:	c7 45 fc 08 00 00 00 	mov    DWORD PTR [ebp-0x4],0x8
10009523:	85 f6                	test   esi,esi
10009525:	74 1b                	je     0x10009542
10009527:	6a 00                	push   0x0
10009529:	6a 00                	push   0x0
1000952b:	8b ce                	mov    ecx,esi
1000952d:	ff 15 58 d5 00 10    	call   DWORD PTR ds:0x1000d558
10009533:	c7 06 34 dc 00 10    	mov    DWORD PTR [esi],0x1000dc34
10009539:	c7 46 08 ec dc 00 10 	mov    DWORD PTR [esi+0x8],0x1000dcec
10009540:	eb 02                	jmp    0x10009544
10009542:	33 f6                	xor    esi,esi
10009544:	8d 45 ec             	lea    eax,[ebp-0x14]
10009547:	89 77 0c             	mov    DWORD PTR [edi+0xc],esi
1000954a:	50                   	push   eax
1000954b:	8d 4d f3             	lea    ecx,[ebp-0xd]
1000954e:	e8 8d e3 ff ff       	call   0x100078e0
10009553:	50                   	push   eax
10009554:	8b ce                	mov    ecx,esi
10009556:	c7 45 fc 09 00 00 00 	mov    DWORD PTR [ebp-0x4],0x9
1000955d:	ff d3                	call   ebx
1000955f:	8d 4d ec             	lea    ecx,[ebp-0x14]
10009562:	ff 15 68 d1 00 10    	call   DWORD PTR ds:0x1000d168
10009568:	8d 4d ec             	lea    ecx,[ebp-0x14]
1000956b:	ff 15 70 d1 00 10    	call   DWORD PTR ds:0x1000d170
10009571:	8b 4f 08             	mov    ecx,DWORD PTR [edi+0x8]
10009574:	50                   	push   eax
10009575:	ff 77 0c             	push   DWORD PTR [edi+0xc]
10009578:	c7 45 fc 0a 00 00 00 	mov    DWORD PTR [ebp-0x4],0xa
1000957f:	ff 15 fc d2 00 10    	call   DWORD PTR ds:0x1000d2fc
10009585:	8d 4d ec             	lea    ecx,[ebp-0x14]
10009588:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
1000958f:	ff 15 68 d1 00 10    	call   DWORD PTR ds:0x1000d168
10009595:	6a 18                	push   0x18
10009597:	e8 04 0e 00 00       	call   0x1000a3a0
1000959c:	8b f0                	mov    esi,eax
1000959e:	83 c4 04             	add    esp,0x4
100095a1:	89 75 e4             	mov    DWORD PTR [ebp-0x1c],esi
100095a4:	c7 45 fc 0b 00 00 00 	mov    DWORD PTR [ebp-0x4],0xb
100095ab:	85 f6                	test   esi,esi
100095ad:	74 1b                	je     0x100095ca
100095af:	6a 00                	push   0x0
100095b1:	6a 00                	push   0x0
100095b3:	8b ce                	mov    ecx,esi
100095b5:	ff 15 58 d5 00 10    	call   DWORD PTR ds:0x1000d558
100095bb:	c7 06 34 dc 00 10    	mov    DWORD PTR [esi],0x1000dc34
100095c1:	c7 46 08 ec dc 00 10 	mov    DWORD PTR [esi+0x8],0x1000dcec
100095c8:	eb 02                	jmp    0x100095cc
100095ca:	33 f6                	xor    esi,esi
100095cc:	8d 45 ec             	lea    eax,[ebp-0x14]
100095cf:	89 77 10             	mov    DWORD PTR [edi+0x10],esi
100095d2:	50                   	push   eax
100095d3:	8d 4d f3             	lea    ecx,[ebp-0xd]
100095d6:	e8 35 e2 ff ff       	call   0x10007810
100095db:	50                   	push   eax
100095dc:	8b ce                	mov    ecx,esi
100095de:	c7 45 fc 0c 00 00 00 	mov    DWORD PTR [ebp-0x4],0xc
100095e5:	ff d3                	call   ebx
100095e7:	8d 4d ec             	lea    ecx,[ebp-0x14]
100095ea:	ff 15 68 d1 00 10    	call   DWORD PTR ds:0x1000d168
100095f0:	8d 4d ec             	lea    ecx,[ebp-0x14]
100095f3:	ff 15 70 d1 00 10    	call   DWORD PTR ds:0x1000d170
100095f9:	8b 4f 08             	mov    ecx,DWORD PTR [edi+0x8]
100095fc:	50                   	push   eax
100095fd:	ff 77 10             	push   DWORD PTR [edi+0x10]
10009600:	c7 45 fc 0d 00 00 00 	mov    DWORD PTR [ebp-0x4],0xd
10009607:	ff 15 fc d2 00 10    	call   DWORD PTR ds:0x1000d2fc
1000960d:	8d 4d ec             	lea    ecx,[ebp-0x14]
10009610:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
10009617:	ff 15 68 d1 00 10    	call   DWORD PTR ds:0x1000d168
1000961d:	8b 4f 04             	mov    ecx,DWORD PTR [edi+0x4]
10009620:	6a 00                	push   0x0
10009622:	6a 01                	push   0x1
10009624:	6a 01                	push   0x1
10009626:	6a 00                	push   0x0
10009628:	6a 00                	push   0x0
1000962a:	ff 77 08             	push   DWORD PTR [edi+0x8]
1000962d:	ff 15 ec d2 00 10    	call   DWORD PTR ds:0x1000d2ec
10009633:	8b 0f                	mov    ecx,DWORD PTR [edi]
10009635:	6a 00                	push   0x0
10009637:	6a 01                	push   0x1
10009639:	6a 01                	push   0x1
1000963b:	6a 00                	push   0x0
1000963d:	6a 01                	push   0x1
1000963f:	ff 77 04             	push   DWORD PTR [edi+0x4]
10009642:	ff 15 f0 d2 00 10    	call   DWORD PTR ds:0x1000d2f0
10009648:	6a 18                	push   0x18
1000964a:	e8 51 0d 00 00       	call   0x1000a3a0
1000964f:	8b f0                	mov    esi,eax
10009651:	83 c4 04             	add    esp,0x4
10009654:	89 75 e4             	mov    DWORD PTR [ebp-0x1c],esi
10009657:	c7 45 fc 0e 00 00 00 	mov    DWORD PTR [ebp-0x4],0xe
1000965e:	85 f6                	test   esi,esi
10009660:	74 1c                	je     0x1000967e
10009662:	6a 00                	push   0x0
10009664:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10009667:	8b ce                	mov    ecx,esi
10009669:	ff 15 58 d5 00 10    	call   DWORD PTR ds:0x1000d558
1000966f:	c7 06 34 dc 00 10    	mov    DWORD PTR [esi],0x1000dc34
10009675:	c7 46 08 ec dc 00 10 	mov    DWORD PTR [esi+0x8],0x1000dcec
1000967c:	eb 02                	jmp    0x10009680
1000967e:	33 f6                	xor    esi,esi
10009680:	8d 45 ec             	lea    eax,[ebp-0x14]
10009683:	89 77 14             	mov    DWORD PTR [edi+0x14],esi
10009686:	50                   	push   eax
10009687:	8d 4d f3             	lea    ecx,[ebp-0xd]
1000968a:	e8 21 e2 ff ff       	call   0x100078b0
1000968f:	50                   	push   eax
10009690:	8b ce                	mov    ecx,esi
10009692:	c7 45 fc 0f 00 00 00 	mov    DWORD PTR [ebp-0x4],0xf
10009699:	ff d3                	call   ebx
1000969b:	8d 4d ec             	lea    ecx,[ebp-0x14]
1000969e:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
100096a5:	ff 15 68 d1 00 10    	call   DWORD PTR ds:0x1000d168
100096ab:	6a 10                	push   0x10
100096ad:	e8 ee 0c 00 00       	call   0x1000a3a0
100096b2:	8b f0                	mov    esi,eax
100096b4:	83 c4 04             	add    esp,0x4
100096b7:	89 75 e4             	mov    DWORD PTR [ebp-0x1c],esi
100096ba:	c7 45 fc 10 00 00 00 	mov    DWORD PTR [ebp-0x4],0x10
100096c1:	85 f6                	test   esi,esi
100096c3:	74 1a                	je     0x100096df
100096c5:	ff 77 14             	push   DWORD PTR [edi+0x14]
100096c8:	8b ce                	mov    ecx,esi
100096ca:	ff 15 cc d2 00 10    	call   DWORD PTR ds:0x1000d2cc
100096d0:	c7 06 3c de 00 10    	mov    DWORD PTR [esi],0x1000de3c
100096d6:	c7 46 08 84 de 00 10 	mov    DWORD PTR [esi+0x8],0x1000de84
100096dd:	eb 02                	jmp    0x100096e1
100096df:	33 f6                	xor    esi,esi
100096e1:	6a 06                	push   0x6
100096e3:	8b ce                	mov    ecx,esi
100096e5:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
100096ec:	89 77 18             	mov    DWORD PTR [edi+0x18],esi
100096ef:	ff 15 c8 d2 00 10    	call   DWORD PTR ds:0x1000d2c8
100096f5:	8b 4f 18             	mov    ecx,DWORD PTR [edi+0x18]
100096f8:	8b 35 c0 d2 00 10    	mov    esi,DWORD PTR ds:0x1000d2c0
100096fe:	6a 0b                	push   0xb
10009700:	6a 0b                	push   0xb
10009702:	6a 0b                	push   0xb
10009704:	6a 0b                	push   0xb
10009706:	ff d6                	call   esi
10009708:	8d 45 ec             	lea    eax,[ebp-0x14]
1000970b:	50                   	push   eax
1000970c:	8d 4d f3             	lea    ecx,[ebp-0xd]
1000970f:	e8 ec e1 ff ff       	call   0x10007900
10009714:	8b 4f 18             	mov    ecx,DWORD PTR [edi+0x18]
10009717:	50                   	push   eax
10009718:	c7 45 fc 11 00 00 00 	mov    DWORD PTR [ebp-0x4],0x11
1000971f:	ff d3                	call   ebx
10009721:	8d 4d ec             	lea    ecx,[ebp-0x14]
10009724:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
1000972b:	ff 15 68 d1 00 10    	call   DWORD PTR ds:0x1000d168
10009731:	8b 4f 18             	mov    ecx,DWORD PTR [edi+0x18]
10009734:	6a 00                	push   0x0
10009736:	6a 00                	push   0x0
10009738:	6a 00                	push   0x0
1000973a:	6a 00                	push   0x0
1000973c:	ff d6                	call   esi
1000973e:	6a 18                	push   0x18
10009740:	e8 5b 0c 00 00       	call   0x1000a3a0
10009745:	8b f0                	mov    esi,eax
10009747:	83 c4 04             	add    esp,0x4
1000974a:	89 75 e4             	mov    DWORD PTR [ebp-0x1c],esi
1000974d:	c7 45 fc 12 00 00 00 	mov    DWORD PTR [ebp-0x4],0x12
10009754:	85 f6                	test   esi,esi
10009756:	74 1a                	je     0x10009772
10009758:	ff 77 14             	push   DWORD PTR [edi+0x14]
1000975b:	8b ce                	mov    ecx,esi
1000975d:	ff 15 24 d3 00 10    	call   DWORD PTR ds:0x1000d324
10009763:	c7 06 3c e0 00 10    	mov    DWORD PTR [esi],0x1000e03c
10009769:	c7 46 08 00 e1 00 10 	mov    DWORD PTR [esi+0x8],0x1000e100
10009770:	eb 02                	jmp    0x10009774
10009772:	33 f6                	xor    esi,esi
10009774:	8d 45 ec             	lea    eax,[ebp-0x14]
10009777:	89 77 1c             	mov    DWORD PTR [edi+0x1c],esi
1000977a:	50                   	push   eax
1000977b:	8d 4d f3             	lea    ecx,[ebp-0xd]
1000977e:	e8 8d e1 ff ff       	call   0x10007910
10009783:	50                   	push   eax
10009784:	8b ce                	mov    ecx,esi
10009786:	c7 45 fc 13 00 00 00 	mov    DWORD PTR [ebp-0x4],0x13
1000978d:	ff d3                	call   ebx
1000978f:	8d 4d ec             	lea    ecx,[ebp-0x14]
10009792:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
10009799:	ff 15 68 d1 00 10    	call   DWORD PTR ds:0x1000d168
1000979f:	68 ff ff ff 00       	push   0xffffff
100097a4:	6a 32                	push   0x32
100097a6:	8d 4d e8             	lea    ecx,[ebp-0x18]
100097a9:	ff 15 34 d1 00 10    	call   DWORD PTR ds:0x1000d134
100097af:	8b 4f 1c             	mov    ecx,DWORD PTR [edi+0x1c]
100097b2:	50                   	push   eax
100097b3:	ff 15 94 d2 00 10    	call   DWORD PTR ds:0x1000d294
100097b9:	68 78 e3 00 10       	push   0x1000e378
100097be:	6a 41                	push   0x41
100097c0:	8d 4d ec             	lea    ecx,[ebp-0x14]
100097c3:	ff 15 c8 d0 00 10    	call   DWORD PTR ds:0x1000d0c8
100097c9:	8b 4f 1c             	mov    ecx,DWORD PTR [edi+0x1c]
100097cc:	8d 45 ec             	lea    eax,[ebp-0x14]
100097cf:	50                   	push   eax
100097d0:	c7 45 fc 14 00 00 00 	mov    DWORD PTR [ebp-0x4],0x14
100097d7:	ff 15 9c d2 00 10    	call   DWORD PTR ds:0x1000d29c
100097dd:	8d 4d ec             	lea    ecx,[ebp-0x14]
100097e0:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
100097e7:	ff 15 68 d1 00 10    	call   DWORD PTR ds:0x1000d168
100097ed:	8b 4f 1c             	mov    ecx,DWORD PTR [edi+0x1c]
100097f0:	6a 00                	push   0x0
100097f2:	ff 15 a8 d2 00 10    	call   DWORD PTR ds:0x1000d2a8
100097f8:	8b 4f 18             	mov    ecx,DWORD PTR [edi+0x18]
100097fb:	6a 00                	push   0x0
100097fd:	6a 00                	push   0x0
100097ff:	ff 77 1c             	push   DWORD PTR [edi+0x1c]
10009802:	ff 15 c4 d2 00 10    	call   DWORD PTR ds:0x1000d2c4
10009808:	6a 18                	push   0x18
1000980a:	e8 91 0b 00 00       	call   0x1000a3a0
1000980f:	8b f0                	mov    esi,eax
10009811:	83 c4 04             	add    esp,0x4
10009814:	89 75 e4             	mov    DWORD PTR [ebp-0x1c],esi
10009817:	c7 45 fc 15 00 00 00 	mov    DWORD PTR [ebp-0x4],0x15
1000981e:	85 f6                	test   esi,esi
10009820:	74 1a                	je     0x1000983c
10009822:	ff 77 14             	push   DWORD PTR [edi+0x14]
10009825:	8b ce                	mov    ecx,esi
10009827:	ff 15 24 d3 00 10    	call   DWORD PTR ds:0x1000d324
1000982d:	c7 06 3c e0 00 10    	mov    DWORD PTR [esi],0x1000e03c
10009833:	c7 46 08 00 e1 00 10 	mov    DWORD PTR [esi+0x8],0x1000e100
1000983a:	eb 02                	jmp    0x1000983e
1000983c:	33 f6                	xor    esi,esi
1000983e:	8d 45 ec             	lea    eax,[ebp-0x14]
10009841:	89 77 20             	mov    DWORD PTR [edi+0x20],esi
10009844:	50                   	push   eax
10009845:	8d 4d f3             	lea    ecx,[ebp-0xd]
10009848:	e8 73 e0 ff ff       	call   0x100078c0
1000984d:	50                   	push   eax
1000984e:	8b ce                	mov    ecx,esi
10009850:	c7 45 fc 16 00 00 00 	mov    DWORD PTR [ebp-0x4],0x16
10009857:	ff d3                	call   ebx
10009859:	8d 4d ec             	lea    ecx,[ebp-0x14]
1000985c:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
10009863:	ff 15 68 d1 00 10    	call   DWORD PTR ds:0x1000d168
10009869:	68 ff ff ff 00       	push   0xffffff
1000986e:	6a 32                	push   0x32
10009870:	8d 4d e8             	lea    ecx,[ebp-0x18]
10009873:	ff 15 34 d1 00 10    	call   DWORD PTR ds:0x1000d134
10009879:	8b 4f 20             	mov    ecx,DWORD PTR [edi+0x20]
1000987c:	50                   	push   eax
1000987d:	ff 15 94 d2 00 10    	call   DWORD PTR ds:0x1000d294
10009883:	68 78 e3 00 10       	push   0x1000e378
10009888:	6a 41                	push   0x41
1000988a:	8d 4d ec             	lea    ecx,[ebp-0x14]
1000988d:	ff 15 c8 d0 00 10    	call   DWORD PTR ds:0x1000d0c8
10009893:	8b 4f 20             	mov    ecx,DWORD PTR [edi+0x20]
10009896:	8d 45 ec             	lea    eax,[ebp-0x14]
10009899:	50                   	push   eax
1000989a:	c7 45 fc 17 00 00 00 	mov    DWORD PTR [ebp-0x4],0x17
100098a1:	ff 15 9c d2 00 10    	call   DWORD PTR ds:0x1000d29c
100098a7:	8d 4d ec             	lea    ecx,[ebp-0x14]
100098aa:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
100098b1:	ff 15 68 d1 00 10    	call   DWORD PTR ds:0x1000d168
100098b7:	8b 4f 20             	mov    ecx,DWORD PTR [edi+0x20]
100098ba:	6a 00                	push   0x0
100098bc:	ff 15 a8 d2 00 10    	call   DWORD PTR ds:0x1000d2a8
100098c2:	8b 4f 18             	mov    ecx,DWORD PTR [edi+0x18]
100098c5:	6a 00                	push   0x0
100098c7:	6a 00                	push   0x0
100098c9:	ff 77 20             	push   DWORD PTR [edi+0x20]
100098cc:	ff 15 c4 d2 00 10    	call   DWORD PTR ds:0x1000d2c4
100098d2:	6a 18                	push   0x18
100098d4:	e8 c7 0a 00 00       	call   0x1000a3a0
100098d9:	8b f0                	mov    esi,eax
100098db:	83 c4 04             	add    esp,0x4
100098de:	89 75 e4             	mov    DWORD PTR [ebp-0x1c],esi
100098e1:	c7 45 fc 18 00 00 00 	mov    DWORD PTR [ebp-0x4],0x18
100098e8:	85 f6                	test   esi,esi
100098ea:	74 1a                	je     0x10009906
100098ec:	ff 77 14             	push   DWORD PTR [edi+0x14]
100098ef:	8b ce                	mov    ecx,esi
100098f1:	ff 15 24 d3 00 10    	call   DWORD PTR ds:0x1000d324
100098f7:	c7 06 3c e0 00 10    	mov    DWORD PTR [esi],0x1000e03c
100098fd:	c7 46 08 00 e1 00 10 	mov    DWORD PTR [esi+0x8],0x1000e100
10009904:	eb 02                	jmp    0x10009908
10009906:	33 f6                	xor    esi,esi
10009908:	8d 45 ec             	lea    eax,[ebp-0x14]
1000990b:	89 77 24             	mov    DWORD PTR [edi+0x24],esi
1000990e:	50                   	push   eax
1000990f:	8d 4d f3             	lea    ecx,[ebp-0xd]
10009912:	e8 09 e0 ff ff       	call   0x10007920
10009917:	50                   	push   eax
10009918:	8b ce                	mov    ecx,esi
1000991a:	c7 45 fc 19 00 00 00 	mov    DWORD PTR [ebp-0x4],0x19
10009921:	ff d3                	call   ebx
10009923:	8d 4d ec             	lea    ecx,[ebp-0x14]
10009926:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
1000992d:	ff 15 68 d1 00 10    	call   DWORD PTR ds:0x1000d168
10009933:	68 78 e3 00 10       	push   0x1000e378
10009938:	6a 41                	push   0x41
1000993a:	8d 4d ec             	lea    ecx,[ebp-0x14]
1000993d:	ff 15 c8 d0 00 10    	call   DWORD PTR ds:0x1000d0c8
10009943:	8b 4f 24             	mov    ecx,DWORD PTR [edi+0x24]
10009946:	8d 45 ec             	lea    eax,[ebp-0x14]
10009949:	50                   	push   eax
1000994a:	c7 45 fc 1a 00 00 00 	mov    DWORD PTR [ebp-0x4],0x1a
10009951:	ff 15 9c d2 00 10    	call   DWORD PTR ds:0x1000d29c
10009957:	8d 4d ec             	lea    ecx,[ebp-0x14]
1000995a:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
10009961:	ff 15 68 d1 00 10    	call   DWORD PTR ds:0x1000d168
10009967:	8b 4f 24             	mov    ecx,DWORD PTR [edi+0x24]
1000996a:	6a 01                	push   0x1
1000996c:	ff 15 a8 d2 00 10    	call   DWORD PTR ds:0x1000d2a8
10009972:	8b 4f 24             	mov    ecx,DWORD PTR [edi+0x24]
10009975:	6a 00                	push   0x0
10009977:	ff 15 30 d3 00 10    	call   DWORD PTR ds:0x1000d330
1000997d:	8b 4f 18             	mov    ecx,DWORD PTR [edi+0x18]
10009980:	6a 00                	push   0x0
10009982:	6a 00                	push   0x0
10009984:	ff 77 24             	push   DWORD PTR [edi+0x24]
10009987:	ff 15 c4 d2 00 10    	call   DWORD PTR ds:0x1000d2c4
1000998d:	6a 18                	push   0x18
1000998f:	e8 0c 0a 00 00       	call   0x1000a3a0
10009994:	8b f0                	mov    esi,eax
10009996:	83 c4 04             	add    esp,0x4
10009999:	89 75 e4             	mov    DWORD PTR [ebp-0x1c],esi
1000999c:	c7 45 fc 1b 00 00 00 	mov    DWORD PTR [ebp-0x4],0x1b
100099a3:	85 f6                	test   esi,esi
100099a5:	74 1a                	je     0x100099c1
100099a7:	ff 77 14             	push   DWORD PTR [edi+0x14]
100099aa:	8b ce                	mov    ecx,esi
100099ac:	ff 15 24 d3 00 10    	call   DWORD PTR ds:0x1000d324
100099b2:	c7 06 3c e0 00 10    	mov    DWORD PTR [esi],0x1000e03c
100099b8:	c7 46 08 00 e1 00 10 	mov    DWORD PTR [esi+0x8],0x1000e100
100099bf:	eb 02                	jmp    0x100099c3
100099c1:	33 f6                	xor    esi,esi
100099c3:	8d 45 ec             	lea    eax,[ebp-0x14]
100099c6:	89 77 28             	mov    DWORD PTR [edi+0x28],esi
100099c9:	50                   	push   eax
100099ca:	8d 4d f3             	lea    ecx,[ebp-0xd]
100099cd:	e8 ce de ff ff       	call   0x100078a0
100099d2:	50                   	push   eax
100099d3:	8b ce                	mov    ecx,esi
100099d5:	c7 45 fc 1c 00 00 00 	mov    DWORD PTR [ebp-0x4],0x1c
100099dc:	ff d3                	call   ebx
100099de:	8d 4d ec             	lea    ecx,[ebp-0x14]
100099e1:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
100099e8:	ff 15 68 d1 00 10    	call   DWORD PTR ds:0x1000d168
100099ee:	68 78 e3 00 10       	push   0x1000e378
100099f3:	6a 41                	push   0x41
100099f5:	8d 4d ec             	lea    ecx,[ebp-0x14]
100099f8:	ff 15 c8 d0 00 10    	call   DWORD PTR ds:0x1000d0c8
100099fe:	8b 4f 28             	mov    ecx,DWORD PTR [edi+0x28]
10009a01:	8d 45 ec             	lea    eax,[ebp-0x14]
10009a04:	50                   	push   eax
10009a05:	c7 45 fc 1d 00 00 00 	mov    DWORD PTR [ebp-0x4],0x1d
10009a0c:	ff 15 9c d2 00 10    	call   DWORD PTR ds:0x1000d29c
10009a12:	8d 4d ec             	lea    ecx,[ebp-0x14]
10009a15:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
10009a1c:	ff 15 68 d1 00 10    	call   DWORD PTR ds:0x1000d168
10009a22:	8b 4f 18             	mov    ecx,DWORD PTR [edi+0x18]
10009a25:	6a 00                	push   0x0
10009a27:	6a 00                	push   0x0
10009a29:	ff 77 28             	push   DWORD PTR [edi+0x28]
10009a2c:	ff 15 c4 d2 00 10    	call   DWORD PTR ds:0x1000d2c4
10009a32:	6a 18                	push   0x18
10009a34:	e8 67 09 00 00       	call   0x1000a3a0
10009a39:	8b f0                	mov    esi,eax
10009a3b:	83 c4 04             	add    esp,0x4
10009a3e:	89 75 e4             	mov    DWORD PTR [ebp-0x1c],esi
10009a41:	c7 45 fc 1e 00 00 00 	mov    DWORD PTR [ebp-0x4],0x1e
10009a48:	85 f6                	test   esi,esi
10009a4a:	74 1a                	je     0x10009a66
10009a4c:	ff 77 14             	push   DWORD PTR [edi+0x14]
10009a4f:	8b ce                	mov    ecx,esi
10009a51:	ff 15 24 d3 00 10    	call   DWORD PTR ds:0x1000d324
10009a57:	c7 06 3c e0 00 10    	mov    DWORD PTR [esi],0x1000e03c
10009a5d:	c7 46 08 00 e1 00 10 	mov    DWORD PTR [esi+0x8],0x1000e100
10009a64:	eb 02                	jmp    0x10009a68
10009a66:	33 f6                	xor    esi,esi
10009a68:	8d 45 ec             	lea    eax,[ebp-0x14]
10009a6b:	89 77 2c             	mov    DWORD PTR [edi+0x2c],esi
10009a6e:	50                   	push   eax
10009a6f:	8d 4d f3             	lea    ecx,[ebp-0xd]
10009a72:	e8 a9 dd ff ff       	call   0x10007820
10009a77:	50                   	push   eax
10009a78:	8b ce                	mov    ecx,esi
10009a7a:	c7 45 fc 1f 00 00 00 	mov    DWORD PTR [ebp-0x4],0x1f
10009a81:	ff d3                	call   ebx
10009a83:	8d 4d ec             	lea    ecx,[ebp-0x14]
10009a86:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
10009a8d:	ff 15 68 d1 00 10    	call   DWORD PTR ds:0x1000d168
10009a93:	8b 4f 2c             	mov    ecx,DWORD PTR [edi+0x2c]
10009a96:	6a 01                	push   0x1
10009a98:	ff 15 90 d2 00 10    	call   DWORD PTR ds:0x1000d290
10009a9e:	68 78 e3 00 10       	push   0x1000e378
10009aa3:	6a 41                	push   0x41
10009aa5:	8d 4d ec             	lea    ecx,[ebp-0x14]
10009aa8:	ff 15 c8 d0 00 10    	call   DWORD PTR ds:0x1000d0c8
10009aae:	8b 4f 2c             	mov    ecx,DWORD PTR [edi+0x2c]
10009ab1:	8d 45 ec             	lea    eax,[ebp-0x14]
10009ab4:	50                   	push   eax
10009ab5:	c7 45 fc 20 00 00 00 	mov    DWORD PTR [ebp-0x4],0x20
10009abc:	ff 15 9c d2 00 10    	call   DWORD PTR ds:0x1000d29c
10009ac2:	8d 4d ec             	lea    ecx,[ebp-0x14]
10009ac5:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
10009acc:	ff 15 68 d1 00 10    	call   DWORD PTR ds:0x1000d168
10009ad2:	8b 4f 18             	mov    ecx,DWORD PTR [edi+0x18]
10009ad5:	6a 00                	push   0x0
10009ad7:	6a 00                	push   0x0
10009ad9:	ff 77 2c             	push   DWORD PTR [edi+0x2c]
10009adc:	ff 15 c4 d2 00 10    	call   DWORD PTR ds:0x1000d2c4
10009ae2:	6a 18                	push   0x18
10009ae4:	e8 b7 08 00 00       	call   0x1000a3a0
10009ae9:	8b f0                	mov    esi,eax
10009aeb:	83 c4 04             	add    esp,0x4
10009aee:	89 75 e4             	mov    DWORD PTR [ebp-0x1c],esi
10009af1:	c7 45 fc 21 00 00 00 	mov    DWORD PTR [ebp-0x4],0x21
10009af8:	85 f6                	test   esi,esi
10009afa:	74 1a                	je     0x10009b16
10009afc:	ff 77 14             	push   DWORD PTR [edi+0x14]
10009aff:	8b ce                	mov    ecx,esi
10009b01:	ff 15 b0 d2 00 10    	call   DWORD PTR ds:0x1000d2b0
10009b07:	c7 06 0c dd 00 10    	mov    DWORD PTR [esi],0x1000dd0c
10009b0d:	c7 46 08 d0 dd 00 10 	mov    DWORD PTR [esi+0x8],0x1000ddd0
10009b14:	eb 02                	jmp    0x10009b18
10009b16:	33 f6                	xor    esi,esi
10009b18:	8d 45 ec             	lea    eax,[ebp-0x14]
10009b1b:	89 77 30             	mov    DWORD PTR [edi+0x30],esi
10009b1e:	50                   	push   eax
10009b1f:	8d 4d f3             	lea    ecx,[ebp-0xd]
10009b22:	e8 09 de ff ff       	call   0x10007930
10009b27:	50                   	push   eax
10009b28:	8b ce                	mov    ecx,esi
10009b2a:	c7 45 fc 22 00 00 00 	mov    DWORD PTR [ebp-0x4],0x22
10009b31:	ff d3                	call   ebx
10009b33:	8d 4d ec             	lea    ecx,[ebp-0x14]
10009b36:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
10009b3d:	ff 15 68 d1 00 10    	call   DWORD PTR ds:0x1000d168
10009b43:	8b 4f 18             	mov    ecx,DWORD PTR [edi+0x18]
10009b46:	6a 00                	push   0x0
10009b48:	6a 00                	push   0x0
10009b4a:	ff 77 30             	push   DWORD PTR [edi+0x30]
10009b4d:	ff 15 c4 d2 00 10    	call   DWORD PTR ds:0x1000d2c4
10009b53:	6a 18                	push   0x18
10009b55:	e8 46 08 00 00       	call   0x1000a3a0
10009b5a:	8b f0                	mov    esi,eax
10009b5c:	83 c4 04             	add    esp,0x4
10009b5f:	89 75 e4             	mov    DWORD PTR [ebp-0x1c],esi
10009b62:	c7 45 fc 23 00 00 00 	mov    DWORD PTR [ebp-0x4],0x23
10009b69:	85 f6                	test   esi,esi
10009b6b:	74 1a                	je     0x10009b87
10009b6d:	ff 77 14             	push   DWORD PTR [edi+0x14]
10009b70:	8b ce                	mov    ecx,esi
10009b72:	ff 15 b0 d2 00 10    	call   DWORD PTR ds:0x1000d2b0
10009b78:	c7 06 0c dd 00 10    	mov    DWORD PTR [esi],0x1000dd0c
10009b7e:	c7 46 08 d0 dd 00 10 	mov    DWORD PTR [esi+0x8],0x1000ddd0
10009b85:	eb 02                	jmp    0x10009b89
10009b87:	33 f6                	xor    esi,esi
10009b89:	8d 45 e4             	lea    eax,[ebp-0x1c]
10009b8c:	89 77 34             	mov    DWORD PTR [edi+0x34],esi
10009b8f:	50                   	push   eax
10009b90:	8d 4d f3             	lea    ecx,[ebp-0xd]
10009b93:	e8 a8 dc ff ff       	call   0x10007840
10009b98:	50                   	push   eax
10009b99:	8b ce                	mov    ecx,esi
10009b9b:	c7 45 fc 24 00 00 00 	mov    DWORD PTR [ebp-0x4],0x24
10009ba2:	ff d3                	call   ebx
10009ba4:	8d 4d e4             	lea    ecx,[ebp-0x1c]
10009ba7:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
10009bae:	ff 15 68 d1 00 10    	call   DWORD PTR ds:0x1000d168
10009bb4:	8b 4f 18             	mov    ecx,DWORD PTR [edi+0x18]
10009bb7:	6a 00                	push   0x0
10009bb9:	6a 00                	push   0x0
10009bbb:	ff 77 34             	push   DWORD PTR [edi+0x34]
10009bbe:	ff 15 c4 d2 00 10    	call   DWORD PTR ds:0x1000d2c4
10009bc4:	6a 24                	push   0x24
10009bc6:	e8 d5 07 00 00       	call   0x1000a3a0
10009bcb:	8b f0                	mov    esi,eax
10009bcd:	83 c4 04             	add    esp,0x4
10009bd0:	89 75 ec             	mov    DWORD PTR [ebp-0x14],esi
10009bd3:	c7 45 fc 25 00 00 00 	mov    DWORD PTR [ebp-0x4],0x25
10009bda:	85 f6                	test   esi,esi
10009bdc:	74 18                	je     0x10009bf6
10009bde:	6a 01                	push   0x1
10009be0:	6a 07                	push   0x7
10009be2:	6a 14                	push   0x14
10009be4:	6a 28                	push   0x28
10009be6:	8b ce                	mov    ecx,esi
10009be8:	ff 15 b8 d2 00 10    	call   DWORD PTR ds:0x1000d2b8
10009bee:	c7 06 f4 dd 00 10    	mov    DWORD PTR [esi],0x1000ddf4
10009bf4:	eb 02                	jmp    0x10009bf8
10009bf6:	33 f6                	xor    esi,esi
10009bf8:	8b 4f 18             	mov    ecx,DWORD PTR [edi+0x18]
10009bfb:	89 77 38             	mov    DWORD PTR [edi+0x38],esi
10009bfe:	56                   	push   esi
10009bff:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
10009c06:	8b 01                	mov    eax,DWORD PTR [ecx]
10009c08:	ff 50 2c             	call   DWORD PTR [eax+0x2c]
10009c0b:	8b 0f                	mov    ecx,DWORD PTR [edi]
10009c0d:	6a 00                	push   0x0
10009c0f:	6a 01                	push   0x1
10009c11:	6a 01                	push   0x1
10009c13:	6a 00                	push   0x0
10009c15:	6a 00                	push   0x0
10009c17:	ff 77 14             	push   DWORD PTR [edi+0x14]
10009c1a:	ff 15 ec d2 00 10    	call   DWORD PTR ds:0x1000d2ec
10009c20:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
10009c23:	8b cf                	mov    ecx,edi
10009c25:	53                   	push   ebx
10009c26:	e8 c5 f2 ff ff       	call   0x10008ef0
10009c2b:	8b 4f 08             	mov    ecx,DWORD PTR [edi+0x8]
10009c2e:	6a 00                	push   0x0
10009c30:	ff 15 20 d3 00 10    	call   DWORD PTR ds:0x1000d320
10009c36:	8b 4f 24             	mov    ecx,DWORD PTR [edi+0x24]
10009c39:	6a 00                	push   0x0
10009c3b:	ff 15 2c d3 00 10    	call   DWORD PTR ds:0x1000d32c
10009c41:	53                   	push   ebx
10009c42:	ff 15 c0 d0 00 10    	call   DWORD PTR ds:0x1000d0c0
10009c48:	83 c4 04             	add    esp,0x4
10009c4b:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10009c4e:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10009c55:	59                   	pop    ecx
10009c56:	5f                   	pop    edi
10009c57:	5e                   	pop    esi
10009c58:	5b                   	pop    ebx
10009c59:	8b e5                	mov    esp,ebp
10009c5b:	5d                   	pop    ebp
10009c5c:	c2 04 00             	ret    0x4
10009c5f:	cc                   	int3
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

