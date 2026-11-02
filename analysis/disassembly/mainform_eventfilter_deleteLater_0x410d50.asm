
/mnt/data/is2_re_analysis_kit_stage1_17_continuation_2026-11-01/original/is.exe:     file format pei-i386


disassembly of section .text:

00410d50 <.text+0xfd50>:
  410d50:	55                   	push   ebp
  410d51:	8b ec                	mov    ebp,esp
  410d53:	53                   	push   ebx
  410d54:	8b 5d 0c             	mov    ebx,dword ptr [ebp+0xc]
  410d57:	56                   	push   esi
  410d58:	57                   	push   edi
  410d59:	8b 7d 08             	mov    edi,dword ptr [ebp+0x8]
  410d5c:	8b f1                	mov    esi,ecx
  410d5e:	0f b7 43 08          	movzx  eax,word ptr [ebx+0x8]
  410d62:	83 c0 ef             	add    eax,0xffffffef
  410d65:	83 f8 08             	cmp    eax,0x8
  410d68:	0f 87 e9 00 00 00    	ja     0x410e57
  410d6e:	ff 24 85 68 0e 41 00 	jmp    dword ptr [eax*4+0x410e68]
  410d75:	8b 47 14             	mov    eax,dword ptr [edi+0x14]
  410d78:	f7 40 0c 00 00 03 00 	test   dword ptr [eax+0xc],0x30000
  410d7f:	0f 84 d2 00 00 00    	je     0x410e57
  410d85:	f6 40 06 01          	test   byte ptr [eax+0x6],0x1
  410d89:	0f 84 c8 00 00 00    	je     0x410e57
  410d8f:	a1 dc 96 46 00       	mov    eax,ds:0x4696dc
  410d94:	ff 30                	push   dword ptr [eax]
  410d96:	ff 15 04 9c 41 00    	call   dword ptr ds:0x419c04
  410d9c:	53                   	push   ebx
  410d9d:	57                   	push   edi
  410d9e:	8b ce                	mov    ecx,esi
  410da0:	ff 15 18 93 41 00    	call   dword ptr ds:0x419318
  410da6:	5f                   	pop    edi
  410da7:	5e                   	pop    esi
  410da8:	5b                   	pop    ebx
  410da9:	5d                   	pop    ebp
  410daa:	c2 08 00             	ret    0x8
  410dad:	80 be a8 00 00 00 00 	cmp    byte ptr [esi+0xa8],0x0
  410db4:	74 16                	je     0x410dcc
  410db6:	a1 dc 96 46 00       	mov    eax,ds:0x4696dc
  410dbb:	6a 01                	push   0x1
  410dbd:	ff 30                	push   dword ptr [eax]
  410dbf:	ff 15 14 9c 41 00    	call   dword ptr ds:0x419c14
  410dc5:	c6 86 a8 00 00 00 00 	mov    byte ptr [esi+0xa8],0x0
  410dcc:	6a 37                	push   0x37
  410dce:	8b cf                	mov    ecx,edi
  410dd0:	ff 15 74 98 41 00    	call   dword ptr ds:0x419874
  410dd6:	84 c0                	test   al,al
  410dd8:	74 7d                	je     0x410e57
  410dda:	8b cf                	mov    ecx,edi
  410ddc:	ff 15 1c 98 41 00    	call   dword ptr ds:0x41981c
  410de2:	eb 67                	jmp    0x410e4b
  410de4:	8b cf                	mov    ecx,edi
  410de6:	ff 15 1c 98 41 00    	call   dword ptr ds:0x41981c
  410dec:	84 c0                	test   al,al
  410dee:	74 67                	je     0x410e57
  410df0:	8b ce                	mov    ecx,esi
  410df2:	ff 15 ec 97 41 00    	call   dword ptr ds:0x4197ec
  410df8:	8b 47 14             	mov    eax,dword ptr [edi+0x14]
  410dfb:	f7 40 0c 00 00 03 00 	test   dword ptr [eax+0xc],0x30000
  410e02:	74 53                	je     0x410e57
  410e04:	80 be a8 00 00 00 00 	cmp    byte ptr [esi+0xa8],0x0
  410e0b:	75 4a                	jne    0x410e57
  410e0d:	a1 dc 96 46 00       	mov    eax,ds:0x4696dc
  410e12:	6a 00                	push   0x0
  410e14:	ff 30                	push   dword ptr [eax]
  410e16:	ff 15 14 9c 41 00    	call   dword ptr ds:0x419c14
  410e1c:	53                   	push   ebx
  410e1d:	57                   	push   edi
  410e1e:	8b ce                	mov    ecx,esi
  410e20:	c6 86 a8 00 00 00 01 	mov    byte ptr [esi+0xa8],0x1
  410e27:	ff 15 18 93 41 00    	call   dword ptr ds:0x419318
  410e2d:	5f                   	pop    edi
  410e2e:	5e                   	pop    esi
  410e2f:	5b                   	pop    ebx
  410e30:	5d                   	pop    ebp
  410e31:	c2 08 00             	ret    0x8
  410e34:	a1 dc 96 46 00       	mov    eax,ds:0x4696dc
  410e39:	ff 30                	push   dword ptr [eax]
  410e3b:	ff 15 10 9c 41 00    	call   dword ptr ds:0x419c10
  410e41:	6a 37                	push   0x37
  410e43:	8b cf                	mov    ecx,edi
  410e45:	ff 15 74 98 41 00    	call   dword ptr ds:0x419874
  410e4b:	84 c0                	test   al,al
  410e4d:	74 08                	je     0x410e57
  410e4f:	8b ce                	mov    ecx,esi
  410e51:	ff 15 74 93 41 00    	call   dword ptr ds:0x419374
  410e57:	53                   	push   ebx
  410e58:	57                   	push   edi
  410e59:	8b ce                	mov    ecx,esi
  410e5b:	ff 15 18 93 41 00    	call   dword ptr ds:0x419318
  410e61:	5f                   	pop    edi
  410e62:	5e                   	pop    esi
  410e63:	5b                   	pop    ebx
  410e64:	5d                   	pop    ebp
  410e65:	c2 08 00             	ret    0x8
  410e68:	e4 0d                	in     al,0xd
  410e6a:	41                   	inc    ecx
  410e6b:	00                   	.byte 0
  410e6c:	ad                   	lods   eax,dword ptr ds:[esi]
  410e6d:	0d                   	.byte 0xd
  410e6e:	41                   	inc    ecx
	...
