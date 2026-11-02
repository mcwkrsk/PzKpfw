
/mnt/data/is2_work/original/IS2_PMauto_beta/modules/PM_auto.dll:     file format pei-i386


Disassembly of section .text:

10008450 <.text+0x7450>:
10008450:	55                   	push   ebp
10008451:	8b ec                	mov    ebp,esp
10008453:	6a ff                	push   0xffffffff
10008455:	68 79 ee 01 10       	push   0x1001ee79
1000845a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10008460:	50                   	push   eax
10008461:	83 ec 2c             	sub    esp,0x2c
10008464:	53                   	push   ebx
10008465:	56                   	push   esi
10008466:	57                   	push   edi
10008467:	a1 cc f0 06 10       	mov    eax,ds:0x1006f0cc
1000846c:	33 c5                	xor    eax,ebp
1000846e:	50                   	push   eax
1000846f:	8d 45 f4             	lea    eax,[ebp-0xc]
10008472:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10008478:	8b f1                	mov    esi,ecx
1000847a:	89 75 ec             	mov    DWORD PTR [ebp-0x14],esi
1000847d:	8d 45 f0             	lea    eax,[ebp-0x10]
10008480:	50                   	push   eax
10008481:	6a 00                	push   0x0
10008483:	6a 00                	push   0x0
10008485:	6a 00                	push   0x0
10008487:	8d 4d c8             	lea    ecx,[ebp-0x38]
1000848a:	ff 15 4c 24 02 10    	call   DWORD PTR ds:0x1002244c
10008490:	8b c8                	mov    ecx,eax
10008492:	ff 15 50 24 02 10    	call   DWORD PTR ds:0x10022450
10008498:	8b d8                	mov    ebx,eax
1000849a:	8b be 5c 01 00 00    	mov    edi,DWORD PTR [esi+0x15c]
100084a0:	8d 4d dc             	lea    ecx,[ebp-0x24]
100084a3:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
100084aa:	ff 15 bc 23 02 10    	call   DWORD PTR ds:0x100223bc
100084b0:	50                   	push   eax
100084b1:	8d 8e 5c 01 00 00    	lea    ecx,[esi+0x15c]
100084b7:	ff 57 38             	call   DWORD PTR [edi+0x38]
100084ba:	50                   	push   eax
100084bb:	68 ec ad 05 10       	push   0x1005adec
100084c0:	8b cb                	mov    ecx,ebx
100084c2:	ff 15 38 22 02 10    	call   DWORD PTR ds:0x10022238
100084c8:	8b c8                	mov    ecx,eax
100084ca:	ff 15 40 22 02 10    	call   DWORD PTR ds:0x10022240
100084d0:	8d 4d f0             	lea    ecx,[ebp-0x10]
100084d3:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
100084da:	ff 15 48 22 02 10    	call   DWORD PTR ds:0x10022248
100084e0:	8b de                	mov    ebx,esi
100084e2:	8b 8b fc 00 00 00    	mov    ecx,DWORD PTR [ebx+0xfc]
100084e8:	ff 15 b0 28 02 10    	call   DWORD PTR ds:0x100228b0
100084ee:	50                   	push   eax
100084ef:	b9 90 bc 05 10       	mov    ecx,0x1005bc90
100084f4:	ff 15 54 24 02 10    	call   DWORD PTR ds:0x10022454
100084fa:	8b c8                	mov    ecx,eax
100084fc:	e8 6f ea 00 00       	call   0x10016f70
10008501:	8b cb                	mov    ecx,ebx
10008503:	e8 18 31 00 00       	call   0x1000b620
10008508:	8b cb                	mov    ecx,ebx
1000850a:	e8 d1 95 00 00       	call   0x10011ae0
1000850f:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10008512:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10008519:	59                   	pop    ecx
1000851a:	5f                   	pop    edi
1000851b:	5e                   	pop    esi
1000851c:	5b                   	pop    ebx
1000851d:	8b e5                	mov    esp,ebp
1000851f:	5d                   	pop    ebp
10008520:	c3                   	ret
10008521:	cc                   	int3
10008522:	cc                   	int3
10008523:	cc                   	int3
10008524:	cc                   	int3
10008525:	cc                   	int3
10008526:	cc                   	int3
10008527:	cc                   	int3
10008528:	cc                   	int3
10008529:	cc                   	int3
1000852a:	cc                   	int3
1000852b:	cc                   	int3
1000852c:	cc                   	int3
1000852d:	cc                   	int3
1000852e:	cc                   	int3
1000852f:	cc                   	int3
10008530:	55                   	push   ebp
10008531:	8b ec                	mov    ebp,esp
10008533:	6a ff                	push   0xffffffff
10008535:	68 25 ef 01 10       	push   0x1001ef25
1000853a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10008540:	50                   	push   eax
10008541:	83 ec 4c             	sub    esp,0x4c
10008544:	53                   	push   ebx
10008545:	56                   	push   esi
10008546:	57                   	push   edi
10008547:	a1 cc f0 06 10       	mov    eax,ds:0x1006f0cc
1000854c:	33 c5                	xor    eax,ebp
1000854e:	50                   	push   eax
1000854f:	8d 45 f4             	lea    eax,[ebp-0xc]
10008552:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10008558:	8b c1                	mov    eax,ecx
1000855a:	89 45 c4             	mov    DWORD PTR [ebp-0x3c],eax
1000855d:	8d 4d f0             	lea    ecx,[ebp-0x10]
10008560:	51                   	push   ecx
10008561:	8b c8                	mov    ecx,eax
10008563:	ff 15 7c 28 02 10    	call   DWORD PTR ds:0x1002287c
10008569:	8d 45 e4             	lea    eax,[ebp-0x1c]
1000856c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10008573:	50                   	push   eax
10008574:	8d 45 e0             	lea    eax,[ebp-0x20]
10008577:	50                   	push   eax
10008578:	8d 45 dc             	lea    eax,[ebp-0x24]
1000857b:	50                   	push   eax
1000857c:	e8 ef a5 ff ff       	call   0x10002b70
10008581:	83 c4 0c             	add    esp,0xc
10008584:	8d 4d a8             	lea    ecx,[ebp-0x58]
10008587:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
1000858a:	ff 75 e0             	push   DWORD PTR [ebp-0x20]
1000858d:	ff 75 dc             	push   DWORD PTR [ebp-0x24]
10008590:	e8 8b a5 ff ff       	call   0x10002b20
10008595:	f3 0f 7e 45 a8       	movq   xmm0,QWORD PTR [ebp-0x58]
1000859a:	8b 45 b0             	mov    eax,DWORD PTR [ebp-0x50]
1000859d:	66 0f d6 45 b4       	movq   QWORD PTR [ebp-0x4c],xmm0
100085a2:	89 45 bc             	mov    DWORD PTR [ebp-0x44],eax
100085a5:	8b 1d 28 24 02 10    	mov    ebx,DWORD PTR ds:0x10022428
100085ab:	6a 0f                	push   0xf
100085ad:	68 c8 ad 05 10       	push   0x1005adc8
100085b2:	c6 45 fc 02          	mov    BYTE PTR [ebp-0x4],0x2
100085b6:	ff d3                	call   ebx
100085b8:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
100085bb:	6a 26                	push   0x26
100085bd:	68 a0 ad 05 10       	push   0x1005ada0
100085c2:	c6 45 fc 03          	mov    BYTE PTR [ebp-0x4],0x3
100085c6:	ff d3                	call   ebx
100085c8:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
100085cb:	8b 75 b4             	mov    esi,DWORD PTR [ebp-0x4c]
100085ce:	83 c4 0c             	add    esp,0xc
100085d1:	8b cc                	mov    ecx,esp
100085d3:	c6 45 d8 20          	mov    BYTE PTR [ebp-0x28],0x20
100085d7:	c6 45 fc 04          	mov    BYTE PTR [ebp-0x4],0x4
100085db:	ff 75 d8             	push   DWORD PTR [ebp-0x28]
100085de:	ff 15 60 24 02 10    	call   DWORD PTR ds:0x10022460
100085e4:	6a 0a                	push   0xa
100085e6:	6a 00                	push   0x0
100085e8:	56                   	push   esi
100085e9:	8d 45 c8             	lea    eax,[ebp-0x38]
100085ec:	50                   	push   eax
100085ed:	8d 4d ec             	lea    ecx,[ebp-0x14]
100085f0:	ff 15 90 24 02 10    	call   DWORD PTR ds:0x10022490
100085f6:	8b f8                	mov    edi,eax
100085f8:	8b 75 b8             	mov    esi,DWORD PTR [ebp-0x48]
100085fb:	51                   	push   ecx
100085fc:	8b cc                	mov    ecx,esp
100085fe:	c6 45 d8 20          	mov    BYTE PTR [ebp-0x28],0x20
10008602:	ff 75 d8             	push   DWORD PTR [ebp-0x28]
10008605:	c6 45 fc 05          	mov    BYTE PTR [ebp-0x4],0x5
10008609:	ff 15 60 24 02 10    	call   DWORD PTR ds:0x10022460
1000860f:	6a 0a                	push   0xa
10008611:	6a 00                	push   0x0
10008613:	56                   	push   esi
10008614:	8d 45 cc             	lea    eax,[ebp-0x34]
10008617:	8b cf                	mov    ecx,edi
10008619:	50                   	push   eax
1000861a:	ff 15 90 24 02 10    	call   DWORD PTR ds:0x10022490
