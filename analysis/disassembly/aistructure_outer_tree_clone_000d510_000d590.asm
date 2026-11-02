; MAIWmodels.dll (PE32 / x86)
; Image base: 0x10000000
; SHA-256: 80ccc6678bdf057152f473369a56eb3b76a1ce643edca2832345f7b53e09c525
; Clone outer red-black tree topology; recursively recreate nodes.
; Range: 0x1000d510..0x1000d630


/mnt/data/work_stage117/original/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

1000d510 <.text+0xc510>:
1000d510:	55                   	push   ebp
1000d511:	8b ec                	mov    ebp,esp
1000d513:	53                   	push   ebx
1000d514:	56                   	push   esi
1000d515:	57                   	push   edi
1000d516:	8b 7d 08             	mov    edi,DWORD PTR [ebp+0x8]
1000d519:	8b d9                	mov    ebx,ecx
1000d51b:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
1000d51e:	8b 07                	mov    eax,DWORD PTR [edi]
1000d520:	8b 33                	mov    esi,DWORD PTR [ebx]
1000d522:	56                   	push   esi
1000d523:	ff 70 04             	push   DWORD PTR [eax+0x4]
1000d526:	e8 65 00 00 00       	call   0x1000d590
1000d52b:	89 46 04             	mov    DWORD PTR [esi+0x4],eax
1000d52e:	8b 47 04             	mov    eax,DWORD PTR [edi+0x4]
1000d531:	89 43 04             	mov    DWORD PTR [ebx+0x4],eax
1000d534:	8b 13                	mov    edx,DWORD PTR [ebx]
1000d536:	8b 4a 04             	mov    ecx,DWORD PTR [edx+0x4]
1000d539:	80 79 0d 00          	cmp    BYTE PTR [ecx+0xd],0x0
1000d53d:	75 37                	jne    0x1000d576
1000d53f:	8b 01                	mov    eax,DWORD PTR [ecx]
1000d541:	80 78 0d 00          	cmp    BYTE PTR [eax+0xd],0x0
1000d545:	75 0a                	jne    0x1000d551
1000d547:	8b c8                	mov    ecx,eax
1000d549:	8b 01                	mov    eax,DWORD PTR [ecx]
1000d54b:	80 78 0d 00          	cmp    BYTE PTR [eax+0xd],0x0
1000d54f:	74 f6                	je     0x1000d547
1000d551:	89 0a                	mov    DWORD PTR [edx],ecx
1000d553:	8b 13                	mov    edx,DWORD PTR [ebx]
1000d555:	8b 4a 04             	mov    ecx,DWORD PTR [edx+0x4]
1000d558:	8b 41 08             	mov    eax,DWORD PTR [ecx+0x8]
1000d55b:	80 78 0d 00          	cmp    BYTE PTR [eax+0xd],0x0
1000d55f:	75 0b                	jne    0x1000d56c
1000d561:	8b c8                	mov    ecx,eax
1000d563:	8b 41 08             	mov    eax,DWORD PTR [ecx+0x8]
1000d566:	80 78 0d 00          	cmp    BYTE PTR [eax+0xd],0x0
1000d56a:	74 f5                	je     0x1000d561
1000d56c:	5f                   	pop    edi
1000d56d:	5e                   	pop    esi
1000d56e:	89 4a 08             	mov    DWORD PTR [edx+0x8],ecx
1000d571:	5b                   	pop    ebx
1000d572:	5d                   	pop    ebp
1000d573:	c2 08 00             	ret    0x8
1000d576:	89 12                	mov    DWORD PTR [edx],edx
1000d578:	8b 03                	mov    eax,DWORD PTR [ebx]
1000d57a:	5f                   	pop    edi
1000d57b:	5e                   	pop    esi
1000d57c:	5b                   	pop    ebx
1000d57d:	89 40 08             	mov    DWORD PTR [eax+0x8],eax
1000d580:	5d                   	pop    ebp
1000d581:	c2 08 00             	ret    0x8
1000d584:	cc                   	int3
1000d585:	cc                   	int3
1000d586:	cc                   	int3
1000d587:	cc                   	int3
1000d588:	cc                   	int3
1000d589:	cc                   	int3
1000d58a:	cc                   	int3
1000d58b:	cc                   	int3
1000d58c:	cc                   	int3
1000d58d:	cc                   	int3
1000d58e:	cc                   	int3
1000d58f:	cc                   	int3
1000d590:	55                   	push   ebp
1000d591:	8b ec                	mov    ebp,esp
1000d593:	6a ff                	push   0xffffffff
1000d595:	68 b0 66 01 10       	push   0x100166b0
1000d59a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000d5a0:	50                   	push   eax
1000d5a1:	83 ec 08             	sub    esp,0x8
1000d5a4:	53                   	push   ebx
1000d5a5:	56                   	push   esi
1000d5a6:	57                   	push   edi
1000d5a7:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000d5ac:	33 c5                	xor    eax,ebp
1000d5ae:	50                   	push   eax
1000d5af:	8d 45 f4             	lea    eax,[ebp-0xc]
1000d5b2:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000d5b8:	89 65 f0             	mov    DWORD PTR [ebp-0x10],esp
1000d5bb:	8b f1                	mov    esi,ecx
1000d5bd:	89 75 ec             	mov    DWORD PTR [ebp-0x14],esi
1000d5c0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000d5c3:	8b 3e                	mov    edi,DWORD PTR [esi]
1000d5c5:	80 78 0d 00          	cmp    BYTE PTR [eax+0xd],0x0
1000d5c9:	75 4e                	jne    0x1000d619
1000d5cb:	83 c0 10             	add    eax,0x10
1000d5ce:	50                   	push   eax
1000d5cf:	e8 9c fe ff ff       	call   0x1000d470
1000d5d4:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
1000d5d7:	8b d8                	mov    ebx,eax
1000d5d9:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
1000d5dc:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000d5e3:	89 43 04             	mov    DWORD PTR [ebx+0x4],eax
1000d5e6:	8a 41 0c             	mov    al,BYTE PTR [ecx+0xc]
1000d5e9:	88 43 0c             	mov    BYTE PTR [ebx+0xc],al
1000d5ec:	ff 75 10             	push   DWORD PTR [ebp+0x10]
1000d5ef:	80 7f 0d 00          	cmp    BYTE PTR [edi+0xd],0x0
1000d5f3:	53                   	push   ebx
1000d5f4:	ff 31                	push   DWORD PTR [ecx]
1000d5f6:	0f 45 fb             	cmovne edi,ebx
1000d5f9:	8b ce                	mov    ecx,esi
1000d5fb:	89 7d 0c             	mov    DWORD PTR [ebp+0xc],edi
1000d5fe:	e8 8d ff ff ff       	call   0x1000d590
1000d603:	89 03                	mov    DWORD PTR [ebx],eax
1000d605:	8b ce                	mov    ecx,esi
1000d607:	ff 75 10             	push   DWORD PTR [ebp+0x10]
1000d60a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000d60d:	53                   	push   ebx
1000d60e:	ff 70 08             	push   DWORD PTR [eax+0x8]
1000d611:	e8 7a ff ff ff       	call   0x1000d590
1000d616:	89 43 08             	mov    DWORD PTR [ebx+0x8],eax
1000d619:	8b c7                	mov    eax,edi
1000d61b:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000d61e:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000d625:	59                   	pop    ecx
1000d626:	5f                   	pop    edi
1000d627:	5e                   	pop    esi
1000d628:	5b                   	pop    ebx
1000d629:	8b e5                	mov    esp,ebp
1000d62b:	5d                   	pop    ebp
1000d62c:	c2 0c 00             	ret    0xc
1000d62f:	ff                   	.byte 0xff
