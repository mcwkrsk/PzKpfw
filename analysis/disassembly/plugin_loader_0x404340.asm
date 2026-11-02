
/mnt/data/is2_re_analysis_kit_stage1_17_continuation_2026-11-01/original/is.exe:     file format pei-i386


disassembly of section .text:

00404340 <.text+0x3340>:
  404340:	55                   	push   ebp
  404341:	8b ec                	mov    ebp,esp
  404343:	6a ff                	push   0xffffffff
  404345:	68 6f 5d 41 00       	push   0x415d6f
  40434a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  404350:	50                   	push   eax
  404351:	83 ec 40             	sub    esp,0x40
  404354:	53                   	push   ebx
  404355:	56                   	push   esi
  404356:	57                   	push   edi
  404357:	a1 cc 90 46 00       	mov    eax,ds:0x4690cc
  40435c:	33 c5                	xor    eax,ebp
  40435e:	50                   	push   eax
  40435f:	8d 45 f4             	lea    eax,[ebp-0xc]
  404362:	64 a3 00 00 00 00    	mov    fs:0x0,eax
  404368:	8b 15 b4 96 46 00    	mov    edx,dword ptr ds:0x4696b4
  40436e:	c7 45 fc 01 00 00 00 	mov    dword ptr [ebp-0x4],0x1
  404375:	8b 4a 04             	mov    ecx,dword ptr [edx+0x4]
  404378:	8b 42 0c             	mov    eax,dword ptr [edx+0xc]
  40437b:	8b 72 0c             	mov    esi,dword ptr [edx+0xc]
  40437e:	03 f2                	add    esi,edx
  404380:	8d 3c 88             	lea    edi,[eax+ecx*4]
  404383:	03 fa                	add    edi,edx
  404385:	3b f7                	cmp    esi,edi
  404387:	74 20                	je     0x4043a9
  404389:	8b 1d b8 93 41 00    	mov    ebx,dword ptr ds:0x4193b8
  40438f:	90                   	nop
  404390:	8d 45 08             	lea    eax,[ebp+0x8]
  404393:	50                   	push   eax
  404394:	56                   	push   esi
  404395:	ff d3                	call   ebx
  404397:	83 c4 08             	add    esp,0x8
  40439a:	84 c0                	test   al,al
  40439c:	0f 85 b9 01 00 00    	jne    0x40455b
  4043a2:	83 c6 04             	add    esi,0x4
  4043a5:	3b f7                	cmp    esi,edi
  4043a7:	75 e7                	jne    0x404390
  4043a9:	8d 45 e4             	lea    eax,[ebp-0x1c]
  4043ac:	50                   	push   eax
  4043ad:	ff 15 f4 92 41 00    	call   dword ptr ds:0x4192f4
  4043b3:	68 88 7a 45 00       	push   0x457a88
  4043b8:	50                   	push   eax
  4043b9:	8d 45 f0             	lea    eax,[ebp-0x10]
  4043bc:	c6 45 fc 04          	mov    byte ptr [ebp-0x4],0x4
  4043c0:	50                   	push   eax
  4043c1:	e8 2a d1 ff ff       	call   0x4014f0
  4043c6:	83 c4 10             	add    esp,0x10
  4043c9:	50                   	push   eax
  4043ca:	8d 4d e8             	lea    ecx,[ebp-0x18]
  4043cd:	c6 45 fc 05          	mov    byte ptr [ebp-0x4],0x5
  4043d1:	ff 15 98 92 41 00    	call   dword ptr ds:0x419298
  4043d7:	8d 4d f0             	lea    ecx,[ebp-0x10]
  4043da:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  4043e0:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  4043e3:	c6 45 fc 08          	mov    byte ptr [ebp-0x4],0x8
  4043e7:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  4043ed:	8d 45 dc             	lea    eax,[ebp-0x24]
  4043f0:	50                   	push   eax
  4043f1:	8d 4d e8             	lea    ecx,[ebp-0x18]
  4043f4:	ff 15 90 92 41 00    	call   dword ptr ds:0x419290
  4043fa:	68 94 7a 45 00       	push   0x457a94
  4043ff:	50                   	push   eax
  404400:	8d 45 e0             	lea    eax,[ebp-0x20]
  404403:	c6 45 fc 09          	mov    byte ptr [ebp-0x4],0x9
  404407:	50                   	push   eax
  404408:	e8 e3 d0 ff ff       	call   0x4014f0
  40440d:	8d 4d 08             	lea    ecx,[ebp+0x8]
  404410:	c6 45 fc 0a          	mov    byte ptr [ebp-0x4],0xa
  404414:	51                   	push   ecx
  404415:	50                   	push   eax
  404416:	8d 45 ec             	lea    eax,[ebp-0x14]
  404419:	50                   	push   eax
  40441a:	e8 61 d0 ff ff       	call   0x401480
  40441f:	83 c4 18             	add    esp,0x18
  404422:	8d 4d e0             	lea    ecx,[ebp-0x20]
  404425:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  40442b:	8d 4d dc             	lea    ecx,[ebp-0x24]
  40442e:	c6 45 fc 0d          	mov    byte ptr [ebp-0x4],0xd
  404432:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  404438:	6a 00                	push   0x0
  40443a:	8d 45 ec             	lea    eax,[ebp-0x14]
  40443d:	50                   	push   eax
  40443e:	8d 4d b4             	lea    ecx,[ebp-0x4c]
  404441:	ff 15 a4 92 41 00    	call   dword ptr ds:0x4192a4
  404447:	68 98 7a 45 00       	push   0x457a98
  40444c:	8d 4d b4             	lea    ecx,[ebp-0x4c]
  40444f:	c6 45 fc 0e          	mov    byte ptr [ebp-0x4],0xe
  404453:	ff 15 9c 92 41 00    	call   dword ptr ds:0x41929c
  404459:	85 c0                	test   eax,eax
  40445b:	0f 84 57 01 00 00    	je     0x4045b8
  404461:	ff d0                	call   eax
  404463:	8b f8                	mov    edi,eax
  404465:	8b cf                	mov    ecx,edi
  404467:	89 7d dc             	mov    dword ptr [ebp-0x24],edi
  40446a:	8b 07                	mov    eax,dword ptr [edi]
  40446c:	ff 50 08             	call   dword ptr [eax+0x8]
  40446f:	89 47 04             	mov    dword ptr [edi+0x4],eax
  404472:	8b cf                	mov    ecx,edi
  404474:	8b 07                	mov    eax,dword ptr [edi]
  404476:	ff 50 04             	call   dword ptr [eax+0x4]
  404479:	8b 07                	mov    eax,dword ptr [edi]
  40447b:	8b cf                	mov    ecx,edi
  40447d:	ff 10                	call   dword ptr [eax]
  40447f:	8d 45 f0             	lea    eax,[ebp-0x10]
  404482:	8b cf                	mov    ecx,edi
  404484:	50                   	push   eax
  404485:	e8 96 fe ff ff       	call   0x404320
  40448a:	8d 45 f0             	lea    eax,[ebp-0x10]
  40448d:	c6 45 fc 0f          	mov    byte ptr [ebp-0x4],0xf
  404491:	50                   	push   eax
  404492:	8d 45 cc             	lea    eax,[ebp-0x34]
  404495:	50                   	push   eax
  404496:	e8 35 f6 ff ff       	call   0x403ad0
  40449b:	83 c4 08             	add    esp,0x8
  40449e:	8b 55 d8             	mov    edx,dword ptr [ebp-0x28]
  4044a1:	c6 45 fc 10          	mov    byte ptr [ebp-0x4],0x10
  4044a5:	85 d2                	test   edx,edx
  4044a7:	74 39                	je     0x4044e2
  4044a9:	8b 4d d0             	mov    ecx,dword ptr [ebp-0x30]
  4044ac:	0f 1f 40 00          	nop    dword ptr [eax+0x0]
  4044b0:	3b 4d d4             	cmp    ecx,dword ptr [ebp-0x2c]
  4044b3:	0f 95 c0             	setne  al
  4044b6:	84 c0                	test   al,al
  4044b8:	74 28                	je     0x4044e2
  4044ba:	8b 31                	mov    esi,dword ptr [ecx]
  4044bc:	85 d2                	test   edx,edx
  4044be:	74 14                	je     0x4044d4
  4044c0:	8b 0d a8 96 46 00    	mov    ecx,dword ptr ds:0x4696a8
  4044c6:	56                   	push   esi
  4044c7:	e8 44 c6 00 00       	call   0x410b10
  4044cc:	89 7e 18             	mov    dword ptr [esi+0x18],edi
  4044cf:	33 d2                	xor    edx,edx
  4044d1:	8b 4d d0             	mov    ecx,dword ptr [ebp-0x30]
  4044d4:	83 c1 04             	add    ecx,0x4
  4044d7:	83 f2 01             	xor    edx,0x1
  4044da:	89 4d d0             	mov    dword ptr [ebp-0x30],ecx
  4044dd:	89 55 d8             	mov    dword ptr [ebp-0x28],edx
  4044e0:	75 ce                	jne    0x4044b0
  4044e2:	8b 4d cc             	mov    ecx,dword ptr [ebp-0x34]
  4044e5:	83 ce ff             	or     esi,0xffffffff
  4044e8:	8b 1d 98 93 41 00    	mov    ebx,dword ptr ds:0x419398
  4044ee:	c6 45 fc 11          	mov    byte ptr [ebp-0x4],0x11
  4044f2:	8b 01                	mov    eax,dword ptr [ecx]
  4044f4:	85 c0                	test   eax,eax
  4044f6:	74 14                	je     0x40450c
  4044f8:	3b c6                	cmp    eax,esi
  4044fa:	74 16                	je     0x404512
  4044fc:	8b c6                	mov    eax,esi
  4044fe:	f0 0f c1 01          	lock xadd dword ptr [ecx],eax
  404502:	0f 95 c0             	setne  al
  404505:	84 c0                	test   al,al
  404507:	75 09                	jne    0x404512
  404509:	8b 4d cc             	mov    ecx,dword ptr [ebp-0x34]
  40450c:	51                   	push   ecx
  40450d:	ff d3                	call   ebx
  40450f:	83 c4 04             	add    esp,0x4
  404512:	8d 45 dc             	lea    eax,[ebp-0x24]
  404515:	c6 45 fc 0f          	mov    byte ptr [ebp-0x4],0xf
  404519:	50                   	push   eax
  40451a:	b9 b8 96 46 00       	mov    ecx,0x4696b8
  40451f:	e8 2c 07 00 00       	call   0x404c50
  404524:	8d 45 08             	lea    eax,[ebp+0x8]
  404527:	b9 b4 96 46 00       	mov    ecx,0x4696b4
  40452c:	50                   	push   eax
  40452d:	e8 9e 07 00 00       	call   0x404cd0
  404532:	8b 45 f0             	mov    eax,dword ptr [ebp-0x10]
  404535:	c6 45 fc 12          	mov    byte ptr [ebp-0x4],0x12
  404539:	8b 08                	mov    ecx,dword ptr [eax]
  40453b:	85 c9                	test   ecx,ecx
  40453d:	74 14                	je     0x404553
  40453f:	83 f9 ff             	cmp    ecx,0xffffffff
  404542:	74 76                	je     0x4045ba
  404544:	f0 0f c1 30          	lock xadd dword ptr [eax],esi
  404548:	4e                   	dec    esi
  404549:	0f 95 c0             	setne  al
  40454c:	84 c0                	test   al,al
  40454e:	75 6a                	jne    0x4045ba
  404550:	8b 45 f0             	mov    eax,dword ptr [ebp-0x10]
  404553:	50                   	push   eax
  404554:	ff d3                	call   ebx
  404556:	83 c4 04             	add    esp,0x4
  404559:	eb 5f                	jmp    0x4045ba
  40455b:	3b f7                	cmp    esi,edi
  40455d:	0f 84 46 fe ff ff    	je     0x4043a9
  404563:	6a 00                	push   0x0
  404565:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  404568:	ff 15 50 9a 41 00    	call   dword ptr ds:0x419a50
  40456e:	68 74 7a 45 00       	push   0x457a74
  404573:	8d 45 08             	lea    eax,[ebp+0x8]
  404576:	c6 45 fc 02          	mov    byte ptr [ebp-0x4],0x2
  40457a:	50                   	push   eax
  40457b:	8d 45 f0             	lea    eax,[ebp-0x10]
  40457e:	50                   	push   eax
  40457f:	e8 6c cf ff ff       	call   0x4014f0
  404584:	83 c4 0c             	add    esp,0xc
  404587:	50                   	push   eax
  404588:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  40458b:	c6 45 fc 03          	mov    byte ptr [ebp-0x4],0x3
  40458f:	ff 15 3c 9a 41 00    	call   dword ptr ds:0x419a3c
  404595:	8d 4d f0             	lea    ecx,[ebp-0x10]
  404598:	c6 45 fc 02          	mov    byte ptr [ebp-0x4],0x2
  40459c:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  4045a2:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  4045a5:	ff 15 54 9a 41 00    	call   dword ptr ds:0x419a54
  4045ab:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  4045ae:	ff 15 4c 9a 41 00    	call   dword ptr ds:0x419a4c
  4045b4:	33 ff                	xor    edi,edi
  4045b6:	eb 1d                	jmp    0x4045d5
  4045b8:	33 ff                	xor    edi,edi
  4045ba:	8d 4d b4             	lea    ecx,[ebp-0x4c]
  4045bd:	ff 15 a0 92 41 00    	call   dword ptr ds:0x4192a0
  4045c3:	8d 4d ec             	lea    ecx,[ebp-0x14]
  4045c6:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  4045cc:	8d 4d e8             	lea    ecx,[ebp-0x18]
  4045cf:	ff 15 94 92 41 00    	call   dword ptr ds:0x419294
  4045d5:	8d 4d 08             	lea    ecx,[ebp+0x8]
  4045d8:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  4045de:	8d 4d 0c             	lea    ecx,[ebp+0xc]
  4045e1:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  4045e7:	8b c7                	mov    eax,edi
  4045e9:	8b 4d f4             	mov    ecx,dword ptr [ebp-0xc]
  4045ec:	64 89 0d 00 00 00 00 	mov    dword ptr fs:0x0,ecx
  4045f3:	59                   	pop    ecx
  4045f4:	5f                   	pop    edi
  4045f5:	5e                   	pop    esi
  4045f6:	5b                   	pop    ebx
  4045f7:	8b e5                	mov    esp,ebp
  4045f9:	5d                   	pop    ebp
