
/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

100016c0 <.text+0x6c0>:
100016c0:	56                   	push   esi
100016c1:	8b f1                	mov    esi,ecx
100016c3:	c7 06 48 71 01 10    	mov    DWORD PTR [esi],0x10017148
100016c9:	8b 4e 1c             	mov    ecx,DWORD PTR [esi+0x1c]
100016cc:	85 c9                	test   ecx,ecx
100016ce:	74 29                	je     0x100016f9
100016d0:	8b 46 24             	mov    eax,DWORD PTR [esi+0x24]
100016d3:	2b c1                	sub    eax,ecx
100016d5:	6a 04                	push   0x4
100016d7:	c1 f8 02             	sar    eax,0x2
100016da:	50                   	push   eax
100016db:	51                   	push   ecx
100016dc:	e8 9f 05 00 00       	call   0x10001c80
100016e1:	c7 46 1c 00 00 00 00 	mov    DWORD PTR [esi+0x1c],0x0
100016e8:	83 c4 0c             	add    esp,0xc
100016eb:	c7 46 20 00 00 00 00 	mov    DWORD PTR [esi+0x20],0x0
100016f2:	c7 46 24 00 00 00 00 	mov    DWORD PTR [esi+0x24],0x0
100016f9:	8b 4e 10             	mov    ecx,DWORD PTR [esi+0x10]
100016fc:	85 c9                	test   ecx,ecx
100016fe:	74 29                	je     0x10001729
10001700:	8b 46 18             	mov    eax,DWORD PTR [esi+0x18]
10001703:	2b c1                	sub    eax,ecx
10001705:	6a 04                	push   0x4
10001707:	c1 f8 02             	sar    eax,0x2
1000170a:	50                   	push   eax
1000170b:	51                   	push   ecx
1000170c:	e8 6f 05 00 00       	call   0x10001c80
10001711:	c7 46 10 00 00 00 00 	mov    DWORD PTR [esi+0x10],0x0
10001718:	83 c4 0c             	add    esp,0xc
1000171b:	c7 46 14 00 00 00 00 	mov    DWORD PTR [esi+0x14],0x0
10001722:	c7 46 18 00 00 00 00 	mov    DWORD PTR [esi+0x18],0x0
10001729:	8b 4e 04             	mov    ecx,DWORD PTR [esi+0x4]
1000172c:	85 c9                	test   ecx,ecx
1000172e:	74 29                	je     0x10001759
10001730:	8b 46 0c             	mov    eax,DWORD PTR [esi+0xc]
10001733:	2b c1                	sub    eax,ecx
10001735:	6a 04                	push   0x4
10001737:	c1 f8 02             	sar    eax,0x2
1000173a:	50                   	push   eax
1000173b:	51                   	push   ecx
1000173c:	e8 3f 05 00 00       	call   0x10001c80
10001741:	c7 46 04 00 00 00 00 	mov    DWORD PTR [esi+0x4],0x0
10001748:	83 c4 0c             	add    esp,0xc
1000174b:	c7 46 08 00 00 00 00 	mov    DWORD PTR [esi+0x8],0x0
10001752:	c7 46 0c 00 00 00 00 	mov    DWORD PTR [esi+0xc],0x0
10001759:	5e                   	pop    esi
1000175a:	c3                   	ret
1000175b:	cc                   	int3
1000175c:	cc                   	int3
1000175d:	cc                   	int3
1000175e:	cc                   	int3
1000175f:	cc                   	int3
10001760:	55                   	push   ebp
10001761:	8b ec                	mov    ebp,esp
10001763:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
10001766:	56                   	push   esi
10001767:	8b f1                	mov    esi,ecx
10001769:	8b 42 04             	mov    eax,DWORD PTR [edx+0x4]
1000176c:	89 46 04             	mov    DWORD PTR [esi+0x4],eax
1000176f:	8d 4e 08             	lea    ecx,[esi+0x8]
10001772:	8d 42 08             	lea    eax,[edx+0x8]
10001775:	50                   	push   eax
10001776:	e8 25 91 00 00       	call   0x1000a8a0
1000177b:	8b c6                	mov    eax,esi
1000177d:	5e                   	pop    esi
1000177e:	5d                   	pop    ebp
1000177f:	c2 04 00             	ret    0x4
10001782:	cc                   	int3
10001783:	cc                   	int3
10001784:	cc                   	int3
10001785:	cc                   	int3
10001786:	cc                   	int3
10001787:	cc                   	int3
10001788:	cc                   	int3
10001789:	cc                   	int3
1000178a:	cc                   	int3
1000178b:	cc                   	int3
1000178c:	cc                   	int3
1000178d:	cc                   	int3
1000178e:	cc                   	int3
1000178f:	cc                   	int3
10001790:	55                   	push   ebp
10001791:	8b ec                	mov    ebp,esp
10001793:	53                   	push   ebx
10001794:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
10001797:	56                   	push   esi
10001798:	8b f1                	mov    esi,ecx
1000179a:	57                   	push   edi
1000179b:	8d 43 04             	lea    eax,[ebx+0x4]
1000179e:	8d 7e 04             	lea    edi,[esi+0x4]
100017a1:	3b f8                	cmp    edi,eax
100017a3:	74 15                	je     0x100017ba
100017a5:	8b cf                	mov    ecx,edi
100017a7:	e8 94 22 01 00       	call   0x10013a40
100017ac:	ff 75 08             	push   DWORD PTR [ebp+0x8]
100017af:	8d 43 04             	lea    eax,[ebx+0x4]
100017b2:	8b cf                	mov    ecx,edi
100017b4:	50                   	push   eax
100017b5:	e8 06 f9 ff ff       	call   0x100010c0
100017ba:	8b 43 0c             	mov    eax,DWORD PTR [ebx+0xc]
100017bd:	89 46 0c             	mov    DWORD PTR [esi+0xc],eax
100017c0:	8b c6                	mov    eax,esi
100017c2:	5f                   	pop    edi
100017c3:	5e                   	pop    esi
100017c4:	5b                   	pop    ebx
100017c5:	5d                   	pop    ebp
100017c6:	c2 04 00             	ret    0x4
100017c9:	cc                   	int3
100017ca:	cc                   	int3
100017cb:	cc                   	int3
100017cc:	cc                   	int3
100017cd:	cc                   	int3
100017ce:	cc                   	int3
100017cf:	cc                   	int3
100017d0:	55                   	push   ebp
100017d1:	8b ec                	mov    ebp,esp
100017d3:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
100017d6:	8b 02                	mov    eax,DWORD PTR [edx]
100017d8:	89 01                	mov    DWORD PTR [ecx],eax
100017da:	8b 42 04             	mov    eax,DWORD PTR [edx+0x4]
100017dd:	89 41 04             	mov    DWORD PTR [ecx+0x4],eax
100017e0:	8b c1                	mov    eax,ecx
100017e2:	5d                   	pop    ebp
100017e3:	c2 04 00             	ret    0x4
100017e6:	cc                   	int3
100017e7:	cc                   	int3
100017e8:	cc                   	int3
100017e9:	cc                   	int3
100017ea:	cc                   	int3
100017eb:	cc                   	int3
100017ec:	cc                   	int3
100017ed:	cc                   	int3
100017ee:	cc                   	int3
100017ef:	cc                   	int3
100017f0:	55                   	push   ebp
100017f1:	8b ec                	mov    ebp,esp
100017f3:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
100017f6:	8b 02                	mov    eax,DWORD PTR [edx]
100017f8:	89 01                	mov    DWORD PTR [ecx],eax
100017fa:	8a 42 04             	mov    al,BYTE PTR [edx+0x4]
100017fd:	88 41 04             	mov    BYTE PTR [ecx+0x4],al
10001800:	8b 42 08             	mov    eax,DWORD PTR [edx+0x8]
10001803:	89 41 08             	mov    DWORD PTR [ecx+0x8],eax
10001806:	8b c1                	mov    eax,ecx
10001808:	5d                   	pop    ebp
10001809:	c2 04 00             	ret    0x4
1000180c:	cc                   	int3
1000180d:	cc                   	int3
1000180e:	cc                   	int3
1000180f:	cc                   	int3
10001810:	55                   	push   ebp
10001811:	8b ec                	mov    ebp,esp
10001813:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10001816:	f3 0f 7e 00          	movq   xmm0,QWORD PTR [eax]
1000181a:	66 0f d6 01          	movq   QWORD PTR [ecx],xmm0
1000181e:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
10001821:	89 41 08             	mov    DWORD PTR [ecx+0x8],eax
10001824:	8b c1                	mov    eax,ecx
10001826:	5d                   	pop    ebp
10001827:	c2 04 00             	ret    0x4
1000182a:	cc                   	int3
1000182b:	cc                   	int3
1000182c:	cc                   	int3
1000182d:	cc                   	int3
1000182e:	cc                   	int3
1000182f:	cc                   	int3
