
/mnt/data/is2_re_analysis_kit_stage1_17_continuation_2026-11-01/original/modules/pm_spec_web.dll:     file format pei-i386


disassembly of section .text:

100021a0 <.text+0x11a0>:
100021a0:	55                   	push   ebp
100021a1:	8b ec                	mov    ebp,esp
100021a3:	56                   	push   esi
100021a4:	8b f1                	mov    esi,ecx
100021a6:	8d 4e 1c             	lea    ecx,[esi+0x1c]
100021a9:	ff 15 d8 c1 00 10    	call   dword ptr ds:0x1000c1d8
100021af:	8b ce                	mov    ecx,esi
100021b1:	ff 15 0c c3 00 10    	call   dword ptr ds:0x1000c30c
100021b7:	f6 45 08 01          	test   byte ptr [ebp+0x8],0x1
100021bb:	74 0b                	je     0x100021c8
100021bd:	6a 64                	push   0x64
100021bf:	56                   	push   esi
100021c0:	e8 13 69 00 00       	call   0x10008ad8
100021c5:	83 c4 08             	add    esp,0x8
100021c8:	8b c6                	mov    eax,esi
100021ca:	5e                   	pop    esi
100021cb:	5d                   	pop    ebp
100021cc:	c2 04 00             	ret    0x4
100021cf:	cc                   	int3
