
/mnt/data/is2_re_analysis_kit_stage1_17_continuation_2026-11-01/original/modules/pm_auto.dll:     file format pei-i386


disassembly of section .text:

1001d010 <.text+0x1c010>:
1001d010:	56                   	push   esi
1001d011:	57                   	push   edi
1001d012:	6a 00                	push   0x0
1001d014:	68 a0 0f 00 00       	push   0xfa0
1001d019:	68 1c 06 07 10       	push   0x1007061c
1001d01e:	e8 5b 0b 00 00       	call   0x1001db7e
1001d023:	83 c4 0c             	add    esp,0xc
1001d026:	68 48 d1 05 10       	push   0x1005d148
1001d02b:	ff 15 20 20 02 10    	call   dword ptr ds:0x10022020
1001d031:	8b f0                	mov    esi,eax
1001d033:	85 f6                	test   esi,esi
1001d035:	0f 84 8c 00 00 00    	je     0x1001d0c7
1001d03b:	68 64 d1 05 10       	push   0x1005d164
1001d040:	56                   	push   esi
1001d041:	ff 15 24 20 02 10    	call   dword ptr ds:0x10022024
1001d047:	68 80 d1 05 10       	push   0x1005d180
1001d04c:	56                   	push   esi
1001d04d:	8b d8                	mov    ebx,eax
1001d04f:	ff 15 24 20 02 10    	call   dword ptr ds:0x10022024
1001d055:	68 9c d1 05 10       	push   0x1005d19c
1001d05a:	56                   	push   esi
1001d05b:	8b f8                	mov    edi,eax
1001d05d:	ff 15 24 20 02 10    	call   dword ptr ds:0x10022024
1001d063:	8b f0                	mov    esi,eax
1001d065:	85 db                	test   ebx,ebx
1001d067:	74 37                	je     0x1001d0a0
1001d069:	85 ff                	test   edi,edi
1001d06b:	74 33                	je     0x1001d0a0
1001d06d:	85 f6                	test   esi,esi
1001d06f:	74 2f                	je     0x1001d0a0
1001d071:	83 25 38 06 07 10 00 	and    dword ptr ds:0x10070638,0x0
1001d078:	8b cb                	mov    ecx,ebx
1001d07a:	68 34 06 07 10       	push   0x10070634
1001d07f:	e8 ac 06 00 00       	call   0x1001d730
1001d084:	ff d3                	call   ebx
1001d086:	57                   	push   edi
1001d087:	e8 43 00 00 00       	call   0x1001d0cf
1001d08c:	56                   	push   esi
1001d08d:	a3 3c 06 07 10       	mov    ds:0x1007063c,eax
1001d092:	e8 38 00 00 00       	call   0x1001d0cf
1001d097:	59                   	pop    ecx
1001d098:	59                   	pop    ecx
1001d099:	a3 40 06 07 10       	mov    ds:0x10070640,eax
1001d09e:	eb 16                	jmp    0x1001d0b6
1001d0a0:	33 c0                	xor    eax,eax
1001d0a2:	50                   	push   eax
1001d0a3:	50                   	push   eax
1001d0a4:	6a 01                	push   0x1
1001d0a6:	50                   	push   eax
1001d0a7:	ff 15 1c 20 02 10    	call   dword ptr ds:0x1002201c
1001d0ad:	a3 38 06 07 10       	mov    ds:0x10070638,eax
1001d0b2:	85 c0                	test   eax,eax
1001d0b4:	74 11                	je     0x1001d0c7
1001d0b6:	68 ec d0 01 10       	push   0x1001d0ec
1001d0bb:	e8 95 fb ff ff       	call   0x1001cc55
1001d0c0:	59                   	pop    ecx
1001d0c1:	5f                   	pop    edi
1001d0c2:	5e                   	pop    esi
1001d0c3:	33 c0                	xor    eax,eax
1001d0c5:	5b                   	pop    ebx
1001d0c6:	c3                   	ret
1001d0c7:	6a 07                	push   0x7
1001d0c9:	e8 47 05 00 00       	call   0x1001d615
1001d0ce:	cc                   	int3
1001d0cf:	55                   	push   ebp
