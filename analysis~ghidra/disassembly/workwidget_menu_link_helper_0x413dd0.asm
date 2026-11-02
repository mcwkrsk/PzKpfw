
/mnt/data/is2_re_analysis_kit_stage1_17_continuation_2026-11-01/original/is.exe:     file format pei-i386


disassembly of section .text:

00413dd0 <.text+0x12dd0>:
  413dd0:	55                   	push   ebp
  413dd1:	8b ec                	mov    ebp,esp
  413dd3:	8b 55 08             	mov    edx,dword ptr [ebp+0x8]
  413dd6:	89 51 20             	mov    dword ptr [ecx+0x20],edx
  413dd9:	8b 02                	mov    eax,dword ptr [edx]
  413ddb:	89 4a 18             	mov    dword ptr [edx+0x18],ecx
  413dde:	8b ca                	mov    ecx,edx
  413de0:	ff 90 b4 00 00 00    	call   dword ptr [eax+0xb4]
  413de6:	5d                   	pop    ebp
  413de7:	c2                   	.byte 0xc2
