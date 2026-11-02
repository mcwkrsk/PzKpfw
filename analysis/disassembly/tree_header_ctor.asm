
/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

10001c10 <.text+0xc10>:
10001c10:	6a 18                	push   0x18
10001c12:	e8 d9 30 01 00       	call   0x10014cf0
10001c17:	83 c4 04             	add    esp,0x4
10001c1a:	85 c0                	test   eax,eax
10001c1c:	75 06                	jne    0x10001c24
10001c1e:	ff 25 b8 70 01 10    	jmp    DWORD PTR ds:0x100170b8
10001c24:	8d 48 04             	lea    ecx,[eax+0x4]
10001c27:	89 00                	mov    DWORD PTR [eax],eax
10001c29:	85 c9                	test   ecx,ecx
10001c2b:	74 02                	je     0x10001c2f
10001c2d:	89 01                	mov    DWORD PTR [ecx],eax
10001c2f:	8d 48 08             	lea    ecx,[eax+0x8]
10001c32:	85 c9                	test   ecx,ecx
10001c34:	74 02                	je     0x10001c38
10001c36:	89 01                	mov    DWORD PTR [ecx],eax
10001c38:	66 c7 40 0c 01 01    	mov    WORD PTR [eax+0xc],0x101
10001c3e:	c3                   	ret
10001c3f:	cc                   	int3
10001c40:	56                   	push   esi
10001c41:	6a 18                	push   0x18
10001c43:	8b f1                	mov    esi,ecx
10001c45:	e8 a6 30 01 00       	call   0x10014cf0
10001c4a:	8b d0                	mov    edx,eax
10001c4c:	83 c4 04             	add    esp,0x4
10001c4f:	85 d2                	test   edx,edx
10001c51:	75 06                	jne    0x10001c59
10001c53:	ff 15 b8 70 01 10    	call   DWORD PTR ds:0x100170b8
10001c59:	8b 06                	mov    eax,DWORD PTR [esi]
10001c5b:	8d 4a 04             	lea    ecx,[edx+0x4]
10001c5e:	89 02                	mov    DWORD PTR [edx],eax
10001c60:	85 c9                	test   ecx,ecx
10001c62:	74 04                	je     0x10001c68
10001c64:	8b 06                	mov    eax,DWORD PTR [esi]
10001c66:	89 01                	mov    DWORD PTR [ecx],eax
10001c68:	8d 4a 08             	lea    ecx,[edx+0x8]
10001c6b:	85 c9                	test   ecx,ecx
10001c6d:	74 04                	je     0x10001c73
10001c6f:	8b 06                	mov    eax,DWORD PTR [esi]
10001c71:	89 01                	mov    DWORD PTR [ecx],eax
10001c73:	8b c2                	mov    eax,edx
10001c75:	5e                   	pop    esi
10001c76:	c3                   	ret
10001c77:	cc                   	int3
10001c78:	cc                   	int3
10001c79:	cc                   	int3
10001c7a:	cc                   	int3
10001c7b:	cc                   	int3
10001c7c:	cc                   	int3
10001c7d:	cc                   	int3
10001c7e:	cc                   	int3
10001c7f:	cc                   	int3
