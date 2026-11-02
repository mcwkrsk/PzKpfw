
/mnt/data/work_stage117/original/PM_params.dll:     file format pei-i386


Disassembly of section .text:

100021a0 <.text+0x11a0>:
100021a0:	7e 10                	jle    0x100021b2
100021a2:	5b                   	pop    ebx
100021a3:	72 10                	jb     0x100021b5
100021a5:	8b 06                	mov    eax,DWORD PTR [esi]
100021a7:	33 c9                	xor    ecx,ecx
100021a9:	66 89 0c 78          	mov    WORD PTR [eax+edi*2],cx
100021ad:	8b c6                	mov    eax,esi
100021af:	5f                   	pop    edi
100021b0:	5e                   	pop    esi
100021b1:	5d                   	pop    ebp
100021b2:	c2 08 00             	ret    0x8
100021b5:	8b c6                	mov    eax,esi
100021b7:	33 c9                	xor    ecx,ecx
100021b9:	66 89 0c 78          	mov    WORD PTR [eax+edi*2],cx
100021bd:	5f                   	pop    edi
100021be:	8b c6                	mov    eax,esi
100021c0:	5e                   	pop    esi
100021c1:	5d                   	pop    ebp
100021c2:	c2 08 00             	ret    0x8
100021c5:	cc                   	int3
100021c6:	cc                   	int3
100021c7:	cc                   	int3
100021c8:	cc                   	int3
100021c9:	cc                   	int3
100021ca:	cc                   	int3
100021cb:	cc                   	int3
100021cc:	cc                   	int3
100021cd:	cc                   	int3
100021ce:	cc                   	int3
100021cf:	cc                   	int3
100021d0:	55                   	push   ebp
100021d1:	8b ec                	mov    ebp,esp
100021d3:	6a ff                	push   0xffffffff
100021d5:	68 35 91 00 10       	push   0x10009135
100021da:	64 a1 00 00 00 00    	mov    eax,fs:0x0
100021e0:	50                   	push   eax
100021e1:	83 ec 3c             	sub    esp,0x3c
100021e4:	a1 50 30 02 10       	mov    eax,ds:0x10023050
100021e9:	33 c5                	xor    eax,ebp
100021eb:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
100021ee:	53                   	push   ebx
100021ef:	56                   	push   esi
100021f0:	57                   	push   edi
100021f1:	50                   	push   eax
100021f2:	8d 45 f4             	lea    eax,[ebp-0xc]
100021f5:	64 a3 00 00 00 00    	mov    fs:0x0,eax
100021fb:	8b d9                	mov    ebx,ecx
100021fd:	89 5d c8             	mov    DWORD PTR [ebp-0x38],ebx
10002200:	8b 4b 18             	mov    ecx,DWORD PTR [ebx+0x18]
10002203:	ff 15 d0 a0 00 10    	call   DWORD PTR ds:0x1000a0d0
10002209:	8b c8                	mov    ecx,eax
1000220b:	ff 15 ac a0 00 10    	call   DWORD PTR ds:0x1000a0ac
10002211:	8b 4b 48             	mov    ecx,DWORD PTR [ebx+0x48]
10002214:	8b f8                	mov    edi,eax
10002216:	8d 45 d4             	lea    eax,[ebp-0x2c]
10002219:	50                   	push   eax
1000221a:	ff 15 b4 a8 00 10    	call   DWORD PTR ds:0x1000a8b4
10002220:	8d 4d d8             	lea    ecx,[ebp-0x28]
10002223:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000222a:	51                   	push   ecx
1000222b:	8b c8                	mov    ecx,eax
1000222d:	ff 15 34 a2 00 10    	call   DWORD PTR ds:0x1000a234
10002233:	83 78 14 08          	cmp    DWORD PTR [eax+0x14],0x8
10002237:	c6 45 fc 01          	mov    BYTE PTR [ebp-0x4],0x1
1000223b:	72 02                	jb     0x1000223f
1000223d:	8b 00                	mov    eax,DWORD PTR [eax]
1000223f:	51                   	push   ecx
10002240:	8b cc                	mov    ecx,esp
10002242:	50                   	push   eax
10002243:	ff 15 dc a0 00 10    	call   DWORD PTR ds:0x1000a0dc
10002249:	8b cf                	mov    ecx,edi
1000224b:	ff 15 b8 a0 00 10    	call   DWORD PTR ds:0x1000a0b8
10002251:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
10002254:	83 f8 08             	cmp    eax,0x8
10002257:	72 0f                	jb     0x10002268
10002259:	40                   	inc    eax
1000225a:	6a 02                	push   0x2
1000225c:	50                   	push   eax
1000225d:	ff 75 d8             	push   DWORD PTR [ebp-0x28]
10002260:	e8 eb f8 ff ff       	call   0x10001b50
10002265:	83 c4 0c             	add    esp,0xc
10002268:	33 c0                	xor    eax,eax
1000226a:	c7 45 ec 07 00 00 00 	mov    DWORD PTR [ebp-0x14],0x7
10002271:	8d 4d d4             	lea    ecx,[ebp-0x2c]
10002274:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
1000227b:	66 89 45 d8          	mov    WORD PTR [ebp-0x28],ax
1000227f:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
10002286:	ff 15 40 a2 00 10    	call   DWORD PTR ds:0x1000a240
1000228c:	6a 08                	push   0x8
1000228e:	e8 5e 5f 00 00       	call   0x100081f1
10002293:	8b f0                	mov    esi,eax
10002295:	83 c4 04             	add    esp,0x4
10002298:	89 75 d0             	mov    DWORD PTR [ebp-0x30],esi
1000229b:	c7 45 fc 02 00 00 00 	mov    DWORD PTR [ebp-0x4],0x2
100022a2:	85 f6                	test   esi,esi
100022a4:	74 10                	je     0x100022b6
100022a6:	8b ce                	mov    ecx,esi
100022a8:	ff 15 b0 a2 00 10    	call   DWORD PTR ds:0x1000a2b0
100022ae:	c7 06 2c 80 01 10    	mov    DWORD PTR [esi],0x1001802c
100022b4:	eb 02                	jmp    0x100022b8
100022b6:	33 f6                	xor    esi,esi
100022b8:	8d 45 d0             	lea    eax,[ebp-0x30]
100022bb:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
100022c2:	50                   	push   eax
100022c3:	8b cf                	mov    ecx,edi
100022c5:	ff 15 b4 a0 00 10    	call   DWORD PTR ds:0x1000a0b4
100022cb:	8b c8                	mov    ecx,eax
100022cd:	c7 45 fc 03 00 00 00 	mov    DWORD PTR [ebp-0x4],0x3
100022d4:	ff 15 d8 a0 00 10    	call   DWORD PTR ds:0x1000a0d8
100022da:	8b d0                	mov    edx,eax
100022dc:	c7 45 ec 07 00 00 00 	mov    DWORD PTR [ebp-0x14],0x7
100022e3:	33 c0                	xor    eax,eax
100022e5:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
100022ec:	66 89 45 d8          	mov    WORD PTR [ebp-0x28],ax
100022f0:	66 39 02             	cmp    WORD PTR [edx],ax
100022f3:	75 04                	jne    0x100022f9
100022f5:	33 c9                	xor    ecx,ecx
100022f7:	eb 19                	jmp    0x10002312
100022f9:	8b ca                	mov    ecx,edx
100022fb:	8d 59 02             	lea    ebx,[ecx+0x2]
100022fe:	66 90                	xchg   ax,ax
10002300:	66 8b 01             	mov    ax,WORD PTR [ecx]
10002303:	83 c1 02             	add    ecx,0x2
10002306:	66 85 c0             	test   ax,ax
10002309:	75 f5                	jne    0x10002300
1000230b:	2b cb                	sub    ecx,ebx
1000230d:	8b 5d c8             	mov    ebx,DWORD PTR [ebp-0x38]
10002310:	d1 f9                	sar    ecx,1
10002312:	51                   	push   ecx
10002313:	52                   	push   edx
10002314:	8d 4d d8             	lea    ecx,[ebp-0x28]
10002317:	e8 34 fa ff ff       	call   0x10001d50
1000231c:	8d 45 d8             	lea    eax,[ebp-0x28]
1000231f:	c6 45 fc 04          	mov    BYTE PTR [ebp-0x4],0x4
10002323:	50                   	push   eax
10002324:	8d 45 d4             	lea    eax,[ebp-0x2c]
10002327:	50                   	push   eax
10002328:	ff 15 38 a2 00 10    	call   DWORD PTR ds:0x1000a238
1000232e:	83 c4 08             	add    esp,0x8
10002331:	50                   	push   eax
10002332:	8d 4d b8             	lea    ecx,[ebp-0x48]
10002335:	c6 45 fc 05          	mov    BYTE PTR [ebp-0x4],0x5
10002339:	ff 15 14 a2 00 10    	call   DWORD PTR ds:0x1000a214
1000233f:	8b 06                	mov    eax,DWORD PTR [esi]
10002341:	8d 4d b8             	lea    ecx,[ebp-0x48]
10002344:	6a 02                	push   0x2
10002346:	51                   	push   ecx
10002347:	8b ce                	mov    ecx,esi
10002349:	c6 45 fc 06          	mov    BYTE PTR [ebp-0x4],0x6
1000234d:	ff 50 08             	call   DWORD PTR [eax+0x8]
10002350:	8d 4d b8             	lea    ecx,[ebp-0x48]
10002353:	ff 15 1c a2 00 10    	call   DWORD PTR ds:0x1000a21c
10002359:	8d 4d d4             	lea    ecx,[ebp-0x2c]
1000235c:	ff 15 40 a2 00 10    	call   DWORD PTR ds:0x1000a240
10002362:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
10002365:	83 f8 08             	cmp    eax,0x8
10002368:	72 0f                	jb     0x10002379
1000236a:	40                   	inc    eax
1000236b:	6a 02                	push   0x2
1000236d:	50                   	push   eax
1000236e:	ff 75 d8             	push   DWORD PTR [ebp-0x28]
10002371:	e8 da f7 ff ff       	call   0x10001b50
10002376:	83 c4 0c             	add    esp,0xc
10002379:	33 c0                	xor    eax,eax
1000237b:	c7 45 ec 07 00 00 00 	mov    DWORD PTR [ebp-0x14],0x7
10002382:	8d 4d d0             	lea    ecx,[ebp-0x30]
10002385:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
1000238c:	66 89 45 d8          	mov    WORD PTR [ebp-0x28],ax
10002390:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
10002397:	ff 15 e4 a0 00 10    	call   DWORD PTR ds:0x1000a0e4
1000239d:	8b cf                	mov    ecx,edi
1000239f:	ff 15 b0 a0 00 10    	call   DWORD PTR ds:0x1000a0b0
100023a5:	50                   	push   eax
100023a6:	8d 4d b8             	lea    ecx,[ebp-0x48]
100023a9:	ff 15 18 a2 00 10    	call   DWORD PTR ds:0x1000a218
100023af:	8b 06                	mov    eax,DWORD PTR [esi]
100023b1:	8d 4d b8             	lea    ecx,[ebp-0x48]
100023b4:	68 01 01 00 00       	push   0x101
100023b9:	51                   	push   ecx
100023ba:	8b ce                	mov    ecx,esi
100023bc:	c7 45 fc 07 00 00 00 	mov    DWORD PTR [ebp-0x4],0x7
100023c3:	ff 50 08             	call   DWORD PTR [eax+0x8]
100023c6:	8d 4d b8             	lea    ecx,[ebp-0x48]
100023c9:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
100023d0:	ff 15 1c a2 00 10    	call   DWORD PTR ds:0x1000a21c
100023d6:	8b 4b 3c             	mov    ecx,DWORD PTR [ebx+0x3c]
100023d9:	56                   	push   esi
100023da:	ff 15 d4 a8 00 10    	call   DWORD PTR ds:0x1000a8d4
100023e0:	8b c8                	mov    ecx,eax
100023e2:	ff 15 9c a2 00 10    	call   DWORD PTR ds:0x1000a29c
100023e8:	6a 00                	push   0x0
100023ea:	68 ec 76 01 10       	push   0x100176ec
100023ef:	ff 15 30 a2 00 10    	call   DWORD PTR ds:0x1000a230
100023f5:	83 c4 08             	add    esp,0x8
100023f8:	89 45 cc             	mov    DWORD PTR [ebp-0x34],eax
100023fb:	8b 4b 48             	mov    ecx,DWORD PTR [ebx+0x48]
100023fe:	8d 45 cc             	lea    eax,[ebp-0x34]
10002401:	50                   	push   eax
10002402:	c7 45 fc 08 00 00 00 	mov    DWORD PTR [ebp-0x4],0x8
10002409:	ff 15 b0 a8 00 10    	call   DWORD PTR ds:0x1000a8b0
1000240f:	8d 4d cc             	lea    ecx,[ebp-0x34]
10002412:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
10002419:	ff 15 40 a2 00 10    	call   DWORD PTR ds:0x1000a240
1000241f:	8b 4b 48             	mov    ecx,DWORD PTR [ebx+0x48]
10002422:	6a 07                	push   0x7
10002424:	ff 15 e8 a7 00 10    	call   DWORD PTR ds:0x1000a7e8
1000242a:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000242d:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10002434:	59                   	pop    ecx
10002435:	5f                   	pop    edi
10002436:	5e                   	pop    esi
10002437:	5b                   	pop    ebx
10002438:	8b 4d f0             	mov    ecx,DWORD PTR [ebp-0x10]
1000243b:	33 cd                	xor    ecx,ebp
1000243d:	e8 9e 5d 00 00       	call   0x100081e0
10002442:	8b e5                	mov    esp,ebp
10002444:	5d                   	pop    ebp
10002445:	c3                   	ret
10002446:	cc                   	int3
10002447:	cc                   	int3
10002448:	cc                   	int3
10002449:	cc                   	int3
1000244a:	cc                   	int3
1000244b:	cc                   	int3
1000244c:	cc                   	int3
1000244d:	cc                   	int3
1000244e:	cc                   	int3
1000244f:	cc                   	int3
10002450:	55                   	push   ebp
10002451:	8b ec                	mov    ebp,esp
10002453:	6a ff                	push   0xffffffff
10002455:	68 69 91 00 10       	push   0x10009169
1000245a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10002460:	50                   	push   eax
10002461:	83 ec 4c             	sub    esp,0x4c
10002464:	53                   	push   ebx
10002465:	56                   	push   esi
10002466:	57                   	push   edi
10002467:	a1 50 30 02 10       	mov    eax,ds:0x10023050
1000246c:	33 c5                	xor    eax,ebp
1000246e:	50                   	push   eax
1000246f:	8d 45 f4             	lea    eax,[ebp-0xc]
10002472:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10002478:	8b f9                	mov    edi,ecx
1000247a:	8b 4f 3c             	mov    ecx,DWORD PTR [edi+0x3c]
1000247d:	ff 15 d4 a8 00 10    	call   DWORD PTR ds:0x1000a8d4
10002483:	8b 4f 3c             	mov    ecx,DWORD PTR [edi+0x3c]
10002486:	8b f0                	mov    esi,eax
10002488:	8d 45 d8             	lea    eax,[ebp-0x28]
1000248b:	89 75 f0             	mov    DWORD PTR [ebp-0x10],esi
1000248e:	50                   	push   eax
1000248f:	ff 15 cc a8 00 10    	call   DWORD PTR ds:0x1000a8cc
10002495:	8b c8                	mov    ecx,eax
10002497:	ff 15 fc a1 00 10    	call   DWORD PTR ds:0x1000a1fc
1000249d:	8b d8                	mov    ebx,eax
1000249f:	89 5d e8             	mov    DWORD PTR [ebp-0x18],ebx
100024a2:	83 fb ff             	cmp    ebx,0xffffffff
100024a5:	0f 84 e8 00 00 00    	je     0x10002593
100024ab:	8b 36                	mov    esi,DWORD PTR [esi]
100024ad:	8d 4d c8             	lea    ecx,[ebp-0x38]
100024b0:	68 01 01 00 00       	push   0x101
100024b5:	ff 15 00 a2 00 10    	call   DWORD PTR ds:0x1000a200
100024bb:	8b 4d f0             	mov    ecx,DWORD PTR [ebp-0x10]
100024be:	50                   	push   eax
100024bf:	6a 00                	push   0x0
100024c1:	53                   	push   ebx
100024c2:	8d 45 b8             	lea    eax,[ebp-0x48]
100024c5:	50                   	push   eax
100024c6:	ff 56 2c             	call   DWORD PTR [esi+0x2c]
100024c9:	8b 4d f0             	mov    ecx,DWORD PTR [ebp-0x10]
100024cc:	50                   	push   eax
100024cd:	8d 45 d8             	lea    eax,[ebp-0x28]
100024d0:	50                   	push   eax
100024d1:	ff 56 44             	call   DWORD PTR [esi+0x44]
100024d4:	6a 00                	push   0x0
100024d6:	8b c8                	mov    ecx,eax
100024d8:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
100024df:	ff 15 10 a2 00 10    	call   DWORD PTR ds:0x1000a210
100024e5:	8d 4d d8             	lea    ecx,[ebp-0x28]
100024e8:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
100024ef:	ff 15 1c a2 00 10    	call   DWORD PTR ds:0x1000a21c
100024f5:	8b 4f 18             	mov    ecx,DWORD PTR [edi+0x18]
100024f8:	53                   	push   ebx
100024f9:	ff 15 d0 a0 00 10    	call   DWORD PTR ds:0x1000a0d0
100024ff:	8b c8                	mov    ecx,eax
10002501:	ff 15 a8 a0 00 10    	call   DWORD PTR ds:0x1000a0a8
10002507:	8b 4f 18             	mov    ecx,DWORD PTR [edi+0x18]
1000250a:	33 f6                	xor    esi,esi
1000250c:	8b 1d d4 a0 00 10    	mov    ebx,DWORD PTR ds:0x1000a0d4
10002512:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
10002515:	ff d3                	call   ebx
10002517:	8b c8                	mov    ecx,eax
10002519:	ff 15 c4 a0 00 10    	call   DWORD PTR ds:0x1000a0c4
1000251f:	85 c0                	test   eax,eax
10002521:	7e 3f                	jle    0x10002562
10002523:	8b 4f 18             	mov    ecx,DWORD PTR [edi+0x18]
10002526:	56                   	push   esi
10002527:	ff d3                	call   ebx
10002529:	8b c8                	mov    ecx,eax
1000252b:	ff 15 c8 a0 00 10    	call   DWORD PTR ds:0x1000a0c8
10002531:	8b d8                	mov    ebx,eax
10002533:	8b cb                	mov    ecx,ebx
10002535:	ff 15 bc a0 00 10    	call   DWORD PTR ds:0x1000a0bc
1000253b:	3b 45 ec             	cmp    eax,DWORD PTR [ebp-0x14]
1000253e:	75 0a                	jne    0x1000254a
10002540:	6a 00                	push   0x0
10002542:	8b cb                	mov    ecx,ebx
10002544:	ff 15 c0 a0 00 10    	call   DWORD PTR ds:0x1000a0c0
1000254a:	8b 4f 18             	mov    ecx,DWORD PTR [edi+0x18]
1000254d:	46                   	inc    esi
1000254e:	8b 1d d4 a0 00 10    	mov    ebx,DWORD PTR ds:0x1000a0d4
10002554:	ff d3                	call   ebx
10002556:	8b c8                	mov    ecx,eax
10002558:	ff 15 c4 a0 00 10    	call   DWORD PTR ds:0x1000a0c4
1000255e:	3b f0                	cmp    esi,eax
10002560:	7c c1                	jl     0x10002523
10002562:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
10002565:	ff 15 b0 a0 00 10    	call   DWORD PTR ds:0x1000a0b0
1000256b:	8b 4f 18             	mov    ecx,DWORD PTR [edi+0x18]
1000256e:	50                   	push   eax
1000256f:	ff 15 d0 a0 00 10    	call   DWORD PTR ds:0x1000a0d0
10002575:	8b c8                	mov    ecx,eax
10002577:	ff 15 a4 a0 00 10    	call   DWORD PTR ds:0x1000a0a4
1000257d:	8d 4d a8             	lea    ecx,[ebp-0x58]
10002580:	ff 15 00 a2 00 10    	call   DWORD PTR ds:0x1000a200
10002586:	8b 4d f0             	mov    ecx,DWORD PTR [ebp-0x10]
10002589:	50                   	push   eax
1000258a:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
1000258d:	ff 15 f4 a1 00 10    	call   DWORD PTR ds:0x1000a1f4
10002593:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10002596:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000259d:	59                   	pop    ecx
1000259e:	5f                   	pop    edi
1000259f:	5e                   	pop    esi
100025a0:	5b                   	pop    ebx
100025a1:	8b e5                	mov    esp,ebp
100025a3:	5d                   	pop    ebp
100025a4:	c3                   	ret
100025a5:	cc                   	int3
100025a6:	cc                   	int3
100025a7:	cc                   	int3
100025a8:	cc                   	int3
100025a9:	cc                   	int3
100025aa:	cc                   	int3
100025ab:	cc                   	int3
100025ac:	cc                   	int3
100025ad:	cc                   	int3
100025ae:	cc                   	int3
100025af:	cc                   	int3
100025b0:	55                   	push   ebp
100025b1:	8b ec                	mov    ebp,esp
100025b3:	83 ec 38             	sub    esp,0x38
100025b6:	53                   	push   ebx
100025b7:	8b d9                	mov    ebx,ecx
100025b9:	56                   	push   esi
100025ba:	8b 4b 3c             	mov    ecx,DWORD PTR [ebx+0x3c]
100025bd:	ff 15 d4 a8 00 10    	call   DWORD PTR ds:0x1000a8d4
100025c3:	8b 4b 3c             	mov    ecx,DWORD PTR [ebx+0x3c]
100025c6:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
100025c9:	8d 45 e8             	lea    eax,[ebp-0x18]
100025cc:	50                   	push   eax
100025cd:	ff 15 cc a8 00 10    	call   DWORD PTR ds:0x1000a8cc
100025d3:	8b c8                	mov    ecx,eax
100025d5:	ff 15 fc a1 00 10    	call   DWORD PTR ds:0x1000a1fc
100025db:	8b 4b 18             	mov    ecx,DWORD PTR [ebx+0x18]
100025de:	8b f0                	mov    esi,eax
100025e0:	89 75 f8             	mov    DWORD PTR [ebp-0x8],esi
100025e3:	ff 15 d0 a0 00 10    	call   DWORD PTR ds:0x1000a0d0
100025e9:	8b c8                	mov    ecx,eax
100025eb:	ff 15 a0 a0 00 10    	call   DWORD PTR ds:0x1000a0a0
100025f1:	48                   	dec    eax
100025f2:	3b f0                	cmp    esi,eax
100025f4:	0f 8d 9c 00 00 00    	jge    0x10002696
100025fa:	83 fe ff             	cmp    esi,0xffffffff
100025fd:	0f 84 93 00 00 00    	je     0x10002696
10002603:	8b 4b 18             	mov    ecx,DWORD PTR [ebx+0x18]
10002606:	57                   	push   edi
10002607:	8d 7e 01             	lea    edi,[esi+0x1]
1000260a:	57                   	push   edi
1000260b:	56                   	push   esi
1000260c:	ff 15 d0 a0 00 10    	call   DWORD PTR ds:0x1000a0d0
10002612:	8b c8                	mov    ecx,eax
10002614:	ff 15 cc a0 00 10    	call   DWORD PTR ds:0x1000a0cc
1000261a:	8b 4b 3c             	mov    ecx,DWORD PTR [ebx+0x3c]
1000261d:	8d 45 e8             	lea    eax,[ebp-0x18]
10002620:	8b 35 cc a8 00 10    	mov    esi,DWORD PTR ds:0x1000a8cc
10002626:	50                   	push   eax
10002627:	ff d6                	call   esi
10002629:	8b c8                	mov    ecx,eax
1000262b:	ff 15 f8 a1 00 10    	call   DWORD PTR ds:0x1000a1f8
10002631:	8b 4b 3c             	mov    ecx,DWORD PTR [ebx+0x3c]
10002634:	50                   	push   eax
10002635:	8d 45 d8             	lea    eax,[ebp-0x28]
10002638:	50                   	push   eax
10002639:	ff d6                	call   esi
1000263b:	8b c8                	mov    ecx,eax
1000263d:	ff 15 fc a1 00 10    	call   DWORD PTR ds:0x1000a1fc
10002643:	8b 4d fc             	mov    ecx,DWORD PTR [ebp-0x4]
10002646:	50                   	push   eax
10002647:	ff 15 94 a2 00 10    	call   DWORD PTR ds:0x1000a294
1000264d:	8d 4d c8             	lea    ecx,[ebp-0x38]
10002650:	8b f0                	mov    esi,eax
10002652:	ff 15 00 a2 00 10    	call   DWORD PTR ds:0x1000a200
10002658:	8b 4d fc             	mov    ecx,DWORD PTR [ebp-0x4]
1000265b:	50                   	push   eax
1000265c:	ff 75 f8             	push   DWORD PTR [ebp-0x8]
1000265f:	ff 15 f4 a1 00 10    	call   DWORD PTR ds:0x1000a1f4
10002665:	56                   	push   esi
10002666:	8b 75 fc             	mov    esi,DWORD PTR [ebp-0x4]
10002669:	8b ce                	mov    ecx,esi
1000266b:	57                   	push   edi
1000266c:	ff 15 98 a2 00 10    	call   DWORD PTR ds:0x1000a298
10002672:	8b 36                	mov    esi,DWORD PTR [esi]
10002674:	8d 4d c8             	lea    ecx,[ebp-0x38]
10002677:	ff 15 00 a2 00 10    	call   DWORD PTR ds:0x1000a200
1000267d:	8b 4d fc             	mov    ecx,DWORD PTR [ebp-0x4]
10002680:	50                   	push   eax
10002681:	6a 00                	push   0x0
10002683:	57                   	push   edi
10002684:	8d 45 d8             	lea    eax,[ebp-0x28]
10002687:	50                   	push   eax
10002688:	ff 56 2c             	call   DWORD PTR [esi+0x2c]
1000268b:	8b 4b 3c             	mov    ecx,DWORD PTR [ebx+0x3c]
1000268e:	50                   	push   eax
1000268f:	ff 15 c4 a8 00 10    	call   DWORD PTR ds:0x1000a8c4
10002695:	5f                   	pop    edi
10002696:	5e                   	pop    esi
10002697:	5b                   	pop    ebx
10002698:	8b e5                	mov    esp,ebp
1000269a:	5d                   	pop    ebp
1000269b:	c3                   	ret
1000269c:	cc                   	int3
1000269d:	cc                   	int3
1000269e:	cc                   	int3
1000269f:	cc                   	int3
100026a0:	55                   	push   ebp
100026a1:	8b ec                	mov    ebp,esp
100026a3:	83 ec 38             	sub    esp,0x38
100026a6:	53                   	push   ebx
100026a7:	56                   	push   esi
100026a8:	8b f1                	mov    esi,ecx
100026aa:	89 75 f8             	mov    DWORD PTR [ebp-0x8],esi
100026ad:	8b 4e 3c             	mov    ecx,DWORD PTR [esi+0x3c]
100026b0:	ff 15 d4 a8 00 10    	call   DWORD PTR ds:0x1000a8d4
100026b6:	8b 4e 3c             	mov    ecx,DWORD PTR [esi+0x3c]
100026b9:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
100026bc:	8d 45 e8             	lea    eax,[ebp-0x18]
100026bf:	50                   	push   eax
100026c0:	ff 15 cc a8 00 10    	call   DWORD PTR ds:0x1000a8cc
100026c6:	8b c8                	mov    ecx,eax
100026c8:	ff 15 fc a1 00 10    	call   DWORD PTR ds:0x1000a1fc
100026ce:	8b d8                	mov    ebx,eax
100026d0:	85 db                	test   ebx,ebx
100026d2:	0f 84 9d 00 00 00    	je     0x10002775
100026d8:	83 fb ff             	cmp    ebx,0xffffffff
100026db:	0f 84 94 00 00 00    	je     0x10002775
100026e1:	8b 4e 18             	mov    ecx,DWORD PTR [esi+0x18]
100026e4:	57                   	push   edi
100026e5:	8d 7b ff             	lea    edi,[ebx-0x1]
100026e8:	57                   	push   edi
100026e9:	53                   	push   ebx
100026ea:	ff 15 d0 a0 00 10    	call   DWORD PTR ds:0x1000a0d0
100026f0:	8b c8                	mov    ecx,eax
100026f2:	ff 15 cc a0 00 10    	call   DWORD PTR ds:0x1000a0cc
100026f8:	8b 4e 3c             	mov    ecx,DWORD PTR [esi+0x3c]
100026fb:	8d 45 e8             	lea    eax,[ebp-0x18]
100026fe:	50                   	push   eax
100026ff:	ff 15 cc a8 00 10    	call   DWORD PTR ds:0x1000a8cc
10002705:	8b c8                	mov    ecx,eax
10002707:	ff 15 f8 a1 00 10    	call   DWORD PTR ds:0x1000a1f8
1000270d:	8b 4e 3c             	mov    ecx,DWORD PTR [esi+0x3c]
10002710:	50                   	push   eax
10002711:	8d 45 d8             	lea    eax,[ebp-0x28]
10002714:	50                   	push   eax
10002715:	ff 15 cc a8 00 10    	call   DWORD PTR ds:0x1000a8cc
1000271b:	8b c8                	mov    ecx,eax
1000271d:	ff 15 fc a1 00 10    	call   DWORD PTR ds:0x1000a1fc
10002723:	8b 4d fc             	mov    ecx,DWORD PTR [ebp-0x4]
10002726:	50                   	push   eax
10002727:	ff 15 94 a2 00 10    	call   DWORD PTR ds:0x1000a294
1000272d:	8d 4d c8             	lea    ecx,[ebp-0x38]
10002730:	8b f0                	mov    esi,eax
10002732:	ff 15 00 a2 00 10    	call   DWORD PTR ds:0x1000a200
10002738:	50                   	push   eax
10002739:	53                   	push   ebx
1000273a:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
1000273d:	8b cb                	mov    ecx,ebx
1000273f:	ff 15 f4 a1 00 10    	call   DWORD PTR ds:0x1000a1f4
10002745:	56                   	push   esi
10002746:	57                   	push   edi
10002747:	8b cb                	mov    ecx,ebx
10002749:	ff 15 98 a2 00 10    	call   DWORD PTR ds:0x1000a298
1000274f:	8b 33                	mov    esi,DWORD PTR [ebx]
10002751:	8d 4d c8             	lea    ecx,[ebp-0x38]
10002754:	ff 15 00 a2 00 10    	call   DWORD PTR ds:0x1000a200
1000275a:	50                   	push   eax
1000275b:	6a 00                	push   0x0
1000275d:	57                   	push   edi
1000275e:	8d 45 d8             	lea    eax,[ebp-0x28]
10002761:	8b cb                	mov    ecx,ebx
10002763:	50                   	push   eax
10002764:	ff 56 2c             	call   DWORD PTR [esi+0x2c]
10002767:	8b 4d f8             	mov    ecx,DWORD PTR [ebp-0x8]
1000276a:	50                   	push   eax
1000276b:	8b 49 3c             	mov    ecx,DWORD PTR [ecx+0x3c]
1000276e:	ff 15 c4 a8 00 10    	call   DWORD PTR ds:0x1000a8c4
10002774:	5f                   	pop    edi
10002775:	5e                   	pop    esi
10002776:	5b                   	pop    ebx
10002777:	8b e5                	mov    esp,ebp
10002779:	5d                   	pop    ebp
1000277a:	c3                   	ret
1000277b:	cc                   	int3
1000277c:	cc                   	int3
1000277d:	cc                   	int3
1000277e:	cc                   	int3
1000277f:	cc                   	int3
10002780:	55                   	push   ebp
10002781:	8b ec                	mov    ebp,esp
10002783:	6a ff                	push   0xffffffff
10002785:	68 cf 91 00 10       	push   0x100091cf
1000278a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10002790:	50                   	push   eax
10002791:	83 ec 0c             	sub    esp,0xc
10002794:	53                   	push   ebx
10002795:	56                   	push   esi
10002796:	57                   	push   edi
10002797:	a1 50 30 02 10       	mov    eax,ds:0x10023050
1000279c:	33 c5                	xor    eax,ebp
1000279e:	50                   	push   eax
1000279f:	8d 45 f4             	lea    eax,[ebp-0xc]
100027a2:	64 a3 00 00 00 00    	mov    fs:0x0,eax
100027a8:	8b f9                	mov    edi,ecx
100027aa:	89 7d f0             	mov    DWORD PTR [ebp-0x10],edi
100027ad:	8b 1d 04 a2 00 10    	mov    ebx,DWORD PTR ds:0x1000a204
100027b3:	8d 45 ec             	lea    eax,[ebp-0x14]
100027b6:	6a ff                	push   0xffffffff
100027b8:	6a 00                	push   0x0
100027ba:	68 34 7e 01 10       	push   0x10017e34
100027bf:	68                   	.byte 0x68
