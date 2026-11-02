
/mnt/data/is2_re_analysis_kit_stage1_17_continuation_2026-11-01/original/is.exe:     file format pei-i386


disassembly of section .text:

00402390 <.text+0x1390>:
  402390:	56                   	push   esi
  402391:	8b f1                	mov    esi,ecx
  402393:	e8 e8 f7 ff ff       	call   0x401b80
  402398:	84 c0                	test   al,al
  40239a:	74 28                	je     0x4023c4
  40239c:	c6 86 b4 00 00 00 01 	mov    byte ptr [esi+0xb4],0x1
  4023a3:	e8 08 74 00 00       	call   0x4097b0
  4023a8:	e8 33 33 00 00       	call   0x4056e0
  4023ad:	68 4c 6f 45 00       	push   0x456f4c
  4023b2:	8d 8e 9c 00 00 00    	lea    ecx,[esi+0x9c]
  4023b8:	89 86 a4 00 00 00    	mov    dword ptr [esi+0xa4],eax
  4023be:	ff 15 b4 93 41 00    	call   dword ptr ds:0x4193b4
  4023c4:	5e                   	pop    esi
  4023c5:	c3                   	ret
  4023c6:	cc                   	int3
  4023c7:	cc                   	int3
  4023c8:	cc                   	int3
  4023c9:	cc                   	int3
  4023ca:	cc                   	int3
  4023cb:	cc                   	int3
  4023cc:	cc                   	int3
  4023cd:	cc                   	int3
  4023ce:	cc                   	int3
  4023cf:	cc                   	int3
  4023d0:	55                   	push   ebp
  4023d1:	8b ec                	mov    ebp,esp
  4023d3:	6a ff                	push   0xffffffff
  4023d5:	68 74 59 41 00       	push   0x415974
  4023da:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  4023e0:	50                   	push   eax
  4023e1:	83 ec 18             	sub    esp,0x18
  4023e4:	53                   	push   ebx
  4023e5:	56                   	push   esi
  4023e6:	57                   	push   edi
  4023e7:	a1 cc 90 46 00       	mov    eax,ds:0x4690cc
  4023ec:	33 c5                	xor    eax,ebp
  4023ee:	50                   	push   eax
  4023ef:	8d 45 f4             	lea    eax,[ebp-0xc]
  4023f2:	64 a3 00 00 00 00    	mov    fs:0x0,eax
  4023f8:	89 65 f0             	mov    dword ptr [ebp-0x10],esp
  4023fb:	8b f9                	mov    edi,ecx
  4023fd:	e8 7e f7 ff ff       	call   0x401b80
  402402:	84 c0                	test   al,al
  402404:	0f 84 0d 01 00 00    	je     0x402517
  40240a:	6a 02                	push   0x2
  40240c:	68 14 72 45 00       	push   0x457214
  402411:	ff 15 a8 93 41 00    	call   dword ptr ds:0x4193a8
  402417:	89 45 e8             	mov    dword ptr [ebp-0x18],eax
  40241a:	6a ff                	push   0xffffffff
  40241c:	6a 00                	push   0x0
  40241e:	8d 45 dc             	lea    eax,[ebp-0x24]
  402421:	c7 45 fc 00 00 00 00 	mov    dword ptr [ebp-0x4],0x0
  402428:	68 04 71 45 00       	push   0x457104
  40242d:	50                   	push   eax
  40242e:	e8 8d 06 00 00       	call   0x402ac0
  402433:	8b f0                	mov    esi,eax
  402435:	6a ff                	push   0xffffffff
  402437:	6a 00                	push   0x0
  402439:	8d 45 e0             	lea    eax,[ebp-0x20]
  40243c:	c6 45 fc 01          	mov    byte ptr [ebp-0x4],0x1
  402440:	68 18 72 45 00       	push   0x457218
  402445:	50                   	push   eax
  402446:	e8 75 06 00 00       	call   0x402ac0
  40244b:	6a 00                	push   0x0
  40244d:	6a 00                	push   0x0
  40244f:	56                   	push   esi
  402450:	8d 4d e8             	lea    ecx,[ebp-0x18]
  402453:	c6 45 fc 02          	mov    byte ptr [ebp-0x4],0x2
  402457:	51                   	push   ecx
  402458:	50                   	push   eax
  402459:	8d 45 e4             	lea    eax,[ebp-0x1c]
  40245c:	57                   	push   edi
  40245d:	50                   	push   eax
  40245e:	ff 15 2c 9a 41 00    	call   dword ptr ds:0x419a2c
  402464:	83 c4 44             	add    esp,0x44
  402467:	8d b7 9c 00 00 00    	lea    esi,[edi+0x9c]
  40246d:	8b ce                	mov    ecx,esi
  40246f:	50                   	push   eax
  402470:	ff 15 c8 93 41 00    	call   dword ptr ds:0x4193c8
  402476:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  402479:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  40247f:	8d 4d e0             	lea    ecx,[ebp-0x20]
  402482:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  402488:	8d 4d dc             	lea    ecx,[ebp-0x24]
  40248b:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  402491:	8d 4d e8             	lea    ecx,[ebp-0x18]
  402494:	c7 45 fc ff ff ff ff 	mov    dword ptr [ebp-0x4],0xffffffff
  40249b:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  4024a1:	6a 03                	push   0x3
  4024a3:	e8 f8 72 00 00       	call   0x4097a0
  4024a8:	8b c8                	mov    ecx,eax
  4024aa:	ff 15 78 9a 41 00    	call   dword ptr ds:0x419a78
  4024b0:	68 4c 6f 45 00       	push   0x456f4c
  4024b5:	8b ce                	mov    ecx,esi
  4024b7:	ff 15 ac 93 41 00    	call   dword ptr ds:0x4193ac
  4024bd:	84 c0                	test   al,al
  4024bf:	74 56                	je     0x402517
  4024c1:	51                   	push   ecx
  4024c2:	8b cc                	mov    ecx,esp
  4024c4:	c7 45 fc 03 00 00 00 	mov    dword ptr [ebp-0x4],0x3
  4024cb:	56                   	push   esi
  4024cc:	ff 15 d4 93 41 00    	call   dword ptr ds:0x4193d4
  4024d2:	8b cf                	mov    ecx,edi
  4024d4:	e8 97 03 00 00       	call   0x402870
  4024d9:	e8 02 32 00 00       	call   0x4056e0
  4024de:	8b cf                	mov    ecx,edi
  4024e0:	89 87 a4 00 00 00    	mov    dword ptr [edi+0xa4],eax
  4024e6:	e8 75 05 00 00       	call   0x402a60
  4024eb:	68 88 13 00 00       	push   0x1388
  4024f0:	51                   	push   ecx
  4024f1:	8b c4                	mov    eax,esp
  4024f3:	89 65 dc             	mov    dword ptr [ebp-0x24],esp
  4024f6:	50                   	push   eax
  4024f7:	8d 4d ef             	lea    ecx,[ebp-0x11]
  4024fa:	c6 45 ef 00          	mov    byte ptr [ebp-0x11],0x0
  4024fe:	e8 4d f1 ff ff       	call   0x401650
  402503:	c6 45 fc 04          	mov    byte ptr [ebp-0x4],0x4
  402507:	e8 94 72 00 00       	call   0x4097a0
  40250c:	8b c8                	mov    ecx,eax
  40250e:	c6 45 fc 03          	mov    byte ptr [ebp-0x4],0x3
  402512:	e8 69 fb 00 00       	call   0x412080
  402517:	8b 4d f4             	mov    ecx,dword ptr [ebp-0xc]
  40251a:	64 89 0d 00 00 00 00 	mov    dword ptr fs:0x0,ecx
  402521:	59                   	pop    ecx
  402522:	5f                   	pop    edi
  402523:	5e                   	pop    esi
  402524:	5b                   	pop    ebx
  402525:	8b e5                	mov    esp,ebp
  402527:	5d                   	pop    ebp
  402528:	c3                   	ret
  402529:	b8 17 25 40 00       	mov    eax,0x402517
  40252e:	c3                   	ret
  40252f:	cc                   	int3
