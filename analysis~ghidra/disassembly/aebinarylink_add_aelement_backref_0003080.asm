
/mnt/data/work_stage117/original/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

10003080 <.text+0x2080>:
10003080:	55                   	push   ebp
10003081:	8b ec                	mov    ebp,esp
10003083:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10003086:	53                   	push   ebx
10003087:	56                   	push   esi
10003088:	8b 75 0c             	mov    esi,DWORD PTR [ebp+0xc]
1000308b:	57                   	push   edi
1000308c:	8b f9                	mov    edi,ecx
1000308e:	8d 1c 85 1c 00 00 00 	lea    ebx,[eax*4+0x1c]
10003095:	8b 47 04             	mov    eax,DWORD PTR [edi+0x4]
10003098:	8b 04 03             	mov    eax,DWORD PTR [ebx+eax*1]
1000309b:	3b c6                	cmp    eax,esi
1000309d:	0f 84 a8 00 00 00    	je     0x1000314b
100030a3:	85 c0                	test   eax,eax
100030a5:	74 08                	je     0x100030af
100030a7:	6a 01                	push   0x1
100030a9:	50                   	push   eax
100030aa:	e8 61 01 00 00       	call   0x10003210
100030af:	8b 47 04             	mov    eax,DWORD PTR [edi+0x4]
100030b2:	89 34 03             	mov    DWORD PTR [ebx+eax*1],esi
100030b5:	33 c0                	xor    eax,eax
100030b7:	8b 76 04             	mov    esi,DWORD PTR [esi+0x4]
100030ba:	8b 4e 14             	mov    ecx,DWORD PTR [esi+0x14]
100030bd:	8b d1                	mov    edx,ecx
100030bf:	8b 5e 10             	mov    ebx,DWORD PTR [esi+0x10]
100030c2:	2b d3                	sub    edx,ebx
100030c4:	c1 fa 02             	sar    edx,0x2
100030c7:	85 d2                	test   edx,edx
100030c9:	74 13                	je     0x100030de
100030cb:	2b cb                	sub    ecx,ebx
100030cd:	c1 f9 02             	sar    ecx,0x2
100030d0:	3b c8                	cmp    ecx,eax
100030d2:	76 50                	jbe    0x10003124
100030d4:	39 3c 83             	cmp    DWORD PTR [ebx+eax*4],edi
100030d7:	74 72                	je     0x1000314b
100030d9:	40                   	inc    eax
100030da:	3b c2                	cmp    eax,edx
100030dc:	72 f2                	jb     0x100030d0
100030de:	8b 46 14             	mov    eax,DWORD PTR [esi+0x14]
100030e1:	8d 4d 08             	lea    ecx,[ebp+0x8]
100030e4:	89 7d 08             	mov    DWORD PTR [ebp+0x8],edi
100030e7:	3b c8                	cmp    ecx,eax
100030e9:	73 44                	jae    0x1000312f
100030eb:	8b cb                	mov    ecx,ebx
100030ed:	8d 55 08             	lea    edx,[ebp+0x8]
100030f0:	3b ca                	cmp    ecx,edx
100030f2:	77 3b                	ja     0x1000312f
100030f4:	8b fa                	mov    edi,edx
100030f6:	2b f9                	sub    edi,ecx
100030f8:	c1 ff 02             	sar    edi,0x2
100030fb:	3b 46 18             	cmp    eax,DWORD PTR [esi+0x18]
100030fe:	75 0a                	jne    0x1000310a
10003100:	6a 01                	push   0x1
10003102:	8d 4e 10             	lea    ecx,[esi+0x10]
10003105:	e8 06 ff ff ff       	call   0x10003010
1000310a:	8b 4e 14             	mov    ecx,DWORD PTR [esi+0x14]
1000310d:	85 c9                	test   ecx,ecx
1000310f:	74 36                	je     0x10003147
10003111:	8b 46 10             	mov    eax,DWORD PTR [esi+0x10]
10003114:	8b 04 b8             	mov    eax,DWORD PTR [eax+edi*4]
10003117:	5f                   	pop    edi
10003118:	89 01                	mov    DWORD PTR [ecx],eax
1000311a:	83 46 14 04          	add    DWORD PTR [esi+0x14],0x4
1000311e:	5e                   	pop    esi
1000311f:	5b                   	pop    ebx
10003120:	5d                   	pop    ebp
10003121:	c2 08 00             	ret    0x8
10003124:	68 ec 71 01 10       	push   0x100171ec
10003129:	ff 15 38 70 01 10    	call   DWORD PTR ds:0x10017038
1000312f:	3b 46 18             	cmp    eax,DWORD PTR [esi+0x18]
10003132:	75 0a                	jne    0x1000313e
10003134:	6a 01                	push   0x1
10003136:	8d 4e 10             	lea    ecx,[esi+0x10]
10003139:	e8 d2 fe ff ff       	call   0x10003010
1000313e:	8b 46 14             	mov    eax,DWORD PTR [esi+0x14]
10003141:	85 c0                	test   eax,eax
10003143:	74 02                	je     0x10003147
10003145:	89 38                	mov    DWORD PTR [eax],edi
10003147:	83 46 14 04          	add    DWORD PTR [esi+0x14],0x4
1000314b:	5f                   	pop    edi
1000314c:	5e                   	pop    esi
1000314d:	5b                   	pop    ebx
1000314e:	5d                   	pop    ebp
1000314f:	c2 08 00             	ret    0x8
