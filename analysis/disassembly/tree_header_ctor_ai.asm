
/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

1000dbf0 <.text+0xcbf0>:
1000dbf0:	6a 1c                	push   0x1c
1000dbf2:	e8 f9 70 00 00       	call   0x10014cf0
1000dbf7:	83 c4 04             	add    esp,0x4
1000dbfa:	85 c0                	test   eax,eax
1000dbfc:	75 06                	jne    0x1000dc04
1000dbfe:	ff 25 b8 70 01 10    	jmp    DWORD PTR ds:0x100170b8
1000dc04:	8d 48 04             	lea    ecx,[eax+0x4]
1000dc07:	89 00                	mov    DWORD PTR [eax],eax
1000dc09:	85 c9                	test   ecx,ecx
1000dc0b:	74 02                	je     0x1000dc0f
1000dc0d:	89 01                	mov    DWORD PTR [ecx],eax
1000dc0f:	8d 48 08             	lea    ecx,[eax+0x8]
1000dc12:	85 c9                	test   ecx,ecx
1000dc14:	74 02                	je     0x1000dc18
1000dc16:	89 01                	mov    DWORD PTR [ecx],eax
1000dc18:	66 c7 40 0c 01 01    	mov    WORD PTR [eax+0xc],0x101
1000dc1e:	c3                   	ret
1000dc1f:	cc                   	int3
1000dc20:	55                   	push   ebp
1000dc21:	8b ec                	mov    ebp,esp
1000dc23:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000dc26:	85 c0                	test   eax,eax
1000dc28:	74 12                	je     0x1000dc3c
1000dc2a:	c7 00 68 73 01 10    	mov    DWORD PTR [eax],0x10017368
1000dc30:	8b 51 04             	mov    edx,DWORD PTR [ecx+0x4]
1000dc33:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
1000dc36:	8b 49 08             	mov    ecx,DWORD PTR [ecx+0x8]
1000dc39:	89 48 08             	mov    DWORD PTR [eax+0x8],ecx
1000dc3c:	5d                   	pop    ebp
1000dc3d:	c2 04 00             	ret    0x4
1000dc40:	55                   	push   ebp
1000dc41:	8b ec                	mov    ebp,esp
1000dc43:	51                   	push   ecx
1000dc44:	53                   	push   ebx
1000dc45:	8b d9                	mov    ebx,ecx
1000dc47:	56                   	push   esi
1000dc48:	57                   	push   edi
1000dc49:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
1000dc4c:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
1000dc4f:	8d 43 08             	lea    eax,[ebx+0x8]
1000dc52:	50                   	push   eax
1000dc53:	8b 72 24             	mov    esi,DWORD PTR [edx+0x24]
1000dc56:	56                   	push   esi
1000dc57:	ff 72 20             	push   DWORD PTR [edx+0x20]
1000dc5a:	e8 81 c7 ff ff       	call   0x1000a3e0
1000dc5f:	8b                   	.byte 0x8b
