; PM_auto.dll static disassembly excerpts for typed Qt signal/slot connections
; VA values correspond to the supplied PE32 image with SHA-256 c3cbde9cb83a7c10774a0faa4541622005856d09b79ce94dec3d8bd90d083018
; Generated from GNU objdump -d -Mintel; not source-level C++ decompilation.

; ===== QSlotObject wrapper calling connectImpl at 0x10001550 (0x10001500..0x10001560) =====
10001500:	55                   	push   ebp
10001501:	8b ec                	mov    ebp,esp
10001503:	83 ec 08             	sub    esp,0x8
10001506:	6a 0c                	push   0xc
10001508:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000150f:	e8 67 b7 01 00       	call   0x1001cc7b
10001514:	83 c4 04             	add    esp,0x4
10001517:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
1000151a:	85 c0                	test   eax,eax
1000151c:	74 15                	je     0x10001533
1000151e:	c7 00 01 00 00 00    	mov    DWORD PTR [eax],0x1
10001524:	c7 40 04 50 27 00 10 	mov    DWORD PTR [eax+0x4],0x10002750
1000152b:	8b 4d 1c             	mov    ecx,DWORD PTR [ebp+0x1c]
1000152e:	89 48 08             	mov    DWORD PTR [eax+0x8],ecx
10001531:	eb 02                	jmp    0x10001535
10001533:	33 c0                	xor    eax,eax
10001535:	ff 35 d4 27 02 10    	push   DWORD PTR ds:0x100227d4
1000153b:	6a 00                	push   0x0
1000153d:	ff 75 20             	push   DWORD PTR [ebp+0x20]
10001540:	50                   	push   eax
10001541:	6a 00                	push   0x0
10001543:	ff 75 18             	push   DWORD PTR [ebp+0x18]
10001546:	8d 45 10             	lea    eax,[ebp+0x10]
10001549:	50                   	push   eax
1000154a:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
1000154d:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10001550:	ff 15 68 23 02 10    	call   DWORD PTR ds:0x10022368
10001556:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10001559:	83 c4 24             	add    esp,0x24
1000155c:	8b e5                	mov    esp,ebp
1000155e:	5d                   	pop    ebp
1000155f:	c3                   	ret
10001560:	55                   	push   ebp
; [included 33 instruction/data lines]

; ===== FunctionalDiagram closure connection builders (0x10003ed0..0x10004004) =====
10003ed0:	55                   	push   ebp
10003ed1:	8b ec                	mov    ebp,esp
10003ed3:	83 ec 08             	sub    esp,0x8
10003ed6:	6a 10                	push   0x10
10003ed8:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10003edf:	e8 97 8d 01 00       	call   0x1001cc7b
10003ee4:	83 c4 04             	add    esp,0x4
10003ee7:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
10003eea:	85 c0                	test   eax,eax
10003eec:	74 1b                	je     0x10003f09
10003eee:	c7 00 01 00 00 00    	mov    DWORD PTR [eax],0x1
10003ef4:	c7 40 04 00 ad 00 10 	mov    DWORD PTR [eax+0x4],0x1000ad00
10003efb:	8b 4d 1c             	mov    ecx,DWORD PTR [ebp+0x1c]
10003efe:	89 48 08             	mov    DWORD PTR [eax+0x8],ecx
10003f01:	8b 4d 20             	mov    ecx,DWORD PTR [ebp+0x20]
10003f04:	89 48 0c             	mov    DWORD PTR [eax+0xc],ecx
10003f07:	eb 02                	jmp    0x10003f0b
10003f09:	33 c0                	xor    eax,eax
10003f0b:	68 90 bc 05 10       	push   0x1005bc90
10003f10:	6a 00                	push   0x0
10003f12:	ff 75 24             	push   DWORD PTR [ebp+0x24]
10003f15:	50                   	push   eax
10003f16:	6a 00                	push   0x0
10003f18:	ff 75 18             	push   DWORD PTR [ebp+0x18]
10003f1b:	8d 45 10             	lea    eax,[ebp+0x10]
10003f1e:	50                   	push   eax
10003f1f:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
10003f22:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10003f25:	ff 15 68 23 02 10    	call   DWORD PTR ds:0x10022368
10003f2b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10003f2e:	83 c4 24             	add    esp,0x24
10003f31:	8b e5                	mov    esp,ebp
10003f33:	5d                   	pop    ebp
10003f34:	c3                   	ret
10003f35:	cc                   	int3
10003f36:	cc                   	int3
10003f37:	cc                   	int3
10003f38:	cc                   	int3
10003f39:	cc                   	int3
10003f3a:	cc                   	int3
10003f3b:	cc                   	int3
10003f3c:	cc                   	int3
10003f3d:	cc                   	int3
10003f3e:	cc                   	int3
10003f3f:	cc                   	int3
10003f40:	55                   	push   ebp
10003f41:	8b ec                	mov    ebp,esp
10003f43:	83 ec 08             	sub    esp,0x8
10003f46:	6a 0c                	push   0xc
10003f48:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10003f4f:	e8 27 8d 01 00       	call   0x1001cc7b
10003f54:	83 c4 04             	add    esp,0x4
10003f57:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
10003f5a:	85 c0                	test   eax,eax
10003f5c:	74 15                	je     0x10003f73
10003f5e:	c7 00 01 00 00 00    	mov    DWORD PTR [eax],0x1
10003f64:	c7 40 04 f0 ad 00 10 	mov    DWORD PTR [eax+0x4],0x1000adf0
10003f6b:	8b 4d 1c             	mov    ecx,DWORD PTR [ebp+0x1c]
10003f6e:	89 48 08             	mov    DWORD PTR [eax+0x8],ecx
10003f71:	eb 02                	jmp    0x10003f75
10003f73:	33 c0                	xor    eax,eax
10003f75:	68 90 bc 05 10       	push   0x1005bc90
10003f7a:	6a 00                	push   0x0
10003f7c:	ff 75 20             	push   DWORD PTR [ebp+0x20]
10003f7f:	50                   	push   eax
10003f80:	6a 00                	push   0x0
10003f82:	ff 75 18             	push   DWORD PTR [ebp+0x18]
10003f85:	8d 45 10             	lea    eax,[ebp+0x10]
10003f88:	50                   	push   eax
10003f89:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
10003f8c:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10003f8f:	ff 15 68 23 02 10    	call   DWORD PTR ds:0x10022368
10003f95:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10003f98:	83 c4 24             	add    esp,0x24
10003f9b:	8b e5                	mov    esp,ebp
10003f9d:	5d                   	pop    ebp
10003f9e:	c3                   	ret
10003f9f:	cc                   	int3
10003fa0:	55                   	push   ebp
10003fa1:	8b ec                	mov    ebp,esp
10003fa3:	83 ec 08             	sub    esp,0x8
10003fa6:	6a 10                	push   0x10
10003fa8:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10003faf:	e8 c7 8c 01 00       	call   0x1001cc7b
10003fb4:	83 c4 04             	add    esp,0x4
10003fb7:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
10003fba:	85 c0                	test   eax,eax
10003fbc:	74 1b                	je     0x10003fd9
10003fbe:	c7 00 01 00 00 00    	mov    DWORD PTR [eax],0x1
10003fc4:	c7 40 04 40 ad 00 10 	mov    DWORD PTR [eax+0x4],0x1000ad40
10003fcb:	8b 4d 1c             	mov    ecx,DWORD PTR [ebp+0x1c]
10003fce:	89 48 08             	mov    DWORD PTR [eax+0x8],ecx
10003fd1:	8b 4d 20             	mov    ecx,DWORD PTR [ebp+0x20]
10003fd4:	89 48 0c             	mov    DWORD PTR [eax+0xc],ecx
10003fd7:	eb 02                	jmp    0x10003fdb
10003fd9:	33 c0                	xor    eax,eax
10003fdb:	68 90 bc 05 10       	push   0x1005bc90
10003fe0:	6a 00                	push   0x0
10003fe2:	ff 75 24             	push   DWORD PTR [ebp+0x24]
10003fe5:	50                   	push   eax
10003fe6:	6a 00                	push   0x0
10003fe8:	ff 75 18             	push   DWORD PTR [ebp+0x18]
10003feb:	8d 45 10             	lea    eax,[ebp+0x10]
10003fee:	50                   	push   eax
10003fef:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
10003ff2:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10003ff5:	ff 15 68 23 02 10    	call   DWORD PTR ds:0x10022368
10003ffb:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10003ffe:	83 c4 24             	add    esp,0x24
10004001:	8b e5                	mov    esp,ebp
10004003:	5d                   	pop    ebp
10004004:	c3                   	ret
; [included 112 instruction/data lines]

; ===== typed PMF/closure adapter families and connectImpl IAT callsites (0x100040d0..0x100046ac) =====
100040d0:	55                   	push   ebp
100040d1:	8b ec                	mov    ebp,esp
100040d3:	51                   	push   ecx
100040d4:	56                   	push   esi
100040d5:	8b 75 24             	mov    esi,DWORD PTR [ebp+0x24]
100040d8:	57                   	push   edi
100040d9:	33 ff                	xor    edi,edi
100040db:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
100040e2:	83 fe 02             	cmp    esi,0x2
100040e5:	74 05                	je     0x100040ec
100040e7:	83 fe 03             	cmp    esi,0x3
100040ea:	75 07                	jne    0x100040f3
100040ec:	e8 8f d9 00 00       	call   0x10011a80
100040f1:	8b f8                	mov    edi,eax
100040f3:	6a 10                	push   0x10
100040f5:	e8 81 8b 01 00       	call   0x1001cc7b
100040fa:	83 c4 04             	add    esp,0x4
100040fd:	89 45 24             	mov    DWORD PTR [ebp+0x24],eax
10004100:	85 c0                	test   eax,eax
10004102:	74 1b                	je     0x1000411f
10004104:	8b 4d 1c             	mov    ecx,DWORD PTR [ebp+0x1c]
10004107:	8b 55 20             	mov    edx,DWORD PTR [ebp+0x20]
1000410a:	c7 00 01 00 00 00    	mov    DWORD PTR [eax],0x1
10004110:	c7 40 04 30 ae 00 10 	mov    DWORD PTR [eax+0x4],0x1000ae30
10004117:	89 48 08             	mov    DWORD PTR [eax+0x8],ecx
1000411a:	89 50 0c             	mov    DWORD PTR [eax+0xc],edx
1000411d:	eb 02                	jmp    0x10004121
1000411f:	33 c0                	xor    eax,eax
10004121:	ff 35 64 2e 02 10    	push   DWORD PTR ds:0x10022e64
10004127:	57                   	push   edi
10004128:	56                   	push   esi
10004129:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
1000412c:	50                   	push   eax
1000412d:	8d 45 1c             	lea    eax,[ebp+0x1c]
10004130:	50                   	push   eax
10004131:	ff 75 18             	push   DWORD PTR [ebp+0x18]
10004134:	8d 45 10             	lea    eax,[ebp+0x10]
10004137:	50                   	push   eax
10004138:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
1000413b:	56                   	push   esi
1000413c:	ff 15 68 23 02 10    	call   DWORD PTR ds:0x10022368
10004142:	83 c4 24             	add    esp,0x24
10004145:	8b c6                	mov    eax,esi
10004147:	5f                   	pop    edi
10004148:	5e                   	pop    esi
10004149:	8b e5                	mov    esp,ebp
1000414b:	5d                   	pop    ebp
1000414c:	c3                   	ret
1000414d:	cc                   	int3
1000414e:	cc                   	int3
1000414f:	cc                   	int3
10004150:	55                   	push   ebp
10004151:	8b ec                	mov    ebp,esp
10004153:	51                   	push   ecx
10004154:	56                   	push   esi
10004155:	8b 75 20             	mov    esi,DWORD PTR [ebp+0x20]
10004158:	57                   	push   edi
10004159:	33 ff                	xor    edi,edi
1000415b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10004162:	83 fe 02             	cmp    esi,0x2
10004165:	74 05                	je     0x1000416c
10004167:	83 fe 03             	cmp    esi,0x3
1000416a:	75 07                	jne    0x10004173
1000416c:	e8 0f d9 00 00       	call   0x10011a80
10004171:	8b f8                	mov    edi,eax
10004173:	6a 0c                	push   0xc
10004175:	e8 01 8b 01 00       	call   0x1001cc7b
1000417a:	83 c4 04             	add    esp,0x4
1000417d:	89 45 20             	mov    DWORD PTR [ebp+0x20],eax
10004180:	85 c0                	test   eax,eax
10004182:	74 15                	je     0x10004199
10004184:	c7 00 01 00 00 00    	mov    DWORD PTR [eax],0x1
1000418a:	c7 40 04 e0 aa 00 10 	mov    DWORD PTR [eax+0x4],0x1000aae0
10004191:	8b 4d 1c             	mov    ecx,DWORD PTR [ebp+0x1c]
10004194:	89 48 08             	mov    DWORD PTR [eax+0x8],ecx
10004197:	eb 02                	jmp    0x1000419b
10004199:	33 c0                	xor    eax,eax
1000419b:	ff 35 64 2e 02 10    	push   DWORD PTR ds:0x10022e64
100041a1:	57                   	push   edi
100041a2:	56                   	push   esi
100041a3:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
100041a6:	50                   	push   eax
100041a7:	6a 00                	push   0x0
100041a9:	ff 75 18             	push   DWORD PTR [ebp+0x18]
100041ac:	8d 45 10             	lea    eax,[ebp+0x10]
100041af:	50                   	push   eax
100041b0:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
100041b3:	56                   	push   esi
100041b4:	ff 15 68 23 02 10    	call   DWORD PTR ds:0x10022368
100041ba:	83 c4 24             	add    esp,0x24
100041bd:	8b c6                	mov    eax,esi
100041bf:	5f                   	pop    edi
100041c0:	5e                   	pop    esi
100041c1:	8b e5                	mov    esp,ebp
100041c3:	5d                   	pop    ebp
100041c4:	c3                   	ret
100041c5:	cc                   	int3
100041c6:	cc                   	int3
100041c7:	cc                   	int3
100041c8:	cc                   	int3
100041c9:	cc                   	int3
100041ca:	cc                   	int3
100041cb:	cc                   	int3
100041cc:	cc                   	int3
100041cd:	cc                   	int3
100041ce:	cc                   	int3
100041cf:	cc                   	int3
100041d0:	55                   	push   ebp
100041d1:	8b ec                	mov    ebp,esp
100041d3:	51                   	push   ecx
100041d4:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
100041d7:	6a 01                	push   0x1
100041d9:	ff 75 18             	push   DWORD PTR [ebp+0x18]
100041dc:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
100041e3:	50                   	push   eax
100041e4:	ff 75 14             	push   DWORD PTR [ebp+0x14]
100041e7:	ff 75 10             	push   DWORD PTR [ebp+0x10]
100041ea:	50                   	push   eax
100041eb:	ff 75 08             	push   DWORD PTR [ebp+0x8]
100041ee:	e8 5d ff ff ff       	call   0x10004150
100041f3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
100041f6:	83 c4 1c             	add    esp,0x1c
100041f9:	8b e5                	mov    esp,ebp
100041fb:	5d                   	pop    ebp
100041fc:	c3                   	ret
100041fd:	cc                   	int3
100041fe:	cc                   	int3
100041ff:	cc                   	int3
10004200:	55                   	push   ebp
10004201:	8b ec                	mov    ebp,esp
10004203:	51                   	push   ecx
10004204:	56                   	push   esi
10004205:	8b 75 20             	mov    esi,DWORD PTR [ebp+0x20]
10004208:	57                   	push   edi
10004209:	33 ff                	xor    edi,edi
1000420b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10004212:	83 fe 02             	cmp    esi,0x2
10004215:	74 05                	je     0x1000421c
10004217:	83 fe 03             	cmp    esi,0x3
1000421a:	75 07                	jne    0x10004223
1000421c:	e8 5f d8 00 00       	call   0x10011a80
10004221:	8b f8                	mov    edi,eax
10004223:	6a 0c                	push   0xc
10004225:	e8 51 8a 01 00       	call   0x1001cc7b
1000422a:	83 c4 04             	add    esp,0x4
1000422d:	89 45 20             	mov    DWORD PTR [ebp+0x20],eax
10004230:	85 c0                	test   eax,eax
10004232:	74 15                	je     0x10004249
10004234:	c7 00 01 00 00 00    	mov    DWORD PTR [eax],0x1
1000423a:	c7 40 04 80 ab 00 10 	mov    DWORD PTR [eax+0x4],0x1000ab80
10004241:	8b 4d 1c             	mov    ecx,DWORD PTR [ebp+0x1c]
10004244:	89 48 08             	mov    DWORD PTR [eax+0x8],ecx
10004247:	eb 02                	jmp    0x1000424b
10004249:	33 c0                	xor    eax,eax
1000424b:	ff 35 64 2e 02 10    	push   DWORD PTR ds:0x10022e64
10004251:	57                   	push   edi
10004252:	56                   	push   esi
10004253:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
10004256:	50                   	push   eax
10004257:	6a 00                	push   0x0
10004259:	ff 75 18             	push   DWORD PTR [ebp+0x18]
1000425c:	8d 45 10             	lea    eax,[ebp+0x10]
1000425f:	50                   	push   eax
10004260:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
10004263:	56                   	push   esi
10004264:	ff 15 68 23 02 10    	call   DWORD PTR ds:0x10022368
1000426a:	83 c4 24             	add    esp,0x24
1000426d:	8b c6                	mov    eax,esi
1000426f:	5f                   	pop    edi
10004270:	5e                   	pop    esi
10004271:	8b e5                	mov    esp,ebp
10004273:	5d                   	pop    ebp
10004274:	c3                   	ret
10004275:	cc                   	int3
10004276:	cc                   	int3
10004277:	cc                   	int3
10004278:	cc                   	int3
10004279:	cc                   	int3
1000427a:	cc                   	int3
1000427b:	cc                   	int3
1000427c:	cc                   	int3
1000427d:	cc                   	int3
1000427e:	cc                   	int3
1000427f:	cc                   	int3
10004280:	55                   	push   ebp
10004281:	8b ec                	mov    ebp,esp
10004283:	51                   	push   ecx
10004284:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10004287:	6a 01                	push   0x1
10004289:	ff 75 18             	push   DWORD PTR [ebp+0x18]
1000428c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10004293:	50                   	push   eax
10004294:	ff 75 14             	push   DWORD PTR [ebp+0x14]
10004297:	ff 75 10             	push   DWORD PTR [ebp+0x10]
1000429a:	50                   	push   eax
1000429b:	ff 75 08             	push   DWORD PTR [ebp+0x8]
1000429e:	e8 5d ff ff ff       	call   0x10004200
100042a3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
100042a6:	83 c4 1c             	add    esp,0x1c
100042a9:	8b e5                	mov    esp,ebp
100042ab:	5d                   	pop    ebp
100042ac:	c3                   	ret
100042ad:	cc                   	int3
100042ae:	cc                   	int3
100042af:	cc                   	int3
100042b0:	55                   	push   ebp
100042b1:	8b ec                	mov    ebp,esp
100042b3:	51                   	push   ecx
100042b4:	56                   	push   esi
100042b5:	8b 75 20             	mov    esi,DWORD PTR [ebp+0x20]
100042b8:	57                   	push   edi
100042b9:	33 ff                	xor    edi,edi
100042bb:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
100042c2:	83 fe 02             	cmp    esi,0x2
100042c5:	74 05                	je     0x100042cc
100042c7:	83 fe 03             	cmp    esi,0x3
100042ca:	75 07                	jne    0x100042d3
100042cc:	e8 af d7 00 00       	call   0x10011a80
100042d1:	8b f8                	mov    edi,eax
100042d3:	6a 0c                	push   0xc
100042d5:	e8 a1 89 01 00       	call   0x1001cc7b
100042da:	83 c4 04             	add    esp,0x4
100042dd:	89 45 20             	mov    DWORD PTR [ebp+0x20],eax
100042e0:	85 c0                	test   eax,eax
100042e2:	74 15                	je     0x100042f9
100042e4:	c7 00 01 00 00 00    	mov    DWORD PTR [eax],0x1
100042ea:	c7 40 04 20 ac 00 10 	mov    DWORD PTR [eax+0x4],0x1000ac20
100042f1:	8b 4d 1c             	mov    ecx,DWORD PTR [ebp+0x1c]
100042f4:	89 48 08             	mov    DWORD PTR [eax+0x8],ecx
100042f7:	eb 02                	jmp    0x100042fb
100042f9:	33 c0                	xor    eax,eax
100042fb:	ff 35 64 2e 02 10    	push   DWORD PTR ds:0x10022e64
10004301:	57                   	push   edi
10004302:	56                   	push   esi
10004303:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
10004306:	50                   	push   eax
10004307:	6a 00                	push   0x0
10004309:	ff 75 18             	push   DWORD PTR [ebp+0x18]
1000430c:	8d 45 10             	lea    eax,[ebp+0x10]
1000430f:	50                   	push   eax
10004310:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
10004313:	56                   	push   esi
10004314:	ff 15 68 23 02 10    	call   DWORD PTR ds:0x10022368
1000431a:	83 c4 24             	add    esp,0x24
1000431d:	8b c6                	mov    eax,esi
1000431f:	5f                   	pop    edi
10004320:	5e                   	pop    esi
10004321:	8b e5                	mov    esp,ebp
10004323:	5d                   	pop    ebp
10004324:	c3                   	ret
10004325:	cc                   	int3
10004326:	cc                   	int3
10004327:	cc                   	int3
10004328:	cc                   	int3
10004329:	cc                   	int3
1000432a:	cc                   	int3
1000432b:	cc                   	int3
1000432c:	cc                   	int3
1000432d:	cc                   	int3
1000432e:	cc                   	int3
1000432f:	cc                   	int3
10004330:	55                   	push   ebp
10004331:	8b ec                	mov    ebp,esp
10004333:	51                   	push   ecx
10004334:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10004337:	6a 01                	push   0x1
10004339:	ff 75 18             	push   DWORD PTR [ebp+0x18]
1000433c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10004343:	50                   	push   eax
10004344:	ff 75 14             	push   DWORD PTR [ebp+0x14]
10004347:	ff 75 10             	push   DWORD PTR [ebp+0x10]
1000434a:	50                   	push   eax
1000434b:	ff 75 08             	push   DWORD PTR [ebp+0x8]
1000434e:	e8 5d ff ff ff       	call   0x100042b0
10004353:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10004356:	83 c4 1c             	add    esp,0x1c
10004359:	8b e5                	mov    esp,ebp
1000435b:	5d                   	pop    ebp
1000435c:	c3                   	ret
1000435d:	cc                   	int3
1000435e:	cc                   	int3
1000435f:	cc                   	int3
10004360:	55                   	push   ebp
10004361:	8b ec                	mov    ebp,esp
10004363:	51                   	push   ecx
10004364:	56                   	push   esi
10004365:	8b 75 20             	mov    esi,DWORD PTR [ebp+0x20]
10004368:	57                   	push   edi
10004369:	33 ff                	xor    edi,edi
1000436b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10004372:	83 fe 02             	cmp    esi,0x2
10004375:	74 05                	je     0x1000437c
10004377:	83 fe 03             	cmp    esi,0x3
1000437a:	75 07                	jne    0x10004383
1000437c:	e8 ff d6 00 00       	call   0x10011a80
10004381:	8b f8                	mov    edi,eax
10004383:	6a 0c                	push   0xc
10004385:	e8 f1 88 01 00       	call   0x1001cc7b
1000438a:	83 c4 04             	add    esp,0x4
1000438d:	89 45 20             	mov    DWORD PTR [ebp+0x20],eax
10004390:	85 c0                	test   eax,eax
10004392:	74 15                	je     0x100043a9
10004394:	c7 00 01 00 00 00    	mov    DWORD PTR [eax],0x1
1000439a:	c7 40 04 c0 ad 00 10 	mov    DWORD PTR [eax+0x4],0x1000adc0
100043a1:	8b 4d 1c             	mov    ecx,DWORD PTR [ebp+0x1c]
100043a4:	89 48 08             	mov    DWORD PTR [eax+0x8],ecx
100043a7:	eb 02                	jmp    0x100043ab
100043a9:	33 c0                	xor    eax,eax
100043ab:	ff 35 64 2e 02 10    	push   DWORD PTR ds:0x10022e64
100043b1:	57                   	push   edi
100043b2:	56                   	push   esi
100043b3:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
100043b6:	50                   	push   eax
100043b7:	6a 00                	push   0x0
100043b9:	ff 75 18             	push   DWORD PTR [ebp+0x18]
100043bc:	8d 45 10             	lea    eax,[ebp+0x10]
100043bf:	50                   	push   eax
100043c0:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
100043c3:	56                   	push   esi
100043c4:	ff 15 68 23 02 10    	call   DWORD PTR ds:0x10022368
100043ca:	83 c4 24             	add    esp,0x24
100043cd:	8b c6                	mov    eax,esi
100043cf:	5f                   	pop    edi
100043d0:	5e                   	pop    esi
100043d1:	8b e5                	mov    esp,ebp
100043d3:	5d                   	pop    ebp
100043d4:	c3                   	ret
100043d5:	cc                   	int3
100043d6:	cc                   	int3
100043d7:	cc                   	int3
100043d8:	cc                   	int3
100043d9:	cc                   	int3
100043da:	cc                   	int3
100043db:	cc                   	int3
100043dc:	cc                   	int3
100043dd:	cc                   	int3
100043de:	cc                   	int3
100043df:	cc                   	int3
100043e0:	55                   	push   ebp
100043e1:	8b ec                	mov    ebp,esp
100043e3:	51                   	push   ecx
100043e4:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
100043e7:	6a 01                	push   0x1
100043e9:	ff 75 18             	push   DWORD PTR [ebp+0x18]
100043ec:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
100043f3:	50                   	push   eax
100043f4:	ff 75 14             	push   DWORD PTR [ebp+0x14]
100043f7:	ff 75 10             	push   DWORD PTR [ebp+0x10]
100043fa:	50                   	push   eax
100043fb:	ff 75 08             	push   DWORD PTR [ebp+0x8]
100043fe:	e8 5d ff ff ff       	call   0x10004360
10004403:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10004406:	83 c4 1c             	add    esp,0x1c
10004409:	8b e5                	mov    esp,ebp
1000440b:	5d                   	pop    ebp
1000440c:	c3                   	ret
1000440d:	cc                   	int3
1000440e:	cc                   	int3
1000440f:	cc                   	int3
10004410:	55                   	push   ebp
10004411:	8b ec                	mov    ebp,esp
10004413:	51                   	push   ecx
10004414:	56                   	push   esi
10004415:	8b 75 1c             	mov    esi,DWORD PTR [ebp+0x1c]
10004418:	57                   	push   edi
10004419:	33 ff                	xor    edi,edi
1000441b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10004422:	83 fe 02             	cmp    esi,0x2
10004425:	74 05                	je     0x1000442c
10004427:	83 fe 03             	cmp    esi,0x3
1000442a:	75 07                	jne    0x10004433
1000442c:	e8 3f d5 00 00       	call   0x10011970
10004431:	8b f8                	mov    edi,eax
10004433:	6a 0c                	push   0xc
10004435:	e8 41 88 01 00       	call   0x1001cc7b
1000443a:	83 c4 04             	add    esp,0x4
1000443d:	89 45 1c             	mov    DWORD PTR [ebp+0x1c],eax
10004440:	85 c0                	test   eax,eax
10004442:	74 15                	je     0x10004459
10004444:	c7 00 01 00 00 00    	mov    DWORD PTR [eax],0x1
1000444a:	c7 40 04 40 ab 00 10 	mov    DWORD PTR [eax+0x4],0x1000ab40
10004451:	8b 4d 18             	mov    ecx,DWORD PTR [ebp+0x18]
10004454:	89 48 08             	mov    DWORD PTR [eax+0x8],ecx
10004457:	eb 02                	jmp    0x1000445b
10004459:	33 c0                	xor    eax,eax
1000445b:	ff 35 98 22 02 10    	push   DWORD PTR ds:0x10022298
10004461:	57                   	push   edi
10004462:	56                   	push   esi
10004463:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
10004466:	50                   	push   eax
10004467:	6a 00                	push   0x0
10004469:	ff 75 14             	push   DWORD PTR [ebp+0x14]
1000446c:	8d 45 10             	lea    eax,[ebp+0x10]
1000446f:	50                   	push   eax
10004470:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
10004473:	56                   	push   esi
10004474:	ff 15 68 23 02 10    	call   DWORD PTR ds:0x10022368
1000447a:	83 c4 24             	add    esp,0x24
1000447d:	8b c6                	mov    eax,esi
1000447f:	5f                   	pop    edi
10004480:	5e                   	pop    esi
10004481:	8b e5                	mov    esp,ebp
10004483:	5d                   	pop    ebp
10004484:	c3                   	ret
10004485:	cc                   	int3
10004486:	cc                   	int3
10004487:	cc                   	int3
10004488:	cc                   	int3
10004489:	cc                   	int3
1000448a:	cc                   	int3
1000448b:	cc                   	int3
1000448c:	cc                   	int3
1000448d:	cc                   	int3
1000448e:	cc                   	int3
1000448f:	cc                   	int3
10004490:	55                   	push   ebp
10004491:	8b ec                	mov    ebp,esp
10004493:	51                   	push   ecx
10004494:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10004497:	6a 01                	push   0x1
10004499:	ff 75 14             	push   DWORD PTR [ebp+0x14]
1000449c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
100044a3:	50                   	push   eax
100044a4:	ff 75 10             	push   DWORD PTR [ebp+0x10]
100044a7:	50                   	push   eax
100044a8:	ff 75 08             	push   DWORD PTR [ebp+0x8]
100044ab:	e8 60 ff ff ff       	call   0x10004410
100044b0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
100044b3:	83 c4 18             	add    esp,0x18
100044b6:	8b e5                	mov    esp,ebp
100044b8:	5d                   	pop    ebp
100044b9:	c3                   	ret
100044ba:	cc                   	int3
100044bb:	cc                   	int3
100044bc:	cc                   	int3
100044bd:	cc                   	int3
100044be:	cc                   	int3
100044bf:	cc                   	int3
100044c0:	55                   	push   ebp
100044c1:	8b ec                	mov    ebp,esp
100044c3:	51                   	push   ecx
100044c4:	56                   	push   esi
100044c5:	8b 75 20             	mov    esi,DWORD PTR [ebp+0x20]
100044c8:	57                   	push   edi
100044c9:	33 ff                	xor    edi,edi
100044cb:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
100044d2:	83 fe 02             	cmp    esi,0x2
100044d5:	74 05                	je     0x100044dc
100044d7:	83 fe 03             	cmp    esi,0x3
100044da:	75 07                	jne    0x100044e3
100044dc:	e8 3f d5 00 00       	call   0x10011a20
100044e1:	8b f8                	mov    edi,eax
100044e3:	6a 0c                	push   0xc
100044e5:	e8 91 87 01 00       	call   0x1001cc7b
100044ea:	83 c4 04             	add    esp,0x4
100044ed:	89 45 20             	mov    DWORD PTR [ebp+0x20],eax
100044f0:	85 c0                	test   eax,eax
100044f2:	74 15                	je     0x10004509
100044f4:	c7 00 01 00 00 00    	mov    DWORD PTR [eax],0x1
100044fa:	c7 40 04 50 ac 00 10 	mov    DWORD PTR [eax+0x4],0x1000ac50
10004501:	8b 4d 1c             	mov    ecx,DWORD PTR [ebp+0x1c]
10004504:	89 48 08             	mov    DWORD PTR [eax+0x8],ecx
10004507:	eb 02                	jmp    0x1000450b
10004509:	33 c0                	xor    eax,eax
1000450b:	ff 35 60 2e 02 10    	push   DWORD PTR ds:0x10022e60
10004511:	57                   	push   edi
10004512:	56                   	push   esi
10004513:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
10004516:	50                   	push   eax
10004517:	6a 00                	push   0x0
10004519:	ff 75 18             	push   DWORD PTR [ebp+0x18]
1000451c:	8d 45 10             	lea    eax,[ebp+0x10]
1000451f:	50                   	push   eax
10004520:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
10004523:	56                   	push   esi
10004524:	ff 15 68 23 02 10    	call   DWORD PTR ds:0x10022368
1000452a:	83 c4 24             	add    esp,0x24
1000452d:	8b c6                	mov    eax,esi
1000452f:	5f                   	pop    edi
10004530:	5e                   	pop    esi
10004531:	8b e5                	mov    esp,ebp
10004533:	5d                   	pop    ebp
10004534:	c3                   	ret
10004535:	cc                   	int3
10004536:	cc                   	int3
10004537:	cc                   	int3
10004538:	cc                   	int3
10004539:	cc                   	int3
1000453a:	cc                   	int3
1000453b:	cc                   	int3
1000453c:	cc                   	int3
1000453d:	cc                   	int3
1000453e:	cc                   	int3
1000453f:	cc                   	int3
10004540:	55                   	push   ebp
10004541:	8b ec                	mov    ebp,esp
10004543:	51                   	push   ecx
10004544:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10004547:	6a 01                	push   0x1
10004549:	ff 75 18             	push   DWORD PTR [ebp+0x18]
1000454c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10004553:	50                   	push   eax
10004554:	ff 75 14             	push   DWORD PTR [ebp+0x14]
10004557:	ff 75 10             	push   DWORD PTR [ebp+0x10]
1000455a:	50                   	push   eax
1000455b:	ff 75 08             	push   DWORD PTR [ebp+0x8]
1000455e:	e8 5d ff ff ff       	call   0x100044c0
10004563:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10004566:	83 c4 1c             	add    esp,0x1c
10004569:	8b e5                	mov    esp,ebp
1000456b:	5d                   	pop    ebp
1000456c:	c3                   	ret
1000456d:	cc                   	int3
1000456e:	cc                   	int3
1000456f:	cc                   	int3
10004570:	55                   	push   ebp
10004571:	8b ec                	mov    ebp,esp
10004573:	51                   	push   ecx
10004574:	56                   	push   esi
10004575:	8b 75 20             	mov    esi,DWORD PTR [ebp+0x20]
10004578:	57                   	push   edi
10004579:	33 ff                	xor    edi,edi
1000457b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10004582:	83 fe 02             	cmp    esi,0x2
10004585:	74 05                	je     0x1000458c
10004587:	83 fe 03             	cmp    esi,0x3
1000458a:	75 07                	jne    0x10004593
1000458c:	e8 8f d4 00 00       	call   0x10011a20
10004591:	8b f8                	mov    edi,eax
10004593:	6a 0c                	push   0xc
10004595:	e8 e1 86 01 00       	call   0x1001cc7b
1000459a:	83 c4 04             	add    esp,0x4
1000459d:	89 45 20             	mov    DWORD PTR [ebp+0x20],eax
100045a0:	85 c0                	test   eax,eax
100045a2:	74 15                	je     0x100045b9
100045a4:	c7 00 01 00 00 00    	mov    DWORD PTR [eax],0x1
100045aa:	c7 40 04 80 ad 00 10 	mov    DWORD PTR [eax+0x4],0x1000ad80
100045b1:	8b 4d 1c             	mov    ecx,DWORD PTR [ebp+0x1c]
100045b4:	89 48 08             	mov    DWORD PTR [eax+0x8],ecx
100045b7:	eb 02                	jmp    0x100045bb
100045b9:	33 c0                	xor    eax,eax
100045bb:	ff 35 60 2e 02 10    	push   DWORD PTR ds:0x10022e60
100045c1:	57                   	push   edi
100045c2:	56                   	push   esi
100045c3:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
100045c6:	50                   	push   eax
100045c7:	6a 00                	push   0x0
100045c9:	ff 75 18             	push   DWORD PTR [ebp+0x18]
100045cc:	8d 45 10             	lea    eax,[ebp+0x10]
100045cf:	50                   	push   eax
100045d0:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
100045d3:	56                   	push   esi
100045d4:	ff 15 68 23 02 10    	call   DWORD PTR ds:0x10022368
100045da:	83 c4 24             	add    esp,0x24
100045dd:	8b c6                	mov    eax,esi
100045df:	5f                   	pop    edi
100045e0:	5e                   	pop    esi
100045e1:	8b e5                	mov    esp,ebp
100045e3:	5d                   	pop    ebp
100045e4:	c3                   	ret
100045e5:	cc                   	int3
100045e6:	cc                   	int3
100045e7:	cc                   	int3
100045e8:	cc                   	int3
100045e9:	cc                   	int3
100045ea:	cc                   	int3
100045eb:	cc                   	int3
100045ec:	cc                   	int3
100045ed:	cc                   	int3
100045ee:	cc                   	int3
100045ef:	cc                   	int3
100045f0:	55                   	push   ebp
100045f1:	8b ec                	mov    ebp,esp
100045f3:	51                   	push   ecx
100045f4:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
100045f7:	6a 01                	push   0x1
100045f9:	ff 75 18             	push   DWORD PTR [ebp+0x18]
100045fc:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10004603:	50                   	push   eax
10004604:	ff 75 14             	push   DWORD PTR [ebp+0x14]
10004607:	ff 75 10             	push   DWORD PTR [ebp+0x10]
1000460a:	50                   	push   eax
1000460b:	ff 75 08             	push   DWORD PTR [ebp+0x8]
1000460e:	e8 5d ff ff ff       	call   0x10004570
10004613:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10004616:	83 c4 1c             	add    esp,0x1c
10004619:	8b e5                	mov    esp,ebp
1000461b:	5d                   	pop    ebp
1000461c:	c3                   	ret
1000461d:	cc                   	int3
1000461e:	cc                   	int3
1000461f:	cc                   	int3
10004620:	55                   	push   ebp
10004621:	8b ec                	mov    ebp,esp
10004623:	83 ec 08             	sub    esp,0x8
10004626:	6a 0c                	push   0xc
10004628:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000462f:	e8 47 86 01 00       	call   0x1001cc7b
10004634:	83 c4 04             	add    esp,0x4
10004637:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
1000463a:	85 c0                	test   eax,eax
1000463c:	74 15                	je     0x10004653
1000463e:	c7 00 01 00 00 00    	mov    DWORD PTR [eax],0x1
10004644:	c7 40 04 10 ab 00 10 	mov    DWORD PTR [eax+0x4],0x1000ab10
1000464b:	8b 4d 1c             	mov    ecx,DWORD PTR [ebp+0x1c]
1000464e:	89 48 08             	mov    DWORD PTR [eax+0x8],ecx
10004651:	eb 02                	jmp    0x10004655
10004653:	33 c0                	xor    eax,eax
10004655:	ff 35 d4 27 02 10    	push   DWORD PTR ds:0x100227d4
1000465b:	6a 00                	push   0x0
1000465d:	ff 75 20             	push   DWORD PTR [ebp+0x20]
10004660:	50                   	push   eax
10004661:	6a 00                	push   0x0
10004663:	ff 75 18             	push   DWORD PTR [ebp+0x18]
10004666:	8d 45 10             	lea    eax,[ebp+0x10]
10004669:	50                   	push   eax
1000466a:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
1000466d:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10004670:	ff 15 68 23 02 10    	call   DWORD PTR ds:0x10022368
10004676:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10004679:	83 c4 24             	add    esp,0x24
1000467c:	8b e5                	mov    esp,ebp
1000467e:	5d                   	pop    ebp
1000467f:	c3                   	ret
10004680:	55                   	push   ebp
10004681:	8b ec                	mov    ebp,esp
10004683:	51                   	push   ecx
10004684:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10004687:	6a 01                	push   0x1
10004689:	ff 75 18             	push   DWORD PTR [ebp+0x18]
1000468c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10004693:	50                   	push   eax
10004694:	ff 75 14             	push   DWORD PTR [ebp+0x14]
10004697:	ff 75 10             	push   DWORD PTR [ebp+0x10]
1000469a:	50                   	push   eax
1000469b:	ff 75 08             	push   DWORD PTR [ebp+0x8]
1000469e:	e8 7d ff ff ff       	call   0x10004620
100046a3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
100046a6:	83 c4 1c             	add    esp,0x1c
100046a9:	8b e5                	mov    esp,ebp
100046ab:	5d                   	pop    ebp
100046ac:	c3                   	ret
; [included 642 instruction/data lines]

; ===== DecompositionWidget constructor: connectSlotsByName and sender/slot registration (0x10004970..0x10004f95) =====
10004970:	55                   	push   ebp
10004971:	8b ec                	mov    ebp,esp
10004973:	6a ff                	push   0xffffffff
10004975:	68 e6 e8 01 10       	push   0x1001e8e6
1000497a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10004980:	50                   	push   eax
10004981:	83 ec 48             	sub    esp,0x48
10004984:	a1 cc f0 06 10       	mov    eax,ds:0x1006f0cc
10004989:	33 c5                	xor    eax,ebp
1000498b:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
1000498e:	53                   	push   ebx
1000498f:	56                   	push   esi
10004990:	57                   	push   edi
10004991:	50                   	push   eax
10004992:	8d 45 f4             	lea    eax,[ebp-0xc]
10004995:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000499b:	8b f9                	mov    edi,ecx
1000499d:	89 7d bc             	mov    DWORD PTR [ebp-0x44],edi
100049a0:	89 7d c4             	mov    DWORD PTR [ebp-0x3c],edi
100049a3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
100049a6:	50                   	push   eax
100049a7:	89 7d ac             	mov    DWORD PTR [ebp-0x54],edi
100049aa:	e8 41 e2 ff ff       	call   0x10002bf0
100049af:	8d 4f 30             	lea    ecx,[edi+0x30]
100049b2:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
100049b9:	c7 07 48 ab 05 10    	mov    DWORD PTR [edi],0x1005ab48
100049bf:	c7 47 08 24 ac 05 10 	mov    DWORD PTR [edi+0x8],0x1005ac24
100049c6:	c7 47 2c 00 00 00 00 	mov    DWORD PTR [edi+0x2c],0x0
100049cd:	ff 15 3c 24 02 10    	call   DWORD PTR ds:0x1002243c
100049d3:	ff 15 6c 24 02 10    	call   DWORD PTR ds:0x1002246c
100049d9:	89 47 3c             	mov    DWORD PTR [edi+0x3c],eax
100049dc:	8b 35 04 26 02 10    	mov    esi,DWORD PTR ds:0x10022604
100049e2:	8d 9f 20 01 00 00    	lea    ebx,[edi+0x120]
100049e8:	6a 00                	push   0x0
100049ea:	8b cb                	mov    ecx,ebx
100049ec:	c6 45 fc 02          	mov    BYTE PTR [ebp-0x4],0x2
100049f0:	c7 47 40 00 00 00 00 	mov    DWORD PTR [edi+0x40],0x0
100049f7:	ff d6                	call   esi
100049f9:	8d 8f 28 01 00 00    	lea    ecx,[edi+0x128]
100049ff:	c6 45 fc 03          	mov    BYTE PTR [ebp-0x4],0x3
10004a03:	6a 00                	push   0x0
10004a05:	ff d6                	call   esi
10004a07:	81 c7 30 01 00 00    	add    edi,0x130
10004a0d:	c6 45 fc 04          	mov    BYTE PTR [ebp-0x4],0x4
10004a11:	6a 00                	push   0x0
10004a13:	8b cf                	mov    ecx,edi
10004a15:	89 7d c4             	mov    DWORD PTR [ebp-0x3c],edi
10004a18:	ff 15 50 22 02 10    	call   DWORD PTR ds:0x10022250
10004a1e:	c7 07 70 aa 05 10    	mov    DWORD PTR [edi],0x1005aa70
10004a24:	8b 7d bc             	mov    edi,DWORD PTR [ebp-0x44]
10004a27:	81 c7 38 01 00 00    	add    edi,0x138
10004a2d:	c6 45 fc 05          	mov    BYTE PTR [ebp-0x4],0x5
10004a31:	6a 00                	push   0x0
10004a33:	8b cf                	mov    ecx,edi
10004a35:	ff d6                	call   esi
10004a37:	8b 4d bc             	mov    ecx,DWORD PTR [ebp-0x44]
10004a3a:	a1 30 23 02 10       	mov    eax,ds:0x10022330
10004a3f:	89 81 40 01 00 00    	mov    DWORD PTR [ecx+0x140],eax
10004a45:	a1 30 23 02 10       	mov    eax,ds:0x10022330
10004a4a:	89 81 44 01 00 00    	mov    DWORD PTR [ecx+0x144],eax
10004a50:	8d 89 5c 01 00 00    	lea    ecx,[ecx+0x15c]
10004a56:	c6 45 fc 08          	mov    BYTE PTR [ebp-0x4],0x8
10004a5a:	6a 00                	push   0x0
10004a5c:	ff d6                	call   esi
10004a5e:	8b 4d bc             	mov    ecx,DWORD PTR [ebp-0x44]
10004a61:	6a 00                	push   0x0
10004a63:	c6 45 fc 09          	mov    BYTE PTR [ebp-0x4],0x9
10004a67:	8d 89 64 01 00 00    	lea    ecx,[ecx+0x164]
10004a6d:	ff d6                	call   esi
10004a6f:	8b 75 bc             	mov    esi,DWORD PTR [ebp-0x44]
10004a72:	56                   	push   esi
10004a73:	c6 45 fc 0a          	mov    BYTE PTR [ebp-0x4],0xa
10004a77:	8d 4e 44             	lea    ecx,[esi+0x44]
10004a7a:	e8 31 9c 00 00       	call   0x1000e6b0
10004a7f:	8b 8e d8 00 00 00    	mov    ecx,DWORD PTR [esi+0xd8]
10004a85:	6a 00                	push   0x0
10004a87:	c7 46 38 00 00 00 00 	mov    DWORD PTR [esi+0x38],0x0
10004a8e:	8b 35 d4 29 02 10    	mov    esi,DWORD PTR ds:0x100229d4
10004a94:	6a 00                	push   0x0
10004a96:	ff d6                	call   esi
10004a98:	8b 4d bc             	mov    ecx,DWORD PTR [ebp-0x44]
10004a9b:	6a 01                	push   0x1
10004a9d:	6a 01                	push   0x1
10004a9f:	8b 89 d8 00 00 00    	mov    ecx,DWORD PTR [ecx+0xd8]
10004aa5:	ff d6                	call   esi
10004aa7:	6a 00                	push   0x0
10004aa9:	68 2c 01 00 00       	push   0x12c
10004aae:	8d 4d c0             	lea    ecx,[ebp-0x40]
10004ab1:	ff 15 e8 23 02 10    	call   DWORD PTR ds:0x100223e8
10004ab7:	50                   	push   eax
10004ab8:	8b 45 bc             	mov    eax,DWORD PTR [ebp-0x44]
10004abb:	8b 88 ec 00 00 00    	mov    ecx,DWORD PTR [eax+0xec]
10004ac1:	ff 15 6c 28 02 10    	call   DWORD PTR ds:0x1002286c
10004ac7:	a1 34 23 02 10       	mov    eax,ds:0x10022334
10004acc:	89 45 b8             	mov    DWORD PTR [ebp-0x48],eax
10004acf:	8d 45 b0             	lea    eax,[ebp-0x50]
10004ad2:	c6 45 fc 0b          	mov    BYTE PTR [ebp-0x4],0xb
10004ad6:	50                   	push   eax
10004ad7:	8d 4d b8             	lea    ecx,[ebp-0x48]
10004ada:	c7 45 c4 01 00 00 00 	mov    DWORD PTR [ebp-0x3c],0x1
10004ae1:	c7 45 b0 fa 00 00 00 	mov    DWORD PTR [ebp-0x50],0xfa
10004ae8:	e8 c3 4a 00 00       	call   0x100095b0
10004aed:	8d 45 c4             	lea    eax,[ebp-0x3c]
10004af0:	50                   	push   eax
10004af1:	8d 4d b8             	lea    ecx,[ebp-0x48]
10004af4:	e8 b7 4a 00 00       	call   0x100095b0
10004af9:	8d 45 b8             	lea    eax,[ebp-0x48]
10004afc:	50                   	push   eax
10004afd:	8b 45 bc             	mov    eax,DWORD PTR [ebp-0x44]
10004b00:	8b 88 d8 00 00 00    	mov    ecx,DWORD PTR [eax+0xd8]
10004b06:	ff 15 cc 29 02 10    	call   DWORD PTR ds:0x100229cc
10004b0c:	8b 45 bc             	mov    eax,DWORD PTR [ebp-0x44]
10004b0f:	53                   	push   ebx
10004b10:	8b 88 ec 00 00 00    	mov    ecx,DWORD PTR [eax+0xec]
10004b16:	8b 01                	mov    eax,DWORD PTR [ecx]
10004b18:	ff 90 c4 00 00 00    	call   DWORD PTR [eax+0xc4]
10004b1e:	8b 45 bc             	mov    eax,DWORD PTR [ebp-0x44]
10004b21:	6a 01                	push   0x1
10004b23:	6a 00                	push   0x0
10004b25:	8b 88 d4 00 00 00    	mov    ecx,DWORD PTR [eax+0xd4]
10004b2b:	ff d6                	call   esi
10004b2d:	8b 45 bc             	mov    eax,DWORD PTR [ebp-0x44]
10004b30:	6a 00                	push   0x0
10004b32:	6a 01                	push   0x1
10004b34:	8b 88 d4 00 00 00    	mov    ecx,DWORD PTR [eax+0xd4]
10004b3a:	ff d6                	call   esi
10004b3c:	6a 00                	push   0x0
10004b3e:	8b cb                	mov    ecx,ebx
10004b40:	ff 15 f8 25 02 10    	call   DWORD PTR ds:0x100225f8
10004b46:	6a 01                	push   0x1
10004b48:	8b cb                	mov    ecx,ebx
10004b4a:	ff 15 a8 24 02 10    	call   DWORD PTR ds:0x100224a8
10004b50:	8b 5d bc             	mov    ebx,DWORD PTR [ebp-0x44]
10004b53:	6a 03                	push   0x3
10004b55:	6a 00                	push   0x0
10004b57:	8b 8b ec 00 00 00    	mov    ecx,DWORD PTR [ebx+0xec]
10004b5d:	ff 15 f4 29 02 10    	call   DWORD PTR ds:0x100229f4
10004b63:	8b c8                	mov    ecx,eax
10004b65:	ff 15 7c 29 02 10    	call   DWORD PTR ds:0x1002297c
10004b6b:	8b 8b 98 00 00 00    	mov    ecx,DWORD PTR [ebx+0x98]
10004b71:	57                   	push   edi
10004b72:	ff 15 f4 28 02 10    	call   DWORD PTR ds:0x100228f4
10004b78:	8b 83 30 01 00 00    	mov    eax,DWORD PTR [ebx+0x130]
10004b7e:	8d b3 30 01 00 00    	lea    esi,[ebx+0x130]
10004b84:	8d 8b 28 01 00 00    	lea    ecx,[ebx+0x128]
10004b8a:	51                   	push   ecx
10004b8b:	8b ce                	mov    ecx,esi
10004b8d:	ff 90 b4 00 00 00    	call   DWORD PTR [eax+0xb4]
10004b93:	8b 8b f8 00 00 00    	mov    ecx,DWORD PTR [ebx+0xf8]
10004b99:	56                   	push   esi
10004b9a:	8b 01                	mov    eax,DWORD PTR [ecx]
10004b9c:	ff 90 c4 00 00 00    	call   DWORD PTR [eax+0xc4]
10004ba2:	8b 8b 00 01 00 00    	mov    ecx,DWORD PTR [ebx+0x100]
10004ba8:	ff 15 24 28 02 10    	call   DWORD PTR ds:0x10022824
10004bae:	8b 35 f8 23 02 10    	mov    esi,DWORD PTR ds:0x100223f8
10004bb4:	8d 45 c4             	lea    eax,[ebp-0x3c]
10004bb7:	6a 00                	push   0x0
10004bb9:	68 e8 ac 05 10       	push   0x1005ace8
10004bbe:	53                   	push   ebx
10004bbf:	68 00 ad 05 10       	push   0x1005ad00
10004bc4:	ff b3 fc 00 00 00    	push   DWORD PTR [ebx+0xfc]
10004bca:	50                   	push   eax
10004bcb:	ff d6                	call   esi
10004bcd:	8b 3d ac 23 02 10    	mov    edi,DWORD PTR ds:0x100223ac
10004bd3:	8d 4d c4             	lea    ecx,[ebp-0x3c]
10004bd6:	83 c4 18             	add    esp,0x18
10004bd9:	ff d7                	call   edi
10004bdb:	6a 00                	push   0x0
10004bdd:	68 18 ad 05 10       	push   0x1005ad18
10004be2:	53                   	push   ebx
10004be3:	68 44 ad 05 10       	push   0x1005ad44
10004be8:	ff b3 ec 00 00 00    	push   DWORD PTR [ebx+0xec]
10004bee:	8d 45 c4             	lea    eax,[ebp-0x3c]
10004bf1:	50                   	push   eax
10004bf2:	ff d6                	call   esi
10004bf4:	83 c4 18             	add    esp,0x18
10004bf7:	8d 4d c4             	lea    ecx,[ebp-0x3c]
10004bfa:	ff d7                	call   edi
10004bfc:	6a 00                	push   0x0
10004bfe:	68 68 ad 05 10       	push   0x1005ad68
10004c03:	53                   	push   ebx
10004c04:	68 44 ad 05 10       	push   0x1005ad44
10004c09:	ff b3 f8 00 00 00    	push   DWORD PTR [ebx+0xf8]
10004c0f:	8d 45 c4             	lea    eax,[ebp-0x3c]
10004c12:	50                   	push   eax
10004c13:	ff d6                	call   esi
10004c15:	83 c4 18             	add    esp,0x18
10004c18:	8d 4d c4             	lea    ecx,[ebp-0x3c]
10004c1b:	ff d7                	call   edi
10004c1d:	8b 35 a8 29 02 10    	mov    esi,DWORD PTR ds:0x100229a8
10004c23:	8d 45 c4             	lea    eax,[ebp-0x3c]
10004c26:	6a 00                	push   0x0
10004c28:	6a 00                	push   0x0
10004c2a:	68 70 c8 00 10       	push   0x1000c870
10004c2f:	53                   	push   ebx
10004c30:	6a 00                	push   0x0
10004c32:	56                   	push   esi
10004c33:	ff 73 7c             	push   DWORD PTR [ebx+0x7c]
10004c36:	50                   	push   eax
10004c37:	e8 94 f4 ff ff       	call   0x100040d0
10004c3c:	83 c4 20             	add    esp,0x20
10004c3f:	8d 4d c4             	lea    ecx,[ebp-0x3c]
10004c42:	ff d7                	call   edi
10004c44:	6a 00                	push   0x0
10004c46:	6a 00                	push   0x0
10004c48:	68 60 bb 00 10       	push   0x1000bb60
10004c4d:	53                   	push   ebx
10004c4e:	6a 00                	push   0x0
10004c50:	56                   	push   esi
10004c51:	ff 73 6c             	push   DWORD PTR [ebx+0x6c]
10004c54:	8d 45 c4             	lea    eax,[ebp-0x3c]
10004c57:	50                   	push   eax
10004c58:	e8 73 f4 ff ff       	call   0x100040d0
10004c5d:	83 c4 20             	add    esp,0x20
10004c60:	8d 4d c4             	lea    ecx,[ebp-0x3c]
10004c63:	ff d7                	call   edi
10004c65:	6a 00                	push   0x0
10004c67:	6a 00                	push   0x0
10004c69:	68 a0 c3 00 10       	push   0x1000c3a0
10004c6e:	53                   	push   ebx
10004c6f:	6a 00                	push   0x0
10004c71:	56                   	push   esi
10004c72:	ff 73 78             	push   DWORD PTR [ebx+0x78]
10004c75:	8d 45 c4             	lea    eax,[ebp-0x3c]
10004c78:	50                   	push   eax
10004c79:	e8 52 f4 ff ff       	call   0x100040d0
10004c7e:	83 c4 20             	add    esp,0x20
10004c81:	8d 4d c4             	lea    ecx,[ebp-0x3c]
10004c84:	ff d7                	call   edi
10004c86:	6a 00                	push   0x0
10004c88:	6a 00                	push   0x0
10004c8a:	68 70 14 01 10       	push   0x10011470
10004c8f:	53                   	push   ebx
10004c90:	6a 00                	push   0x0
10004c92:	56                   	push   esi
10004c93:	ff 73 70             	push   DWORD PTR [ebx+0x70]
10004c96:	8d 45 c4             	lea    eax,[ebp-0x3c]
10004c99:	50                   	push   eax
10004c9a:	e8 31 f4 ff ff       	call   0x100040d0
10004c9f:	83 c4 20             	add    esp,0x20
10004ca2:	8d 4d c4             	lea    ecx,[ebp-0x3c]
10004ca5:	ff d7                	call   edi
10004ca7:	6a 00                	push   0x0
10004ca9:	6a 00                	push   0x0
10004cab:	68 10 99 00 10       	push   0x10009910
10004cb0:	53                   	push   ebx
10004cb1:	6a 00                	push   0x0
10004cb3:	56                   	push   esi
10004cb4:	ff b3 b8 00 00 00    	push   DWORD PTR [ebx+0xb8]
10004cba:	8d 45 c4             	lea    eax,[ebp-0x3c]
10004cbd:	50                   	push   eax
10004cbe:	e8 0d f4 ff ff       	call   0x100040d0
10004cc3:	83 c4 20             	add    esp,0x20
10004cc6:	8d 4d c4             	lea    ecx,[ebp-0x3c]
10004cc9:	ff d7                	call   edi
10004ccb:	6a 00                	push   0x0
10004ccd:	6a 00                	push   0x0
10004ccf:	68 80 c2 00 10       	push   0x1000c280
10004cd4:	53                   	push   ebx
10004cd5:	6a 00                	push   0x0
10004cd7:	56                   	push   esi
10004cd8:	ff b3 9c 00 00 00    	push   DWORD PTR [ebx+0x9c]
10004cde:	8d 45 c4             	lea    eax,[ebp-0x3c]
10004ce1:	50                   	push   eax
10004ce2:	e8 e9 f3 ff ff       	call   0x100040d0
10004ce7:	83 c4 20             	add    esp,0x20
10004cea:	8d 4d c4             	lea    ecx,[ebp-0x3c]
10004ced:	ff d7                	call   edi
10004cef:	6a 00                	push   0x0
10004cf1:	6a 00                	push   0x0
10004cf3:	68 60 c1 00 10       	push   0x1000c160
10004cf8:	53                   	push   ebx
10004cf9:	6a 00                	push   0x0
10004cfb:	56                   	push   esi
10004cfc:	ff b3 8c 00 00 00    	push   DWORD PTR [ebx+0x8c]
10004d02:	8d 45 c4             	lea    eax,[ebp-0x3c]
10004d05:	50                   	push   eax
10004d06:	e8 c5 f3 ff ff       	call   0x100040d0
10004d0b:	83 c4 20             	add    esp,0x20
10004d0e:	8d 4d c4             	lea    ecx,[ebp-0x3c]
10004d11:	ff d7                	call   edi
10004d13:	6a 00                	push   0x0
10004d15:	6a 00                	push   0x0
10004d17:	68 e0 a4 00 10       	push   0x1000a4e0
10004d1c:	53                   	push   ebx
10004d1d:	6a 00                	push   0x0
10004d1f:	56                   	push   esi
10004d20:	ff b3 94 00 00 00    	push   DWORD PTR [ebx+0x94]
10004d26:	8d 45 c4             	lea    eax,[ebp-0x3c]
10004d29:	50                   	push   eax
10004d2a:	e8 a1 f3 ff ff       	call   0x100040d0
10004d2f:	83 c4 20             	add    esp,0x20
10004d32:	8d 4d c4             	lea    ecx,[ebp-0x3c]
10004d35:	ff d7                	call   edi
10004d37:	6a 00                	push   0x0
10004d39:	6a 00                	push   0x0
10004d3b:	68 b0 9f 00 10       	push   0x10009fb0
10004d40:	53                   	push   ebx
10004d41:	6a 00                	push   0x0
10004d43:	56                   	push   esi
10004d44:	ff b3 a8 00 00 00    	push   DWORD PTR [ebx+0xa8]
10004d4a:	8d 45 c4             	lea    eax,[ebp-0x3c]
10004d4d:	50                   	push   eax
10004d4e:	e8 7d f3 ff ff       	call   0x100040d0
10004d53:	83 c4 20             	add    esp,0x20
10004d56:	8d 4d c4             	lea    ecx,[ebp-0x3c]
10004d59:	ff d7                	call   edi
10004d5b:	6a 00                	push   0x0
10004d5d:	6a 00                	push   0x0
10004d5f:	68 40 a0 00 10       	push   0x1000a040
10004d64:	53                   	push   ebx
10004d65:	6a 00                	push   0x0
10004d67:	56                   	push   esi
10004d68:	ff b3 90 00 00 00    	push   DWORD PTR [ebx+0x90]
10004d6e:	8d 45 c4             	lea    eax,[ebp-0x3c]
10004d71:	50                   	push   eax
10004d72:	e8 59 f3 ff ff       	call   0x100040d0
10004d77:	83 c4 20             	add    esp,0x20
10004d7a:	8d 4d c4             	lea    ecx,[ebp-0x3c]
10004d7d:	ff d7                	call   edi
10004d7f:	53                   	push   ebx
10004d80:	6a 00                	push   0x0
10004d82:	56                   	push   esi
10004d83:	ff b3 e8 00 00 00    	push   DWORD PTR [ebx+0xe8]
10004d89:	8d 45 c4             	lea    eax,[ebp-0x3c]
10004d8c:	50                   	push   eax
10004d8d:	e8 9e f5 ff ff       	call   0x10004330
10004d92:	83 c4 14             	add    esp,0x14
10004d95:	8d 4d c4             	lea    ecx,[ebp-0x3c]
10004d98:	ff d7                	call   edi
10004d9a:	6a 2c                	push   0x2c
10004d9c:	e8 da 7e 01 00       	call   0x1001cc7b
10004da1:	83 c4 04             	add    esp,0x4
10004da4:	89 45 c4             	mov    DWORD PTR [ebp-0x3c],eax
10004da7:	c6 45 fc 0c          	mov    BYTE PTR [ebp-0x4],0xc
10004dab:	85 c0                	test   eax,eax
10004dad:	74 0f                	je     0x10004dbe
10004daf:	ff b3 08 01 00 00    	push   DWORD PTR [ebx+0x108]
10004db5:	8b c8                	mov    ecx,eax
10004db7:	e8 b4 4f 01 00       	call   0x10019d70
10004dbc:	eb 02                	jmp    0x10004dc0
10004dbe:	33 c0                	xor    eax,eax
10004dc0:	8b 8b 10 01 00 00    	mov    ecx,DWORD PTR [ebx+0x110]
10004dc6:	8b 35 20 28 02 10    	mov    esi,DWORD PTR ds:0x10022820
10004dcc:	6a 00                	push   0x0
10004dce:	6a 00                	push   0x0
10004dd0:	50                   	push   eax
10004dd1:	c6 45 fc 0b          	mov    BYTE PTR [ebp-0x4],0xb
10004dd5:	89 83 50 01 00 00    	mov    DWORD PTR [ebx+0x150],eax
10004ddb:	ff d6                	call   esi
10004ddd:	8b 8b ec 00 00 00    	mov    ecx,DWORD PTR [ebx+0xec]
10004de3:	6a 00                	push   0x0
10004de5:	ff 15 18 2a 02 10    	call   DWORD PTR ds:0x10022a18
10004deb:	6a 30                	push   0x30
10004ded:	e8 89 7e 01 00       	call   0x1001cc7b
10004df2:	83 c4 04             	add    esp,0x4
10004df5:	89 45 c4             	mov    DWORD PTR [ebp-0x3c],eax
10004df8:	c6 45 fc 0d          	mov    BYTE PTR [ebp-0x4],0xd
10004dfc:	85 c0                	test   eax,eax
10004dfe:	74 0f                	je     0x10004e0f
10004e00:	ff b3 08 01 00 00    	push   DWORD PTR [ebx+0x108]
10004e06:	8b c8                	mov    ecx,eax
10004e08:	e8 d3 4a 01 00       	call   0x100198e0
10004e0d:	eb 02                	jmp    0x10004e11
10004e0f:	33 c0                	xor    eax,eax
10004e11:	8b 8b 10 01 00 00    	mov    ecx,DWORD PTR [ebx+0x110]
10004e17:	6a 00                	push   0x0
10004e19:	6a 00                	push   0x0
10004e1b:	50                   	push   eax
10004e1c:	c6 45 fc 0b          	mov    BYTE PTR [ebp-0x4],0xb
10004e20:	89 83 4c 01 00 00    	mov    DWORD PTR [ebx+0x14c],eax
10004e26:	ff d6                	call   esi
10004e28:	8b 83 4c 01 00 00    	mov    eax,DWORD PTR [ebx+0x14c]
10004e2e:	53                   	push   ebx
10004e2f:	ff 35 58 22 02 10    	push   DWORD PTR ds:0x10022258
10004e35:	83 c0 24             	add    eax,0x24
10004e38:	50                   	push   eax
10004e39:	8d 45 c4             	lea    eax,[ebp-0x3c]
10004e3c:	50                   	push   eax
10004e3d:	e8 4e f6 ff ff       	call   0x10004490
10004e42:	83 c4 10             	add    esp,0x10
10004e45:	8d 4d c4             	lea    ecx,[ebp-0x3c]
10004e48:	ff d7                	call   edi
10004e4a:	8b 83 50 01 00 00    	mov    eax,DWORD PTR [ebx+0x150]
10004e50:	53                   	push   ebx
10004e51:	6a 00                	push   0x0
10004e53:	ff 35 e8 27 02 10    	push   DWORD PTR ds:0x100227e8
10004e59:	ff 70 20             	push   DWORD PTR [eax+0x20]
10004e5c:	8d 45 c4             	lea    eax,[ebp-0x3c]
10004e5f:	50                   	push   eax
10004e60:	e8 1b f8 ff ff       	call   0x10004680
10004e65:	83 c4 14             	add    esp,0x14
10004e68:	8d 4d c4             	lea    ecx,[ebp-0x3c]
10004e6b:	ff d7                	call   edi
10004e6d:	8b 83 50 01 00 00    	mov    eax,DWORD PTR [ebx+0x150]
10004e73:	53                   	push   ebx
10004e74:	6a 00                	push   0x0
10004e76:	ff 35 00 29 02 10    	push   DWORD PTR ds:0x10022900
10004e7c:	ff 70 28             	push   DWORD PTR [eax+0x28]
10004e7f:	8d 45 c4             	lea    eax,[ebp-0x3c]
10004e82:	50                   	push   eax
10004e83:	e8 b8 f6 ff ff       	call   0x10004540
10004e88:	83 c4 14             	add    esp,0x14
10004e8b:	8d 4d c4             	lea    ecx,[ebp-0x3c]
10004e8e:	ff d7                	call   edi
10004e90:	6a 40                	push   0x40
10004e92:	e8 e4 7d 01 00       	call   0x1001cc7b
10004e97:	83 c4 04             	add    esp,0x4
10004e9a:	89 45 c4             	mov    DWORD PTR [ebp-0x3c],eax
10004e9d:	c6 45 fc 0e          	mov    BYTE PTR [ebp-0x4],0xe
10004ea1:	85 c0                	test   eax,eax
10004ea3:	74 0f                	je     0x10004eb4
10004ea5:	ff b3 08 01 00 00    	push   DWORD PTR [ebx+0x108]
10004eab:	8b c8                	mov    ecx,eax
10004ead:	e8 4e 56 01 00       	call   0x1001a500
10004eb2:	eb 02                	jmp    0x10004eb6
10004eb4:	33 c0                	xor    eax,eax
10004eb6:	8b 8b 10 01 00 00    	mov    ecx,DWORD PTR [ebx+0x110]
10004ebc:	6a 00                	push   0x0
10004ebe:	6a 00                	push   0x0
10004ec0:	50                   	push   eax
10004ec1:	c6 45 fc 0b          	mov    BYTE PTR [ebp-0x4],0xb
10004ec5:	89 83 48 01 00 00    	mov    DWORD PTR [ebx+0x148],eax
10004ecb:	ff d6                	call   esi
10004ecd:	8b 8b 48 01 00 00    	mov    ecx,DWORD PTR [ebx+0x148]
10004ed3:	8d b3 5c 01 00 00    	lea    esi,[ebx+0x15c]
10004ed9:	56                   	push   esi
10004eda:	8b 49 28             	mov    ecx,DWORD PTR [ecx+0x28]
10004edd:	ff 15 f4 28 02 10    	call   DWORD PTR ds:0x100228f4
10004ee3:	8b 8b 48 01 00 00    	mov    ecx,DWORD PTR [ebx+0x148]
10004ee9:	56                   	push   esi
10004eea:	8b 49 20             	mov    ecx,DWORD PTR [ecx+0x20]
10004eed:	ff 15 f4 28 02 10    	call   DWORD PTR ds:0x100228f4
10004ef3:	8b 83 48 01 00 00    	mov    eax,DWORD PTR [ebx+0x148]
10004ef9:	8d 93 64 01 00 00    	lea    edx,[ebx+0x164]
10004eff:	52                   	push   edx
10004f00:	8b 48 38             	mov    ecx,DWORD PTR [eax+0x38]
10004f03:	8b 01                	mov    eax,DWORD PTR [ecx]
10004f05:	ff 90 c4 00 00 00    	call   DWORD PTR [eax+0xc4]
10004f0b:	8b 83 48 01 00 00    	mov    eax,DWORD PTR [ebx+0x148]
10004f11:	53                   	push   ebx
10004f12:	6a 00                	push   0x0
10004f14:	ff 35 00 29 02 10    	push   DWORD PTR ds:0x10022900
10004f1a:	ff 70 20             	push   DWORD PTR [eax+0x20]
10004f1d:	8d 45 c4             	lea    eax,[ebp-0x3c]
10004f20:	50                   	push   eax
10004f21:	e8 ca f6 ff ff       	call   0x100045f0
10004f26:	83 c4 14             	add    esp,0x14
10004f29:	8d 4d c4             	lea    ecx,[ebp-0x3c]
10004f2c:	ff d7                	call   edi
10004f2e:	8b 83 48 01 00 00    	mov    eax,DWORD PTR [ebx+0x148]
10004f34:	8b 35 a8 29 02 10    	mov    esi,DWORD PTR ds:0x100229a8
10004f3a:	53                   	push   ebx
10004f3b:	6a 00                	push   0x0
10004f3d:	56                   	push   esi
10004f3e:	ff 70 30             	push   DWORD PTR [eax+0x30]
10004f41:	8d 45 c4             	lea    eax,[ebp-0x3c]
10004f44:	50                   	push   eax
10004f45:	e8 36 f3 ff ff       	call   0x10004280
10004f4a:	83 c4 14             	add    esp,0x14
10004f4d:	8d 4d c4             	lea    ecx,[ebp-0x3c]
10004f50:	ff d7                	call   edi
10004f52:	8b 83 48 01 00 00    	mov    eax,DWORD PTR [ebx+0x148]
10004f58:	53                   	push   ebx
10004f59:	6a 00                	push   0x0
10004f5b:	56                   	push   esi
10004f5c:	ff 70 3c             	push   DWORD PTR [eax+0x3c]
10004f5f:	8d 45 c4             	lea    eax,[ebp-0x3c]
10004f62:	50                   	push   eax
10004f63:	e8 68 f2 ff ff       	call   0x100041d0
10004f68:	83 c4 14             	add    esp,0x14
10004f6b:	8d 4d c4             	lea    ecx,[ebp-0x3c]
10004f6e:	ff d7                	call   edi
10004f70:	8b 83 48 01 00 00    	mov    eax,DWORD PTR [ebx+0x148]
10004f76:	53                   	push   ebx
10004f77:	6a 00                	push   0x0
10004f79:	56                   	push   esi
10004f7a:	ff 70 34             	push   DWORD PTR [eax+0x34]
10004f7d:	8d 45 c4             	lea    eax,[ebp-0x3c]
10004f80:	50                   	push   eax
10004f81:	e8 5a f4 ff ff       	call   0x100043e0
10004f86:	83 c4 14             	add    esp,0x14
10004f89:	8d 4d c4             	lea    ecx,[ebp-0x3c]
10004f8c:	ff d7                	call   edi
10004f8e:	8b 35 a4 29 02 10    	mov    esi,DWORD PTR ds:0x100229a4
10004f94:	8d 45 c4             	lea    eax,[ebp-0x3c]
; [included 486 instruction/data lines]

; ===== QSlotObject callback implementations and member-function adapter (0x1000aa80..0x1000ae98) =====
1000aa80:	55                   	push   ebp
1000aa81:	8b ec                	mov    ebp,esp
1000aa83:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000aa86:	83 e8 00             	sub    eax,0x0
1000aa89:	74 41                	je     0x1000aacc
1000aa8b:	83 e8 01             	sub    eax,0x1
1000aa8e:	75 3a                	jne    0x1000aaca
1000aa90:	56                   	push   esi
1000aa91:	8b 75 0c             	mov    esi,DWORD PTR [ebp+0xc]
1000aa94:	8b 46 08             	mov    eax,DWORD PTR [esi+0x8]
1000aa97:	83 78 40 00          	cmp    DWORD PTR [eax+0x40],0x0
1000aa9b:	7e 2c                	jle    0x1000aac9
1000aa9d:	c6 05 30 f0 06 10 00 	mov    BYTE PTR ds:0x1006f030,0x0
1000aaa4:	8b 46 08             	mov    eax,DWORD PTR [esi+0x8]
1000aaa7:	ff 48 40             	dec    DWORD PTR [eax+0x40]
1000aaaa:	8b 4e 08             	mov    ecx,DWORD PTR [esi+0x8]
1000aaad:	ff 70 40             	push   DWORD PTR [eax+0x40]
1000aab0:	83 c1 3c             	add    ecx,0x3c
1000aab3:	e8 28 92 00 00       	call   0x10013ce0
1000aab8:	8b 4e 08             	mov    ecx,DWORD PTR [esi+0x8]
1000aabb:	ff 30                	push   DWORD PTR [eax]
1000aabd:	8b 89 fc 00 00 00    	mov    ecx,DWORD PTR [ecx+0xfc]
1000aac3:	ff 15 d0 28 02 10    	call   DWORD PTR ds:0x100228d0
1000aac9:	5e                   	pop    esi
1000aaca:	5d                   	pop    ebp
1000aacb:	c3                   	ret
1000aacc:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
1000aacf:	85 c0                	test   eax,eax
1000aad1:	74 f7                	je     0x1000aaca
1000aad3:	6a 0c                	push   0xc
1000aad5:	50                   	push   eax
1000aad6:	e8 d8 21 01 00       	call   0x1001ccb3
1000aadb:	83 c4 08             	add    esp,0x8
1000aade:	5d                   	pop    ebp
1000aadf:	c3                   	ret
1000aae0:	55                   	push   ebp
1000aae1:	8b ec                	mov    ebp,esp
1000aae3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000aae6:	83 e8 00             	sub    eax,0x0
1000aae9:	74 11                	je     0x1000aafc
1000aaeb:	83 e8 01             	sub    eax,0x1
1000aaee:	75 1e                	jne    0x1000ab0e
1000aaf0:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
1000aaf3:	8d 49 08             	lea    ecx,[ecx+0x8]
1000aaf6:	5d                   	pop    ebp
1000aaf7:	e9 94 ad ff ff       	jmp    0x10005890
1000aafc:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
1000aaff:	85 c0                	test   eax,eax
1000ab01:	74 0b                	je     0x1000ab0e
1000ab03:	6a 0c                	push   0xc
1000ab05:	50                   	push   eax
1000ab06:	e8 a8 21 01 00       	call   0x1001ccb3
1000ab0b:	83 c4 08             	add    esp,0x8
1000ab0e:	5d                   	pop    ebp
1000ab0f:	c3                   	ret
1000ab10:	55                   	push   ebp
1000ab11:	8b ec                	mov    ebp,esp
1000ab13:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000ab16:	83 e8 00             	sub    eax,0x0
1000ab19:	74 11                	je     0x1000ab2c
1000ab1b:	83 e8 01             	sub    eax,0x1
1000ab1e:	75 1e                	jne    0x1000ab3e
1000ab20:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
1000ab23:	8d 49 08             	lea    ecx,[ecx+0x8]
1000ab26:	5d                   	pop    ebp
1000ab27:	e9 94 ae ff ff       	jmp    0x100059c0
1000ab2c:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
1000ab2f:	85 c0                	test   eax,eax
1000ab31:	74 0b                	je     0x1000ab3e
1000ab33:	6a 0c                	push   0xc
1000ab35:	50                   	push   eax
1000ab36:	e8 78 21 01 00       	call   0x1001ccb3
1000ab3b:	83 c4 08             	add    esp,0x8
1000ab3e:	5d                   	pop    ebp
1000ab3f:	c3                   	ret
1000ab40:	55                   	push   ebp
1000ab41:	8b ec                	mov    ebp,esp
1000ab43:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000ab46:	83 e8 00             	sub    eax,0x0
1000ab49:	74 1e                	je     0x1000ab69
1000ab4b:	83 e8 01             	sub    eax,0x1
1000ab4e:	75 2b                	jne    0x1000ab7b
1000ab50:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
1000ab53:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
1000ab56:	ff 70 0c             	push   DWORD PTR [eax+0xc]
1000ab59:	8d 49 08             	lea    ecx,[ecx+0x8]
1000ab5c:	ff 70 08             	push   DWORD PTR [eax+0x8]
1000ab5f:	ff 70 04             	push   DWORD PTR [eax+0x4]
1000ab62:	e8 a9 af ff ff       	call   0x10005b10
1000ab67:	5d                   	pop    ebp
1000ab68:	c3                   	ret
1000ab69:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
1000ab6c:	85 c0                	test   eax,eax
1000ab6e:	74 0b                	je     0x1000ab7b
1000ab70:	6a 0c                	push   0xc
1000ab72:	50                   	push   eax
1000ab73:	e8 3b 21 01 00       	call   0x1001ccb3
1000ab78:	83 c4 08             	add    esp,0x8
1000ab7b:	5d                   	pop    ebp
1000ab7c:	c3                   	ret
1000ab7d:	cc                   	int3
1000ab7e:	cc                   	int3
1000ab7f:	cc                   	int3
1000ab80:	55                   	push   ebp
1000ab81:	8b ec                	mov    ebp,esp
1000ab83:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000ab86:	83 e8 00             	sub    eax,0x0
1000ab89:	74 11                	je     0x1000ab9c
1000ab8b:	83 e8 01             	sub    eax,0x1
1000ab8e:	75 1e                	jne    0x1000abae
1000ab90:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
1000ab93:	8d 49 08             	lea    ecx,[ecx+0x8]
1000ab96:	5d                   	pop    ebp
1000ab97:	e9 64 b3 ff ff       	jmp    0x10005f00
1000ab9c:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
1000ab9f:	85 c0                	test   eax,eax
1000aba1:	74 0b                	je     0x1000abae
1000aba3:	6a 0c                	push   0xc
1000aba5:	50                   	push   eax
1000aba6:	e8 08 21 01 00       	call   0x1001ccb3
1000abab:	83 c4 08             	add    esp,0x8
1000abae:	5d                   	pop    ebp
1000abaf:	c3                   	ret
1000abb0:	55                   	push   ebp
1000abb1:	8b ec                	mov    ebp,esp
1000abb3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000abb6:	83 e8 00             	sub    eax,0x0
1000abb9:	74 47                	je     0x1000ac02
1000abbb:	83 e8 01             	sub    eax,0x1
1000abbe:	75 40                	jne    0x1000ac00
1000abc0:	56                   	push   esi
1000abc1:	8b 75 0c             	mov    esi,DWORD PTR [ebp+0xc]
1000abc4:	8b 4e 08             	mov    ecx,DWORD PTR [esi+0x8]
1000abc7:	8b 41 3c             	mov    eax,DWORD PTR [ecx+0x3c]
1000abca:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
1000abcd:	48                   	dec    eax
1000abce:	39 41 40             	cmp    DWORD PTR [ecx+0x40],eax
1000abd1:	7d 2c                	jge    0x1000abff
1000abd3:	c6 05 30 f0 06 10 00 	mov    BYTE PTR ds:0x1006f030,0x0
1000abda:	8b 46 08             	mov    eax,DWORD PTR [esi+0x8]
1000abdd:	ff 40 40             	inc    DWORD PTR [eax+0x40]
1000abe0:	8b 4e 08             	mov    ecx,DWORD PTR [esi+0x8]
1000abe3:	ff 70 40             	push   DWORD PTR [eax+0x40]
1000abe6:	83 c1 3c             	add    ecx,0x3c
1000abe9:	e8 f2 90 00 00       	call   0x10013ce0
1000abee:	8b 4e 08             	mov    ecx,DWORD PTR [esi+0x8]
1000abf1:	ff 30                	push   DWORD PTR [eax]
1000abf3:	8b 89 fc 00 00 00    	mov    ecx,DWORD PTR [ecx+0xfc]
1000abf9:	ff 15 d0 28 02 10    	call   DWORD PTR ds:0x100228d0
1000abff:	5e                   	pop    esi
1000ac00:	5d                   	pop    ebp
1000ac01:	c3                   	ret
1000ac02:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
1000ac05:	85 c0                	test   eax,eax
1000ac07:	74 f7                	je     0x1000ac00
1000ac09:	6a 0c                	push   0xc
1000ac0b:	50                   	push   eax
1000ac0c:	e8 a2 20 01 00       	call   0x1001ccb3
1000ac11:	83 c4 08             	add    esp,0x8
1000ac14:	5d                   	pop    ebp
1000ac15:	c3                   	ret
1000ac16:	cc                   	int3
1000ac17:	cc                   	int3
1000ac18:	cc                   	int3
1000ac19:	cc                   	int3
1000ac1a:	cc                   	int3
1000ac1b:	cc                   	int3
1000ac1c:	cc                   	int3
1000ac1d:	cc                   	int3
1000ac1e:	cc                   	int3
1000ac1f:	cc                   	int3
1000ac20:	55                   	push   ebp
1000ac21:	8b ec                	mov    ebp,esp
1000ac23:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000ac26:	83 e8 00             	sub    eax,0x0
1000ac29:	74 11                	je     0x1000ac3c
1000ac2b:	83 e8 01             	sub    eax,0x1
1000ac2e:	75 1e                	jne    0x1000ac4e
1000ac30:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
1000ac33:	8d 49 08             	lea    ecx,[ecx+0x8]
1000ac36:	5d                   	pop    ebp
1000ac37:	e9 74 b7 ff ff       	jmp    0x100063b0
1000ac3c:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
1000ac3f:	85 c0                	test   eax,eax
1000ac41:	74 0b                	je     0x1000ac4e
1000ac43:	6a 0c                	push   0xc
1000ac45:	50                   	push   eax
1000ac46:	e8 68 20 01 00       	call   0x1001ccb3
1000ac4b:	83 c4 08             	add    esp,0x8
1000ac4e:	5d                   	pop    ebp
1000ac4f:	c3                   	ret
1000ac50:	55                   	push   ebp
1000ac51:	8b ec                	mov    ebp,esp
1000ac53:	6a ff                	push   0xffffffff
1000ac55:	68 19 f3 01 10       	push   0x1001f319
1000ac5a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000ac60:	50                   	push   eax
1000ac61:	83 ec 10             	sub    esp,0x10
1000ac64:	56                   	push   esi
1000ac65:	a1 cc f0 06 10       	mov    eax,ds:0x1006f0cc
1000ac6a:	33 c5                	xor    eax,ebp
1000ac6c:	50                   	push   eax
1000ac6d:	8d 45 f4             	lea    eax,[ebp-0xc]
1000ac70:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000ac76:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000ac79:	83 e8 00             	sub    eax,0x0
1000ac7c:	74 5a                	je     0x1000acd8
1000ac7e:	83 e8 01             	sub    eax,0x1
1000ac81:	75 67                	jne    0x1000acea
1000ac83:	8b 75 0c             	mov    esi,DWORD PTR [ebp+0xc]
1000ac86:	8d 45 e4             	lea    eax,[ebp-0x1c]
1000ac89:	68 01 01 00 00       	push   0x101
1000ac8e:	50                   	push   eax
1000ac8f:	8b 46 08             	mov    eax,DWORD PTR [esi+0x8]
1000ac92:	8b 88 50 01 00 00    	mov    ecx,DWORD PTR [eax+0x150]
1000ac98:	8b 49 28             	mov    ecx,DWORD PTR [ecx+0x28]
1000ac9b:	ff 15 f8 28 02 10    	call   DWORD PTR ds:0x100228f8
1000aca1:	6a 00                	push   0x0
1000aca3:	8b c8                	mov    ecx,eax
1000aca5:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000acac:	ff 15 c8 23 02 10    	call   DWORD PTR ds:0x100223c8
1000acb2:	8b 4e 08             	mov    ecx,DWORD PTR [esi+0x8]
1000acb5:	50                   	push   eax
1000acb6:	8b 49 38             	mov    ecx,DWORD PTR [ecx+0x38]
1000acb9:	ff 15 d8 20 02 10    	call   DWORD PTR ds:0x100220d8
1000acbf:	8d 4d e4             	lea    ecx,[ebp-0x1c]
1000acc2:	ff 15 5c 23 02 10    	call   DWORD PTR ds:0x1002235c
1000acc8:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000accb:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000acd2:	59                   	pop    ecx
1000acd3:	5e                   	pop    esi
1000acd4:	8b e5                	mov    esp,ebp
1000acd6:	5d                   	pop    ebp
1000acd7:	c3                   	ret
1000acd8:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
1000acdb:	85 c0                	test   eax,eax
1000acdd:	74 0b                	je     0x1000acea
1000acdf:	6a 0c                	push   0xc
1000ace1:	50                   	push   eax
1000ace2:	e8 cc 1f 01 00       	call   0x1001ccb3
1000ace7:	83 c4 08             	add    esp,0x8
1000acea:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000aced:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000acf4:	59                   	pop    ecx
1000acf5:	5e                   	pop    esi
1000acf6:	8b e5                	mov    esp,ebp
1000acf8:	5d                   	pop    ebp
1000acf9:	c3                   	ret
1000acfa:	cc                   	int3
1000acfb:	cc                   	int3
1000acfc:	cc                   	int3
1000acfd:	cc                   	int3
1000acfe:	cc                   	int3
1000acff:	cc                   	int3
1000ad00:	55                   	push   ebp
1000ad01:	8b ec                	mov    ebp,esp
1000ad03:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000ad06:	83 e8 00             	sub    eax,0x0
1000ad09:	74 1f                	je     0x1000ad2a
1000ad0b:	83 e8 01             	sub    eax,0x1
1000ad0e:	75 2c                	jne    0x1000ad3c
1000ad10:	8b 4d 14             	mov    ecx,DWORD PTR [ebp+0x14]
1000ad13:	8b 41 08             	mov    eax,DWORD PTR [ecx+0x8]
1000ad16:	ff 30                	push   DWORD PTR [eax]
1000ad18:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
1000ad1b:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
1000ad1e:	ff 30                	push   DWORD PTR [eax]
1000ad20:	8d 49 08             	lea    ecx,[ecx+0x8]
1000ad23:	e8 c8 b7 ff ff       	call   0x100064f0
1000ad28:	5d                   	pop    ebp
1000ad29:	c3                   	ret
1000ad2a:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
1000ad2d:	85 c0                	test   eax,eax
1000ad2f:	74 0b                	je     0x1000ad3c
1000ad31:	6a 10                	push   0x10
1000ad33:	50                   	push   eax
1000ad34:	e8 7a 1f 01 00       	call   0x1001ccb3
1000ad39:	83 c4 08             	add    esp,0x8
1000ad3c:	5d                   	pop    ebp
1000ad3d:	c3                   	ret
1000ad3e:	cc                   	int3
1000ad3f:	cc                   	int3
1000ad40:	55                   	push   ebp
1000ad41:	8b ec                	mov    ebp,esp
1000ad43:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000ad46:	83 e8 00             	sub    eax,0x0
1000ad49:	74 21                	je     0x1000ad6c
1000ad4b:	83 e8 01             	sub    eax,0x1
1000ad4e:	75 2e                	jne    0x1000ad7e
1000ad50:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
1000ad53:	8b 41 0c             	mov    eax,DWORD PTR [ecx+0xc]
1000ad56:	8b 49 08             	mov    ecx,DWORD PTR [ecx+0x8]
1000ad59:	83 c1 3c             	add    ecx,0x3c
1000ad5c:	8b 00                	mov    eax,DWORD PTR [eax]
1000ad5e:	89 45 08             	mov    DWORD PTR [ebp+0x8],eax
1000ad61:	8d 45 08             	lea    eax,[ebp+0x8]
1000ad64:	50                   	push   eax
1000ad65:	e8 66 2d 00 00       	call   0x1000dad0
1000ad6a:	5d                   	pop    ebp
1000ad6b:	c3                   	ret
1000ad6c:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
1000ad6f:	85 c0                	test   eax,eax
1000ad71:	74 0b                	je     0x1000ad7e
1000ad73:	6a 10                	push   0x10
1000ad75:	50                   	push   eax
1000ad76:	e8 38 1f 01 00       	call   0x1001ccb3
1000ad7b:	83 c4 08             	add    esp,0x8
1000ad7e:	5d                   	pop    ebp
1000ad7f:	c3                   	ret
1000ad80:	55                   	push   ebp
1000ad81:	8b ec                	mov    ebp,esp
1000ad83:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000ad86:	83 e8 00             	sub    eax,0x0
1000ad89:	74 1a                	je     0x1000ada5
1000ad8b:	83 e8 01             	sub    eax,0x1
1000ad8e:	75 27                	jne    0x1000adb7
1000ad90:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
1000ad93:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
1000ad96:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
1000ad99:	8d 49 08             	lea    ecx,[ecx+0x8]
1000ad9c:	ff 30                	push   DWORD PTR [eax]
1000ad9e:	e8 4d be ff ff       	call   0x10006bf0
1000ada3:	5d                   	pop    ebp
1000ada4:	c3                   	ret
1000ada5:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
1000ada8:	85 c0                	test   eax,eax
1000adaa:	74 0b                	je     0x1000adb7
1000adac:	6a 0c                	push   0xc
1000adae:	50                   	push   eax
1000adaf:	e8 ff 1e 01 00       	call   0x1001ccb3
1000adb4:	83 c4 08             	add    esp,0x8
1000adb7:	5d                   	pop    ebp
1000adb8:	c3                   	ret
1000adb9:	cc                   	int3
1000adba:	cc                   	int3
1000adbb:	cc                   	int3
1000adbc:	cc                   	int3
1000adbd:	cc                   	int3
1000adbe:	cc                   	int3
1000adbf:	cc                   	int3
1000adc0:	55                   	push   ebp
1000adc1:	8b ec                	mov    ebp,esp
1000adc3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000adc6:	83 e8 00             	sub    eax,0x0
1000adc9:	74 11                	je     0x1000addc
1000adcb:	83 e8 01             	sub    eax,0x1
1000adce:	75 1e                	jne    0x1000adee
1000add0:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
1000add3:	8d 49 08             	lea    ecx,[ecx+0x8]
1000add6:	5d                   	pop    ebp
1000add7:	e9 e4 bf ff ff       	jmp    0x10006dc0
1000addc:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
1000addf:	85 c0                	test   eax,eax
1000ade1:	74 0b                	je     0x1000adee
1000ade3:	6a 0c                	push   0xc
1000ade5:	50                   	push   eax
1000ade6:	e8 c8 1e 01 00       	call   0x1001ccb3
1000adeb:	83 c4 08             	add    esp,0x8
1000adee:	5d                   	pop    ebp
1000adef:	c3                   	ret
1000adf0:	55                   	push   ebp
1000adf1:	8b ec                	mov    ebp,esp
1000adf3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000adf6:	83 e8 00             	sub    eax,0x0
1000adf9:	74 1a                	je     0x1000ae15
1000adfb:	83 e8 01             	sub    eax,0x1
1000adfe:	75 27                	jne    0x1000ae27
1000ae00:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
1000ae03:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
1000ae06:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
1000ae09:	8d 49 08             	lea    ecx,[ecx+0x8]
1000ae0c:	ff 30                	push   DWORD PTR [eax]
1000ae0e:	e8 9d c0 ff ff       	call   0x10006eb0
1000ae13:	5d                   	pop    ebp
1000ae14:	c3                   	ret
1000ae15:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
1000ae18:	85 c0                	test   eax,eax
1000ae1a:	74 0b                	je     0x1000ae27
1000ae1c:	6a 0c                	push   0xc
1000ae1e:	50                   	push   eax
1000ae1f:	e8 8f 1e 01 00       	call   0x1001ccb3
1000ae24:	83 c4 08             	add    esp,0x8
1000ae27:	5d                   	pop    ebp
1000ae28:	c3                   	ret
1000ae29:	cc                   	int3
1000ae2a:	cc                   	int3
1000ae2b:	cc                   	int3
1000ae2c:	cc                   	int3
1000ae2d:	cc                   	int3
1000ae2e:	cc                   	int3
1000ae2f:	cc                   	int3
1000ae30:	55                   	push   ebp
1000ae31:	8b ec                	mov    ebp,esp
1000ae33:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000ae36:	83 e8 00             	sub    eax,0x0
1000ae39:	74 4a                	je     0x1000ae85
1000ae3b:	83 e8 01             	sub    eax,0x1
1000ae3e:	74 36                	je     0x1000ae76
1000ae40:	83 e8 01             	sub    eax,0x1
1000ae43:	75 52                	jne    0x1000ae97
1000ae45:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
1000ae48:	8b 4d 14             	mov    ecx,DWORD PTR [ebp+0x14]
1000ae4b:	56                   	push   esi
1000ae4c:	8b 70 0c             	mov    esi,DWORD PTR [eax+0xc]
1000ae4f:	8b 11                	mov    edx,DWORD PTR [ecx]
1000ae51:	3b 50 08             	cmp    edx,DWORD PTR [eax+0x8]
1000ae54:	75 16                	jne    0x1000ae6c
1000ae56:	85 d2                	test   edx,edx
1000ae58:	74 05                	je     0x1000ae5f
1000ae5a:	39 71 04             	cmp    DWORD PTR [ecx+0x4],esi
1000ae5d:	75 0d                	jne    0x1000ae6c
1000ae5f:	8b 45 18             	mov    eax,DWORD PTR [ebp+0x18]
1000ae62:	b9 01 00 00 00       	mov    ecx,0x1
1000ae67:	5e                   	pop    esi
1000ae68:	88 08                	mov    BYTE PTR [eax],cl
1000ae6a:	5d                   	pop    ebp
1000ae6b:	c3                   	ret
1000ae6c:	8b 45 18             	mov    eax,DWORD PTR [ebp+0x18]
1000ae6f:	33 c9                	xor    ecx,ecx
1000ae71:	5e                   	pop    esi
1000ae72:	88 08                	mov    BYTE PTR [eax],cl
1000ae74:	5d                   	pop    ebp
1000ae75:	c3                   	ret
1000ae76:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
1000ae79:	8b 48 0c             	mov    ecx,DWORD PTR [eax+0xc]
1000ae7c:	8b 50 08             	mov    edx,DWORD PTR [eax+0x8]
1000ae7f:	03 4d 10             	add    ecx,DWORD PTR [ebp+0x10]
1000ae82:	5d                   	pop    ebp
1000ae83:	ff e2                	jmp    edx
1000ae85:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
1000ae88:	85 c0                	test   eax,eax
1000ae8a:	74 0b                	je     0x1000ae97
1000ae8c:	6a 10                	push   0x10
1000ae8e:	50                   	push   eax
1000ae8f:	e8 1f 1e 01 00       	call   0x1001ccb3
1000ae94:	83 c4 08             	add    esp,0x8
1000ae97:	5d                   	pop    ebp
1000ae98:	c3                   	ret
; [included 438 instruction/data lines]

; ===== CbWithBtn/CbWithBtnContainer connect wrappers, callbacks and constructors (0x1001ae90..0x1001b680) =====
1001ae90:	55                   	push   ebp
1001ae91:	8b ec                	mov    ebp,esp
1001ae93:	51                   	push   ecx
1001ae94:	56                   	push   esi
1001ae95:	8b 75 24             	mov    esi,DWORD PTR [ebp+0x24]
1001ae98:	57                   	push   edi
1001ae99:	33 ff                	xor    edi,edi
1001ae9b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1001aea2:	83 fe 02             	cmp    esi,0x2
1001aea5:	74 05                	je     0x1001aeac
1001aea7:	83 fe 03             	cmp    esi,0x3
1001aeaa:	75 07                	jne    0x1001aeb3
1001aeac:	e8 cf 6b ff ff       	call   0x10011a80
1001aeb1:	8b f8                	mov    edi,eax
1001aeb3:	6a 10                	push   0x10
1001aeb5:	e8 c1 1d 00 00       	call   0x1001cc7b
1001aeba:	83 c4 04             	add    esp,0x4
1001aebd:	89 45 24             	mov    DWORD PTR [ebp+0x24],eax
1001aec0:	85 c0                	test   eax,eax
1001aec2:	74 1b                	je     0x1001aedf
1001aec4:	c7 00 01 00 00 00    	mov    DWORD PTR [eax],0x1
1001aeca:	c7 40 04 10 b6 01 10 	mov    DWORD PTR [eax+0x4],0x1001b610
1001aed1:	8b 4d 1c             	mov    ecx,DWORD PTR [ebp+0x1c]
1001aed4:	89 48 08             	mov    DWORD PTR [eax+0x8],ecx
1001aed7:	8b 4d 20             	mov    ecx,DWORD PTR [ebp+0x20]
1001aeda:	89 48 0c             	mov    DWORD PTR [eax+0xc],ecx
1001aedd:	eb 02                	jmp    0x1001aee1
1001aedf:	33 c0                	xor    eax,eax
1001aee1:	ff 35 64 2e 02 10    	push   DWORD PTR ds:0x10022e64
1001aee7:	57                   	push   edi
1001aee8:	56                   	push   esi
1001aee9:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
1001aeec:	50                   	push   eax
1001aeed:	6a 00                	push   0x0
1001aeef:	ff 75 18             	push   DWORD PTR [ebp+0x18]
1001aef2:	8d 45 10             	lea    eax,[ebp+0x10]
1001aef5:	50                   	push   eax
1001aef6:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
1001aef9:	56                   	push   esi
1001aefa:	ff 15 68 23 02 10    	call   DWORD PTR ds:0x10022368
1001af00:	83 c4 24             	add    esp,0x24
1001af03:	8b c6                	mov    eax,esi
1001af05:	5f                   	pop    edi
1001af06:	5e                   	pop    esi
1001af07:	8b e5                	mov    esp,ebp
1001af09:	5d                   	pop    ebp
1001af0a:	c3                   	ret
1001af0b:	cc                   	int3
1001af0c:	cc                   	int3
1001af0d:	cc                   	int3
1001af0e:	cc                   	int3
1001af0f:	cc                   	int3
1001af10:	55                   	push   ebp
1001af11:	8b ec                	mov    ebp,esp
1001af13:	51                   	push   ecx
1001af14:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
1001af17:	6a 01                	push   0x1
1001af19:	ff 75 1c             	push   DWORD PTR [ebp+0x1c]
1001af1c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1001af23:	ff 75 18             	push   DWORD PTR [ebp+0x18]
1001af26:	50                   	push   eax
1001af27:	ff 75 14             	push   DWORD PTR [ebp+0x14]
1001af2a:	ff 75 10             	push   DWORD PTR [ebp+0x10]
1001af2d:	50                   	push   eax
1001af2e:	ff 75 08             	push   DWORD PTR [ebp+0x8]
1001af31:	e8 5a ff ff ff       	call   0x1001ae90
1001af36:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1001af39:	83 c4 20             	add    esp,0x20
1001af3c:	8b e5                	mov    esp,ebp
1001af3e:	5d                   	pop    ebp
1001af3f:	c3                   	ret
1001af40:	55                   	push   ebp
1001af41:	8b ec                	mov    ebp,esp
1001af43:	51                   	push   ecx
1001af44:	56                   	push   esi
1001af45:	8b 75 20             	mov    esi,DWORD PTR [ebp+0x20]
1001af48:	57                   	push   edi
1001af49:	33 ff                	xor    edi,edi
1001af4b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1001af52:	83 fe 02             	cmp    esi,0x2
1001af55:	74 05                	je     0x1001af5c
1001af57:	83 fe 03             	cmp    esi,0x3
1001af5a:	75 07                	jne    0x1001af63
1001af5c:	e8 bf 6a ff ff       	call   0x10011a20
1001af61:	8b f8                	mov    edi,eax
1001af63:	6a 0c                	push   0xc
1001af65:	e8 11 1d 00 00       	call   0x1001cc7b
1001af6a:	83 c4 04             	add    esp,0x4
1001af6d:	89 45 20             	mov    DWORD PTR [ebp+0x20],eax
1001af70:	85 c0                	test   eax,eax
1001af72:	74 15                	je     0x1001af89
1001af74:	c7 00 01 00 00 00    	mov    DWORD PTR [eax],0x1
1001af7a:	c7 40 04 a0 b5 01 10 	mov    DWORD PTR [eax+0x4],0x1001b5a0
1001af81:	8b 4d 1c             	mov    ecx,DWORD PTR [ebp+0x1c]
1001af84:	89 48 08             	mov    DWORD PTR [eax+0x8],ecx
1001af87:	eb 02                	jmp    0x1001af8b
1001af89:	33 c0                	xor    eax,eax
1001af8b:	ff 35 60 2e 02 10    	push   DWORD PTR ds:0x10022e60
1001af91:	57                   	push   edi
1001af92:	56                   	push   esi
1001af93:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
1001af96:	50                   	push   eax
1001af97:	6a 00                	push   0x0
1001af99:	ff 75 18             	push   DWORD PTR [ebp+0x18]
1001af9c:	8d 45 10             	lea    eax,[ebp+0x10]
1001af9f:	50                   	push   eax
1001afa0:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
1001afa3:	56                   	push   esi
1001afa4:	ff 15 68 23 02 10    	call   DWORD PTR ds:0x10022368
1001afaa:	83 c4 24             	add    esp,0x24
1001afad:	8b c6                	mov    eax,esi
1001afaf:	5f                   	pop    edi
1001afb0:	5e                   	pop    esi
1001afb1:	8b e5                	mov    esp,ebp
1001afb3:	5d                   	pop    ebp
1001afb4:	c3                   	ret
1001afb5:	cc                   	int3
1001afb6:	cc                   	int3
1001afb7:	cc                   	int3
1001afb8:	cc                   	int3
1001afb9:	cc                   	int3
1001afba:	cc                   	int3
1001afbb:	cc                   	int3
1001afbc:	cc                   	int3
1001afbd:	cc                   	int3
1001afbe:	cc                   	int3
1001afbf:	cc                   	int3
1001afc0:	55                   	push   ebp
1001afc1:	8b ec                	mov    ebp,esp
1001afc3:	51                   	push   ecx
1001afc4:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
1001afc7:	6a 01                	push   0x1
1001afc9:	ff 75 18             	push   DWORD PTR [ebp+0x18]
1001afcc:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1001afd3:	50                   	push   eax
1001afd4:	ff 75 14             	push   DWORD PTR [ebp+0x14]
1001afd7:	ff 75 10             	push   DWORD PTR [ebp+0x10]
1001afda:	50                   	push   eax
1001afdb:	ff 75 08             	push   DWORD PTR [ebp+0x8]
1001afde:	e8 5d ff ff ff       	call   0x1001af40
1001afe3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1001afe6:	83 c4 1c             	add    esp,0x1c
1001afe9:	8b e5                	mov    esp,ebp
1001afeb:	5d                   	pop    ebp
1001afec:	c3                   	ret
1001afed:	cc                   	int3
1001afee:	cc                   	int3
1001afef:	cc                   	int3
1001aff0:	55                   	push   ebp
1001aff1:	8b ec                	mov    ebp,esp
1001aff3:	6a ff                	push   0xffffffff
1001aff5:	68 49 0d 02 10       	push   0x10020d49
1001affa:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1001b000:	50                   	push   eax
1001b001:	51                   	push   ecx
1001b002:	56                   	push   esi
1001b003:	a1 cc f0 06 10       	mov    eax,ds:0x1006f0cc
1001b008:	33 c5                	xor    eax,ebp
1001b00a:	50                   	push   eax
1001b00b:	8d 45 f4             	lea    eax,[ebp-0xc]
1001b00e:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1001b014:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
1001b01b:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
1001b01e:	a1 34 23 02 10       	mov    eax,ds:0x10022334
1001b023:	89 06                	mov    DWORD PTR [esi],eax
1001b025:	ff 75 10             	push   DWORD PTR [ebp+0x10]
1001b028:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1001b02f:	56                   	push   esi
1001b030:	68 94 f0 06 10       	push   0x1006f094
1001b035:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
1001b038:	c7 45 f0 01 00 00 00 	mov    DWORD PTR [ebp-0x10],0x1
1001b03f:	51                   	push   ecx
1001b040:	ff 15 08 24 02 10    	call   DWORD PTR ds:0x10022408
1001b046:	83 c4 14             	add    esp,0x14
1001b049:	8b c6                	mov    eax,esi
1001b04b:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1001b04e:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1001b055:	59                   	pop    ecx
1001b056:	5e                   	pop    esi
1001b057:	8b e5                	mov    esp,ebp
1001b059:	5d                   	pop    ebp
1001b05a:	c2 0c 00             	ret    0xc
1001b05d:	cc                   	int3
1001b05e:	cc                   	int3
1001b05f:	cc                   	int3
1001b060:	55                   	push   ebp
1001b061:	8b ec                	mov    ebp,esp
1001b063:	6a ff                	push   0xffffffff
1001b065:	68 70 0d 02 10       	push   0x10020d70
1001b06a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1001b070:	50                   	push   eax
1001b071:	83 ec 08             	sub    esp,0x8
1001b074:	53                   	push   ebx
1001b075:	56                   	push   esi
1001b076:	57                   	push   edi
1001b077:	a1 cc f0 06 10       	mov    eax,ds:0x1006f0cc
1001b07c:	33 c5                	xor    eax,ebp
1001b07e:	50                   	push   eax
1001b07f:	8d 45 f4             	lea    eax,[ebp-0xc]
1001b082:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1001b088:	89 65 f0             	mov    DWORD PTR [ebp-0x10],esp
1001b08b:	8b f1                	mov    esi,ecx
1001b08d:	89 75 ec             	mov    DWORD PTR [ebp-0x14],esi
1001b090:	8b 7d 08             	mov    edi,DWORD PTR [ebp+0x8]
1001b093:	8b 07                	mov    eax,DWORD PTR [edi]
1001b095:	89 06                	mov    DWORD PTR [esi],eax
1001b097:	8b 08                	mov    ecx,DWORD PTR [eax]
1001b099:	85 c9                	test   ecx,ecx
1001b09b:	74 0a                	je     0x1001b0a7
1001b09d:	83 f9 ff             	cmp    ecx,0xffffffff
1001b0a0:	74 39                	je     0x1001b0db
1001b0a2:	f0 ff 00             	lock inc DWORD PTR [eax]
1001b0a5:	eb 34                	jmp    0x1001b0db
1001b0a7:	ff 70 04             	push   DWORD PTR [eax+0x4]
1001b0aa:	8b ce                	mov    ecx,esi
1001b0ac:	ff 15 24 24 02 10    	call   DWORD PTR ds:0x10022424
1001b0b2:	8b cf                	mov    ecx,edi
1001b0b4:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1001b0bb:	ff 15 74 23 02 10    	call   DWORD PTR ds:0x10022374
1001b0c1:	50                   	push   eax
1001b0c2:	8b ce                	mov    ecx,esi
1001b0c4:	ff 15 70 23 02 10    	call   DWORD PTR ds:0x10022370
1001b0ca:	50                   	push   eax
1001b0cb:	8b ce                	mov    ecx,esi
1001b0cd:	ff 15 74 23 02 10    	call   DWORD PTR ds:0x10022374
1001b0d3:	50                   	push   eax
1001b0d4:	8b ce                	mov    ecx,esi
1001b0d6:	e8 a5 76 fe ff       	call   0x10002780
1001b0db:	8b c6                	mov    eax,esi
1001b0dd:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1001b0e0:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1001b0e7:	59                   	pop    ecx
1001b0e8:	5f                   	pop    edi
1001b0e9:	5e                   	pop    esi
1001b0ea:	5b                   	pop    ebx
1001b0eb:	8b e5                	mov    esp,ebp
1001b0ed:	5d                   	pop    ebp
1001b0ee:	c2 04 00             	ret    0x4
1001b0f1:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
1001b0f4:	ff 30                	push   DWORD PTR [eax]
1001b0f6:	ff 15 7c 23 02 10    	call   DWORD PTR ds:0x1002237c
1001b0fc:	83 c4 04             	add    esp,0x4
1001b0ff:	6a 00                	push   0x0
1001b101:	6a 00                	push   0x0
1001b103:	e8 5e 2a 00 00       	call   0x1001db66
1001b108:	cc                   	int3
1001b109:	cc                   	int3
1001b10a:	cc                   	int3
1001b10b:	cc                   	int3
1001b10c:	cc                   	int3
1001b10d:	cc                   	int3
1001b10e:	cc                   	int3
1001b10f:	cc                   	int3
1001b110:	55                   	push   ebp
1001b111:	8b ec                	mov    ebp,esp
1001b113:	6a ff                	push   0xffffffff
1001b115:	68 a4 0d 02 10       	push   0x10020da4
1001b11a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1001b120:	50                   	push   eax
1001b121:	51                   	push   ecx
1001b122:	56                   	push   esi
1001b123:	a1 cc f0 06 10       	mov    eax,ds:0x1006f0cc
1001b128:	33 c5                	xor    eax,ebp
1001b12a:	50                   	push   eax
1001b12b:	8d 45 f4             	lea    eax,[ebp-0xc]
1001b12e:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1001b134:	8b f1                	mov    esi,ecx
1001b136:	89 75 f0             	mov    DWORD PTR [ebp-0x10],esi
1001b139:	6a 00                	push   0x0
1001b13b:	ff 75 08             	push   DWORD PTR [ebp+0x8]
1001b13e:	ff 15 30 28 02 10    	call   DWORD PTR ds:0x10022830
1001b144:	c7 06 70 cb 05 10    	mov    DWORD PTR [esi],0x1005cb70
1001b14a:	c7 46 08 28 cc 05 10 	mov    DWORD PTR [esi+0x8],0x1005cc28
1001b151:	c7 46 24 ff ff ff ff 	mov    DWORD PTR [esi+0x24],0xffffffff
1001b158:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1001b15f:	c7 46 4c 00 00 00 00 	mov    DWORD PTR [esi+0x4c],0x0
1001b166:	56                   	push   esi
1001b167:	8d 4e 18             	lea    ecx,[esi+0x18]
1001b16a:	c6 45 fc 01          	mov    BYTE PTR [ebp-0x4],0x1
1001b16e:	c7 46 50 00 00 00 00 	mov    DWORD PTR [esi+0x50],0x0
1001b175:	e8 b6 06 00 00       	call   0x1001b830
1001b17a:	56                   	push   esi
1001b17b:	6a 00                	push   0x0
1001b17d:	ff 35 00 29 02 10    	push   DWORD PTR ds:0x10022900
1001b183:	8d 45 08             	lea    eax,[ebp+0x8]
1001b186:	ff 76 1c             	push   DWORD PTR [esi+0x1c]
1001b189:	50                   	push   eax
1001b18a:	e8 31 fe ff ff       	call   0x1001afc0
1001b18f:	83 c4 14             	add    esp,0x14
1001b192:	8d 4d 08             	lea    ecx,[ebp+0x8]
1001b195:	ff 15 ac 23 02 10    	call   DWORD PTR ds:0x100223ac
1001b19b:	8b c6                	mov    eax,esi
1001b19d:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1001b1a0:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1001b1a7:	59                   	pop    ecx
1001b1a8:	5e                   	pop    esi
1001b1a9:	8b e5                	mov    esp,ebp
1001b1ab:	5d                   	pop    ebp
1001b1ac:	c2 04 00             	ret    0x4
1001b1af:	cc                   	int3
1001b1b0:	55                   	push   ebp
1001b1b1:	8b ec                	mov    ebp,esp
1001b1b3:	6a ff                	push   0xffffffff
1001b1b5:	68 df 0d 02 10       	push   0x10020ddf
1001b1ba:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1001b1c0:	50                   	push   eax
1001b1c1:	51                   	push   ecx
1001b1c2:	56                   	push   esi
1001b1c3:	a1 cc f0 06 10       	mov    eax,ds:0x1006f0cc
1001b1c8:	33 c5                	xor    eax,ebp
1001b1ca:	50                   	push   eax
1001b1cb:	8d 45 f4             	lea    eax,[ebp-0xc]
1001b1ce:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1001b1d4:	8b f1                	mov    esi,ecx
1001b1d6:	89 75 f0             	mov    DWORD PTR [ebp-0x10],esi
1001b1d9:	6a 00                	push   0x0
1001b1db:	ff 75 08             	push   DWORD PTR [ebp+0x8]
1001b1de:	ff 15 30 28 02 10    	call   DWORD PTR ds:0x10022830
1001b1e4:	c7 06 48 cc 05 10    	mov    DWORD PTR [esi],0x1005cc48
1001b1ea:	c7 46 08 00 cd 05 10 	mov    DWORD PTR [esi+0x8],0x1005cd00
1001b1f1:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1001b1f8:	c7 46 4c 00 00 00 00 	mov    DWORD PTR [esi+0x4c],0x0
1001b1ff:	c7 46 74 00 00 00 00 	mov    DWORD PTR [esi+0x74],0x0
1001b206:	56                   	push   esi
1001b207:	8d 4e 18             	lea    ecx,[esi+0x18]
1001b20a:	c6 45 fc 02          	mov    BYTE PTR [ebp-0x4],0x2
1001b20e:	e8 ad 08 00 00       	call   0x1001bac0
1001b213:	8b c6                	mov    eax,esi
1001b215:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1001b218:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1001b21f:	59                   	pop    ecx
1001b220:	5e                   	pop    esi
1001b221:	8b e5                	mov    esp,ebp
1001b223:	5d                   	pop    ebp
1001b224:	c2 04 00             	ret    0x4
1001b227:	cc                   	int3
1001b228:	cc                   	int3
1001b229:	cc                   	int3
1001b22a:	cc                   	int3
1001b22b:	cc                   	int3
1001b22c:	cc                   	int3
1001b22d:	cc                   	int3
1001b22e:	cc                   	int3
1001b22f:	cc                   	int3
1001b230:	56                   	push   esi
1001b231:	8b f1                	mov    esi,ecx
1001b233:	57                   	push   edi
1001b234:	8d 7e 50             	lea    edi,[esi+0x50]
1001b237:	c7 06 48 cc 05 10    	mov    DWORD PTR [esi],0x1005cc48
1001b23d:	c7 46 08 00 cd 05 10 	mov    DWORD PTR [esi+0x8],0x1005cd00
1001b244:	8b 4f 24             	mov    ecx,DWORD PTR [edi+0x24]
1001b247:	85 c9                	test   ecx,ecx
1001b249:	74 15                	je     0x1001b260
1001b24b:	8b 11                	mov    edx,DWORD PTR [ecx]
1001b24d:	3b cf                	cmp    ecx,edi
1001b24f:	0f 95 c0             	setne  al
1001b252:	0f b6 c0             	movzx  eax,al
1001b255:	50                   	push   eax
1001b256:	ff 52 10             	call   DWORD PTR [edx+0x10]
1001b259:	c7 47 24 00 00 00 00 	mov    DWORD PTR [edi+0x24],0x0
1001b260:	8b 4e 4c             	mov    ecx,DWORD PTR [esi+0x4c]
1001b263:	8d 7e 28             	lea    edi,[esi+0x28]
1001b266:	85 c9                	test   ecx,ecx
1001b268:	74 15                	je     0x1001b27f
1001b26a:	8b 11                	mov    edx,DWORD PTR [ecx]
1001b26c:	3b cf                	cmp    ecx,edi
1001b26e:	0f 95 c0             	setne  al
1001b271:	0f b6 c0             	movzx  eax,al
1001b274:	50                   	push   eax
1001b275:	ff 52 10             	call   DWORD PTR [edx+0x10]
1001b278:	c7 47 24 00 00 00 00 	mov    DWORD PTR [edi+0x24],0x0
1001b27f:	5f                   	pop    edi
1001b280:	8b ce                	mov    ecx,esi
1001b282:	5e                   	pop    esi
1001b283:	ff 25 34 28 02 10    	jmp    DWORD PTR ds:0x10022834
1001b289:	cc                   	int3
1001b28a:	cc                   	int3
1001b28b:	cc                   	int3
1001b28c:	cc                   	int3
1001b28d:	cc                   	int3
1001b28e:	cc                   	int3
1001b28f:	cc                   	int3
1001b290:	55                   	push   ebp
1001b291:	8b ec                	mov    ebp,esp
1001b293:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1001b296:	c7 00 e8 c9 05 10    	mov    DWORD PTR [eax],0x1005c9e8
1001b29c:	5d                   	pop    ebp
1001b29d:	c2 04 00             	ret    0x4
1001b2a0:	55                   	push   ebp
1001b2a1:	8b ec                	mov    ebp,esp
1001b2a3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1001b2a6:	c7 00 bc ca 05 10    	mov    DWORD PTR [eax],0x1005cabc
1001b2ac:	5d                   	pop    ebp
1001b2ad:	c2 04 00             	ret    0x4
1001b2b0:	55                   	push   ebp
1001b2b1:	8b ec                	mov    ebp,esp
1001b2b3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1001b2b6:	c7 00 6c ca 05 10    	mov    DWORD PTR [eax],0x1005ca6c
1001b2bc:	5d                   	pop    ebp
1001b2bd:	c2 04 00             	ret    0x4
1001b2c0:	55                   	push   ebp
1001b2c1:	8b ec                	mov    ebp,esp
1001b2c3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1001b2c6:	c7 00 34 ca 05 10    	mov    DWORD PTR [eax],0x1005ca34
1001b2cc:	5d                   	pop    ebp
1001b2cd:	c2 04 00             	ret    0x4
1001b2d0:	55                   	push   ebp
1001b2d1:	8b ec                	mov    ebp,esp
1001b2d3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1001b2d6:	c7 00 b4 c9 05 10    	mov    DWORD PTR [eax],0x1005c9b4
1001b2dc:	5d                   	pop    ebp
1001b2dd:	c2 04 00             	ret    0x4
1001b2e0:	55                   	push   ebp
1001b2e1:	8b ec                	mov    ebp,esp
1001b2e3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1001b2e6:	c7 00 08 ca 05 10    	mov    DWORD PTR [eax],0x1005ca08
1001b2ec:	5d                   	pop    ebp
1001b2ed:	c2 04 00             	ret    0x4
1001b2f0:	55                   	push   ebp
1001b2f1:	8b ec                	mov    ebp,esp
1001b2f3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1001b2f6:	c7 00 90 c9 05 10    	mov    DWORD PTR [eax],0x1005c990
1001b2fc:	5d                   	pop    ebp
1001b2fd:	c2 04 00             	ret    0x4
1001b300:	55                   	push   ebp
1001b301:	8b ec                	mov    ebp,esp
1001b303:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1001b306:	c7 00 a0 ca 05 10    	mov    DWORD PTR [eax],0x1005caa0
1001b30c:	5d                   	pop    ebp
1001b30d:	c2 04 00             	ret    0x4
1001b310:	55                   	push   ebp
1001b311:	8b ec                	mov    ebp,esp
1001b313:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1001b316:	c7 00 d8 ca 05 10    	mov    DWORD PTR [eax],0x1005cad8
1001b31c:	5d                   	pop    ebp
1001b31d:	c2 04 00             	ret    0x4
1001b320:	83 e9 08             	sub    ecx,0x8
1001b323:	e9 08 00 00 00       	jmp    0x1001b330
1001b328:	83 e9 08             	sub    ecx,0x8
1001b32b:	e9 60 00 00 00       	jmp    0x1001b390
1001b330:	55                   	push   ebp
1001b331:	8b ec                	mov    ebp,esp
1001b333:	56                   	push   esi
1001b334:	8b f1                	mov    esi,ecx
1001b336:	57                   	push   edi
1001b337:	8d 7e 28             	lea    edi,[esi+0x28]
1001b33a:	c7 06 70 cb 05 10    	mov    DWORD PTR [esi],0x1005cb70
1001b340:	c7 46 08 28 cc 05 10 	mov    DWORD PTR [esi+0x8],0x1005cc28
1001b347:	8b 4f 24             	mov    ecx,DWORD PTR [edi+0x24]
1001b34a:	85 c9                	test   ecx,ecx
1001b34c:	74 15                	je     0x1001b363
1001b34e:	8b 11                	mov    edx,DWORD PTR [ecx]
1001b350:	3b cf                	cmp    ecx,edi
1001b352:	0f 95 c0             	setne  al
1001b355:	0f b6 c0             	movzx  eax,al
1001b358:	50                   	push   eax
1001b359:	ff 52 10             	call   DWORD PTR [edx+0x10]
1001b35c:	c7 47 24 00 00 00 00 	mov    DWORD PTR [edi+0x24],0x0
1001b363:	8b ce                	mov    ecx,esi
1001b365:	ff 15 34 28 02 10    	call   DWORD PTR ds:0x10022834
1001b36b:	f6 45 08 01          	test   BYTE PTR [ebp+0x8],0x1
1001b36f:	74 0b                	je     0x1001b37c
1001b371:	6a 58                	push   0x58
1001b373:	56                   	push   esi
1001b374:	e8 3a 19 00 00       	call   0x1001ccb3
1001b379:	83 c4 08             	add    esp,0x8
1001b37c:	5f                   	pop    edi
1001b37d:	8b c6                	mov    eax,esi
1001b37f:	5e                   	pop    esi
1001b380:	5d                   	pop    ebp
1001b381:	c2 04 00             	ret    0x4
1001b384:	cc                   	int3
1001b385:	cc                   	int3
1001b386:	cc                   	int3
1001b387:	cc                   	int3
1001b388:	cc                   	int3
1001b389:	cc                   	int3
1001b38a:	cc                   	int3
1001b38b:	cc                   	int3
1001b38c:	cc                   	int3
1001b38d:	cc                   	int3
1001b38e:	cc                   	int3
1001b38f:	cc                   	int3
1001b390:	55                   	push   ebp
1001b391:	8b ec                	mov    ebp,esp
1001b393:	56                   	push   esi
1001b394:	8b f1                	mov    esi,ecx
1001b396:	e8 95 fe ff ff       	call   0x1001b230
1001b39b:	f6 45 08 01          	test   BYTE PTR [ebp+0x8],0x1
1001b39f:	74 0b                	je     0x1001b3ac
1001b3a1:	6a 78                	push   0x78
1001b3a3:	56                   	push   esi
1001b3a4:	e8 0a 19 00 00       	call   0x1001ccb3
1001b3a9:	83 c4 08             	add    esp,0x8
1001b3ac:	8b c6                	mov    eax,esi
1001b3ae:	5e                   	pop    esi
1001b3af:	5d                   	pop    ebp
1001b3b0:	c2 04 00             	ret    0x4
1001b3b3:	cc                   	int3
1001b3b4:	cc                   	int3
1001b3b5:	cc                   	int3
1001b3b6:	cc                   	int3
1001b3b7:	cc                   	int3
1001b3b8:	cc                   	int3
1001b3b9:	cc                   	int3
1001b3ba:	cc                   	int3
1001b3bb:	cc                   	int3
1001b3bc:	cc                   	int3
1001b3bd:	cc                   	int3
1001b3be:	cc                   	int3
1001b3bf:	cc                   	int3
1001b3c0:	55                   	push   ebp
1001b3c1:	8b ec                	mov    ebp,esp
1001b3c3:	6a ff                	push   0xffffffff
1001b3c5:	68 0f 0e 02 10       	push   0x10020e0f
1001b3ca:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1001b3d0:	50                   	push   eax
1001b3d1:	83 ec 08             	sub    esp,0x8
1001b3d4:	56                   	push   esi
1001b3d5:	57                   	push   edi
1001b3d6:	a1 cc f0 06 10       	mov    eax,ds:0x1006f0cc
1001b3db:	33 c5                	xor    eax,ebp
1001b3dd:	50                   	push   eax
1001b3de:	8d 45 f4             	lea    eax,[ebp-0xc]
1001b3e1:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1001b3e7:	8b f9                	mov    edi,ecx
1001b3e9:	6a 58                	push   0x58
1001b3eb:	e8 8b 18 00 00       	call   0x1001cc7b
1001b3f0:	83 c4 04             	add    esp,0x4
1001b3f3:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
1001b3f6:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1001b3fd:	85 c0                	test   eax,eax
1001b3ff:	74 0c                	je     0x1001b40d
1001b401:	57                   	push   edi
1001b402:	8b c8                	mov    ecx,eax
1001b404:	e8 07 fd ff ff       	call   0x1001b110
1001b409:	8b f0                	mov    esi,eax
1001b40b:	eb 02                	jmp    0x1001b40f
1001b40d:	33 f6                	xor    esi,esi
1001b40f:	8b 4f 24             	mov    ecx,DWORD PTR [edi+0x24]
1001b412:	6a 00                	push   0x0
1001b414:	6a 00                	push   0x0
1001b416:	56                   	push   esi
1001b417:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
1001b41e:	ff 15 20 28 02 10    	call   DWORD PTR ds:0x10022820
1001b424:	8b 4e 1c             	mov    ecx,DWORD PTR [esi+0x1c]
1001b427:	6a 01                	push   0x1
1001b429:	ff 15 f0 28 02 10    	call   DWORD PTR ds:0x100228f0
1001b42f:	56                   	push   esi
1001b430:	57                   	push   edi
1001b431:	6a 00                	push   0x0
1001b433:	ff 35 a8 29 02 10    	push   DWORD PTR ds:0x100229a8
1001b439:	8d 45 f0             	lea    eax,[ebp-0x10]
1001b43c:	ff 76 20             	push   DWORD PTR [esi+0x20]
1001b43f:	50                   	push   eax
1001b440:	e8 cb fa ff ff       	call   0x1001af10
1001b445:	83 c4 18             	add    esp,0x18
1001b448:	8d 4d f0             	lea    ecx,[ebp-0x10]
1001b44b:	ff 15 ac 23 02 10    	call   DWORD PTR ds:0x100223ac
1001b451:	83 7f 4c 00          	cmp    DWORD PTR [edi+0x4c],0x0
1001b455:	74 19                	je     0x1001b470
1001b457:	8b 4f 4c             	mov    ecx,DWORD PTR [edi+0x4c]
1001b45a:	89 75 ec             	mov    DWORD PTR [ebp-0x14],esi
1001b45d:	85 c9                	test   ecx,ecx
1001b45f:	75 06                	jne    0x1001b467
1001b461:	ff 15 94 21 02 10    	call   DWORD PTR ds:0x10022194
1001b467:	8b 01                	mov    eax,DWORD PTR [ecx]
1001b469:	8d 55 ec             	lea    edx,[ebp-0x14]
1001b46c:	52                   	push   edx
1001b46d:	ff 50 08             	call   DWORD PTR [eax+0x8]
1001b470:	8b c6                	mov    eax,esi
1001b472:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1001b475:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1001b47c:	59                   	pop    ecx
1001b47d:	5f                   	pop    edi
1001b47e:	5e                   	pop    esi
1001b47f:	8b e5                	mov    esp,ebp
1001b481:	5d                   	pop    ebp
1001b482:	c3                   	ret
1001b483:	cc                   	int3
1001b484:	cc                   	int3
1001b485:	cc                   	int3
1001b486:	cc                   	int3
1001b487:	cc                   	int3
1001b488:	cc                   	int3
1001b489:	cc                   	int3
1001b48a:	cc                   	int3
1001b48b:	cc                   	int3
1001b48c:	cc                   	int3
1001b48d:	cc                   	int3
1001b48e:	cc                   	int3
1001b48f:	cc                   	int3
1001b490:	55                   	push   ebp
1001b491:	8b ec                	mov    ebp,esp
1001b493:	6a ff                	push   0xffffffff
1001b495:	68 4d 0e 02 10       	push   0x10020e4d
1001b49a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1001b4a0:	50                   	push   eax
1001b4a1:	83 ec 1c             	sub    esp,0x1c
1001b4a4:	56                   	push   esi
1001b4a5:	a1 cc f0 06 10       	mov    eax,ds:0x1006f0cc
1001b4aa:	33 c5                	xor    eax,ebp
1001b4ac:	50                   	push   eax
1001b4ad:	8d 45 f4             	lea    eax,[ebp-0xc]
1001b4b0:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1001b4b6:	8b f1                	mov    esi,ecx
1001b4b8:	8d 4d ec             	lea    ecx,[ebp-0x14]
1001b4bb:	ff 15 3c 24 02 10    	call   DWORD PTR ds:0x1002243c
1001b4c1:	51                   	push   ecx
1001b4c2:	8b d4                	mov    edx,esp
1001b4c4:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1001b4cb:	50                   	push   eax
1001b4cc:	8d 45 f0             	lea    eax,[ebp-0x10]
1001b4cf:	8b ce                	mov    ecx,esi
1001b4d1:	50                   	push   eax
1001b4d2:	c7 02 01 00 00 00    	mov    DWORD PTR [edx],0x1
1001b4d8:	e8 13 fb ff ff       	call   0x1001aff0
1001b4dd:	8d 4d ec             	lea    ecx,[ebp-0x14]
1001b4e0:	c6 45 fc 02          	mov    BYTE PTR [ebp-0x4],0x2
1001b4e4:	ff 15 a4 23 02 10    	call   DWORD PTR ds:0x100223a4
1001b4ea:	8d 45 f0             	lea    eax,[ebp-0x10]
1001b4ed:	50                   	push   eax
1001b4ee:	8d 45 d8             	lea    eax,[ebp-0x28]
1001b4f1:	50                   	push   eax
1001b4f2:	e8 09 93 fe ff       	call   0x10004800
1001b4f7:	8b 75 e4             	mov    esi,DWORD PTR [ebp-0x1c]
1001b4fa:	83 c4 08             	add    esp,0x8
1001b4fd:	85 f6                	test   esi,esi
1001b4ff:	74 31                	je     0x1001b532
1001b501:	8b 55 dc             	mov    edx,DWORD PTR [ebp-0x24]
1001b504:	3b 55 e0             	cmp    edx,DWORD PTR [ebp-0x20]
1001b507:	0f 95 c0             	setne  al
1001b50a:	84 c0                	test   al,al
1001b50c:	74 24                	je     0x1001b532
1001b50e:	8b 0a                	mov    ecx,DWORD PTR [edx]
1001b510:	85 f6                	test   esi,esi
1001b512:	74 10                	je     0x1001b524
1001b514:	85 c9                	test   ecx,ecx
1001b516:	74 0a                	je     0x1001b522
1001b518:	8b 01                	mov    eax,DWORD PTR [ecx]
1001b51a:	6a 01                	push   0x1
1001b51c:	ff 50 0c             	call   DWORD PTR [eax+0xc]
1001b51f:	8b 55 dc             	mov    edx,DWORD PTR [ebp-0x24]
1001b522:	33 f6                	xor    esi,esi
1001b524:	83 c2 04             	add    edx,0x4
1001b527:	83 f6 01             	xor    esi,0x1
1001b52a:	89 55 dc             	mov    DWORD PTR [ebp-0x24],edx
1001b52d:	89 75 e4             	mov    DWORD PTR [ebp-0x1c],esi
1001b530:	75 d2                	jne    0x1001b504
1001b532:	8b 4d d8             	mov    ecx,DWORD PTR [ebp-0x28]
1001b535:	83 ce ff             	or     esi,0xffffffff
1001b538:	c6 45 fc 03          	mov    BYTE PTR [ebp-0x4],0x3
1001b53c:	8b 01                	mov    eax,DWORD PTR [ecx]
1001b53e:	85 c0                	test   eax,eax
1001b540:	74 14                	je     0x1001b556
1001b542:	3b c6                	cmp    eax,esi
1001b544:	74 1a                	je     0x1001b560
1001b546:	8b c6                	mov    eax,esi
1001b548:	f0 0f c1 01          	lock xadd DWORD PTR [ecx],eax
1001b54c:	0f 95 c0             	setne  al
1001b54f:	84 c0                	test   al,al
1001b551:	75 0d                	jne    0x1001b560
1001b553:	8b 4d d8             	mov    ecx,DWORD PTR [ebp-0x28]
1001b556:	51                   	push   ecx
1001b557:	ff 15 7c 23 02 10    	call   DWORD PTR ds:0x1002237c
1001b55d:	83 c4 04             	add    esp,0x4
1001b560:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
1001b563:	c7 45 fc 04 00 00 00 	mov    DWORD PTR [ebp-0x4],0x4
1001b56a:	8b 08                	mov    ecx,DWORD PTR [eax]
1001b56c:	85 c9                	test   ecx,ecx
1001b56e:	74 14                	je     0x1001b584
1001b570:	83 f9 ff             	cmp    ecx,0xffffffff
1001b573:	74 19                	je     0x1001b58e
1001b575:	f0 0f c1 30          	lock xadd DWORD PTR [eax],esi
1001b579:	4e                   	dec    esi
1001b57a:	0f 95 c0             	setne  al
1001b57d:	84 c0                	test   al,al
1001b57f:	75 0d                	jne    0x1001b58e
1001b581:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
1001b584:	50                   	push   eax
1001b585:	ff 15 7c 23 02 10    	call   DWORD PTR ds:0x1002237c
1001b58b:	83 c4 04             	add    esp,0x4
1001b58e:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1001b591:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1001b598:	59                   	pop    ecx
1001b599:	5e                   	pop    esi
1001b59a:	8b e5                	mov    esp,ebp
1001b59c:	5d                   	pop    ebp
1001b59d:	c3                   	ret
1001b59e:	cc                   	int3
1001b59f:	cc                   	int3
1001b5a0:	55                   	push   ebp
1001b5a1:	8b ec                	mov    ebp,esp
1001b5a3:	51                   	push   ecx
1001b5a4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1001b5a7:	83 e8 00             	sub    eax,0x0
1001b5aa:	74 4a                	je     0x1001b5f6
1001b5ac:	83 e8 01             	sub    eax,0x1
1001b5af:	75 57                	jne    0x1001b608
1001b5b1:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
1001b5b4:	56                   	push   esi
1001b5b5:	57                   	push   edi
1001b5b6:	8b 7d 0c             	mov    edi,DWORD PTR [ebp+0xc]
1001b5b9:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
1001b5bc:	8b 4f 08             	mov    ecx,DWORD PTR [edi+0x8]
1001b5bf:	8b 30                	mov    esi,DWORD PTR [eax]
1001b5c1:	83 79 4c 00          	cmp    DWORD PTR [ecx+0x4c],0x0
1001b5c5:	74 23                	je     0x1001b5ea
1001b5c7:	89 75 08             	mov    DWORD PTR [ebp+0x8],esi
1001b5ca:	8b 41 24             	mov    eax,DWORD PTR [ecx+0x24]
1001b5cd:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
1001b5d0:	8b 49 4c             	mov    ecx,DWORD PTR [ecx+0x4c]
1001b5d3:	85 c9                	test   ecx,ecx
1001b5d5:	75 06                	jne    0x1001b5dd
1001b5d7:	ff 15 94 21 02 10    	call   DWORD PTR ds:0x10022194
1001b5dd:	8b 01                	mov    eax,DWORD PTR [ecx]
1001b5df:	8d 55 08             	lea    edx,[ebp+0x8]
1001b5e2:	52                   	push   edx
1001b5e3:	8d 55 fc             	lea    edx,[ebp-0x4]
1001b5e6:	52                   	push   edx
1001b5e7:	ff 50 08             	call   DWORD PTR [eax+0x8]
1001b5ea:	8b 47 08             	mov    eax,DWORD PTR [edi+0x8]
1001b5ed:	5f                   	pop    edi
1001b5ee:	89 70 24             	mov    DWORD PTR [eax+0x24],esi
1001b5f1:	5e                   	pop    esi
1001b5f2:	8b e5                	mov    esp,ebp
1001b5f4:	5d                   	pop    ebp
1001b5f5:	c3                   	ret
1001b5f6:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
1001b5f9:	85 c0                	test   eax,eax
1001b5fb:	74 0b                	je     0x1001b608
1001b5fd:	6a 0c                	push   0xc
1001b5ff:	50                   	push   eax
1001b600:	e8 ae 16 00 00       	call   0x1001ccb3
1001b605:	83 c4 08             	add    esp,0x8
1001b608:	8b e5                	mov    esp,ebp
1001b60a:	5d                   	pop    ebp
1001b60b:	c3                   	ret
1001b60c:	cc                   	int3
1001b60d:	cc                   	int3
1001b60e:	cc                   	int3
1001b60f:	cc                   	int3
1001b610:	55                   	push   ebp
1001b611:	8b ec                	mov    ebp,esp
1001b613:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1001b616:	83 e8 00             	sub    eax,0x0
1001b619:	74 47                	je     0x1001b662
1001b61b:	83 e8 01             	sub    eax,0x1
1001b61e:	75 54                	jne    0x1001b674
1001b620:	56                   	push   esi
1001b621:	8b 75 0c             	mov    esi,DWORD PTR [ebp+0xc]
1001b624:	8b 4e 08             	mov    ecx,DWORD PTR [esi+0x8]
1001b627:	39 41 74             	cmp    DWORD PTR [ecx+0x74],eax
1001b62a:	74 1c                	je     0x1001b648
1001b62c:	8b 46 0c             	mov    eax,DWORD PTR [esi+0xc]
1001b62f:	89 45 08             	mov    DWORD PTR [ebp+0x8],eax
1001b632:	8b 49 74             	mov    ecx,DWORD PTR [ecx+0x74]
1001b635:	85 c9                	test   ecx,ecx
1001b637:	75 06                	jne    0x1001b63f
1001b639:	ff 15 94 21 02 10    	call   DWORD PTR ds:0x10022194
1001b63f:	8b 01                	mov    eax,DWORD PTR [ecx]
1001b641:	8d 55 08             	lea    edx,[ebp+0x8]
1001b644:	52                   	push   edx
1001b645:	ff 50 08             	call   DWORD PTR [eax+0x8]
1001b648:	8b 4e 08             	mov    ecx,DWORD PTR [esi+0x8]
1001b64b:	ff 76 0c             	push   DWORD PTR [esi+0xc]
1001b64e:	8b 49 24             	mov    ecx,DWORD PTR [ecx+0x24]
1001b651:	ff 15 f8 27 02 10    	call   DWORD PTR ds:0x100227f8
1001b657:	8b 4e 0c             	mov    ecx,DWORD PTR [esi+0xc]
1001b65a:	5e                   	pop    esi
1001b65b:	5d                   	pop    ebp
1001b65c:	ff 25 18 23 02 10    	jmp    DWORD PTR ds:0x10022318
1001b662:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
1001b665:	85 c0                	test   eax,eax
1001b667:	74 0b                	je     0x1001b674
1001b669:	6a 10                	push   0x10
1001b66b:	50                   	push   eax
1001b66c:	e8 42 16 00 00       	call   0x1001ccb3
1001b671:	83 c4 08             	add    esp,0x8
1001b674:	5d                   	pop    ebp
1001b675:	c3                   	ret
1001b676:	cc                   	int3
1001b677:	cc                   	int3
1001b678:	cc                   	int3
1001b679:	cc                   	int3
1001b67a:	cc                   	int3
1001b67b:	cc                   	int3
1001b67c:	cc                   	int3
1001b67d:	cc                   	int3
1001b67e:	cc                   	int3
1001b67f:	cc                   	int3
1001b680:	e9 3b fd ff ff       	jmp    0x1001b3c0
; [included 792 instruction/data lines]

