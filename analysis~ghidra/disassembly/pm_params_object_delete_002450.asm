
/mnt/data/work_stage117/original/PM_params.dll:     file format pei-i386


Disassembly of section .text:

10002450 <.text+0x1450>:
10002450:	55                   	push   ebp
10002451:	8b ec                	mov    ebp,esp
10002453:	6a ff                	push   0xffffffff
10002455:	68 69 91 00 10       	push   0x10009169
1000245a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10002460:	50                   	push   eax
10002461:	83 ec 4c             	sub    esp,0x4c
10002464:	53                   	push   ebx
10002465:	56                   	push   esi
10002466:	57                   	push   edi
10002467:	a1 50 30 02 10       	mov    eax,ds:0x10023050
1000246c:	33 c5                	xor    eax,ebp
1000246e:	50                   	push   eax
1000246f:	8d 45 f4             	lea    eax,[ebp-0xc]
10002472:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10002478:	8b f9                	mov    edi,ecx
1000247a:	8b 4f 3c             	mov    ecx,DWORD PTR [edi+0x3c]
1000247d:	ff 15 d4 a8 00 10    	call   DWORD PTR ds:0x1000a8d4
10002483:	8b 4f 3c             	mov    ecx,DWORD PTR [edi+0x3c]
10002486:	8b f0                	mov    esi,eax
10002488:	8d 45 d8             	lea    eax,[ebp-0x28]
1000248b:	89 75 f0             	mov    DWORD PTR [ebp-0x10],esi
1000248e:	50                   	push   eax
1000248f:	ff 15 cc a8 00 10    	call   DWORD PTR ds:0x1000a8cc
10002495:	8b c8                	mov    ecx,eax
10002497:	ff 15 fc a1 00 10    	call   DWORD PTR ds:0x1000a1fc
1000249d:	8b d8                	mov    ebx,eax
1000249f:	89 5d e8             	mov    DWORD PTR [ebp-0x18],ebx
100024a2:	83 fb ff             	cmp    ebx,0xffffffff
100024a5:	0f 84 e8 00 00 00    	je     0x10002593
100024ab:	8b 36                	mov    esi,DWORD PTR [esi]
100024ad:	8d 4d c8             	lea    ecx,[ebp-0x38]
100024b0:	68 01 01 00 00       	push   0x101
100024b5:	ff 15 00 a2 00 10    	call   DWORD PTR ds:0x1000a200
100024bb:	8b 4d f0             	mov    ecx,DWORD PTR [ebp-0x10]
100024be:	50                   	push   eax
100024bf:	6a 00                	push   0x0
100024c1:	53                   	push   ebx
100024c2:	8d 45 b8             	lea    eax,[ebp-0x48]
100024c5:	50                   	push   eax
100024c6:	ff 56 2c             	call   DWORD PTR [esi+0x2c]
100024c9:	8b 4d f0             	mov    ecx,DWORD PTR [ebp-0x10]
100024cc:	50                   	push   eax
100024cd:	8d 45 d8             	lea    eax,[ebp-0x28]
100024d0:	50                   	push   eax
100024d1:	ff 56 44             	call   DWORD PTR [esi+0x44]
100024d4:	6a 00                	push   0x0
100024d6:	8b c8                	mov    ecx,eax
100024d8:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
100024df:	ff 15 10 a2 00 10    	call   DWORD PTR ds:0x1000a210
100024e5:	8d 4d d8             	lea    ecx,[ebp-0x28]
100024e8:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
100024ef:	ff 15 1c a2 00 10    	call   DWORD PTR ds:0x1000a21c
100024f5:	8b 4f 18             	mov    ecx,DWORD PTR [edi+0x18]
100024f8:	53                   	push   ebx
100024f9:	ff 15 d0 a0 00 10    	call   DWORD PTR ds:0x1000a0d0
100024ff:	8b c8                	mov    ecx,eax
10002501:	ff 15 a8 a0 00 10    	call   DWORD PTR ds:0x1000a0a8
10002507:	8b 4f 18             	mov    ecx,DWORD PTR [edi+0x18]
1000250a:	33 f6                	xor    esi,esi
1000250c:	8b 1d d4 a0 00 10    	mov    ebx,DWORD PTR ds:0x1000a0d4
10002512:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
10002515:	ff d3                	call   ebx
10002517:	8b c8                	mov    ecx,eax
10002519:	ff 15 c4 a0 00 10    	call   DWORD PTR ds:0x1000a0c4
1000251f:	85 c0                	test   eax,eax
10002521:	7e 3f                	jle    0x10002562
10002523:	8b 4f 18             	mov    ecx,DWORD PTR [edi+0x18]
10002526:	56                   	push   esi
10002527:	ff d3                	call   ebx
10002529:	8b c8                	mov    ecx,eax
1000252b:	ff 15 c8 a0 00 10    	call   DWORD PTR ds:0x1000a0c8
10002531:	8b d8                	mov    ebx,eax
10002533:	8b cb                	mov    ecx,ebx
10002535:	ff 15 bc a0 00 10    	call   DWORD PTR ds:0x1000a0bc
1000253b:	3b 45 ec             	cmp    eax,DWORD PTR [ebp-0x14]
1000253e:	75 0a                	jne    0x1000254a
10002540:	6a 00                	push   0x0
10002542:	8b cb                	mov    ecx,ebx
10002544:	ff 15 c0 a0 00 10    	call   DWORD PTR ds:0x1000a0c0
1000254a:	8b 4f 18             	mov    ecx,DWORD PTR [edi+0x18]
1000254d:	46                   	inc    esi
1000254e:	8b 1d d4 a0 00 10    	mov    ebx,DWORD PTR ds:0x1000a0d4
10002554:	ff d3                	call   ebx
10002556:	8b c8                	mov    ecx,eax
10002558:	ff 15 c4 a0 00 10    	call   DWORD PTR ds:0x1000a0c4
1000255e:	3b f0                	cmp    esi,eax
10002560:	7c c1                	jl     0x10002523
10002562:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
10002565:	ff 15 b0 a0 00 10    	call   DWORD PTR ds:0x1000a0b0
1000256b:	8b 4f 18             	mov    ecx,DWORD PTR [edi+0x18]
1000256e:	50                   	push   eax
1000256f:	ff 15 d0 a0 00 10    	call   DWORD PTR ds:0x1000a0d0
10002575:	8b c8                	mov    ecx,eax
10002577:	ff 15 a4 a0 00 10    	call   DWORD PTR ds:0x1000a0a4
1000257d:	8d 4d a8             	lea    ecx,[ebp-0x58]
10002580:	ff 15 00 a2 00 10    	call   DWORD PTR ds:0x1000a200
10002586:	8b 4d f0             	mov    ecx,DWORD PTR [ebp-0x10]
10002589:	50                   	push   eax
1000258a:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
1000258d:	ff 15 f4 a1 00 10    	call   DWORD PTR ds:0x1000a1f4
10002593:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10002596:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000259d:	59                   	pop    ecx
1000259e:	5f                   	pop    edi
1000259f:	5e                   	pop    esi
100025a0:	5b                   	pop    ebx
100025a1:	8b e5                	mov    esp,ebp
100025a3:	5d                   	pop    ebp
100025a4:	c3                   	ret
