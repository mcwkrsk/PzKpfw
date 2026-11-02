
../original/is.exe:     file format pei-i386


disassembly of section .text:

0040a440 <.text+0x9440>:
  40a440:	55                   	push   ebp
  40a441:	8b ec                	mov    ebp,esp
  40a443:	6a ff                	push   0xffffffff
  40a445:	68 6c 6f 41 00       	push   0x416f6c
  40a44a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  40a450:	50                   	push   eax
  40a451:	83 ec 0c             	sub    esp,0xc
  40a454:	57                   	push   edi
  40a455:	a1 cc 90 46 00       	mov    eax,ds:0x4690cc
  40a45a:	33 c5                	xor    eax,ebp
  40a45c:	50                   	push   eax
  40a45d:	8d 45 f4             	lea    eax,[ebp-0xc]
  40a460:	64 a3 00 00 00 00    	mov    fs:0x0,eax
  40a466:	6a 0a                	push   0xa
  40a468:	68 c4 7b 45 00       	push   0x457bc4
  40a46d:	c7 45 fc 00 00 00 00 	mov    dword ptr [ebp-0x4],0x0
  40a474:	c7 45 e8 00 00 00 00 	mov    dword ptr [ebp-0x18],0x0
  40a47b:	ff 15 a8 93 41 00    	call   dword ptr ds:0x4193a8
  40a481:	83 c4 08             	add    esp,0x8
  40a484:	89 45 f0             	mov    dword ptr [ebp-0x10],eax
  40a487:	8b 7d 08             	mov    edi,dword ptr [ebp+0x8]
  40a48a:	8d 45 f0             	lea    eax,[ebp-0x10]
  40a48d:	8b 0d b0 96 46 00    	mov    ecx,dword ptr ds:0x4696b0
  40a493:	50                   	push   eax
  40a494:	57                   	push   edi
  40a495:	c7 45 fc 01 00 00 00 	mov    dword ptr [ebp-0x4],0x1
  40a49c:	ff 15 74 9b 41 00    	call   dword ptr ds:0x419b74
  40a4a2:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40a4a5:	c7 45 e8 01 00 00 00 	mov    dword ptr [ebp-0x18],0x1
  40a4ac:	c6 45 fc 00          	mov    byte ptr [ebp-0x4],0x0
  40a4b0:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  40a4b6:	6a 07                	push   0x7
  40a4b8:	68 d0 7b 45 00       	push   0x457bd0
  40a4bd:	ff 15 a8 93 41 00    	call   dword ptr ds:0x4193a8
  40a4c3:	83 c4 08             	add    esp,0x8
  40a4c6:	89 45 ec             	mov    dword ptr [ebp-0x14],eax
  40a4c9:	8b 45 0c             	mov    eax,dword ptr [ebp+0xc]
  40a4cc:	8b cf                	mov    ecx,edi
  40a4ce:	c7 45 fc 02 00 00 00 	mov    dword ptr [ebp-0x4],0x2
  40a4d5:	8b 40 0c             	mov    eax,dword ptr [eax+0xc]
  40a4d8:	8b 40 24             	mov    eax,dword ptr [eax+0x24]
  40a4db:	99                   	cdq
  40a4dc:	52                   	push   edx
  40a4dd:	50                   	push   eax
  40a4de:	8d 45 ec             	lea    eax,[ebp-0x14]
  40a4e1:	50                   	push   eax
  40a4e2:	ff 15 4c 9b 41 00    	call   dword ptr ds:0x419b4c
  40a4e8:	8d 4d ec             	lea    ecx,[ebp-0x14]
  40a4eb:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  40a4f1:	8b c7                	mov    eax,edi
  40a4f3:	8b 4d f4             	mov    ecx,dword ptr [ebp-0xc]
  40a4f6:	64 89 0d 00 00 00 00 	mov    dword ptr fs:0x0,ecx
  40a4fd:	59                   	pop    ecx
  40a4fe:	5f                   	pop    edi
  40a4ff:	8b e5                	mov    esp,ebp
  40a501:	5d                   	pop    ebp
  40a502:	c3                   	ret
  40a503:	cc                   	int3
  40a504:	cc                   	int3
  40a505:	cc                   	int3
  40a506:	cc                   	int3
  40a507:	cc                   	int3
  40a508:	cc                   	int3
  40a509:	cc                   	int3
  40a50a:	cc                   	int3
  40a50b:	cc                   	int3
  40a50c:	cc                   	int3
  40a50d:	cc                   	int3
  40a50e:	cc                   	int3
  40a50f:	cc                   	int3
