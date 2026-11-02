
/mnt/data/is2_re_analysis_kit_stage1_17_continuation_2026-11-01/original/modules/pm_auto.dll:     file format pei-i386


disassembly of section .text:

1001b3c0 <.text+0x1a3c0>:
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
1001b3f3:	89 45 ec             	mov    dword ptr [ebp-0x14],eax
1001b3f6:	c7 45 fc 00 00 00 00 	mov    dword ptr [ebp-0x4],0x0
1001b3fd:	85 c0                	test   eax,eax
1001b3ff:	74 0c                	je     0x1001b40d
1001b401:	57                   	push   edi
1001b402:	8b c8                	mov    ecx,eax
1001b404:	e8 07 fd ff ff       	call   0x1001b110
1001b409:	8b f0                	mov    esi,eax
1001b40b:	eb 02                	jmp    0x1001b40f
1001b40d:	33 f6                	xor    esi,esi
1001b40f:	8b 4f 24             	mov    ecx,dword ptr [edi+0x24]
1001b412:	6a 00                	push   0x0
1001b414:	6a 00                	push   0x0
1001b416:	56                   	push   esi
1001b417:	c7 45 fc ff ff ff ff 	mov    dword ptr [ebp-0x4],0xffffffff
1001b41e:	ff 15 20 28 02 10    	call   dword ptr ds:0x10022820
1001b424:	8b 4e 1c             	mov    ecx,dword ptr [esi+0x1c]
1001b427:	6a 01                	push   0x1
1001b429:	ff 15 f0 28 02 10    	call   dword ptr ds:0x100228f0
1001b42f:	56                   	push   esi
1001b430:	57                   	push   edi
1001b431:	6a 00                	push   0x0
1001b433:	ff 35 a8 29 02 10    	push   dword ptr ds:0x100229a8
1001b439:	8d 45 f0             	lea    eax,[ebp-0x10]
1001b43c:	ff 76 20             	push   dword ptr [esi+0x20]
1001b43f:	50                   	push   eax
1001b440:	e8 cb fa ff ff       	call   0x1001af10
1001b445:	83 c4 18             	add    esp,0x18
1001b448:	8d 4d f0             	lea    ecx,[ebp-0x10]
1001b44b:	ff 15 ac 23 02 10    	call   dword ptr ds:0x100223ac
1001b451:	83 7f 4c 00          	cmp    dword ptr [edi+0x4c],0x0
1001b455:	74 19                	je     0x1001b470
1001b457:	8b 4f 4c             	mov    ecx,dword ptr [edi+0x4c]
1001b45a:	89 75 ec             	mov    dword ptr [ebp-0x14],esi
1001b45d:	85 c9                	test   ecx,ecx
1001b45f:	75 06                	jne    0x1001b467
1001b461:	ff 15 94 21 02 10    	call   dword ptr ds:0x10022194
1001b467:	8b 01                	mov    eax,dword ptr [ecx]
1001b469:	8d 55 ec             	lea    edx,[ebp-0x14]
1001b46c:	52                   	push   edx
1001b46d:	ff 50 08             	call   dword ptr [eax+0x8]
1001b470:	8b c6                	mov    eax,esi
1001b472:	8b 4d f4             	mov    ecx,dword ptr [ebp-0xc]
1001b475:	64 89 0d 00 00 00 00 	mov    dword ptr fs:0x0,ecx
1001b47c:	59                   	pop    ecx
1001b47d:	5f                   	pop    edi
1001b47e:	5e                   	pop    esi
1001b47f:	8b e5                	mov    esp,ebp
1001b481:	5d                   	pop    ebp
1001b482:	c3                   	ret
