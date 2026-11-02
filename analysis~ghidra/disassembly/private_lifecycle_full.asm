

===== VA 0x10001410 | ??0AbstractModel@@IAE@PAVAbstractModelPrivate@@@Z | span 0xc0 =====
Disassembly of section .text:

10001410 <.text+0x410>:
10001410:	55                   	push   ebp
10001411:	8b ec                	mov    ebp,esp
10001413:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10001416:	89 41 04             	mov    DWORD PTR [ecx+0x4],eax
10001419:	8b c1                	mov    eax,ecx
1000141b:	c7 01 f4 70 01 10    	mov    DWORD PTR [ecx],0x100170f4
10001421:	5d                   	pop    ebp
10001422:	c2 04 00             	ret    0x4
10001425:	cc                   	int3
10001426:	cc                   	int3
10001427:	cc                   	int3
10001428:	cc                   	int3
10001429:	cc                   	int3
1000142a:	cc                   	int3
1000142b:	cc                   	int3
1000142c:	cc                   	int3
1000142d:	cc                   	int3
1000142e:	cc                   	int3
1000142f:	cc                   	int3
10001430:	55                   	push   ebp
10001431:	8b ec                	mov    ebp,esp
10001433:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10001436:	c7 01 f4 70 01 10    	mov    DWORD PTR [ecx],0x100170f4
1000143c:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
1000143f:	89 41 04             	mov    DWORD PTR [ecx+0x4],eax
10001442:	8b c1                	mov    eax,ecx
10001444:	5d                   	pop    ebp
10001445:	c2 04 00             	ret    0x4
10001448:	cc                   	int3
10001449:	cc                   	int3
1000144a:	cc                   	int3
1000144b:	cc                   	int3
1000144c:	cc                   	int3
1000144d:	cc                   	int3
1000144e:	cc                   	int3
1000144f:	cc                   	int3
10001450:	56                   	push   esi
10001451:	8b f1                	mov    esi,ecx
10001453:	6a 28                	push   0x28
10001455:	c7 06 f4 70 01 10    	mov    DWORD PTR [esi],0x100170f4
1000145b:	e8 90 38 01 00       	call   0x10014cf0
10001460:	83 c4 04             	add    esp,0x4
10001463:	85 c0                	test   eax,eax
10001465:	74 5b                	je     0x100014c2
10001467:	0f 57 c0             	xorps  xmm0,xmm0
1000146a:	0f 11 00             	movups XMMWORD PTR [eax],xmm0
1000146d:	0f 11 40 10          	movups XMMWORD PTR [eax+0x10],xmm0
10001471:	66 0f d6 40 20       	movq   QWORD PTR [eax+0x20],xmm0
10001476:	c7 00 48 71 01 10    	mov    DWORD PTR [eax],0x10017148
1000147c:	c7 40 04 00 00 00 00 	mov    DWORD PTR [eax+0x4],0x0
10001483:	c7 40 08 00 00 00 00 	mov    DWORD PTR [eax+0x8],0x0
1000148a:	c7 40 0c 00 00 00 00 	mov    DWORD PTR [eax+0xc],0x0
10001491:	c7 40 10 00 00 00 00 	mov    DWORD PTR [eax+0x10],0x0
10001498:	c7 40 14 00 00 00 00 	mov    DWORD PTR [eax+0x14],0x0
1000149f:	c7 40 18 00 00 00 00 	mov    DWORD PTR [eax+0x18],0x0
100014a6:	c7 40 1c 00 00 00 00 	mov    DWORD PTR [eax+0x1c],0x0
100014ad:	c7 40 20 00 00 00 00 	mov    DWORD PTR [eax+0x20],0x0
100014b4:	c7 40 24 00 00 00 00 	mov    DWORD PTR [eax+0x24],0x0
100014bb:	89 46 04             	mov    DWORD PTR [esi+0x4],eax
100014be:	8b c6                	mov    eax,esi
100014c0:	5e                   	pop    esi
100014c1:	c3                   	ret
100014c2:	c7 46 04 00 00 00 00 	mov    DWORD PTR [esi+0x4],0x0
100014c9:	8b c6                	mov    eax,esi
100014cb:	5e                   	pop    esi
100014cc:	c3                   	ret
100014cd:	cc                   	int3
100014ce:	cc                   	int3
100014cf:	cc                   	int3


===== VA 0x100014d0 | ??0AbstractModelPrivate@@QAE@ABV0@@Z | span 0x80 =====
Disassembly of section .text:

100014d0 <.text+0x4d0>:
100014d0:	55                   	push   ebp
100014d1:	8b ec                	mov    ebp,esp
100014d3:	6a ff                	push   0xffffffff
100014d5:	68 a6 5b 01 10       	push   0x10015ba6
100014da:	64 a1 00 00 00 00    	mov    eax,fs:0x0
100014e0:	50                   	push   eax
100014e1:	51                   	push   ecx
100014e2:	56                   	push   esi
100014e3:	57                   	push   edi
100014e4:	a1 04 10 02 10       	mov    eax,ds:0x10021004
100014e9:	33 c5                	xor    eax,ebp
100014eb:	50                   	push   eax
100014ec:	8d 45 f4             	lea    eax,[ebp-0xc]
100014ef:	64 a3 00 00 00 00    	mov    fs:0x0,eax
100014f5:	8b f9                	mov    edi,ecx
100014f7:	89 7d f0             	mov    DWORD PTR [ebp-0x10],edi
100014fa:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
100014fd:	8d 4f 04             	lea    ecx,[edi+0x4]
10001500:	c7 07 48 71 01 10    	mov    DWORD PTR [edi],0x10017148
10001506:	8d 46 04             	lea    eax,[esi+0x4]
10001509:	50                   	push   eax
1000150a:	e8 f1 fc ff ff       	call   0x10001200
1000150f:	8d 46 10             	lea    eax,[esi+0x10]
10001512:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10001519:	50                   	push   eax
1000151a:	8d 4f 10             	lea    ecx,[edi+0x10]
1000151d:	e8 de fc ff ff       	call   0x10001200
10001522:	8d 46 1c             	lea    eax,[esi+0x1c]
10001525:	c6 45 fc 01          	mov    BYTE PTR [ebp-0x4],0x1
10001529:	50                   	push   eax
1000152a:	8d 4f 1c             	lea    ecx,[edi+0x1c]
1000152d:	e8 ce fc ff ff       	call   0x10001200
10001532:	8b c7                	mov    eax,edi
10001534:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10001537:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000153e:	59                   	pop    ecx
1000153f:	5f                   	pop    edi
10001540:	5e                   	pop    esi
10001541:	8b e5                	mov    esp,ebp
10001543:	5d                   	pop    ebp
10001544:	c2 04 00             	ret    0x4
10001547:	cc                   	int3
10001548:	cc                   	int3
10001549:	cc                   	int3
1000154a:	cc                   	int3
1000154b:	cc                   	int3
1000154c:	cc                   	int3
1000154d:	cc                   	int3
1000154e:	cc                   	int3
1000154f:	cc                   	int3


===== VA 0x10001550 | ??0AbstractModelPrivate@@QAE@XZ | span 0x170 =====
Disassembly of section .text:

10001550 <.text+0x550>:
10001550:	c7 01 48 71 01 10    	mov    DWORD PTR [ecx],0x10017148
10001556:	8b c1                	mov    eax,ecx
10001558:	c7 41 04 00 00 00 00 	mov    DWORD PTR [ecx+0x4],0x0
1000155f:	c7 41 08 00 00 00 00 	mov    DWORD PTR [ecx+0x8],0x0
10001566:	c7 41 0c 00 00 00 00 	mov    DWORD PTR [ecx+0xc],0x0
1000156d:	c7 41 10 00 00 00 00 	mov    DWORD PTR [ecx+0x10],0x0
10001574:	c7 41 14 00 00 00 00 	mov    DWORD PTR [ecx+0x14],0x0
1000157b:	c7 41 18 00 00 00 00 	mov    DWORD PTR [ecx+0x18],0x0
10001582:	c7 41 1c 00 00 00 00 	mov    DWORD PTR [ecx+0x1c],0x0
10001589:	c7 41 20 00 00 00 00 	mov    DWORD PTR [ecx+0x20],0x0
10001590:	c7 41 24 00 00 00 00 	mov    DWORD PTR [ecx+0x24],0x0
10001597:	c3                   	ret
10001598:	cc                   	int3
10001599:	cc                   	int3
1000159a:	cc                   	int3
1000159b:	cc                   	int3
1000159c:	cc                   	int3
1000159d:	cc                   	int3
1000159e:	cc                   	int3
1000159f:	cc                   	int3
100015a0:	55                   	push   ebp
100015a1:	8b ec                	mov    ebp,esp
100015a3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
100015a6:	89 01                	mov    DWORD PTR [ecx],eax
100015a8:	8a 45 0c             	mov    al,BYTE PTR [ebp+0xc]
100015ab:	88 41 04             	mov    BYTE PTR [ecx+0x4],al
100015ae:	8b c1                	mov    eax,ecx
100015b0:	c7 41 08 01 00 00 00 	mov    DWORD PTR [ecx+0x8],0x1
100015b7:	5d                   	pop    ebp
100015b8:	c2 08 00             	ret    0x8
100015bb:	cc                   	int3
100015bc:	cc                   	int3
100015bd:	cc                   	int3
100015be:	cc                   	int3
100015bf:	cc                   	int3
100015c0:	c7 41 08 01 00 00 00 	mov    DWORD PTR [ecx+0x8],0x1
100015c7:	8b c1                	mov    eax,ecx
100015c9:	c3                   	ret
100015ca:	cc                   	int3
100015cb:	cc                   	int3
100015cc:	cc                   	int3
100015cd:	cc                   	int3
100015ce:	cc                   	int3
100015cf:	cc                   	int3
100015d0:	6a 18                	push   0x18
100015d2:	6a 01                	push   0x1
100015d4:	ff 31                	push   DWORD PTR [ecx]
100015d6:	e8 a5 06 00 00       	call   0x10001c80
100015db:	83 c4 0c             	add    esp,0xc
100015de:	c3                   	ret
100015df:	cc                   	int3
100015e0:	6a 04                	push   0x4
100015e2:	ff 71 04             	push   DWORD PTR [ecx+0x4]
100015e5:	e8 3e 37 01 00       	call   0x10014d28
100015ea:	83 c4 08             	add    esp,0x8
100015ed:	c3                   	ret
100015ee:	cc                   	int3
100015ef:	cc                   	int3
100015f0:	56                   	push   esi
100015f1:	8b f1                	mov    esi,ecx
100015f3:	57                   	push   edi
100015f4:	33 ff                	xor    edi,edi
100015f6:	8b 56 04             	mov    edx,DWORD PTR [esi+0x4]
100015f9:	c7 06 f4 70 01 10    	mov    DWORD PTR [esi],0x100170f4
100015ff:	8b 42 08             	mov    eax,DWORD PTR [edx+0x8]
10001602:	2b 42 04             	sub    eax,DWORD PTR [edx+0x4]
10001605:	c1 f8 02             	sar    eax,0x2
10001608:	85 c0                	test   eax,eax
1000160a:	74 28                	je     0x10001634
1000160c:	0f 1f 40 00          	nop    DWORD PTR [eax+0x0]
10001610:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
10001613:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
10001616:	8b 0c b8             	mov    ecx,DWORD PTR [eax+edi*4]
10001619:	85 c9                	test   ecx,ecx
1000161b:	74 06                	je     0x10001623
1000161d:	8b 01                	mov    eax,DWORD PTR [ecx]
1000161f:	6a 01                	push   0x1
10001621:	ff 10                	call   DWORD PTR [eax]
10001623:	8b 4e 04             	mov    ecx,DWORD PTR [esi+0x4]
10001626:	47                   	inc    edi
10001627:	8b 41 08             	mov    eax,DWORD PTR [ecx+0x8]
1000162a:	2b 41 04             	sub    eax,DWORD PTR [ecx+0x4]
1000162d:	c1 f8 02             	sar    eax,0x2
10001630:	3b f8                	cmp    edi,eax
10001632:	72 dc                	jb     0x10001610
10001634:	8b 4e 04             	mov    ecx,DWORD PTR [esi+0x4]
10001637:	33 ff                	xor    edi,edi
10001639:	8b 41 14             	mov    eax,DWORD PTR [ecx+0x14]
1000163c:	2b 41 10             	sub    eax,DWORD PTR [ecx+0x10]
1000163f:	c1 f8 02             	sar    eax,0x2
10001642:	85 c0                	test   eax,eax
10001644:	74 24                	je     0x1000166a
10001646:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
10001649:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
1000164c:	8b 0c b8             	mov    ecx,DWORD PTR [eax+edi*4]
1000164f:	85 c9                	test   ecx,ecx
10001651:	74 06                	je     0x10001659
10001653:	8b 01                	mov    eax,DWORD PTR [ecx]
10001655:	6a 01                	push   0x1
10001657:	ff 10                	call   DWORD PTR [eax]
10001659:	8b 4e 04             	mov    ecx,DWORD PTR [esi+0x4]
1000165c:	47                   	inc    edi
1000165d:	8b 41 14             	mov    eax,DWORD PTR [ecx+0x14]
10001660:	2b 41 10             	sub    eax,DWORD PTR [ecx+0x10]
10001663:	c1 f8 02             	sar    eax,0x2
10001666:	3b f8                	cmp    edi,eax
10001668:	72 dc                	jb     0x10001646
1000166a:	8b 4e 04             	mov    ecx,DWORD PTR [esi+0x4]
1000166d:	33 ff                	xor    edi,edi
1000166f:	8b 41 20             	mov    eax,DWORD PTR [ecx+0x20]
10001672:	2b 41 1c             	sub    eax,DWORD PTR [ecx+0x1c]
10001675:	c1 f8 02             	sar    eax,0x2
10001678:	85 c0                	test   eax,eax
1000167a:	74 26                	je     0x100016a2
1000167c:	0f 1f 40 00          	nop    DWORD PTR [eax+0x0]
10001680:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
10001683:	8b 40 1c             	mov    eax,DWORD PTR [eax+0x1c]
10001686:	ff 34 b8             	push   DWORD PTR [eax+edi*4]
10001689:	e8 95 36 01 00       	call   0x10014d23
1000168e:	8b 4e 04             	mov    ecx,DWORD PTR [esi+0x4]
10001691:	47                   	inc    edi
10001692:	83 c4 04             	add    esp,0x4
10001695:	8b 41 20             	mov    eax,DWORD PTR [ecx+0x20]
10001698:	2b 41 1c             	sub    eax,DWORD PTR [ecx+0x1c]
1000169b:	c1 f8 02             	sar    eax,0x2
1000169e:	3b f8                	cmp    edi,eax
100016a0:	72 de                	jb     0x10001680
100016a2:	8b 4e 04             	mov    ecx,DWORD PTR [esi+0x4]
100016a5:	5f                   	pop    edi
100016a6:	5e                   	pop    esi
100016a7:	85 c9                	test   ecx,ecx
100016a9:	74 06                	je     0x100016b1
100016ab:	8b 01                	mov    eax,DWORD PTR [ecx]
100016ad:	6a 01                	push   0x1
100016af:	ff 10                	call   DWORD PTR [eax]
100016b1:	c3                   	ret
100016b2:	cc                   	int3
100016b3:	cc                   	int3
100016b4:	cc                   	int3
100016b5:	cc                   	int3
100016b6:	cc                   	int3
100016b7:	cc                   	int3
100016b8:	cc                   	int3
100016b9:	cc                   	int3
100016ba:	cc                   	int3
100016bb:	cc                   	int3
100016bc:	cc                   	int3
100016bd:	cc                   	int3
100016be:	cc                   	int3
100016bf:	cc                   	int3


===== VA 0x100016c0 | ??1AbstractModelPrivate@@UAE@XZ | span 0x220 =====
Disassembly of section .text:

100016c0 <.text+0x6c0>:
100016c0:	56                   	push   esi
100016c1:	8b f1                	mov    esi,ecx
100016c3:	c7 06 48 71 01 10    	mov    DWORD PTR [esi],0x10017148
100016c9:	8b 4e 1c             	mov    ecx,DWORD PTR [esi+0x1c]
100016cc:	85 c9                	test   ecx,ecx
100016ce:	74 29                	je     0x100016f9
100016d0:	8b 46 24             	mov    eax,DWORD PTR [esi+0x24]
100016d3:	2b c1                	sub    eax,ecx
100016d5:	6a 04                	push   0x4
100016d7:	c1 f8 02             	sar    eax,0x2
100016da:	50                   	push   eax
100016db:	51                   	push   ecx
100016dc:	e8 9f 05 00 00       	call   0x10001c80
100016e1:	c7 46 1c 00 00 00 00 	mov    DWORD PTR [esi+0x1c],0x0
100016e8:	83 c4 0c             	add    esp,0xc
100016eb:	c7 46 20 00 00 00 00 	mov    DWORD PTR [esi+0x20],0x0
100016f2:	c7 46 24 00 00 00 00 	mov    DWORD PTR [esi+0x24],0x0
100016f9:	8b 4e 10             	mov    ecx,DWORD PTR [esi+0x10]
100016fc:	85 c9                	test   ecx,ecx
100016fe:	74 29                	je     0x10001729
10001700:	8b 46 18             	mov    eax,DWORD PTR [esi+0x18]
10001703:	2b c1                	sub    eax,ecx
10001705:	6a 04                	push   0x4
10001707:	c1 f8 02             	sar    eax,0x2
1000170a:	50                   	push   eax
1000170b:	51                   	push   ecx
1000170c:	e8 6f 05 00 00       	call   0x10001c80
10001711:	c7 46 10 00 00 00 00 	mov    DWORD PTR [esi+0x10],0x0
10001718:	83 c4 0c             	add    esp,0xc
1000171b:	c7 46 14 00 00 00 00 	mov    DWORD PTR [esi+0x14],0x0
10001722:	c7 46 18 00 00 00 00 	mov    DWORD PTR [esi+0x18],0x0
10001729:	8b 4e 04             	mov    ecx,DWORD PTR [esi+0x4]
1000172c:	85 c9                	test   ecx,ecx
1000172e:	74 29                	je     0x10001759
10001730:	8b 46 0c             	mov    eax,DWORD PTR [esi+0xc]
10001733:	2b c1                	sub    eax,ecx
10001735:	6a 04                	push   0x4
10001737:	c1 f8 02             	sar    eax,0x2
1000173a:	50                   	push   eax
1000173b:	51                   	push   ecx
1000173c:	e8 3f 05 00 00       	call   0x10001c80
10001741:	c7 46 04 00 00 00 00 	mov    DWORD PTR [esi+0x4],0x0
10001748:	83 c4 0c             	add    esp,0xc
1000174b:	c7 46 08 00 00 00 00 	mov    DWORD PTR [esi+0x8],0x0
10001752:	c7 46 0c 00 00 00 00 	mov    DWORD PTR [esi+0xc],0x0
10001759:	5e                   	pop    esi
1000175a:	c3                   	ret
1000175b:	cc                   	int3
1000175c:	cc                   	int3
1000175d:	cc                   	int3
1000175e:	cc                   	int3
1000175f:	cc                   	int3
10001760:	55                   	push   ebp
10001761:	8b ec                	mov    ebp,esp
10001763:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
10001766:	56                   	push   esi
10001767:	8b f1                	mov    esi,ecx
10001769:	8b 42 04             	mov    eax,DWORD PTR [edx+0x4]
1000176c:	89 46 04             	mov    DWORD PTR [esi+0x4],eax
1000176f:	8d 4e 08             	lea    ecx,[esi+0x8]
10001772:	8d 42 08             	lea    eax,[edx+0x8]
10001775:	50                   	push   eax
10001776:	e8 25 91 00 00       	call   0x1000a8a0
1000177b:	8b c6                	mov    eax,esi
1000177d:	5e                   	pop    esi
1000177e:	5d                   	pop    ebp
1000177f:	c2 04 00             	ret    0x4
10001782:	cc                   	int3
10001783:	cc                   	int3
10001784:	cc                   	int3
10001785:	cc                   	int3
10001786:	cc                   	int3
10001787:	cc                   	int3
10001788:	cc                   	int3
10001789:	cc                   	int3
1000178a:	cc                   	int3
1000178b:	cc                   	int3
1000178c:	cc                   	int3
1000178d:	cc                   	int3
1000178e:	cc                   	int3
1000178f:	cc                   	int3
10001790:	55                   	push   ebp
10001791:	8b ec                	mov    ebp,esp
10001793:	53                   	push   ebx
10001794:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
10001797:	56                   	push   esi
10001798:	8b f1                	mov    esi,ecx
1000179a:	57                   	push   edi
1000179b:	8d 43 04             	lea    eax,[ebx+0x4]
1000179e:	8d 7e 04             	lea    edi,[esi+0x4]
100017a1:	3b f8                	cmp    edi,eax
100017a3:	74 15                	je     0x100017ba
100017a5:	8b cf                	mov    ecx,edi
100017a7:	e8 94 22 01 00       	call   0x10013a40
100017ac:	ff 75 08             	push   DWORD PTR [ebp+0x8]
100017af:	8d 43 04             	lea    eax,[ebx+0x4]
100017b2:	8b cf                	mov    ecx,edi
100017b4:	50                   	push   eax
100017b5:	e8 06 f9 ff ff       	call   0x100010c0
100017ba:	8b 43 0c             	mov    eax,DWORD PTR [ebx+0xc]
100017bd:	89 46 0c             	mov    DWORD PTR [esi+0xc],eax
100017c0:	8b c6                	mov    eax,esi
100017c2:	5f                   	pop    edi
100017c3:	5e                   	pop    esi
100017c4:	5b                   	pop    ebx
100017c5:	5d                   	pop    ebp
100017c6:	c2 04 00             	ret    0x4
100017c9:	cc                   	int3
100017ca:	cc                   	int3
100017cb:	cc                   	int3
100017cc:	cc                   	int3
100017cd:	cc                   	int3
100017ce:	cc                   	int3
100017cf:	cc                   	int3
100017d0:	55                   	push   ebp
100017d1:	8b ec                	mov    ebp,esp
100017d3:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
100017d6:	8b 02                	mov    eax,DWORD PTR [edx]
100017d8:	89 01                	mov    DWORD PTR [ecx],eax
100017da:	8b 42 04             	mov    eax,DWORD PTR [edx+0x4]
100017dd:	89 41 04             	mov    DWORD PTR [ecx+0x4],eax
100017e0:	8b c1                	mov    eax,ecx
100017e2:	5d                   	pop    ebp
100017e3:	c2 04 00             	ret    0x4
100017e6:	cc                   	int3
100017e7:	cc                   	int3
100017e8:	cc                   	int3
100017e9:	cc                   	int3
100017ea:	cc                   	int3
100017eb:	cc                   	int3
100017ec:	cc                   	int3
100017ed:	cc                   	int3
100017ee:	cc                   	int3
100017ef:	cc                   	int3
100017f0:	55                   	push   ebp
100017f1:	8b ec                	mov    ebp,esp
100017f3:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
100017f6:	8b 02                	mov    eax,DWORD PTR [edx]
100017f8:	89 01                	mov    DWORD PTR [ecx],eax
100017fa:	8a 42 04             	mov    al,BYTE PTR [edx+0x4]
100017fd:	88 41 04             	mov    BYTE PTR [ecx+0x4],al
10001800:	8b 42 08             	mov    eax,DWORD PTR [edx+0x8]
10001803:	89 41 08             	mov    DWORD PTR [ecx+0x8],eax
10001806:	8b c1                	mov    eax,ecx
10001808:	5d                   	pop    ebp
10001809:	c2 04 00             	ret    0x4
1000180c:	cc                   	int3
1000180d:	cc                   	int3
1000180e:	cc                   	int3
1000180f:	cc                   	int3
10001810:	55                   	push   ebp
10001811:	8b ec                	mov    ebp,esp
10001813:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10001816:	f3 0f 7e 00          	movq   xmm0,QWORD PTR [eax]
1000181a:	66 0f d6 01          	movq   QWORD PTR [ecx],xmm0
1000181e:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
10001821:	89 41 08             	mov    DWORD PTR [ecx+0x8],eax
10001824:	8b c1                	mov    eax,ecx
10001826:	5d                   	pop    ebp
10001827:	c2 04 00             	ret    0x4
1000182a:	cc                   	int3
1000182b:	cc                   	int3
1000182c:	cc                   	int3
1000182d:	cc                   	int3
1000182e:	cc                   	int3
1000182f:	cc                   	int3
10001830:	55                   	push   ebp
10001831:	8b ec                	mov    ebp,esp
10001833:	8b 01                	mov    eax,DWORD PTR [ecx]
10001835:	3b 45 08             	cmp    eax,DWORD PTR [ebp+0x8]
10001838:	75 0e                	jne    0x10001848
1000183a:	8a 41 04             	mov    al,BYTE PTR [ecx+0x4]
1000183d:	3a 45 0c             	cmp    al,BYTE PTR [ebp+0xc]
10001840:	75 06                	jne    0x10001848
10001842:	b0 01                	mov    al,0x1
10001844:	5d                   	pop    ebp
10001845:	c2 0c 00             	ret    0xc
10001848:	32 c0                	xor    al,al
1000184a:	5d                   	pop    ebp
1000184b:	c2 0c 00             	ret    0xc
1000184e:	cc                   	int3
1000184f:	cc                   	int3
10001850:	55                   	push   ebp
10001851:	8b ec                	mov    ebp,esp
10001853:	6a ff                	push   0xffffffff
10001855:	68 30 66 01 10       	push   0x10016630
1000185a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10001860:	50                   	push   eax
10001861:	53                   	push   ebx
10001862:	56                   	push   esi
10001863:	57                   	push   edi
10001864:	a1 04 10 02 10       	mov    eax,ds:0x10021004
10001869:	33 c5                	xor    eax,ebp
1000186b:	50                   	push   eax
1000186c:	8d 45 f4             	lea    eax,[ebp-0xc]
1000186f:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10001875:	8b f1                	mov    esi,ecx
10001877:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
1000187a:	f6 c3 02             	test   bl,0x2
1000187d:	74 41                	je     0x100018c0
1000187f:	68 e0 37 00 10       	push   0x100037e0
10001884:	ff 76 fc             	push   DWORD PTR [esi-0x4]
10001887:	8d 7e fc             	lea    edi,[esi-0x4]
1000188a:	6a 08                	push   0x8
1000188c:	56                   	push   esi
1000188d:	e8 77 33 01 00       	call   0x10014c09
10001892:	f6 c3 01             	test   bl,0x1
10001895:	74 13                	je     0x100018aa
10001897:	8b 0f                	mov    ecx,DWORD PTR [edi]
10001899:	8d 0c cd 04 00 00 00 	lea    ecx,[ecx*8+0x4]
100018a0:	51                   	push   ecx
100018a1:	57                   	push   edi
100018a2:	e8 98 34 01 00       	call   0x10014d3f
100018a7:	83 c4 08             	add    esp,0x8
100018aa:	8b c7                	mov    eax,edi
100018ac:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
100018af:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
100018b6:	59                   	pop    ecx
100018b7:	5f                   	pop    edi
100018b8:	5e                   	pop    esi
100018b9:	5b                   	pop    ebx
100018ba:	8b e5                	mov    esp,ebp
100018bc:	5d                   	pop    ebp
100018bd:	c2 04 00             	ret    0x4
100018c0:	e8 1b 1f 00 00       	call   0x100037e0
100018c5:	f6 c3 01             	test   bl,0x1
100018c8:	74 0b                	je     0x100018d5
100018ca:	6a 08                	push   0x8
100018cc:	56                   	push   esi
100018cd:	e8 56 34 01 00       	call   0x10014d28
100018d2:	83 c4 08             	add    esp,0x8
100018d5:	8b c6                	mov    eax,esi
100018d7:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
100018da:	64                   	fs
100018db:	89                   	.byte 0x89
100018dc:	0d                   	.byte 0xd
100018dd:	00 00                	add    BYTE PTR [eax],al
	...


===== VA 0x10002b80 | ??0AEBinaryLink@@IAE@PAVAElementPrivate@@@Z | span 0xf0 =====
Disassembly of section .text:

10002b80 <.text+0x1b80>:
10002b80:	55                   	push   ebp
10002b81:	8b ec                	mov    ebp,esp
10002b83:	51                   	push   ecx
10002b84:	56                   	push   esi
10002b85:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
10002b88:	57                   	push   edi
10002b89:	8b f9                	mov    edi,ecx
10002b8b:	56                   	push   esi
10002b8c:	89 7d fc             	mov    DWORD PTR [ebp-0x4],edi
10002b8f:	e8 fc 0a 00 00       	call   0x10003690
10002b94:	c7 07 6c 71 01 10    	mov    DWORD PTR [edi],0x1001716c
10002b9a:	8b c7                	mov    eax,edi
10002b9c:	c7 47 2c 00 00 00 00 	mov    DWORD PTR [edi+0x2c],0x0
10002ba3:	5f                   	pop    edi
10002ba4:	c7 46 1c 00 00 00 00 	mov    DWORD PTR [esi+0x1c],0x0
10002bab:	c7 46 20 00 00 00 00 	mov    DWORD PTR [esi+0x20],0x0
10002bb2:	c7 46 24 00 00 00 00 	mov    DWORD PTR [esi+0x24],0x0
10002bb9:	5e                   	pop    esi
10002bba:	8b e5                	mov    esp,ebp
10002bbc:	5d                   	pop    ebp
10002bbd:	c2 04 00             	ret    0x4
10002bc0:	55                   	push   ebp
10002bc1:	8b ec                	mov    ebp,esp
10002bc3:	6a ff                	push   0xffffffff
10002bc5:	68 4f 68 01 10       	push   0x1001684f
10002bca:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10002bd0:	50                   	push   eax
10002bd1:	51                   	push   ecx
10002bd2:	56                   	push   esi
10002bd3:	57                   	push   edi
10002bd4:	a1 04 10 02 10       	mov    eax,ds:0x10021004
10002bd9:	33 c5                	xor    eax,ebp
10002bdb:	50                   	push   eax
10002bdc:	8d 45 f4             	lea    eax,[ebp-0xc]
10002bdf:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10002be5:	8b f1                	mov    esi,ecx
10002be7:	89 75 f0             	mov    DWORD PTR [ebp-0x10],esi
10002bea:	6a 2c                	push   0x2c
10002bec:	e8 ff 20 01 00       	call   0x10014cf0
10002bf1:	8b f8                	mov    edi,eax
10002bf3:	83 c4 04             	add    esp,0x4
10002bf6:	89 7d f0             	mov    DWORD PTR [ebp-0x10],edi
10002bf9:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10002c00:	85 ff                	test   edi,edi
10002c02:	74 16                	je     0x10002c1a
10002c04:	6a 2c                	push   0x2c
10002c06:	6a 00                	push   0x0
10002c08:	57                   	push   edi
10002c09:	e8 a6 2e 01 00       	call   0x10015ab4
10002c0e:	83 c4 0c             	add    esp,0xc
10002c11:	8b cf                	mov    ecx,edi
10002c13:	e8 f8 00 00 00       	call   0x10002d10
10002c18:	eb 02                	jmp    0x10002c1c
10002c1a:	33 c0                	xor    eax,eax
10002c1c:	50                   	push   eax
10002c1d:	8b ce                	mov    ecx,esi
10002c1f:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
10002c26:	e8 65 0a 00 00       	call   0x10003690
10002c2b:	c7 06 6c 71 01 10    	mov    DWORD PTR [esi],0x1001716c
10002c31:	c7 46 2c 00 00 00 00 	mov    DWORD PTR [esi+0x2c],0x0
10002c38:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
10002c3b:	c7 40 1c 00 00 00 00 	mov    DWORD PTR [eax+0x1c],0x0
10002c42:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
10002c45:	c7 40 20 00 00 00 00 	mov    DWORD PTR [eax+0x20],0x0
10002c4c:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
10002c4f:	c7 40 24 00 00 00 00 	mov    DWORD PTR [eax+0x24],0x0
10002c56:	8b c6                	mov    eax,esi
10002c58:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10002c5b:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10002c62:	59                   	pop    ecx
10002c63:	5f                   	pop    edi
10002c64:	5e                   	pop    esi
10002c65:	8b e5                	mov    esp,ebp
10002c67:	5d                   	pop    ebp
10002c68:	c3                   	ret
10002c69:	cc                   	int3
10002c6a:	cc                   	int3
10002c6b:	cc                   	int3
10002c6c:	cc                   	int3
10002c6d:	cc                   	int3
10002c6e:	cc                   	int3
10002c6f:	cc                   	int3


===== VA 0x10002c70 | ??0AEBinaryLinkPrivate@@QAE@AAV0@@Z | span 0xa0 =====
Disassembly of section .text:

10002c70 <.text+0x1c70>:
10002c70:	55                   	push   ebp
10002c71:	8b ec                	mov    ebp,esp
10002c73:	6a ff                	push   0xffffffff
10002c75:	68 86 5c 01 10       	push   0x10015c86
10002c7a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10002c80:	50                   	push   eax
10002c81:	51                   	push   ecx
10002c82:	56                   	push   esi
10002c83:	57                   	push   edi
10002c84:	a1 04 10 02 10       	mov    eax,ds:0x10021004
10002c89:	33 c5                	xor    eax,ebp
10002c8b:	50                   	push   eax
10002c8c:	8d 45 f4             	lea    eax,[ebp-0xc]
10002c8f:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10002c95:	8b f9                	mov    edi,ecx
10002c97:	89 7d f0             	mov    DWORD PTR [ebp-0x10],edi
10002c9a:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
10002c9d:	8d 4f 08             	lea    ecx,[edi+0x8]
10002ca0:	c7 07 dc 71 01 10    	mov    DWORD PTR [edi],0x100171dc
10002ca6:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
10002ca9:	89 47 04             	mov    DWORD PTR [edi+0x4],eax
10002cac:	8d 46 08             	lea    eax,[esi+0x8]
10002caf:	50                   	push   eax
10002cb0:	e8 ab ef 00 00       	call   0x10011c60
10002cb5:	8d 46 0c             	lea    eax,[esi+0xc]
10002cb8:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10002cbf:	50                   	push   eax
10002cc0:	8d 4f 0c             	lea    ecx,[edi+0xc]
10002cc3:	e8 98 ef 00 00       	call   0x10011c60
10002cc8:	8d 46 10             	lea    eax,[esi+0x10]
10002ccb:	c6 45 fc 01          	mov    BYTE PTR [ebp-0x4],0x1
10002ccf:	50                   	push   eax
10002cd0:	8d 4f 10             	lea    ecx,[edi+0x10]
10002cd3:	e8 28 e5 ff ff       	call   0x10001200
10002cd8:	c7 07 e8 71 01 10    	mov    DWORD PTR [edi],0x100171e8
10002cde:	f3 0f 7e 46 1c       	movq   xmm0,QWORD PTR [esi+0x1c]
10002ce3:	66 0f d6 47 1c       	movq   QWORD PTR [edi+0x1c],xmm0
10002ce8:	8b 46 24             	mov    eax,DWORD PTR [esi+0x24]
10002ceb:	89 47 24             	mov    DWORD PTR [edi+0x24],eax
10002cee:	8b 46 28             	mov    eax,DWORD PTR [esi+0x28]
10002cf1:	89 47 28             	mov    DWORD PTR [edi+0x28],eax
10002cf4:	8b c7                	mov    eax,edi
10002cf6:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10002cf9:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10002d00:	59                   	pop    ecx
10002d01:	5f                   	pop    edi
10002d02:	5e                   	pop    esi
10002d03:	8b e5                	mov    esp,ebp
10002d05:	5d                   	pop    ebp
10002d06:	c2 04 00             	ret    0x4
10002d09:	cc                   	int3
10002d0a:	cc                   	int3
10002d0b:	cc                   	int3
10002d0c:	cc                   	int3
10002d0d:	cc                   	int3
10002d0e:	cc                   	int3
10002d0f:	cc                   	int3


===== VA 0x10002d10 | ??0AEBinaryLinkPrivate@@QAE@XZ | span 0x90 =====
Disassembly of section .text:

10002d10 <.text+0x1d10>:
10002d10:	55                   	push   ebp
10002d11:	8b ec                	mov    ebp,esp
10002d13:	6a ff                	push   0xffffffff
10002d15:	68 7b 65 01 10       	push   0x1001657b
10002d1a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10002d20:	50                   	push   eax
10002d21:	51                   	push   ecx
10002d22:	56                   	push   esi
10002d23:	a1 04 10 02 10       	mov    eax,ds:0x10021004
10002d28:	33 c5                	xor    eax,ebp
10002d2a:	50                   	push   eax
10002d2b:	8d 45 f4             	lea    eax,[ebp-0xc]
10002d2e:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10002d34:	8b f1                	mov    esi,ecx
10002d36:	89 75 f0             	mov    DWORD PTR [ebp-0x10],esi
10002d39:	68 e0 71 01 10       	push   0x100171e0
10002d3e:	8d 4e 08             	lea    ecx,[esi+0x8]
10002d41:	c7 06 dc 71 01 10    	mov    DWORD PTR [esi],0x100171dc
10002d47:	c7 46 04 00 00 00 00 	mov    DWORD PTR [esi+0x4],0x0
10002d4e:	e8 ad ef 00 00       	call   0x10011d00
10002d53:	68 e0 71 01 10       	push   0x100171e0
10002d58:	8d 4e 0c             	lea    ecx,[esi+0xc]
10002d5b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10002d62:	e8 99 ef 00 00       	call   0x10011d00
10002d67:	c7 46 10 00 00 00 00 	mov    DWORD PTR [esi+0x10],0x0
10002d6e:	8b c6                	mov    eax,esi
10002d70:	c7 46 14 00 00 00 00 	mov    DWORD PTR [esi+0x14],0x0
10002d77:	c7 46 18 00 00 00 00 	mov    DWORD PTR [esi+0x18],0x0
10002d7e:	c7 06 e8 71 01 10    	mov    DWORD PTR [esi],0x100171e8
10002d84:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10002d87:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10002d8e:	59                   	pop    ecx
10002d8f:	5e                   	pop    esi
10002d90:	8b e5                	mov    esp,ebp
10002d92:	5d                   	pop    ebp
10002d93:	c3                   	ret
10002d94:	cc                   	int3
10002d95:	cc                   	int3
10002d96:	cc                   	int3
10002d97:	cc                   	int3
10002d98:	cc                   	int3
10002d99:	cc                   	int3
10002d9a:	cc                   	int3
10002d9b:	cc                   	int3
10002d9c:	cc                   	int3
10002d9d:	cc                   	int3
10002d9e:	cc                   	int3
10002d9f:	cc                   	int3


===== VA 0x10002da0 | ??0AElementPrivate@@QAE@AAV0@@Z | span 0x80 =====
Disassembly of section .text:

10002da0 <.text+0x1da0>:
10002da0:	55                   	push   ebp
10002da1:	8b ec                	mov    ebp,esp
10002da3:	6a ff                	push   0xffffffff
10002da5:	68 86 5c 01 10       	push   0x10015c86
10002daa:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10002db0:	50                   	push   eax
10002db1:	51                   	push   ecx
10002db2:	56                   	push   esi
10002db3:	57                   	push   edi
10002db4:	a1 04 10 02 10       	mov    eax,ds:0x10021004
10002db9:	33 c5                	xor    eax,ebp
10002dbb:	50                   	push   eax
10002dbc:	8d 45 f4             	lea    eax,[ebp-0xc]
10002dbf:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10002dc5:	8b f9                	mov    edi,ecx
10002dc7:	89 7d f0             	mov    DWORD PTR [ebp-0x10],edi
10002dca:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
10002dcd:	8d 4f 08             	lea    ecx,[edi+0x8]
10002dd0:	c7 07 dc 71 01 10    	mov    DWORD PTR [edi],0x100171dc
10002dd6:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
10002dd9:	89 47 04             	mov    DWORD PTR [edi+0x4],eax
10002ddc:	8d 46 08             	lea    eax,[esi+0x8]
10002ddf:	50                   	push   eax
10002de0:	e8 7b ee 00 00       	call   0x10011c60
10002de5:	8d 46 0c             	lea    eax,[esi+0xc]
10002de8:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10002def:	50                   	push   eax
10002df0:	8d 4f 0c             	lea    ecx,[edi+0xc]
10002df3:	e8 68 ee 00 00       	call   0x10011c60
10002df8:	8d 46 10             	lea    eax,[esi+0x10]
10002dfb:	c6 45 fc 01          	mov    BYTE PTR [ebp-0x4],0x1
10002dff:	50                   	push   eax
10002e00:	8d 4f 10             	lea    ecx,[edi+0x10]
10002e03:	e8 f8 e3 ff ff       	call   0x10001200
10002e08:	8b c7                	mov    eax,edi
10002e0a:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10002e0d:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10002e14:	59                   	pop    ecx
10002e15:	5f                   	pop    edi
10002e16:	5e                   	pop    esi
10002e17:	8b e5                	mov    esp,ebp
10002e19:	5d                   	pop    ebp
10002e1a:	c2 04 00             	ret    0x4
10002e1d:	cc                   	int3
10002e1e:	cc                   	int3
10002e1f:	cc                   	int3


===== VA 0x10002e20 | ??0AElementPrivate@@QAE@XZ | span 0xc0 =====
Disassembly of section .text:

10002e20 <.text+0x1e20>:
10002e20:	55                   	push   ebp
10002e21:	8b ec                	mov    ebp,esp
10002e23:	6a ff                	push   0xffffffff
10002e25:	68 7b 65 01 10       	push   0x1001657b
10002e2a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10002e30:	50                   	push   eax
10002e31:	51                   	push   ecx
10002e32:	56                   	push   esi
10002e33:	a1 04 10 02 10       	mov    eax,ds:0x10021004
10002e38:	33 c5                	xor    eax,ebp
10002e3a:	50                   	push   eax
10002e3b:	8d 45 f4             	lea    eax,[ebp-0xc]
10002e3e:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10002e44:	8b f1                	mov    esi,ecx
10002e46:	89 75 f0             	mov    DWORD PTR [ebp-0x10],esi
10002e49:	68 e0 71 01 10       	push   0x100171e0
10002e4e:	8d 4e 08             	lea    ecx,[esi+0x8]
10002e51:	c7 06 dc 71 01 10    	mov    DWORD PTR [esi],0x100171dc
10002e57:	c7 46 04 00 00 00 00 	mov    DWORD PTR [esi+0x4],0x0
10002e5e:	e8 9d ee 00 00       	call   0x10011d00
10002e63:	68 e0 71 01 10       	push   0x100171e0
10002e68:	8d 4e 0c             	lea    ecx,[esi+0xc]
10002e6b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10002e72:	e8 89 ee 00 00       	call   0x10011d00
10002e77:	c7 46 10 00 00 00 00 	mov    DWORD PTR [esi+0x10],0x0
10002e7e:	8b c6                	mov    eax,esi
10002e80:	c7 46 14 00 00 00 00 	mov    DWORD PTR [esi+0x14],0x0
10002e87:	c7 46 18 00 00 00 00 	mov    DWORD PTR [esi+0x18],0x0
10002e8e:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10002e91:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10002e98:	59                   	pop    ecx
10002e99:	5e                   	pop    esi
10002e9a:	8b e5                	mov    esp,ebp
10002e9c:	5d                   	pop    ebp
10002e9d:	c3                   	ret
10002e9e:	cc                   	int3
10002e9f:	cc                   	int3
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


===== VA 0x10002ee0 | ??4AElementPrivate@@QAEAAV0@ABV0@@Z | span 0x220 =====
Disassembly of section .text:

10002ee0 <.text+0x1ee0>:
10002ee0:	55                   	push   ebp
10002ee1:	8b ec                	mov    ebp,esp
10002ee3:	56                   	push   esi
10002ee4:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
10002ee7:	57                   	push   edi
10002ee8:	8b f9                	mov    edi,ecx
10002eea:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
10002eed:	89 47 04             	mov    DWORD PTR [edi+0x4],eax
10002ef0:	8d 4f 08             	lea    ecx,[edi+0x8]
10002ef3:	8d 46 08             	lea    eax,[esi+0x8]
10002ef6:	50                   	push   eax
10002ef7:	e8 44 ef 00 00       	call   0x10011e40
10002efc:	8d 46 0c             	lea    eax,[esi+0xc]
10002eff:	50                   	push   eax
10002f00:	8d 4f 0c             	lea    ecx,[edi+0xc]
10002f03:	e8 38 ef 00 00       	call   0x10011e40
10002f08:	8d 46 10             	lea    eax,[esi+0x10]
10002f0b:	50                   	push   eax
10002f0c:	8d 4f 10             	lea    ecx,[edi+0x10]
10002f0f:	e8 8c 79 00 00       	call   0x1000a8a0
10002f14:	8b c7                	mov    eax,edi
10002f16:	5f                   	pop    edi
10002f17:	5e                   	pop    esi
10002f18:	5d                   	pop    ebp
10002f19:	c2 04 00             	ret    0x4
10002f1c:	cc                   	int3
10002f1d:	cc                   	int3
10002f1e:	cc                   	int3
10002f1f:	cc                   	int3
10002f20:	55                   	push   ebp
10002f21:	8b ec                	mov    ebp,esp
10002f23:	6a ff                	push   0xffffffff
10002f25:	68 30 66 01 10       	push   0x10016630
10002f2a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10002f30:	50                   	push   eax
10002f31:	53                   	push   ebx
10002f32:	56                   	push   esi
10002f33:	57                   	push   edi
10002f34:	a1 04 10 02 10       	mov    eax,ds:0x10021004
10002f39:	33 c5                	xor    eax,ebp
10002f3b:	50                   	push   eax
10002f3c:	8d 45 f4             	lea    eax,[ebp-0xc]
10002f3f:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10002f45:	8b f1                	mov    esi,ecx
10002f47:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
10002f4a:	f6 c3 02             	test   bl,0x2
10002f4d:	74 4a                	je     0x10002f99
10002f4f:	68 50 40 00 10       	push   0x10004050
10002f54:	ff 76 fc             	push   DWORD PTR [esi-0x4]
10002f57:	8d 7e fc             	lea    edi,[esi-0x4]
10002f5a:	6a 1c                	push   0x1c
10002f5c:	56                   	push   esi
10002f5d:	e8 a7 1c 01 00       	call   0x10014c09
10002f62:	f6 c3 01             	test   bl,0x1
10002f65:	74 1c                	je     0x10002f83
10002f67:	8b 0f                	mov    ecx,DWORD PTR [edi]
10002f69:	8d 14 cd 00 00 00 00 	lea    edx,[ecx*8+0x0]
10002f70:	2b d1                	sub    edx,ecx
10002f72:	8d 0c 95 04 00 00 00 	lea    ecx,[edx*4+0x4]
10002f79:	51                   	push   ecx
10002f7a:	57                   	push   edi
10002f7b:	e8 bf 1d 01 00       	call   0x10014d3f
10002f80:	83 c4 08             	add    esp,0x8
10002f83:	8b c7                	mov    eax,edi
10002f85:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10002f88:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10002f8f:	59                   	pop    ecx
10002f90:	5f                   	pop    edi
10002f91:	5e                   	pop    esi
10002f92:	5b                   	pop    ebx
10002f93:	8b e5                	mov    esp,ebp
10002f95:	5d                   	pop    ebp
10002f96:	c2 04 00             	ret    0x4
10002f99:	c7 06 dc 71 01 10    	mov    DWORD PTR [esi],0x100171dc
10002f9f:	8b 4e 10             	mov    ecx,DWORD PTR [esi+0x10]
10002fa2:	85 c9                	test   ecx,ecx
10002fa4:	74 29                	je     0x10002fcf
10002fa6:	8b 46 18             	mov    eax,DWORD PTR [esi+0x18]
10002fa9:	2b c1                	sub    eax,ecx
10002fab:	6a 04                	push   0x4
10002fad:	c1 f8 02             	sar    eax,0x2
10002fb0:	50                   	push   eax
10002fb1:	51                   	push   ecx
10002fb2:	e8 c9 ec ff ff       	call   0x10001c80
10002fb7:	c7 46 10 00 00 00 00 	mov    DWORD PTR [esi+0x10],0x0
10002fbe:	83 c4 0c             	add    esp,0xc
10002fc1:	c7 46 14 00 00 00 00 	mov    DWORD PTR [esi+0x14],0x0
10002fc8:	c7 46 18 00 00 00 00 	mov    DWORD PTR [esi+0x18],0x0
10002fcf:	8d 4e 0c             	lea    ecx,[esi+0xc]
10002fd2:	e8 09 ee 00 00       	call   0x10011de0
10002fd7:	8d 4e 08             	lea    ecx,[esi+0x8]
10002fda:	e8 01 ee 00 00       	call   0x10011de0
10002fdf:	f6 c3 01             	test   bl,0x1
10002fe2:	74 0b                	je     0x10002fef
10002fe4:	6a 1c                	push   0x1c
10002fe6:	56                   	push   esi
10002fe7:	e8 3c 1d 01 00       	call   0x10014d28
10002fec:	83 c4 08             	add    esp,0x8
10002fef:	8b c6                	mov    eax,esi
10002ff1:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10002ff4:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10002ffb:	59                   	pop    ecx
10002ffc:	5f                   	pop    edi
10002ffd:	5e                   	pop    esi
10002ffe:	5b                   	pop    ebx
10002fff:	8b e5                	mov    esp,ebp
10003001:	5d                   	pop    ebp
10003002:	c2 04 00             	ret    0x4
10003005:	cc                   	int3
10003006:	cc                   	int3
10003007:	cc                   	int3
10003008:	cc                   	int3
10003009:	cc                   	int3
1000300a:	cc                   	int3
1000300b:	cc                   	int3
1000300c:	cc                   	int3
1000300d:	cc                   	int3
1000300e:	cc                   	int3
1000300f:	cc                   	int3
10003010:	55                   	push   ebp
10003011:	8b ec                	mov    ebp,esp
10003013:	56                   	push   esi
10003014:	8b f1                	mov    esi,ecx
10003016:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
10003019:	57                   	push   edi
1000301a:	8b 7e 08             	mov    edi,DWORD PTR [esi+0x8]
1000301d:	8b c7                	mov    eax,edi
1000301f:	8b 56 04             	mov    edx,DWORD PTR [esi+0x4]
10003022:	2b c2                	sub    eax,edx
10003024:	c1 f8 02             	sar    eax,0x2
10003027:	3b c1                	cmp    eax,ecx
10003029:	73 42                	jae    0x1000306d
1000302b:	2b 16                	sub    edx,DWORD PTR [esi]
1000302d:	53                   	push   ebx
1000302e:	bb ff ff ff 3f       	mov    ebx,0x3fffffff
10003033:	c1 fa 02             	sar    edx,0x2
10003036:	8b c3                	mov    eax,ebx
10003038:	2b c2                	sub    eax,edx
1000303a:	3b c1                	cmp    eax,ecx
1000303c:	73 0b                	jae    0x10003049
1000303e:	68 4c 71 01 10       	push   0x1001714c
10003043:	ff 15 34 70 01 10    	call   DWORD PTR ds:0x10017034
10003049:	2b 3e                	sub    edi,DWORD PTR [esi]
1000304b:	03 d1                	add    edx,ecx
1000304d:	c1 ff 02             	sar    edi,0x2
10003050:	33 c9                	xor    ecx,ecx
10003052:	8b c7                	mov    eax,edi
10003054:	d1 e8                	shr    eax,1
10003056:	2b d8                	sub    ebx,eax
10003058:	03 c7                	add    eax,edi
1000305a:	3b df                	cmp    ebx,edi
1000305c:	0f 43 c8             	cmovae ecx,eax
1000305f:	3b ca                	cmp    ecx,edx
10003061:	0f 43 d1             	cmovae edx,ecx
10003064:	8b ce                	mov    ecx,esi
10003066:	52                   	push   edx
10003067:	e8 a4 f4 ff ff       	call   0x10002510
1000306c:	5b                   	pop    ebx
1000306d:	5f                   	pop    edi
1000306e:	5e                   	pop    esi
1000306f:	5d                   	pop    ebp
10003070:	c2 04 00             	ret    0x4
10003073:	cc                   	int3
10003074:	cc                   	int3
10003075:	cc                   	int3
10003076:	cc                   	int3
10003077:	cc                   	int3
10003078:	cc                   	int3
10003079:	cc                   	int3
1000307a:	cc                   	int3
1000307b:	cc                   	int3
1000307c:	cc                   	int3
1000307d:	cc                   	int3
1000307e:	cc                   	int3
1000307f:	cc                   	int3
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


===== VA 0x100034a0 | ??0AEContentLink@@QAE@PAVAEContentLinkPrivate@@@Z | span 0x1f0 =====
Disassembly of section .text:

100034a0 <.text+0x24a0>:
100034a0:	55                   	push   ebp
100034a1:	8b ec                	mov    ebp,esp
100034a3:	6a ff                	push   0xffffffff
100034a5:	68 f8 5c 01 10       	push   0x10015cf8
100034aa:	64 a1 00 00 00 00    	mov    eax,fs:0x0
100034b0:	50                   	push   eax
100034b1:	51                   	push   ecx
100034b2:	56                   	push   esi
100034b3:	a1 04 10 02 10       	mov    eax,ds:0x10021004
100034b8:	33 c5                	xor    eax,ebp
100034ba:	50                   	push   eax
100034bb:	8d 45 f4             	lea    eax,[ebp-0xc]
100034be:	64 a3 00 00 00 00    	mov    fs:0x0,eax
100034c4:	8b f1                	mov    esi,ecx
100034c6:	89 75 f0             	mov    DWORD PTR [ebp-0x10],esi
100034c9:	ff 75 08             	push   DWORD PTR [ebp+0x8]
100034cc:	e8 af f6 ff ff       	call   0x10002b80
100034d1:	6a 04                	push   0x4
100034d3:	8b ce                	mov    ecx,esi
100034d5:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
100034dc:	c7 06 88 71 01 10    	mov    DWORD PTR [esi],0x10017188
100034e2:	e8 29 fe ff ff       	call   0x10003310
100034e7:	8b c6                	mov    eax,esi
100034e9:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
100034ec:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
100034f3:	59                   	pop    ecx
100034f4:	5e                   	pop    esi
100034f5:	8b e5                	mov    esp,ebp
100034f7:	5d                   	pop    ebp
100034f8:	c2 04 00             	ret    0x4
100034fb:	cc                   	int3
100034fc:	cc                   	int3
100034fd:	cc                   	int3
100034fe:	cc                   	int3
100034ff:	cc                   	int3
10003500:	55                   	push   ebp
10003501:	8b ec                	mov    ebp,esp
10003503:	6a ff                	push   0xffffffff
10003505:	68 7b 65 01 10       	push   0x1001657b
1000350a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10003510:	50                   	push   eax
10003511:	51                   	push   ecx
10003512:	56                   	push   esi
10003513:	a1 04 10 02 10       	mov    eax,ds:0x10021004
10003518:	33 c5                	xor    eax,ebp
1000351a:	50                   	push   eax
1000351b:	8d 45 f4             	lea    eax,[ebp-0xc]
1000351e:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10003524:	8b f1                	mov    esi,ecx
10003526:	89 75 f0             	mov    DWORD PTR [ebp-0x10],esi
10003529:	68 e0 71 01 10       	push   0x100171e0
1000352e:	8d 4e 08             	lea    ecx,[esi+0x8]
10003531:	c7 06 dc 71 01 10    	mov    DWORD PTR [esi],0x100171dc
10003537:	c7 46 04 00 00 00 00 	mov    DWORD PTR [esi+0x4],0x0
1000353e:	e8 bd e7 00 00       	call   0x10011d00
10003543:	68 e0 71 01 10       	push   0x100171e0
10003548:	8d 4e 0c             	lea    ecx,[esi+0xc]
1000354b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10003552:	e8 a9 e7 00 00       	call   0x10011d00
10003557:	c7 46 10 00 00 00 00 	mov    DWORD PTR [esi+0x10],0x0
1000355e:	8b c6                	mov    eax,esi
10003560:	c7 46 14 00 00 00 00 	mov    DWORD PTR [esi+0x14],0x0
10003567:	c7 46 18 00 00 00 00 	mov    DWORD PTR [esi+0x18],0x0
1000356e:	c7 06 0c 72 01 10    	mov    DWORD PTR [esi],0x1001720c
10003574:	c6 46 2c 00          	mov    BYTE PTR [esi+0x2c],0x0
10003578:	c7 46 30 01 00 00 00 	mov    DWORD PTR [esi+0x30],0x1
1000357f:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10003582:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10003589:	59                   	pop    ecx
1000358a:	5e                   	pop    esi
1000358b:	8b e5                	mov    esp,ebp
1000358d:	5d                   	pop    ebp
1000358e:	c3                   	ret
1000358f:	cc                   	int3
10003590:	c7 01 88 71 01 10    	mov    DWORD PTR [ecx],0x10017188
10003596:	e9 05 f9 ff ff       	jmp    0x10002ea0
1000359b:	cc                   	int3
1000359c:	cc                   	int3
1000359d:	cc                   	int3
1000359e:	cc                   	int3
1000359f:	cc                   	int3
100035a0:	55                   	push   ebp
100035a1:	8b ec                	mov    ebp,esp
100035a3:	56                   	push   esi
100035a4:	8b f1                	mov    esi,ecx
100035a6:	c7 06 dc 71 01 10    	mov    DWORD PTR [esi],0x100171dc
100035ac:	8b 4e 10             	mov    ecx,DWORD PTR [esi+0x10]
100035af:	85 c9                	test   ecx,ecx
100035b1:	74 29                	je     0x100035dc
100035b3:	8b 46 18             	mov    eax,DWORD PTR [esi+0x18]
100035b6:	2b c1                	sub    eax,ecx
100035b8:	6a 04                	push   0x4
100035ba:	c1 f8 02             	sar    eax,0x2
100035bd:	50                   	push   eax
100035be:	51                   	push   ecx
100035bf:	e8 bc e6 ff ff       	call   0x10001c80
100035c4:	c7 46 10 00 00 00 00 	mov    DWORD PTR [esi+0x10],0x0
100035cb:	83 c4 0c             	add    esp,0xc
100035ce:	c7 46 14 00 00 00 00 	mov    DWORD PTR [esi+0x14],0x0
100035d5:	c7 46 18 00 00 00 00 	mov    DWORD PTR [esi+0x18],0x0
100035dc:	8d 4e 0c             	lea    ecx,[esi+0xc]
100035df:	e8 fc e7 00 00       	call   0x10011de0
100035e4:	8d 4e 08             	lea    ecx,[esi+0x8]
100035e7:	e8 f4 e7 00 00       	call   0x10011de0
100035ec:	f6 45 08 01          	test   BYTE PTR [ebp+0x8],0x1
100035f0:	74 0b                	je     0x100035fd
100035f2:	6a 34                	push   0x34
100035f4:	56                   	push   esi
100035f5:	e8 2e 17 01 00       	call   0x10014d28
100035fa:	83 c4 08             	add    esp,0x8
100035fd:	8b c6                	mov    eax,esi
100035ff:	5e                   	pop    esi
10003600:	5d                   	pop    ebp
10003601:	c2 04 00             	ret    0x4
10003604:	cc                   	int3
10003605:	cc                   	int3
10003606:	cc                   	int3
10003607:	cc                   	int3
10003608:	cc                   	int3
10003609:	cc                   	int3
1000360a:	cc                   	int3
1000360b:	cc                   	int3
1000360c:	cc                   	int3
1000360d:	cc                   	int3
1000360e:	cc                   	int3
1000360f:	cc                   	int3
10003610:	6a 01                	push   0x1
10003612:	e8 49 fb ff ff       	call   0x10003160
10003617:	c3                   	ret
10003618:	cc                   	int3
10003619:	cc                   	int3
1000361a:	cc                   	int3
1000361b:	cc                   	int3
1000361c:	cc                   	int3
1000361d:	cc                   	int3
1000361e:	cc                   	int3
1000361f:	cc                   	int3
10003620:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
10003623:	8a 40 2c             	mov    al,BYTE PTR [eax+0x2c]
10003626:	c3                   	ret
10003627:	cc                   	int3
10003628:	cc                   	int3
10003629:	cc                   	int3
1000362a:	cc                   	int3
1000362b:	cc                   	int3
1000362c:	cc                   	int3
1000362d:	cc                   	int3
1000362e:	cc                   	int3
1000362f:	cc                   	int3
10003630:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
10003633:	8b 40 30             	mov    eax,DWORD PTR [eax+0x30]
10003636:	c3                   	ret
10003637:	cc                   	int3
10003638:	cc                   	int3
10003639:	cc                   	int3
1000363a:	cc                   	int3
1000363b:	cc                   	int3
1000363c:	cc                   	int3
1000363d:	cc                   	int3
1000363e:	cc                   	int3
1000363f:	cc                   	int3
10003640:	55                   	push   ebp
10003641:	8b ec                	mov    ebp,esp
10003643:	56                   	push   esi
10003644:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10003647:	8b f1                	mov    esi,ecx
10003649:	6a 00                	push   0x0
1000364b:	e8 30 fa ff ff       	call   0x10003080
10003650:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
10003653:	8b ce                	mov    ecx,esi
10003655:	6a 01                	push   0x1
10003657:	e8 24 fa ff ff       	call   0x10003080
1000365c:	8b 4e 04             	mov    ecx,DWORD PTR [esi+0x4]
1000365f:	8a 45 10             	mov    al,BYTE PTR [ebp+0x10]
10003662:	5e                   	pop    esi
10003663:	88 41 2c             	mov    BYTE PTR [ecx+0x2c],al
10003666:	5d                   	pop    ebp
10003667:	c2 0c 00             	ret    0xc
1000366a:	cc                   	int3
1000366b:	cc                   	int3
1000366c:	cc                   	int3
1000366d:	cc                   	int3
1000366e:	cc                   	int3
1000366f:	cc                   	int3
10003670:	55                   	push   ebp
10003671:	8b ec                	mov    ebp,esp
10003673:	8b 49 04             	mov    ecx,DWORD PTR [ecx+0x4]
10003676:	8a 45 08             	mov    al,BYTE PTR [ebp+0x8]
10003679:	88 41 2c             	mov    BYTE PTR [ecx+0x2c],al
1000367c:	5d                   	pop    ebp
1000367d:	c2 04 00             	ret    0x4
10003680:	55                   	push   ebp
10003681:	8b ec                	mov    ebp,esp
10003683:	8b 49 04             	mov    ecx,DWORD PTR [ecx+0x4]
10003686:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10003689:	89 41 30             	mov    DWORD PTR [ecx+0x30],eax
1000368c:	5d                   	pop    ebp
1000368d:	c2 04 00             	ret    0x4


===== VA 0x10003690 | ??0AElement@@IAE@PAVAElementPrivate@@@Z | span 0x220 =====
Disassembly of section .text:

10003690 <.text+0x2690>:
10003690:	55                   	push   ebp
10003691:	8b ec                	mov    ebp,esp
10003693:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10003696:	89 41 04             	mov    DWORD PTR [ecx+0x4],eax
10003699:	8b c1                	mov    eax,ecx
1000369b:	c7 01 04 71 01 10    	mov    DWORD PTR [ecx],0x10017104
100036a1:	5d                   	pop    ebp
100036a2:	c2 04 00             	ret    0x4
100036a5:	cc                   	int3
100036a6:	cc                   	int3
100036a7:	cc                   	int3
100036a8:	cc                   	int3
100036a9:	cc                   	int3
100036aa:	cc                   	int3
100036ab:	cc                   	int3
100036ac:	cc                   	int3
100036ad:	cc                   	int3
100036ae:	cc                   	int3
100036af:	cc                   	int3
100036b0:	55                   	push   ebp
100036b1:	8b ec                	mov    ebp,esp
100036b3:	6a ff                	push   0xffffffff
100036b5:	68 3a 5d 01 10       	push   0x10015d3a
100036ba:	64 a1 00 00 00 00    	mov    eax,fs:0x0
100036c0:	50                   	push   eax
100036c1:	51                   	push   ecx
100036c2:	56                   	push   esi
100036c3:	57                   	push   edi
100036c4:	a1 04 10 02 10       	mov    eax,ds:0x10021004
100036c9:	33 c5                	xor    eax,ebp
100036cb:	50                   	push   eax
100036cc:	8d 45 f4             	lea    eax,[ebp-0xc]
100036cf:	64 a3 00 00 00 00    	mov    fs:0x0,eax
100036d5:	8b f9                	mov    edi,ecx
100036d7:	6a 1c                	push   0x1c
100036d9:	c7 07 04 71 01 10    	mov    DWORD PTR [edi],0x10017104
100036df:	e8 0c 16 01 00       	call   0x10014cf0
100036e4:	8b f0                	mov    esi,eax
100036e6:	83 c4 04             	add    esp,0x4
100036e9:	89 75 f0             	mov    DWORD PTR [ebp-0x10],esi
100036ec:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
100036f3:	85 f6                	test   esi,esi
100036f5:	74 56                	je     0x1000374d
100036f7:	68 e0 71 01 10       	push   0x100171e0
100036fc:	8d 4e 08             	lea    ecx,[esi+0x8]
100036ff:	c7 06 dc 71 01 10    	mov    DWORD PTR [esi],0x100171dc
10003705:	c7 46 04 00 00 00 00 	mov    DWORD PTR [esi+0x4],0x0
1000370c:	e8 ef e5 00 00       	call   0x10011d00
10003711:	68 e0 71 01 10       	push   0x100171e0
10003716:	8d 4e 0c             	lea    ecx,[esi+0xc]
10003719:	c6 45 fc 01          	mov    BYTE PTR [ebp-0x4],0x1
1000371d:	e8 de e5 00 00       	call   0x10011d00
10003722:	c7 46 10 00 00 00 00 	mov    DWORD PTR [esi+0x10],0x0
10003729:	8b c7                	mov    eax,edi
1000372b:	c7 46 14 00 00 00 00 	mov    DWORD PTR [esi+0x14],0x0
10003732:	c7 46 18 00 00 00 00 	mov    DWORD PTR [esi+0x18],0x0
10003739:	89 77 04             	mov    DWORD PTR [edi+0x4],esi
1000373c:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000373f:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10003746:	59                   	pop    ecx
10003747:	5f                   	pop    edi
10003748:	5e                   	pop    esi
10003749:	8b e5                	mov    esp,ebp
1000374b:	5d                   	pop    ebp
1000374c:	c3                   	ret
1000374d:	c7 47 04 00 00 00 00 	mov    DWORD PTR [edi+0x4],0x0
10003754:	8b c7                	mov    eax,edi
10003756:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10003759:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10003760:	59                   	pop    ecx
10003761:	5f                   	pop    edi
10003762:	5e                   	pop    esi
10003763:	8b e5                	mov    esp,ebp
10003765:	5d                   	pop    ebp
10003766:	c3                   	ret
10003767:	cc                   	int3
10003768:	cc                   	int3
10003769:	cc                   	int3
1000376a:	cc                   	int3
1000376b:	cc                   	int3
1000376c:	cc                   	int3
1000376d:	cc                   	int3
1000376e:	cc                   	int3
1000376f:	cc                   	int3
10003770:	55                   	push   ebp
10003771:	8b ec                	mov    ebp,esp
10003773:	56                   	push   esi
10003774:	8b f1                	mov    esi,ecx
10003776:	0f 57 c0             	xorps  xmm0,xmm0
10003779:	8d 46 04             	lea    eax,[esi+0x4]
1000377c:	50                   	push   eax
1000377d:	c7 06 14 72 01 10    	mov    DWORD PTR [esi],0x10017214
10003783:	66 0f d6 00          	movq   QWORD PTR [eax],xmm0
10003787:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000378a:	83 c0 04             	add    eax,0x4
1000378d:	50                   	push   eax
1000378e:	ff 15 5c 70 01 10    	call   DWORD PTR ds:0x1001705c
10003794:	83 c4 08             	add    esp,0x8
10003797:	8b c6                	mov    eax,esi
10003799:	5e                   	pop    esi
1000379a:	5d                   	pop    ebp
1000379b:	c2 04 00             	ret    0x4
1000379e:	cc                   	int3
1000379f:	cc                   	int3
100037a0:	56                   	push   esi
100037a1:	8b f1                	mov    esi,ecx
100037a3:	8b 0e                	mov    ecx,DWORD PTR [esi]
100037a5:	85 c9                	test   ecx,ecx
100037a7:	74 28                	je     0x100037d1
100037a9:	8b 46 08             	mov    eax,DWORD PTR [esi+0x8]
100037ac:	2b c1                	sub    eax,ecx
100037ae:	6a 04                	push   0x4
100037b0:	c1 f8 02             	sar    eax,0x2
100037b3:	50                   	push   eax
100037b4:	51                   	push   ecx
100037b5:	e8 c6 e4 ff ff       	call   0x10001c80
100037ba:	c7 06 00 00 00 00    	mov    DWORD PTR [esi],0x0
100037c0:	83 c4 0c             	add    esp,0xc
100037c3:	c7 46 04 00 00 00 00 	mov    DWORD PTR [esi+0x4],0x0
100037ca:	c7 46 08 00 00 00 00 	mov    DWORD PTR [esi+0x8],0x0
100037d1:	5e                   	pop    esi
100037d2:	c3                   	ret
100037d3:	cc                   	int3
100037d4:	cc                   	int3
100037d5:	cc                   	int3
100037d6:	cc                   	int3
100037d7:	cc                   	int3
100037d8:	cc                   	int3
100037d9:	cc                   	int3
100037da:	cc                   	int3
100037db:	cc                   	int3
100037dc:	cc                   	int3
100037dd:	cc                   	int3
100037de:	cc                   	int3
100037df:	cc                   	int3
100037e0:	c7 01 04 71 01 10    	mov    DWORD PTR [ecx],0x10017104
100037e6:	8b 49 04             	mov    ecx,DWORD PTR [ecx+0x4]
100037e9:	85 c9                	test   ecx,ecx
100037eb:	74 06                	je     0x100037f3
100037ed:	8b 01                	mov    eax,DWORD PTR [ecx]
100037ef:	6a 01                	push   0x1
100037f1:	ff 10                	call   DWORD PTR [eax]
100037f3:	c3                   	ret
100037f4:	cc                   	int3
100037f5:	cc                   	int3
100037f6:	cc                   	int3
100037f7:	cc                   	int3
100037f8:	cc                   	int3
100037f9:	cc                   	int3
100037fa:	cc                   	int3
100037fb:	cc                   	int3
100037fc:	cc                   	int3
100037fd:	cc                   	int3
100037fe:	cc                   	int3
100037ff:	cc                   	int3
10003800:	8d 41 04             	lea    eax,[ecx+0x4]
10003803:	c7 01 14 72 01 10    	mov    DWORD PTR [ecx],0x10017214
10003809:	50                   	push   eax
1000380a:	ff 15 60 70 01 10    	call   DWORD PTR ds:0x10017060
10003810:	59                   	pop    ecx
10003811:	c3                   	ret
10003812:	cc                   	int3
10003813:	cc                   	int3
10003814:	cc                   	int3
10003815:	cc                   	int3
10003816:	cc                   	int3
10003817:	cc                   	int3
10003818:	cc                   	int3
10003819:	cc                   	int3
1000381a:	cc                   	int3
1000381b:	cc                   	int3
1000381c:	cc                   	int3
1000381d:	cc                   	int3
1000381e:	cc                   	int3
1000381f:	cc                   	int3
10003820:	55                   	push   ebp
10003821:	8b ec                	mov    ebp,esp
10003823:	56                   	push   esi
10003824:	8b f1                	mov    esi,ecx
10003826:	8d 46 04             	lea    eax,[esi+0x4]
10003829:	c7 06 14 72 01 10    	mov    DWORD PTR [esi],0x10017214
1000382f:	50                   	push   eax
10003830:	ff 15 60 70 01 10    	call   DWORD PTR ds:0x10017060
10003836:	83 c4 04             	add    esp,0x4
10003839:	f6 45 08 01          	test   BYTE PTR [ebp+0x8],0x1
1000383d:	74 0b                	je     0x1000384a
1000383f:	6a 0c                	push   0xc
10003841:	56                   	push   esi
10003842:	e8 e1 14 01 00       	call   0x10014d28
10003847:	83 c4 08             	add    esp,0x8
1000384a:	8b c6                	mov    eax,esi
1000384c:	5e                   	pop    esi
1000384d:	5d                   	pop    ebp
1000384e:	c2 04 00             	ret    0x4
10003851:	cc                   	int3
10003852:	cc                   	int3
10003853:	cc                   	int3
10003854:	cc                   	int3
10003855:	cc                   	int3
10003856:	cc                   	int3
10003857:	cc                   	int3
10003858:	cc                   	int3
10003859:	cc                   	int3
1000385a:	cc                   	int3
1000385b:	cc                   	int3
1000385c:	cc                   	int3
1000385d:	cc                   	int3
1000385e:	cc                   	int3
1000385f:	cc                   	int3
10003860:	55                   	push   ebp
10003861:	8b ec                	mov    ebp,esp
10003863:	6a ff                	push   0xffffffff
10003865:	68 68 5d 01 10       	push   0x10015d68
1000386a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10003870:	50                   	push   eax
10003871:	83 ec 30             	sub    esp,0x30
10003874:	53                   	push   ebx
10003875:	56                   	push   esi
10003876:	57                   	push   edi
10003877:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000387c:	33 c5                	xor    eax,ebp
1000387e:	50                   	push   eax
1000387f:	8d 45 f4             	lea    eax,[ebp-0xc]
10003882:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10003888:	89 4d e8             	mov    DWORD PTR [ebp-0x18],ecx
1000388b:	33 ff                	xor    edi,edi
1000388d:	33 db                	xor    ebx,ebx
1000388f:	33 f6                	xor    esi,esi
10003891:	89 5d c4             	mov    DWORD PTR [ebp-0x3c],ebx
10003894:	89 75 c8             	mov    DWORD PTR [ebp-0x38],esi
10003897:	89 7d f0             	mov    DWORD PTR [ebp-0x10],edi
1000389a:	89 7d cc             	mov    DWORD PTR [ebp-0x34],edi
1000389d:	8b 01                	mov    eax,DWORD PTR [ecx]
1000389f:	89 7d fc             	mov    DWORD PTR [ebp-0x4],edi
100038a2:	89 7d ec             	mov    DWORD PTR [ebp-0x14],edi
100038a5:	ff 50 04             	call   DWORD PTR [eax+0x4]
100038a8:	85 c0                	test   eax,eax
100038aa:	0f 8e c5 00 00 00    	jle    0x10003975


===== VA 0x10003ea0 | ??0AFEBinaryLink@@IAE@PAVAFEBinaryLinkPrivate@@@Z | span 0xe0 =====
Disassembly of section .text:

10003ea0 <.text+0x2ea0>:
10003ea0:	55                   	push   ebp
10003ea1:	8b ec                	mov    ebp,esp
10003ea3:	51                   	push   ecx
10003ea4:	56                   	push   esi
10003ea5:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10003ea8:	8b f1                	mov    esi,ecx
10003eaa:	89 75 fc             	mov    DWORD PTR [ebp-0x4],esi
10003ead:	e8 ce ec ff ff       	call   0x10002b80
10003eb2:	c7 06 54 72 01 10    	mov    DWORD PTR [esi],0x10017254
10003eb8:	8b c6                	mov    eax,esi
10003eba:	5e                   	pop    esi
10003ebb:	8b e5                	mov    esp,ebp
10003ebd:	5d                   	pop    ebp
10003ebe:	c2 04 00             	ret    0x4
10003ec1:	cc                   	int3
10003ec2:	cc                   	int3
10003ec3:	cc                   	int3
10003ec4:	cc                   	int3
10003ec5:	cc                   	int3
10003ec6:	cc                   	int3
10003ec7:	cc                   	int3
10003ec8:	cc                   	int3
10003ec9:	cc                   	int3
10003eca:	cc                   	int3
10003ecb:	cc                   	int3
10003ecc:	cc                   	int3
10003ecd:	cc                   	int3
10003ece:	cc                   	int3
10003ecf:	cc                   	int3
10003ed0:	55                   	push   ebp
10003ed1:	8b ec                	mov    ebp,esp
10003ed3:	6a ff                	push   0xffffffff
10003ed5:	68 50 65 01 10       	push   0x10016550
10003eda:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10003ee0:	50                   	push   eax
10003ee1:	51                   	push   ecx
10003ee2:	56                   	push   esi
10003ee3:	57                   	push   edi
10003ee4:	a1 04 10 02 10       	mov    eax,ds:0x10021004
10003ee9:	33 c5                	xor    eax,ebp
10003eeb:	50                   	push   eax
10003eec:	8d 45 f4             	lea    eax,[ebp-0xc]
10003eef:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10003ef5:	8b f1                	mov    esi,ecx
10003ef7:	89 75 f0             	mov    DWORD PTR [ebp-0x10],esi
10003efa:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
10003efd:	c7 06 04 71 01 10    	mov    DWORD PTR [esi],0x10017104
10003f03:	8b 42 04             	mov    eax,DWORD PTR [edx+0x4]
10003f06:	89 46 04             	mov    DWORD PTR [esi+0x4],eax
10003f09:	8d 7e 08             	lea    edi,[esi+0x8]
10003f0c:	c7 06 6c 71 01 10    	mov    DWORD PTR [esi],0x1001716c
10003f12:	89 7d 08             	mov    DWORD PTR [ebp+0x8],edi
10003f15:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10003f1c:	c7 47 24 00 00 00 00 	mov    DWORD PTR [edi+0x24],0x0
10003f23:	8b 4a 2c             	mov    ecx,DWORD PTR [edx+0x2c]
10003f26:	c6 45 fc 01          	mov    BYTE PTR [ebp-0x4],0x1
10003f2a:	85 c9                	test   ecx,ecx
10003f2c:	74 08                	je     0x10003f36
10003f2e:	8b 01                	mov    eax,DWORD PTR [ecx]
10003f30:	57                   	push   edi
10003f31:	ff 10                	call   DWORD PTR [eax]
10003f33:	89 47 24             	mov    DWORD PTR [edi+0x24],eax
10003f36:	8b c6                	mov    eax,esi
10003f38:	c7 06 54 72 01 10    	mov    DWORD PTR [esi],0x10017254
10003f3e:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10003f41:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10003f48:	59                   	pop    ecx
10003f49:	5f                   	pop    edi
10003f4a:	5e                   	pop    esi
10003f4b:	8b e5                	mov    esp,ebp
10003f4d:	5d                   	pop    ebp
10003f4e:	c2 04 00             	ret    0x4
10003f51:	cc                   	int3
10003f52:	cc                   	int3
10003f53:	cc                   	int3
10003f54:	cc                   	int3
10003f55:	cc                   	int3
10003f56:	cc                   	int3
10003f57:	cc                   	int3
10003f58:	cc                   	int3
10003f59:	cc                   	int3
10003f5a:	cc                   	int3
10003f5b:	cc                   	int3
10003f5c:	cc                   	int3
10003f5d:	cc                   	int3
10003f5e:	cc                   	int3
10003f5f:	cc                   	int3
10003f60:	55                   	push   ebp
10003f61:	8b ec                	mov    ebp,esp
10003f63:	51                   	push   ecx
10003f64:	56                   	push   esi
10003f65:	8b f1                	mov    esi,ecx
10003f67:	89 75 fc             	mov    DWORD PTR [ebp-0x4],esi
10003f6a:	e8 51 ec ff ff       	call   0x10002bc0
10003f6f:	c7 06 54 72 01 10    	mov    DWORD PTR [esi],0x10017254
10003f75:	8b c6                	mov    eax,esi
10003f77:	5e                   	pop    esi
10003f78:	8b e5                	mov    esp,ebp
10003f7a:	5d                   	pop    ebp
10003f7b:	c3                   	ret
10003f7c:	cc                   	int3
10003f7d:	cc                   	int3
10003f7e:	cc                   	int3
10003f7f:	cc                   	int3


===== VA 0x10003f80 | ??0AFEBinaryLinkPrivate@@QAE@AAV0@@Z | span 0x30 =====
Disassembly of section .text:

10003f80 <.text+0x2f80>:
10003f80:	55                   	push   ebp
10003f81:	8b ec                	mov    ebp,esp
10003f83:	51                   	push   ecx
10003f84:	56                   	push   esi
10003f85:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10003f88:	8b f1                	mov    esi,ecx
10003f8a:	89 75 fc             	mov    DWORD PTR [ebp-0x4],esi
10003f8d:	e8 de ec ff ff       	call   0x10002c70
10003f92:	c7 06 70 72 01 10    	mov    DWORD PTR [esi],0x10017270
10003f98:	8b c6                	mov    eax,esi
10003f9a:	5e                   	pop    esi
10003f9b:	8b e5                	mov    esp,ebp
10003f9d:	5d                   	pop    ebp
10003f9e:	c2 04 00             	ret    0x4
10003fa1:	cc                   	int3
10003fa2:	cc                   	int3
10003fa3:	cc                   	int3
10003fa4:	cc                   	int3
10003fa5:	cc                   	int3
10003fa6:	cc                   	int3
10003fa7:	cc                   	int3
10003fa8:	cc                   	int3
10003fa9:	cc                   	int3
10003faa:	cc                   	int3
10003fab:	cc                   	int3
10003fac:	cc                   	int3
10003fad:	cc                   	int3
10003fae:	cc                   	int3
10003faf:	cc                   	int3


===== VA 0x10003fb0 | ??0AFEBinaryLinkPrivate@@QAE@XZ | span 0xa0 =====
Disassembly of section .text:

10003fb0 <.text+0x2fb0>:
10003fb0:	55                   	push   ebp
10003fb1:	8b ec                	mov    ebp,esp
10003fb3:	6a ff                	push   0xffffffff
10003fb5:	68 7b 65 01 10       	push   0x1001657b
10003fba:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10003fc0:	50                   	push   eax
10003fc1:	51                   	push   ecx
10003fc2:	56                   	push   esi
10003fc3:	a1 04 10 02 10       	mov    eax,ds:0x10021004
10003fc8:	33 c5                	xor    eax,ebp
10003fca:	50                   	push   eax
10003fcb:	8d 45 f4             	lea    eax,[ebp-0xc]
10003fce:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10003fd4:	8b f1                	mov    esi,ecx
10003fd6:	89 75 f0             	mov    DWORD PTR [ebp-0x10],esi
10003fd9:	68 e0 71 01 10       	push   0x100171e0
10003fde:	8d 4e 08             	lea    ecx,[esi+0x8]
10003fe1:	c7 06 dc 71 01 10    	mov    DWORD PTR [esi],0x100171dc
10003fe7:	c7 46 04 00 00 00 00 	mov    DWORD PTR [esi+0x4],0x0
10003fee:	e8 0d dd 00 00       	call   0x10011d00
10003ff3:	68 e0 71 01 10       	push   0x100171e0
10003ff8:	8d 4e 0c             	lea    ecx,[esi+0xc]
10003ffb:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10004002:	e8 f9 dc 00 00       	call   0x10011d00
10004007:	c7 46 10 00 00 00 00 	mov    DWORD PTR [esi+0x10],0x0
1000400e:	8b c6                	mov    eax,esi
10004010:	c7 46 14 00 00 00 00 	mov    DWORD PTR [esi+0x14],0x0
10004017:	c7 46 18 00 00 00 00 	mov    DWORD PTR [esi+0x18],0x0
1000401e:	c7 06 70 72 01 10    	mov    DWORD PTR [esi],0x10017270
10004024:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10004027:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000402e:	59                   	pop    ecx
1000402f:	5e                   	pop    esi
10004030:	8b e5                	mov    esp,ebp
10004032:	5d                   	pop    ebp
10004033:	c3                   	ret
10004034:	cc                   	int3
10004035:	cc                   	int3
10004036:	cc                   	int3
10004037:	cc                   	int3
10004038:	cc                   	int3
10004039:	cc                   	int3
1000403a:	cc                   	int3
1000403b:	cc                   	int3
1000403c:	cc                   	int3
1000403d:	cc                   	int3
1000403e:	cc                   	int3
1000403f:	cc                   	int3
10004040:	c7 01 54 72 01 10    	mov    DWORD PTR [ecx],0x10017254
10004046:	e9 55 ee ff ff       	jmp    0x10002ea0
1000404b:	cc                   	int3
1000404c:	cc                   	int3
1000404d:	cc                   	int3
1000404e:	cc                   	int3
1000404f:	cc                   	int3


===== VA 0x10004050 | ??1AEBinaryLinkPrivate@@UAE@XZ | ??1AElementPrivate@@UAE@XZ | ??1AFEBinaryLinkPrivate@@EAE@XZ | ??1AIEBinaryLinkPrivate@@UAE@XZ | span 0xf0 =====
Disassembly of section .text:

10004050 <.text+0x3050>:
10004050:	56                   	push   esi
10004051:	8b f1                	mov    esi,ecx
10004053:	c7 06 dc 71 01 10    	mov    DWORD PTR [esi],0x100171dc
10004059:	8b 4e 10             	mov    ecx,DWORD PTR [esi+0x10]
1000405c:	85 c9                	test   ecx,ecx
1000405e:	74 29                	je     0x10004089
10004060:	8b 46 18             	mov    eax,DWORD PTR [esi+0x18]
10004063:	2b c1                	sub    eax,ecx
10004065:	6a 04                	push   0x4
10004067:	c1 f8 02             	sar    eax,0x2
1000406a:	50                   	push   eax
1000406b:	51                   	push   ecx
1000406c:	e8 0f dc ff ff       	call   0x10001c80
10004071:	c7 46 10 00 00 00 00 	mov    DWORD PTR [esi+0x10],0x0
10004078:	83 c4 0c             	add    esp,0xc
1000407b:	c7 46 14 00 00 00 00 	mov    DWORD PTR [esi+0x14],0x0
10004082:	c7 46 18 00 00 00 00 	mov    DWORD PTR [esi+0x18],0x0
10004089:	8d 4e 0c             	lea    ecx,[esi+0xc]
1000408c:	e8 4f dd 00 00       	call   0x10011de0
10004091:	8d 4e 08             	lea    ecx,[esi+0x8]
10004094:	5e                   	pop    esi
10004095:	e9 46 dd 00 00       	jmp    0x10011de0
1000409a:	cc                   	int3
1000409b:	cc                   	int3
1000409c:	cc                   	int3
1000409d:	cc                   	int3
1000409e:	cc                   	int3
1000409f:	cc                   	int3
100040a0:	55                   	push   ebp
100040a1:	8b ec                	mov    ebp,esp
100040a3:	6a ff                	push   0xffffffff
100040a5:	68 38 5e 01 10       	push   0x10015e38
100040aa:	64 a1 00 00 00 00    	mov    eax,fs:0x0
100040b0:	50                   	push   eax
100040b1:	83 ec 2c             	sub    esp,0x2c
100040b4:	a1 04 10 02 10       	mov    eax,ds:0x10021004
100040b9:	33 c5                	xor    eax,ebp
100040bb:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
100040be:	56                   	push   esi
100040bf:	57                   	push   edi
100040c0:	50                   	push   eax
100040c1:	8d 45 f4             	lea    eax,[ebp-0xc]
100040c4:	64 a3 00 00 00 00    	mov    fs:0x0,eax
100040ca:	8b f9                	mov    edi,ecx
100040cc:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
100040cf:	8d 77 08             	lea    esi,[edi+0x8]
100040d2:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
100040d9:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
100040dc:	89 47 04             	mov    DWORD PTR [edi+0x4],eax
100040df:	8b 49 2c             	mov    ecx,DWORD PTR [ecx+0x2c]
100040e2:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
100040e9:	85 c9                	test   ecx,ecx
100040eb:	74 0b                	je     0x100040f8
100040ed:	8b 01                	mov    eax,DWORD PTR [ecx]
100040ef:	8d 55 c8             	lea    edx,[ebp-0x38]
100040f2:	52                   	push   edx
100040f3:	ff 10                	call   DWORD PTR [eax]
100040f5:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
100040f8:	56                   	push   esi
100040f9:	8d 4d c8             	lea    ecx,[ebp-0x38]
100040fc:	e8 6f e4 ff ff       	call   0x10002570
10004101:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
10004104:	85 c9                	test   ecx,ecx
10004106:	74 11                	je     0x10004119
10004108:	8b 31                	mov    esi,DWORD PTR [ecx]
1000410a:	8d 45 c8             	lea    eax,[ebp-0x38]
1000410d:	3b c8                	cmp    ecx,eax
1000410f:	0f 95 c2             	setne  dl
10004112:	0f b6 d2             	movzx  edx,dl
10004115:	52                   	push   edx
10004116:	ff 56 10             	call   DWORD PTR [esi+0x10]
10004119:	8b c7                	mov    eax,edi
1000411b:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000411e:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10004125:	59                   	pop    ecx
10004126:	5f                   	pop    edi
10004127:	5e                   	pop    esi
10004128:	8b 4d f0             	mov    ecx,DWORD PTR [ebp-0x10]
1000412b:	33 cd                	xor    ecx,ebp
1000412d:	e8 1b 0c 01 00       	call   0x10014d4d
10004132:	8b e5                	mov    esp,ebp
10004134:	5d                   	pop    ebp
10004135:	c2 04 00             	ret    0x4
10004138:	cc                   	int3
10004139:	cc                   	int3
1000413a:	cc                   	int3
1000413b:	cc                   	int3
1000413c:	cc                   	int3
1000413d:	cc                   	int3
1000413e:	cc                   	int3
1000413f:	cc                   	int3


===== VA 0x10004140 | ??4AEBinaryLinkPrivate@@QAEAAV0@ABV0@@Z | ??4AFEBinaryLinkPrivate@@QAEAAV0@ABV0@@Z | span 0x220 =====
Disassembly of section .text:

10004140 <.text+0x3140>:
10004140:	55                   	push   ebp
10004141:	8b ec                	mov    ebp,esp
10004143:	56                   	push   esi
10004144:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
10004147:	57                   	push   edi
10004148:	8b f9                	mov    edi,ecx
1000414a:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
1000414d:	89 47 04             	mov    DWORD PTR [edi+0x4],eax
10004150:	8d 4f 08             	lea    ecx,[edi+0x8]
10004153:	8d 46 08             	lea    eax,[esi+0x8]
10004156:	50                   	push   eax
10004157:	e8 e4 dc 00 00       	call   0x10011e40
1000415c:	8d 46 0c             	lea    eax,[esi+0xc]
1000415f:	50                   	push   eax
10004160:	8d 4f 0c             	lea    ecx,[edi+0xc]
10004163:	e8 d8 dc 00 00       	call   0x10011e40
10004168:	8d 46 10             	lea    eax,[esi+0x10]
1000416b:	50                   	push   eax
1000416c:	8d 4f 10             	lea    ecx,[edi+0x10]
1000416f:	e8 2c 67 00 00       	call   0x1000a8a0
10004174:	8b 46 1c             	mov    eax,DWORD PTR [esi+0x1c]
10004177:	89 47 1c             	mov    DWORD PTR [edi+0x1c],eax
1000417a:	8b 46 20             	mov    eax,DWORD PTR [esi+0x20]
1000417d:	89 47 20             	mov    DWORD PTR [edi+0x20],eax
10004180:	8b 46 24             	mov    eax,DWORD PTR [esi+0x24]
10004183:	89 47 24             	mov    DWORD PTR [edi+0x24],eax
10004186:	8b 46 28             	mov    eax,DWORD PTR [esi+0x28]
10004189:	89 47 28             	mov    DWORD PTR [edi+0x28],eax
1000418c:	8b c7                	mov    eax,edi
1000418e:	5f                   	pop    edi
1000418f:	5e                   	pop    esi
10004190:	5d                   	pop    ebp
10004191:	c2 04 00             	ret    0x4
10004194:	cc                   	int3
10004195:	cc                   	int3
10004196:	cc                   	int3
10004197:	cc                   	int3
10004198:	cc                   	int3
10004199:	cc                   	int3
1000419a:	cc                   	int3
1000419b:	cc                   	int3
1000419c:	cc                   	int3
1000419d:	cc                   	int3
1000419e:	cc                   	int3
1000419f:	cc                   	int3
100041a0:	55                   	push   ebp
100041a1:	8b ec                	mov    ebp,esp
100041a3:	6a ff                	push   0xffffffff
100041a5:	68 30 66 01 10       	push   0x10016630
100041aa:	64 a1 00 00 00 00    	mov    eax,fs:0x0
100041b0:	50                   	push   eax
100041b1:	53                   	push   ebx
100041b2:	56                   	push   esi
100041b3:	57                   	push   edi
100041b4:	a1 04 10 02 10       	mov    eax,ds:0x10021004
100041b9:	33 c5                	xor    eax,ebp
100041bb:	50                   	push   eax
100041bc:	8d 45 f4             	lea    eax,[ebp-0xc]
100041bf:	64 a3 00 00 00 00    	mov    fs:0x0,eax
100041c5:	8b f1                	mov    esi,ecx
100041c7:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
100041ca:	f6 c3 02             	test   bl,0x2
100041cd:	74 43                	je     0x10004212
100041cf:	68 40 40 00 10       	push   0x10004040
100041d4:	ff 76 fc             	push   DWORD PTR [esi-0x4]
100041d7:	8d 7e fc             	lea    edi,[esi-0x4]
100041da:	6a 30                	push   0x30
100041dc:	56                   	push   esi
100041dd:	e8 27 0a 01 00       	call   0x10014c09
100041e2:	f6 c3 01             	test   bl,0x1
100041e5:	74 15                	je     0x100041fc
100041e7:	8b 0f                	mov    ecx,DWORD PTR [edi]
100041e9:	8d 0c 49             	lea    ecx,[ecx+ecx*2]
100041ec:	c1 e1 04             	shl    ecx,0x4
100041ef:	83 c1 04             	add    ecx,0x4
100041f2:	51                   	push   ecx
100041f3:	57                   	push   edi
100041f4:	e8 46 0b 01 00       	call   0x10014d3f
100041f9:	83 c4 08             	add    esp,0x8
100041fc:	8b c7                	mov    eax,edi
100041fe:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10004201:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10004208:	59                   	pop    ecx
10004209:	5f                   	pop    edi
1000420a:	5e                   	pop    esi
1000420b:	5b                   	pop    ebx
1000420c:	8b e5                	mov    esp,ebp
1000420e:	5d                   	pop    ebp
1000420f:	c2 04 00             	ret    0x4
10004212:	c7 06 54 72 01 10    	mov    DWORD PTR [esi],0x10017254
10004218:	e8 83 ec ff ff       	call   0x10002ea0
1000421d:	f6 c3 01             	test   bl,0x1
10004220:	74 0b                	je     0x1000422d
10004222:	6a 30                	push   0x30
10004224:	56                   	push   esi
10004225:	e8 fe 0a 01 00       	call   0x10014d28
1000422a:	83 c4 08             	add    esp,0x8
1000422d:	8b c6                	mov    eax,esi
1000422f:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10004232:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10004239:	59                   	pop    ecx
1000423a:	5f                   	pop    edi
1000423b:	5e                   	pop    esi
1000423c:	5b                   	pop    ebx
1000423d:	8b e5                	mov    esp,ebp
1000423f:	5d                   	pop    ebp
10004240:	c2 04 00             	ret    0x4
10004243:	cc                   	int3
10004244:	cc                   	int3
10004245:	cc                   	int3
10004246:	cc                   	int3
10004247:	cc                   	int3
10004248:	cc                   	int3
10004249:	cc                   	int3
1000424a:	cc                   	int3
1000424b:	cc                   	int3
1000424c:	cc                   	int3
1000424d:	cc                   	int3
1000424e:	cc                   	int3
1000424f:	cc                   	int3
10004250:	55                   	push   ebp
10004251:	8b ec                	mov    ebp,esp
10004253:	6a ff                	push   0xffffffff
10004255:	68 30 66 01 10       	push   0x10016630
1000425a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10004260:	50                   	push   eax
10004261:	53                   	push   ebx
10004262:	56                   	push   esi
10004263:	57                   	push   edi
10004264:	a1 04 10 02 10       	mov    eax,ds:0x10021004
10004269:	33 c5                	xor    eax,ebp
1000426b:	50                   	push   eax
1000426c:	8d 45 f4             	lea    eax,[ebp-0xc]
1000426f:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10004275:	8b f1                	mov    esi,ecx
10004277:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
1000427a:	f6 c3 02             	test   bl,0x2
1000427d:	74 3e                	je     0x100042bd
1000427f:	68 50 40 00 10       	push   0x10004050
10004284:	ff 76 fc             	push   DWORD PTR [esi-0x4]
10004287:	8d 7e fc             	lea    edi,[esi-0x4]
1000428a:	6a 2c                	push   0x2c
1000428c:	56                   	push   esi
1000428d:	e8 77 09 01 00       	call   0x10014c09
10004292:	f6 c3 01             	test   bl,0x1
10004295:	74 10                	je     0x100042a7
10004297:	6b 0f 2c             	imul   ecx,DWORD PTR [edi],0x2c
1000429a:	83 c1 04             	add    ecx,0x4
1000429d:	51                   	push   ecx
1000429e:	57                   	push   edi
1000429f:	e8 9b 0a 01 00       	call   0x10014d3f
100042a4:	83 c4 08             	add    esp,0x8
100042a7:	8b c7                	mov    eax,edi
100042a9:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
100042ac:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
100042b3:	59                   	pop    ecx
100042b4:	5f                   	pop    edi
100042b5:	5e                   	pop    esi
100042b6:	5b                   	pop    ebx
100042b7:	8b e5                	mov    esp,ebp
100042b9:	5d                   	pop    ebp
100042ba:	c2 04 00             	ret    0x4
100042bd:	c7 06 dc 71 01 10    	mov    DWORD PTR [esi],0x100171dc
100042c3:	8b 4e 10             	mov    ecx,DWORD PTR [esi+0x10]
100042c6:	85 c9                	test   ecx,ecx
100042c8:	74 29                	je     0x100042f3
100042ca:	8b 46 18             	mov    eax,DWORD PTR [esi+0x18]
100042cd:	2b c1                	sub    eax,ecx
100042cf:	6a 04                	push   0x4
100042d1:	c1 f8 02             	sar    eax,0x2
100042d4:	50                   	push   eax
100042d5:	51                   	push   ecx
100042d6:	e8 a5 d9 ff ff       	call   0x10001c80
100042db:	c7 46 10 00 00 00 00 	mov    DWORD PTR [esi+0x10],0x0
100042e2:	83 c4 0c             	add    esp,0xc
100042e5:	c7 46 14 00 00 00 00 	mov    DWORD PTR [esi+0x14],0x0
100042ec:	c7 46 18 00 00 00 00 	mov    DWORD PTR [esi+0x18],0x0
100042f3:	8d 4e 0c             	lea    ecx,[esi+0xc]
100042f6:	e8 e5 da 00 00       	call   0x10011de0
100042fb:	8d 4e 08             	lea    ecx,[esi+0x8]
100042fe:	e8 dd da 00 00       	call   0x10011de0
10004303:	f6 c3 01             	test   bl,0x1
10004306:	74 0b                	je     0x10004313
10004308:	6a 2c                	push   0x2c
1000430a:	56                   	push   esi
1000430b:	e8 18 0a 01 00       	call   0x10014d28
10004310:	83 c4 08             	add    esp,0x8
10004313:	8b c6                	mov    eax,esi
10004315:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10004318:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000431f:	59                   	pop    ecx
10004320:	5f                   	pop    edi
10004321:	5e                   	pop    esi
10004322:	5b                   	pop    ebx
10004323:	8b e5                	mov    esp,ebp
10004325:	5d                   	pop    ebp
10004326:	c2 04 00             	ret    0x4
10004329:	cc                   	int3
1000432a:	cc                   	int3
1000432b:	cc                   	int3
1000432c:	cc                   	int3
1000432d:	cc                   	int3
1000432e:	cc                   	int3
1000432f:	cc                   	int3
10004330:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
10004333:	8b 40 1c             	mov    eax,DWORD PTR [eax+0x1c]
10004336:	c3                   	ret
10004337:	cc                   	int3
10004338:	cc                   	int3
10004339:	cc                   	int3
1000433a:	cc                   	int3
1000433b:	cc                   	int3
1000433c:	cc                   	int3
1000433d:	cc                   	int3
1000433e:	cc                   	int3
1000433f:	cc                   	int3
10004340:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
10004343:	8b 40 20             	mov    eax,DWORD PTR [eax+0x20]
10004346:	c3                   	ret
10004347:	cc                   	int3
10004348:	cc                   	int3
10004349:	cc                   	int3
1000434a:	cc                   	int3
1000434b:	cc                   	int3
1000434c:	cc                   	int3
1000434d:	cc                   	int3
1000434e:	cc                   	int3
1000434f:	cc                   	int3
10004350:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
10004353:	8b 40 24             	mov    eax,DWORD PTR [eax+0x24]
10004356:	c3                   	ret
10004357:	cc                   	int3
10004358:	cc                   	int3
10004359:	cc                   	int3
1000435a:	cc                   	int3
1000435b:	cc                   	int3
1000435c:	cc                   	int3
1000435d:	cc                   	int3
1000435e:	cc                   	int3
1000435f:	cc                   	int3


===== VA 0x10005f60 | ??0AFElement@@IAE@PAVAFElementPrivate@@@Z | span 0x100 =====
Disassembly of section .text:

10005f60 <.text+0x4f60>:
10005f60:	55                   	push   ebp
10005f61:	8b ec                	mov    ebp,esp
10005f63:	51                   	push   ecx
10005f64:	56                   	push   esi
10005f65:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10005f68:	8b f1                	mov    esi,ecx
10005f6a:	89 75 fc             	mov    DWORD PTR [ebp-0x4],esi
10005f6d:	e8 1e d7 ff ff       	call   0x10003690
10005f72:	c7 06 20 71 01 10    	mov    DWORD PTR [esi],0x10017120
10005f78:	c7 46 08 00 00 00 00 	mov    DWORD PTR [esi+0x8],0x0
10005f7f:	c7 46 0c 00 00 00 00 	mov    DWORD PTR [esi+0xc],0x0
10005f86:	c7 46 10 00 00 00 00 	mov    DWORD PTR [esi+0x10],0x0
10005f8d:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
10005f90:	c7 80 88 00 00 00 00 	mov    DWORD PTR [eax+0x88],0x0
10005f97:	00 00 00 
10005f9a:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
10005f9d:	c7 80 80 00 00 00 00 	mov    DWORD PTR [eax+0x80],0x0
10005fa4:	00 00 00 
10005fa7:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
10005faa:	c7 80 84 00 00 00 00 	mov    DWORD PTR [eax+0x84],0x0
10005fb1:	00 00 00 
10005fb4:	8b c6                	mov    eax,esi
10005fb6:	5e                   	pop    esi
10005fb7:	8b e5                	mov    esp,ebp
10005fb9:	5d                   	pop    ebp
10005fba:	c2 04 00             	ret    0x4
10005fbd:	cc                   	int3
10005fbe:	cc                   	int3
10005fbf:	cc                   	int3
10005fc0:	55                   	push   ebp
10005fc1:	8b ec                	mov    ebp,esp
10005fc3:	6a ff                	push   0xffffffff
10005fc5:	68 d2 6a 01 10       	push   0x10016ad2
10005fca:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10005fd0:	50                   	push   eax
10005fd1:	51                   	push   ecx
10005fd2:	56                   	push   esi
10005fd3:	57                   	push   edi
10005fd4:	a1 04 10 02 10       	mov    eax,ds:0x10021004
10005fd9:	33 c5                	xor    eax,ebp
10005fdb:	50                   	push   eax
10005fdc:	8d 45 f4             	lea    eax,[ebp-0xc]
10005fdf:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10005fe5:	8b f1                	mov    esi,ecx
10005fe7:	89 75 f0             	mov    DWORD PTR [ebp-0x10],esi
10005fea:	68 98 00 00 00       	push   0x98
10005fef:	e8 fc ec 00 00       	call   0x10014cf0
10005ff4:	8b f8                	mov    edi,eax
10005ff6:	83 c4 04             	add    esp,0x4
10005ff9:	89 7d f0             	mov    DWORD PTR [ebp-0x10],edi
10005ffc:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10006003:	85 ff                	test   edi,edi
10006005:	74 19                	je     0x10006020
10006007:	68 98 00 00 00       	push   0x98
1000600c:	6a 00                	push   0x0
1000600e:	57                   	push   edi
1000600f:	e8 a0 fa 00 00       	call   0x10015ab4
10006014:	83 c4 0c             	add    esp,0xc
10006017:	8b cf                	mov    ecx,edi
10006019:	e8 b2 01 00 00       	call   0x100061d0
1000601e:	eb 02                	jmp    0x10006022
10006020:	33 c0                	xor    eax,eax
10006022:	50                   	push   eax
10006023:	8b ce                	mov    ecx,esi
10006025:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
1000602c:	e8 5f d6 ff ff       	call   0x10003690
10006031:	c7 06 20 71 01 10    	mov    DWORD PTR [esi],0x10017120
10006037:	8b c6                	mov    eax,esi
10006039:	c7 46 08 00 00 00 00 	mov    DWORD PTR [esi+0x8],0x0
10006040:	c7 46 0c 00 00 00 00 	mov    DWORD PTR [esi+0xc],0x0
10006047:	c7 46 10 00 00 00 00 	mov    DWORD PTR [esi+0x10],0x0
1000604e:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10006051:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10006058:	59                   	pop    ecx
10006059:	5f                   	pop    edi
1000605a:	5e                   	pop    esi
1000605b:	8b e5                	mov    esp,ebp
1000605d:	5d                   	pop    ebp
1000605e:	c3                   	ret
1000605f:	cc                   	int3


===== VA 0x10006060 | ??0AFElementPrivate@@QAE@AAV0@@Z | span 0x170 =====
Disassembly of section .text:

10006060 <.text+0x5060>:
10006060:	55                   	push   ebp
10006061:	8b ec                	mov    ebp,esp
10006063:	6a ff                	push   0xffffffff
10006065:	68 8a 5f 01 10       	push   0x10015f8a
1000606a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10006070:	50                   	push   eax
10006071:	51                   	push   ecx
10006072:	53                   	push   ebx
10006073:	56                   	push   esi
10006074:	57                   	push   edi
10006075:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000607a:	33 c5                	xor    eax,ebp
1000607c:	50                   	push   eax
1000607d:	8d 45 f4             	lea    eax,[ebp-0xc]
10006080:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10006086:	8b f1                	mov    esi,ecx
10006088:	89 75 f0             	mov    DWORD PTR [ebp-0x10],esi
1000608b:	8b 7d 08             	mov    edi,DWORD PTR [ebp+0x8]
1000608e:	8d 4e 08             	lea    ecx,[esi+0x8]
10006091:	c7 06 dc 71 01 10    	mov    DWORD PTR [esi],0x100171dc
10006097:	8b 47 04             	mov    eax,DWORD PTR [edi+0x4]
1000609a:	89 46 04             	mov    DWORD PTR [esi+0x4],eax
1000609d:	8d 47 08             	lea    eax,[edi+0x8]
100060a0:	50                   	push   eax
100060a1:	e8 ba bb 00 00       	call   0x10011c60
100060a6:	8d 47 0c             	lea    eax,[edi+0xc]
100060a9:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
100060b0:	50                   	push   eax
100060b1:	8d 4e 0c             	lea    ecx,[esi+0xc]
100060b4:	e8 a7 bb 00 00       	call   0x10011c60
100060b9:	8d 47 10             	lea    eax,[edi+0x10]
100060bc:	c6 45 fc 01          	mov    BYTE PTR [ebp-0x4],0x1
100060c0:	50                   	push   eax
100060c1:	8d 4e 10             	lea    ecx,[esi+0x10]
100060c4:	e8 37 b1 ff ff       	call   0x10001200
100060c9:	c7 06 78 72 01 10    	mov    DWORD PTR [esi],0x10017278
100060cf:	8d 4e 20             	lea    ecx,[esi+0x20]
100060d2:	8a 47 1c             	mov    al,BYTE PTR [edi+0x1c]
100060d5:	8d 57 20             	lea    edx,[edi+0x20]
100060d8:	88 46 1c             	mov    BYTE PTR [esi+0x1c],al
100060db:	c7 41 14 07 00 00 00 	mov    DWORD PTR [ecx+0x14],0x7
100060e2:	c7 41 10 00 00 00 00 	mov    DWORD PTR [ecx+0x10],0x0
100060e9:	83 79 14 08          	cmp    DWORD PTR [ecx+0x14],0x8
100060ed:	c7 45 fc 02 00 00 00 	mov    DWORD PTR [ebp-0x4],0x2
100060f4:	72 04                	jb     0x100060fa
100060f6:	8b 01                	mov    eax,DWORD PTR [ecx]
100060f8:	eb 02                	jmp    0x100060fc
100060fa:	8b c1                	mov    eax,ecx
100060fc:	6a ff                	push   0xffffffff
100060fe:	33 db                	xor    ebx,ebx
10006100:	53                   	push   ebx
10006101:	52                   	push   edx
10006102:	66 89 18             	mov    WORD PTR [eax],bx
10006105:	e8 26 1c 00 00       	call   0x10007d30
1000610a:	8d 4e 38             	lea    ecx,[esi+0x38]
1000610d:	c6 45 fc 03          	mov    BYTE PTR [ebp-0x4],0x3
10006111:	c7 41 14 07 00 00 00 	mov    DWORD PTR [ecx+0x14],0x7
10006118:	8d 57 38             	lea    edx,[edi+0x38]
1000611b:	89 59 10             	mov    DWORD PTR [ecx+0x10],ebx
1000611e:	83 79 14 08          	cmp    DWORD PTR [ecx+0x14],0x8
10006122:	72 04                	jb     0x10006128
10006124:	8b 01                	mov    eax,DWORD PTR [ecx]
10006126:	eb 02                	jmp    0x1000612a
10006128:	8b c1                	mov    eax,ecx
1000612a:	6a ff                	push   0xffffffff
1000612c:	33 db                	xor    ebx,ebx
1000612e:	53                   	push   ebx
1000612f:	52                   	push   edx
10006130:	66 89 18             	mov    WORD PTR [eax],bx
10006133:	e8 f8 1b 00 00       	call   0x10007d30
10006138:	8b 47 50             	mov    eax,DWORD PTR [edi+0x50]
1000613b:	8d 4e 60             	lea    ecx,[esi+0x60]
1000613e:	89 46 50             	mov    DWORD PTR [esi+0x50],eax
10006141:	8b 47 54             	mov    eax,DWORD PTR [edi+0x54]
10006144:	89 46 54             	mov    DWORD PTR [esi+0x54],eax
10006147:	66 8b 47 58          	mov    ax,WORD PTR [edi+0x58]
1000614b:	66 89 46 58          	mov    WORD PTR [esi+0x58],ax
1000614f:	8b 47 5c             	mov    eax,DWORD PTR [edi+0x5c]
10006152:	89 46 5c             	mov    DWORD PTR [esi+0x5c],eax
10006155:	8d 47 60             	lea    eax,[edi+0x60]
10006158:	50                   	push   eax
10006159:	c6 45 fc 04          	mov    BYTE PTR [ebp-0x4],0x4
1000615d:	e8 1e fc ff ff       	call   0x10005d80
10006162:	8d 47 6c             	lea    eax,[edi+0x6c]
10006165:	c6 45 fc 05          	mov    BYTE PTR [ebp-0x4],0x5
10006169:	50                   	push   eax
1000616a:	8d 4e 6c             	lea    ecx,[esi+0x6c]
1000616d:	e8 5e fb ff ff       	call   0x10005cd0
10006172:	8b 87 80 00 00 00    	mov    eax,DWORD PTR [edi+0x80]
10006178:	8d 8e 8c 00 00 00    	lea    ecx,[esi+0x8c]
1000617e:	89 86 80 00 00 00    	mov    DWORD PTR [esi+0x80],eax
10006184:	8b 87 84 00 00 00    	mov    eax,DWORD PTR [edi+0x84]
1000618a:	89 86 84 00 00 00    	mov    DWORD PTR [esi+0x84],eax
10006190:	8b 87 88 00 00 00    	mov    eax,DWORD PTR [edi+0x88]
10006196:	89 86 88 00 00 00    	mov    DWORD PTR [esi+0x88],eax
1000619c:	8d 87 8c 00 00 00    	lea    eax,[edi+0x8c]
100061a2:	50                   	push   eax
100061a3:	c6 45 fc 06          	mov    BYTE PTR [ebp-0x4],0x6
100061a7:	e8 c4 fc ff ff       	call   0x10005e70
100061ac:	8b c6                	mov    eax,esi
100061ae:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
100061b1:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
100061b8:	59                   	pop    ecx
100061b9:	5f                   	pop    edi
100061ba:	5e                   	pop    esi
100061bb:	5b                   	pop    ebx
100061bc:	8b e5                	mov    esp,ebp
100061be:	5d                   	pop    ebp
100061bf:	c2 04 00             	ret    0x4
100061c2:	cc                   	int3
100061c3:	cc                   	int3
100061c4:	cc                   	int3
100061c5:	cc                   	int3
100061c6:	cc                   	int3
100061c7:	cc                   	int3
100061c8:	cc                   	int3
100061c9:	cc                   	int3
100061ca:	cc                   	int3
100061cb:	cc                   	int3
100061cc:	cc                   	int3
100061cd:	cc                   	int3
100061ce:	cc                   	int3
100061cf:	cc                   	int3


===== VA 0x100061d0 | ??0AFElementPrivate@@QAE@XZ | span 0x200 =====
Disassembly of section .text:

100061d0 <.text+0x51d0>:
100061d0:	55                   	push   ebp
100061d1:	8b ec                	mov    ebp,esp
100061d3:	6a ff                	push   0xffffffff
100061d5:	68 e4 5f 01 10       	push   0x10015fe4
100061da:	64 a1 00 00 00 00    	mov    eax,fs:0x0
100061e0:	50                   	push   eax
100061e1:	83 ec 08             	sub    esp,0x8
100061e4:	56                   	push   esi
100061e5:	57                   	push   edi
100061e6:	a1 04 10 02 10       	mov    eax,ds:0x10021004
100061eb:	33 c5                	xor    eax,ebp
100061ed:	50                   	push   eax
100061ee:	8d 45 f4             	lea    eax,[ebp-0xc]
100061f1:	64 a3 00 00 00 00    	mov    fs:0x0,eax
100061f7:	8b f1                	mov    esi,ecx
100061f9:	89 75 f0             	mov    DWORD PTR [ebp-0x10],esi
100061fc:	68 e0 71 01 10       	push   0x100171e0
10006201:	8d 4e 08             	lea    ecx,[esi+0x8]
10006204:	c7 06 dc 71 01 10    	mov    DWORD PTR [esi],0x100171dc
1000620a:	c7 46 04 00 00 00 00 	mov    DWORD PTR [esi+0x4],0x0
10006211:	e8 ea ba 00 00       	call   0x10011d00
10006216:	68 e0 71 01 10       	push   0x100171e0
1000621b:	8d 4e 0c             	lea    ecx,[esi+0xc]
1000621e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10006225:	e8 d6 ba 00 00       	call   0x10011d00
1000622a:	c7 46 10 00 00 00 00 	mov    DWORD PTR [esi+0x10],0x0
10006231:	c7 46 14 00 00 00 00 	mov    DWORD PTR [esi+0x14],0x0
10006238:	c7 46 18 00 00 00 00 	mov    DWORD PTR [esi+0x18],0x0
1000623f:	8d 46 20             	lea    eax,[esi+0x20]
10006242:	c7 06 78 72 01 10    	mov    DWORD PTR [esi],0x10017278
10006248:	c7 40 14 07 00 00 00 	mov    DWORD PTR [eax+0x14],0x7
1000624f:	c7 40 10 00 00 00 00 	mov    DWORD PTR [eax+0x10],0x0
10006256:	83 78 14 08          	cmp    DWORD PTR [eax+0x14],0x8
1000625a:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [ebp-0x4],0x1
10006261:	72 02                	jb     0x10006265
10006263:	8b 00                	mov    eax,DWORD PTR [eax]
10006265:	33 c9                	xor    ecx,ecx
10006267:	66 89 08             	mov    WORD PTR [eax],cx
1000626a:	8d 46 38             	lea    eax,[esi+0x38]
1000626d:	c7 40 14 07 00 00 00 	mov    DWORD PTR [eax+0x14],0x7
10006274:	89 48 10             	mov    DWORD PTR [eax+0x10],ecx
10006277:	83 78 14 08          	cmp    DWORD PTR [eax+0x14],0x8
1000627b:	72 02                	jb     0x1000627f
1000627d:	8b 00                	mov    eax,DWORD PTR [eax]
1000627f:	33 c9                	xor    ecx,ecx
10006281:	66 89 08             	mov    WORD PTR [eax],cx
10006284:	89 4e 60             	mov    DWORD PTR [esi+0x60],ecx
10006287:	89 4e 64             	mov    DWORD PTR [esi+0x64],ecx
1000628a:	89 4e 68             	mov    DWORD PTR [esi+0x68],ecx
1000628d:	8d 7e 6c             	lea    edi,[esi+0x6c]
10006290:	c6 45 fc 04          	mov    BYTE PTR [ebp-0x4],0x4
10006294:	6a 08                	push   0x8
10006296:	89 7d ec             	mov    DWORD PTR [ebp-0x14],edi
10006299:	89 0f                	mov    DWORD PTR [edi],ecx
1000629b:	89 4f 04             	mov    DWORD PTR [edi+0x4],ecx
1000629e:	89 4f 08             	mov    DWORD PTR [edi+0x8],ecx
100062a1:	89 4f 0c             	mov    DWORD PTR [edi+0xc],ecx
100062a4:	89 4f 10             	mov    DWORD PTR [edi+0x10],ecx
100062a7:	e8 44 ea 00 00       	call   0x10014cf0
100062ac:	83 c4 04             	add    esp,0x4
100062af:	85 c0                	test   eax,eax
100062b1:	75 06                	jne    0x100062b9
100062b3:	ff 15 b8 70 01 10    	call   DWORD PTR ds:0x100170b8
100062b9:	89 07                	mov    DWORD PTR [edi],eax
100062bb:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
100062c1:	c7 40 04 00 00 00 00 	mov    DWORD PTR [eax+0x4],0x0
100062c8:	8b 07                	mov    eax,DWORD PTR [edi]
100062ca:	89 38                	mov    DWORD PTR [eax],edi
100062cc:	8b c6                	mov    eax,esi
100062ce:	c7 86 8c 00 00 00 00 	mov    DWORD PTR [esi+0x8c],0x0
100062d5:	00 00 00 
100062d8:	c7 86 90 00 00 00 00 	mov    DWORD PTR [esi+0x90],0x0
100062df:	00 00 00 
100062e2:	c7 86 94 00 00 00 00 	mov    DWORD PTR [esi+0x94],0x0
100062e9:	00 00 00 
100062ec:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
100062ef:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
100062f6:	59                   	pop    ecx
100062f7:	5f                   	pop    edi
100062f8:	5e                   	pop    esi
100062f9:	8b e5                	mov    esp,ebp
100062fb:	5d                   	pop    ebp
100062fc:	c3                   	ret
100062fd:	cc                   	int3
100062fe:	cc                   	int3
100062ff:	cc                   	int3
10006300:	56                   	push   esi
10006301:	8b f1                	mov    esi,ecx
10006303:	8b 46 14             	mov    eax,DWORD PTR [esi+0x14]
10006306:	83 f8 08             	cmp    eax,0x8
10006309:	72 0e                	jb     0x10006319
1000630b:	6a 02                	push   0x2
1000630d:	40                   	inc    eax
1000630e:	50                   	push   eax
1000630f:	ff 36                	push   DWORD PTR [esi]
10006311:	e8 6a b9 ff ff       	call   0x10001c80
10006316:	83 c4 0c             	add    esp,0xc
10006319:	c7 46 14 07 00 00 00 	mov    DWORD PTR [esi+0x14],0x7
10006320:	83 7e 14 08          	cmp    DWORD PTR [esi+0x14],0x8
10006324:	c7 46 10 00 00 00 00 	mov    DWORD PTR [esi+0x10],0x0
1000632b:	72 09                	jb     0x10006336
1000632d:	8b 06                	mov    eax,DWORD PTR [esi]
1000632f:	33 c9                	xor    ecx,ecx
10006331:	5e                   	pop    esi
10006332:	66 89 08             	mov    WORD PTR [eax],cx
10006335:	c3                   	ret
10006336:	33 c0                	xor    eax,eax
10006338:	66 89 06             	mov    WORD PTR [esi],ax
1000633b:	5e                   	pop    esi
1000633c:	c3                   	ret
1000633d:	cc                   	int3
1000633e:	cc                   	int3
1000633f:	cc                   	int3
10006340:	56                   	push   esi
10006341:	8b f1                	mov    esi,ecx
10006343:	6a 08                	push   0x8
10006345:	6a 01                	push   0x1
10006347:	ff 36                	push   DWORD PTR [esi]
10006349:	e8 32 b9 ff ff       	call   0x10001c80
1000634e:	83 c4 0c             	add    esp,0xc
10006351:	c7 06 00 00 00 00    	mov    DWORD PTR [esi],0x0
10006357:	5e                   	pop    esi
10006358:	c3                   	ret
10006359:	cc                   	int3
1000635a:	cc                   	int3
1000635b:	cc                   	int3
1000635c:	cc                   	int3
1000635d:	cc                   	int3
1000635e:	cc                   	int3
1000635f:	cc                   	int3
10006360:	56                   	push   esi
10006361:	8b f1                	mov    esi,ecx
10006363:	e8 78 10 00 00       	call   0x100073e0
10006368:	6a 08                	push   0x8
1000636a:	6a 01                	push   0x1
1000636c:	ff 36                	push   DWORD PTR [esi]
1000636e:	e8 0d b9 ff ff       	call   0x10001c80
10006373:	83 c4 0c             	add    esp,0xc
10006376:	c7 06 00 00 00 00    	mov    DWORD PTR [esi],0x0
1000637c:	5e                   	pop    esi
1000637d:	c3                   	ret
1000637e:	cc                   	int3
1000637f:	cc                   	int3
10006380:	56                   	push   esi
10006381:	8b f1                	mov    esi,ecx
10006383:	c7 06 20 71 01 10    	mov    DWORD PTR [esi],0x10017120
10006389:	8b 4e 08             	mov    ecx,DWORD PTR [esi+0x8]
1000638c:	85 c9                	test   ecx,ecx
1000638e:	74 29                	je     0x100063b9
10006390:	8b 46 10             	mov    eax,DWORD PTR [esi+0x10]
10006393:	2b c1                	sub    eax,ecx
10006395:	6a 04                	push   0x4
10006397:	c1 f8 02             	sar    eax,0x2
1000639a:	50                   	push   eax
1000639b:	51                   	push   ecx
1000639c:	e8 df b8 ff ff       	call   0x10001c80
100063a1:	c7 46 08 00 00 00 00 	mov    DWORD PTR [esi+0x8],0x0
100063a8:	83 c4 0c             	add    esp,0xc
100063ab:	c7 46 0c 00 00 00 00 	mov    DWORD PTR [esi+0xc],0x0
100063b2:	c7 46 10 00 00 00 00 	mov    DWORD PTR [esi+0x10],0x0
100063b9:	8b ce                	mov    ecx,esi
100063bb:	5e                   	pop    esi
100063bc:	e9 1f d4 ff ff       	jmp    0x100037e0
100063c1:	cc                   	int3
100063c2:	cc                   	int3
100063c3:	cc                   	int3
100063c4:	cc                   	int3
100063c5:	cc                   	int3
100063c6:	cc                   	int3
100063c7:	cc                   	int3
100063c8:	cc                   	int3
100063c9:	cc                   	int3
100063ca:	cc                   	int3
100063cb:	cc                   	int3
100063cc:	cc                   	int3
100063cd:	cc                   	int3
100063ce:	cc                   	int3
100063cf:	cc                   	int3


===== VA 0x100063d0 | ??1AFElementPrivate@@UAE@XZ | span 0x220 =====
Disassembly of section .text:

100063d0 <.text+0x53d0>:
100063d0:	55                   	push   ebp
100063d1:	8b ec                	mov    ebp,esp
100063d3:	51                   	push   ecx
100063d4:	53                   	push   ebx
100063d5:	56                   	push   esi
100063d6:	57                   	push   edi
100063d7:	8b f9                	mov    edi,ecx
100063d9:	8d 9f 8c 00 00 00    	lea    ebx,[edi+0x8c]
100063df:	c7 07 78 72 01 10    	mov    DWORD PTR [edi],0x10017278
100063e5:	8b 03                	mov    eax,DWORD PTR [ebx]
100063e7:	85 c0                	test   eax,eax
100063e9:	74 45                	je     0x10006430
100063eb:	ff 75 fc             	push   DWORD PTR [ebp-0x4]
100063ee:	53                   	push   ebx
100063ef:	ff 73 04             	push   DWORD PTR [ebx+0x4]
100063f2:	50                   	push   eax
100063f3:	e8 78 e2 ff ff       	call   0x10004670
100063f8:	8b 33                	mov    esi,DWORD PTR [ebx]
100063fa:	b8 ab aa aa 2a       	mov    eax,0x2aaaaaab
100063ff:	8b 4b 08             	mov    ecx,DWORD PTR [ebx+0x8]
10006402:	2b ce                	sub    ecx,esi
10006404:	f7 e9                	imul   ecx
10006406:	6a 18                	push   0x18
10006408:	c1 fa 02             	sar    edx,0x2
1000640b:	8b c2                	mov    eax,edx
1000640d:	c1 e8 1f             	shr    eax,0x1f
10006410:	03 c2                	add    eax,edx
10006412:	50                   	push   eax
10006413:	56                   	push   esi
10006414:	e8 67 b8 ff ff       	call   0x10001c80
10006419:	c7 03 00 00 00 00    	mov    DWORD PTR [ebx],0x0
1000641f:	83 c4 1c             	add    esp,0x1c
10006422:	c7 43 04 00 00 00 00 	mov    DWORD PTR [ebx+0x4],0x0
10006429:	c7 43 08 00 00 00 00 	mov    DWORD PTR [ebx+0x8],0x0
10006430:	8d 4f 6c             	lea    ecx,[edi+0x6c]
10006433:	e8 a8 0f 00 00       	call   0x100073e0
10006438:	6a 08                	push   0x8
1000643a:	6a 01                	push   0x1
1000643c:	ff 77 6c             	push   DWORD PTR [edi+0x6c]
1000643f:	e8 3c b8 ff ff       	call   0x10001c80
10006444:	c7 47 6c 00 00 00 00 	mov    DWORD PTR [edi+0x6c],0x0
1000644b:	83 c4 0c             	add    esp,0xc
1000644e:	8b 77 60             	mov    esi,DWORD PTR [edi+0x60]
10006451:	85 f6                	test   esi,esi
10006453:	74 36                	je     0x1000648b
10006455:	8b 4f 68             	mov    ecx,DWORD PTR [edi+0x68]
10006458:	b8 ab aa aa 2a       	mov    eax,0x2aaaaaab
1000645d:	2b ce                	sub    ecx,esi
1000645f:	f7 e9                	imul   ecx
10006461:	6a 0c                	push   0xc
10006463:	d1 fa                	sar    edx,1
10006465:	8b c2                	mov    eax,edx
10006467:	c1 e8 1f             	shr    eax,0x1f
1000646a:	03 c2                	add    eax,edx
1000646c:	50                   	push   eax
1000646d:	56                   	push   esi
1000646e:	e8 0d b8 ff ff       	call   0x10001c80
10006473:	c7 47 60 00 00 00 00 	mov    DWORD PTR [edi+0x60],0x0
1000647a:	83 c4 0c             	add    esp,0xc
1000647d:	c7 47 64 00 00 00 00 	mov    DWORD PTR [edi+0x64],0x0
10006484:	c7 47 68 00 00 00 00 	mov    DWORD PTR [edi+0x68],0x0
1000648b:	8b 47 4c             	mov    eax,DWORD PTR [edi+0x4c]
1000648e:	8d 77 38             	lea    esi,[edi+0x38]
10006491:	83 f8 08             	cmp    eax,0x8
10006494:	72 0e                	jb     0x100064a4
10006496:	6a 02                	push   0x2
10006498:	40                   	inc    eax
10006499:	50                   	push   eax
1000649a:	ff 36                	push   DWORD PTR [esi]
1000649c:	e8 df b7 ff ff       	call   0x10001c80
100064a1:	83 c4 0c             	add    esp,0xc
100064a4:	c7 46 14 07 00 00 00 	mov    DWORD PTR [esi+0x14],0x7
100064ab:	83 7e 14 08          	cmp    DWORD PTR [esi+0x14],0x8
100064af:	c7 46 10 00 00 00 00 	mov    DWORD PTR [esi+0x10],0x0
100064b6:	72 02                	jb     0x100064ba
100064b8:	8b 36                	mov    esi,DWORD PTR [esi]
100064ba:	33 c0                	xor    eax,eax
100064bc:	66 89 06             	mov    WORD PTR [esi],ax
100064bf:	8d 77 20             	lea    esi,[edi+0x20]
100064c2:	8b 46 14             	mov    eax,DWORD PTR [esi+0x14]
100064c5:	83 f8 08             	cmp    eax,0x8
100064c8:	72 0e                	jb     0x100064d8
100064ca:	6a 02                	push   0x2
100064cc:	40                   	inc    eax
100064cd:	50                   	push   eax
100064ce:	ff 36                	push   DWORD PTR [esi]
100064d0:	e8 ab b7 ff ff       	call   0x10001c80
100064d5:	83 c4 0c             	add    esp,0xc
100064d8:	c7 46 14 07 00 00 00 	mov    DWORD PTR [esi+0x14],0x7
100064df:	83 7e 14 08          	cmp    DWORD PTR [esi+0x14],0x8
100064e3:	c7 46 10 00 00 00 00 	mov    DWORD PTR [esi+0x10],0x0
100064ea:	72 02                	jb     0x100064ee
100064ec:	8b 36                	mov    esi,DWORD PTR [esi]
100064ee:	33 c0                	xor    eax,eax
100064f0:	66 89 06             	mov    WORD PTR [esi],ax
100064f3:	c7 07 dc 71 01 10    	mov    DWORD PTR [edi],0x100171dc
100064f9:	8b 4f 10             	mov    ecx,DWORD PTR [edi+0x10]
100064fc:	85 c9                	test   ecx,ecx
100064fe:	74 29                	je     0x10006529
10006500:	8b 47 18             	mov    eax,DWORD PTR [edi+0x18]
10006503:	2b c1                	sub    eax,ecx
10006505:	6a 04                	push   0x4
10006507:	c1 f8 02             	sar    eax,0x2
1000650a:	50                   	push   eax
1000650b:	51                   	push   ecx
1000650c:	e8 6f b7 ff ff       	call   0x10001c80
10006511:	c7 47 10 00 00 00 00 	mov    DWORD PTR [edi+0x10],0x0
10006518:	83 c4 0c             	add    esp,0xc
1000651b:	c7 47 14 00 00 00 00 	mov    DWORD PTR [edi+0x14],0x0
10006522:	c7 47 18 00 00 00 00 	mov    DWORD PTR [edi+0x18],0x0
10006529:	8d 4f 0c             	lea    ecx,[edi+0xc]
1000652c:	e8 af b8 00 00       	call   0x10011de0
10006531:	8d 4f 08             	lea    ecx,[edi+0x8]
10006534:	e8 a7 b8 00 00       	call   0x10011de0
10006539:	5f                   	pop    edi
1000653a:	5e                   	pop    esi
1000653b:	5b                   	pop    ebx
1000653c:	8b e5                	mov    esp,ebp
1000653e:	5d                   	pop    ebp
1000653f:	c3                   	ret
10006540:	55                   	push   ebp
10006541:	8b ec                	mov    ebp,esp
10006543:	83 ec 24             	sub    esp,0x24
10006546:	53                   	push   ebx
10006547:	56                   	push   esi
10006548:	57                   	push   edi
10006549:	8b 7d 08             	mov    edi,DWORD PTR [ebp+0x8]
1000654c:	8b f1                	mov    esi,ecx
1000654e:	3b f7                	cmp    esi,edi
10006550:	0f 84 93 01 00 00    	je     0x100066e9
10006556:	8b 47 10             	mov    eax,DWORD PTR [edi+0x10]
10006559:	85 c0                	test   eax,eax
1000655b:	75 10                	jne    0x1000656d
1000655d:	e8 7e 0e 00 00       	call   0x100073e0
10006562:	8b c6                	mov    eax,esi
10006564:	5f                   	pop    edi
10006565:	5e                   	pop    esi
10006566:	5b                   	pop    ebx
10006567:	8b e5                	mov    esp,ebp
10006569:	5d                   	pop    ebp
1000656a:	c2 04 00             	ret    0x4
1000656d:	8b 4e 10             	mov    ecx,DWORD PTR [esi+0x10]
10006570:	3b c1                	cmp    eax,ecx
10006572:	0f 87 a1 00 00 00    	ja     0x10006619
10006578:	83 ec 0c             	sub    esp,0xc
1000657b:	8b ce                	mov    ecx,esi
1000657d:	54                   	push   esp
1000657e:	e8 cd 19 00 00       	call   0x10007f50
10006583:	83 ec 0c             	sub    esp,0xc
10006586:	8b cf                	mov    ecx,edi
10006588:	54                   	push   esp
10006589:	e8 22 1a 00 00       	call   0x10007fb0
1000658e:	83 ec 0c             	sub    esp,0xc
10006591:	8b cf                	mov    ecx,edi
10006593:	54                   	push   esp
10006594:	e8 b7 19 00 00       	call   0x10007f50
10006599:	8d 45 f4             	lea    eax,[ebp-0xc]
1000659c:	50                   	push   eax
1000659d:	e8 ee f1 ff ff       	call   0x10005790
100065a2:	83 c4 28             	add    esp,0x28
100065a5:	8d 45 e8             	lea    eax,[ebp-0x18]
100065a8:	8b ce                	mov    ecx,esi
100065aa:	50                   	push   eax
100065ab:	e8 00 1a 00 00       	call   0x10007fb0
100065b0:	83 ec 0c             	sub    esp,0xc
100065b3:	8b d0                	mov    edx,eax
100065b5:	8b cc                	mov    ecx,esp
100065b7:	c7 01 00 00 00 00    	mov    DWORD PTR [ecx],0x0
100065bd:	c7 41 04 00 00 00 00 	mov    DWORD PTR [ecx+0x4],0x0
100065c4:	8b 02                	mov    eax,DWORD PTR [edx]
100065c6:	85 c0                	test   eax,eax
100065c8:	74 0a                	je     0x100065d4
100065ca:	8b 00                	mov    eax,DWORD PTR [eax]
100065cc:	85 c0                	test   eax,eax
100065ce:	74 04                	je     0x100065d4
100065d0:	8b 00                	mov    eax,DWORD PTR [eax]
100065d2:	89 01                	mov    DWORD PTR [ecx],eax
100065d4:	8b 42 08             	mov    eax,DWORD PTR [edx+0x8]
100065d7:	83 ec 0c             	sub    esp,0xc
100065da:	89 41 08             	mov    DWORD PTR [ecx+0x8],eax
100065dd:	8b cc                	mov    ecx,esp
100065df:	c7 01 00 00 00 00    	mov    DWORD PTR [ecx],0x0
100065e5:	c7 41 04 00 00 00 00 	mov    DWORD PTR [ecx+0x4],0x0
100065ec:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
100065ef:	85                   	.byte 0x85


===== VA 0x10006a30 | ??4AFElementPrivate@@QAEAAV0@ABV0@@Z | span 0x220 =====
Disassembly of section .text:

10006a30 <.text+0x5a30>:
10006a30:	55                   	push   ebp
10006a31:	8b ec                	mov    ebp,esp
10006a33:	56                   	push   esi
10006a34:	57                   	push   edi
10006a35:	8b 7d 08             	mov    edi,DWORD PTR [ebp+0x8]
10006a38:	8b f1                	mov    esi,ecx
10006a3a:	8b 47 04             	mov    eax,DWORD PTR [edi+0x4]
10006a3d:	8d 4e 08             	lea    ecx,[esi+0x8]
10006a40:	89 46 04             	mov    DWORD PTR [esi+0x4],eax
10006a43:	8d 47 08             	lea    eax,[edi+0x8]
10006a46:	50                   	push   eax
10006a47:	e8 f4 b3 00 00       	call   0x10011e40
10006a4c:	8d 47 0c             	lea    eax,[edi+0xc]
10006a4f:	50                   	push   eax
10006a50:	8d 4e 0c             	lea    ecx,[esi+0xc]
10006a53:	e8 e8 b3 00 00       	call   0x10011e40
10006a58:	8d 47 10             	lea    eax,[edi+0x10]
10006a5b:	50                   	push   eax
10006a5c:	8d 4e 10             	lea    ecx,[esi+0x10]
10006a5f:	e8 3c 3e 00 00       	call   0x1000a8a0
10006a64:	8a 47 1c             	mov    al,BYTE PTR [edi+0x1c]
10006a67:	8d 4e 20             	lea    ecx,[esi+0x20]
10006a6a:	88 46 1c             	mov    BYTE PTR [esi+0x1c],al
10006a6d:	8d 47 20             	lea    eax,[edi+0x20]
10006a70:	3b c8                	cmp    ecx,eax
10006a72:	74 0a                	je     0x10006a7e
10006a74:	6a ff                	push   0xffffffff
10006a76:	6a 00                	push   0x0
10006a78:	50                   	push   eax
10006a79:	e8 b2 12 00 00       	call   0x10007d30
10006a7e:	8d 47 38             	lea    eax,[edi+0x38]
10006a81:	8d 4e 38             	lea    ecx,[esi+0x38]
10006a84:	3b c8                	cmp    ecx,eax
10006a86:	74 0a                	je     0x10006a92
10006a88:	6a ff                	push   0xffffffff
10006a8a:	6a 00                	push   0x0
10006a8c:	50                   	push   eax
10006a8d:	e8 9e 12 00 00       	call   0x10007d30
10006a92:	8b 47 50             	mov    eax,DWORD PTR [edi+0x50]
10006a95:	8d 4e 60             	lea    ecx,[esi+0x60]
10006a98:	89 46 50             	mov    DWORD PTR [esi+0x50],eax
10006a9b:	8b 47 54             	mov    eax,DWORD PTR [edi+0x54]
10006a9e:	89 46 54             	mov    DWORD PTR [esi+0x54],eax
10006aa1:	66 8b 47 58          	mov    ax,WORD PTR [edi+0x58]
10006aa5:	66 89 46 58          	mov    WORD PTR [esi+0x58],ax
10006aa9:	8b 47 5c             	mov    eax,DWORD PTR [edi+0x5c]
10006aac:	89 46 5c             	mov    DWORD PTR [esi+0x5c],eax
10006aaf:	8d 47 60             	lea    eax,[edi+0x60]
10006ab2:	50                   	push   eax
10006ab3:	e8 48 fc ff ff       	call   0x10006700
10006ab8:	8d 47 6c             	lea    eax,[edi+0x6c]
10006abb:	50                   	push   eax
10006abc:	8d 4e 6c             	lea    ecx,[esi+0x6c]
10006abf:	e8 7c fa ff ff       	call   0x10006540
10006ac4:	8b 87 80 00 00 00    	mov    eax,DWORD PTR [edi+0x80]
10006aca:	8d 8e 8c 00 00 00    	lea    ecx,[esi+0x8c]
10006ad0:	89 86 80 00 00 00    	mov    DWORD PTR [esi+0x80],eax
10006ad6:	8b 87 84 00 00 00    	mov    eax,DWORD PTR [edi+0x84]
10006adc:	89 86 84 00 00 00    	mov    DWORD PTR [esi+0x84],eax
10006ae2:	8b 87 88 00 00 00    	mov    eax,DWORD PTR [edi+0x88]
10006ae8:	89 86 88 00 00 00    	mov    DWORD PTR [esi+0x88],eax
10006aee:	8d 87 8c 00 00 00    	lea    eax,[edi+0x8c]
10006af4:	50                   	push   eax
10006af5:	e8 76 fd ff ff       	call   0x10006870
10006afa:	5f                   	pop    edi
10006afb:	8b c6                	mov    eax,esi
10006afd:	5e                   	pop    esi
10006afe:	5d                   	pop    ebp
10006aff:	c2 04 00             	ret    0x4
10006b02:	cc                   	int3
10006b03:	cc                   	int3
10006b04:	cc                   	int3
10006b05:	cc                   	int3
10006b06:	cc                   	int3
10006b07:	cc                   	int3
10006b08:	cc                   	int3
10006b09:	cc                   	int3
10006b0a:	cc                   	int3
10006b0b:	cc                   	int3
10006b0c:	cc                   	int3
10006b0d:	cc                   	int3
10006b0e:	cc                   	int3
10006b0f:	cc                   	int3
10006b10:	55                   	push   ebp
10006b11:	8b ec                	mov    ebp,esp
10006b13:	8b 01                	mov    eax,DWORD PTR [ecx]
10006b15:	56                   	push   esi
10006b16:	33 f6                	xor    esi,esi
10006b18:	85 c0                	test   eax,eax
10006b1a:	74 08                	je     0x10006b24
10006b1c:	8b 00                	mov    eax,DWORD PTR [eax]
10006b1e:	85 c0                	test   eax,eax
10006b20:	74 02                	je     0x10006b24
10006b22:	8b 30                	mov    esi,DWORD PTR [eax]
10006b24:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10006b27:	8b 51 08             	mov    edx,DWORD PTR [ecx+0x8]
10006b2a:	03 55 0c             	add    edx,DWORD PTR [ebp+0xc]
10006b2d:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
10006b33:	c7 40 04 00 00 00 00 	mov    DWORD PTR [eax+0x4],0x0
10006b3a:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
10006b3d:	85 f6                	test   esi,esi
10006b3f:	74 0a                	je     0x10006b4b
10006b41:	8b 0e                	mov    ecx,DWORD PTR [esi]
10006b43:	85 c9                	test   ecx,ecx
10006b45:	74 04                	je     0x10006b4b
10006b47:	8b 09                	mov    ecx,DWORD PTR [ecx]
10006b49:	89 08                	mov    DWORD PTR [eax],ecx
10006b4b:	5e                   	pop    esi
10006b4c:	5d                   	pop    ebp
10006b4d:	c2 08 00             	ret    0x8
10006b50:	55                   	push   ebp
10006b51:	8b ec                	mov    ebp,esp
10006b53:	6a ff                	push   0xffffffff
10006b55:	68 30 66 01 10       	push   0x10016630
10006b5a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10006b60:	50                   	push   eax
10006b61:	53                   	push   ebx
10006b62:	56                   	push   esi
10006b63:	57                   	push   edi
10006b64:	a1 04 10 02 10       	mov    eax,ds:0x10021004
10006b69:	33 c5                	xor    eax,ebp
10006b6b:	50                   	push   eax
10006b6c:	8d 45 f4             	lea    eax,[ebp-0xc]
10006b6f:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10006b75:	8b f1                	mov    esi,ecx
10006b77:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
10006b7a:	f6 c3 02             	test   bl,0x2
10006b7d:	74 44                	je     0x10006bc3
10006b7f:	68 d0 63 00 10       	push   0x100063d0
10006b84:	ff 76 fc             	push   DWORD PTR [esi-0x4]
10006b87:	8d 7e fc             	lea    edi,[esi-0x4]
10006b8a:	68 98 00 00 00       	push   0x98
10006b8f:	56                   	push   esi
10006b90:	e8 74 e0 00 00       	call   0x10014c09
10006b95:	f6 c3 01             	test   bl,0x1
10006b98:	74 13                	je     0x10006bad
10006b9a:	69 0f 98 00 00 00    	imul   ecx,DWORD PTR [edi],0x98
10006ba0:	83 c1 04             	add    ecx,0x4
10006ba3:	51                   	push   ecx
10006ba4:	57                   	push   edi
10006ba5:	e8 95 e1 00 00       	call   0x10014d3f
10006baa:	83 c4 08             	add    esp,0x8
10006bad:	8b c7                	mov    eax,edi
10006baf:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10006bb2:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10006bb9:	59                   	pop    ecx
10006bba:	5f                   	pop    edi
10006bbb:	5e                   	pop    esi
10006bbc:	5b                   	pop    ebx
10006bbd:	8b e5                	mov    esp,ebp
10006bbf:	5d                   	pop    ebp
10006bc0:	c2 04 00             	ret    0x4
10006bc3:	e8 08 f8 ff ff       	call   0x100063d0
10006bc8:	f6 c3 01             	test   bl,0x1
10006bcb:	74 0e                	je     0x10006bdb
10006bcd:	68 98 00 00 00       	push   0x98
10006bd2:	56                   	push   esi
10006bd3:	e8 50 e1 00 00       	call   0x10014d28
10006bd8:	83 c4 08             	add    esp,0x8
10006bdb:	8b c6                	mov    eax,esi
10006bdd:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10006be0:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10006be7:	59                   	pop    ecx
10006be8:	5f                   	pop    edi
10006be9:	5e                   	pop    esi
10006bea:	5b                   	pop    ebx
10006beb:	8b e5                	mov    esp,ebp
10006bed:	5d                   	pop    ebp
10006bee:	c2 04 00             	ret    0x4
10006bf1:	cc                   	int3
10006bf2:	cc                   	int3
10006bf3:	cc                   	int3
10006bf4:	cc                   	int3
10006bf5:	cc                   	int3
10006bf6:	cc                   	int3
10006bf7:	cc                   	int3
10006bf8:	cc                   	int3
10006bf9:	cc                   	int3
10006bfa:	cc                   	int3
10006bfb:	cc                   	int3
10006bfc:	cc                   	int3
10006bfd:	cc                   	int3
10006bfe:	cc                   	int3
10006bff:	cc                   	int3
10006c00:	55                   	push   ebp
10006c01:	8b ec                	mov    ebp,esp
10006c03:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10006c06:	56                   	push   esi
10006c07:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
10006c0a:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10006c0d:	8b 70 04             	mov    esi,DWORD PTR [eax+0x4]
10006c10:	8b 42 50             	mov    eax,DWORD PTR [edx+0x50]
10006c13:	8b 4e 50             	mov    ecx,DWORD PTR [esi+0x50]
10006c16:	3b c1                	cmp    eax,ecx
10006c18:	75 06                	jne    0x10006c20
10006c1a:	8b 42 54             	mov    eax,DWORD PTR [edx+0x54]
10006c1d:	3b 46 54             	cmp    eax,DWORD PTR [esi+0x54]
10006c20:	0f 9c c0             	setl   al
10006c23:	5e                   	pop    esi
10006c24:	5d                   	pop    ebp
10006c25:	c3                   	ret
10006c26:	cc                   	int3
10006c27:	cc                   	int3
10006c28:	cc                   	int3
10006c29:	cc                   	int3
10006c2a:	cc                   	int3
10006c2b:	cc                   	int3
10006c2c:	cc                   	int3
10006c2d:	cc                   	int3
10006c2e:	cc                   	int3
10006c2f:	cc                   	int3
10006c30:	55                   	push   ebp
10006c31:	8b ec                	mov    ebp,esp
10006c33:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10006c36:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
10006c39:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10006c3c:	8b 48 04             	mov    ecx,DWORD PTR [eax+0x4]
10006c3f:	8b 42 5c             	mov    eax,DWORD PTR [edx+0x5c]
10006c42:	3b 41 5c             	cmp    eax,DWORD PTR [ecx+0x5c]
10006c45:	0f 9c c0             	setl   al
10006c48:	5d                   	pop    ebp
10006c49:	c3                   	ret
10006c4a:	cc                   	int3
10006c4b:	cc                   	int3
10006c4c:	cc                   	int3
10006c4d:	cc                   	int3
10006c4e:	cc                   	int3
10006c4f:	cc                   	int3


===== VA 0x1000a4d0 | ??0AFStructure@@IAE@PAVAFStructurePrivate@@@Z | span 0x150 =====
Disassembly of section .text:

1000a4d0 <.text+0x94d0>:
1000a4d0:	55                   	push   ebp
1000a4d1:	8b ec                	mov    ebp,esp
1000a4d3:	6a ff                	push   0xffffffff
1000a4d5:	68 2a 63 01 10       	push   0x1001632a
1000a4da:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000a4e0:	50                   	push   eax
1000a4e1:	83 ec 08             	sub    esp,0x8
1000a4e4:	56                   	push   esi
1000a4e5:	57                   	push   edi
1000a4e6:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000a4eb:	33 c5                	xor    eax,ebp
1000a4ed:	50                   	push   eax
1000a4ee:	8d 45 f4             	lea    eax,[ebp-0xc]
1000a4f1:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000a4f7:	8b f9                	mov    edi,ecx
1000a4f9:	89 7d f0             	mov    DWORD PTR [ebp-0x10],edi
1000a4fc:	8d 77 04             	lea    esi,[edi+0x4]
1000a4ff:	c7 07 3c 71 01 10    	mov    DWORD PTR [edi],0x1001713c
1000a505:	8b ce                	mov    ecx,esi
1000a507:	89 75 ec             	mov    DWORD PTR [ebp-0x14],esi
1000a50a:	c7 06 00 00 00 00    	mov    DWORD PTR [esi],0x0
1000a510:	c7 46 04 00 00 00 00 	mov    DWORD PTR [esi+0x4],0x0
1000a517:	e8 f4 76 ff ff       	call   0x10001c10
1000a51c:	89 06                	mov    DWORD PTR [esi],eax
1000a51e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000a521:	6a 28                	push   0x28
1000a523:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000a52a:	89 47 0c             	mov    DWORD PTR [edi+0xc],eax
1000a52d:	e8 be a7 00 00       	call   0x10014cf0
1000a532:	83 c4 04             	add    esp,0x4
1000a535:	89 45 08             	mov    DWORD PTR [ebp+0x8],eax
1000a538:	c6 45 fc 01          	mov    BYTE PTR [ebp-0x4],0x1
1000a53c:	85 c0                	test   eax,eax
1000a53e:	74 0c                	je     0x1000a54c
1000a540:	8b c8                	mov    ecx,eax
1000a542:	e8 69 01 00 00       	call   0x1000a6b0
1000a547:	89 47 0c             	mov    DWORD PTR [edi+0xc],eax
1000a54a:	eb 07                	jmp    0x1000a553
1000a54c:	c7 47 0c 00 00 00 00 	mov    DWORD PTR [edi+0xc],0x0
1000a553:	8b c7                	mov    eax,edi
1000a555:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000a558:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000a55f:	59                   	pop    ecx
1000a560:	5f                   	pop    edi
1000a561:	5e                   	pop    esi
1000a562:	8b e5                	mov    esp,ebp
1000a564:	5d                   	pop    ebp
1000a565:	c2 04 00             	ret    0x4
1000a568:	cc                   	int3
1000a569:	cc                   	int3
1000a56a:	cc                   	int3
1000a56b:	cc                   	int3
1000a56c:	cc                   	int3
1000a56d:	cc                   	int3
1000a56e:	cc                   	int3
1000a56f:	cc                   	int3
1000a570:	55                   	push   ebp
1000a571:	8b ec                	mov    ebp,esp
1000a573:	6a ff                	push   0xffffffff
1000a575:	68 6a 63 01 10       	push   0x1001636a
1000a57a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000a580:	50                   	push   eax
1000a581:	83 ec 08             	sub    esp,0x8
1000a584:	56                   	push   esi
1000a585:	57                   	push   edi
1000a586:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000a58b:	33 c5                	xor    eax,ebp
1000a58d:	50                   	push   eax
1000a58e:	8d 45 f4             	lea    eax,[ebp-0xc]
1000a591:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000a597:	8b f9                	mov    edi,ecx
1000a599:	89 7d f0             	mov    DWORD PTR [ebp-0x10],edi
1000a59c:	8d 77 04             	lea    esi,[edi+0x4]
1000a59f:	c7 07 3c 71 01 10    	mov    DWORD PTR [edi],0x1001713c
1000a5a5:	89 75 ec             	mov    DWORD PTR [ebp-0x14],esi
1000a5a8:	8b ce                	mov    ecx,esi
1000a5aa:	c7 06 00 00 00 00    	mov    DWORD PTR [esi],0x0
1000a5b0:	c7 46 04 00 00 00 00 	mov    DWORD PTR [esi+0x4],0x0
1000a5b7:	e8 54 76 ff ff       	call   0x10001c10
1000a5bc:	89 06                	mov    DWORD PTR [esi],eax
1000a5be:	6a 28                	push   0x28
1000a5c0:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000a5c7:	e8 24 a7 00 00       	call   0x10014cf0
1000a5cc:	83 c4 04             	add    esp,0x4
1000a5cf:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
1000a5d2:	c6 45 fc 01          	mov    BYTE PTR [ebp-0x4],0x1
1000a5d6:	85 c0                	test   eax,eax
1000a5d8:	74 1d                	je     0x1000a5f7
1000a5da:	8b c8                	mov    ecx,eax
1000a5dc:	e8 cf 00 00 00       	call   0x1000a6b0
1000a5e1:	89 47 0c             	mov    DWORD PTR [edi+0xc],eax
1000a5e4:	8b c7                	mov    eax,edi
1000a5e6:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000a5e9:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000a5f0:	59                   	pop    ecx
1000a5f1:	5f                   	pop    edi
1000a5f2:	5e                   	pop    esi
1000a5f3:	8b e5                	mov    esp,ebp
1000a5f5:	5d                   	pop    ebp
1000a5f6:	c3                   	ret
1000a5f7:	c7 47 0c 00 00 00 00 	mov    DWORD PTR [edi+0xc],0x0
1000a5fe:	8b c7                	mov    eax,edi
1000a600:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000a603:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000a60a:	59                   	pop    ecx
1000a60b:	5f                   	pop    edi
1000a60c:	5e                   	pop    esi
1000a60d:	8b e5                	mov    esp,ebp
1000a60f:	5d                   	pop    ebp
1000a610:	c3                   	ret
1000a611:	cc                   	int3
1000a612:	cc                   	int3
1000a613:	cc                   	int3
1000a614:	cc                   	int3
1000a615:	cc                   	int3
1000a616:	cc                   	int3
1000a617:	cc                   	int3
1000a618:	cc                   	int3
1000a619:	cc                   	int3
1000a61a:	cc                   	int3
1000a61b:	cc                   	int3
1000a61c:	cc                   	int3
1000a61d:	cc                   	int3
1000a61e:	cc                   	int3
1000a61f:	cc                   	int3


===== VA 0x1000a620 | ??0AFStructurePrivate@@QAE@ABV0@@Z | span 0x90 =====
Disassembly of section .text:

1000a620 <.text+0x9620>:
1000a620:	55                   	push   ebp
1000a621:	8b ec                	mov    ebp,esp
1000a623:	6a ff                	push   0xffffffff
1000a625:	68 a6 5b 01 10       	push   0x10015ba6
1000a62a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000a630:	50                   	push   eax
1000a631:	51                   	push   ecx
1000a632:	56                   	push   esi
1000a633:	57                   	push   edi
1000a634:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000a639:	33 c5                	xor    eax,ebp
1000a63b:	50                   	push   eax
1000a63c:	8d 45 f4             	lea    eax,[ebp-0xc]
1000a63f:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000a645:	8b f9                	mov    edi,ecx
1000a647:	89 7d f0             	mov    DWORD PTR [ebp-0x10],edi
1000a64a:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
1000a64d:	8d 4f 04             	lea    ecx,[edi+0x4]
1000a650:	c7 07 d8 72 01 10    	mov    DWORD PTR [edi],0x100172d8
1000a656:	8d 46 04             	lea    eax,[esi+0x4]
1000a659:	50                   	push   eax
1000a65a:	e8 a1 6b ff ff       	call   0x10001200
1000a65f:	8d 46 10             	lea    eax,[esi+0x10]
1000a662:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000a669:	50                   	push   eax
1000a66a:	8d 4f 10             	lea    ecx,[edi+0x10]
1000a66d:	e8 8e 6b ff ff       	call   0x10001200
1000a672:	8d 45 0b             	lea    eax,[ebp+0xb]
1000a675:	c6 45 fc 01          	mov    BYTE PTR [ebp-0x4],0x1
1000a679:	50                   	push   eax
1000a67a:	8d 46 1c             	lea    eax,[esi+0x1c]
1000a67d:	8d 4f 1c             	lea    ecx,[edi+0x1c]
1000a680:	50                   	push   eax
1000a681:	89 4d 08             	mov    DWORD PTR [ebp+0x8],ecx
1000a684:	e8 77 69 ff ff       	call   0x10001000
1000a689:	8b 46 24             	mov    eax,DWORD PTR [esi+0x24]
1000a68c:	89 47 24             	mov    DWORD PTR [edi+0x24],eax
1000a68f:	8b c7                	mov    eax,edi
1000a691:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000a694:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000a69b:	59                   	pop    ecx
1000a69c:	5f                   	pop    edi
1000a69d:	5e                   	pop    esi
1000a69e:	8b e5                	mov    esp,ebp
1000a6a0:	5d                   	pop    ebp
1000a6a1:	c2 04 00             	ret    0x4
1000a6a4:	cc                   	int3
1000a6a5:	cc                   	int3
1000a6a6:	cc                   	int3
1000a6a7:	cc                   	int3
1000a6a8:	cc                   	int3
1000a6a9:	cc                   	int3
1000a6aa:	cc                   	int3
1000a6ab:	cc                   	int3
1000a6ac:	cc                   	int3
1000a6ad:	cc                   	int3
1000a6ae:	cc                   	int3
1000a6af:	cc                   	int3


===== VA 0x1000a6b0 | ??0AFStructurePrivate@@QAE@XZ | span 0x150 =====
Disassembly of section .text:

1000a6b0 <.text+0x96b0>:
1000a6b0:	55                   	push   ebp
1000a6b1:	8b ec                	mov    ebp,esp
1000a6b3:	6a ff                	push   0xffffffff
1000a6b5:	68 a6 63 01 10       	push   0x100163a6
1000a6ba:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000a6c0:	50                   	push   eax
1000a6c1:	83 ec 08             	sub    esp,0x8
1000a6c4:	56                   	push   esi
1000a6c5:	57                   	push   edi
1000a6c6:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000a6cb:	33 c5                	xor    eax,ebp
1000a6cd:	50                   	push   eax
1000a6ce:	8d 45 f4             	lea    eax,[ebp-0xc]
1000a6d1:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000a6d7:	8b f9                	mov    edi,ecx
1000a6d9:	89 7d f0             	mov    DWORD PTR [ebp-0x10],edi
1000a6dc:	c7 07 d8 72 01 10    	mov    DWORD PTR [edi],0x100172d8
1000a6e2:	c7 47 04 00 00 00 00 	mov    DWORD PTR [edi+0x4],0x0
1000a6e9:	c7 47 08 00 00 00 00 	mov    DWORD PTR [edi+0x8],0x0
1000a6f0:	c7 47 0c 00 00 00 00 	mov    DWORD PTR [edi+0xc],0x0
1000a6f7:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000a6fe:	c7 47 10 00 00 00 00 	mov    DWORD PTR [edi+0x10],0x0
1000a705:	c7 47 14 00 00 00 00 	mov    DWORD PTR [edi+0x14],0x0
1000a70c:	c7 47 18 00 00 00 00 	mov    DWORD PTR [edi+0x18],0x0
1000a713:	8d 77 1c             	lea    esi,[edi+0x1c]
1000a716:	c6 45 fc 01          	mov    BYTE PTR [ebp-0x4],0x1
1000a71a:	8b ce                	mov    ecx,esi
1000a71c:	89 75 ec             	mov    DWORD PTR [ebp-0x14],esi
1000a71f:	c7 06 00 00 00 00    	mov    DWORD PTR [esi],0x0
1000a725:	c7 46 04 00 00 00 00 	mov    DWORD PTR [esi+0x4],0x0
1000a72c:	e8 df 74 ff ff       	call   0x10001c10
1000a731:	89 06                	mov    DWORD PTR [esi],eax
1000a733:	8b c7                	mov    eax,edi
1000a735:	c7 47 24 00 00 00 00 	mov    DWORD PTR [edi+0x24],0x0
1000a73c:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000a73f:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000a746:	59                   	pop    ecx
1000a747:	5f                   	pop    edi
1000a748:	5e                   	pop    esi
1000a749:	8b e5                	mov    esp,ebp
1000a74b:	5d                   	pop    ebp
1000a74c:	c3                   	ret
1000a74d:	cc                   	int3
1000a74e:	cc                   	int3
1000a74f:	cc                   	int3
1000a750:	55                   	push   ebp
1000a751:	8b ec                	mov    ebp,esp
1000a753:	51                   	push   ecx
1000a754:	56                   	push   esi
1000a755:	8b f1                	mov    esi,ecx
1000a757:	57                   	push   edi
1000a758:	33 ff                	xor    edi,edi
1000a75a:	8b 56 0c             	mov    edx,DWORD PTR [esi+0xc]
1000a75d:	c7 06 3c 71 01 10    	mov    DWORD PTR [esi],0x1001713c
1000a763:	8b 42 08             	mov    eax,DWORD PTR [edx+0x8]
1000a766:	2b 42 04             	sub    eax,DWORD PTR [edx+0x4]
1000a769:	c1 f8 02             	sar    eax,0x2
1000a76c:	85 c0                	test   eax,eax
1000a76e:	74 24                	je     0x1000a794
1000a770:	8b 46 0c             	mov    eax,DWORD PTR [esi+0xc]
1000a773:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
1000a776:	8b 0c b8             	mov    ecx,DWORD PTR [eax+edi*4]
1000a779:	85 c9                	test   ecx,ecx
1000a77b:	74 06                	je     0x1000a783
1000a77d:	8b 01                	mov    eax,DWORD PTR [ecx]
1000a77f:	6a 01                	push   0x1
1000a781:	ff 10                	call   DWORD PTR [eax]
1000a783:	8b 4e 0c             	mov    ecx,DWORD PTR [esi+0xc]
1000a786:	47                   	inc    edi
1000a787:	8b 41 08             	mov    eax,DWORD PTR [ecx+0x8]
1000a78a:	2b 41 04             	sub    eax,DWORD PTR [ecx+0x4]
1000a78d:	c1 f8 02             	sar    eax,0x2
1000a790:	3b f8                	cmp    edi,eax
1000a792:	72 dc                	jb     0x1000a770
1000a794:	8b 4e 0c             	mov    ecx,DWORD PTR [esi+0xc]
1000a797:	33 ff                	xor    edi,edi
1000a799:	8b 41 14             	mov    eax,DWORD PTR [ecx+0x14]
1000a79c:	2b 41 10             	sub    eax,DWORD PTR [ecx+0x10]
1000a79f:	c1 f8 02             	sar    eax,0x2
1000a7a2:	85 c0                	test   eax,eax
1000a7a4:	74 24                	je     0x1000a7ca
1000a7a6:	8b 46 0c             	mov    eax,DWORD PTR [esi+0xc]
1000a7a9:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
1000a7ac:	8b 0c b8             	mov    ecx,DWORD PTR [eax+edi*4]
1000a7af:	85 c9                	test   ecx,ecx
1000a7b1:	74 06                	je     0x1000a7b9
1000a7b3:	8b 01                	mov    eax,DWORD PTR [ecx]
1000a7b5:	6a 01                	push   0x1
1000a7b7:	ff 10                	call   DWORD PTR [eax]
1000a7b9:	8b 4e 0c             	mov    ecx,DWORD PTR [esi+0xc]
1000a7bc:	47                   	inc    edi
1000a7bd:	8b 41 14             	mov    eax,DWORD PTR [ecx+0x14]
1000a7c0:	2b 41 10             	sub    eax,DWORD PTR [ecx+0x10]
1000a7c3:	c1 f8 02             	sar    eax,0x2
1000a7c6:	3b f8                	cmp    edi,eax
1000a7c8:	72 dc                	jb     0x1000a7a6
1000a7ca:	8b 4e 0c             	mov    ecx,DWORD PTR [esi+0xc]
1000a7cd:	85 c9                	test   ecx,ecx
1000a7cf:	74 06                	je     0x1000a7d7
1000a7d1:	8b 01                	mov    eax,DWORD PTR [ecx]
1000a7d3:	6a 01                	push   0x1
1000a7d5:	ff 10                	call   DWORD PTR [eax]
1000a7d7:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
1000a7da:	8d 4e 04             	lea    ecx,[esi+0x4]
1000a7dd:	50                   	push   eax
1000a7de:	ff 30                	push   DWORD PTR [eax]
1000a7e0:	8d 45 fc             	lea    eax,[ebp-0x4]
1000a7e3:	50                   	push   eax
1000a7e4:	e8 e7 93 00 00       	call   0x10013bd0
1000a7e9:	ff 76 04             	push   DWORD PTR [esi+0x4]
1000a7ec:	e8 32 a5 00 00       	call   0x10014d23
1000a7f1:	83 c4 04             	add    esp,0x4
1000a7f4:	5f                   	pop    edi
1000a7f5:	5e                   	pop    esi
1000a7f6:	8b e5                	mov    esp,ebp
1000a7f8:	5d                   	pop    ebp
1000a7f9:	c3                   	ret
1000a7fa:	cc                   	int3
1000a7fb:	cc                   	int3
1000a7fc:	cc                   	int3
1000a7fd:	cc                   	int3
1000a7fe:	cc                   	int3
1000a7ff:	cc                   	int3


===== VA 0x1000a800 | ??1AFStructurePrivate@@UAE@XZ | span 0x1c0 =====
Disassembly of section .text:

1000a800 <.text+0x9800>:
1000a800:	55                   	push   ebp
1000a801:	8b ec                	mov    ebp,esp
1000a803:	51                   	push   ecx
1000a804:	56                   	push   esi
1000a805:	57                   	push   edi
1000a806:	8b f9                	mov    edi,ecx
1000a808:	c7 07 d8 72 01 10    	mov    DWORD PTR [edi],0x100172d8
1000a80e:	8d 4f 1c             	lea    ecx,[edi+0x1c]
1000a811:	8b 47 1c             	mov    eax,DWORD PTR [edi+0x1c]
1000a814:	50                   	push   eax
1000a815:	ff 30                	push   DWORD PTR [eax]
1000a817:	8d 45 fc             	lea    eax,[ebp-0x4]
1000a81a:	50                   	push   eax
1000a81b:	e8 b0 93 00 00       	call   0x10013bd0
1000a820:	6a 18                	push   0x18
1000a822:	6a 01                	push   0x1
1000a824:	ff 77 1c             	push   DWORD PTR [edi+0x1c]
1000a827:	e8 54 74 ff ff       	call   0x10001c80
1000a82c:	8b 4f 10             	mov    ecx,DWORD PTR [edi+0x10]
1000a82f:	83 c4 0c             	add    esp,0xc
1000a832:	85 c9                	test   ecx,ecx
1000a834:	74 29                	je     0x1000a85f
1000a836:	8b 47 18             	mov    eax,DWORD PTR [edi+0x18]
1000a839:	2b c1                	sub    eax,ecx
1000a83b:	6a 04                	push   0x4
1000a83d:	c1 f8 02             	sar    eax,0x2
1000a840:	50                   	push   eax
1000a841:	51                   	push   ecx
1000a842:	e8 39 74 ff ff       	call   0x10001c80
1000a847:	c7 47 10 00 00 00 00 	mov    DWORD PTR [edi+0x10],0x0
1000a84e:	83 c4 0c             	add    esp,0xc
1000a851:	c7 47 14 00 00 00 00 	mov    DWORD PTR [edi+0x14],0x0
1000a858:	c7 47 18 00 00 00 00 	mov    DWORD PTR [edi+0x18],0x0
1000a85f:	8b 4f 04             	mov    ecx,DWORD PTR [edi+0x4]
1000a862:	85 c9                	test   ecx,ecx
1000a864:	74 29                	je     0x1000a88f
1000a866:	8b 47 0c             	mov    eax,DWORD PTR [edi+0xc]
1000a869:	2b c1                	sub    eax,ecx
1000a86b:	6a 04                	push   0x4
1000a86d:	c1 f8 02             	sar    eax,0x2
1000a870:	50                   	push   eax
1000a871:	51                   	push   ecx
1000a872:	e8 09 74 ff ff       	call   0x10001c80
1000a877:	c7 47 04 00 00 00 00 	mov    DWORD PTR [edi+0x4],0x0
1000a87e:	83 c4 0c             	add    esp,0xc
1000a881:	c7 47 08 00 00 00 00 	mov    DWORD PTR [edi+0x8],0x0
1000a888:	c7 47 0c 00 00 00 00 	mov    DWORD PTR [edi+0xc],0x0
1000a88f:	5f                   	pop    edi
1000a890:	5e                   	pop    esi
1000a891:	8b e5                	mov    esp,ebp
1000a893:	5d                   	pop    ebp
1000a894:	c3                   	ret
1000a895:	cc                   	int3
1000a896:	cc                   	int3
1000a897:	cc                   	int3
1000a898:	cc                   	int3
1000a899:	cc                   	int3
1000a89a:	cc                   	int3
1000a89b:	cc                   	int3
1000a89c:	cc                   	int3
1000a89d:	cc                   	int3
1000a89e:	cc                   	int3
1000a89f:	cc                   	int3
1000a8a0:	55                   	push   ebp
1000a8a1:	8b ec                	mov    ebp,esp
1000a8a3:	83 ec 0c             	sub    esp,0xc
1000a8a6:	53                   	push   ebx
1000a8a7:	8b d9                	mov    ebx,ecx
1000a8a9:	56                   	push   esi
1000a8aa:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
1000a8ad:	89 5d f8             	mov    DWORD PTR [ebp-0x8],ebx
1000a8b0:	3b de                	cmp    ebx,esi
1000a8b2:	0f 84 fe 00 00 00    	je     0x1000a9b6
1000a8b8:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
1000a8bb:	57                   	push   edi
1000a8bc:	8b 3e                	mov    edi,DWORD PTR [esi]
1000a8be:	89 7d f4             	mov    DWORD PTR [ebp-0xc],edi
1000a8c1:	3b f8                	cmp    edi,eax
1000a8c3:	75 10                	jne    0x1000a8d5
1000a8c5:	8b 03                	mov    eax,DWORD PTR [ebx]
1000a8c7:	89 43 04             	mov    DWORD PTR [ebx+0x4],eax
1000a8ca:	5f                   	pop    edi
1000a8cb:	5e                   	pop    esi
1000a8cc:	8b c3                	mov    eax,ebx
1000a8ce:	5b                   	pop    ebx
1000a8cf:	8b e5                	mov    esp,ebp
1000a8d1:	5d                   	pop    ebp
1000a8d2:	c2 04 00             	ret    0x4
1000a8d5:	8b 73 04             	mov    esi,DWORD PTR [ebx+0x4]
1000a8d8:	8b d0                	mov    edx,eax
1000a8da:	8b 0b                	mov    ecx,DWORD PTR [ebx]
1000a8dc:	2b d7                	sub    edx,edi
1000a8de:	2b f1                	sub    esi,ecx
1000a8e0:	c1 fa 02             	sar    edx,0x2
1000a8e3:	c1 fe 02             	sar    esi,0x2
1000a8e6:	89 75 fc             	mov    DWORD PTR [ebp-0x4],esi
1000a8e9:	3b d6                	cmp    edx,esi
1000a8eb:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
1000a8ee:	77 29                	ja     0x1000a919
1000a8f0:	2b c7                	sub    eax,edi
1000a8f2:	50                   	push   eax
1000a8f3:	57                   	push   edi
1000a8f4:	51                   	push   ecx
1000a8f5:	ff 15 4c 70 01 10    	call   DWORD PTR ds:0x1001704c
1000a8fb:	8b 4e 04             	mov    ecx,DWORD PTR [esi+0x4]
1000a8fe:	83 c4 0c             	add    esp,0xc
1000a901:	2b 0e                	sub    ecx,DWORD PTR [esi]
1000a903:	8b 03                	mov    eax,DWORD PTR [ebx]
1000a905:	c1 f9 02             	sar    ecx,0x2
1000a908:	5f                   	pop    edi
1000a909:	5e                   	pop    esi
1000a90a:	8d 04 88             	lea    eax,[eax+ecx*4]
1000a90d:	89 43 04             	mov    DWORD PTR [ebx+0x4],eax
1000a910:	8b c3                	mov    eax,ebx
1000a912:	5b                   	pop    ebx
1000a913:	8b e5                	mov    esp,ebp
1000a915:	5d                   	pop    ebp
1000a916:	c2 04 00             	ret    0x4
1000a919:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
1000a91c:	2b c1                	sub    eax,ecx
1000a91e:	c1 f8 02             	sar    eax,0x2
1000a921:	3b d0                	cmp    edx,eax
1000a923:	77 43                	ja     0x1000a968
1000a925:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
1000a928:	8b 1d 4c 70 01 10    	mov    ebx,DWORD PTR ds:0x1001704c
1000a92e:	8d 04 87             	lea    eax,[edi+eax*4]
1000a931:	2b c7                	sub    eax,edi
1000a933:	50                   	push   eax
1000a934:	57                   	push   edi
1000a935:	51                   	push   ecx
1000a936:	ff d3                	call   ebx
1000a938:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000a93b:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
1000a93e:	8b 76 04             	mov    esi,DWORD PTR [esi+0x4]
1000a941:	8b 7d f8             	mov    edi,DWORD PTR [ebp-0x8]
1000a944:	8d 04 91             	lea    eax,[ecx+edx*4]
1000a947:	2b f0                	sub    esi,eax
1000a949:	8b 7f 04             	mov    edi,DWORD PTR [edi+0x4]
1000a94c:	56                   	push   esi
1000a94d:	50                   	push   eax
1000a94e:	57                   	push   edi
1000a94f:	ff d3                	call   ebx
1000a951:	8b 4d f8             	mov    ecx,DWORD PTR [ebp-0x8]
1000a954:	8d 04 3e             	lea    eax,[esi+edi*1]
1000a957:	83 c4 18             	add    esp,0x18
1000a95a:	89 41 04             	mov    DWORD PTR [ecx+0x4],eax
1000a95d:	8b c1                	mov    eax,ecx
1000a95f:	5f                   	pop    edi
1000a960:	5e                   	pop    esi
1000a961:	5b                   	pop    ebx
1000a962:	8b e5                	mov    esp,ebp
1000a964:	5d                   	pop    ebp
1000a965:	c2 04 00             	ret    0x4
1000a968:	85 c9                	test   ecx,ecx
1000a96a:	74 0c                	je     0x1000a978
1000a96c:	6a 04                	push   0x4
1000a96e:	50                   	push   eax
1000a96f:	51                   	push   ecx
1000a970:	e8 0b 73 ff ff       	call   0x10001c80
1000a975:	83 c4 0c             	add    esp,0xc
1000a978:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
1000a97b:	8b cb                	mov    ecx,ebx
1000a97d:	2b 06                	sub    eax,DWORD PTR [esi]
1000a97f:	c1 f8 02             	sar    eax,0x2
1000a982:	50                   	push   eax
1000a983:	e8 08 32 00 00       	call   0x1000db90
1000a988:	84 c0                	test   al,al
1000a98a:	0f 84 3a ff ff ff    	je     0x1000a8ca
1000a990:	8b 06                	mov    eax,DWORD PTR [esi]
1000a992:	8b 76 04             	mov    esi,DWORD PTR [esi+0x4]
1000a995:	8b 3b                	mov    edi,DWORD PTR [ebx]
1000a997:	2b f0                	sub    esi,eax
1000a999:	56                   	push   esi
1000a99a:	50                   	push   eax
1000a99b:	57                   	push   edi
1000a99c:	ff 15 4c 70 01 10    	call   DWORD PTR ds:0x1001704c
1000a9a2:	83 c4 0c             	add    esp,0xc
1000a9a5:	8d 04 3e             	lea    eax,[esi+edi*1]
1000a9a8:	89 43 04             	mov    DWORD PTR [ebx+0x4],eax
1000a9ab:	8b c3                	mov    eax,ebx
1000a9ad:	5f                   	pop    edi
1000a9ae:	5e                   	pop    esi
1000a9af:	5b                   	pop    ebx
1000a9b0:	8b e5                	mov    esp,ebp
1000a9b2:	5d                   	pop    ebp
1000a9b3:	c2 04 00             	ret    0x4
1000a9b6:	5e                   	pop    esi
1000a9b7:	8b c3                	mov    eax,ebx
1000a9b9:	5b                   	pop    ebx
1000a9ba:	8b e5                	mov    esp,ebp
1000a9bc:	5d                   	pop    ebp
1000a9bd:	c2 04 00             	ret    0x4


===== VA 0x1000a9c0 | ??4AFStructurePrivate@@QAEAAV0@ABV0@@Z | ??4SubjectOperationsStructurePrivate@@QAEAAV0@ABV0@@Z | span 0x220 =====
Disassembly of section .text:

1000a9c0 <.text+0x99c0>:
1000a9c0:	55                   	push   ebp
1000a9c1:	8b ec                	mov    ebp,esp
1000a9c3:	53                   	push   ebx
1000a9c4:	56                   	push   esi
1000a9c5:	57                   	push   edi
1000a9c6:	8b 7d 08             	mov    edi,DWORD PTR [ebp+0x8]
1000a9c9:	8b f1                	mov    esi,ecx
1000a9cb:	8d 47 04             	lea    eax,[edi+0x4]
1000a9ce:	50                   	push   eax
1000a9cf:	8d 4e 04             	lea    ecx,[esi+0x4]
1000a9d2:	e8 c9 fe ff ff       	call   0x1000a8a0
1000a9d7:	8d 47 10             	lea    eax,[edi+0x10]
1000a9da:	50                   	push   eax
1000a9db:	8d 4e 10             	lea    ecx,[esi+0x10]
1000a9de:	e8 bd fe ff ff       	call   0x1000a8a0
1000a9e3:	8d 47 1c             	lea    eax,[edi+0x1c]
1000a9e6:	8d 5e 1c             	lea    ebx,[esi+0x1c]
1000a9e9:	3b d8                	cmp    ebx,eax
1000a9eb:	74 15                	je     0x1000aa02
1000a9ed:	8b cb                	mov    ecx,ebx
1000a9ef:	e8 4c 90 00 00       	call   0x10013a40
1000a9f4:	ff 75 08             	push   DWORD PTR [ebp+0x8]
1000a9f7:	8d 47 1c             	lea    eax,[edi+0x1c]
1000a9fa:	8b cb                	mov    ecx,ebx
1000a9fc:	50                   	push   eax
1000a9fd:	e8 be 66 ff ff       	call   0x100010c0
1000aa02:	8b 47 24             	mov    eax,DWORD PTR [edi+0x24]
1000aa05:	89 46 24             	mov    DWORD PTR [esi+0x24],eax
1000aa08:	8b c6                	mov    eax,esi
1000aa0a:	5f                   	pop    edi
1000aa0b:	5e                   	pop    esi
1000aa0c:	5b                   	pop    ebx
1000aa0d:	5d                   	pop    ebp
1000aa0e:	c2 04 00             	ret    0x4
1000aa11:	cc                   	int3
1000aa12:	cc                   	int3
1000aa13:	cc                   	int3
1000aa14:	cc                   	int3
1000aa15:	cc                   	int3
1000aa16:	cc                   	int3
1000aa17:	cc                   	int3
1000aa18:	cc                   	int3
1000aa19:	cc                   	int3
1000aa1a:	cc                   	int3
1000aa1b:	cc                   	int3
1000aa1c:	cc                   	int3
1000aa1d:	cc                   	int3
1000aa1e:	cc                   	int3
1000aa1f:	cc                   	int3
1000aa20:	55                   	push   ebp
1000aa21:	8b ec                	mov    ebp,esp
1000aa23:	6a ff                	push   0xffffffff
1000aa25:	68 30 66 01 10       	push   0x10016630
1000aa2a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000aa30:	50                   	push   eax
1000aa31:	53                   	push   ebx
1000aa32:	56                   	push   esi
1000aa33:	57                   	push   edi
1000aa34:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000aa39:	33 c5                	xor    eax,ebp
1000aa3b:	50                   	push   eax
1000aa3c:	8d 45 f4             	lea    eax,[ebp-0xc]
1000aa3f:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000aa45:	8b f1                	mov    esi,ecx
1000aa47:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
1000aa4a:	f6 c3 02             	test   bl,0x2
1000aa4d:	74 44                	je     0x1000aa93
1000aa4f:	68 00 a8 00 10       	push   0x1000a800
1000aa54:	ff 76 fc             	push   DWORD PTR [esi-0x4]
1000aa57:	8d 7e fc             	lea    edi,[esi-0x4]
1000aa5a:	6a 28                	push   0x28
1000aa5c:	56                   	push   esi
1000aa5d:	e8 a7 a1 00 00       	call   0x10014c09
1000aa62:	f6 c3 01             	test   bl,0x1
1000aa65:	74 16                	je     0x1000aa7d
1000aa67:	8b 0f                	mov    ecx,DWORD PTR [edi]
1000aa69:	8d 0c 89             	lea    ecx,[ecx+ecx*4]
1000aa6c:	8d 0c cd 04 00 00 00 	lea    ecx,[ecx*8+0x4]
1000aa73:	51                   	push   ecx
1000aa74:	57                   	push   edi
1000aa75:	e8 c5 a2 00 00       	call   0x10014d3f
1000aa7a:	83 c4 08             	add    esp,0x8
1000aa7d:	8b c7                	mov    eax,edi
1000aa7f:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000aa82:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000aa89:	59                   	pop    ecx
1000aa8a:	5f                   	pop    edi
1000aa8b:	5e                   	pop    esi
1000aa8c:	5b                   	pop    ebx
1000aa8d:	8b e5                	mov    esp,ebp
1000aa8f:	5d                   	pop    ebp
1000aa90:	c2 04 00             	ret    0x4
1000aa93:	e8 68 fd ff ff       	call   0x1000a800
1000aa98:	f6 c3 01             	test   bl,0x1
1000aa9b:	74 0b                	je     0x1000aaa8
1000aa9d:	6a 28                	push   0x28
1000aa9f:	56                   	push   esi
1000aaa0:	e8 83 a2 00 00       	call   0x10014d28
1000aaa5:	83 c4 08             	add    esp,0x8
1000aaa8:	8b c6                	mov    eax,esi
1000aaaa:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000aaad:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000aab4:	59                   	pop    ecx
1000aab5:	5f                   	pop    edi
1000aab6:	5e                   	pop    esi
1000aab7:	5b                   	pop    ebx
1000aab8:	8b e5                	mov    esp,ebp
1000aaba:	5d                   	pop    ebp
1000aabb:	c2 04 00             	ret    0x4
1000aabe:	cc                   	int3
1000aabf:	cc                   	int3
1000aac0:	55                   	push   ebp
1000aac1:	8b ec                	mov    ebp,esp
1000aac3:	80 7d 08 00          	cmp    BYTE PTR [ebp+0x8],0x0
1000aac7:	c7 01 a4 71 01 10    	mov    DWORD PTR [ecx],0x100171a4
1000aacd:	74 0d                	je     0x1000aadc
1000aacf:	6a 0c                	push   0xc
1000aad1:	6a 01                	push   0x1
1000aad3:	51                   	push   ecx
1000aad4:	e8 a7 71 ff ff       	call   0x10001c80
1000aad9:	83 c4 0c             	add    esp,0xc
1000aadc:	5d                   	pop    ebp
1000aadd:	c2 04 00             	ret    0x4
1000aae0:	55                   	push   ebp
1000aae1:	8b ec                	mov    ebp,esp
1000aae3:	51                   	push   ecx
1000aae4:	53                   	push   ebx
1000aae5:	8b d9                	mov    ebx,ecx
1000aae7:	56                   	push   esi
1000aae8:	57                   	push   edi
1000aae9:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
1000aaec:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
1000aaef:	8d 43 08             	lea    eax,[ebx+0x8]
1000aaf2:	50                   	push   eax
1000aaf3:	8b 72 14             	mov    esi,DWORD PTR [edx+0x14]
1000aaf6:	56                   	push   esi
1000aaf7:	ff 72 10             	push   DWORD PTR [edx+0x10]
1000aafa:	e8 e1 f8 ff ff       	call   0x1000a3e0
1000aaff:	8b f8                	mov    edi,eax
1000ab01:	83 c4 0c             	add    esp,0xc
1000ab04:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
1000ab07:	8b 48 0c             	mov    ecx,DWORD PTR [eax+0xc]
1000ab0a:	8b 41 10             	mov    eax,DWORD PTR [ecx+0x10]
1000ab0d:	83 c1 10             	add    ecx,0x10
1000ab10:	89 4d fc             	mov    DWORD PTR [ebp-0x4],ecx
1000ab13:	3b f8                	cmp    edi,eax
1000ab15:	75 05                	jne    0x1000ab1c
1000ab17:	3b 71 04             	cmp    esi,DWORD PTR [ecx+0x4]
1000ab1a:	74 1b                	je     0x1000ab37
1000ab1c:	3b fe                	cmp    edi,esi
1000ab1e:	74 1a                	je     0x1000ab3a
1000ab20:	8b 59 04             	mov    ebx,DWORD PTR [ecx+0x4]
1000ab23:	2b de                	sub    ebx,esi
1000ab25:	53                   	push   ebx
1000ab26:	56                   	push   esi
1000ab27:	57                   	push   edi
1000ab28:	ff 15 4c 70 01 10    	call   DWORD PTR ds:0x1001704c
1000ab2e:	8b 4d fc             	mov    ecx,DWORD PTR [ebp-0x4]
1000ab31:	8d 04 3b             	lea    eax,[ebx+edi*1]
1000ab34:	83 c4 0c             	add    esp,0xc
1000ab37:	89 41 04             	mov    DWORD PTR [ecx+0x4],eax
1000ab3a:	5f                   	pop    edi
1000ab3b:	5e                   	pop    esi
1000ab3c:	5b                   	pop    ebx
1000ab3d:	8b e5                	mov    esp,ebp
1000ab3f:	5d                   	pop    ebp
1000ab40:	c3                   	ret
1000ab41:	cc                   	int3
1000ab42:	cc                   	int3
1000ab43:	cc                   	int3
1000ab44:	cc                   	int3
1000ab45:	cc                   	int3
1000ab46:	cc                   	int3
1000ab47:	cc                   	int3
1000ab48:	cc                   	int3
1000ab49:	cc                   	int3
1000ab4a:	cc                   	int3
1000ab4b:	cc                   	int3
1000ab4c:	cc                   	int3
1000ab4d:	cc                   	int3
1000ab4e:	cc                   	int3
1000ab4f:	cc                   	int3
1000ab50:	55                   	push   ebp
1000ab51:	8b ec                	mov    ebp,esp
1000ab53:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000ab56:	85 c0                	test   eax,eax
1000ab58:	74 12                	je     0x1000ab6c
1000ab5a:	c7 00 e0 72 01 10    	mov    DWORD PTR [eax],0x100172e0
1000ab60:	8b 51 04             	mov    edx,DWORD PTR [ecx+0x4]
1000ab63:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
1000ab66:	8b 49 08             	mov    ecx,DWORD PTR [ecx+0x8]
1000ab69:	89 48 08             	mov    DWORD PTR [eax+0x8],ecx
1000ab6c:	5d                   	pop    ebp
1000ab6d:	c2 04 00             	ret    0x4
1000ab70:	b8 c8 12 02 10       	mov    eax,0x100212c8
1000ab75:	c3                   	ret
1000ab76:	cc                   	int3
1000ab77:	cc                   	int3
1000ab78:	cc                   	int3
1000ab79:	cc                   	int3
1000ab7a:	cc                   	int3
1000ab7b:	cc                   	int3
1000ab7c:	cc                   	int3
1000ab7d:	cc                   	int3
1000ab7e:	cc                   	int3
1000ab7f:	cc                   	int3
1000ab80:	55                   	push   ebp
1000ab81:	8b ec                	mov    ebp,esp
1000ab83:	6a ff                	push   0xffffffff
1000ab85:	68 e0 63 01 10       	push   0x100163e0
1000ab8a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000ab90:	50                   	push   eax
1000ab91:	83 ec 20             	sub    esp,0x20
1000ab94:	53                   	push   ebx
1000ab95:	56                   	push   esi
1000ab96:	57                   	push   edi
1000ab97:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000ab9c:	33 c5                	xor    eax,ebp
1000ab9e:	50                   	push   eax
1000ab9f:	8d 45 f4             	lea    eax,[ebp-0xc]
1000aba2:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000aba8:	8b c1                	mov    eax,ecx
1000abaa:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
1000abad:	ff 75 08             	push   DWORD PTR [ebp+0x8]
1000abb0:	8d 4d d4             	lea    ecx,[ebp-0x2c]
1000abb3:	51                   	push   ecx
1000abb4:	8b c8                	mov    ecx,eax
1000abb6:	e8 a5 07 00 00       	call   0x1000b360
1000abbb:	33 c0                	xor    eax,eax
1000abbd:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000abc4:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
1000abc7:	39 45 d4             	cmp    DWORD PTR [ebp-0x2c],eax
1000abca:	0f 8e 0a 01 00 00    	jle    0x1000acda
1000abd0:	8b 4d d8             	mov    ecx,DWORD PTR [ebp-0x28]
1000abd3:	8b 1c 81             	mov    ebx,DWORD PTR [ecx+eax*4]
1000abd6:	8d 4d dc             	lea    ecx,[ebp-0x24]
1000abd9:	51                   	push   ecx
1000abda:	8b cb                	mov    ecx,ebx
1000abdc:	8b 03                	mov    eax,DWORD PTR [ebx]
1000abde:	ff                   	.byte 0xff
1000abdf:	50                   	push   eax


===== VA 0x1000c540 | ??0AIEBinaryLink@@IAE@PAVAIEBinaryLinkPrivate@@@Z | span 0x170 =====
Disassembly of section .text:

1000c540 <.text+0xb540>:
1000c540:	55                   	push   ebp
1000c541:	8b ec                	mov    ebp,esp
1000c543:	51                   	push   ecx
1000c544:	56                   	push   esi
1000c545:	ff 75 08             	push   DWORD PTR [ebp+0x8]
1000c548:	8b f1                	mov    esi,ecx
1000c54a:	89 75 fc             	mov    DWORD PTR [ebp-0x4],esi
1000c54d:	e8 2e 66 ff ff       	call   0x10002b80
1000c552:	c7 06 10 73 01 10    	mov    DWORD PTR [esi],0x10017310
1000c558:	8b c6                	mov    eax,esi
1000c55a:	5e                   	pop    esi
1000c55b:	8b e5                	mov    esp,ebp
1000c55d:	5d                   	pop    ebp
1000c55e:	c2 04 00             	ret    0x4
1000c561:	cc                   	int3
1000c562:	cc                   	int3
1000c563:	cc                   	int3
1000c564:	cc                   	int3
1000c565:	cc                   	int3
1000c566:	cc                   	int3
1000c567:	cc                   	int3
1000c568:	cc                   	int3
1000c569:	cc                   	int3
1000c56a:	cc                   	int3
1000c56b:	cc                   	int3
1000c56c:	cc                   	int3
1000c56d:	cc                   	int3
1000c56e:	cc                   	int3
1000c56f:	cc                   	int3
1000c570:	55                   	push   ebp
1000c571:	8b ec                	mov    ebp,esp
1000c573:	6a ff                	push   0xffffffff
1000c575:	68 50 65 01 10       	push   0x10016550
1000c57a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000c580:	50                   	push   eax
1000c581:	51                   	push   ecx
1000c582:	56                   	push   esi
1000c583:	57                   	push   edi
1000c584:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000c589:	33 c5                	xor    eax,ebp
1000c58b:	50                   	push   eax
1000c58c:	8d 45 f4             	lea    eax,[ebp-0xc]
1000c58f:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000c595:	8b f1                	mov    esi,ecx
1000c597:	89 75 f0             	mov    DWORD PTR [ebp-0x10],esi
1000c59a:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
1000c59d:	c7 06 04 71 01 10    	mov    DWORD PTR [esi],0x10017104
1000c5a3:	8b 42 04             	mov    eax,DWORD PTR [edx+0x4]
1000c5a6:	89 46 04             	mov    DWORD PTR [esi+0x4],eax
1000c5a9:	8d 7e 08             	lea    edi,[esi+0x8]
1000c5ac:	c7 06 6c 71 01 10    	mov    DWORD PTR [esi],0x1001716c
1000c5b2:	89 7d 08             	mov    DWORD PTR [ebp+0x8],edi
1000c5b5:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000c5bc:	c7 47 24 00 00 00 00 	mov    DWORD PTR [edi+0x24],0x0
1000c5c3:	8b 4a 2c             	mov    ecx,DWORD PTR [edx+0x2c]
1000c5c6:	c6 45 fc 01          	mov    BYTE PTR [ebp-0x4],0x1
1000c5ca:	85 c9                	test   ecx,ecx
1000c5cc:	74 08                	je     0x1000c5d6
1000c5ce:	8b 01                	mov    eax,DWORD PTR [ecx]
1000c5d0:	57                   	push   edi
1000c5d1:	ff 10                	call   DWORD PTR [eax]
1000c5d3:	89 47 24             	mov    DWORD PTR [edi+0x24],eax
1000c5d6:	8b c6                	mov    eax,esi
1000c5d8:	c7 06 10 73 01 10    	mov    DWORD PTR [esi],0x10017310
1000c5de:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000c5e1:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000c5e8:	59                   	pop    ecx
1000c5e9:	5f                   	pop    edi
1000c5ea:	5e                   	pop    esi
1000c5eb:	8b e5                	mov    esp,ebp
1000c5ed:	5d                   	pop    ebp
1000c5ee:	c2 04 00             	ret    0x4
1000c5f1:	cc                   	int3
1000c5f2:	cc                   	int3
1000c5f3:	cc                   	int3
1000c5f4:	cc                   	int3
1000c5f5:	cc                   	int3
1000c5f6:	cc                   	int3
1000c5f7:	cc                   	int3
1000c5f8:	cc                   	int3
1000c5f9:	cc                   	int3
1000c5fa:	cc                   	int3
1000c5fb:	cc                   	int3
1000c5fc:	cc                   	int3
1000c5fd:	cc                   	int3
1000c5fe:	cc                   	int3
1000c5ff:	cc                   	int3
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


===== VA 0x1000c6b0 | ??0AIEBinaryLinkPrivate@@QAE@AAV0@@Z | span 0x30 =====
Disassembly of section .text:

1000c6b0 <.text+0xb6b0>:
1000c6b0:	55                   	push   ebp
1000c6b1:	8b ec                	mov    ebp,esp
1000c6b3:	51                   	push   ecx
1000c6b4:	56                   	push   esi
1000c6b5:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
1000c6b8:	57                   	push   edi
1000c6b9:	8b f9                	mov    edi,ecx
1000c6bb:	56                   	push   esi
1000c6bc:	89 7d fc             	mov    DWORD PTR [ebp-0x4],edi
1000c6bf:	e8 ac 65 ff ff       	call   0x10002c70
1000c6c4:	c7 07 30 73 01 10    	mov    DWORD PTR [edi],0x10017330
1000c6ca:	8b 46 2c             	mov    eax,DWORD PTR [esi+0x2c]
1000c6cd:	89 47 2c             	mov    DWORD PTR [edi+0x2c],eax
1000c6d0:	8b c7                	mov    eax,edi
1000c6d2:	5f                   	pop    edi
1000c6d3:	5e                   	pop    esi
1000c6d4:	8b e5                	mov    esp,ebp
1000c6d6:	5d                   	pop    ebp
1000c6d7:	c2 04 00             	ret    0x4
1000c6da:	cc                   	int3
1000c6db:	cc                   	int3
1000c6dc:	cc                   	int3
1000c6dd:	cc                   	int3
1000c6de:	cc                   	int3
1000c6df:	cc                   	int3


===== VA 0x1000c6e0 | ??0AIEBinaryLinkPrivate@@QAE@XZ | span 0x90 =====
Disassembly of section .text:

1000c6e0 <.text+0xb6e0>:
1000c6e0:	55                   	push   ebp
1000c6e1:	8b ec                	mov    ebp,esp
1000c6e3:	6a ff                	push   0xffffffff
1000c6e5:	68 7b 65 01 10       	push   0x1001657b
1000c6ea:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000c6f0:	50                   	push   eax
1000c6f1:	51                   	push   ecx
1000c6f2:	56                   	push   esi
1000c6f3:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000c6f8:	33 c5                	xor    eax,ebp
1000c6fa:	50                   	push   eax
1000c6fb:	8d 45 f4             	lea    eax,[ebp-0xc]
1000c6fe:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000c704:	8b f1                	mov    esi,ecx
1000c706:	89 75 f0             	mov    DWORD PTR [ebp-0x10],esi
1000c709:	68 e0 71 01 10       	push   0x100171e0
1000c70e:	8d 4e 08             	lea    ecx,[esi+0x8]
1000c711:	c7 06 dc 71 01 10    	mov    DWORD PTR [esi],0x100171dc
1000c717:	c7 46 04 00 00 00 00 	mov    DWORD PTR [esi+0x4],0x0
1000c71e:	e8 dd 55 00 00       	call   0x10011d00
1000c723:	68 e0 71 01 10       	push   0x100171e0
1000c728:	8d 4e 0c             	lea    ecx,[esi+0xc]
1000c72b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000c732:	e8 c9 55 00 00       	call   0x10011d00
1000c737:	c7 46 10 00 00 00 00 	mov    DWORD PTR [esi+0x10],0x0
1000c73e:	8b c6                	mov    eax,esi
1000c740:	c7 46 14 00 00 00 00 	mov    DWORD PTR [esi+0x14],0x0
1000c747:	c7 46 18 00 00 00 00 	mov    DWORD PTR [esi+0x18],0x0
1000c74e:	c7 06 30 73 01 10    	mov    DWORD PTR [esi],0x10017330
1000c754:	c7 46 2c 00 00 00 00 	mov    DWORD PTR [esi+0x2c],0x0
1000c75b:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000c75e:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000c765:	59                   	pop    ecx
1000c766:	5e                   	pop    esi
1000c767:	8b e5                	mov    esp,ebp
1000c769:	5d                   	pop    ebp
1000c76a:	c3                   	ret
1000c76b:	cc                   	int3
1000c76c:	cc                   	int3
1000c76d:	cc                   	int3
1000c76e:	cc                   	int3
1000c76f:	cc                   	int3


===== VA 0x1000c770 | ??0AIElementPrivate@@QAE@AAV0@@Z | span 0xc0 =====
Disassembly of section .text:

1000c770 <.text+0xb770>:
1000c770:	55                   	push   ebp
1000c771:	8b ec                	mov    ebp,esp
1000c773:	6a ff                	push   0xffffffff
1000c775:	68 be 65 01 10       	push   0x100165be
1000c77a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000c780:	50                   	push   eax
1000c781:	51                   	push   ecx
1000c782:	56                   	push   esi
1000c783:	57                   	push   edi
1000c784:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000c789:	33 c5                	xor    eax,ebp
1000c78b:	50                   	push   eax
1000c78c:	8d 45 f4             	lea    eax,[ebp-0xc]
1000c78f:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000c795:	8b f9                	mov    edi,ecx
1000c797:	89 7d f0             	mov    DWORD PTR [ebp-0x10],edi
1000c79a:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
1000c79d:	8d 4f 08             	lea    ecx,[edi+0x8]
1000c7a0:	c7 07 dc 71 01 10    	mov    DWORD PTR [edi],0x100171dc
1000c7a6:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
1000c7a9:	89 47 04             	mov    DWORD PTR [edi+0x4],eax
1000c7ac:	8d 46 08             	lea    eax,[esi+0x8]
1000c7af:	50                   	push   eax
1000c7b0:	e8 ab 54 00 00       	call   0x10011c60
1000c7b5:	8d 46 0c             	lea    eax,[esi+0xc]
1000c7b8:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000c7bf:	50                   	push   eax
1000c7c0:	8d 4f 0c             	lea    ecx,[edi+0xc]
1000c7c3:	e8 98 54 00 00       	call   0x10011c60
1000c7c8:	8d 46 10             	lea    eax,[esi+0x10]
1000c7cb:	c6 45 fc 01          	mov    BYTE PTR [ebp-0x4],0x1
1000c7cf:	50                   	push   eax
1000c7d0:	8d 4f 10             	lea    ecx,[edi+0x10]
1000c7d3:	e8 28 4a ff ff       	call   0x10001200
1000c7d8:	c7 07 38 73 01 10    	mov    DWORD PTR [edi],0x10017338
1000c7de:	8d 4f 20             	lea    ecx,[edi+0x20]
1000c7e1:	8a 46 1c             	mov    al,BYTE PTR [esi+0x1c]
1000c7e4:	88 47 1c             	mov    BYTE PTR [edi+0x1c],al
1000c7e7:	8d 46 20             	lea    eax,[esi+0x20]
1000c7ea:	6a ff                	push   0xffffffff
1000c7ec:	6a 00                	push   0x0
1000c7ee:	c7 41 14 0f 00 00 00 	mov    DWORD PTR [ecx+0x14],0xf
1000c7f5:	c7 41 10 00 00 00 00 	mov    DWORD PTR [ecx+0x10],0x0
1000c7fc:	50                   	push   eax
1000c7fd:	c7 45 fc 02 00 00 00 	mov    DWORD PTR [ebp-0x4],0x2
1000c804:	c6 01 00             	mov    BYTE PTR [ecx],0x0
1000c807:	e8 84 06 00 00       	call   0x1000ce90
1000c80c:	8b 46 38             	mov    eax,DWORD PTR [esi+0x38]
1000c80f:	89 47 38             	mov    DWORD PTR [edi+0x38],eax
1000c812:	8b 46 3c             	mov    eax,DWORD PTR [esi+0x3c]
1000c815:	89 47 3c             	mov    DWORD PTR [edi+0x3c],eax
1000c818:	8b c7                	mov    eax,edi
1000c81a:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000c81d:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000c824:	59                   	pop    ecx
1000c825:	5f                   	pop    edi
1000c826:	5e                   	pop    esi
1000c827:	8b e5                	mov    esp,ebp
1000c829:	5d                   	pop    ebp
1000c82a:	c2 04 00             	ret    0x4
1000c82d:	cc                   	int3
1000c82e:	cc                   	int3
1000c82f:	cc                   	int3


===== VA 0x1000c830 | ??0AIElementPrivate@@QAE@XZ | span 0xb0 =====
Disassembly of section .text:

1000c830 <.text+0xb830>:
1000c830:	55                   	push   ebp
1000c831:	8b ec                	mov    ebp,esp
1000c833:	6a ff                	push   0xffffffff
1000c835:	68 7b 65 01 10       	push   0x1001657b
1000c83a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000c840:	50                   	push   eax
1000c841:	51                   	push   ecx
1000c842:	56                   	push   esi
1000c843:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000c848:	33 c5                	xor    eax,ebp
1000c84a:	50                   	push   eax
1000c84b:	8d 45 f4             	lea    eax,[ebp-0xc]
1000c84e:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000c854:	8b f1                	mov    esi,ecx
1000c856:	89 75 f0             	mov    DWORD PTR [ebp-0x10],esi
1000c859:	68 e0 71 01 10       	push   0x100171e0
1000c85e:	8d 4e 08             	lea    ecx,[esi+0x8]
1000c861:	c7 06 dc 71 01 10    	mov    DWORD PTR [esi],0x100171dc
1000c867:	c7 46 04 00 00 00 00 	mov    DWORD PTR [esi+0x4],0x0
1000c86e:	e8 8d 54 00 00       	call   0x10011d00
1000c873:	68 e0 71 01 10       	push   0x100171e0
1000c878:	8d 4e 0c             	lea    ecx,[esi+0xc]
1000c87b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000c882:	e8 79 54 00 00       	call   0x10011d00
1000c887:	c7 46 10 00 00 00 00 	mov    DWORD PTR [esi+0x10],0x0
1000c88e:	8b c6                	mov    eax,esi
1000c890:	c7 46 14 00 00 00 00 	mov    DWORD PTR [esi+0x14],0x0
1000c897:	c7 46 18 00 00 00 00 	mov    DWORD PTR [esi+0x18],0x0
1000c89e:	c7 06 38 73 01 10    	mov    DWORD PTR [esi],0x10017338
1000c8a4:	c7 46 34 0f 00 00 00 	mov    DWORD PTR [esi+0x34],0xf
1000c8ab:	c7 46 30 00 00 00 00 	mov    DWORD PTR [esi+0x30],0x0
1000c8b2:	c6 46 20 00          	mov    BYTE PTR [esi+0x20],0x0
1000c8b6:	c7 46 3c 01 00 00 00 	mov    DWORD PTR [esi+0x3c],0x1
1000c8bd:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000c8c0:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000c8c7:	59                   	pop    ecx
1000c8c8:	5e                   	pop    esi
1000c8c9:	8b e5                	mov    esp,ebp
1000c8cb:	5d                   	pop    ebp
1000c8cc:	c3                   	ret
1000c8cd:	cc                   	int3
1000c8ce:	cc                   	int3
1000c8cf:	cc                   	int3
1000c8d0:	c7 01 10 73 01 10    	mov    DWORD PTR [ecx],0x10017310
1000c8d6:	e9 c5 65 ff ff       	jmp    0x10002ea0
1000c8db:	cc                   	int3
1000c8dc:	cc                   	int3
1000c8dd:	cc                   	int3
1000c8de:	cc                   	int3
1000c8df:	cc                   	int3


===== VA 0x1000c8e0 | ??1AIElementPrivate@@UAE@XZ | span 0x90 =====
Disassembly of section .text:

1000c8e0 <.text+0xb8e0>:
1000c8e0:	56                   	push   esi
1000c8e1:	57                   	push   edi
1000c8e2:	8b f9                	mov    edi,ecx
1000c8e4:	8d 77 20             	lea    esi,[edi+0x20]
1000c8e7:	c7 07 38 73 01 10    	mov    DWORD PTR [edi],0x10017338
1000c8ed:	8b 46 14             	mov    eax,DWORD PTR [esi+0x14]
1000c8f0:	83 f8 10             	cmp    eax,0x10
1000c8f3:	72 0e                	jb     0x1000c903
1000c8f5:	6a 01                	push   0x1
1000c8f7:	40                   	inc    eax
1000c8f8:	50                   	push   eax
1000c8f9:	ff 36                	push   DWORD PTR [esi]
1000c8fb:	e8 80 53 ff ff       	call   0x10001c80
1000c900:	83 c4 0c             	add    esp,0xc
1000c903:	c7 46 14 0f 00 00 00 	mov    DWORD PTR [esi+0x14],0xf
1000c90a:	83 7e 14 10          	cmp    DWORD PTR [esi+0x14],0x10
1000c90e:	c7 46 10 00 00 00 00 	mov    DWORD PTR [esi+0x10],0x0
1000c915:	72 02                	jb     0x1000c919
1000c917:	8b 36                	mov    esi,DWORD PTR [esi]
1000c919:	c6 06 00             	mov    BYTE PTR [esi],0x0
1000c91c:	c7 07 dc 71 01 10    	mov    DWORD PTR [edi],0x100171dc
1000c922:	8b 4f 10             	mov    ecx,DWORD PTR [edi+0x10]
1000c925:	85 c9                	test   ecx,ecx
1000c927:	74 29                	je     0x1000c952
1000c929:	8b 47 18             	mov    eax,DWORD PTR [edi+0x18]
1000c92c:	2b c1                	sub    eax,ecx
1000c92e:	6a 04                	push   0x4
1000c930:	c1 f8 02             	sar    eax,0x2
1000c933:	50                   	push   eax
1000c934:	51                   	push   ecx
1000c935:	e8 46 53 ff ff       	call   0x10001c80
1000c93a:	c7 47 10 00 00 00 00 	mov    DWORD PTR [edi+0x10],0x0
1000c941:	83 c4 0c             	add    esp,0xc
1000c944:	c7 47 14 00 00 00 00 	mov    DWORD PTR [edi+0x14],0x0
1000c94b:	c7 47 18 00 00 00 00 	mov    DWORD PTR [edi+0x18],0x0
1000c952:	8d 4f 0c             	lea    ecx,[edi+0xc]
1000c955:	e8 86 54 00 00       	call   0x10011de0
1000c95a:	8d 4f 08             	lea    ecx,[edi+0x8]
1000c95d:	5f                   	pop    edi
1000c95e:	5e                   	pop    esi
1000c95f:	e9 7c 54 00 00       	jmp    0x10011de0
1000c964:	cc                   	int3
1000c965:	cc                   	int3
1000c966:	cc                   	int3
1000c967:	cc                   	int3
1000c968:	cc                   	int3
1000c969:	cc                   	int3
1000c96a:	cc                   	int3
1000c96b:	cc                   	int3
1000c96c:	cc                   	int3
1000c96d:	cc                   	int3
1000c96e:	cc                   	int3
1000c96f:	cc                   	int3


===== VA 0x1000c970 | ??4AIEBinaryLinkPrivate@@QAEAAV0@ABV0@@Z | span 0x60 =====
Disassembly of section .text:

1000c970 <.text+0xb970>:
1000c970:	55                   	push   ebp
1000c971:	8b ec                	mov    ebp,esp
1000c973:	56                   	push   esi
1000c974:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
1000c977:	57                   	push   edi
1000c978:	8b f9                	mov    edi,ecx
1000c97a:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
1000c97d:	89 47 04             	mov    DWORD PTR [edi+0x4],eax
1000c980:	8d 4f 08             	lea    ecx,[edi+0x8]
1000c983:	8d 46 08             	lea    eax,[esi+0x8]
1000c986:	50                   	push   eax
1000c987:	e8 b4 54 00 00       	call   0x10011e40
1000c98c:	8d 46 0c             	lea    eax,[esi+0xc]
1000c98f:	50                   	push   eax
1000c990:	8d 4f 0c             	lea    ecx,[edi+0xc]
1000c993:	e8 a8 54 00 00       	call   0x10011e40
1000c998:	8d 46 10             	lea    eax,[esi+0x10]
1000c99b:	50                   	push   eax
1000c99c:	8d 4f 10             	lea    ecx,[edi+0x10]
1000c99f:	e8 fc de ff ff       	call   0x1000a8a0
1000c9a4:	8b 46 1c             	mov    eax,DWORD PTR [esi+0x1c]
1000c9a7:	89 47 1c             	mov    DWORD PTR [edi+0x1c],eax
1000c9aa:	8b 46 20             	mov    eax,DWORD PTR [esi+0x20]
1000c9ad:	89 47 20             	mov    DWORD PTR [edi+0x20],eax
1000c9b0:	8b 46 24             	mov    eax,DWORD PTR [esi+0x24]
1000c9b3:	89 47 24             	mov    DWORD PTR [edi+0x24],eax
1000c9b6:	8b 46 28             	mov    eax,DWORD PTR [esi+0x28]
1000c9b9:	89 47 28             	mov    DWORD PTR [edi+0x28],eax
1000c9bc:	8b 46 2c             	mov    eax,DWORD PTR [esi+0x2c]
1000c9bf:	89 47 2c             	mov    DWORD PTR [edi+0x2c],eax
1000c9c2:	8b c7                	mov    eax,edi
1000c9c4:	5f                   	pop    edi
1000c9c5:	5e                   	pop    esi
1000c9c6:	5d                   	pop    ebp
1000c9c7:	c2 04 00             	ret    0x4
1000c9ca:	cc                   	int3
1000c9cb:	cc                   	int3
1000c9cc:	cc                   	int3
1000c9cd:	cc                   	int3
1000c9ce:	cc                   	int3
1000c9cf:	cc                   	int3


===== VA 0x1000c9d0 | ??4AIElementPrivate@@QAEAAV0@ABV0@@Z | span 0x220 =====
Disassembly of section .text:

1000c9d0 <.text+0xb9d0>:
1000c9d0:	55                   	push   ebp
1000c9d1:	8b ec                	mov    ebp,esp
1000c9d3:	56                   	push   esi
1000c9d4:	57                   	push   edi
1000c9d5:	8b 7d 08             	mov    edi,DWORD PTR [ebp+0x8]
1000c9d8:	8b f1                	mov    esi,ecx
1000c9da:	8b 47 04             	mov    eax,DWORD PTR [edi+0x4]
1000c9dd:	8d 4e 08             	lea    ecx,[esi+0x8]
1000c9e0:	89 46 04             	mov    DWORD PTR [esi+0x4],eax
1000c9e3:	8d 47 08             	lea    eax,[edi+0x8]
1000c9e6:	50                   	push   eax
1000c9e7:	e8 54 54 00 00       	call   0x10011e40
1000c9ec:	8d 47 0c             	lea    eax,[edi+0xc]
1000c9ef:	50                   	push   eax
1000c9f0:	8d 4e 0c             	lea    ecx,[esi+0xc]
1000c9f3:	e8 48 54 00 00       	call   0x10011e40
1000c9f8:	8d 47 10             	lea    eax,[edi+0x10]
1000c9fb:	50                   	push   eax
1000c9fc:	8d 4e 10             	lea    ecx,[esi+0x10]
1000c9ff:	e8 9c de ff ff       	call   0x1000a8a0
1000ca04:	8a 47 1c             	mov    al,BYTE PTR [edi+0x1c]
1000ca07:	8d 4e 20             	lea    ecx,[esi+0x20]
1000ca0a:	88 46 1c             	mov    BYTE PTR [esi+0x1c],al
1000ca0d:	8d 47 20             	lea    eax,[edi+0x20]
1000ca10:	3b c8                	cmp    ecx,eax
1000ca12:	74 0a                	je     0x1000ca1e
1000ca14:	6a ff                	push   0xffffffff
1000ca16:	6a 00                	push   0x0
1000ca18:	50                   	push   eax
1000ca19:	e8 72 04 00 00       	call   0x1000ce90
1000ca1e:	8b 47 38             	mov    eax,DWORD PTR [edi+0x38]
1000ca21:	89 46 38             	mov    DWORD PTR [esi+0x38],eax
1000ca24:	8b 47 3c             	mov    eax,DWORD PTR [edi+0x3c]
1000ca27:	89 46 3c             	mov    DWORD PTR [esi+0x3c],eax
1000ca2a:	8b c6                	mov    eax,esi
1000ca2c:	5f                   	pop    edi
1000ca2d:	5e                   	pop    esi
1000ca2e:	5d                   	pop    ebp
1000ca2f:	c2 04 00             	ret    0x4
1000ca32:	cc                   	int3
1000ca33:	cc                   	int3
1000ca34:	cc                   	int3
1000ca35:	cc                   	int3
1000ca36:	cc                   	int3
1000ca37:	cc                   	int3
1000ca38:	cc                   	int3
1000ca39:	cc                   	int3
1000ca3a:	cc                   	int3
1000ca3b:	cc                   	int3
1000ca3c:	cc                   	int3
1000ca3d:	cc                   	int3
1000ca3e:	cc                   	int3
1000ca3f:	cc                   	int3
1000ca40:	8b c1                	mov    eax,ecx
1000ca42:	c2 04 00             	ret    0x4
1000ca45:	cc                   	int3
1000ca46:	cc                   	int3
1000ca47:	cc                   	int3
1000ca48:	cc                   	int3
1000ca49:	cc                   	int3
1000ca4a:	cc                   	int3
1000ca4b:	cc                   	int3
1000ca4c:	cc                   	int3
1000ca4d:	cc                   	int3
1000ca4e:	cc                   	int3
1000ca4f:	cc                   	int3
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
1000cb00:	55                   	push   ebp
1000cb01:	8b ec                	mov    ebp,esp
1000cb03:	6a ff                	push   0xffffffff
1000cb05:	68 30 66 01 10       	push   0x10016630
1000cb0a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000cb10:	50                   	push   eax
1000cb11:	53                   	push   ebx
1000cb12:	56                   	push   esi
1000cb13:	57                   	push   edi
1000cb14:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000cb19:	33 c5                	xor    eax,ebp
1000cb1b:	50                   	push   eax
1000cb1c:	8d 45 f4             	lea    eax,[ebp-0xc]
1000cb1f:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000cb25:	8b f1                	mov    esi,ecx
1000cb27:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
1000cb2a:	f6 c3 02             	test   bl,0x2
1000cb2d:	74 43                	je     0x1000cb72
1000cb2f:	68 50 40 00 10       	push   0x10004050
1000cb34:	ff 76 fc             	push   DWORD PTR [esi-0x4]
1000cb37:	8d 7e fc             	lea    edi,[esi-0x4]
1000cb3a:	6a 30                	push   0x30
1000cb3c:	56                   	push   esi
1000cb3d:	e8 c7 80 00 00       	call   0x10014c09
1000cb42:	f6 c3 01             	test   bl,0x1
1000cb45:	74 15                	je     0x1000cb5c
1000cb47:	8b 0f                	mov    ecx,DWORD PTR [edi]
1000cb49:	8d 0c 49             	lea    ecx,[ecx+ecx*2]
1000cb4c:	c1 e1 04             	shl    ecx,0x4
1000cb4f:	83 c1 04             	add    ecx,0x4
1000cb52:	51                   	push   ecx
1000cb53:	57                   	push   edi
1000cb54:	e8 e6 81 00 00       	call   0x10014d3f
1000cb59:	83 c4 08             	add    esp,0x8
1000cb5c:	8b c7                	mov    eax,edi
1000cb5e:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000cb61:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000cb68:	59                   	pop    ecx
1000cb69:	5f                   	pop    edi
1000cb6a:	5e                   	pop    esi
1000cb6b:	5b                   	pop    ebx
1000cb6c:	8b e5                	mov    esp,ebp
1000cb6e:	5d                   	pop    ebp
1000cb6f:	c2 04 00             	ret    0x4
1000cb72:	c7 06 dc 71 01 10    	mov    DWORD PTR [esi],0x100171dc
1000cb78:	8b 4e 10             	mov    ecx,DWORD PTR [esi+0x10]
1000cb7b:	85 c9                	test   ecx,ecx
1000cb7d:	74 29                	je     0x1000cba8
1000cb7f:	8b 46 18             	mov    eax,DWORD PTR [esi+0x18]
1000cb82:	2b c1                	sub    eax,ecx
1000cb84:	6a 04                	push   0x4
1000cb86:	c1 f8 02             	sar    eax,0x2
1000cb89:	50                   	push   eax
1000cb8a:	51                   	push   ecx
1000cb8b:	e8 f0 50 ff ff       	call   0x10001c80
1000cb90:	c7 46 10 00 00 00 00 	mov    DWORD PTR [esi+0x10],0x0
1000cb97:	83 c4 0c             	add    esp,0xc
1000cb9a:	c7 46 14 00 00 00 00 	mov    DWORD PTR [esi+0x14],0x0
1000cba1:	c7 46 18 00 00 00 00 	mov    DWORD PTR [esi+0x18],0x0
1000cba8:	8d 4e 0c             	lea    ecx,[esi+0xc]
1000cbab:	e8 30 52 00 00       	call   0x10011de0
1000cbb0:	8d 4e 08             	lea    ecx,[esi+0x8]
1000cbb3:	e8 28 52 00 00       	call   0x10011de0
1000cbb8:	f6 c3 01             	test   bl,0x1
1000cbbb:	74 0b                	je     0x1000cbc8
1000cbbd:	6a 30                	push   0x30
1000cbbf:	56                   	push   esi
1000cbc0:	e8 63 81 00 00       	call   0x10014d28
1000cbc5:	83 c4 08             	add    esp,0x8
1000cbc8:	8b c6                	mov    eax,esi
1000cbca:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000cbcd:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000cbd4:	59                   	pop    ecx
1000cbd5:	5f                   	pop    edi
1000cbd6:	5e                   	pop    esi
1000cbd7:	5b                   	pop    ebx
1000cbd8:	8b e5                	mov    esp,ebp
1000cbda:	5d                   	pop    ebp
1000cbdb:	c2 04 00             	ret    0x4
1000cbde:	cc                   	int3
1000cbdf:	cc                   	int3
1000cbe0:	55                   	push   ebp
1000cbe1:	8b ec                	mov    ebp,esp
1000cbe3:	6a ff                	push   0xffffffff
1000cbe5:	68 30 66 01 10       	push   0x10016630
1000cbea:	64 a1 00 00 00 00    	mov    eax,fs:0x0


===== VA 0x1000d1c0 | ??0AIElement@@IAE@PAVAIElementPrivate@@@Z | span 0x220 =====
Disassembly of section .text:

1000d1c0 <.text+0xc1c0>:
1000d1c0:	55                   	push   ebp
1000d1c1:	8b ec                	mov    ebp,esp
1000d1c3:	51                   	push   ecx
1000d1c4:	56                   	push   esi
1000d1c5:	ff 75 08             	push   DWORD PTR [ebp+0x8]
1000d1c8:	8b f1                	mov    esi,ecx
1000d1ca:	89 75 fc             	mov    DWORD PTR [ebp-0x4],esi
1000d1cd:	e8 be 64 ff ff       	call   0x10003690
1000d1d2:	c7 06 40 73 01 10    	mov    DWORD PTR [esi],0x10017340
1000d1d8:	8b c6                	mov    eax,esi
1000d1da:	5e                   	pop    esi
1000d1db:	8b e5                	mov    esp,ebp
1000d1dd:	5d                   	pop    ebp
1000d1de:	c2 04 00             	ret    0x4
1000d1e1:	cc                   	int3
1000d1e2:	cc                   	int3
1000d1e3:	cc                   	int3
1000d1e4:	cc                   	int3
1000d1e5:	cc                   	int3
1000d1e6:	cc                   	int3
1000d1e7:	cc                   	int3
1000d1e8:	cc                   	int3
1000d1e9:	cc                   	int3
1000d1ea:	cc                   	int3
1000d1eb:	cc                   	int3
1000d1ec:	cc                   	int3
1000d1ed:	cc                   	int3
1000d1ee:	cc                   	int3
1000d1ef:	cc                   	int3
1000d1f0:	55                   	push   ebp
1000d1f1:	8b ec                	mov    ebp,esp
1000d1f3:	51                   	push   ecx
1000d1f4:	56                   	push   esi
1000d1f5:	8b f1                	mov    esi,ecx
1000d1f7:	89 75 fc             	mov    DWORD PTR [ebp-0x4],esi
1000d1fa:	e8 b1 64 ff ff       	call   0x100036b0
1000d1ff:	c7 06 40 73 01 10    	mov    DWORD PTR [esi],0x10017340
1000d205:	8b c6                	mov    eax,esi
1000d207:	5e                   	pop    esi
1000d208:	8b e5                	mov    esp,ebp
1000d20a:	5d                   	pop    ebp
1000d20b:	c2 04 00             	ret    0x4
1000d20e:	cc                   	int3
1000d20f:	cc                   	int3
1000d210:	55                   	push   ebp
1000d211:	8b ec                	mov    ebp,esp
1000d213:	6a ff                	push   0xffffffff
1000d215:	68 0f 66 01 10       	push   0x1001660f
1000d21a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000d220:	50                   	push   eax
1000d221:	51                   	push   ecx
1000d222:	56                   	push   esi
1000d223:	57                   	push   edi
1000d224:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000d229:	33 c5                	xor    eax,ebp
1000d22b:	50                   	push   eax
1000d22c:	8d 45 f4             	lea    eax,[ebp-0xc]
1000d22f:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000d235:	8b f1                	mov    esi,ecx
1000d237:	89 75 f0             	mov    DWORD PTR [ebp-0x10],esi
1000d23a:	6a 40                	push   0x40
1000d23c:	e8 af 7a 00 00       	call   0x10014cf0
1000d241:	8b f8                	mov    edi,eax
1000d243:	83 c4 04             	add    esp,0x4
1000d246:	89 7d f0             	mov    DWORD PTR [ebp-0x10],edi
1000d249:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000d250:	85 ff                	test   edi,edi
1000d252:	74 16                	je     0x1000d26a
1000d254:	6a 40                	push   0x40
1000d256:	6a 00                	push   0x0
1000d258:	57                   	push   edi
1000d259:	e8 56 88 00 00       	call   0x10015ab4
1000d25e:	83 c4 0c             	add    esp,0xc
1000d261:	8b cf                	mov    ecx,edi
1000d263:	e8 c8 f5 ff ff       	call   0x1000c830
1000d268:	eb 02                	jmp    0x1000d26c
1000d26a:	33 c0                	xor    eax,eax
1000d26c:	50                   	push   eax
1000d26d:	8b ce                	mov    ecx,esi
1000d26f:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
1000d276:	e8 15 64 ff ff       	call   0x10003690
1000d27b:	c7 06 40 73 01 10    	mov    DWORD PTR [esi],0x10017340
1000d281:	8b c6                	mov    eax,esi
1000d283:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000d286:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000d28d:	59                   	pop    ecx
1000d28e:	5f                   	pop    edi
1000d28f:	5e                   	pop    esi
1000d290:	8b e5                	mov    esp,ebp
1000d292:	5d                   	pop    ebp
1000d293:	c3                   	ret
1000d294:	cc                   	int3
1000d295:	cc                   	int3
1000d296:	cc                   	int3
1000d297:	cc                   	int3
1000d298:	cc                   	int3
1000d299:	cc                   	int3
1000d29a:	cc                   	int3
1000d29b:	cc                   	int3
1000d29c:	cc                   	int3
1000d29d:	cc                   	int3
1000d29e:	cc                   	int3
1000d29f:	cc                   	int3
1000d2a0:	c7 01 40 73 01 10    	mov    DWORD PTR [ecx],0x10017340
1000d2a6:	e9 35 65 ff ff       	jmp    0x100037e0
1000d2ab:	cc                   	int3
1000d2ac:	cc                   	int3
1000d2ad:	cc                   	int3
1000d2ae:	cc                   	int3
1000d2af:	cc                   	int3
1000d2b0:	55                   	push   ebp
1000d2b1:	8b ec                	mov    ebp,esp
1000d2b3:	6a ff                	push   0xffffffff
1000d2b5:	68 30 66 01 10       	push   0x10016630
1000d2ba:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000d2c0:	50                   	push   eax
1000d2c1:	53                   	push   ebx
1000d2c2:	56                   	push   esi
1000d2c3:	57                   	push   edi
1000d2c4:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000d2c9:	33 c5                	xor    eax,ebp
1000d2cb:	50                   	push   eax
1000d2cc:	8d 45 f4             	lea    eax,[ebp-0xc]
1000d2cf:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000d2d5:	8b f1                	mov    esi,ecx
1000d2d7:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
1000d2da:	f6 c3 02             	test   bl,0x2
1000d2dd:	74 41                	je     0x1000d320
1000d2df:	68 a0 d2 00 10       	push   0x1000d2a0
1000d2e4:	ff 76 fc             	push   DWORD PTR [esi-0x4]
1000d2e7:	8d 7e fc             	lea    edi,[esi-0x4]
1000d2ea:	6a 08                	push   0x8
1000d2ec:	56                   	push   esi
1000d2ed:	e8 17 79 00 00       	call   0x10014c09
1000d2f2:	f6 c3 01             	test   bl,0x1
1000d2f5:	74 13                	je     0x1000d30a
1000d2f7:	8b 0f                	mov    ecx,DWORD PTR [edi]
1000d2f9:	8d 0c cd 04 00 00 00 	lea    ecx,[ecx*8+0x4]
1000d300:	51                   	push   ecx
1000d301:	57                   	push   edi
1000d302:	e8 38 7a 00 00       	call   0x10014d3f
1000d307:	83 c4 08             	add    esp,0x8
1000d30a:	8b c7                	mov    eax,edi
1000d30c:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000d30f:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000d316:	59                   	pop    ecx
1000d317:	5f                   	pop    edi
1000d318:	5e                   	pop    esi
1000d319:	5b                   	pop    ebx
1000d31a:	8b e5                	mov    esp,ebp
1000d31c:	5d                   	pop    ebp
1000d31d:	c2 04 00             	ret    0x4
1000d320:	c7 06 40 73 01 10    	mov    DWORD PTR [esi],0x10017340
1000d326:	e8 b5 64 ff ff       	call   0x100037e0
1000d32b:	f6 c3 01             	test   bl,0x1
1000d32e:	74 0b                	je     0x1000d33b
1000d330:	6a 08                	push   0x8
1000d332:	56                   	push   esi
1000d333:	e8 f0 79 00 00       	call   0x10014d28
1000d338:	83 c4 08             	add    esp,0x8
1000d33b:	8b c6                	mov    eax,esi
1000d33d:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000d340:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000d347:	59                   	pop    ecx
1000d348:	5f                   	pop    edi
1000d349:	5e                   	pop    esi
1000d34a:	5b                   	pop    ebx
1000d34b:	8b e5                	mov    esp,ebp
1000d34d:	5d                   	pop    ebp
1000d34e:	c2 04 00             	ret    0x4
1000d351:	cc                   	int3
1000d352:	cc                   	int3
1000d353:	cc                   	int3
1000d354:	cc                   	int3
1000d355:	cc                   	int3
1000d356:	cc                   	int3
1000d357:	cc                   	int3
1000d358:	cc                   	int3
1000d359:	cc                   	int3
1000d35a:	cc                   	int3
1000d35b:	cc                   	int3
1000d35c:	cc                   	int3
1000d35d:	cc                   	int3
1000d35e:	cc                   	int3
1000d35f:	cc                   	int3
1000d360:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
1000d363:	8b 40 3c             	mov    eax,DWORD PTR [eax+0x3c]
1000d366:	c3                   	ret
1000d367:	cc                   	int3
1000d368:	cc                   	int3
1000d369:	cc                   	int3
1000d36a:	cc                   	int3
1000d36b:	cc                   	int3
1000d36c:	cc                   	int3
1000d36d:	cc                   	int3
1000d36e:	cc                   	int3
1000d36f:	cc                   	int3
1000d370:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
1000d373:	8a 40 1c             	mov    al,BYTE PTR [eax+0x1c]
1000d376:	c3                   	ret
1000d377:	cc                   	int3
1000d378:	cc                   	int3
1000d379:	cc                   	int3
1000d37a:	cc                   	int3
1000d37b:	cc                   	int3
1000d37c:	cc                   	int3
1000d37d:	cc                   	int3
1000d37e:	cc                   	int3
1000d37f:	cc                   	int3
1000d380:	55                   	push   ebp
1000d381:	8b ec                	mov    ebp,esp
1000d383:	6a ff                	push   0xffffffff
1000d385:	68 78 6f 01 10       	push   0x10016f78
1000d38a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000d390:	50                   	push   eax
1000d391:	51                   	push   ecx
1000d392:	56                   	push   esi
1000d393:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000d398:	33 c5                	xor    eax,ebp
1000d39a:	50                   	push   eax
1000d39b:	8d 45 f4             	lea    eax,[ebp-0xc]
1000d39e:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000d3a4:	8b f1                	mov    esi,ecx
1000d3a6:	51                   	push   ecx
1000d3a7:	8d 45 08             	lea    eax,[ebp+0x8]
1000d3aa:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000d3b1:	8b cc                	mov    ecx,esp
1000d3b3:	50                   	push   eax
1000d3b4:	e8 a7 48 00 00       	call   0x10011c60
1000d3b9:	8b ce                	mov    ecx,esi
1000d3bb:	e8 90 69 ff ff       	call   0x10003d50
1000d3c0:	8d 4d 08             	lea    ecx,[ebp+0x8]
1000d3c3:	e8 18 4a 00 00       	call   0x10011de0
1000d3c8:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000d3cb:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000d3d2:	59                   	pop    ecx
1000d3d3:	5e                   	pop    esi
1000d3d4:	8b e5                	mov    esp,ebp
1000d3d6:	5d                   	pop    ebp
1000d3d7:	c2 04 00             	ret    0x4
1000d3da:	cc                   	int3
1000d3db:	cc                   	int3
1000d3dc:	cc                   	int3
1000d3dd:	cc                   	int3
1000d3de:	cc                   	int3
1000d3df:	cc                   	int3


===== VA 0x1000d6c0 | ??0AIStructure@@IAE@PAVAIStructurePrivate@@@Z | span 0xb0 =====
Disassembly of section .text:

1000d6c0 <.text+0xc6c0>:
1000d6c0:	55                   	push   ebp
1000d6c1:	8b ec                	mov    ebp,esp
1000d6c3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000d6c6:	89 41 04             	mov    DWORD PTR [ecx+0x4],eax
1000d6c9:	8b c1                	mov    eax,ecx
1000d6cb:	c7 01 fc 70 01 10    	mov    DWORD PTR [ecx],0x100170fc
1000d6d1:	5d                   	pop    ebp
1000d6d2:	c2 04 00             	ret    0x4
1000d6d5:	cc                   	int3
1000d6d6:	cc                   	int3
1000d6d7:	cc                   	int3
1000d6d8:	cc                   	int3
1000d6d9:	cc                   	int3
1000d6da:	cc                   	int3
1000d6db:	cc                   	int3
1000d6dc:	cc                   	int3
1000d6dd:	cc                   	int3
1000d6de:	cc                   	int3
1000d6df:	cc                   	int3
1000d6e0:	55                   	push   ebp
1000d6e1:	8b ec                	mov    ebp,esp
1000d6e3:	6a ff                	push   0xffffffff
1000d6e5:	68 4f 68 01 10       	push   0x1001684f
1000d6ea:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000d6f0:	50                   	push   eax
1000d6f1:	51                   	push   ecx
1000d6f2:	56                   	push   esi
1000d6f3:	57                   	push   edi
1000d6f4:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000d6f9:	33 c5                	xor    eax,ebp
1000d6fb:	50                   	push   eax
1000d6fc:	8d 45 f4             	lea    eax,[ebp-0xc]
1000d6ff:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000d705:	8b f1                	mov    esi,ecx
1000d707:	6a 2c                	push   0x2c
1000d709:	c7 06 fc 70 01 10    	mov    DWORD PTR [esi],0x100170fc
1000d70f:	e8 dc 75 00 00       	call   0x10014cf0
1000d714:	8b f8                	mov    edi,eax
1000d716:	83 c4 04             	add    esp,0x4
1000d719:	89 7d f0             	mov    DWORD PTR [ebp-0x10],edi
1000d71c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000d723:	85 ff                	test   edi,edi
1000d725:	74 2a                	je     0x1000d751
1000d727:	6a 2c                	push   0x2c
1000d729:	6a 00                	push   0x0
1000d72b:	57                   	push   edi
1000d72c:	e8 83 83 00 00       	call   0x10015ab4
1000d731:	83 c4 0c             	add    esp,0xc
1000d734:	8b cf                	mov    ecx,edi
1000d736:	e8 c5 00 00 00       	call   0x1000d800
1000d73b:	89 46 04             	mov    DWORD PTR [esi+0x4],eax
1000d73e:	8b c6                	mov    eax,esi
1000d740:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000d743:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000d74a:	59                   	pop    ecx
1000d74b:	5f                   	pop    edi
1000d74c:	5e                   	pop    esi
1000d74d:	8b e5                	mov    esp,ebp
1000d74f:	5d                   	pop    ebp
1000d750:	c3                   	ret
1000d751:	c7 46 04 00 00 00 00 	mov    DWORD PTR [esi+0x4],0x0
1000d758:	8b c6                	mov    eax,esi
1000d75a:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000d75d:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000d764:	59                   	pop    ecx
1000d765:	5f                   	pop    edi
1000d766:	5e                   	pop    esi
1000d767:	8b e5                	mov    esp,ebp
1000d769:	5d                   	pop    ebp
1000d76a:	c3                   	ret
1000d76b:	cc                   	int3
1000d76c:	cc                   	int3
1000d76d:	cc                   	int3
1000d76e:	cc                   	int3
1000d76f:	cc                   	int3


===== VA 0x1000d770 | ??0AIStructurePrivate@@QAE@ABV0@@Z | span 0x90 =====
Disassembly of section .text:

1000d770 <.text+0xc770>:
1000d770:	55                   	push   ebp
1000d771:	8b ec                	mov    ebp,esp
1000d773:	6a ff                	push   0xffffffff
1000d775:	68 96 6c 01 10       	push   0x10016c96
1000d77a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000d780:	50                   	push   eax
1000d781:	51                   	push   ecx
1000d782:	56                   	push   esi
1000d783:	57                   	push   edi
1000d784:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000d789:	33 c5                	xor    eax,ebp
1000d78b:	50                   	push   eax
1000d78c:	8d 45 f4             	lea    eax,[ebp-0xc]
1000d78f:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000d795:	8b f9                	mov    edi,ecx
1000d797:	89 7d f0             	mov    DWORD PTR [ebp-0x10],edi
1000d79a:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
1000d79d:	8d 55 0b             	lea    edx,[ebp+0xb]
1000d7a0:	52                   	push   edx
1000d7a1:	8d 4f 04             	lea    ecx,[edi+0x4]
1000d7a4:	c7 07 60 73 01 10    	mov    DWORD PTR [edi],0x10017360
1000d7aa:	89 4d 08             	mov    DWORD PTR [ebp+0x8],ecx
1000d7ad:	8d 46 04             	lea    eax,[esi+0x4]
1000d7b0:	50                   	push   eax
1000d7b1:	e8 2a fc ff ff       	call   0x1000d3e0
1000d7b6:	8b 46 0c             	mov    eax,DWORD PTR [esi+0xc]
1000d7b9:	8d 4f 14             	lea    ecx,[edi+0x14]
1000d7bc:	89 47 0c             	mov    DWORD PTR [edi+0xc],eax
1000d7bf:	8b 46 10             	mov    eax,DWORD PTR [esi+0x10]
1000d7c2:	89 47 10             	mov    DWORD PTR [edi+0x10],eax
1000d7c5:	8d 46 14             	lea    eax,[esi+0x14]
1000d7c8:	50                   	push   eax
1000d7c9:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000d7d0:	e8 2b 3a ff ff       	call   0x10001200
1000d7d5:	8d 46 20             	lea    eax,[esi+0x20]
1000d7d8:	c6 45 fc 01          	mov    BYTE PTR [ebp-0x4],0x1
1000d7dc:	50                   	push   eax
1000d7dd:	8d 4f 20             	lea    ecx,[edi+0x20]
1000d7e0:	e8 1b 3a ff ff       	call   0x10001200
1000d7e5:	8b c7                	mov    eax,edi
1000d7e7:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000d7ea:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000d7f1:	59                   	pop    ecx
1000d7f2:	5f                   	pop    edi
1000d7f3:	5e                   	pop    esi
1000d7f4:	8b e5                	mov    esp,ebp
1000d7f6:	5d                   	pop    ebp
1000d7f7:	c2 04 00             	ret    0x4
1000d7fa:	cc                   	int3
1000d7fb:	cc                   	int3
1000d7fc:	cc                   	int3
1000d7fd:	cc                   	int3
1000d7fe:	cc                   	int3
1000d7ff:	cc                   	int3


===== VA 0x1000d800 | ??0AIStructurePrivate@@QAE@XZ | span 0x170 =====
Disassembly of section .text:

1000d800 <.text+0xc800>:
1000d800:	55                   	push   ebp
1000d801:	8b ec                	mov    ebp,esp
1000d803:	51                   	push   ecx
1000d804:	56                   	push   esi
1000d805:	57                   	push   edi
1000d806:	8b f9                	mov    edi,ecx
1000d808:	8d 77 04             	lea    esi,[edi+0x4]
1000d80b:	89 7d fc             	mov    DWORD PTR [ebp-0x4],edi
1000d80e:	8b ce                	mov    ecx,esi
1000d810:	89 75 fc             	mov    DWORD PTR [ebp-0x4],esi
1000d813:	c7 07 60 73 01 10    	mov    DWORD PTR [edi],0x10017360
1000d819:	c7 06 00 00 00 00    	mov    DWORD PTR [esi],0x0
1000d81f:	c7 46 04 00 00 00 00 	mov    DWORD PTR [esi+0x4],0x0
1000d826:	e8 c5 03 00 00       	call   0x1000dbf0
1000d82b:	89 06                	mov    DWORD PTR [esi],eax
1000d82d:	8b c7                	mov    eax,edi
1000d82f:	c7 47 0c 00 00 00 00 	mov    DWORD PTR [edi+0xc],0x0
1000d836:	c7 47 10 00 00 00 00 	mov    DWORD PTR [edi+0x10],0x0
1000d83d:	c7 47 14 00 00 00 00 	mov    DWORD PTR [edi+0x14],0x0
1000d844:	c7 47 18 00 00 00 00 	mov    DWORD PTR [edi+0x18],0x0
1000d84b:	c7 47 1c 00 00 00 00 	mov    DWORD PTR [edi+0x1c],0x0
1000d852:	c7 47 20 00 00 00 00 	mov    DWORD PTR [edi+0x20],0x0
1000d859:	c7 47 24 00 00 00 00 	mov    DWORD PTR [edi+0x24],0x0
1000d860:	c7 47 28 00 00 00 00 	mov    DWORD PTR [edi+0x28],0x0
1000d867:	5f                   	pop    edi
1000d868:	5e                   	pop    esi
1000d869:	8b e5                	mov    esp,ebp
1000d86b:	5d                   	pop    ebp
1000d86c:	c3                   	ret
1000d86d:	cc                   	int3
1000d86e:	cc                   	int3
1000d86f:	cc                   	int3
1000d870:	6a 1c                	push   0x1c
1000d872:	6a 01                	push   0x1
1000d874:	ff 31                	push   DWORD PTR [ecx]
1000d876:	e8 05 44 ff ff       	call   0x10001c80
1000d87b:	83 c4 0c             	add    esp,0xc
1000d87e:	c3                   	ret
1000d87f:	cc                   	int3
1000d880:	55                   	push   ebp
1000d881:	8b ec                	mov    ebp,esp
1000d883:	6a ff                	push   0xffffffff
1000d885:	68 d6 66 01 10       	push   0x100166d6
1000d88a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000d890:	50                   	push   eax
1000d891:	51                   	push   ecx
1000d892:	56                   	push   esi
1000d893:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000d898:	33 c5                	xor    eax,ebp
1000d89a:	50                   	push   eax
1000d89b:	8d 45 f4             	lea    eax,[ebp-0xc]
1000d89e:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000d8a4:	8b f1                	mov    esi,ecx
1000d8a6:	8b 06                	mov    eax,DWORD PTR [esi]
1000d8a8:	50                   	push   eax
1000d8a9:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000d8b0:	ff 30                	push   DWORD PTR [eax]
1000d8b2:	8d 45 f0             	lea    eax,[ebp-0x10]
1000d8b5:	50                   	push   eax
1000d8b6:	e8 75 06 00 00       	call   0x1000df30
1000d8bb:	6a 1c                	push   0x1c
1000d8bd:	6a 01                	push   0x1
1000d8bf:	ff 36                	push   DWORD PTR [esi]
1000d8c1:	e8 ba 43 ff ff       	call   0x10001c80
1000d8c6:	83 c4 0c             	add    esp,0xc
1000d8c9:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000d8cc:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000d8d3:	59                   	pop    ecx
1000d8d4:	5e                   	pop    esi
1000d8d5:	8b e5                	mov    esp,ebp
1000d8d7:	5d                   	pop    ebp
1000d8d8:	c3                   	ret
1000d8d9:	cc                   	int3
1000d8da:	cc                   	int3
1000d8db:	cc                   	int3
1000d8dc:	cc                   	int3
1000d8dd:	cc                   	int3
1000d8de:	cc                   	int3
1000d8df:	cc                   	int3
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
1000d96a:	cc                   	int3
1000d96b:	cc                   	int3
1000d96c:	cc                   	int3
1000d96d:	cc                   	int3
1000d96e:	cc                   	int3
1000d96f:	cc                   	int3


===== VA 0x1000d970 | ??1AIStructurePrivate@@UAE@XZ | span 0xd0 =====
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
1000da30:	8b e5                	mov    esp,ebp
1000da32:	5d                   	pop    ebp
1000da33:	c3                   	ret
1000da34:	cc                   	int3
1000da35:	cc                   	int3
1000da36:	cc                   	int3
1000da37:	cc                   	int3
1000da38:	cc                   	int3
1000da39:	cc                   	int3
1000da3a:	cc                   	int3
1000da3b:	cc                   	int3
1000da3c:	cc                   	int3
1000da3d:	cc                   	int3
1000da3e:	cc                   	int3
1000da3f:	cc                   	int3


===== VA 0x1000da40 | ??4AIStructurePrivate@@QAEAAV0@ABV0@@Z | span 0x220 =====
Disassembly of section .text:

1000da40 <.text+0xca40>:
1000da40:	55                   	push   ebp
1000da41:	8b ec                	mov    ebp,esp
1000da43:	6a ff                	push   0xffffffff
1000da45:	68 06 67 01 10       	push   0x10016706
1000da4a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000da50:	50                   	push   eax
1000da51:	53                   	push   ebx
1000da52:	56                   	push   esi
1000da53:	57                   	push   edi
1000da54:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000da59:	33 c5                	xor    eax,ebp
1000da5b:	50                   	push   eax
1000da5c:	8d 45 f4             	lea    eax,[ebp-0xc]
1000da5f:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000da65:	8b f1                	mov    esi,ecx
1000da67:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
1000da6a:	8d 7e 04             	lea    edi,[esi+0x4]
1000da6d:	8d 43 04             	lea    eax,[ebx+0x4]
1000da70:	3b f8                	cmp    edi,eax
1000da72:	74 3d                	je     0x1000dab1
1000da74:	8b 07                	mov    eax,DWORD PTR [edi]
1000da76:	8b cf                	mov    ecx,edi
1000da78:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000da7f:	ff 70 04             	push   DWORD PTR [eax+0x4]
1000da82:	e8 29 02 00 00       	call   0x1000dcb0
1000da87:	8b 07                	mov    eax,DWORD PTR [edi]
1000da89:	8b cf                	mov    ecx,edi
1000da8b:	ff 75 08             	push   DWORD PTR [ebp+0x8]
1000da8e:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
1000da95:	89 40 04             	mov    DWORD PTR [eax+0x4],eax
1000da98:	8b 07                	mov    eax,DWORD PTR [edi]
1000da9a:	89 00                	mov    DWORD PTR [eax],eax
1000da9c:	8b 07                	mov    eax,DWORD PTR [edi]
1000da9e:	89 40 08             	mov    DWORD PTR [eax+0x8],eax
1000daa1:	8d 43 04             	lea    eax,[ebx+0x4]
1000daa4:	50                   	push   eax
1000daa5:	c7 47 04 00 00 00 00 	mov    DWORD PTR [edi+0x4],0x0
1000daac:	e8 5f fa ff ff       	call   0x1000d510
1000dab1:	8b 43 0c             	mov    eax,DWORD PTR [ebx+0xc]
1000dab4:	8d 4e 14             	lea    ecx,[esi+0x14]
1000dab7:	89 46 0c             	mov    DWORD PTR [esi+0xc],eax
1000daba:	8b 43 10             	mov    eax,DWORD PTR [ebx+0x10]
1000dabd:	89 46 10             	mov    DWORD PTR [esi+0x10],eax
1000dac0:	8d 43 14             	lea    eax,[ebx+0x14]
1000dac3:	50                   	push   eax
1000dac4:	e8 d7 cd ff ff       	call   0x1000a8a0
1000dac9:	8d 43 20             	lea    eax,[ebx+0x20]
1000dacc:	50                   	push   eax
1000dacd:	8d 4e 20             	lea    ecx,[esi+0x20]
1000dad0:	e8 cb cd ff ff       	call   0x1000a8a0
1000dad5:	8b c6                	mov    eax,esi
1000dad7:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000dada:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000dae1:	59                   	pop    ecx
1000dae2:	5f                   	pop    edi
1000dae3:	5e                   	pop    esi
1000dae4:	5b                   	pop    ebx
1000dae5:	8b e5                	mov    esp,ebp
1000dae7:	5d                   	pop    ebp
1000dae8:	c2 04 00             	ret    0x4
1000daeb:	cc                   	int3
1000daec:	cc                   	int3
1000daed:	cc                   	int3
1000daee:	cc                   	int3
1000daef:	cc                   	int3
1000daf0:	55                   	push   ebp
1000daf1:	8b ec                	mov    ebp,esp
1000daf3:	6a ff                	push   0xffffffff
1000daf5:	68 30 66 01 10       	push   0x10016630
1000dafa:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000db00:	50                   	push   eax
1000db01:	53                   	push   ebx
1000db02:	56                   	push   esi
1000db03:	57                   	push   edi
1000db04:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000db09:	33 c5                	xor    eax,ebp
1000db0b:	50                   	push   eax
1000db0c:	8d 45 f4             	lea    eax,[ebp-0xc]
1000db0f:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000db15:	8b f1                	mov    esi,ecx
1000db17:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
1000db1a:	f6 c3 02             	test   bl,0x2
1000db1d:	74 3e                	je     0x1000db5d
1000db1f:	68 70 d9 00 10       	push   0x1000d970
1000db24:	ff 76 fc             	push   DWORD PTR [esi-0x4]
1000db27:	8d 7e fc             	lea    edi,[esi-0x4]
1000db2a:	6a 2c                	push   0x2c
1000db2c:	56                   	push   esi
1000db2d:	e8 d7 70 00 00       	call   0x10014c09
1000db32:	f6 c3 01             	test   bl,0x1
1000db35:	74 10                	je     0x1000db47
1000db37:	6b 0f 2c             	imul   ecx,DWORD PTR [edi],0x2c
1000db3a:	83 c1 04             	add    ecx,0x4
1000db3d:	51                   	push   ecx
1000db3e:	57                   	push   edi
1000db3f:	e8 fb 71 00 00       	call   0x10014d3f
1000db44:	83 c4 08             	add    esp,0x8
1000db47:	8b c7                	mov    eax,edi
1000db49:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000db4c:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000db53:	59                   	pop    ecx
1000db54:	5f                   	pop    edi
1000db55:	5e                   	pop    esi
1000db56:	5b                   	pop    ebx
1000db57:	8b e5                	mov    esp,ebp
1000db59:	5d                   	pop    ebp
1000db5a:	c2 04 00             	ret    0x4
1000db5d:	e8 0e fe ff ff       	call   0x1000d970
1000db62:	f6 c3 01             	test   bl,0x1
1000db65:	74 0b                	je     0x1000db72
1000db67:	6a 2c                	push   0x2c
1000db69:	56                   	push   esi
1000db6a:	e8 b9 71 00 00       	call   0x10014d28
1000db6f:	83 c4 08             	add    esp,0x8
1000db72:	8b c6                	mov    eax,esi
1000db74:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000db77:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000db7e:	59                   	pop    ecx
1000db7f:	5f                   	pop    edi
1000db80:	5e                   	pop    esi
1000db81:	5b                   	pop    ebx
1000db82:	8b e5                	mov    esp,ebp
1000db84:	5d                   	pop    ebp
1000db85:	c2 04 00             	ret    0x4
1000db88:	cc                   	int3
1000db89:	cc                   	int3
1000db8a:	cc                   	int3
1000db8b:	cc                   	int3
1000db8c:	cc                   	int3
1000db8d:	cc                   	int3
1000db8e:	cc                   	int3
1000db8f:	cc                   	int3
1000db90:	55                   	push   ebp
1000db91:	8b ec                	mov    ebp,esp
1000db93:	56                   	push   esi
1000db94:	8b f1                	mov    esi,ecx
1000db96:	57                   	push   edi
1000db97:	8b 7d 08             	mov    edi,DWORD PTR [ebp+0x8]
1000db9a:	c7 06 00 00 00 00    	mov    DWORD PTR [esi],0x0
1000dba0:	c7 46 04 00 00 00 00 	mov    DWORD PTR [esi+0x4],0x0
1000dba7:	c7 46 08 00 00 00 00 	mov    DWORD PTR [esi+0x8],0x0
1000dbae:	85 ff                	test   edi,edi
1000dbb0:	75 08                	jne    0x1000dbba
1000dbb2:	5f                   	pop    edi
1000dbb3:	32 c0                	xor    al,al
1000dbb5:	5e                   	pop    esi
1000dbb6:	5d                   	pop    ebp
1000dbb7:	c2 04 00             	ret    0x4
1000dbba:	81 ff ff ff ff 3f    	cmp    edi,0x3fffffff
1000dbc0:	76 0b                	jbe    0x1000dbcd
1000dbc2:	68 4c 71 01 10       	push   0x1001714c
1000dbc7:	ff 15 34 70 01 10    	call   DWORD PTR ds:0x10017034
1000dbcd:	57                   	push   edi
1000dbce:	e8 2d 4c ff ff       	call   0x10002800
1000dbd3:	89 06                	mov    DWORD PTR [esi],eax
1000dbd5:	89 46 04             	mov    DWORD PTR [esi+0x4],eax
1000dbd8:	8b 06                	mov    eax,DWORD PTR [esi]
1000dbda:	8d 04 b8             	lea    eax,[eax+edi*4]
1000dbdd:	89 46 08             	mov    DWORD PTR [esi+0x8],eax
1000dbe0:	b0 01                	mov    al,0x1
1000dbe2:	5f                   	pop    edi
1000dbe3:	5e                   	pop    esi
1000dbe4:	5d                   	pop    ebp
1000dbe5:	c2 04 00             	ret    0x4
1000dbe8:	cc                   	int3
1000dbe9:	cc                   	int3
1000dbea:	cc                   	int3
1000dbeb:	cc                   	int3
1000dbec:	cc                   	int3
1000dbed:	cc                   	int3
1000dbee:	cc                   	int3
1000dbef:	cc                   	int3
1000dbf0:	6a 1c                	push   0x1c
1000dbf2:	e8 f9 70 00 00       	call   0x10014cf0
1000dbf7:	83 c4 04             	add    esp,0x4
1000dbfa:	85 c0                	test   eax,eax
1000dbfc:	75 06                	jne    0x1000dc04
1000dbfe:	ff 25 b8 70 01 10    	jmp    DWORD PTR ds:0x100170b8
1000dc04:	8d 48 04             	lea    ecx,[eax+0x4]
1000dc07:	89 00                	mov    DWORD PTR [eax],eax
1000dc09:	85 c9                	test   ecx,ecx
1000dc0b:	74 02                	je     0x1000dc0f
1000dc0d:	89 01                	mov    DWORD PTR [ecx],eax
1000dc0f:	8d 48 08             	lea    ecx,[eax+0x8]
1000dc12:	85 c9                	test   ecx,ecx
1000dc14:	74 02                	je     0x1000dc18
1000dc16:	89 01                	mov    DWORD PTR [ecx],eax
1000dc18:	66 c7 40 0c 01 01    	mov    WORD PTR [eax+0xc],0x101
1000dc1e:	c3                   	ret
1000dc1f:	cc                   	int3
1000dc20:	55                   	push   ebp
1000dc21:	8b ec                	mov    ebp,esp
1000dc23:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000dc26:	85 c0                	test   eax,eax
1000dc28:	74 12                	je     0x1000dc3c
1000dc2a:	c7 00 68 73 01 10    	mov    DWORD PTR [eax],0x10017368
1000dc30:	8b 51 04             	mov    edx,DWORD PTR [ecx+0x4]
1000dc33:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
1000dc36:	8b 49 08             	mov    ecx,DWORD PTR [ecx+0x8]
1000dc39:	89 48 08             	mov    DWORD PTR [eax+0x8],ecx
1000dc3c:	5d                   	pop    ebp
1000dc3d:	c2 04 00             	ret    0x4
1000dc40:	55                   	push   ebp
1000dc41:	8b ec                	mov    ebp,esp
1000dc43:	51                   	push   ecx
1000dc44:	53                   	push   ebx
1000dc45:	8b d9                	mov    ebx,ecx
1000dc47:	56                   	push   esi
1000dc48:	57                   	push   edi
1000dc49:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
1000dc4c:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
1000dc4f:	8d 43 08             	lea    eax,[ebx+0x8]
1000dc52:	50                   	push   eax
1000dc53:	8b 72 24             	mov    esi,DWORD PTR [edx+0x24]
1000dc56:	56                   	push   esi
1000dc57:	ff 72 20             	push   DWORD PTR [edx+0x20]
1000dc5a:	e8 81 c7 ff ff       	call   0x1000a3e0
1000dc5f:	8b                   	.byte 0x8b


===== VA 0x1000e530 | ??0ConceptModel@@IAE@PAVConceptModelPrivate@@@Z | span 0x220 =====
Disassembly of section .text:

1000e530 <.text+0xd530>:
1000e530:	55                   	push   ebp
1000e531:	8b ec                	mov    ebp,esp
1000e533:	51                   	push   ecx
1000e534:	56                   	push   esi
1000e535:	ff 75 08             	push   DWORD PTR [ebp+0x8]
1000e538:	8b f1                	mov    esi,ecx
1000e53a:	89 75 fc             	mov    DWORD PTR [ebp-0x4],esi
1000e53d:	e8 ce 2e ff ff       	call   0x10001410
1000e542:	c7 06 84 73 01 10    	mov    DWORD PTR [esi],0x10017384
1000e548:	8b c6                	mov    eax,esi
1000e54a:	5e                   	pop    esi
1000e54b:	8b e5                	mov    esp,ebp
1000e54d:	5d                   	pop    ebp
1000e54e:	c2 04 00             	ret    0x4
1000e551:	cc                   	int3
1000e552:	cc                   	int3
1000e553:	cc                   	int3
1000e554:	cc                   	int3
1000e555:	cc                   	int3
1000e556:	cc                   	int3
1000e557:	cc                   	int3
1000e558:	cc                   	int3
1000e559:	cc                   	int3
1000e55a:	cc                   	int3
1000e55b:	cc                   	int3
1000e55c:	cc                   	int3
1000e55d:	cc                   	int3
1000e55e:	cc                   	int3
1000e55f:	cc                   	int3
1000e560:	55                   	push   ebp
1000e561:	8b ec                	mov    ebp,esp
1000e563:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000e566:	c7 01 f4 70 01 10    	mov    DWORD PTR [ecx],0x100170f4
1000e56c:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
1000e56f:	89 41 04             	mov    DWORD PTR [ecx+0x4],eax
1000e572:	8b c1                	mov    eax,ecx
1000e574:	c7 01 84 73 01 10    	mov    DWORD PTR [ecx],0x10017384
1000e57a:	5d                   	pop    ebp
1000e57b:	c2 04 00             	ret    0x4
1000e57e:	cc                   	int3
1000e57f:	cc                   	int3
1000e580:	55                   	push   ebp
1000e581:	8b ec                	mov    ebp,esp
1000e583:	6a ff                	push   0xffffffff
1000e585:	68 c5 67 01 10       	push   0x100167c5
1000e58a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000e590:	50                   	push   eax
1000e591:	83 ec 08             	sub    esp,0x8
1000e594:	56                   	push   esi
1000e595:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000e59a:	33 c5                	xor    eax,ebp
1000e59c:	50                   	push   eax
1000e59d:	8d 45 f4             	lea    eax,[ebp-0xc]
1000e5a0:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000e5a6:	8b f1                	mov    esi,ecx
1000e5a8:	89 75 ec             	mov    DWORD PTR [ebp-0x14],esi
1000e5ab:	6a 28                	push   0x28
1000e5ad:	e8 3e 67 00 00       	call   0x10014cf0
1000e5b2:	83 c4 04             	add    esp,0x4
1000e5b5:	85 c0                	test   eax,eax
1000e5b7:	74 47                	je     0x1000e600
1000e5b9:	c7 40 04 00 00 00 00 	mov    DWORD PTR [eax+0x4],0x0
1000e5c0:	c7 40 08 00 00 00 00 	mov    DWORD PTR [eax+0x8],0x0
1000e5c7:	c7 40 0c 00 00 00 00 	mov    DWORD PTR [eax+0xc],0x0
1000e5ce:	c7 40 10 00 00 00 00 	mov    DWORD PTR [eax+0x10],0x0
1000e5d5:	c7 40 14 00 00 00 00 	mov    DWORD PTR [eax+0x14],0x0
1000e5dc:	c7 40 18 00 00 00 00 	mov    DWORD PTR [eax+0x18],0x0
1000e5e3:	c7 40 1c 00 00 00 00 	mov    DWORD PTR [eax+0x1c],0x0
1000e5ea:	c7 40 20 00 00 00 00 	mov    DWORD PTR [eax+0x20],0x0
1000e5f1:	c7 40 24 00 00 00 00 	mov    DWORD PTR [eax+0x24],0x0
1000e5f8:	c7 00 8c 73 01 10    	mov    DWORD PTR [eax],0x1001738c
1000e5fe:	eb 02                	jmp    0x1000e602
1000e600:	33 c0                	xor    eax,eax
1000e602:	50                   	push   eax
1000e603:	8b ce                	mov    ecx,esi
1000e605:	e8 06 2e ff ff       	call   0x10001410
1000e60a:	6a 10                	push   0x10
1000e60c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000e613:	c7 06 84 73 01 10    	mov    DWORD PTR [esi],0x10017384
1000e619:	e8 d2 66 00 00       	call   0x10014cf0
1000e61e:	83 c4 04             	add    esp,0x4
1000e621:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
1000e624:	c6 45 fc 01          	mov    BYTE PTR [ebp-0x4],0x1
1000e628:	85 c0                	test   eax,eax
1000e62a:	74 09                	je     0x1000e635
1000e62c:	8b c8                	mov    ecx,eax
1000e62e:	e8 dd 33 00 00       	call   0x10011a10
1000e633:	eb 02                	jmp    0x1000e637
1000e635:	33 c0                	xor    eax,eax
1000e637:	8b 4e 04             	mov    ecx,DWORD PTR [esi+0x4]
1000e63a:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
1000e63d:	83 c1 10             	add    ecx,0x10
1000e640:	8d 45 f0             	lea    eax,[ebp-0x10]
1000e643:	c6 45 fc 00          	mov    BYTE PTR [ebp-0x4],0x0
1000e647:	50                   	push   eax
1000e648:	e8 13 44 ff ff       	call   0x10002a60
1000e64d:	6a 08                	push   0x8
1000e64f:	e8 9c 66 00 00       	call   0x10014cf0
1000e654:	83 c4 04             	add    esp,0x4
1000e657:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
1000e65a:	c6 45 fc 02          	mov    BYTE PTR [ebp-0x4],0x2
1000e65e:	85 c0                	test   eax,eax
1000e660:	74 09                	je     0x1000e66b
1000e662:	8b c8                	mov    ecx,eax
1000e664:	e8 d7 0e 00 00       	call   0x1000f540
1000e669:	eb 02                	jmp    0x1000e66d
1000e66b:	33 c0                	xor    eax,eax
1000e66d:	8b 4e 04             	mov    ecx,DWORD PTR [esi+0x4]
1000e670:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
1000e673:	83 c1 04             	add    ecx,0x4
1000e676:	8d 45 f0             	lea    eax,[ebp-0x10]
1000e679:	c6 45 fc 00          	mov    BYTE PTR [ebp-0x4],0x0
1000e67d:	50                   	push   eax
1000e67e:	e8 dd 43 ff ff       	call   0x10002a60
1000e683:	6a 08                	push   0x8
1000e685:	e8 66 66 00 00       	call   0x10014cf0
1000e68a:	83 c4 04             	add    esp,0x4
1000e68d:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
1000e690:	c6 45 fc 03          	mov    BYTE PTR [ebp-0x4],0x3
1000e694:	85 c0                	test   eax,eax
1000e696:	74 09                	je     0x1000e6a1
1000e698:	8b c8                	mov    ecx,eax
1000e69a:	e8 b1 39 ff ff       	call   0x10002050
1000e69f:	eb 02                	jmp    0x1000e6a3
1000e6a1:	33 c0                	xor    eax,eax
1000e6a3:	8b 4e 04             	mov    ecx,DWORD PTR [esi+0x4]
1000e6a6:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
1000e6a9:	83 c1 1c             	add    ecx,0x1c
1000e6ac:	8d 45 f0             	lea    eax,[ebp-0x10]
1000e6af:	c6 45 fc 00          	mov    BYTE PTR [ebp-0x4],0x0
1000e6b3:	50                   	push   eax
1000e6b4:	e8 a7 43 ff ff       	call   0x10002a60
1000e6b9:	8b c6                	mov    eax,esi
1000e6bb:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000e6be:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000e6c5:	59                   	pop    ecx
1000e6c6:	5e                   	pop    esi
1000e6c7:	8b e5                	mov    esp,ebp
1000e6c9:	5d                   	pop    ebp
1000e6ca:	c3                   	ret
1000e6cb:	cc                   	int3
1000e6cc:	cc                   	int3
1000e6cd:	cc                   	int3
1000e6ce:	cc                   	int3
1000e6cf:	cc                   	int3
1000e6d0:	55                   	push   ebp
1000e6d1:	8b ec                	mov    ebp,esp
1000e6d3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000e6d6:	c7 01 fc 70 01 10    	mov    DWORD PTR [ecx],0x100170fc
1000e6dc:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
1000e6df:	89 41 04             	mov    DWORD PTR [ecx+0x4],eax
1000e6e2:	8b c1                	mov    eax,ecx
1000e6e4:	c7 01 a0 73 01 10    	mov    DWORD PTR [ecx],0x100173a0
1000e6ea:	5d                   	pop    ebp
1000e6eb:	c2 04 00             	ret    0x4
1000e6ee:	cc                   	int3
1000e6ef:	cc                   	int3
1000e6f0:	55                   	push   ebp
1000e6f1:	8b ec                	mov    ebp,esp
1000e6f3:	83 ec 08             	sub    esp,0x8
1000e6f6:	56                   	push   esi
1000e6f7:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
1000e6fa:	8d 45 ff             	lea    eax,[ebp-0x1]
1000e6fd:	57                   	push   edi
1000e6fe:	8b f9                	mov    edi,ecx
1000e700:	50                   	push   eax
1000e701:	8d 46 04             	lea    eax,[esi+0x4]
1000e704:	89 7d f8             	mov    DWORD PTR [ebp-0x8],edi
1000e707:	50                   	push   eax
1000e708:	8d 4f 04             	lea    ecx,[edi+0x4]
1000e70b:	c7 07 3c 71 01 10    	mov    DWORD PTR [edi],0x1001713c
1000e711:	89 4d f8             	mov    DWORD PTR [ebp-0x8],ecx
1000e714:	e8 e7 28 ff ff       	call   0x10001000
1000e719:	8b 46 0c             	mov    eax,DWORD PTR [esi+0xc]
1000e71c:	89 47 0c             	mov    DWORD PTR [edi+0xc],eax
1000e71f:	8b c7                	mov    eax,edi
1000e721:	c7 07 94 73 01 10    	mov    DWORD PTR [edi],0x10017394
1000e727:	5f                   	pop    edi
1000e728:	5e                   	pop    esi
1000e729:	8b e5                	mov    esp,ebp
1000e72b:	5d                   	pop    ebp
1000e72c:	c2 04 00             	ret    0x4
1000e72f:	cc                   	int3
1000e730:	c7 01 84 73 01 10    	mov    DWORD PTR [ecx],0x10017384
1000e736:	e9 b5 2e ff ff       	jmp    0x100015f0
1000e73b:	cc                   	int3
1000e73c:	cc                   	int3
1000e73d:	cc                   	int3
1000e73e:	cc                   	int3
1000e73f:	cc                   	int3
1000e740:	55                   	push   ebp
1000e741:	8b ec                	mov    ebp,esp
1000e743:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000e746:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
1000e749:	89 41 04             	mov    DWORD PTR [ecx+0x4],eax
1000e74c:	8b c1                	mov    eax,ecx
1000e74e:	5d                   	pop    ebp
1000e74f:	c2                   	.byte 0xc2


===== VA 0x1000e980 | ?d_func@AEBinaryLink@@IAEPAVAEBinaryLinkPrivate@@XZ | ?d_func@AEContentLink@@AAEPAVAEContentLinkPrivate@@XZ | ?d_func@AElement@@IAEPAVAElementPrivate@@XZ | ?d_func@AFEBinaryLink@@IAEPAVAFEBinaryLinkPrivate@@XZ | ?d_func@AFElement@@IAEPAVAFElementPrivate@@XZ | ?d_func@AIEBinaryLink@@IAEPAVAIEBinaryLinkPrivate@@XZ | ?d_func@AIElement@@IAEPAVAIElementPrivate@@XZ | ?d_func@AIStructure@@IAEPAVAIStructurePrivate@@XZ | ?d_func@AbstractModel@@IAEPAVAbstractModelPrivate@@XZ | ?d_func@ConceptModel@@IAEPAVConceptModelPrivate@@XZ | ?d_func@ConceptStructure@@IAEPAVConceptStructurePrivate@@XZ | ?d_func@SCBinaryLink@@IAEPAVAEBinaryLinkPrivate@@XZ | ?d_func@SubjectCategory@@IAEPAVSubjectCategoryPrivate@@XZ | ?d_func@SubjectOperation@@IAEPAVSubjectOperationPrivate@@XZ | ?d_func@SubjectRelation@@IAEPAVSubjectRelationPrivate@@XZ | span 0x220 =====
Disassembly of section .text:

1000e980 <.text+0xd980>:
1000e980:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
1000e983:	c3                   	ret
1000e984:	cc                   	int3
1000e985:	cc                   	int3
1000e986:	cc                   	int3
1000e987:	cc                   	int3
1000e988:	cc                   	int3
1000e989:	cc                   	int3
1000e98a:	cc                   	int3
1000e98b:	cc                   	int3
1000e98c:	cc                   	int3
1000e98d:	cc                   	int3
1000e98e:	cc                   	int3
1000e98f:	cc                   	int3
1000e990:	6a 00                	push   0x0
1000e992:	e8 49 36 ff ff       	call   0x10001fe0
1000e997:	c3                   	ret
1000e998:	cc                   	int3
1000e999:	cc                   	int3
1000e99a:	cc                   	int3
1000e99b:	cc                   	int3
1000e99c:	cc                   	int3
1000e99d:	cc                   	int3
1000e99e:	cc                   	int3
1000e99f:	cc                   	int3
1000e9a0:	55                   	push   ebp
1000e9a1:	8b ec                	mov    ebp,esp
1000e9a3:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
1000e9a6:	ff 75 08             	push   DWORD PTR [ebp+0x8]
1000e9a9:	e8 02 0f 00 00       	call   0x1000f8b0
1000e9ae:	8d 50 08             	lea    edx,[eax+0x8]
1000e9b1:	85 d2                	test   edx,edx
1000e9b3:	74 07                	je     0x1000e9bc
1000e9b5:	8b 4d 10             	mov    ecx,DWORD PTR [ebp+0x10]
1000e9b8:	8b 09                	mov    ecx,DWORD PTR [ecx]
1000e9ba:	89 0a                	mov    DWORD PTR [edx],ecx
1000e9bc:	5d                   	pop    ebp
1000e9bd:	c2 0c 00             	ret    0xc
1000e9c0:	55                   	push   ebp
1000e9c1:	8b ec                	mov    ebp,esp
1000e9c3:	56                   	push   esi
1000e9c4:	57                   	push   edi
1000e9c5:	e8 26 0f 00 00       	call   0x1000f8f0
1000e9ca:	8b f0                	mov    esi,eax
1000e9cc:	8d 7e 10             	lea    edi,[esi+0x10]
1000e9cf:	66 c7 46 0c 00 00    	mov    WORD PTR [esi+0xc],0x0
1000e9d5:	85 ff                	test   edi,edi
1000e9d7:	74 18                	je     0x1000e9f1
1000e9d9:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
1000e9dc:	8b 09                	mov    ecx,DWORD PTR [ecx]
1000e9de:	8b 11                	mov    edx,DWORD PTR [ecx]
1000e9e0:	89 17                	mov    DWORD PTR [edi],edx
1000e9e2:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
1000e9e5:	89 47 04             	mov    DWORD PTR [edi+0x4],eax
1000e9e8:	8b c6                	mov    eax,esi
1000e9ea:	c7 47 08 00 00 00 00 	mov    DWORD PTR [edi+0x8],0x0
1000e9f1:	5f                   	pop    edi
1000e9f2:	5e                   	pop    esi
1000e9f3:	5d                   	pop    ebp
1000e9f4:	c2 0c 00             	ret    0xc
1000e9f7:	cc                   	int3
1000e9f8:	cc                   	int3
1000e9f9:	cc                   	int3
1000e9fa:	cc                   	int3
1000e9fb:	cc                   	int3
1000e9fc:	cc                   	int3
1000e9fd:	cc                   	int3
1000e9fe:	cc                   	int3
1000e9ff:	cc                   	int3
1000ea00:	55                   	push   ebp
1000ea01:	8b ec                	mov    ebp,esp
1000ea03:	56                   	push   esi
1000ea04:	57                   	push   edi
1000ea05:	e8 e6 0e 00 00       	call   0x1000f8f0
1000ea0a:	8b f0                	mov    esi,eax
1000ea0c:	8d 7e 10             	lea    edi,[esi+0x10]
1000ea0f:	66 c7 46 0c 00 00    	mov    WORD PTR [esi+0xc],0x0
1000ea15:	85 ff                	test   edi,edi
1000ea17:	74 15                	je     0x1000ea2e
1000ea19:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
1000ea1c:	8b 0a                	mov    ecx,DWORD PTR [edx]
1000ea1e:	89 0f                	mov    DWORD PTR [edi],ecx
1000ea20:	8b 42 04             	mov    eax,DWORD PTR [edx+0x4]
1000ea23:	89 47 04             	mov    DWORD PTR [edi+0x4],eax
1000ea26:	8b 42 08             	mov    eax,DWORD PTR [edx+0x8]
1000ea29:	89 47 08             	mov    DWORD PTR [edi+0x8],eax
1000ea2c:	8b c6                	mov    eax,esi
1000ea2e:	5f                   	pop    edi
1000ea2f:	5e                   	pop    esi
1000ea30:	5d                   	pop    ebp
1000ea31:	c2 04 00             	ret    0x4
1000ea34:	cc                   	int3
1000ea35:	cc                   	int3
1000ea36:	cc                   	int3
1000ea37:	cc                   	int3
1000ea38:	cc                   	int3
1000ea39:	cc                   	int3
1000ea3a:	cc                   	int3
1000ea3b:	cc                   	int3
1000ea3c:	cc                   	int3
1000ea3d:	cc                   	int3
1000ea3e:	cc                   	int3
1000ea3f:	cc                   	int3
1000ea40:	55                   	push   ebp
1000ea41:	8b ec                	mov    ebp,esp
1000ea43:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
1000ea46:	8b 4d 10             	mov    ecx,DWORD PTR [ebp+0x10]
1000ea49:	3b c1                	cmp    eax,ecx
1000ea4b:	74 71                	je     0x1000eabe
1000ea4d:	56                   	push   esi
1000ea4e:	8b 75 14             	mov    esi,DWORD PTR [ebp+0x14]
1000ea51:	57                   	push   edi
1000ea52:	8b 7e 08             	mov    edi,DWORD PTR [esi+0x8]
1000ea55:	39 78 18             	cmp    DWORD PTR [eax+0x18],edi
1000ea58:	75 0f                	jne    0x1000ea69
1000ea5a:	8b 50 14             	mov    edx,DWORD PTR [eax+0x14]
1000ea5d:	3b 56 04             	cmp    edx,DWORD PTR [esi+0x4]
1000ea60:	75 07                	jne    0x1000ea69
1000ea62:	8b 50 10             	mov    edx,DWORD PTR [eax+0x10]
1000ea65:	3b 16                	cmp    edx,DWORD PTR [esi]
1000ea67:	74 4a                	je     0x1000eab3
1000ea69:	80 78 0d 00          	cmp    BYTE PTR [eax+0xd],0x0
1000ea6d:	75 40                	jne    0x1000eaaf
1000ea6f:	8b 50 08             	mov    edx,DWORD PTR [eax+0x8]
1000ea72:	80 7a 0d 00          	cmp    BYTE PTR [edx+0xd],0x0
1000ea76:	75 16                	jne    0x1000ea8e
1000ea78:	8b c2                	mov    eax,edx
1000ea7a:	8b 10                	mov    edx,DWORD PTR [eax]
1000ea7c:	80 7a 0d 00          	cmp    BYTE PTR [edx+0xd],0x0
1000ea80:	75 2a                	jne    0x1000eaac
1000ea82:	8b c2                	mov    eax,edx
1000ea84:	8b 10                	mov    edx,DWORD PTR [eax]
1000ea86:	80 7a 0d 00          	cmp    BYTE PTR [edx+0xd],0x0
1000ea8a:	74 f6                	je     0x1000ea82
1000ea8c:	eb 1e                	jmp    0x1000eaac
1000ea8e:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
1000ea91:	80 7a 0d 00          	cmp    BYTE PTR [edx+0xd],0x0
1000ea95:	75 13                	jne    0x1000eaaa
1000ea97:	3b 42 08             	cmp    eax,DWORD PTR [edx+0x8]
1000ea9a:	75 0e                	jne    0x1000eaaa
1000ea9c:	8b c2                	mov    eax,edx
1000ea9e:	89 45 0c             	mov    DWORD PTR [ebp+0xc],eax
1000eaa1:	8b 52 04             	mov    edx,DWORD PTR [edx+0x4]
1000eaa4:	80 7a 0d 00          	cmp    BYTE PTR [edx+0xd],0x0
1000eaa8:	74 ed                	je     0x1000ea97
1000eaaa:	8b c2                	mov    eax,edx
1000eaac:	89 45 0c             	mov    DWORD PTR [ebp+0xc],eax
1000eaaf:	3b c1                	cmp    eax,ecx
1000eab1:	75 a2                	jne    0x1000ea55
1000eab3:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
1000eab6:	5f                   	pop    edi
1000eab7:	5e                   	pop    esi
1000eab8:	89 01                	mov    DWORD PTR [ecx],eax
1000eaba:	8b c1                	mov    eax,ecx
1000eabc:	5d                   	pop    ebp
1000eabd:	c3                   	ret
1000eabe:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
1000eac1:	89 01                	mov    DWORD PTR [ecx],eax
1000eac3:	8b c1                	mov    eax,ecx
1000eac5:	5d                   	pop    ebp
1000eac6:	c3                   	ret
1000eac7:	cc                   	int3
1000eac8:	cc                   	int3
1000eac9:	cc                   	int3
1000eaca:	cc                   	int3
1000eacb:	cc                   	int3
1000eacc:	cc                   	int3
1000eacd:	cc                   	int3
1000eace:	cc                   	int3
1000eacf:	cc                   	int3
1000ead0:	55                   	push   ebp
1000ead1:	8b ec                	mov    ebp,esp
1000ead3:	53                   	push   ebx
1000ead4:	56                   	push   esi
1000ead5:	57                   	push   edi
1000ead6:	8b f9                	mov    edi,ecx
1000ead8:	8b 47 04             	mov    eax,DWORD PTR [edi+0x4]
1000eadb:	3d 48 92 24 09       	cmp    eax,0x9249248
1000eae0:	72 1a                	jb     0x1000eafc
1000eae2:	6a 1c                	push   0x1c
1000eae4:	6a 01                	push   0x1
1000eae6:	ff 75 18             	push   DWORD PTR [ebp+0x18]
1000eae9:	e8 92 31 ff ff       	call   0x10001c80
1000eaee:	83 c4 0c             	add    esp,0xc
1000eaf1:	68 f8 72 01 10       	push   0x100172f8
1000eaf6:	ff 15 34 70 01 10    	call   DWORD PTR ds:0x10017034
1000eafc:	8b 5d 18             	mov    ebx,DWORD PTR [ebp+0x18]
1000eaff:	40                   	inc    eax
1000eb00:	89 47 04             	mov    DWORD PTR [edi+0x4],eax
1000eb03:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
1000eb06:	89 43 04             	mov    DWORD PTR [ebx+0x4],eax
1000eb09:	8b 0f                	mov    ecx,DWORD PTR [edi]
1000eb0b:	3b c1                	cmp    eax,ecx
1000eb0d:	75 0e                	jne    0x1000eb1d
1000eb0f:	89 59 04             	mov    DWORD PTR [ecx+0x4],ebx
1000eb12:	8b 07                	mov    eax,DWORD PTR [edi]
1000eb14:	89 18                	mov    DWORD PTR [eax],ebx
1000eb16:	8b 07                	mov    eax,DWORD PTR [edi]
1000eb18:	89 58 08             	mov    DWORD PTR [eax+0x8],ebx
1000eb1b:	eb 1f                	jmp    0x1000eb3c
1000eb1d:	80 7d 0c 00          	cmp    BYTE PTR [ebp+0xc],0x0
1000eb21:	74 0c                	je     0x1000eb2f
1000eb23:	89 18                	mov    DWORD PTR [eax],ebx
1000eb25:	8b 0f                	mov    ecx,DWORD PTR [edi]
1000eb27:	3b 01                	cmp    eax,DWORD PTR [ecx]
1000eb29:	75 11                	jne    0x1000eb3c
1000eb2b:	89 19                	mov    DWORD PTR [ecx],ebx
1000eb2d:	eb 0d                	jmp    0x1000eb3c
1000eb2f:	89 58 08             	mov    DWORD PTR [eax+0x8],ebx
1000eb32:	8b 0f                	mov    ecx,DWORD PTR [edi]
1000eb34:	3b 41 08             	cmp    eax,DWORD PTR [ecx+0x8]
1000eb37:	75 03                	jne    0x1000eb3c
1000eb39:	89 59 08             	mov    DWORD PTR [ecx+0x8],ebx
1000eb3c:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
1000eb3f:	8b f3                	mov    esi,ebx
1000eb41:	80 78 0c 00          	cmp    BYTE PTR [eax+0xc],0x0
1000eb45:	0f 85 0f 01 00 00    	jne    0x1000ec5a
1000eb4b:	0f 1f 44 00 00       	nop    DWORD PTR [eax+eax*1+0x0]
1000eb50:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
1000eb53:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
1000eb56:	8b 0a                	mov    ecx,DWORD PTR [edx]
1000eb58:	3b c1                	cmp    eax,ecx
1000eb5a:	75 74                	jne    0x1000ebd0
1000eb5c:	8b 4a 08             	mov    ecx,DWORD PTR [edx+0x8]
1000eb5f:	80 79 0c 00          	cmp    BYTE PTR [ecx+0xc],0x0
1000eb63:	74 71                	je     0x1000ebd6
1000eb65:	3b 70 08             	cmp    esi,DWORD PTR [eax+0x8]
1000eb68:	75 0a                	jne    0x1000eb74
1000eb6a:	8b f0                	mov    esi,eax
1000eb6c:	8b cf                	mov    ecx,edi
1000eb6e:	56                   	push   esi
1000eb6f:	e8 9c 4d 00 00       	call   0x10013910
1000eb74:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
1000eb77:	c6 40 0c 01          	mov    BYTE PTR [eax+0xc],0x1
1000eb7b:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
1000eb7e:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
1000eb81:	c6 40 0c 00          	mov    BYTE PTR [eax+0xc],0x0
1000eb85:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
1000eb88:	8b 48 04             	mov    ecx,DWORD PTR [eax+0x4]
1000eb8b:	8b 11                	mov    edx,DWORD PTR [ecx]
1000eb8d:	8b 42 08             	mov    eax,DWORD PTR [edx+0x8]
1000eb90:	89 01                	mov    DWORD PTR [ecx],eax
1000eb92:	8b 42 08             	mov    eax,DWORD PTR [edx+0x8]
1000eb95:	80 78 0d 00          	cmp    BYTE PTR [eax+0xd],0x0
1000eb99:	75 03                	jne    0x1000eb9e
1000eb9b:	89 48 04             	mov    DWORD PTR [eax+0x4],ecx
1000eb9e:	8b                   	.byte 0x8b
1000eb9f:	41                   	inc    ecx


===== VA 0x1000f510 | ??0ConceptStructure@@IAE@PAVConceptStructurePrivate@@@Z | span 0x220 =====
Disassembly of section .text:

1000f510 <.text+0xe510>:
1000f510:	55                   	push   ebp
1000f511:	8b ec                	mov    ebp,esp
1000f513:	51                   	push   ecx
1000f514:	56                   	push   esi
1000f515:	ff 75 08             	push   DWORD PTR [ebp+0x8]
1000f518:	8b f1                	mov    esi,ecx
1000f51a:	89 75 fc             	mov    DWORD PTR [ebp-0x4],esi
1000f51d:	e8 9e e1 ff ff       	call   0x1000d6c0
1000f522:	c7 06 a0 73 01 10    	mov    DWORD PTR [esi],0x100173a0
1000f528:	8b c6                	mov    eax,esi
1000f52a:	5e                   	pop    esi
1000f52b:	8b e5                	mov    esp,ebp
1000f52d:	5d                   	pop    ebp
1000f52e:	c2 04 00             	ret    0x4
1000f531:	cc                   	int3
1000f532:	cc                   	int3
1000f533:	cc                   	int3
1000f534:	cc                   	int3
1000f535:	cc                   	int3
1000f536:	cc                   	int3
1000f537:	cc                   	int3
1000f538:	cc                   	int3
1000f539:	cc                   	int3
1000f53a:	cc                   	int3
1000f53b:	cc                   	int3
1000f53c:	cc                   	int3
1000f53d:	cc                   	int3
1000f53e:	cc                   	int3
1000f53f:	cc                   	int3
1000f540:	55                   	push   ebp
1000f541:	8b ec                	mov    ebp,esp
1000f543:	6a ff                	push   0xffffffff
1000f545:	68 4f 68 01 10       	push   0x1001684f
1000f54a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000f550:	50                   	push   eax
1000f551:	51                   	push   ecx
1000f552:	56                   	push   esi
1000f553:	57                   	push   edi
1000f554:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000f559:	33 c5                	xor    eax,ebp
1000f55b:	50                   	push   eax
1000f55c:	8d 45 f4             	lea    eax,[ebp-0xc]
1000f55f:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000f565:	8b f9                	mov    edi,ecx
1000f567:	89 7d f0             	mov    DWORD PTR [ebp-0x10],edi
1000f56a:	6a 2c                	push   0x2c
1000f56c:	e8 7f 57 00 00       	call   0x10014cf0
1000f571:	8b f0                	mov    esi,eax
1000f573:	83 c4 04             	add    esp,0x4
1000f576:	89 75 f0             	mov    DWORD PTR [ebp-0x10],esi
1000f579:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000f580:	85 f6                	test   esi,esi
1000f582:	74 1c                	je     0x1000f5a0
1000f584:	6a 2c                	push   0x2c
1000f586:	6a 00                	push   0x0
1000f588:	56                   	push   esi
1000f589:	e8 26 65 00 00       	call   0x10015ab4
1000f58e:	83 c4 0c             	add    esp,0xc
1000f591:	8b ce                	mov    ecx,esi
1000f593:	e8 68 e2 ff ff       	call   0x1000d800
1000f598:	c7 06 ac 73 01 10    	mov    DWORD PTR [esi],0x100173ac
1000f59e:	eb 02                	jmp    0x1000f5a2
1000f5a0:	33 f6                	xor    esi,esi
1000f5a2:	56                   	push   esi
1000f5a3:	8b cf                	mov    ecx,edi
1000f5a5:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
1000f5ac:	e8 0f e1 ff ff       	call   0x1000d6c0
1000f5b1:	c7 07 a0 73 01 10    	mov    DWORD PTR [edi],0x100173a0
1000f5b7:	8b c7                	mov    eax,edi
1000f5b9:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000f5bc:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000f5c3:	59                   	pop    ecx
1000f5c4:	5f                   	pop    edi
1000f5c5:	5e                   	pop    esi
1000f5c6:	8b e5                	mov    esp,ebp
1000f5c8:	5d                   	pop    ebp
1000f5c9:	c3                   	ret
1000f5ca:	cc                   	int3
1000f5cb:	cc                   	int3
1000f5cc:	cc                   	int3
1000f5cd:	cc                   	int3
1000f5ce:	cc                   	int3
1000f5cf:	cc                   	int3
1000f5d0:	55                   	push   ebp
1000f5d1:	8b ec                	mov    ebp,esp
1000f5d3:	6a ff                	push   0xffffffff
1000f5d5:	68 50 65 01 10       	push   0x10016550
1000f5da:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000f5e0:	50                   	push   eax
1000f5e1:	51                   	push   ecx
1000f5e2:	56                   	push   esi
1000f5e3:	57                   	push   edi
1000f5e4:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000f5e9:	33 c5                	xor    eax,ebp
1000f5eb:	50                   	push   eax
1000f5ec:	8d 45 f4             	lea    eax,[ebp-0xc]
1000f5ef:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000f5f5:	8b f1                	mov    esi,ecx
1000f5f7:	89 75 f0             	mov    DWORD PTR [ebp-0x10],esi
1000f5fa:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
1000f5fd:	c7 06 04 71 01 10    	mov    DWORD PTR [esi],0x10017104
1000f603:	8b 42 04             	mov    eax,DWORD PTR [edx+0x4]
1000f606:	89 46 04             	mov    DWORD PTR [esi+0x4],eax
1000f609:	8d 7e 08             	lea    edi,[esi+0x8]
1000f60c:	c7 06 6c 71 01 10    	mov    DWORD PTR [esi],0x1001716c
1000f612:	89 7d 08             	mov    DWORD PTR [ebp+0x8],edi
1000f615:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000f61c:	c7 47 24 00 00 00 00 	mov    DWORD PTR [edi+0x24],0x0
1000f623:	8b 4a 2c             	mov    ecx,DWORD PTR [edx+0x2c]
1000f626:	c6 45 fc 01          	mov    BYTE PTR [ebp-0x4],0x1
1000f62a:	85 c9                	test   ecx,ecx
1000f62c:	74 08                	je     0x1000f636
1000f62e:	8b 01                	mov    eax,DWORD PTR [ecx]
1000f630:	57                   	push   edi
1000f631:	ff 10                	call   DWORD PTR [eax]
1000f633:	89 47 24             	mov    DWORD PTR [edi+0x24],eax
1000f636:	8b c6                	mov    eax,esi
1000f638:	c7 06 d4 73 01 10    	mov    DWORD PTR [esi],0x100173d4
1000f63e:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000f641:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000f648:	59                   	pop    ecx
1000f649:	5f                   	pop    edi
1000f64a:	5e                   	pop    esi
1000f64b:	8b e5                	mov    esp,ebp
1000f64d:	5d                   	pop    ebp
1000f64e:	c2 04 00             	ret    0x4
1000f651:	cc                   	int3
1000f652:	cc                   	int3
1000f653:	cc                   	int3
1000f654:	cc                   	int3
1000f655:	cc                   	int3
1000f656:	cc                   	int3
1000f657:	cc                   	int3
1000f658:	cc                   	int3
1000f659:	cc                   	int3
1000f65a:	cc                   	int3
1000f65b:	cc                   	int3
1000f65c:	cc                   	int3
1000f65d:	cc                   	int3
1000f65e:	cc                   	int3
1000f65f:	cc                   	int3
1000f660:	55                   	push   ebp
1000f661:	8b ec                	mov    ebp,esp
1000f663:	51                   	push   ecx
1000f664:	56                   	push   esi
1000f665:	ff 75 08             	push   DWORD PTR [ebp+0x8]
1000f668:	8b f1                	mov    esi,ecx
1000f66a:	89 75 fc             	mov    DWORD PTR [ebp-0x4],esi
1000f66d:	e8 7e db ff ff       	call   0x1000d1f0
1000f672:	c7 06 b4 73 01 10    	mov    DWORD PTR [esi],0x100173b4
1000f678:	8b c6                	mov    eax,esi
1000f67a:	5e                   	pop    esi
1000f67b:	8b e5                	mov    esp,ebp
1000f67d:	5d                   	pop    ebp
1000f67e:	c2 04 00             	ret    0x4
1000f681:	cc                   	int3
1000f682:	cc                   	int3
1000f683:	cc                   	int3
1000f684:	cc                   	int3
1000f685:	cc                   	int3
1000f686:	cc                   	int3
1000f687:	cc                   	int3
1000f688:	cc                   	int3
1000f689:	cc                   	int3
1000f68a:	cc                   	int3
1000f68b:	cc                   	int3
1000f68c:	cc                   	int3
1000f68d:	cc                   	int3
1000f68e:	cc                   	int3
1000f68f:	cc                   	int3
1000f690:	57                   	push   edi
1000f691:	8b f9                	mov    edi,ecx
1000f693:	8b 07                	mov    eax,DWORD PTR [edi]
1000f695:	8b 10                	mov    edx,DWORD PTR [eax]
1000f697:	89 00                	mov    DWORD PTR [eax],eax
1000f699:	8b 07                	mov    eax,DWORD PTR [edi]
1000f69b:	89 40 04             	mov    DWORD PTR [eax+0x4],eax
1000f69e:	c7 47 04 00 00 00 00 	mov    DWORD PTR [edi+0x4],0x0
1000f6a5:	3b 17                	cmp    edx,DWORD PTR [edi]
1000f6a7:	74 19                	je     0x1000f6c2
1000f6a9:	56                   	push   esi
1000f6aa:	66 0f 1f 44 00 00    	nop    WORD PTR [eax+eax*1+0x0]
1000f6b0:	8b 32                	mov    esi,DWORD PTR [edx]
1000f6b2:	52                   	push   edx
1000f6b3:	e8 6b 56 00 00       	call   0x10014d23
1000f6b8:	83 c4 04             	add    esp,0x4
1000f6bb:	8b d6                	mov    edx,esi
1000f6bd:	3b 37                	cmp    esi,DWORD PTR [edi]
1000f6bf:	75 ef                	jne    0x1000f6b0
1000f6c1:	5e                   	pop    esi
1000f6c2:	6a 0c                	push   0xc
1000f6c4:	6a 01                	push   0x1
1000f6c6:	ff 37                	push   DWORD PTR [edi]
1000f6c8:	e8 b3 25 ff ff       	call   0x10001c80
1000f6cd:	83 c4 0c             	add    esp,0xc
1000f6d0:	5f                   	pop    edi
1000f6d1:	c3                   	ret
1000f6d2:	cc                   	int3
1000f6d3:	cc                   	int3
1000f6d4:	cc                   	int3
1000f6d5:	cc                   	int3
1000f6d6:	cc                   	int3
1000f6d7:	cc                   	int3
1000f6d8:	cc                   	int3
1000f6d9:	cc                   	int3
1000f6da:	cc                   	int3
1000f6db:	cc                   	int3
1000f6dc:	cc                   	int3
1000f6dd:	cc                   	int3
1000f6de:	cc                   	int3
1000f6df:	cc                   	int3
1000f6e0:	55                   	push   ebp
1000f6e1:	8b ec                	mov    ebp,esp
1000f6e3:	51                   	push   ecx
1000f6e4:	56                   	push   esi
1000f6e5:	8b f1                	mov    esi,ecx
1000f6e7:	8b 06                	mov    eax,DWORD PTR [esi]
1000f6e9:	50                   	push   eax
1000f6ea:	ff 30                	push   DWORD PTR [eax]
1000f6ec:	8d 45 fc             	lea    eax,[ebp-0x4]
1000f6ef:	50                   	push   eax
1000f6f0:	e8 db 44 00 00       	call   0x10013bd0
1000f6f5:	6a 1c                	push   0x1c
1000f6f7:	6a 01                	push   0x1
1000f6f9:	ff 36                	push   DWORD PTR [esi]
1000f6fb:	e8 80 25 ff ff       	call   0x10001c80
1000f700:	83 c4 0c             	add    esp,0xc
1000f703:	5e                   	pop    esi
1000f704:	8b e5                	mov    esp,ebp
1000f706:	5d                   	pop    ebp
1000f707:	c3                   	ret
1000f708:	cc                   	int3
1000f709:	cc                   	int3
1000f70a:	cc                   	int3
1000f70b:	cc                   	int3
1000f70c:	cc                   	int3
1000f70d:	cc                   	int3
1000f70e:	cc                   	int3
1000f70f:	cc                   	int3
1000f710:	c7 01 a0 73 01 10    	mov    DWORD PTR [ecx],0x100173a0
1000f716:	e9 c5 e1 ff ff       	jmp    0x1000d8e0
1000f71b:	cc                   	int3
1000f71c:	cc                   	int3
1000f71d:	cc                   	int3
1000f71e:	cc                   	int3
1000f71f:	cc                   	int3
1000f720:	55                   	push   ebp
1000f721:	8b ec                	mov    ebp,esp
1000f723:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
1000f726:	56                   	push   esi
1000f727:	8b 08                	mov    ecx,DWORD PTR [eax]
1000f729:	8b 70 04             	mov    esi,DWORD PTR [eax+0x4]
1000f72c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000f72f:	8b                   	.byte 0x8b


===== VA 0x10011200 | ??0SubjectCategory@@IAE@PAVSubjectCategoryPrivate@@@Z | span 0x220 =====
Disassembly of section .text:

10011200 <.text+0x10200>:
10011200:	55                   	push   ebp
10011201:	8b ec                	mov    ebp,esp
10011203:	51                   	push   ecx
10011204:	56                   	push   esi
10011205:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10011208:	8b f1                	mov    esi,ecx
1001120a:	89 75 fc             	mov    DWORD PTR [ebp-0x4],esi
1001120d:	e8 ae bf ff ff       	call   0x1000d1c0
10011212:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
10011215:	c7 06 b4 73 01 10    	mov    DWORD PTR [esi],0x100173b4
1001121b:	c7 40 4c 00 00 00 00 	mov    DWORD PTR [eax+0x4c],0x0
10011222:	8b c6                	mov    eax,esi
10011224:	5e                   	pop    esi
10011225:	8b e5                	mov    esp,ebp
10011227:	5d                   	pop    ebp
10011228:	c2 04 00             	ret    0x4
1001122b:	cc                   	int3
1001122c:	cc                   	int3
1001122d:	cc                   	int3
1001122e:	cc                   	int3
1001122f:	cc                   	int3
10011230:	55                   	push   ebp
10011231:	8b ec                	mov    ebp,esp
10011233:	6a ff                	push   0xffffffff
10011235:	68 9f 6a 01 10       	push   0x10016a9f
1001123a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10011240:	50                   	push   eax
10011241:	51                   	push   ecx
10011242:	56                   	push   esi
10011243:	57                   	push   edi
10011244:	a1 04 10 02 10       	mov    eax,ds:0x10021004
10011249:	33 c5                	xor    eax,ebp
1001124b:	50                   	push   eax
1001124c:	8d 45 f4             	lea    eax,[ebp-0xc]
1001124f:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10011255:	8b f9                	mov    edi,ecx
10011257:	89 7d f0             	mov    DWORD PTR [ebp-0x10],edi
1001125a:	6a 5c                	push   0x5c
1001125c:	e8 8f 3a 00 00       	call   0x10014cf0
10011261:	8b f0                	mov    esi,eax
10011263:	83 c4 04             	add    esp,0x4
10011266:	89 75 f0             	mov    DWORD PTR [ebp-0x10],esi
10011269:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10011270:	85 f6                	test   esi,esi
10011272:	74 3d                	je     0x100112b1
10011274:	8b ce                	mov    ecx,esi
10011276:	e8 b5 b5 ff ff       	call   0x1000c830
1001127b:	c7 06 f8 74 01 10    	mov    DWORD PTR [esi],0x100174f8
10011281:	c7 46 40 ff ff ff ff 	mov    DWORD PTR [esi+0x40],0xffffffff
10011288:	c7 46 44 ff ff ff ff 	mov    DWORD PTR [esi+0x44],0xffffffff
1001128f:	c7 46 48 ff ff ff ff 	mov    DWORD PTR [esi+0x48],0xffffffff
10011296:	c7 46 4c ff ff ff ff 	mov    DWORD PTR [esi+0x4c],0xffffffff
1001129d:	c7 46 50 ff ff ff ff 	mov    DWORD PTR [esi+0x50],0xffffffff
100112a4:	c7 46 54 ff ff ff ff 	mov    DWORD PTR [esi+0x54],0xffffffff
100112ab:	c6 46 58 01          	mov    BYTE PTR [esi+0x58],0x1
100112af:	eb 02                	jmp    0x100112b3
100112b1:	33 f6                	xor    esi,esi
100112b3:	56                   	push   esi
100112b4:	8b cf                	mov    ecx,edi
100112b6:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
100112bd:	e8 fe be ff ff       	call   0x1000d1c0
100112c2:	8b 47 04             	mov    eax,DWORD PTR [edi+0x4]
100112c5:	c7 07 b4 73 01 10    	mov    DWORD PTR [edi],0x100173b4
100112cb:	c7 40 4c 00 00 00 00 	mov    DWORD PTR [eax+0x4c],0x0
100112d2:	8b c7                	mov    eax,edi
100112d4:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
100112d7:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
100112de:	59                   	pop    ecx
100112df:	5f                   	pop    edi
100112e0:	5e                   	pop    esi
100112e1:	8b e5                	mov    esp,ebp
100112e3:	5d                   	pop    ebp
100112e4:	c3                   	ret
100112e5:	cc                   	int3
100112e6:	cc                   	int3
100112e7:	cc                   	int3
100112e8:	cc                   	int3
100112e9:	cc                   	int3
100112ea:	cc                   	int3
100112eb:	cc                   	int3
100112ec:	cc                   	int3
100112ed:	cc                   	int3
100112ee:	cc                   	int3
100112ef:	cc                   	int3
100112f0:	c7 01 b4 73 01 10    	mov    DWORD PTR [ecx],0x100173b4
100112f6:	e9 a5 bf ff ff       	jmp    0x1000d2a0
100112fb:	cc                   	int3
100112fc:	cc                   	int3
100112fd:	cc                   	int3
100112fe:	cc                   	int3
100112ff:	cc                   	int3
10011300:	55                   	push   ebp
10011301:	8b ec                	mov    ebp,esp
10011303:	56                   	push   esi
10011304:	8b f1                	mov    esi,ecx
10011306:	e8 d5 b5 ff ff       	call   0x1000c8e0
1001130b:	f6 45 08 01          	test   BYTE PTR [ebp+0x8],0x1
1001130f:	74 0b                	je     0x1001131c
10011311:	6a 5c                	push   0x5c
10011313:	56                   	push   esi
10011314:	e8 0f 3a 00 00       	call   0x10014d28
10011319:	83 c4 08             	add    esp,0x8
1001131c:	8b c6                	mov    eax,esi
1001131e:	5e                   	pop    esi
1001131f:	5d                   	pop    ebp
10011320:	c2 04 00             	ret    0x4
10011323:	cc                   	int3
10011324:	cc                   	int3
10011325:	cc                   	int3
10011326:	cc                   	int3
10011327:	cc                   	int3
10011328:	cc                   	int3
10011329:	cc                   	int3
1001132a:	cc                   	int3
1001132b:	cc                   	int3
1001132c:	cc                   	int3
1001132d:	cc                   	int3
1001132e:	cc                   	int3
1001132f:	cc                   	int3
10011330:	55                   	push   ebp
10011331:	8b ec                	mov    ebp,esp
10011333:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10011336:	85 c0                	test   eax,eax
10011338:	75 04                	jne    0x1001133e
1001133a:	32 c0                	xor    al,al
1001133c:	5d                   	pop    ebp
1001133d:	c3                   	ret
1001133e:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
10011341:	85 c9                	test   ecx,ecx
10011343:	75 04                	jne    0x10011349
10011345:	b0 01                	mov    al,0x1
10011347:	5d                   	pop    ebp
10011348:	c3                   	ret
10011349:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
1001134c:	53                   	push   ebx
1001134d:	56                   	push   esi
1001134e:	57                   	push   edi
1001134f:	8b 70 38             	mov    esi,DWORD PTR [eax+0x38]
10011352:	8b 78 44             	mov    edi,DWORD PTR [eax+0x44]
10011355:	8b 50 40             	mov    edx,DWORD PTR [eax+0x40]
10011358:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
1001135b:	8b 58 44             	mov    ebx,DWORD PTR [eax+0x44]
1001135e:	8b 48 40             	mov    ecx,DWORD PTR [eax+0x40]
10011361:	8b 40 38             	mov    eax,DWORD PTR [eax+0x38]
10011364:	3b f0                	cmp    esi,eax
10011366:	7c 17                	jl     0x1001137f
10011368:	3b c6                	cmp    eax,esi
1001136a:	7c 0c                	jl     0x10011378
1001136c:	3b d1                	cmp    edx,ecx
1001136e:	7c 0f                	jl     0x1001137f
10011370:	3b ca                	cmp    ecx,edx
10011372:	7c 04                	jl     0x10011378
10011374:	3b fb                	cmp    edi,ebx
10011376:	7c 07                	jl     0x1001137f
10011378:	5f                   	pop    edi
10011379:	5e                   	pop    esi
1001137a:	33 c0                	xor    eax,eax
1001137c:	5b                   	pop    ebx
1001137d:	5d                   	pop    ebp
1001137e:	c3                   	ret
1001137f:	5f                   	pop    edi
10011380:	5e                   	pop    esi
10011381:	b8 01 00 00 00       	mov    eax,0x1
10011386:	5b                   	pop    ebx
10011387:	5d                   	pop    ebp
10011388:	c3                   	ret
10011389:	cc                   	int3
1001138a:	cc                   	int3
1001138b:	cc                   	int3
1001138c:	cc                   	int3
1001138d:	cc                   	int3
1001138e:	cc                   	int3
1001138f:	cc                   	int3
10011390:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
10011393:	8a 40 58             	mov    al,BYTE PTR [eax+0x58]
10011396:	c3                   	ret
10011397:	cc                   	int3
10011398:	cc                   	int3
10011399:	cc                   	int3
1001139a:	cc                   	int3
1001139b:	cc                   	int3
1001139c:	cc                   	int3
1001139d:	cc                   	int3
1001139e:	cc                   	int3
1001139f:	cc                   	int3
100113a0:	55                   	push   ebp
100113a1:	8b ec                	mov    ebp,esp
100113a3:	53                   	push   ebx
100113a4:	8b d9                	mov    ebx,ecx
100113a6:	56                   	push   esi
100113a7:	57                   	push   edi
100113a8:	83 cf ff             	or     edi,0xffffffff
100113ab:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
100113ae:	8b 70 10             	mov    esi,DWORD PTR [eax+0x10]
100113b1:	3b 70 14             	cmp    esi,DWORD PTR [eax+0x14]
100113b4:	74 3a                	je     0x100113f0
100113b6:	8b 0e                	mov    ecx,DWORD PTR [esi]
100113b8:	e8 c3 1d ff ff       	call   0x10003180
100113bd:	83 f8 02             	cmp    eax,0x2
100113c0:	75 0e                	jne    0x100113d0
100113c2:	8b 0e                	mov    ecx,DWORD PTR [esi]
100113c4:	6a 00                	push   0x0
100113c6:	e8 95 1d ff ff       	call   0x10003160
100113cb:	3b c3                	cmp    eax,ebx
100113cd:	75 01                	jne    0x100113d0
100113cf:	47                   	inc    edi
100113d0:	3b 7d 08             	cmp    edi,DWORD PTR [ebp+0x8]
100113d3:	74 12                	je     0x100113e7
100113d5:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
100113d8:	83 c6 04             	add    esi,0x4
100113db:	3b 70 14             	cmp    esi,DWORD PTR [eax+0x14]
100113de:	75 d6                	jne    0x100113b6
100113e0:	5f                   	pop    edi
100113e1:	5e                   	pop    esi
100113e2:	5b                   	pop    ebx
100113e3:	5d                   	pop    ebp
100113e4:	c2 04 00             	ret    0x4
100113e7:	8b 0e                	mov    ecx,DWORD PTR [esi]
100113e9:	6a 01                	push   0x1
100113eb:	e8 70 1d ff ff       	call   0x10003160
100113f0:	5f                   	pop    edi
100113f1:	5e                   	pop    esi
100113f2:	5b                   	pop    ebx
100113f3:	5d                   	pop    ebp
100113f4:	c2 04 00             	ret    0x4
100113f7:	cc                   	int3
100113f8:	cc                   	int3
100113f9:	cc                   	int3
100113fa:	cc                   	int3
100113fb:	cc                   	int3
100113fc:	cc                   	int3
100113fd:	cc                   	int3
100113fe:	cc                   	int3
100113ff:	cc                   	int3
10011400:	55                   	push   ebp
10011401:	8b ec                	mov    ebp,esp
10011403:	83 ec 0c             	sub    esp,0xc
10011406:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
10011409:	8d 55 fc             	lea    edx,[ebp-0x4]
1001140c:	89 4d f4             	mov    DWORD PTR [ebp-0xc],ecx
1001140f:	8d 4d f4             	lea    ecx,[ebp-0xc]
10011412:	51                   	push   ecx
10011413:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1001141a:	ff 70 14             	push   DWORD PTR [eax+0x14]
1001141d:	89 55 f8             	mov    DWORD PTR [ebp-0x8],edx


===== VA 0x100117c0 | ??0SubjectRelation@@IAE@PAVSubjectRelationPrivate@@@Z | span 0x220 =====
Disassembly of section .text:

100117c0 <.text+0x107c0>:
100117c0:	55                   	push   ebp
100117c1:	8b ec                	mov    ebp,esp
100117c3:	51                   	push   ecx
100117c4:	56                   	push   esi
100117c5:	ff 75 08             	push   DWORD PTR [ebp+0x8]
100117c8:	8b f1                	mov    esi,ecx
100117ca:	89 75 fc             	mov    DWORD PTR [ebp-0x4],esi
100117cd:	e8 8e 47 ff ff       	call   0x10005f60
100117d2:	c7 06 04 75 01 10    	mov    DWORD PTR [esi],0x10017504
100117d8:	8b c6                	mov    eax,esi
100117da:	5e                   	pop    esi
100117db:	8b e5                	mov    esp,ebp
100117dd:	5d                   	pop    ebp
100117de:	c2 04 00             	ret    0x4
100117e1:	cc                   	int3
100117e2:	cc                   	int3
100117e3:	cc                   	int3
100117e4:	cc                   	int3
100117e5:	cc                   	int3
100117e6:	cc                   	int3
100117e7:	cc                   	int3
100117e8:	cc                   	int3
100117e9:	cc                   	int3
100117ea:	cc                   	int3
100117eb:	cc                   	int3
100117ec:	cc                   	int3
100117ed:	cc                   	int3
100117ee:	cc                   	int3
100117ef:	cc                   	int3
100117f0:	55                   	push   ebp
100117f1:	8b ec                	mov    ebp,esp
100117f3:	6a ff                	push   0xffffffff
100117f5:	68 18 6f 01 10       	push   0x10016f18
100117fa:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10011800:	50                   	push   eax
10011801:	51                   	push   ecx
10011802:	56                   	push   esi
10011803:	a1 04 10 02 10       	mov    eax,ds:0x10021004
10011808:	33 c5                	xor    eax,ebp
1001180a:	50                   	push   eax
1001180b:	8d 45 f4             	lea    eax,[ebp-0xc]
1001180e:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10011814:	8b f1                	mov    esi,ecx
10011816:	89 75 f0             	mov    DWORD PTR [ebp-0x10],esi
10011819:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
1001181c:	c7 06 04 71 01 10    	mov    DWORD PTR [esi],0x10017104
10011822:	8b 42 04             	mov    eax,DWORD PTR [edx+0x4]
10011825:	89 46 04             	mov    DWORD PTR [esi+0x4],eax
10011828:	8d 42 08             	lea    eax,[edx+0x8]
1001182b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10011832:	50                   	push   eax
10011833:	8d 4e 08             	lea    ecx,[esi+0x8]
10011836:	c7 06 20 71 01 10    	mov    DWORD PTR [esi],0x10017120
1001183c:	e8 bf f9 fe ff       	call   0x10001200
10011841:	c7 06 04 75 01 10    	mov    DWORD PTR [esi],0x10017504
10011847:	8b c6                	mov    eax,esi
10011849:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1001184c:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10011853:	59                   	pop    ecx
10011854:	5e                   	pop    esi
10011855:	8b e5                	mov    esp,ebp
10011857:	5d                   	pop    ebp
10011858:	c2 04 00             	ret    0x4
1001185b:	cc                   	int3
1001185c:	cc                   	int3
1001185d:	cc                   	int3
1001185e:	cc                   	int3
1001185f:	cc                   	int3
10011860:	55                   	push   ebp
10011861:	8b ec                	mov    ebp,esp
10011863:	6a ff                	push   0xffffffff
10011865:	68 d2 6a 01 10       	push   0x10016ad2
1001186a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10011870:	50                   	push   eax
10011871:	51                   	push   ecx
10011872:	56                   	push   esi
10011873:	57                   	push   edi
10011874:	a1 04 10 02 10       	mov    eax,ds:0x10021004
10011879:	33 c5                	xor    eax,ebp
1001187b:	50                   	push   eax
1001187c:	8d 45 f4             	lea    eax,[ebp-0xc]
1001187f:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10011885:	8b f9                	mov    edi,ecx
10011887:	89 7d f0             	mov    DWORD PTR [ebp-0x10],edi
1001188a:	68 98 00 00 00       	push   0x98
1001188f:	e8 5c 34 00 00       	call   0x10014cf0
10011894:	8b f0                	mov    esi,eax
10011896:	83 c4 04             	add    esp,0x4
10011899:	89 75 f0             	mov    DWORD PTR [ebp-0x10],esi
1001189c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
100118a3:	85 f6                	test   esi,esi
100118a5:	74 0f                	je     0x100118b6
100118a7:	8b ce                	mov    ecx,esi
100118a9:	e8 22 49 ff ff       	call   0x100061d0
100118ae:	c7 06 20 75 01 10    	mov    DWORD PTR [esi],0x10017520
100118b4:	eb 02                	jmp    0x100118b8
100118b6:	33 f6                	xor    esi,esi
100118b8:	56                   	push   esi
100118b9:	8b cf                	mov    ecx,edi
100118bb:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
100118c2:	e8 99 46 ff ff       	call   0x10005f60
100118c7:	8b 47 04             	mov    eax,DWORD PTR [edi+0x4]
100118ca:	b9 63 00 00 00       	mov    ecx,0x63
100118cf:	c7 07 04 75 01 10    	mov    DWORD PTR [edi],0x10017504
100118d5:	66 89 48 58          	mov    WORD PTR [eax+0x58],cx
100118d9:	8b c7                	mov    eax,edi
100118db:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
100118de:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
100118e5:	59                   	pop    ecx
100118e6:	5f                   	pop    edi
100118e7:	5e                   	pop    esi
100118e8:	8b e5                	mov    esp,ebp
100118ea:	5d                   	pop    ebp
100118eb:	c3                   	ret
100118ec:	cc                   	int3
100118ed:	cc                   	int3
100118ee:	cc                   	int3
100118ef:	cc                   	int3
100118f0:	c7 01 04 75 01 10    	mov    DWORD PTR [ecx],0x10017504
100118f6:	e9 85 4a ff ff       	jmp    0x10006380
100118fb:	cc                   	int3
100118fc:	cc                   	int3
100118fd:	cc                   	int3
100118fe:	cc                   	int3
100118ff:	cc                   	int3
10011900:	55                   	push   ebp
10011901:	8b ec                	mov    ebp,esp
10011903:	6a ff                	push   0xffffffff
10011905:	68 30 66 01 10       	push   0x10016630
1001190a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10011910:	50                   	push   eax
10011911:	53                   	push   ebx
10011912:	56                   	push   esi
10011913:	57                   	push   edi
10011914:	a1 04 10 02 10       	mov    eax,ds:0x10021004
10011919:	33 c5                	xor    eax,ebp
1001191b:	50                   	push   eax
1001191c:	8d 45 f4             	lea    eax,[ebp-0xc]
1001191f:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10011925:	8b f1                	mov    esi,ecx
10011927:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
1001192a:	f6 c3 02             	test   bl,0x2
1001192d:	74 44                	je     0x10011973
1001192f:	68 f0 18 01 10       	push   0x100118f0
10011934:	ff 76 fc             	push   DWORD PTR [esi-0x4]
10011937:	8d 7e fc             	lea    edi,[esi-0x4]
1001193a:	6a 14                	push   0x14
1001193c:	56                   	push   esi
1001193d:	e8 c7 32 00 00       	call   0x10014c09
10011942:	f6 c3 01             	test   bl,0x1
10011945:	74 16                	je     0x1001195d
10011947:	8b 0f                	mov    ecx,DWORD PTR [edi]
10011949:	8d 0c 89             	lea    ecx,[ecx+ecx*4]
1001194c:	8d 0c 8d 04 00 00 00 	lea    ecx,[ecx*4+0x4]
10011953:	51                   	push   ecx
10011954:	57                   	push   edi
10011955:	e8 e5 33 00 00       	call   0x10014d3f
1001195a:	83 c4 08             	add    esp,0x8
1001195d:	8b c7                	mov    eax,edi
1001195f:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10011962:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10011969:	59                   	pop    ecx
1001196a:	5f                   	pop    edi
1001196b:	5e                   	pop    esi
1001196c:	5b                   	pop    ebx
1001196d:	8b e5                	mov    esp,ebp
1001196f:	5d                   	pop    ebp
10011970:	c2 04 00             	ret    0x4
10011973:	c7 06 04 75 01 10    	mov    DWORD PTR [esi],0x10017504
10011979:	e8 02 4a ff ff       	call   0x10006380
1001197e:	f6 c3 01             	test   bl,0x1
10011981:	74 0b                	je     0x1001198e
10011983:	6a 14                	push   0x14
10011985:	56                   	push   esi
10011986:	e8 9d 33 00 00       	call   0x10014d28
1001198b:	83 c4 08             	add    esp,0x8
1001198e:	8b c6                	mov    eax,esi
10011990:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10011993:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1001199a:	59                   	pop    ecx
1001199b:	5f                   	pop    edi
1001199c:	5e                   	pop    esi
1001199d:	5b                   	pop    ebx
1001199e:	8b e5                	mov    esp,ebp
100119a0:	5d                   	pop    ebp
100119a1:	c2 04 00             	ret    0x4
100119a4:	cc                   	int3
100119a5:	cc                   	int3
100119a6:	cc                   	int3
100119a7:	cc                   	int3
100119a8:	cc                   	int3
100119a9:	cc                   	int3
100119aa:	cc                   	int3
100119ab:	cc                   	int3
100119ac:	cc                   	int3
100119ad:	cc                   	int3
100119ae:	cc                   	int3
100119af:	cc                   	int3
100119b0:	55                   	push   ebp
100119b1:	8b ec                	mov    ebp,esp
100119b3:	56                   	push   esi
100119b4:	8b f1                	mov    esi,ecx
100119b6:	e8 15 4a ff ff       	call   0x100063d0
100119bb:	f6 45 08 01          	test   BYTE PTR [ebp+0x8],0x1
100119bf:	74 0e                	je     0x100119cf
100119c1:	68 98 00 00 00       	push   0x98
100119c6:	56                   	push   esi
100119c7:	e8 5c 33 00 00       	call   0x10014d28
100119cc:	83 c4 08             	add    esp,0x8
100119cf:	8b c6                	mov    eax,esi
100119d1:	5e                   	pop    esi
100119d2:	5d                   	pop    ebp
100119d3:	c2 04 00             	ret    0x4
100119d6:	cc                   	int3
100119d7:	cc                   	int3
100119d8:	cc                   	int3
100119d9:	cc                   	int3
100119da:	cc                   	int3
100119db:	cc                   	int3
100119dc:	cc                   	int3
100119dd:	cc                   	int3
100119de:	cc                   	int3
100119df:	cc                   	int3


===== VA 0x100119e0 | ??0SubjectRelationStructure@@IAE@PAVSubjectRelationStructurePrivate@@@Z | span 0x220 =====
Disassembly of section .text:

100119e0 <.text+0x109e0>:
100119e0:	55                   	push   ebp
100119e1:	8b ec                	mov    ebp,esp
100119e3:	51                   	push   ecx
100119e4:	56                   	push   esi
100119e5:	ff 75 08             	push   DWORD PTR [ebp+0x8]
100119e8:	8b f1                	mov    esi,ecx
100119ea:	89 75 fc             	mov    DWORD PTR [ebp-0x4],esi
100119ed:	e8 de 8a ff ff       	call   0x1000a4d0
100119f2:	c7 06 94 73 01 10    	mov    DWORD PTR [esi],0x10017394
100119f8:	8b c6                	mov    eax,esi
100119fa:	5e                   	pop    esi
100119fb:	8b e5                	mov    esp,ebp
100119fd:	5d                   	pop    ebp
100119fe:	c2 04 00             	ret    0x4
10011a01:	cc                   	int3
10011a02:	cc                   	int3
10011a03:	cc                   	int3
10011a04:	cc                   	int3
10011a05:	cc                   	int3
10011a06:	cc                   	int3
10011a07:	cc                   	int3
10011a08:	cc                   	int3
10011a09:	cc                   	int3
10011a0a:	cc                   	int3
10011a0b:	cc                   	int3
10011a0c:	cc                   	int3
10011a0d:	cc                   	int3
10011a0e:	cc                   	int3
10011a0f:	cc                   	int3
10011a10:	55                   	push   ebp
10011a11:	8b ec                	mov    ebp,esp
10011a13:	6a ff                	push   0xffffffff
10011a15:	68 07 6b 01 10       	push   0x10016b07
10011a1a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10011a20:	50                   	push   eax
10011a21:	83 ec 08             	sub    esp,0x8
10011a24:	56                   	push   esi
10011a25:	57                   	push   edi
10011a26:	a1 04 10 02 10       	mov    eax,ds:0x10021004
10011a2b:	33 c5                	xor    eax,ebp
10011a2d:	50                   	push   eax
10011a2e:	8d 45 f4             	lea    eax,[ebp-0xc]
10011a31:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10011a37:	8b f9                	mov    edi,ecx
10011a39:	89 7d f0             	mov    DWORD PTR [ebp-0x10],edi
10011a3c:	6a 28                	push   0x28
10011a3e:	e8 ad 32 00 00       	call   0x10014cf0
10011a43:	8b f0                	mov    esi,eax
10011a45:	83 c4 04             	add    esp,0x4
10011a48:	89 75 ec             	mov    DWORD PTR [ebp-0x14],esi
10011a4b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10011a52:	85 f6                	test   esi,esi
10011a54:	74 0f                	je     0x10011a65
10011a56:	8b ce                	mov    ecx,esi
10011a58:	e8 53 8c ff ff       	call   0x1000a6b0
10011a5d:	c7 06 28 75 01 10    	mov    DWORD PTR [esi],0x10017528
10011a63:	eb 02                	jmp    0x10011a67
10011a65:	33 f6                	xor    esi,esi
10011a67:	56                   	push   esi
10011a68:	8b cf                	mov    ecx,edi
10011a6a:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
10011a71:	e8 5a 8a ff ff       	call   0x1000a4d0
10011a76:	8b cf                	mov    ecx,edi
10011a78:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [ebp-0x4],0x1
10011a7f:	c7 07 94 73 01 10    	mov    DWORD PTR [edi],0x10017394
10011a85:	e8 06 93 ff ff       	call   0x1000ad90
10011a8a:	51                   	push   ecx
10011a8b:	8b cc                	mov    ecx,esp
10011a8d:	8b f0                	mov    esi,eax
10011a8f:	68 2c 75 01 10       	push   0x1001752c
10011a94:	e8 67 02 00 00       	call   0x10011d00
10011a99:	8b ce                	mov    ecx,esi
10011a9b:	e8 b0 22 ff ff       	call   0x10003d50
10011aa0:	6a 00                	push   0x0
10011aa2:	8b ce                	mov    ecx,esi
10011aa4:	e8 b7 82 ff ff       	call   0x10009d60
10011aa9:	6a 00                	push   0x0
10011aab:	8b ce                	mov    ecx,esi
10011aad:	e8 8e 82 ff ff       	call   0x10009d40
10011ab2:	6a 00                	push   0x0
10011ab4:	8b ce                	mov    ecx,esi
10011ab6:	e8 f5 83 ff ff       	call   0x10009eb0
10011abb:	8b cf                	mov    ecx,edi
10011abd:	e8 3e 96 ff ff       	call   0x1000b100
10011ac2:	8b c7                	mov    eax,edi
10011ac4:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10011ac7:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10011ace:	59                   	pop    ecx
10011acf:	5f                   	pop    edi
10011ad0:	5e                   	pop    esi
10011ad1:	8b e5                	mov    esp,ebp
10011ad3:	5d                   	pop    ebp
10011ad4:	c3                   	ret
10011ad5:	cc                   	int3
10011ad6:	cc                   	int3
10011ad7:	cc                   	int3
10011ad8:	cc                   	int3
10011ad9:	cc                   	int3
10011ada:	cc                   	int3
10011adb:	cc                   	int3
10011adc:	cc                   	int3
10011add:	cc                   	int3
10011ade:	cc                   	int3
10011adf:	cc                   	int3
10011ae0:	c7 01 94 73 01 10    	mov    DWORD PTR [ecx],0x10017394
10011ae6:	e9 65 8c ff ff       	jmp    0x1000a750
10011aeb:	cc                   	int3
10011aec:	cc                   	int3
10011aed:	cc                   	int3
10011aee:	cc                   	int3
10011aef:	cc                   	int3
10011af0:	55                   	push   ebp
10011af1:	8b ec                	mov    ebp,esp
10011af3:	56                   	push   esi
10011af4:	8b f1                	mov    esi,ecx
10011af6:	e8 05 8d ff ff       	call   0x1000a800
10011afb:	f6 45 08 01          	test   BYTE PTR [ebp+0x8],0x1
10011aff:	74 0b                	je     0x10011b0c
10011b01:	6a 28                	push   0x28
10011b03:	56                   	push   esi
10011b04:	e8 1f 32 00 00       	call   0x10014d28
10011b09:	83 c4 08             	add    esp,0x8
10011b0c:	8b c6                	mov    eax,esi
10011b0e:	5e                   	pop    esi
10011b0f:	5d                   	pop    ebp
10011b10:	c2 04 00             	ret    0x4
10011b13:	cc                   	int3
10011b14:	cc                   	int3
10011b15:	cc                   	int3
10011b16:	cc                   	int3
10011b17:	cc                   	int3
10011b18:	cc                   	int3
10011b19:	cc                   	int3
10011b1a:	cc                   	int3
10011b1b:	cc                   	int3
10011b1c:	cc                   	int3
10011b1d:	cc                   	int3
10011b1e:	cc                   	int3
10011b1f:	cc                   	int3
10011b20:	55                   	push   ebp
10011b21:	8b ec                	mov    ebp,esp
10011b23:	6a ff                	push   0xffffffff
10011b25:	68 3f 6b 01 10       	push   0x10016b3f
10011b2a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10011b30:	50                   	push   eax
10011b31:	51                   	push   ecx
10011b32:	a1 04 10 02 10       	mov    eax,ds:0x10021004
10011b37:	33 c5                	xor    eax,ebp
10011b39:	50                   	push   eax
10011b3a:	8d 45 f4             	lea    eax,[ebp-0xc]
10011b3d:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10011b43:	6a 14                	push   0x14
10011b45:	e8 a6 31 00 00       	call   0x10014cf0
10011b4a:	83 c4 04             	add    esp,0x4
10011b4d:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
10011b50:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10011b57:	85 c0                	test   eax,eax
10011b59:	74 16                	je     0x10011b71
10011b5b:	8b c8                	mov    ecx,eax
10011b5d:	e8 fe fc ff ff       	call   0x10011860
10011b62:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10011b65:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10011b6c:	59                   	pop    ecx
10011b6d:	8b e5                	mov    esp,ebp
10011b6f:	5d                   	pop    ebp
10011b70:	c3                   	ret
10011b71:	33 c0                	xor    eax,eax
10011b73:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10011b76:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10011b7d:	59                   	pop    ecx
10011b7e:	8b e5                	mov    esp,ebp
10011b80:	5d                   	pop    ebp
10011b81:	c3                   	ret
10011b82:	cc                   	int3
10011b83:	cc                   	int3
10011b84:	cc                   	int3
10011b85:	cc                   	int3
10011b86:	cc                   	int3
10011b87:	cc                   	int3
10011b88:	cc                   	int3
10011b89:	cc                   	int3
10011b8a:	cc                   	int3
10011b8b:	cc                   	int3
10011b8c:	cc                   	int3
10011b8d:	cc                   	int3
10011b8e:	cc                   	int3
10011b8f:	cc                   	int3
10011b90:	55                   	push   ebp
10011b91:	8b ec                	mov    ebp,esp
10011b93:	6a ff                	push   0xffffffff
10011b95:	68 79 6b 01 10       	push   0x10016b79
10011b9a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10011ba0:	50                   	push   eax
10011ba1:	51                   	push   ecx
10011ba2:	53                   	push   ebx
10011ba3:	56                   	push   esi
10011ba4:	57                   	push   edi
10011ba5:	a1 04 10 02 10       	mov    eax,ds:0x10021004
10011baa:	33 c5                	xor    eax,ebp
10011bac:	50                   	push   eax
10011bad:	8d 45 f4             	lea    eax,[ebp-0xc]
10011bb0:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10011bb6:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
10011bbd:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
10011bc0:	c7 46 10 00 00 00 00 	mov    DWORD PTR [esi+0x10],0x0
10011bc7:	c7 46 14 00 00 00 00 	mov    DWORD PTR [esi+0x14],0x0
10011bce:	c7 46 14 07 00 00 00 	mov    DWORD PTR [esi+0x14],0x7
10011bd5:	83 7e 14 08          	cmp    DWORD PTR [esi+0x14],0x8
10011bd9:	c7 46 10 00 00 00 00 	mov    DWORD PTR [esi+0x10],0x0
10011be0:	72 04                	jb     0x10011be6
10011be2:	8b 06                	mov    eax,DWORD PTR [esi]
10011be4:	eb 02                	jmp    0x10011be8
10011be6:	8b c6                	mov    eax,esi
10011be8:	33 c9                	xor    ecx,ecx
10011bea:	66 89 08             	mov    WORD PTR [eax],cx
10011bed:	8b 5d 0c             	mov    ebx,DWORD PTR [ebp+0xc]
10011bf0:	8b 7e 10             	mov    edi,DWORD PTR [esi+0x10]
10011bf3:	89 4d fc             	mov    DWORD PTR [ebp-0x4],ecx
10011bf6:	8b 4d 10             	mov    ecx,DWORD PTR [ebp+0x10]
10011bf9:	8b 43 10             	mov    eax,DWORD PTR [ebx+0x10]
10011bfc:	c7                   	.byte 0xc7
10011bfd:	45                   	inc    ebp
10011bfe:	f0                   	lock
10011bff:	01                   	.byte 0x1


===== VA 0x100123e0 | ??0Object@@IAE@PAVObjectPrivate@@@Z | span 0x220 =====
Disassembly of section .text:

100123e0 <.text+0x113e0>:
100123e0:	55                   	push   ebp
100123e1:	8b ec                	mov    ebp,esp
100123e3:	51                   	push   ecx
100123e4:	56                   	push   esi
100123e5:	ff 75 08             	push   DWORD PTR [ebp+0x8]
100123e8:	8b f1                	mov    esi,ecx
100123ea:	89 75 fc             	mov    DWORD PTR [ebp-0x4],esi
100123ed:	e8 ce ad ff ff       	call   0x1000d1c0
100123f2:	c7 06 3c 75 01 10    	mov    DWORD PTR [esi],0x1001753c
100123f8:	8b c6                	mov    eax,esi
100123fa:	5e                   	pop    esi
100123fb:	8b e5                	mov    esp,ebp
100123fd:	5d                   	pop    ebp
100123fe:	c2 04 00             	ret    0x4
10012401:	cc                   	int3
10012402:	cc                   	int3
10012403:	cc                   	int3
10012404:	cc                   	int3
10012405:	cc                   	int3
10012406:	cc                   	int3
10012407:	cc                   	int3
10012408:	cc                   	int3
10012409:	cc                   	int3
1001240a:	cc                   	int3
1001240b:	cc                   	int3
1001240c:	cc                   	int3
1001240d:	cc                   	int3
1001240e:	cc                   	int3
1001240f:	cc                   	int3
10012410:	55                   	push   ebp
10012411:	8b ec                	mov    ebp,esp
10012413:	6a ff                	push   0xffffffff
10012415:	68 0f 66 01 10       	push   0x1001660f
1001241a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10012420:	50                   	push   eax
10012421:	51                   	push   ecx
10012422:	56                   	push   esi
10012423:	57                   	push   edi
10012424:	a1 04 10 02 10       	mov    eax,ds:0x10021004
10012429:	33 c5                	xor    eax,ebp
1001242b:	50                   	push   eax
1001242c:	8d 45 f4             	lea    eax,[ebp-0xc]
1001242f:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10012435:	8b f9                	mov    edi,ecx
10012437:	89 7d f0             	mov    DWORD PTR [ebp-0x10],edi
1001243a:	6a 40                	push   0x40
1001243c:	e8 af 28 00 00       	call   0x10014cf0
10012441:	8b f0                	mov    esi,eax
10012443:	83 c4 04             	add    esp,0x4
10012446:	89 75 f0             	mov    DWORD PTR [ebp-0x10],esi
10012449:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10012450:	85 f6                	test   esi,esi
10012452:	74 0f                	je     0x10012463
10012454:	8b ce                	mov    ecx,esi
10012456:	e8 d5 a3 ff ff       	call   0x1000c830
1001245b:	c7 06 5c 75 01 10    	mov    DWORD PTR [esi],0x1001755c
10012461:	eb 02                	jmp    0x10012465
10012463:	33 f6                	xor    esi,esi
10012465:	56                   	push   esi
10012466:	8b cf                	mov    ecx,edi
10012468:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
1001246f:	e8 4c ad ff ff       	call   0x1000d1c0
10012474:	c7 07 3c 75 01 10    	mov    DWORD PTR [edi],0x1001753c
1001247a:	8b c7                	mov    eax,edi
1001247c:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1001247f:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10012486:	59                   	pop    ecx
10012487:	5f                   	pop    edi
10012488:	5e                   	pop    esi
10012489:	8b e5                	mov    esp,ebp
1001248b:	5d                   	pop    ebp
1001248c:	c3                   	ret
1001248d:	cc                   	int3
1001248e:	cc                   	int3
1001248f:	cc                   	int3
10012490:	55                   	push   ebp
10012491:	8b ec                	mov    ebp,esp
10012493:	51                   	push   ecx
10012494:	56                   	push   esi
10012495:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
10012498:	57                   	push   edi
10012499:	8b f9                	mov    edi,ecx
1001249b:	56                   	push   esi
1001249c:	89 7d fc             	mov    DWORD PTR [ebp-0x4],edi
1001249f:	e8 4c ad ff ff       	call   0x1000d1f0
100124a4:	c7 07 3c 75 01 10    	mov    DWORD PTR [edi],0x1001753c
100124aa:	8b 46 08             	mov    eax,DWORD PTR [esi+0x8]
100124ad:	89 47 08             	mov    DWORD PTR [edi+0x8],eax
100124b0:	8b c7                	mov    eax,edi
100124b2:	5f                   	pop    edi
100124b3:	5e                   	pop    esi
100124b4:	8b e5                	mov    esp,ebp
100124b6:	5d                   	pop    ebp
100124b7:	c2 04 00             	ret    0x4
100124ba:	cc                   	int3
100124bb:	cc                   	int3
100124bc:	cc                   	int3
100124bd:	cc                   	int3
100124be:	cc                   	int3
100124bf:	cc                   	int3
100124c0:	c7 01 3c 75 01 10    	mov    DWORD PTR [ecx],0x1001753c
100124c6:	e9 d5 ad ff ff       	jmp    0x1000d2a0
100124cb:	cc                   	int3
100124cc:	cc                   	int3
100124cd:	cc                   	int3
100124ce:	cc                   	int3
100124cf:	cc                   	int3
100124d0:	55                   	push   ebp
100124d1:	8b ec                	mov    ebp,esp
100124d3:	6a ff                	push   0xffffffff
100124d5:	68 30 66 01 10       	push   0x10016630
100124da:	64 a1 00 00 00 00    	mov    eax,fs:0x0
100124e0:	50                   	push   eax
100124e1:	53                   	push   ebx
100124e2:	56                   	push   esi
100124e3:	57                   	push   edi
100124e4:	a1 04 10 02 10       	mov    eax,ds:0x10021004
100124e9:	33 c5                	xor    eax,ebp
100124eb:	50                   	push   eax
100124ec:	8d 45 f4             	lea    eax,[ebp-0xc]
100124ef:	64 a3 00 00 00 00    	mov    fs:0x0,eax
100124f5:	8b f1                	mov    esi,ecx
100124f7:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
100124fa:	f6 c3 02             	test   bl,0x2
100124fd:	74 44                	je     0x10012543
100124ff:	68 c0 24 01 10       	push   0x100124c0
10012504:	ff 76 fc             	push   DWORD PTR [esi-0x4]
10012507:	8d 7e fc             	lea    edi,[esi-0x4]
1001250a:	6a 0c                	push   0xc
1001250c:	56                   	push   esi
1001250d:	e8 f7 26 00 00       	call   0x10014c09
10012512:	f6 c3 01             	test   bl,0x1
10012515:	74 16                	je     0x1001252d
10012517:	8b 0f                	mov    ecx,DWORD PTR [edi]
10012519:	8d 0c 49             	lea    ecx,[ecx+ecx*2]
1001251c:	8d 0c 8d 04 00 00 00 	lea    ecx,[ecx*4+0x4]
10012523:	51                   	push   ecx
10012524:	57                   	push   edi
10012525:	e8 15 28 00 00       	call   0x10014d3f
1001252a:	83 c4 08             	add    esp,0x8
1001252d:	8b c7                	mov    eax,edi
1001252f:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10012532:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10012539:	59                   	pop    ecx
1001253a:	5f                   	pop    edi
1001253b:	5e                   	pop    esi
1001253c:	5b                   	pop    ebx
1001253d:	8b e5                	mov    esp,ebp
1001253f:	5d                   	pop    ebp
10012540:	c2 04 00             	ret    0x4
10012543:	c7 06 3c 75 01 10    	mov    DWORD PTR [esi],0x1001753c
10012549:	e8 52 ad ff ff       	call   0x1000d2a0
1001254e:	f6 c3 01             	test   bl,0x1
10012551:	74 0b                	je     0x1001255e
10012553:	6a 0c                	push   0xc
10012555:	56                   	push   esi
10012556:	e8 cd 27 00 00       	call   0x10014d28
1001255b:	83 c4 08             	add    esp,0x8
1001255e:	8b c6                	mov    eax,esi
10012560:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10012563:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1001256a:	59                   	pop    ecx
1001256b:	5f                   	pop    edi
1001256c:	5e                   	pop    esi
1001256d:	5b                   	pop    ebx
1001256e:	8b e5                	mov    esp,ebp
10012570:	5d                   	pop    ebp
10012571:	c2 04 00             	ret    0x4
10012574:	cc                   	int3
10012575:	cc                   	int3
10012576:	cc                   	int3
10012577:	cc                   	int3
10012578:	cc                   	int3
10012579:	cc                   	int3
1001257a:	cc                   	int3
1001257b:	cc                   	int3
1001257c:	cc                   	int3
1001257d:	cc                   	int3
1001257e:	cc                   	int3
1001257f:	cc                   	int3
10012580:	55                   	push   ebp
10012581:	8b ec                	mov    ebp,esp
10012583:	56                   	push   esi
10012584:	8b f1                	mov    esi,ecx
10012586:	c7 06 5c 75 01 10    	mov    DWORD PTR [esi],0x1001755c
1001258c:	e8 4f a3 ff ff       	call   0x1000c8e0
10012591:	f6 45 08 01          	test   BYTE PTR [ebp+0x8],0x1
10012595:	74 0b                	je     0x100125a2
10012597:	6a 40                	push   0x40
10012599:	56                   	push   esi
1001259a:	e8 89 27 00 00       	call   0x10014d28
1001259f:	83 c4 08             	add    esp,0x8
100125a2:	8b c6                	mov    eax,esi
100125a4:	5e                   	pop    esi
100125a5:	5d                   	pop    ebp
100125a6:	c2 04 00             	ret    0x4
100125a9:	cc                   	int3
100125aa:	cc                   	int3
100125ab:	cc                   	int3
100125ac:	cc                   	int3
100125ad:	cc                   	int3
100125ae:	cc                   	int3
100125af:	cc                   	int3
100125b0:	e9 ab 15 ff ff       	jmp    0x10003b60
100125b5:	cc                   	int3
100125b6:	cc                   	int3
100125b7:	cc                   	int3
100125b8:	cc                   	int3
100125b9:	cc                   	int3
100125ba:	cc                   	int3
100125bb:	cc                   	int3
100125bc:	cc                   	int3
100125bd:	cc                   	int3
100125be:	cc                   	int3
100125bf:	cc                   	int3
100125c0:	55                   	push   ebp
100125c1:	8b ec                	mov    ebp,esp
100125c3:	51                   	push   ecx
100125c4:	ff 75 08             	push   DWORD PTR [ebp+0x8]
100125c7:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
100125ce:	e8 6d 21 00 00       	call   0x10014740
100125d3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
100125d6:	8b e5                	mov    esp,ebp
100125d8:	5d                   	pop    ebp
100125d9:	c2 04 00             	ret    0x4
100125dc:	cc                   	int3
100125dd:	cc                   	int3
100125de:	cc                   	int3
100125df:	cc                   	int3
100125e0:	55                   	push   ebp
100125e1:	8b ec                	mov    ebp,esp
100125e3:	6a ff                	push   0xffffffff
100125e5:	68 78 6f 01 10       	push   0x10016f78
100125ea:	64 a1 00 00 00 00    	mov    eax,fs:0x0
100125f0:	50                   	push   eax
100125f1:	51                   	push   ecx
100125f2:	56                   	push   esi
100125f3:	a1 04 10 02 10       	mov    eax,ds:0x10021004
100125f8:	33 c5                	xor    eax,ebp
100125fa:	50                   	push   eax
100125fb:	8d 45 f4             	lea    eax,[ebp-0xc]
100125fe:	64                   	fs
100125ff:	a3                   	.byte 0xa3


===== VA 0x10012640 | ??0ObjectsList@@IAE@PAVObjectsListPrivate@@@Z | span 0xf0 =====
Disassembly of section .text:

10012640 <.text+0x11640>:
10012640:	55                   	push   ebp
10012641:	8b ec                	mov    ebp,esp
10012643:	51                   	push   ecx
10012644:	56                   	push   esi
10012645:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10012648:	8b f1                	mov    esi,ecx
1001264a:	89 75 fc             	mov    DWORD PTR [ebp-0x4],esi
1001264d:	e8 6e b0 ff ff       	call   0x1000d6c0
10012652:	c7 06 64 75 01 10    	mov    DWORD PTR [esi],0x10017564
10012658:	8b c6                	mov    eax,esi
1001265a:	5e                   	pop    esi
1001265b:	8b e5                	mov    esp,ebp
1001265d:	5d                   	pop    ebp
1001265e:	c2 04 00             	ret    0x4
10012661:	cc                   	int3
10012662:	cc                   	int3
10012663:	cc                   	int3
10012664:	cc                   	int3
10012665:	cc                   	int3
10012666:	cc                   	int3
10012667:	cc                   	int3
10012668:	cc                   	int3
10012669:	cc                   	int3
1001266a:	cc                   	int3
1001266b:	cc                   	int3
1001266c:	cc                   	int3
1001266d:	cc                   	int3
1001266e:	cc                   	int3
1001266f:	cc                   	int3
10012670:	55                   	push   ebp
10012671:	8b ec                	mov    ebp,esp
10012673:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
10012676:	c7 01 fc 70 01 10    	mov    DWORD PTR [ecx],0x100170fc
1001267c:	8b 42 04             	mov    eax,DWORD PTR [edx+0x4]
1001267f:	89 41 04             	mov    DWORD PTR [ecx+0x4],eax
10012682:	c7 01 64 75 01 10    	mov    DWORD PTR [ecx],0x10017564
10012688:	8b 42 08             	mov    eax,DWORD PTR [edx+0x8]
1001268b:	89 41 08             	mov    DWORD PTR [ecx+0x8],eax
1001268e:	8b c1                	mov    eax,ecx
10012690:	5d                   	pop    ebp
10012691:	c2 04 00             	ret    0x4
10012694:	cc                   	int3
10012695:	cc                   	int3
10012696:	cc                   	int3
10012697:	cc                   	int3
10012698:	cc                   	int3
10012699:	cc                   	int3
1001269a:	cc                   	int3
1001269b:	cc                   	int3
1001269c:	cc                   	int3
1001269d:	cc                   	int3
1001269e:	cc                   	int3
1001269f:	cc                   	int3
100126a0:	55                   	push   ebp
100126a1:	8b ec                	mov    ebp,esp
100126a3:	6a ff                	push   0xffffffff
100126a5:	68 4f 68 01 10       	push   0x1001684f
100126aa:	64 a1 00 00 00 00    	mov    eax,fs:0x0
100126b0:	50                   	push   eax
100126b1:	51                   	push   ecx
100126b2:	56                   	push   esi
100126b3:	57                   	push   edi
100126b4:	a1 04 10 02 10       	mov    eax,ds:0x10021004
100126b9:	33 c5                	xor    eax,ebp
100126bb:	50                   	push   eax
100126bc:	8d 45 f4             	lea    eax,[ebp-0xc]
100126bf:	64 a3 00 00 00 00    	mov    fs:0x0,eax
100126c5:	8b f9                	mov    edi,ecx
100126c7:	89 7d f0             	mov    DWORD PTR [ebp-0x10],edi
100126ca:	6a 2c                	push   0x2c
100126cc:	e8 1f 26 00 00       	call   0x10014cf0
100126d1:	8b f0                	mov    esi,eax
100126d3:	83 c4 04             	add    esp,0x4
100126d6:	89 75 f0             	mov    DWORD PTR [ebp-0x10],esi
100126d9:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
100126e0:	85 f6                	test   esi,esi
100126e2:	74 1c                	je     0x10012700
100126e4:	6a 2c                	push   0x2c
100126e6:	6a 00                	push   0x0
100126e8:	56                   	push   esi
100126e9:	e8 c6 33 00 00       	call   0x10015ab4
100126ee:	83 c4 0c             	add    esp,0xc
100126f1:	8b ce                	mov    ecx,esi
100126f3:	e8 08 b1 ff ff       	call   0x1000d800
100126f8:	c7 06 6c 75 01 10    	mov    DWORD PTR [esi],0x1001756c
100126fe:	eb 02                	jmp    0x10012702
10012700:	33 f6                	xor    esi,esi
10012702:	56                   	push   esi
10012703:	8b cf                	mov    ecx,edi
10012705:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
1001270c:	e8 af af ff ff       	call   0x1000d6c0
10012711:	c7 07 64 75 01 10    	mov    DWORD PTR [edi],0x10017564
10012717:	8b c7                	mov    eax,edi
10012719:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1001271c:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10012723:	59                   	pop    ecx
10012724:	5f                   	pop    edi
10012725:	5e                   	pop    esi
10012726:	8b e5                	mov    esp,ebp
10012728:	5d                   	pop    ebp
10012729:	c3                   	ret
1001272a:	cc                   	int3
1001272b:	cc                   	int3
1001272c:	cc                   	int3
1001272d:	cc                   	int3
1001272e:	cc                   	int3
1001272f:	cc                   	int3


===== VA 0x10012730 | ??0ObjectsListPrivate@@QAE@ABV0@@Z | span 0x90 =====
Disassembly of section .text:

10012730 <.text+0x11730>:
10012730:	55                   	push   ebp
10012731:	8b ec                	mov    ebp,esp
10012733:	6a ff                	push   0xffffffff
10012735:	68 96 6c 01 10       	push   0x10016c96
1001273a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10012740:	50                   	push   eax
10012741:	51                   	push   ecx
10012742:	56                   	push   esi
10012743:	57                   	push   edi
10012744:	a1 04 10 02 10       	mov    eax,ds:0x10021004
10012749:	33 c5                	xor    eax,ebp
1001274b:	50                   	push   eax
1001274c:	8d 45 f4             	lea    eax,[ebp-0xc]
1001274f:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10012755:	8b f9                	mov    edi,ecx
10012757:	89 7d f0             	mov    DWORD PTR [ebp-0x10],edi
1001275a:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
1001275d:	8d 55 0b             	lea    edx,[ebp+0xb]
10012760:	52                   	push   edx
10012761:	8d 4f 04             	lea    ecx,[edi+0x4]
10012764:	c7 07 60 73 01 10    	mov    DWORD PTR [edi],0x10017360
1001276a:	89 4d 08             	mov    DWORD PTR [ebp+0x8],ecx
1001276d:	8d 46 04             	lea    eax,[esi+0x4]
10012770:	50                   	push   eax
10012771:	e8 6a ac ff ff       	call   0x1000d3e0
10012776:	8b 46 0c             	mov    eax,DWORD PTR [esi+0xc]
10012779:	8d 4f 14             	lea    ecx,[edi+0x14]
1001277c:	89 47 0c             	mov    DWORD PTR [edi+0xc],eax
1001277f:	8b 46 10             	mov    eax,DWORD PTR [esi+0x10]
10012782:	89 47 10             	mov    DWORD PTR [edi+0x10],eax
10012785:	8d 46 14             	lea    eax,[esi+0x14]
10012788:	50                   	push   eax
10012789:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10012790:	e8 6b ea fe ff       	call   0x10001200
10012795:	8d 46 20             	lea    eax,[esi+0x20]
10012798:	c6 45 fc 01          	mov    BYTE PTR [ebp-0x4],0x1
1001279c:	50                   	push   eax
1001279d:	8d 4f 20             	lea    ecx,[edi+0x20]
100127a0:	e8 5b ea fe ff       	call   0x10001200
100127a5:	c7 07 6c 75 01 10    	mov    DWORD PTR [edi],0x1001756c
100127ab:	8b c7                	mov    eax,edi
100127ad:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
100127b0:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
100127b7:	59                   	pop    ecx
100127b8:	5f                   	pop    edi
100127b9:	5e                   	pop    esi
100127ba:	8b e5                	mov    esp,ebp
100127bc:	5d                   	pop    ebp
100127bd:	c2 04 00             	ret    0x4


===== VA 0x100127c0 | ??0ObjectsListPrivate@@QAE@XZ | span 0x30 =====
Disassembly of section .text:

100127c0 <.text+0x117c0>:
100127c0:	55                   	push   ebp
100127c1:	8b ec                	mov    ebp,esp
100127c3:	51                   	push   ecx
100127c4:	56                   	push   esi
100127c5:	8b f1                	mov    esi,ecx
100127c7:	89 75 fc             	mov    DWORD PTR [ebp-0x4],esi
100127ca:	e8 31 b0 ff ff       	call   0x1000d800
100127cf:	c7 06 6c 75 01 10    	mov    DWORD PTR [esi],0x1001756c
100127d5:	8b c6                	mov    eax,esi
100127d7:	5e                   	pop    esi
100127d8:	8b e5                	mov    esp,ebp
100127da:	5d                   	pop    ebp
100127db:	c3                   	ret
100127dc:	cc                   	int3
100127dd:	cc                   	int3
100127de:	cc                   	int3
100127df:	cc                   	int3
100127e0:	c7 01 64 75 01 10    	mov    DWORD PTR [ecx],0x10017564
100127e6:	e9 f5 b0 ff ff       	jmp    0x1000d8e0
100127eb:	cc                   	int3
100127ec:	cc                   	int3
100127ed:	cc                   	int3
100127ee:	cc                   	int3
100127ef:	cc                   	int3


===== VA 0x100127f0 | ??1ObjectsListPrivate@@EAE@XZ | span 0x10 =====
Disassembly of section .text:

100127f0 <.text+0x117f0>:
100127f0:	c7 01 6c 75 01 10    	mov    DWORD PTR [ecx],0x1001756c
100127f6:	e9 75 b1 ff ff       	jmp    0x1000d970
100127fb:	cc                   	int3
100127fc:	cc                   	int3
100127fd:	cc                   	int3
100127fe:	cc                   	int3
100127ff:	cc                   	int3


===== VA 0x10012800 | ??4ObjectsListPrivate@@QAEAAV0@ABV0@@Z | ??4ParametersListPrivate@@QAEAAV0@ABV0@@Z | span 0x220 =====
Disassembly of section .text:

10012800 <.text+0x11800>:
10012800:	55                   	push   ebp
10012801:	8b ec                	mov    ebp,esp
10012803:	56                   	push   esi
10012804:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10012807:	8b f1                	mov    esi,ecx
10012809:	e8 32 b2 ff ff       	call   0x1000da40
1001280e:	8b c6                	mov    eax,esi
10012810:	5e                   	pop    esi
10012811:	5d                   	pop    ebp
10012812:	c2 04 00             	ret    0x4
10012815:	cc                   	int3
10012816:	cc                   	int3
10012817:	cc                   	int3
10012818:	cc                   	int3
10012819:	cc                   	int3
1001281a:	cc                   	int3
1001281b:	cc                   	int3
1001281c:	cc                   	int3
1001281d:	cc                   	int3
1001281e:	cc                   	int3
1001281f:	cc                   	int3
10012820:	55                   	push   ebp
10012821:	8b ec                	mov    ebp,esp
10012823:	6a ff                	push   0xffffffff
10012825:	68 30 66 01 10       	push   0x10016630
1001282a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10012830:	50                   	push   eax
10012831:	53                   	push   ebx
10012832:	56                   	push   esi
10012833:	57                   	push   edi
10012834:	a1 04 10 02 10       	mov    eax,ds:0x10021004
10012839:	33 c5                	xor    eax,ebp
1001283b:	50                   	push   eax
1001283c:	8d 45 f4             	lea    eax,[ebp-0xc]
1001283f:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10012845:	8b f1                	mov    esi,ecx
10012847:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
1001284a:	f6 c3 02             	test   bl,0x2
1001284d:	74 44                	je     0x10012893
1001284f:	68 e0 27 01 10       	push   0x100127e0
10012854:	ff 76 fc             	push   DWORD PTR [esi-0x4]
10012857:	8d 7e fc             	lea    edi,[esi-0x4]
1001285a:	6a 0c                	push   0xc
1001285c:	56                   	push   esi
1001285d:	e8 a7 23 00 00       	call   0x10014c09
10012862:	f6 c3 01             	test   bl,0x1
10012865:	74 16                	je     0x1001287d
10012867:	8b 0f                	mov    ecx,DWORD PTR [edi]
10012869:	8d 0c 49             	lea    ecx,[ecx+ecx*2]
1001286c:	8d 0c 8d 04 00 00 00 	lea    ecx,[ecx*4+0x4]
10012873:	51                   	push   ecx
10012874:	57                   	push   edi
10012875:	e8 c5 24 00 00       	call   0x10014d3f
1001287a:	83 c4 08             	add    esp,0x8
1001287d:	8b c7                	mov    eax,edi
1001287f:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10012882:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10012889:	59                   	pop    ecx
1001288a:	5f                   	pop    edi
1001288b:	5e                   	pop    esi
1001288c:	5b                   	pop    ebx
1001288d:	8b e5                	mov    esp,ebp
1001288f:	5d                   	pop    ebp
10012890:	c2 04 00             	ret    0x4
10012893:	c7 06 64 75 01 10    	mov    DWORD PTR [esi],0x10017564
10012899:	e8 42 b0 ff ff       	call   0x1000d8e0
1001289e:	f6 c3 01             	test   bl,0x1
100128a1:	74 0b                	je     0x100128ae
100128a3:	6a 0c                	push   0xc
100128a5:	56                   	push   esi
100128a6:	e8 7d 24 00 00       	call   0x10014d28
100128ab:	83 c4 08             	add    esp,0x8
100128ae:	8b c6                	mov    eax,esi
100128b0:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
100128b3:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
100128ba:	59                   	pop    ecx
100128bb:	5f                   	pop    edi
100128bc:	5e                   	pop    esi
100128bd:	5b                   	pop    ebx
100128be:	8b e5                	mov    esp,ebp
100128c0:	5d                   	pop    ebp
100128c1:	c2 04 00             	ret    0x4
100128c4:	cc                   	int3
100128c5:	cc                   	int3
100128c6:	cc                   	int3
100128c7:	cc                   	int3
100128c8:	cc                   	int3
100128c9:	cc                   	int3
100128ca:	cc                   	int3
100128cb:	cc                   	int3
100128cc:	cc                   	int3
100128cd:	cc                   	int3
100128ce:	cc                   	int3
100128cf:	cc                   	int3
100128d0:	55                   	push   ebp
100128d1:	8b ec                	mov    ebp,esp
100128d3:	6a ff                	push   0xffffffff
100128d5:	68 30 66 01 10       	push   0x10016630
100128da:	64 a1 00 00 00 00    	mov    eax,fs:0x0
100128e0:	50                   	push   eax
100128e1:	53                   	push   ebx
100128e2:	56                   	push   esi
100128e3:	57                   	push   edi
100128e4:	a1 04 10 02 10       	mov    eax,ds:0x10021004
100128e9:	33 c5                	xor    eax,ebp
100128eb:	50                   	push   eax
100128ec:	8d 45 f4             	lea    eax,[ebp-0xc]
100128ef:	64 a3 00 00 00 00    	mov    fs:0x0,eax
100128f5:	8b f1                	mov    esi,ecx
100128f7:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
100128fa:	f6 c3 02             	test   bl,0x2
100128fd:	74 3e                	je     0x1001293d
100128ff:	68 f0 27 01 10       	push   0x100127f0
10012904:	ff 76 fc             	push   DWORD PTR [esi-0x4]
10012907:	8d 7e fc             	lea    edi,[esi-0x4]
1001290a:	6a 2c                	push   0x2c
1001290c:	56                   	push   esi
1001290d:	e8 f7 22 00 00       	call   0x10014c09
10012912:	f6 c3 01             	test   bl,0x1
10012915:	74 10                	je     0x10012927
10012917:	6b 0f 2c             	imul   ecx,DWORD PTR [edi],0x2c
1001291a:	83 c1 04             	add    ecx,0x4
1001291d:	51                   	push   ecx
1001291e:	57                   	push   edi
1001291f:	e8 1b 24 00 00       	call   0x10014d3f
10012924:	83 c4 08             	add    esp,0x8
10012927:	8b c7                	mov    eax,edi
10012929:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1001292c:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10012933:	59                   	pop    ecx
10012934:	5f                   	pop    edi
10012935:	5e                   	pop    esi
10012936:	5b                   	pop    ebx
10012937:	8b e5                	mov    esp,ebp
10012939:	5d                   	pop    ebp
1001293a:	c2 04 00             	ret    0x4
1001293d:	c7 06 6c 75 01 10    	mov    DWORD PTR [esi],0x1001756c
10012943:	e8 28 b0 ff ff       	call   0x1000d970
10012948:	f6 c3 01             	test   bl,0x1
1001294b:	74 0b                	je     0x10012958
1001294d:	6a 2c                	push   0x2c
1001294f:	56                   	push   esi
10012950:	e8 d3 23 00 00       	call   0x10014d28
10012955:	83 c4 08             	add    esp,0x8
10012958:	8b c6                	mov    eax,esi
1001295a:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1001295d:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10012964:	59                   	pop    ecx
10012965:	5f                   	pop    edi
10012966:	5e                   	pop    esi
10012967:	5b                   	pop    ebx
10012968:	8b e5                	mov    esp,ebp
1001296a:	5d                   	pop    ebp
1001296b:	c2 04 00             	ret    0x4
1001296e:	cc                   	int3
1001296f:	cc                   	int3
10012970:	55                   	push   ebp
10012971:	8b ec                	mov    ebp,esp
10012973:	6a ff                	push   0xffffffff
10012975:	68 cf 6c 01 10       	push   0x10016ccf
1001297a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10012980:	50                   	push   eax
10012981:	51                   	push   ecx
10012982:	56                   	push   esi
10012983:	57                   	push   edi
10012984:	a1 04 10 02 10       	mov    eax,ds:0x10021004
10012989:	33 c5                	xor    eax,ebp
1001298b:	50                   	push   eax
1001298c:	8d 45 f4             	lea    eax,[ebp-0xc]
1001298f:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10012995:	8b f9                	mov    edi,ecx
10012997:	6a 0c                	push   0xc
10012999:	e8 52 23 00 00       	call   0x10014cf0
1001299e:	83 c4 04             	add    esp,0x4
100129a1:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
100129a4:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
100129ab:	85 c0                	test   eax,eax
100129ad:	74 0b                	je     0x100129ba
100129af:	8b c8                	mov    ecx,eax
100129b1:	e8 5a fa ff ff       	call   0x10012410
100129b6:	8b f0                	mov    esi,eax
100129b8:	eb 02                	jmp    0x100129bc
100129ba:	33 f6                	xor    esi,esi
100129bc:	56                   	push   esi
100129bd:	8b cf                	mov    ecx,edi
100129bf:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
100129c6:	e8 e5 b3 ff ff       	call   0x1000ddb0
100129cb:	8b c6                	mov    eax,esi
100129cd:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
100129d0:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
100129d7:	59                   	pop    ecx
100129d8:	5f                   	pop    edi
100129d9:	5e                   	pop    esi
100129da:	8b e5                	mov    esp,ebp
100129dc:	5d                   	pop    ebp
100129dd:	c3                   	ret
100129de:	cc                   	int3
100129df:	cc                   	int3
100129e0:	55                   	push   ebp
100129e1:	8b ec                	mov    ebp,esp
100129e3:	5d                   	pop    ebp
100129e4:	e9 d7 b4 ff ff       	jmp    0x1000dec0
100129e9:	cc                   	int3
100129ea:	cc                   	int3
100129eb:	cc                   	int3
100129ec:	cc                   	int3
100129ed:	cc                   	int3
100129ee:	cc                   	int3
100129ef:	cc                   	int3
100129f0:	55                   	push   ebp
100129f1:	8b ec                	mov    ebp,esp
100129f3:	5d                   	pop    ebp
100129f4:	e9 e7 b8 ff ff       	jmp    0x1000e2e0
100129f9:	cc                   	int3
100129fa:	cc                   	int3
100129fb:	cc                   	int3
100129fc:	cc                   	int3
100129fd:	cc                   	int3
100129fe:	cc                   	int3
100129ff:	cc                   	int3
10012a00:	55                   	push   ebp
10012a01:	8b ec                	mov    ebp,esp
10012a03:	8b 49 04             	mov    ecx,DWORD PTR [ecx+0x4]
10012a06:	8b 41 18             	mov    eax,DWORD PTR [ecx+0x18]
10012a09:	8b 49 14             	mov    ecx,DWORD PTR [ecx+0x14]
10012a0c:	8b d1                	mov    edx,ecx
10012a0e:	3b c8                	cmp    ecx,eax
10012a10:	74 10                	je     0x10012a22
10012a12:	56                   	push   esi
10012a13:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
10012a16:	39 32                	cmp    DWORD PTR [edx],esi
10012a18:	74 07                	je     0x10012a21
10012a1a:	83 c2 04             	add    edx,0x4
10012a1d:	3b d0                	cmp    edx,eax
10012a1f:	75                   	.byte 0x75


===== VA 0x100134e0 | ??0ParametersList@@IAE@PAVParametersListPrivate@@@Z | span 0xf0 =====
Disassembly of section .text:

100134e0 <.text+0x124e0>:
100134e0:	55                   	push   ebp
100134e1:	8b ec                	mov    ebp,esp
100134e3:	51                   	push   ecx
100134e4:	56                   	push   esi
100134e5:	ff 75 08             	push   DWORD PTR [ebp+0x8]
100134e8:	8b f1                	mov    esi,ecx
100134ea:	89 75 fc             	mov    DWORD PTR [ebp-0x4],esi
100134ed:	e8 ce a1 ff ff       	call   0x1000d6c0
100134f2:	c7 06 a4 75 01 10    	mov    DWORD PTR [esi],0x100175a4
100134f8:	8b c6                	mov    eax,esi
100134fa:	5e                   	pop    esi
100134fb:	8b e5                	mov    esp,ebp
100134fd:	5d                   	pop    ebp
100134fe:	c2 04 00             	ret    0x4
10013501:	cc                   	int3
10013502:	cc                   	int3
10013503:	cc                   	int3
10013504:	cc                   	int3
10013505:	cc                   	int3
10013506:	cc                   	int3
10013507:	cc                   	int3
10013508:	cc                   	int3
10013509:	cc                   	int3
1001350a:	cc                   	int3
1001350b:	cc                   	int3
1001350c:	cc                   	int3
1001350d:	cc                   	int3
1001350e:	cc                   	int3
1001350f:	cc                   	int3
10013510:	55                   	push   ebp
10013511:	8b ec                	mov    ebp,esp
10013513:	6a ff                	push   0xffffffff
10013515:	68 4f 68 01 10       	push   0x1001684f
1001351a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10013520:	50                   	push   eax
10013521:	51                   	push   ecx
10013522:	56                   	push   esi
10013523:	57                   	push   edi
10013524:	a1 04 10 02 10       	mov    eax,ds:0x10021004
10013529:	33 c5                	xor    eax,ebp
1001352b:	50                   	push   eax
1001352c:	8d 45 f4             	lea    eax,[ebp-0xc]
1001352f:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10013535:	8b f9                	mov    edi,ecx
10013537:	89 7d f0             	mov    DWORD PTR [ebp-0x10],edi
1001353a:	6a 2c                	push   0x2c
1001353c:	e8 af 17 00 00       	call   0x10014cf0
10013541:	8b f0                	mov    esi,eax
10013543:	83 c4 04             	add    esp,0x4
10013546:	89 75 f0             	mov    DWORD PTR [ebp-0x10],esi
10013549:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10013550:	85 f6                	test   esi,esi
10013552:	74 1c                	je     0x10013570
10013554:	6a 2c                	push   0x2c
10013556:	6a 00                	push   0x0
10013558:	56                   	push   esi
10013559:	e8 56 25 00 00       	call   0x10015ab4
1001355e:	83 c4 0c             	add    esp,0xc
10013561:	8b ce                	mov    ecx,esi
10013563:	e8 98 a2 ff ff       	call   0x1000d800
10013568:	c7 06 ac 75 01 10    	mov    DWORD PTR [esi],0x100175ac
1001356e:	eb 02                	jmp    0x10013572
10013570:	33 f6                	xor    esi,esi
10013572:	56                   	push   esi
10013573:	8b cf                	mov    ecx,edi
10013575:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
1001357c:	e8 3f a1 ff ff       	call   0x1000d6c0
10013581:	c7 07 a4 75 01 10    	mov    DWORD PTR [edi],0x100175a4
10013587:	8b c7                	mov    eax,edi
10013589:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1001358c:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10013593:	59                   	pop    ecx
10013594:	5f                   	pop    edi
10013595:	5e                   	pop    esi
10013596:	8b e5                	mov    esp,ebp
10013598:	5d                   	pop    ebp
10013599:	c3                   	ret
1001359a:	cc                   	int3
1001359b:	cc                   	int3
1001359c:	cc                   	int3
1001359d:	cc                   	int3
1001359e:	cc                   	int3
1001359f:	cc                   	int3
100135a0:	55                   	push   ebp
100135a1:	8b ec                	mov    ebp,esp
100135a3:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
100135a6:	c7 01 fc 70 01 10    	mov    DWORD PTR [ecx],0x100170fc
100135ac:	8b 42 04             	mov    eax,DWORD PTR [edx+0x4]
100135af:	89 41 04             	mov    DWORD PTR [ecx+0x4],eax
100135b2:	c7 01 a4 75 01 10    	mov    DWORD PTR [ecx],0x100175a4
100135b8:	8b 42 08             	mov    eax,DWORD PTR [edx+0x8]
100135bb:	89 41 08             	mov    DWORD PTR [ecx+0x8],eax
100135be:	8b c1                	mov    eax,ecx
100135c0:	5d                   	pop    ebp
100135c1:	c2 04 00             	ret    0x4
100135c4:	cc                   	int3
100135c5:	cc                   	int3
100135c6:	cc                   	int3
100135c7:	cc                   	int3
100135c8:	cc                   	int3
100135c9:	cc                   	int3
100135ca:	cc                   	int3
100135cb:	cc                   	int3
100135cc:	cc                   	int3
100135cd:	cc                   	int3
100135ce:	cc                   	int3
100135cf:	cc                   	int3


===== VA 0x100135d0 | ??0ParametersListPrivate@@QAE@ABV0@@Z | span 0x90 =====
Disassembly of section .text:

100135d0 <.text+0x125d0>:
100135d0:	55                   	push   ebp
100135d1:	8b ec                	mov    ebp,esp
100135d3:	6a ff                	push   0xffffffff
100135d5:	68 96 6c 01 10       	push   0x10016c96
100135da:	64 a1 00 00 00 00    	mov    eax,fs:0x0
100135e0:	50                   	push   eax
100135e1:	51                   	push   ecx
100135e2:	56                   	push   esi
100135e3:	57                   	push   edi
100135e4:	a1 04 10 02 10       	mov    eax,ds:0x10021004
100135e9:	33 c5                	xor    eax,ebp
100135eb:	50                   	push   eax
100135ec:	8d 45 f4             	lea    eax,[ebp-0xc]
100135ef:	64 a3 00 00 00 00    	mov    fs:0x0,eax
100135f5:	8b f9                	mov    edi,ecx
100135f7:	89 7d f0             	mov    DWORD PTR [ebp-0x10],edi
100135fa:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
100135fd:	8d 55 0b             	lea    edx,[ebp+0xb]
10013600:	52                   	push   edx
10013601:	8d 4f 04             	lea    ecx,[edi+0x4]
10013604:	c7 07 60 73 01 10    	mov    DWORD PTR [edi],0x10017360
1001360a:	89 4d 08             	mov    DWORD PTR [ebp+0x8],ecx
1001360d:	8d 46 04             	lea    eax,[esi+0x4]
10013610:	50                   	push   eax
10013611:	e8 ca 9d ff ff       	call   0x1000d3e0
10013616:	8b 46 0c             	mov    eax,DWORD PTR [esi+0xc]
10013619:	8d 4f 14             	lea    ecx,[edi+0x14]
1001361c:	89 47 0c             	mov    DWORD PTR [edi+0xc],eax
1001361f:	8b 46 10             	mov    eax,DWORD PTR [esi+0x10]
10013622:	89 47 10             	mov    DWORD PTR [edi+0x10],eax
10013625:	8d 46 14             	lea    eax,[esi+0x14]
10013628:	50                   	push   eax
10013629:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10013630:	e8 cb db fe ff       	call   0x10001200
10013635:	8d 46 20             	lea    eax,[esi+0x20]
10013638:	c6 45 fc 01          	mov    BYTE PTR [ebp-0x4],0x1
1001363c:	50                   	push   eax
1001363d:	8d 4f 20             	lea    ecx,[edi+0x20]
10013640:	e8 bb db fe ff       	call   0x10001200
10013645:	c7 07 ac 75 01 10    	mov    DWORD PTR [edi],0x100175ac
1001364b:	8b c7                	mov    eax,edi
1001364d:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10013650:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10013657:	59                   	pop    ecx
10013658:	5f                   	pop    edi
10013659:	5e                   	pop    esi
1001365a:	8b e5                	mov    esp,ebp
1001365c:	5d                   	pop    ebp
1001365d:	c2 04 00             	ret    0x4


===== VA 0x10013660 | ??0ParametersListPrivate@@QAE@XZ | span 0x60 =====
Disassembly of section .text:

10013660 <.text+0x12660>:
10013660:	55                   	push   ebp
10013661:	8b ec                	mov    ebp,esp
10013663:	51                   	push   ecx
10013664:	56                   	push   esi
10013665:	8b f1                	mov    esi,ecx
10013667:	89 75 fc             	mov    DWORD PTR [ebp-0x4],esi
1001366a:	e8 91 a1 ff ff       	call   0x1000d800
1001366f:	c7 06 ac 75 01 10    	mov    DWORD PTR [esi],0x100175ac
10013675:	8b c6                	mov    eax,esi
10013677:	5e                   	pop    esi
10013678:	8b e5                	mov    esp,ebp
1001367a:	5d                   	pop    ebp
1001367b:	c3                   	ret
1001367c:	cc                   	int3
1001367d:	cc                   	int3
1001367e:	cc                   	int3
1001367f:	cc                   	int3
10013680:	55                   	push   ebp
10013681:	8b ec                	mov    ebp,esp
10013683:	51                   	push   ecx
10013684:	56                   	push   esi
10013685:	8b f1                	mov    esi,ecx
10013687:	8b 06                	mov    eax,DWORD PTR [esi]
10013689:	50                   	push   eax
1001368a:	ff 30                	push   DWORD PTR [eax]
1001368c:	8d 45 fc             	lea    eax,[ebp-0x4]
1001368f:	50                   	push   eax
10013690:	e8 3b 05 00 00       	call   0x10013bd0
10013695:	6a 18                	push   0x18
10013697:	6a 01                	push   0x1
10013699:	ff 36                	push   DWORD PTR [esi]
1001369b:	e8 e0 e5 fe ff       	call   0x10001c80
100136a0:	83 c4 0c             	add    esp,0xc
100136a3:	5e                   	pop    esi
100136a4:	8b e5                	mov    esp,ebp
100136a6:	5d                   	pop    ebp
100136a7:	c3                   	ret
100136a8:	cc                   	int3
100136a9:	cc                   	int3
100136aa:	cc                   	int3
100136ab:	cc                   	int3
100136ac:	cc                   	int3
100136ad:	cc                   	int3
100136ae:	cc                   	int3
100136af:	cc                   	int3
100136b0:	c7 01 a4 75 01 10    	mov    DWORD PTR [ecx],0x100175a4
100136b6:	e9 25 a2 ff ff       	jmp    0x1000d8e0
100136bb:	cc                   	int3
100136bc:	cc                   	int3
100136bd:	cc                   	int3
100136be:	cc                   	int3
100136bf:	cc                   	int3


===== VA 0x100136c0 | ??1ParametersListPrivate@@EAE@XZ | span 0x220 =====
Disassembly of section .text:

100136c0 <.text+0x126c0>:
100136c0:	c7 01 ac 75 01 10    	mov    DWORD PTR [ecx],0x100175ac
100136c6:	e9 a5 a2 ff ff       	jmp    0x1000d970
100136cb:	cc                   	int3
100136cc:	cc                   	int3
100136cd:	cc                   	int3
100136ce:	cc                   	int3
100136cf:	cc                   	int3
100136d0:	8b d1                	mov    edx,ecx
100136d2:	8b 02                	mov    eax,DWORD PTR [edx]
100136d4:	80 78 0d 00          	cmp    BYTE PTR [eax+0xd],0x0
100136d8:	75 42                	jne    0x1001371c
100136da:	8b 48 08             	mov    ecx,DWORD PTR [eax+0x8]
100136dd:	80 79 0d 00          	cmp    BYTE PTR [ecx+0xd],0x0
100136e1:	75 1c                	jne    0x100136ff
100136e3:	8b 01                	mov    eax,DWORD PTR [ecx]
100136e5:	80 78 0d 00          	cmp    BYTE PTR [eax+0xd],0x0
100136e9:	75 0f                	jne    0x100136fa
100136eb:	0f 1f 44 00 00       	nop    DWORD PTR [eax+eax*1+0x0]
100136f0:	8b c8                	mov    ecx,eax
100136f2:	8b 01                	mov    eax,DWORD PTR [ecx]
100136f4:	80 78 0d 00          	cmp    BYTE PTR [eax+0xd],0x0
100136f8:	74 f6                	je     0x100136f0
100136fa:	89 0a                	mov    DWORD PTR [edx],ecx
100136fc:	8b c2                	mov    eax,edx
100136fe:	c3                   	ret
100136ff:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
10013702:	80 78 0d 00          	cmp    BYTE PTR [eax+0xd],0x0
10013706:	75 12                	jne    0x1001371a
10013708:	8b 0a                	mov    ecx,DWORD PTR [edx]
1001370a:	3b 48 08             	cmp    ecx,DWORD PTR [eax+0x8]
1001370d:	75 0b                	jne    0x1001371a
1001370f:	89 02                	mov    DWORD PTR [edx],eax
10013711:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
10013714:	80 78 0d 00          	cmp    BYTE PTR [eax+0xd],0x0
10013718:	74 ee                	je     0x10013708
1001371a:	89 02                	mov    DWORD PTR [edx],eax
1001371c:	8b c2                	mov    eax,edx
1001371e:	c3                   	ret
1001371f:	cc                   	int3
10013720:	8b d1                	mov    edx,ecx
10013722:	8b 02                	mov    eax,DWORD PTR [edx]
10013724:	80 78 0d 00          	cmp    BYTE PTR [eax+0xd],0x0
10013728:	74 08                	je     0x10013732
1001372a:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
1001372d:	89 02                	mov    DWORD PTR [edx],eax
1001372f:	8b c2                	mov    eax,edx
10013731:	c3                   	ret
10013732:	8b 08                	mov    ecx,DWORD PTR [eax]
10013734:	80 79 0d 00          	cmp    BYTE PTR [ecx+0xd],0x0
10013738:	75 19                	jne    0x10013753
1001373a:	8b 41 08             	mov    eax,DWORD PTR [ecx+0x8]
1001373d:	80 78 0d 00          	cmp    BYTE PTR [eax+0xd],0x0
10013741:	75 36                	jne    0x10013779
10013743:	8b c8                	mov    ecx,eax
10013745:	8b 41 08             	mov    eax,DWORD PTR [ecx+0x8]
10013748:	80 78 0d 00          	cmp    BYTE PTR [eax+0xd],0x0
1001374c:	74 f5                	je     0x10013743
1001374e:	89 0a                	mov    DWORD PTR [edx],ecx
10013750:	8b c2                	mov    eax,edx
10013752:	c3                   	ret
10013753:	8b 48 04             	mov    ecx,DWORD PTR [eax+0x4]
10013756:	80 79 0d 00          	cmp    BYTE PTR [ecx+0xd],0x0
1001375a:	75 15                	jne    0x10013771
1001375c:	0f 1f 40 00          	nop    DWORD PTR [eax+0x0]
10013760:	8b 02                	mov    eax,DWORD PTR [edx]
10013762:	3b 01                	cmp    eax,DWORD PTR [ecx]
10013764:	75 0b                	jne    0x10013771
10013766:	89 0a                	mov    DWORD PTR [edx],ecx
10013768:	8b 49 04             	mov    ecx,DWORD PTR [ecx+0x4]
1001376b:	80 79 0d 00          	cmp    BYTE PTR [ecx+0xd],0x0
1001376f:	74 ef                	je     0x10013760
10013771:	8b 02                	mov    eax,DWORD PTR [edx]
10013773:	80 78 0d 00          	cmp    BYTE PTR [eax+0xd],0x0
10013777:	75 02                	jne    0x1001377b
10013779:	89 0a                	mov    DWORD PTR [edx],ecx
1001377b:	8b c2                	mov    eax,edx
1001377d:	c3                   	ret
1001377e:	cc                   	int3
1001377f:	cc                   	int3
10013780:	55                   	push   ebp
10013781:	8b ec                	mov    ebp,esp
10013783:	6a ff                	push   0xffffffff
10013785:	68 30 66 01 10       	push   0x10016630
1001378a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10013790:	50                   	push   eax
10013791:	53                   	push   ebx
10013792:	56                   	push   esi
10013793:	57                   	push   edi
10013794:	a1 04 10 02 10       	mov    eax,ds:0x10021004
10013799:	33 c5                	xor    eax,ebp
1001379b:	50                   	push   eax
1001379c:	8d 45 f4             	lea    eax,[ebp-0xc]
1001379f:	64 a3 00 00 00 00    	mov    fs:0x0,eax
100137a5:	8b f1                	mov    esi,ecx
100137a7:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
100137aa:	f6 c3 02             	test   bl,0x2
100137ad:	74 44                	je     0x100137f3
100137af:	68 b0 36 01 10       	push   0x100136b0
100137b4:	ff 76 fc             	push   DWORD PTR [esi-0x4]
100137b7:	8d 7e fc             	lea    edi,[esi-0x4]
100137ba:	6a 0c                	push   0xc
100137bc:	56                   	push   esi
100137bd:	e8 47 14 00 00       	call   0x10014c09
100137c2:	f6 c3 01             	test   bl,0x1
100137c5:	74 16                	je     0x100137dd
100137c7:	8b 0f                	mov    ecx,DWORD PTR [edi]
100137c9:	8d 0c 49             	lea    ecx,[ecx+ecx*2]
100137cc:	8d 0c 8d 04 00 00 00 	lea    ecx,[ecx*4+0x4]
100137d3:	51                   	push   ecx
100137d4:	57                   	push   edi
100137d5:	e8 65 15 00 00       	call   0x10014d3f
100137da:	83 c4 08             	add    esp,0x8
100137dd:	8b c7                	mov    eax,edi
100137df:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
100137e2:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
100137e9:	59                   	pop    ecx
100137ea:	5f                   	pop    edi
100137eb:	5e                   	pop    esi
100137ec:	5b                   	pop    ebx
100137ed:	8b e5                	mov    esp,ebp
100137ef:	5d                   	pop    ebp
100137f0:	c2 04 00             	ret    0x4
100137f3:	c7 06 a4 75 01 10    	mov    DWORD PTR [esi],0x100175a4
100137f9:	e8 e2 a0 ff ff       	call   0x1000d8e0
100137fe:	f6 c3 01             	test   bl,0x1
10013801:	74 0b                	je     0x1001380e
10013803:	6a 0c                	push   0xc
10013805:	56                   	push   esi
10013806:	e8 1d 15 00 00       	call   0x10014d28
1001380b:	83 c4 08             	add    esp,0x8
1001380e:	8b c6                	mov    eax,esi
10013810:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10013813:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1001381a:	59                   	pop    ecx
1001381b:	5f                   	pop    edi
1001381c:	5e                   	pop    esi
1001381d:	5b                   	pop    ebx
1001381e:	8b e5                	mov    esp,ebp
10013820:	5d                   	pop    ebp
10013821:	c2 04 00             	ret    0x4
10013824:	cc                   	int3
10013825:	cc                   	int3
10013826:	cc                   	int3
10013827:	cc                   	int3
10013828:	cc                   	int3
10013829:	cc                   	int3
1001382a:	cc                   	int3
1001382b:	cc                   	int3
1001382c:	cc                   	int3
1001382d:	cc                   	int3
1001382e:	cc                   	int3
1001382f:	cc                   	int3
10013830:	55                   	push   ebp
10013831:	8b ec                	mov    ebp,esp
10013833:	6a ff                	push   0xffffffff
10013835:	68 30 66 01 10       	push   0x10016630
1001383a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10013840:	50                   	push   eax
10013841:	53                   	push   ebx
10013842:	56                   	push   esi
10013843:	57                   	push   edi
10013844:	a1 04 10 02 10       	mov    eax,ds:0x10021004
10013849:	33 c5                	xor    eax,ebp
1001384b:	50                   	push   eax
1001384c:	8d 45 f4             	lea    eax,[ebp-0xc]
1001384f:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10013855:	8b f1                	mov    esi,ecx
10013857:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
1001385a:	f6 c3 02             	test   bl,0x2
1001385d:	74 3e                	je     0x1001389d
1001385f:	68 c0 36 01 10       	push   0x100136c0
10013864:	ff 76 fc             	push   DWORD PTR [esi-0x4]
10013867:	8d 7e fc             	lea    edi,[esi-0x4]
1001386a:	6a 2c                	push   0x2c
1001386c:	56                   	push   esi
1001386d:	e8 97 13 00 00       	call   0x10014c09
10013872:	f6 c3 01             	test   bl,0x1
10013875:	74 10                	je     0x10013887
10013877:	6b 0f 2c             	imul   ecx,DWORD PTR [edi],0x2c
1001387a:	83 c1 04             	add    ecx,0x4
1001387d:	51                   	push   ecx
1001387e:	57                   	push   edi
1001387f:	e8 bb 14 00 00       	call   0x10014d3f
10013884:	83 c4 08             	add    esp,0x8
10013887:	8b c7                	mov    eax,edi
10013889:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1001388c:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10013893:	59                   	pop    ecx
10013894:	5f                   	pop    edi
10013895:	5e                   	pop    esi
10013896:	5b                   	pop    ebx
10013897:	8b e5                	mov    esp,ebp
10013899:	5d                   	pop    ebp
1001389a:	c2 04 00             	ret    0x4
1001389d:	c7 06 ac 75 01 10    	mov    DWORD PTR [esi],0x100175ac
100138a3:	e8 c8 a0 ff ff       	call   0x1000d970
100138a8:	f6 c3 01             	test   bl,0x1
100138ab:	74 0b                	je     0x100138b8
100138ad:	6a 2c                	push   0x2c
100138af:	56                   	push   esi
100138b0:	e8 73 14 00 00       	call   0x10014d28
100138b5:	83 c4 08             	add    esp,0x8
100138b8:	8b c6                	mov    eax,esi
100138ba:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
100138bd:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
100138c4:	59                   	pop    ecx
100138c5:	5f                   	pop    edi
100138c6:	5e                   	pop    esi
100138c7:	5b                   	pop    ebx
100138c8:	8b e5                	mov    esp,ebp
100138ca:	5d                   	pop    ebp
100138cb:	c2 04 00             	ret    0x4
100138ce:	cc                   	int3
100138cf:	cc                   	int3
100138d0:	55                   	push   ebp
100138d1:	8b ec                	mov    ebp,esp
100138d3:	53                   	push   ebx
100138d4:	56                   	push   esi
100138d5:	57                   	push   edi
100138d6:	8b 7d 08             	mov    edi,DWORD PTR [ebp+0x8]
100138d9:	8b d9                	mov    ebx,ecx
100138db:	8b f7                	mov    esi,edi
100138dd:	80                   	.byte 0x80
100138de:	7f 0d                	jg     0x100138ed


===== VA 0x10013ce0 | ??0PrimaryModel@@IAE@PAVPrimaryModelPrivate@@@Z | span 0x1e0 =====
Disassembly of section .text:

10013ce0 <.text+0x12ce0>:
10013ce0:	55                   	push   ebp
10013ce1:	8b ec                	mov    ebp,esp
10013ce3:	51                   	push   ecx
10013ce4:	56                   	push   esi
10013ce5:	8b f1                	mov    esi,ecx
10013ce7:	89 75 fc             	mov    DWORD PTR [ebp-0x4],esi
10013cea:	e8 61 d7 fe ff       	call   0x10001450
10013cef:	c7 06 b4 75 01 10    	mov    DWORD PTR [esi],0x100175b4
10013cf5:	8b c6                	mov    eax,esi
10013cf7:	5e                   	pop    esi
10013cf8:	8b e5                	mov    esp,ebp
10013cfa:	5d                   	pop    ebp
10013cfb:	c2 04 00             	ret    0x4
10013cfe:	cc                   	int3
10013cff:	cc                   	int3
10013d00:	55                   	push   ebp
10013d01:	8b ec                	mov    ebp,esp
10013d03:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
10013d06:	c7 01 f4 70 01 10    	mov    DWORD PTR [ecx],0x100170f4
10013d0c:	8b 42 04             	mov    eax,DWORD PTR [edx+0x4]
10013d0f:	89 41 04             	mov    DWORD PTR [ecx+0x4],eax
10013d12:	c7 01 b4 75 01 10    	mov    DWORD PTR [ecx],0x100175b4
10013d18:	8b 42 08             	mov    eax,DWORD PTR [edx+0x8]
10013d1b:	89 41 08             	mov    DWORD PTR [ecx+0x8],eax
10013d1e:	8b c1                	mov    eax,ecx
10013d20:	5d                   	pop    ebp
10013d21:	c2 04 00             	ret    0x4
10013d24:	cc                   	int3
10013d25:	cc                   	int3
10013d26:	cc                   	int3
10013d27:	cc                   	int3
10013d28:	cc                   	int3
10013d29:	cc                   	int3
10013d2a:	cc                   	int3
10013d2b:	cc                   	int3
10013d2c:	cc                   	int3
10013d2d:	cc                   	int3
10013d2e:	cc                   	int3
10013d2f:	cc                   	int3
10013d30:	55                   	push   ebp
10013d31:	8b ec                	mov    ebp,esp
10013d33:	6a ff                	push   0xffffffff
10013d35:	68 c4 6e 01 10       	push   0x10016ec4
10013d3a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10013d40:	50                   	push   eax
10013d41:	83 ec 08             	sub    esp,0x8
10013d44:	56                   	push   esi
10013d45:	a1 04 10 02 10       	mov    eax,ds:0x10021004
10013d4a:	33 c5                	xor    eax,ebp
10013d4c:	50                   	push   eax
10013d4d:	8d 45 f4             	lea    eax,[ebp-0xc]
10013d50:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10013d56:	8b f1                	mov    esi,ecx
10013d58:	89 75 ec             	mov    DWORD PTR [ebp-0x14],esi
10013d5b:	6a 28                	push   0x28
10013d5d:	e8 8e 0f 00 00       	call   0x10014cf0
10013d62:	83 c4 04             	add    esp,0x4
10013d65:	85 c0                	test   eax,eax
10013d67:	74 56                	je     0x10013dbf
10013d69:	0f 57 c0             	xorps  xmm0,xmm0
10013d6c:	0f 11 00             	movups XMMWORD PTR [eax],xmm0
10013d6f:	0f 11 40 10          	movups XMMWORD PTR [eax+0x10],xmm0
10013d73:	66 0f d6 40 20       	movq   QWORD PTR [eax+0x20],xmm0
10013d78:	c7 40 04 00 00 00 00 	mov    DWORD PTR [eax+0x4],0x0
10013d7f:	c7 40 08 00 00 00 00 	mov    DWORD PTR [eax+0x8],0x0
10013d86:	c7 40 0c 00 00 00 00 	mov    DWORD PTR [eax+0xc],0x0
10013d8d:	c7 40 10 00 00 00 00 	mov    DWORD PTR [eax+0x10],0x0
10013d94:	c7 40 14 00 00 00 00 	mov    DWORD PTR [eax+0x14],0x0
10013d9b:	c7 40 18 00 00 00 00 	mov    DWORD PTR [eax+0x18],0x0
10013da2:	c7 40 1c 00 00 00 00 	mov    DWORD PTR [eax+0x1c],0x0
10013da9:	c7 40 20 00 00 00 00 	mov    DWORD PTR [eax+0x20],0x0
10013db0:	c7 40 24 00 00 00 00 	mov    DWORD PTR [eax+0x24],0x0
10013db7:	c7 00 bc 75 01 10    	mov    DWORD PTR [eax],0x100175bc
10013dbd:	eb 02                	jmp    0x10013dc1
10013dbf:	33 c0                	xor    eax,eax
10013dc1:	50                   	push   eax
10013dc2:	8b ce                	mov    ecx,esi
10013dc4:	e8 47 d6 fe ff       	call   0x10001410
10013dc9:	6a 0c                	push   0xc
10013dcb:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10013dd2:	c7 06 b4 75 01 10    	mov    DWORD PTR [esi],0x100175b4
10013dd8:	e8 13 0f 00 00       	call   0x10014cf0
10013ddd:	83 c4 04             	add    esp,0x4
10013de0:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
10013de3:	c6 45 fc 01          	mov    BYTE PTR [ebp-0x4],0x1
10013de7:	85 c0                	test   eax,eax
10013de9:	74 09                	je     0x10013df4
10013deb:	8b c8                	mov    ecx,eax
10013ded:	e8 1e f7 ff ff       	call   0x10013510
10013df2:	eb 02                	jmp    0x10013df6
10013df4:	33 c0                	xor    eax,eax
10013df6:	8b 4e 04             	mov    ecx,DWORD PTR [esi+0x4]
10013df9:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
10013dfc:	83 c1 04             	add    ecx,0x4
10013dff:	8d 45 f0             	lea    eax,[ebp-0x10]
10013e02:	c6 45 fc 00          	mov    BYTE PTR [ebp-0x4],0x0
10013e06:	50                   	push   eax
10013e07:	e8 54 ec fe ff       	call   0x10002a60
10013e0c:	6a 0c                	push   0xc
10013e0e:	e8 dd 0e 00 00       	call   0x10014cf0
10013e13:	83 c4 04             	add    esp,0x4
10013e16:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
10013e19:	c6 45 fc 02          	mov    BYTE PTR [ebp-0x4],0x2
10013e1d:	85 c0                	test   eax,eax
10013e1f:	74 09                	je     0x10013e2a
10013e21:	8b c8                	mov    ecx,eax
10013e23:	e8 78 e8 ff ff       	call   0x100126a0
10013e28:	eb 02                	jmp    0x10013e2c
10013e2a:	33 c0                	xor    eax,eax
10013e2c:	8b 4e 04             	mov    ecx,DWORD PTR [esi+0x4]
10013e2f:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
10013e32:	83 c1 04             	add    ecx,0x4
10013e35:	8d 45 f0             	lea    eax,[ebp-0x10]
10013e38:	c6 45 fc 00          	mov    BYTE PTR [ebp-0x4],0x0
10013e3c:	50                   	push   eax
10013e3d:	e8 1e ec fe ff       	call   0x10002a60
10013e42:	6a 10                	push   0x10
10013e44:	e8 a7 0e 00 00       	call   0x10014cf0
10013e49:	83 c4 04             	add    esp,0x4
10013e4c:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
10013e4f:	c6 45 fc 03          	mov    BYTE PTR [ebp-0x4],0x3
10013e53:	85 c0                	test   eax,eax
10013e55:	74 09                	je     0x10013e60
10013e57:	8b c8                	mov    ecx,eax
10013e59:	e8 72 0a 00 00       	call   0x100148d0
10013e5e:	eb 02                	jmp    0x10013e62
10013e60:	33 c0                	xor    eax,eax
10013e62:	8b 4e 04             	mov    ecx,DWORD PTR [esi+0x4]
10013e65:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
10013e68:	83 c1 10             	add    ecx,0x10
10013e6b:	8d 45 f0             	lea    eax,[ebp-0x10]
10013e6e:	c6 45 fc 00          	mov    BYTE PTR [ebp-0x4],0x0
10013e72:	50                   	push   eax
10013e73:	e8 e8 eb fe ff       	call   0x10002a60
10013e78:	6a 08                	push   0x8
10013e7a:	e8 71 0e 00 00       	call   0x10014cf0
10013e7f:	83 c4 04             	add    esp,0x4
10013e82:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
10013e85:	c6 45 fc 04          	mov    BYTE PTR [ebp-0x4],0x4
10013e89:	85 c0                	test   eax,eax
10013e8b:	74 09                	je     0x10013e96
10013e8d:	8b c8                	mov    ecx,eax
10013e8f:	e8 bc e1 fe ff       	call   0x10002050
10013e94:	eb 02                	jmp    0x10013e98
10013e96:	33 c0                	xor    eax,eax
10013e98:	8b 4e 04             	mov    ecx,DWORD PTR [esi+0x4]
10013e9b:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
10013e9e:	83 c1 1c             	add    ecx,0x1c
10013ea1:	8d 45 f0             	lea    eax,[ebp-0x10]
10013ea4:	c6 45 fc 00          	mov    BYTE PTR [ebp-0x4],0x0
10013ea8:	50                   	push   eax
10013ea9:	e8 b2 eb fe ff       	call   0x10002a60
10013eae:	8b c6                	mov    eax,esi
10013eb0:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10013eb3:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10013eba:	59                   	pop    ecx
10013ebb:	5e                   	pop    esi
10013ebc:	8b e5                	mov    esp,ebp
10013ebe:	5d                   	pop    ebp
10013ebf:	c3                   	ret


===== VA 0x10013ec0 | ??0PrimaryModelPrivate@@QAE@ABV0@@Z | span 0x80 =====
Disassembly of section .text:

10013ec0 <.text+0x12ec0>:
10013ec0:	55                   	push   ebp
10013ec1:	8b ec                	mov    ebp,esp
10013ec3:	6a ff                	push   0xffffffff
10013ec5:	68 a6 5b 01 10       	push   0x10015ba6
10013eca:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10013ed0:	50                   	push   eax
10013ed1:	51                   	push   ecx
10013ed2:	56                   	push   esi
10013ed3:	57                   	push   edi
10013ed4:	a1 04 10 02 10       	mov    eax,ds:0x10021004
10013ed9:	33 c5                	xor    eax,ebp
10013edb:	50                   	push   eax
10013edc:	8d 45 f4             	lea    eax,[ebp-0xc]
10013edf:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10013ee5:	8b f9                	mov    edi,ecx
10013ee7:	89 7d f0             	mov    DWORD PTR [ebp-0x10],edi
10013eea:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
10013eed:	8d 4f 04             	lea    ecx,[edi+0x4]
10013ef0:	c7 07 48 71 01 10    	mov    DWORD PTR [edi],0x10017148
10013ef6:	8d 46 04             	lea    eax,[esi+0x4]
10013ef9:	50                   	push   eax
10013efa:	e8 01 d3 fe ff       	call   0x10001200
10013eff:	8d 46 10             	lea    eax,[esi+0x10]
10013f02:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10013f09:	50                   	push   eax
10013f0a:	8d 4f 10             	lea    ecx,[edi+0x10]
10013f0d:	e8 ee d2 fe ff       	call   0x10001200
10013f12:	8d 46 1c             	lea    eax,[esi+0x1c]
10013f15:	c6 45 fc 01          	mov    BYTE PTR [ebp-0x4],0x1
10013f19:	50                   	push   eax
10013f1a:	8d 4f 1c             	lea    ecx,[edi+0x1c]
10013f1d:	e8 de d2 fe ff       	call   0x10001200
10013f22:	c7 07 bc 75 01 10    	mov    DWORD PTR [edi],0x100175bc
10013f28:	8b c7                	mov    eax,edi
10013f2a:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10013f2d:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10013f34:	59                   	pop    ecx
10013f35:	5f                   	pop    edi
10013f36:	5e                   	pop    esi
10013f37:	8b e5                	mov    esp,ebp
10013f39:	5d                   	pop    ebp
10013f3a:	c2 04 00             	ret    0x4
10013f3d:	cc                   	int3
10013f3e:	cc                   	int3
10013f3f:	cc                   	int3


===== VA 0x10013f40 | ??0PrimaryModelPrivate@@QAE@XZ | span 0xa0 =====
Disassembly of section .text:

10013f40 <.text+0x12f40>:
10013f40:	c7 41 04 00 00 00 00 	mov    DWORD PTR [ecx+0x4],0x0
10013f47:	8b c1                	mov    eax,ecx
10013f49:	c7 41 08 00 00 00 00 	mov    DWORD PTR [ecx+0x8],0x0
10013f50:	c7 41 0c 00 00 00 00 	mov    DWORD PTR [ecx+0xc],0x0
10013f57:	c7 41 10 00 00 00 00 	mov    DWORD PTR [ecx+0x10],0x0
10013f5e:	c7 41 14 00 00 00 00 	mov    DWORD PTR [ecx+0x14],0x0
10013f65:	c7 41 18 00 00 00 00 	mov    DWORD PTR [ecx+0x18],0x0
10013f6c:	c7 41 1c 00 00 00 00 	mov    DWORD PTR [ecx+0x1c],0x0
10013f73:	c7 41 20 00 00 00 00 	mov    DWORD PTR [ecx+0x20],0x0
10013f7a:	c7 41 24 00 00 00 00 	mov    DWORD PTR [ecx+0x24],0x0
10013f81:	c7 01 bc 75 01 10    	mov    DWORD PTR [ecx],0x100175bc
10013f87:	c3                   	ret
10013f88:	cc                   	int3
10013f89:	cc                   	int3
10013f8a:	cc                   	int3
10013f8b:	cc                   	int3
10013f8c:	cc                   	int3
10013f8d:	cc                   	int3
10013f8e:	cc                   	int3
10013f8f:	cc                   	int3
10013f90:	55                   	push   ebp
10013f91:	8b ec                	mov    ebp,esp
10013f93:	83 ec 08             	sub    esp,0x8
10013f96:	56                   	push   esi
10013f97:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
10013f9a:	8d 45 ff             	lea    eax,[ebp-0x1]
10013f9d:	57                   	push   edi
10013f9e:	8b f9                	mov    edi,ecx
10013fa0:	50                   	push   eax
10013fa1:	8d 46 04             	lea    eax,[esi+0x4]
10013fa4:	89 7d f8             	mov    DWORD PTR [ebp-0x8],edi
10013fa7:	50                   	push   eax
10013fa8:	8d 4f 04             	lea    ecx,[edi+0x4]
10013fab:	c7 07 3c 71 01 10    	mov    DWORD PTR [edi],0x1001713c
10013fb1:	89 4d f8             	mov    DWORD PTR [ebp-0x8],ecx
10013fb4:	e8 47 d0 fe ff       	call   0x10001000
10013fb9:	8b 46 0c             	mov    eax,DWORD PTR [esi+0xc]
10013fbc:	89 47 0c             	mov    DWORD PTR [edi+0xc],eax
10013fbf:	8b c7                	mov    eax,edi
10013fc1:	c7 07 c4 75 01 10    	mov    DWORD PTR [edi],0x100175c4
10013fc7:	5f                   	pop    edi
10013fc8:	5e                   	pop    esi
10013fc9:	8b e5                	mov    esp,ebp
10013fcb:	5d                   	pop    ebp
10013fcc:	c2 04 00             	ret    0x4
10013fcf:	cc                   	int3
10013fd0:	c7 01 b4 75 01 10    	mov    DWORD PTR [ecx],0x100175b4
10013fd6:	e9 15 d6 fe ff       	jmp    0x100015f0
10013fdb:	cc                   	int3
10013fdc:	cc                   	int3
10013fdd:	cc                   	int3
10013fde:	cc                   	int3
10013fdf:	cc                   	int3


===== VA 0x10013fe0 | ??1PrimaryModelPrivate@@EAE@XZ | span 0x30 =====
Disassembly of section .text:

10013fe0 <.text+0x12fe0>:
10013fe0:	c7 01 bc 75 01 10    	mov    DWORD PTR [ecx],0x100175bc
10013fe6:	e9 d5 d6 fe ff       	jmp    0x100016c0
10013feb:	cc                   	int3
10013fec:	cc                   	int3
10013fed:	cc                   	int3
10013fee:	cc                   	int3
10013fef:	cc                   	int3
10013ff0:	55                   	push   ebp
10013ff1:	8b ec                	mov    ebp,esp
10013ff3:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
10013ff6:	8b 42 04             	mov    eax,DWORD PTR [edx+0x4]
10013ff9:	89 41 04             	mov    DWORD PTR [ecx+0x4],eax
10013ffc:	8b 42 08             	mov    eax,DWORD PTR [edx+0x8]
10013fff:	89 41 08             	mov    DWORD PTR [ecx+0x8],eax
10014002:	8b c1                	mov    eax,ecx
10014004:	5d                   	pop    ebp
10014005:	c2 04 00             	ret    0x4
10014008:	cc                   	int3
10014009:	cc                   	int3
1001400a:	cc                   	int3
1001400b:	cc                   	int3
1001400c:	cc                   	int3
1001400d:	cc                   	int3
1001400e:	cc                   	int3
1001400f:	cc                   	int3


===== VA 0x10014010 | ??4AbstractModelPrivate@@QAEAAV0@ABV0@@Z | ??4PrimaryModelPrivate@@QAEAAV0@ABV0@@Z | span 0x220 =====
Disassembly of section .text:

10014010 <.text+0x13010>:
10014010:	55                   	push   ebp
10014011:	8b ec                	mov    ebp,esp
10014013:	56                   	push   esi
10014014:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
10014017:	57                   	push   edi
10014018:	8b f9                	mov    edi,ecx
1001401a:	8d 46 04             	lea    eax,[esi+0x4]
1001401d:	50                   	push   eax
1001401e:	8d 4f 04             	lea    ecx,[edi+0x4]
10014021:	e8 7a 68 ff ff       	call   0x1000a8a0
10014026:	8d 46 10             	lea    eax,[esi+0x10]
10014029:	50                   	push   eax
1001402a:	8d 4f 10             	lea    ecx,[edi+0x10]
1001402d:	e8 6e 68 ff ff       	call   0x1000a8a0
10014032:	8d 46 1c             	lea    eax,[esi+0x1c]
10014035:	50                   	push   eax
10014036:	8d 4f 1c             	lea    ecx,[edi+0x1c]
10014039:	e8 62 68 ff ff       	call   0x1000a8a0
1001403e:	8b c7                	mov    eax,edi
10014040:	5f                   	pop    edi
10014041:	5e                   	pop    esi
10014042:	5d                   	pop    ebp
10014043:	c2 04 00             	ret    0x4
10014046:	cc                   	int3
10014047:	cc                   	int3
10014048:	cc                   	int3
10014049:	cc                   	int3
1001404a:	cc                   	int3
1001404b:	cc                   	int3
1001404c:	cc                   	int3
1001404d:	cc                   	int3
1001404e:	cc                   	int3
1001404f:	cc                   	int3
10014050:	55                   	push   ebp
10014051:	8b ec                	mov    ebp,esp
10014053:	6a ff                	push   0xffffffff
10014055:	68 30 66 01 10       	push   0x10016630
1001405a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10014060:	50                   	push   eax
10014061:	53                   	push   ebx
10014062:	56                   	push   esi
10014063:	57                   	push   edi
10014064:	a1 04 10 02 10       	mov    eax,ds:0x10021004
10014069:	33 c5                	xor    eax,ebp
1001406b:	50                   	push   eax
1001406c:	8d 45 f4             	lea    eax,[ebp-0xc]
1001406f:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10014075:	8b f1                	mov    esi,ecx
10014077:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
1001407a:	f6 c3 02             	test   bl,0x2
1001407d:	74 44                	je     0x100140c3
1001407f:	68 d0 3f 01 10       	push   0x10013fd0
10014084:	ff 76 fc             	push   DWORD PTR [esi-0x4]
10014087:	8d 7e fc             	lea    edi,[esi-0x4]
1001408a:	6a 0c                	push   0xc
1001408c:	56                   	push   esi
1001408d:	e8 77 0b 00 00       	call   0x10014c09
10014092:	f6 c3 01             	test   bl,0x1
10014095:	74 16                	je     0x100140ad
10014097:	8b 0f                	mov    ecx,DWORD PTR [edi]
10014099:	8d 0c 49             	lea    ecx,[ecx+ecx*2]
1001409c:	8d 0c 8d 04 00 00 00 	lea    ecx,[ecx*4+0x4]
100140a3:	51                   	push   ecx
100140a4:	57                   	push   edi
100140a5:	e8 95 0c 00 00       	call   0x10014d3f
100140aa:	83 c4 08             	add    esp,0x8
100140ad:	8b c7                	mov    eax,edi
100140af:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
100140b2:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
100140b9:	59                   	pop    ecx
100140ba:	5f                   	pop    edi
100140bb:	5e                   	pop    esi
100140bc:	5b                   	pop    ebx
100140bd:	8b e5                	mov    esp,ebp
100140bf:	5d                   	pop    ebp
100140c0:	c2 04 00             	ret    0x4
100140c3:	c7 06 b4 75 01 10    	mov    DWORD PTR [esi],0x100175b4
100140c9:	e8 22 d5 fe ff       	call   0x100015f0
100140ce:	f6 c3 01             	test   bl,0x1
100140d1:	74 0b                	je     0x100140de
100140d3:	6a 0c                	push   0xc
100140d5:	56                   	push   esi
100140d6:	e8 4d 0c 00 00       	call   0x10014d28
100140db:	83 c4 08             	add    esp,0x8
100140de:	8b c6                	mov    eax,esi
100140e0:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
100140e3:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
100140ea:	59                   	pop    ecx
100140eb:	5f                   	pop    edi
100140ec:	5e                   	pop    esi
100140ed:	5b                   	pop    ebx
100140ee:	8b e5                	mov    esp,ebp
100140f0:	5d                   	pop    ebp
100140f1:	c2 04 00             	ret    0x4
100140f4:	cc                   	int3
100140f5:	cc                   	int3
100140f6:	cc                   	int3
100140f7:	cc                   	int3
100140f8:	cc                   	int3
100140f9:	cc                   	int3
100140fa:	cc                   	int3
100140fb:	cc                   	int3
100140fc:	cc                   	int3
100140fd:	cc                   	int3
100140fe:	cc                   	int3
100140ff:	cc                   	int3
10014100:	55                   	push   ebp
10014101:	8b ec                	mov    ebp,esp
10014103:	6a ff                	push   0xffffffff
10014105:	68 30 66 01 10       	push   0x10016630
1001410a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10014110:	50                   	push   eax
10014111:	53                   	push   ebx
10014112:	56                   	push   esi
10014113:	57                   	push   edi
10014114:	a1 04 10 02 10       	mov    eax,ds:0x10021004
10014119:	33 c5                	xor    eax,ebp
1001411b:	50                   	push   eax
1001411c:	8d 45 f4             	lea    eax,[ebp-0xc]
1001411f:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10014125:	8b f1                	mov    esi,ecx
10014127:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
1001412a:	f6 c3 02             	test   bl,0x2
1001412d:	74 44                	je     0x10014173
1001412f:	68 e0 3f 01 10       	push   0x10013fe0
10014134:	ff 76 fc             	push   DWORD PTR [esi-0x4]
10014137:	8d 7e fc             	lea    edi,[esi-0x4]
1001413a:	6a 28                	push   0x28
1001413c:	56                   	push   esi
1001413d:	e8 c7 0a 00 00       	call   0x10014c09
10014142:	f6 c3 01             	test   bl,0x1
10014145:	74 16                	je     0x1001415d
10014147:	8b 0f                	mov    ecx,DWORD PTR [edi]
10014149:	8d 0c 89             	lea    ecx,[ecx+ecx*4]
1001414c:	8d 0c cd 04 00 00 00 	lea    ecx,[ecx*8+0x4]
10014153:	51                   	push   ecx
10014154:	57                   	push   edi
10014155:	e8 e5 0b 00 00       	call   0x10014d3f
1001415a:	83 c4 08             	add    esp,0x8
1001415d:	8b c7                	mov    eax,edi
1001415f:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10014162:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10014169:	59                   	pop    ecx
1001416a:	5f                   	pop    edi
1001416b:	5e                   	pop    esi
1001416c:	5b                   	pop    ebx
1001416d:	8b e5                	mov    esp,ebp
1001416f:	5d                   	pop    ebp
10014170:	c2 04 00             	ret    0x4
10014173:	c7 06 bc 75 01 10    	mov    DWORD PTR [esi],0x100175bc
10014179:	e8 42 d5 fe ff       	call   0x100016c0
1001417e:	f6 c3 01             	test   bl,0x1
10014181:	74 0b                	je     0x1001418e
10014183:	6a 28                	push   0x28
10014185:	56                   	push   esi
10014186:	e8 9d 0b 00 00       	call   0x10014d28
1001418b:	83 c4 08             	add    esp,0x8
1001418e:	8b c6                	mov    eax,esi
10014190:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10014193:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1001419a:	59                   	pop    ecx
1001419b:	5f                   	pop    edi
1001419c:	5e                   	pop    esi
1001419d:	5b                   	pop    ebx
1001419e:	8b e5                	mov    esp,ebp
100141a0:	5d                   	pop    ebp
100141a1:	c2 04 00             	ret    0x4
100141a4:	cc                   	int3
100141a5:	cc                   	int3
100141a6:	cc                   	int3
100141a7:	cc                   	int3
100141a8:	cc                   	int3
100141a9:	cc                   	int3
100141aa:	cc                   	int3
100141ab:	cc                   	int3
100141ac:	cc                   	int3
100141ad:	cc                   	int3
100141ae:	cc                   	int3
100141af:	cc                   	int3
100141b0:	55                   	push   ebp
100141b1:	8b ec                	mov    ebp,esp
100141b3:	6a ff                	push   0xffffffff
100141b5:	68 30 66 01 10       	push   0x10016630
100141ba:	64 a1 00 00 00 00    	mov    eax,fs:0x0
100141c0:	50                   	push   eax
100141c1:	53                   	push   ebx
100141c2:	56                   	push   esi
100141c3:	57                   	push   edi
100141c4:	a1 04 10 02 10       	mov    eax,ds:0x10021004
100141c9:	33 c5                	xor    eax,ebp
100141cb:	50                   	push   eax
100141cc:	8d 45 f4             	lea    eax,[ebp-0xc]
100141cf:	64 a3 00 00 00 00    	mov    fs:0x0,eax
100141d5:	8b f1                	mov    esi,ecx
100141d7:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
100141da:	f6 c3 02             	test   bl,0x2
100141dd:	74 40                	je     0x1001421f
100141df:	68 60 4a 01 10       	push   0x10014a60
100141e4:	ff 76 fc             	push   DWORD PTR [esi-0x4]
100141e7:	8d 7e fc             	lea    edi,[esi-0x4]
100141ea:	6a 10                	push   0x10
100141ec:	56                   	push   esi
100141ed:	e8 17 0a 00 00       	call   0x10014c09
100141f2:	f6 c3 01             	test   bl,0x1
100141f5:	74 12                	je     0x10014209
100141f7:	8b 0f                	mov    ecx,DWORD PTR [edi]
100141f9:	c1 e1 04             	shl    ecx,0x4
100141fc:	83 c1 04             	add    ecx,0x4
100141ff:	51                   	push   ecx
10014200:	57                   	push   edi
10014201:	e8 39 0b 00 00       	call   0x10014d3f
10014206:	83 c4 08             	add    esp,0x8
10014209:	8b c7                	mov    eax,edi
1001420b:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1001420e:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10014215:	59                   	pop    ecx
10014216:	5f                   	pop    edi
10014217:	5e                   	pop    esi
10014218:	5b                   	pop    ebx
10014219:	8b e5                	mov    esp,ebp
1001421b:	5d                   	pop    ebp
1001421c:	c2 04 00             	ret    0x4
1001421f:	e8 3c 08 00 00       	call   0x10014a60
10014224:	f6 c3 01             	test   bl,0x1
10014227:	74 0b                	je     0x10014234
10014229:	6a 10                	push   0x10
1001422b:	56                   	push   esi
1001422c:	e8                   	.byte 0xe8
1001422d:	f7                   	.byte 0xf7
1001422e:	0a 00                	or     al,BYTE PTR [eax]


===== VA 0x10014250 | ?d_func@AFStructure@@IAEPAVAFStructurePrivate@@XZ | ?d_func@SubjectOperationsStructure@@IAEPAVSubjectOperationsStructurePrivate@@XZ | span 0x40 =====
Disassembly of section .text:

10014250 <.text+0x13250>:
10014250:	8b 41 0c             	mov    eax,DWORD PTR [ecx+0xc]
10014253:	c3                   	ret
10014254:	cc                   	int3
10014255:	cc                   	int3
10014256:	cc                   	int3
10014257:	cc                   	int3
10014258:	cc                   	int3
10014259:	cc                   	int3
1001425a:	cc                   	int3
1001425b:	cc                   	int3
1001425c:	cc                   	int3
1001425d:	cc                   	int3
1001425e:	cc                   	int3
1001425f:	cc                   	int3
10014260:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
10014263:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
10014266:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
10014269:	c3                   	ret
1001426a:	cc                   	int3
1001426b:	cc                   	int3
1001426c:	cc                   	int3
1001426d:	cc                   	int3
1001426e:	cc                   	int3
1001426f:	cc                   	int3
10014270:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
10014273:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
10014276:	8b 00                	mov    eax,DWORD PTR [eax]
10014278:	c3                   	ret
10014279:	cc                   	int3
1001427a:	cc                   	int3
1001427b:	cc                   	int3
1001427c:	cc                   	int3
1001427d:	cc                   	int3
1001427e:	cc                   	int3
1001427f:	cc                   	int3
10014280:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
10014283:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
10014286:	8b 00                	mov    eax,DWORD PTR [eax]
10014288:	c3                   	ret
10014289:	cc                   	int3
1001428a:	cc                   	int3
1001428b:	cc                   	int3
1001428c:	cc                   	int3
1001428d:	cc                   	int3
1001428e:	cc                   	int3
1001428f:	cc                   	int3


===== VA 0x10014290 | ??0SubjectOperation@@IAE@PAVSubjectOperationPrivate@@@Z | span 0x160 =====
Disassembly of section .text:

10014290 <.text+0x13290>:
10014290:	55                   	push   ebp
10014291:	8b ec                	mov    ebp,esp
10014293:	51                   	push   ecx
10014294:	56                   	push   esi
10014295:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10014298:	8b f1                	mov    esi,ecx
1001429a:	89 75 fc             	mov    DWORD PTR [ebp-0x4],esi
1001429d:	e8 be 1c ff ff       	call   0x10005f60
100142a2:	c7 06 d0 75 01 10    	mov    DWORD PTR [esi],0x100175d0
100142a8:	8b c6                	mov    eax,esi
100142aa:	5e                   	pop    esi
100142ab:	8b e5                	mov    esp,ebp
100142ad:	5d                   	pop    ebp
100142ae:	c2 04 00             	ret    0x4
100142b1:	cc                   	int3
100142b2:	cc                   	int3
100142b3:	cc                   	int3
100142b4:	cc                   	int3
100142b5:	cc                   	int3
100142b6:	cc                   	int3
100142b7:	cc                   	int3
100142b8:	cc                   	int3
100142b9:	cc                   	int3
100142ba:	cc                   	int3
100142bb:	cc                   	int3
100142bc:	cc                   	int3
100142bd:	cc                   	int3
100142be:	cc                   	int3
100142bf:	cc                   	int3
100142c0:	55                   	push   ebp
100142c1:	8b ec                	mov    ebp,esp
100142c3:	6a ff                	push   0xffffffff
100142c5:	68 f2 6e 01 10       	push   0x10016ef2
100142ca:	64 a1 00 00 00 00    	mov    eax,fs:0x0
100142d0:	50                   	push   eax
100142d1:	51                   	push   ecx
100142d2:	56                   	push   esi
100142d3:	57                   	push   edi
100142d4:	a1 04 10 02 10       	mov    eax,ds:0x10021004
100142d9:	33 c5                	xor    eax,ebp
100142db:	50                   	push   eax
100142dc:	8d 45 f4             	lea    eax,[ebp-0xc]
100142df:	64 a3 00 00 00 00    	mov    fs:0x0,eax
100142e5:	8b f9                	mov    edi,ecx
100142e7:	89 7d f0             	mov    DWORD PTR [ebp-0x10],edi
100142ea:	68 b0 00 00 00       	push   0xb0
100142ef:	e8 fc 09 00 00       	call   0x10014cf0
100142f4:	8b f0                	mov    esi,eax
100142f6:	83 c4 04             	add    esp,0x4
100142f9:	89 75 f0             	mov    DWORD PTR [ebp-0x10],esi
100142fc:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10014303:	85 f6                	test   esi,esi
10014305:	74 40                	je     0x10014347
10014307:	68 b0 00 00 00       	push   0xb0
1001430c:	6a 00                	push   0x0
1001430e:	56                   	push   esi
1001430f:	e8 a0 17 00 00       	call   0x10015ab4
10014314:	83 c4 0c             	add    esp,0xc
10014317:	8b ce                	mov    ecx,esi
10014319:	e8 b2 1e ff ff       	call   0x100061d0
1001431e:	8d 86 98 00 00 00    	lea    eax,[esi+0x98]
10014324:	c7 06 ec 75 01 10    	mov    DWORD PTR [esi],0x100175ec
1001432a:	c7 40 14 07 00 00 00 	mov    DWORD PTR [eax+0x14],0x7
10014331:	c7 40 10 00 00 00 00 	mov    DWORD PTR [eax+0x10],0x0
10014338:	83 78 14 08          	cmp    DWORD PTR [eax+0x14],0x8
1001433c:	72 02                	jb     0x10014340
1001433e:	8b 00                	mov    eax,DWORD PTR [eax]
10014340:	33 c9                	xor    ecx,ecx
10014342:	66 89 08             	mov    WORD PTR [eax],cx
10014345:	eb 02                	jmp    0x10014349
10014347:	33 f6                	xor    esi,esi
10014349:	56                   	push   esi
1001434a:	8b cf                	mov    ecx,edi
1001434c:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
10014353:	e8 08 1c ff ff       	call   0x10005f60
10014358:	8b 47 04             	mov    eax,DWORD PTR [edi+0x4]
1001435b:	b9 7a 00 00 00       	mov    ecx,0x7a
10014360:	c7 07 d0 75 01 10    	mov    DWORD PTR [edi],0x100175d0
10014366:	66 89 48 58          	mov    WORD PTR [eax+0x58],cx
1001436a:	8b c7                	mov    eax,edi
1001436c:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1001436f:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10014376:	59                   	pop    ecx
10014377:	5f                   	pop    edi
10014378:	5e                   	pop    esi
10014379:	8b e5                	mov    esp,ebp
1001437b:	5d                   	pop    ebp
1001437c:	c3                   	ret
1001437d:	cc                   	int3
1001437e:	cc                   	int3
1001437f:	cc                   	int3
10014380:	55                   	push   ebp
10014381:	8b ec                	mov    ebp,esp
10014383:	6a ff                	push   0xffffffff
10014385:	68 18 6f 01 10       	push   0x10016f18
1001438a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10014390:	50                   	push   eax
10014391:	51                   	push   ecx
10014392:	56                   	push   esi
10014393:	a1 04 10 02 10       	mov    eax,ds:0x10021004
10014398:	33 c5                	xor    eax,ebp
1001439a:	50                   	push   eax
1001439b:	8d 45 f4             	lea    eax,[ebp-0xc]
1001439e:	64 a3 00 00 00 00    	mov    fs:0x0,eax
100143a4:	8b f1                	mov    esi,ecx
100143a6:	89 75 f0             	mov    DWORD PTR [ebp-0x10],esi
100143a9:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
100143ac:	c7 06 04 71 01 10    	mov    DWORD PTR [esi],0x10017104
100143b2:	8b 42 04             	mov    eax,DWORD PTR [edx+0x4]
100143b5:	89 46 04             	mov    DWORD PTR [esi+0x4],eax
100143b8:	8d 42 08             	lea    eax,[edx+0x8]
100143bb:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
100143c2:	50                   	push   eax
100143c3:	8d 4e 08             	lea    ecx,[esi+0x8]
100143c6:	c7 06 20 71 01 10    	mov    DWORD PTR [esi],0x10017120
100143cc:	e8 2f ce fe ff       	call   0x10001200
100143d1:	c7 06 d0 75 01 10    	mov    DWORD PTR [esi],0x100175d0
100143d7:	8b c6                	mov    eax,esi
100143d9:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
100143dc:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
100143e3:	59                   	pop    ecx
100143e4:	5e                   	pop    esi
100143e5:	8b e5                	mov    esp,ebp
100143e7:	5d                   	pop    ebp
100143e8:	c2 04 00             	ret    0x4
100143eb:	cc                   	int3
100143ec:	cc                   	int3
100143ed:	cc                   	int3
100143ee:	cc                   	int3
100143ef:	cc                   	int3


===== VA 0x100143f0 | ??0SubjectOperationPrivate@@QAE@AAV0@@Z | span 0x80 =====
Disassembly of section .text:

100143f0 <.text+0x133f0>:
100143f0:	55                   	push   ebp
100143f1:	8b ec                	mov    ebp,esp
100143f3:	6a ff                	push   0xffffffff
100143f5:	68 48 6f 01 10       	push   0x10016f48
100143fa:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10014400:	50                   	push   eax
10014401:	51                   	push   ecx
10014402:	56                   	push   esi
10014403:	57                   	push   edi
10014404:	a1 04 10 02 10       	mov    eax,ds:0x10021004
10014409:	33 c5                	xor    eax,ebp
1001440b:	50                   	push   eax
1001440c:	8d 45 f4             	lea    eax,[ebp-0xc]
1001440f:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10014415:	8b f9                	mov    edi,ecx
10014417:	89 7d f0             	mov    DWORD PTR [ebp-0x10],edi
1001441a:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
1001441d:	56                   	push   esi
1001441e:	e8 3d 1c ff ff       	call   0x10006060
10014423:	33 c0                	xor    eax,eax
10014425:	c7 07 ec 75 01 10    	mov    DWORD PTR [edi],0x100175ec
1001442b:	6a ff                	push   0xffffffff
1001442d:	8d 8f 98 00 00 00    	lea    ecx,[edi+0x98]
10014433:	81 c6 98 00 00 00    	add    esi,0x98
10014439:	c7 41 14 07 00 00 00 	mov    DWORD PTR [ecx+0x14],0x7
10014440:	50                   	push   eax
10014441:	c7 41 10 00 00 00 00 	mov    DWORD PTR [ecx+0x10],0x0
10014448:	56                   	push   esi
10014449:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10014450:	66 89 01             	mov    WORD PTR [ecx],ax
10014453:	e8 d8 38 ff ff       	call   0x10007d30
10014458:	8b c7                	mov    eax,edi
1001445a:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1001445d:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10014464:	59                   	pop    ecx
10014465:	5f                   	pop    edi
10014466:	5e                   	pop    esi
10014467:	8b e5                	mov    esp,ebp
10014469:	5d                   	pop    ebp
1001446a:	c2 04 00             	ret    0x4
1001446d:	cc                   	int3
1001446e:	cc                   	int3
1001446f:	cc                   	int3


===== VA 0x10014470 | ??0SubjectOperationPrivate@@QAE@XZ | span 0x50 =====
Disassembly of section .text:

10014470 <.text+0x13470>:
10014470:	55                   	push   ebp
10014471:	8b ec                	mov    ebp,esp
10014473:	51                   	push   ecx
10014474:	56                   	push   esi
10014475:	8b f1                	mov    esi,ecx
10014477:	89 75 fc             	mov    DWORD PTR [ebp-0x4],esi
1001447a:	e8 51 1d ff ff       	call   0x100061d0
1001447f:	c7 06 ec 75 01 10    	mov    DWORD PTR [esi],0x100175ec
10014485:	33 c0                	xor    eax,eax
10014487:	c7 86 ac 00 00 00 07 	mov    DWORD PTR [esi+0xac],0x7
1001448e:	00 00 00 
10014491:	c7 86 a8 00 00 00 00 	mov    DWORD PTR [esi+0xa8],0x0
10014498:	00 00 00 
1001449b:	66 89 86 98 00 00 00 	mov    WORD PTR [esi+0x98],ax
100144a2:	8b c6                	mov    eax,esi
100144a4:	5e                   	pop    esi
100144a5:	8b e5                	mov    esp,ebp
100144a7:	5d                   	pop    ebp
100144a8:	c3                   	ret
100144a9:	cc                   	int3
100144aa:	cc                   	int3
100144ab:	cc                   	int3
100144ac:	cc                   	int3
100144ad:	cc                   	int3
100144ae:	cc                   	int3
100144af:	cc                   	int3
100144b0:	c7 01 d0 75 01 10    	mov    DWORD PTR [ecx],0x100175d0
100144b6:	e9 c5 1e ff ff       	jmp    0x10006380
100144bb:	cc                   	int3
100144bc:	cc                   	int3
100144bd:	cc                   	int3
100144be:	cc                   	int3
100144bf:	cc                   	int3


===== VA 0x100144c0 | ??1SubjectOperationPrivate@@UAE@XZ | span 0x50 =====
Disassembly of section .text:

100144c0 <.text+0x134c0>:
100144c0:	56                   	push   esi
100144c1:	57                   	push   edi
100144c2:	8b f9                	mov    edi,ecx
100144c4:	8d b7 98 00 00 00    	lea    esi,[edi+0x98]
100144ca:	c7 07 ec 75 01 10    	mov    DWORD PTR [edi],0x100175ec
100144d0:	8b 46 14             	mov    eax,DWORD PTR [esi+0x14]
100144d3:	83 f8 08             	cmp    eax,0x8
100144d6:	72 0e                	jb     0x100144e6
100144d8:	6a 02                	push   0x2
100144da:	40                   	inc    eax
100144db:	50                   	push   eax
100144dc:	ff 36                	push   DWORD PTR [esi]
100144de:	e8 9d d7 fe ff       	call   0x10001c80
100144e3:	83 c4 0c             	add    esp,0xc
100144e6:	c7 46 14 07 00 00 00 	mov    DWORD PTR [esi+0x14],0x7
100144ed:	83 7e 14 08          	cmp    DWORD PTR [esi+0x14],0x8
100144f1:	c7 46 10 00 00 00 00 	mov    DWORD PTR [esi+0x10],0x0
100144f8:	72 02                	jb     0x100144fc
100144fa:	8b 36                	mov    esi,DWORD PTR [esi]
100144fc:	33 c0                	xor    eax,eax
100144fe:	8b cf                	mov    ecx,edi
10014500:	5f                   	pop    edi
10014501:	66 89 06             	mov    WORD PTR [esi],ax
10014504:	5e                   	pop    esi
10014505:	e9 c6 1e ff ff       	jmp    0x100063d0
1001450a:	cc                   	int3
1001450b:	cc                   	int3
1001450c:	cc                   	int3
1001450d:	cc                   	int3
1001450e:	cc                   	int3
1001450f:	cc                   	int3


===== VA 0x10014510 | ??4SubjectOperationPrivate@@QAEAAV0@ABV0@@Z | span 0x220 =====
Disassembly of section .text:

10014510 <.text+0x13510>:
10014510:	55                   	push   ebp
10014511:	8b ec                	mov    ebp,esp
10014513:	56                   	push   esi
10014514:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
10014517:	57                   	push   edi
10014518:	56                   	push   esi
10014519:	8b f9                	mov    edi,ecx
1001451b:	e8 10 25 ff ff       	call   0x10006a30
10014520:	81 c6 98 00 00 00    	add    esi,0x98
10014526:	8d 8f 98 00 00 00    	lea    ecx,[edi+0x98]
1001452c:	3b ce                	cmp    ecx,esi
1001452e:	74 0a                	je     0x1001453a
10014530:	6a ff                	push   0xffffffff
10014532:	6a 00                	push   0x0
10014534:	56                   	push   esi
10014535:	e8 f6 37 ff ff       	call   0x10007d30
1001453a:	8b c7                	mov    eax,edi
1001453c:	5f                   	pop    edi
1001453d:	5e                   	pop    esi
1001453e:	5d                   	pop    ebp
1001453f:	c2 04 00             	ret    0x4
10014542:	cc                   	int3
10014543:	cc                   	int3
10014544:	cc                   	int3
10014545:	cc                   	int3
10014546:	cc                   	int3
10014547:	cc                   	int3
10014548:	cc                   	int3
10014549:	cc                   	int3
1001454a:	cc                   	int3
1001454b:	cc                   	int3
1001454c:	cc                   	int3
1001454d:	cc                   	int3
1001454e:	cc                   	int3
1001454f:	cc                   	int3
10014550:	55                   	push   ebp
10014551:	8b ec                	mov    ebp,esp
10014553:	6a ff                	push   0xffffffff
10014555:	68 30 66 01 10       	push   0x10016630
1001455a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10014560:	50                   	push   eax
10014561:	53                   	push   ebx
10014562:	56                   	push   esi
10014563:	57                   	push   edi
10014564:	a1 04 10 02 10       	mov    eax,ds:0x10021004
10014569:	33 c5                	xor    eax,ebp
1001456b:	50                   	push   eax
1001456c:	8d 45 f4             	lea    eax,[ebp-0xc]
1001456f:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10014575:	8b f1                	mov    esi,ecx
10014577:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
1001457a:	f6 c3 02             	test   bl,0x2
1001457d:	74 44                	je     0x100145c3
1001457f:	68 b0 44 01 10       	push   0x100144b0
10014584:	ff 76 fc             	push   DWORD PTR [esi-0x4]
10014587:	8d 7e fc             	lea    edi,[esi-0x4]
1001458a:	6a 14                	push   0x14
1001458c:	56                   	push   esi
1001458d:	e8 77 06 00 00       	call   0x10014c09
10014592:	f6 c3 01             	test   bl,0x1
10014595:	74 16                	je     0x100145ad
10014597:	8b 0f                	mov    ecx,DWORD PTR [edi]
10014599:	8d 0c 89             	lea    ecx,[ecx+ecx*4]
1001459c:	8d 0c 8d 04 00 00 00 	lea    ecx,[ecx*4+0x4]
100145a3:	51                   	push   ecx
100145a4:	57                   	push   edi
100145a5:	e8 95 07 00 00       	call   0x10014d3f
100145aa:	83 c4 08             	add    esp,0x8
100145ad:	8b c7                	mov    eax,edi
100145af:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
100145b2:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
100145b9:	59                   	pop    ecx
100145ba:	5f                   	pop    edi
100145bb:	5e                   	pop    esi
100145bc:	5b                   	pop    ebx
100145bd:	8b e5                	mov    esp,ebp
100145bf:	5d                   	pop    ebp
100145c0:	c2 04 00             	ret    0x4
100145c3:	c7 06 d0 75 01 10    	mov    DWORD PTR [esi],0x100175d0
100145c9:	e8 b2 1d ff ff       	call   0x10006380
100145ce:	f6 c3 01             	test   bl,0x1
100145d1:	74 0b                	je     0x100145de
100145d3:	6a 14                	push   0x14
100145d5:	56                   	push   esi
100145d6:	e8 4d 07 00 00       	call   0x10014d28
100145db:	83 c4 08             	add    esp,0x8
100145de:	8b c6                	mov    eax,esi
100145e0:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
100145e3:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
100145ea:	59                   	pop    ecx
100145eb:	5f                   	pop    edi
100145ec:	5e                   	pop    esi
100145ed:	5b                   	pop    ebx
100145ee:	8b e5                	mov    esp,ebp
100145f0:	5d                   	pop    ebp
100145f1:	c2 04 00             	ret    0x4
100145f4:	cc                   	int3
100145f5:	cc                   	int3
100145f6:	cc                   	int3
100145f7:	cc                   	int3
100145f8:	cc                   	int3
100145f9:	cc                   	int3
100145fa:	cc                   	int3
100145fb:	cc                   	int3
100145fc:	cc                   	int3
100145fd:	cc                   	int3
100145fe:	cc                   	int3
100145ff:	cc                   	int3
10014600:	55                   	push   ebp
10014601:	8b ec                	mov    ebp,esp
10014603:	6a ff                	push   0xffffffff
10014605:	68 30 66 01 10       	push   0x10016630
1001460a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10014610:	50                   	push   eax
10014611:	53                   	push   ebx
10014612:	56                   	push   esi
10014613:	57                   	push   edi
10014614:	a1 04 10 02 10       	mov    eax,ds:0x10021004
10014619:	33 c5                	xor    eax,ebp
1001461b:	50                   	push   eax
1001461c:	8d 45 f4             	lea    eax,[ebp-0xc]
1001461f:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10014625:	8b f1                	mov    esi,ecx
10014627:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
1001462a:	f6 c3 02             	test   bl,0x2
1001462d:	74 44                	je     0x10014673
1001462f:	68 c0 44 01 10       	push   0x100144c0
10014634:	ff 76 fc             	push   DWORD PTR [esi-0x4]
10014637:	8d 7e fc             	lea    edi,[esi-0x4]
1001463a:	68 b0 00 00 00       	push   0xb0
1001463f:	56                   	push   esi
10014640:	e8 c4 05 00 00       	call   0x10014c09
10014645:	f6 c3 01             	test   bl,0x1
10014648:	74 13                	je     0x1001465d
1001464a:	69 0f b0 00 00 00    	imul   ecx,DWORD PTR [edi],0xb0
10014650:	83 c1 04             	add    ecx,0x4
10014653:	51                   	push   ecx
10014654:	57                   	push   edi
10014655:	e8 e5 06 00 00       	call   0x10014d3f
1001465a:	83 c4 08             	add    esp,0x8
1001465d:	8b c7                	mov    eax,edi
1001465f:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10014662:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10014669:	59                   	pop    ecx
1001466a:	5f                   	pop    edi
1001466b:	5e                   	pop    esi
1001466c:	5b                   	pop    ebx
1001466d:	8b e5                	mov    esp,ebp
1001466f:	5d                   	pop    ebp
10014670:	c2 04 00             	ret    0x4
10014673:	8d be 98 00 00 00    	lea    edi,[esi+0x98]
10014679:	c7 06 ec 75 01 10    	mov    DWORD PTR [esi],0x100175ec
1001467f:	8b 47 14             	mov    eax,DWORD PTR [edi+0x14]
10014682:	83 f8 08             	cmp    eax,0x8
10014685:	72 0e                	jb     0x10014695
10014687:	6a 02                	push   0x2
10014689:	40                   	inc    eax
1001468a:	50                   	push   eax
1001468b:	ff 37                	push   DWORD PTR [edi]
1001468d:	e8 ee d5 fe ff       	call   0x10001c80
10014692:	83 c4 0c             	add    esp,0xc
10014695:	c7 47 14 07 00 00 00 	mov    DWORD PTR [edi+0x14],0x7
1001469c:	83 7f 14 08          	cmp    DWORD PTR [edi+0x14],0x8
100146a0:	c7 47 10 00 00 00 00 	mov    DWORD PTR [edi+0x10],0x0
100146a7:	72 02                	jb     0x100146ab
100146a9:	8b 3f                	mov    edi,DWORD PTR [edi]
100146ab:	33 c0                	xor    eax,eax
100146ad:	8b ce                	mov    ecx,esi
100146af:	66 89 07             	mov    WORD PTR [edi],ax
100146b2:	e8 19 1d ff ff       	call   0x100063d0
100146b7:	f6 c3 01             	test   bl,0x1
100146ba:	74 0e                	je     0x100146ca
100146bc:	68 b0 00 00 00       	push   0xb0
100146c1:	56                   	push   esi
100146c2:	e8 61 06 00 00       	call   0x10014d28
100146c7:	83 c4 08             	add    esp,0x8
100146ca:	8b c6                	mov    eax,esi
100146cc:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
100146cf:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
100146d6:	59                   	pop    ecx
100146d7:	5f                   	pop    edi
100146d8:	5e                   	pop    esi
100146d9:	5b                   	pop    ebx
100146da:	8b e5                	mov    esp,ebp
100146dc:	5d                   	pop    ebp
100146dd:	c2 04 00             	ret    0x4
100146e0:	e9 8b 38 ff ff       	jmp    0x10007f70
100146e5:	cc                   	int3
100146e6:	cc                   	int3
100146e7:	cc                   	int3
100146e8:	cc                   	int3
100146e9:	cc                   	int3
100146ea:	cc                   	int3
100146eb:	cc                   	int3
100146ec:	cc                   	int3
100146ed:	cc                   	int3
100146ee:	cc                   	int3
100146ef:	cc                   	int3
100146f0:	55                   	push   ebp
100146f1:	8b ec                	mov    ebp,esp
100146f3:	5d                   	pop    ebp
100146f4:	e9 a7 43 ff ff       	jmp    0x10008aa0
100146f9:	cc                   	int3
100146fa:	cc                   	int3
100146fb:	cc                   	int3
100146fc:	cc                   	int3
100146fd:	cc                   	int3
100146fe:	cc                   	int3
100146ff:	cc                   	int3
10014700:	e9 0b 4c ff ff       	jmp    0x10009310
10014705:	cc                   	int3
10014706:	cc                   	int3
10014707:	cc                   	int3
10014708:	cc                   	int3
10014709:	cc                   	int3
1001470a:	cc                   	int3
1001470b:	cc                   	int3
1001470c:	cc                   	int3
1001470d:	cc                   	int3
1001470e:	cc                   	int3
1001470f:	cc                   	int3
10014710:	55                   	push   ebp
10014711:	8b ec                	mov    ebp,esp
10014713:	51                   	push   ecx
10014714:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
10014717:	05 98 00 00 00       	add    eax,0x98
1001471c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10014723:	83 78 14 08          	cmp    DWORD PTR [eax+0x14],0x8
10014727:	72 02                	jb     0x1001472b
10014729:	8b 00                	mov    eax,DWORD PTR [eax]
1001472b:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
1001472e:	50                   	push   eax
1001472f:	e8                   	.byte 0xe8


===== VA 0x100148a0 | ??0SubjectOperationsStructure@@IAE@PAVSubjectOperationsStructurePrivate@@@Z | span 0x110 =====
Disassembly of section .text:

100148a0 <.text+0x138a0>:
100148a0:	55                   	push   ebp
100148a1:	8b ec                	mov    ebp,esp
100148a3:	51                   	push   ecx
100148a4:	56                   	push   esi
100148a5:	ff 75 08             	push   DWORD PTR [ebp+0x8]
100148a8:	8b f1                	mov    esi,ecx
100148aa:	89 75 fc             	mov    DWORD PTR [ebp-0x4],esi
100148ad:	e8 1e 5c ff ff       	call   0x1000a4d0
100148b2:	c7 06 c4 75 01 10    	mov    DWORD PTR [esi],0x100175c4
100148b8:	8b c6                	mov    eax,esi
100148ba:	5e                   	pop    esi
100148bb:	8b e5                	mov    esp,ebp
100148bd:	5d                   	pop    ebp
100148be:	c2 04 00             	ret    0x4
100148c1:	cc                   	int3
100148c2:	cc                   	int3
100148c3:	cc                   	int3
100148c4:	cc                   	int3
100148c5:	cc                   	int3
100148c6:	cc                   	int3
100148c7:	cc                   	int3
100148c8:	cc                   	int3
100148c9:	cc                   	int3
100148ca:	cc                   	int3
100148cb:	cc                   	int3
100148cc:	cc                   	int3
100148cd:	cc                   	int3
100148ce:	cc                   	int3
100148cf:	cc                   	int3
100148d0:	55                   	push   ebp
100148d1:	8b ec                	mov    ebp,esp
100148d3:	6a ff                	push   0xffffffff
100148d5:	68 07 6b 01 10       	push   0x10016b07
100148da:	64 a1 00 00 00 00    	mov    eax,fs:0x0
100148e0:	50                   	push   eax
100148e1:	83 ec 08             	sub    esp,0x8
100148e4:	56                   	push   esi
100148e5:	57                   	push   edi
100148e6:	a1 04 10 02 10       	mov    eax,ds:0x10021004
100148eb:	33 c5                	xor    eax,ebp
100148ed:	50                   	push   eax
100148ee:	8d 45 f4             	lea    eax,[ebp-0xc]
100148f1:	64 a3 00 00 00 00    	mov    fs:0x0,eax
100148f7:	8b f9                	mov    edi,ecx
100148f9:	89 7d f0             	mov    DWORD PTR [ebp-0x10],edi
100148fc:	6a 28                	push   0x28
100148fe:	e8 ed 03 00 00       	call   0x10014cf0
10014903:	8b f0                	mov    esi,eax
10014905:	83 c4 04             	add    esp,0x4
10014908:	89 75 ec             	mov    DWORD PTR [ebp-0x14],esi
1001490b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10014912:	85 f6                	test   esi,esi
10014914:	74 1e                	je     0x10014934
10014916:	0f 57 c0             	xorps  xmm0,xmm0
10014919:	8b ce                	mov    ecx,esi
1001491b:	0f 11 06             	movups XMMWORD PTR [esi],xmm0
1001491e:	0f 11 46 10          	movups XMMWORD PTR [esi+0x10],xmm0
10014922:	66 0f d6 46 20       	movq   QWORD PTR [esi+0x20],xmm0
10014927:	e8 84 5d ff ff       	call   0x1000a6b0
1001492c:	c7 06 f4 75 01 10    	mov    DWORD PTR [esi],0x100175f4
10014932:	eb 02                	jmp    0x10014936
10014934:	33 f6                	xor    esi,esi
10014936:	56                   	push   esi
10014937:	8b cf                	mov    ecx,edi
10014939:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
10014940:	e8 8b 5b ff ff       	call   0x1000a4d0
10014945:	8b cf                	mov    ecx,edi
10014947:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [ebp-0x4],0x1
1001494e:	c7 07 c4 75 01 10    	mov    DWORD PTR [edi],0x100175c4
10014954:	e8 37 64 ff ff       	call   0x1000ad90
10014959:	51                   	push   ecx
1001495a:	8b cc                	mov    ecx,esp
1001495c:	8b f0                	mov    esi,eax
1001495e:	68 f8 75 01 10       	push   0x100175f8
10014963:	e8 98 d3 ff ff       	call   0x10011d00
10014968:	8b ce                	mov    ecx,esi
1001496a:	e8 11 8a ff ff       	call   0x1000d380
1001496f:	6a 00                	push   0x0
10014971:	8b ce                	mov    ecx,esi
10014973:	e8 e8 53 ff ff       	call   0x10009d60
10014978:	6a 00                	push   0x0
1001497a:	8b ce                	mov    ecx,esi
1001497c:	e8 bf 53 ff ff       	call   0x10009d40
10014981:	6a 00                	push   0x0
10014983:	8b ce                	mov    ecx,esi
10014985:	e8 26 55 ff ff       	call   0x10009eb0
1001498a:	8b cf                	mov    ecx,edi
1001498c:	e8 6f 67 ff ff       	call   0x1000b100
10014991:	8b c7                	mov    eax,edi
10014993:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10014996:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1001499d:	59                   	pop    ecx
1001499e:	5f                   	pop    edi
1001499f:	5e                   	pop    esi
100149a0:	8b e5                	mov    esp,ebp
100149a2:	5d                   	pop    ebp
100149a3:	c3                   	ret
100149a4:	cc                   	int3
100149a5:	cc                   	int3
100149a6:	cc                   	int3
100149a7:	cc                   	int3
100149a8:	cc                   	int3
100149a9:	cc                   	int3
100149aa:	cc                   	int3
100149ab:	cc                   	int3
100149ac:	cc                   	int3
100149ad:	cc                   	int3
100149ae:	cc                   	int3
100149af:	cc                   	int3


===== VA 0x100149b0 | ??0SubjectOperationsStructurePrivate@@QAE@ABV0@@Z | span 0x90 =====
Disassembly of section .text:

100149b0 <.text+0x139b0>:
100149b0:	55                   	push   ebp
100149b1:	8b ec                	mov    ebp,esp
100149b3:	6a ff                	push   0xffffffff
100149b5:	68 a6 5b 01 10       	push   0x10015ba6
100149ba:	64 a1 00 00 00 00    	mov    eax,fs:0x0
100149c0:	50                   	push   eax
100149c1:	51                   	push   ecx
100149c2:	56                   	push   esi
100149c3:	57                   	push   edi
100149c4:	a1 04 10 02 10       	mov    eax,ds:0x10021004
100149c9:	33 c5                	xor    eax,ebp
100149cb:	50                   	push   eax
100149cc:	8d 45 f4             	lea    eax,[ebp-0xc]
100149cf:	64 a3 00 00 00 00    	mov    fs:0x0,eax
100149d5:	8b f9                	mov    edi,ecx
100149d7:	89 7d f0             	mov    DWORD PTR [ebp-0x10],edi
100149da:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
100149dd:	8d 4f 04             	lea    ecx,[edi+0x4]
100149e0:	c7 07 d8 72 01 10    	mov    DWORD PTR [edi],0x100172d8
100149e6:	8d 46 04             	lea    eax,[esi+0x4]
100149e9:	50                   	push   eax
100149ea:	e8 11 c8 fe ff       	call   0x10001200
100149ef:	8d 46 10             	lea    eax,[esi+0x10]
100149f2:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
100149f9:	50                   	push   eax
100149fa:	8d 4f 10             	lea    ecx,[edi+0x10]
100149fd:	e8 fe c7 fe ff       	call   0x10001200
10014a02:	8d 45 0b             	lea    eax,[ebp+0xb]
10014a05:	c6 45 fc 01          	mov    BYTE PTR [ebp-0x4],0x1
10014a09:	50                   	push   eax
10014a0a:	8d 46 1c             	lea    eax,[esi+0x1c]
10014a0d:	8d 4f 1c             	lea    ecx,[edi+0x1c]
10014a10:	50                   	push   eax
10014a11:	89 4d 08             	mov    DWORD PTR [ebp+0x8],ecx
10014a14:	e8 e7 c5 fe ff       	call   0x10001000
10014a19:	8b 46 24             	mov    eax,DWORD PTR [esi+0x24]
10014a1c:	89 47 24             	mov    DWORD PTR [edi+0x24],eax
10014a1f:	8b c7                	mov    eax,edi
10014a21:	c7 07 f4 75 01 10    	mov    DWORD PTR [edi],0x100175f4
10014a27:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10014a2a:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10014a31:	59                   	pop    ecx
10014a32:	5f                   	pop    edi
10014a33:	5e                   	pop    esi
10014a34:	8b e5                	mov    esp,ebp
10014a36:	5d                   	pop    ebp
10014a37:	c2 04 00             	ret    0x4
10014a3a:	cc                   	int3
10014a3b:	cc                   	int3
10014a3c:	cc                   	int3
10014a3d:	cc                   	int3
10014a3e:	cc                   	int3
10014a3f:	cc                   	int3


===== VA 0x10014a40 | ??0SubjectOperationsStructurePrivate@@QAE@XZ | span 0x30 =====
Disassembly of section .text:

10014a40 <.text+0x13a40>:
10014a40:	55                   	push   ebp
10014a41:	8b ec                	mov    ebp,esp
10014a43:	51                   	push   ecx
10014a44:	56                   	push   esi
10014a45:	8b f1                	mov    esi,ecx
10014a47:	89 75 fc             	mov    DWORD PTR [ebp-0x4],esi
10014a4a:	e8 61 5c ff ff       	call   0x1000a6b0
10014a4f:	c7 06 f4 75 01 10    	mov    DWORD PTR [esi],0x100175f4
10014a55:	8b c6                	mov    eax,esi
10014a57:	5e                   	pop    esi
10014a58:	8b e5                	mov    esp,ebp
10014a5a:	5d                   	pop    ebp
10014a5b:	c3                   	ret
10014a5c:	cc                   	int3
10014a5d:	cc                   	int3
10014a5e:	cc                   	int3
10014a5f:	cc                   	int3
10014a60:	c7 01 c4 75 01 10    	mov    DWORD PTR [ecx],0x100175c4
10014a66:	e9 e5 5c ff ff       	jmp    0x1000a750
10014a6b:	cc                   	int3
10014a6c:	cc                   	int3
10014a6d:	cc                   	int3
10014a6e:	cc                   	int3
10014a6f:	cc                   	int3


===== VA 0x10014a70 | ??1SubjectOperationsStructurePrivate@@EAE@XZ | span 0x220 =====
Disassembly of section .text:

10014a70 <.text+0x13a70>:
10014a70:	c7 01 f4 75 01 10    	mov    DWORD PTR [ecx],0x100175f4
10014a76:	e9 85 5d ff ff       	jmp    0x1000a800
10014a7b:	cc                   	int3
10014a7c:	cc                   	int3
10014a7d:	cc                   	int3
10014a7e:	cc                   	int3
10014a7f:	cc                   	int3
10014a80:	55                   	push   ebp
10014a81:	8b ec                	mov    ebp,esp
10014a83:	6a ff                	push   0xffffffff
10014a85:	68 30 66 01 10       	push   0x10016630
10014a8a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10014a90:	50                   	push   eax
10014a91:	53                   	push   ebx
10014a92:	56                   	push   esi
10014a93:	57                   	push   edi
10014a94:	a1 04 10 02 10       	mov    eax,ds:0x10021004
10014a99:	33 c5                	xor    eax,ebp
10014a9b:	50                   	push   eax
10014a9c:	8d 45 f4             	lea    eax,[ebp-0xc]
10014a9f:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10014aa5:	8b f1                	mov    esi,ecx
10014aa7:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
10014aaa:	f6 c3 02             	test   bl,0x2
10014aad:	74 44                	je     0x10014af3
10014aaf:	68 70 4a 01 10       	push   0x10014a70
10014ab4:	ff 76 fc             	push   DWORD PTR [esi-0x4]
10014ab7:	8d 7e fc             	lea    edi,[esi-0x4]
10014aba:	6a 28                	push   0x28
10014abc:	56                   	push   esi
10014abd:	e8 47 01 00 00       	call   0x10014c09
10014ac2:	f6 c3 01             	test   bl,0x1
10014ac5:	74 16                	je     0x10014add
10014ac7:	8b 0f                	mov    ecx,DWORD PTR [edi]
10014ac9:	8d 0c 89             	lea    ecx,[ecx+ecx*4]
10014acc:	8d 0c cd 04 00 00 00 	lea    ecx,[ecx*8+0x4]
10014ad3:	51                   	push   ecx
10014ad4:	57                   	push   edi
10014ad5:	e8 65 02 00 00       	call   0x10014d3f
10014ada:	83 c4 08             	add    esp,0x8
10014add:	8b c7                	mov    eax,edi
10014adf:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10014ae2:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10014ae9:	59                   	pop    ecx
10014aea:	5f                   	pop    edi
10014aeb:	5e                   	pop    esi
10014aec:	5b                   	pop    ebx
10014aed:	8b e5                	mov    esp,ebp
10014aef:	5d                   	pop    ebp
10014af0:	c2 04 00             	ret    0x4
10014af3:	c7 06 f4 75 01 10    	mov    DWORD PTR [esi],0x100175f4
10014af9:	e8 02 5d ff ff       	call   0x1000a800
10014afe:	f6 c3 01             	test   bl,0x1
10014b01:	74 0b                	je     0x10014b0e
10014b03:	6a 28                	push   0x28
10014b05:	56                   	push   esi
10014b06:	e8 1d 02 00 00       	call   0x10014d28
10014b0b:	83 c4 08             	add    esp,0x8
10014b0e:	8b c6                	mov    eax,esi
10014b10:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10014b13:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10014b1a:	59                   	pop    ecx
10014b1b:	5f                   	pop    edi
10014b1c:	5e                   	pop    esi
10014b1d:	5b                   	pop    ebx
10014b1e:	8b e5                	mov    esp,ebp
10014b20:	5d                   	pop    ebp
10014b21:	c2 04 00             	ret    0x4
10014b24:	cc                   	int3
10014b25:	cc                   	int3
10014b26:	cc                   	int3
10014b27:	cc                   	int3
10014b28:	cc                   	int3
10014b29:	cc                   	int3
10014b2a:	cc                   	int3
10014b2b:	cc                   	int3
10014b2c:	cc                   	int3
10014b2d:	cc                   	int3
10014b2e:	cc                   	int3
10014b2f:	cc                   	int3
10014b30:	55                   	push   ebp
10014b31:	8b ec                	mov    ebp,esp
10014b33:	5d                   	pop    ebp
10014b34:	e9 e7 70 ff ff       	jmp    0x1000bc20
10014b39:	cc                   	int3
10014b3a:	cc                   	int3
10014b3b:	cc                   	int3
10014b3c:	cc                   	int3
10014b3d:	cc                   	int3
10014b3e:	cc                   	int3
10014b3f:	cc                   	int3
10014b40:	55                   	push   ebp
10014b41:	8b ec                	mov    ebp,esp
10014b43:	6a ff                	push   0xffffffff
10014b45:	68 3f 6b 01 10       	push   0x10016b3f
10014b4a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10014b50:	50                   	push   eax
10014b51:	51                   	push   ecx
10014b52:	a1 04 10 02 10       	mov    eax,ds:0x10021004
10014b57:	33 c5                	xor    eax,ebp
10014b59:	50                   	push   eax
10014b5a:	8d 45 f4             	lea    eax,[ebp-0xc]
10014b5d:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10014b63:	6a 14                	push   0x14
10014b65:	e8 86 01 00 00       	call   0x10014cf0
10014b6a:	83 c4 04             	add    esp,0x4
10014b6d:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
10014b70:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10014b77:	85 c0                	test   eax,eax
10014b79:	74 16                	je     0x10014b91
10014b7b:	8b c8                	mov    ecx,eax
10014b7d:	e8 3e f7 ff ff       	call   0x100142c0
10014b82:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10014b85:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10014b8c:	59                   	pop    ecx
10014b8d:	8b e5                	mov    esp,ebp
10014b8f:	5d                   	pop    ebp
10014b90:	c3                   	ret
10014b91:	33 c0                	xor    eax,eax
10014b93:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10014b96:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10014b9d:	59                   	pop    ecx
10014b9e:	8b e5                	mov    esp,ebp
10014ba0:	5d                   	pop    ebp
10014ba1:	c3                   	ret
10014ba2:	cc                   	int3
10014ba3:	cc                   	int3
10014ba4:	cc                   	int3
10014ba5:	cc                   	int3
10014ba6:	cc                   	int3
10014ba7:	cc                   	int3
10014ba8:	cc                   	int3
10014ba9:	cc                   	int3
10014baa:	cc                   	int3
10014bab:	cc                   	int3
10014bac:	cc                   	int3
10014bad:	cc                   	int3
10014bae:	cc                   	int3
10014baf:	cc                   	int3
10014bb0:	8b 01                	mov    eax,DWORD PTR [ecx]
10014bb2:	56                   	push   esi
10014bb3:	ff 50 04             	call   DWORD PTR [eax+0x4]
10014bb6:	8b f0                	mov    esi,eax
10014bb8:	6a 00                	push   0x0
10014bba:	8b ce                	mov    ecx,esi
10014bbc:	e8 7f 51 ff ff       	call   0x10009d40
10014bc1:	6a 00                	push   0x0
10014bc3:	8b ce                	mov    ecx,esi
10014bc5:	e8 96 51 ff ff       	call   0x10009d60
10014bca:	6a 00                	push   0x0
10014bcc:	8b ce                	mov    ecx,esi
10014bce:	e8 dd 52 ff ff       	call   0x10009eb0
10014bd3:	8b c6                	mov    eax,esi
10014bd5:	5e                   	pop    esi
10014bd6:	c3                   	ret
10014bd7:	cc                   	int3
10014bd8:	cc                   	int3
10014bd9:	cc                   	int3
10014bda:	cc                   	int3
10014bdb:	cc                   	int3
10014bdc:	cc                   	int3
10014bdd:	cc                   	int3
10014bde:	cc                   	int3
10014bdf:	cc                   	int3
10014be0:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
10014be3:	8b 41 14             	mov    eax,DWORD PTR [ecx+0x14]
10014be6:	2b 41 10             	sub    eax,DWORD PTR [ecx+0x10]
10014be9:	c1 f8 02             	sar    eax,0x2
10014bec:	c3                   	ret
10014bed:	cc                   	int3
10014bee:	cc                   	int3
10014bef:	cc                   	int3
10014bf0:	55                   	push   ebp
10014bf1:	8b ec                	mov    ebp,esp
10014bf3:	5d                   	pop    ebp
10014bf4:	e9 07 67 ff ff       	jmp    0x1000b300
10014bf9:	cc                   	int3
10014bfa:	cc                   	int3
10014bfb:	cc                   	int3
10014bfc:	cc                   	int3
10014bfd:	cc                   	int3
10014bfe:	cc                   	int3
10014bff:	cc                   	int3
10014c00:	55                   	push   ebp
10014c01:	8b ec                	mov    ebp,esp
10014c03:	5d                   	pop    ebp
10014c04:	e9 57 6b ff ff       	jmp    0x1000b760
10014c09:	6a 0c                	push   0xc
10014c0b:	68 20 a3 01 10       	push   0x1001a320
10014c10:	e8 ab 04 00 00       	call   0x100150c0
10014c15:	c6 45 e7 00          	mov    BYTE PTR [ebp-0x19],0x0
10014c19:	8b 5d 0c             	mov    ebx,DWORD PTR [ebp+0xc]
10014c1c:	8b c3                	mov    eax,ebx
10014c1e:	8b 7d 10             	mov    edi,DWORD PTR [ebp+0x10]
10014c21:	0f af c7             	imul   eax,edi
10014c24:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
10014c27:	03 f0                	add    esi,eax
10014c29:	89 75 08             	mov    DWORD PTR [ebp+0x8],esi
10014c2c:	83 65 fc 00          	and    DWORD PTR [ebp-0x4],0x0
10014c30:	8b c7                	mov    eax,edi
10014c32:	4f                   	dec    edi
10014c33:	89 7d 10             	mov    DWORD PTR [ebp+0x10],edi
10014c36:	85 c0                	test   eax,eax
10014c38:	74 14                	je     0x10014c4e
10014c3a:	2b f3                	sub    esi,ebx
10014c3c:	89 75 08             	mov    DWORD PTR [ebp+0x8],esi
10014c3f:	8b 4d 14             	mov    ecx,DWORD PTR [ebp+0x14]
10014c42:	e8 65 04 00 00       	call   0x100150ac
10014c47:	8b ce                	mov    ecx,esi
10014c49:	ff 55 14             	call   DWORD PTR [ebp+0x14]
10014c4c:	eb e2                	jmp    0x10014c30
10014c4e:	b0 01                	mov    al,0x1
10014c50:	88 45 e7             	mov    BYTE PTR [ebp-0x19],al
10014c53:	c7 45 fc fe ff ff ff 	mov    DWORD PTR [ebp-0x4],0xfffffffe
10014c5a:	e8 14 00 00 00       	call   0x10014c73
10014c5f:	e8 a2 04 00 00       	call   0x10015106
10014c64:	c2 10 00             	ret    0x10
10014c67:	8b 7d 10             	mov    edi,DWORD PTR [ebp+0x10]
10014c6a:	8b 5d 0c             	mov    ebx,DWORD PTR [ebp+0xc]
10014c6d:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
10014c70:	8a 45 e7             	mov    al,BYTE PTR [ebp-0x19]
10014c73:	84 c0                	test   al,al
10014c75:	75 0b                	jne    0x10014c82
10014c77:	ff 75 14             	push   DWORD PTR [ebp+0x14]
10014c7a:	57                   	push   edi
10014c7b:	53                   	push   ebx
10014c7c:	56                   	push   esi
10014c7d:	e8 01 00 00 00       	call   0x10014c83
10014c82:	c3                   	ret
10014c83:	6a 18                	push   0x18
10014c85:	68 40 a3 01 10       	push   0x1001a340
10014c8a:	e8 31 04 00 00       	call   0x100150c0
10014c8f:	33                   	.byte 0x33


===== VA 0x10017148 | ??_7AbstractModelPrivate@@6B@ | span 0x94 =====


===== VA 0x100171dc | ??_7AElementPrivate@@6B@ | span 0xc =====


===== VA 0x100171e8 | ??_7AEBinaryLinkPrivate@@6B@ | span 0x88 =====


===== VA 0x10017270 | ??_7AFEBinaryLinkPrivate@@6B@ | span 0x8 =====


===== VA 0x10017278 | ??_7AFElementPrivate@@6B@ | span 0x60 =====


===== VA 0x100172d8 | ??_7AFStructurePrivate@@6B@ | span 0x58 =====


===== VA 0x10017330 | ??_7AIEBinaryLinkPrivate@@6B@ | span 0x8 =====


===== VA 0x10017338 | ??_7AIElementPrivate@@6B@ | span 0x28 =====


===== VA 0x10017360 | ??_7AIStructurePrivate@@6B@ | span 0x20c =====


===== VA 0x1001756c | ??_7ObjectsListPrivate@@6B@ | span 0x40 =====


===== VA 0x100175ac | ??_7ParametersListPrivate@@6B@ | span 0x10 =====


===== VA 0x100175bc | ??_7PrimaryModelPrivate@@6B@ | span 0x30 =====


===== VA 0x100175ec | ??_7SubjectOperationPrivate@@6B@ | span 0x8 =====


===== VA 0x100175f4 | ??_7SubjectOperationsStructurePrivate@@6B@ | span 0x220 =====
