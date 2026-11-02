
/mnt/data/is2_re_analysis_kit_stage1_17_continuation_2026-11-01/original/is.exe:     file format pei-i386


disassembly of section .text:

00411a00 <.text+0x10a00>:
  411a00:	55                   	push   ebp
  411a01:	8b ec                	mov    ebp,esp
  411a03:	51                   	push   ecx
  411a04:	53                   	push   ebx
  411a05:	56                   	push   esi
  411a06:	57                   	push   edi
  411a07:	8b f9                	mov    edi,ecx
  411a09:	ff 15 d4 91 41 00    	call   dword ptr ds:0x4191d4
  411a0f:	8b 8f 80 00 00 00    	mov    ecx,dword ptr [edi+0x80]
  411a15:	8b d8                	mov    ebx,eax
  411a17:	33 f6                	xor    esi,esi
  411a19:	8b 43 20             	mov    eax,dword ptr [ebx+0x20]
  411a1c:	89 45 fc             	mov    dword ptr [ebp-0x4],eax
  411a1f:	ff 15 90 98 41 00    	call   dword ptr ds:0x419890
  411a25:	85 c0                	test   eax,eax
  411a27:	7e 33                	jle    0x411a5c
  411a29:	0f 1f 80 00 00 00 00 	nop    dword ptr [eax+0x0]
  411a30:	8b 8f 80 00 00 00    	mov    ecx,dword ptr [edi+0x80]
  411a36:	56                   	push   esi
  411a37:	ff 15 8c 98 41 00    	call   dword ptr ds:0x41988c
  411a3d:	8b 8f 80 00 00 00    	mov    ecx,dword ptr [edi+0x80]
  411a43:	39 45 fc             	cmp    dword ptr [ebp-0x4],eax
  411a46:	74 0d                	je     0x411a55
  411a48:	46                   	inc    esi
  411a49:	ff 15 90 98 41 00    	call   dword ptr ds:0x419890
  411a4f:	3b f0                	cmp    esi,eax
  411a51:	7c dd                	jl     0x411a30
  411a53:	eb 07                	jmp    0x411a5c
  411a55:	56                   	push   esi
  411a56:	ff 15 84 98 41 00    	call   dword ptr ds:0x419884
  411a5c:	83 c7 30             	add    edi,0x30
  411a5f:	8b cf                	mov    ecx,edi
  411a61:	ff 15 30 92 41 00    	call   dword ptr ds:0x419230
  411a67:	85 c0                	test   eax,eax
  411a69:	7e 78                	jle    0x411ae3
  411a6b:	6a ff                	push   0xffffffff
  411a6d:	8b cf                	mov    ecx,edi
  411a6f:	ff 15 b0 92 41 00    	call   dword ptr ds:0x4192b0
  411a75:	8b cf                	mov    ecx,edi
  411a77:	8b f0                	mov    esi,eax
  411a79:	ff 15 8c 93 41 00    	call   dword ptr ds:0x41938c
  411a7f:	83 c6 04             	add    esi,0x4
  411a82:	3b f0                	cmp    esi,eax
  411a84:	74 5d                	je     0x411ae3
  411a86:	39 1e                	cmp    dword ptr [esi],ebx
  411a88:	74 0e                	je     0x411a98
  411a8a:	83 c6 04             	add    esi,0x4
  411a8d:	3b f0                	cmp    esi,eax
  411a8f:	75 f5                	jne    0x411a86
  411a91:	5f                   	pop    edi
  411a92:	5e                   	pop    esi
  411a93:	5b                   	pop    ebx
  411a94:	8b e5                	mov    esp,ebp
  411a96:	5d                   	pop    ebp
  411a97:	c3                   	ret
  411a98:	8b cf                	mov    ecx,edi
  411a9a:	ff 15 90 93 41 00    	call   dword ptr ds:0x419390
  411aa0:	2b f0                	sub    esi,eax
  411aa2:	c1 fe 02             	sar    esi,0x2
  411aa5:	83 fe ff             	cmp    esi,0xffffffff
  411aa8:	74 39                	je     0x411ae3
  411aaa:	85 f6                	test   esi,esi
  411aac:	78 35                	js     0x411ae3
  411aae:	8b cf                	mov    ecx,edi
  411ab0:	ff 15 30 92 41 00    	call   dword ptr ds:0x419230
  411ab6:	3b f0                	cmp    esi,eax
  411ab8:	7d 29                	jge    0x411ae3
  411aba:	8b 0f                	mov    ecx,dword ptr [edi]
  411abc:	8b 01                	mov    eax,dword ptr [ecx]
  411abe:	83 f8 01             	cmp    eax,0x1
  411ac1:	74 0e                	je     0x411ad1
  411ac3:	85 c0                	test   eax,eax
  411ac5:	74 0a                	je     0x411ad1
  411ac7:	ff 71 04             	push   dword ptr [ecx+0x4]
  411aca:	8b cf                	mov    ecx,edi
  411acc:	e8 af f1 ff ff       	call   0x410c80
  411ad1:	56                   	push   esi
  411ad2:	8b cf                	mov    ecx,edi
  411ad4:	ff 15 b0 92 41 00    	call   dword ptr ds:0x4192b0
  411ada:	56                   	push   esi
  411adb:	8b cf                	mov    ecx,edi
  411add:	ff 15 34 92 41 00    	call   dword ptr ds:0x419234
  411ae3:	5f                   	pop    edi
  411ae4:	5e                   	pop    esi
  411ae5:	5b                   	pop    ebx
  411ae6:	8b e5                	mov    esp,ebp
  411ae8:	5d                   	pop    ebp
  411ae9:	c3                   	ret
