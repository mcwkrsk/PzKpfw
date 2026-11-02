
/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

10001200 <.text+0x200>:
10001200:	55                   	push   ebp
10001201:	8b ec                	mov    ebp,esp
10001203:	53                   	push   ebx
10001204:	56                   	push   esi
10001205:	8b d9                	mov    ebx,ecx
10001207:	57                   	push   edi
10001208:	8b 7d 08             	mov    edi,DWORD PTR [ebp+0x8]
1000120b:	c7 03 00 00 00 00    	mov    DWORD PTR [ebx],0x0
10001211:	c7 43 04 00 00 00 00 	mov    DWORD PTR [ebx+0x4],0x0
10001218:	c7 43 08 00 00 00 00 	mov    DWORD PTR [ebx+0x8],0x0
1000121f:	8b 77 04             	mov    esi,DWORD PTR [edi+0x4]
10001222:	2b 37                	sub    esi,DWORD PTR [edi]
10001224:	c1 fe 02             	sar    esi,0x2
10001227:	c7 03 00 00 00 00    	mov    DWORD PTR [ebx],0x0
1000122d:	c7 43 04 00 00 00 00 	mov    DWORD PTR [ebx+0x4],0x0
10001234:	c7 43 08 00 00 00 00 	mov    DWORD PTR [ebx+0x8],0x0
1000123b:	85 f6                	test   esi,esi
1000123d:	74 44                	je     0x10001283
1000123f:	81 fe ff ff ff 3f    	cmp    esi,0x3fffffff
10001245:	76 0b                	jbe    0x10001252
10001247:	68 4c 71 01 10       	push   0x1001714c
1000124c:	ff 15 34 70 01 10    	call   DWORD PTR ds:0x10017034
10001252:	56                   	push   esi
10001253:	e8 a8 15 00 00       	call   0x10002800
10001258:	89 03                	mov    DWORD PTR [ebx],eax
1000125a:	89 43 04             	mov    DWORD PTR [ebx+0x4],eax
1000125d:	8b 03                	mov    eax,DWORD PTR [ebx]
1000125f:	8d 04 b0             	lea    eax,[eax+esi*4]
10001262:	89 43 08             	mov    DWORD PTR [ebx+0x8],eax
10001265:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10001268:	8b 7f 04             	mov    edi,DWORD PTR [edi+0x4]
1000126b:	8b 33                	mov    esi,DWORD PTR [ebx]
1000126d:	8b 00                	mov    eax,DWORD PTR [eax]
1000126f:	2b f8                	sub    edi,eax
10001271:	57                   	push   edi
10001272:	50                   	push   eax
10001273:	56                   	push   esi
10001274:	ff 15 4c 70 01 10    	call   DWORD PTR ds:0x1001704c
1000127a:	8d 04 37             	lea    eax,[edi+esi*1]
1000127d:	83 c4 0c             	add    esp,0xc
10001280:	89 43 04             	mov    DWORD PTR [ebx+0x4],eax
10001283:	5f                   	pop    edi
10001284:	5e                   	pop    esi
10001285:	8b c3                	mov    eax,ebx
10001287:	5b                   	pop    ebx
10001288:	5d                   	pop    ebp
10001289:	c2 04 00             	ret    0x4
1000128c:	cc                   	int3
1000128d:	cc                   	int3
1000128e:	cc                   	int3
1000128f:	cc                   	int3
10001290:	55                   	push   ebp
10001291:	8b ec                	mov    ebp,esp
10001293:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10001296:	c7 01 04 71 01 10    	mov    DWORD PTR [ecx],0x10017104
1000129c:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
1000129f:	89 41 04             	mov    DWORD PTR [ecx+0x4],eax
100012a2:	8b c1                	mov    eax,ecx
100012a4:	5d                   	pop    ebp
100012a5:	c2 04 00             	ret    0x4
100012a8:	cc                   	int3
100012a9:	cc                   	int3
100012aa:	cc                   	int3
100012ab:	cc                   	int3
100012ac:	cc                   	int3
100012ad:	cc                   	int3
100012ae:	cc                   	int3
100012af:	cc                   	int3
100012b0:	55                   	push   ebp
100012b1:	8b ec                	mov    ebp,esp
100012b3:	6a ff                	push   0xffffffff
100012b5:	68 18 6f 01 10       	push   0x10016f18
100012ba:	64 a1 00 00 00 00    	mov    eax,fs:0x0
