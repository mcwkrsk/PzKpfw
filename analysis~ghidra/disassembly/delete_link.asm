
/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

1000ddf0 <.text+0xcdf0>:
1000ddf0:	55                   	push   ebp
1000ddf1:	8b ec                	mov    ebp,esp
1000ddf3:	51                   	push   ecx
1000ddf4:	53                   	push   ebx
1000ddf5:	8b d9                	mov    ebx,ecx
1000ddf7:	8d 4d 08             	lea    ecx,[ebp+0x8]
1000ddfa:	56                   	push   esi
1000ddfb:	57                   	push   edi
1000ddfc:	51                   	push   ecx
1000ddfd:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
1000de00:	8b 70 24             	mov    esi,DWORD PTR [eax+0x24]
1000de03:	56                   	push   esi
1000de04:	ff 70 20             	push   DWORD PTR [eax+0x20]
1000de07:	e8 d4 c5 ff ff       	call   0x1000a3e0
1000de0c:	8b 4b 04             	mov    ecx,DWORD PTR [ebx+0x4]
1000de0f:	8b f8                	mov    edi,eax
1000de11:	83 c1 20             	add    ecx,0x20
1000de14:	83 c4 0c             	add    esp,0xc
1000de17:	89 4d fc             	mov    DWORD PTR [ebp-0x4],ecx
1000de1a:	8b 01                	mov    eax,DWORD PTR [ecx]
1000de1c:	3b f8                	cmp    edi,eax
1000de1e:	75 05                	jne    0x1000de25
1000de20:	3b 71 04             	cmp    esi,DWORD PTR [ecx+0x4]
1000de23:	74 1b                	je     0x1000de40
1000de25:	3b fe                	cmp    edi,esi
1000de27:	74 1a                	je     0x1000de43
1000de29:	8b 59 04             	mov    ebx,DWORD PTR [ecx+0x4]
1000de2c:	2b de                	sub    ebx,esi
1000de2e:	53                   	push   ebx
1000de2f:	56                   	push   esi
1000de30:	57                   	push   edi
1000de31:	ff 15 4c 70 01 10    	call   DWORD PTR ds:0x1001704c
1000de37:	8b 4d fc             	mov    ecx,DWORD PTR [ebp-0x4]
1000de3a:	8d 04 3b             	lea    eax,[ebx+edi*1]
1000de3d:	83 c4 0c             	add    esp,0xc
1000de40:	89 41 04             	mov    DWORD PTR [ecx+0x4],eax
1000de43:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
1000de46:	5f                   	pop    edi
1000de47:	5e                   	pop    esi
1000de48:	5b                   	pop    ebx
1000de49:	85 c9                	test   ecx,ecx
1000de4b:	74 06                	je     0x1000de53
1000de4d:	8b 01                	mov    eax,DWORD PTR [ecx]
1000de4f:	6a 01                	push   0x1
1000de51:	ff 10                	call   DWORD PTR [eax]
1000de53:	8b e5                	mov    esp,ebp
1000de55:	5d                   	pop    ebp
1000de56:	c2 04 00             	ret    0x4
1000de59:	cc                   	int3
1000de5a:	cc                   	int3
1000de5b:	cc                   	int3
1000de5c:	cc                   	int3
1000de5d:	cc                   	int3
1000de5e:	cc                   	int3
1000de5f:	cc                   	int3
