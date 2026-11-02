
/mnt/data/work_stage117/original/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

1000dcb0 <.text+0xccb0>:
1000dcb0:	55                   	push   ebp
1000dcb1:	8b ec                	mov    ebp,esp
1000dcb3:	51                   	push   ecx
1000dcb4:	53                   	push   ebx
1000dcb5:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
1000dcb8:	8b c1                	mov    eax,ecx
1000dcba:	56                   	push   esi
1000dcbb:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
1000dcbe:	8b f3                	mov    esi,ebx
1000dcc0:	80 7b 0d 00          	cmp    BYTE PTR [ebx+0xd],0x0
1000dcc4:	75 45                	jne    0x1000dd0b
1000dcc6:	57                   	push   edi
1000dcc7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [eax+eax*1+0x0]
1000dcce:	00 00 
1000dcd0:	ff 76 08             	push   DWORD PTR [esi+0x8]
1000dcd3:	8b c8                	mov    ecx,eax
1000dcd5:	e8 d6 ff ff ff       	call   0x1000dcb0
1000dcda:	8b 43 14             	mov    eax,DWORD PTR [ebx+0x14]
1000dcdd:	8d 4b 14             	lea    ecx,[ebx+0x14]
1000dce0:	8b 36                	mov    esi,DWORD PTR [esi]
1000dce2:	50                   	push   eax
1000dce3:	ff 30                	push   DWORD PTR [eax]
1000dce5:	8d 45 08             	lea    eax,[ebp+0x8]
1000dce8:	50                   	push   eax
1000dce9:	e8 e2 5e 00 00       	call   0x10013bd0
1000dcee:	ff 73 14             	push   DWORD PTR [ebx+0x14]
1000dcf1:	e8 2d 70 00 00       	call   0x10014d23
1000dcf6:	53                   	push   ebx
1000dcf7:	e8 27 70 00 00       	call   0x10014d23
1000dcfc:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
1000dcff:	83 c4 08             	add    esp,0x8
1000dd02:	80 7e 0d 00          	cmp    BYTE PTR [esi+0xd],0x0
1000dd06:	8b de                	mov    ebx,esi
1000dd08:	74 c6                	je     0x1000dcd0
1000dd0a:	5f                   	pop    edi
1000dd0b:	5e                   	pop    esi
1000dd0c:	5b                   	pop    ebx
1000dd0d:	8b e5                	mov    esp,ebp
1000dd0f:	5d                   	pop    ebp
1000dd10:	c2 04 00             	ret    0x4
