===== ConceptModel writer 0x0040A6D0..0x0040AC1E =====

/mnt/data/IS2_original_binaries/IS.exe:     file format pei-i386


Disassembly of section .text:

0040a6d0 <.text+0x96d0>:
  40a6d0:	55                   	push   ebp
  40a6d1:	8b ec                	mov    ebp,esp
  40a6d3:	6a ff                	push   0xffffffff
  40a6d5:	68 dc 70 41 00       	push   0x4170dc
  40a6da:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  40a6e0:	50                   	push   eax
  40a6e1:	83 ec 24             	sub    esp,0x24
  40a6e4:	53                   	push   ebx
  40a6e5:	56                   	push   esi
  40a6e6:	57                   	push   edi
  40a6e7:	a1 cc 90 46 00       	mov    eax,ds:0x4690cc
  40a6ec:	33 c5                	xor    eax,ebp
  40a6ee:	50                   	push   eax
  40a6ef:	8d 45 f4             	lea    eax,[ebp-0xc]
  40a6f2:	64 a3 00 00 00 00    	mov    fs:0x0,eax
  40a6f8:	c7 45 d4 00 00 00 00 	mov    DWORD PTR [ebp-0x2c],0x0
  40a6ff:	8b 5d 0c             	mov    ebx,DWORD PTR [ebp+0xc]
  40a702:	6a 0c                	push   0xc
  40a704:	68 64 7a 45 00       	push   0x457a64
  40a709:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
  40a710:	89 1d b0 96 46 00    	mov    DWORD PTR ds:0x4696b0,ebx
  40a716:	ff 15 a8 93 41 00    	call   DWORD PTR ds:0x4193a8
  40a71c:	83 c4 08             	add    esp,0x8
  40a71f:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
  40a722:	8b 7d 08             	mov    edi,DWORD PTR [ebp+0x8]
  40a725:	8d 45 dc             	lea    eax,[ebp-0x24]
  40a728:	50                   	push   eax
  40a729:	57                   	push   edi
  40a72a:	8b cb                	mov    ecx,ebx
  40a72c:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [ebp-0x4],0x1
  40a733:	ff 15 74 9b 41 00    	call   DWORD PTR ds:0x419b74
  40a739:	8d 4d dc             	lea    ecx,[ebp-0x24]
  40a73c:	c7 45 d4 01 00 00 00 	mov    DWORD PTR [ebp-0x2c],0x1
  40a743:	c6 45 fc 00          	mov    BYTE PTR [ebp-0x4],0x0
  40a747:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40a74d:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  40a753:	8b 35 78 91 41 00    	mov    esi,DWORD PTR ds:0x419178
  40a759:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
  40a75c:	ff d6                	call   esi
  40a75e:	50                   	push   eax
  40a75f:	8d 45 e4             	lea    eax,[ebp-0x1c]
  40a762:	50                   	push   eax
  40a763:	e8 b8 04 00 00       	call   0x40ac20
  40a768:	83 c4 08             	add    esp,0x8
  40a76b:	8d 45 e4             	lea    eax,[ebp-0x1c]
  40a76e:	c7 45 fc 02 00 00 00 	mov    DWORD PTR [ebp-0x4],0x2
  40a775:	50                   	push   eax
  40a776:	8d 45 d8             	lea    eax,[ebp-0x28]
  40a779:	8b cf                	mov    ecx,edi
  40a77b:	8b 3d 58 9b 41 00    	mov    edi,DWORD PTR ds:0x419b58
  40a781:	50                   	push   eax
  40a782:	ff d7                	call   edi
  40a784:	8b 1d 50 9b 41 00    	mov    ebx,DWORD PTR ds:0x419b50
  40a78a:	8d 4d d8             	lea    ecx,[ebp-0x28]
  40a78d:	ff d3                	call   ebx
  40a78f:	6a 07                	push   0x7
  40a791:	68 a0 7b 45 00       	push   0x457ba0
  40a796:	ff 15 a8 93 41 00    	call   DWORD PTR ds:0x4193a8
  40a79c:	83 c4 08             	add    esp,0x8
  40a79f:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
  40a7a2:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
  40a7a5:	8d 45 dc             	lea    eax,[ebp-0x24]
  40a7a8:	50                   	push   eax
  40a7a9:	8d 45 ec             	lea    eax,[ebp-0x14]
  40a7ac:	c6 45 fc 03          	mov    BYTE PTR [ebp-0x4],0x3
  40a7b0:	50                   	push   eax
  40a7b1:	ff 15 74 9b 41 00    	call   DWORD PTR ds:0x419b74
  40a7b7:	8d 4d dc             	lea    ecx,[ebp-0x24]
  40a7ba:	c6 45 fc 05          	mov    BYTE PTR [ebp-0x4],0x5
  40a7be:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40a7c4:	8d 45 ec             	lea    eax,[ebp-0x14]
  40a7c7:	50                   	push   eax
  40a7c8:	8d 45 d8             	lea    eax,[ebp-0x28]
  40a7cb:	50                   	push   eax
  40a7cc:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  40a7cf:	ff d7                	call   edi
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
  40a95d:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  40a960:	8d 45 e8             	lea    eax,[ebp-0x18]
  40a963:	50                   	push   eax
  40a964:	8d 45 d0             	lea    eax,[ebp-0x30]
  40a967:	50                   	push   eax
  40a968:	ff d7                	call   edi
  40a96a:	8d 4d d0             	lea    ecx,[ebp-0x30]
  40a96d:	ff d3                	call   ebx
  40a96f:	6a 07                	push   0x7
  40a971:	68 a0 7b 45 00       	push   0x457ba0
  40a976:	ff 15 a8 93 41 00    	call   DWORD PTR ds:0x4193a8
  40a97c:	83 c4 08             	add    esp,0x8
  40a97f:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
  40a982:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
  40a985:	8d 45 d8             	lea    eax,[ebp-0x28]
  40a988:	50                   	push   eax
  40a989:	8d 45 d0             	lea    eax,[ebp-0x30]
  40a98c:	c6 45 fc 0d          	mov    BYTE PTR [ebp-0x4],0xd
  40a990:	50                   	push   eax
  40a991:	ff 15 74 9b 41 00    	call   DWORD PTR ds:0x419b74
  40a997:	50                   	push   eax
  40a998:	8d 4d ec             	lea    ecx,[ebp-0x14]
  40a99b:	c6 45 fc 0e          	mov    BYTE PTR [ebp-0x4],0xe
  40a99f:	ff 15 c0 9b 41 00    	call   DWORD PTR ds:0x419bc0
  40a9a5:	8d 4d d0             	lea    ecx,[ebp-0x30]
  40a9a8:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  40a9ae:	8d 4d d8             	lea    ecx,[ebp-0x28]
  40a9b1:	c6 45 fc 0b          	mov    BYTE PTR [ebp-0x4],0xb
  40a9b5:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40a9bb:	8d 45 ec             	lea    eax,[ebp-0x14]
  40a9be:	50                   	push   eax
  40a9bf:	8d 45 d0             	lea    eax,[ebp-0x30]
  40a9c2:	50                   	push   eax
  40a9c3:	8d 4d e8             	lea    ecx,[ebp-0x18]
  40a9c6:	ff d7                	call   edi
  40a9c8:	8d 4d d0             	lea    ecx,[ebp-0x30]
  40a9cb:	ff d3                	call   ebx
  40a9cd:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  40a9d3:	6a 00                	push   0x0
  40a9d5:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
  40a9d8:	ff d6                	call   esi
  40a9da:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  40a9e0:	6a 00                	push   0x0
  40a9e2:	8b 70 0c             	mov    esi,DWORD PTR [eax+0xc]
  40a9e5:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
  40a9e8:	8b 76 04             	mov    esi,DWORD PTR [esi+0x4]
  40a9eb:	ff 15 f4 90 41 00    	call   DWORD PTR ds:0x4190f4
  40a9f1:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  40a9f4:	3b 70 08             	cmp    esi,DWORD PTR [eax+0x8]
  40a9f7:	74 54                	je     0x40aa4d
  40a9f9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [eax+0x0]
  40aa00:	ff 36                	push   DWORD PTR [esi]
  40aa02:	8d 45 d8             	lea    eax,[ebp-0x28]
  40aa05:	50                   	push   eax
  40aa06:	e8 a5 19 00 00       	call   0x40c3b0
  40aa0b:	83 c4 08             	add    esp,0x8
  40aa0e:	8d 45 d8             	lea    eax,[ebp-0x28]
  40aa11:	c6 45 fc 0f          	mov    BYTE PTR [ebp-0x4],0xf
  40aa15:	50                   	push   eax
  40aa16:	8d 45 d0             	lea    eax,[ebp-0x30]
  40aa19:	50                   	push   eax
  40aa1a:	8d 4d ec             	lea    ecx,[ebp-0x14]
  40aa1d:	ff d7                	call   edi
  40aa1f:	8d 4d d0             	lea    ecx,[ebp-0x30]
  40aa22:	ff d3                	call   ebx
  40aa24:	8d 4d d8             	lea    ecx,[ebp-0x28]
  40aa27:	c6 45 fc 0b          	mov    BYTE PTR [ebp-0x4],0xb
  40aa2b:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  40aa31:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  40aa37:	83 c6 04             	add    esi,0x4
  40aa3a:	6a 00                	push   0x0
  40aa3c:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
  40aa3f:	ff 15 f4 90 41 00    	call   DWORD PTR ds:0x4190f4
  40aa45:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  40aa48:	3b 70 08             	cmp    esi,DWORD PTR [eax+0x8]
  40aa4b:	75 b3                	jne    0x40aa00
  40aa4d:	6a 05                	push   0x5
  40aa4f:	68 6c 7b 45 00       	push   0x457b6c
  40aa54:	ff 15 a8 93 41 00    	call   DWORD PTR ds:0x4193a8
  40aa5a:	83 c4 08             	add    esp,0x8
  40aa5d:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
  40aa60:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
  40aa63:	8d 45 d8             	lea    eax,[ebp-0x28]
  40aa66:	50                   	push   eax
  40aa67:	8d 45 d0             	lea    eax,[ebp-0x30]
  40aa6a:	c6 45 fc 10          	mov    BYTE PTR [ebp-0x4],0x10
  40aa6e:	50                   	push   eax
  40aa6f:	ff 15 74 9b 41 00    	call   DWORD PTR ds:0x419b74
  40aa75:	50                   	push   eax
  40aa76:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40aa79:	c6 45 fc 11          	mov    BYTE PTR [ebp-0x4],0x11
  40aa7d:	ff 15 c0 9b 41 00    	call   DWORD PTR ds:0x419bc0
  40aa83:	8d 4d d0             	lea    ecx,[ebp-0x30]
  40aa86:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  40aa8c:	8d 4d d8             	lea    ecx,[ebp-0x28]
  40aa8f:	c6 45 fc 0b          	mov    BYTE PTR [ebp-0x4],0xb
  40aa93:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40aa99:	8d 45 f0             	lea    eax,[ebp-0x10]
  40aa9c:	50                   	push   eax
  40aa9d:	8d 45 0c             	lea    eax,[ebp+0xc]
  40aaa0:	50                   	push   eax
  40aaa1:	8d 4d e8             	lea    ecx,[ebp-0x18]
  40aaa4:	ff d7                	call   edi
  40aaa6:	8d 4d 0c             	lea    ecx,[ebp+0xc]
  40aaa9:	ff d3                	call   ebx
  40aaab:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  40aab1:	6a 00                	push   0x0
  40aab3:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
  40aab6:	ff 15 f4 90 41 00    	call   DWORD PTR ds:0x4190f4
  40aabc:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  40aac2:	6a 00                	push   0x0
  40aac4:	8b 70 0c             	mov    esi,DWORD PTR [eax+0xc]
  40aac7:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
  40aaca:	8b 76 10             	mov    esi,DWORD PTR [esi+0x10]
  40aacd:	ff 15 f4 90 41 00    	call   DWORD PTR ds:0x4190f4
  40aad3:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  40aad6:	3b 70 14             	cmp    esi,DWORD PTR [eax+0x14]
  40aad9:	73 52                	jae    0x40ab2d
  40aadb:	0f 1f 44 00 00       	nop    DWORD PTR [eax+eax*1+0x0]
  40aae0:	ff 36                	push   DWORD PTR [esi]
  40aae2:	8d 45 0c             	lea    eax,[ebp+0xc]
  40aae5:	50                   	push   eax
  40aae6:	e8 55 f7 ff ff       	call   0x40a240
  40aaeb:	83 c4 08             	add    esp,0x8
  40aaee:	8d 45 0c             	lea    eax,[ebp+0xc]
  40aaf1:	c6 45 fc 12          	mov    BYTE PTR [ebp-0x4],0x12
  40aaf5:	50                   	push   eax
  40aaf6:	8d 45 d0             	lea    eax,[ebp-0x30]
  40aaf9:	50                   	push   eax
  40aafa:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40aafd:	ff d7                	call   edi
  40aaff:	8d 4d d0             	lea    ecx,[ebp-0x30]
  40ab02:	ff d3                	call   ebx
  40ab04:	8d 4d 0c             	lea    ecx,[ebp+0xc]
  40ab07:	c6 45 fc 0b          	mov    BYTE PTR [ebp-0x4],0xb
  40ab0b:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  40ab11:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  40ab17:	83 c6 04             	add    esi,0x4
  40ab1a:	6a 00                	push   0x0
  40ab1c:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
  40ab1f:	ff 15 f4 90 41 00    	call   DWORD PTR ds:0x4190f4
  40ab25:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  40ab28:	3b 70 14             	cmp    esi,DWORD PTR [eax+0x14]
  40ab2b:	72 b3                	jb     0x40aae0
  40ab2d:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  40ab33:	8b 35 f8 90 41 00    	mov    esi,DWORD PTR ds:0x4190f8
  40ab39:	6a 00                	push   0x0
  40ab3b:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
  40ab3e:	ff d6                	call   esi
  40ab40:	50                   	push   eax
  40ab41:	8d 45 e0             	lea    eax,[ebp-0x20]
  40ab44:	50                   	push   eax
  40ab45:	e8 96 f2 ff ff       	call   0x409de0
  40ab4a:	83 c4 08             	add    esp,0x8
  40ab4d:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  40ab50:	8d 45 e0             	lea    eax,[ebp-0x20]
  40ab53:	50                   	push   eax
  40ab54:	8d 45 0c             	lea    eax,[ebp+0xc]
  40ab57:	c6 45 fc 13          	mov    BYTE PTR [ebp-0x4],0x13
  40ab5b:	50                   	push   eax
  40ab5c:	ff d7                	call   edi
  40ab5e:	8d 4d 0c             	lea    ecx,[ebp+0xc]
  40ab61:	ff d3                	call   ebx
  40ab63:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  40ab69:	6a 00                	push   0x0
  40ab6b:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
  40ab6e:	ff d6                	call   esi
  40ab70:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  40ab76:	6a 00                	push   0x0
  40ab78:	8b 70 04             	mov    esi,DWORD PTR [eax+0x4]
  40ab7b:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
  40ab7e:	8b 36                	mov    esi,DWORD PTR [esi]
  40ab80:	ff 15 f8 90 41 00    	call   DWORD PTR ds:0x4190f8
  40ab86:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
  40ab89:	3b 70 04             	cmp    esi,DWORD PTR [eax+0x4]
  40ab8c:	74 4f                	je     0x40abdd
  40ab8e:	66 90                	xchg   ax,ax
  40ab90:	ff 36                	push   DWORD PTR [esi]
  40ab92:	8d 45 0c             	lea    eax,[ebp+0xc]
  40ab95:	50                   	push   eax
  40ab96:	e8 a5 f4 ff ff       	call   0x40a040
  40ab9b:	83 c4 08             	add    esp,0x8
  40ab9e:	8d 45 0c             	lea    eax,[ebp+0xc]
  40aba1:	c6 45 fc 14          	mov    BYTE PTR [ebp-0x4],0x14
  40aba5:	50                   	push   eax
  40aba6:	8d 45 d0             	lea    eax,[ebp-0x30]
  40aba9:	50                   	push   eax
  40abaa:	8d 4d e0             	lea    ecx,[ebp-0x20]
  40abad:	ff d7                	call   edi
  40abaf:	8d 4d d0             	lea    ecx,[ebp-0x30]
  40abb2:	ff d3                	call   ebx
  40abb4:	8d 4d 0c             	lea    ecx,[ebp+0xc]
  40abb7:	c6 45 fc 13          	mov    BYTE PTR [ebp-0x4],0x13
  40abbb:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  40abc1:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  40abc7:	83 c6 04             	add    esi,0x4
  40abca:	6a 00                	push   0x0
  40abcc:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
  40abcf:	ff 15 f8 90 41 00    	call   DWORD PTR ds:0x4190f8
  40abd5:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
  40abd8:	3b 70 04             	cmp    esi,DWORD PTR [eax+0x4]
  40abdb:	75 b3                	jne    0x40ab90
  40abdd:	8d 4d e0             	lea    ecx,[ebp-0x20]
  40abe0:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  40abe6:	8d 4d e8             	lea    ecx,[ebp-0x18]
  40abe9:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  40abef:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40abf2:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  40abf8:	8d 4d ec             	lea    ecx,[ebp-0x14]
  40abfb:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  40ac01:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  40ac04:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  40ac0a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  40ac0d:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
  40ac10:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  40ac17:	59                   	pop    ecx
  40ac18:	5f                   	pop    edi
  40ac19:	5e                   	pop    esi
  40ac1a:	5b                   	pop    ebx
  40ac1b:	8b e5                	mov    esp,ebp
  40ac1d:	5d                   	pop    ebp
  40ac1e:	c3                   	ret


===== FStructure/cs wrapper writer 0x0040AC20..0x0040ACAE =====

/mnt/data/IS2_original_binaries/IS.exe:     file format pei-i386


Disassembly of section .text:

0040ac20 <.text+0x9c20>:
  40ac20:	55                   	push   ebp
  40ac21:	8b ec                	mov    ebp,esp
  40ac23:	6a ff                	push   0xffffffff
  40ac25:	68 23 71 41 00       	push   0x417123
  40ac2a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  40ac30:	50                   	push   eax
  40ac31:	83 ec 08             	sub    esp,0x8
  40ac34:	56                   	push   esi
  40ac35:	a1 cc 90 46 00       	mov    eax,ds:0x4690cc
  40ac3a:	33 c5                	xor    eax,ebp
  40ac3c:	50                   	push   eax
  40ac3d:	8d 45 f4             	lea    eax,[ebp-0xc]
  40ac40:	64 a3 00 00 00 00    	mov    fs:0x0,eax
  40ac46:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
  40ac49:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
  40ac50:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
  40ac53:	56                   	push   esi
  40ac54:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
  40ac5b:	e8 70 f9 ff ff       	call   0x40a5d0
  40ac60:	6a 02                	push   0x2
  40ac62:	68 ac 7b 45 00       	push   0x457bac
  40ac67:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
  40ac6e:	c7 45 ec 01 00 00 00 	mov    DWORD PTR [ebp-0x14],0x1
  40ac75:	ff 15 a8 93 41 00    	call   DWORD PTR ds:0x4193a8
  40ac7b:	83 c4 10             	add    esp,0x10
  40ac7e:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
  40ac81:	8d 45 f0             	lea    eax,[ebp-0x10]
  40ac84:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [ebp-0x4],0x1
  40ac8b:	50                   	push   eax
  40ac8c:	8b ce                	mov    ecx,esi
  40ac8e:	ff 15 b4 9b 41 00    	call   DWORD PTR ds:0x419bb4
  40ac94:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40ac97:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40ac9d:	8b c6                	mov    eax,esi
  40ac9f:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
  40aca2:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  40aca9:	59                   	pop    ecx
  40acaa:	5e                   	pop    esi
  40acab:	8b e5                	mov    esp,ebp
  40acad:	5d                   	pop    ebp
  40acae:	c3                   	ret


===== FStructure counters writer 0x0040A5D0..0x0040A6CC =====

/mnt/data/IS2_original_binaries/IS.exe:     file format pei-i386


Disassembly of section .text:

0040a5d0 <.text+0x95d0>:
  40a5d0:	55                   	push   ebp
  40a5d1:	8b ec                	mov    ebp,esp
  40a5d3:	6a ff                	push   0xffffffff
  40a5d5:	68 05 70 41 00       	push   0x417005
  40a5da:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  40a5e0:	50                   	push   eax
  40a5e1:	83 ec 0c             	sub    esp,0xc
  40a5e4:	53                   	push   ebx
  40a5e5:	56                   	push   esi
  40a5e6:	57                   	push   edi
  40a5e7:	a1 cc 90 46 00       	mov    eax,ds:0x4690cc
  40a5ec:	33 c5                	xor    eax,ebp
  40a5ee:	50                   	push   eax
  40a5ef:	8d 45 f4             	lea    eax,[ebp-0xc]
  40a5f2:	64 a3 00 00 00 00    	mov    fs:0x0,eax
  40a5f8:	6a 0a                	push   0xa
  40a5fa:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
  40a601:	8b 1d a8 93 41 00    	mov    ebx,DWORD PTR ds:0x4193a8
  40a607:	68 d8 7b 45 00       	push   0x457bd8
  40a60c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
  40a613:	ff d3                	call   ebx
  40a615:	83 c4 08             	add    esp,0x8
  40a618:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
  40a61b:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
  40a61e:	8d 45 f0             	lea    eax,[ebp-0x10]
  40a621:	8b 0d b0 96 46 00    	mov    ecx,DWORD PTR ds:0x4696b0
  40a627:	50                   	push   eax
  40a628:	56                   	push   esi
  40a629:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [ebp-0x4],0x1
  40a630:	ff 15 74 9b 41 00    	call   DWORD PTR ds:0x419b74
  40a636:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40a639:	c7 45 e8 01 00 00 00 	mov    DWORD PTR [ebp-0x18],0x1
  40a640:	c6 45 fc 00          	mov    BYTE PTR [ebp-0x4],0x0
  40a644:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40a64a:	6a 0c                	push   0xc
  40a64c:	68 e4 7b 45 00       	push   0x457be4
  40a651:	ff d3                	call   ebx
  40a653:	83 c4 08             	add    esp,0x8
  40a656:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
  40a659:	8b 7d 0c             	mov    edi,DWORD PTR [ebp+0xc]
  40a65c:	8b ce                	mov    ecx,esi
  40a65e:	8b 35 4c 9b 41 00    	mov    esi,DWORD PTR ds:0x419b4c
  40a664:	c7 45 fc 02 00 00 00 	mov    DWORD PTR [ebp-0x4],0x2
  40a66b:	8b 47 04             	mov    eax,DWORD PTR [edi+0x4]
  40a66e:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  40a671:	99                   	cdq
  40a672:	52                   	push   edx
  40a673:	50                   	push   eax
  40a674:	8d 45 ec             	lea    eax,[ebp-0x14]
  40a677:	50                   	push   eax
  40a678:	ff d6                	call   esi
  40a67a:	8d 4d ec             	lea    ecx,[ebp-0x14]
  40a67d:	c6 45 fc 00          	mov    BYTE PTR [ebp-0x4],0x0
  40a681:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40a687:	6a 0c                	push   0xc
  40a689:	68 f4 7b 45 00       	push   0x457bf4
  40a68e:	ff d3                	call   ebx
  40a690:	83 c4 08             	add    esp,0x8
  40a693:	89 45 0c             	mov    DWORD PTR [ebp+0xc],eax
  40a696:	8b 47 04             	mov    eax,DWORD PTR [edi+0x4]
  40a699:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  40a69c:	c7 45 fc 03 00 00 00 	mov    DWORD PTR [ebp-0x4],0x3
  40a6a3:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
  40a6a6:	99                   	cdq
  40a6a7:	52                   	push   edx
  40a6a8:	50                   	push   eax
  40a6a9:	8d 45 0c             	lea    eax,[ebp+0xc]
  40a6ac:	50                   	push   eax
  40a6ad:	ff d6                	call   esi
  40a6af:	8d 4d 0c             	lea    ecx,[ebp+0xc]
  40a6b2:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40a6b8:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  40a6bb:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
  40a6be:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  40a6c5:	59                   	pop    ecx
  40a6c6:	5f                   	pop    edi
  40a6c7:	5e                   	pop    esi
  40a6c8:	5b                   	pop    ebx
  40a6c9:	8b e5                	mov    esp,ebp
  40a6cb:	5d                   	pop    ebp
  40a6cc:	c3                   	ret


===== ConceptModel reader 0x004066D0..0x00406F18 =====

/mnt/data/IS2_original_binaries/IS.exe:     file format pei-i386


Disassembly of section .text:

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
  406701:	ff 15 78 91 41 00    	call   DWORD PTR ds:0x419178
  406707:	8b f8                	mov    edi,eax
  406709:	8b ce                	mov    ecx,esi
  40670b:	6a 00                	push   0x0
  40670d:	89 7d e8             	mov    DWORD PTR [ebp-0x18],edi
  406710:	ff 15 f4 90 41 00    	call   DWORD PTR ds:0x4190f4
  406716:	6a 00                	push   0x0
  406718:	8b ce                	mov    ecx,esi
  40671a:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
  40671d:	ff 15 f8 90 41 00    	call   DWORD PTR ds:0x4190f8
  406723:	8b 1d a8 93 41 00    	mov    ebx,DWORD PTR ds:0x4193a8
  406729:	6a 02                	push   0x2
  40672b:	68 ac 7b 45 00       	push   0x457bac
  406730:	89 45 bc             	mov    DWORD PTR [ebp-0x44],eax
  406733:	ff d3                	call   ebx
  406735:	83 c4 08             	add    esp,0x8
  406738:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
  40673b:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
  40673e:	8d 45 dc             	lea    eax,[ebp-0x24]
  406741:	8b 35 8c 9b 41 00    	mov    esi,DWORD PTR ds:0x419b8c
  406747:	50                   	push   eax
  406748:	8d 45 e0             	lea    eax,[ebp-0x20]
  40674b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
  406752:	50                   	push   eax
  406753:	ff d6                	call   esi
  406755:	8d 4d dc             	lea    ecx,[ebp-0x24]
  406758:	c6 45 fc 02          	mov    BYTE PTR [ebp-0x4],0x2
  40675c:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  406762:	8d 45 e0             	lea    eax,[ebp-0x20]
  406765:	57                   	push   edi
  406766:	50                   	push   eax
  406767:	e8 44 fe ff ff       	call   0x4065b0
  40676c:	6a 07                	push   0x7
  40676e:	68 a0 7b 45 00       	push   0x457ba0
  406773:	ff d3                	call   ebx
  406775:	83 c4 10             	add    esp,0x10
  406778:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
  40677b:	8d 45 d8             	lea    eax,[ebp-0x28]
  40677e:	c6 45 fc 03          	mov    BYTE PTR [ebp-0x4],0x3
  406782:	50                   	push   eax
  406783:	8d 45 c8             	lea    eax,[ebp-0x38]
  406786:	50                   	push   eax
  406787:	8d 4d e0             	lea    ecx,[ebp-0x20]
  40678a:	ff d6                	call   esi
  40678c:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40678f:	c6 45 fc 04          	mov    BYTE PTR [ebp-0x4],0x4
  406793:	51                   	push   ecx
  406794:	8b c8                	mov    ecx,eax
  406796:	ff 15 5c 9b 41 00    	call   DWORD PTR ds:0x419b5c
  40679c:	8d 4d c8             	lea    ecx,[ebp-0x38]
  40679f:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  4067a5:	8d 4d d8             	lea    ecx,[ebp-0x28]
  4067a8:	c6 45 fc 07          	mov    BYTE PTR [ebp-0x4],0x7
  4067ac:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  4067b2:	33 db                	xor    ebx,ebx
  4067b4:	8d 4d f0             	lea    ecx,[ebp-0x10]
  4067b7:	89 5d d0             	mov    DWORD PTR [ebp-0x30],ebx
  4067ba:	ff 15 70 9b 41 00    	call   DWORD PTR ds:0x419b70
  4067c0:	8b 35 64 9b 41 00    	mov    esi,DWORD PTR ds:0x419b64
  4067c6:	85 c0                	test   eax,eax
  4067c8:	0f 8e 86 01 00 00    	jle    0x406954
  4067ce:	66 90                	xchg   ax,ax
  4067d0:	53                   	push   ebx
  4067d1:	8d 45 c4             	lea    eax,[ebp-0x3c]
  4067d4:	50                   	push   eax
  4067d5:	8d 4d f0             	lea    ecx,[ebp-0x10]
  4067d8:	ff 15 6c 9b 41 00    	call   DWORD PTR ds:0x419b6c
  4067de:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  4067e1:	c6 45 fc 08          	mov    BYTE PTR [ebp-0x4],0x8
  4067e5:	51                   	push   ecx
  4067e6:	8b c8                	mov    ecx,eax
  4067e8:	ff d6                	call   esi
  4067ea:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  4067ed:	c6 45 fc 0a          	mov    BYTE PTR [ebp-0x4],0xa
  4067f1:	ff 15 50 9b 41 00    	call   DWORD PTR ds:0x419b50
  4067f7:	6a 08                	push   0x8
  4067f9:	e8 8b df 00 00       	call   0x414789
  4067fe:	8b d8                	mov    ebx,eax
  406800:	83 c4 04             	add    esp,0x4
  406803:	89 5d b8             	mov    DWORD PTR [ebp-0x48],ebx
  406806:	c6 45 fc 0b          	mov    BYTE PTR [ebp-0x4],0xb
  40680a:	85 db                	test   ebx,ebx
  40680c:	74 10                	je     0x40681e
  40680e:	8b cb                	mov    ecx,ebx
  406810:	ff 15 84 91 41 00    	call   DWORD PTR ds:0x419184
  406816:	c7 03 a4 79 45 00    	mov    DWORD PTR [ebx],0x4579a4
  40681c:	eb 02                	jmp    0x406820
  40681e:	33 db                	xor    ebx,ebx
  406820:	8d 45 d4             	lea    eax,[ebp-0x2c]
  406823:	c6 45 fc 0a          	mov    BYTE PTR [ebp-0x4],0xa
  406827:	53                   	push   ebx
  406828:	50                   	push   eax
  406829:	e8 32 2c 00 00       	call   0x409460
  40682e:	8b 7f 04             	mov    edi,DWORD PTR [edi+0x4]
  406831:	8d 4d dc             	lea    ecx,[ebp-0x24]
  406834:	83 c4 08             	add    esp,0x8
  406837:	89 5d dc             	mov    DWORD PTR [ebp-0x24],ebx
  40683a:	8b 47 18             	mov    eax,DWORD PTR [edi+0x18]
  40683d:	3b c8                	cmp    ecx,eax
  40683f:	73 78                	jae    0x4068b9
  406841:	8b 77 14             	mov    esi,DWORD PTR [edi+0x14]
  406844:	3b f1                	cmp    esi,ecx
  406846:	77 71                	ja     0x4068b9
  406848:	8b 5f 1c             	mov    ebx,DWORD PTR [edi+0x1c]
  40684b:	8b d1                	mov    edx,ecx
  40684d:	2b d6                	sub    edx,esi
  40684f:	c1 fa 02             	sar    edx,0x2
  406852:	89 55 c0             	mov    DWORD PTR [ebp-0x40],edx
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
  40687a:	2b 5f 14             	sub    ebx,DWORD PTR [edi+0x14]
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
  4068a5:	8b 55 c0             	mov    edx,DWORD PTR [ebp-0x40]
  4068a8:	8b 4f 18             	mov    ecx,DWORD PTR [edi+0x18]
  4068ab:	8b 47 14             	mov    eax,DWORD PTR [edi+0x14]
  4068ae:	85 c9                	test   ecx,ecx
  4068b0:	74 64                	je     0x406916
  4068b2:	8b 04 90             	mov    eax,DWORD PTR [eax+edx*4]
  4068b5:	89 01                	mov    DWORD PTR [ecx],eax
  4068b7:	eb 5d                	jmp    0x406916
  4068b9:	8b 57 1c             	mov    edx,DWORD PTR [edi+0x1c]
  4068bc:	3b c2                	cmp    eax,edx
  4068be:	75 4d                	jne    0x40690d
  4068c0:	8b ca                	mov    ecx,edx
  4068c2:	2b c8                	sub    ecx,eax
  4068c4:	c1 f9 02             	sar    ecx,0x2
  4068c7:	83 f9 01             	cmp    ecx,0x1
  4068ca:	73 41                	jae    0x40690d
  4068cc:	2b 47 14             	sub    eax,DWORD PTR [edi+0x14]
  4068cf:	b9 ff ff ff 3f       	mov    ecx,0x3fffffff
  4068d4:	c1 f8 02             	sar    eax,0x2
  4068d7:	2b c8                	sub    ecx,eax
  4068d9:	83 f9 01             	cmp    ecx,0x1
  4068dc:	72 6b                	jb     0x406949
  4068de:	2b 57 14             	sub    edx,DWORD PTR [edi+0x14]
  4068e1:	8d 70 01             	lea    esi,[eax+0x1]
  4068e4:	c1 fa 02             	sar    edx,0x2
  4068e7:	b9 ff ff ff 3f       	mov    ecx,0x3fffffff
  4068ec:	8b c2                	mov    eax,edx
  4068ee:	89 55 c0             	mov    DWORD PTR [ebp-0x40],edx
  4068f1:	d1 e8                	shr    eax,1
  4068f3:	2b c8                	sub    ecx,eax
  4068f5:	03 c2                	add    eax,edx
  4068f7:	33 d2                	xor    edx,edx
  4068f9:	3b 4d c0             	cmp    ecx,DWORD PTR [ebp-0x40]
  4068fc:	8d 4f 14             	lea    ecx,[edi+0x14]
  4068ff:	0f 43 d0             	cmovae edx,eax
  406902:	3b d6                	cmp    edx,esi
  406904:	0f 43 f2             	cmovae esi,edx
  406907:	56                   	push   esi
  406908:	e8 53 df ff ff       	call   0x404860
  40690d:	8b 47 18             	mov    eax,DWORD PTR [edi+0x18]
  406910:	85 c0                	test   eax,eax
  406912:	74 02                	je     0x406916
  406914:	89 18                	mov    DWORD PTR [eax],ebx
  406916:	83 47 18 04          	add    DWORD PTR [edi+0x18],0x4
  40691a:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  40691d:	c6 45 fc 07          	mov    BYTE PTR [ebp-0x4],0x7
  406921:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  406927:	8b 5d d0             	mov    ebx,DWORD PTR [ebp-0x30]
  40692a:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40692d:	43                   	inc    ebx
  40692e:	89 5d d0             	mov    DWORD PTR [ebp-0x30],ebx
  406931:	ff 15 70 9b 41 00    	call   DWORD PTR ds:0x419b70
  406937:	8b 35 64 9b 41 00    	mov    esi,DWORD PTR ds:0x419b64
  40693d:	3b d8                	cmp    ebx,eax
  40693f:	7d 13                	jge    0x406954
  406941:	8b 7d e8             	mov    edi,DWORD PTR [ebp-0x18]
  406944:	e9 87 fe ff ff       	jmp    0x4067d0
  406949:	68 40 7c 45 00       	push   0x457c40
  40694e:	ff 15 b8 91 41 00    	call   DWORD PTR ds:0x4191b8
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
  406a5f:	8b 1d a8 93 41 00    	mov    ebx,DWORD PTR ds:0x4193a8
  406a65:	6a 03                	push   0x3
  406a67:	68 a8 7b 45 00       	push   0x457ba8
  406a6c:	ff d3                	call   ebx
  406a6e:	83 c4 08             	add    esp,0x8
  406a71:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
  406a74:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
  406a77:	8d 45 d0             	lea    eax,[ebp-0x30]
  406a7a:	50                   	push   eax
  406a7b:	8d 45 e4             	lea    eax,[ebp-0x1c]
  406a7e:	c6 45 fc 13          	mov    BYTE PTR [ebp-0x4],0x13
  406a82:	50                   	push   eax
  406a83:	ff 15 8c 9b 41 00    	call   DWORD PTR ds:0x419b8c
  406a89:	8d 4d d0             	lea    ecx,[ebp-0x30]
  406a8c:	c6 45 fc 15          	mov    BYTE PTR [ebp-0x4],0x15
  406a90:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  406a96:	8b 7d ec             	mov    edi,DWORD PTR [ebp-0x14]
  406a99:	8b cf                	mov    ecx,edi
  406a9b:	ff 15 40 91 41 00    	call   DWORD PTR ds:0x419140
  406aa1:	6a 07                	push   0x7
  406aa3:	68 d0 7b 45 00       	push   0x457bd0
  406aa8:	ff d3                	call   ebx
  406aaa:	83 c4 08             	add    esp,0x8
  406aad:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
  406ab0:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  406ab3:	ff 15 d8 93 41 00    	call   DWORD PTR ds:0x4193d8
  406ab9:	50                   	push   eax
  406aba:	8d 45 d4             	lea    eax,[ebp-0x2c]
  406abd:	c6 45 fc 17          	mov    BYTE PTR [ebp-0x4],0x17
  406ac1:	50                   	push   eax
  406ac2:	8d 45 c0             	lea    eax,[ebp-0x40]
  406ac5:	50                   	push   eax
  406ac6:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  406ac9:	ff 15 7c 9b 41 00    	call   DWORD PTR ds:0x419b7c
  406acf:	8b 77 0c             	mov    esi,DWORD PTR [edi+0xc]
  406ad2:	8b c8                	mov    ecx,eax
  406ad4:	6a 0a                	push   0xa
  406ad6:	6a 00                	push   0x0
  406ad8:	c6 45 fc 18          	mov    BYTE PTR [ebp-0x4],0x18
  406adc:	ff 15 d0 92 41 00    	call   DWORD PTR ds:0x4192d0
  406ae2:	8d 4d c0             	lea    ecx,[ebp-0x40]
  406ae5:	89 46 24             	mov    DWORD PTR [esi+0x24],eax
  406ae8:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  406aee:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  406af1:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  406af7:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  406afa:	c6 45 fc 15          	mov    BYTE PTR [ebp-0x4],0x15
  406afe:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  406b04:	6a 07                	push   0x7
  406b06:	68 a0 7b 45 00       	push   0x457ba0
  406b0b:	ff d3                	call   ebx
  406b0d:	83 c4 08             	add    esp,0x8
  406b10:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
  406b13:	8d 45 d4             	lea    eax,[ebp-0x2c]
  406b16:	c6 45 fc 19          	mov    BYTE PTR [ebp-0x4],0x19
  406b1a:	50                   	push   eax
  406b1b:	8d 45 c4             	lea    eax,[ebp-0x3c]
  406b1e:	50                   	push   eax
  406b1f:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  406b22:	ff 15 8c 9b 41 00    	call   DWORD PTR ds:0x419b8c
  406b28:	8d 4d c0             	lea    ecx,[ebp-0x40]
  406b2b:	c6 45 fc 1a          	mov    BYTE PTR [ebp-0x4],0x1a
  406b2f:	51                   	push   ecx
  406b30:	8b c8                	mov    ecx,eax
  406b32:	ff 15 5c 9b 41 00    	call   DWORD PTR ds:0x419b5c
  406b38:	50                   	push   eax
  406b39:	8d 4d f0             	lea    ecx,[ebp-0x10]
  406b3c:	c6 45 fc 1b          	mov    BYTE PTR [ebp-0x4],0x1b
  406b40:	ff 15 90 9b 41 00    	call   DWORD PTR ds:0x419b90
  406b46:	8d 4d c0             	lea    ecx,[ebp-0x40]
  406b49:	ff 15 68 9b 41 00    	call   DWORD PTR ds:0x419b68
  406b4f:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  406b52:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  406b58:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  406b5b:	c6 45 fc 15          	mov    BYTE PTR [ebp-0x4],0x15
  406b5f:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  406b65:	33 db                	xor    ebx,ebx
  406b67:	8d 4d f0             	lea    ecx,[ebp-0x10]
  406b6a:	89 5d d8             	mov    DWORD PTR [ebp-0x28],ebx
  406b6d:	ff 15 70 9b 41 00    	call   DWORD PTR ds:0x419b70
  406b73:	85 c0                	test   eax,eax
  406b75:	0f 8e 7a 01 00 00    	jle    0x406cf5
  406b7b:	0f 1f 44 00 00       	nop    DWORD PTR [eax+eax*1+0x0]
  406b80:	53                   	push   ebx
  406b81:	8d 45 c0             	lea    eax,[ebp-0x40]
  406b84:	50                   	push   eax
  406b85:	8d 4d f0             	lea    ecx,[ebp-0x10]
  406b88:	ff 15 6c 9b 41 00    	call   DWORD PTR ds:0x419b6c
  406b8e:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  406b91:	c6 45 fc 1c          	mov    BYTE PTR [ebp-0x4],0x1c
  406b95:	51                   	push   ecx
  406b96:	8b c8                	mov    ecx,eax
  406b98:	ff 15 64 9b 41 00    	call   DWORD PTR ds:0x419b64
  406b9e:	8d 4d c0             	lea    ecx,[ebp-0x40]
  406ba1:	c6 45 fc 1e          	mov    BYTE PTR [ebp-0x4],0x1e
  406ba5:	ff 15 50 9b 41 00    	call   DWORD PTR ds:0x419b50
  406bab:	6a 14                	push   0x14
  406bad:	e8 d7 db 00 00       	call   0x414789
  406bb2:	8b d8                	mov    ebx,eax
  406bb4:	83 c4 04             	add    esp,0x4
  406bb7:	89 5d b8             	mov    DWORD PTR [ebp-0x48],ebx
  406bba:	c6 45 fc 1f          	mov    BYTE PTR [ebp-0x4],0x1f
  406bbe:	85 db                	test   ebx,ebx
  406bc0:	74 10                	je     0x406bd2
  406bc2:	8b cb                	mov    ecx,ebx
  406bc4:	ff 15 7c 91 41 00    	call   DWORD PTR ds:0x41917c
  406bca:	c7 03 88 79 45 00    	mov    DWORD PTR [ebx],0x457988
  406bd0:	eb 02                	jmp    0x406bd4
  406bd2:	33 db                	xor    ebx,ebx
  406bd4:	8d 45 d4             	lea    eax,[ebp-0x2c]
  406bd7:	c6 45 fc 1e          	mov    BYTE PTR [ebp-0x4],0x1e
  406bdb:	53                   	push   ebx
  406bdc:	50                   	push   eax
  406bdd:	e8 4e f3 ff ff       	call   0x405f30
  406be2:	8b 7f 0c             	mov    edi,DWORD PTR [edi+0xc]
  406be5:	8d 45 dc             	lea    eax,[ebp-0x24]
  406be8:	83 c4 08             	add    esp,0x8
  406beb:	89 5d dc             	mov    DWORD PTR [ebp-0x24],ebx
  406bee:	8b 77 08             	mov    esi,DWORD PTR [edi+0x8]
  406bf1:	3b c6                	cmp    eax,esi
  406bf3:	73 73                	jae    0x406c68
  406bf5:	8b 4f 04             	mov    ecx,DWORD PTR [edi+0x4]
  406bf8:	3b c8                	cmp    ecx,eax
  406bfa:	77 6c                	ja     0x406c68
  406bfc:	8b 5f 0c             	mov    ebx,DWORD PTR [edi+0xc]
  406bff:	2b c1                	sub    eax,ecx
  406c01:	c1 f8 02             	sar    eax,0x2
  406c04:	89 45 c4             	mov    DWORD PTR [ebp-0x3c],eax
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
  406c54:	8b 57 08             	mov    edx,DWORD PTR [edi+0x8]
  406c57:	8b 47 04             	mov    eax,DWORD PTR [edi+0x4]
  406c5a:	8b 4d c4             	mov    ecx,DWORD PTR [ebp-0x3c]
  406c5d:	85 d2                	test   edx,edx
  406c5f:	74 67                	je     0x406cc8
  406c61:	8b 04 88             	mov    eax,DWORD PTR [eax+ecx*4]
  406c64:	89 02                	mov    DWORD PTR [edx],eax
  406c66:	eb 60                	jmp    0x406cc8
  406c68:	8b 57 0c             	mov    edx,DWORD PTR [edi+0xc]
  406c6b:	3b f2                	cmp    esi,edx
  406c6d:	75 50                	jne    0x406cbf
  406c6f:	8b c2                	mov    eax,edx
  406c71:	2b c6                	sub    eax,esi
  406c73:	c1 f8 02             	sar    eax,0x2
  406c76:	83 f8 01             	cmp    eax,0x1
  406c79:	73 44                	jae    0x406cbf
  406c7b:	8b 4f 04             	mov    ecx,DWORD PTR [edi+0x4]
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
  406ca0:	89 55 c4             	mov    DWORD PTR [ebp-0x3c],edx
  406ca3:	d1 e8                	shr    eax,1
  406ca5:	2b c8                	sub    ecx,eax
  406ca7:	03 c2                	add    eax,edx
  406ca9:	33 d2                	xor    edx,edx
  406cab:	3b 4d c4             	cmp    ecx,DWORD PTR [ebp-0x3c]
  406cae:	8d 4f 04             	lea    ecx,[edi+0x4]
  406cb1:	0f 43 d0             	cmovae edx,eax
  406cb4:	3b d6                	cmp    edx,esi
  406cb6:	0f 43 f2             	cmovae esi,edx
  406cb9:	56                   	push   esi
  406cba:	e8 a1 db ff ff       	call   0x404860
  406cbf:	8b 47 08             	mov    eax,DWORD PTR [edi+0x8]
  406cc2:	85 c0                	test   eax,eax
  406cc4:	74 02                	je     0x406cc8
  406cc6:	89 18                	mov    DWORD PTR [eax],ebx
  406cc8:	83 47 08 04          	add    DWORD PTR [edi+0x8],0x4
  406ccc:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  406ccf:	c6 45 fc 15          	mov    BYTE PTR [ebp-0x4],0x15
  406cd3:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  406cd9:	8b 5d d8             	mov    ebx,DWORD PTR [ebp-0x28]
  406cdc:	8d 4d f0             	lea    ecx,[ebp-0x10]
  406cdf:	43                   	inc    ebx
  406ce0:	89 5d d8             	mov    DWORD PTR [ebp-0x28],ebx
  406ce3:	ff 15 70 9b 41 00    	call   DWORD PTR ds:0x419b70
  406ce9:	3b d8                	cmp    ebx,eax
  406ceb:	7d 08                	jge    0x406cf5
  406ced:	8b 7d ec             	mov    edi,DWORD PTR [ebp-0x14]
  406cf0:	e9 8b fe ff ff       	jmp    0x406b80
  406cf5:	a1 a8 93 41 00       	mov    eax,ds:0x4193a8
  406cfa:	6a 05                	push   0x5
  406cfc:	68 6c 7b 45 00       	push   0x457b6c
  406d01:	ff d0                	call   eax
  406d03:	83 c4 08             	add    esp,0x8
  406d06:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
  406d09:	8d 45 d4             	lea    eax,[ebp-0x2c]
  406d0c:	c6 45 fc 20          	mov    BYTE PTR [ebp-0x4],0x20
  406d10:	50                   	push   eax
  406d11:	8d 45 c4             	lea    eax,[ebp-0x3c]
  406d14:	50                   	push   eax
  406d15:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  406d18:	ff 15 8c 9b 41 00    	call   DWORD PTR ds:0x419b8c
  406d1e:	8d 4d c0             	lea    ecx,[ebp-0x40]
  406d21:	c6 45 fc 21          	mov    BYTE PTR [ebp-0x4],0x21
  406d25:	51                   	push   ecx
  406d26:	8b c8                	mov    ecx,eax
  406d28:	ff 15 5c 9b 41 00    	call   DWORD PTR ds:0x419b5c
  406d2e:	50                   	push   eax
  406d2f:	8d 4d f0             	lea    ecx,[ebp-0x10]
  406d32:	c6 45 fc 22          	mov    BYTE PTR [ebp-0x4],0x22
  406d36:	ff 15 90 9b 41 00    	call   DWORD PTR ds:0x419b90
  406d3c:	8d 4d c0             	lea    ecx,[ebp-0x40]
  406d3f:	ff 15 68 9b 41 00    	call   DWORD PTR ds:0x419b68
  406d45:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  406d48:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  406d4e:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  406d51:	c6 45 fc 15          	mov    BYTE PTR [ebp-0x4],0x15
  406d55:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  406d5b:	8b 1d 70 9b 41 00    	mov    ebx,DWORD PTR ds:0x419b70
  406d61:	8d 4d f0             	lea    ecx,[ebp-0x10]
  406d64:	33 ff                	xor    edi,edi
  406d66:	ff d3                	call   ebx
  406d68:	85 c0                	test   eax,eax
  406d6a:	0f 8e 8d 00 00 00    	jle    0x406dfd
  406d70:	57                   	push   edi
  406d71:	8d 45 c0             	lea    eax,[ebp-0x40]
  406d74:	50                   	push   eax
  406d75:	8d 4d f0             	lea    ecx,[ebp-0x10]
  406d78:	ff 15 6c 9b 41 00    	call   DWORD PTR ds:0x419b6c
  406d7e:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  406d81:	c6 45 fc 23          	mov    BYTE PTR [ebp-0x4],0x23
  406d85:	51                   	push   ecx
  406d86:	8b c8                	mov    ecx,eax
  406d88:	ff 15 64 9b 41 00    	call   DWORD PTR ds:0x419b64
  406d8e:	8d 4d c0             	lea    ecx,[ebp-0x40]
  406d91:	c6 45 fc 25          	mov    BYTE PTR [ebp-0x4],0x25
  406d95:	ff 15 50 9b 41 00    	call   DWORD PTR ds:0x419b50
  406d9b:	6a 30                	push   0x30
  406d9d:	e8 e7 d9 00 00       	call   0x414789
  406da2:	8b f0                	mov    esi,eax
  406da4:	83 c4 04             	add    esp,0x4
  406da7:	89 75 b8             	mov    DWORD PTR [ebp-0x48],esi
  406daa:	c6 45 fc 26          	mov    BYTE PTR [ebp-0x4],0x26
  406dae:	85 f6                	test   esi,esi
  406db0:	74 10                	je     0x406dc2
  406db2:	8b ce                	mov    ecx,esi
  406db4:	ff 15 c0 90 41 00    	call   DWORD PTR ds:0x4190c0
  406dba:	c7 06 5c 79 45 00    	mov    DWORD PTR [esi],0x45795c
  406dc0:	eb 02                	jmp    0x406dc4
  406dc2:	33 f6                	xor    esi,esi
  406dc4:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
  406dc7:	8d 45 d4             	lea    eax,[ebp-0x2c]
  406dca:	c6 45 fc 25          	mov    BYTE PTR [ebp-0x4],0x25
  406dce:	56                   	push   esi
  406dcf:	50                   	push   eax
  406dd0:	e8 9b ef ff ff       	call   0x405d70
  406dd5:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
  406dd8:	83 c4 0c             	add    esp,0xc
  406ddb:	56                   	push   esi
  406ddc:	ff 15 30 91 41 00    	call   DWORD PTR ds:0x419130
  406de2:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  406de5:	c6 45 fc 15          	mov    BYTE PTR [ebp-0x4],0x15
  406de9:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  406def:	8d 4d f0             	lea    ecx,[ebp-0x10]
  406df2:	47                   	inc    edi
  406df3:	ff d3                	call   ebx
  406df5:	3b f8                	cmp    edi,eax
  406df7:	0f 8c 73 ff ff ff    	jl     0x406d70
  406dfd:	6a 07                	push   0x7
  406dff:	68 b0 7b 45 00       	push   0x457bb0
  406e04:	ff 15 a8 93 41 00    	call   DWORD PTR ds:0x4193a8
  406e0a:	83 c4 08             	add    esp,0x8
  406e0d:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
  406e10:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
  406e13:	8d 45 d4             	lea    eax,[ebp-0x2c]
  406e16:	50                   	push   eax
  406e17:	8d 45 cc             	lea    eax,[ebp-0x34]
  406e1a:	c6 45 fc 27          	mov    BYTE PTR [ebp-0x4],0x27
  406e1e:	50                   	push   eax
  406e1f:	ff 15 8c 9b 41 00    	call   DWORD PTR ds:0x419b8c
  406e25:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  406e28:	c6 45 fc 29          	mov    BYTE PTR [ebp-0x4],0x29
  406e2c:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  406e32:	8d 45 c0             	lea    eax,[ebp-0x40]
  406e35:	50                   	push   eax
  406e36:	8d 4d cc             	lea    ecx,[ebp-0x34]
  406e39:	ff 15 5c 9b 41 00    	call   DWORD PTR ds:0x419b5c
  406e3f:	50                   	push   eax
  406e40:	8d 4d f0             	lea    ecx,[ebp-0x10]
  406e43:	c6 45 fc 2a          	mov    BYTE PTR [ebp-0x4],0x2a
  406e47:	ff 15 90 9b 41 00    	call   DWORD PTR ds:0x419b90
  406e4d:	8d 4d c0             	lea    ecx,[ebp-0x40]
  406e50:	c6 45 fc 29          	mov    BYTE PTR [ebp-0x4],0x29
  406e54:	ff 15 68 9b 41 00    	call   DWORD PTR ds:0x419b68
  406e5a:	8d 4d f0             	lea    ecx,[ebp-0x10]
  406e5d:	33 f6                	xor    esi,esi
  406e5f:	ff d3                	call   ebx
  406e61:	85 c0                	test   eax,eax
  406e63:	7e 65                	jle    0x406eca
  406e65:	8b 3d e0 90 41 00    	mov    edi,DWORD PTR ds:0x4190e0
  406e6b:	0f 1f 44 00 00       	nop    DWORD PTR [eax+eax*1+0x0]
  406e70:	56                   	push   esi
  406e71:	8d 45 c0             	lea    eax,[ebp-0x40]
  406e74:	50                   	push   eax
  406e75:	8d 4d f0             	lea    ecx,[ebp-0x10]
  406e78:	ff 15 6c 9b 41 00    	call   DWORD PTR ds:0x419b6c
  406e7e:	8d 4d d0             	lea    ecx,[ebp-0x30]
  406e81:	c6 45 fc 2b          	mov    BYTE PTR [ebp-0x4],0x2b
  406e85:	51                   	push   ecx
  406e86:	8b c8                	mov    ecx,eax
  406e88:	ff 15 64 9b 41 00    	call   DWORD PTR ds:0x419b64
  406e8e:	8d 4d c0             	lea    ecx,[ebp-0x40]
  406e91:	c6 45 fc 2d          	mov    BYTE PTR [ebp-0x4],0x2d
  406e95:	ff 15 50 9b 41 00    	call   DWORD PTR ds:0x419b50
  406e9b:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
  406e9e:	8b 4d bc             	mov    ecx,DWORD PTR [ebp-0x44]
  406ea1:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
  406ea4:	ff d7                	call   edi
  406ea6:	50                   	push   eax
  406ea7:	8d 45 d0             	lea    eax,[ebp-0x30]
  406eaa:	50                   	push   eax
  406eab:	e8 30 eb ff ff       	call   0x4059e0
  406eb0:	83 c4 10             	add    esp,0x10
  406eb3:	c6 45 fc 29          	mov    BYTE PTR [ebp-0x4],0x29
  406eb7:	8d 4d d0             	lea    ecx,[ebp-0x30]
  406eba:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  406ec0:	8d 4d f0             	lea    ecx,[ebp-0x10]
  406ec3:	46                   	inc    esi
  406ec4:	ff d3                	call   ebx
  406ec6:	3b f0                	cmp    esi,eax
  406ec8:	7c a6                	jl     0x406e70
  406eca:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  406ed0:	6a 00                	push   0x0
  406ed2:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
  406ed5:	ff 15 f4 90 41 00    	call   DWORD PTR ds:0x4190f4
  406edb:	8b c8                	mov    ecx,eax
  406edd:	ff 15 3c 91 41 00    	call   DWORD PTR ds:0x41913c
  406ee3:	8d 4d cc             	lea    ecx,[ebp-0x34]
  406ee6:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  406eec:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  406eef:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  406ef5:	8d 4d f0             	lea    ecx,[ebp-0x10]
  406ef8:	ff 15 68 9b 41 00    	call   DWORD PTR ds:0x419b68
  406efe:	8d 4d e0             	lea    ecx,[ebp-0x20]
  406f01:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  406f07:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
  406f0a:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  406f11:	59                   	pop    ecx
  406f12:	5f                   	pop    edi
  406f13:	5e                   	pop    esi
  406f14:	5b                   	pop    ebx
  406f15:	8b e5                	mov    esp,ebp
  406f17:	5d                   	pop    ebp
  406f18:	c3                   	ret


===== cs counters reader 0x004065B0..0x004066C5 =====

/mnt/data/IS2_original_binaries/IS.exe:     file format pei-i386


Disassembly of section .text:

004065b0 <.text+0x55b0>:
  4065b0:	55                   	push   ebp
  4065b1:	8b ec                	mov    ebp,esp
  4065b3:	6a ff                	push   0xffffffff
  4065b5:	68 46 62 41 00       	push   0x416246
  4065ba:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  4065c0:	50                   	push   eax
  4065c1:	83 ec 14             	sub    esp,0x14
  4065c4:	53                   	push   ebx
  4065c5:	56                   	push   esi
  4065c6:	a1 cc 90 46 00       	mov    eax,ds:0x4690cc
  4065cb:	33 c5                	xor    eax,ebp
  4065cd:	50                   	push   eax
  4065ce:	8d 45 f4             	lea    eax,[ebp-0xc]
  4065d1:	64 a3 00 00 00 00    	mov    fs:0x0,eax
  4065d7:	6a 0c                	push   0xc
  4065d9:	68 e4 7b 45 00       	push   0x457be4
  4065de:	ff 15 a8 93 41 00    	call   DWORD PTR ds:0x4193a8
  4065e4:	83 c4 08             	add    esp,0x8
  4065e7:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
  4065ea:	8d 4d e8             	lea    ecx,[ebp-0x18]
  4065ed:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
  4065f4:	ff 15 d8 93 41 00    	call   DWORD PTR ds:0x4193d8
  4065fa:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  4065fd:	50                   	push   eax
  4065fe:	8d 45 f0             	lea    eax,[ebp-0x10]
  406601:	c6 45 fc 01          	mov    BYTE PTR [ebp-0x4],0x1
  406605:	50                   	push   eax
  406606:	8d 45 ec             	lea    eax,[ebp-0x14]
  406609:	50                   	push   eax
  40660a:	ff 15 7c 9b 41 00    	call   DWORD PTR ds:0x419b7c
  406610:	8b 5d 0c             	mov    ebx,DWORD PTR [ebp+0xc]
  406613:	8b c8                	mov    ecx,eax
  406615:	6a 0a                	push   0xa
  406617:	6a 00                	push   0x0
  406619:	c6 45 fc 02          	mov    BYTE PTR [ebp-0x4],0x2
  40661d:	8b 73 04             	mov    esi,DWORD PTR [ebx+0x4]
  406620:	ff 15 d0 92 41 00    	call   DWORD PTR ds:0x4192d0
  406626:	8d 4d ec             	lea    ecx,[ebp-0x14]
  406629:	89 46 0c             	mov    DWORD PTR [esi+0xc],eax
  40662c:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  406632:	8d 4d e8             	lea    ecx,[ebp-0x18]
  406635:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40663b:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40663e:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
  406645:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40664b:	6a 0c                	push   0xc
  40664d:	68 f4 7b 45 00       	push   0x457bf4
  406652:	ff 15 a8 93 41 00    	call   DWORD PTR ds:0x4193a8
  406658:	83 c4 08             	add    esp,0x8
  40665b:	89 45 0c             	mov    DWORD PTR [ebp+0xc],eax
  40665e:	8d 4d e0             	lea    ecx,[ebp-0x20]
  406661:	c7 45 fc 03 00 00 00 	mov    DWORD PTR [ebp-0x4],0x3
  406668:	ff 15 d8 93 41 00    	call   DWORD PTR ds:0x4193d8
  40666e:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  406671:	50                   	push   eax
  406672:	8d 45 0c             	lea    eax,[ebp+0xc]
  406675:	c6 45 fc 04          	mov    BYTE PTR [ebp-0x4],0x4
  406679:	50                   	push   eax
  40667a:	8d 45 e4             	lea    eax,[ebp-0x1c]
  40667d:	50                   	push   eax
  40667e:	ff 15 7c 9b 41 00    	call   DWORD PTR ds:0x419b7c
  406684:	8b 73 04             	mov    esi,DWORD PTR [ebx+0x4]
  406687:	8b c8                	mov    ecx,eax
  406689:	6a 0a                	push   0xa
  40668b:	6a 00                	push   0x0
  40668d:	c6 45 fc 05          	mov    BYTE PTR [ebp-0x4],0x5
  406691:	ff 15 d0 92 41 00    	call   DWORD PTR ds:0x4192d0
  406697:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  40669a:	89 46 10             	mov    DWORD PTR [esi+0x10],eax
  40669d:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  4066a3:	8d 4d e0             	lea    ecx,[ebp-0x20]
  4066a6:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  4066ac:	8d 4d 0c             	lea    ecx,[ebp+0xc]
  4066af:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  4066b5:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
  4066b8:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  4066bf:	59                   	pop    ecx
  4066c0:	5e                   	pop    esi
  4066c1:	5b                   	pop    ebx
  4066c2:	8b e5                	mov    esp,ebp
  4066c4:	5d                   	pop    ebp
  4066c5:	c3                   	ret


===== SCBinaryLink reader 0x00406380..0x004065A4 =====

/mnt/data/IS2_original_binaries/IS.exe:     file format pei-i386


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


===== SCBinaryLink writer helper 0x0040A510..0x0040A5A8 =====

/mnt/data/IS2_original_binaries/IS.exe:     file format pei-i386


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


===== SCBinaryLink::d_func 0x1000E980 =====

/mnt/data/IS2_original_binaries/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

1000e980 <.text+0xd980>:
1000e980:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
1000e983:	c3                   	ret


===== AIEBinaryLink::getRange 0x1000D070 =====

/mnt/data/IS2_original_binaries/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

1000d070 <.text+0xc070>:
1000d070:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
1000d073:	8b 40 2c             	mov    eax,DWORD PTR [eax+0x2c]
1000d076:	c3                   	ret


===== AIEBinaryLink::setRange 0x1000D1B0 =====

/mnt/data/IS2_original_binaries/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

1000d1b0 <.text+0xc1b0>:
1000d1b0:	55                   	push   ebp
1000d1b1:	8b ec                	mov    ebp,esp
1000d1b3:	8b 49 04             	mov    ecx,DWORD PTR [ecx+0x4]
1000d1b6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000d1b9:	89 41 2c             	mov    DWORD PTR [ecx+0x2c],eax
1000d1bc:	5d                   	pop    ebp
1000d1bd:	c2                   	.byte 0xc2


===== ConceptStructure::addArragmentLink 0x1000F9B0 =====

/mnt/data/IS2_original_binaries/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

1000f9b0 <.text+0xe9b0>:
1000f9b0:	55                   	push   ebp
1000f9b1:	8b ec                	mov    ebp,esp
1000f9b3:	6a ff                	push   0xffffffff
1000f9b5:	68 7f 68 01 10       	push   0x1001687f
1000f9ba:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000f9c0:	50                   	push   eax
1000f9c1:	51                   	push   ecx
1000f9c2:	53                   	push   ebx
1000f9c3:	57                   	push   edi
1000f9c4:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000f9c9:	33 c5                	xor    eax,ebp
1000f9cb:	50                   	push   eax
1000f9cc:	8d 45 f4             	lea    eax,[ebp-0xc]
1000f9cf:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000f9d5:	8b d9                	mov    ebx,ecx
1000f9d7:	6a 30                	push   0x30
1000f9d9:	e8 12 53 00 00       	call   0x10014cf0
1000f9de:	83 c4 04             	add    esp,0x4
1000f9e1:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
1000f9e4:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000f9eb:	85 c0                	test   eax,eax
1000f9ed:	74 0b                	je     0x1000f9fa
1000f9ef:	8b c8                	mov    ecx,eax
1000f9f1:	e8 8a 0a 00 00       	call   0x10010480
1000f9f6:	8b f8                	mov    edi,eax
1000f9f8:	eb 02                	jmp    0x1000f9fc
1000f9fa:	33 ff                	xor    edi,edi
1000f9fc:	ff 75 10             	push   DWORD PTR [ebp+0x10]
1000f9ff:	8b cf                	mov    ecx,edi
1000fa01:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
1000fa08:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
1000fa0b:	ff 75 08             	push   DWORD PTR [ebp+0x8]
1000fa0e:	e8 5d 17 00 00       	call   0x10011170
1000fa13:	57                   	push   edi
1000fa14:	8b cb                	mov    ecx,ebx
1000fa16:	e8 15 e3 ff ff       	call   0x1000dd30
1000fa1b:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
1000fa1f:	8b cf                	mov    ecx,edi
1000fa21:	74 04                	je     0x1000fa27
1000fa23:	6a 63                	push   0x63
1000fa25:	eb 02                	jmp    0x1000fa29
1000fa27:	6a 01                	push   0x1
1000fa29:	e8 82 d7 ff ff       	call   0x1000d1b0
1000fa2e:	8b c7                	mov    eax,edi
1000fa30:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000fa33:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000fa3a:	59                   	pop    ecx
1000fa3b:	5f                   	pop    edi
1000fa3c:	5b                   	pop    ebx
1000fa3d:	8b e5                	mov    esp,ebp
1000fa3f:	5d                   	pop    ebp
1000fa40:	c2                   	.byte 0xc2


===== ConceptStructure::addCompositionLink 0x1000FA50 =====

/mnt/data/IS2_original_binaries/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

1000fa50 <.text+0xea50>:
1000fa50:	55                   	push   ebp
1000fa51:	8b ec                	mov    ebp,esp
1000fa53:	6a ff                	push   0xffffffff
1000fa55:	68 af 68 01 10       	push   0x100168af
1000fa5a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000fa60:	50                   	push   eax
1000fa61:	51                   	push   ecx
1000fa62:	53                   	push   ebx
1000fa63:	56                   	push   esi
1000fa64:	57                   	push   edi
1000fa65:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000fa6a:	33 c5                	xor    eax,ebp
1000fa6c:	50                   	push   eax
1000fa6d:	8d 45 f4             	lea    eax,[ebp-0xc]
1000fa70:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000fa76:	8b d9                	mov    ebx,ecx
1000fa78:	6a 30                	push   0x30
1000fa7a:	e8 71 52 00 00       	call   0x10014cf0
1000fa7f:	83 c4 04             	add    esp,0x4
1000fa82:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
1000fa85:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000fa8c:	85 c0                	test   eax,eax
1000fa8e:	74 0b                	je     0x1000fa9b
1000fa90:	8b c8                	mov    ecx,eax
1000fa92:	e8 e9 09 00 00       	call   0x10010480
1000fa97:	8b f0                	mov    esi,eax
1000fa99:	eb 02                	jmp    0x1000fa9d
1000fa9b:	33 f6                	xor    esi,esi
1000fa9d:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
1000faa0:	8b 7d 08             	mov    edi,DWORD PTR [ebp+0x8]
1000faa3:	8b ce                	mov    ecx,esi
1000faa5:	57                   	push   edi
1000faa6:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
1000faad:	e8 ce 16 00 00       	call   0x10011180
1000fab2:	56                   	push   esi
1000fab3:	8b cb                	mov    ecx,ebx
1000fab5:	e8 76 e2 ff ff       	call   0x1000dd30
1000faba:	8b cf                	mov    ecx,edi
1000fabc:	e8 7f 19 00 00       	call   0x10011440
1000fac1:	83 f8 01             	cmp    eax,0x1
1000fac4:	74 1c                	je     0x1000fae2
1000fac6:	8b cf                	mov    ecx,edi
1000fac8:	e8 73 19 00 00       	call   0x10011440
1000facd:	83 f8 03             	cmp    eax,0x3
1000fad0:	74 10                	je     0x1000fae2
1000fad2:	8b cf                	mov    ecx,edi
1000fad4:	e8 67 19 00 00       	call   0x10011440
1000fad9:	83 f8 05             	cmp    eax,0x5
1000fadc:	74 04                	je     0x1000fae2
1000fade:	6a 63                	push   0x63
1000fae0:	eb 02                	jmp    0x1000fae4
1000fae2:	6a 01                	push   0x1
1000fae4:	8b ce                	mov    ecx,esi
1000fae6:	e8 c5 d6 ff ff       	call   0x1000d1b0
1000faeb:	8b c6                	mov    eax,esi
1000faed:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000faf0:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000faf7:	59                   	pop    ecx
1000faf8:	5f                   	pop    edi
1000faf9:	5e                   	pop    esi
1000fafa:	5b                   	pop    ebx
1000fafb:	8b e5                	mov    esp,ebp
1000fafd:	5d                   	pop    ebp
1000fafe:	c2                   	.byte 0xc2


===== ConceptStructure::addOrderLink 0x1000FB10 =====

/mnt/data/IS2_original_binaries/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

1000fb10 <.text+0xeb10>:
1000fb10:	55                   	push   ebp
1000fb11:	8b ec                	mov    ebp,esp
1000fb13:	6a ff                	push   0xffffffff
1000fb15:	68 7f 68 01 10       	push   0x1001687f
1000fb1a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000fb20:	50                   	push   eax
1000fb21:	51                   	push   ecx
1000fb22:	56                   	push   esi
1000fb23:	57                   	push   edi
1000fb24:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000fb29:	33 c5                	xor    eax,ebp
1000fb2b:	50                   	push   eax
1000fb2c:	8d 45 f4             	lea    eax,[ebp-0xc]
1000fb2f:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000fb35:	8b f9                	mov    edi,ecx
1000fb37:	6a 30                	push   0x30
1000fb39:	e8 b2 51 00 00       	call   0x10014cf0
1000fb3e:	83 c4 04             	add    esp,0x4
1000fb41:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
1000fb44:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000fb4b:	85 c0                	test   eax,eax
1000fb4d:	74 0b                	je     0x1000fb5a
1000fb4f:	8b c8                	mov    ecx,eax
1000fb51:	e8 2a 09 00 00       	call   0x10010480
1000fb56:	8b f0                	mov    esi,eax
1000fb58:	eb 02                	jmp    0x1000fb5c
1000fb5a:	33 f6                	xor    esi,esi
1000fb5c:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
1000fb5f:	8b ce                	mov    ecx,esi
1000fb61:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
1000fb68:	ff 75 08             	push   DWORD PTR [ebp+0x8]
1000fb6b:	e8 20 16 00 00       	call   0x10011190
1000fb70:	56                   	push   esi
1000fb71:	8b cf                	mov    ecx,edi
1000fb73:	e8 b8 e1 ff ff       	call   0x1000dd30
1000fb78:	6a 63                	push   0x63
1000fb7a:	8b ce                	mov    ecx,esi
1000fb7c:	e8 2f d6 ff ff       	call   0x1000d1b0
1000fb81:	8b c6                	mov    eax,esi
1000fb83:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000fb86:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000fb8d:	59                   	pop    ecx
1000fb8e:	5f                   	pop    edi
1000fb8f:	5e                   	pop    esi
1000fb90:	8b e5                	mov    esp,ebp
1000fb92:	5d                   	pop    ebp
1000fb93:	c2                   	.byte 0xc2


===== SubjectCategory::getClass/getClassChar 0x10011440 =====

/mnt/data/IS2_original_binaries/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

10011440 <.text+0x10440>:
10011440:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
10011443:	8b 40 38             	mov    eax,DWORD PTR [eax+0x38]
10011446:	c3                   	ret
10011447:	cc                   	int3
10011448:	cc                   	int3
10011449:	cc                   	int3
1001144a:	cc                   	int3
1001144b:	cc                   	int3
1001144c:	cc                   	int3
1001144d:	cc                   	int3
1001144e:	cc                   	int3
1001144f:	cc                   	int3
10011450:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
10011453:	8b 40 38             	mov    eax,DWORD PTR [eax+0x38]
10011456:	48                   	dec    eax
10011457:	83 f8 06             	cmp    eax,0x6
1001145a:	77 1c                	ja     0x10011478
1001145c:	ff 24 85 7c 14 01 10 	jmp    DWORD PTR [eax*4+0x1001147c]
10011463:	b0 53                	mov    al,0x53
10011465:	c3                   	ret
10011466:	b0 50                	mov    al,0x50
10011468:	c3                   	ret
10011469:	b0 5a                	mov    al,0x5a
1001146b:	c3                   	ret
1001146c:	b0 4b                	mov    al,0x4b
1001146e:	c3                   	ret
1001146f:	b0 4f                	mov    al,0x4f
10011471:	c3                   	ret
10011472:	b0 52                	mov    al,0x52
10011474:	c3                   	ret
10011475:	b0 43                	mov    al,0x43
10011477:	c3                   	ret
10011478:	b0 2d                	mov    al,0x2d
1001147a:	c3                   	ret


===== TOP-LEVEL READER CALLER 0x00408F60..0x00409020 =====

/mnt/data/IS2_original_binaries/IS.exe:     file format pei-i386


Disassembly of section .text:

00408f60 <.text+0x7f60>:
  408f60:	dc c6                	fadd   st(6),st
  408f62:	45                   	inc    ebp
  408f63:	fc                   	cld
  408f64:	16                   	push   ss
  408f65:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  408f6b:	6a 0c                	push   0xc
  408f6d:	68 54 7a 45 00       	push   0x457a54
  408f72:	ff d3                	call   ebx
  408f74:	83 c4 08             	add    esp,0x8
  408f77:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
  408f7a:	8d 45 d8             	lea    eax,[ebp-0x28]
  408f7d:	c6 45 fc 17          	mov    BYTE PTR [ebp-0x4],0x17
  408f81:	50                   	push   eax
  408f82:	8d 45 a8             	lea    eax,[ebp-0x58]
  408f85:	50                   	push   eax
  408f86:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  408f89:	ff d7                	call   edi
  408f8b:	8d 4d d8             	lea    ecx,[ebp-0x28]
  408f8e:	c6 45 fc 19          	mov    BYTE PTR [ebp-0x4],0x19
  408f92:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  408f98:	8d 45 a8             	lea    eax,[ebp-0x58]
  408f9b:	50                   	push   eax
  408f9c:	8d 45 e8             	lea    eax,[ebp-0x18]
  408f9f:	50                   	push   eax
  408fa0:	e8 1b e2 ff ff       	call   0x4071c0
  408fa5:	6a 08                	push   0x8
  408fa7:	e8 dd b7 00 00       	call   0x414789
  408fac:	8b f0                	mov    esi,eax
  408fae:	83 c4 0c             	add    esp,0xc
  408fb1:	89 75 88             	mov    DWORD PTR [ebp-0x78],esi
  408fb4:	c6 45 fc 1a          	mov    BYTE PTR [ebp-0x4],0x1a
  408fb8:	85 f6                	test   esi,esi
  408fba:	74 10                	je     0x408fcc
  408fbc:	8b ce                	mov    ecx,esi
  408fbe:	ff 15 70 91 41 00    	call   DWORD PTR ds:0x419170
  408fc4:	c7 06 80 79 45 00    	mov    DWORD PTR [esi],0x457980
  408fca:	eb 02                	jmp    0x408fce
  408fcc:	33 f6                	xor    esi,esi
  408fce:	a1 a4 96 46 00       	mov    eax,ds:0x4696a4
  408fd3:	6a 0c                	push   0xc
  408fd5:	68 64 7a 45 00       	push   0x457a64
  408fda:	c6 45 fc 19          	mov    BYTE PTR [ebp-0x4],0x19
  408fde:	89 70 0c             	mov    DWORD PTR [eax+0xc],esi
  408fe1:	ff d3                	call   ebx
  408fe3:	83 c4 08             	add    esp,0x8
  408fe6:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
  408fe9:	8d 45 dc             	lea    eax,[ebp-0x24]
  408fec:	c6 45 fc 1b          	mov    BYTE PTR [ebp-0x4],0x1b
  408ff0:	50                   	push   eax
  408ff1:	8d 45 ac             	lea    eax,[ebp-0x54]
  408ff4:	50                   	push   eax
  408ff5:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  408ff8:	ff d7                	call   edi
  408ffa:	8d 4d dc             	lea    ecx,[ebp-0x24]
  408ffd:	c6 45 fc 1d          	mov    BYTE PTR [ebp-0x4],0x1d
  409001:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  409007:	8d 45 ac             	lea    eax,[ebp-0x54]
  40900a:	50                   	push   eax
  40900b:	8d 45 e8             	lea    eax,[ebp-0x18]
  40900e:	50                   	push   eax
  40900f:	e8 bc d6 ff ff       	call   0x4066d0
  409014:	6a 0c                	push   0xc
  409016:	68 2c 7a 45 00       	push   0x457a2c
  40901b:	ff d3                	call   ebx
  40901d:	83 c4 10             	add    esp,0x10
