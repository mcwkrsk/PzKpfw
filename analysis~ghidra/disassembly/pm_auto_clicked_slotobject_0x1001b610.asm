
/mnt/data/is2_re_analysis_kit_stage1_17_continuation_2026-11-01/original/modules/pm_auto.dll:     file format pei-i386


disassembly of section .text:

1001b610 <.text+0x1a610>:
1001b610:	55                   	push   ebp
1001b611:	8b ec                	mov    ebp,esp
1001b613:	8b 45 08             	mov    eax,dword ptr [ebp+0x8]
1001b616:	83 e8 00             	sub    eax,0x0
1001b619:	74 47                	je     0x1001b662
1001b61b:	83 e8 01             	sub    eax,0x1
1001b61e:	75 54                	jne    0x1001b674
1001b620:	56                   	push   esi
1001b621:	8b 75 0c             	mov    esi,dword ptr [ebp+0xc]
1001b624:	8b 4e 08             	mov    ecx,dword ptr [esi+0x8]
1001b627:	39 41 74             	cmp    dword ptr [ecx+0x74],eax
1001b62a:	74 1c                	je     0x1001b648
1001b62c:	8b 46 0c             	mov    eax,dword ptr [esi+0xc]
1001b62f:	89 45 08             	mov    dword ptr [ebp+0x8],eax
1001b632:	8b 49 74             	mov    ecx,dword ptr [ecx+0x74]
1001b635:	85 c9                	test   ecx,ecx
1001b637:	75 06                	jne    0x1001b63f
1001b639:	ff 15 94 21 02 10    	call   dword ptr ds:0x10022194
1001b63f:	8b 01                	mov    eax,dword ptr [ecx]
1001b641:	8d 55 08             	lea    edx,[ebp+0x8]
1001b644:	52                   	push   edx
1001b645:	ff 50 08             	call   dword ptr [eax+0x8]
1001b648:	8b 4e 08             	mov    ecx,dword ptr [esi+0x8]
1001b64b:	ff 76 0c             	push   dword ptr [esi+0xc]
1001b64e:	8b 49 24             	mov    ecx,dword ptr [ecx+0x24]
1001b651:	ff 15 f8 27 02 10    	call   dword ptr ds:0x100227f8
1001b657:	8b 4e 0c             	mov    ecx,dword ptr [esi+0xc]
1001b65a:	5e                   	pop    esi
1001b65b:	5d                   	pop    ebp
1001b65c:	ff 25 18 23 02 10    	jmp    dword ptr ds:0x10022318
1001b662:	8b 45 0c             	mov    eax,dword ptr [ebp+0xc]
1001b665:	85 c0                	test   eax,eax
1001b667:	74 0b                	je     0x1001b674
1001b669:	6a 10                	push   0x10
1001b66b:	50                   	push   eax
1001b66c:	e8 42 16 00 00       	call   0x1001ccb3
1001b671:	83 c4 08             	add    esp,0x8
1001b674:	5d                   	pop    ebp
1001b675:	c3                   	ret
1001b676:	cc                   	int3
1001b677:	cc                   	int3
1001b678:	cc                   	int3
1001b679:	cc                   	int3
1001b67a:	cc                   	int3
1001b67b:	cc                   	int3
1001b67c:	cc                   	int3
1001b67d:	cc                   	int3
1001b67e:	cc                   	int3
1001b67f:	cc                   	int3
