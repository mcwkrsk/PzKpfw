
/mnt/data/is2_re_analysis_kit_stage1_17_continuation_2026-11-01/original/is.exe:     file format pei-i386


disassembly of section .text:

0040c600 <.text+0xb600>:
  40c600:	55                   	push   ebp
  40c601:	8b ec                	mov    ebp,esp
  40c603:	6a ff                	push   0xffffffff
  40c605:	68 f5 75 41 00       	push   0x4175f5
  40c60a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  40c610:	50                   	push   eax
  40c611:	83 ec 34             	sub    esp,0x34
  40c614:	53                   	push   ebx
  40c615:	56                   	push   esi
  40c616:	57                   	push   edi
  40c617:	a1 cc 90 46 00       	mov    eax,ds:0x4690cc
  40c61c:	33 c5                	xor    eax,ebp
  40c61e:	50                   	push   eax
  40c61f:	8d 45 f4             	lea    eax,[ebp-0xc]
  40c622:	64 a3 00 00 00 00    	mov    fs:0x0,eax
  40c628:	8b f9                	mov    edi,ecx
  40c62a:	89 7d d0             	mov    dword ptr [ebp-0x30],edi
  40c62d:	ff 75 08             	push   dword ptr [ebp+0x8]
  40c630:	e8 8b 76 00 00       	call   0x413cc0
  40c635:	8d 8f 9c 00 00 00    	lea    ecx,[edi+0x9c]
  40c63b:	c7 45 fc 00 00 00 00 	mov    dword ptr [ebp-0x4],0x0
  40c642:	c7 07 20 92 45 00    	mov    dword ptr [edi],0x459220
  40c648:	c7 47 08 f8 92 45 00 	mov    dword ptr [edi+0x8],0x4592f8
  40c64f:	ff 15 d8 93 41 00    	call   dword ptr ds:0x4193d8
  40c655:	8d 8f a0 00 00 00    	lea    ecx,[edi+0xa0]
  40c65b:	ff 15 d8 93 41 00    	call   dword ptr ds:0x4193d8
  40c661:	8d 8f ac 00 00 00    	lea    ecx,[edi+0xac]
  40c667:	c6 45 fc 02          	mov    byte ptr [ebp-0x4],0x2
  40c66b:	c6 87 a8 00 00 00 00 	mov    byte ptr [edi+0xa8],0x0
  40c672:	ff 15 94 9b 41 00    	call   dword ptr ds:0x419b94
  40c678:	a1 10 93 41 00       	mov    eax,ds:0x419310
  40c67d:	89 87 b0 00 00 00    	mov    dword ptr [edi+0xb0],eax
  40c683:	57                   	push   edi
  40c684:	8d 4f 28             	lea    ecx,[edi+0x28]
  40c687:	c6 45 fc 04          	mov    byte ptr [ebp-0x4],0x4
  40c68b:	c6 87 b4 00 00 00 01 	mov    byte ptr [edi+0xb4],0x1
  40c692:	e8 89 10 00 00       	call   0x40d720
  40c697:	6a ff                	push   0xffffffff
  40c699:	8d 45 e4             	lea    eax,[ebp-0x1c]
  40c69c:	68 14 93 45 00       	push   0x459314
  40c6a1:	50                   	push   eax
  40c6a2:	ff 15 d4 92 41 00    	call   dword ptr ds:0x4192d4
  40c6a8:	83 c4 0c             	add    esp,0xc
  40c6ab:	8d 4f 1c             	lea    ecx,[edi+0x1c]
  40c6ae:	50                   	push   eax
  40c6af:	ff 15 c8 93 41 00    	call   dword ptr ds:0x4193c8
  40c6b5:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  40c6b8:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  40c6be:	68 4c 6f 45 00       	push   0x456f4c
  40c6c3:	8d 8f 9c 00 00 00    	lea    ecx,[edi+0x9c]
  40c6c9:	c6 87 98 00 00 00 00 	mov    byte ptr [edi+0x98],0x0
  40c6d0:	ff 15 b4 93 41 00    	call   dword ptr ds:0x4193b4
  40c6d6:	8d 45 d8             	lea    eax,[ebp-0x28]
  40c6d9:	50                   	push   eax
  40c6da:	ff 15 30 93 41 00    	call   dword ptr ds:0x419330
  40c6e0:	8b f0                	mov    esi,eax
  40c6e2:	8d 45 f2             	lea    eax,[ebp-0xe]
  40c6e5:	c6 45 fc 05          	mov    byte ptr [ebp-0x4],0x5
  40c6e9:	50                   	push   eax
  40c6ea:	ff 15 34 93 41 00    	call   dword ptr ds:0x419334
  40c6f0:	0f b7 08             	movzx  ecx,word ptr [eax]
  40c6f3:	8d 45 dc             	lea    eax,[ebp-0x24]
  40c6f6:	51                   	push   ecx
  40c6f7:	56                   	push   esi
  40c6f8:	50                   	push   eax
  40c6f9:	e8 82 4e ff ff       	call   0x401580
  40c6fe:	68 50 70 45 00       	push   0x457050
  40c703:	50                   	push   eax
  40c704:	8d 45 e0             	lea    eax,[ebp-0x20]
  40c707:	c6 45 fc 06          	mov    byte ptr [ebp-0x4],0x6
  40c70b:	50                   	push   eax
  40c70c:	e8 df 4d ff ff       	call   0x4014f0
  40c711:	83 c4 20             	add    esp,0x20
  40c714:	50                   	push   eax
  40c715:	8d 4d e8             	lea    ecx,[ebp-0x18]
  40c718:	c6 45 fc 07          	mov    byte ptr [ebp-0x4],0x7
  40c71c:	ff 15 44 93 41 00    	call   dword ptr ds:0x419344
  40c722:	8d 4d e0             	lea    ecx,[ebp-0x20]
  40c725:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  40c72b:	8d 4d dc             	lea    ecx,[ebp-0x24]
  40c72e:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  40c734:	8d 4d d8             	lea    ecx,[ebp-0x28]
  40c737:	c6 45 fc 0b          	mov    byte ptr [ebp-0x4],0xb
  40c73b:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  40c741:	8d 4d e8             	lea    ecx,[ebp-0x18]
  40c744:	ff 15 3c 93 41 00    	call   dword ptr ds:0x41933c
  40c74a:	84 c0                	test   al,al
  40c74c:	0f 84 bd 00 00 00    	je     0x40c80f
  40c752:	8d 45 e4             	lea    eax,[ebp-0x1c]
  40c755:	50                   	push   eax
  40c756:	8d 4d e8             	lea    ecx,[ebp-0x18]
  40c759:	ff 15 68 92 41 00    	call   dword ptr ds:0x419268
  40c75f:	50                   	push   eax
  40c760:	8d 4d c0             	lea    ecx,[ebp-0x40]
  40c763:	c6 45 fc 0c          	mov    byte ptr [ebp-0x4],0xc
  40c767:	ff 15 50 93 41 00    	call   dword ptr ds:0x419350
  40c76d:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  40c770:	c6 45 fc 0e          	mov    byte ptr [ebp-0x4],0xe
  40c774:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  40c77a:	51                   	push   ecx
  40c77b:	8b c4                	mov    eax,esp
  40c77d:	8d 4d c0             	lea    ecx,[ebp-0x40]
  40c780:	c7 00 01 00 00 00    	mov    dword ptr [eax],0x1
  40c786:	ff 15 48 93 41 00    	call   dword ptr ds:0x419348
  40c78c:	8d 45 c0             	lea    eax,[ebp-0x40]
  40c78f:	50                   	push   eax
  40c790:	8d 4d c8             	lea    ecx,[ebp-0x38]
  40c793:	ff 15 64 93 41 00    	call   dword ptr ds:0x419364
  40c799:	68 34 70 45 00       	push   0x457034
  40c79e:	8d 4d c8             	lea    ecx,[ebp-0x38]
  40c7a1:	c6 45 fc 0f          	mov    byte ptr [ebp-0x4],0xf
  40c7a5:	ff 15 5c 93 41 00    	call   dword ptr ds:0x41935c
  40c7ab:	8d 4d ec             	lea    ecx,[ebp-0x14]
  40c7ae:	ff 15 d8 93 41 00    	call   dword ptr ds:0x4193d8
  40c7b4:	8d 45 e4             	lea    eax,[ebp-0x1c]
  40c7b7:	c6 45 fc 10          	mov    byte ptr [ebp-0x4],0x10
  40c7bb:	50                   	push   eax
  40c7bc:	8d 4d c8             	lea    ecx,[ebp-0x38]
  40c7bf:	ff 15 a8 92 41 00    	call   dword ptr ds:0x4192a8
  40c7c5:	50                   	push   eax
  40c7c6:	8d 4d ec             	lea    ecx,[ebp-0x14]
  40c7c9:	ff 15 c8 93 41 00    	call   dword ptr ds:0x4193c8
  40c7cf:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  40c7d2:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  40c7d8:	6a 00                	push   0x0
  40c7da:	6a 00                	push   0x0
  40c7dc:	6a 00                	push   0x0
  40c7de:	8d 45 ec             	lea    eax,[ebp-0x14]
  40c7e1:	50                   	push   eax
  40c7e2:	8d 8f ac 00 00 00    	lea    ecx,[edi+0xac]
  40c7e8:	ff 15 9c 9b 41 00    	call   dword ptr ds:0x419b9c
  40c7ee:	8d 4d ec             	lea    ecx,[ebp-0x14]
  40c7f1:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  40c7f7:	8d 4d c8             	lea    ecx,[ebp-0x38]
  40c7fa:	ff 15 60 93 41 00    	call   dword ptr ds:0x419360
  40c800:	8d 4d c0             	lea    ecx,[ebp-0x40]
  40c803:	c6 45 fc 0b          	mov    byte ptr [ebp-0x4],0xb
  40c807:	ff 15 4c 93 41 00    	call   dword ptr ds:0x41934c
  40c80d:	eb 62                	jmp    0x40c871
  40c80f:	6a 09                	push   0x9
  40c811:	68 18 93 45 00       	push   0x459318
  40c816:	ff 15 a8 93 41 00    	call   dword ptr ds:0x4193a8
  40c81c:	83 c4 08             	add    esp,0x8
  40c81f:	89 45 ec             	mov    dword ptr [ebp-0x14],eax
  40c822:	8d 45 ec             	lea    eax,[ebp-0x14]
  40c825:	c6 45 fc 11          	mov    byte ptr [ebp-0x4],0x11
  40c829:	50                   	push   eax
  40c82a:	8d 45 e4             	lea    eax,[ebp-0x1c]
  40c82d:	50                   	push   eax
  40c82e:	8d 8f ac 00 00 00    	lea    ecx,[edi+0xac]
  40c834:	ff 15 74 9b 41 00    	call   dword ptr ds:0x419b74
  40c83a:	8d 4d ec             	lea    ecx,[ebp-0x14]
  40c83d:	c6 45 fc 13          	mov    byte ptr [ebp-0x4],0x13
  40c841:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  40c847:	8d 45 e4             	lea    eax,[ebp-0x1c]
  40c84a:	50                   	push   eax
  40c84b:	8d 45 d4             	lea    eax,[ebp-0x2c]
  40c84e:	50                   	push   eax
  40c84f:	8d 8f ac 00 00 00    	lea    ecx,[edi+0xac]
  40c855:	ff 15 58 9b 41 00    	call   dword ptr ds:0x419b58
  40c85b:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  40c85e:	ff 15 50 9b 41 00    	call   dword ptr ds:0x419b50
  40c864:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  40c867:	c6 45 fc 0b          	mov    byte ptr [ebp-0x4],0xb
  40c86b:	ff 15 84 9b 41 00    	call   dword ptr ds:0x419b84
  40c871:	8b cf                	mov    ecx,edi
  40c873:	e8 d8 62 ff ff       	call   0x402b50
  40c878:	6a 08                	push   0x8
  40c87a:	e8 0a 7f 00 00       	call   0x414789
  40c87f:	8b f0                	mov    esi,eax
  40c881:	83 c4 04             	add    esp,0x4
  40c884:	89 75 d4             	mov    dword ptr [ebp-0x2c],esi
  40c887:	c6 45 fc 14          	mov    byte ptr [ebp-0x4],0x14
  40c88b:	85 f6                	test   esi,esi
  40c88d:	74 11                	je     0x40c8a0
  40c88f:	57                   	push   edi
  40c890:	8b ce                	mov    ecx,esi
  40c892:	ff 15 e0 9a 41 00    	call   dword ptr ds:0x419ae0
  40c898:	c7 06 5c 7d 45 00    	mov    dword ptr [esi],0x457d5c
  40c89e:	eb 02                	jmp    0x40c8a2
  40c8a0:	33 f6                	xor    esi,esi
  40c8a2:	6a 00                	push   0x0
  40c8a4:	6a 00                	push   0x0
  40c8a6:	6a 00                	push   0x0
