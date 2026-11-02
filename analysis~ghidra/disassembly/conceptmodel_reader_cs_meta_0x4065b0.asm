
../original/is.exe:     file format pei-i386


disassembly of section .text:

004065b0 <.text+0x55b0>:
  4065b0:	55                   	push   ebp
  4065b1:	8b ec                	mov    ebp,esp
  4065b3:	6a ff                	push   0xffffffff
  4065b5:	68 46 62 41 00       	push   0x416246
  4065ba:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  4065c0:	50                   	push   eax
  4065c1:	83 ec 14             	sub    esp,0x14
  4065c4:	53                   	push   ebx
  4065c5:	56                   	push   esi
  4065c6:	a1 cc 90 46 00       	mov    eax,ds:0x4690cc
  4065cb:	33 c5                	xor    eax,ebp
  4065cd:	50                   	push   eax
  4065ce:	8d 45 f4             	lea    eax,[ebp-0xc]
  4065d1:	64 a3 00 00 00 00    	mov    fs:0x0,eax
  4065d7:	6a 0c                	push   0xc
  4065d9:	68 e4 7b 45 00       	push   0x457be4
  4065de:	ff 15 a8 93 41 00    	call   dword ptr ds:0x4193a8
  4065e4:	83 c4 08             	add    esp,0x8
  4065e7:	89 45 f0             	mov    dword ptr [ebp-0x10],eax
  4065ea:	8d 4d e8             	lea    ecx,[ebp-0x18]
  4065ed:	c7 45 fc 00 00 00 00 	mov    dword ptr [ebp-0x4],0x0
  4065f4:	ff 15 d8 93 41 00    	call   dword ptr ds:0x4193d8
  4065fa:	8b 4d 08             	mov    ecx,dword ptr [ebp+0x8]
  4065fd:	50                   	push   eax
  4065fe:	8d 45 f0             	lea    eax,[ebp-0x10]
  406601:	c6 45 fc 01          	mov    byte ptr [ebp-0x4],0x1
  406605:	50                   	push   eax
  406606:	8d 45 ec             	lea    eax,[ebp-0x14]
  406609:	50                   	push   eax
  40660a:	ff 15 7c 9b 41 00    	call   dword ptr ds:0x419b7c
  406610:	8b 5d 0c             	mov    ebx,dword ptr [ebp+0xc]
  406613:	8b c8                	mov    ecx,eax
  406615:	6a 0a                	push   0xa
  406617:	6a 00                	push   0x0
  406619:	c6 45 fc 02          	mov    byte ptr [ebp-0x4],0x2
  40661d:	8b 73 04             	mov    esi,dword ptr [ebx+0x4]
  406620:	ff 15 d0 92 41 00    	call   dword ptr ds:0x4192d0
  406626:	8d 4d ec             	lea    ecx,[ebp-0x14]
  406629:	89 46 0c             	mov    dword ptr [esi+0xc],eax
  40662c:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  406632:	8d 4d e8             	lea    ecx,[ebp-0x18]
  406635:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  40663b:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40663e:	c7 45 fc ff ff ff ff 	mov    dword ptr [ebp-0x4],0xffffffff
  406645:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  40664b:	6a 0c                	push   0xc
  40664d:	68 f4 7b 45 00       	push   0x457bf4
  406652:	ff 15 a8 93 41 00    	call   dword ptr ds:0x4193a8
  406658:	83 c4 08             	add    esp,0x8
  40665b:	89 45 0c             	mov    dword ptr [ebp+0xc],eax
  40665e:	8d 4d e0             	lea    ecx,[ebp-0x20]
  406661:	c7 45 fc 03 00 00 00 	mov    dword ptr [ebp-0x4],0x3
  406668:	ff 15 d8 93 41 00    	call   dword ptr ds:0x4193d8
  40666e:	8b 4d 08             	mov    ecx,dword ptr [ebp+0x8]
  406671:	50                   	push   eax
  406672:	8d 45 0c             	lea    eax,[ebp+0xc]
  406675:	c6 45 fc 04          	mov    byte ptr [ebp-0x4],0x4
  406679:	50                   	push   eax
  40667a:	8d 45 e4             	lea    eax,[ebp-0x1c]
  40667d:	50                   	push   eax
  40667e:	ff 15 7c 9b 41 00    	call   dword ptr ds:0x419b7c
  406684:	8b 73 04             	mov    esi,dword ptr [ebx+0x4]
  406687:	8b c8                	mov    ecx,eax
  406689:	6a 0a                	push   0xa
  40668b:	6a 00                	push   0x0
  40668d:	c6 45 fc 05          	mov    byte ptr [ebp-0x4],0x5
  406691:	ff 15 d0 92 41 00    	call   dword ptr ds:0x4192d0
  406697:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  40669a:	89 46 10             	mov    dword ptr [esi+0x10],eax
  40669d:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  4066a3:	8d 4d e0             	lea    ecx,[ebp-0x20]
  4066a6:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  4066ac:	8d 4d 0c             	lea    ecx,[ebp+0xc]
  4066af:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  4066b5:	8b 4d f4             	mov    ecx,dword ptr [ebp-0xc]
  4066b8:	64 89 0d 00 00 00 00 	mov    dword ptr fs:0x0,ecx
  4066bf:	59                   	pop    ecx
  4066c0:	5e                   	pop    esi
  4066c1:	5b                   	pop    ebx
  4066c2:	8b e5                	mov    esp,ebp
  4066c4:	5d                   	pop    ebp
  4066c5:	c3                   	ret
  4066c6:	cc                   	int3
  4066c7:	cc                   	int3
  4066c8:	cc                   	int3
  4066c9:	cc                   	int3
  4066ca:	cc                   	int3
  4066cb:	cc                   	int3
  4066cc:	cc                   	int3
  4066cd:	cc                   	int3
  4066ce:	cc                   	int3
  4066cf:	cc                   	int3
