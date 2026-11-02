
/mnt/data/work_stage117/original/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

10003160 <.text+0x2160>:
10003160:	55                   	push   ebp
10003161:	8b ec                	mov    ebp,esp
10003163:	8b 49 04             	mov    ecx,DWORD PTR [ecx+0x4]
10003166:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10003169:	8b 44 81 1c          	mov    eax,DWORD PTR [ecx+eax*4+0x1c]
1000316d:	5d                   	pop    ebp
1000316e:	c2 04 00             	ret    0x4
10003171:	cc                   	int3
10003172:	cc                   	int3
10003173:	cc                   	int3
10003174:	cc                   	int3
10003175:	cc                   	int3
10003176:	cc                   	int3
10003177:	cc                   	int3
10003178:	cc                   	int3
10003179:	cc                   	int3
1000317a:	cc                   	int3
1000317b:	cc                   	int3
1000317c:	cc                   	int3
1000317d:	cc                   	int3
1000317e:	cc                   	int3
1000317f:	cc                   	int3
10003180:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
10003183:	8b 40 28             	mov    eax,DWORD PTR [eax+0x28]
10003186:	c3                   	ret
10003187:	cc                   	int3
10003188:	cc                   	int3
10003189:	cc                   	int3
1000318a:	cc                   	int3
1000318b:	cc                   	int3
1000318c:	cc                   	int3
1000318d:	cc                   	int3
1000318e:	cc                   	int3
1000318f:	cc                   	int3
10003190:	55                   	push   ebp
10003191:	8b ec                	mov    ebp,esp
10003193:	80 7d 0c 00          	cmp    BYTE PTR [ebp+0xc],0x0
10003197:	8b 51 04             	mov    edx,DWORD PTR [ecx+0x4]
1000319a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000319d:	53                   	push   ebx
1000319e:	8b 5c 82 1c          	mov    ebx,DWORD PTR [edx+eax*4+0x1c]
100031a2:	c7 44 82 1c 00 00 00 	mov    DWORD PTR [edx+eax*4+0x1c],0x0
100031a9:	00 
100031aa:	74 51                	je     0x100031fd
100031ac:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
100031af:	56                   	push   esi
100031b0:	57                   	push   edi
100031b1:	89 4d 0c             	mov    DWORD PTR [ebp+0xc],ecx
100031b4:	8d 4d 0c             	lea    ecx,[ebp+0xc]
100031b7:	8b 70 14             	mov    esi,DWORD PTR [eax+0x14]
100031ba:	51                   	push   ecx
100031bb:	56                   	push   esi
100031bc:	ff 70 10             	push   DWORD PTR [eax+0x10]
100031bf:	e8 1c 72 00 00       	call   0x1000a3e0
100031c4:	8b 4b 04             	mov    ecx,DWORD PTR [ebx+0x4]
100031c7:	8b f8                	mov    edi,eax
100031c9:	83 c1 10             	add    ecx,0x10
100031cc:	83 c4 0c             	add    esp,0xc
100031cf:	89 4d 0c             	mov    DWORD PTR [ebp+0xc],ecx
100031d2:	8b 01                	mov    eax,DWORD PTR [ecx]
100031d4:	3b f8                	cmp    edi,eax
100031d6:	75 05                	jne    0x100031dd
100031d8:	3b 71 04             	cmp    esi,DWORD PTR [ecx+0x4]
100031db:	74 1b                	je     0x100031f8
100031dd:	3b fe                	cmp    edi,esi
100031df:	74 1a                	je     0x100031fb
100031e1:	8b 59 04             	mov    ebx,DWORD PTR [ecx+0x4]
100031e4:	2b de                	sub    ebx,esi
100031e6:	53                   	push   ebx
100031e7:	56                   	push   esi
100031e8:	57                   	push   edi
100031e9:	ff 15 4c 70 01 10    	call   DWORD PTR ds:0x1001704c
100031ef:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
100031f2:	8d 04 3b             	lea    eax,[ebx+edi*1]
100031f5:	83 c4 0c             	add    esp,0xc
100031f8:	89 41 04             	mov    DWORD PTR [ecx+0x4],eax
100031fb:	5f                   	pop    edi
100031fc:	5e                   	pop    esi
100031fd:	5b                   	pop    ebx
100031fe:	5d                   	pop    ebp
100031ff:	c2 08 00             	ret    0x8
10003202:	cc                   	int3
10003203:	cc                   	int3
10003204:	cc                   	int3
10003205:	cc                   	int3
10003206:	cc                   	int3
10003207:	cc                   	int3
10003208:	cc                   	int3
10003209:	cc                   	int3
1000320a:	cc                   	int3
1000320b:	cc                   	int3
1000320c:	cc                   	int3
1000320d:	cc                   	int3
1000320e:	cc                   	int3
1000320f:	cc                   	int3
10003210:	55                   	push   ebp
10003211:	8b ec                	mov    ebp,esp
10003213:	83 ec 0c             	sub    esp,0xc
10003216:	53                   	push   ebx
10003217:	ba 1c 00 00 00       	mov    edx,0x1c
1000321c:	89 4d fc             	mov    DWORD PTR [ebp-0x4],ecx
1000321f:	56                   	push   esi
10003220:	89 55 f8             	mov    DWORD PTR [ebp-0x8],edx
10003223:	57                   	push   edi
10003224:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
10003227:	8b 34 02             	mov    esi,DWORD PTR [edx+eax*1]
1000322a:	89 75 f4             	mov    DWORD PTR [ebp-0xc],esi
1000322d:	3b 75 08             	cmp    esi,DWORD PTR [ebp+0x8]
10003230:	0f 85 99 00 00 00    	jne    0x100032cf
10003236:	80 7d 0c 00          	cmp    BYTE PTR [ebp+0xc],0x0
1000323a:	c7 04 02 00 00 00 00 	mov    DWORD PTR [edx+eax*1],0x0
10003241:	0f 84 88 00 00 00    	je     0x100032cf
10003247:	8b 76 04             	mov    esi,DWORD PTR [esi+0x4]
1000324a:	8b 46 14             	mov    eax,DWORD PTR [esi+0x14]
1000324d:	8b 76 10             	mov    esi,DWORD PTR [esi+0x10]
10003250:	3b f0                	cmp    esi,eax
10003252:	74 43                	je     0x10003297
10003254:	39 0e                	cmp    DWORD PTR [esi],ecx
10003256:	74 07                	je     0x1000325f
10003258:	83 c6 04             	add    esi,0x4
1000325b:	3b f0                	cmp    esi,eax
1000325d:	75 f5                	jne    0x10003254
1000325f:	3b f0                	cmp    esi,eax
10003261:	74 34                	je     0x10003297
10003263:	8d 4e 04             	lea    ecx,[esi+0x4]
10003266:	8b d8                	mov    ebx,eax
10003268:	2b d9                	sub    ebx,ecx
1000326a:	33 ff                	xor    edi,edi
1000326c:	83 c3 03             	add    ebx,0x3
1000326f:	33 d2                	xor    edx,edx
10003271:	c1 eb 02             	shr    ebx,0x2
10003274:	3b c8                	cmp    ecx,eax
10003276:	0f 47 df             	cmova  ebx,edi
10003279:	85 db                	test   ebx,ebx
1000327b:	74 17                	je     0x10003294
1000327d:	0f 1f 00             	nop    DWORD PTR [eax]
10003280:	8b 39                	mov    edi,DWORD PTR [ecx]
10003282:	3b 7d fc             	cmp    edi,DWORD PTR [ebp-0x4]
10003285:	74 05                	je     0x1000328c
10003287:	89 3e                	mov    DWORD PTR [esi],edi
10003289:	83 c6 04             	add    esi,0x4
1000328c:	42                   	inc    edx
1000328d:	83 c1 04             	add    ecx,0x4
10003290:	3b d3                	cmp    edx,ebx
10003292:	75 ec                	jne    0x10003280
10003294:	8b 55 f8             	mov    edx,DWORD PTR [ebp-0x8]
10003297:	8b 5d f4             	mov    ebx,DWORD PTR [ebp-0xc]
1000329a:	8b 5b 04             	mov    ebx,DWORD PTR [ebx+0x4]
1000329d:	8b 4b 10             	mov    ecx,DWORD PTR [ebx+0x10]
100032a0:	3b f1                	cmp    esi,ecx
100032a2:	75 0a                	jne    0x100032ae
100032a4:	3b 43 14             	cmp    eax,DWORD PTR [ebx+0x14]
100032a7:	75 05                	jne    0x100032ae
100032a9:	89 4b 14             	mov    DWORD PTR [ebx+0x14],ecx
100032ac:	eb 1e                	jmp    0x100032cc
100032ae:	3b f0                	cmp    esi,eax
100032b0:	74 1a                	je     0x100032cc
100032b2:	8b 7b 14             	mov    edi,DWORD PTR [ebx+0x14]
100032b5:	2b f8                	sub    edi,eax
100032b7:	57                   	push   edi
100032b8:	50                   	push   eax
100032b9:	56                   	push   esi
100032ba:	ff 15 4c 70 01 10    	call   DWORD PTR ds:0x1001704c
100032c0:	8b 55 f8             	mov    edx,DWORD PTR [ebp-0x8]
100032c3:	8d 04 37             	lea    eax,[edi+esi*1]
100032c6:	83 c4 0c             	add    esp,0xc
100032c9:	89 43 14             	mov    DWORD PTR [ebx+0x14],eax
100032cc:	8b 4d fc             	mov    ecx,DWORD PTR [ebp-0x4]
100032cf:	83 c2 04             	add    edx,0x4
100032d2:	89 55 f8             	mov    DWORD PTR [ebp-0x8],edx
100032d5:	83 fa 28             	cmp    edx,0x28
100032d8:	0f 8c 46 ff ff ff    	jl     0x10003224
100032de:	5f                   	pop    edi
100032df:	5e                   	pop    esi
100032e0:	5b                   	pop    ebx
100032e1:	8b e5                	mov    esp,ebp
100032e3:	5d                   	pop    ebp
100032e4:	c2 08 00             	ret    0x8
100032e7:	cc                   	int3
100032e8:	cc                   	int3
100032e9:	cc                   	int3
100032ea:	cc                   	int3
100032eb:	cc                   	int3
100032ec:	cc                   	int3
100032ed:	cc                   	int3
100032ee:	cc                   	int3
100032ef:	cc                   	int3
100032f0:	83 79 2c 00          	cmp    DWORD PTR [ecx+0x2c],0x0
100032f4:	74 12                	je     0x10003308
100032f6:	8b 49 2c             	mov    ecx,DWORD PTR [ecx+0x2c]
100032f9:	85 c9                	test   ecx,ecx
100032fb:	75 06                	jne    0x10003303
100032fd:	ff 25 3c 70 01 10    	jmp    DWORD PTR ds:0x1001703c
10003303:	8b 01                	mov    eax,DWORD PTR [ecx]
10003305:	ff 60 08             	jmp    DWORD PTR [eax+0x8]
10003308:	c3                   	ret
10003309:	cc                   	int3
1000330a:	cc                   	int3
1000330b:	cc                   	int3
1000330c:	cc                   	int3
1000330d:	cc                   	int3
1000330e:	cc                   	int3
1000330f:	cc                   	int3
10003310:	55                   	push   ebp
10003311:	8b ec                	mov    ebp,esp
10003313:	8b 49 04             	mov    ecx,DWORD PTR [ecx+0x4]
10003316:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10003319:	89 41 28             	mov    DWORD PTR [ecx+0x28],eax
1000331c:	5d                   	pop    ebp
1000331d:	c2 04 00             	ret    0x4
10003320:	55                   	push   ebp
10003321:	8b ec                	mov    ebp,esp
10003323:	83 ec 14             	sub    esp,0x14
10003326:	53                   	push   ebx
10003327:	56                   	push   esi
10003328:	8b d9                	mov    ebx,ecx
1000332a:	ba 1c 00 00 00       	mov    edx,0x1c
1000332f:	57                   	push   edi
10003330:	89 5d f8             	mov    DWORD PTR [ebp-0x8],ebx
10003333:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
10003336:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
10003339:	8b 34 02             	mov    esi,DWORD PTR [edx+eax*1]
1000333c:	89 75 ec             	mov    DWORD PTR [ebp-0x14],esi
1000333f:	85 f6                	test   esi,esi
10003341:	0f 84 9e 00 00 00    	je     0x100033e5
10003347:	80 7d 08 00          	cmp    BYTE PTR [ebp+0x8],0x0
1000334b:	c7 04 02 00 00 00 00 	mov    DWORD PTR [edx+eax*1],0x0
10003352:	0f 84 8d 00 00 00    	je     0x100033e5
10003358:	8b 76 04             	mov    esi,DWORD PTR [esi+0x4]
1000335b:	8b 46 14             	mov    eax,DWORD PTR [esi+0x14]
1000335e:	8b 76 10             	mov    esi,DWORD PTR [esi+0x10]
10003361:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
10003364:	3b f0                	cmp    esi,eax
10003366:	74 45                	je     0x100033ad
10003368:	39 1e                	cmp    DWORD PTR [esi],ebx
1000336a:	74 07                	je     0x10003373
1000336c:	83 c6 04             	add    esi,0x4
1000336f:	3b f0                	cmp    esi,eax
10003371:	75 f5                	jne    0x10003368
10003373:	3b f0                	cmp    esi,eax
10003375:	74 36                	je     0x100033ad
10003377:	8d 4e 04             	lea    ecx,[esi+0x4]
1000337a:	8b f8                	mov    edi,eax
1000337c:	2b f9                	sub    edi,ecx
1000337e:	33 d2                	xor    edx,edx
10003380:	83 c7 03             	add    edi,0x3
10003383:	c1 ef 02             	shr    edi,0x2
10003386:	3b c8                	cmp    ecx,eax
10003388:	0f 47 fa             	cmova  edi,edx
1000338b:	89 7d f4             	mov    DWORD PTR [ebp-0xc],edi
1000338e:	85 ff                	test   edi,edi
10003390:	74 18                	je     0x100033aa
10003392:	8b c7                	mov    eax,edi
10003394:	8b 39                	mov    edi,DWORD PTR [ecx]
10003396:	3b fb                	cmp    edi,ebx
10003398:	74 05                	je     0x1000339f
1000339a:	89 3e                	mov    DWORD PTR [esi],edi
1000339c:	83 c6 04             	add    esi,0x4
1000339f:	42                   	inc    edx
100033a0:	83 c1 04             	add    ecx,0x4
100033a3:	3b d0                	cmp    edx,eax
100033a5:	75 ed                	jne    0x10003394
100033a7:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
100033aa:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
100033ad:	8b 5d ec             	mov    ebx,DWORD PTR [ebp-0x14]
100033b0:	8b 5b 04             	mov    ebx,DWORD PTR [ebx+0x4]
100033b3:	8b 4b 10             	mov    ecx,DWORD PTR [ebx+0x10]
100033b6:	3b f1                	cmp    esi,ecx
100033b8:	75 0a                	jne    0x100033c4
100033ba:	3b 43 14             	cmp    eax,DWORD PTR [ebx+0x14]
100033bd:	75 05                	jne    0x100033c4
100033bf:	89 4b 14             	mov    DWORD PTR [ebx+0x14],ecx
100033c2:	eb 1e                	jmp    0x100033e2
100033c4:	3b f0                	cmp    esi,eax
100033c6:	74 1a                	je     0x100033e2
100033c8:	8b 7b 14             	mov    edi,DWORD PTR [ebx+0x14]
100033cb:	2b f8                	sub    edi,eax
100033cd:	57                   	push   edi
100033ce:	50                   	push   eax
100033cf:	56                   	push   esi
100033d0:	ff 15 4c 70 01 10    	call   DWORD PTR ds:0x1001704c
100033d6:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
100033d9:	8d 04 37             	lea    eax,[edi+esi*1]
100033dc:	83 c4 0c             	add    esp,0xc
100033df:	89 43 14             	mov    DWORD PTR [ebx+0x14],eax
100033e2:	8b 5d f8             	mov    ebx,DWORD PTR [ebp-0x8]
100033e5:	83 c2 04             	add    edx,0x4
100033e8:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
100033eb:	83 fa 28             	cmp    edx,0x28
100033ee:	0f 8c 42 ff ff ff    	jl     0x10003336
100033f4:	5f                   	pop    edi
100033f5:	5e                   	pop    esi
100033f6:	5b                   	pop    ebx
100033f7:	8b e5                	mov    esp,ebp
100033f9:	5d                   	pop    ebp
100033fa:	c2 04 00             	ret    0x4
100033fd:	cc                   	int3
100033fe:	cc                   	int3
100033ff:	cc                   	int3
10003400:	55                   	push   ebp
10003401:	8b ec                	mov    ebp,esp
10003403:	6a ff                	push   0xffffffff
10003405:	68 c7 5c 01 10       	push   0x10015cc7
1000340a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10003410:	50                   	push   eax
10003411:	83 ec 08             	sub    esp,0x8
10003414:	56                   	push   esi
10003415:	57                   	push   edi
10003416:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000341b:	33 c5                	xor    eax,ebp
1000341d:	50                   	push   eax
1000341e:	8d 45 f4             	lea    eax,[ebp-0xc]
10003421:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10003427:	8b f1                	mov    esi,ecx
10003429:	89 75 f0             	mov    DWORD PTR [ebp-0x10],esi
1000342c:	6a 34                	push   0x34
1000342e:	e8 bd 18 01 00       	call   0x10014cf0
10003433:	8b f8                	mov    edi,eax
10003435:	83 c4 04             	add    esp,0x4
10003438:	89 7d ec             	mov    DWORD PTR [ebp-0x14],edi
1000343b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10003442:	85 ff                	test   edi,edi
10003444:	74 16                	je     0x1000345c
10003446:	6a 34                	push   0x34
10003448:	6a 00                	push   0x0
1000344a:	57                   	push   edi
1000344b:	e8 64 26 01 00       	call   0x10015ab4
10003450:	83 c4 0c             	add    esp,0xc
10003453:	8b cf                	mov    ecx,edi
10003455:	e8 a6 00 00 00       	call   0x10003500
1000345a:	eb 02                	jmp    0x1000345e
1000345c:	33 c0                	xor    eax,eax
1000345e:	50                   	push   eax
1000345f:	8b ce                	mov    ecx,esi
10003461:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
10003468:	e8 13 f7 ff ff       	call   0x10002b80
1000346d:	6a 04                	push   0x4
1000346f:	8b ce                	mov    ecx,esi
10003471:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [ebp-0x4],0x1
10003478:	c7 06 88 71 01 10    	mov    DWORD PTR [esi],0x10017188
1000347e:	e8 8d fe ff ff       	call   0x10003310
10003483:	8b c6                	mov    eax,esi
10003485:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10003488:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000348f:	59                   	pop    ecx
10003490:	5f                   	pop    edi
10003491:	5e                   	pop    esi
10003492:	8b e5                	mov    esp,ebp
10003494:	5d                   	pop    ebp
10003495:	c3                   	ret
10003496:	cc                   	int3
10003497:	cc                   	int3
10003498:	cc                   	int3
10003499:	cc                   	int3
1000349a:	cc                   	int3
1000349b:	cc                   	int3
1000349c:	cc                   	int3
1000349d:	cc                   	int3
1000349e:	cc                   	int3
1000349f:	cc                   	int3
100034a0:	55                   	push   ebp
100034a1:	8b ec                	mov    ebp,esp
100034a3:	6a ff                	push   0xffffffff
100034a5:	68 f8 5c 01 10       	push   0x10015cf8
100034aa:	64 a1 00 00 00 00    	mov    eax,fs:0x0
100034b0:	50                   	push   eax
100034b1:	51                   	push   ecx
100034b2:	56                   	push   esi
100034b3:	a1 04 10 02 10       	mov    eax,ds:0x10021004
100034b8:	33 c5                	xor    eax,ebp
100034ba:	50                   	push   eax
100034bb:	8d 45 f4             	lea    eax,[ebp-0xc]
100034be:	64 a3 00 00 00 00    	mov    fs:0x0,eax
100034c4:	8b f1                	mov    esi,ecx
100034c6:	89 75 f0             	mov    DWORD PTR [ebp-0x10],esi
100034c9:	ff 75 08             	push   DWORD PTR [ebp+0x8]
100034cc:	e8 af f6 ff ff       	call   0x10002b80
100034d1:	6a 04                	push   0x4
100034d3:	8b ce                	mov    ecx,esi
100034d5:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
100034dc:	c7 06 88 71 01 10    	mov    DWORD PTR [esi],0x10017188
100034e2:	e8 29 fe ff ff       	call   0x10003310
100034e7:	8b c6                	mov    eax,esi
100034e9:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
100034ec:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
100034f3:	59                   	pop    ecx
100034f4:	5e                   	pop    esi
100034f5:	8b e5                	mov    esp,ebp
100034f7:	5d                   	pop    ebp
100034f8:	c2 04 00             	ret    0x4
100034fb:	cc                   	int3
100034fc:	cc                   	int3
100034fd:	cc                   	int3
100034fe:	cc                   	int3
100034ff:	cc                   	int3
10003500:	55                   	push   ebp
10003501:	8b ec                	mov    ebp,esp
10003503:	6a ff                	push   0xffffffff
10003505:	68 7b 65 01 10       	push   0x1001657b
1000350a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10003510:	50                   	push   eax
10003511:	51                   	push   ecx
10003512:	56                   	push   esi
10003513:	a1 04 10 02 10       	mov    eax,ds:0x10021004
10003518:	33 c5                	xor    eax,ebp
1000351a:	50                   	push   eax
1000351b:	8d 45 f4             	lea    eax,[ebp-0xc]
1000351e:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10003524:	8b f1                	mov    esi,ecx
10003526:	89 75 f0             	mov    DWORD PTR [ebp-0x10],esi
10003529:	68 e0 71 01 10       	push   0x100171e0
1000352e:	8d 4e 08             	lea    ecx,[esi+0x8]
10003531:	c7 06 dc 71 01 10    	mov    DWORD PTR [esi],0x100171dc
10003537:	c7 46 04 00 00 00 00 	mov    DWORD PTR [esi+0x4],0x0
1000353e:	e8 bd e7 00 00       	call   0x10011d00
10003543:	68 e0 71 01 10       	push   0x100171e0
10003548:	8d 4e 0c             	lea    ecx,[esi+0xc]
1000354b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10003552:	e8 a9 e7 00 00       	call   0x10011d00
10003557:	c7 46 10 00 00 00 00 	mov    DWORD PTR [esi+0x10],0x0
1000355e:	8b c6                	mov    eax,esi
10003560:	c7 46 14 00 00 00 00 	mov    DWORD PTR [esi+0x14],0x0
10003567:	c7 46 18 00 00 00 00 	mov    DWORD PTR [esi+0x18],0x0
1000356e:	c7 06 0c 72 01 10    	mov    DWORD PTR [esi],0x1001720c
10003574:	c6 46 2c 00          	mov    BYTE PTR [esi+0x2c],0x0
10003578:	c7 46 30 01 00 00 00 	mov    DWORD PTR [esi+0x30],0x1
1000357f:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10003582:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10003589:	59                   	pop    ecx
1000358a:	5e                   	pop    esi
1000358b:	8b e5                	mov    esp,ebp
1000358d:	5d                   	pop    ebp
1000358e:	c3                   	ret
1000358f:	cc                   	int3
10003590:	c7 01 88 71 01 10    	mov    DWORD PTR [ecx],0x10017188
10003596:	e9 05 f9 ff ff       	jmp    0x10002ea0
1000359b:	cc                   	int3
1000359c:	cc                   	int3
1000359d:	cc                   	int3
1000359e:	cc                   	int3
1000359f:	cc                   	int3
100035a0:	55                   	push   ebp
100035a1:	8b ec                	mov    ebp,esp
100035a3:	56                   	push   esi
100035a4:	8b f1                	mov    esi,ecx
100035a6:	c7 06 dc 71 01 10    	mov    DWORD PTR [esi],0x100171dc
100035ac:	8b 4e 10             	mov    ecx,DWORD PTR [esi+0x10]
100035af:	85 c9                	test   ecx,ecx
100035b1:	74 29                	je     0x100035dc
100035b3:	8b 46 18             	mov    eax,DWORD PTR [esi+0x18]
100035b6:	2b c1                	sub    eax,ecx
100035b8:	6a 04                	push   0x4
100035ba:	c1 f8 02             	sar    eax,0x2
100035bd:	50                   	push   eax
100035be:	51                   	push   ecx
100035bf:	e8 bc e6 ff ff       	call   0x10001c80
100035c4:	c7 46 10 00 00 00 00 	mov    DWORD PTR [esi+0x10],0x0
100035cb:	83 c4 0c             	add    esp,0xc
100035ce:	c7 46 14 00 00 00 00 	mov    DWORD PTR [esi+0x14],0x0
100035d5:	c7 46 18 00 00 00 00 	mov    DWORD PTR [esi+0x18],0x0
100035dc:	8d 4e 0c             	lea    ecx,[esi+0xc]
100035df:	e8 fc e7 00 00       	call   0x10011de0
100035e4:	8d 4e 08             	lea    ecx,[esi+0x8]
100035e7:	e8 f4 e7 00 00       	call   0x10011de0
100035ec:	f6 45 08 01          	test   BYTE PTR [ebp+0x8],0x1
100035f0:	74 0b                	je     0x100035fd
100035f2:	6a 34                	push   0x34
100035f4:	56                   	push   esi
100035f5:	e8 2e 17 01 00       	call   0x10014d28
100035fa:	83 c4 08             	add    esp,0x8
100035fd:	8b c6                	mov    eax,esi
100035ff:	5e                   	pop    esi
10003600:	5d                   	pop    ebp
10003601:	c2 04 00             	ret    0x4
10003604:	cc                   	int3
10003605:	cc                   	int3
10003606:	cc                   	int3
10003607:	cc                   	int3
10003608:	cc                   	int3
10003609:	cc                   	int3
1000360a:	cc                   	int3
1000360b:	cc                   	int3
1000360c:	cc                   	int3
1000360d:	cc                   	int3
1000360e:	cc                   	int3
1000360f:	cc                   	int3
10003610:	6a 01                	push   0x1
10003612:	e8 49 fb ff ff       	call   0x10003160
10003617:	c3                   	ret
10003618:	cc                   	int3
10003619:	cc                   	int3
1000361a:	cc                   	int3
1000361b:	cc                   	int3
1000361c:	cc                   	int3
1000361d:	cc                   	int3
1000361e:	cc                   	int3
1000361f:	cc                   	int3
10003620:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
10003623:	8a 40 2c             	mov    al,BYTE PTR [eax+0x2c]
10003626:	c3                   	ret
10003627:	cc                   	int3
10003628:	cc                   	int3
10003629:	cc                   	int3
1000362a:	cc                   	int3
1000362b:	cc                   	int3
1000362c:	cc                   	int3
1000362d:	cc                   	int3
1000362e:	cc                   	int3
1000362f:	cc                   	int3
10003630:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
10003633:	8b 40 30             	mov    eax,DWORD PTR [eax+0x30]
10003636:	c3                   	ret
10003637:	cc                   	int3
10003638:	cc                   	int3
10003639:	cc                   	int3
1000363a:	cc                   	int3
1000363b:	cc                   	int3
1000363c:	cc                   	int3
1000363d:	cc                   	int3
1000363e:	cc                   	int3
1000363f:	cc                   	int3
10003640:	55                   	push   ebp
10003641:	8b ec                	mov    ebp,esp
10003643:	56                   	push   esi
10003644:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10003647:	8b f1                	mov    esi,ecx
10003649:	6a 00                	push   0x0
1000364b:	e8 30 fa ff ff       	call   0x10003080
10003650:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
10003653:	8b ce                	mov    ecx,esi
10003655:	6a 01                	push   0x1
10003657:	e8 24 fa ff ff       	call   0x10003080
1000365c:	8b 4e 04             	mov    ecx,DWORD PTR [esi+0x4]
1000365f:	8a 45 10             	mov    al,BYTE PTR [ebp+0x10]
10003662:	5e                   	pop    esi
10003663:	88 41 2c             	mov    BYTE PTR [ecx+0x2c],al
10003666:	5d                   	pop    ebp
10003667:	c2 0c 00             	ret    0xc
1000366a:	cc                   	int3
1000366b:	cc                   	int3
1000366c:	cc                   	int3
1000366d:	cc                   	int3
1000366e:	cc                   	int3
1000366f:	cc                   	int3
10003670:	55                   	push   ebp
10003671:	8b ec                	mov    ebp,esp
10003673:	8b 49 04             	mov    ecx,DWORD PTR [ecx+0x4]
10003676:	8a 45 08             	mov    al,BYTE PTR [ebp+0x8]
10003679:	88 41 2c             	mov    BYTE PTR [ecx+0x2c],al
1000367c:	5d                   	pop    ebp
1000367d:	c2 04 00             	ret    0x4
10003680:	55                   	push   ebp
10003681:	8b ec                	mov    ebp,esp
10003683:	8b 49 04             	mov    ecx,DWORD PTR [ecx+0x4]
10003686:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10003689:	89 41 30             	mov    DWORD PTR [ecx+0x30],eax
1000368c:	5d                   	pop    ebp
1000368d:	c2 04 00             	ret    0x4
