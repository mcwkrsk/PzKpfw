
/mnt/data/is2_re_analysis_kit_stage1_17_continuation_2026-11-01/original/modules/pm_auto.dll:     file format pei-i386


disassembly of section .text:

1001ae90 <.text+0x19e90>:
1001ae90:	55                   	push   ebp
1001ae91:	8b ec                	mov    ebp,esp
1001ae93:	51                   	push   ecx
1001ae94:	56                   	push   esi
1001ae95:	8b 75 24             	mov    esi,dword ptr [ebp+0x24]
1001ae98:	57                   	push   edi
1001ae99:	33 ff                	xor    edi,edi
1001ae9b:	c7 45 fc 00 00 00 00 	mov    dword ptr [ebp-0x4],0x0
1001aea2:	83 fe 02             	cmp    esi,0x2
1001aea5:	74 05                	je     0x1001aeac
1001aea7:	83 fe 03             	cmp    esi,0x3
1001aeaa:	75 07                	jne    0x1001aeb3
1001aeac:	e8 cf 6b ff ff       	call   0x10011a80
1001aeb1:	8b f8                	mov    edi,eax
1001aeb3:	6a 10                	push   0x10
1001aeb5:	e8 c1 1d 00 00       	call   0x1001cc7b
1001aeba:	83 c4 04             	add    esp,0x4
1001aebd:	89 45 24             	mov    dword ptr [ebp+0x24],eax
1001aec0:	85 c0                	test   eax,eax
1001aec2:	74 1b                	je     0x1001aedf
1001aec4:	c7 00 01 00 00 00    	mov    dword ptr [eax],0x1
1001aeca:	c7 40 04 10 b6 01 10 	mov    dword ptr [eax+0x4],0x1001b610
1001aed1:	8b 4d 1c             	mov    ecx,dword ptr [ebp+0x1c]
1001aed4:	89 48 08             	mov    dword ptr [eax+0x8],ecx
1001aed7:	8b 4d 20             	mov    ecx,dword ptr [ebp+0x20]
1001aeda:	89 48 0c             	mov    dword ptr [eax+0xc],ecx
1001aedd:	eb 02                	jmp    0x1001aee1
1001aedf:	33 c0                	xor    eax,eax
1001aee1:	ff 35 64 2e 02 10    	push   dword ptr ds:0x10022e64
1001aee7:	57                   	push   edi
1001aee8:	56                   	push   esi
1001aee9:	8b 75 08             	mov    esi,dword ptr [ebp+0x8]
1001aeec:	50                   	push   eax
1001aeed:	6a 00                	push   0x0
1001aeef:	ff 75 18             	push   dword ptr [ebp+0x18]
1001aef2:	8d 45 10             	lea    eax,[ebp+0x10]
1001aef5:	50                   	push   eax
1001aef6:	ff 75 0c             	push   dword ptr [ebp+0xc]
1001aef9:	56                   	push   esi
1001aefa:	ff 15 68 23 02 10    	call   dword ptr ds:0x10022368
1001af00:	83 c4 24             	add    esp,0x24
1001af03:	8b c6                	mov    eax,esi
1001af05:	5f                   	pop    edi
1001af06:	5e                   	pop    esi
1001af07:	8b e5                	mov    esp,ebp
1001af09:	5d                   	pop    ebp
1001af0a:	c3                   	ret
1001af0b:	cc                   	int3
1001af0c:	cc                   	int3
1001af0d:	cc                   	int3
1001af0e:	cc                   	int3
1001af0f:	cc                   	int3
1001af10:	55                   	push   ebp
1001af11:	8b ec                	mov    ebp,esp
1001af13:	51                   	push   ecx
1001af14:	8b 45 0c             	mov    eax,dword ptr [ebp+0xc]
1001af17:	6a 01                	push   0x1
1001af19:	ff 75 1c             	push   dword ptr [ebp+0x1c]
1001af1c:	c7 45 fc 00 00 00 00 	mov    dword ptr [ebp-0x4],0x0
1001af23:	ff 75 18             	push   dword ptr [ebp+0x18]
1001af26:	50                   	push   eax
1001af27:	ff 75 14             	push   dword ptr [ebp+0x14]
1001af2a:	ff 75 10             	push   dword ptr [ebp+0x10]
1001af2d:	50                   	push   eax
1001af2e:	ff 75 08             	push   dword ptr [ebp+0x8]
1001af31:	e8 5a ff ff ff       	call   0x1001ae90
1001af36:	8b 45 08             	mov    eax,dword ptr [ebp+0x8]
1001af39:	83 c4 20             	add    esp,0x20
1001af3c:	8b e5                	mov    esp,ebp
1001af3e:	5d                   	pop    ebp
1001af3f:	c3                   	ret
