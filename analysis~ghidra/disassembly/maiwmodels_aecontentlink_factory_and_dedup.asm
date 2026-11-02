
/mnt/data/work_stage117/original/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

100026a0 <.text+0x16a0>:
100026a0:	55                   	push   ebp
100026a1:	8b ec                	mov    ebp,esp
100026a3:	53                   	push   ebx
100026a4:	8b d9                	mov    ebx,ecx
100026a6:	56                   	push   esi
100026a7:	57                   	push   edi
100026a8:	33 ff                	xor    edi,edi
100026aa:	8b 53 04             	mov    edx,DWORD PTR [ebx+0x4]
100026ad:	8b 42 04             	mov    eax,DWORD PTR [edx+0x4]
100026b0:	2b 02                	sub    eax,DWORD PTR [edx]
100026b2:	a9 fc ff ff ff       	test   eax,0xfffffffc
100026b7:	7e 40                	jle    0x100026f9
100026b9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [eax+0x0]
100026c0:	8b 02                	mov    eax,DWORD PTR [edx]
100026c2:	8b 34 b8             	mov    esi,DWORD PTR [eax+edi*4]
100026c5:	8b ce                	mov    ecx,esi
100026c7:	e8 84 a9 00 00       	call   0x1000d050
100026cc:	3b 45 0c             	cmp    eax,DWORD PTR [ebp+0xc]
100026cf:	75 18                	jne    0x100026e9
100026d1:	8b ce                	mov    ecx,esi
100026d3:	e8 38 0f 00 00       	call   0x10003610
100026d8:	3b 45 08             	cmp    eax,DWORD PTR [ebp+0x8]
100026db:	75 0c                	jne    0x100026e9
100026dd:	8b ce                	mov    ecx,esi
100026df:	e8 3c 0f 00 00       	call   0x10003620
100026e4:	3a 45 10             	cmp    al,BYTE PTR [ebp+0x10]
100026e7:	74 32                	je     0x1000271b
100026e9:	8b 53 04             	mov    edx,DWORD PTR [ebx+0x4]
100026ec:	47                   	inc    edi
100026ed:	8b 42 04             	mov    eax,DWORD PTR [edx+0x4]
100026f0:	2b 02                	sub    eax,DWORD PTR [edx]
100026f2:	c1 f8 02             	sar    eax,0x2
100026f5:	3b f8                	cmp    edi,eax
100026f7:	7c c7                	jl     0x100026c0
100026f9:	8b cb                	mov    ecx,ebx
100026fb:	e8 40 00 00 00       	call   0x10002740
10002700:	ff 75 10             	push   DWORD PTR [ebp+0x10]
10002703:	8b f0                	mov    esi,eax
10002705:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10002708:	8b ce                	mov    ecx,esi
1000270a:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
1000270d:	e8 2e 0f 00 00       	call   0x10003640
10002712:	5f                   	pop    edi
10002713:	8b c6                	mov    eax,esi
10002715:	5e                   	pop    esi
10002716:	5b                   	pop    ebx
10002717:	5d                   	pop    ebp
10002718:	c2 10 00             	ret    0x10
1000271b:	80 7d 14 00          	cmp    BYTE PTR [ebp+0x14],0x0
1000271f:	74 f1                	je     0x10002712
10002721:	8b ce                	mov    ecx,esi
10002723:	e8 08 0f 00 00       	call   0x10003630
10002728:	40                   	inc    eax
10002729:	8b ce                	mov    ecx,esi
1000272b:	50                   	push   eax
1000272c:	e8 4f 0f 00 00       	call   0x10003680
10002731:	5f                   	pop    edi
10002732:	8b c6                	mov    eax,esi
10002734:	5e                   	pop    esi
10002735:	5b                   	pop    ebx
10002736:	5d                   	pop    ebp
10002737:	c2 10 00             	ret    0x10
1000273a:	cc                   	int3
1000273b:	cc                   	int3
1000273c:	cc                   	int3
1000273d:	cc                   	int3
1000273e:	cc                   	int3
1000273f:	cc                   	int3
