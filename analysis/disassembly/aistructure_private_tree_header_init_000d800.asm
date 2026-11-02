
/mnt/data/work_stage117/original/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

1000d800 <.text+0xc800>:
1000d800:	55                   	push   ebp
1000d801:	8b ec                	mov    ebp,esp
1000d803:	51                   	push   ecx
1000d804:	56                   	push   esi
1000d805:	57                   	push   edi
1000d806:	8b f9                	mov    edi,ecx
1000d808:	8d 77 04             	lea    esi,[edi+0x4]
1000d80b:	89 7d fc             	mov    DWORD PTR [ebp-0x4],edi
1000d80e:	8b ce                	mov    ecx,esi
1000d810:	89 75 fc             	mov    DWORD PTR [ebp-0x4],esi
1000d813:	c7 07 60 73 01 10    	mov    DWORD PTR [edi],0x10017360
1000d819:	c7 06 00 00 00 00    	mov    DWORD PTR [esi],0x0
1000d81f:	c7 46 04 00 00 00 00 	mov    DWORD PTR [esi+0x4],0x0
1000d826:	e8 c5 03 00 00       	call   0x1000dbf0
1000d82b:	89 06                	mov    DWORD PTR [esi],eax
1000d82d:	8b c7                	mov    eax,edi
1000d82f:	c7 47 0c 00 00 00 00 	mov    DWORD PTR [edi+0xc],0x0
1000d836:	c7 47 10 00 00 00 00 	mov    DWORD PTR [edi+0x10],0x0
1000d83d:	c7 47 14 00 00 00 00 	mov    DWORD PTR [edi+0x14],0x0
1000d844:	c7 47 18 00 00 00 00 	mov    DWORD PTR [edi+0x18],0x0
1000d84b:	c7 47 1c 00 00 00 00 	mov    DWORD PTR [edi+0x1c],0x0
1000d852:	c7 47 20 00 00 00 00 	mov    DWORD PTR [edi+0x20],0x0
1000d859:	c7 47 24 00 00 00 00 	mov    DWORD PTR [edi+0x24],0x0
1000d860:	c7 47 28 00 00 00 00 	mov    DWORD PTR [edi+0x28],0x0
1000d867:	5f                   	pop    edi
1000d868:	5e                   	pop    esi
1000d869:	8b e5                	mov    esp,ebp
1000d86b:	5d                   	pop    ebp
1000d86c:	c3                   	ret
