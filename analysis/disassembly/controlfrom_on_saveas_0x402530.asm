
/mnt/data/is2_re_analysis_kit_stage1_17_continuation_2026-11-01/original/is.exe:     file format pei-i386


disassembly of section .text:

00402530 <.text+0x1530>:
  402530:	55                   	push   ebp
  402531:	8b ec                	mov    ebp,esp
  402533:	6a ff                	push   0xffffffff
  402535:	68 d7 59 41 00       	push   0x4159d7
  40253a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  402540:	50                   	push   eax
  402541:	83 ec 14             	sub    esp,0x14
  402544:	53                   	push   ebx
  402545:	56                   	push   esi
  402546:	57                   	push   edi
  402547:	a1 cc 90 46 00       	mov    eax,ds:0x4690cc
  40254c:	33 c5                	xor    eax,ebp
  40254e:	50                   	push   eax
  40254f:	8d 45 f4             	lea    eax,[ebp-0xc]
  402552:	64 a3 00 00 00 00    	mov    fs:0x0,eax
  402558:	8b d9                	mov    ebx,ecx
  40255a:	8d 4d ec             	lea    ecx,[ebp-0x14]
  40255d:	ff 15 d8 93 41 00    	call   dword ptr ds:0x4193d8
  402563:	8d bb 9c 00 00 00    	lea    edi,[ebx+0x9c]
  402569:	c7 45 fc 00 00 00 00 	mov    dword ptr [ebp-0x4],0x0
  402570:	68 4c 6f 45 00       	push   0x456f4c
  402575:	8b cf                	mov    ecx,edi
  402577:	ff 15 b0 93 41 00    	call   dword ptr ds:0x4193b0
  40257d:	84 c0                	test   al,al
  40257f:	0f 84 8e 00 00 00    	je     0x402613
  402585:	8d 45 e0             	lea    eax,[ebp-0x20]
  402588:	6a 01                	push   0x1
  40258a:	50                   	push   eax
  40258b:	ff 15 2c 93 41 00    	call   dword ptr ds:0x41932c
  402591:	83 c4 08             	add    esp,0x8
  402594:	8b f0                	mov    esi,eax
  402596:	8b 0e                	mov    ecx,dword ptr [esi]
  402598:	c6 45 fc 01          	mov    byte ptr [ebp-0x4],0x1
  40259c:	8b 01                	mov    eax,dword ptr [ecx]
  40259e:	83 f8 01             	cmp    eax,0x1
  4025a1:	74 0e                	je     0x4025b1
  4025a3:	85 c0                	test   eax,eax
  4025a5:	74 0a                	je     0x4025b1
  4025a7:	ff 71 04             	push   dword ptr [ecx+0x4]
  4025aa:	8b ce                	mov    ecx,esi
  4025ac:	e8 cf f8 ff ff       	call   0x401e80
  4025b1:	8b ce                	mov    ecx,esi
  4025b3:	ff 15 90 93 41 00    	call   dword ptr ds:0x419390
  4025b9:	8b f0                	mov    esi,eax
  4025bb:	8d 45 f2             	lea    eax,[ebp-0xe]
  4025be:	50                   	push   eax
  4025bf:	ff 15 34 93 41 00    	call   dword ptr ds:0x419334
  4025c5:	0f b7 08             	movzx  ecx,word ptr [eax]
  4025c8:	8d 45 e4             	lea    eax,[ebp-0x1c]
  4025cb:	51                   	push   ecx
  4025cc:	56                   	push   esi
  4025cd:	50                   	push   eax
  4025ce:	e8 ad ef ff ff       	call   0x401580
  4025d3:	68 ac 70 45 00       	push   0x4570ac
  4025d8:	50                   	push   eax
  4025d9:	8d 45 e8             	lea    eax,[ebp-0x18]
  4025dc:	c6 45 fc 02          	mov    byte ptr [ebp-0x4],0x2
  4025e0:	50                   	push   eax
  4025e1:	e8 0a ef ff ff       	call   0x4014f0
  4025e6:	83 c4 1c             	add    esp,0x1c
  4025e9:	8d 4d ec             	lea    ecx,[ebp-0x14]
  4025ec:	50                   	push   eax
  4025ed:	ff 15 cc 93 41 00    	call   dword ptr ds:0x4193cc
  4025f3:	8d 4d e8             	lea    ecx,[ebp-0x18]
  4025f6:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  4025fc:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  4025ff:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  402605:	8d 4d e0             	lea    ecx,[ebp-0x20]
  402608:	c6 45 fc 00          	mov    byte ptr [ebp-0x4],0x0
  40260c:	e8 0f ed ff ff       	call   0x401320
  402611:	eb 0a                	jmp    0x40261d
  402613:	57                   	push   edi
  402614:	8d 4d ec             	lea    ecx,[ebp-0x14]
  402617:	ff 15 cc 93 41 00    	call   dword ptr ds:0x4193cc
  40261d:	6a ff                	push   0xffffffff
  40261f:	6a 00                	push   0x0
  402621:	8d 45 e8             	lea    eax,[ebp-0x18]
  402624:	68 04 71 45 00       	push   0x457104
  402629:	50                   	push   eax
  40262a:	e8 91 04 00 00       	call   0x402ac0
  40262f:	8b f0                	mov    esi,eax
  402631:	6a ff                	push   0xffffffff
  402633:	6a 00                	push   0x0
  402635:	8d 45 e4             	lea    eax,[ebp-0x1c]
  402638:	c6 45 fc 03          	mov    byte ptr [ebp-0x4],0x3
  40263c:	68 1c 71 45 00       	push   0x45711c
  402641:	50                   	push   eax
  402642:	e8 79 04 00 00       	call   0x402ac0
  402647:	6a 00                	push   0x0
  402649:	6a 00                	push   0x0
  40264b:	56                   	push   esi
  40264c:	8d 4d ec             	lea    ecx,[ebp-0x14]
  40264f:	c6 45 fc 04          	mov    byte ptr [ebp-0x4],0x4
  402653:	51                   	push   ecx
  402654:	50                   	push   eax
  402655:	8d 45 e0             	lea    eax,[ebp-0x20]
  402658:	53                   	push   ebx
  402659:	50                   	push   eax
  40265a:	ff 15 28 9a 41 00    	call   dword ptr ds:0x419a28
  402660:	83 c4 3c             	add    esp,0x3c
  402663:	8b cf                	mov    ecx,edi
  402665:	50                   	push   eax
  402666:	ff 15 c8 93 41 00    	call   dword ptr ds:0x4193c8
  40266c:	8d 4d e0             	lea    ecx,[ebp-0x20]
  40266f:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  402675:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  402678:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  40267e:	8d 4d e8             	lea    ecx,[ebp-0x18]
  402681:	c6 45 fc 00          	mov    byte ptr [ebp-0x4],0x0
  402685:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  40268b:	68 4c 6f 45 00       	push   0x456f4c
  402690:	8b cf                	mov    ecx,edi
  402692:	ff 15 ac 93 41 00    	call   dword ptr ds:0x4193ac
  402698:	84 c0                	test   al,al
  40269a:	0f 84 82 00 00 00    	je     0x402722
  4026a0:	51                   	push   ecx
  4026a1:	8b cc                	mov    ecx,esp
  4026a3:	57                   	push   edi
  4026a4:	ff 15 d4 93 41 00    	call   dword ptr ds:0x4193d4
  4026aa:	e8 21 93 00 00       	call   0x40b9d0
  4026af:	8b cc                	mov    ecx,esp
  4026b1:	57                   	push   edi
  4026b2:	ff 15 d4 93 41 00    	call   dword ptr ds:0x4193d4
  4026b8:	8b cb                	mov    ecx,ebx
  4026ba:	e8 b1 f0 ff ff       	call   0x401770
  4026bf:	57                   	push   edi
  4026c0:	8d 4d e8             	lea    ecx,[ebp-0x18]
  4026c3:	ff 15 44 93 41 00    	call   dword ptr ds:0x419344
  4026c9:	51                   	push   ecx
  4026ca:	8b c4                	mov    eax,esp
  4026cc:	89 65 e0             	mov    dword ptr [ebp-0x20],esp
  4026cf:	50                   	push   eax
  4026d0:	8d 4d e8             	lea    ecx,[ebp-0x18]
  4026d3:	c6 45 fc 05          	mov    byte ptr [ebp-0x4],0x5
  4026d7:	ff 15 38 93 41 00    	call   dword ptr ds:0x419338
  4026dd:	c6 45 fc 06          	mov    byte ptr [ebp-0x4],0x6
  4026e1:	e8 ba 70 00 00       	call   0x4097a0
  4026e6:	8b c8                	mov    ecx,eax
  4026e8:	c6 45 fc 05          	mov    byte ptr [ebp-0x4],0x5
  4026ec:	e8 ff f9 00 00       	call   0x4120f0
  4026f1:	68 88 13 00 00       	push   0x1388
  4026f6:	51                   	push   ecx
  4026f7:	8b c4                	mov    eax,esp
  4026f9:	89 65 e0             	mov    dword ptr [ebp-0x20],esp
  4026fc:	50                   	push   eax
  4026fd:	8d 4d f3             	lea    ecx,[ebp-0xd]
  402700:	e8 eb ee ff ff       	call   0x4015f0
  402705:	c6 45 fc 07          	mov    byte ptr [ebp-0x4],0x7
  402709:	e8 92 70 00 00       	call   0x4097a0
  40270e:	8b c8                	mov    ecx,eax
  402710:	c6 45 fc 05          	mov    byte ptr [ebp-0x4],0x5
  402714:	e8 67 f9 00 00       	call   0x412080
  402719:	8d 4d e8             	lea    ecx,[ebp-0x18]
  40271c:	ff 15 40 93 41 00    	call   dword ptr ds:0x419340
  402722:	8d 4d ec             	lea    ecx,[ebp-0x14]
  402725:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  40272b:	8b 4d f4             	mov    ecx,dword ptr [ebp-0xc]
  40272e:	64 89 0d 00 00 00 00 	mov    dword ptr fs:0x0,ecx
  402735:	59                   	pop    ecx
  402736:	5f                   	pop    edi
  402737:	5e                   	pop    esi
  402738:	5b                   	pop    ebx
  402739:	8b e5                	mov    esp,ebp
  40273b:	5d                   	pop    ebp
  40273c:	c3                   	ret
  40273d:	cc                   	int3
  40273e:	cc                   	int3
  40273f:	cc                   	int3
