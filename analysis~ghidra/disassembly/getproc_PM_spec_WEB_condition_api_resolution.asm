
/mnt/data/is2_re_analysis_kit_stage1_17_continuation_2026-11-01/original/modules/pm_spec_web.dll:     file format pei-i386


disassembly of section .text:

10008af0 <.text+0x7af0>:
10008af0:	68 e0 63 01 10       	push   0x100163e0
10008af5:	e8 c2 0f 00 00       	call   0x10009abc
10008afa:	83 c4 0c             	add    esp,0xc
10008afd:	68 90 e7 00 10       	push   0x1000e790
10008b02:	ff 15 14 c0 00 10    	call   dword ptr ds:0x1000c014
10008b08:	8b f0                	mov    esi,eax
10008b0a:	85 f6                	test   esi,esi
10008b0c:	0f 84 8c 00 00 00    	je     0x10008b9e
10008b12:	68 ac e7 00 10       	push   0x1000e7ac
10008b17:	56                   	push   esi
10008b18:	ff 15 18 c0 00 10    	call   dword ptr ds:0x1000c018
10008b1e:	68 c8 e7 00 10       	push   0x1000e7c8
10008b23:	56                   	push   esi
10008b24:	8b d8                	mov    ebx,eax
10008b26:	ff 15 18 c0 00 10    	call   dword ptr ds:0x1000c018
10008b2c:	68 e4 e7 00 10       	push   0x1000e7e4
10008b31:	56                   	push   esi
10008b32:	8b f8                	mov    edi,eax
10008b34:	ff 15 18 c0 00 10    	call   dword ptr ds:0x1000c018
10008b3a:	8b f0                	mov    esi,eax
10008b3c:	85 db                	test   ebx,ebx
10008b3e:	74 37                	je     0x10008b77
10008b40:	85 ff                	test   edi,edi
10008b42:	74 33                	je     0x10008b77
10008b44:	85 f6                	test   esi,esi
10008b46:	74 2f                	je     0x10008b77
10008b48:	83 25 fc 63 01 10 00 	and    dword ptr ds:0x100163fc,0x0
10008b4f:	8b cb                	mov    ecx,ebx
10008b51:	68 f8 63 01 10       	push   0x100163f8
10008b56:	e8 88 0a 00 00       	call   0x100095e3
10008b5b:	ff d3                	call   ebx
10008b5d:	57                   	push   edi
10008b5e:	e8 43 00 00 00       	call   0x10008ba6
10008b63:	56                   	push   esi
10008b64:	a3 00 64 01 10       	mov    ds:0x10016400,eax
10008b69:	e8 38 00 00 00       	call   0x10008ba6
10008b6e:	59                   	pop    ecx
10008b6f:	59                   	pop    ecx
10008b70:	a3 04 64 01 10       	mov    ds:0x10016404,eax
10008b75:	eb 16                	jmp    0x10008b8d
10008b77:	33 c0                	xor    eax,eax
10008b79:	50                   	push   eax
10008b7a:	50                   	push   eax
10008b7b:	6a 01                	push   0x1
10008b7d:	50                   	push   eax
10008b7e:	ff 15 10 c0 00 10    	call   dword ptr ds:0x1000c010
10008b84:	a3 fc 63 01 10       	mov    ds:0x100163fc,eax
10008b89:	85 c0                	test   eax,eax
10008b8b:	74 11                	je     0x10008b9e
10008b8d:	68 c3 8b 00 10       	push   0x10008bc3
10008b92:	e8 1c 09 00 00       	call   0x100094b3
10008b97:	59                   	pop    ecx
10008b98:	5f                   	pop    edi
10008b99:	5e                   	pop    esi
10008b9a:	33 c0                	xor    eax,eax
10008b9c:	5b                   	pop    ebx
10008b9d:	c3                   	ret
10008b9e:	6a 07                	push   0x7
