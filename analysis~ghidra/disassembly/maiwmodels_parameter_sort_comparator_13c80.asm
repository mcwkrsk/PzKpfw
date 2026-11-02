
/mnt/data/is2_work/original/IS2_PMauto_beta/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

10013c80 <.text+0x12c80>:
10013c80:	55                   	push   ebp
10013c81:	8b ec                	mov    ebp,esp
10013c83:	53                   	push   ebx
10013c84:	56                   	push   esi
10013c85:	57                   	push   edi
10013c86:	8b 7d 08             	mov    edi,DWORD PTR [ebp+0x8]
10013c89:	8b cf                	mov    ecx,edi
10013c8b:	e8 f0 f2 ff ff       	call   0x10012f80
10013c90:	8b 5d 0c             	mov    ebx,DWORD PTR [ebp+0xc]
10013c93:	8b f0                	mov    esi,eax
10013c95:	8b cb                	mov    ecx,ebx
10013c97:	e8 e4 f2 ff ff       	call   0x10012f80
10013c9c:	8b cf                	mov    ecx,edi
10013c9e:	3b f0                	cmp    esi,eax
10013ca0:	75 1a                	jne    0x10013cbc
10013ca2:	e8 b9 d9 ff ff       	call   0x10011660
10013ca7:	8b cb                	mov    ecx,ebx
10013ca9:	8b f0                	mov    esi,eax
10013cab:	e8 b0 d9 ff ff       	call   0x10011660
10013cb0:	33 c9                	xor    ecx,ecx
10013cb2:	3b f0                	cmp    esi,eax
10013cb4:	5f                   	pop    edi
10013cb5:	5e                   	pop    esi
10013cb6:	0f 9c c0             	setl   al
10013cb9:	5b                   	pop    ebx
10013cba:	5d                   	pop    ebp
10013cbb:	c3                   	ret
10013cbc:	e8 bf f2 ff ff       	call   0x10012f80
10013cc1:	8b cb                	mov    ecx,ebx
10013cc3:	8b f0                	mov    esi,eax
10013cc5:	e8 b6 f2 ff ff       	call   0x10012f80
10013cca:	33 c9                	xor    ecx,ecx
10013ccc:	3b f0                	cmp    esi,eax
10013cce:	5f                   	pop    edi
10013ccf:	5e                   	pop    esi
10013cd0:	0f 9c c0             	setl   al
10013cd3:	5b                   	pop    ebx
10013cd4:	5d                   	pop    ebp
10013cd5:	c3                   	ret
10013cd6:	cc                   	int3
10013cd7:	cc                   	int3
10013cd8:	cc                   	int3
10013cd9:	cc                   	int3
10013cda:	cc                   	int3
10013cdb:	cc                   	int3
10013cdc:	cc                   	int3
10013cdd:	cc                   	int3
10013cde:	cc                   	int3
10013cdf:	cc                   	int3
10013ce0:	55                   	push   ebp
10013ce1:	8b ec                	mov    ebp,esp
10013ce3:	51                   	push   ecx
10013ce4:	56                   	push   esi
10013ce5:	8b f1                	mov    esi,ecx
10013ce7:	89 75 fc             	mov    DWORD PTR [ebp-0x4],esi
10013cea:	e8 61 d7 fe ff       	call   0x10001450
10013cef:	c7 06 b4 75 01 10    	mov    DWORD PTR [esi],0x100175b4
10013cf5:	8b c6                	mov    eax,esi
10013cf7:	5e                   	pop    esi
10013cf8:	8b e5                	mov    esp,ebp
10013cfa:	5d                   	pop    ebp
10013cfb:	c2 04 00             	ret    0x4
10013cfe:	cc                   	int3
10013cff:	cc                   	int3
10013d00:	55                   	push   ebp
10013d01:	8b ec                	mov    ebp,esp
10013d03:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
10013d06:	c7 01 f4 70 01 10    	mov    DWORD PTR [ecx],0x100170f4
10013d0c:	8b 42 04             	mov    eax,DWORD PTR [edx+0x4]
10013d0f:	89 41 04             	mov    DWORD PTR [ecx+0x4],eax
10013d12:	c7 01 b4 75 01 10    	mov    DWORD PTR [ecx],0x100175b4
10013d18:	8b 42 08             	mov    eax,DWORD PTR [edx+0x8]
10013d1b:	89 41 08             	mov    DWORD PTR [ecx+0x8],eax
10013d1e:	8b c1                	mov    eax,ecx
10013d20:	5d                   	pop    ebp
10013d21:	c2 04 00             	ret    0x4
10013d24:	cc                   	int3
10013d25:	cc                   	int3
10013d26:	cc                   	int3
10013d27:	cc                   	int3
10013d28:	cc                   	int3
10013d29:	cc                   	int3
10013d2a:	cc                   	int3
10013d2b:	cc                   	int3
10013d2c:	cc                   	int3
10013d2d:	cc                   	int3
10013d2e:	cc                   	int3
10013d2f:	cc                   	int3
10013d30:	55                   	push   ebp
10013d31:	8b ec                	mov    ebp,esp
10013d33:	6a ff                	push   0xffffffff
10013d35:	68 c4 6e 01 10       	push   0x10016ec4
10013d3a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10013d40:	50                   	push   eax
10013d41:	83 ec 08             	sub    esp,0x8
10013d44:	56                   	push   esi
10013d45:	a1 04 10 02 10       	mov    eax,ds:0x10021004
10013d4a:	33 c5                	xor    eax,ebp
10013d4c:	50                   	push   eax
10013d4d:	8d 45 f4             	lea    eax,[ebp-0xc]
