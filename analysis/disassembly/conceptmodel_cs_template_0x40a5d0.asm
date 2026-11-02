
../original/is.exe:     file format pei-i386


disassembly of section .text:

0040a5d0 <.text+0x95d0>:
  40a5d0:	55                   	push   ebp
  40a5d1:	8b ec                	mov    ebp,esp
  40a5d3:	6a ff                	push   0xffffffff
  40a5d5:	68 05 70 41 00       	push   0x417005
  40a5da:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  40a5e0:	50                   	push   eax
  40a5e1:	83 ec 0c             	sub    esp,0xc
  40a5e4:	53                   	push   ebx
  40a5e5:	56                   	push   esi
  40a5e6:	57                   	push   edi
  40a5e7:	a1 cc 90 46 00       	mov    eax,ds:0x4690cc
  40a5ec:	33 c5                	xor    eax,ebp
  40a5ee:	50                   	push   eax
  40a5ef:	8d 45 f4             	lea    eax,[ebp-0xc]
  40a5f2:	64 a3 00 00 00 00    	mov    fs:0x0,eax
  40a5f8:	6a 0a                	push   0xa
  40a5fa:	c7 45 e8 00 00 00 00 	mov    dword ptr [ebp-0x18],0x0
  40a601:	8b 1d a8 93 41 00    	mov    ebx,dword ptr ds:0x4193a8
  40a607:	68 d8 7b 45 00       	push   0x457bd8
  40a60c:	c7 45 fc 00 00 00 00 	mov    dword ptr [ebp-0x4],0x0
  40a613:	ff d3                	call   ebx
  40a615:	83 c4 08             	add    esp,0x8
  40a618:	89 45 f0             	mov    dword ptr [ebp-0x10],eax
  40a61b:	8b 75 08             	mov    esi,dword ptr [ebp+0x8]
  40a61e:	8d 45 f0             	lea    eax,[ebp-0x10]
  40a621:	8b 0d b0 96 46 00    	mov    ecx,dword ptr ds:0x4696b0
  40a627:	50                   	push   eax
  40a628:	56                   	push   esi
  40a629:	c7 45 fc 01 00 00 00 	mov    dword ptr [ebp-0x4],0x1
  40a630:	ff 15 74 9b 41 00    	call   dword ptr ds:0x419b74
  40a636:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40a639:	c7 45 e8 01 00 00 00 	mov    dword ptr [ebp-0x18],0x1
  40a640:	c6 45 fc 00          	mov    byte ptr [ebp-0x4],0x0
  40a644:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  40a64a:	6a 0c                	push   0xc
  40a64c:	68 e4 7b 45 00       	push   0x457be4
  40a651:	ff d3                	call   ebx
  40a653:	83 c4 08             	add    esp,0x8
  40a656:	89 45 ec             	mov    dword ptr [ebp-0x14],eax
  40a659:	8b 7d 0c             	mov    edi,dword ptr [ebp+0xc]
  40a65c:	8b ce                	mov    ecx,esi
  40a65e:	8b 35 4c 9b 41 00    	mov    esi,dword ptr ds:0x419b4c
  40a664:	c7 45 fc 02 00 00 00 	mov    dword ptr [ebp-0x4],0x2
  40a66b:	8b 47 04             	mov    eax,dword ptr [edi+0x4]
  40a66e:	8b 40 0c             	mov    eax,dword ptr [eax+0xc]
  40a671:	99                   	cdq
  40a672:	52                   	push   edx
  40a673:	50                   	push   eax
  40a674:	8d 45 ec             	lea    eax,[ebp-0x14]
  40a677:	50                   	push   eax
  40a678:	ff d6                	call   esi
  40a67a:	8d 4d ec             	lea    ecx,[ebp-0x14]
  40a67d:	c6 45 fc 00          	mov    byte ptr [ebp-0x4],0x0
  40a681:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  40a687:	6a 0c                	push   0xc
  40a689:	68 f4 7b 45 00       	push   0x457bf4
  40a68e:	ff d3                	call   ebx
  40a690:	83 c4 08             	add    esp,0x8
  40a693:	89 45 0c             	mov    dword ptr [ebp+0xc],eax
  40a696:	8b 47 04             	mov    eax,dword ptr [edi+0x4]
  40a699:	8b 4d 08             	mov    ecx,dword ptr [ebp+0x8]
  40a69c:	c7 45 fc 03 00 00 00 	mov    dword ptr [ebp-0x4],0x3
  40a6a3:	8b 40 10             	mov    eax,dword ptr [eax+0x10]
  40a6a6:	99                   	cdq
  40a6a7:	52                   	push   edx
  40a6a8:	50                   	push   eax
  40a6a9:	8d 45 0c             	lea    eax,[ebp+0xc]
  40a6ac:	50                   	push   eax
  40a6ad:	ff d6                	call   esi
  40a6af:	8d 4d 0c             	lea    ecx,[ebp+0xc]
  40a6b2:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  40a6b8:	8b 45 08             	mov    eax,dword ptr [ebp+0x8]
  40a6bb:	8b 4d f4             	mov    ecx,dword ptr [ebp-0xc]
  40a6be:	64 89 0d 00 00 00 00 	mov    dword ptr fs:0x0,ecx
  40a6c5:	59                   	pop    ecx
  40a6c6:	5f                   	pop    edi
  40a6c7:	5e                   	pop    esi
  40a6c8:	5b                   	pop    ebx
  40a6c9:	8b e5                	mov    esp,ebp
  40a6cb:	5d                   	pop    ebp
  40a6cc:	c3                   	ret
  40a6cd:	cc                   	int3
  40a6ce:	cc                   	int3
  40a6cf:	cc                   	int3
