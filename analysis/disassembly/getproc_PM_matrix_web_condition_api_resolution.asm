
/mnt/data/is2_re_analysis_kit_stage1_17_continuation_2026-11-01/original/modules/pm_matrix_web.dll:     file format pei-i386


disassembly of section .text:

10005e30 <.text+0x4e30>:
10005e30:	53                   	push   ebx
10005e31:	56                   	push   esi
10005e32:	57                   	push   edi
10005e33:	6a 00                	push   0x0
10005e35:	68 a0 0f 00 00       	push   0xfa0
10005e3a:	68 24 f3 00 10       	push   0x1000f324
10005e3f:	e8 62 0c 00 00       	call   0x10006aa6
10005e44:	83 c4 0c             	add    esp,0xc
10005e47:	68 94 95 00 10       	push   0x10009594
10005e4c:	ff 15 20 80 00 10    	call   dword ptr ds:0x10008020
10005e52:	8b f0                	mov    esi,eax
10005e54:	85 f6                	test   esi,esi
10005e56:	0f 84 8c 00 00 00    	je     0x10005ee8
10005e5c:	68 b0 95 00 10       	push   0x100095b0
10005e61:	56                   	push   esi
10005e62:	ff 15 24 80 00 10    	call   dword ptr ds:0x10008024
10005e68:	68 cc 95 00 10       	push   0x100095cc
10005e6d:	56                   	push   esi
10005e6e:	8b d8                	mov    ebx,eax
10005e70:	ff 15 24 80 00 10    	call   dword ptr ds:0x10008024
10005e76:	68 e8 95 00 10       	push   0x100095e8
10005e7b:	56                   	push   esi
10005e7c:	8b f8                	mov    edi,eax
10005e7e:	ff 15 24 80 00 10    	call   dword ptr ds:0x10008024
10005e84:	8b f0                	mov    esi,eax
10005e86:	85 db                	test   ebx,ebx
10005e88:	74 37                	je     0x10005ec1
10005e8a:	85 ff                	test   edi,edi
10005e8c:	74 33                	je     0x10005ec1
10005e8e:	85 f6                	test   esi,esi
10005e90:	74 2f                	je     0x10005ec1
10005e92:	83 25 40 f3 00 10 00 	and    dword ptr ds:0x1000f340,0x0
10005e99:	8b cb                	mov    ecx,ebx
10005e9b:	68 3c f3 00 10       	push   0x1000f33c
10005ea0:	e8 a7 09 00 00       	call   0x1000684c
10005ea5:	ff d3                	call   ebx
10005ea7:	57                   	push   edi
10005ea8:	e8 43 00 00 00       	call   0x10005ef0
10005ead:	56                   	push   esi
10005eae:	a3 44 f3 00 10       	mov    ds:0x1000f344,eax
10005eb3:	e8 38 00 00 00       	call   0x10005ef0
10005eb8:	59                   	pop    ecx
10005eb9:	59                   	pop    ecx
10005eba:	a3 48 f3 00 10       	mov    ds:0x1000f348,eax
10005ebf:	eb 16                	jmp    0x10005ed7
10005ec1:	33 c0                	xor    eax,eax
10005ec3:	50                   	push   eax
10005ec4:	50                   	push   eax
10005ec5:	6a 01                	push   0x1
10005ec7:	50                   	push   eax
10005ec8:	ff 15 1c 80 00 10    	call   dword ptr ds:0x1000801c
10005ece:	a3 40 f3 00 10       	mov    ds:0x1000f340,eax
10005ed3:	85 c0                	test   eax,eax
10005ed5:	74 11                	je     0x10005ee8
10005ed7:	68 0d 5f 00 10       	push   0x10005f0d
10005edc:	e8 e0 06 00 00       	call   0x100065c1
10005ee1:	59                   	pop    ecx
10005ee2:	5f                   	pop    edi
10005ee3:	5e                   	pop    esi
10005ee4:	33 c0                	xor    eax,eax
10005ee6:	5b                   	pop    ebx
10005ee7:	c3                   	ret
10005ee8:	6a 07                	push   0x7
10005eea:	e8 ec 07 00 00       	call   0x100066db
10005eef:	cc                   	int3
