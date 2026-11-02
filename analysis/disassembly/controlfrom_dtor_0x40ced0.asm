
/mnt/data/is2_re_analysis_kit_stage1_17_continuation_2026-11-01/original/is.exe:     file format pei-i386


disassembly of section .text:

0040ced0 <.text+0xbed0>:
  40ced0:	55                   	push   ebp
  40ced1:	8b ec                	mov    ebp,esp
  40ced3:	56                   	push   esi
  40ced4:	8b f1                	mov    esi,ecx
  40ced6:	8d 8e b0 00 00 00    	lea    ecx,[esi+0xb0]
  40cedc:	e8 af fc ff ff       	call   0x40cb90
  40cee1:	8d 8e ac 00 00 00    	lea    ecx,[esi+0xac]
  40cee7:	ff 15 98 9b 41 00    	call   dword ptr ds:0x419b98
  40ceed:	8d 8e a0 00 00 00    	lea    ecx,[esi+0xa0]
  40cef3:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  40cef9:	8d 8e 9c 00 00 00    	lea    ecx,[esi+0x9c]
  40ceff:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  40cf05:	8d 4e 1c             	lea    ecx,[esi+0x1c]
  40cf08:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  40cf0e:	8b ce                	mov    ecx,esi
  40cf10:	ff 15 10 9b 41 00    	call   dword ptr ds:0x419b10
  40cf16:	f6 45 08 01          	test   byte ptr [ebp+0x8],0x1
  40cf1a:	74 0e                	je     0x40cf2a
  40cf1c:	68 b8 00 00 00       	push   0xb8
  40cf21:	56                   	push   esi
  40cf22:	e8 95 78 00 00       	call   0x4147bc
  40cf27:	83 c4 08             	add    esp,0x8
  40cf2a:	8b c6                	mov    eax,esi
  40cf2c:	5e                   	pop    esi
  40cf2d:	5d                   	pop    ebp
  40cf2e:	c2 04 00             	ret    0x4
  40cf31:	cc                   	int3
  40cf32:	cc                   	int3
  40cf33:	cc                   	int3
  40cf34:	cc                   	int3
  40cf35:	cc                   	int3
  40cf36:	cc                   	int3
  40cf37:	cc                   	int3
  40cf38:	cc                   	int3
  40cf39:	cc                   	int3
  40cf3a:	cc                   	int3
  40cf3b:	cc                   	int3
  40cf3c:	cc                   	int3
  40cf3d:	cc                   	int3
  40cf3e:	cc                   	int3
  40cf3f:	cc                   	int3
  40cf40:	55                   	push   ebp
  40cf41:	8b ec                	mov    ebp,esp
  40cf43:	56                   	push   esi
  40cf44:	8b f1                	mov    esi,ecx
  40cf46:	ff 15 fc 92 41 00    	call   dword ptr ds:0x4192fc
  40cf4c:	f6 45 08 01          	test   byte ptr [ebp+0x8],0x1
  40cf50:	74 0b                	je     0x40cf5d
  40cf52:	6a 0c                	push   0xc
  40cf54:	56                   	push   esi
  40cf55:	e8 62 78 00 00       	call   0x4147bc
  40cf5a:	83 c4 08             	add    esp,0x8
  40cf5d:	8b c6                	mov    eax,esi
  40cf5f:	5e                   	pop    esi
