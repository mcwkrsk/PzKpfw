
/mnt/data/work_stage117/original/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

10012970 <.text+0x11970>:
10012970:	55                   	push   ebp
10012971:	8b ec                	mov    ebp,esp
10012973:	6a ff                	push   0xffffffff
10012975:	68 cf 6c 01 10       	push   0x10016ccf
1001297a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10012980:	50                   	push   eax
10012981:	51                   	push   ecx
10012982:	56                   	push   esi
10012983:	57                   	push   edi
10012984:	a1 04 10 02 10       	mov    eax,ds:0x10021004
10012989:	33 c5                	xor    eax,ebp
1001298b:	50                   	push   eax
1001298c:	8d 45 f4             	lea    eax,[ebp-0xc]
1001298f:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10012995:	8b f9                	mov    edi,ecx
10012997:	6a 0c                	push   0xc
10012999:	e8 52 23 00 00       	call   0x10014cf0
1001299e:	83 c4 04             	add    esp,0x4
100129a1:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
100129a4:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
100129ab:	85 c0                	test   eax,eax
100129ad:	74 0b                	je     0x100129ba
100129af:	8b c8                	mov    ecx,eax
100129b1:	e8 5a fa ff ff       	call   0x10012410
100129b6:	8b f0                	mov    esi,eax
100129b8:	eb 02                	jmp    0x100129bc
100129ba:	33 f6                	xor    esi,esi
100129bc:	56                   	push   esi
100129bd:	8b cf                	mov    ecx,edi
100129bf:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
100129c6:	e8 e5 b3 ff ff       	call   0x1000ddb0
100129cb:	8b c6                	mov    eax,esi
100129cd:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
100129d0:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
100129d7:	59                   	pop    ecx
100129d8:	5f                   	pop    edi
100129d9:	5e                   	pop    esi
100129da:	8b e5                	mov    esp,ebp
100129dc:	5d                   	pop    ebp
100129dd:	c3                   	ret
