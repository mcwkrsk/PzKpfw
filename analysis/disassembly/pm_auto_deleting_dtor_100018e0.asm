
/mnt/data/is2_re_analysis_kit_stage1_17_continuation_2026-11-01/original/modules/pm_auto.dll:     file format pei-i386


disassembly of section .text:

100018e0 <.text+0x8e0>:
100018e0:	55                   	push   ebp
100018e1:	8b ec                	mov    ebp,esp
100018e3:	56                   	push   esi
100018e4:	8b f1                	mov    esi,ecx
100018e6:	c7 06 60 78 05 10    	mov    dword ptr [esi],0x10057860
100018ec:	c7 46 08 3c 79 05 10 	mov    dword ptr [esi+0x8],0x1005793c
100018f3:	e8 b8 3a 00 00       	call   0x100053b0
100018f8:	f6 45 08 01          	test   byte ptr [ebp+0x8],0x1
100018fc:	74 0e                	je     0x1000190c
100018fe:	68 74 01 00 00       	push   0x174
10001903:	56                   	push   esi
10001904:	e8 aa b3 01 00       	call   0x1001ccb3
10001909:	83 c4 08             	add    esp,0x8
1000190c:	8b c6                	mov    eax,esi
1000190e:	5e                   	pop    esi
1000190f:	5d                   	pop    ebp
10001910:	c2 04 00             	ret    0x4
