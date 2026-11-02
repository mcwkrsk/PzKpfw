
/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

10004670 <.text+0x3670>:
10004670:	55                   	push   ebp
10004671:	8b ec                	mov    ebp,esp
10004673:	56                   	push   esi
10004674:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
10004677:	57                   	push   edi
10004678:	8b 7d 0c             	mov    edi,DWORD PTR [ebp+0xc]
1000467b:	3b f7                	cmp    esi,edi
1000467d:	74 6a                	je     0x100046e9
1000467f:	83 c6 14             	add    esi,0x14
10004682:	8b 06                	mov    eax,DWORD PTR [esi]
10004684:	83 f8 08             	cmp    eax,0x8
10004687:	72 37                	jb     0x100046c0
10004689:	8b 4e ec             	mov    ecx,DWORD PTR [esi-0x14]
1000468c:	40                   	inc    eax
1000468d:	3d ff ff ff 7f       	cmp    eax,0x7fffffff
10004692:	77 59                	ja     0x100046ed
10004694:	03 c0                	add    eax,eax
10004696:	3d 00 10 00 00       	cmp    eax,0x1000
1000469b:	72 1a                	jb     0x100046b7
1000469d:	f6 c1 1f             	test   cl,0x1f
100046a0:	75 4b                	jne    0x100046ed
100046a2:	8b 41 fc             	mov    eax,DWORD PTR [ecx-0x4]
100046a5:	3b c1                	cmp    eax,ecx
100046a7:	73 44                	jae    0x100046ed
100046a9:	2b c8                	sub    ecx,eax
100046ab:	83 f9 04             	cmp    ecx,0x4
100046ae:	72 3d                	jb     0x100046ed
100046b0:	83 f9 23             	cmp    ecx,0x23
100046b3:	77 38                	ja     0x100046ed
100046b5:	8b c8                	mov    ecx,eax
100046b7:	51                   	push   ecx
100046b8:	e8 66 06 01 00       	call   0x10014d23
100046bd:	83 c4 04             	add    esp,0x4
100046c0:	c7 06 07 00 00 00    	mov    DWORD PTR [esi],0x7
100046c6:	83 3e 08             	cmp    DWORD PTR [esi],0x8
100046c9:	c7 46 fc 00 00 00 00 	mov    DWORD PTR [esi-0x4],0x0
100046d0:	72 05                	jb     0x100046d7
100046d2:	8b 46 ec             	mov    eax,DWORD PTR [esi-0x14]
100046d5:	eb 03                	jmp    0x100046da
100046d7:	8d 46 ec             	lea    eax,[esi-0x14]
100046da:	83 c6 18             	add    esi,0x18
100046dd:	33 c9                	xor    ecx,ecx
100046df:	66 89 08             	mov    WORD PTR [eax],cx
100046e2:	8d 46 ec             	lea    eax,[esi-0x14]
100046e5:	3b c7                	cmp    eax,edi
100046e7:	75 99                	jne    0x10004682
100046e9:	5f                   	pop    edi
100046ea:	5e                   	pop    esi
100046eb:	5d                   	pop    ebp
100046ec:	c3                   	ret
100046ed:	ff 15 b8 70 01 10    	call   DWORD PTR ds:0x100170b8
100046f3:	cc                   	int3
100046f4:	cc                   	int3
100046f5:	cc                   	int3
100046f6:	cc                   	int3
100046f7:	cc                   	int3
100046f8:	cc                   	int3
100046f9:	cc                   	int3
100046fa:	cc                   	int3
100046fb:	cc                   	int3
100046fc:	cc                   	int3
100046fd:	cc                   	int3
100046fe:	cc                   	int3
100046ff:	cc                   	int3
10004700:	55                   	push   ebp
10004701:	8b ec                	mov    ebp,esp
10004703:	83 ec 20             	sub    esp,0x20
10004706:	53                   	push   ebx
10004707:	8b 5d 0c             	mov    ebx,DWORD PTR [ebp+0xc]
1000470a:	33 c9                	xor    ecx,ecx
1000470c:	56                   	push   esi
1000470d:	57                   	push   edi
1000470e:	8b 7d 08             	mov    edi,DWORD PTR [ebp+0x8]
10004711:	33 f6                	xor    esi,esi
10004713:	2b df                	sub    ebx,edi
10004715:	89 75 fc             	mov    DWORD PTR [ebp-0x4],esi
10004718:	83 c3 03             	add    ebx,0x3
1000471b:	c1 eb 02             	shr    ebx,0x2
1000471e:	3b 7d 0c             	cmp    edi,DWORD PTR [ebp+0xc]
10004721:	0f 47 d9             	cmova  ebx,ecx
10004724:	89 5d 0c             	mov    DWORD PTR [ebp+0xc],ebx
10004727:	85 db                	test   ebx,ebx
10004729:	0f 84 87 00 00 00    	je     0x100047b6
1000472f:	90                   	nop
