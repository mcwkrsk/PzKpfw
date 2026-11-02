
../original/is.exe:     file format pei-i386


disassembly of section .text:

004066d0 <.text+0x56d0>:
  4066d0:	55                   	push   ebp
  4066d1:	8b ec                	mov    ebp,esp
  4066d3:	6a ff                	push   0xffffffff
  4066d5:	68 cc 63 41 00       	push   0x4163cc
  4066da:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  4066e0:	50                   	push   eax
  4066e1:	83 ec 3c             	sub    esp,0x3c
  4066e4:	53                   	push   ebx
  4066e5:	56                   	push   esi
  4066e6:	57                   	push   edi
  4066e7:	a1 cc 90 46 00       	mov    eax,ds:0x4690cc
  4066ec:	33 c5                	xor    eax,ebp
  4066ee:	50                   	push   eax
  4066ef:	8d 45 f4             	lea    eax,[ebp-0xc]
  4066f2:	64 a3 00 00 00 00    	mov    fs:0x0,eax
  4066f8:	e8 a3 d0 ff ff       	call   0x4037a0
  4066fd:	8b f0                	mov    esi,eax
  4066ff:	8b ce                	mov    ecx,esi
  406701:	ff 15 78 91 41 00    	call   dword ptr ds:0x419178
  406707:	8b f8                	mov    edi,eax
  406709:	8b ce                	mov    ecx,esi
  40670b:	6a 00                	push   0x0
  40670d:	89 7d e8             	mov    dword ptr [ebp-0x18],edi
  406710:	ff 15 f4 90 41 00    	call   dword ptr ds:0x4190f4
  406716:	6a 00                	push   0x0
  406718:	8b ce                	mov    ecx,esi
  40671a:	89 45 ec             	mov    dword ptr [ebp-0x14],eax
  40671d:	ff 15 f8 90 41 00    	call   dword ptr ds:0x4190f8
  406723:	8b 1d a8 93 41 00    	mov    ebx,dword ptr ds:0x4193a8
  406729:	6a 02                	push   0x2
  40672b:	68 ac 7b 45 00       	push   0x457bac
  406730:	89 45 bc             	mov    dword ptr [ebp-0x44],eax
  406733:	ff d3                	call   ebx
  406735:	83 c4 08             	add    esp,0x8
  406738:	89 45 dc             	mov    dword ptr [ebp-0x24],eax
  40673b:	8b 4d 0c             	mov    ecx,dword ptr [ebp+0xc]
  40673e:	8d 45 dc             	lea    eax,[ebp-0x24]
  406741:	8b 35 8c 9b 41 00    	mov    esi,dword ptr ds:0x419b8c
  406747:	50                   	push   eax
  406748:	8d 45 e0             	lea    eax,[ebp-0x20]
  40674b:	c7 45 fc 00 00 00 00 	mov    dword ptr [ebp-0x4],0x0
  406752:	50                   	push   eax
  406753:	ff d6                	call   esi
  406755:	8d 4d dc             	lea    ecx,[ebp-0x24]
  406758:	c6 45 fc 02          	mov    byte ptr [ebp-0x4],0x2
  40675c:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  406762:	8d 45 e0             	lea    eax,[ebp-0x20]
  406765:	57                   	push   edi
  406766:	50                   	push   eax
  406767:	e8 44 fe ff ff       	call   0x4065b0
  40676c:	6a 07                	push   0x7
  40676e:	68 a0 7b 45 00       	push   0x457ba0
  406773:	ff d3                	call   ebx
  406775:	83 c4 10             	add    esp,0x10
  406778:	89 45 d8             	mov    dword ptr [ebp-0x28],eax
  40677b:	8d 45 d8             	lea    eax,[ebp-0x28]
  40677e:	c6 45 fc 03          	mov    byte ptr [ebp-0x4],0x3
  406782:	50                   	push   eax
  406783:	8d 45 c8             	lea    eax,[ebp-0x38]
  406786:	50                   	push   eax
  406787:	8d 4d e0             	lea    ecx,[ebp-0x20]
  40678a:	ff d6                	call   esi
  40678c:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40678f:	c6 45 fc 04          	mov    byte ptr [ebp-0x4],0x4
  406793:	51                   	push   ecx
  406794:	8b c8                	mov    ecx,eax
  406796:	ff 15 5c 9b 41 00    	call   dword ptr ds:0x419b5c
  40679c:	8d 4d c8             	lea    ecx,[ebp-0x38]
  40679f:	ff 15 84 9b 41 00    	call   dword ptr ds:0x419b84
  4067a5:	8d 4d d8             	lea    ecx,[ebp-0x28]
  4067a8:	c6 45 fc 07          	mov    byte ptr [ebp-0x4],0x7
  4067ac:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  4067b2:	33 db                	xor    ebx,ebx
  4067b4:	8d 4d f0             	lea    ecx,[ebp-0x10]
  4067b7:	89 5d d0             	mov    dword ptr [ebp-0x30],ebx
  4067ba:	ff 15 70 9b 41 00    	call   dword ptr ds:0x419b70
  4067c0:	8b 35 64 9b 41 00    	mov    esi,dword ptr ds:0x419b64
  4067c6:	85 c0                	test   eax,eax
  4067c8:	0f 8e 86 01 00 00    	jle    0x406954
  4067ce:	66 90                	xchg   ax,ax
  4067d0:	53                   	push   ebx
  4067d1:	8d 45 c4             	lea    eax,[ebp-0x3c]
  4067d4:	50                   	push   eax
  4067d5:	8d 4d f0             	lea    ecx,[ebp-0x10]
  4067d8:	ff 15 6c 9b 41 00    	call   dword ptr ds:0x419b6c
  4067de:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  4067e1:	c6 45 fc 08          	mov    byte ptr [ebp-0x4],0x8
  4067e5:	51                   	push   ecx
  4067e6:	8b c8                	mov    ecx,eax
  4067e8:	ff d6                	call   esi
  4067ea:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  4067ed:	c6 45 fc 0a          	mov    byte ptr [ebp-0x4],0xa
  4067f1:	ff 15 50 9b 41 00    	call   dword ptr ds:0x419b50
  4067f7:	6a 08                	push   0x8
  4067f9:	e8 8b df 00 00       	call   0x414789
  4067fe:	8b d8                	mov    ebx,eax
  406800:	83 c4 04             	add    esp,0x4
  406803:	89 5d b8             	mov    dword ptr [ebp-0x48],ebx
  406806:	c6 45 fc 0b          	mov    byte ptr [ebp-0x4],0xb
  40680a:	85 db                	test   ebx,ebx
  40680c:	74 10                	je     0x40681e
  40680e:	8b cb                	mov    ecx,ebx
  406810:	ff 15 84 91 41 00    	call   dword ptr ds:0x419184
  406816:	c7 03 a4 79 45 00    	mov    dword ptr [ebx],0x4579a4
  40681c:	eb 02                	jmp    0x406820
  40681e:	33 db                	xor    ebx,ebx
  406820:	8d 45 d4             	lea    eax,[ebp-0x2c]
  406823:	c6 45 fc 0a          	mov    byte ptr [ebp-0x4],0xa
  406827:	53                   	push   ebx
  406828:	50                   	push   eax
  406829:	e8 32 2c 00 00       	call   0x409460
  40682e:	8b 7f 04             	mov    edi,dword ptr [edi+0x4]
  406831:	8d 4d dc             	lea    ecx,[ebp-0x24]
  406834:	83 c4 08             	add    esp,0x8
  406837:	89 5d dc             	mov    dword ptr [ebp-0x24],ebx
  40683a:	8b 47 18             	mov    eax,dword ptr [edi+0x18]
  40683d:	3b c8                	cmp    ecx,eax
  40683f:	73 78                	jae    0x4068b9
  406841:	8b 77 14             	mov    esi,dword ptr [edi+0x14]
  406844:	3b f1                	cmp    esi,ecx
  406846:	77 71                	ja     0x4068b9
  406848:	8b 5f 1c             	mov    ebx,dword ptr [edi+0x1c]
  40684b:	8b d1                	mov    edx,ecx
  40684d:	2b d6                	sub    edx,esi
  40684f:	c1 fa 02             	sar    edx,0x2
  406852:	89 55 c0             	mov    dword ptr [ebp-0x40],edx
  406855:	3b c3                	cmp    eax,ebx
  406857:	75 4f                	jne    0x4068a8
  406859:	8b cb                	mov    ecx,ebx
  40685b:	2b c8                	sub    ecx,eax
  40685d:	c1 f9 02             	sar    ecx,0x2
  406860:	83 f9 01             	cmp    ecx,0x1
  406863:	73 43                	jae    0x4068a8
  406865:	2b c6                	sub    eax,esi
  406867:	b9 ff ff ff 3f       	mov    ecx,0x3fffffff
  40686c:	c1 f8 02             	sar    eax,0x2
  40686f:	2b c8                	sub    ecx,eax
  406871:	83 f9 01             	cmp    ecx,0x1
  406874:	0f 82 cf 00 00 00    	jb     0x406949
  40687a:	2b 5f 14             	sub    ebx,dword ptr [edi+0x14]
  40687d:	8d 70 01             	lea    esi,[eax+0x1]
  406880:	c1 fb 02             	sar    ebx,0x2
  406883:	b9 ff ff ff 3f       	mov    ecx,0x3fffffff
  406888:	8b c3                	mov    eax,ebx
  40688a:	33 d2                	xor    edx,edx
  40688c:	d1 e8                	shr    eax,1
  40688e:	2b c8                	sub    ecx,eax
  406890:	03 c3                	add    eax,ebx
  406892:	3b cb                	cmp    ecx,ebx
  406894:	8d 4f 14             	lea    ecx,[edi+0x14]
  406897:	0f 43 d0             	cmovae edx,eax
  40689a:	3b d6                	cmp    edx,esi
  40689c:	0f 43 f2             	cmovae esi,edx
  40689f:	56                   	push   esi
  4068a0:	e8 bb df ff ff       	call   0x404860
  4068a5:	8b 55 c0             	mov    edx,dword ptr [ebp-0x40]
  4068a8:	8b 4f 18             	mov    ecx,dword ptr [edi+0x18]
  4068ab:	8b 47 14             	mov    eax,dword ptr [edi+0x14]
  4068ae:	85 c9                	test   ecx,ecx
  4068b0:	74 64                	je     0x406916
  4068b2:	8b 04 90             	mov    eax,dword ptr [eax+edx*4]
  4068b5:	89 01                	mov    dword ptr [ecx],eax
  4068b7:	eb 5d                	jmp    0x406916
  4068b9:	8b 57 1c             	mov    edx,dword ptr [edi+0x1c]
  4068bc:	3b c2                	cmp    eax,edx
  4068be:	75 4d                	jne    0x40690d
  4068c0:	8b ca                	mov    ecx,edx
  4068c2:	2b c8                	sub    ecx,eax
  4068c4:	c1 f9 02             	sar    ecx,0x2
  4068c7:	83 f9 01             	cmp    ecx,0x1
  4068ca:	73 41                	jae    0x40690d
  4068cc:	2b 47 14             	sub    eax,dword ptr [edi+0x14]
  4068cf:	b9 ff ff ff 3f       	mov    ecx,0x3fffffff
  4068d4:	c1 f8 02             	sar    eax,0x2
  4068d7:	2b c8                	sub    ecx,eax
  4068d9:	83 f9 01             	cmp    ecx,0x1
  4068dc:	72 6b                	jb     0x406949
  4068de:	2b 57 14             	sub    edx,dword ptr [edi+0x14]
  4068e1:	8d 70 01             	lea    esi,[eax+0x1]
  4068e4:	c1 fa 02             	sar    edx,0x2
  4068e7:	b9 ff ff ff 3f       	mov    ecx,0x3fffffff
  4068ec:	8b c2                	mov    eax,edx
  4068ee:	89 55 c0             	mov    dword ptr [ebp-0x40],edx
  4068f1:	d1 e8                	shr    eax,1
  4068f3:	2b c8                	sub    ecx,eax
  4068f5:	03 c2                	add    eax,edx
  4068f7:	33 d2                	xor    edx,edx
  4068f9:	3b 4d c0             	cmp    ecx,dword ptr [ebp-0x40]
  4068fc:	8d 4f 14             	lea    ecx,[edi+0x14]
  4068ff:	0f 43 d0             	cmovae edx,eax
  406902:	3b d6                	cmp    edx,esi
  406904:	0f 43 f2             	cmovae esi,edx
  406907:	56                   	push   esi
  406908:	e8 53 df ff ff       	call   0x404860
  40690d:	8b 47 18             	mov    eax,dword ptr [edi+0x18]
  406910:	85 c0                	test   eax,eax
  406912:	74 02                	je     0x406916
  406914:	89 18                	mov    dword ptr [eax],ebx
  406916:	83 47 18 04          	add    dword ptr [edi+0x18],0x4
  40691a:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  40691d:	c6 45 fc 07          	mov    byte ptr [ebp-0x4],0x7
  406921:	ff 15 84 9b 41 00    	call   dword ptr ds:0x419b84
  406927:	8b 5d d0             	mov    ebx,dword ptr [ebp-0x30]
  40692a:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40692d:	43                   	inc    ebx
  40692e:	89 5d d0             	mov    dword ptr [ebp-0x30],ebx
  406931:	ff 15 70 9b 41 00    	call   dword ptr ds:0x419b70
  406937:	8b 35 64 9b 41 00    	mov    esi,dword ptr ds:0x419b64
  40693d:	3b d8                	cmp    ebx,eax
  40693f:	7d 13                	jge    0x406954
  406941:	8b 7d e8             	mov    edi,dword ptr [ebp-0x18]
  406944:	e9 87 fe ff ff       	jmp    0x4067d0
  406949:	68 40 7c 45 00       	push   0x457c40
  40694e:	ff 15 b8 91 41 00    	call   dword ptr ds:0x4191b8
  406954:	a1 a8 93 41 00       	mov    eax,ds:0x4193a8
  406959:	6a 05                	push   0x5
  40695b:	68 6c 7b 45 00       	push   0x457b6c
  406960:	ff d0                	call   eax
  406962:	83 c4 08             	add    esp,0x8
  406965:	89 45 d0             	mov    dword ptr [ebp-0x30],eax
  406968:	8d 45 d0             	lea    eax,[ebp-0x30]
  40696b:	c6 45 fc 0c          	mov    byte ptr [ebp-0x4],0xc
  40696f:	50                   	push   eax
  406970:	8d 45 c4             	lea    eax,[ebp-0x3c]
  406973:	50                   	push   eax
  406974:	8d 4d e0             	lea    ecx,[ebp-0x20]
  406977:	ff 15 8c 9b 41 00    	call   dword ptr ds:0x419b8c
  40697d:	8d 4d c0             	lea    ecx,[ebp-0x40]
  406980:	c6 45 fc 0d          	mov    byte ptr [ebp-0x4],0xd
  406984:	51                   	push   ecx
  406985:	8b c8                	mov    ecx,eax
  406987:	ff 15 5c 9b 41 00    	call   dword ptr ds:0x419b5c
  40698d:	50                   	push   eax
  40698e:	8d 4d f0             	lea    ecx,[ebp-0x10]
  406991:	c6 45 fc 0e          	mov    byte ptr [ebp-0x4],0xe
  406995:	ff 15 90 9b 41 00    	call   dword ptr ds:0x419b90
  40699b:	8d 4d c0             	lea    ecx,[ebp-0x40]
  40699e:	ff 15 68 9b 41 00    	call   dword ptr ds:0x419b68
  4069a4:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  4069a7:	ff 15 84 9b 41 00    	call   dword ptr ds:0x419b84
  4069ad:	8d 4d d0             	lea    ecx,[ebp-0x30]
  4069b0:	c6 45 fc 07          	mov    byte ptr [ebp-0x4],0x7
  4069b4:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  4069ba:	8b 1d 70 9b 41 00    	mov    ebx,dword ptr ds:0x419b70
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
  4069d8:	ff 15 6c 9b 41 00    	call   dword ptr ds:0x419b6c
  4069de:	8d 4d d0             	lea    ecx,[ebp-0x30]
  4069e1:	c6 45 fc 0f          	mov    byte ptr [ebp-0x4],0xf
  4069e5:	51                   	push   ecx
  4069e6:	8b c8                	mov    ecx,eax
  4069e8:	ff d6                	call   esi
  4069ea:	8d 4d c0             	lea    ecx,[ebp-0x40]
  4069ed:	c6 45 fc 11          	mov    byte ptr [ebp-0x4],0x11
  4069f1:	ff 15 50 9b 41 00    	call   dword ptr ds:0x419b50
  4069f7:	6a 30                	push   0x30
  4069f9:	e8 8b dd 00 00       	call   0x414789
  4069fe:	8b f0                	mov    esi,eax
  406a00:	83 c4 04             	add    esp,0x4
  406a03:	89 75 b8             	mov    dword ptr [ebp-0x48],esi
  406a06:	c6 45 fc 12          	mov    byte ptr [ebp-0x4],0x12
  406a0a:	85 f6                	test   esi,esi
  406a0c:	74 10                	je     0x406a1e
  406a0e:	8b ce                	mov    ecx,esi
  406a10:	ff 15 8c 91 41 00    	call   dword ptr ds:0x41918c
  406a16:	c7 06 c4 79 45 00    	mov    dword ptr [esi],0x4579c4
  406a1c:	eb 02                	jmp    0x406a20
  406a1e:	33 f6                	xor    esi,esi
  406a20:	ff 75 e8             	push   dword ptr [ebp-0x18]
  406a23:	8d 45 d0             	lea    eax,[ebp-0x30]
  406a26:	c6 45 fc 11          	mov    byte ptr [ebp-0x4],0x11
  406a2a:	56                   	push   esi
  406a2b:	50                   	push   eax
  406a2c:	e8 4f f9 ff ff       	call   0x406380
  406a31:	8b 4d e8             	mov    ecx,dword ptr [ebp-0x18]
  406a34:	83 c4 0c             	add    esp,0xc
  406a37:	56                   	push   esi
  406a38:	ff 15 14 91 41 00    	call   dword ptr ds:0x419114
  406a3e:	8d 4d d0             	lea    ecx,[ebp-0x30]
  406a41:	c6 45 fc 07          	mov    byte ptr [ebp-0x4],0x7
  406a45:	ff 15 84 9b 41 00    	call   dword ptr ds:0x419b84
  406a4b:	8d 4d f0             	lea    ecx,[ebp-0x10]
  406a4e:	47                   	inc    edi
  406a4f:	ff d3                	call   ebx
  406a51:	8b 35 64 9b 41 00    	mov    esi,dword ptr ds:0x419b64
  406a57:	3b f8                	cmp    edi,eax
  406a59:	0f 8c 71 ff ff ff    	jl     0x4069d0
  406a5f:	8b 1d a8 93 41 00    	mov    ebx,dword ptr ds:0x4193a8
  406a65:	6a 03                	push   0x3
  406a67:	68 a8 7b 45 00       	push   0x457ba8
  406a6c:	ff d3                	call   ebx
  406a6e:	83 c4 08             	add    esp,0x8
  406a71:	89 45 d0             	mov    dword ptr [ebp-0x30],eax
  406a74:	8b 4d 0c             	mov    ecx,dword ptr [ebp+0xc]
  406a77:	8d 45 d0             	lea    eax,[ebp-0x30]
  406a7a:	50                   	push   eax
  406a7b:	8d 45 e4             	lea    eax,[ebp-0x1c]
  406a7e:	c6 45 fc 13          	mov    byte ptr [ebp-0x4],0x13
  406a82:	50                   	push   eax
  406a83:	ff 15 8c 9b 41 00    	call   dword ptr ds:0x419b8c
  406a89:	8d 4d d0             	lea    ecx,[ebp-0x30]
  406a8c:	c6 45 fc 15          	mov    byte ptr [ebp-0x4],0x15
  406a90:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  406a96:	8b 7d ec             	mov    edi,dword ptr [ebp-0x14]
  406a99:	8b cf                	mov    ecx,edi
  406a9b:	ff 15 40 91 41 00    	call   dword ptr ds:0x419140
  406aa1:	6a 07                	push   0x7
  406aa3:	68 d0 7b 45 00       	push   0x457bd0
  406aa8:	ff d3                	call   ebx
  406aaa:	83 c4 08             	add    esp,0x8
  406aad:	89 45 d4             	mov    dword ptr [ebp-0x2c],eax
  406ab0:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  406ab3:	ff 15 d8 93 41 00    	call   dword ptr ds:0x4193d8
  406ab9:	50                   	push   eax
  406aba:	8d 45 d4             	lea    eax,[ebp-0x2c]
  406abd:	c6 45 fc 17          	mov    byte ptr [ebp-0x4],0x17
  406ac1:	50                   	push   eax
  406ac2:	8d 45 c0             	lea    eax,[ebp-0x40]
  406ac5:	50                   	push   eax
  406ac6:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  406ac9:	ff 15 7c 9b 41 00    	call   dword ptr ds:0x419b7c
  406acf:	8b 77 0c             	mov    esi,dword ptr [edi+0xc]
  406ad2:	8b c8                	mov    ecx,eax
  406ad4:	6a 0a                	push   0xa
  406ad6:	6a 00                	push   0x0
  406ad8:	c6 45 fc 18          	mov    byte ptr [ebp-0x4],0x18
  406adc:	ff 15 d0 92 41 00    	call   dword ptr ds:0x4192d0
  406ae2:	8d 4d c0             	lea    ecx,[ebp-0x40]
  406ae5:	89 46 24             	mov    dword ptr [esi+0x24],eax
  406ae8:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  406aee:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  406af1:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  406af7:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  406afa:	c6 45 fc 15          	mov    byte ptr [ebp-0x4],0x15
  406afe:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  406b04:	6a 07                	push   0x7
  406b06:	68 a0 7b 45 00       	push   0x457ba0
  406b0b:	ff d3                	call   ebx
  406b0d:	83 c4 08             	add    esp,0x8
  406b10:	89 45 d4             	mov    dword ptr [ebp-0x2c],eax
  406b13:	8d 45 d4             	lea    eax,[ebp-0x2c]
  406b16:	c6 45 fc 19          	mov    byte ptr [ebp-0x4],0x19
  406b1a:	50                   	push   eax
  406b1b:	8d 45 c4             	lea    eax,[ebp-0x3c]
  406b1e:	50                   	push   eax
  406b1f:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  406b22:	ff 15 8c 9b 41 00    	call   dword ptr ds:0x419b8c
  406b28:	8d 4d c0             	lea    ecx,[ebp-0x40]
  406b2b:	c6 45 fc 1a          	mov    byte ptr [ebp-0x4],0x1a
  406b2f:	51                   	push   ecx
  406b30:	8b c8                	mov    ecx,eax
  406b32:	ff 15 5c 9b 41 00    	call   dword ptr ds:0x419b5c
  406b38:	50                   	push   eax
  406b39:	8d 4d f0             	lea    ecx,[ebp-0x10]
  406b3c:	c6 45 fc 1b          	mov    byte ptr [ebp-0x4],0x1b
  406b40:	ff 15 90 9b 41 00    	call   dword ptr ds:0x419b90
  406b46:	8d 4d c0             	lea    ecx,[ebp-0x40]
  406b49:	ff 15 68 9b 41 00    	call   dword ptr ds:0x419b68
  406b4f:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  406b52:	ff 15 84 9b 41 00    	call   dword ptr ds:0x419b84
  406b58:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  406b5b:	c6 45 fc 15          	mov    byte ptr [ebp-0x4],0x15
  406b5f:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  406b65:	33 db                	xor    ebx,ebx
  406b67:	8d 4d f0             	lea    ecx,[ebp-0x10]
  406b6a:	89 5d d8             	mov    dword ptr [ebp-0x28],ebx
  406b6d:	ff 15 70 9b 41 00    	call   dword ptr ds:0x419b70
  406b73:	85 c0                	test   eax,eax
  406b75:	0f 8e 7a 01 00 00    	jle    0x406cf5
  406b7b:	0f 1f 44 00 00       	nop    dword ptr [eax+eax*1+0x0]
  406b80:	53                   	push   ebx
  406b81:	8d 45 c0             	lea    eax,[ebp-0x40]
  406b84:	50                   	push   eax
  406b85:	8d 4d f0             	lea    ecx,[ebp-0x10]
  406b88:	ff 15 6c 9b 41 00    	call   dword ptr ds:0x419b6c
  406b8e:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  406b91:	c6 45 fc 1c          	mov    byte ptr [ebp-0x4],0x1c
  406b95:	51                   	push   ecx
  406b96:	8b c8                	mov    ecx,eax
  406b98:	ff 15 64 9b 41 00    	call   dword ptr ds:0x419b64
  406b9e:	8d 4d c0             	lea    ecx,[ebp-0x40]
  406ba1:	c6 45 fc 1e          	mov    byte ptr [ebp-0x4],0x1e
  406ba5:	ff 15 50 9b 41 00    	call   dword ptr ds:0x419b50
  406bab:	6a 14                	push   0x14
  406bad:	e8 d7 db 00 00       	call   0x414789
  406bb2:	8b d8                	mov    ebx,eax
  406bb4:	83 c4 04             	add    esp,0x4
  406bb7:	89 5d b8             	mov    dword ptr [ebp-0x48],ebx
  406bba:	c6 45 fc 1f          	mov    byte ptr [ebp-0x4],0x1f
  406bbe:	85 db                	test   ebx,ebx
  406bc0:	74 10                	je     0x406bd2
  406bc2:	8b cb                	mov    ecx,ebx
  406bc4:	ff 15 7c 91 41 00    	call   dword ptr ds:0x41917c
  406bca:	c7 03 88 79 45 00    	mov    dword ptr [ebx],0x457988
  406bd0:	eb 02                	jmp    0x406bd4
  406bd2:	33 db                	xor    ebx,ebx
  406bd4:	8d 45 d4             	lea    eax,[ebp-0x2c]
  406bd7:	c6 45 fc 1e          	mov    byte ptr [ebp-0x4],0x1e
  406bdb:	53                   	push   ebx
  406bdc:	50                   	push   eax
  406bdd:	e8 4e f3 ff ff       	call   0x405f30
  406be2:	8b 7f 0c             	mov    edi,dword ptr [edi+0xc]
  406be5:	8d 45 dc             	lea    eax,[ebp-0x24]
  406be8:	83 c4 08             	add    esp,0x8
  406beb:	89 5d dc             	mov    dword ptr [ebp-0x24],ebx
  406bee:	8b 77 08             	mov    esi,dword ptr [edi+0x8]
  406bf1:	3b c6                	cmp    eax,esi
  406bf3:	73 73                	jae    0x406c68
  406bf5:	8b 4f 04             	mov    ecx,dword ptr [edi+0x4]
  406bf8:	3b c8                	cmp    ecx,eax
  406bfa:	77 6c                	ja     0x406c68
  406bfc:	8b 5f 0c             	mov    ebx,dword ptr [edi+0xc]
  406bff:	2b c1                	sub    eax,ecx
  406c01:	c1 f8 02             	sar    eax,0x2
  406c04:	89 45 c4             	mov    dword ptr [ebp-0x3c],eax
  406c07:	3b f3                	cmp    esi,ebx
  406c09:	75 49                	jne    0x406c54
  406c0b:	8b c3                	mov    eax,ebx
  406c0d:	2b c6                	sub    eax,esi
  406c0f:	c1 f8 02             	sar    eax,0x2
  406c12:	83 f8 01             	cmp    eax,0x1
  406c15:	73 3d                	jae    0x406c54
  406c17:	2b f1                	sub    esi,ecx
  406c19:	b8 ff ff ff 3f       	mov    eax,0x3fffffff
  406c1e:	c1 fe 02             	sar    esi,0x2
  406c21:	2b c6                	sub    eax,esi
  406c23:	83 f8 01             	cmp    eax,0x1
  406c26:	0f 82 1d fd ff ff    	jb     0x406949
  406c2c:	2b d9                	sub    ebx,ecx
  406c2e:	46                   	inc    esi
  406c2f:	c1 fb 02             	sar    ebx,0x2
  406c32:	b9 ff ff ff 3f       	mov    ecx,0x3fffffff
  406c37:	8b c3                	mov    eax,ebx
  406c39:	33 d2                	xor    edx,edx
  406c3b:	d1 e8                	shr    eax,1
  406c3d:	2b c8                	sub    ecx,eax
  406c3f:	03 c3                	add    eax,ebx
  406c41:	3b cb                	cmp    ecx,ebx
  406c43:	8d 4f 04             	lea    ecx,[edi+0x4]
  406c46:	0f 43 d0             	cmovae edx,eax
  406c49:	3b d6                	cmp    edx,esi
  406c4b:	0f 43 f2             	cmovae esi,edx
  406c4e:	56                   	push   esi
  406c4f:	e8 0c dc ff ff       	call   0x404860
  406c54:	8b 57 08             	mov    edx,dword ptr [edi+0x8]
  406c57:	8b 47 04             	mov    eax,dword ptr [edi+0x4]
  406c5a:	8b 4d c4             	mov    ecx,dword ptr [ebp-0x3c]
  406c5d:	85 d2                	test   edx,edx
  406c5f:	74 67                	je     0x406cc8
  406c61:	8b 04 88             	mov    eax,dword ptr [eax+ecx*4]
  406c64:	89 02                	mov    dword ptr [edx],eax
  406c66:	eb 60                	jmp    0x406cc8
  406c68:	8b 57 0c             	mov    edx,dword ptr [edi+0xc]
  406c6b:	3b f2                	cmp    esi,edx
  406c6d:	75 50                	jne    0x406cbf
  406c6f:	8b c2                	mov    eax,edx
  406c71:	2b c6                	sub    eax,esi
  406c73:	c1 f8 02             	sar    eax,0x2
  406c76:	83 f8 01             	cmp    eax,0x1
  406c79:	73 44                	jae    0x406cbf
  406c7b:	8b 4f 04             	mov    ecx,dword ptr [edi+0x4]
  406c7e:	b8 ff ff ff 3f       	mov    eax,0x3fffffff
  406c83:	2b f1                	sub    esi,ecx
  406c85:	c1 fe 02             	sar    esi,0x2
  406c88:	2b c6                	sub    eax,esi
  406c8a:	83 f8 01             	cmp    eax,0x1
  406c8d:	0f 82 b6 fc ff ff    	jb     0x406949
  406c93:	2b d1                	sub    edx,ecx
  406c95:	46                   	inc    esi
  406c96:	c1 fa 02             	sar    edx,0x2
  406c99:	b9 ff ff ff 3f       	mov    ecx,0x3fffffff
  406c9e:	8b c2                	mov    eax,edx
  406ca0:	89 55 c4             	mov    dword ptr [ebp-0x3c],edx
  406ca3:	d1 e8                	shr    eax,1
  406ca5:	2b c8                	sub    ecx,eax
  406ca7:	03 c2                	add    eax,edx
  406ca9:	33 d2                	xor    edx,edx
  406cab:	3b 4d c4             	cmp    ecx,dword ptr [ebp-0x3c]
  406cae:	8d 4f 04             	lea    ecx,[edi+0x4]
  406cb1:	0f 43 d0             	cmovae edx,eax
  406cb4:	3b d6                	cmp    edx,esi
  406cb6:	0f 43 f2             	cmovae esi,edx
  406cb9:	56                   	push   esi
  406cba:	e8 a1 db ff ff       	call   0x404860
  406cbf:	8b 47 08             	mov    eax,dword ptr [edi+0x8]
  406cc2:	85 c0                	test   eax,eax
  406cc4:	74 02                	je     0x406cc8
  406cc6:	89 18                	mov    dword ptr [eax],ebx
  406cc8:	83 47 08 04          	add    dword ptr [edi+0x8],0x4
  406ccc:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  406ccf:	c6 45 fc 15          	mov    byte ptr [ebp-0x4],0x15
  406cd3:	ff 15 84 9b 41 00    	call   dword ptr ds:0x419b84
  406cd9:	8b 5d d8             	mov    ebx,dword ptr [ebp-0x28]
  406cdc:	8d 4d f0             	lea    ecx,[ebp-0x10]
  406cdf:	43                   	inc    ebx
  406ce0:	89 5d d8             	mov    dword ptr [ebp-0x28],ebx
  406ce3:	ff 15 70 9b 41 00    	call   dword ptr ds:0x419b70
  406ce9:	3b d8                	cmp    ebx,eax
  406ceb:	7d 08                	jge    0x406cf5
  406ced:	8b 7d ec             	mov    edi,dword ptr [ebp-0x14]
  406cf0:	e9 8b fe ff ff       	jmp    0x406b80
  406cf5:	a1 a8 93 41 00       	mov    eax,ds:0x4193a8
  406cfa:	6a 05                	push   0x5
  406cfc:	68 6c 7b 45 00       	push   0x457b6c
  406d01:	ff d0                	call   eax
  406d03:	83 c4 08             	add    esp,0x8
  406d06:	89 45 d4             	mov    dword ptr [ebp-0x2c],eax
  406d09:	8d 45 d4             	lea    eax,[ebp-0x2c]
  406d0c:	c6 45 fc 20          	mov    byte ptr [ebp-0x4],0x20
  406d10:	50                   	push   eax
  406d11:	8d 45 c4             	lea    eax,[ebp-0x3c]
  406d14:	50                   	push   eax
  406d15:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  406d18:	ff 15 8c 9b 41 00    	call   dword ptr ds:0x419b8c
  406d1e:	8d 4d c0             	lea    ecx,[ebp-0x40]
  406d21:	c6 45 fc 21          	mov    byte ptr [ebp-0x4],0x21
  406d25:	51                   	push   ecx
  406d26:	8b c8                	mov    ecx,eax
  406d28:	ff 15 5c 9b 41 00    	call   dword ptr ds:0x419b5c
  406d2e:	50                   	push   eax
  406d2f:	8d 4d f0             	lea    ecx,[ebp-0x10]
  406d32:	c6 45 fc 22          	mov    byte ptr [ebp-0x4],0x22
  406d36:	ff 15 90 9b 41 00    	call   dword ptr ds:0x419b90
  406d3c:	8d 4d c0             	lea    ecx,[ebp-0x40]
  406d3f:	ff 15 68 9b 41 00    	call   dword ptr ds:0x419b68
  406d45:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  406d48:	ff 15 84 9b 41 00    	call   dword ptr ds:0x419b84
  406d4e:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  406d51:	c6 45 fc 15          	mov    byte ptr [ebp-0x4],0x15
  406d55:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  406d5b:	8b 1d 70 9b 41 00    	mov    ebx,dword ptr ds:0x419b70
  406d61:	8d 4d f0             	lea    ecx,[ebp-0x10]
  406d64:	33 ff                	xor    edi,edi
  406d66:	ff d3                	call   ebx
  406d68:	85 c0                	test   eax,eax
  406d6a:	0f 8e 8d 00 00 00    	jle    0x406dfd
  406d70:	57                   	push   edi
  406d71:	8d 45 c0             	lea    eax,[ebp-0x40]
  406d74:	50                   	push   eax
  406d75:	8d 4d f0             	lea    ecx,[ebp-0x10]
  406d78:	ff 15 6c 9b 41 00    	call   dword ptr ds:0x419b6c
  406d7e:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  406d81:	c6 45 fc 23          	mov    byte ptr [ebp-0x4],0x23
  406d85:	51                   	push   ecx
  406d86:	8b c8                	mov    ecx,eax
  406d88:	ff 15 64 9b 41 00    	call   dword ptr ds:0x419b64
  406d8e:	8d 4d c0             	lea    ecx,[ebp-0x40]
  406d91:	c6 45 fc 25          	mov    byte ptr [ebp-0x4],0x25
  406d95:	ff 15 50 9b 41 00    	call   dword ptr ds:0x419b50
  406d9b:	6a 30                	push   0x30
  406d9d:	e8 e7 d9 00 00       	call   0x414789
  406da2:	8b f0                	mov    esi,eax
  406da4:	83 c4 04             	add    esp,0x4
  406da7:	89 75 b8             	mov    dword ptr [ebp-0x48],esi
  406daa:	c6 45 fc 26          	mov    byte ptr [ebp-0x4],0x26
  406dae:	85 f6                	test   esi,esi
  406db0:	74 10                	je     0x406dc2
  406db2:	8b ce                	mov    ecx,esi
  406db4:	ff 15 c0 90 41 00    	call   dword ptr ds:0x4190c0
  406dba:	c7 06 5c 79 45 00    	mov    dword ptr [esi],0x45795c
  406dc0:	eb 02                	jmp    0x406dc4
  406dc2:	33 f6                	xor    esi,esi
  406dc4:	ff 75 ec             	push   dword ptr [ebp-0x14]
  406dc7:	8d 45 d4             	lea    eax,[ebp-0x2c]
  406dca:	c6 45 fc 25          	mov    byte ptr [ebp-0x4],0x25
  406dce:	56                   	push   esi
  406dcf:	50                   	push   eax
  406dd0:	e8 9b ef ff ff       	call   0x405d70
  406dd5:	8b 4d ec             	mov    ecx,dword ptr [ebp-0x14]
  406dd8:	83 c4 0c             	add    esp,0xc
  406ddb:	56                   	push   esi
  406ddc:	ff 15 30 91 41 00    	call   dword ptr ds:0x419130
  406de2:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  406de5:	c6 45 fc 15          	mov    byte ptr [ebp-0x4],0x15
  406de9:	ff 15 84 9b 41 00    	call   dword ptr ds:0x419b84
  406def:	8d 4d f0             	lea    ecx,[ebp-0x10]
  406df2:	47                   	inc    edi
  406df3:	ff d3                	call   ebx
  406df5:	3b f8                	cmp    edi,eax
  406df7:	0f 8c 73 ff ff ff    	jl     0x406d70
  406dfd:	6a 07                	push   0x7
  406dff:	68 b0 7b 45 00       	push   0x457bb0
  406e04:	ff 15 a8 93 41 00    	call   dword ptr ds:0x4193a8
  406e0a:	83 c4 08             	add    esp,0x8
  406e0d:	89 45 d4             	mov    dword ptr [ebp-0x2c],eax
  406e10:	8b 4d 0c             	mov    ecx,dword ptr [ebp+0xc]
  406e13:	8d 45 d4             	lea    eax,[ebp-0x2c]
  406e16:	50                   	push   eax
  406e17:	8d 45 cc             	lea    eax,[ebp-0x34]
  406e1a:	c6 45 fc 27          	mov    byte ptr [ebp-0x4],0x27
  406e1e:	50                   	push   eax
  406e1f:	ff 15 8c 9b 41 00    	call   dword ptr ds:0x419b8c
  406e25:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  406e28:	c6 45 fc 29          	mov    byte ptr [ebp-0x4],0x29
  406e2c:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  406e32:	8d 45 c0             	lea    eax,[ebp-0x40]
  406e35:	50                   	push   eax
  406e36:	8d 4d cc             	lea    ecx,[ebp-0x34]
  406e39:	ff 15 5c 9b 41 00    	call   dword ptr ds:0x419b5c
  406e3f:	50                   	push   eax
  406e40:	8d 4d f0             	lea    ecx,[ebp-0x10]
  406e43:	c6 45 fc 2a          	mov    byte ptr [ebp-0x4],0x2a
  406e47:	ff 15 90 9b 41 00    	call   dword ptr ds:0x419b90
  406e4d:	8d 4d c0             	lea    ecx,[ebp-0x40]
  406e50:	c6 45 fc 29          	mov    byte ptr [ebp-0x4],0x29
  406e54:	ff 15 68 9b 41 00    	call   dword ptr ds:0x419b68
  406e5a:	8d 4d f0             	lea    ecx,[ebp-0x10]
  406e5d:	33 f6                	xor    esi,esi
  406e5f:	ff d3                	call   ebx
  406e61:	85 c0                	test   eax,eax
  406e63:	7e 65                	jle    0x406eca
  406e65:	8b 3d e0 90 41 00    	mov    edi,dword ptr ds:0x4190e0
  406e6b:	0f 1f 44 00 00       	nop    dword ptr [eax+eax*1+0x0]
  406e70:	56                   	push   esi
  406e71:	8d 45 c0             	lea    eax,[ebp-0x40]
  406e74:	50                   	push   eax
  406e75:	8d 4d f0             	lea    ecx,[ebp-0x10]
  406e78:	ff 15 6c 9b 41 00    	call   dword ptr ds:0x419b6c
  406e7e:	8d 4d d0             	lea    ecx,[ebp-0x30]
  406e81:	c6 45 fc 2b          	mov    byte ptr [ebp-0x4],0x2b
  406e85:	51                   	push   ecx
  406e86:	8b c8                	mov    ecx,eax
  406e88:	ff 15 64 9b 41 00    	call   dword ptr ds:0x419b64
  406e8e:	8d 4d c0             	lea    ecx,[ebp-0x40]
  406e91:	c6 45 fc 2d          	mov    byte ptr [ebp-0x4],0x2d
  406e95:	ff 15 50 9b 41 00    	call   dword ptr ds:0x419b50
  406e9b:	ff 75 e8             	push   dword ptr [ebp-0x18]
  406e9e:	8b 4d bc             	mov    ecx,dword ptr [ebp-0x44]
  406ea1:	ff 75 ec             	push   dword ptr [ebp-0x14]
  406ea4:	ff d7                	call   edi
  406ea6:	50                   	push   eax
  406ea7:	8d 45 d0             	lea    eax,[ebp-0x30]
  406eaa:	50                   	push   eax
  406eab:	e8 30 eb ff ff       	call   0x4059e0
  406eb0:	83 c4 10             	add    esp,0x10
  406eb3:	c6 45 fc 29          	mov    byte ptr [ebp-0x4],0x29
  406eb7:	8d 4d d0             	lea    ecx,[ebp-0x30]
  406eba:	ff 15 84 9b 41 00    	call   dword ptr ds:0x419b84
  406ec0:	8d 4d f0             	lea    ecx,[ebp-0x10]
  406ec3:	46                   	inc    esi
  406ec4:	ff d3                	call   ebx
  406ec6:	3b f0                	cmp    esi,eax
  406ec8:	7c a6                	jl     0x406e70
  406eca:	8b 0d a4 96 46 00    	mov    ecx,dword ptr ds:0x4696a4
  406ed0:	6a 00                	push   0x0
  406ed2:	8b 49 0c             	mov    ecx,dword ptr [ecx+0xc]
  406ed5:	ff 15 f4 90 41 00    	call   dword ptr ds:0x4190f4
  406edb:	8b c8                	mov    ecx,eax
  406edd:	ff 15 3c 91 41 00    	call   dword ptr ds:0x41913c
  406ee3:	8d 4d cc             	lea    ecx,[ebp-0x34]
  406ee6:	ff 15 84 9b 41 00    	call   dword ptr ds:0x419b84
  406eec:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  406eef:	ff 15 84 9b 41 00    	call   dword ptr ds:0x419b84
  406ef5:	8d 4d f0             	lea    ecx,[ebp-0x10]
  406ef8:	ff 15 68 9b 41 00    	call   dword ptr ds:0x419b68
  406efe:	8d 4d e0             	lea    ecx,[ebp-0x20]
  406f01:	ff 15 84 9b 41 00    	call   dword ptr ds:0x419b84
  406f07:	8b 4d f4             	mov    ecx,dword ptr [ebp-0xc]
  406f0a:	64 89 0d 00 00 00 00 	mov    dword ptr fs:0x0,ecx
  406f11:	59                   	pop    ecx
  406f12:	5f                   	pop    edi
  406f13:	5e                   	pop    esi
  406f14:	5b                   	pop    ebx
  406f15:	8b e5                	mov    esp,ebp
  406f17:	5d                   	pop    ebp
  406f18:	c3                   	ret
  406f19:	cc                   	int3
  406f1a:	cc                   	int3
  406f1b:	cc                   	int3
  406f1c:	cc                   	int3
  406f1d:	cc                   	int3
  406f1e:	cc                   	int3
  406f1f:	cc                   	int3
