
/mnt/data/is2_re_analysis_kit_stage1_17_continuation_2026-11-01/original/is.exe:     file format pei-i386


disassembly of section .text:

00413058 <.text+0x12058>:
  413058:	6a 18                	push   0x18
  41305a:	e8 2a 17 00 00       	call   0x414789
  41305f:	83 c4 04             	add    esp,0x4
  413062:	89 45 dc             	mov    dword ptr [ebp-0x24],eax
  413065:	c6 45 fc 33          	mov    byte ptr [ebp-0x4],0x33
  413069:	85 c0                	test   eax,eax
  41306b:	74 1d                	je     0x41308a
  41306d:	ff 77 04             	push   dword ptr [edi+0x4]
  413070:	8b c8                	mov    ecx,eax
  413072:	ff 15 78 98 41 00    	call   dword ptr ds:0x419878
  413078:	8b 55 dc             	mov    edx,dword ptr [ebp-0x24]
  41307b:	c7 02 b4 97 45 00    	mov    dword ptr [edx],0x4597b4
  413081:	c7 42 08 74 98 45 00 	mov    dword ptr [edx+0x8],0x459874
  413088:	eb 02                	jmp    0x41308c
  41308a:	33 d2                	xor    edx,edx
  41308c:	8d 45 dc             	lea    eax,[ebp-0x24]
  41308f:	89 57 48             	mov    dword ptr [edi+0x48],edx
  413092:	50                   	push   eax
  413093:	8d 4d f3             	lea    ecx,[ebp-0xd]
  413096:	e8 65 d7 ff ff       	call   0x410800
  41309b:	50                   	push   eax
  41309c:	8b ca                	mov    ecx,edx
  41309e:	c6 45 fc 34          	mov    byte ptr [ebp-0x4],0x34
  4130a2:	ff d6                	call   esi
  4130a4:	8d 4d dc             	lea    ecx,[ebp-0x24]
  4130a7:	c6 45 fc 2a          	mov    byte ptr [ebp-0x4],0x2a
  4130ab:	ff                   	.byte 0xff
  4130ac:	15                   	.byte 0x15
  4130ad:	d0                   	.byte 0xd0
  4130ae:	93                   	xchg   ebx,eax
  4130af:	41                   	inc    ecx
