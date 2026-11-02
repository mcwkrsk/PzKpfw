
/mnt/data/is2_re_analysis_kit_stage1_17_continuation_2026-11-01/original/modules/pm_params.dll:     file format pei-i386


disassembly of section .text:

100042e0 <.text+0x32e0>:
100042e0:	55                   	push   ebp
100042e1:	8b ec                	mov    ebp,esp
100042e3:	56                   	push   esi
100042e4:	8b f1                	mov    esi,ecx
100042e6:	8d 4e 1c             	lea    ecx,[esi+0x1c]
100042e9:	c7 06 b0 84 01 10    	mov    dword ptr [esi],0x100184b0
100042ef:	c7 46 08 84 85 01 10 	mov    dword ptr [esi+0x8],0x10018584
100042f6:	ff 15 40 a2 00 10    	call   dword ptr ds:0x1000a240
100042fc:	8b ce                	mov    ecx,esi
100042fe:	ff 15 fc a7 00 10    	call   dword ptr ds:0x1000a7fc
10004304:	f6 45 08 01          	test   byte ptr [ebp+0x8],0x1
10004308:	74 0b                	je     0x10004315
1000430a:	6a 4c                	push   0x4c
1000430c:	56                   	push   esi
1000430d:	e8 17 3f 00 00       	call   0x10008229
10004312:	83 c4 08             	add    esp,0x8
10004315:	8b c6                	mov    eax,esi
10004317:	5e                   	pop    esi
10004318:	5d                   	pop    ebp
10004319:	c2 04 00             	ret    0x4
