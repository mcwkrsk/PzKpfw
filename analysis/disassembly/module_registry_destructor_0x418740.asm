
/mnt/data/is2_re_analysis_kit_stage1_17_continuation_2026-11-01/original/is.exe:     file format pei-i386


disassembly of section .text:

00418740 <.text+0x17740>:
  418740:	8b 0d b8 96 46 00    	mov    ecx,dword ptr ds:0x4696b8
  418746:	8b 01                	mov    eax,dword ptr [ecx]
  418748:	85 c0                	test   eax,eax
  41874a:	74 19                	je     0x418765
  41874c:	83 f8 ff             	cmp    eax,0xffffffff
  41874f:	74 22                	je     0x418773
  418751:	83 c8 ff             	or     eax,0xffffffff
  418754:	f0 0f c1 01          	lock xadd dword ptr [ecx],eax
  418758:	0f 95 c0             	setne  al
  41875b:	84 c0                	test   al,al
  41875d:	75 14                	jne    0x418773
  41875f:	8b 0d b8 96 46 00    	mov    ecx,dword ptr ds:0x4696b8
  418765:	6a 04                	push   0x4
  418767:	6a 04                	push   0x4
  418769:	51                   	push   ecx
  41876a:	ff 15 e0 92 41 00    	call   dword ptr ds:0x4192e0
  418770:	83 c4 0c             	add    esp,0xc
  418773:	c3                   	ret
