
/mnt/data/is2_re_analysis_kit_stage1_17_continuation_2026-11-01/original/is.exe:     file format pei-i386


disassembly of section .text:

00401770 <.text+0x770>:
  401770:	55                   	push   ebp
  401771:	8b ec                	mov    ebp,esp
  401773:	6a ff                	push   0xffffffff
  401775:	68 26 58 41 00       	push   0x415826
  40177a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  401780:	50                   	push   eax
  401781:	83 ec 34             	sub    esp,0x34
  401784:	53                   	push   ebx
  401785:	56                   	push   esi
  401786:	57                   	push   edi
  401787:	a1 cc 90 46 00       	mov    eax,ds:0x4690cc
  40178c:	33 c5                	xor    eax,ebp
  40178e:	50                   	push   eax
  40178f:	8d 45 f4             	lea    eax,[ebp-0xc]
  401792:	64 a3 00 00 00 00    	mov    fs:0x0,eax
  401798:	8b c1                	mov    eax,ecx
  40179a:	89 45 d0             	mov    dword ptr [ebp-0x30],eax
  40179d:	8d 98 ac 00 00 00    	lea    ebx,[eax+0xac]
  4017a3:	c7 45 fc 00 00 00 00 	mov    dword ptr [ebp-0x4],0x0
  4017aa:	8d 45 e0             	lea    eax,[ebp-0x20]
  4017ad:	89 5d e4             	mov    dword ptr [ebp-0x1c],ebx
  4017b0:	50                   	push   eax
  4017b1:	8b cb                	mov    ecx,ebx
  4017b3:	ff 15 60 9b 41 00    	call   dword ptr ds:0x419b60
  4017b9:	8d 4d ec             	lea    ecx,[ebp-0x14]
  4017bc:	c6 45 fc 01          	mov    byte ptr [ebp-0x4],0x1
  4017c0:	51                   	push   ecx
  4017c1:	8b c8                	mov    ecx,eax
  4017c3:	ff 15 5c 9b 41 00    	call   dword ptr ds:0x419b5c
  4017c9:	8b 3d 50 9b 41 00    	mov    edi,dword ptr ds:0x419b50
  4017cf:	8d 4d e0             	lea    ecx,[ebp-0x20]
  4017d2:	c6 45 fc 03          	mov    byte ptr [ebp-0x4],0x3
  4017d6:	ff d7                	call   edi
  4017d8:	8d 4d ec             	lea    ecx,[ebp-0x14]
  4017db:	ff 15 70 9b 41 00    	call   dword ptr ds:0x419b70
  4017e1:	8b f0                	mov    esi,eax
  4017e3:	83 ee 01             	sub    esi,0x1
  4017e6:	0f 88 ad 00 00 00    	js     0x401899
  4017ec:	0f 1f 40 00          	nop    dword ptr [eax+0x0]
  4017f0:	56                   	push   esi
  4017f1:	8d 45 dc             	lea    eax,[ebp-0x24]
  4017f4:	50                   	push   eax
  4017f5:	8d 4d ec             	lea    ecx,[ebp-0x14]
  4017f8:	ff 15 6c 9b 41 00    	call   dword ptr ds:0x419b6c
  4017fe:	8d 4d f0             	lea    ecx,[ebp-0x10]
  401801:	c6 45 fc 04          	mov    byte ptr [ebp-0x4],0x4
  401805:	51                   	push   ecx
  401806:	8b c8                	mov    ecx,eax
  401808:	ff 15 64 9b 41 00    	call   dword ptr ds:0x419b64
  40180e:	8d 4d dc             	lea    ecx,[ebp-0x24]
  401811:	c6 45 fc 06          	mov    byte ptr [ebp-0x4],0x6
  401815:	ff d7                	call   edi
  401817:	6a 04                	push   0x4
  401819:	68 44 70 45 00       	push   0x457044
  40181e:	ff 15 a8 93 41 00    	call   dword ptr ds:0x4193a8
  401824:	83 c4 08             	add    esp,0x8
  401827:	89 45 e8             	mov    dword ptr [ebp-0x18],eax
  40182a:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  40182d:	ff 15 d8 93 41 00    	call   dword ptr ds:0x4193d8
  401833:	50                   	push   eax
  401834:	8d 45 e8             	lea    eax,[ebp-0x18]
  401837:	c6 45 fc 08          	mov    byte ptr [ebp-0x4],0x8
  40183b:	50                   	push   eax
  40183c:	8d 45 d8             	lea    eax,[ebp-0x28]
  40183f:	50                   	push   eax
  401840:	8d 4d f0             	lea    ecx,[ebp-0x10]
  401843:	ff 15 7c 9b 41 00    	call   dword ptr ds:0x419b7c
  401849:	8d 4d 08             	lea    ecx,[ebp+0x8]
  40184c:	51                   	push   ecx
  40184d:	50                   	push   eax
  40184e:	ff 15 b8 93 41 00    	call   dword ptr ds:0x4193b8
  401854:	83 c4 08             	add    esp,0x8
  401857:	8d 4d d8             	lea    ecx,[ebp-0x28]
  40185a:	8a d8                	mov    bl,al
  40185c:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  401862:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  401865:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  40186b:	8d 4d e8             	lea    ecx,[ebp-0x18]
  40186e:	c6 45 fc 06          	mov    byte ptr [ebp-0x4],0x6
  401872:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  401878:	84 db                	test   bl,bl
  40187a:	0f 85 2a 02 00 00    	jne    0x401aaa
  401880:	8d 4d f0             	lea    ecx,[ebp-0x10]
  401883:	c6 45 fc 03          	mov    byte ptr [ebp-0x4],0x3
  401887:	ff 15 84 9b 41 00    	call   dword ptr ds:0x419b84
  40188d:	83 ee 01             	sub    esi,0x1
  401890:	0f 89 5a ff ff ff    	jns    0x4017f0
  401896:	8b 5d e4             	mov    ebx,dword ptr [ebp-0x1c]
  401899:	6a 01                	push   0x1
  40189b:	68 4c 70 45 00       	push   0x45704c
  4018a0:	ff 15 a8 93 41 00    	call   dword ptr ds:0x4193a8
  4018a6:	83 c4 08             	add    esp,0x8
  4018a9:	89 45 e4             	mov    dword ptr [ebp-0x1c],eax
  4018ac:	8d 45 e4             	lea    eax,[ebp-0x1c]
  4018af:	c6 45 fc 0b          	mov    byte ptr [ebp-0x4],0xb
  4018b3:	50                   	push   eax
  4018b4:	8d 45 f0             	lea    eax,[ebp-0x10]
  4018b7:	8b cb                	mov    ecx,ebx
  4018b9:	50                   	push   eax
  4018ba:	ff 15 74 9b 41 00    	call   dword ptr ds:0x419b74
  4018c0:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  4018c3:	c6 45 fc 0d          	mov    byte ptr [ebp-0x4],0xd
  4018c7:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  4018cd:	6a 04                	push   0x4
  4018cf:	68 44 70 45 00       	push   0x457044
  4018d4:	ff 15 a8 93 41 00    	call   dword ptr ds:0x4193a8
  4018da:	83 c4 08             	add    esp,0x8
  4018dd:	89 45 e8             	mov    dword ptr [ebp-0x18],eax
  4018e0:	8d 45 08             	lea    eax,[ebp+0x8]
  4018e3:	c6 45 fc 0e          	mov    byte ptr [ebp-0x4],0xe
  4018e7:	50                   	push   eax
  4018e8:	8d 45 e8             	lea    eax,[ebp-0x18]
  4018eb:	50                   	push   eax
  4018ec:	8d 4d f0             	lea    ecx,[ebp-0x10]
  4018ef:	ff 15 80 9b 41 00    	call   dword ptr ds:0x419b80
  4018f5:	8d 4d e8             	lea    ecx,[ebp-0x18]
  4018f8:	c6 45 fc 0d          	mov    byte ptr [ebp-0x4],0xd
  4018fc:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  401902:	8d 4d ec             	lea    ecx,[ebp-0x14]
  401905:	ff 15 70 9b 41 00    	call   dword ptr ds:0x419b70
  40190b:	83 f8 0f             	cmp    eax,0xf
  40190e:	75 55                	jne    0x401965
  401910:	8b 35 60 9b 41 00    	mov    esi,dword ptr ds:0x419b60
  401916:	8d 45 e8             	lea    eax,[ebp-0x18]
  401919:	50                   	push   eax
  40191a:	8b cb                	mov    ecx,ebx
  40191c:	ff d6                	call   esi
  40191e:	8d 4d dc             	lea    ecx,[ebp-0x24]
  401921:	c6 45 fc 0f          	mov    byte ptr [ebp-0x4],0xf
  401925:	51                   	push   ecx
  401926:	8b c8                	mov    ecx,eax
  401928:	ff d6                	call   esi
  40192a:	8b f0                	mov    esi,eax
  40192c:	8d 45 d8             	lea    eax,[ebp-0x28]
  40192f:	c6 45 fc 10          	mov    byte ptr [ebp-0x4],0x10
  401933:	50                   	push   eax
  401934:	8b cb                	mov    ecx,ebx
  401936:	ff 15 60 9b 41 00    	call   dword ptr ds:0x419b60
  40193c:	56                   	push   esi
  40193d:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  401940:	c6 45 fc 11          	mov    byte ptr [ebp-0x4],0x11
  401944:	51                   	push   ecx
  401945:	8b c8                	mov    ecx,eax
  401947:	ff 15 54 9b 41 00    	call   dword ptr ds:0x419b54
  40194d:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  401950:	ff d7                	call   edi
  401952:	8d 4d d8             	lea    ecx,[ebp-0x28]
  401955:	ff d7                	call   edi
  401957:	8d 4d dc             	lea    ecx,[ebp-0x24]
  40195a:	ff d7                	call   edi
  40195c:	8d 4d e8             	lea    ecx,[ebp-0x18]
  40195f:	c6 45 fc 0d          	mov    byte ptr [ebp-0x4],0xd
  401963:	ff d7                	call   edi
  401965:	8d 45 d8             	lea    eax,[ebp-0x28]
  401968:	8b cb                	mov    ecx,ebx
  40196a:	50                   	push   eax
  40196b:	ff 15 60 9b 41 00    	call   dword ptr ds:0x419b60
  401971:	c6 45 fc 12          	mov    byte ptr [ebp-0x4],0x12
  401975:	8d 4d f0             	lea    ecx,[ebp-0x10]
  401978:	51                   	push   ecx
  401979:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  40197c:	51                   	push   ecx
  40197d:	8b c8                	mov    ecx,eax
  40197f:	ff 15 58 9b 41 00    	call   dword ptr ds:0x419b58
  401985:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  401988:	ff d7                	call   edi
  40198a:	8d 4d d8             	lea    ecx,[ebp-0x28]
  40198d:	ff d7                	call   edi
  40198f:	8d 4d f0             	lea    ecx,[ebp-0x10]
  401992:	c6 45 fc 03          	mov    byte ptr [ebp-0x4],0x3
  401996:	ff 15 84 9b 41 00    	call   dword ptr ds:0x419b84
  40199c:	8d 45 dc             	lea    eax,[ebp-0x24]
  40199f:	50                   	push   eax
  4019a0:	ff 15 30 93 41 00    	call   dword ptr ds:0x419330
  4019a6:	8b f0                	mov    esi,eax
  4019a8:	8d 45 f2             	lea    eax,[ebp-0xe]
  4019ab:	c6 45 fc 13          	mov    byte ptr [ebp-0x4],0x13
  4019af:	50                   	push   eax
  4019b0:	ff 15 34 93 41 00    	call   dword ptr ds:0x419334
  4019b6:	0f b7 08             	movzx  ecx,word ptr [eax]
  4019b9:	8d 45 d8             	lea    eax,[ebp-0x28]
  4019bc:	51                   	push   ecx
  4019bd:	56                   	push   esi
  4019be:	50                   	push   eax
  4019bf:	e8 bc fb ff ff       	call   0x401580
  4019c4:	68 50 70 45 00       	push   0x457050
  4019c9:	50                   	push   eax
  4019ca:	8d 45 d4             	lea    eax,[ebp-0x2c]
  4019cd:	c6 45 fc 14          	mov    byte ptr [ebp-0x4],0x14
  4019d1:	50                   	push   eax
  4019d2:	e8 19 fb ff ff       	call   0x4014f0
  4019d7:	83 c4 20             	add    esp,0x20
  4019da:	50                   	push   eax
  4019db:	8d 4d c8             	lea    ecx,[ebp-0x38]
  4019de:	c6 45 fc 15          	mov    byte ptr [ebp-0x4],0x15
  4019e2:	ff 15 50 93 41 00    	call   dword ptr ds:0x419350
  4019e8:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  4019eb:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  4019f1:	8d 4d d8             	lea    ecx,[ebp-0x28]
  4019f4:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  4019fa:	8d 4d dc             	lea    ecx,[ebp-0x24]
  4019fd:	c6 45 fc 19          	mov    byte ptr [ebp-0x4],0x19
  401a01:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  401a07:	51                   	push   ecx
  401a08:	8b c4                	mov    eax,esp
  401a0a:	8d 4d c8             	lea    ecx,[ebp-0x38]
  401a0d:	c7 00 02 00 00 00    	mov    dword ptr [eax],0x2
  401a13:	ff 15 48 93 41 00    	call   dword ptr ds:0x419348
  401a19:	8d 45 c8             	lea    eax,[ebp-0x38]
  401a1c:	50                   	push   eax
  401a1d:	8d 4d c0             	lea    ecx,[ebp-0x40]
  401a20:	ff 15 64 93 41 00    	call   dword ptr ds:0x419364
  401a26:	68 34 70 45 00       	push   0x457034
  401a2b:	8d 4d c0             	lea    ecx,[ebp-0x40]
  401a2e:	c6 45 fc 1a          	mov    byte ptr [ebp-0x4],0x1a
  401a32:	ff 15 5c 93 41 00    	call   dword ptr ds:0x41935c
  401a38:	6a 01                	push   0x1
  401a3a:	8d 45 d4             	lea    eax,[ebp-0x2c]
  401a3d:	8b cb                	mov    ecx,ebx
  401a3f:	50                   	push   eax
  401a40:	ff 15 78 9b 41 00    	call   dword ptr ds:0x419b78
  401a46:	50                   	push   eax
  401a47:	8d 4d c0             	lea    ecx,[ebp-0x40]
  401a4a:	c6 45 fc 1b          	mov    byte ptr [ebp-0x4],0x1b
  401a4e:	ff 15 58 93 41 00    	call   dword ptr ds:0x419358
  401a54:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  401a57:	c6 45 fc 1a          	mov    byte ptr [ebp-0x4],0x1a
  401a5b:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  401a61:	8d 4d c8             	lea    ecx,[ebp-0x38]
  401a64:	ff 15 54 93 41 00    	call   dword ptr ds:0x419354
  401a6a:	8b 4d d0             	mov    ecx,dword ptr [ebp-0x30]
  401a6d:	e8 de 10 00 00       	call   0x402b50
  401a72:	8d 4d c0             	lea    ecx,[ebp-0x40]
  401a75:	ff 15 60 93 41 00    	call   dword ptr ds:0x419360
  401a7b:	8d 4d c8             	lea    ecx,[ebp-0x38]
  401a7e:	ff 15 4c 93 41 00    	call   dword ptr ds:0x41934c
  401a84:	8d 4d ec             	lea    ecx,[ebp-0x14]
  401a87:	ff 15 68 9b 41 00    	call   dword ptr ds:0x419b68
  401a8d:	8d 4d 08             	lea    ecx,[ebp+0x8]
  401a90:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  401a96:	8b 4d f4             	mov    ecx,dword ptr [ebp-0xc]
  401a99:	64 89 0d 00 00 00 00 	mov    dword ptr fs:0x0,ecx
  401aa0:	59                   	pop    ecx
  401aa1:	5f                   	pop    edi
  401aa2:	5e                   	pop    esi
  401aa3:	5b                   	pop    ebx
  401aa4:	8b e5                	mov    esp,ebp
  401aa6:	5d                   	pop    ebp
  401aa7:	c2 04 00             	ret    0x4
  401aaa:	8b 5d e4             	mov    ebx,dword ptr [ebp-0x1c]
  401aad:	8d 45 d8             	lea    eax,[ebp-0x28]
