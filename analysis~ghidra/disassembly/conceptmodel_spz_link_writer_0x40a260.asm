
/mnt/data/IS2_RE_Stage2_MVP_2026-11-01/original/IS.exe:     file format pei-i386


Disassembly of section .text:

0040a260 <.text+0x9260>:
  40a260:	55                   	push   ebp
  40a261:	8b ec                	mov    ebp,esp
  40a263:	6a ff                	push   0xffffffff
  40a265:	68 20 6f 41 00       	push   0x416f20
  40a26a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  40a270:	50                   	push   eax
  40a271:	51                   	push   ecx
  40a272:	53                   	push   ebx
  40a273:	56                   	push   esi
  40a274:	57                   	push   edi
  40a275:	a1 cc 90 46 00       	mov    eax,ds:0x4690cc
  40a27a:	33 c5                	xor    eax,ebp
  40a27c:	50                   	push   eax
  40a27d:	8d 45 f4             	lea    eax,[ebp-0xc]
  40a280:	64 a3 00 00 00 00    	mov    fs:0x0,eax
  40a286:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
  40a28d:	8b 5d 0c             	mov    ebx,DWORD PTR [ebp+0xc]
  40a290:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
  40a293:	53                   	push   ebx
  40a294:	56                   	push   esi
  40a295:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
  40a29c:	e8 7f fe ff ff       	call   0x40a120
  40a2a1:	8b 3d a8 93 41 00    	mov    edi,DWORD PTR ds:0x4193a8
  40a2a7:	6a 04                	push   0x4
  40a2a9:	68 34 7b 45 00       	push   0x457b34
  40a2ae:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
  40a2b5:	c7 45 f0 01 00 00 00 	mov    DWORD PTR [ebp-0x10],0x1
  40a2bc:	ff d7                	call   edi
  40a2be:	83 c4 10             	add    esp,0x10
  40a2c1:	89 45 0c             	mov    DWORD PTR [ebp+0xc],eax
  40a2c4:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
  40a2c7:	8b ce                	mov    ecx,esi
  40a2c9:	8b 35 4c 9b 41 00    	mov    esi,DWORD PTR ds:0x419b4c
  40a2cf:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [ebp-0x4],0x1
  40a2d6:	8b 80 80 00 00 00    	mov    eax,DWORD PTR [eax+0x80]
  40a2dc:	99                   	cdq
  40a2dd:	52                   	push   edx
  40a2de:	50                   	push   eax
  40a2df:	8d 45 0c             	lea    eax,[ebp+0xc]
  40a2e2:	50                   	push   eax
  40a2e3:	ff d6                	call   esi
  40a2e5:	8d 4d 0c             	lea    ecx,[ebp+0xc]
  40a2e8:	c6 45 fc 00          	mov    BYTE PTR [ebp-0x4],0x0
  40a2ec:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40a2f2:	6a 06                	push   0x6
  40a2f4:	68 3c 7b 45 00       	push   0x457b3c
  40a2f9:	ff d7                	call   edi
  40a2fb:	83 c4 08             	add    esp,0x8
  40a2fe:	89 45 0c             	mov    DWORD PTR [ebp+0xc],eax
  40a301:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
  40a304:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  40a307:	c7 45 fc 02 00 00 00 	mov    DWORD PTR [ebp-0x4],0x2
  40a30e:	8b 80 84 00 00 00    	mov    eax,DWORD PTR [eax+0x84]
  40a314:	99                   	cdq
  40a315:	52                   	push   edx
  40a316:	50                   	push   eax
  40a317:	8d 45 0c             	lea    eax,[ebp+0xc]
  40a31a:	50                   	push   eax
  40a31b:	ff d6                	call   esi
  40a31d:	8d 4d 0c             	lea    ecx,[ebp+0xc]
  40a320:	c6 45 fc 00          	mov    BYTE PTR [ebp-0x4],0x0
  40a324:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40a32a:	6a 0d                	push   0xd
  40a32c:	68 44 7b 45 00       	push   0x457b44
  40a331:	ff d7                	call   edi
  40a333:	83 c4 08             	add    esp,0x8
  40a336:	89 45 0c             	mov    DWORD PTR [ebp+0xc],eax
  40a339:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
  40a33c:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  40a33f:	c7 45 fc 03 00 00 00 	mov    DWORD PTR [ebp-0x4],0x3
  40a346:	8b 80 88 00 00 00    	mov    eax,DWORD PTR [eax+0x88]
  40a34c:	99                   	cdq
  40a34d:	52                   	push   edx
  40a34e:	50                   	push   eax
  40a34f:	8d 45 0c             	lea    eax,[ebp+0xc]
  40a352:	50                   	push   eax
  40a353:	ff d6                	call   esi
  40a355:	8d 4d 0c             	lea    ecx,[ebp+0xc]
  40a358:	c6 45 fc 00          	mov    BYTE PTR [ebp-0x4],0x0
  40a35c:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40a362:	6a 05                	push   0x5
  40a364:	68 54 7b 45 00       	push   0x457b54
  40a369:	ff d7                	call   edi
  40a36b:	83 c4 08             	add    esp,0x8
  40a36e:	89 45 0c             	mov    DWORD PTR [ebp+0xc],eax
  40a371:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
  40a374:	c7 45 fc 04 00 00 00 	mov    DWORD PTR [ebp-0x4],0x4
  40a37b:	8b 40 50             	mov    eax,DWORD PTR [eax+0x50]
  40a37e:	99                   	cdq
  40a37f:	52                   	push   edx
  40a380:	50                   	push   eax
  40a381:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  40a384:	8d 45 0c             	lea    eax,[ebp+0xc]
  40a387:	50                   	push   eax
  40a388:	ff d6                	call   esi
  40a38a:	8d 4d 0c             	lea    ecx,[ebp+0xc]
  40a38d:	c6 45 fc 00          	mov    BYTE PTR [ebp-0x4],0x0
  40a391:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40a397:	6a 06                	push   0x6
  40a399:	68 ec 7a 45 00       	push   0x457aec
  40a39e:	ff d7                	call   edi
  40a3a0:	83 c4 08             	add    esp,0x8
  40a3a3:	89 45 0c             	mov    DWORD PTR [ebp+0xc],eax
  40a3a6:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
  40a3a9:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  40a3ac:	c7 45 fc 05 00 00 00 	mov    DWORD PTR [ebp-0x4],0x5
  40a3b3:	8b 40 54             	mov    eax,DWORD PTR [eax+0x54]
  40a3b6:	99                   	cdq
  40a3b7:	52                   	push   edx
  40a3b8:	50                   	push   eax
  40a3b9:	8d 45 0c             	lea    eax,[ebp+0xc]
  40a3bc:	50                   	push   eax
  40a3bd:	ff d6                	call   esi
  40a3bf:	8d 4d 0c             	lea    ecx,[ebp+0xc]
  40a3c2:	c6 45 fc 00          	mov    BYTE PTR [ebp-0x4],0x0
  40a3c6:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40a3cc:	6a 06                	push   0x6
  40a3ce:	68 5c 7b 45 00       	push   0x457b5c
  40a3d3:	ff d7                	call   edi
  40a3d5:	83 c4 08             	add    esp,0x8
  40a3d8:	89 45 0c             	mov    DWORD PTR [ebp+0xc],eax
  40a3db:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
  40a3de:	8b 7d 08             	mov    edi,DWORD PTR [ebp+0x8]
  40a3e1:	8b cf                	mov    ecx,edi
  40a3e3:	c7 45 fc 06 00 00 00 	mov    DWORD PTR [ebp-0x4],0x6
  40a3ea:	0f b7 40 58          	movzx  eax,WORD PTR [eax+0x58]
  40a3ee:	99                   	cdq
  40a3ef:	52                   	push   edx
  40a3f0:	50                   	push   eax
  40a3f1:	8d 45 0c             	lea    eax,[ebp+0xc]
  40a3f4:	50                   	push   eax
  40a3f5:	ff d6                	call   esi
  40a3f7:	8d 4d 0c             	lea    ecx,[ebp+0xc]
  40a3fa:	c6 45 fc 00          	mov    BYTE PTR [ebp-0x4],0x0
  40a3fe:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40a404:	8b 4b 04             	mov    ecx,DWORD PTR [ebx+0x4]
  40a407:	8d 45 0c             	lea    eax,[ebp+0xc]
  40a40a:	50                   	push   eax
  40a40b:	89 7d 0c             	mov    DWORD PTR [ebp+0xc],edi
  40a40e:	ff b1 90 00 00 00    	push   DWORD PTR [ecx+0x90]
  40a414:	ff b1 8c 00 00 00    	push   DWORD PTR [ecx+0x8c]
  40a41a:	e8 b1 95 ff ff       	call   0x4039d0
  40a41f:	83 c4 0c             	add    esp,0xc
  40a422:	8b c7                	mov    eax,edi
  40a424:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
  40a427:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  40a42e:	59                   	pop    ecx
  40a42f:	5f                   	pop    edi
  40a430:	5e                   	pop    esi
  40a431:	5b                   	pop    ebx
  40a432:	8b e5                	mov    esp,ebp
  40a434:	5d                   	pop    ebp
  40a435:	c3                   	ret
  40a436:	cc                   	int3
  40a437:	cc                   	int3
  40a438:	cc                   	int3
  40a439:	cc                   	int3
  40a43a:	cc                   	int3
  40a43b:	cc                   	int3
  40a43c:	cc                   	int3
  40a43d:	cc                   	int3
  40a43e:	cc                   	int3
  40a43f:	cc                   	int3
