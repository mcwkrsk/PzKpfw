
/mnt/data/work_stage117/original/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

10012410 <.text+0x11410>:
10012410:	55                   	push   ebp
10012411:	8b ec                	mov    ebp,esp
10012413:	6a ff                	push   0xffffffff
10012415:	68 0f 66 01 10       	push   0x1001660f
1001241a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10012420:	50                   	push   eax
10012421:	51                   	push   ecx
10012422:	56                   	push   esi
10012423:	57                   	push   edi
10012424:	a1 04 10 02 10       	mov    eax,ds:0x10021004
10012429:	33 c5                	xor    eax,ebp
1001242b:	50                   	push   eax
1001242c:	8d 45 f4             	lea    eax,[ebp-0xc]
1001242f:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10012435:	8b f9                	mov    edi,ecx
10012437:	89 7d f0             	mov    DWORD PTR [ebp-0x10],edi
1001243a:	6a 40                	push   0x40
1001243c:	e8 af 28 00 00       	call   0x10014cf0
10012441:	8b f0                	mov    esi,eax
10012443:	83 c4 04             	add    esp,0x4
10012446:	89 75 f0             	mov    DWORD PTR [ebp-0x10],esi
10012449:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10012450:	85 f6                	test   esi,esi
10012452:	74 0f                	je     0x10012463
10012454:	8b ce                	mov    ecx,esi
10012456:	e8 d5 a3 ff ff       	call   0x1000c830
1001245b:	c7 06 5c 75 01 10    	mov    DWORD PTR [esi],0x1001755c
10012461:	eb 02                	jmp    0x10012465
10012463:	33 f6                	xor    esi,esi
10012465:	56                   	push   esi
10012466:	8b cf                	mov    ecx,edi
10012468:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
1001246f:	e8 4c ad ff ff       	call   0x1000d1c0
10012474:	c7 07 3c 75 01 10    	mov    DWORD PTR [edi],0x1001753c
1001247a:	8b c7                	mov    eax,edi
1001247c:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1001247f:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10012486:	59                   	pop    ecx
10012487:	5f                   	pop    edi
10012488:	5e                   	pop    esi
10012489:	8b e5                	mov    esp,ebp
1001248b:	5d                   	pop    ebp
1001248c:	c3                   	ret
1001248d:	cc                   	int3
1001248e:	cc                   	int3
1001248f:	cc                   	int3
10012490:	55                   	push   ebp
10012491:	8b ec                	mov    ebp,esp
10012493:	51                   	push   ecx
10012494:	56                   	push   esi
10012495:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
10012498:	57                   	push   edi
10012499:	8b f9                	mov    edi,ecx
1001249b:	56                   	push   esi
1001249c:	89 7d fc             	mov    DWORD PTR [ebp-0x4],edi
1001249f:	e8 4c ad ff ff       	call   0x1000d1f0
100124a4:	c7 07 3c 75 01 10    	mov    DWORD PTR [edi],0x1001753c
100124aa:	8b 46 08             	mov    eax,DWORD PTR [esi+0x8]
100124ad:	89 47 08             	mov    DWORD PTR [edi+0x8],eax
100124b0:	8b c7                	mov    eax,edi
100124b2:	5f                   	pop    edi
100124b3:	5e                   	pop    esi
100124b4:	8b e5                	mov    esp,ebp
100124b6:	5d                   	pop    ebp
100124b7:	c2 04 00             	ret    0x4
100124ba:	cc                   	int3
100124bb:	cc                   	int3
100124bc:	cc                   	int3
100124bd:	cc                   	int3
100124be:	cc                   	int3
100124bf:	cc                   	int3
100124c0:	c7 01 3c 75 01 10    	mov    DWORD PTR [ecx],0x1001753c
100124c6:	e9 d5 ad ff ff       	jmp    0x1000d2a0
100124cb:	cc                   	int3
100124cc:	cc                   	int3
100124cd:	cc                   	int3
100124ce:	cc                   	int3
100124cf:	cc                   	int3
100124d0:	55                   	push   ebp
100124d1:	8b ec                	mov    ebp,esp
100124d3:	6a ff                	push   0xffffffff
100124d5:	68 30 66 01 10       	push   0x10016630
100124da:	64 a1 00 00 00 00    	mov    eax,fs:0x0
100124e0:	50                   	push   eax
100124e1:	53                   	push   ebx
100124e2:	56                   	push   esi
100124e3:	57                   	push   edi
100124e4:	a1 04 10 02 10       	mov    eax,ds:0x10021004
100124e9:	33 c5                	xor    eax,ebp
100124eb:	50                   	push   eax
100124ec:	8d 45 f4             	lea    eax,[ebp-0xc]
100124ef:	64 a3 00 00 00 00    	mov    fs:0x0,eax
100124f5:	8b f1                	mov    esi,ecx
100124f7:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
100124fa:	f6 c3 02             	test   bl,0x2
100124fd:	74 44                	je     0x10012543
100124ff:	68 c0 24 01 10       	push   0x100124c0
10012504:	ff 76 fc             	push   DWORD PTR [esi-0x4]
10012507:	8d 7e fc             	lea    edi,[esi-0x4]
1001250a:	6a 0c                	push   0xc
1001250c:	56                   	push   esi
1001250d:	e8 f7 26 00 00       	call   0x10014c09
10012512:	f6 c3 01             	test   bl,0x1
10012515:	74 16                	je     0x1001252d
10012517:	8b 0f                	mov    ecx,DWORD PTR [edi]
10012519:	8d 0c 49             	lea    ecx,[ecx+ecx*2]
1001251c:	8d 0c 8d 04 00 00 00 	lea    ecx,[ecx*4+0x4]
10012523:	51                   	push   ecx
10012524:	57                   	push   edi
10012525:	e8 15 28 00 00       	call   0x10014d3f
1001252a:	83 c4 08             	add    esp,0x8
1001252d:	8b c7                	mov    eax,edi
1001252f:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10012532:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10012539:	59                   	pop    ecx
1001253a:	5f                   	pop    edi
1001253b:	5e                   	pop    esi
1001253c:	5b                   	pop    ebx
1001253d:	8b e5                	mov    esp,ebp
1001253f:	5d                   	pop    ebp
10012540:	c2 04 00             	ret    0x4
10012543:	c7 06 3c 75 01 10    	mov    DWORD PTR [esi],0x1001753c
10012549:	e8 52 ad ff ff       	call   0x1000d2a0
1001254e:	f6 c3 01             	test   bl,0x1
10012551:	74 0b                	je     0x1001255e
10012553:	6a 0c                	push   0xc
10012555:	56                   	push   esi
10012556:	e8 cd 27 00 00       	call   0x10014d28
1001255b:	83 c4 08             	add    esp,0x8
1001255e:	8b c6                	mov    eax,esi
10012560:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10012563:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1001256a:	59                   	pop    ecx
1001256b:	5f                   	pop    edi
1001256c:	5e                   	pop    esi
1001256d:	5b                   	pop    ebx
1001256e:	8b e5                	mov    esp,ebp
10012570:	5d                   	pop    ebp
10012571:	c2 04 00             	ret    0x4
