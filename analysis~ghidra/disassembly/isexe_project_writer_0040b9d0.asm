===== Save UI call sites [VA 0x00402600..0x004027E9) =====

/mnt/data/work_stage117/original/IS.exe:     file format pei-i386


Disassembly of section .text:

00402600 <.text+0x1600>:
  402600:	15 d0 93 41 00       	adc    eax,0x4193d0
  402605:	8d 4d e0             	lea    ecx,[ebp-0x20]
  402608:	c6 45 fc 00          	mov    BYTE PTR [ebp-0x4],0x0
  40260c:	e8 0f ed ff ff       	call   0x401320
  402611:	eb 0a                	jmp    0x40261d
  402613:	57                   	push   edi
  402614:	8d 4d ec             	lea    ecx,[ebp-0x14]
  402617:	ff 15 cc 93 41 00    	call   DWORD PTR ds:0x4193cc
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
  402638:	c6 45 fc 03          	mov    BYTE PTR [ebp-0x4],0x3
  40263c:	68 1c 71 45 00       	push   0x45711c
  402641:	50                   	push   eax
  402642:	e8 79 04 00 00       	call   0x402ac0
  402647:	6a 00                	push   0x0
  402649:	6a 00                	push   0x0
  40264b:	56                   	push   esi
  40264c:	8d 4d ec             	lea    ecx,[ebp-0x14]
  40264f:	c6 45 fc 04          	mov    BYTE PTR [ebp-0x4],0x4
  402653:	51                   	push   ecx
  402654:	50                   	push   eax
  402655:	8d 45 e0             	lea    eax,[ebp-0x20]
  402658:	53                   	push   ebx
  402659:	50                   	push   eax
  40265a:	ff 15 28 9a 41 00    	call   DWORD PTR ds:0x419a28
  402660:	83 c4 3c             	add    esp,0x3c
  402663:	8b cf                	mov    ecx,edi
  402665:	50                   	push   eax
  402666:	ff 15 c8 93 41 00    	call   DWORD PTR ds:0x4193c8
  40266c:	8d 4d e0             	lea    ecx,[ebp-0x20]
  40266f:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  402675:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  402678:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40267e:	8d 4d e8             	lea    ecx,[ebp-0x18]
  402681:	c6 45 fc 00          	mov    BYTE PTR [ebp-0x4],0x0
  402685:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40268b:	68 4c 6f 45 00       	push   0x456f4c
  402690:	8b cf                	mov    ecx,edi
  402692:	ff 15 ac 93 41 00    	call   DWORD PTR ds:0x4193ac
  402698:	84 c0                	test   al,al
  40269a:	0f 84 82 00 00 00    	je     0x402722
  4026a0:	51                   	push   ecx
  4026a1:	8b cc                	mov    ecx,esp
  4026a3:	57                   	push   edi
  4026a4:	ff 15 d4 93 41 00    	call   DWORD PTR ds:0x4193d4
  4026aa:	e8 21 93 00 00       	call   0x40b9d0
  4026af:	8b cc                	mov    ecx,esp
  4026b1:	57                   	push   edi
  4026b2:	ff 15 d4 93 41 00    	call   DWORD PTR ds:0x4193d4
  4026b8:	8b cb                	mov    ecx,ebx
  4026ba:	e8 b1 f0 ff ff       	call   0x401770
  4026bf:	57                   	push   edi
  4026c0:	8d 4d e8             	lea    ecx,[ebp-0x18]
  4026c3:	ff 15 44 93 41 00    	call   DWORD PTR ds:0x419344
  4026c9:	51                   	push   ecx
  4026ca:	8b c4                	mov    eax,esp
  4026cc:	89 65 e0             	mov    DWORD PTR [ebp-0x20],esp
  4026cf:	50                   	push   eax
  4026d0:	8d 4d e8             	lea    ecx,[ebp-0x18]
  4026d3:	c6 45 fc 05          	mov    BYTE PTR [ebp-0x4],0x5
  4026d7:	ff 15 38 93 41 00    	call   DWORD PTR ds:0x419338
  4026dd:	c6 45 fc 06          	mov    BYTE PTR [ebp-0x4],0x6
  4026e1:	e8 ba 70 00 00       	call   0x4097a0
  4026e6:	8b c8                	mov    ecx,eax
  4026e8:	c6 45 fc 05          	mov    BYTE PTR [ebp-0x4],0x5
  4026ec:	e8 ff f9 00 00       	call   0x4120f0
  4026f1:	68 88 13 00 00       	push   0x1388
  4026f6:	51                   	push   ecx
  4026f7:	8b c4                	mov    eax,esp
  4026f9:	89 65 e0             	mov    DWORD PTR [ebp-0x20],esp
  4026fc:	50                   	push   eax
  4026fd:	8d 4d f3             	lea    ecx,[ebp-0xd]
  402700:	e8 eb ee ff ff       	call   0x4015f0
  402705:	c6 45 fc 07          	mov    BYTE PTR [ebp-0x4],0x7
  402709:	e8 92 70 00 00       	call   0x4097a0
  40270e:	8b c8                	mov    ecx,eax
  402710:	c6 45 fc 05          	mov    BYTE PTR [ebp-0x4],0x5
  402714:	e8 67 f9 00 00       	call   0x412080
  402719:	8d 4d e8             	lea    ecx,[ebp-0x18]
  40271c:	ff 15 40 93 41 00    	call   DWORD PTR ds:0x419340
  402722:	8d 4d ec             	lea    ecx,[ebp-0x14]
  402725:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40272b:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
  40272e:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
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
  402740:	55                   	push   ebp
  402741:	8b ec                	mov    ebp,esp
  402743:	6a ff                	push   0xffffffff
  402745:	68 09 5a 41 00       	push   0x415a09
  40274a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  402750:	50                   	push   eax
  402751:	83 ec 08             	sub    esp,0x8
  402754:	56                   	push   esi
  402755:	57                   	push   edi
  402756:	a1 cc 90 46 00       	mov    eax,ds:0x4690cc
  40275b:	33 c5                	xor    eax,ebp
  40275d:	50                   	push   eax
  40275e:	8d 45 f4             	lea    eax,[ebp-0xc]
  402761:	64 a3 00 00 00 00    	mov    fs:0x0,eax
  402767:	8b f1                	mov    esi,ecx
  402769:	8d be 9c 00 00 00    	lea    edi,[esi+0x9c]
  40276f:	68 4c 6f 45 00       	push   0x456f4c
  402774:	8b cf                	mov    ecx,edi
  402776:	ff 15 b0 93 41 00    	call   DWORD PTR ds:0x4193b0
  40277c:	84 c0                	test   al,al
  40277e:	74 18                	je     0x402798
  402780:	8b ce                	mov    ecx,esi
  402782:	e8 a9 fd ff ff       	call   0x402530
  402787:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
  40278a:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  402791:	59                   	pop    ecx
  402792:	5f                   	pop    edi
  402793:	5e                   	pop    esi
  402794:	8b e5                	mov    esp,ebp
  402796:	5d                   	pop    ebp
  402797:	c3                   	ret
  402798:	51                   	push   ecx
  402799:	8b cc                	mov    ecx,esp
  40279b:	57                   	push   edi
  40279c:	ff 15 d4 93 41 00    	call   DWORD PTR ds:0x4193d4
  4027a2:	e8 29 92 00 00       	call   0x40b9d0
  4027a7:	83 c4 04             	add    esp,0x4
  4027aa:	68 88 13 00 00       	push   0x1388
  4027af:	51                   	push   ecx
  4027b0:	8b c4                	mov    eax,esp
  4027b2:	89 65 ec             	mov    DWORD PTR [ebp-0x14],esp
  4027b5:	50                   	push   eax
  4027b6:	8d 4d f3             	lea    ecx,[ebp-0xd]
  4027b9:	e8 a2 ee ff ff       	call   0x401660
  4027be:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
  4027c5:	e8 d6 6f 00 00       	call   0x4097a0
  4027ca:	8b c8                	mov    ecx,eax
  4027cc:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
  4027d3:	e8 a8 f8 00 00       	call   0x412080
  4027d8:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
  4027db:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  4027e2:	59                   	pop    ecx
  4027e3:	5f                   	pop    edi
  4027e4:	5e                   	pop    esi
  4027e5:	8b e5                	mov    esp,ebp
  4027e7:	5d                   	pop    ebp
  4027e8:	c3                   	ret

===== Top-level project writer [VA 0x0040B9D0..0x0040C187) =====

/mnt/data/work_stage117/original/IS.exe:     file format pei-i386


Disassembly of section .text:

0040b9d0 <.text+0xa9d0>:
  40b9d0:	55                   	push   ebp
  40b9d1:	8b ec                	mov    ebp,esp
  40b9d3:	6a ff                	push   0xffffffff
  40b9d5:	68 6f 74 41 00       	push   0x41746f
  40b9da:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  40b9e0:	50                   	push   eax
  40b9e1:	83 ec 70             	sub    esp,0x70
  40b9e4:	53                   	push   ebx
  40b9e5:	56                   	push   esi
  40b9e6:	57                   	push   edi
  40b9e7:	a1 cc 90 46 00       	mov    eax,ds:0x4690cc
  40b9ec:	33 c5                	xor    eax,ebp
  40b9ee:	50                   	push   eax
  40b9ef:	8d 45 f4             	lea    eax,[ebp-0xc]
  40b9f2:	64 a3 00 00 00 00    	mov    fs:0x0,eax
  40b9f8:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
  40b9ff:	e8 8c 0a 00 00       	call   0x40c490
  40ba04:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40ba07:	ff 15 94 9b 41 00    	call   DWORD PTR ds:0x419b94
  40ba0d:	8b 1d a8 93 41 00    	mov    ebx,DWORD PTR ds:0x4193a8
  40ba13:	6a 07                	push   0x7
  40ba15:	68 04 7a 45 00       	push   0x457a04
  40ba1a:	c6 45 fc 01          	mov    BYTE PTR [ebp-0x4],0x1
  40ba1e:	ff d3                	call   ebx
  40ba20:	83 c4 08             	add    esp,0x8
  40ba23:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
  40ba26:	8d 45 d0             	lea    eax,[ebp-0x30]
  40ba29:	c6 45 fc 02          	mov    BYTE PTR [ebp-0x4],0x2
  40ba2d:	50                   	push   eax
  40ba2e:	8d 45 ec             	lea    eax,[ebp-0x14]
  40ba31:	50                   	push   eax
  40ba32:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40ba35:	ff 15 74 9b 41 00    	call   DWORD PTR ds:0x419b74
  40ba3b:	8d 4d d0             	lea    ecx,[ebp-0x30]
  40ba3e:	c6 45 fc 04          	mov    BYTE PTR [ebp-0x4],0x4
  40ba42:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40ba48:	8b 3d 58 9b 41 00    	mov    edi,DWORD PTR ds:0x419b58
  40ba4e:	8d 45 ec             	lea    eax,[ebp-0x14]
  40ba51:	50                   	push   eax
  40ba52:	8d 45 ac             	lea    eax,[ebp-0x54]
  40ba55:	50                   	push   eax
  40ba56:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40ba59:	ff d7                	call   edi
  40ba5b:	8d 4d ac             	lea    ecx,[ebp-0x54]
  40ba5e:	ff 15 50 9b 41 00    	call   DWORD PTR ds:0x419b50
  40ba64:	6a 04                	push   0x4
  40ba66:	68 0c 7a 45 00       	push   0x457a0c
  40ba6b:	ff d3                	call   ebx
  40ba6d:	83 c4 08             	add    esp,0x8
  40ba70:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
  40ba73:	ff 35 a4 96 46 00    	push   DWORD PTR ds:0x4696a4
  40ba79:	8b 35 80 9b 41 00    	mov    esi,DWORD PTR ds:0x419b80
  40ba7f:	8d 45 d4             	lea    eax,[ebp-0x2c]
  40ba82:	50                   	push   eax
  40ba83:	8d 4d ec             	lea    ecx,[ebp-0x14]
  40ba86:	c6 45 fc 05          	mov    BYTE PTR [ebp-0x4],0x5
  40ba8a:	ff d6                	call   esi
  40ba8c:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  40ba8f:	c6 45 fc 04          	mov    BYTE PTR [ebp-0x4],0x4
  40ba93:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40ba99:	6a 04                	push   0x4
  40ba9b:	68 14 7a 45 00       	push   0x457a14
  40baa0:	ff d3                	call   ebx
  40baa2:	83 c4 08             	add    esp,0x8
  40baa5:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
  40baa8:	a1 a4 96 46 00       	mov    eax,ds:0x4696a4
  40baad:	8d 4d ec             	lea    ecx,[ebp-0x14]
  40bab0:	83 c0 04             	add    eax,0x4
  40bab3:	c6 45 fc 06          	mov    BYTE PTR [ebp-0x4],0x6
  40bab7:	50                   	push   eax
  40bab8:	8d 45 d4             	lea    eax,[ebp-0x2c]
  40babb:	50                   	push   eax
  40babc:	ff d6                	call   esi
  40babe:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  40bac1:	c6 45 fc 04          	mov    BYTE PTR [ebp-0x4],0x4
  40bac5:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40bacb:	6a 04                	push   0x4
  40bacd:	68 1c 7a 45 00       	push   0x457a1c
  40bad2:	ff d3                	call   ebx
  40bad4:	83 c4 08             	add    esp,0x8
  40bad7:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
  40bada:	8d 45 d4             	lea    eax,[ebp-0x2c]
  40badd:	c6 45 fc 07          	mov    BYTE PTR [ebp-0x4],0x7
  40bae1:	50                   	push   eax
  40bae2:	8d 45 d8             	lea    eax,[ebp-0x28]
  40bae5:	50                   	push   eax
  40bae6:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40bae9:	ff 15 74 9b 41 00    	call   DWORD PTR ds:0x419b74
  40baef:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  40baf2:	c6 45 fc 09          	mov    BYTE PTR [ebp-0x4],0x9
  40baf6:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40bafc:	8d 45 d8             	lea    eax,[ebp-0x28]
  40baff:	50                   	push   eax
  40bb00:	8d 45 ac             	lea    eax,[ebp-0x54]
  40bb03:	50                   	push   eax
  40bb04:	8d 4d ec             	lea    ecx,[ebp-0x14]
  40bb07:	ff d7                	call   edi
  40bb09:	8d 4d ac             	lea    ecx,[ebp-0x54]
  40bb0c:	ff 15 50 9b 41 00    	call   DWORD PTR ds:0x419b50
  40bb12:	6a 04                	push   0x4
  40bb14:	68 0c 7a 45 00       	push   0x457a0c
  40bb19:	ff d3                	call   ebx
  40bb1b:	83 c4 08             	add    esp,0x8
  40bb1e:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
  40bb21:	a1 a4 96 46 00       	mov    eax,ds:0x4696a4
  40bb26:	8d 4d d8             	lea    ecx,[ebp-0x28]
  40bb29:	83 c0 14             	add    eax,0x14
  40bb2c:	c6 45 fc 0a          	mov    BYTE PTR [ebp-0x4],0xa
  40bb30:	50                   	push   eax
  40bb31:	8d 45 d0             	lea    eax,[ebp-0x30]
  40bb34:	50                   	push   eax
  40bb35:	ff d6                	call   esi
  40bb37:	8d 4d d0             	lea    ecx,[ebp-0x30]
  40bb3a:	c6 45 fc 09          	mov    BYTE PTR [ebp-0x4],0x9
  40bb3e:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40bb44:	6a 04                	push   0x4
  40bb46:	68 14 7a 45 00       	push   0x457a14
  40bb4b:	ff d3                	call   ebx
  40bb4d:	83 c4 08             	add    esp,0x8
  40bb50:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
  40bb53:	a1 a4 96 46 00       	mov    eax,ds:0x4696a4
  40bb58:	8d 4d d8             	lea    ecx,[ebp-0x28]
  40bb5b:	83 c0 18             	add    eax,0x18
  40bb5e:	c6 45 fc 0b          	mov    BYTE PTR [ebp-0x4],0xb
  40bb62:	50                   	push   eax
  40bb63:	8d 45 d0             	lea    eax,[ebp-0x30]
  40bb66:	50                   	push   eax
  40bb67:	ff d6                	call   esi
  40bb69:	8d 4d d0             	lea    ecx,[ebp-0x30]
  40bb6c:	c6 45 fc 09          	mov    BYTE PTR [ebp-0x4],0x9
  40bb70:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40bb76:	6a 06                	push   0x6
  40bb78:	68 24 7a 45 00       	push   0x457a24
  40bb7d:	ff d3                	call   ebx
  40bb7f:	83 c4 08             	add    esp,0x8
  40bb82:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
  40bb85:	8d 45 d0             	lea    eax,[ebp-0x30]
  40bb88:	c6 45 fc 0c          	mov    BYTE PTR [ebp-0x4],0xc
  40bb8c:	50                   	push   eax
  40bb8d:	8d 45 dc             	lea    eax,[ebp-0x24]
  40bb90:	50                   	push   eax
  40bb91:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40bb94:	ff 15 74 9b 41 00    	call   DWORD PTR ds:0x419b74
  40bb9a:	8d 4d d0             	lea    ecx,[ebp-0x30]
  40bb9d:	c6 45 fc 0e          	mov    BYTE PTR [ebp-0x4],0xe
  40bba1:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40bba7:	8d 45 dc             	lea    eax,[ebp-0x24]
  40bbaa:	50                   	push   eax
  40bbab:	8d 45 ac             	lea    eax,[ebp-0x54]
  40bbae:	50                   	push   eax
  40bbaf:	8d 4d ec             	lea    ecx,[ebp-0x14]
  40bbb2:	ff d7                	call   edi
  40bbb4:	8d 4d ac             	lea    ecx,[ebp-0x54]
  40bbb7:	ff 15 50 9b 41 00    	call   DWORD PTR ds:0x419b50
  40bbbd:	8d 45 f0             	lea    eax,[ebp-0x10]
  40bbc0:	50                   	push   eax
  40bbc1:	8d 45 a4             	lea    eax,[ebp-0x5c]
  40bbc4:	50                   	push   eax
  40bbc5:	e8 06 f1 ff ff       	call   0x40acd0
  40bbca:	83 c4 08             	add    esp,0x8
  40bbcd:	c6 45 fc 0f          	mov    BYTE PTR [ebp-0x4],0xf
  40bbd1:	8d 45 a4             	lea    eax,[ebp-0x5c]
  40bbd4:	50                   	push   eax
  40bbd5:	8d 45 ac             	lea    eax,[ebp-0x54]
  40bbd8:	50                   	push   eax
  40bbd9:	8d 4d dc             	lea    ecx,[ebp-0x24]
  40bbdc:	ff d7                	call   edi
  40bbde:	8d 4d ac             	lea    ecx,[ebp-0x54]
  40bbe1:	ff 15 50 9b 41 00    	call   DWORD PTR ds:0x419b50
  40bbe7:	8d 45 f0             	lea    eax,[ebp-0x10]
  40bbea:	50                   	push   eax
  40bbeb:	8d 45 a8             	lea    eax,[ebp-0x58]
  40bbee:	50                   	push   eax
  40bbef:	e8 dc ea ff ff       	call   0x40a6d0
  40bbf4:	83 c4 08             	add    esp,0x8
  40bbf7:	8d 45 a8             	lea    eax,[ebp-0x58]
  40bbfa:	c6 45 fc 10          	mov    BYTE PTR [ebp-0x4],0x10
  40bbfe:	50                   	push   eax
  40bbff:	8d 45 ac             	lea    eax,[ebp-0x54]
  40bc02:	50                   	push   eax
  40bc03:	8d 4d dc             	lea    ecx,[ebp-0x24]
  40bc06:	ff d7                	call   edi
  40bc08:	8d 4d ac             	lea    ecx,[ebp-0x54]
  40bc0b:	ff 15 50 9b 41 00    	call   DWORD PTR ds:0x419b50
  40bc11:	6a 0c                	push   0xc
  40bc13:	68 2c 7a 45 00       	push   0x457a2c
  40bc18:	ff d3                	call   ebx
  40bc1a:	83 c4 08             	add    esp,0x8
  40bc1d:	89 45 c8             	mov    DWORD PTR [ebp-0x38],eax
  40bc20:	8d 45 c8             	lea    eax,[ebp-0x38]
  40bc23:	c6 45 fc 11          	mov    BYTE PTR [ebp-0x4],0x11
  40bc27:	50                   	push   eax
  40bc28:	8d 45 cc             	lea    eax,[ebp-0x34]
  40bc2b:	50                   	push   eax
  40bc2c:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40bc2f:	ff 15 74 9b 41 00    	call   DWORD PTR ds:0x419b74
  40bc35:	8d 4d c8             	lea    ecx,[ebp-0x38]
  40bc38:	c6 45 fc 13          	mov    BYTE PTR [ebp-0x4],0x13
  40bc3c:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40bc42:	8d 45 cc             	lea    eax,[ebp-0x34]
  40bc45:	50                   	push   eax
  40bc46:	8d 45 ac             	lea    eax,[ebp-0x54]
  40bc49:	50                   	push   eax
  40bc4a:	8d 4d ec             	lea    ecx,[ebp-0x14]
  40bc4d:	ff d7                	call   edi
  40bc4f:	8d 4d ac             	lea    ecx,[ebp-0x54]
  40bc52:	ff 15 50 9b 41 00    	call   DWORD PTR ds:0x419b50
  40bc58:	a1 a4 96 46 00       	mov    eax,ds:0x4696a4
  40bc5d:	c7 45 d0 00 00 00 00 	mov    DWORD PTR [ebp-0x30],0x0
  40bc64:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
  40bc67:	83 78 04 00          	cmp    DWORD PTR [eax+0x4],0x0
  40bc6b:	0f 8e 30 04 00 00    	jle    0x40c0a1
  40bc71:	6a 06                	push   0x6
  40bc73:	68 3c 7a 45 00       	push   0x457a3c
  40bc78:	ff d3                	call   ebx
  40bc7a:	83 c4 08             	add    esp,0x8
  40bc7d:	89 45 c4             	mov    DWORD PTR [ebp-0x3c],eax
  40bc80:	8d 45 c4             	lea    eax,[ebp-0x3c]
  40bc83:	c6 45 fc 14          	mov    BYTE PTR [ebp-0x4],0x14
  40bc87:	50                   	push   eax
  40bc88:	8d 45 e0             	lea    eax,[ebp-0x20]
  40bc8b:	50                   	push   eax
  40bc8c:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40bc8f:	ff 15 74 9b 41 00    	call   DWORD PTR ds:0x419b74
  40bc95:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  40bc98:	c6 45 fc 16          	mov    BYTE PTR [ebp-0x4],0x16
  40bc9c:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40bca2:	8d 45 e0             	lea    eax,[ebp-0x20]
  40bca5:	50                   	push   eax
  40bca6:	8d 45 a0             	lea    eax,[ebp-0x60]
  40bca9:	50                   	push   eax
  40bcaa:	8d 4d cc             	lea    ecx,[ebp-0x34]
  40bcad:	ff d7                	call   edi
  40bcaf:	8d 4d a0             	lea    ecx,[ebp-0x60]
  40bcb2:	ff 15 50 9b 41 00    	call   DWORD PTR ds:0x419b50
  40bcb8:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  40bcbe:	8d 45 c0             	lea    eax,[ebp-0x40]
  40bcc1:	50                   	push   eax
  40bcc2:	8d 49 10             	lea    ecx,[ecx+0x10]
  40bcc5:	e8 a6 9b ff ff       	call   0x405870
  40bcca:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
  40bccd:	8b c8                	mov    ecx,eax
  40bccf:	ff 15 b0 92 41 00    	call   DWORD PTR ds:0x4192b0
  40bcd5:	50                   	push   eax
  40bcd6:	8d 4d e8             	lea    ecx,[ebp-0x18]
  40bcd9:	ff 15 d4 93 41 00    	call   DWORD PTR ds:0x4193d4
  40bcdf:	8b 7d c0             	mov    edi,DWORD PTR [ebp-0x40]
  40bce2:	c6 45 fc 18          	mov    BYTE PTR [ebp-0x4],0x18
  40bce6:	8b 07                	mov    eax,DWORD PTR [edi]
  40bce8:	85 c0                	test   eax,eax
  40bcea:	74 16                	je     0x40bd02
  40bcec:	83 f8 ff             	cmp    eax,0xffffffff
  40bcef:	74 54                	je     0x40bd45
  40bcf1:	83 c8 ff             	or     eax,0xffffffff
  40bcf4:	f0 0f c1 07          	lock xadd DWORD PTR [edi],eax
  40bcf8:	0f 95 c0             	setne  al
  40bcfb:	84 c0                	test   al,al
  40bcfd:	75 46                	jne    0x40bd45
  40bcff:	8b 7d c0             	mov    edi,DWORD PTR [ebp-0x40]
  40bd02:	8b 77 0c             	mov    esi,DWORD PTR [edi+0xc]
  40bd05:	8b 5f 08             	mov    ebx,DWORD PTR [edi+0x8]
  40bd08:	83 c6 04             	add    esi,0x4
  40bd0b:	83 c3 04             	add    ebx,0x4
  40bd0e:	8d 34 b7             	lea    esi,[edi+esi*4]
  40bd11:	8d 1c 9f             	lea    ebx,[edi+ebx*4]
  40bd14:	3b de                	cmp    ebx,esi
  40bd16:	74 17                	je     0x40bd2f
  40bd18:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [eax+eax*1+0x0]
  40bd1f:	00 
  40bd20:	83 ee 04             	sub    esi,0x4
  40bd23:	8b ce                	mov    ecx,esi
  40bd25:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40bd2b:	3b f3                	cmp    esi,ebx
  40bd2d:	75 f1                	jne    0x40bd20
  40bd2f:	57                   	push   edi
  40bd30:	ff 15 98 93 41 00    	call   DWORD PTR ds:0x419398
  40bd36:	8b 1d a8 93 41 00    	mov    ebx,DWORD PTR ds:0x4193a8
  40bd3c:	83 c4 04             	add    esp,0x4
  40bd3f:	8b 35 80 9b 41 00    	mov    esi,DWORD PTR ds:0x419b80
  40bd45:	6a 04                	push   0x4
  40bd47:	68 0c 7a 45 00       	push   0x457a0c
  40bd4c:	c6 45 fc 17          	mov    BYTE PTR [ebp-0x4],0x17
  40bd50:	ff d3                	call   ebx
  40bd52:	83 c4 08             	add    esp,0x8
  40bd55:	89 45 bc             	mov    DWORD PTR [ebp-0x44],eax
  40bd58:	8d 45 e8             	lea    eax,[ebp-0x18]
  40bd5b:	c6 45 fc 19          	mov    BYTE PTR [ebp-0x4],0x19
  40bd5f:	50                   	push   eax
  40bd60:	8d 45 bc             	lea    eax,[ebp-0x44]
  40bd63:	50                   	push   eax
  40bd64:	8d 4d e0             	lea    ecx,[ebp-0x20]
  40bd67:	ff d6                	call   esi
  40bd69:	8d 4d bc             	lea    ecx,[ebp-0x44]
  40bd6c:	c6 45 fc 17          	mov    BYTE PTR [ebp-0x4],0x17
  40bd70:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40bd76:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  40bd7c:	8d 45 e8             	lea    eax,[ebp-0x18]
  40bd7f:	33 db                	xor    ebx,ebx
  40bd81:	50                   	push   eax
  40bd82:	89 5d ac             	mov    DWORD PTR [ebp-0x54],ebx
  40bd85:	8d 49 10             	lea    ecx,[ecx+0x10]
  40bd88:	e8 53 81 ff ff       	call   0x403ee0
  40bd8d:	8b 00                	mov    eax,DWORD PTR [eax]
  40bd8f:	39 58 04             	cmp    DWORD PTR [eax+0x4],ebx
  40bd92:	0f 8e cf 02 00 00    	jle    0x40c067
  40bd98:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [eax+eax*1+0x0]
  40bd9f:	00 
  40bda0:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  40bda6:	8d 45 b8             	lea    eax,[ebp-0x48]
  40bda9:	50                   	push   eax
  40bdaa:	8d 45 e8             	lea    eax,[ebp-0x18]
  40bdad:	50                   	push   eax
  40bdae:	8d 49 10             	lea    ecx,[ecx+0x10]
  40bdb1:	e8 2a 81 ff ff       	call   0x403ee0
  40bdb6:	8b c8                	mov    ecx,eax
  40bdb8:	e8 b3 9a ff ff       	call   0x405870
  40bdbd:	53                   	push   ebx
  40bdbe:	8b c8                	mov    ecx,eax
  40bdc0:	ff 15 b0 92 41 00    	call   DWORD PTR ds:0x4192b0
  40bdc6:	50                   	push   eax
  40bdc7:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  40bdca:	ff 15 d4 93 41 00    	call   DWORD PTR ds:0x4193d4
  40bdd0:	8b 7d b8             	mov    edi,DWORD PTR [ebp-0x48]
  40bdd3:	c6 45 fc 1b          	mov    BYTE PTR [ebp-0x4],0x1b
  40bdd7:	8b 07                	mov    eax,DWORD PTR [edi]
  40bdd9:	85 c0                	test   eax,eax
  40bddb:	74 16                	je     0x40bdf3
  40bddd:	83 f8 ff             	cmp    eax,0xffffffff
  40bde0:	74 47                	je     0x40be29
  40bde2:	83 c8 ff             	or     eax,0xffffffff
  40bde5:	f0 0f c1 07          	lock xadd DWORD PTR [edi],eax
  40bde9:	0f 95 c0             	setne  al
  40bdec:	84 c0                	test   al,al
  40bdee:	75 39                	jne    0x40be29
  40bdf0:	8b 7d b8             	mov    edi,DWORD PTR [ebp-0x48]
  40bdf3:	8b 77 0c             	mov    esi,DWORD PTR [edi+0xc]
  40bdf6:	8b 5f 08             	mov    ebx,DWORD PTR [edi+0x8]
  40bdf9:	83 c6 04             	add    esi,0x4
  40bdfc:	83 c3 04             	add    ebx,0x4
  40bdff:	8d 34 b7             	lea    esi,[edi+esi*4]
  40be02:	8d 1c 9f             	lea    ebx,[edi+ebx*4]
  40be05:	3b de                	cmp    ebx,esi
  40be07:	74 16                	je     0x40be1f
  40be09:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [eax+0x0]
  40be10:	83 ee 04             	sub    esi,0x4
  40be13:	8b ce                	mov    ecx,esi
  40be15:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40be1b:	3b f3                	cmp    esi,ebx
  40be1d:	75 f1                	jne    0x40be10
  40be1f:	57                   	push   edi
  40be20:	ff 15 98 93 41 00    	call   DWORD PTR ds:0x419398
  40be26:	83 c4 04             	add    esp,0x4
  40be29:	6a 05                	push   0x5
  40be2b:	68 44 7a 45 00       	push   0x457a44
  40be30:	c6 45 fc 1a          	mov    BYTE PTR [ebp-0x4],0x1a
  40be34:	ff 15 a8 93 41 00    	call   DWORD PTR ds:0x4193a8
  40be3a:	83 c4 08             	add    esp,0x8
  40be3d:	89 45 b4             	mov    DWORD PTR [ebp-0x4c],eax
  40be40:	8d 45 b4             	lea    eax,[ebp-0x4c]
  40be43:	c6 45 fc 1c          	mov    BYTE PTR [ebp-0x4],0x1c
  40be47:	50                   	push   eax
  40be48:	8d 45 d4             	lea    eax,[ebp-0x2c]
  40be4b:	50                   	push   eax
  40be4c:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40be4f:	ff 15 74 9b 41 00    	call   DWORD PTR ds:0x419b74
  40be55:	8d 4d b4             	lea    ecx,[ebp-0x4c]
  40be58:	c6 45 fc 1e          	mov    BYTE PTR [ebp-0x4],0x1e
  40be5c:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40be62:	8d 45 d4             	lea    eax,[ebp-0x2c]
  40be65:	50                   	push   eax
  40be66:	8d 45 9c             	lea    eax,[ebp-0x64]
  40be69:	50                   	push   eax
  40be6a:	8d 4d e0             	lea    ecx,[ebp-0x20]
  40be6d:	ff 15 58 9b 41 00    	call   DWORD PTR ds:0x419b58
  40be73:	8d 4d 9c             	lea    ecx,[ebp-0x64]
  40be76:	ff 15 50 9b 41 00    	call   DWORD PTR ds:0x419b50
  40be7c:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  40be82:	8d 45 e8             	lea    eax,[ebp-0x18]
  40be85:	50                   	push   eax
  40be86:	8d 49 10             	lea    ecx,[ecx+0x10]
  40be89:	e8 52 80 ff ff       	call   0x403ee0
  40be8e:	8b d8                	mov    ebx,eax
  40be90:	89 5d b0             	mov    DWORD PTR [ebp-0x50],ebx
  40be93:	8b 0b                	mov    ecx,DWORD PTR [ebx]
  40be95:	8b 01                	mov    eax,DWORD PTR [ecx]
  40be97:	83 f8 01             	cmp    eax,0x1
  40be9a:	0f 84 07 01 00 00    	je     0x40bfa7
  40bea0:	85 c0                	test   eax,eax
  40bea2:	0f 84 ff 00 00 00    	je     0x40bfa7
  40bea8:	ff 15 6c 93 41 00    	call   DWORD PTR ds:0x41936c
  40beae:	8b 0b                	mov    ecx,DWORD PTR [ebx]
  40beb0:	8b f8                	mov    edi,eax
  40beb2:	8b 59 0c             	mov    ebx,DWORD PTR [ecx+0xc]
  40beb5:	85 db                	test   ebx,ebx
  40beb7:	74 75                	je     0x40bf2e
  40beb9:	6a 00                	push   0x0
  40bebb:	6a 00                	push   0x0
  40bebd:	8d 4b 10             	lea    ecx,[ebx+0x10]
  40bec0:	51                   	push   ecx
  40bec1:	8d 43 0c             	lea    eax,[ebx+0xc]
  40bec4:	8b cf                	mov    ecx,edi
  40bec6:	50                   	push   eax
  40bec7:	e8 54 92 ff ff       	call   0x405120
  40becc:	f6 03 01             	test   BYTE PTR [ebx],0x1
  40becf:	8b f0                	mov    esi,eax
  40bed1:	74 05                	je     0x40bed8
  40bed3:	83 0e 01             	or     DWORD PTR [esi],0x1
  40bed6:	eb 03                	jmp    0x40bedb
  40bed8:	83 26 fe             	and    DWORD PTR [esi],0xfffffffe
  40bedb:	8b 4b 04             	mov    ecx,DWORD PTR [ebx+0x4]
  40bede:	85 c9                	test   ecx,ecx
  40bee0:	74 14                	je     0x40bef6
  40bee2:	57                   	push   edi
  40bee3:	e8 e8 90 ff ff       	call   0x404fd0
  40bee8:	89 46 04             	mov    DWORD PTR [esi+0x4],eax
  40beeb:	8b 08                	mov    ecx,DWORD PTR [eax]
  40beed:	83 e1 03             	and    ecx,0x3
  40bef0:	0b ce                	or     ecx,esi
  40bef2:	89 08                	mov    DWORD PTR [eax],ecx
  40bef4:	eb 07                	jmp    0x40befd
  40bef6:	c7 46 04 00 00 00 00 	mov    DWORD PTR [esi+0x4],0x0
  40befd:	8b 4b 08             	mov    ecx,DWORD PTR [ebx+0x8]
  40bf00:	85 c9                	test   ecx,ecx
  40bf02:	74 14                	je     0x40bf18
  40bf04:	57                   	push   edi
  40bf05:	e8 c6 90 ff ff       	call   0x404fd0
  40bf0a:	89 46 08             	mov    DWORD PTR [esi+0x8],eax
  40bf0d:	8b 08                	mov    ecx,DWORD PTR [eax]
  40bf0f:	83 e1 03             	and    ecx,0x3
  40bf12:	0b ce                	or     ecx,esi
  40bf14:	89 08                	mov    DWORD PTR [eax],ecx
  40bf16:	eb 07                	jmp    0x40bf1f
  40bf18:	c7 46 08 00 00 00 00 	mov    DWORD PTR [esi+0x8],0x0
  40bf1f:	89 77 0c             	mov    DWORD PTR [edi+0xc],esi
  40bf22:	8d 47 08             	lea    eax,[edi+0x8]
  40bf25:	8b 0e                	mov    ecx,DWORD PTR [esi]
  40bf27:	83 e1 03             	and    ecx,0x3
  40bf2a:	0b c8                	or     ecx,eax
  40bf2c:	89 0e                	mov    DWORD PTR [esi],ecx
  40bf2e:	8b 5d b0             	mov    ebx,DWORD PTR [ebp-0x50]
  40bf31:	8b 0b                	mov    ecx,DWORD PTR [ebx]
  40bf33:	8b 01                	mov    eax,DWORD PTR [ecx]
  40bf35:	85 c0                	test   eax,eax
  40bf37:	74 13                	je     0x40bf4c
  40bf39:	83 f8 ff             	cmp    eax,0xffffffff
  40bf3c:	74 5f                	je     0x40bf9d
  40bf3e:	83 c8 ff             	or     eax,0xffffffff
  40bf41:	f0 0f c1 01          	lock xadd DWORD PTR [ecx],eax
  40bf45:	0f 95 c0             	setne  al
  40bf48:	84 c0                	test   al,al
  40bf4a:	75 51                	jne    0x40bf9d
  40bf4c:	8b 03                	mov    eax,DWORD PTR [ebx]
  40bf4e:	89 45 b0             	mov    DWORD PTR [ebp-0x50],eax
  40bf51:	8b 70 0c             	mov    esi,DWORD PTR [eax+0xc]
  40bf54:	85 f6                	test   esi,esi
  40bf56:	74 3b                	je     0x40bf93
  40bf58:	8d 4e 0c             	lea    ecx,[esi+0xc]
  40bf5b:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40bf61:	8d 4e 10             	lea    ecx,[esi+0x10]
  40bf64:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40bf6a:	8b 4e 04             	mov    ecx,DWORD PTR [esi+0x4]
  40bf6d:	85 c9                	test   ecx,ecx
  40bf6f:	74 05                	je     0x40bf76
  40bf71:	e8 da 92 ff ff       	call   0x405250
  40bf76:	8b 4e 08             	mov    ecx,DWORD PTR [esi+0x8]
  40bf79:	85 c9                	test   ecx,ecx
  40bf7b:	74 05                	je     0x40bf82
  40bf7d:	e8 ce 92 ff ff       	call   0x405250
  40bf82:	8b 4d b0             	mov    ecx,DWORD PTR [ebp-0x50]
  40bf85:	6a 04                	push   0x4
  40bf87:	ff 71 0c             	push   DWORD PTR [ecx+0xc]
  40bf8a:	ff 15 7c 93 41 00    	call   DWORD PTR ds:0x41937c
  40bf90:	8b 45 b0             	mov    eax,DWORD PTR [ebp-0x50]
  40bf93:	50                   	push   eax
  40bf94:	ff 15 68 93 41 00    	call   DWORD PTR ds:0x419368
  40bf9a:	83 c4 04             	add    esp,0x4
  40bf9d:	8b cf                	mov    ecx,edi
  40bf9f:	89 3b                	mov    DWORD PTR [ebx],edi
  40bfa1:	ff 15 88 93 41 00    	call   DWORD PTR ds:0x419388
  40bfa7:	8b 33                	mov    esi,DWORD PTR [ebx]
  40bfa9:	8b 76 0c             	mov    esi,DWORD PTR [esi+0xc]
  40bfac:	85 f6                	test   esi,esi
  40bfae:	74 3e                	je     0x40bfee
  40bfb0:	33 ff                	xor    edi,edi
  40bfb2:	8d 45 e4             	lea    eax,[ebp-0x1c]
  40bfb5:	50                   	push   eax
  40bfb6:	8d 46 0c             	lea    eax,[esi+0xc]
  40bfb9:	50                   	push   eax
  40bfba:	ff 15 bc 92 41 00    	call   DWORD PTR ds:0x4192bc
  40bfc0:	83 c4 08             	add    esp,0x8
  40bfc3:	84 c0                	test   al,al
  40bfc5:	75 07                	jne    0x40bfce
  40bfc7:	8b fe                	mov    edi,esi
  40bfc9:	8b 76 04             	mov    esi,DWORD PTR [esi+0x4]
  40bfcc:	eb 03                	jmp    0x40bfd1
  40bfce:	8b 76 08             	mov    esi,DWORD PTR [esi+0x8]
  40bfd1:	85 f6                	test   esi,esi
  40bfd3:	75 dd                	jne    0x40bfb2
  40bfd5:	85 ff                	test   edi,edi
  40bfd7:	74 15                	je     0x40bfee
  40bfd9:	8d 47 0c             	lea    eax,[edi+0xc]
  40bfdc:	50                   	push   eax
  40bfdd:	8d 45 e4             	lea    eax,[ebp-0x1c]
  40bfe0:	50                   	push   eax
  40bfe1:	ff 15 bc 92 41 00    	call   DWORD PTR ds:0x4192bc
  40bfe7:	83 c4 08             	add    esp,0x8
  40bfea:	84 c0                	test   al,al
  40bfec:	74 2c                	je     0x40c01a
  40bfee:	8d 4d 98             	lea    ecx,[ebp-0x68]
  40bff1:	ff 15 d8 93 41 00    	call   DWORD PTR ds:0x4193d8
  40bff7:	50                   	push   eax
  40bff8:	8d 45 e4             	lea    eax,[ebp-0x1c]
  40bffb:	c6 45 fc 1f          	mov    BYTE PTR [ebp-0x4],0x1f
  40bfff:	50                   	push   eax
  40c000:	8d 45 94             	lea    eax,[ebp-0x6c]
  40c003:	8b cb                	mov    ecx,ebx
  40c005:	50                   	push   eax
  40c006:	e8 e5 96 ff ff       	call   0x4056f0
  40c00b:	8d 4d 98             	lea    ecx,[ebp-0x68]
  40c00e:	c6 45 fc 1e          	mov    BYTE PTR [ebp-0x4],0x1e
  40c012:	8b 38                	mov    edi,DWORD PTR [eax]
  40c014:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40c01a:	8b 35 80 9b 41 00    	mov    esi,DWORD PTR ds:0x419b80
  40c020:	8d 47 10             	lea    eax,[edi+0x10]
  40c023:	50                   	push   eax
  40c024:	8d 45 e4             	lea    eax,[ebp-0x1c]
  40c027:	50                   	push   eax
  40c028:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  40c02b:	ff d6                	call   esi
  40c02d:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  40c030:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  40c036:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  40c039:	c6 45 fc 17          	mov    BYTE PTR [ebp-0x4],0x17
  40c03d:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40c043:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  40c049:	8d 45 e8             	lea    eax,[ebp-0x18]
  40c04c:	8b 5d ac             	mov    ebx,DWORD PTR [ebp-0x54]
  40c04f:	43                   	inc    ebx
  40c050:	50                   	push   eax
  40c051:	8d 49 10             	lea    ecx,[ecx+0x10]
  40c054:	89 5d ac             	mov    DWORD PTR [ebp-0x54],ebx
  40c057:	e8 84 7e ff ff       	call   0x403ee0
  40c05c:	8b 00                	mov    eax,DWORD PTR [eax]
  40c05e:	3b 58 04             	cmp    ebx,DWORD PTR [eax+0x4]
  40c061:	0f 8c 39 fd ff ff    	jl     0x40bda0
  40c067:	8d 4d e8             	lea    ecx,[ebp-0x18]
  40c06a:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40c070:	8d 4d e0             	lea    ecx,[ebp-0x20]
  40c073:	c6 45 fc 13          	mov    BYTE PTR [ebp-0x4],0x13
  40c077:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  40c07d:	a1 a4 96 46 00       	mov    eax,ds:0x4696a4
  40c082:	8b 4d d0             	mov    ecx,DWORD PTR [ebp-0x30]
  40c085:	8b 1d a8 93 41 00    	mov    ebx,DWORD PTR ds:0x4193a8
  40c08b:	41                   	inc    ecx
  40c08c:	8b 3d 58 9b 41 00    	mov    edi,DWORD PTR ds:0x419b58
  40c092:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
  40c095:	89 4d d0             	mov    DWORD PTR [ebp-0x30],ecx
  40c098:	3b 48 04             	cmp    ecx,DWORD PTR [eax+0x4]
  40c09b:	0f 8c d0 fb ff ff    	jl     0x40bc71
  40c0a1:	8d 45 08             	lea    eax,[ebp+0x8]
  40c0a4:	50                   	push   eax
  40c0a5:	8d 4d 8c             	lea    ecx,[ebp-0x74]
  40c0a8:	ff 15 50 93 41 00    	call   DWORD PTR ds:0x419350
  40c0ae:	51                   	push   ecx
  40c0af:	8b c4                	mov    eax,esp
  40c0b1:	c6 45 fc 20          	mov    BYTE PTR [ebp-0x4],0x20
  40c0b5:	8d 4d 8c             	lea    ecx,[ebp-0x74]
  40c0b8:	c7 00 02 00 00 00    	mov    DWORD PTR [eax],0x2
  40c0be:	ff 15 48 93 41 00    	call   DWORD PTR ds:0x419348
  40c0c4:	8d 45 8c             	lea    eax,[ebp-0x74]
  40c0c7:	50                   	push   eax
  40c0c8:	8d 4d 84             	lea    ecx,[ebp-0x7c]
  40c0cb:	ff 15 64 93 41 00    	call   DWORD PTR ds:0x419364
  40c0d1:	68 4c 7a 45 00       	push   0x457a4c
  40c0d6:	8d 4d 84             	lea    ecx,[ebp-0x7c]
  40c0d9:	c6 45 fc 21          	mov    BYTE PTR [ebp-0x4],0x21
  40c0dd:	ff 15 5c 93 41 00    	call   DWORD PTR ds:0x41935c
  40c0e3:	6a 01                	push   0x1
  40c0e5:	8d 45 98             	lea    eax,[ebp-0x68]
  40c0e8:	50                   	push   eax
  40c0e9:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40c0ec:	ff 15 78 9b 41 00    	call   DWORD PTR ds:0x419b78
  40c0f2:	50                   	push   eax
  40c0f3:	8d 4d 84             	lea    ecx,[ebp-0x7c]
  40c0f6:	c6 45 fc 22          	mov    BYTE PTR [ebp-0x4],0x22
  40c0fa:	ff 15 58 93 41 00    	call   DWORD PTR ds:0x419358
  40c100:	8d 4d 98             	lea    ecx,[ebp-0x68]
  40c103:	c6 45 fc 21          	mov    BYTE PTR [ebp-0x4],0x21
  40c107:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40c10d:	8d 4d 8c             	lea    ecx,[ebp-0x74]
  40c110:	ff 15 54 93 41 00    	call   DWORD PTR ds:0x419354
  40c116:	8d 4d 84             	lea    ecx,[ebp-0x7c]
  40c119:	ff 15 60 93 41 00    	call   DWORD PTR ds:0x419360
  40c11f:	8d 4d 8c             	lea    ecx,[ebp-0x74]
  40c122:	ff 15 4c 93 41 00    	call   DWORD PTR ds:0x41934c
  40c128:	8d 4d cc             	lea    ecx,[ebp-0x34]
  40c12b:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  40c131:	8d 4d a8             	lea    ecx,[ebp-0x58]
  40c134:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  40c13a:	8d 4d a4             	lea    ecx,[ebp-0x5c]
  40c13d:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  40c143:	8d 4d dc             	lea    ecx,[ebp-0x24]
  40c146:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  40c14c:	8d 4d d8             	lea    ecx,[ebp-0x28]
  40c14f:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  40c155:	8d 4d ec             	lea    ecx,[ebp-0x14]
  40c158:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  40c15e:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40c161:	ff 15 98 9b 41 00    	call   DWORD PTR ds:0x419b98
  40c167:	8d 4d 08             	lea    ecx,[ebp+0x8]
  40c16a:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40c170:	b8 01 00 00 00       	mov    eax,0x1
  40c175:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
  40c178:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  40c17f:	59                   	pop    ecx
  40c180:	5f                   	pop    edi
  40c181:	5e                   	pop    esi
  40c182:	5b                   	pop    ebx
  40c183:	8b e5                	mov    esp,ebp
  40c185:	5d                   	pop    ebp
  40c186:	c3                   	ret

===== ConceptModel category and link traversal [VA 0x0040A7D0..0x0040A95D) =====

/mnt/data/work_stage117/original/IS.exe:     file format pei-i386


Disassembly of section .text:

0040a7d0 <.text+0x97d0>:
  40a7d0:	d7                   	xlat   BYTE PTR ds:[ebx]
  40a7d1:	8d 4d d8             	lea    ecx,[ebp-0x28]
  40a7d4:	ff d3                	call   ebx
  40a7d6:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  40a7dc:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
  40a7df:	ff d6                	call   esi
  40a7e1:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  40a7e7:	8b 70 04             	mov    esi,DWORD PTR [eax+0x4]
  40a7ea:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
  40a7ed:	8b 76 14             	mov    esi,DWORD PTR [esi+0x14]
  40a7f0:	ff 15 78 91 41 00    	call   DWORD PTR ds:0x419178
  40a7f6:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
  40a7f9:	3b 70 18             	cmp    esi,DWORD PTR [eax+0x18]
  40a7fc:	73 4d                	jae    0x40a84b
  40a7fe:	66 90                	xchg   ax,ax
  40a800:	ff 36                	push   DWORD PTR [esi]
  40a802:	8d 45 d8             	lea    eax,[ebp-0x28]
  40a805:	50                   	push   eax
  40a806:	e8 a5 19 00 00       	call   0x40c1b0
  40a80b:	83 c4 08             	add    esp,0x8
  40a80e:	8d 45 d8             	lea    eax,[ebp-0x28]
  40a811:	c6 45 fc 06          	mov    BYTE PTR [ebp-0x4],0x6
  40a815:	50                   	push   eax
  40a816:	8d 45 d0             	lea    eax,[ebp-0x30]
  40a819:	50                   	push   eax
  40a81a:	8d 4d ec             	lea    ecx,[ebp-0x14]
  40a81d:	ff d7                	call   edi
  40a81f:	8d 4d d0             	lea    ecx,[ebp-0x30]
  40a822:	ff d3                	call   ebx
  40a824:	8d 4d d8             	lea    ecx,[ebp-0x28]
  40a827:	c6 45 fc 05          	mov    BYTE PTR [ebp-0x4],0x5
  40a82b:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  40a831:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  40a837:	83 c6 04             	add    esi,0x4
  40a83a:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
  40a83d:	ff 15 78 91 41 00    	call   DWORD PTR ds:0x419178
  40a843:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
  40a846:	3b 70 18             	cmp    esi,DWORD PTR [eax+0x18]
  40a849:	72 b5                	jb     0x40a800
  40a84b:	6a 05                	push   0x5
  40a84d:	68 6c 7b 45 00       	push   0x457b6c
  40a852:	ff 15 a8 93 41 00    	call   DWORD PTR ds:0x4193a8
  40a858:	83 c4 08             	add    esp,0x8
  40a85b:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
  40a85e:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
  40a861:	8d 45 d8             	lea    eax,[ebp-0x28]
  40a864:	50                   	push   eax
  40a865:	8d 45 f0             	lea    eax,[ebp-0x10]
  40a868:	c6 45 fc 07          	mov    BYTE PTR [ebp-0x4],0x7
  40a86c:	50                   	push   eax
  40a86d:	ff 15 74 9b 41 00    	call   DWORD PTR ds:0x419b74
  40a873:	8d 4d d8             	lea    ecx,[ebp-0x28]
  40a876:	c6 45 fc 09          	mov    BYTE PTR [ebp-0x4],0x9
  40a87a:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40a880:	8d 45 f0             	lea    eax,[ebp-0x10]
  40a883:	50                   	push   eax
  40a884:	8d 45 d0             	lea    eax,[ebp-0x30]
  40a887:	50                   	push   eax
  40a888:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  40a88b:	ff d7                	call   edi
  40a88d:	8d 4d d0             	lea    ecx,[ebp-0x30]
  40a890:	ff d3                	call   ebx
  40a892:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  40a898:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
  40a89b:	ff 15 78 91 41 00    	call   DWORD PTR ds:0x419178
  40a8a1:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  40a8a7:	8b 70 04             	mov    esi,DWORD PTR [eax+0x4]
  40a8aa:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
  40a8ad:	8b 76 20             	mov    esi,DWORD PTR [esi+0x20]
  40a8b0:	ff 15 78 91 41 00    	call   DWORD PTR ds:0x419178
  40a8b6:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
  40a8b9:	3b 70 24             	cmp    esi,DWORD PTR [eax+0x24]
  40a8bc:	73 4d                	jae    0x40a90b
  40a8be:	66 90                	xchg   ax,ax
  40a8c0:	ff 36                	push   DWORD PTR [esi]
  40a8c2:	8d 45 dc             	lea    eax,[ebp-0x24]
  40a8c5:	50                   	push   eax
  40a8c6:	e8 c5 18 00 00       	call   0x40c190
  40a8cb:	83 c4 08             	add    esp,0x8
  40a8ce:	8d 45 dc             	lea    eax,[ebp-0x24]
  40a8d1:	c6 45 fc 0a          	mov    BYTE PTR [ebp-0x4],0xa
  40a8d5:	50                   	push   eax
  40a8d6:	8d 45 d0             	lea    eax,[ebp-0x30]
  40a8d9:	50                   	push   eax
  40a8da:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40a8dd:	ff d7                	call   edi
  40a8df:	8d 4d d0             	lea    ecx,[ebp-0x30]
  40a8e2:	ff d3                	call   ebx
  40a8e4:	8d 4d dc             	lea    ecx,[ebp-0x24]
  40a8e7:	c6 45 fc 09          	mov    BYTE PTR [ebp-0x4],0x9
  40a8eb:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  40a8f1:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  40a8f7:	83 c6 04             	add    esi,0x4
  40a8fa:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
  40a8fd:	ff 15 78 91 41 00    	call   DWORD PTR ds:0x419178
  40a903:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
  40a906:	3b 70 24             	cmp    esi,DWORD PTR [eax+0x24]
  40a909:	72 b5                	jb     0x40a8c0
  40a90b:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  40a911:	8b 35 f4 90 41 00    	mov    esi,DWORD PTR ds:0x4190f4
  40a917:	6a 00                	push   0x0
  40a919:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
  40a91c:	ff d6                	call   esi
  40a91e:	50                   	push   eax
  40a91f:	8d 45 e8             	lea    eax,[ebp-0x18]
  40a922:	50                   	push   eax
  40a923:	e8 68 1a 00 00       	call   0x40c390
  40a928:	6a 03                	push   0x3
  40a92a:	68 a8 7b 45 00       	push   0x457ba8
  40a92f:	c6 45 fc 0b          	mov    BYTE PTR [ebp-0x4],0xb
  40a933:	ff 15 a8 93 41 00    	call   DWORD PTR ds:0x4193a8
  40a939:	83 c4 10             	add    esp,0x10
  40a93c:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
  40a93f:	8d 45 d8             	lea    eax,[ebp-0x28]
  40a942:	c6 45 fc 0c          	mov    BYTE PTR [ebp-0x4],0xc
  40a946:	50                   	push   eax
  40a947:	8d 4d e8             	lea    ecx,[ebp-0x18]
  40a94a:	ff 15 b4 9b 41 00    	call   DWORD PTR ds:0x419bb4
  40a950:	8d 4d d8             	lea    ecx,[ebp-0x28]
  40a953:	c6 45 fc 0b          	mov    BYTE PTR [ebp-0x4],0xb
  40a957:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0

===== Link range attribute writer [VA 0x0040A510..0x0040A5A9) =====

/mnt/data/work_stage117/original/IS.exe:     file format pei-i386


Disassembly of section .text:

0040a510 <.text+0x9510>:
  40a510:	55                   	push   ebp
  40a511:	8b ec                	mov    ebp,esp
  40a513:	6a ff                	push   0xffffffff
  40a515:	68 b3 6f 41 00       	push   0x416fb3
  40a51a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  40a520:	50                   	push   eax
  40a521:	51                   	push   ecx
  40a522:	56                   	push   esi
  40a523:	57                   	push   edi
  40a524:	a1 cc 90 46 00       	mov    eax,ds:0x4690cc
  40a529:	33 c5                	xor    eax,ebp
  40a52b:	50                   	push   eax
  40a52c:	8d 45 f4             	lea    eax,[ebp-0xc]
  40a52f:	64 a3 00 00 00 00    	mov    fs:0x0,eax
  40a535:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
  40a53c:	8b 75 0c             	mov    esi,DWORD PTR [ebp+0xc]
  40a53f:	8b 7d 08             	mov    edi,DWORD PTR [ebp+0x8]
  40a542:	56                   	push   esi
  40a543:	57                   	push   edi
  40a544:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
  40a54b:	e8 10 f9 ff ff       	call   0x409e60
  40a550:	6a 05                	push   0x5
  40a552:	68 08 7c 45 00       	push   0x457c08
  40a557:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
  40a55e:	c7 45 f0 01 00 00 00 	mov    DWORD PTR [ebp-0x10],0x1
  40a565:	ff 15 a8 93 41 00    	call   DWORD PTR ds:0x4193a8
  40a56b:	83 c4 10             	add    esp,0x10
  40a56e:	89 45 0c             	mov    DWORD PTR [ebp+0xc],eax
  40a571:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
  40a574:	8b cf                	mov    ecx,edi
  40a576:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [ebp-0x4],0x1
  40a57d:	8b 40 2c             	mov    eax,DWORD PTR [eax+0x2c]
  40a580:	99                   	cdq
  40a581:	52                   	push   edx
  40a582:	50                   	push   eax
  40a583:	8d 45 0c             	lea    eax,[ebp+0xc]
  40a586:	50                   	push   eax
  40a587:	ff 15 4c 9b 41 00    	call   DWORD PTR ds:0x419b4c
  40a58d:	8d 4d 0c             	lea    ecx,[ebp+0xc]
  40a590:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40a596:	8b c7                	mov    eax,edi
  40a598:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
  40a59b:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  40a5a2:	59                   	pop    ecx
  40a5a3:	5f                   	pop    edi
  40a5a4:	5e                   	pop    esi
  40a5a5:	8b e5                	mov    esp,ebp
  40a5a7:	5d                   	pop    ebp
  40a5a8:	c3                   	ret

===== Range writer wrapper and category serializer [VA 0x0040C190..0x0040C38A) =====

/mnt/data/work_stage117/original/IS.exe:     file format pei-i386


Disassembly of section .text:

0040c190 <.text+0xb190>:
  40c190:	55                   	push   ebp
  40c191:	8b ec                	mov    ebp,esp
  40c193:	51                   	push   ecx
  40c194:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
  40c197:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
  40c19e:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  40c1a1:	e8 6a e3 ff ff       	call   0x40a510
  40c1a6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  40c1a9:	83 c4 08             	add    esp,0x8
  40c1ac:	8b e5                	mov    esp,ebp
  40c1ae:	5d                   	pop    ebp
  40c1af:	c3                   	ret
  40c1b0:	55                   	push   ebp
  40c1b1:	8b ec                	mov    ebp,esp
  40c1b3:	6a ff                	push   0xffffffff
  40c1b5:	68 e9 74 41 00       	push   0x4174e9
  40c1ba:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  40c1c0:	50                   	push   eax
  40c1c1:	51                   	push   ecx
  40c1c2:	53                   	push   ebx
  40c1c3:	56                   	push   esi
  40c1c4:	57                   	push   edi
  40c1c5:	a1 cc 90 46 00       	mov    eax,ds:0x4690cc
  40c1ca:	33 c5                	xor    eax,ebp
  40c1cc:	50                   	push   eax
  40c1cd:	8d 45 f4             	lea    eax,[ebp-0xc]
  40c1d0:	64 a3 00 00 00 00    	mov    fs:0x0,eax
  40c1d6:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
  40c1dd:	8b 7d 0c             	mov    edi,DWORD PTR [ebp+0xc]
  40c1e0:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
  40c1e3:	57                   	push   edi
  40c1e4:	56                   	push   esi
  40c1e5:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
  40c1ec:	e8 bf e3 ff ff       	call   0x40a5b0
  40c1f1:	8b 1d a8 93 41 00    	mov    ebx,DWORD PTR ds:0x4193a8
  40c1f7:	6a 05                	push   0x5
  40c1f9:	68 24 7c 45 00       	push   0x457c24
  40c1fe:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
  40c205:	c7 45 f0 01 00 00 00 	mov    DWORD PTR [ebp-0x10],0x1
  40c20c:	ff d3                	call   ebx
  40c20e:	83 c4 10             	add    esp,0x10
  40c211:	89 45 0c             	mov    DWORD PTR [ebp+0xc],eax
  40c214:	8b 47 04             	mov    eax,DWORD PTR [edi+0x4]
  40c217:	8b ce                	mov    ecx,esi
  40c219:	8b 35 4c 9b 41 00    	mov    esi,DWORD PTR ds:0x419b4c
  40c21f:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [ebp-0x4],0x1
  40c226:	8b 40 38             	mov    eax,DWORD PTR [eax+0x38]
  40c229:	99                   	cdq
  40c22a:	52                   	push   edx
  40c22b:	50                   	push   eax
  40c22c:	8d 45 0c             	lea    eax,[ebp+0xc]
  40c22f:	50                   	push   eax
  40c230:	ff d6                	call   esi
  40c232:	8d 4d 0c             	lea    ecx,[ebp+0xc]
  40c235:	c6 45 fc 00          	mov    BYTE PTR [ebp-0x4],0x0
  40c239:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40c23f:	6a 05                	push   0x5
  40c241:	68 e4 7a 45 00       	push   0x457ae4
  40c246:	ff d3                	call   ebx
  40c248:	83 c4 08             	add    esp,0x8
  40c24b:	89 45 0c             	mov    DWORD PTR [ebp+0xc],eax
  40c24e:	8b 47 04             	mov    eax,DWORD PTR [edi+0x4]
  40c251:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  40c254:	c7 45 fc 02 00 00 00 	mov    DWORD PTR [ebp-0x4],0x2
  40c25b:	8b 40 40             	mov    eax,DWORD PTR [eax+0x40]
  40c25e:	99                   	cdq
  40c25f:	52                   	push   edx
  40c260:	50                   	push   eax
  40c261:	8d 45 0c             	lea    eax,[ebp+0xc]
  40c264:	50                   	push   eax
  40c265:	ff d6                	call   esi
  40c267:	8d 4d 0c             	lea    ecx,[ebp+0xc]
  40c26a:	c6 45 fc 00          	mov    BYTE PTR [ebp-0x4],0x0
  40c26e:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40c274:	6a 06                	push   0x6
  40c276:	68 ec 7a 45 00       	push   0x457aec
  40c27b:	ff d3                	call   ebx
  40c27d:	83 c4 08             	add    esp,0x8
  40c280:	89 45 0c             	mov    DWORD PTR [ebp+0xc],eax
  40c283:	8b 47 04             	mov    eax,DWORD PTR [edi+0x4]
  40c286:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  40c289:	c7 45 fc 03 00 00 00 	mov    DWORD PTR [ebp-0x4],0x3
  40c290:	8b 40 44             	mov    eax,DWORD PTR [eax+0x44]
  40c293:	99                   	cdq
  40c294:	52                   	push   edx
  40c295:	50                   	push   eax
  40c296:	8d 45 0c             	lea    eax,[ebp+0xc]
  40c299:	50                   	push   eax
  40c29a:	ff d6                	call   esi
  40c29c:	8d 4d 0c             	lea    ecx,[ebp+0xc]
  40c29f:	c6 45 fc 00          	mov    BYTE PTR [ebp-0x4],0x0
  40c2a3:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40c2a9:	6a 06                	push   0x6
  40c2ab:	68 3c 7b 45 00       	push   0x457b3c
  40c2b0:	ff d3                	call   ebx
  40c2b2:	83 c4 08             	add    esp,0x8
  40c2b5:	89 45 0c             	mov    DWORD PTR [ebp+0xc],eax
  40c2b8:	8b 47 04             	mov    eax,DWORD PTR [edi+0x4]
  40c2bb:	c7 45 fc 04 00 00 00 	mov    DWORD PTR [ebp-0x4],0x4
  40c2c2:	8b 40 4c             	mov    eax,DWORD PTR [eax+0x4c]
  40c2c5:	99                   	cdq
  40c2c6:	52                   	push   edx
  40c2c7:	50                   	push   eax
  40c2c8:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  40c2cb:	8d 45 0c             	lea    eax,[ebp+0xc]
  40c2ce:	50                   	push   eax
  40c2cf:	ff d6                	call   esi
  40c2d1:	8d 4d 0c             	lea    ecx,[ebp+0xc]
  40c2d4:	c6 45 fc 00          	mov    BYTE PTR [ebp-0x4],0x0
  40c2d8:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40c2de:	6a 09                	push   0x9
  40c2e0:	68 2c 7c 45 00       	push   0x457c2c
  40c2e5:	ff d3                	call   ebx
  40c2e7:	83 c4 08             	add    esp,0x8
  40c2ea:	89 45 0c             	mov    DWORD PTR [ebp+0xc],eax
  40c2ed:	8b 47 04             	mov    eax,DWORD PTR [edi+0x4]
  40c2f0:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  40c2f3:	c7 45 fc 05 00 00 00 	mov    DWORD PTR [ebp-0x4],0x5
  40c2fa:	0f b6 40 58          	movzx  eax,BYTE PTR [eax+0x58]
  40c2fe:	99                   	cdq
  40c2ff:	52                   	push   edx
  40c300:	50                   	push   eax
  40c301:	8d 45 0c             	lea    eax,[ebp+0xc]
  40c304:	50                   	push   eax
  40c305:	ff d6                	call   esi
  40c307:	8d 4d 0c             	lea    ecx,[ebp+0xc]
  40c30a:	c6 45 fc 00          	mov    BYTE PTR [ebp-0x4],0x0
  40c30e:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40c314:	6a 0a                	push   0xa
  40c316:	68 fc 7a 45 00       	push   0x457afc
  40c31b:	ff d3                	call   ebx
  40c31d:	83 c4 08             	add    esp,0x8
  40c320:	89 45 0c             	mov    DWORD PTR [ebp+0xc],eax
  40c323:	8b 47 04             	mov    eax,DWORD PTR [edi+0x4]
  40c326:	8b 7d 08             	mov    edi,DWORD PTR [ebp+0x8]
  40c329:	8b cf                	mov    ecx,edi
  40c32b:	c7 45 fc 06 00 00 00 	mov    DWORD PTR [ebp-0x4],0x6
  40c332:	8b 40 3c             	mov    eax,DWORD PTR [eax+0x3c]
  40c335:	99                   	cdq
  40c336:	52                   	push   edx
  40c337:	50                   	push   eax
  40c338:	8d 45 0c             	lea    eax,[ebp+0xc]
  40c33b:	50                   	push   eax
  40c33c:	ff d6                	call   esi
  40c33e:	8d 4d 0c             	lea    ecx,[ebp+0xc]
  40c341:	c6 45 fc 00          	mov    BYTE PTR [ebp-0x4],0x0
  40c345:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40c34b:	6a 02                	push   0x2
  40c34d:	68 38 7c 45 00       	push   0x457c38
  40c352:	ff d3                	call   ebx
  40c354:	83 c4 08             	add    esp,0x8
  40c357:	89 45 0c             	mov    DWORD PTR [ebp+0xc],eax
  40c35a:	8d 45 0c             	lea    eax,[ebp+0xc]
  40c35d:	c7 45 fc 07 00 00 00 	mov    DWORD PTR [ebp-0x4],0x7
  40c364:	50                   	push   eax
  40c365:	8b cf                	mov    ecx,edi
  40c367:	ff 15 b4 9b 41 00    	call   DWORD PTR ds:0x419bb4
  40c36d:	8d 4d 0c             	lea    ecx,[ebp+0xc]
  40c370:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40c376:	8b c7                	mov    eax,edi
  40c378:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
  40c37b:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  40c382:	59                   	pop    ecx
  40c383:	5f                   	pop    edi
  40c384:	5e                   	pop    esi
  40c385:	5b                   	pop    ebx
  40c386:	8b e5                	mov    esp,ebp
  40c388:	5d                   	pop    ebp
  40c389:	c3                   	ret

===== ConceptModel link reader and range restore [VA 0x00406380..0x004065A5) =====

/mnt/data/work_stage117/original/IS.exe:     file format pei-i386


Disassembly of section .text:

00406380 <.text+0x5380>:
  406380:	55                   	push   ebp
  406381:	8b ec                	mov    ebp,esp
  406383:	6a ff                	push   0xffffffff
  406385:	68 ec 61 41 00       	push   0x4161ec
  40638a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  406390:	50                   	push   eax
  406391:	83 ec 18             	sub    esp,0x18
  406394:	53                   	push   ebx
  406395:	56                   	push   esi
  406396:	57                   	push   edi
  406397:	a1 cc 90 46 00       	mov    eax,ds:0x4690cc
  40639c:	33 c5                	xor    eax,ebp
  40639e:	50                   	push   eax
  40639f:	8d 45 f4             	lea    eax,[ebp-0xc]
  4063a2:	64 a3 00 00 00 00    	mov    fs:0x0,eax
  4063a8:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
  4063ab:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
  4063ae:	53                   	push   ebx
  4063af:	e8 7c f5 ff ff       	call   0x405930
  4063b4:	6a 02                	push   0x2
  4063b6:	68 10 7c 45 00       	push   0x457c10
  4063bb:	ff 15 a8 93 41 00    	call   DWORD PTR ds:0x4193a8
  4063c1:	83 c4 10             	add    esp,0x10
  4063c4:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
  4063c7:	8d 4d e8             	lea    ecx,[ebp-0x18]
  4063ca:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
  4063d1:	ff 15 d8 93 41 00    	call   DWORD PTR ds:0x4193d8
  4063d7:	50                   	push   eax
  4063d8:	8d 45 f0             	lea    eax,[ebp-0x10]
  4063db:	c6 45 fc 01          	mov    BYTE PTR [ebp-0x4],0x1
  4063df:	50                   	push   eax
  4063e0:	8d 45 ec             	lea    eax,[ebp-0x14]
  4063e3:	8b cb                	mov    ecx,ebx
  4063e5:	8b 1d 7c 9b 41 00    	mov    ebx,DWORD PTR ds:0x419b7c
  4063eb:	50                   	push   eax
  4063ec:	ff d3                	call   ebx
  4063ee:	8b 3d d0 92 41 00    	mov    edi,DWORD PTR ds:0x4192d0
  4063f4:	8b c8                	mov    ecx,eax
  4063f6:	6a 0a                	push   0xa
  4063f8:	6a 00                	push   0x0
  4063fa:	c6 45 fc 02          	mov    BYTE PTR [ebp-0x4],0x2
  4063fe:	ff d7                	call   edi
  406400:	8d 4d ec             	lea    ecx,[ebp-0x14]
  406403:	8b f0                	mov    esi,eax
  406405:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40640b:	8d 4d e8             	lea    ecx,[ebp-0x18]
  40640e:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  406414:	8d 4d f0             	lea    ecx,[ebp-0x10]
  406417:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
  40641e:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  406424:	6a 02                	push   0x2
  406426:	68 14 7c 45 00       	push   0x457c14
  40642b:	ff 15 a8 93 41 00    	call   DWORD PTR ds:0x4193a8
  406431:	83 c4 08             	add    esp,0x8
  406434:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
  406437:	8d 4d ec             	lea    ecx,[ebp-0x14]
  40643a:	c7 45 fc 03 00 00 00 	mov    DWORD PTR [ebp-0x4],0x3
  406441:	ff 15 d8 93 41 00    	call   DWORD PTR ds:0x4193d8
  406447:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  40644a:	50                   	push   eax
  40644b:	8d 45 f0             	lea    eax,[ebp-0x10]
  40644e:	c6 45 fc 04          	mov    BYTE PTR [ebp-0x4],0x4
  406452:	50                   	push   eax
  406453:	8d 45 e8             	lea    eax,[ebp-0x18]
  406456:	50                   	push   eax
  406457:	ff d3                	call   ebx
  406459:	6a 0a                	push   0xa
  40645b:	6a 00                	push   0x0
  40645d:	8b c8                	mov    ecx,eax
  40645f:	c6 45 fc 05          	mov    BYTE PTR [ebp-0x4],0x5
  406463:	ff d7                	call   edi
  406465:	8d 4d e8             	lea    ecx,[ebp-0x18]
  406468:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
  40646b:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  406471:	8d 4d ec             	lea    ecx,[ebp-0x14]
  406474:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40647a:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40647d:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
  406484:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40648a:	6a 02                	push   0x2
  40648c:	68 18 7c 45 00       	push   0x457c18
  406491:	ff 15 a8 93 41 00    	call   DWORD PTR ds:0x4193a8
  406497:	83 c4 08             	add    esp,0x8
  40649a:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
  40649d:	8d 4d ec             	lea    ecx,[ebp-0x14]
  4064a0:	c7 45 fc 06 00 00 00 	mov    DWORD PTR [ebp-0x4],0x6
  4064a7:	ff 15 d8 93 41 00    	call   DWORD PTR ds:0x4193d8
  4064ad:	c6 45 fc 07          	mov    BYTE PTR [ebp-0x4],0x7
  4064b1:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  4064b4:	50                   	push   eax
  4064b5:	8d 45 f0             	lea    eax,[ebp-0x10]
  4064b8:	50                   	push   eax
  4064b9:	8d 45 e8             	lea    eax,[ebp-0x18]
  4064bc:	50                   	push   eax
  4064bd:	ff d3                	call   ebx
  4064bf:	6a 0a                	push   0xa
  4064c1:	6a 00                	push   0x0
  4064c3:	8b c8                	mov    ecx,eax
  4064c5:	c6 45 fc 08          	mov    BYTE PTR [ebp-0x4],0x8
  4064c9:	ff d7                	call   edi
  4064cb:	8d 4d e8             	lea    ecx,[ebp-0x18]
  4064ce:	8b d8                	mov    ebx,eax
  4064d0:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  4064d6:	8d 4d ec             	lea    ecx,[ebp-0x14]
  4064d9:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  4064df:	8d 4d f0             	lea    ecx,[ebp-0x10]
  4064e2:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
  4064e9:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  4064ef:	8b 7d 10             	mov    edi,DWORD PTR [ebp+0x10]
  4064f2:	8b cf                	mov    ecx,edi
  4064f4:	56                   	push   esi
  4064f5:	8b 35 70 90 41 00    	mov    esi,DWORD PTR ds:0x419070
  4064fb:	ff d6                	call   esi
  4064fd:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
  406500:	50                   	push   eax
  406501:	ff 15 a4 90 41 00    	call   DWORD PTR ds:0x4190a4
  406507:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
  40650a:	8b cf                	mov    ecx,edi
  40650c:	ff d6                	call   esi
  40650e:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
  406511:	50                   	push   eax
  406512:	ff 15 a8 90 41 00    	call   DWORD PTR ds:0x4190a8
  406518:	53                   	push   ebx
  406519:	8b cf                	mov    ecx,edi
  40651b:	ff d6                	call   esi
  40651d:	8b 5d 0c             	mov    ebx,DWORD PTR [ebp+0xc]
  406520:	8b cb                	mov    ecx,ebx
  406522:	50                   	push   eax
  406523:	ff 15 ac 90 41 00    	call   DWORD PTR ds:0x4190ac
  406529:	6a 05                	push   0x5
  40652b:	68 08 7c 45 00       	push   0x457c08
  406530:	ff 15 a8 93 41 00    	call   DWORD PTR ds:0x4193a8
  406536:	83 c4 08             	add    esp,0x8
  406539:	89 45 0c             	mov    DWORD PTR [ebp+0xc],eax
  40653c:	8d 4d dc             	lea    ecx,[ebp-0x24]
  40653f:	c7 45 fc 09 00 00 00 	mov    DWORD PTR [ebp-0x4],0x9
  406546:	ff 15 d8 93 41 00    	call   DWORD PTR ds:0x4193d8
  40654c:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  40654f:	50                   	push   eax
  406550:	8d 45 0c             	lea    eax,[ebp+0xc]
  406553:	c6 45 fc 0a          	mov    BYTE PTR [ebp-0x4],0xa
  406557:	50                   	push   eax
  406558:	8d 45 e0             	lea    eax,[ebp-0x20]
  40655b:	50                   	push   eax
  40655c:	ff 15 7c 9b 41 00    	call   DWORD PTR ds:0x419b7c
  406562:	8b 73 04             	mov    esi,DWORD PTR [ebx+0x4]
  406565:	8b c8                	mov    ecx,eax
  406567:	6a 0a                	push   0xa
  406569:	6a 00                	push   0x0
  40656b:	c6 45 fc 0b          	mov    BYTE PTR [ebp-0x4],0xb
  40656f:	ff 15 d0 92 41 00    	call   DWORD PTR ds:0x4192d0
  406575:	8d 4d e0             	lea    ecx,[ebp-0x20]
  406578:	89 46 2c             	mov    DWORD PTR [esi+0x2c],eax
  40657b:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  406581:	8d 4d dc             	lea    ecx,[ebp-0x24]
  406584:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40658a:	8d 4d 0c             	lea    ecx,[ebp+0xc]
  40658d:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  406593:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
  406596:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  40659d:	59                   	pop    ecx
  40659e:	5f                   	pop    edi
  40659f:	5e                   	pop    esi
  4065a0:	5b                   	pop    ebx
  4065a1:	8b e5                	mov    esp,ebp
  4065a3:	5d                   	pop    ebp
  4065a4:	c3                   	ret

===== ConceptModel links reader loop [VA 0x00406954..0x00406A5F) =====

/mnt/data/work_stage117/original/IS.exe:     file format pei-i386


Disassembly of section .text:

00406954 <.text+0x5954>:
  406954:	a1 a8 93 41 00       	mov    eax,ds:0x4193a8
  406959:	6a 05                	push   0x5
  40695b:	68 6c 7b 45 00       	push   0x457b6c
  406960:	ff d0                	call   eax
  406962:	83 c4 08             	add    esp,0x8
  406965:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
  406968:	8d 45 d0             	lea    eax,[ebp-0x30]
  40696b:	c6 45 fc 0c          	mov    BYTE PTR [ebp-0x4],0xc
  40696f:	50                   	push   eax
  406970:	8d 45 c4             	lea    eax,[ebp-0x3c]
  406973:	50                   	push   eax
  406974:	8d 4d e0             	lea    ecx,[ebp-0x20]
  406977:	ff 15 8c 9b 41 00    	call   DWORD PTR ds:0x419b8c
  40697d:	8d 4d c0             	lea    ecx,[ebp-0x40]
  406980:	c6 45 fc 0d          	mov    BYTE PTR [ebp-0x4],0xd
  406984:	51                   	push   ecx
  406985:	8b c8                	mov    ecx,eax
  406987:	ff 15 5c 9b 41 00    	call   DWORD PTR ds:0x419b5c
  40698d:	50                   	push   eax
  40698e:	8d 4d f0             	lea    ecx,[ebp-0x10]
  406991:	c6 45 fc 0e          	mov    BYTE PTR [ebp-0x4],0xe
  406995:	ff 15 90 9b 41 00    	call   DWORD PTR ds:0x419b90
  40699b:	8d 4d c0             	lea    ecx,[ebp-0x40]
  40699e:	ff 15 68 9b 41 00    	call   DWORD PTR ds:0x419b68
  4069a4:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  4069a7:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  4069ad:	8d 4d d0             	lea    ecx,[ebp-0x30]
  4069b0:	c6 45 fc 07          	mov    BYTE PTR [ebp-0x4],0x7
  4069b4:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  4069ba:	8b 1d 70 9b 41 00    	mov    ebx,DWORD PTR ds:0x419b70
  4069c0:	8d 4d f0             	lea    ecx,[ebp-0x10]
  4069c3:	33 ff                	xor    edi,edi
  4069c5:	ff d3                	call   ebx
  4069c7:	85 c0                	test   eax,eax
  4069c9:	0f 8e 90 00 00 00    	jle    0x406a5f
  4069cf:	90                   	nop
  4069d0:	57                   	push   edi
  4069d1:	8d 45 c0             	lea    eax,[ebp-0x40]
  4069d4:	50                   	push   eax
  4069d5:	8d 4d f0             	lea    ecx,[ebp-0x10]
  4069d8:	ff 15 6c 9b 41 00    	call   DWORD PTR ds:0x419b6c
  4069de:	8d 4d d0             	lea    ecx,[ebp-0x30]
  4069e1:	c6 45 fc 0f          	mov    BYTE PTR [ebp-0x4],0xf
  4069e5:	51                   	push   ecx
  4069e6:	8b c8                	mov    ecx,eax
  4069e8:	ff d6                	call   esi
  4069ea:	8d 4d c0             	lea    ecx,[ebp-0x40]
  4069ed:	c6 45 fc 11          	mov    BYTE PTR [ebp-0x4],0x11
  4069f1:	ff 15 50 9b 41 00    	call   DWORD PTR ds:0x419b50
  4069f7:	6a 30                	push   0x30
  4069f9:	e8 8b dd 00 00       	call   0x414789
  4069fe:	8b f0                	mov    esi,eax
  406a00:	83 c4 04             	add    esp,0x4
  406a03:	89 75 b8             	mov    DWORD PTR [ebp-0x48],esi
  406a06:	c6 45 fc 12          	mov    BYTE PTR [ebp-0x4],0x12
  406a0a:	85 f6                	test   esi,esi
  406a0c:	74 10                	je     0x406a1e
  406a0e:	8b ce                	mov    ecx,esi
  406a10:	ff 15 8c 91 41 00    	call   DWORD PTR ds:0x41918c
  406a16:	c7 06 c4 79 45 00    	mov    DWORD PTR [esi],0x4579c4
  406a1c:	eb 02                	jmp    0x406a20
  406a1e:	33 f6                	xor    esi,esi
  406a20:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
  406a23:	8d 45 d0             	lea    eax,[ebp-0x30]
  406a26:	c6 45 fc 11          	mov    BYTE PTR [ebp-0x4],0x11
  406a2a:	56                   	push   esi
  406a2b:	50                   	push   eax
  406a2c:	e8 4f f9 ff ff       	call   0x406380
  406a31:	8b 4d e8             	mov    ecx,DWORD PTR [ebp-0x18]
  406a34:	83 c4 0c             	add    esp,0xc
  406a37:	56                   	push   esi
  406a38:	ff 15 14 91 41 00    	call   DWORD PTR ds:0x419114
  406a3e:	8d 4d d0             	lea    ecx,[ebp-0x30]
  406a41:	c6 45 fc 07          	mov    BYTE PTR [ebp-0x4],0x7
  406a45:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  406a4b:	8d 4d f0             	lea    ecx,[ebp-0x10]
  406a4e:	47                   	inc    edi
  406a4f:	ff d3                	call   ebx
  406a51:	8b 35 64 9b 41 00    	mov    esi,DWORD PTR ds:0x419b64
  406a57:	3b f8                	cmp    edi,eax
  406a59:	0f 8c 71 ff ff ff    	jl     0x4069d0
