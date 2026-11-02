
/mnt/data/work_stage117/original/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

1000de60 <.text+0xce60>:
1000de60:	55                   	push   ebp
1000de61:	8b ec                	mov    ebp,esp
1000de63:	53                   	push   ebx
1000de64:	8b d9                	mov    ebx,ecx
1000de66:	8d 4d 08             	lea    ecx,[ebp+0x8]
1000de69:	56                   	push   esi
1000de6a:	57                   	push   edi
1000de6b:	51                   	push   ecx
1000de6c:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
1000de6f:	8b 70 18             	mov    esi,DWORD PTR [eax+0x18]
1000de72:	56                   	push   esi
1000de73:	ff 70 14             	push   DWORD PTR [eax+0x14]
1000de76:	e8 65 c5 ff ff       	call   0x1000a3e0
1000de7b:	8b 4b 04             	mov    ecx,DWORD PTR [ebx+0x4]
1000de7e:	8b f8                	mov    edi,eax
1000de80:	83 c1 14             	add    ecx,0x14
1000de83:	83 c4 0c             	add    esp,0xc
1000de86:	89 4d 08             	mov    DWORD PTR [ebp+0x8],ecx
1000de89:	8b 01                	mov    eax,DWORD PTR [ecx]
1000de8b:	3b f8                	cmp    edi,eax
1000de8d:	75 05                	jne    0x1000de94
1000de8f:	3b 71 04             	cmp    esi,DWORD PTR [ecx+0x4]
1000de92:	74 1b                	je     0x1000deaf
1000de94:	3b fe                	cmp    edi,esi
1000de96:	74 1a                	je     0x1000deb2
1000de98:	8b 59 04             	mov    ebx,DWORD PTR [ecx+0x4]
1000de9b:	2b de                	sub    ebx,esi
1000de9d:	53                   	push   ebx
1000de9e:	56                   	push   esi
1000de9f:	57                   	push   edi
1000dea0:	ff 15 4c 70 01 10    	call   DWORD PTR ds:0x1001704c
1000dea6:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
1000dea9:	8d 04 3b             	lea    eax,[ebx+edi*1]
1000deac:	83 c4 0c             	add    esp,0xc
1000deaf:	89 41 04             	mov    DWORD PTR [ecx+0x4],eax
1000deb2:	5f                   	pop    edi
1000deb3:	5e                   	pop    esi
1000deb4:	5b                   	pop    ebx
1000deb5:	5d                   	pop    ebp
1000deb6:	c2 04 00             	ret    0x4
1000deb9:	cc                   	int3
1000deba:	cc                   	int3
1000debb:	cc                   	int3
1000debc:	cc                   	int3
1000debd:	cc                   	int3
1000debe:	cc                   	int3
1000debf:	cc                   	int3
1000dec0:	55                   	push   ebp
1000dec1:	8b ec                	mov    ebp,esp
1000dec3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000dec6:	53                   	push   ebx
1000dec7:	8b d9                	mov    ebx,ecx
1000dec9:	89 45 08             	mov    DWORD PTR [ebp+0x8],eax
1000decc:	56                   	push   esi
1000decd:	57                   	push   edi
1000dece:	8d 45 08             	lea    eax,[ebp+0x8]
1000ded1:	8b 53 04             	mov    edx,DWORD PTR [ebx+0x4]
1000ded4:	50                   	push   eax
1000ded5:	8b 72 18             	mov    esi,DWORD PTR [edx+0x18]
1000ded8:	56                   	push   esi
1000ded9:	ff 72 14             	push   DWORD PTR [edx+0x14]
1000dedc:	e8 6f f7 ff ff       	call   0x1000d650
1000dee1:	8b 4b 04             	mov    ecx,DWORD PTR [ebx+0x4]
1000dee4:	8b f8                	mov    edi,eax
1000dee6:	83 c1 14             	add    ecx,0x14
1000dee9:	83 c4 0c             	add    esp,0xc
1000deec:	89 4d 08             	mov    DWORD PTR [ebp+0x8],ecx
1000deef:	8b 01                	mov    eax,DWORD PTR [ecx]
1000def1:	3b f8                	cmp    edi,eax
1000def3:	75 05                	jne    0x1000defa
1000def5:	3b 71 04             	cmp    esi,DWORD PTR [ecx+0x4]
1000def8:	74 1b                	je     0x1000df15
1000defa:	3b fe                	cmp    edi,esi
1000defc:	74 1a                	je     0x1000df18
1000defe:	8b 59 04             	mov    ebx,DWORD PTR [ecx+0x4]
1000df01:	2b de                	sub    ebx,esi
1000df03:	53                   	push   ebx
1000df04:	56                   	push   esi
1000df05:	57                   	push   edi
1000df06:	ff 15 4c 70 01 10    	call   DWORD PTR ds:0x1001704c
1000df0c:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
1000df0f:	8d 04 3b             	lea    eax,[ebx+edi*1]
1000df12:	83 c4 0c             	add    esp,0xc
1000df15:	89 41 04             	mov    DWORD PTR [ecx+0x4],eax
1000df18:	5f                   	pop    edi
1000df19:	5e                   	pop    esi
1000df1a:	5b                   	pop    ebx
1000df1b:	5d                   	pop    ebp
1000df1c:	c2 04 00             	ret    0x4
1000df1f:	cc                   	int3
