; Stage 1.9 — host consumption of IsModule+0x0c widget list

; Static analysis only; SHA-256 pinned IS.exe; GNU objdump.

; 0x404320: snapshot/copy source list from this+0x0c


/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/IS.exe:     file format pei-i386


Disassembly of section .text:

00404320 <.text+0x3320>:
  404320:	55                   	push   ebp
  404321:	8b ec                	mov    ebp,esp
  404323:	51                   	push   ecx
  404324:	8d 41 0c             	lea    eax,[ecx+0xc]
  404327:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
  40432e:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  404331:	50                   	push   eax
  404332:	e8 d9 f7 ff ff       	call   0x403b10
  404337:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  40433a:	8b e5                	mov    esp,ebp
  40433c:	5d                   	pop    ebp
  40433d:	c2 04 00             	ret    0x4

; 0x403ad0: create begin/end wrapper around copied QList


/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/IS.exe:     file format pei-i386


Disassembly of section .text:

00403ad0 <.text+0x2ad0>:
  403ad0:	55                   	push   ebp
  403ad1:	8b ec                	mov    ebp,esp
  403ad3:	51                   	push   ecx
  403ad4:	56                   	push   esi
  403ad5:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
  403ad8:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
  403adb:	8b ce                	mov    ecx,esi
  403add:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
  403ae4:	e8 27 00 00 00       	call   0x403b10
  403ae9:	8b ce                	mov    ecx,esi
  403aeb:	ff 15 90 93 41 00    	call   DWORD PTR ds:0x419390
  403af1:	8b ce                	mov    ecx,esi
  403af3:	89 46 04             	mov    DWORD PTR [esi+0x4],eax
  403af6:	ff 15 8c 93 41 00    	call   DWORD PTR ds:0x41938c
  403afc:	89 46 08             	mov    DWORD PTR [esi+0x8],eax
  403aff:	8b c6                	mov    eax,esi
  403b01:	c7 46 0c 01 00 00 00 	mov    DWORD PTR [esi+0xc],0x1
  403b08:	5e                   	pop    esi
  403b09:	8b e5                	mov    esp,ebp
  403b0b:	5d                   	pop    ebp
  403b0c:	c3                   	ret
  403b0d:	cc                   	int3
  403b0e:	cc                   	int3
  403b0f:	cc                   	int3

; 0x404340: module loader, list enumeration and WorkWidget registration


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
  40455d:	0f                   	.byte 0xf
  40455e:	84                   	.byte 0x84
  40455f:	46                   	inc    esi

; 0x411a00: WorkWidget destroyed handler


/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/IS.exe:     file format pei-i386


Disassembly of section .text:

00411a00 <.text+0x10a00>:
  411a00:	55                   	push   ebp
  411a01:	8b ec                	mov    ebp,esp
  411a03:	51                   	push   ecx
  411a04:	53                   	push   ebx
  411a05:	56                   	push   esi
  411a06:	57                   	push   edi
  411a07:	8b f9                	mov    edi,ecx
  411a09:	ff 15 d4 91 41 00    	call   DWORD PTR ds:0x4191d4
  411a0f:	8b 8f 80 00 00 00    	mov    ecx,DWORD PTR [edi+0x80]
  411a15:	8b d8                	mov    ebx,eax
  411a17:	33 f6                	xor    esi,esi
  411a19:	8b 43 20             	mov    eax,DWORD PTR [ebx+0x20]
  411a1c:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
  411a1f:	ff 15 90 98 41 00    	call   DWORD PTR ds:0x419890
  411a25:	85 c0                	test   eax,eax
  411a27:	7e 33                	jle    0x411a5c
  411a29:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [eax+0x0]
  411a30:	8b 8f 80 00 00 00    	mov    ecx,DWORD PTR [edi+0x80]
  411a36:	56                   	push   esi
  411a37:	ff 15 8c 98 41 00    	call   DWORD PTR ds:0x41988c
  411a3d:	8b 8f 80 00 00 00    	mov    ecx,DWORD PTR [edi+0x80]
  411a43:	39 45 fc             	cmp    DWORD PTR [ebp-0x4],eax
  411a46:	74 0d                	je     0x411a55
  411a48:	46                   	inc    esi
  411a49:	ff 15 90 98 41 00    	call   DWORD PTR ds:0x419890
  411a4f:	3b f0                	cmp    esi,eax
  411a51:	7c dd                	jl     0x411a30
  411a53:	eb 07                	jmp    0x411a5c
  411a55:	56                   	push   esi
  411a56:	ff 15 84 98 41 00    	call   DWORD PTR ds:0x419884
  411a5c:	83 c7 30             	add    edi,0x30
  411a5f:	8b cf                	mov    ecx,edi
  411a61:	ff 15 30 92 41 00    	call   DWORD PTR ds:0x419230
  411a67:	85 c0                	test   eax,eax
  411a69:	7e 78                	jle    0x411ae3
  411a6b:	6a ff                	push   0xffffffff
  411a6d:	8b cf                	mov    ecx,edi
  411a6f:	ff 15 b0 92 41 00    	call   DWORD PTR ds:0x4192b0
  411a75:	8b cf                	mov    ecx,edi
  411a77:	8b f0                	mov    esi,eax
  411a79:	ff 15 8c 93 41 00    	call   DWORD PTR ds:0x41938c
  411a7f:	83 c6 04             	add    esi,0x4
  411a82:	3b f0                	cmp    esi,eax
  411a84:	74 5d                	je     0x411ae3
  411a86:	39 1e                	cmp    DWORD PTR [esi],ebx
  411a88:	74 0e                	je     0x411a98
  411a8a:	83 c6 04             	add    esi,0x4
  411a8d:	3b f0                	cmp    esi,eax
  411a8f:	75 f5                	jne    0x411a86
  411a91:	5f                   	pop    edi
  411a92:	5e                   	pop    esi
  411a93:	5b                   	pop    ebx
  411a94:	8b e5                	mov    esp,ebp
  411a96:	5d                   	pop    ebp
  411a97:	c3                   	ret
  411a98:	8b cf                	mov    ecx,edi
  411a9a:	ff 15 90 93 41 00    	call   DWORD PTR ds:0x419390
  411aa0:	2b f0                	sub    esi,eax
  411aa2:	c1 fe 02             	sar    esi,0x2
  411aa5:	83 fe ff             	cmp    esi,0xffffffff
  411aa8:	74 39                	je     0x411ae3
  411aaa:	85 f6                	test   esi,esi
  411aac:	78 35                	js     0x411ae3
  411aae:	8b cf                	mov    ecx,edi
  411ab0:	ff 15 30 92 41 00    	call   DWORD PTR ds:0x419230
  411ab6:	3b f0                	cmp    esi,eax
  411ab8:	7d 29                	jge    0x411ae3
  411aba:	8b 0f                	mov    ecx,DWORD PTR [edi]
  411abc:	8b 01                	mov    eax,DWORD PTR [ecx]
  411abe:	83 f8 01             	cmp    eax,0x1
  411ac1:	74 0e                	je     0x411ad1
  411ac3:	85 c0                	test   eax,eax
  411ac5:	74 0a                	je     0x411ad1
  411ac7:	ff 71 04             	push   DWORD PTR [ecx+0x4]
  411aca:	8b cf                	mov    ecx,edi
  411acc:	e8 af f1 ff ff       	call   0x410c80
  411ad1:	56                   	push   esi
  411ad2:	8b cf                	mov    ecx,edi
  411ad4:	ff 15 b0 92 41 00    	call   DWORD PTR ds:0x4192b0
  411ada:	56                   	push   esi
  411adb:	8b cf                	mov    ecx,edi
  411add:	ff 15 34 92 41 00    	call   DWORD PTR ds:0x419234
  411ae3:	5f                   	pop    edi
  411ae4:	5e                   	pop    esi
  411ae5:	5b                   	pop    ebx
  411ae6:	8b e5                	mov    esp,ebp
  411ae8:	5d                   	pop    ebp
  411ae9:	c3                   	ret
