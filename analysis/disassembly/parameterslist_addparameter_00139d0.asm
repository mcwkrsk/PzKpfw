
/mnt/data/work_stage117/original/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

100139d0 <.text+0x129d0>:
100139d0:	55                   	push   ebp
100139d1:	8b ec                	mov    ebp,esp
100139d3:	6a ff                	push   0xffffffff
100139d5:	68 2f 6e 01 10       	push   0x10016e2f
100139da:	64 a1 00 00 00 00    	mov    eax,fs:0x0
100139e0:	50                   	push   eax
100139e1:	51                   	push   ecx
100139e2:	56                   	push   esi
100139e3:	57                   	push   edi
100139e4:	a1 04 10 02 10       	mov    eax,ds:0x10021004
100139e9:	33 c5                	xor    eax,ebp
100139eb:	50                   	push   eax
100139ec:	8d 45 f4             	lea    eax,[ebp-0xc]
100139ef:	64 a3 00 00 00 00    	mov    fs:0x0,eax
100139f5:	8b f9                	mov    edi,ecx
100139f7:	6a 08                	push   0x8
100139f9:	e8 f2 12 00 00       	call   0x10014cf0
100139fe:	83 c4 04             	add    esp,0x4
10013a01:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
10013a04:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10013a0b:	85 c0                	test   eax,eax
10013a0d:	74 0b                	je     0x10013a1a
10013a0f:	8b c8                	mov    ecx,eax
10013a11:	e8 3a f0 ff ff       	call   0x10012a50
10013a16:	8b f0                	mov    esi,eax
10013a18:	eb 02                	jmp    0x10013a1c
10013a1a:	33 f6                	xor    esi,esi
10013a1c:	56                   	push   esi
10013a1d:	8b cf                	mov    ecx,edi
10013a1f:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
10013a26:	e8 85 a3 ff ff       	call   0x1000ddb0
10013a2b:	8b c6                	mov    eax,esi
10013a2d:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10013a30:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10013a37:	59                   	pop    ecx
10013a38:	5f                   	pop    edi
10013a39:	5e                   	pop    esi
10013a3a:	8b e5                	mov    esp,ebp
10013a3c:	5d                   	pop    ebp
10013a3d:	c3                   	ret
