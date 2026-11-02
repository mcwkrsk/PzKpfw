
/mnt/data/is2_re_analysis_kit_stage1_17_continuation_2026-11-01/original/is.exe:     file format pei-i386


disassembly of section .text:

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
  4115fa:	8b 75 f0             	mov    esi,dword ptr [ebp-0x10]
  4115fd:	c7 45 fc 00 00 00 00 	mov    dword ptr [ebp-0x4],0x0
  411604:	85 f6                	test   esi,esi
  411606:	74 2e                	je     0x411636
  411608:	8b 1d ec 97 41 00    	mov    ebx,dword ptr ds:0x4197ec
  41160e:	8b 55 e8             	mov    edx,dword ptr [ebp-0x18]
  411611:	3b 55 ec             	cmp    edx,dword ptr [ebp-0x14]
  411614:	0f 95 c0             	setne  al
  411617:	84 c0                	test   al,al
  411619:	74 1b                	je     0x411636
  41161b:	8b 0a                	mov    ecx,dword ptr [edx]
  41161d:	85 f6                	test   esi,esi
  41161f:	74 07                	je     0x411628
  411621:	ff d3                	call   ebx
  411623:	8b 55 e8             	mov    edx,dword ptr [ebp-0x18]
  411626:	33 f6                	xor    esi,esi
  411628:	83 c2 04             	add    edx,0x4
  41162b:	83 f6 01             	xor    esi,0x1
  41162e:	89 55 e8             	mov    dword ptr [ebp-0x18],edx
  411631:	89 75 f0             	mov    dword ptr [ebp-0x10],esi
  411634:	75 db                	jne    0x411611
  411636:	8b 4d e4             	mov    ecx,dword ptr [ebp-0x1c]
  411639:	c7 45 fc 01 00 00 00 	mov    dword ptr [ebp-0x4],0x1
  411640:	8b 01                	mov    eax,dword ptr [ecx]
  411642:	85 c0                	test   eax,eax
  411644:	74 16                	je     0x41165c
  411646:	83 f8 ff             	cmp    eax,0xffffffff
  411649:	74 1b                	je     0x411666
  41164b:	83 c8 ff             	or     eax,0xffffffff
  41164e:	f0 0f c1 01          	lock xadd dword ptr [ecx],eax
  411652:	0f 95 c0             	setne  al
  411655:	84 c0                	test   al,al
  411657:	75 0d                	jne    0x411666
  411659:	8b 4d e4             	mov    ecx,dword ptr [ebp-0x1c]
  41165c:	51                   	push   ecx
  41165d:	ff 15 98 93 41 00    	call   dword ptr ds:0x419398
  411663:	83 c4 04             	add    esp,0x4
  411666:	8b 75 08             	mov    esi,dword ptr [ebp+0x8]
  411669:	8b 8f 80 00 00 00    	mov    ecx,dword ptr [edi+0x80]
  41166f:	56                   	push   esi
  411670:	c7 45 fc ff ff ff ff 	mov    dword ptr [ebp-0x4],0xffffffff
  411677:	ff 15 8c 98 41 00    	call   dword ptr ds:0x41988c
  41167d:	8b 58 18             	mov    ebx,dword ptr [eax+0x18]
  411680:	8b cb                	mov    ecx,ebx
  411682:	ff 15 e8 97 41 00    	call   dword ptr ds:0x4197e8
  411688:	8b 03                	mov    eax,dword ptr [ebx]
  41168a:	8b cb                	mov    ecx,ebx
  41168c:	ff 90 bc 00 00 00    	call   dword ptr [eax+0xbc]
  411692:	8b 8f 80 00 00 00    	mov    ecx,dword ptr [edi+0x80]
  411698:	85 f6                	test   esi,esi
  41169a:	75 28                	jne    0x4116c4
  41169c:	56                   	push   esi
  41169d:	ff 15 30 98 41 00    	call   dword ptr ds:0x419830
  4116a3:	8b 8f 80 00 00 00    	mov    ecx,dword ptr [edi+0x80]
  4116a9:	56                   	push   esi
  4116aa:	ff 15 2c 98 41 00    	call   dword ptr ds:0x41982c
  4116b0:	8b 4d f4             	mov    ecx,dword ptr [ebp-0xc]
  4116b3:	64 89 0d 00 00 00 00 	mov    dword ptr fs:0x0,ecx
  4116ba:	59                   	pop    ecx
  4116bb:	5f                   	pop    edi
  4116bc:	5e                   	pop    esi
  4116bd:	5b                   	pop    ebx
  4116be:	8b e5                	mov    esp,ebp
  4116c0:	5d                   	pop    ebp
  4116c1:	c2 04 00             	ret    0x4
  4116c4:	8b 35 30 98 41 00    	mov    esi,dword ptr ds:0x419830
  4116ca:	68 96 00 00 00       	push   0x96
  4116cf:	ff d6                	call   esi
  4116d1:	8b 8f 80 00 00 00    	mov    ecx,dword ptr [edi+0x80]
  4116d7:	68 96 00 00 00       	push   0x96
  4116dc:	ff 15 2c 98 41 00    	call   dword ptr ds:0x41982c
  4116e2:	8b 8f 80 00 00 00    	mov    ecx,dword ptr [edi+0x80]
  4116e8:	ff 15 88 98 41 00    	call   dword ptr ds:0x419888
  4116ee:	8b 8f 80 00 00 00    	mov    ecx,dword ptr [edi+0x80]
  4116f4:	89 87 a0 00 00 00    	mov    dword ptr [edi+0xa0],eax
  4116fa:	83 7b 24 01          	cmp    dword ptr [ebx+0x24],0x1
  4116fe:	75 30                	jne    0x411730
  411700:	8b 35 94 98 41 00    	mov    esi,dword ptr ds:0x419894
  411706:	ff d6                	call   esi
  411708:	8b c8                	mov    ecx,eax
  41170a:	ff 15 28 98 41 00    	call   dword ptr ds:0x419828
  411710:	8b 8f 80 00 00 00    	mov    ecx,dword ptr [edi+0x80]
  411716:	50                   	push   eax
  411717:	ff 15 30 98 41 00    	call   dword ptr ds:0x419830
  41171d:	8b 8f 80 00 00 00    	mov    ecx,dword ptr [edi+0x80]
  411723:	ff d6                	call   esi
  411725:	8b c8                	mov    ecx,eax
  411727:	ff 15 28 98 41 00    	call   dword ptr ds:0x419828
  41172d:	50                   	push   eax
  41172e:	eb 0c                	jmp    0x41173c
  411730:	68 96 00 00 00       	push   0x96
  411735:	ff d6                	call   esi
  411737:	68 96 00 00 00       	push   0x96
  41173c:	8b 8f 80 00 00 00    	mov    ecx,dword ptr [edi+0x80]
  411742:	a1 2c 98 41 00       	mov    eax,ds:0x41982c
  411747:	ff d0                	call   eax
  411749:	8b 4d f4             	mov    ecx,dword ptr [ebp-0xc]
  41174c:	64 89 0d 00 00 00 00 	mov    dword ptr fs:0x0,ecx
  411753:	59                   	pop    ecx
  411754:	5f                   	pop    edi
  411755:	5e                   	pop    esi
  411756:	5b                   	pop    ebx
  411757:	8b e5                	mov    esp,ebp
  411759:	5d                   	pop    ebp
  41175a:	c2                   	.byte 0xc2
