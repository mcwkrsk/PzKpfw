
/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/MAIWmodels.dll:     file format pei-i386


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
