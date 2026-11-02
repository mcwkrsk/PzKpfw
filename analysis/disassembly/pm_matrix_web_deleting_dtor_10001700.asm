
/mnt/data/is2_re_analysis_kit_stage1_17_continuation_2026-11-01/original/modules/pm_matrix_web.dll:     file format pei-i386


disassembly of section .text:

10001700 <.text+0x700>:
10001700:	55                   	push   ebp
10001701:	8b ec                	mov    ebp,esp
10001703:	51                   	push   ecx
10001704:	56                   	push   esi
10001705:	57                   	push   edi
10001706:	8b f9                	mov    edi,ecx
10001708:	8d 4f 58             	lea    ecx,[edi+0x58]
1000170b:	ff 15 e8 81 00 10    	call   dword ptr ds:0x100081e8
10001711:	8b 47 50             	mov    eax,dword ptr [edi+0x50]
10001714:	8d 4f 50             	lea    ecx,[edi+0x50]
10001717:	50                   	push   eax
10001718:	ff 30                	push   dword ptr [eax]
1000171a:	8d 45 fc             	lea    eax,[ebp-0x4]
1000171d:	50                   	push   eax
1000171e:	e8 3d 05 00 00       	call   0x10001c60
10001723:	6a 18                	push   0x18
10001725:	6a 01                	push   0x1
10001727:	ff 77 50             	push   dword ptr [edi+0x50]
1000172a:	e8 a1 00 00 00       	call   0x100017d0
1000172f:	83 c4 0c             	add    esp,0xc
10001732:	8d 4f 1c             	lea    ecx,[edi+0x1c]
10001735:	ff 15 e8 80 00 10    	call   dword ptr ds:0x100080e8
1000173b:	8b cf                	mov    ecx,edi
1000173d:	ff 15 54 85 00 10    	call   dword ptr ds:0x10008554
10001743:	f6 45 08 01          	test   byte ptr [ebp+0x8],0x1
10001747:	74 0b                	je     0x10001754
10001749:	6a 60                	push   0x60
1000174b:	57                   	push   edi
1000174c:	e8 72 43 00 00       	call   0x10005ac3
10001751:	83 c4 08             	add    esp,0x8
10001754:	8b c7                	mov    eax,edi
10001756:	5f                   	pop    edi
10001757:	5e                   	pop    esi
10001758:	8b e5                	mov    esp,ebp
1000175a:	5d                   	pop    ebp
1000175b:	c2 04 00             	ret    0x4
