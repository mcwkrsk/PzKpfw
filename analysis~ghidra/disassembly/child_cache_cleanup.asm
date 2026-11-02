
/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

100073e0 <.text+0x63e0>:
100073e0:	56                   	push   esi
100073e1:	8b f1                	mov    esi,ecx
100073e3:	83 7e 10 00          	cmp    DWORD PTR [esi+0x10],0x0
100073e7:	74 1a                	je     0x10007403
100073e9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [eax+0x0]
100073f0:	83 46 10 ff          	add    DWORD PTR [esi+0x10],0xffffffff
100073f4:	75 07                	jne    0x100073fd
100073f6:	c7 46 0c 00 00 00 00 	mov    DWORD PTR [esi+0xc],0x0
100073fd:	83 7e 10 00          	cmp    DWORD PTR [esi+0x10],0x0
10007401:	75 ed                	jne    0x100073f0
10007403:	57                   	push   edi
10007404:	8b 7e 08             	mov    edi,DWORD PTR [esi+0x8]
10007407:	85 ff                	test   edi,edi
10007409:	74 1d                	je     0x10007428
1000740b:	0f 1f 44 00 00       	nop    DWORD PTR [eax+eax*1+0x0]
10007410:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
10007413:	4f                   	dec    edi
10007414:	8b 04 b8             	mov    eax,DWORD PTR [eax+edi*4]
10007417:	85 c0                	test   eax,eax
10007419:	74 09                	je     0x10007424
1000741b:	50                   	push   eax
1000741c:	e8 02 d9 00 00       	call   0x10014d23
10007421:	83 c4 04             	add    esp,0x4
10007424:	85 ff                	test   edi,edi
10007426:	75 e8                	jne    0x10007410
10007428:	8b 4e 04             	mov    ecx,DWORD PTR [esi+0x4]
1000742b:	5f                   	pop    edi
1000742c:	85 c9                	test   ecx,ecx
1000742e:	74 55                	je     0x10007485
10007430:	8b 46 08             	mov    eax,DWORD PTR [esi+0x8]
10007433:	3d ff ff ff 3f       	cmp    eax,0x3fffffff
10007438:	76 06                	jbe    0x10007440
1000743a:	ff 15 b8 70 01 10    	call   DWORD PTR ds:0x100170b8
10007440:	c1 e0 02             	shl    eax,0x2
10007443:	3d 00 10 00 00       	cmp    eax,0x1000
10007448:	72 32                	jb     0x1000747c
1000744a:	f6 c1 1f             	test   cl,0x1f
1000744d:	74 06                	je     0x10007455
1000744f:	ff 15 b8 70 01 10    	call   DWORD PTR ds:0x100170b8
10007455:	8b 41 fc             	mov    eax,DWORD PTR [ecx-0x4]
10007458:	3b c1                	cmp    eax,ecx
1000745a:	72 06                	jb     0x10007462
1000745c:	ff 15 b8 70 01 10    	call   DWORD PTR ds:0x100170b8
10007462:	2b c8                	sub    ecx,eax
10007464:	83 f9 04             	cmp    ecx,0x4
10007467:	73 06                	jae    0x1000746f
10007469:	ff 15 b8 70 01 10    	call   DWORD PTR ds:0x100170b8
1000746f:	83 f9 23             	cmp    ecx,0x23
10007472:	76 06                	jbe    0x1000747a
10007474:	ff 15 b8 70 01 10    	call   DWORD PTR ds:0x100170b8
1000747a:	8b c8                	mov    ecx,eax
1000747c:	51                   	push   ecx
1000747d:	e8 a1 d8 00 00       	call   0x10014d23
10007482:	83 c4 04             	add    esp,0x4
10007485:	c7 46 08 00 00 00 00 	mov    DWORD PTR [esi+0x8],0x0
1000748c:	c7 46 04 00 00 00 00 	mov    DWORD PTR [esi+0x4],0x0
10007493:	5e                   	pop    esi
10007494:	c3                   	ret
10007495:	cc                   	int3
10007496:	cc                   	int3
10007497:	cc                   	int3
10007498:	cc                   	int3
10007499:	cc                   	int3
1000749a:	cc                   	int3
1000749b:	cc                   	int3
1000749c:	cc                   	int3
1000749d:	cc                   	int3
1000749e:	cc                   	int3
1000749f:	cc                   	int3
100074a0:	56                   	push   esi
100074a1:	8b f1                	mov    esi,ecx
100074a3:	8b 0e                	mov    ecx,DWORD PTR [esi]
100074a5:	85 c9                	test   ecx,ecx
100074a7:	74 35                	je     0x100074de
100074a9:	8b 56 08             	mov    edx,DWORD PTR [esi+0x8]
100074ac:	b8                   	.byte 0xb8
100074ad:	ab                   	stos   DWORD PTR es:[edi],eax
100074ae:	aa                   	stos   BYTE PTR es:[edi],al
100074af:	aa                   	stos   BYTE PTR es:[edi],al
