; MAIWmodels.dll lifecycle / ownership evidence
; PE32 x86, image base 0x10000000, SHA-256 80ccc6678bdf057152f473369a56eb3b76a1ce643edca2832345f7b53e09c525
; Generated with GNU objdump -d -Mintel. Raw evidence, not decompiler output.

; ===== AFStructure public copy constructor (10001320..10001359) =====

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

10001320 <.text+0x320>:
10001320:	55                   	push   ebp
10001321:	8b ec                	mov    ebp,esp
10001323:	83 ec 08             	sub    esp,0x8
10001326:	56                   	push   esi
10001327:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
1000132a:	8d 45 ff             	lea    eax,[ebp-0x1]
1000132d:	57                   	push   edi
1000132e:	8b f9                	mov    edi,ecx
10001330:	50                   	push   eax
10001331:	8d 46 04             	lea    eax,[esi+0x4]
10001334:	89 7d f8             	mov    DWORD PTR [ebp-0x8],edi
10001337:	50                   	push   eax
10001338:	8d 4f 04             	lea    ecx,[edi+0x4]
1000133b:	c7 07 3c 71 01 10    	mov    DWORD PTR [edi],0x1001713c
10001341:	89 4d f8             	mov    DWORD PTR [ebp-0x8],ecx
10001344:	e8 b7 fc ff ff       	call   0x10001000
10001349:	8b 46 0c             	mov    eax,DWORD PTR [esi+0xc]
1000134c:	89 47 0c             	mov    DWORD PTR [edi+0xc],eax
1000134f:	8b c7                	mov    eax,edi
10001351:	5f                   	pop    edi
10001352:	5e                   	pop    esi
10001353:	8b e5                	mov    esp,ebp
10001355:	5d                   	pop    ebp
10001356:	c2 04 00             	ret    0x4

; ===== AIStructure public copy constructor (10001360..10001378) =====

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

10001360 <.text+0x360>:
10001360:	55                   	push   ebp
10001361:	8b ec                	mov    ebp,esp
10001363:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10001366:	c7 01 fc 70 01 10    	mov    DWORD PTR [ecx],0x100170fc
1000136c:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
1000136f:	89 41 04             	mov    DWORD PTR [ecx+0x4],eax
10001372:	8b c1                	mov    eax,ecx
10001374:	5d                   	pop    ebp
10001375:	c2 04 00             	ret    0x4

; ===== AbstractModel public copy constructor (10001430..10001448) =====

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

10001430 <.text+0x430>:
10001430:	55                   	push   ebp
10001431:	8b ec                	mov    ebp,esp
10001433:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10001436:	c7 01 f4 70 01 10    	mov    DWORD PTR [ecx],0x100170f4
1000143c:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
1000143f:	89 41 04             	mov    DWORD PTR [ecx+0x4],eax
10001442:	8b c1                	mov    eax,ecx
10001444:	5d                   	pop    ebp
10001445:	c2 04 00             	ret    0x4

; ===== MSVC red-black tree copy helpers (10001000..10001200) =====

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

10001000 <.text>:
10001000:	55                   	push   ebp
10001001:	8b ec                	mov    ebp,esp
10001003:	6a ff                	push   0xffffffff
10001005:	68 48 5b 01 10       	push   0x10015b48
1000100a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10001010:	50                   	push   eax
10001011:	83 ec 08             	sub    esp,0x8
10001014:	53                   	push   ebx
10001015:	56                   	push   esi
10001016:	57                   	push   edi
10001017:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000101c:	33 c5                	xor    eax,ebp
1000101e:	50                   	push   eax
1000101f:	8d 45 f4             	lea    eax,[ebp-0xc]
10001022:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10001028:	89 65 f0             	mov    DWORD PTR [ebp-0x10],esp
1000102b:	8b f1                	mov    esi,ecx
1000102d:	89 75 ec             	mov    DWORD PTR [ebp-0x14],esi
10001030:	c7 06 00 00 00 00    	mov    DWORD PTR [esi],0x0
10001036:	c7 46 04 00 00 00 00 	mov    DWORD PTR [esi+0x4],0x0
1000103d:	e8 ce 0b 00 00       	call   0x10001c10
10001042:	89 06                	mov    DWORD PTR [esi],eax
10001044:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10001047:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000104e:	8b ce                	mov    ecx,esi
10001050:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10001053:	c6 45 fc 01          	mov    BYTE PTR [ebp-0x4],0x1
10001057:	e8 64 00 00 00       	call   0x100010c0
1000105c:	8b c6                	mov    eax,esi
1000105e:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10001061:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10001068:	59                   	pop    ecx
10001069:	5f                   	pop    edi
1000106a:	5e                   	pop    esi
1000106b:	5b                   	pop    ebx
1000106c:	8b e5                	mov    esp,ebp
1000106e:	5d                   	pop    ebp
1000106f:	c2 08 00             	ret    0x8
10001072:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
10001075:	8b 01                	mov    eax,DWORD PTR [ecx]
10001077:	50                   	push   eax
10001078:	ff 30                	push   DWORD PTR [eax]
1000107a:	8d 45 08             	lea    eax,[ebp+0x8]
1000107d:	50                   	push   eax
1000107e:	e8 4d 2b 01 00       	call   0x10013bd0
10001083:	6a 00                	push   0x0
10001085:	6a 00                	push   0x0
10001087:	e8 1c 4a 01 00       	call   0x10015aa8
1000108c:	cc                   	int3
1000108d:	cc                   	int3
1000108e:	cc                   	int3
1000108f:	cc                   	int3
10001090:	55                   	push   ebp
10001091:	8b ec                	mov    ebp,esp
10001093:	56                   	push   esi
10001094:	e8 a7 0b 00 00       	call   0x10001c40
10001099:	8b d0                	mov    edx,eax
1000109b:	8d 72 10             	lea    esi,[edx+0x10]
1000109e:	66 c7 42 0c 00 00    	mov    WORD PTR [edx+0xc],0x0
100010a4:	85 f6                	test   esi,esi
100010a6:	74 0f                	je     0x100010b7
100010a8:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
100010ab:	8b 08                	mov    ecx,DWORD PTR [eax]
100010ad:	89 0e                	mov    DWORD PTR [esi],ecx
100010af:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
100010b2:	89 46 04             	mov    DWORD PTR [esi+0x4],eax
100010b5:	8b c2                	mov    eax,edx
100010b7:	5e                   	pop    esi
100010b8:	5d                   	pop    ebp
100010b9:	c2 04 00             	ret    0x4
100010bc:	cc                   	int3
100010bd:	cc                   	int3
100010be:	cc                   	int3
100010bf:	cc                   	int3
100010c0:	55                   	push   ebp
100010c1:	8b ec                	mov    ebp,esp
100010c3:	53                   	push   ebx
100010c4:	56                   	push   esi
100010c5:	57                   	push   edi
100010c6:	8b 7d 08             	mov    edi,DWORD PTR [ebp+0x8]
100010c9:	8b d9                	mov    ebx,ecx
100010cb:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
100010ce:	8b 07                	mov    eax,DWORD PTR [edi]
100010d0:	8b 33                	mov    esi,DWORD PTR [ebx]
100010d2:	56                   	push   esi
100010d3:	ff 70 04             	push   DWORD PTR [eax+0x4]
100010d6:	e8 65 00 00 00       	call   0x10001140
100010db:	89 46 04             	mov    DWORD PTR [esi+0x4],eax
100010de:	8b 47 04             	mov    eax,DWORD PTR [edi+0x4]
100010e1:	89 43 04             	mov    DWORD PTR [ebx+0x4],eax
100010e4:	8b 13                	mov    edx,DWORD PTR [ebx]
100010e6:	8b 4a 04             	mov    ecx,DWORD PTR [edx+0x4]
100010e9:	80 79 0d 00          	cmp    BYTE PTR [ecx+0xd],0x0
100010ed:	75 37                	jne    0x10001126
100010ef:	8b 01                	mov    eax,DWORD PTR [ecx]
100010f1:	80 78 0d 00          	cmp    BYTE PTR [eax+0xd],0x0
100010f5:	75 0a                	jne    0x10001101
100010f7:	8b c8                	mov    ecx,eax
100010f9:	8b 01                	mov    eax,DWORD PTR [ecx]
100010fb:	80 78 0d 00          	cmp    BYTE PTR [eax+0xd],0x0
100010ff:	74 f6                	je     0x100010f7
10001101:	89 0a                	mov    DWORD PTR [edx],ecx
10001103:	8b 13                	mov    edx,DWORD PTR [ebx]
10001105:	8b 4a 04             	mov    ecx,DWORD PTR [edx+0x4]
10001108:	8b 41 08             	mov    eax,DWORD PTR [ecx+0x8]
1000110b:	80 78 0d 00          	cmp    BYTE PTR [eax+0xd],0x0
1000110f:	75 0b                	jne    0x1000111c
10001111:	8b c8                	mov    ecx,eax
10001113:	8b 41 08             	mov    eax,DWORD PTR [ecx+0x8]
10001116:	80 78 0d 00          	cmp    BYTE PTR [eax+0xd],0x0
1000111a:	74 f5                	je     0x10001111
1000111c:	5f                   	pop    edi
1000111d:	5e                   	pop    esi
1000111e:	89 4a 08             	mov    DWORD PTR [edx+0x8],ecx
10001121:	5b                   	pop    ebx
10001122:	5d                   	pop    ebp
10001123:	c2 08 00             	ret    0x8
10001126:	89 12                	mov    DWORD PTR [edx],edx
10001128:	8b 03                	mov    eax,DWORD PTR [ebx]
1000112a:	5f                   	pop    edi
1000112b:	5e                   	pop    esi
1000112c:	5b                   	pop    ebx
1000112d:	89 40 08             	mov    DWORD PTR [eax+0x8],eax
10001130:	5d                   	pop    ebp
10001131:	c2 08 00             	ret    0x8
10001134:	cc                   	int3
10001135:	cc                   	int3
10001136:	cc                   	int3
10001137:	cc                   	int3
10001138:	cc                   	int3
10001139:	cc                   	int3
1000113a:	cc                   	int3
1000113b:	cc                   	int3
1000113c:	cc                   	int3
1000113d:	cc                   	int3
1000113e:	cc                   	int3
1000113f:	cc                   	int3
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

; ===== AFStructure private copy constructor (1000a620..1000a6b0) =====

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

1000a620 <.text+0x9620>:
1000a620:	55                   	push   ebp
1000a621:	8b ec                	mov    ebp,esp
1000a623:	6a ff                	push   0xffffffff
1000a625:	68 a6 5b 01 10       	push   0x10015ba6
1000a62a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000a630:	50                   	push   eax
1000a631:	51                   	push   ecx
1000a632:	56                   	push   esi
1000a633:	57                   	push   edi
1000a634:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000a639:	33 c5                	xor    eax,ebp
1000a63b:	50                   	push   eax
1000a63c:	8d 45 f4             	lea    eax,[ebp-0xc]
1000a63f:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000a645:	8b f9                	mov    edi,ecx
1000a647:	89 7d f0             	mov    DWORD PTR [ebp-0x10],edi
1000a64a:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
1000a64d:	8d 4f 04             	lea    ecx,[edi+0x4]
1000a650:	c7 07 d8 72 01 10    	mov    DWORD PTR [edi],0x100172d8
1000a656:	8d 46 04             	lea    eax,[esi+0x4]
1000a659:	50                   	push   eax
1000a65a:	e8 a1 6b ff ff       	call   0x10001200
1000a65f:	8d 46 10             	lea    eax,[esi+0x10]
1000a662:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000a669:	50                   	push   eax
1000a66a:	8d 4f 10             	lea    ecx,[edi+0x10]
1000a66d:	e8 8e 6b ff ff       	call   0x10001200
1000a672:	8d 45 0b             	lea    eax,[ebp+0xb]
1000a675:	c6 45 fc 01          	mov    BYTE PTR [ebp-0x4],0x1
1000a679:	50                   	push   eax
1000a67a:	8d 46 1c             	lea    eax,[esi+0x1c]
1000a67d:	8d 4f 1c             	lea    ecx,[edi+0x1c]
1000a680:	50                   	push   eax
1000a681:	89 4d 08             	mov    DWORD PTR [ebp+0x8],ecx
1000a684:	e8 77 69 ff ff       	call   0x10001000
1000a689:	8b 46 24             	mov    eax,DWORD PTR [esi+0x24]
1000a68c:	89 47 24             	mov    DWORD PTR [edi+0x24],eax
1000a68f:	8b c7                	mov    eax,edi
1000a691:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000a694:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000a69b:	59                   	pop    ecx
1000a69c:	5f                   	pop    edi
1000a69d:	5e                   	pop    esi
1000a69e:	8b e5                	mov    esp,ebp
1000a6a0:	5d                   	pop    ebp
1000a6a1:	c2 04 00             	ret    0x4
1000a6a4:	cc                   	int3
1000a6a5:	cc                   	int3
1000a6a6:	cc                   	int3
1000a6a7:	cc                   	int3
1000a6a8:	cc                   	int3
1000a6a9:	cc                   	int3
1000a6aa:	cc                   	int3
1000a6ab:	cc                   	int3
1000a6ac:	cc                   	int3
1000a6ad:	cc                   	int3
1000a6ae:	cc                   	int3
1000a6af:	cc                   	int3

; ===== AFStructure public destructor (1000a750..1000a800) =====

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

1000a750 <.text+0x9750>:
1000a750:	55                   	push   ebp
1000a751:	8b ec                	mov    ebp,esp
1000a753:	51                   	push   ecx
1000a754:	56                   	push   esi
1000a755:	8b f1                	mov    esi,ecx
1000a757:	57                   	push   edi
1000a758:	33 ff                	xor    edi,edi
1000a75a:	8b 56 0c             	mov    edx,DWORD PTR [esi+0xc]
1000a75d:	c7 06 3c 71 01 10    	mov    DWORD PTR [esi],0x1001713c
1000a763:	8b 42 08             	mov    eax,DWORD PTR [edx+0x8]
1000a766:	2b 42 04             	sub    eax,DWORD PTR [edx+0x4]
1000a769:	c1 f8 02             	sar    eax,0x2
1000a76c:	85 c0                	test   eax,eax
1000a76e:	74 24                	je     0x1000a794
1000a770:	8b 46 0c             	mov    eax,DWORD PTR [esi+0xc]
1000a773:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
1000a776:	8b 0c b8             	mov    ecx,DWORD PTR [eax+edi*4]
1000a779:	85 c9                	test   ecx,ecx
1000a77b:	74 06                	je     0x1000a783
1000a77d:	8b 01                	mov    eax,DWORD PTR [ecx]
1000a77f:	6a 01                	push   0x1
1000a781:	ff 10                	call   DWORD PTR [eax]
1000a783:	8b 4e 0c             	mov    ecx,DWORD PTR [esi+0xc]
1000a786:	47                   	inc    edi
1000a787:	8b 41 08             	mov    eax,DWORD PTR [ecx+0x8]
1000a78a:	2b 41 04             	sub    eax,DWORD PTR [ecx+0x4]
1000a78d:	c1 f8 02             	sar    eax,0x2
1000a790:	3b f8                	cmp    edi,eax
1000a792:	72 dc                	jb     0x1000a770
1000a794:	8b 4e 0c             	mov    ecx,DWORD PTR [esi+0xc]
1000a797:	33 ff                	xor    edi,edi
1000a799:	8b 41 14             	mov    eax,DWORD PTR [ecx+0x14]
1000a79c:	2b 41 10             	sub    eax,DWORD PTR [ecx+0x10]
1000a79f:	c1 f8 02             	sar    eax,0x2
1000a7a2:	85 c0                	test   eax,eax
1000a7a4:	74 24                	je     0x1000a7ca
1000a7a6:	8b 46 0c             	mov    eax,DWORD PTR [esi+0xc]
1000a7a9:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
1000a7ac:	8b 0c b8             	mov    ecx,DWORD PTR [eax+edi*4]
1000a7af:	85 c9                	test   ecx,ecx
1000a7b1:	74 06                	je     0x1000a7b9
1000a7b3:	8b 01                	mov    eax,DWORD PTR [ecx]
1000a7b5:	6a 01                	push   0x1
1000a7b7:	ff 10                	call   DWORD PTR [eax]
1000a7b9:	8b 4e 0c             	mov    ecx,DWORD PTR [esi+0xc]
1000a7bc:	47                   	inc    edi
1000a7bd:	8b 41 14             	mov    eax,DWORD PTR [ecx+0x14]
1000a7c0:	2b 41 10             	sub    eax,DWORD PTR [ecx+0x10]
1000a7c3:	c1 f8 02             	sar    eax,0x2
1000a7c6:	3b f8                	cmp    edi,eax
1000a7c8:	72 dc                	jb     0x1000a7a6
1000a7ca:	8b 4e 0c             	mov    ecx,DWORD PTR [esi+0xc]
1000a7cd:	85 c9                	test   ecx,ecx
1000a7cf:	74 06                	je     0x1000a7d7
1000a7d1:	8b 01                	mov    eax,DWORD PTR [ecx]
1000a7d3:	6a 01                	push   0x1
1000a7d5:	ff 10                	call   DWORD PTR [eax]
1000a7d7:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
1000a7da:	8d 4e 04             	lea    ecx,[esi+0x4]
1000a7dd:	50                   	push   eax
1000a7de:	ff 30                	push   DWORD PTR [eax]
1000a7e0:	8d 45 fc             	lea    eax,[ebp-0x4]
1000a7e3:	50                   	push   eax
1000a7e4:	e8 e7 93 00 00       	call   0x10013bd0
1000a7e9:	ff 76 04             	push   DWORD PTR [esi+0x4]
1000a7ec:	e8 32 a5 00 00       	call   0x10014d23
1000a7f1:	83 c4 04             	add    esp,0x4
1000a7f4:	5f                   	pop    edi
1000a7f5:	5e                   	pop    esi
1000a7f6:	8b e5                	mov    esp,ebp
1000a7f8:	5d                   	pop    ebp
1000a7f9:	c3                   	ret
1000a7fa:	cc                   	int3
1000a7fb:	cc                   	int3
1000a7fc:	cc                   	int3
1000a7fd:	cc                   	int3
1000a7fe:	cc                   	int3
1000a7ff:	cc                   	int3

; ===== AFStructure private destructor (1000a800..1000a895) =====

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

1000a800 <.text+0x9800>:
1000a800:	55                   	push   ebp
1000a801:	8b ec                	mov    ebp,esp
1000a803:	51                   	push   ecx
1000a804:	56                   	push   esi
1000a805:	57                   	push   edi
1000a806:	8b f9                	mov    edi,ecx
1000a808:	c7 07 d8 72 01 10    	mov    DWORD PTR [edi],0x100172d8
1000a80e:	8d 4f 1c             	lea    ecx,[edi+0x1c]
1000a811:	8b 47 1c             	mov    eax,DWORD PTR [edi+0x1c]
1000a814:	50                   	push   eax
1000a815:	ff 30                	push   DWORD PTR [eax]
1000a817:	8d 45 fc             	lea    eax,[ebp-0x4]
1000a81a:	50                   	push   eax
1000a81b:	e8 b0 93 00 00       	call   0x10013bd0
1000a820:	6a 18                	push   0x18
1000a822:	6a 01                	push   0x1
1000a824:	ff 77 1c             	push   DWORD PTR [edi+0x1c]
1000a827:	e8 54 74 ff ff       	call   0x10001c80
1000a82c:	8b 4f 10             	mov    ecx,DWORD PTR [edi+0x10]
1000a82f:	83 c4 0c             	add    esp,0xc
1000a832:	85 c9                	test   ecx,ecx
1000a834:	74 29                	je     0x1000a85f
1000a836:	8b 47 18             	mov    eax,DWORD PTR [edi+0x18]
1000a839:	2b c1                	sub    eax,ecx
1000a83b:	6a 04                	push   0x4
1000a83d:	c1 f8 02             	sar    eax,0x2
1000a840:	50                   	push   eax
1000a841:	51                   	push   ecx
1000a842:	e8 39 74 ff ff       	call   0x10001c80
1000a847:	c7 47 10 00 00 00 00 	mov    DWORD PTR [edi+0x10],0x0
1000a84e:	83 c4 0c             	add    esp,0xc
1000a851:	c7 47 14 00 00 00 00 	mov    DWORD PTR [edi+0x14],0x0
1000a858:	c7 47 18 00 00 00 00 	mov    DWORD PTR [edi+0x18],0x0
1000a85f:	8b 4f 04             	mov    ecx,DWORD PTR [edi+0x4]
1000a862:	85 c9                	test   ecx,ecx
1000a864:	74 29                	je     0x1000a88f
1000a866:	8b 47 0c             	mov    eax,DWORD PTR [edi+0xc]
1000a869:	2b c1                	sub    eax,ecx
1000a86b:	6a 04                	push   0x4
1000a86d:	c1 f8 02             	sar    eax,0x2
1000a870:	50                   	push   eax
1000a871:	51                   	push   ecx
1000a872:	e8 09 74 ff ff       	call   0x10001c80
1000a877:	c7 47 04 00 00 00 00 	mov    DWORD PTR [edi+0x4],0x0
1000a87e:	83 c4 0c             	add    esp,0xc
1000a881:	c7 47 08 00 00 00 00 	mov    DWORD PTR [edi+0x8],0x0
1000a888:	c7 47 0c 00 00 00 00 	mov    DWORD PTR [edi+0xc],0x0
1000a88f:	5f                   	pop    edi
1000a890:	5e                   	pop    esi
1000a891:	8b e5                	mov    esp,ebp
1000a893:	5d                   	pop    ebp
1000a894:	c3                   	ret

; ===== AIStructure public destructor (1000d8e0..1000d970) =====

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

1000d8e0 <.text+0xc8e0>:
1000d8e0:	56                   	push   esi
1000d8e1:	8b f1                	mov    esi,ecx
1000d8e3:	57                   	push   edi
1000d8e4:	33 ff                	xor    edi,edi
1000d8e6:	8b 56 04             	mov    edx,DWORD PTR [esi+0x4]
1000d8e9:	c7 06 fc 70 01 10    	mov    DWORD PTR [esi],0x100170fc
1000d8ef:	8b 42 18             	mov    eax,DWORD PTR [edx+0x18]
1000d8f2:	2b 42 14             	sub    eax,DWORD PTR [edx+0x14]
1000d8f5:	a9 fc ff ff ff       	test   eax,0xfffffffc
1000d8fa:	7e 28                	jle    0x1000d924
1000d8fc:	0f 1f 40 00          	nop    DWORD PTR [eax+0x0]
1000d900:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
1000d903:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
1000d906:	8b 0c b8             	mov    ecx,DWORD PTR [eax+edi*4]
1000d909:	85 c9                	test   ecx,ecx
1000d90b:	74 06                	je     0x1000d913
1000d90d:	8b 01                	mov    eax,DWORD PTR [ecx]
1000d90f:	6a 01                	push   0x1
1000d911:	ff 10                	call   DWORD PTR [eax]
1000d913:	8b 4e 04             	mov    ecx,DWORD PTR [esi+0x4]
1000d916:	47                   	inc    edi
1000d917:	8b 41 18             	mov    eax,DWORD PTR [ecx+0x18]
1000d91a:	2b 41 14             	sub    eax,DWORD PTR [ecx+0x14]
1000d91d:	c1 f8 02             	sar    eax,0x2
1000d920:	3b f8                	cmp    edi,eax
1000d922:	7c dc                	jl     0x1000d900
1000d924:	8b 4e 04             	mov    ecx,DWORD PTR [esi+0x4]
1000d927:	33 ff                	xor    edi,edi
1000d929:	8b 41 24             	mov    eax,DWORD PTR [ecx+0x24]
1000d92c:	2b 41 20             	sub    eax,DWORD PTR [ecx+0x20]
1000d92f:	c1 f8 02             	sar    eax,0x2
1000d932:	85 c0                	test   eax,eax
1000d934:	74 24                	je     0x1000d95a
1000d936:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
1000d939:	8b 40 20             	mov    eax,DWORD PTR [eax+0x20]
1000d93c:	8b 0c b8             	mov    ecx,DWORD PTR [eax+edi*4]
1000d93f:	85 c9                	test   ecx,ecx
1000d941:	74 06                	je     0x1000d949
1000d943:	8b 01                	mov    eax,DWORD PTR [ecx]
1000d945:	6a 01                	push   0x1
1000d947:	ff 10                	call   DWORD PTR [eax]
1000d949:	8b 4e 04             	mov    ecx,DWORD PTR [esi+0x4]
1000d94c:	47                   	inc    edi
1000d94d:	8b 41 24             	mov    eax,DWORD PTR [ecx+0x24]
1000d950:	2b 41 20             	sub    eax,DWORD PTR [ecx+0x20]
1000d953:	c1 f8 02             	sar    eax,0x2
1000d956:	3b f8                	cmp    edi,eax
1000d958:	72 dc                	jb     0x1000d936
1000d95a:	8b 4e 04             	mov    ecx,DWORD PTR [esi+0x4]
1000d95d:	5f                   	pop    edi
1000d95e:	5e                   	pop    esi
1000d95f:	85 c9                	test   ecx,ecx
1000d961:	74 06                	je     0x1000d969
1000d963:	8b 01                	mov    eax,DWORD PTR [ecx]
1000d965:	6a 01                	push   0x1
1000d967:	ff 10                	call   DWORD PTR [eax]
1000d969:	c3                   	ret
1000d96a:	cc                   	int3
1000d96b:	cc                   	int3
1000d96c:	cc                   	int3
1000d96d:	cc                   	int3
1000d96e:	cc                   	int3
1000d96f:	cc                   	int3

; ===== AIStructure private destructor (1000d970..1000da40) =====

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

1000d970 <.text+0xc970>:
1000d970:	55                   	push   ebp
1000d971:	8b ec                	mov    ebp,esp
1000d973:	6a ff                	push   0xffffffff
1000d975:	68 d6 66 01 10       	push   0x100166d6
1000d97a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000d980:	50                   	push   eax
1000d981:	51                   	push   ecx
1000d982:	56                   	push   esi
1000d983:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000d988:	33 c5                	xor    eax,ebp
1000d98a:	50                   	push   eax
1000d98b:	8d 45 f4             	lea    eax,[ebp-0xc]
1000d98e:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000d994:	8b f1                	mov    esi,ecx
1000d996:	c7 06 60 73 01 10    	mov    DWORD PTR [esi],0x10017360
1000d99c:	8b 4e 20             	mov    ecx,DWORD PTR [esi+0x20]
1000d99f:	85 c9                	test   ecx,ecx
1000d9a1:	74 29                	je     0x1000d9cc
1000d9a3:	8b 46 28             	mov    eax,DWORD PTR [esi+0x28]
1000d9a6:	2b c1                	sub    eax,ecx
1000d9a8:	c1 f8 02             	sar    eax,0x2
1000d9ab:	6a 04                	push   0x4
1000d9ad:	50                   	push   eax
1000d9ae:	51                   	push   ecx
1000d9af:	e8 cc 42 ff ff       	call   0x10001c80
1000d9b4:	c7 46 20 00 00 00 00 	mov    DWORD PTR [esi+0x20],0x0
1000d9bb:	83 c4 0c             	add    esp,0xc
1000d9be:	c7 46 24 00 00 00 00 	mov    DWORD PTR [esi+0x24],0x0
1000d9c5:	c7 46 28 00 00 00 00 	mov    DWORD PTR [esi+0x28],0x0
1000d9cc:	8b 4e 14             	mov    ecx,DWORD PTR [esi+0x14]
1000d9cf:	85 c9                	test   ecx,ecx
1000d9d1:	74 29                	je     0x1000d9fc
1000d9d3:	8b 46 1c             	mov    eax,DWORD PTR [esi+0x1c]
1000d9d6:	2b c1                	sub    eax,ecx
1000d9d8:	c1 f8 02             	sar    eax,0x2
1000d9db:	6a 04                	push   0x4
1000d9dd:	50                   	push   eax
1000d9de:	51                   	push   ecx
1000d9df:	e8 9c 42 ff ff       	call   0x10001c80
1000d9e4:	c7 46 14 00 00 00 00 	mov    DWORD PTR [esi+0x14],0x0
1000d9eb:	83 c4 0c             	add    esp,0xc
1000d9ee:	c7 46 18 00 00 00 00 	mov    DWORD PTR [esi+0x18],0x0
1000d9f5:	c7 46 1c 00 00 00 00 	mov    DWORD PTR [esi+0x1c],0x0
1000d9fc:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
1000d9ff:	8d 4e 04             	lea    ecx,[esi+0x4]
1000da02:	50                   	push   eax
1000da03:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000da0a:	ff 30                	push   DWORD PTR [eax]
1000da0c:	8d 45 f0             	lea    eax,[ebp-0x10]
1000da0f:	50                   	push   eax
1000da10:	e8 1b 05 00 00       	call   0x1000df30
1000da15:	6a 1c                	push   0x1c
1000da17:	6a 01                	push   0x1
1000da19:	ff 76 04             	push   DWORD PTR [esi+0x4]
1000da1c:	e8 5f 42 ff ff       	call   0x10001c80
1000da21:	83 c4 0c             	add    esp,0xc
1000da24:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000da27:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000da2e:	59                   	pop    ecx
1000da2f:	5e                   	pop    esi
1000da30:	8b e5                	mov    esp,ebp
1000da32:	5d                   	pop    ebp
1000da33:	c3                   	ret
1000da34:	cc                   	int3
1000da35:	cc                   	int3
1000da36:	cc                   	int3
1000da37:	cc                   	int3
1000da38:	cc                   	int3
1000da39:	cc                   	int3
1000da3a:	cc                   	int3
1000da3b:	cc                   	int3
1000da3c:	cc                   	int3
1000da3d:	cc                   	int3
1000da3e:	cc                   	int3
1000da3f:	cc                   	int3

; ===== AIStructure private copy constructor (1000d770..1000d800) =====

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

1000d770 <.text+0xc770>:
1000d770:	55                   	push   ebp
1000d771:	8b ec                	mov    ebp,esp
1000d773:	6a ff                	push   0xffffffff
1000d775:	68 96 6c 01 10       	push   0x10016c96
1000d77a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000d780:	50                   	push   eax
1000d781:	51                   	push   ecx
1000d782:	56                   	push   esi
1000d783:	57                   	push   edi
1000d784:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000d789:	33 c5                	xor    eax,ebp
1000d78b:	50                   	push   eax
1000d78c:	8d 45 f4             	lea    eax,[ebp-0xc]
1000d78f:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000d795:	8b f9                	mov    edi,ecx
1000d797:	89 7d f0             	mov    DWORD PTR [ebp-0x10],edi
1000d79a:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
1000d79d:	8d 55 0b             	lea    edx,[ebp+0xb]
1000d7a0:	52                   	push   edx
1000d7a1:	8d 4f 04             	lea    ecx,[edi+0x4]
1000d7a4:	c7 07 60 73 01 10    	mov    DWORD PTR [edi],0x10017360
1000d7aa:	89 4d 08             	mov    DWORD PTR [ebp+0x8],ecx
1000d7ad:	8d 46 04             	lea    eax,[esi+0x4]
1000d7b0:	50                   	push   eax
1000d7b1:	e8 2a fc ff ff       	call   0x1000d3e0
1000d7b6:	8b 46 0c             	mov    eax,DWORD PTR [esi+0xc]
1000d7b9:	8d 4f 14             	lea    ecx,[edi+0x14]
1000d7bc:	89 47 0c             	mov    DWORD PTR [edi+0xc],eax
1000d7bf:	8b 46 10             	mov    eax,DWORD PTR [esi+0x10]
1000d7c2:	89 47 10             	mov    DWORD PTR [edi+0x10],eax
1000d7c5:	8d 46 14             	lea    eax,[esi+0x14]
1000d7c8:	50                   	push   eax
1000d7c9:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000d7d0:	e8 2b 3a ff ff       	call   0x10001200
1000d7d5:	8d 46 20             	lea    eax,[esi+0x20]
1000d7d8:	c6 45 fc 01          	mov    BYTE PTR [ebp-0x4],0x1
1000d7dc:	50                   	push   eax
1000d7dd:	8d 4f 20             	lea    ecx,[edi+0x20]
1000d7e0:	e8 1b 3a ff ff       	call   0x10001200
1000d7e5:	8b c7                	mov    eax,edi
1000d7e7:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000d7ea:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000d7f1:	59                   	pop    ecx
1000d7f2:	5f                   	pop    edi
1000d7f3:	5e                   	pop    esi
1000d7f4:	8b e5                	mov    esp,ebp
1000d7f6:	5d                   	pop    ebp
1000d7f7:	c2 04 00             	ret    0x4
1000d7fa:	cc                   	int3
1000d7fb:	cc                   	int3
1000d7fc:	cc                   	int3
1000d7fd:	cc                   	int3
1000d7fe:	cc                   	int3
1000d7ff:	cc                   	int3

; ===== AIStructure add/delete operations (1000dd30..1000df30) =====

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

1000dd30 <.text+0xcd30>:
1000dd30:	55                   	push   ebp
1000dd31:	8b ec                	mov    ebp,esp
1000dd33:	83 ec 30             	sub    esp,0x30
1000dd36:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000dd3b:	33 c5                	xor    eax,ebp
1000dd3d:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
1000dd40:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000dd43:	56                   	push   esi
1000dd44:	8b f1                	mov    esi,ecx
1000dd46:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
1000dd49:	8d 45 d0             	lea    eax,[ebp-0x30]
1000dd4c:	50                   	push   eax
1000dd4d:	8b 4e 04             	mov    ecx,DWORD PTR [esi+0x4]
1000dd50:	83 c1 20             	add    ecx,0x20
1000dd53:	e8 08 4d ff ff       	call   0x10002a60
1000dd58:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
1000dd5b:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
1000dd5e:	c7 45 d4 68 73 01 10 	mov    DWORD PTR [ebp-0x2c],0x10017368
1000dd65:	89 75 d8             	mov    DWORD PTR [ebp-0x28],esi
1000dd68:	8d 48 08             	lea    ecx,[eax+0x8]
1000dd6b:	8d 45 d4             	lea    eax,[ebp-0x2c]
1000dd6e:	51                   	push   ecx
1000dd6f:	8b c8                	mov    ecx,eax
1000dd71:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
1000dd74:	e8 f7 47 ff ff       	call   0x10002570
1000dd79:	8b 4d f8             	mov    ecx,DWORD PTR [ebp-0x8]
1000dd7c:	5e                   	pop    esi
1000dd7d:	85 c9                	test   ecx,ecx
1000dd7f:	74 11                	je     0x1000dd92
1000dd81:	8b 11                	mov    edx,DWORD PTR [ecx]
1000dd83:	8d 45 d4             	lea    eax,[ebp-0x2c]
1000dd86:	3b c8                	cmp    ecx,eax
1000dd88:	0f 95 c0             	setne  al
1000dd8b:	0f b6 c0             	movzx  eax,al
1000dd8e:	50                   	push   eax
1000dd8f:	ff 52 10             	call   DWORD PTR [edx+0x10]
1000dd92:	8b 4d fc             	mov    ecx,DWORD PTR [ebp-0x4]
1000dd95:	33 cd                	xor    ecx,ebp
1000dd97:	e8 b1 6f 00 00       	call   0x10014d4d
1000dd9c:	8b e5                	mov    esp,ebp
1000dd9e:	5d                   	pop    ebp
1000dd9f:	c2 04 00             	ret    0x4
1000dda2:	cc                   	int3
1000dda3:	cc                   	int3
1000dda4:	cc                   	int3
1000dda5:	cc                   	int3
1000dda6:	cc                   	int3
1000dda7:	cc                   	int3
1000dda8:	cc                   	int3
1000dda9:	cc                   	int3
1000ddaa:	cc                   	int3
1000ddab:	cc                   	int3
1000ddac:	cc                   	int3
1000ddad:	cc                   	int3
1000ddae:	cc                   	int3
1000ddaf:	cc                   	int3
1000ddb0:	55                   	push   ebp
1000ddb1:	8b ec                	mov    ebp,esp
1000ddb3:	56                   	push   esi
1000ddb4:	8b f1                	mov    esi,ecx
1000ddb6:	8d 45 08             	lea    eax,[ebp+0x8]
1000ddb9:	50                   	push   eax
1000ddba:	8b 4e 04             	mov    ecx,DWORD PTR [esi+0x4]
1000ddbd:	83 c1 14             	add    ecx,0x14
1000ddc0:	e8 9b 4c ff ff       	call   0x10002a60
1000ddc5:	8b 56 04             	mov    edx,DWORD PTR [esi+0x4]
1000ddc8:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000ddcb:	5e                   	pop    esi
1000ddcc:	ff 42 0c             	inc    DWORD PTR [edx+0xc]
1000ddcf:	8b 48 04             	mov    ecx,DWORD PTR [eax+0x4]
1000ddd2:	8b 42 0c             	mov    eax,DWORD PTR [edx+0xc]
1000ddd5:	89 41 04             	mov    DWORD PTR [ecx+0x4],eax
1000ddd8:	b8 01 00 00 00       	mov    eax,0x1
1000dddd:	5d                   	pop    ebp
1000ddde:	c2 04 00             	ret    0x4
1000dde1:	cc                   	int3
1000dde2:	cc                   	int3
1000dde3:	cc                   	int3
1000dde4:	cc                   	int3
1000dde5:	cc                   	int3
1000dde6:	cc                   	int3
1000dde7:	cc                   	int3
1000dde8:	cc                   	int3
1000dde9:	cc                   	int3
1000ddea:	cc                   	int3
1000ddeb:	cc                   	int3
1000ddec:	cc                   	int3
1000dded:	cc                   	int3
1000ddee:	cc                   	int3
1000ddef:	cc                   	int3
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
1000df20:	8b 49 04             	mov    ecx,DWORD PTR [ecx+0x4]
1000df23:	8b 41 18             	mov    eax,DWORD PTR [ecx+0x18]
1000df26:	2b 41 14             	sub    eax,DWORD PTR [ecx+0x14]
1000df29:	c1 f8 02             	sar    eax,0x2
1000df2c:	c3                   	ret
1000df2d:	cc                   	int3
1000df2e:	cc                   	int3
1000df2f:	cc                   	int3

; ===== AbstractModel public destructor (100015f0..100016c0) =====

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

100015f0 <.text+0x5f0>:
100015f0:	56                   	push   esi
100015f1:	8b f1                	mov    esi,ecx
100015f3:	57                   	push   edi
100015f4:	33 ff                	xor    edi,edi
100015f6:	8b 56 04             	mov    edx,DWORD PTR [esi+0x4]
100015f9:	c7 06 f4 70 01 10    	mov    DWORD PTR [esi],0x100170f4
100015ff:	8b 42 08             	mov    eax,DWORD PTR [edx+0x8]
10001602:	2b 42 04             	sub    eax,DWORD PTR [edx+0x4]
10001605:	c1 f8 02             	sar    eax,0x2
10001608:	85 c0                	test   eax,eax
1000160a:	74 28                	je     0x10001634
1000160c:	0f 1f 40 00          	nop    DWORD PTR [eax+0x0]
10001610:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
10001613:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
10001616:	8b 0c b8             	mov    ecx,DWORD PTR [eax+edi*4]
10001619:	85 c9                	test   ecx,ecx
1000161b:	74 06                	je     0x10001623
1000161d:	8b 01                	mov    eax,DWORD PTR [ecx]
1000161f:	6a 01                	push   0x1
10001621:	ff 10                	call   DWORD PTR [eax]
10001623:	8b 4e 04             	mov    ecx,DWORD PTR [esi+0x4]
10001626:	47                   	inc    edi
10001627:	8b 41 08             	mov    eax,DWORD PTR [ecx+0x8]
1000162a:	2b 41 04             	sub    eax,DWORD PTR [ecx+0x4]
1000162d:	c1 f8 02             	sar    eax,0x2
10001630:	3b f8                	cmp    edi,eax
10001632:	72 dc                	jb     0x10001610
10001634:	8b 4e 04             	mov    ecx,DWORD PTR [esi+0x4]
10001637:	33 ff                	xor    edi,edi
10001639:	8b 41 14             	mov    eax,DWORD PTR [ecx+0x14]
1000163c:	2b 41 10             	sub    eax,DWORD PTR [ecx+0x10]
1000163f:	c1 f8 02             	sar    eax,0x2
10001642:	85 c0                	test   eax,eax
10001644:	74 24                	je     0x1000166a
10001646:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
10001649:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
1000164c:	8b 0c b8             	mov    ecx,DWORD PTR [eax+edi*4]
1000164f:	85 c9                	test   ecx,ecx
10001651:	74 06                	je     0x10001659
10001653:	8b 01                	mov    eax,DWORD PTR [ecx]
10001655:	6a 01                	push   0x1
10001657:	ff 10                	call   DWORD PTR [eax]
10001659:	8b 4e 04             	mov    ecx,DWORD PTR [esi+0x4]
1000165c:	47                   	inc    edi
1000165d:	8b 41 14             	mov    eax,DWORD PTR [ecx+0x14]
10001660:	2b 41 10             	sub    eax,DWORD PTR [ecx+0x10]
10001663:	c1 f8 02             	sar    eax,0x2
10001666:	3b f8                	cmp    edi,eax
10001668:	72 dc                	jb     0x10001646
1000166a:	8b 4e 04             	mov    ecx,DWORD PTR [esi+0x4]
1000166d:	33 ff                	xor    edi,edi
1000166f:	8b 41 20             	mov    eax,DWORD PTR [ecx+0x20]
10001672:	2b 41 1c             	sub    eax,DWORD PTR [ecx+0x1c]
10001675:	c1 f8 02             	sar    eax,0x2
10001678:	85 c0                	test   eax,eax
1000167a:	74 26                	je     0x100016a2
1000167c:	0f 1f 40 00          	nop    DWORD PTR [eax+0x0]
10001680:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
10001683:	8b 40 1c             	mov    eax,DWORD PTR [eax+0x1c]
10001686:	ff 34 b8             	push   DWORD PTR [eax+edi*4]
10001689:	e8 95 36 01 00       	call   0x10014d23
1000168e:	8b 4e 04             	mov    ecx,DWORD PTR [esi+0x4]
10001691:	47                   	inc    edi
10001692:	83 c4 04             	add    esp,0x4
10001695:	8b 41 20             	mov    eax,DWORD PTR [ecx+0x20]
10001698:	2b 41 1c             	sub    eax,DWORD PTR [ecx+0x1c]
1000169b:	c1 f8 02             	sar    eax,0x2
1000169e:	3b f8                	cmp    edi,eax
100016a0:	72 de                	jb     0x10001680
100016a2:	8b 4e 04             	mov    ecx,DWORD PTR [esi+0x4]
100016a5:	5f                   	pop    edi
100016a6:	5e                   	pop    esi
100016a7:	85 c9                	test   ecx,ecx
100016a9:	74 06                	je     0x100016b1
100016ab:	8b 01                	mov    eax,DWORD PTR [ecx]
100016ad:	6a 01                	push   0x1
100016af:	ff 10                	call   DWORD PTR [eax]
100016b1:	c3                   	ret
100016b2:	cc                   	int3
100016b3:	cc                   	int3
100016b4:	cc                   	int3
100016b5:	cc                   	int3
100016b6:	cc                   	int3
100016b7:	cc                   	int3
100016b8:	cc                   	int3
100016b9:	cc                   	int3
100016ba:	cc                   	int3
100016bb:	cc                   	int3
100016bc:	cc                   	int3
100016bd:	cc                   	int3
100016be:	cc                   	int3
100016bf:	cc                   	int3

; ===== AbstractModel private destructor (100016c0..10001760) =====

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

100016c0 <.text+0x6c0>:
100016c0:	56                   	push   esi
100016c1:	8b f1                	mov    esi,ecx
100016c3:	c7 06 48 71 01 10    	mov    DWORD PTR [esi],0x10017148
100016c9:	8b 4e 1c             	mov    ecx,DWORD PTR [esi+0x1c]
100016cc:	85 c9                	test   ecx,ecx
100016ce:	74 29                	je     0x100016f9
100016d0:	8b 46 24             	mov    eax,DWORD PTR [esi+0x24]
100016d3:	2b c1                	sub    eax,ecx
100016d5:	6a 04                	push   0x4
100016d7:	c1 f8 02             	sar    eax,0x2
100016da:	50                   	push   eax
100016db:	51                   	push   ecx
100016dc:	e8 9f 05 00 00       	call   0x10001c80
100016e1:	c7 46 1c 00 00 00 00 	mov    DWORD PTR [esi+0x1c],0x0
100016e8:	83 c4 0c             	add    esp,0xc
100016eb:	c7 46 20 00 00 00 00 	mov    DWORD PTR [esi+0x20],0x0
100016f2:	c7 46 24 00 00 00 00 	mov    DWORD PTR [esi+0x24],0x0
100016f9:	8b 4e 10             	mov    ecx,DWORD PTR [esi+0x10]
100016fc:	85 c9                	test   ecx,ecx
100016fe:	74 29                	je     0x10001729
10001700:	8b 46 18             	mov    eax,DWORD PTR [esi+0x18]
10001703:	2b c1                	sub    eax,ecx
10001705:	6a 04                	push   0x4
10001707:	c1 f8 02             	sar    eax,0x2
1000170a:	50                   	push   eax
1000170b:	51                   	push   ecx
1000170c:	e8 6f 05 00 00       	call   0x10001c80
10001711:	c7 46 10 00 00 00 00 	mov    DWORD PTR [esi+0x10],0x0
10001718:	83 c4 0c             	add    esp,0xc
1000171b:	c7 46 14 00 00 00 00 	mov    DWORD PTR [esi+0x14],0x0
10001722:	c7 46 18 00 00 00 00 	mov    DWORD PTR [esi+0x18],0x0
10001729:	8b 4e 04             	mov    ecx,DWORD PTR [esi+0x4]
1000172c:	85 c9                	test   ecx,ecx
1000172e:	74 29                	je     0x10001759
10001730:	8b 46 0c             	mov    eax,DWORD PTR [esi+0xc]
10001733:	2b c1                	sub    eax,ecx
10001735:	6a 04                	push   0x4
10001737:	c1 f8 02             	sar    eax,0x2
1000173a:	50                   	push   eax
1000173b:	51                   	push   ecx
1000173c:	e8 3f 05 00 00       	call   0x10001c80
10001741:	c7 46 04 00 00 00 00 	mov    DWORD PTR [esi+0x4],0x0
10001748:	83 c4 0c             	add    esp,0xc
1000174b:	c7 46 08 00 00 00 00 	mov    DWORD PTR [esi+0x8],0x0
10001752:	c7 46 0c 00 00 00 00 	mov    DWORD PTR [esi+0xc],0x0
10001759:	5e                   	pop    esi
1000175a:	c3                   	ret
1000175b:	cc                   	int3
1000175c:	cc                   	int3
1000175d:	cc                   	int3
1000175e:	cc                   	int3
1000175f:	cc                   	int3

; ===== AbstractModel private copy constructor (100014d0..10001550) =====

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

100014d0 <.text+0x4d0>:
100014d0:	55                   	push   ebp
100014d1:	8b ec                	mov    ebp,esp
100014d3:	6a ff                	push   0xffffffff
100014d5:	68 a6 5b 01 10       	push   0x10015ba6
100014da:	64 a1 00 00 00 00    	mov    eax,fs:0x0
100014e0:	50                   	push   eax
100014e1:	51                   	push   ecx
100014e2:	56                   	push   esi
100014e3:	57                   	push   edi
100014e4:	a1 04 10 02 10       	mov    eax,ds:0x10021004
100014e9:	33 c5                	xor    eax,ebp
100014eb:	50                   	push   eax
100014ec:	8d 45 f4             	lea    eax,[ebp-0xc]
100014ef:	64 a3 00 00 00 00    	mov    fs:0x0,eax
100014f5:	8b f9                	mov    edi,ecx
100014f7:	89 7d f0             	mov    DWORD PTR [ebp-0x10],edi
100014fa:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
100014fd:	8d 4f 04             	lea    ecx,[edi+0x4]
10001500:	c7 07 48 71 01 10    	mov    DWORD PTR [edi],0x10017148
10001506:	8d 46 04             	lea    eax,[esi+0x4]
10001509:	50                   	push   eax
1000150a:	e8 f1 fc ff ff       	call   0x10001200
1000150f:	8d 46 10             	lea    eax,[esi+0x10]
10001512:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10001519:	50                   	push   eax
1000151a:	8d 4f 10             	lea    ecx,[edi+0x10]
1000151d:	e8 de fc ff ff       	call   0x10001200
10001522:	8d 46 1c             	lea    eax,[esi+0x1c]
10001525:	c6 45 fc 01          	mov    BYTE PTR [ebp-0x4],0x1
10001529:	50                   	push   eax
1000152a:	8d 4f 1c             	lea    ecx,[edi+0x1c]
1000152d:	e8 ce fc ff ff       	call   0x10001200
10001532:	8b c7                	mov    eax,edi
10001534:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10001537:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000153e:	59                   	pop    ecx
1000153f:	5f                   	pop    edi
10001540:	5e                   	pop    esi
10001541:	8b e5                	mov    esp,ebp
10001543:	5d                   	pop    ebp
10001544:	c2 04 00             	ret    0x4
10001547:	cc                   	int3
10001548:	cc                   	int3
10001549:	cc                   	int3
1000154a:	cc                   	int3
1000154b:	cc                   	int3
1000154c:	cc                   	int3
1000154d:	cc                   	int3
1000154e:	cc                   	int3
1000154f:	cc                   	int3

; ===== AFElementPrivate destructor (100063d0..10006520) =====

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

100063d0 <.text+0x53d0>:
100063d0:	55                   	push   ebp
100063d1:	8b ec                	mov    ebp,esp
100063d3:	51                   	push   ecx
100063d4:	53                   	push   ebx
100063d5:	56                   	push   esi
100063d6:	57                   	push   edi
100063d7:	8b f9                	mov    edi,ecx
100063d9:	8d 9f 8c 00 00 00    	lea    ebx,[edi+0x8c]
100063df:	c7 07 78 72 01 10    	mov    DWORD PTR [edi],0x10017278
100063e5:	8b 03                	mov    eax,DWORD PTR [ebx]
100063e7:	85 c0                	test   eax,eax
100063e9:	74 45                	je     0x10006430
100063eb:	ff 75 fc             	push   DWORD PTR [ebp-0x4]
100063ee:	53                   	push   ebx
100063ef:	ff 73 04             	push   DWORD PTR [ebx+0x4]
100063f2:	50                   	push   eax
100063f3:	e8 78 e2 ff ff       	call   0x10004670
100063f8:	8b 33                	mov    esi,DWORD PTR [ebx]
100063fa:	b8 ab aa aa 2a       	mov    eax,0x2aaaaaab
100063ff:	8b 4b 08             	mov    ecx,DWORD PTR [ebx+0x8]
10006402:	2b ce                	sub    ecx,esi
10006404:	f7 e9                	imul   ecx
10006406:	6a 18                	push   0x18
10006408:	c1 fa 02             	sar    edx,0x2
1000640b:	8b c2                	mov    eax,edx
1000640d:	c1 e8 1f             	shr    eax,0x1f
10006410:	03 c2                	add    eax,edx
10006412:	50                   	push   eax
10006413:	56                   	push   esi
10006414:	e8 67 b8 ff ff       	call   0x10001c80
10006419:	c7 03 00 00 00 00    	mov    DWORD PTR [ebx],0x0
1000641f:	83 c4 1c             	add    esp,0x1c
10006422:	c7 43 04 00 00 00 00 	mov    DWORD PTR [ebx+0x4],0x0
10006429:	c7 43 08 00 00 00 00 	mov    DWORD PTR [ebx+0x8],0x0
10006430:	8d 4f 6c             	lea    ecx,[edi+0x6c]
10006433:	e8 a8 0f 00 00       	call   0x100073e0
10006438:	6a 08                	push   0x8
1000643a:	6a 01                	push   0x1
1000643c:	ff 77 6c             	push   DWORD PTR [edi+0x6c]
1000643f:	e8 3c b8 ff ff       	call   0x10001c80
10006444:	c7 47 6c 00 00 00 00 	mov    DWORD PTR [edi+0x6c],0x0
1000644b:	83 c4 0c             	add    esp,0xc
1000644e:	8b 77 60             	mov    esi,DWORD PTR [edi+0x60]
10006451:	85 f6                	test   esi,esi
10006453:	74 36                	je     0x1000648b
10006455:	8b 4f 68             	mov    ecx,DWORD PTR [edi+0x68]
10006458:	b8 ab aa aa 2a       	mov    eax,0x2aaaaaab
1000645d:	2b ce                	sub    ecx,esi
1000645f:	f7 e9                	imul   ecx
10006461:	6a 0c                	push   0xc
10006463:	d1 fa                	sar    edx,1
10006465:	8b c2                	mov    eax,edx
10006467:	c1 e8 1f             	shr    eax,0x1f
1000646a:	03 c2                	add    eax,edx
1000646c:	50                   	push   eax
1000646d:	56                   	push   esi
1000646e:	e8 0d b8 ff ff       	call   0x10001c80
10006473:	c7 47 60 00 00 00 00 	mov    DWORD PTR [edi+0x60],0x0
1000647a:	83 c4 0c             	add    esp,0xc
1000647d:	c7 47 64 00 00 00 00 	mov    DWORD PTR [edi+0x64],0x0
10006484:	c7 47 68 00 00 00 00 	mov    DWORD PTR [edi+0x68],0x0
1000648b:	8b 47 4c             	mov    eax,DWORD PTR [edi+0x4c]
1000648e:	8d 77 38             	lea    esi,[edi+0x38]
10006491:	83 f8 08             	cmp    eax,0x8
10006494:	72 0e                	jb     0x100064a4
10006496:	6a 02                	push   0x2
10006498:	40                   	inc    eax
10006499:	50                   	push   eax
1000649a:	ff 36                	push   DWORD PTR [esi]
1000649c:	e8 df b7 ff ff       	call   0x10001c80
100064a1:	83 c4 0c             	add    esp,0xc
100064a4:	c7 46 14 07 00 00 00 	mov    DWORD PTR [esi+0x14],0x7
100064ab:	83 7e 14 08          	cmp    DWORD PTR [esi+0x14],0x8
100064af:	c7 46 10 00 00 00 00 	mov    DWORD PTR [esi+0x10],0x0
100064b6:	72 02                	jb     0x100064ba
100064b8:	8b 36                	mov    esi,DWORD PTR [esi]
100064ba:	33 c0                	xor    eax,eax
100064bc:	66 89 06             	mov    WORD PTR [esi],ax
100064bf:	8d 77 20             	lea    esi,[edi+0x20]
100064c2:	8b 46 14             	mov    eax,DWORD PTR [esi+0x14]
100064c5:	83 f8 08             	cmp    eax,0x8
100064c8:	72 0e                	jb     0x100064d8
100064ca:	6a 02                	push   0x2
100064cc:	40                   	inc    eax
100064cd:	50                   	push   eax
100064ce:	ff 36                	push   DWORD PTR [esi]
100064d0:	e8 ab b7 ff ff       	call   0x10001c80
100064d5:	83 c4 0c             	add    esp,0xc
100064d8:	c7 46 14 07 00 00 00 	mov    DWORD PTR [esi+0x14],0x7
100064df:	83 7e 14 08          	cmp    DWORD PTR [esi+0x14],0x8
100064e3:	c7 46 10 00 00 00 00 	mov    DWORD PTR [esi+0x10],0x0
100064ea:	72 02                	jb     0x100064ee
100064ec:	8b 36                	mov    esi,DWORD PTR [esi]
100064ee:	33 c0                	xor    eax,eax
100064f0:	66 89 06             	mov    WORD PTR [esi],ax
100064f3:	c7 07 dc 71 01 10    	mov    DWORD PTR [edi],0x100171dc
100064f9:	8b 4f 10             	mov    ecx,DWORD PTR [edi+0x10]
100064fc:	85 c9                	test   ecx,ecx
100064fe:	74 29                	je     0x10006529
10006500:	8b 47 18             	mov    eax,DWORD PTR [edi+0x18]
10006503:	2b c1                	sub    eax,ecx
10006505:	6a 04                	push   0x4
10006507:	c1 f8 02             	sar    eax,0x2
1000650a:	50                   	push   eax
1000650b:	51                   	push   ecx
1000650c:	e8 6f b7 ff ff       	call   0x10001c80
10006511:	c7 47 10 00 00 00 00 	mov    DWORD PTR [edi+0x10],0x0
10006518:	83 c4 0c             	add    esp,0xc
1000651b:	c7                   	.byte 0xc7
1000651c:	47                   	inc    edi
1000651d:	14 00                	adc    al,0x0
	...

; ===== AFElement child cache cleanup helper (100073e0..10007495) =====

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

100073e0 <.text+0x63e0>:
100073e0:	56                   	push   esi
100073e1:	8b f1                	mov    esi,ecx
100073e3:	83 7e 10 00          	cmp    DWORD PTR [esi+0x10],0x0
100073e7:	74 1a                	je     0x10007403
100073e9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [eax+0x0]
100073f0:	83 46 10 ff          	add    DWORD PTR [esi+0x10],0xffffffff
100073f4:	75 07                	jne    0x100073fd
100073f6:	c7 46 0c 00 00 00 00 	mov    DWORD PTR [esi+0xc],0x0
100073fd:	83 7e 10 00          	cmp    DWORD PTR [esi+0x10],0x0
10007401:	75 ed                	jne    0x100073f0
10007403:	57                   	push   edi
10007404:	8b 7e 08             	mov    edi,DWORD PTR [esi+0x8]
10007407:	85 ff                	test   edi,edi
10007409:	74 1d                	je     0x10007428
1000740b:	0f 1f 44 00 00       	nop    DWORD PTR [eax+eax*1+0x0]
10007410:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
10007413:	4f                   	dec    edi
10007414:	8b 04 b8             	mov    eax,DWORD PTR [eax+edi*4]
10007417:	85 c0                	test   eax,eax
10007419:	74 09                	je     0x10007424
1000741b:	50                   	push   eax
1000741c:	e8 02 d9 00 00       	call   0x10014d23
10007421:	83 c4 04             	add    esp,0x4
10007424:	85 ff                	test   edi,edi
10007426:	75 e8                	jne    0x10007410
10007428:	8b 4e 04             	mov    ecx,DWORD PTR [esi+0x4]
1000742b:	5f                   	pop    edi
1000742c:	85 c9                	test   ecx,ecx
1000742e:	74 55                	je     0x10007485
10007430:	8b 46 08             	mov    eax,DWORD PTR [esi+0x8]
10007433:	3d ff ff ff 3f       	cmp    eax,0x3fffffff
10007438:	76 06                	jbe    0x10007440
1000743a:	ff 15 b8 70 01 10    	call   DWORD PTR ds:0x100170b8
10007440:	c1 e0 02             	shl    eax,0x2
10007443:	3d 00 10 00 00       	cmp    eax,0x1000
10007448:	72 32                	jb     0x1000747c
1000744a:	f6 c1 1f             	test   cl,0x1f
1000744d:	74 06                	je     0x10007455
1000744f:	ff 15 b8 70 01 10    	call   DWORD PTR ds:0x100170b8
10007455:	8b 41 fc             	mov    eax,DWORD PTR [ecx-0x4]
10007458:	3b c1                	cmp    eax,ecx
1000745a:	72 06                	jb     0x10007462
1000745c:	ff 15 b8 70 01 10    	call   DWORD PTR ds:0x100170b8
10007462:	2b c8                	sub    ecx,eax
10007464:	83 f9 04             	cmp    ecx,0x4
10007467:	73 06                	jae    0x1000746f
10007469:	ff 15 b8 70 01 10    	call   DWORD PTR ds:0x100170b8
1000746f:	83 f9 23             	cmp    ecx,0x23
10007472:	76 06                	jbe    0x1000747a
10007474:	ff 15 b8 70 01 10    	call   DWORD PTR ds:0x100170b8
1000747a:	8b c8                	mov    ecx,eax
1000747c:	51                   	push   ecx
1000747d:	e8 a1 d8 00 00       	call   0x10014d23
10007482:	83 c4 04             	add    esp,0x4
10007485:	c7 46 08 00 00 00 00 	mov    DWORD PTR [esi+0x8],0x0
1000748c:	c7 46 04 00 00 00 00 	mov    DWORD PTR [esi+0x4],0x0
10007493:	5e                   	pop    esi
10007494:	c3                   	ret

; ===== AFElement alternatives string cleanup helper (10004670..10004730) =====

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

10004670 <.text+0x3670>:
10004670:	55                   	push   ebp
10004671:	8b ec                	mov    ebp,esp
10004673:	56                   	push   esi
10004674:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
10004677:	57                   	push   edi
10004678:	8b 7d 0c             	mov    edi,DWORD PTR [ebp+0xc]
1000467b:	3b f7                	cmp    esi,edi
1000467d:	74 6a                	je     0x100046e9
1000467f:	83 c6 14             	add    esi,0x14
10004682:	8b 06                	mov    eax,DWORD PTR [esi]
10004684:	83 f8 08             	cmp    eax,0x8
10004687:	72 37                	jb     0x100046c0
10004689:	8b 4e ec             	mov    ecx,DWORD PTR [esi-0x14]
1000468c:	40                   	inc    eax
1000468d:	3d ff ff ff 7f       	cmp    eax,0x7fffffff
10004692:	77 59                	ja     0x100046ed
10004694:	03 c0                	add    eax,eax
10004696:	3d 00 10 00 00       	cmp    eax,0x1000
1000469b:	72 1a                	jb     0x100046b7
1000469d:	f6 c1 1f             	test   cl,0x1f
100046a0:	75 4b                	jne    0x100046ed
100046a2:	8b 41 fc             	mov    eax,DWORD PTR [ecx-0x4]
100046a5:	3b c1                	cmp    eax,ecx
100046a7:	73 44                	jae    0x100046ed
100046a9:	2b c8                	sub    ecx,eax
100046ab:	83 f9 04             	cmp    ecx,0x4
100046ae:	72 3d                	jb     0x100046ed
100046b0:	83 f9 23             	cmp    ecx,0x23
100046b3:	77 38                	ja     0x100046ed
100046b5:	8b c8                	mov    ecx,eax
100046b7:	51                   	push   ecx
100046b8:	e8 66 06 01 00       	call   0x10014d23
100046bd:	83 c4 04             	add    esp,0x4
100046c0:	c7 06 07 00 00 00    	mov    DWORD PTR [esi],0x7
100046c6:	83 3e 08             	cmp    DWORD PTR [esi],0x8
100046c9:	c7 46 fc 00 00 00 00 	mov    DWORD PTR [esi-0x4],0x0
100046d0:	72 05                	jb     0x100046d7
100046d2:	8b 46 ec             	mov    eax,DWORD PTR [esi-0x14]
100046d5:	eb 03                	jmp    0x100046da
100046d7:	8d 46 ec             	lea    eax,[esi-0x14]
100046da:	83 c6 18             	add    esi,0x18
100046dd:	33 c9                	xor    ecx,ecx
100046df:	66 89 08             	mov    WORD PTR [eax],cx
100046e2:	8d 46 ec             	lea    eax,[esi-0x14]
100046e5:	3b c7                	cmp    eax,edi
100046e7:	75 99                	jne    0x10004682
100046e9:	5f                   	pop    edi
100046ea:	5e                   	pop    esi
100046eb:	5d                   	pop    ebp
100046ec:	c3                   	ret
100046ed:	ff 15 b8 70 01 10    	call   DWORD PTR ds:0x100170b8
100046f3:	cc                   	int3
100046f4:	cc                   	int3
100046f5:	cc                   	int3
100046f6:	cc                   	int3
100046f7:	cc                   	int3
100046f8:	cc                   	int3
100046f9:	cc                   	int3
100046fa:	cc                   	int3
100046fb:	cc                   	int3
100046fc:	cc                   	int3
100046fd:	cc                   	int3
100046fe:	cc                   	int3
100046ff:	cc                   	int3
10004700:	55                   	push   ebp
10004701:	8b ec                	mov    ebp,esp
10004703:	83 ec 20             	sub    esp,0x20
10004706:	53                   	push   ebx
10004707:	8b 5d 0c             	mov    ebx,DWORD PTR [ebp+0xc]
1000470a:	33 c9                	xor    ecx,ecx
1000470c:	56                   	push   esi
1000470d:	57                   	push   edi
1000470e:	8b 7d 08             	mov    edi,DWORD PTR [ebp+0x8]
10004711:	33 f6                	xor    esi,esi
10004713:	2b df                	sub    ebx,edi
10004715:	89 75 fc             	mov    DWORD PTR [ebp-0x4],esi
10004718:	83 c3 03             	add    ebx,0x3
1000471b:	c1 eb 02             	shr    ebx,0x2
1000471e:	3b 7d 0c             	cmp    edi,DWORD PTR [ebp+0xc]
10004721:	0f 47 d9             	cmova  ebx,ecx
10004724:	89 5d 0c             	mov    DWORD PTR [ebp+0xc],ebx
10004727:	85 db                	test   ebx,ebx
10004729:	0f 84 87 00 00 00    	je     0x100047b6
1000472f:	90                   	nop

; ===== AIElementPrivate destructor (1000c8e0..1000c980) =====

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

1000c8e0 <.text+0xb8e0>:
1000c8e0:	56                   	push   esi
1000c8e1:	57                   	push   edi
1000c8e2:	8b f9                	mov    edi,ecx
1000c8e4:	8d 77 20             	lea    esi,[edi+0x20]
1000c8e7:	c7 07 38 73 01 10    	mov    DWORD PTR [edi],0x10017338
1000c8ed:	8b 46 14             	mov    eax,DWORD PTR [esi+0x14]
1000c8f0:	83 f8 10             	cmp    eax,0x10
1000c8f3:	72 0e                	jb     0x1000c903
1000c8f5:	6a 01                	push   0x1
1000c8f7:	40                   	inc    eax
1000c8f8:	50                   	push   eax
1000c8f9:	ff 36                	push   DWORD PTR [esi]
1000c8fb:	e8 80 53 ff ff       	call   0x10001c80
1000c900:	83 c4 0c             	add    esp,0xc
1000c903:	c7 46 14 0f 00 00 00 	mov    DWORD PTR [esi+0x14],0xf
1000c90a:	83 7e 14 10          	cmp    DWORD PTR [esi+0x14],0x10
1000c90e:	c7 46 10 00 00 00 00 	mov    DWORD PTR [esi+0x10],0x0
1000c915:	72 02                	jb     0x1000c919
1000c917:	8b 36                	mov    esi,DWORD PTR [esi]
1000c919:	c6 06 00             	mov    BYTE PTR [esi],0x0
1000c91c:	c7 07 dc 71 01 10    	mov    DWORD PTR [edi],0x100171dc
1000c922:	8b 4f 10             	mov    ecx,DWORD PTR [edi+0x10]
1000c925:	85 c9                	test   ecx,ecx
1000c927:	74 29                	je     0x1000c952
1000c929:	8b 47 18             	mov    eax,DWORD PTR [edi+0x18]
1000c92c:	2b c1                	sub    eax,ecx
1000c92e:	6a 04                	push   0x4
1000c930:	c1 f8 02             	sar    eax,0x2
1000c933:	50                   	push   eax
1000c934:	51                   	push   ecx
1000c935:	e8 46 53 ff ff       	call   0x10001c80
1000c93a:	c7 47 10 00 00 00 00 	mov    DWORD PTR [edi+0x10],0x0
1000c941:	83 c4 0c             	add    esp,0xc
1000c944:	c7 47 14 00 00 00 00 	mov    DWORD PTR [edi+0x14],0x0
1000c94b:	c7 47 18 00 00 00 00 	mov    DWORD PTR [edi+0x18],0x0
1000c952:	8d 4f 0c             	lea    ecx,[edi+0xc]
1000c955:	e8 86 54 00 00       	call   0x10011de0
1000c95a:	8d 4f 08             	lea    ecx,[edi+0x8]
1000c95d:	5f                   	pop    edi
1000c95e:	5e                   	pop    esi
1000c95f:	e9 7c 54 00 00       	jmp    0x10011de0
1000c964:	cc                   	int3
1000c965:	cc                   	int3
1000c966:	cc                   	int3
1000c967:	cc                   	int3
1000c968:	cc                   	int3
1000c969:	cc                   	int3
1000c96a:	cc                   	int3
1000c96b:	cc                   	int3
1000c96c:	cc                   	int3
1000c96d:	cc                   	int3
1000c96e:	cc                   	int3
1000c96f:	cc                   	int3
1000c970:	55                   	push   ebp
1000c971:	8b ec                	mov    ebp,esp
1000c973:	56                   	push   esi
1000c974:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
1000c977:	57                   	push   edi
1000c978:	8b f9                	mov    edi,ecx
1000c97a:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
1000c97d:	89 47 04             	mov    DWORD PTR [edi+0x4],eax

; ===== ParameterPrivate destructor (10012c40..10012c80) =====

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

10012c40 <.text+0x11c40>:
10012c40:	56                   	push   esi
10012c41:	8b f1                	mov    esi,ecx
10012c43:	8d 4e 48             	lea    ecx,[esi+0x48]
10012c46:	c7 06 94 75 01 10    	mov    DWORD PTR [esi],0x10017594
10012c4c:	e8 8f f1 ff ff       	call   0x10011de0
10012c51:	8b ce                	mov    ecx,esi
10012c53:	5e                   	pop    esi
10012c54:	e9 87 9c ff ff       	jmp    0x1000c8e0
10012c59:	cc                   	int3
10012c5a:	cc                   	int3
10012c5b:	cc                   	int3
10012c5c:	cc                   	int3
10012c5d:	cc                   	int3
10012c5e:	cc                   	int3
10012c5f:	cc                   	int3
10012c60:	55                   	push   ebp
10012c61:	8b ec                	mov    ebp,esp
10012c63:	56                   	push   esi
10012c64:	57                   	push   edi
10012c65:	8b 7d 08             	mov    edi,DWORD PTR [ebp+0x8]
10012c68:	8b f1                	mov    esi,ecx
10012c6a:	8b 47 04             	mov    eax,DWORD PTR [edi+0x4]
10012c6d:	8d 4e 08             	lea    ecx,[esi+0x8]
10012c70:	89 46 04             	mov    DWORD PTR [esi+0x4],eax
10012c73:	8d 47 08             	lea    eax,[edi+0x8]
10012c76:	50                   	push   eax
10012c77:	e8 c4 f1 ff ff       	call   0x10011e40
10012c7c:	8d 47 0c             	lea    eax,[edi+0xc]
10012c7f:	50                   	push   eax

; ===== SubjectOperationPrivate destructor (100144c0..10014500) =====

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

100144c0 <.text+0x134c0>:
100144c0:	56                   	push   esi
100144c1:	57                   	push   edi
100144c2:	8b f9                	mov    edi,ecx
100144c4:	8d b7 98 00 00 00    	lea    esi,[edi+0x98]
100144ca:	c7 07 ec 75 01 10    	mov    DWORD PTR [edi],0x100175ec
100144d0:	8b 46 14             	mov    eax,DWORD PTR [esi+0x14]
100144d3:	83 f8 08             	cmp    eax,0x8
100144d6:	72 0e                	jb     0x100144e6
100144d8:	6a 02                	push   0x2
100144da:	40                   	inc    eax
100144db:	50                   	push   eax
100144dc:	ff 36                	push   DWORD PTR [esi]
100144de:	e8 9d d7 fe ff       	call   0x10001c80
100144e3:	83 c4 0c             	add    esp,0xc
100144e6:	c7 46 14 07 00 00 00 	mov    DWORD PTR [esi+0x14],0x7
100144ed:	83 7e 14 08          	cmp    DWORD PTR [esi+0x14],0x8
100144f1:	c7 46 10 00 00 00 00 	mov    DWORD PTR [esi+0x10],0x0
100144f8:	72 02                	jb     0x100144fc
100144fa:	8b 36                	mov    esi,DWORD PTR [esi]
100144fc:	33 c0                	xor    eax,eax
100144fe:	8b cf                	mov    ecx,edi
