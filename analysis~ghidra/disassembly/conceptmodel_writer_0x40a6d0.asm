
../original/is.exe:     file format pei-i386


disassembly of section .text:

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
  40a6f8:	c7 45 d4 00 00 00 00 	mov    dword ptr [ebp-0x2c],0x0
  40a6ff:	8b 5d 0c             	mov    ebx,dword ptr [ebp+0xc]
  40a702:	6a 0c                	push   0xc
  40a704:	68 64 7a 45 00       	push   0x457a64
  40a709:	c7 45 fc 00 00 00 00 	mov    dword ptr [ebp-0x4],0x0
  40a710:	89 1d b0 96 46 00    	mov    dword ptr ds:0x4696b0,ebx
  40a716:	ff 15 a8 93 41 00    	call   dword ptr ds:0x4193a8
  40a71c:	83 c4 08             	add    esp,0x8
  40a71f:	89 45 dc             	mov    dword ptr [ebp-0x24],eax
  40a722:	8b 7d 08             	mov    edi,dword ptr [ebp+0x8]
  40a725:	8d 45 dc             	lea    eax,[ebp-0x24]
  40a728:	50                   	push   eax
  40a729:	57                   	push   edi
  40a72a:	8b cb                	mov    ecx,ebx
  40a72c:	c7 45 fc 01 00 00 00 	mov    dword ptr [ebp-0x4],0x1
  40a733:	ff 15 74 9b 41 00    	call   dword ptr ds:0x419b74
  40a739:	8d 4d dc             	lea    ecx,[ebp-0x24]
  40a73c:	c7 45 d4 01 00 00 00 	mov    dword ptr [ebp-0x2c],0x1
  40a743:	c6 45 fc 00          	mov    byte ptr [ebp-0x4],0x0
  40a747:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  40a74d:	8b 0d a4 96 46 00    	mov    ecx,dword ptr ds:0x4696a4
  40a753:	8b 35 78 91 41 00    	mov    esi,dword ptr ds:0x419178
  40a759:	8b 49 0c             	mov    ecx,dword ptr [ecx+0xc]
  40a75c:	ff d6                	call   esi
  40a75e:	50                   	push   eax
  40a75f:	8d 45 e4             	lea    eax,[ebp-0x1c]
  40a762:	50                   	push   eax
  40a763:	e8 b8 04 00 00       	call   0x40ac20
  40a768:	83 c4 08             	add    esp,0x8
  40a76b:	8d 45 e4             	lea    eax,[ebp-0x1c]
  40a76e:	c7 45 fc 02 00 00 00 	mov    dword ptr [ebp-0x4],0x2
  40a775:	50                   	push   eax
  40a776:	8d 45 d8             	lea    eax,[ebp-0x28]
  40a779:	8b cf                	mov    ecx,edi
  40a77b:	8b 3d 58 9b 41 00    	mov    edi,dword ptr ds:0x419b58
  40a781:	50                   	push   eax
  40a782:	ff d7                	call   edi
  40a784:	8b 1d 50 9b 41 00    	mov    ebx,dword ptr ds:0x419b50
  40a78a:	8d 4d d8             	lea    ecx,[ebp-0x28]
  40a78d:	ff d3                	call   ebx
  40a78f:	6a 07                	push   0x7
  40a791:	68 a0 7b 45 00       	push   0x457ba0
  40a796:	ff 15 a8 93 41 00    	call   dword ptr ds:0x4193a8
  40a79c:	83 c4 08             	add    esp,0x8
  40a79f:	89 45 dc             	mov    dword ptr [ebp-0x24],eax
  40a7a2:	8b 4d 0c             	mov    ecx,dword ptr [ebp+0xc]
  40a7a5:	8d 45 dc             	lea    eax,[ebp-0x24]
  40a7a8:	50                   	push   eax
  40a7a9:	8d 45 ec             	lea    eax,[ebp-0x14]
  40a7ac:	c6 45 fc 03          	mov    byte ptr [ebp-0x4],0x3
  40a7b0:	50                   	push   eax
  40a7b1:	ff 15 74 9b 41 00    	call   dword ptr ds:0x419b74
  40a7b7:	8d 4d dc             	lea    ecx,[ebp-0x24]
  40a7ba:	c6 45 fc 05          	mov    byte ptr [ebp-0x4],0x5
  40a7be:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  40a7c4:	8d 45 ec             	lea    eax,[ebp-0x14]
  40a7c7:	50                   	push   eax
  40a7c8:	8d 45 d8             	lea    eax,[ebp-0x28]
  40a7cb:	50                   	push   eax
  40a7cc:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  40a7cf:	ff d7                	call   edi
  40a7d1:	8d 4d d8             	lea    ecx,[ebp-0x28]
  40a7d4:	ff d3                	call   ebx
  40a7d6:	8b 0d a4 96 46 00    	mov    ecx,dword ptr ds:0x4696a4
  40a7dc:	8b 49 0c             	mov    ecx,dword ptr [ecx+0xc]
  40a7df:	ff d6                	call   esi
  40a7e1:	8b 0d a4 96 46 00    	mov    ecx,dword ptr ds:0x4696a4
  40a7e7:	8b 70 04             	mov    esi,dword ptr [eax+0x4]
  40a7ea:	8b 49 0c             	mov    ecx,dword ptr [ecx+0xc]
  40a7ed:	8b 76 14             	mov    esi,dword ptr [esi+0x14]
  40a7f0:	ff 15 78 91 41 00    	call   dword ptr ds:0x419178
  40a7f6:	8b 40 04             	mov    eax,dword ptr [eax+0x4]
  40a7f9:	3b 70 18             	cmp    esi,dword ptr [eax+0x18]
  40a7fc:	73 4d                	jae    0x40a84b
  40a7fe:	66 90                	xchg   ax,ax
  40a800:	ff 36                	push   dword ptr [esi]
  40a802:	8d 45 d8             	lea    eax,[ebp-0x28]
  40a805:	50                   	push   eax
  40a806:	e8 a5 19 00 00       	call   0x40c1b0
  40a80b:	83 c4 08             	add    esp,0x8
  40a80e:	8d 45 d8             	lea    eax,[ebp-0x28]
  40a811:	c6 45 fc 06          	mov    byte ptr [ebp-0x4],0x6
  40a815:	50                   	push   eax
  40a816:	8d 45 d0             	lea    eax,[ebp-0x30]
  40a819:	50                   	push   eax
  40a81a:	8d 4d ec             	lea    ecx,[ebp-0x14]
  40a81d:	ff d7                	call   edi
  40a81f:	8d 4d d0             	lea    ecx,[ebp-0x30]
  40a822:	ff d3                	call   ebx
  40a824:	8d 4d d8             	lea    ecx,[ebp-0x28]
  40a827:	c6 45 fc 05          	mov    byte ptr [ebp-0x4],0x5
  40a82b:	ff 15 84 9b 41 00    	call   dword ptr ds:0x419b84
  40a831:	8b 0d a4 96 46 00    	mov    ecx,dword ptr ds:0x4696a4
  40a837:	83 c6 04             	add    esi,0x4
  40a83a:	8b 49 0c             	mov    ecx,dword ptr [ecx+0xc]
  40a83d:	ff 15 78 91 41 00    	call   dword ptr ds:0x419178
  40a843:	8b 40 04             	mov    eax,dword ptr [eax+0x4]
  40a846:	3b 70 18             	cmp    esi,dword ptr [eax+0x18]
  40a849:	72 b5                	jb     0x40a800
  40a84b:	6a 05                	push   0x5
  40a84d:	68 6c 7b 45 00       	push   0x457b6c
  40a852:	ff 15 a8 93 41 00    	call   dword ptr ds:0x4193a8
  40a858:	83 c4 08             	add    esp,0x8
  40a85b:	89 45 d8             	mov    dword ptr [ebp-0x28],eax
  40a85e:	8b 4d 0c             	mov    ecx,dword ptr [ebp+0xc]
  40a861:	8d 45 d8             	lea    eax,[ebp-0x28]
  40a864:	50                   	push   eax
  40a865:	8d 45 f0             	lea    eax,[ebp-0x10]
  40a868:	c6 45 fc 07          	mov    byte ptr [ebp-0x4],0x7
  40a86c:	50                   	push   eax
  40a86d:	ff 15 74 9b 41 00    	call   dword ptr ds:0x419b74
  40a873:	8d 4d d8             	lea    ecx,[ebp-0x28]
  40a876:	c6 45 fc 09          	mov    byte ptr [ebp-0x4],0x9
  40a87a:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  40a880:	8d 45 f0             	lea    eax,[ebp-0x10]
  40a883:	50                   	push   eax
  40a884:	8d 45 d0             	lea    eax,[ebp-0x30]
  40a887:	50                   	push   eax
  40a888:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  40a88b:	ff d7                	call   edi
  40a88d:	8d 4d d0             	lea    ecx,[ebp-0x30]
  40a890:	ff d3                	call   ebx
  40a892:	8b 0d a4 96 46 00    	mov    ecx,dword ptr ds:0x4696a4
  40a898:	8b 49 0c             	mov    ecx,dword ptr [ecx+0xc]
  40a89b:	ff 15 78 91 41 00    	call   dword ptr ds:0x419178
  40a8a1:	8b 0d a4 96 46 00    	mov    ecx,dword ptr ds:0x4696a4
  40a8a7:	8b 70 04             	mov    esi,dword ptr [eax+0x4]
  40a8aa:	8b 49 0c             	mov    ecx,dword ptr [ecx+0xc]
  40a8ad:	8b 76 20             	mov    esi,dword ptr [esi+0x20]
  40a8b0:	ff 15 78 91 41 00    	call   dword ptr ds:0x419178
  40a8b6:	8b 40 04             	mov    eax,dword ptr [eax+0x4]
  40a8b9:	3b 70 24             	cmp    esi,dword ptr [eax+0x24]
  40a8bc:	73 4d                	jae    0x40a90b
  40a8be:	66 90                	xchg   ax,ax
  40a8c0:	ff 36                	push   dword ptr [esi]
  40a8c2:	8d 45 dc             	lea    eax,[ebp-0x24]
  40a8c5:	50                   	push   eax
  40a8c6:	e8 c5 18 00 00       	call   0x40c190
  40a8cb:	83 c4 08             	add    esp,0x8
  40a8ce:	8d 45 dc             	lea    eax,[ebp-0x24]
  40a8d1:	c6 45 fc 0a          	mov    byte ptr [ebp-0x4],0xa
  40a8d5:	50                   	push   eax
  40a8d6:	8d 45 d0             	lea    eax,[ebp-0x30]
  40a8d9:	50                   	push   eax
  40a8da:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40a8dd:	ff d7                	call   edi
  40a8df:	8d 4d d0             	lea    ecx,[ebp-0x30]
  40a8e2:	ff d3                	call   ebx
  40a8e4:	8d 4d dc             	lea    ecx,[ebp-0x24]
  40a8e7:	c6 45 fc 09          	mov    byte ptr [ebp-0x4],0x9
  40a8eb:	ff 15 84 9b 41 00    	call   dword ptr ds:0x419b84
  40a8f1:	8b 0d a4 96 46 00    	mov    ecx,dword ptr ds:0x4696a4
  40a8f7:	83 c6 04             	add    esi,0x4
  40a8fa:	8b 49 0c             	mov    ecx,dword ptr [ecx+0xc]
  40a8fd:	ff 15 78 91 41 00    	call   dword ptr ds:0x419178
  40a903:	8b 40 04             	mov    eax,dword ptr [eax+0x4]
  40a906:	3b 70 24             	cmp    esi,dword ptr [eax+0x24]
  40a909:	72 b5                	jb     0x40a8c0
  40a90b:	8b 0d a4 96 46 00    	mov    ecx,dword ptr ds:0x4696a4
  40a911:	8b 35 f4 90 41 00    	mov    esi,dword ptr ds:0x4190f4
  40a917:	6a 00                	push   0x0
  40a919:	8b 49 0c             	mov    ecx,dword ptr [ecx+0xc]
  40a91c:	ff d6                	call   esi
  40a91e:	50                   	push   eax
  40a91f:	8d 45 e8             	lea    eax,[ebp-0x18]
  40a922:	50                   	push   eax
  40a923:	e8 68 1a 00 00       	call   0x40c390
  40a928:	6a 03                	push   0x3
  40a92a:	68 a8 7b 45 00       	push   0x457ba8
  40a92f:	c6 45 fc 0b          	mov    byte ptr [ebp-0x4],0xb
  40a933:	ff 15 a8 93 41 00    	call   dword ptr ds:0x4193a8
  40a939:	83 c4 10             	add    esp,0x10
  40a93c:	89 45 d8             	mov    dword ptr [ebp-0x28],eax
  40a93f:	8d 45 d8             	lea    eax,[ebp-0x28]
  40a942:	c6 45 fc 0c          	mov    byte ptr [ebp-0x4],0xc
  40a946:	50                   	push   eax
  40a947:	8d 4d e8             	lea    ecx,[ebp-0x18]
  40a94a:	ff 15 b4 9b 41 00    	call   dword ptr ds:0x419bb4
  40a950:	8d 4d d8             	lea    ecx,[ebp-0x28]
  40a953:	c6 45 fc 0b          	mov    byte ptr [ebp-0x4],0xb
  40a957:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  40a95d:	8b 4d 08             	mov    ecx,dword ptr [ebp+0x8]
  40a960:	8d 45 e8             	lea    eax,[ebp-0x18]
  40a963:	50                   	push   eax
  40a964:	8d 45 d0             	lea    eax,[ebp-0x30]
  40a967:	50                   	push   eax
  40a968:	ff d7                	call   edi
  40a96a:	8d 4d d0             	lea    ecx,[ebp-0x30]
  40a96d:	ff d3                	call   ebx
  40a96f:	6a 07                	push   0x7
  40a971:	68 a0 7b 45 00       	push   0x457ba0
  40a976:	ff 15 a8 93 41 00    	call   dword ptr ds:0x4193a8
  40a97c:	83 c4 08             	add    esp,0x8
  40a97f:	89 45 d8             	mov    dword ptr [ebp-0x28],eax
  40a982:	8b 4d 0c             	mov    ecx,dword ptr [ebp+0xc]
  40a985:	8d 45 d8             	lea    eax,[ebp-0x28]
  40a988:	50                   	push   eax
  40a989:	8d 45 d0             	lea    eax,[ebp-0x30]
  40a98c:	c6 45 fc 0d          	mov    byte ptr [ebp-0x4],0xd
  40a990:	50                   	push   eax
  40a991:	ff 15 74 9b 41 00    	call   dword ptr ds:0x419b74
  40a997:	50                   	push   eax
  40a998:	8d 4d ec             	lea    ecx,[ebp-0x14]
  40a99b:	c6 45 fc 0e          	mov    byte ptr [ebp-0x4],0xe
  40a99f:	ff 15 c0 9b 41 00    	call   dword ptr ds:0x419bc0
  40a9a5:	8d 4d d0             	lea    ecx,[ebp-0x30]
  40a9a8:	ff 15 84 9b 41 00    	call   dword ptr ds:0x419b84
  40a9ae:	8d 4d d8             	lea    ecx,[ebp-0x28]
  40a9b1:	c6 45 fc 0b          	mov    byte ptr [ebp-0x4],0xb
  40a9b5:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  40a9bb:	8d 45 ec             	lea    eax,[ebp-0x14]
  40a9be:	50                   	push   eax
  40a9bf:	8d 45 d0             	lea    eax,[ebp-0x30]
  40a9c2:	50                   	push   eax
  40a9c3:	8d 4d e8             	lea    ecx,[ebp-0x18]
  40a9c6:	ff d7                	call   edi
  40a9c8:	8d 4d d0             	lea    ecx,[ebp-0x30]
  40a9cb:	ff d3                	call   ebx
  40a9cd:	8b 0d a4 96 46 00    	mov    ecx,dword ptr ds:0x4696a4
  40a9d3:	6a 00                	push   0x0
  40a9d5:	8b 49 0c             	mov    ecx,dword ptr [ecx+0xc]
  40a9d8:	ff d6                	call   esi
  40a9da:	8b 0d a4 96 46 00    	mov    ecx,dword ptr ds:0x4696a4
  40a9e0:	6a 00                	push   0x0
  40a9e2:	8b 70 0c             	mov    esi,dword ptr [eax+0xc]
  40a9e5:	8b 49 0c             	mov    ecx,dword ptr [ecx+0xc]
  40a9e8:	8b 76 04             	mov    esi,dword ptr [esi+0x4]
  40a9eb:	ff 15 f4 90 41 00    	call   dword ptr ds:0x4190f4
  40a9f1:	8b 40 0c             	mov    eax,dword ptr [eax+0xc]
  40a9f4:	3b 70 08             	cmp    esi,dword ptr [eax+0x8]
  40a9f7:	74 54                	je     0x40aa4d
  40a9f9:	0f 1f 80 00 00 00 00 	nop    dword ptr [eax+0x0]
  40aa00:	ff 36                	push   dword ptr [esi]
  40aa02:	8d 45 d8             	lea    eax,[ebp-0x28]
  40aa05:	50                   	push   eax
  40aa06:	e8 a5 19 00 00       	call   0x40c3b0
  40aa0b:	83 c4 08             	add    esp,0x8
  40aa0e:	8d 45 d8             	lea    eax,[ebp-0x28]
  40aa11:	c6 45 fc 0f          	mov    byte ptr [ebp-0x4],0xf
  40aa15:	50                   	push   eax
  40aa16:	8d 45 d0             	lea    eax,[ebp-0x30]
  40aa19:	50                   	push   eax
  40aa1a:	8d 4d ec             	lea    ecx,[ebp-0x14]
  40aa1d:	ff d7                	call   edi
  40aa1f:	8d 4d d0             	lea    ecx,[ebp-0x30]
  40aa22:	ff d3                	call   ebx
  40aa24:	8d 4d d8             	lea    ecx,[ebp-0x28]
  40aa27:	c6 45 fc 0b          	mov    byte ptr [ebp-0x4],0xb
  40aa2b:	ff 15 84 9b 41 00    	call   dword ptr ds:0x419b84
  40aa31:	8b 0d a4 96 46 00    	mov    ecx,dword ptr ds:0x4696a4
  40aa37:	83 c6 04             	add    esi,0x4
  40aa3a:	6a 00                	push   0x0
  40aa3c:	8b 49 0c             	mov    ecx,dword ptr [ecx+0xc]
  40aa3f:	ff 15 f4 90 41 00    	call   dword ptr ds:0x4190f4
  40aa45:	8b 40 0c             	mov    eax,dword ptr [eax+0xc]
  40aa48:	3b 70 08             	cmp    esi,dword ptr [eax+0x8]
  40aa4b:	75 b3                	jne    0x40aa00
  40aa4d:	6a 05                	push   0x5
  40aa4f:	68 6c 7b 45 00       	push   0x457b6c
  40aa54:	ff 15 a8 93 41 00    	call   dword ptr ds:0x4193a8
  40aa5a:	83 c4 08             	add    esp,0x8
  40aa5d:	89 45 d8             	mov    dword ptr [ebp-0x28],eax
  40aa60:	8b 4d 0c             	mov    ecx,dword ptr [ebp+0xc]
  40aa63:	8d 45 d8             	lea    eax,[ebp-0x28]
  40aa66:	50                   	push   eax
  40aa67:	8d 45 d0             	lea    eax,[ebp-0x30]
  40aa6a:	c6 45 fc 10          	mov    byte ptr [ebp-0x4],0x10
  40aa6e:	50                   	push   eax
  40aa6f:	ff 15 74 9b 41 00    	call   dword ptr ds:0x419b74
  40aa75:	50                   	push   eax
  40aa76:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40aa79:	c6 45 fc 11          	mov    byte ptr [ebp-0x4],0x11
  40aa7d:	ff 15 c0 9b 41 00    	call   dword ptr ds:0x419bc0
  40aa83:	8d 4d d0             	lea    ecx,[ebp-0x30]
  40aa86:	ff 15 84 9b 41 00    	call   dword ptr ds:0x419b84
  40aa8c:	8d 4d d8             	lea    ecx,[ebp-0x28]
  40aa8f:	c6 45 fc 0b          	mov    byte ptr [ebp-0x4],0xb
  40aa93:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  40aa99:	8d 45 f0             	lea    eax,[ebp-0x10]
  40aa9c:	50                   	push   eax
  40aa9d:	8d 45 0c             	lea    eax,[ebp+0xc]
  40aaa0:	50                   	push   eax
  40aaa1:	8d 4d e8             	lea    ecx,[ebp-0x18]
  40aaa4:	ff d7                	call   edi
  40aaa6:	8d 4d 0c             	lea    ecx,[ebp+0xc]
  40aaa9:	ff d3                	call   ebx
  40aaab:	8b 0d a4 96 46 00    	mov    ecx,dword ptr ds:0x4696a4
  40aab1:	6a 00                	push   0x0
  40aab3:	8b 49 0c             	mov    ecx,dword ptr [ecx+0xc]
  40aab6:	ff 15 f4 90 41 00    	call   dword ptr ds:0x4190f4
  40aabc:	8b 0d a4 96 46 00    	mov    ecx,dword ptr ds:0x4696a4
  40aac2:	6a 00                	push   0x0
  40aac4:	8b 70 0c             	mov    esi,dword ptr [eax+0xc]
  40aac7:	8b 49 0c             	mov    ecx,dword ptr [ecx+0xc]
  40aaca:	8b 76 10             	mov    esi,dword ptr [esi+0x10]
  40aacd:	ff 15 f4 90 41 00    	call   dword ptr ds:0x4190f4
  40aad3:	8b 40 0c             	mov    eax,dword ptr [eax+0xc]
  40aad6:	3b 70 14             	cmp    esi,dword ptr [eax+0x14]
  40aad9:	73 52                	jae    0x40ab2d
  40aadb:	0f 1f 44 00 00       	nop    dword ptr [eax+eax*1+0x0]
  40aae0:	ff 36                	push   dword ptr [esi]
  40aae2:	8d 45 0c             	lea    eax,[ebp+0xc]
  40aae5:	50                   	push   eax
  40aae6:	e8 55 f7 ff ff       	call   0x40a240
  40aaeb:	83 c4 08             	add    esp,0x8
  40aaee:	8d 45 0c             	lea    eax,[ebp+0xc]
  40aaf1:	c6 45 fc 12          	mov    byte ptr [ebp-0x4],0x12
  40aaf5:	50                   	push   eax
  40aaf6:	8d 45 d0             	lea    eax,[ebp-0x30]
  40aaf9:	50                   	push   eax
  40aafa:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40aafd:	ff d7                	call   edi
  40aaff:	8d 4d d0             	lea    ecx,[ebp-0x30]
  40ab02:	ff d3                	call   ebx
  40ab04:	8d 4d 0c             	lea    ecx,[ebp+0xc]
  40ab07:	c6 45 fc 0b          	mov    byte ptr [ebp-0x4],0xb
  40ab0b:	ff 15 84 9b 41 00    	call   dword ptr ds:0x419b84
  40ab11:	8b 0d a4 96 46 00    	mov    ecx,dword ptr ds:0x4696a4
  40ab17:	83 c6 04             	add    esi,0x4
  40ab1a:	6a 00                	push   0x0
  40ab1c:	8b 49 0c             	mov    ecx,dword ptr [ecx+0xc]
  40ab1f:	ff 15 f4 90 41 00    	call   dword ptr ds:0x4190f4
  40ab25:	8b 40 0c             	mov    eax,dword ptr [eax+0xc]
  40ab28:	3b 70 14             	cmp    esi,dword ptr [eax+0x14]
  40ab2b:	72 b3                	jb     0x40aae0
  40ab2d:	8b 0d a4 96 46 00    	mov    ecx,dword ptr ds:0x4696a4
  40ab33:	8b 35 f8 90 41 00    	mov    esi,dword ptr ds:0x4190f8
  40ab39:	6a 00                	push   0x0
  40ab3b:	8b 49 0c             	mov    ecx,dword ptr [ecx+0xc]
  40ab3e:	ff d6                	call   esi
  40ab40:	50                   	push   eax
  40ab41:	8d 45 e0             	lea    eax,[ebp-0x20]
  40ab44:	50                   	push   eax
  40ab45:	e8 96 f2 ff ff       	call   0x409de0
  40ab4a:	83 c4 08             	add    esp,0x8
  40ab4d:	8b 4d 08             	mov    ecx,dword ptr [ebp+0x8]
  40ab50:	8d 45 e0             	lea    eax,[ebp-0x20]
  40ab53:	50                   	push   eax
  40ab54:	8d 45 0c             	lea    eax,[ebp+0xc]
  40ab57:	c6 45 fc 13          	mov    byte ptr [ebp-0x4],0x13
  40ab5b:	50                   	push   eax
  40ab5c:	ff d7                	call   edi
  40ab5e:	8d 4d 0c             	lea    ecx,[ebp+0xc]
  40ab61:	ff d3                	call   ebx
  40ab63:	8b 0d a4 96 46 00    	mov    ecx,dword ptr ds:0x4696a4
  40ab69:	6a 00                	push   0x0
  40ab6b:	8b 49 0c             	mov    ecx,dword ptr [ecx+0xc]
  40ab6e:	ff d6                	call   esi
  40ab70:	8b 0d a4 96 46 00    	mov    ecx,dword ptr ds:0x4696a4
  40ab76:	6a 00                	push   0x0
  40ab78:	8b 70 04             	mov    esi,dword ptr [eax+0x4]
  40ab7b:	8b 49 0c             	mov    ecx,dword ptr [ecx+0xc]
  40ab7e:	8b 36                	mov    esi,dword ptr [esi]
  40ab80:	ff 15 f8 90 41 00    	call   dword ptr ds:0x4190f8
  40ab86:	8b 40 04             	mov    eax,dword ptr [eax+0x4]
  40ab89:	3b 70 04             	cmp    esi,dword ptr [eax+0x4]
  40ab8c:	74 4f                	je     0x40abdd
  40ab8e:	66 90                	xchg   ax,ax
  40ab90:	ff 36                	push   dword ptr [esi]
  40ab92:	8d 45 0c             	lea    eax,[ebp+0xc]
  40ab95:	50                   	push   eax
  40ab96:	e8 a5 f4 ff ff       	call   0x40a040
  40ab9b:	83 c4 08             	add    esp,0x8
  40ab9e:	8d 45 0c             	lea    eax,[ebp+0xc]
  40aba1:	c6 45 fc 14          	mov    byte ptr [ebp-0x4],0x14
  40aba5:	50                   	push   eax
  40aba6:	8d 45 d0             	lea    eax,[ebp-0x30]
  40aba9:	50                   	push   eax
  40abaa:	8d 4d e0             	lea    ecx,[ebp-0x20]
  40abad:	ff d7                	call   edi
  40abaf:	8d 4d d0             	lea    ecx,[ebp-0x30]
  40abb2:	ff d3                	call   ebx
  40abb4:	8d 4d 0c             	lea    ecx,[ebp+0xc]
  40abb7:	c6 45 fc 13          	mov    byte ptr [ebp-0x4],0x13
  40abbb:	ff 15 84 9b 41 00    	call   dword ptr ds:0x419b84
  40abc1:	8b 0d a4 96 46 00    	mov    ecx,dword ptr ds:0x4696a4
  40abc7:	83 c6 04             	add    esi,0x4
  40abca:	6a 00                	push   0x0
  40abcc:	8b 49 0c             	mov    ecx,dword ptr [ecx+0xc]
  40abcf:	ff 15 f8 90 41 00    	call   dword ptr ds:0x4190f8
  40abd5:	8b 40 04             	mov    eax,dword ptr [eax+0x4]
  40abd8:	3b 70 04             	cmp    esi,dword ptr [eax+0x4]
  40abdb:	75 b3                	jne    0x40ab90
  40abdd:	8d 4d e0             	lea    ecx,[ebp-0x20]
  40abe0:	ff 15 84 9b 41 00    	call   dword ptr ds:0x419b84
  40abe6:	8d 4d e8             	lea    ecx,[ebp-0x18]
  40abe9:	ff 15 84 9b 41 00    	call   dword ptr ds:0x419b84
  40abef:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40abf2:	ff 15 84 9b 41 00    	call   dword ptr ds:0x419b84
  40abf8:	8d 4d ec             	lea    ecx,[ebp-0x14]
  40abfb:	ff 15 84 9b 41 00    	call   dword ptr ds:0x419b84
  40ac01:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  40ac04:	ff 15 84 9b 41 00    	call   dword ptr ds:0x419b84
  40ac0a:	8b 45 08             	mov    eax,dword ptr [ebp+0x8]
  40ac0d:	8b 4d f4             	mov    ecx,dword ptr [ebp-0xc]
  40ac10:	64 89 0d 00 00 00 00 	mov    dword ptr fs:0x0,ecx
  40ac17:	59                   	pop    ecx
  40ac18:	5f                   	pop    edi
  40ac19:	5e                   	pop    esi
  40ac1a:	5b                   	pop    ebx
  40ac1b:	8b e5                	mov    esp,ebp
  40ac1d:	5d                   	pop    ebp
  40ac1e:	c3                   	ret
  40ac1f:	cc                   	int3
