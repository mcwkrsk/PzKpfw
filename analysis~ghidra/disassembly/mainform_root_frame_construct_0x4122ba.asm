
/mnt/data/is2_re_analysis_kit_stage1_17_continuation_2026-11-01/original/is.exe:     file format pei-i386


disassembly of section .text:

004122ba <.text+0x112ba>:
  4122ba:	6a 18                	push   0x18
  4122bc:	e8 c8 24 00 00       	call   0x414789
  4122c1:	8b d8                	mov    ebx,eax
  4122c3:	83 c4 04             	add    esp,0x4
  4122c6:	89 5d d4             	mov    dword ptr [ebp-0x2c],ebx
  4122c9:	c7 45 fc 04 00 00 00 	mov    dword ptr [ebp-0x4],0x4
  4122d0:	85 db                	test   ebx,ebx
  4122d2:	74 1c                	je     0x4122f0
  4122d4:	6a 00                	push   0x0
  4122d6:	ff 75 08             	push   dword ptr [ebp+0x8]
  4122d9:	8b cb                	mov    ecx,ebx
  4122db:	ff 15 d0 9a 41 00    	call   dword ptr ds:0x419ad0
  4122e1:	c7 03 8c 7d 45 00    	mov    dword ptr [ebx],0x457d8c
  4122e7:	c7 43 08 44 7e 45 00 	mov    dword ptr [ebx+0x8],0x457e44
  4122ee:	eb 02                	jmp    0x4122f2
  4122f0:	33 db                	xor    ebx,ebx
  4122f2:	8d 45 dc             	lea    eax,[ebp-0x24]
  4122f5:	89 5f 04             	mov    dword ptr [edi+0x4],ebx
  4122f8:	50                   	push   eax
  4122f9:	8d 4d f3             	lea    ecx,[ebp-0xd]
  4122fc:	e8 8f e5 ff ff       	call   0x410890
  412301:	50                   	push   eax
  412302:	8b cb                	mov    ecx,ebx
  412304:	c7 45 fc 05 00 00 00 	mov    dword ptr [ebp-0x4],0x5
  41230b:	ff d6                	call   esi
  41230d:	8d 4d dc             	lea    ecx,[ebp-0x24]
