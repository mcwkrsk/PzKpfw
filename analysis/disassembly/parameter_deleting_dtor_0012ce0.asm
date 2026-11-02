
/mnt/data/work_stage117/original/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

10012ce0 <.text+0x11ce0>:
10012ce0:	55                   	push   ebp
10012ce1:	8b ec                	mov    ebp,esp
10012ce3:	6a ff                	push   0xffffffff
10012ce5:	68 30 66 01 10       	push   0x10016630
10012cea:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10012cf0:	50                   	push   eax
10012cf1:	53                   	push   ebx
10012cf2:	56                   	push   esi
10012cf3:	57                   	push   edi
10012cf4:	a1 04 10 02 10       	mov    eax,ds:0x10021004
10012cf9:	33 c5                	xor    eax,ebp
10012cfb:	50                   	push   eax
10012cfc:	8d 45 f4             	lea    eax,[ebp-0xc]
10012cff:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10012d05:	8b f1                	mov    esi,ecx
10012d07:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
10012d0a:	f6 c3 02             	test   bl,0x2
10012d0d:	74 41                	je     0x10012d50
10012d0f:	68 30 2c 01 10       	push   0x10012c30
10012d14:	ff 76 fc             	push   DWORD PTR [esi-0x4]
10012d17:	8d 7e fc             	lea    edi,[esi-0x4]
10012d1a:	6a 08                	push   0x8
10012d1c:	56                   	push   esi
10012d1d:	e8 e7 1e 00 00       	call   0x10014c09
10012d22:	f6 c3 01             	test   bl,0x1
10012d25:	74 13                	je     0x10012d3a
10012d27:	8b 0f                	mov    ecx,DWORD PTR [edi]
10012d29:	8d 0c cd 04 00 00 00 	lea    ecx,[ecx*8+0x4]
10012d30:	51                   	push   ecx
10012d31:	57                   	push   edi
10012d32:	e8 08 20 00 00       	call   0x10014d3f
10012d37:	83 c4 08             	add    esp,0x8
10012d3a:	8b c7                	mov    eax,edi
10012d3c:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10012d3f:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10012d46:	59                   	pop    ecx
10012d47:	5f                   	pop    edi
10012d48:	5e                   	pop    esi
10012d49:	5b                   	pop    ebx
10012d4a:	8b e5                	mov    esp,ebp
10012d4c:	5d                   	pop    ebp
10012d4d:	c2 04 00             	ret    0x4
10012d50:	c7 06 74 75 01 10    	mov    DWORD PTR [esi],0x10017574
10012d56:	e8 45 a5 ff ff       	call   0x1000d2a0
10012d5b:	f6 c3 01             	test   bl,0x1
10012d5e:	74 0b                	je     0x10012d6b
10012d60:	6a 08                	push   0x8
10012d62:	56                   	push   esi
10012d63:	e8 c0 1f 00 00       	call   0x10014d28
10012d68:	83 c4 08             	add    esp,0x8
10012d6b:	8b c6                	mov    eax,esi
10012d6d:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10012d70:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10012d77:	59                   	pop    ecx
10012d78:	5f                   	pop    edi
10012d79:	5e                   	pop    esi
10012d7a:	5b                   	pop    ebx
