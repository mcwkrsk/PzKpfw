
/mnt/data/is2_re_analysis_kit_stage1_17_continuation_2026-11-01/original/modules/model_visualiser.dll:     file format pei-i386


disassembly of section .text:

10007980 <.text+0x6980>:
10007980:	55                   	push   ebp
10007981:	8b ec                	mov    ebp,esp
10007983:	57                   	push   edi
10007984:	8b f9                	mov    edi,ecx
10007986:	6a 01                	push   0x1
10007988:	8b 4f 30             	mov    ecx,dword ptr [edi+0x30]
1000798b:	c7 07 b4 e4 00 10    	mov    dword ptr [edi],0x1000e4b4
10007991:	c7 47 08 88 e5 00 10 	mov    dword ptr [edi+0x8],0x1000e588
10007998:	ff 15 f8 d0 00 10    	call   dword ptr ds:0x1000d0f8
1000799e:	8b 4f 30             	mov    ecx,dword ptr [edi+0x30]
100079a1:	6a 00                	push   0x0
100079a3:	ff 15 f8 d0 00 10    	call   dword ptr ds:0x1000d0f8
100079a9:	8d 4f 1c             	lea    ecx,[edi+0x1c]
100079ac:	ff 15 68 d1 00 10    	call   dword ptr ds:0x1000d168
100079b2:	8b cf                	mov    ecx,edi
100079b4:	ff 15 54 d5 00 10    	call   dword ptr ds:0x1000d554
100079ba:	f6 45 08 01          	test   byte ptr [ebp+0x8],0x1
100079be:	74 0b                	je     0x100079cb
100079c0:	6a 64                	push   0x64
100079c2:	57                   	push   edi
100079c3:	e8 0b 2a 00 00       	call   0x1000a3d3
100079c8:	83 c4 08             	add    esp,0x8
100079cb:	8b c7                	mov    eax,edi
100079cd:	5f                   	pop    edi
100079ce:	5d                   	pop    ebp
100079cf:	c2 04 00             	ret    0x4
