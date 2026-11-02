
/mnt/data/is2_re_analysis_kit_stage1_17_continuation_2026-11-01/original/modules/pm_params.dll:     file format pei-i386


disassembly of section .text:

100017b0 <.text+0x7b0>:
100017b0:	55                   	push   ebp
100017b1:	8b ec                	mov    ebp,esp
100017b3:	6a ff                	push   0xffffffff
100017b5:	68 26 90 00 10       	push   0x10009026
100017ba:	64 a1 00 00 00 00    	mov    eax,fs:0x0
100017c0:	50                   	push   eax
100017c1:	56                   	push   esi
100017c2:	a1 50 30 02 10       	mov    eax,ds:0x10023050
100017c7:	33 c5                	xor    eax,ebp
100017c9:	50                   	push   eax
100017ca:	8d 45 f4             	lea    eax,[ebp-0xc]
100017cd:	64 a3 00 00 00 00    	mov    fs:0x0,eax
100017d3:	8b f1                	mov    esi,ecx
100017d5:	8b 4e 3c             	mov    ecx,dword ptr [esi+0x3c]
100017d8:	c7 45 fc 00 00 00 00 	mov    dword ptr [ebp-0x4],0x0
100017df:	c7 06 54 7f 01 10    	mov    dword ptr [esi],0x10017f54
100017e5:	c7 46 08 0c 80 01 10 	mov    dword ptr [esi+0x8],0x1001800c
100017ec:	ff 15 d4 a8 00 10    	call   dword ptr ds:0x1000a8d4
100017f2:	8b c8                	mov    ecx,eax
100017f4:	ff 15 20 a2 00 10    	call   dword ptr ds:0x1000a220
100017fa:	8b ce                	mov    ecx,esi
100017fc:	ff 15 fc a7 00 10    	call   dword ptr ds:0x1000a7fc
10001802:	f6 45 08 01          	test   byte ptr [ebp+0x8],0x1
10001806:	74 0b                	je     0x10001813
10001808:	6a 50                	push   0x50
1000180a:	56                   	push   esi
1000180b:	e8 19 6a 00 00       	call   0x10008229
10001810:	83 c4 08             	add    esp,0x8
10001813:	8b c6                	mov    eax,esi
10001815:	8b 4d f4             	mov    ecx,dword ptr [ebp-0xc]
10001818:	64 89 0d 00 00 00 00 	mov    dword ptr fs:0x0,ecx
1000181f:	59                   	pop    ecx
