
../original/is.exe:     file format pei-i386


disassembly of section .text:

00406380 <.text+0x5380>:
  406380:	55                   	push   ebp
  406381:	8b ec                	mov    ebp,esp
  406383:	6a ff                	push   0xffffffff
  406385:	68 ec 61 41 00       	push   0x4161ec
  40638a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  406390:	50                   	push   eax
  406391:	83 ec 18             	sub    esp,0x18
  406394:	53                   	push   ebx
  406395:	56                   	push   esi
  406396:	57                   	push   edi
  406397:	a1 cc 90 46 00       	mov    eax,ds:0x4690cc
  40639c:	33 c5                	xor    eax,ebp
  40639e:	50                   	push   eax
  40639f:	8d 45 f4             	lea    eax,[ebp-0xc]
  4063a2:	64 a3 00 00 00 00    	mov    fs:0x0,eax
  4063a8:	ff 75 0c             	push   dword ptr [ebp+0xc]
  4063ab:	8b 5d 08             	mov    ebx,dword ptr [ebp+0x8]
  4063ae:	53                   	push   ebx
  4063af:	e8 7c f5 ff ff       	call   0x405930
  4063b4:	6a 02                	push   0x2
  4063b6:	68 10 7c 45 00       	push   0x457c10
  4063bb:	ff 15 a8 93 41 00    	call   dword ptr ds:0x4193a8
  4063c1:	83 c4 10             	add    esp,0x10
  4063c4:	89 45 f0             	mov    dword ptr [ebp-0x10],eax
  4063c7:	8d 4d e8             	lea    ecx,[ebp-0x18]
  4063ca:	c7 45 fc 00 00 00 00 	mov    dword ptr [ebp-0x4],0x0
  4063d1:	ff 15 d8 93 41 00    	call   dword ptr ds:0x4193d8
  4063d7:	50                   	push   eax
  4063d8:	8d 45 f0             	lea    eax,[ebp-0x10]
  4063db:	c6 45 fc 01          	mov    byte ptr [ebp-0x4],0x1
  4063df:	50                   	push   eax
  4063e0:	8d 45 ec             	lea    eax,[ebp-0x14]
  4063e3:	8b cb                	mov    ecx,ebx
  4063e5:	8b 1d 7c 9b 41 00    	mov    ebx,dword ptr ds:0x419b7c
  4063eb:	50                   	push   eax
  4063ec:	ff d3                	call   ebx
  4063ee:	8b 3d d0 92 41 00    	mov    edi,dword ptr ds:0x4192d0
  4063f4:	8b c8                	mov    ecx,eax
  4063f6:	6a 0a                	push   0xa
  4063f8:	6a 00                	push   0x0
  4063fa:	c6 45 fc 02          	mov    byte ptr [ebp-0x4],0x2
  4063fe:	ff d7                	call   edi
  406400:	8d 4d ec             	lea    ecx,[ebp-0x14]
  406403:	8b f0                	mov    esi,eax
  406405:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  40640b:	8d 4d e8             	lea    ecx,[ebp-0x18]
  40640e:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  406414:	8d 4d f0             	lea    ecx,[ebp-0x10]
  406417:	c7 45 fc ff ff ff ff 	mov    dword ptr [ebp-0x4],0xffffffff
  40641e:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  406424:	6a 02                	push   0x2
  406426:	68 14 7c 45 00       	push   0x457c14
  40642b:	ff 15 a8 93 41 00    	call   dword ptr ds:0x4193a8
  406431:	83 c4 08             	add    esp,0x8
  406434:	89 45 f0             	mov    dword ptr [ebp-0x10],eax
  406437:	8d 4d ec             	lea    ecx,[ebp-0x14]
  40643a:	c7 45 fc 03 00 00 00 	mov    dword ptr [ebp-0x4],0x3
  406441:	ff 15 d8 93 41 00    	call   dword ptr ds:0x4193d8
  406447:	8b 4d 08             	mov    ecx,dword ptr [ebp+0x8]
  40644a:	50                   	push   eax
  40644b:	8d 45 f0             	lea    eax,[ebp-0x10]
  40644e:	c6 45 fc 04          	mov    byte ptr [ebp-0x4],0x4
  406452:	50                   	push   eax
  406453:	8d 45 e8             	lea    eax,[ebp-0x18]
  406456:	50                   	push   eax
  406457:	ff d3                	call   ebx
  406459:	6a 0a                	push   0xa
  40645b:	6a 00                	push   0x0
  40645d:	8b c8                	mov    ecx,eax
  40645f:	c6 45 fc 05          	mov    byte ptr [ebp-0x4],0x5
  406463:	ff d7                	call   edi
  406465:	8d 4d e8             	lea    ecx,[ebp-0x18]
  406468:	89 45 e4             	mov    dword ptr [ebp-0x1c],eax
  40646b:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  406471:	8d 4d ec             	lea    ecx,[ebp-0x14]
  406474:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  40647a:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40647d:	c7 45 fc ff ff ff ff 	mov    dword ptr [ebp-0x4],0xffffffff
  406484:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  40648a:	6a 02                	push   0x2
  40648c:	68 18 7c 45 00       	push   0x457c18
  406491:	ff 15 a8 93 41 00    	call   dword ptr ds:0x4193a8
  406497:	83 c4 08             	add    esp,0x8
  40649a:	89 45 f0             	mov    dword ptr [ebp-0x10],eax
  40649d:	8d 4d ec             	lea    ecx,[ebp-0x14]
  4064a0:	c7 45 fc 06 00 00 00 	mov    dword ptr [ebp-0x4],0x6
  4064a7:	ff 15 d8 93 41 00    	call   dword ptr ds:0x4193d8
  4064ad:	c6 45 fc 07          	mov    byte ptr [ebp-0x4],0x7
  4064b1:	8b 4d 08             	mov    ecx,dword ptr [ebp+0x8]
  4064b4:	50                   	push   eax
  4064b5:	8d 45 f0             	lea    eax,[ebp-0x10]
  4064b8:	50                   	push   eax
  4064b9:	8d 45 e8             	lea    eax,[ebp-0x18]
  4064bc:	50                   	push   eax
  4064bd:	ff d3                	call   ebx
  4064bf:	6a 0a                	push   0xa
  4064c1:	6a 00                	push   0x0
  4064c3:	8b c8                	mov    ecx,eax
  4064c5:	c6 45 fc 08          	mov    byte ptr [ebp-0x4],0x8
  4064c9:	ff d7                	call   edi
  4064cb:	8d 4d e8             	lea    ecx,[ebp-0x18]
  4064ce:	8b d8                	mov    ebx,eax
  4064d0:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  4064d6:	8d 4d ec             	lea    ecx,[ebp-0x14]
  4064d9:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  4064df:	8d 4d f0             	lea    ecx,[ebp-0x10]
  4064e2:	c7 45 fc ff ff ff ff 	mov    dword ptr [ebp-0x4],0xffffffff
  4064e9:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  4064ef:	8b 7d 10             	mov    edi,dword ptr [ebp+0x10]
  4064f2:	8b cf                	mov    ecx,edi
  4064f4:	56                   	push   esi
  4064f5:	8b 35 70 90 41 00    	mov    esi,dword ptr ds:0x419070
  4064fb:	ff d6                	call   esi
  4064fd:	8b 4d 0c             	mov    ecx,dword ptr [ebp+0xc]
  406500:	50                   	push   eax
  406501:	ff 15 a4 90 41 00    	call   dword ptr ds:0x4190a4
  406507:	ff 75 e4             	push   dword ptr [ebp-0x1c]
  40650a:	8b cf                	mov    ecx,edi
  40650c:	ff d6                	call   esi
  40650e:	8b 4d 0c             	mov    ecx,dword ptr [ebp+0xc]
  406511:	50                   	push   eax
  406512:	ff 15 a8 90 41 00    	call   dword ptr ds:0x4190a8
  406518:	53                   	push   ebx
  406519:	8b cf                	mov    ecx,edi
  40651b:	ff d6                	call   esi
  40651d:	8b 5d 0c             	mov    ebx,dword ptr [ebp+0xc]
  406520:	8b cb                	mov    ecx,ebx
  406522:	50                   	push   eax
  406523:	ff 15 ac 90 41 00    	call   dword ptr ds:0x4190ac
  406529:	6a 05                	push   0x5
  40652b:	68 08 7c 45 00       	push   0x457c08
  406530:	ff 15 a8 93 41 00    	call   dword ptr ds:0x4193a8
  406536:	83 c4 08             	add    esp,0x8
  406539:	89 45 0c             	mov    dword ptr [ebp+0xc],eax
  40653c:	8d 4d dc             	lea    ecx,[ebp-0x24]
  40653f:	c7 45 fc 09 00 00 00 	mov    dword ptr [ebp-0x4],0x9
  406546:	ff 15 d8 93 41 00    	call   dword ptr ds:0x4193d8
  40654c:	8b 4d 08             	mov    ecx,dword ptr [ebp+0x8]
  40654f:	50                   	push   eax
  406550:	8d 45 0c             	lea    eax,[ebp+0xc]
  406553:	c6 45 fc 0a          	mov    byte ptr [ebp-0x4],0xa
  406557:	50                   	push   eax
  406558:	8d 45 e0             	lea    eax,[ebp-0x20]
  40655b:	50                   	push   eax
  40655c:	ff 15 7c 9b 41 00    	call   dword ptr ds:0x419b7c
  406562:	8b 73 04             	mov    esi,dword ptr [ebx+0x4]
  406565:	8b c8                	mov    ecx,eax
  406567:	6a 0a                	push   0xa
  406569:	6a 00                	push   0x0
  40656b:	c6 45 fc 0b          	mov    byte ptr [ebp-0x4],0xb
  40656f:	ff 15 d0 92 41 00    	call   dword ptr ds:0x4192d0
  406575:	8d 4d e0             	lea    ecx,[ebp-0x20]
  406578:	89 46 2c             	mov    dword ptr [esi+0x2c],eax
  40657b:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  406581:	8d 4d dc             	lea    ecx,[ebp-0x24]
  406584:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  40658a:	8d 4d 0c             	lea    ecx,[ebp+0xc]
  40658d:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  406593:	8b 4d f4             	mov    ecx,dword ptr [ebp-0xc]
  406596:	64 89 0d 00 00 00 00 	mov    dword ptr fs:0x0,ecx
  40659d:	59                   	pop    ecx
  40659e:	5f                   	pop    edi
  40659f:	5e                   	pop    esi
  4065a0:	5b                   	pop    ebx
  4065a1:	8b e5                	mov    esp,ebp
  4065a3:	5d                   	pop    ebp
  4065a4:	c3                   	ret
