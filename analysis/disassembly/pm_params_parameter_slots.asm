
/mnt/data/work_stage117/original/PM_params.dll:     file format pei-i386


Disassembly of section .text:

10005600 <.text+0x4600>:
10005600:	8b 45 18             	mov    eax,DWORD PTR [ebp+0x18]
10005603:	0f 94 c1             	sete   cl
10005606:	88 08                	mov    BYTE PTR [eax],cl
10005608:	5d                   	pop    ebp
10005609:	c3                   	ret
1000560a:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
1000560d:	8b 4d 10             	mov    ecx,DWORD PTR [ebp+0x10]
10005610:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
10005613:	ff 30                	push   DWORD PTR [eax]
10005615:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10005618:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
1000561b:	ff d0                	call   eax
1000561d:	5d                   	pop    ebp
1000561e:	c3                   	ret
1000561f:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10005622:	85 c0                	test   eax,eax
10005624:	74 0b                	je     0x10005631
10005626:	6a 0c                	push   0xc
10005628:	50                   	push   eax
10005629:	e8 fb 2b 00 00       	call   0x10008229
1000562e:	83 c4 08             	add    esp,0x8
10005631:	5d                   	pop    ebp
10005632:	c3                   	ret
10005633:	cc                   	int3
10005634:	cc                   	int3
10005635:	cc                   	int3
10005636:	cc                   	int3
10005637:	cc                   	int3
10005638:	cc                   	int3
10005639:	cc                   	int3
1000563a:	cc                   	int3
1000563b:	cc                   	int3
1000563c:	cc                   	int3
1000563d:	cc                   	int3
1000563e:	cc                   	int3
1000563f:	cc                   	int3
10005640:	c2 04 00             	ret    0x4
10005643:	cc                   	int3
10005644:	cc                   	int3
10005645:	cc                   	int3
10005646:	cc                   	int3
10005647:	cc                   	int3
10005648:	cc                   	int3
10005649:	cc                   	int3
1000564a:	cc                   	int3
1000564b:	cc                   	int3
1000564c:	cc                   	int3
1000564d:	cc                   	int3
1000564e:	cc                   	int3
1000564f:	cc                   	int3
10005650:	55                   	push   ebp
10005651:	8b ec                	mov    ebp,esp
10005653:	6a ff                	push   0xffffffff
10005655:	68 1d 98 00 10       	push   0x1000981d
1000565a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10005660:	50                   	push   eax
10005661:	83 ec 74             	sub    esp,0x74
10005664:	53                   	push   ebx
10005665:	56                   	push   esi
10005666:	57                   	push   edi
10005667:	a1 50 30 02 10       	mov    eax,ds:0x10023050
1000566c:	33 c5                	xor    eax,ebp
1000566e:	50                   	push   eax
1000566f:	8d 45 f4             	lea    eax,[ebp-0xc]
10005672:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10005678:	89 4d f0             	mov    DWORD PTR [ebp-0x10],ecx
1000567b:	8b 0d f0 34 02 10    	mov    ecx,DWORD PTR ds:0x100234f0
10005681:	8b 35 d4 a0 00 10    	mov    esi,DWORD PTR ds:0x1000a0d4
10005687:	ff d6                	call   esi
10005689:	8b c8                	mov    ecx,eax
1000568b:	ff 15 88 a0 00 10    	call   DWORD PTR ds:0x1000a088
10005691:	8b 0d f0 34 02 10    	mov    ecx,DWORD PTR ds:0x100234f0
10005697:	8b f8                	mov    edi,eax
10005699:	ff d6                	call   esi
1000569b:	8b c8                	mov    ecx,eax
1000569d:	ff 15 5c a0 00 10    	call   DWORD PTR ds:0x1000a05c
100056a3:	8d 4d e0             	lea    ecx,[ebp-0x20]
100056a6:	ff 15 00 a2 00 10    	call   DWORD PTR ds:0x1000a200
100056ac:	8b 1d d0 a2 00 10    	mov    ebx,DWORD PTR ds:0x1000a2d0
100056b2:	b9 fc 34 02 10       	mov    ecx,0x100234fc
100056b7:	50                   	push   eax
100056b8:	ff d3                	call   ebx
100056ba:	40                   	inc    eax
100056bb:	b9 fc 34 02 10       	mov    ecx,0x100234fc
100056c0:	50                   	push   eax
100056c1:	ff 15 08 a3 00 10    	call   DWORD PTR ds:0x1000a308
100056c7:	6a 01                	push   0x1
100056c9:	b9 fc 34 02 10       	mov    ecx,0x100234fc
100056ce:	ff 15 04 a1 00 10    	call   DWORD PTR ds:0x1000a104
100056d4:	57                   	push   edi
100056d5:	8d 4d e0             	lea    ecx,[ebp-0x20]
100056d8:	ff 15 18 a2 00 10    	call   DWORD PTR ds:0x1000a218
100056de:	68 01 01 00 00       	push   0x101
100056e3:	8d 45 e0             	lea    eax,[ebp-0x20]
100056e6:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
100056ed:	50                   	push   eax
100056ee:	8d 4d d0             	lea    ecx,[ebp-0x30]
100056f1:	ff 15 00 a2 00 10    	call   DWORD PTR ds:0x1000a200
100056f7:	50                   	push   eax
100056f8:	6a 00                	push   0x0
100056fa:	8d 4d c0             	lea    ecx,[ebp-0x40]
100056fd:	ff 15 00 a2 00 10    	call   DWORD PTR ds:0x1000a200
10005703:	50                   	push   eax
10005704:	b9 fc 34 02 10       	mov    ecx,0x100234fc
10005709:	ff d3                	call   ebx
1000570b:	48                   	dec    eax
1000570c:	b9 fc 34 02 10       	mov    ecx,0x100234fc
10005711:	50                   	push   eax
10005712:	8d 45 b0             	lea    eax,[ebp-0x50]
10005715:	50                   	push   eax
10005716:	ff 15 6c a2 00 10    	call   DWORD PTR ds:0x1000a26c
1000571c:	50                   	push   eax
1000571d:	b9 fc 34 02 10       	mov    ecx,0x100234fc
10005722:	ff 15 d8 a2 00 10    	call   DWORD PTR ds:0x1000a2d8
10005728:	8b 1d 1c a2 00 10    	mov    ebx,DWORD PTR ds:0x1000a21c
1000572e:	8d 4d e0             	lea    ecx,[ebp-0x20]
10005731:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
10005738:	ff d3                	call   ebx
1000573a:	8b cf                	mov    ecx,edi
1000573c:	ff 15 74 a0 00 10    	call   DWORD PTR ds:0x1000a074
10005742:	8b 35 1c a1 00 10    	mov    esi,DWORD PTR ds:0x1000a11c
10005748:	8d 4d e0             	lea    ecx,[ebp-0x20]
1000574b:	50                   	push   eax
1000574c:	ff d6                	call   esi
1000574e:	6a 02                	push   0x2
10005750:	8d 45 e0             	lea    eax,[ebp-0x20]
10005753:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [ebp-0x4],0x1
1000575a:	50                   	push   eax
1000575b:	8d 4d b0             	lea    ecx,[ebp-0x50]
1000575e:	ff 15 00 a2 00 10    	call   DWORD PTR ds:0x1000a200
10005764:	50                   	push   eax
10005765:	6a 00                	push   0x0
10005767:	8d 4d c0             	lea    ecx,[ebp-0x40]
1000576a:	ff 15 00 a2 00 10    	call   DWORD PTR ds:0x1000a200
10005770:	50                   	push   eax
10005771:	b9 fc 34 02 10       	mov    ecx,0x100234fc
10005776:	ff 15 d0 a2 00 10    	call   DWORD PTR ds:0x1000a2d0
1000577c:	48                   	dec    eax
1000577d:	b9 fc 34 02 10       	mov    ecx,0x100234fc
10005782:	50                   	push   eax
10005783:	8d 45 d0             	lea    eax,[ebp-0x30]
10005786:	50                   	push   eax
10005787:	ff 15 6c a2 00 10    	call   DWORD PTR ds:0x1000a26c
1000578d:	50                   	push   eax
1000578e:	b9 fc 34 02 10       	mov    ecx,0x100234fc
10005793:	ff 15 d8 a2 00 10    	call   DWORD PTR ds:0x1000a2d8
10005799:	8d 4d e0             	lea    ecx,[ebp-0x20]
1000579c:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
100057a3:	ff d3                	call   ebx
100057a5:	8b cf                	mov    ecx,edi
100057a7:	ff 15 7c a0 00 10    	call   DWORD PTR ds:0x1000a07c
100057ad:	50                   	push   eax
100057ae:	8d 4d e0             	lea    ecx,[ebp-0x20]
100057b1:	ff d6                	call   esi
100057b3:	6a 02                	push   0x2
100057b5:	8d 45 e0             	lea    eax,[ebp-0x20]
100057b8:	c7 45 fc 02 00 00 00 	mov    DWORD PTR [ebp-0x4],0x2
100057bf:	50                   	push   eax
100057c0:	8d 4d b0             	lea    ecx,[ebp-0x50]
100057c3:	ff 15 00 a2 00 10    	call   DWORD PTR ds:0x1000a200
100057c9:	50                   	push   eax
100057ca:	6a 02                	push   0x2
100057cc:	8d 4d c0             	lea    ecx,[ebp-0x40]
100057cf:	ff 15 00 a2 00 10    	call   DWORD PTR ds:0x1000a200
100057d5:	50                   	push   eax
100057d6:	b9 fc 34 02 10       	mov    ecx,0x100234fc
100057db:	ff 15 d0 a2 00 10    	call   DWORD PTR ds:0x1000a2d0
100057e1:	48                   	dec    eax
100057e2:	b9 fc 34 02 10       	mov    ecx,0x100234fc
100057e7:	50                   	push   eax
100057e8:	8d 45 d0             	lea    eax,[ebp-0x30]
100057eb:	50                   	push   eax
100057ec:	ff 15 6c a2 00 10    	call   DWORD PTR ds:0x1000a26c
100057f2:	50                   	push   eax
100057f3:	b9 fc 34 02 10       	mov    ecx,0x100234fc
100057f8:	ff 15 d8 a2 00 10    	call   DWORD PTR ds:0x1000a2d8
100057fe:	8d 4d e0             	lea    ecx,[ebp-0x20]
10005801:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
10005808:	ff d3                	call   ebx
1000580a:	8b cf                	mov    ecx,edi
1000580c:	ff 15 68 a0 00 10    	call   DWORD PTR ds:0x1000a068
10005812:	50                   	push   eax
10005813:	8d 4d e0             	lea    ecx,[ebp-0x20]
10005816:	ff d6                	call   esi
10005818:	6a 02                	push   0x2
1000581a:	8d 45 e0             	lea    eax,[ebp-0x20]
1000581d:	c7 45 fc 03 00 00 00 	mov    DWORD PTR [ebp-0x4],0x3
10005824:	50                   	push   eax
10005825:	8d 4d b0             	lea    ecx,[ebp-0x50]
10005828:	ff 15 00 a2 00 10    	call   DWORD PTR ds:0x1000a200
1000582e:	50                   	push   eax
1000582f:	6a 01                	push   0x1
10005831:	8d 4d c0             	lea    ecx,[ebp-0x40]
10005834:	ff 15 00 a2 00 10    	call   DWORD PTR ds:0x1000a200
1000583a:	50                   	push   eax
1000583b:	b9 fc 34 02 10       	mov    ecx,0x100234fc
10005840:	ff 15 d0 a2 00 10    	call   DWORD PTR ds:0x1000a2d0
10005846:	8b 3d 6c a2 00 10    	mov    edi,DWORD PTR ds:0x1000a26c
1000584c:	48                   	dec    eax
1000584d:	50                   	push   eax
1000584e:	8d 45 d0             	lea    eax,[ebp-0x30]
10005851:	b9 fc 34 02 10       	mov    ecx,0x100234fc
10005856:	50                   	push   eax
10005857:	ff d7                	call   edi
10005859:	8b 35 d8 a2 00 10    	mov    esi,DWORD PTR ds:0x1000a2d8
1000585f:	b9 fc 34 02 10       	mov    ecx,0x100234fc
10005864:	50                   	push   eax
10005865:	ff d6                	call   esi
10005867:	8d 4d e0             	lea    ecx,[ebp-0x20]
1000586a:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
10005871:	ff d3                	call   ebx
10005873:	6a 00                	push   0x0
10005875:	8d 4d e0             	lea    ecx,[ebp-0x20]
10005878:	ff 15 18 a2 00 10    	call   DWORD PTR ds:0x1000a218
1000587e:	68 01 01 00 00       	push   0x101
10005883:	8d 45 e0             	lea    eax,[ebp-0x20]
10005886:	c7 45 fc 04 00 00 00 	mov    DWORD PTR [ebp-0x4],0x4
1000588d:	50                   	push   eax
1000588e:	8d 4d b0             	lea    ecx,[ebp-0x50]
10005891:	ff 15 00 a2 00 10    	call   DWORD PTR ds:0x1000a200
10005897:	50                   	push   eax
10005898:	6a 03                	push   0x3
1000589a:	8d 4d c0             	lea    ecx,[ebp-0x40]
1000589d:	ff 15 00 a2 00 10    	call   DWORD PTR ds:0x1000a200
100058a3:	50                   	push   eax
100058a4:	b9 fc 34 02 10       	mov    ecx,0x100234fc
100058a9:	ff 15 d0 a2 00 10    	call   DWORD PTR ds:0x1000a2d0
100058af:	48                   	dec    eax
100058b0:	b9 fc 34 02 10       	mov    ecx,0x100234fc
100058b5:	50                   	push   eax
100058b6:	8d 45 d0             	lea    eax,[ebp-0x30]
100058b9:	50                   	push   eax
100058ba:	ff d7                	call   edi
100058bc:	50                   	push   eax
100058bd:	b9 fc 34 02 10       	mov    ecx,0x100234fc
100058c2:	ff d6                	call   esi
100058c4:	8d 4d e0             	lea    ecx,[ebp-0x20]
100058c7:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
100058ce:	ff d3                	call   ebx
100058d0:	6a 00                	push   0x0
100058d2:	b9 fc 34 02 10       	mov    ecx,0x100234fc
100058d7:	ff 15 04 a1 00 10    	call   DWORD PTR ds:0x1000a104
100058dd:	8d 4d b0             	lea    ecx,[ebp-0x50]
100058e0:	ff 15 00 a2 00 10    	call   DWORD PTR ds:0x1000a200
100058e6:	50                   	push   eax
100058e7:	6a 00                	push   0x0
100058e9:	8d 4d c0             	lea    ecx,[ebp-0x40]
100058ec:	ff 15 00 a2 00 10    	call   DWORD PTR ds:0x1000a200
100058f2:	8b 1d d0 a2 00 10    	mov    ebx,DWORD PTR ds:0x1000a2d0
100058f8:	b9 fc 34 02 10       	mov    ecx,0x100234fc
100058fd:	50                   	push   eax
100058fe:	ff d3                	call   ebx
10005900:	48                   	dec    eax
10005901:	b9 fc 34 02 10       	mov    ecx,0x100234fc
10005906:	50                   	push   eax
10005907:	8d 45 d0             	lea    eax,[ebp-0x30]
1000590a:	50                   	push   eax
1000590b:	ff d7                	call   edi
1000590d:	8b 4d f0             	mov    ecx,DWORD PTR [ebp-0x10]
10005910:	8b 35 b0 a5 00 10    	mov    esi,DWORD PTR ds:0x1000a5b0
10005916:	50                   	push   eax
10005917:	8b 49 48             	mov    ecx,DWORD PTR [ecx+0x48]
1000591a:	ff d6                	call   esi
1000591c:	8d 4d b0             	lea    ecx,[ebp-0x50]
1000591f:	ff 15 00 a2 00 10    	call   DWORD PTR ds:0x1000a200
10005925:	50                   	push   eax
10005926:	6a 01                	push   0x1
10005928:	8d 4d c0             	lea    ecx,[ebp-0x40]
1000592b:	ff 15 00 a2 00 10    	call   DWORD PTR ds:0x1000a200
10005931:	50                   	push   eax
10005932:	b9 fc 34 02 10       	mov    ecx,0x100234fc
10005937:	ff d3                	call   ebx
10005939:	48                   	dec    eax
1000593a:	b9 fc 34 02 10       	mov    ecx,0x100234fc
1000593f:	50                   	push   eax
10005940:	8d 45 d0             	lea    eax,[ebp-0x30]
10005943:	50                   	push   eax
10005944:	ff d7                	call   edi
10005946:	50                   	push   eax
10005947:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
1000594a:	8b 48 48             	mov    ecx,DWORD PTR [eax+0x48]
1000594d:	ff d6                	call   esi
1000594f:	8d 4d b0             	lea    ecx,[ebp-0x50]
10005952:	ff 15 00 a2 00 10    	call   DWORD PTR ds:0x1000a200
10005958:	50                   	push   eax
10005959:	6a 02                	push   0x2
1000595b:	8d 4d c0             	lea    ecx,[ebp-0x40]
1000595e:	ff 15 00 a2 00 10    	call   DWORD PTR ds:0x1000a200
10005964:	50                   	push   eax
10005965:	b9 fc 34 02 10       	mov    ecx,0x100234fc
1000596a:	ff d3                	call   ebx
1000596c:	48                   	dec    eax
1000596d:	b9 fc 34 02 10       	mov    ecx,0x100234fc
10005972:	50                   	push   eax
10005973:	8d 45 d0             	lea    eax,[ebp-0x30]
10005976:	50                   	push   eax
10005977:	ff d7                	call   edi
10005979:	50                   	push   eax
1000597a:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
1000597d:	8b 48 48             	mov    ecx,DWORD PTR [eax+0x48]
10005980:	ff d6                	call   esi
10005982:	8d 4d a0             	lea    ecx,[ebp-0x60]
10005985:	ff 15 00 a2 00 10    	call   DWORD PTR ds:0x1000a200
1000598b:	50                   	push   eax
1000598c:	6a 03                	push   0x3
1000598e:	8d 4d 90             	lea    ecx,[ebp-0x70]
10005991:	ff 15 00 a2 00 10    	call   DWORD PTR ds:0x1000a200
10005997:	50                   	push   eax
10005998:	b9 fc 34 02 10       	mov    ecx,0x100234fc
1000599d:	ff d3                	call   ebx
1000599f:	48                   	dec    eax
100059a0:	b9 fc 34 02 10       	mov    ecx,0x100234fc
100059a5:	50                   	push   eax
100059a6:	8d 45 80             	lea    eax,[ebp-0x80]
100059a9:	50                   	push   eax
100059aa:	ff d7                	call   edi
100059ac:	50                   	push   eax
100059ad:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
100059b0:	8b 48 48             	mov    ecx,DWORD PTR [eax+0x48]
100059b3:	ff d6                	call   esi
100059b5:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
100059b8:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
100059bf:	59                   	pop    ecx
100059c0:	5f                   	pop    edi
100059c1:	5e                   	pop    esi
100059c2:	5b                   	pop    ebx
100059c3:	8b e5                	mov    esp,ebp
100059c5:	5d                   	pop    ebp
100059c6:	c3                   	ret
100059c7:	cc                   	int3
100059c8:	cc                   	int3
100059c9:	cc                   	int3
100059ca:	cc                   	int3
100059cb:	cc                   	int3
100059cc:	cc                   	int3
100059cd:	cc                   	int3
100059ce:	cc                   	int3
100059cf:	cc                   	int3
100059d0:	55                   	push   ebp
100059d1:	8b ec                	mov    ebp,esp
100059d3:	6a ff                	push   0xffffffff
100059d5:	68 52 98 00 10       	push   0x10009852
100059da:	64 a1 00 00 00 00    	mov    eax,fs:0x0
100059e0:	50                   	push   eax
100059e1:	83 ec 5c             	sub    esp,0x5c
100059e4:	53                   	push   ebx
100059e5:	56                   	push   esi
100059e6:	57                   	push   edi
100059e7:	a1 50 30 02 10       	mov    eax,ds:0x10023050
100059ec:	33 c5                	xor    eax,ebp
100059ee:	50                   	push   eax
100059ef:	8d 45 f4             	lea    eax,[ebp-0xc]
100059f2:	64 a3 00 00 00 00    	mov    fs:0x0,eax
100059f8:	8b 49 48             	mov    ecx,DWORD PTR [ecx+0x48]
100059fb:	8d 45 d8             	lea    eax,[ebp-0x28]
100059fe:	50                   	push   eax
100059ff:	ff 15 cc a8 00 10    	call   DWORD PTR ds:0x1000a8cc
10005a05:	8d 4d d8             	lea    ecx,[ebp-0x28]
10005a08:	ff 15 fc a1 00 10    	call   DWORD PTR ds:0x1000a1fc
10005a0e:	85 c0                	test   eax,eax
10005a10:	0f 88 13 01 00 00    	js     0x10005b29
10005a16:	8d 4d d8             	lea    ecx,[ebp-0x28]
10005a19:	ff 15 f8 a1 00 10    	call   DWORD PTR ds:0x1000a1f8
10005a1f:	85 c0                	test   eax,eax
10005a21:	0f 88 02 01 00 00    	js     0x10005b29
10005a27:	68 01 01 00 00       	push   0x101
10005a2c:	8d 4d b8             	lea    ecx,[ebp-0x48]
10005a2f:	ff 15 00 a2 00 10    	call   DWORD PTR ds:0x1000a200
10005a35:	50                   	push   eax
10005a36:	6a 00                	push   0x0
10005a38:	8d 4d d8             	lea    ecx,[ebp-0x28]
10005a3b:	ff 15 fc a1 00 10    	call   DWORD PTR ds:0x1000a1fc
10005a41:	50                   	push   eax
10005a42:	8d 45 a8             	lea    eax,[ebp-0x58]
10005a45:	b9 fc 34 02 10       	mov    ecx,0x100234fc
10005a4a:	50                   	push   eax
10005a4b:	ff 15 6c a2 00 10    	call   DWORD PTR ds:0x1000a26c
10005a51:	50                   	push   eax
10005a52:	8d 45 c8             	lea    eax,[ebp-0x38]
10005a55:	b9 fc 34 02 10       	mov    ecx,0x100234fc
10005a5a:	50                   	push   eax
10005a5b:	ff 15 80 a2 00 10    	call   DWORD PTR ds:0x1000a280
10005a61:	6a 00                	push   0x0
10005a63:	8b c8                	mov    ecx,eax
10005a65:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10005a6c:	ff 15 24 a1 00 10    	call   DWORD PTR ds:0x1000a124
10005a72:	8b d8                	mov    ebx,eax
10005a74:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
10005a7b:	8d 4d c8             	lea    ecx,[ebp-0x38]
10005a7e:	89 5d f0             	mov    DWORD PTR [ebp-0x10],ebx
10005a81:	ff 15 1c a2 00 10    	call   DWORD PTR ds:0x1000a21c
10005a87:	8b 13                	mov    edx,DWORD PTR [ebx]
10005a89:	8d 45 e8             	lea    eax,[ebp-0x18]
10005a8c:	50                   	push   eax
10005a8d:	8b cb                	mov    ecx,ebx
10005a8f:	ff 52 0c             	call   DWORD PTR [edx+0xc]
10005a92:	33 f6                	xor    esi,esi
10005a94:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [ebp-0x4],0x1
10005a9b:	39 75 e8             	cmp    DWORD PTR [ebp-0x18],esi
10005a9e:	7e 4c                	jle    0x10005aec
10005aa0:	8b 3d 94 a0 00 10    	mov    edi,DWORD PTR ds:0x1000a094
10005aa6:	8b 1d 98 a0 00 10    	mov    ebx,DWORD PTR ds:0x1000a098
10005aac:	0f 1f 40 00          	nop    DWORD PTR [eax+0x0]
10005ab0:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
10005ab3:	8b 0c b0             	mov    ecx,DWORD PTR [eax+esi*4]
10005ab6:	ff d7                	call   edi
10005ab8:	83 f8 04             	cmp    eax,0x4
10005abb:	75 26                	jne    0x10005ae3
10005abd:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
10005ac0:	6a 01                	push   0x1
10005ac2:	8b 0c b1             	mov    ecx,DWORD PTR [ecx+esi*4]
10005ac5:	ff d3                	call   ebx
10005ac7:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
10005aca:	8b 0c b1             	mov    ecx,DWORD PTR [ecx+esi*4]
10005acd:	ff 15 90 a0 00 10    	call   DWORD PTR ds:0x1000a090
10005ad3:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
10005ad6:	8b 0c b0             	mov    ecx,DWORD PTR [eax+esi*4]
10005ad9:	85 c9                	test   ecx,ecx
10005adb:	74 06                	je     0x10005ae3
10005add:	8b 01                	mov    eax,DWORD PTR [ecx]
10005adf:	6a 01                	push   0x1
10005ae1:	ff 10                	call   DWORD PTR [eax]
10005ae3:	46                   	inc    esi
10005ae4:	3b 75 e8             	cmp    esi,DWORD PTR [ebp-0x18]
10005ae7:	7c c7                	jl     0x10005ab0
10005ae9:	8b 5d f0             	mov    ebx,DWORD PTR [ebp-0x10]
10005aec:	8b 0d f0 34 02 10    	mov    ecx,DWORD PTR ds:0x100234f0
10005af2:	53                   	push   ebx
10005af3:	ff 15 d4 a0 00 10    	call   DWORD PTR ds:0x1000a0d4
10005af9:	8b c8                	mov    ecx,eax
10005afb:	ff 15 70 a0 00 10    	call   DWORD PTR ds:0x1000a070
10005b01:	8d 4d 98             	lea    ecx,[ebp-0x68]
10005b04:	ff 15 00 a2 00 10    	call   DWORD PTR ds:0x1000a200
10005b0a:	50                   	push   eax
10005b0b:	8d 4d d8             	lea    ecx,[ebp-0x28]
10005b0e:	ff 15 fc a1 00 10    	call   DWORD PTR ds:0x1000a1fc
10005b14:	50                   	push   eax
10005b15:	b9 fc 34 02 10       	mov    ecx,0x100234fc
10005b1a:	ff 15 f4 a1 00 10    	call   DWORD PTR ds:0x1000a1f4
10005b20:	8d 4d e8             	lea    ecx,[ebp-0x18]
10005b23:	ff 15 9c a0 00 10    	call   DWORD PTR ds:0x1000a09c
10005b29:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10005b2c:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10005b33:	59                   	pop    ecx
10005b34:	5f                   	pop    edi
10005b35:	5e                   	pop    esi
10005b36:	5b                   	pop    ebx
10005b37:	8b e5                	mov    esp,ebp
10005b39:	5d                   	pop    ebp
10005b3a:	c3                   	ret
10005b3b:	cc                   	int3
10005b3c:	cc                   	int3
10005b3d:	cc                   	int3
10005b3e:	cc                   	int3
10005b3f:	cc                   	int3
10005b40:	55                   	push   ebp
10005b41:	8b ec                	mov    ebp,esp
10005b43:	6a ff                	push   0xffffffff
10005b45:	68 7f 98 00 10       	push   0x1000987f
10005b4a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10005b50:	50                   	push   eax
10005b51:	51                   	push   ecx
10005b52:	56                   	push   esi
10005b53:	57                   	push   edi
10005b54:	a1 50 30 02 10       	mov    eax,ds:0x10023050
10005b59:	33 c5                	xor    eax,ebp
10005b5b:	50                   	push   eax
10005b5c:	8d 45 f4             	lea    eax,[ebp-0xc]
10005b5f:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10005b65:	8b f9                	mov    edi,ecx
10005b67:	6a 50                	push   0x50
10005b69:	e8 83 26 00 00       	call   0x100081f1
10005b6e:	83 c4 04             	add    esp,0x4
10005b71:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
10005b74:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10005b7b:	85 c0                	test   eax,eax
10005b7d:	74 13                	je     0x10005b92
10005b7f:	ff 35 f0 34 02 10    	push   DWORD PTR ds:0x100234f0
10005b85:	8b c8                	mov    ecx,eax
10005b87:	6a 00                	push   0x0
10005b89:	e8 a2 b7 ff ff       	call   0x10001330
10005b8e:	8b f0                	mov    esi,eax
10005b90:	eb 02                	jmp    0x10005b94
10005b92:	33 f6                	xor    esi,esi
10005b94:	c6 45 f0 00          	mov    BYTE PTR [ebp-0x10],0x0
10005b98:	8d 45 f0             	lea    eax,[ebp-0x10]
10005b9b:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
10005b9e:	89 3d ec 34 02 10    	mov    DWORD PTR ds:0x100234ec,edi
10005ba4:	ff 35 08 a1 00 10    	push   DWORD PTR ds:0x1000a108
10005baa:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
10005bb1:	56                   	push   esi
10005bb2:	50                   	push   eax
10005bb3:	c7 46 1c 70 2f 00 10 	mov    DWORD PTR [esi+0x1c],0x10002f70
10005bba:	e8 b1 d6 ff ff       	call   0x10003270
10005bbf:	83 c4 10             	add    esp,0x10
10005bc2:	8d 4d f0             	lea    ecx,[ebp-0x10]
10005bc5:	ff 15 58 a1 00 10    	call   DWORD PTR ds:0x1000a158
10005bcb:	6a 02                	push   0x2
10005bcd:	8b ce                	mov    ecx,esi
10005bcf:	ff 15 f8 a7 00 10    	call   DWORD PTR ds:0x1000a7f8
10005bd5:	8b ce                	mov    ecx,esi
10005bd7:	ff 15 98 a5 00 10    	call   DWORD PTR ds:0x1000a598
10005bdd:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10005be0:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10005be7:	59                   	pop    ecx
10005be8:	5f                   	pop    edi
10005be9:	5e                   	pop    esi
10005bea:	8b e5                	mov    esp,ebp
10005bec:	5d                   	pop    ebp
10005bed:	c3                   	ret
10005bee:	cc                   	int3
10005bef:	cc                   	int3
10005bf0:	c2 0c 00             	ret    0xc
10005bf3:	cc                   	int3
10005bf4:	cc                   	int3
10005bf5:	cc                   	int3
10005bf6:	cc                   	int3
10005bf7:	cc                   	int3
10005bf8:	cc                   	int3
10005bf9:	cc                   	int3
10005bfa:	cc                   	int3
10005bfb:	cc                   	int3
10005bfc:	cc                   	int3
10005bfd:	cc                   	int3
10005bfe:	cc                   	int3
10005bff:	cc                   	int3
10005c00:	55                   	push   ebp
10005c01:	8b ec                	mov    ebp,esp
10005c03:	6a ff                	push   0xffffffff
10005c05:	68 a9 98 00 10       	push   0x100098a9
10005c0a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10005c10:	50                   	push   eax
10005c11:	83 ec 08             	sub    esp,0x8
10005c14:	56                   	push   esi
10005c15:	57                   	push   edi
10005c16:	a1 50 30 02 10       	mov    eax,ds:0x10023050
10005c1b:	33 c5                	xor    eax,ebp
10005c1d:	50                   	push   eax
10005c1e:	8d 45 f4             	lea    eax,[ebp-0xc]
10005c21:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10005c27:	a1 34 35 02 10       	mov    eax,ds:0x10023534
10005c2c:	85 c0                	test   eax,eax
10005c2e:	0f 85 ce 00 00 00    	jne    0x10005d02
10005c34:	6a 02                	push   0x2
10005c36:	ff 15 b8 a1 00 10    	call   DWORD PTR ds:0x1000a1b8
10005c3c:	8b f8                	mov    edi,eax
10005c3e:	83 c4 04             	add    esp,0x4
10005c41:	85 ff                	test   edi,edi
10005c43:	74 16                	je     0x10005c5b
10005c45:	8b f7                	mov    esi,edi
10005c47:	8d 4e 01             	lea    ecx,[esi+0x1]
10005c4a:	66 0f 1f 44 00 00    	nop    WORD PTR [eax+eax*1+0x0]
10005c50:	8a 06                	mov    al,BYTE PTR [esi]
10005c52:	46                   	inc    esi
10005c53:	84 c0                	test   al,al
10005c55:	75 f9                	jne    0x10005c50
10005c57:	2b f1                	sub    esi,ecx
10005c59:	eb 02                	jmp    0x10005c5d
10005c5b:	33 f6                	xor    esi,esi
10005c5d:	8d 4d f0             	lea    ecx,[ebp-0x10]
10005c60:	ff 15 88 a1 00 10    	call   DWORD PTR ds:0x1000a188
10005c66:	8d 46 0b             	lea    eax,[esi+0xb]
10005c69:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10005c70:	50                   	push   eax
10005c71:	8d 4d f0             	lea    ecx,[ebp-0x10]
10005c74:	ff 15 80 a1 00 10    	call   DWORD PTR ds:0x1000a180
10005c7a:	56                   	push   esi
10005c7b:	8b 35 74 a1 00 10    	mov    esi,DWORD PTR ds:0x1000a174
10005c81:	8d 4d f0             	lea    ecx,[ebp-0x10]
10005c84:	57                   	push   edi
10005c85:	6a 3c                	push   0x3c
10005c87:	6a 07                	push   0x7
10005c89:	68 14 8d 01 10       	push   0x10018d14
10005c8e:	ff d6                	call   esi
10005c90:	8b 3d 78 a1 00 10    	mov    edi,DWORD PTR ds:0x1000a178
10005c96:	8b c8                	mov    ecx,eax
10005c98:	ff d7                	call   edi
10005c9a:	8b c8                	mov    ecx,eax
10005c9c:	ff d6                	call   esi
10005c9e:	6a 3e                	push   0x3e
10005ca0:	8d 4d f0             	lea    ecx,[ebp-0x10]
10005ca3:	ff 15 7c a1 00 10    	call   DWORD PTR ds:0x1000a17c
10005ca9:	84 c0                	test   al,al
10005cab:	74 07                	je     0x10005cb4
10005cad:	6a 20                	push   0x20
10005caf:	8d 4d f0             	lea    ecx,[ebp-0x10]
10005cb2:	ff d7                	call   edi
10005cb4:	6a 3e                	push   0x3e
10005cb6:	8d 4d f0             	lea    ecx,[ebp-0x10]
10005cb9:	ff d7                	call   edi
10005cbb:	6a 00                	push   0x0
10005cbd:	68 07 01 00 00       	push   0x107
10005cc2:	6a 04                	push   0x4
10005cc4:	68 e0 43 00 10       	push   0x100043e0
10005cc9:	8d 45 f0             	lea    eax,[ebp-0x10]
10005ccc:	c7 45 ec 07 00 00 00 	mov    DWORD PTR [ebp-0x14],0x7
10005cd3:	68 d0 44 00 10       	push   0x100044d0
10005cd8:	50                   	push   eax
10005cd9:	ff 15 2c a1 00 10    	call   DWORD PTR ds:0x1000a12c
10005cdf:	8b f0                	mov    esi,eax
10005ce1:	83 c4 18             	add    esp,0x18
10005ce4:	85 f6                	test   esi,esi
10005ce6:	7e 09                	jle    0x10005cf1
10005ce8:	56                   	push   esi
10005ce9:	e8 c2 00 00 00       	call   0x10005db0
10005cee:	83 c4 04             	add    esp,0x4
10005cf1:	8d 4d f0             	lea    ecx,[ebp-0x10]
10005cf4:	89 35 34 35 02 10    	mov    DWORD PTR ds:0x10023534,esi
10005cfa:	ff 15 84 a1 00 10    	call   DWORD PTR ds:0x1000a184
10005d00:	8b c6                	mov    eax,esi
10005d02:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10005d05:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10005d0c:	59                   	pop    ecx
10005d0d:	5f                   	pop    edi
10005d0e:	5e                   	pop    esi
10005d0f:	8b e5                	mov    esp,ebp
10005d11:	5d                   	pop    ebp
10005d12:	c3                   	ret
10005d13:	cc                   	int3
10005d14:	cc                   	int3
10005d15:	cc                   	int3
10005d16:	cc                   	int3
10005d17:	cc                   	int3
10005d18:	cc                   	int3
10005d19:	cc                   	int3
10005d1a:	cc                   	int3
10005d1b:	cc                   	int3
10005d1c:	cc                   	int3
10005d1d:	cc                   	int3
10005d1e:	cc                   	int3
10005d1f:	cc                   	int3
10005d20:	55                   	push   ebp
10005d21:	8b ec                	mov    ebp,esp
10005d23:	6a ff                	push   0xffffffff
10005d25:	68 d9 98 00 10       	push   0x100098d9
10005d2a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10005d30:	50                   	push   eax
10005d31:	83 ec 08             	sub    esp,0x8
10005d34:	56                   	push   esi
10005d35:	a1 50 30 02 10       	mov    eax,ds:0x10023050
10005d3a:	33 c5                	xor    eax,ebp
10005d3c:	50                   	push   eax
10005d3d:	8d 45 f4             	lea    eax,[ebp-0xc]
10005d40:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10005d46:	a1 04 35 02 10       	mov    eax,ds:0x10023504
10005d4b:	85 c0                	test   eax,eax
10005d4d:	75 50                	jne    0x10005d9f
10005d4f:	8d 45 f0             	lea    eax,[ebp-0x10]
10005d52:	68 6c 81 01 10       	push   0x1001816c
10005d57:	50                   	push   eax
10005d58:	ff 15 5c a1 00 10    	call   DWORD PTR ds:0x1000a15c
10005d5e:	6a 00                	push   0x0
10005d60:	68 07 01 00 00       	push   0x107
10005d65:	6a 38                	push   0x38
10005d67:	68 80 44 00 10       	push   0x10004480
10005d6c:	8d 45 f0             	lea    eax,[ebp-0x10]
10005d6f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10005d76:	68 10 7e 00 10       	push   0x10007e10
10005d7b:	50                   	push   eax
10005d7c:	c7                   	.byte 0xc7
10005d7d:	45                   	inc    ebp
10005d7e:	ec                   	in     al,dx
10005d7f:	07                   	pop    es
