
/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

10013bd0 <.text+0x12bd0>:
10013bd0:	55                   	push   ebp
10013bd1:	8b ec                	mov    ebp,esp
10013bd3:	51                   	push   ecx
10013bd4:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10013bd7:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
10013bda:	56                   	push   esi
10013bdb:	57                   	push   edi
10013bdc:	8b f9                	mov    edi,ecx
10013bde:	8b 37                	mov    esi,DWORD PTR [edi]
10013be0:	3b 06                	cmp    eax,DWORD PTR [esi]
10013be2:	75 1a                	jne    0x10013bfe
10013be4:	3b d6                	cmp    edx,esi
10013be6:	75 16                	jne    0x10013bfe
10013be8:	e8 53 fe ff ff       	call   0x10013a40
10013bed:	8b 07                	mov    eax,DWORD PTR [edi]
10013bef:	5f                   	pop    edi
10013bf0:	5e                   	pop    esi
10013bf1:	8b 08                	mov    ecx,DWORD PTR [eax]
10013bf3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10013bf6:	89 08                	mov    DWORD PTR [eax],ecx
10013bf8:	8b e5                	mov    esp,ebp
10013bfa:	5d                   	pop    ebp
10013bfb:	c2 0c 00             	ret    0xc
10013bfe:	3b c2                	cmp    eax,edx
10013c00:	74 5d                	je     0x10013c5f
10013c02:	80 78 0d 00          	cmp    BYTE PTR [eax+0xd],0x0
10013c06:	8b c8                	mov    ecx,eax
10013c08:	75 41                	jne    0x10013c4b
10013c0a:	8b 50 08             	mov    edx,DWORD PTR [eax+0x8]
10013c0d:	80 7a 0d 00          	cmp    BYTE PTR [edx+0xd],0x0
10013c11:	75 19                	jne    0x10013c2c
10013c13:	8b 02                	mov    eax,DWORD PTR [edx]
10013c15:	80 78 0d 00          	cmp    BYTE PTR [eax+0xd],0x0
10013c19:	75 2d                	jne    0x10013c48
10013c1b:	0f 1f 44 00 00       	nop    DWORD PTR [eax+eax*1+0x0]
10013c20:	8b d0                	mov    edx,eax
10013c22:	8b 02                	mov    eax,DWORD PTR [edx]
10013c24:	80 78 0d 00          	cmp    BYTE PTR [eax+0xd],0x0
10013c28:	74 f6                	je     0x10013c20
10013c2a:	eb 1c                	jmp    0x10013c48
10013c2c:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
10013c2f:	80 7a 0d 00          	cmp    BYTE PTR [edx+0xd],0x0
10013c33:	75 13                	jne    0x10013c48
10013c35:	3b 42 08             	cmp    eax,DWORD PTR [edx+0x8]
10013c38:	75 0e                	jne    0x10013c48
10013c3a:	8b c2                	mov    eax,edx
10013c3c:	89 45 0c             	mov    DWORD PTR [ebp+0xc],eax
10013c3f:	8b                   	.byte 0x8b
