; PM_auto.dll:0x100064F0 itemDraged callback

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/PM_auto.dll:     file format pei-i386


Disassembly of section .text:

100064f0 <.text+0x54f0>:
100064f0:	55                   	push   ebp
100064f1:	8b ec                	mov    ebp,esp
100064f3:	6a ff                	push   0xffffffff
100064f5:	68 99 eb 01 10       	push   0x1001eb99
100064fa:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10006500:	50                   	push   eax
10006501:	83 ec 20             	sub    esp,0x20
10006504:	53                   	push   ebx
10006505:	56                   	push   esi
10006506:	57                   	push   edi
10006507:	a1 cc f0 06 10       	mov    eax,ds:0x1006f0cc
1000650c:	33 c5                	xor    eax,ebp
1000650e:	50                   	push   eax
1000650f:	8d 45 f4             	lea    eax,[ebp-0xc]
10006512:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10006518:	8b f9                	mov    edi,ecx
1000651a:	89 7d e8             	mov    DWORD PTR [ebp-0x18],edi
1000651d:	8d 45 ec             	lea    eax,[ebp-0x14]
10006520:	50                   	push   eax
10006521:	6a 00                	push   0x0
10006523:	6a 00                	push   0x0
10006525:	6a 00                	push   0x0
10006527:	8d 4d d4             	lea    ecx,[ebp-0x2c]
1000652a:	ff 15 4c 24 02 10    	call   DWORD PTR ds:0x1002244c
10006530:	8b c8                	mov    ecx,eax
10006532:	ff 15 50 24 02 10    	call   DWORD PTR ds:0x10022450
10006538:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
1000653b:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
1000653e:	51                   	push   ecx
1000653f:	68 d4 b3 05 10       	push   0x1005b3d4
10006544:	53                   	push   ebx
10006545:	68 cc b3 05 10       	push   0x1005b3cc
1000654a:	8b c8                	mov    ecx,eax
1000654c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10006553:	ff 15 38 22 02 10    	call   DWORD PTR ds:0x10022238
10006559:	8b c8                	mov    ecx,eax
1000655b:	ff 15 30 22 02 10    	call   DWORD PTR ds:0x10022230
10006561:	8b c8                	mov    ecx,eax
10006563:	ff 15 38 22 02 10    	call   DWORD PTR ds:0x10022238
10006569:	8b c8                	mov    ecx,eax
1000656b:	ff 15 30 22 02 10    	call   DWORD PTR ds:0x10022230
10006571:	8d 4d ec             	lea    ecx,[ebp-0x14]
10006574:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
1000657b:	ff 15 48 22 02 10    	call   DWORD PTR ds:0x10022248
10006581:	85 db                	test   ebx,ebx
10006583:	0f 84 d0 01 00 00    	je     0x10006759
10006589:	8b 83 d4 01 00 00    	mov    eax,DWORD PTR [ebx+0x1d4]
1000658f:	8b 90 cc 01 00 00    	mov    edx,DWORD PTR [eax+0x1cc]
10006595:	83 7a 04 00          	cmp    DWORD PTR [edx+0x4],0x0
10006599:	7e 24                	jle    0x100065bf
1000659b:	8b 4a 04             	mov    ecx,DWORD PTR [edx+0x4]
1000659e:	8b 42 0c             	mov    eax,DWORD PTR [edx+0xc]
100065a1:	8b 72 0c             	mov    esi,DWORD PTR [edx+0xc]
100065a4:	03 f2                	add    esi,edx
100065a6:	8d 04 88             	lea    eax,[eax+ecx*4]
100065a9:	03 c2                	add    eax,edx
100065ab:	3b f0                	cmp    esi,eax
100065ad:	74 10                	je     0x100065bf
100065af:	90                   	nop
100065b0:	39 1e                	cmp    DWORD PTR [esi],ebx
100065b2:	0f 84 c3 00 00 00    	je     0x1000667b
100065b8:	83 c6 04             	add    esi,0x4
100065bb:	3b f0                	cmp    esi,eax
100065bd:	75 f1                	jne    0x100065b0
100065bf:	83 ce ff             	or     esi,0xffffffff
100065c2:	8b 83 d4 01 00 00    	mov    eax,DWORD PTR [ebx+0x1d4]
100065c8:	8b 4f 04             	mov    ecx,DWORD PTR [edi+0x4]
100065cb:	05 d0 01 00 00       	add    eax,0x1d0
100065d0:	50                   	push   eax
100065d1:	81 c1 40 01 00 00    	add    ecx,0x140
100065d7:	e8 a4 ef ff ff       	call   0x10005580
100065dc:	6a 00                	push   0x0
100065de:	56                   	push   esi
100065df:	8b 00                	mov    eax,DWORD PTR [eax]
100065e1:	8b c8                	mov    ecx,eax
100065e3:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
100065e6:	ff 15 08 26 02 10    	call   DWORD PTR ds:0x10022608
100065ec:	56                   	push   esi
100065ed:	8b 75 f0             	mov    esi,DWORD PTR [ebp-0x10]
100065f0:	8b ce                	mov    ecx,esi
100065f2:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
100065f5:	ff 15 14 26 02 10    	call   DWORD PTR ds:0x10022614
100065fb:	8b 8b d4 01 00 00    	mov    ecx,DWORD PTR [ebx+0x1d4]
10006601:	8d 45 08             	lea    eax,[ebp+0x8]
10006604:	50                   	push   eax
10006605:	81 c1 cc 01 00 00    	add    ecx,0x1cc
1000660b:	e8 90 76 00 00       	call   0x1000dca0
10006610:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10006613:	8b 8b d4 01 00 00    	mov    ecx,DWORD PTR [ebx+0x1d4]
10006619:	85 c0                	test   eax,eax
1000661b:	74 6b                	je     0x10006688
1000661d:	39 88 d4 01 00 00    	cmp    DWORD PTR [eax+0x1d4],ecx
10006623:	0f 85 fe 00 00 00    	jne    0x10006727
10006629:	8d b9 cc 01 00 00    	lea    edi,[ecx+0x1cc]
1000662f:	6a 00                	push   0x0
10006631:	8d 45 0c             	lea    eax,[ebp+0xc]
10006634:	8b cf                	mov    ecx,edi
10006636:	50                   	push   eax
10006637:	e8 64 48 00 00       	call   0x1000aea0
1000663c:	8b f0                	mov    esi,eax
1000663e:	8b cf                	mov    ecx,edi
10006640:	8d 45 08             	lea    eax,[ebp+0x8]
10006643:	50                   	push   eax
10006644:	56                   	push   esi
10006645:	e8 06 4a 00 00       	call   0x1000b050
1000664a:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
1000664d:	8b 4d f0             	mov    ecx,DWORD PTR [ebp-0x10]
10006650:	56                   	push   esi
10006651:	ff 15 10 26 02 10    	call   DWORD PTR ds:0x10022610
10006657:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
1000665a:	8b 89 d0 01 00 00    	mov    ecx,DWORD PTR [ecx+0x1d0]
10006660:	ff 15 1c 21 02 10    	call   DWORD PTR ds:0x1002211c
10006666:	8b 8b d0 01 00 00    	mov    ecx,DWORD PTR [ebx+0x1d0]
1000666c:	50                   	push   eax
1000666d:	ff 15 18 21 02 10    	call   DWORD PTR ds:0x10022118
10006673:	8b 7d e8             	mov    edi,DWORD PTR [ebp-0x18]
10006676:	e9 8c 00 00 00       	jmp    0x10006707
1000667b:	2b 72 0c             	sub    esi,DWORD PTR [edx+0xc]
1000667e:	2b f2                	sub    esi,edx
10006680:	c1 fe 02             	sar    esi,0x2
10006683:	e9 3a ff ff ff       	jmp    0x100065c2
10006688:	8d 45 08             	lea    eax,[ebp+0x8]
1000668b:	81 c1 cc 01 00 00    	add    ecx,0x1cc
10006691:	50                   	push   eax
10006692:	e8 09 76 00 00       	call   0x1000dca0
10006697:	8b 8b d4 01 00 00    	mov    ecx,DWORD PTR [ebx+0x1d4]
1000669d:	8d 45 08             	lea    eax,[ebp+0x8]
100066a0:	81 c1 cc 01 00 00    	add    ecx,0x1cc
100066a6:	50                   	push   eax
100066a7:	8b 01                	mov    eax,DWORD PTR [ecx]
100066a9:	ff 70 04             	push   DWORD PTR [eax+0x4]
100066ac:	e8 9f 49 00 00       	call   0x1000b050
100066b1:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
100066b4:	8b ce                	mov    ecx,esi
100066b6:	ff 15 0c 26 02 10    	call   DWORD PTR ds:0x1002260c
100066bc:	8b 8b d0 01 00 00    	mov    ecx,DWORD PTR [ebx+0x1d0]
100066c2:	8b 35 18 21 02 10    	mov    esi,DWORD PTR ds:0x10022118
100066c8:	ff d6                	call   esi
100066ca:	8b c8                	mov    ecx,eax
100066cc:	ff 15 24 21 02 10    	call   DWORD PTR ds:0x10022124
100066d2:	8b 8b d0 01 00 00    	mov    ecx,DWORD PTR [ebx+0x1d0]
100066d8:	48                   	dec    eax
100066d9:	50                   	push   eax
100066da:	89 45 0c             	mov    DWORD PTR [ebp+0xc],eax
100066dd:	89 4d 08             	mov    DWORD PTR [ebp+0x8],ecx
100066e0:	ff d6                	call   esi
100066e2:	8b c8                	mov    ecx,eax
100066e4:	ff 15 28 21 02 10    	call   DWORD PTR ds:0x10022128
100066ea:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
100066ed:	3b c8                	cmp    ecx,eax
100066ef:	74 36                	je     0x10006727
100066f1:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
100066f4:	ff d6                	call   esi
100066f6:	8b c8                	mov    ecx,eax
100066f8:	ff 15 28 21 02 10    	call   DWORD PTR ds:0x10022128
100066fe:	8b 8b d0 01 00 00    	mov    ecx,DWORD PTR [ebx+0x1d0]
10006704:	50                   	push   eax
10006705:	ff d6                	call   esi
10006707:	8b 4f 04             	mov    ecx,DWORD PTR [edi+0x4]
1000670a:	50                   	push   eax
1000670b:	ff b3 d0 01 00 00    	push   DWORD PTR [ebx+0x1d0]
10006711:	8b 89 1c 01 00 00    	mov    ecx,DWORD PTR [ecx+0x11c]
10006717:	6a 00                	push   0x0
10006719:	ff 15 b8 20 02 10    	call   DWORD PTR ds:0x100220b8
1000671f:	8b c8                	mov    ecx,eax
10006721:	ff 15 84 20 02 10    	call   DWORD PTR ds:0x10022084
10006727:	8b 0f                	mov    ecx,DWORD PTR [edi]
10006729:	e8 72 e9 00 00       	call   0x100150a0
1000672e:	8b 4f 04             	mov    ecx,DWORD PTR [edi+0x4]
10006731:	e8 1a b6 00 00       	call   0x10011d50
10006736:	8b 4f 04             	mov    ecx,DWORD PTR [edi+0x4]
10006739:	e8 62 b7 00 00       	call   0x10011ea0
1000673e:	ff b3 e0 01 00 00    	push   DWORD PTR [ebx+0x1e0]
10006744:	8b 0f                	mov    ecx,DWORD PTR [edi]
10006746:	ff b3 dc 01 00 00    	push   DWORD PTR [ebx+0x1dc]
1000674c:	e8 3f f2 00 00       	call   0x10015990
10006751:	8b 4f 04             	mov    ecx,DWORD PTR [edi+0x4]
10006754:	e8 c7 4e 00 00       	call   0x1000b620
10006759:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000675c:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10006763:	59                   	pop    ecx
10006764:	5f                   	pop    edi
10006765:	5e                   	pop    esi
10006766:	5b                   	pop    ebx
10006767:	8b e5                	mov    esp,ebp
10006769:	5d                   	pop    ebp
1000676a:	c2 08 00             	ret    0x8
1000676d:	cc                   	int3
1000676e:	cc                   	int3
1000676f:	cc                   	int3
10006770:	55                   	push   ebp
10006771:	8b ec                	mov    ebp,esp
10006773:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10006776:	c7 00 f0 95 05 10    	mov    DWORD PTR [eax],0x100595f0
1000677c:	5d                   	pop    ebp
1000677d:	c2 04 00             	ret    0x4

; MAIWmodels.dll:0x1000C020 AFStructure::movieElementTo

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

1000c020 <.text+0xb020>:
1000c020:	55                   	push   ebp
1000c021:	8b ec                	mov    ebp,esp
1000c023:	83 ec 08             	sub    esp,0x8
1000c026:	53                   	push   ebx
1000c027:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
1000c02a:	57                   	push   edi
1000c02b:	8b f9                	mov    edi,ecx
1000c02d:	89 7d fc             	mov    DWORD PTR [ebp-0x4],edi
1000c030:	3b 5d 10             	cmp    ebx,DWORD PTR [ebp+0x10]
1000c033:	0f 84 f6 00 00 00    	je     0x1000c12f
1000c039:	56                   	push   esi
1000c03a:	8b cb                	mov    ecx,ebx
1000c03c:	e8 3f d7 ff ff       	call   0x10009780
1000c041:	8b cb                	mov    ecx,ebx
1000c043:	89 45 08             	mov    DWORD PTR [ebp+0x8],eax
1000c046:	e8 85 d5 ff ff       	call   0x100095d0
1000c04b:	8b cb                	mov    ecx,ebx
1000c04d:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
1000c050:	e8 eb d5 ff ff       	call   0x10009640
1000c055:	8b f0                	mov    esi,eax
1000c057:	6a 01                	push   0x1
1000c059:	8b ce                	mov    ecx,esi
1000c05b:	e8 c0 72 ff ff       	call   0x10003320
1000c060:	8b ce                	mov    ecx,esi
1000c062:	e8 89 72 ff ff       	call   0x100032f0
1000c067:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
1000c06b:	74 2f                	je     0x1000c09c
1000c06d:	8b cb                	mov    ecx,ebx
1000c06f:	e8 7c d7 ff ff       	call   0x100097f0
1000c074:	8b f0                	mov    esi,eax
1000c076:	6a 01                	push   0x1
1000c078:	8b ce                	mov    ecx,esi
1000c07a:	e8 a1 72 ff ff       	call   0x10003320
1000c07f:	8b ce                	mov    ecx,esi
1000c081:	e8 6a 72 ff ff       	call   0x100032f0
1000c086:	ff 75 f8             	push   DWORD PTR [ebp-0x8]
1000c089:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000c08c:	8b c8                	mov    ecx,eax
1000c08e:	50                   	push   eax
1000c08f:	e8 1c d6 ff ff       	call   0x100096b0
1000c094:	50                   	push   eax
1000c095:	8b cf                	mov    ecx,edi
1000c097:	e8 34 ed ff ff       	call   0x1000add0
1000c09c:	8b cb                	mov    ecx,ebx
1000c09e:	e8 7d d6 ff ff       	call   0x10009720
1000c0a3:	8b f0                	mov    esi,eax
1000c0a5:	6a 01                	push   0x1
1000c0a7:	8b ce                	mov    ecx,esi
1000c0a9:	e8 72 72 ff ff       	call   0x10003320
1000c0ae:	8b ce                	mov    ecx,esi
1000c0b0:	e8 3b 72 ff ff       	call   0x100032f0
1000c0b5:	8b 75 10             	mov    esi,DWORD PTR [ebp+0x10]
1000c0b8:	85 f6                	test   esi,esi
1000c0ba:	75 23                	jne    0x1000c0df
1000c0bc:	8b 7d 0c             	mov    edi,DWORD PTR [ebp+0xc]
1000c0bf:	8b cf                	mov    ecx,edi
1000c0c1:	e8 aa be ff ff       	call   0x10007f70
1000c0c6:	56                   	push   esi
1000c0c7:	8b cf                	mov    ecx,edi
1000c0c9:	e8 d2 c9 ff ff       	call   0x10008aa0
1000c0ce:	8b 4d fc             	mov    ecx,DWORD PTR [ebp-0x4]
1000c0d1:	8b f0                	mov    esi,eax
1000c0d3:	53                   	push   ebx
1000c0d4:	57                   	push   edi
1000c0d5:	e8 d6 ed ff ff       	call   0x1000aeb0
1000c0da:	56                   	push   esi
1000c0db:	53                   	push   ebx
1000c0dc:	57                   	push   edi
1000c0dd:	eb 3f                	jmp    0x1000c11e
1000c0df:	8b ce                	mov    ecx,esi
1000c0e1:	e8 ea d4 ff ff       	call   0x100095d0
1000c0e6:	8b ce                	mov    ecx,esi
1000c0e8:	8b f8                	mov    edi,eax
1000c0ea:	e8 51 d5 ff ff       	call   0x10009640
1000c0ef:	8b f0                	mov    esi,eax
1000c0f1:	6a 01                	push   0x1
1000c0f3:	8b ce                	mov    ecx,esi
1000c0f5:	e8 26 72 ff ff       	call   0x10003320
1000c0fa:	8b ce                	mov    ecx,esi
1000c0fc:	e8 ef 71 ff ff       	call   0x100032f0
1000c101:	8b 75 0c             	mov    esi,DWORD PTR [ebp+0xc]
1000c104:	8b 4d fc             	mov    ecx,DWORD PTR [ebp-0x4]
1000c107:	53                   	push   ebx
1000c108:	56                   	push   esi
1000c109:	e8 a2 ed ff ff       	call   0x1000aeb0
1000c10e:	8b 4d fc             	mov    ecx,DWORD PTR [ebp-0x4]
1000c111:	53                   	push   ebx
1000c112:	ff 75 10             	push   DWORD PTR [ebp+0x10]
1000c115:	56                   	push   esi
1000c116:	e8 b5 ec ff ff       	call   0x1000add0
1000c11b:	57                   	push   edi
1000c11c:	53                   	push   ebx
1000c11d:	56                   	push   esi
1000c11e:	8b 4d fc             	mov    ecx,DWORD PTR [ebp-0x4]
1000c121:	e8 aa ec ff ff       	call   0x1000add0
1000c126:	8b 4d fc             	mov    ecx,DWORD PTR [ebp-0x4]
1000c129:	e8 d2 ef ff ff       	call   0x1000b100
1000c12e:	5e                   	pop    esi
1000c12f:	5f                   	pop    edi
1000c130:	5b                   	pop    ebx
1000c131:	8b e5                	mov    esp,ebp
1000c133:	5d                   	pop    ebp
1000c134:	c2 0c 00             	ret    0xc
1000c137:	cc                   	int3
1000c138:	cc                   	int3
1000c139:	cc                   	int3
1000c13a:	cc                   	int3
1000c13b:	cc                   	int3
1000c13c:	cc                   	int3
1000c13d:	cc                   	int3
1000c13e:	cc                   	int3
1000c13f:	cc                   	int3

; PM_auto.dll:0x10006EB0 itemDoubleClick callback

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/PM_auto.dll:     file format pei-i386


Disassembly of section .text:

10006eb0 <.text+0x5eb0>:
10006eb0:	55                   	push   ebp
10006eb1:	8b ec                	mov    ebp,esp
10006eb3:	8b 15 d0 28 02 10    	mov    edx,DWORD PTR ds:0x100228d0
10006eb9:	53                   	push   ebx
10006eba:	56                   	push   esi
10006ebb:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
10006ebe:	8b d9                	mov    ebx,ecx
10006ec0:	8b 86 c4 01 00 00    	mov    eax,DWORD PTR [esi+0x1c4]
10006ec6:	85 c0                	test   eax,eax
10006ec8:	74 11                	je     0x10006edb
10006eca:	8b 0b                	mov    ecx,DWORD PTR [ebx]
10006ecc:	50                   	push   eax
10006ecd:	8b 89 fc 00 00 00    	mov    ecx,DWORD PTR [ecx+0xfc]
10006ed3:	ff d2                	call   edx
10006ed5:	8b 15 d0 28 02 10    	mov    edx,DWORD PTR ds:0x100228d0
10006edb:	83 be dc 01 00 00 00 	cmp    DWORD PTR [esi+0x1dc],0x0
10006ee2:	75 45                	jne    0x10006f29
10006ee4:	83 be e0 01 00 00 00 	cmp    DWORD PTR [esi+0x1e0],0x0
10006eeb:	75 3c                	jne    0x10006f29
10006eed:	8b 86 c8 01 00 00    	mov    eax,DWORD PTR [esi+0x1c8]
10006ef3:	57                   	push   edi
10006ef4:	8b 80 80 00 00 00    	mov    eax,DWORD PTR [eax+0x80]
10006efa:	8b b8 c8 01 00 00    	mov    edi,DWORD PTR [eax+0x1c8]
10006f00:	85 ff                	test   edi,edi
10006f02:	74 24                	je     0x10006f28
10006f04:	8b 0b                	mov    ecx,DWORD PTR [ebx]
10006f06:	57                   	push   edi
10006f07:	8b 89 fc 00 00 00    	mov    ecx,DWORD PTR [ecx+0xfc]
10006f0d:	ff d2                	call   edx
10006f0f:	8b 86 d8 01 00 00    	mov    eax,DWORD PTR [esi+0x1d8]
10006f15:	8b cf                	mov    ecx,edi
10006f17:	ff b0 e0 01 00 00    	push   DWORD PTR [eax+0x1e0]
10006f1d:	ff b0 dc 01 00 00    	push   DWORD PTR [eax+0x1dc]
10006f23:	e8 68 ea 00 00       	call   0x10015990
10006f28:	5f                   	pop    edi
10006f29:	5e                   	pop    esi
10006f2a:	5b                   	pop    ebx
10006f2b:	5d                   	pop    ebp
10006f2c:	c2 04 00             	ret    0x4
10006f2f:	cc                   	int3

; MAIWmodels.dll:0x1000C140 AFStructure::movieToElementary

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

1000c140 <.text+0xb140>:
1000c140:	55                   	push   ebp
1000c141:	8b ec                	mov    ebp,esp
1000c143:	56                   	push   esi
1000c144:	8b f1                	mov    esi,ecx
1000c146:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
1000c149:	51                   	push   ecx
1000c14a:	e8 61 d5 ff ff       	call   0x100096b0
1000c14f:	50                   	push   eax
1000c150:	ff 75 08             	push   DWORD PTR [ebp+0x8]
1000c153:	8b ce                	mov    ecx,esi
1000c155:	e8 c6 fe ff ff       	call   0x1000c020
1000c15a:	5e                   	pop    esi
1000c15b:	5d                   	pop    ebp
1000c15c:	c2 08 00             	ret    0x8
1000c15f:	cc                   	int3

; PM_auto.dll:0x10015990 coordinate selection helper

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/PM_auto.dll:     file format pei-i386


Disassembly of section .text:

10015990 <.text+0x14990>:
10015990:	55                   	push   ebp
10015991:	8b ec                	mov    ebp,esp
10015993:	83 ec 68             	sub    esp,0x68
10015996:	a1 cc f0 06 10       	mov    eax,ds:0x1006f0cc
1001599b:	33 c5                	xor    eax,ebp
1001599d:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
100159a0:	53                   	push   ebx
100159a1:	8b 5d 0c             	mov    ebx,DWORD PTR [ebp+0xc]
100159a4:	56                   	push   esi
100159a5:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
100159a8:	57                   	push   edi
100159a9:	8b f9                	mov    edi,ecx
100159ab:	85 db                	test   ebx,ebx
100159ad:	0f 88 b8 01 00 00    	js     0x10015b6b
100159b3:	3b 77 74             	cmp    esi,DWORD PTR [edi+0x74]
100159b6:	0f 8d af 01 00 00    	jge    0x10015b6b
100159bc:	85 f6                	test   esi,esi
100159be:	0f 88 a7 01 00 00    	js     0x10015b6b
100159c4:	3b 5f 70             	cmp    ebx,DWORD PTR [edi+0x70]
100159c7:	0f 8d 9e 01 00 00    	jge    0x10015b6b
100159cd:	56                   	push   esi
100159ce:	8d 4f 68             	lea    ecx,[edi+0x68]
100159d1:	53                   	push   ebx
100159d2:	e8 89 e3 ff ff       	call   0x10013d60
100159d7:	8b c8                	mov    ecx,eax
100159d9:	e8 02 e3 ff ff       	call   0x10013ce0
100159de:	83 38 00             	cmp    DWORD PTR [eax],0x0
100159e1:	0f 84 84 01 00 00    	je     0x10015b6b
100159e7:	8d 4d ec             	lea    ecx,[ebp-0x14]
100159ea:	ff 15 ec 25 02 10    	call   DWORD PTR ds:0x100225ec
100159f0:	8d 45 a0             	lea    eax,[ebp-0x60]
100159f3:	50                   	push   eax
100159f4:	8d 45 9c             	lea    eax,[ebp-0x64]
100159f7:	50                   	push   eax
100159f8:	8d 45 98             	lea    eax,[ebp-0x68]
100159fb:	50                   	push   eax
100159fc:	e8 6f d1 fe ff       	call   0x10002b70
10015a01:	83 c4 0c             	add    esp,0xc
10015a04:	8d 4d b4             	lea    ecx,[ebp-0x4c]
10015a07:	68 ff 00 00 00       	push   0xff
10015a0c:	ff 75 a0             	push   DWORD PTR [ebp-0x60]
10015a0f:	ff 75 9c             	push   DWORD PTR [ebp-0x64]
10015a12:	ff 75 98             	push   DWORD PTR [ebp-0x68]
10015a15:	ff 15 40 26 02 10    	call   DWORD PTR ds:0x10022640
10015a1b:	8d 45 a4             	lea    eax,[ebp-0x5c]
10015a1e:	50                   	push   eax
10015a1f:	8d 4d b4             	lea    ecx,[ebp-0x4c]
10015a22:	ff 15 cc 25 02 10    	call   DWORD PTR ds:0x100225cc
10015a28:	50                   	push   eax
10015a29:	8d 4d ec             	lea    ecx,[ebp-0x14]
10015a2c:	ff 15 e0 25 02 10    	call   DWORD PTR ds:0x100225e0
10015a32:	68 ff 00 00 00       	push   0xff
10015a37:	68 96 00 00 00       	push   0x96
10015a3c:	8d 4d ec             	lea    ecx,[ebp-0x14]
10015a3f:	ff 15 d4 25 02 10    	call   DWORD PTR ds:0x100225d4
10015a45:	50                   	push   eax
10015a46:	8d 4d ec             	lea    ecx,[ebp-0x14]
10015a49:	ff 15 d8 25 02 10    	call   DWORD PTR ds:0x100225d8
10015a4f:	50                   	push   eax
10015a50:	8d 4d ec             	lea    ecx,[ebp-0x14]
10015a53:	ff 15 d0 25 02 10    	call   DWORD PTR ds:0x100225d0
10015a59:	83 7f 6c 01          	cmp    DWORD PTR [edi+0x6c],0x1
10015a5d:	75 07                	jne    0x10015a66
10015a5f:	8b cf                	mov    ecx,edi
10015a61:	e8 ea 1b 00 00       	call   0x10017650
10015a66:	56                   	push   esi
10015a67:	53                   	push   ebx
10015a68:	8d 4f 68             	lea    ecx,[edi+0x68]
10015a6b:	89 77 78             	mov    DWORD PTR [edi+0x78],esi
10015a6e:	89 5f 7c             	mov    DWORD PTR [edi+0x7c],ebx
10015a71:	c7 47 6c 01 00 00 00 	mov    DWORD PTR [edi+0x6c],0x1
10015a78:	e8 e3 e2 ff ff       	call   0x10013d60
10015a7d:	8b c8                	mov    ecx,eax
10015a7f:	e8 5c e2 ff ff       	call   0x10013ce0
10015a84:	8b cf                	mov    ecx,edi
10015a86:	8b 18                	mov    ebx,DWORD PTR [eax]
10015a88:	53                   	push   ebx
10015a89:	c6 83 c0 01 00 00 01 	mov    BYTE PTR [ebx+0x1c0],0x1
10015a90:	e8 ab 1f 00 00       	call   0x10017a40
10015a95:	83 bb bc 01 00 00 00 	cmp    DWORD PTR [ebx+0x1bc],0x0
10015a9c:	c6 83 f0 00 00 00 00 	mov    BYTE PTR [ebx+0xf0],0x0
10015aa3:	74 0b                	je     0x10015ab0
10015aa5:	8d 8b b8 01 00 00    	lea    ecx,[ebx+0x1b8]
10015aab:	e8 a0 06 00 00       	call   0x10016150
10015ab0:	8b 35 dc 25 02 10    	mov    esi,DWORD PTR ds:0x100225dc
10015ab6:	8d 83 5c 02 00 00    	lea    eax,[ebx+0x25c]
10015abc:	50                   	push   eax
10015abd:	8d 8b 70 01 00 00    	lea    ecx,[ebx+0x170]
10015ac3:	ff d6                	call   esi
10015ac5:	8d 45 ec             	lea    eax,[ebp-0x14]
10015ac8:	50                   	push   eax
10015ac9:	8d 8b 80 01 00 00    	lea    ecx,[ebx+0x180]
10015acf:	ff d6                	call   esi
10015ad1:	8d 83 f8 00 00 00    	lea    eax,[ebx+0xf8]
10015ad7:	c7 45 c4 d4 bb 05 10 	mov    DWORD PTR [ebp-0x3c],0x1005bbd4
10015ade:	8d 4d c4             	lea    ecx,[ebp-0x3c]
10015ae1:	89 5d c8             	mov    DWORD PTR [ebp-0x38],ebx
10015ae4:	50                   	push   eax
10015ae5:	89 4d e8             	mov    DWORD PTR [ebp-0x18],ecx
10015ae8:	e8 03 ef ff ff       	call   0x100149f0
10015aed:	8b 4d e8             	mov    ecx,DWORD PTR [ebp-0x18]
10015af0:	85 c9                	test   ecx,ecx
10015af2:	74 11                	je     0x10015b05
10015af4:	8b 11                	mov    edx,DWORD PTR [ecx]
10015af6:	8d 45 c4             	lea    eax,[ebp-0x3c]
10015af9:	3b c8                	cmp    ecx,eax
10015afb:	0f 95 c0             	setne  al
10015afe:	0f b6 c0             	movzx  eax,al
10015b01:	50                   	push   eax
10015b02:	ff 52 10             	call   DWORD PTR [edx+0x10]
10015b05:	8d 83 20 01 00 00    	lea    eax,[ebx+0x120]
10015b0b:	c7 45 c4 f0 bb 05 10 	mov    DWORD PTR [ebp-0x3c],0x1005bbf0
10015b12:	8d 4d c4             	lea    ecx,[ebp-0x3c]
10015b15:	50                   	push   eax
10015b16:	89 4d e8             	mov    DWORD PTR [ebp-0x18],ecx
10015b19:	e8 d2 ee ff ff       	call   0x100149f0
10015b1e:	8b 4d e8             	mov    ecx,DWORD PTR [ebp-0x18]
10015b21:	85 c9                	test   ecx,ecx
10015b23:	74 11                	je     0x10015b36
10015b25:	8b 11                	mov    edx,DWORD PTR [ecx]
10015b27:	8d 45 c4             	lea    eax,[ebp-0x3c]
10015b2a:	3b c8                	cmp    ecx,eax
10015b2c:	0f 95 c0             	setne  al
10015b2f:	0f b6 c0             	movzx  eax,al
10015b32:	50                   	push   eax
10015b33:	ff 52 10             	call   DWORD PTR [edx+0x10]
10015b36:	8d 8b e8 00 00 00    	lea    ecx,[ebx+0xe8]
10015b3c:	c7 83 a4 01 00 00 0a 	mov    DWORD PTR [ebx+0x1a4],0xa
10015b43:	00 00 00 
10015b46:	c7 83 a0 01 00 00 8c 	mov    DWORD PTR [ebx+0x1a0],0x8c
10015b4d:	00 00 00 
10015b50:	e8 2b 19 00 00       	call   0x10017480
10015b55:	ff 47 60             	inc    DWORD PTR [edi+0x60]
10015b58:	5f                   	pop    edi
10015b59:	5e                   	pop    esi
10015b5a:	5b                   	pop    ebx
10015b5b:	8b 4d fc             	mov    ecx,DWORD PTR [ebp-0x4]
10015b5e:	33 cd                	xor    ecx,ebp
10015b60:	e8 05 71 00 00       	call   0x1001cc6a
10015b65:	8b e5                	mov    esp,ebp
10015b67:	5d                   	pop    ebp
10015b68:	c2 08 00             	ret    0x8
10015b6b:	6a 00                	push   0x0
10015b6d:	8b cf                	mov    ecx,edi
10015b6f:	e8 cc 1e 00 00       	call   0x10017a40
10015b74:	8b 4d fc             	mov    ecx,DWORD PTR [ebp-0x4]
10015b77:	5f                   	pop    edi
10015b78:	5e                   	pop    esi
10015b79:	33 cd                	xor    ecx,ebp
10015b7b:	5b                   	pop    ebx
10015b7c:	e8                   	.byte 0xe8
10015b7d:	e9                   	.byte 0xe9
10015b7e:	70 00                	jo     0x10015b80

; PM_auto.dll:0x10017A40 FunctionalDiagram selectionChanged emitter

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/PM_auto.dll:     file format pei-i386


Disassembly of section .text:

10017a40 <.text+0x16a40>:
10017a40:	55                   	push   ebp
10017a41:	8b ec                	mov    ebp,esp
10017a43:	83 ec 08             	sub    esp,0x8
10017a46:	8d 45 08             	lea    eax,[ebp+0x8]
10017a49:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [ebp-0x8],0x0
10017a50:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
10017a53:	8d 45 f8             	lea    eax,[ebp-0x8]
10017a56:	50                   	push   eax
10017a57:	6a 00                	push   0x0
10017a59:	68 90 bc 05 10       	push   0x1005bc90
10017a5e:	51                   	push   ecx
10017a5f:	ff 15 44 24 02 10    	call   DWORD PTR ds:0x10022444
10017a65:	83 c4 10             	add    esp,0x10
10017a68:	8b e5                	mov    esp,ebp
10017a6a:	5d                   	pop    ebp
10017a6b:	c2 04 00             	ret    0x4
10017a6e:	cc                   	int3
10017a6f:	cc                   	int3
