
/mnt/data/is2_re_analysis_kit_stage1_17_continuation_2026-11-01/original/is.exe:     file format pei-i386


disassembly of section .text:

00401680 <.text+0x680>:
  401680:	55                   	push   ebp
  401681:	8b ec                	mov    ebp,esp
  401683:	6a ff                	push   0xffffffff
  401685:	68 39 57 41 00       	push   0x415739
  40168a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  401690:	50                   	push   eax
  401691:	83 ec 08             	sub    esp,0x8
  401694:	56                   	push   esi
  401695:	a1 cc 90 46 00       	mov    eax,ds:0x4690cc
  40169a:	33 c5                	xor    eax,ebp
  40169c:	50                   	push   eax
  40169d:	8d 45 f4             	lea    eax,[ebp-0xc]
  4016a0:	64 a3 00 00 00 00    	mov    fs:0x0,eax
  4016a6:	8b f1                	mov    esi,ecx
  4016a8:	8b 0e                	mov    ecx,dword ptr [esi]
  4016aa:	e8 d1 04 00 00       	call   0x401b80
  4016af:	84 c0                	test   al,al
  4016b1:	74 54                	je     0x401707
  4016b3:	8b 0e                	mov    ecx,dword ptr [esi]
  4016b5:	8d 46 04             	lea    eax,[esi+0x4]
  4016b8:	50                   	push   eax
  4016b9:	81 c1 b0 00 00 00    	add    ecx,0xb0
  4016bf:	e8 fc fc ff ff       	call   0x4013c0
  4016c4:	51                   	push   ecx
  4016c5:	8b cc                	mov    ecx,esp
  4016c7:	50                   	push   eax
  4016c8:	ff 15 d4 93 41 00    	call   dword ptr ds:0x4193d4
  4016ce:	8b 0e                	mov    ecx,dword ptr [esi]
  4016d0:	e8 9b 11 00 00       	call   0x402870
  4016d5:	68 88 13 00 00       	push   0x1388
  4016da:	51                   	push   ecx
  4016db:	8b c4                	mov    eax,esp
  4016dd:	89 65 ec             	mov    dword ptr [ebp-0x14],esp
  4016e0:	50                   	push   eax
  4016e1:	8d 4d f3             	lea    ecx,[ebp-0xd]
  4016e4:	c6 45 f3 00          	mov    byte ptr [ebp-0xd],0x0
  4016e8:	e8 33 00 00 00       	call   0x401720
  4016ed:	c7 45 fc 00 00 00 00 	mov    dword ptr [ebp-0x4],0x0
  4016f4:	e8 a7 80 00 00       	call   0x4097a0
  4016f9:	8b c8                	mov    ecx,eax
  4016fb:	c7 45 fc ff ff ff ff 	mov    dword ptr [ebp-0x4],0xffffffff
  401702:	e8 79 09 01 00       	call   0x412080
  401707:	8b 4d f4             	mov    ecx,dword ptr [ebp-0xc]
  40170a:	64 89 0d 00 00 00 00 	mov    dword ptr fs:0x0,ecx
  401711:	59                   	pop    ecx
  401712:	5e                   	pop    esi
  401713:	8b e5                	mov    esp,ebp
  401715:	5d                   	pop    ebp
  401716:	c3                   	ret
  401717:	cc                   	int3
  401718:	cc                   	int3
  401719:	cc                   	int3
  40171a:	cc                   	int3
  40171b:	cc                   	int3
  40171c:	cc                   	int3
  40171d:	cc                   	int3
  40171e:	cc                   	int3
  40171f:	cc                   	int3
