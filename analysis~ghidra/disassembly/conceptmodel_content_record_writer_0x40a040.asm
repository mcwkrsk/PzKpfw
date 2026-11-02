
../original/is.exe:     file format pei-i386


disassembly of section .text:

0040a040 <.text+0x9040>:
  40a040:	55                   	push   ebp
  40a041:	8b ec                	mov    ebp,esp
  40a043:	6a ff                	push   0xffffffff
  40a045:	68 4c 6e 41 00       	push   0x416e4c
  40a04a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  40a050:	50                   	push   eax
  40a051:	83 ec 08             	sub    esp,0x8
  40a054:	53                   	push   ebx
  40a055:	56                   	push   esi
  40a056:	57                   	push   edi
  40a057:	a1 cc 90 46 00       	mov    eax,ds:0x4690cc
  40a05c:	33 c5                	xor    eax,ebp
  40a05e:	50                   	push   eax
  40a05f:	8d 45 f4             	lea    eax,[ebp-0xc]
  40a062:	64 a3 00 00 00 00    	mov    fs:0x0,eax
  40a068:	8b 5d 0c             	mov    ebx,dword ptr [ebp+0xc]
  40a06b:	c7 45 ec 00 00 00 00 	mov    dword ptr [ebp-0x14],0x0
  40a072:	8b 75 08             	mov    esi,dword ptr [ebp+0x8]
  40a075:	53                   	push   ebx
  40a076:	56                   	push   esi
  40a077:	c7 45 fc 00 00 00 00 	mov    dword ptr [ebp-0x4],0x0
  40a07e:	e8 dd fd ff ff       	call   0x409e60
  40a083:	8b 3d a8 93 41 00    	mov    edi,dword ptr ds:0x4193a8
  40a089:	6a 04                	push   0x4
  40a08b:	68 50 79 45 00       	push   0x457950
  40a090:	c7 45 fc 00 00 00 00 	mov    dword ptr [ebp-0x4],0x0
  40a097:	c7 45 ec 01 00 00 00 	mov    dword ptr [ebp-0x14],0x1
  40a09e:	ff d7                	call   edi
  40a0a0:	83 c4 10             	add    esp,0x10
  40a0a3:	89 45 f0             	mov    dword ptr [ebp-0x10],eax
  40a0a6:	8b cb                	mov    ecx,ebx
  40a0a8:	c7 45 fc 01 00 00 00 	mov    dword ptr [ebp-0x4],0x1
  40a0af:	ff 15 e8 90 41 00    	call   dword ptr ds:0x4190e8
  40a0b5:	0f be c0             	movsx  eax,al
  40a0b8:	8b ce                	mov    ecx,esi
  40a0ba:	8b 35 4c 9b 41 00    	mov    esi,dword ptr ds:0x419b4c
  40a0c0:	99                   	cdq
  40a0c1:	52                   	push   edx
  40a0c2:	50                   	push   eax
  40a0c3:	8d 45 f0             	lea    eax,[ebp-0x10]
  40a0c6:	50                   	push   eax
  40a0c7:	ff d6                	call   esi
  40a0c9:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40a0cc:	c6 45 fc 00          	mov    byte ptr [ebp-0x4],0x0
  40a0d0:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  40a0d6:	6a 05                	push   0x5
  40a0d8:	68 1c 7c 45 00       	push   0x457c1c
  40a0dd:	ff d7                	call   edi
  40a0df:	83 c4 08             	add    esp,0x8
  40a0e2:	89 45 f0             	mov    dword ptr [ebp-0x10],eax
  40a0e5:	8b cb                	mov    ecx,ebx
  40a0e7:	c7 45 fc 02 00 00 00 	mov    dword ptr [ebp-0x4],0x2
  40a0ee:	ff 15 ec 90 41 00    	call   dword ptr ds:0x4190ec
  40a0f4:	8b 4d 08             	mov    ecx,dword ptr [ebp+0x8]
  40a0f7:	99                   	cdq
  40a0f8:	52                   	push   edx
  40a0f9:	50                   	push   eax
  40a0fa:	8d 45 f0             	lea    eax,[ebp-0x10]
  40a0fd:	50                   	push   eax
  40a0fe:	ff d6                	call   esi
  40a100:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40a103:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  40a109:	8b 45 08             	mov    eax,dword ptr [ebp+0x8]
  40a10c:	8b 4d f4             	mov    ecx,dword ptr [ebp-0xc]
  40a10f:	64                   	fs
