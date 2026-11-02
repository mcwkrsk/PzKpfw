
/mnt/data/is2_re_analysis_kit_stage1_17_continuation_2026-11-01/original/is.exe:     file format pei-i386


disassembly of section .text:

00410b10 <.text+0xfb10>:
  410b10:	55                   	push   ebp
  410b11:	8b ec                	mov    ebp,esp
  410b13:	83 ec 08             	sub    esp,0x8
  410b16:	56                   	push   esi
  410b17:	8b 75 08             	mov    esi,dword ptr [ebp+0x8]
  410b1a:	57                   	push   edi
  410b1b:	8b f9                	mov    edi,ecx
  410b1d:	8b ce                	mov    ecx,esi
  410b1f:	89 7d fc             	mov    dword ptr [ebp-0x4],edi
  410b22:	ff 15 ec 97 41 00    	call   dword ptr ds:0x4197ec
  410b28:	8b 06                	mov    eax,dword ptr [esi]
  410b2a:	8b ce                	mov    ecx,esi
  410b2c:	ff 35 ac 96 46 00    	push   dword ptr ds:0x4696ac
  410b32:	ff 90 cc 00 00 00    	call   dword ptr [eax+0xcc]
  410b38:	8b 06                	mov    eax,dword ptr [esi]
  410b3a:	8b ce                	mov    ecx,esi
  410b3c:	ff 90 c8 00 00 00    	call   dword ptr [eax+0xc8]
  410b42:	8b 06                	mov    eax,dword ptr [esi]
  410b44:	8b ce                	mov    ecx,esi
  410b46:	ff 90 b8 00 00 00    	call   dword ptr [eax+0xb8]
  410b4c:	8d 45 08             	lea    eax,[ebp+0x8]
  410b4f:	50                   	push   eax
  410b50:	8d 4f 30             	lea    ecx,[edi+0x30]
  410b53:	e8 98 0f ff ff       	call   0x401af0
  410b58:	8b 8f 88 00 00 00    	mov    ecx,dword ptr [edi+0x88]
  410b5e:	56                   	push   esi
  410b5f:	ff 15 9c 98 41 00    	call   dword ptr ds:0x41989c
  410b65:	6a 00                	push   0x0
  410b67:	68 b0 af 45 00       	push   0x45afb0
  410b6c:	57                   	push   edi
  410b6d:	68 cc af 45 00       	push   0x45afcc
  410b72:	8d 45 f8             	lea    eax,[ebp-0x8]
  410b75:	56                   	push   esi
  410b76:	50                   	push   eax
  410b77:	ff 15 cc 91 41 00    	call   dword ptr ds:0x4191cc
  410b7d:	83 c4 18             	add    esp,0x18
  410b80:	8d 4d f8             	lea    ecx,[ebp-0x8]
  410b83:	ff 15 dc 93 41 00    	call   dword ptr ds:0x4193dc
  410b89:	8b 06                	mov    eax,dword ptr [esi]
  410b8b:	8b ce                	mov    ecx,esi
  410b8d:	ff 90 b4 00 00 00    	call   dword ptr [eax+0xb4]
  410b93:	ff 75 fc             	push   dword ptr [ebp-0x4]
  410b96:	8b f8                	mov    edi,eax
  410b98:	8b cf                	mov    ecx,edi
  410b9a:	ff 15 5c 98 41 00    	call   dword ptr ds:0x41985c
  410ba0:	57                   	push   edi
  410ba1:	8b ce                	mov    ecx,esi
  410ba3:	e8 28 32 00 00       	call   0x413dd0
  410ba8:	8b 55 08             	mov    edx,dword ptr [ebp+0x8]
  410bab:	8d 77 1c             	lea    esi,[edi+0x1c]
  410bae:	83 c2 1c             	add    edx,0x1c
  410bb1:	8b ce                	mov    ecx,esi
  410bb3:	52                   	push   edx
  410bb4:	ff 15 cc 93 41 00    	call   dword ptr ds:0x4193cc
  410bba:	56                   	push   esi
  410bbb:	8b 75 fc             	mov    esi,dword ptr [ebp-0x4]
  410bbe:	57                   	push   edi
  410bbf:	8b 8e 80 00 00 00    	mov    ecx,dword ptr [esi+0x80]
  410bc5:	ff 15 80 98 41 00    	call   dword ptr ds:0x419880
  410bcb:	8b 4d 08             	mov    ecx,dword ptr [ebp+0x8]
  410bce:	ff 15 ec 97 41 00    	call   dword ptr ds:0x4197ec
  410bd4:	8b ce                	mov    ecx,esi
  410bd6:	ff 15 4c 98 41 00    	call   dword ptr ds:0x41984c
  410bdc:	5f                   	pop    edi
  410bdd:	5e                   	pop    esi
  410bde:	8b e5                	mov    esp,ebp
  410be0:	5d                   	pop    ebp
  410be1:	c2                   	.byte 0xc2
