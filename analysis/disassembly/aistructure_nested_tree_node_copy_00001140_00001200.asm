; MAIWmodels.dll (PE32 / x86)
; Image base: 0x10000000
; SHA-256: 80ccc6678bdf057152f473369a56eb3b76a1ce643edca2832345f7b53e09c525
; Create inner node and copy two DWORD payload words.
; Range: 0x10001140..0x10001200


/mnt/data/work_stage117/original/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

10001140 <.text+0x140>:
10001140:	55                   	push   ebp
10001141:	8b ec                	mov    ebp,esp
10001143:	6a ff                	push   0xffffffff
10001145:	68 70 5b 01 10       	push   0x10015b70
1000114a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10001150:	50                   	push   eax
10001151:	83 ec 08             	sub    esp,0x8
10001154:	53                   	push   ebx
10001155:	56                   	push   esi
10001156:	57                   	push   edi
10001157:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000115c:	33 c5                	xor    eax,ebp
1000115e:	50                   	push   eax
1000115f:	8d 45 f4             	lea    eax,[ebp-0xc]
10001162:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10001168:	89 65 f0             	mov    DWORD PTR [ebp-0x10],esp
1000116b:	8b f1                	mov    esi,ecx
1000116d:	89 75 ec             	mov    DWORD PTR [ebp-0x14],esi
10001170:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10001173:	8b 3e                	mov    edi,DWORD PTR [esi]
10001175:	80 78 0d 00          	cmp    BYTE PTR [eax+0xd],0x0
10001179:	75 4e                	jne    0x100011c9
1000117b:	83 c0 10             	add    eax,0x10
1000117e:	50                   	push   eax
1000117f:	e8 0c ff ff ff       	call   0x10001090
10001184:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
10001187:	8b d8                	mov    ebx,eax
10001189:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
1000118c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10001193:	89 43 04             	mov    DWORD PTR [ebx+0x4],eax
10001196:	8a 41 0c             	mov    al,BYTE PTR [ecx+0xc]
10001199:	88 43 0c             	mov    BYTE PTR [ebx+0xc],al
1000119c:	ff 75 10             	push   DWORD PTR [ebp+0x10]
1000119f:	80 7f 0d 00          	cmp    BYTE PTR [edi+0xd],0x0
100011a3:	53                   	push   ebx
100011a4:	ff 31                	push   DWORD PTR [ecx]
100011a6:	0f 45 fb             	cmovne edi,ebx
100011a9:	8b ce                	mov    ecx,esi
100011ab:	89 7d 0c             	mov    DWORD PTR [ebp+0xc],edi
100011ae:	e8 8d ff ff ff       	call   0x10001140
100011b3:	89 03                	mov    DWORD PTR [ebx],eax
100011b5:	8b ce                	mov    ecx,esi
100011b7:	ff 75 10             	push   DWORD PTR [ebp+0x10]
100011ba:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
100011bd:	53                   	push   ebx
100011be:	ff 70 08             	push   DWORD PTR [eax+0x8]
100011c1:	e8 7a ff ff ff       	call   0x10001140
100011c6:	89 43 08             	mov    DWORD PTR [ebx+0x8],eax
100011c9:	8b c7                	mov    eax,edi
100011cb:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
100011ce:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
100011d5:	59                   	pop    ecx
100011d6:	5f                   	pop    edi
100011d7:	5e                   	pop    esi
100011d8:	5b                   	pop    ebx
100011d9:	8b e5                	mov    esp,ebp
100011db:	5d                   	pop    ebp
100011dc:	c2 0c 00             	ret    0xc
100011df:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
100011e2:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
100011e5:	e8 e6 26 01 00       	call   0x100138d0
100011ea:	6a 00                	push   0x0
100011ec:	6a 00                	push   0x0
100011ee:	e8 b5 48 01 00       	call   0x10015aa8
100011f3:	cc                   	int3
100011f4:	cc                   	int3
100011f5:	cc                   	int3
100011f6:	cc                   	int3
100011f7:	cc                   	int3
100011f8:	cc                   	int3
100011f9:	cc                   	int3
100011fa:	cc                   	int3
100011fb:	cc                   	int3
100011fc:	cc                   	int3
100011fd:	cc                   	int3
100011fe:	cc                   	int3
100011ff:	cc                   	int3
