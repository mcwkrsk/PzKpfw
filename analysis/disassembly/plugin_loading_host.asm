### IS.exe loader: 0x00404340-0x004045fa

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/IS.exe:     file format pei-i386


Disassembly of section .text:

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
  404368:	8b 15 b4 96 46 00    	mov    edx,DWORD PTR ds:0x4696b4
  40436e:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [ebp-0x4],0x1
  404375:	8b 4a 04             	mov    ecx,DWORD PTR [edx+0x4]
  404378:	8b 42 0c             	mov    eax,DWORD PTR [edx+0xc]
  40437b:	8b 72 0c             	mov    esi,DWORD PTR [edx+0xc]
  40437e:	03 f2                	add    esi,edx
  404380:	8d 3c 88             	lea    edi,[eax+ecx*4]
  404383:	03 fa                	add    edi,edx
  404385:	3b f7                	cmp    esi,edi
  404387:	74 20                	je     0x4043a9
  404389:	8b 1d b8 93 41 00    	mov    ebx,DWORD PTR ds:0x4193b8
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
  4043ad:	ff 15 f4 92 41 00    	call   DWORD PTR ds:0x4192f4
  4043b3:	68 88 7a 45 00       	push   0x457a88
  4043b8:	50                   	push   eax
  4043b9:	8d 45 f0             	lea    eax,[ebp-0x10]
  4043bc:	c6 45 fc 04          	mov    BYTE PTR [ebp-0x4],0x4
  4043c0:	50                   	push   eax
  4043c1:	e8 2a d1 ff ff       	call   0x4014f0
  4043c6:	83 c4 10             	add    esp,0x10
  4043c9:	50                   	push   eax
  4043ca:	8d 4d e8             	lea    ecx,[ebp-0x18]
  4043cd:	c6 45 fc 05          	mov    BYTE PTR [ebp-0x4],0x5
  4043d1:	ff 15 98 92 41 00    	call   DWORD PTR ds:0x419298
  4043d7:	8d 4d f0             	lea    ecx,[ebp-0x10]
  4043da:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  4043e0:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  4043e3:	c6 45 fc 08          	mov    BYTE PTR [ebp-0x4],0x8
  4043e7:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  4043ed:	8d 45 dc             	lea    eax,[ebp-0x24]
  4043f0:	50                   	push   eax
  4043f1:	8d 4d e8             	lea    ecx,[ebp-0x18]
  4043f4:	ff 15 90 92 41 00    	call   DWORD PTR ds:0x419290
  4043fa:	68 94 7a 45 00       	push   0x457a94
  4043ff:	50                   	push   eax
  404400:	8d 45 e0             	lea    eax,[ebp-0x20]
  404403:	c6 45 fc 09          	mov    BYTE PTR [ebp-0x4],0x9
  404407:	50                   	push   eax
  404408:	e8 e3 d0 ff ff       	call   0x4014f0
  40440d:	8d 4d 08             	lea    ecx,[ebp+0x8]
  404410:	c6 45 fc 0a          	mov    BYTE PTR [ebp-0x4],0xa
  404414:	51                   	push   ecx
  404415:	50                   	push   eax
  404416:	8d 45 ec             	lea    eax,[ebp-0x14]
  404419:	50                   	push   eax
  40441a:	e8 61 d0 ff ff       	call   0x401480
  40441f:	83 c4 18             	add    esp,0x18
  404422:	8d 4d e0             	lea    ecx,[ebp-0x20]
  404425:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40442b:	8d 4d dc             	lea    ecx,[ebp-0x24]
  40442e:	c6 45 fc 0d          	mov    BYTE PTR [ebp-0x4],0xd
  404432:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  404438:	6a 00                	push   0x0
  40443a:	8d 45 ec             	lea    eax,[ebp-0x14]
  40443d:	50                   	push   eax
  40443e:	8d 4d b4             	lea    ecx,[ebp-0x4c]
  404441:	ff 15 a4 92 41 00    	call   DWORD PTR ds:0x4192a4
  404447:	68 98 7a 45 00       	push   0x457a98
  40444c:	8d 4d b4             	lea    ecx,[ebp-0x4c]
  40444f:	c6 45 fc 0e          	mov    BYTE PTR [ebp-0x4],0xe
  404453:	ff 15 9c 92 41 00    	call   DWORD PTR ds:0x41929c
  404459:	85 c0                	test   eax,eax
  40445b:	0f 84 57 01 00 00    	je     0x4045b8
  404461:	ff d0                	call   eax
  404463:	8b f8                	mov    edi,eax
  404465:	8b cf                	mov    ecx,edi
  404467:	89 7d dc             	mov    DWORD PTR [ebp-0x24],edi
  40446a:	8b 07                	mov    eax,DWORD PTR [edi]
  40446c:	ff 50 08             	call   DWORD PTR [eax+0x8]
  40446f:	89 47 04             	mov    DWORD PTR [edi+0x4],eax
  404472:	8b cf                	mov    ecx,edi
  404474:	8b 07                	mov    eax,DWORD PTR [edi]
  404476:	ff 50 04             	call   DWORD PTR [eax+0x4]
  404479:	8b 07                	mov    eax,DWORD PTR [edi]
  40447b:	8b cf                	mov    ecx,edi
  40447d:	ff 10                	call   DWORD PTR [eax]
  40447f:	8d 45 f0             	lea    eax,[ebp-0x10]
  404482:	8b cf                	mov    ecx,edi
  404484:	50                   	push   eax
  404485:	e8 96 fe ff ff       	call   0x404320
  40448a:	8d 45 f0             	lea    eax,[ebp-0x10]
  40448d:	c6 45 fc 0f          	mov    BYTE PTR [ebp-0x4],0xf
  404491:	50                   	push   eax
  404492:	8d 45 cc             	lea    eax,[ebp-0x34]
  404495:	50                   	push   eax
  404496:	e8 35 f6 ff ff       	call   0x403ad0
  40449b:	83 c4 08             	add    esp,0x8
  40449e:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
  4044a1:	c6 45 fc 10          	mov    BYTE PTR [ebp-0x4],0x10
  4044a5:	85 d2                	test   edx,edx
  4044a7:	74 39                	je     0x4044e2
  4044a9:	8b 4d d0             	mov    ecx,DWORD PTR [ebp-0x30]
  4044ac:	0f 1f 40 00          	nop    DWORD PTR [eax+0x0]
  4044b0:	3b 4d d4             	cmp    ecx,DWORD PTR [ebp-0x2c]
  4044b3:	0f 95 c0             	setne  al
  4044b6:	84 c0                	test   al,al
  4044b8:	74 28                	je     0x4044e2
  4044ba:	8b 31                	mov    esi,DWORD PTR [ecx]
  4044bc:	85 d2                	test   edx,edx
  4044be:	74 14                	je     0x4044d4
  4044c0:	8b 0d a8 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a8
  4044c6:	56                   	push   esi
  4044c7:	e8 44 c6 00 00       	call   0x410b10
  4044cc:	89 7e 18             	mov    DWORD PTR [esi+0x18],edi
  4044cf:	33 d2                	xor    edx,edx
  4044d1:	8b 4d d0             	mov    ecx,DWORD PTR [ebp-0x30]
  4044d4:	83 c1 04             	add    ecx,0x4
  4044d7:	83 f2 01             	xor    edx,0x1
  4044da:	89 4d d0             	mov    DWORD PTR [ebp-0x30],ecx
  4044dd:	89 55 d8             	mov    DWORD PTR [ebp-0x28],edx
  4044e0:	75 ce                	jne    0x4044b0
  4044e2:	8b 4d cc             	mov    ecx,DWORD PTR [ebp-0x34]
  4044e5:	83 ce ff             	or     esi,0xffffffff
  4044e8:	8b 1d 98 93 41 00    	mov    ebx,DWORD PTR ds:0x419398
  4044ee:	c6 45 fc 11          	mov    BYTE PTR [ebp-0x4],0x11
  4044f2:	8b 01                	mov    eax,DWORD PTR [ecx]
  4044f4:	85 c0                	test   eax,eax
  4044f6:	74 14                	je     0x40450c
  4044f8:	3b c6                	cmp    eax,esi
  4044fa:	74 16                	je     0x404512
  4044fc:	8b c6                	mov    eax,esi
  4044fe:	f0 0f c1 01          	lock xadd DWORD PTR [ecx],eax
  404502:	0f 95 c0             	setne  al
  404505:	84 c0                	test   al,al
  404507:	75 09                	jne    0x404512
  404509:	8b 4d cc             	mov    ecx,DWORD PTR [ebp-0x34]
  40450c:	51                   	push   ecx
  40450d:	ff d3                	call   ebx
  40450f:	83 c4 04             	add    esp,0x4
  404512:	8d 45 dc             	lea    eax,[ebp-0x24]
  404515:	c6 45 fc 0f          	mov    BYTE PTR [ebp-0x4],0xf
  404519:	50                   	push   eax
  40451a:	b9 b8 96 46 00       	mov    ecx,0x4696b8
  40451f:	e8 2c 07 00 00       	call   0x404c50
  404524:	8d 45 08             	lea    eax,[ebp+0x8]
  404527:	b9 b4 96 46 00       	mov    ecx,0x4696b4
  40452c:	50                   	push   eax
  40452d:	e8 9e 07 00 00       	call   0x404cd0
  404532:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
  404535:	c6 45 fc 12          	mov    BYTE PTR [ebp-0x4],0x12
  404539:	8b 08                	mov    ecx,DWORD PTR [eax]
  40453b:	85 c9                	test   ecx,ecx
  40453d:	74 14                	je     0x404553
  40453f:	83 f9 ff             	cmp    ecx,0xffffffff
  404542:	74 76                	je     0x4045ba
  404544:	f0 0f c1 30          	lock xadd DWORD PTR [eax],esi
  404548:	4e                   	dec    esi
  404549:	0f 95 c0             	setne  al
  40454c:	84 c0                	test   al,al
  40454e:	75 6a                	jne    0x4045ba
  404550:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
  404553:	50                   	push   eax
  404554:	ff d3                	call   ebx
  404556:	83 c4 04             	add    esp,0x4
  404559:	eb 5f                	jmp    0x4045ba
  40455b:	3b f7                	cmp    esi,edi
  40455d:	0f 84 46 fe ff ff    	je     0x4043a9
  404563:	6a 00                	push   0x0
  404565:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  404568:	ff 15 50 9a 41 00    	call   DWORD PTR ds:0x419a50
  40456e:	68 74 7a 45 00       	push   0x457a74
  404573:	8d 45 08             	lea    eax,[ebp+0x8]
  404576:	c6 45 fc 02          	mov    BYTE PTR [ebp-0x4],0x2
  40457a:	50                   	push   eax
  40457b:	8d 45 f0             	lea    eax,[ebp-0x10]
  40457e:	50                   	push   eax
  40457f:	e8 6c cf ff ff       	call   0x4014f0
  404584:	83 c4 0c             	add    esp,0xc
  404587:	50                   	push   eax
  404588:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  40458b:	c6 45 fc 03          	mov    BYTE PTR [ebp-0x4],0x3
  40458f:	ff 15 3c 9a 41 00    	call   DWORD PTR ds:0x419a3c
  404595:	8d 4d f0             	lea    ecx,[ebp-0x10]
  404598:	c6 45 fc 02          	mov    BYTE PTR [ebp-0x4],0x2
  40459c:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  4045a2:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  4045a5:	ff 15 54 9a 41 00    	call   DWORD PTR ds:0x419a54
  4045ab:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  4045ae:	ff 15 4c 9a 41 00    	call   DWORD PTR ds:0x419a4c
  4045b4:	33 ff                	xor    edi,edi
  4045b6:	eb 1d                	jmp    0x4045d5
  4045b8:	33 ff                	xor    edi,edi
  4045ba:	8d 4d b4             	lea    ecx,[ebp-0x4c]
  4045bd:	ff 15 a0 92 41 00    	call   DWORD PTR ds:0x4192a0
  4045c3:	8d 4d ec             	lea    ecx,[ebp-0x14]
  4045c6:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  4045cc:	8d 4d e8             	lea    ecx,[ebp-0x18]
  4045cf:	ff 15 94 92 41 00    	call   DWORD PTR ds:0x419294
  4045d5:	8d 4d 08             	lea    ecx,[ebp+0x8]
  4045d8:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  4045de:	8d 4d 0c             	lea    ecx,[ebp+0xc]
  4045e1:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  4045e7:	8b c7                	mov    eax,edi
  4045e9:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
  4045ec:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  4045f3:	59                   	pop    ecx
  4045f4:	5f                   	pop    edi
  4045f5:	5e                   	pop    esi
  4045f6:	5b                   	pop    ebx
  4045f7:	8b e5                	mov    esp,ebp
  4045f9:	5d                   	pop    ebp
  4045fa:	c3                   	ret

### IS.exe configuration-driven caller: 0x00406f20-0x004071bc

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/IS.exe:     file format pei-i386


Disassembly of section .text:

00406f20 <.text+0x5f20>:
  406f20:	55                   	push   ebp
  406f21:	8b ec                	mov    ebp,esp
  406f23:	6a ff                	push   0xffffffff
  406f25:	68 89 64 41 00       	push   0x416489
  406f2a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  406f30:	50                   	push   eax
  406f31:	83 ec 40             	sub    esp,0x40
  406f34:	53                   	push   ebx
  406f35:	56                   	push   esi
  406f36:	57                   	push   edi
  406f37:	a1 cc 90 46 00       	mov    eax,ds:0x4690cc
  406f3c:	33 c5                	xor    eax,ebp
  406f3e:	50                   	push   eax
  406f3f:	8d 45 f4             	lea    eax,[ebp-0xc]
  406f42:	64 a3 00 00 00 00    	mov    fs:0x0,eax
  406f48:	8d 45 d8             	lea    eax,[ebp-0x28]
  406f4b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
  406f52:	50                   	push   eax
  406f53:	ff 15 f4 92 41 00    	call   DWORD PTR ds:0x4192f4
  406f59:	8b f0                	mov    esi,eax
  406f5b:	8d 45 f2             	lea    eax,[ebp-0xe]
  406f5e:	c6 45 fc 01          	mov    BYTE PTR [ebp-0x4],0x1
  406f62:	50                   	push   eax
  406f63:	ff 15 34 93 41 00    	call   DWORD PTR ds:0x419334
  406f69:	0f b7 08             	movzx  ecx,WORD PTR [eax]
  406f6c:	8d 45 e0             	lea    eax,[ebp-0x20]
  406f6f:	51                   	push   ecx
  406f70:	56                   	push   esi
  406f71:	50                   	push   eax
  406f72:	e8 09 a6 ff ff       	call   0x401580
  406f77:	8d 4d 08             	lea    ecx,[ebp+0x8]
  406f7a:	c6 45 fc 02          	mov    BYTE PTR [ebp-0x4],0x2
  406f7e:	51                   	push   ecx
  406f7f:	50                   	push   eax
  406f80:	8d 45 dc             	lea    eax,[ebp-0x24]
  406f83:	50                   	push   eax
  406f84:	e8 f7 a4 ff ff       	call   0x401480
  406f89:	83 c4 20             	add    esp,0x20
  406f8c:	50                   	push   eax
  406f8d:	8d 4d bc             	lea    ecx,[ebp-0x44]
  406f90:	c6 45 fc 03          	mov    BYTE PTR [ebp-0x4],0x3
  406f94:	ff 15 50 93 41 00    	call   DWORD PTR ds:0x419350
  406f9a:	8d 4d dc             	lea    ecx,[ebp-0x24]
  406f9d:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  406fa3:	8d 4d e0             	lea    ecx,[ebp-0x20]
  406fa6:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  406fac:	8d 4d d8             	lea    ecx,[ebp-0x28]
  406faf:	c6 45 fc 07          	mov    BYTE PTR [ebp-0x4],0x7
  406fb3:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  406fb9:	51                   	push   ecx
  406fba:	8b c4                	mov    eax,esp
  406fbc:	8d 4d bc             	lea    ecx,[ebp-0x44]
  406fbf:	c7 00 01 00 00 00    	mov    DWORD PTR [eax],0x1
  406fc5:	ff 15 48 93 41 00    	call   DWORD PTR ds:0x419348
  406fcb:	8d 45 bc             	lea    eax,[ebp-0x44]
  406fce:	50                   	push   eax
  406fcf:	8d 4d b4             	lea    ecx,[ebp-0x4c]
  406fd2:	ff 15 64 93 41 00    	call   DWORD PTR ds:0x419364
  406fd8:	68 34 70 45 00       	push   0x457034
  406fdd:	8d 4d b4             	lea    ecx,[ebp-0x4c]
  406fe0:	c6 45 fc 08          	mov    BYTE PTR [ebp-0x4],0x8
  406fe4:	ff 15 5c 93 41 00    	call   DWORD PTR ds:0x41935c
  406fea:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  406fed:	ff 15 d8 93 41 00    	call   DWORD PTR ds:0x4193d8
  406ff3:	8d 45 d8             	lea    eax,[ebp-0x28]
  406ff6:	c6 45 fc 09          	mov    BYTE PTR [ebp-0x4],0x9
  406ffa:	50                   	push   eax
  406ffb:	8d 4d b4             	lea    ecx,[ebp-0x4c]
  406ffe:	ff 15 a8 92 41 00    	call   DWORD PTR ds:0x4192a8
  407004:	50                   	push   eax
  407005:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  407008:	ff 15 c8 93 41 00    	call   DWORD PTR ds:0x4193c8
  40700e:	8d 4d d8             	lea    ecx,[ebp-0x28]
  407011:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  407017:	8d 4d e8             	lea    ecx,[ebp-0x18]
  40701a:	ff 15 94 9b 41 00    	call   DWORD PTR ds:0x419b94
  407020:	6a 00                	push   0x0
  407022:	6a 00                	push   0x0
  407024:	6a 00                	push   0x0
  407026:	8d 45 e4             	lea    eax,[ebp-0x1c]
  407029:	c6 45 fc 0a          	mov    BYTE PTR [ebp-0x4],0xa
  40702d:	50                   	push   eax
  40702e:	8d 4d e8             	lea    ecx,[ebp-0x18]
  407031:	ff 15 9c 9b 41 00    	call   DWORD PTR ds:0x419b9c
  407037:	8d 4d bc             	lea    ecx,[ebp-0x44]
  40703a:	ff 15 54 93 41 00    	call   DWORD PTR ds:0x419354
  407040:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  407043:	ff 15 d8 93 41 00    	call   DWORD PTR ds:0x4193d8
  407049:	50                   	push   eax
  40704a:	8d 45 d8             	lea    eax,[ebp-0x28]
  40704d:	c6 45 fc 0b          	mov    BYTE PTR [ebp-0x4],0xb
  407051:	50                   	push   eax
  407052:	8d 4d e8             	lea    ecx,[ebp-0x18]
  407055:	ff 15 8c 9b 41 00    	call   DWORD PTR ds:0x419b8c
  40705b:	8d 4d ec             	lea    ecx,[ebp-0x14]
  40705e:	c6 45 fc 0c          	mov    BYTE PTR [ebp-0x4],0xc
  407062:	51                   	push   ecx
  407063:	8b c8                	mov    ecx,eax
  407065:	ff 15 5c 9b 41 00    	call   DWORD PTR ds:0x419b5c
  40706b:	8d 4d d8             	lea    ecx,[ebp-0x28]
  40706e:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  407074:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  407077:	c6 45 fc 0f          	mov    BYTE PTR [ebp-0x4],0xf
  40707b:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  407081:	8d 4d ec             	lea    ecx,[ebp-0x14]
  407084:	33 ff                	xor    edi,edi
  407086:	ff 15 70 9b 41 00    	call   DWORD PTR ds:0x419b70
  40708c:	85 c0                	test   eax,eax
  40708e:	0f 8e e1 00 00 00    	jle    0x407175
  407094:	8b 1d a8 93 41 00    	mov    ebx,DWORD PTR ds:0x4193a8
  40709a:	66 0f 1f 44 00 00    	nop    WORD PTR [eax+eax*1+0x0]
  4070a0:	6a 08                	push   0x8
  4070a2:	68 a4 7a 45 00       	push   0x457aa4
  4070a7:	ff d3                	call   ebx
  4070a9:	83 c4 08             	add    esp,0x8
  4070ac:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
  4070af:	8d 4d c8             	lea    ecx,[ebp-0x38]
  4070b2:	ff 15 d8 93 41 00    	call   DWORD PTR ds:0x4193d8
  4070b8:	8b f0                	mov    esi,eax
  4070ba:	57                   	push   edi
  4070bb:	8d 45 cc             	lea    eax,[ebp-0x34]
  4070be:	c6 45 fc 11          	mov    BYTE PTR [ebp-0x4],0x11
  4070c2:	50                   	push   eax
  4070c3:	8d 4d ec             	lea    ecx,[ebp-0x14]
  4070c6:	ff 15 6c 9b 41 00    	call   DWORD PTR ds:0x419b6c
  4070cc:	8d 4d d0             	lea    ecx,[ebp-0x30]
  4070cf:	c6 45 fc 12          	mov    BYTE PTR [ebp-0x4],0x12
  4070d3:	51                   	push   ecx
  4070d4:	8b c8                	mov    ecx,eax
  4070d6:	ff 15 64 9b 41 00    	call   DWORD PTR ds:0x419b64
  4070dc:	56                   	push   esi
  4070dd:	8d 4d f0             	lea    ecx,[ebp-0x10]
  4070e0:	c6 45 fc 13          	mov    BYTE PTR [ebp-0x4],0x13
  4070e4:	51                   	push   ecx
  4070e5:	8d 4d dc             	lea    ecx,[ebp-0x24]
  4070e8:	51                   	push   ecx
  4070e9:	8b c8                	mov    ecx,eax
  4070eb:	ff 15 7c 9b 41 00    	call   DWORD PTR ds:0x419b7c
  4070f1:	8d 4d d0             	lea    ecx,[ebp-0x30]
  4070f4:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  4070fa:	8d 4d cc             	lea    ecx,[ebp-0x34]
  4070fd:	ff 15 50 9b 41 00    	call   DWORD PTR ds:0x419b50
  407103:	8d 4d c8             	lea    ecx,[ebp-0x38]
  407106:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40710c:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40710f:	c6 45 fc 18          	mov    BYTE PTR [ebp-0x4],0x18
  407113:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  407119:	6a 00                	push   0x0
  40711b:	68 4c 6f 45 00       	push   0x456f4c
  407120:	ff d3                	call   ebx
  407122:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
  407125:	83 c4 04             	add    esp,0x4
  407128:	c6 45 fc 19          	mov    BYTE PTR [ebp-0x4],0x19
  40712c:	8d 45 e0             	lea    eax,[ebp-0x20]
  40712f:	8b cc                	mov    ecx,esp
  407131:	50                   	push   eax
  407132:	ff 15 d4 93 41 00    	call   DWORD PTR ds:0x4193d4
  407138:	51                   	push   ecx
  407139:	8d 45 dc             	lea    eax,[ebp-0x24]
  40713c:	8b cc                	mov    ecx,esp
  40713e:	50                   	push   eax
  40713f:	ff 15 d4 93 41 00    	call   DWORD PTR ds:0x4193d4
  407145:	e8 f6 d1 ff ff       	call   0x404340
  40714a:	83 c4 08             	add    esp,0x8
  40714d:	8d 4d e0             	lea    ecx,[ebp-0x20]
  407150:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  407156:	8d 4d dc             	lea    ecx,[ebp-0x24]
  407159:	c6 45 fc 0f          	mov    BYTE PTR [ebp-0x4],0xf
  40715d:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  407163:	8d 4d ec             	lea    ecx,[ebp-0x14]
  407166:	47                   	inc    edi
  407167:	ff 15 70 9b 41 00    	call   DWORD PTR ds:0x419b70
  40716d:	3b f8                	cmp    edi,eax
  40716f:	0f 8c 2b ff ff ff    	jl     0x4070a0
  407175:	8d 4d ec             	lea    ecx,[ebp-0x14]
  407178:	ff 15 68 9b 41 00    	call   DWORD PTR ds:0x419b68
  40717e:	8d 4d e8             	lea    ecx,[ebp-0x18]
  407181:	ff 15 98 9b 41 00    	call   DWORD PTR ds:0x419b98
  407187:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  40718a:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  407190:	8d 4d b4             	lea    ecx,[ebp-0x4c]
  407193:	ff 15 60 93 41 00    	call   DWORD PTR ds:0x419360
  407199:	8d 4d bc             	lea    ecx,[ebp-0x44]
  40719c:	ff 15 4c 93 41 00    	call   DWORD PTR ds:0x41934c
  4071a2:	8d 4d 08             	lea    ecx,[ebp+0x8]
  4071a5:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  4071ab:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
  4071ae:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  4071b5:	59                   	pop    ecx
  4071b6:	5f                   	pop    edi
  4071b7:	5e                   	pop    esi
  4071b8:	5b                   	pop    ebx
  4071b9:	8b e5                	mov    esp,ebp
  4071bb:	5d                   	pop    ebp
  4071bc:	c3                   	ret
