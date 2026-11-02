
===== MainForm qt_static_metacall and dispatch jump table [0x00403250..0x004032f0) =====

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/IS.exe:     file format pei-i386


Disassembly of section .text:

00403250 <.text+0x2250>:
  403250:	55                   	push   ebp
  403251:	8b ec                	mov    ebp,esp
  403253:	83 7d 0c 00          	cmp    DWORD PTR [ebp+0xc],0x0
  403257:	75 73                	jne    0x4032cc
  403259:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
  40325c:	83 f8 08             	cmp    eax,0x8
  40325f:	77 6b                	ja     0x4032cc
  403261:	ff 24 85 d0 32 40 00 	jmp    DWORD PTR [eax*4+0x4032d0]
  403268:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  40326b:	5d                   	pop    ebp
  40326c:	e9 8f e7 00 00       	jmp    0x411a00
  403271:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
  403274:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  403277:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
  40327a:	ff 30                	push   DWORD PTR [eax]
  40327c:	e8 3f e3 00 00       	call   0x4115c0
  403281:	5d                   	pop    ebp
  403282:	c3                   	ret
  403283:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  403286:	5d                   	pop    ebp
  403287:	e9 14 e7 00 00       	jmp    0x4119a0
  40328c:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  40328f:	5d                   	pop    ebp
  403290:	e9 4b e7 00 00       	jmp    0x4119e0
  403295:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  403298:	5d                   	pop    ebp
  403299:	e9 c2 e4 00 00       	jmp    0x411760
  40329e:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  4032a1:	5d                   	pop    ebp
  4032a2:	e9 a9 e2 00 00       	jmp    0x411550
  4032a7:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  4032aa:	5d                   	pop    ebp
  4032ab:	e9 20 e2 00 00       	jmp    0x4114d0
  4032b0:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  4032b3:	5d                   	pop    ebp
  4032b4:	e9 57 e1 00 00       	jmp    0x411410
  4032b9:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
  4032bc:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  4032bf:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
  4032c2:	8b 11                	mov    edx,DWORD PTR [ecx]
  4032c4:	ff 30                	push   DWORD PTR [eax]
  4032c6:	ff 92 98 00 00 00    	call   DWORD PTR [edx+0x98]
  4032cc:	5d                   	pop    ebp
  4032cd:	c3                   	ret
  4032ce:	66 90                	xchg   ax,ax
  4032d0:	68 32 40 00 71       	push   0x71004032
  4032d5:	32 40 00             	xor    al,BYTE PTR [eax+0x0]
  4032d8:	83 32 40             	xor    DWORD PTR [edx],0x40
  4032db:	00 8c 32 40 00 95 32 	add    BYTE PTR [edx+esi*1+0x32950040],cl
  4032e2:	40                   	inc    eax
  4032e3:	00 9e 32 40 00 a7    	add    BYTE PTR [esi-0x58ffbfce],bl
  4032e9:	32 40 00             	xor    al,BYTE PTR [eax+0x0]
  4032ec:	b0 32                	mov    al,0x32
  4032ee:	40                   	inc    eax
	...

===== MainForm WorkWidget registration and destroyed() connection [0x00410b10..0x00410be4) =====

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/IS.exe:     file format pei-i386


Disassembly of section .text:

00410b10 <.text+0xfb10>:
  410b10:	55                   	push   ebp
  410b11:	8b ec                	mov    ebp,esp
  410b13:	83 ec 08             	sub    esp,0x8
  410b16:	56                   	push   esi
  410b17:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
  410b1a:	57                   	push   edi
  410b1b:	8b f9                	mov    edi,ecx
  410b1d:	8b ce                	mov    ecx,esi
  410b1f:	89 7d fc             	mov    DWORD PTR [ebp-0x4],edi
  410b22:	ff 15 ec 97 41 00    	call   DWORD PTR ds:0x4197ec
  410b28:	8b 06                	mov    eax,DWORD PTR [esi]
  410b2a:	8b ce                	mov    ecx,esi
  410b2c:	ff 35 ac 96 46 00    	push   DWORD PTR ds:0x4696ac
  410b32:	ff 90 cc 00 00 00    	call   DWORD PTR [eax+0xcc]
  410b38:	8b 06                	mov    eax,DWORD PTR [esi]
  410b3a:	8b ce                	mov    ecx,esi
  410b3c:	ff 90 c8 00 00 00    	call   DWORD PTR [eax+0xc8]
  410b42:	8b 06                	mov    eax,DWORD PTR [esi]
  410b44:	8b ce                	mov    ecx,esi
  410b46:	ff 90 b8 00 00 00    	call   DWORD PTR [eax+0xb8]
  410b4c:	8d 45 08             	lea    eax,[ebp+0x8]
  410b4f:	50                   	push   eax
  410b50:	8d 4f 30             	lea    ecx,[edi+0x30]
  410b53:	e8 98 0f ff ff       	call   0x401af0
  410b58:	8b 8f 88 00 00 00    	mov    ecx,DWORD PTR [edi+0x88]
  410b5e:	56                   	push   esi
  410b5f:	ff 15 9c 98 41 00    	call   DWORD PTR ds:0x41989c
  410b65:	6a 00                	push   0x0
  410b67:	68 b0 af 45 00       	push   0x45afb0
  410b6c:	57                   	push   edi
  410b6d:	68 cc af 45 00       	push   0x45afcc
  410b72:	8d 45 f8             	lea    eax,[ebp-0x8]
  410b75:	56                   	push   esi
  410b76:	50                   	push   eax
  410b77:	ff 15 cc 91 41 00    	call   DWORD PTR ds:0x4191cc
  410b7d:	83 c4 18             	add    esp,0x18
  410b80:	8d 4d f8             	lea    ecx,[ebp-0x8]
  410b83:	ff 15 dc 93 41 00    	call   DWORD PTR ds:0x4193dc
  410b89:	8b 06                	mov    eax,DWORD PTR [esi]
  410b8b:	8b ce                	mov    ecx,esi
  410b8d:	ff 90 b4 00 00 00    	call   DWORD PTR [eax+0xb4]
  410b93:	ff 75 fc             	push   DWORD PTR [ebp-0x4]
  410b96:	8b f8                	mov    edi,eax
  410b98:	8b cf                	mov    ecx,edi
  410b9a:	ff 15 5c 98 41 00    	call   DWORD PTR ds:0x41985c
  410ba0:	57                   	push   edi
  410ba1:	8b ce                	mov    ecx,esi
  410ba3:	e8 28 32 00 00       	call   0x413dd0
  410ba8:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  410bab:	8d 77 1c             	lea    esi,[edi+0x1c]
  410bae:	83 c2 1c             	add    edx,0x1c
  410bb1:	8b ce                	mov    ecx,esi
  410bb3:	52                   	push   edx
  410bb4:	ff 15 cc 93 41 00    	call   DWORD PTR ds:0x4193cc
  410bba:	56                   	push   esi
  410bbb:	8b 75 fc             	mov    esi,DWORD PTR [ebp-0x4]
  410bbe:	57                   	push   edi
  410bbf:	8b 8e 80 00 00 00    	mov    ecx,DWORD PTR [esi+0x80]
  410bc5:	ff 15 80 98 41 00    	call   DWORD PTR ds:0x419880
  410bcb:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  410bce:	ff 15 ec 97 41 00    	call   DWORD PTR ds:0x4197ec
  410bd4:	8b ce                	mov    ecx,esi
  410bd6:	ff 15 4c 98 41 00    	call   DWORD PTR ds:0x41984c
  410bdc:	5f                   	pop    edi
  410bdd:	5e                   	pop    esi
  410bde:	8b e5                	mov    esp,ebp
  410be0:	5d                   	pop    ebp
  410be1:	c2 04 00             	ret    0x4

===== Qt QListData detach helper reached before registry removal [0x00410c80..0x00410d50) =====

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/IS.exe:     file format pei-i386


Disassembly of section .text:

00410c80 <.text+0xfc80>:
  410c80:	55                   	push   ebp
  410c81:	8b ec                	mov    ebp,esp
  410c83:	6a ff                	push   0xffffffff
  410c85:	68 a0 80 41 00       	push   0x4180a0
  410c8a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  410c90:	50                   	push   eax
  410c91:	83 ec 08             	sub    esp,0x8
  410c94:	53                   	push   ebx
  410c95:	56                   	push   esi
  410c96:	57                   	push   edi
  410c97:	a1 cc 90 46 00       	mov    eax,ds:0x4690cc
  410c9c:	33 c5                	xor    eax,ebp
  410c9e:	50                   	push   eax
  410c9f:	8d 45 f4             	lea    eax,[ebp-0xc]
  410ca2:	64 a3 00 00 00 00    	mov    fs:0x0,eax
  410ca8:	89 65 f0             	mov    DWORD PTR [ebp-0x10],esp
  410cab:	8b f9                	mov    edi,ecx
  410cad:	89 7d ec             	mov    DWORD PTR [ebp-0x14],edi
  410cb0:	ff 15 90 93 41 00    	call   DWORD PTR ds:0x419390
  410cb6:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  410cb9:	8b cf                	mov    ecx,edi
  410cbb:	8b d8                	mov    ebx,eax
  410cbd:	ff 15 a4 93 41 00    	call   DWORD PTR ds:0x4193a4
  410cc3:	8b f0                	mov    esi,eax
  410cc5:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
  410ccc:	53                   	push   ebx
  410ccd:	8b cf                	mov    ecx,edi
  410ccf:	89 75 08             	mov    DWORD PTR [ebp+0x8],esi
  410cd2:	ff 15 8c 93 41 00    	call   DWORD PTR ds:0x41938c
  410cd8:	50                   	push   eax
  410cd9:	8b cf                	mov    ecx,edi
  410cdb:	ff 15 90 93 41 00    	call   DWORD PTR ds:0x419390
  410ce1:	50                   	push   eax
  410ce2:	8b cf                	mov    ecx,edi
  410ce4:	e8 37 16 ff ff       	call   0x402320
  410ce9:	8b 06                	mov    eax,DWORD PTR [esi]
  410ceb:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
  410cf2:	85 c0                	test   eax,eax
  410cf4:	74 13                	je     0x410d09
  410cf6:	83 f8 ff             	cmp    eax,0xffffffff
  410cf9:	74 18                	je     0x410d13
  410cfb:	83 c8 ff             	or     eax,0xffffffff
  410cfe:	f0 0f c1 06          	lock xadd DWORD PTR [esi],eax
  410d02:	0f 95 c0             	setne  al
  410d05:	84 c0                	test   al,al
  410d07:	75 0a                	jne    0x410d13
  410d09:	56                   	push   esi
  410d0a:	ff 15 98 93 41 00    	call   DWORD PTR ds:0x419398
  410d10:	83 c4 04             	add    esp,0x4
  410d13:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
  410d16:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  410d1d:	59                   	pop    ecx
  410d1e:	5f                   	pop    edi
  410d1f:	5e                   	pop    esi
  410d20:	5b                   	pop    ebx
  410d21:	8b e5                	mov    esp,ebp
  410d23:	5d                   	pop    ebp
  410d24:	c2 04 00             	ret    0x4
  410d27:	8b 75 ec             	mov    esi,DWORD PTR [ebp-0x14]
  410d2a:	ff 36                	push   DWORD PTR [esi]
  410d2c:	ff 15 98 93 41 00    	call   DWORD PTR ds:0x419398
  410d32:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  410d35:	83 c4 04             	add    esp,0x4
  410d38:	89 06                	mov    DWORD PTR [esi],eax
  410d3a:	6a 00                	push   0x0
  410d3c:	6a 00                	push   0x0
  410d3e:	e8 c1 46 00 00       	call   0x415404
  410d43:	cc                   	int3
  410d44:	cc                   	int3
  410d45:	cc                   	int3
  410d46:	cc                   	int3
  410d47:	cc                   	int3
  410d48:	cc                   	int3
  410d49:	cc                   	int3
  410d4a:	cc                   	int3
  410d4b:	cc                   	int3
  410d4c:	cc                   	int3
  410d4d:	cc                   	int3
  410d4e:	cc                   	int3
  410d4f:	cc                   	int3

===== MainForm::on_workWidget_destroyed [0x00411a00..0x00411af0) =====

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/IS.exe:     file format pei-i386


Disassembly of section .text:

00411a00 <.text+0x10a00>:
  411a00:	55                   	push   ebp
  411a01:	8b ec                	mov    ebp,esp
  411a03:	51                   	push   ecx
  411a04:	53                   	push   ebx
  411a05:	56                   	push   esi
  411a06:	57                   	push   edi
  411a07:	8b f9                	mov    edi,ecx
  411a09:	ff 15 d4 91 41 00    	call   DWORD PTR ds:0x4191d4
  411a0f:	8b 8f 80 00 00 00    	mov    ecx,DWORD PTR [edi+0x80]
  411a15:	8b d8                	mov    ebx,eax
  411a17:	33 f6                	xor    esi,esi
  411a19:	8b 43 20             	mov    eax,DWORD PTR [ebx+0x20]
  411a1c:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
  411a1f:	ff 15 90 98 41 00    	call   DWORD PTR ds:0x419890
  411a25:	85 c0                	test   eax,eax
  411a27:	7e 33                	jle    0x411a5c
  411a29:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [eax+0x0]
  411a30:	8b 8f 80 00 00 00    	mov    ecx,DWORD PTR [edi+0x80]
  411a36:	56                   	push   esi
  411a37:	ff 15 8c 98 41 00    	call   DWORD PTR ds:0x41988c
  411a3d:	8b 8f 80 00 00 00    	mov    ecx,DWORD PTR [edi+0x80]
  411a43:	39 45 fc             	cmp    DWORD PTR [ebp-0x4],eax
  411a46:	74 0d                	je     0x411a55
  411a48:	46                   	inc    esi
  411a49:	ff 15 90 98 41 00    	call   DWORD PTR ds:0x419890
  411a4f:	3b f0                	cmp    esi,eax
  411a51:	7c dd                	jl     0x411a30
  411a53:	eb 07                	jmp    0x411a5c
  411a55:	56                   	push   esi
  411a56:	ff 15 84 98 41 00    	call   DWORD PTR ds:0x419884
  411a5c:	83 c7 30             	add    edi,0x30
  411a5f:	8b cf                	mov    ecx,edi
  411a61:	ff 15 30 92 41 00    	call   DWORD PTR ds:0x419230
  411a67:	85 c0                	test   eax,eax
  411a69:	7e 78                	jle    0x411ae3
  411a6b:	6a ff                	push   0xffffffff
  411a6d:	8b cf                	mov    ecx,edi
  411a6f:	ff 15 b0 92 41 00    	call   DWORD PTR ds:0x4192b0
  411a75:	8b cf                	mov    ecx,edi
  411a77:	8b f0                	mov    esi,eax
  411a79:	ff 15 8c 93 41 00    	call   DWORD PTR ds:0x41938c
  411a7f:	83 c6 04             	add    esi,0x4
  411a82:	3b f0                	cmp    esi,eax
  411a84:	74 5d                	je     0x411ae3
  411a86:	39 1e                	cmp    DWORD PTR [esi],ebx
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
  411a9a:	ff 15 90 93 41 00    	call   DWORD PTR ds:0x419390
  411aa0:	2b f0                	sub    esi,eax
  411aa2:	c1 fe 02             	sar    esi,0x2
  411aa5:	83 fe ff             	cmp    esi,0xffffffff
  411aa8:	74 39                	je     0x411ae3
  411aaa:	85 f6                	test   esi,esi
  411aac:	78 35                	js     0x411ae3
  411aae:	8b cf                	mov    ecx,edi
  411ab0:	ff 15 30 92 41 00    	call   DWORD PTR ds:0x419230
  411ab6:	3b f0                	cmp    esi,eax
  411ab8:	7d 29                	jge    0x411ae3
  411aba:	8b 0f                	mov    ecx,DWORD PTR [edi]
  411abc:	8b 01                	mov    eax,DWORD PTR [ecx]
  411abe:	83 f8 01             	cmp    eax,0x1
  411ac1:	74 0e                	je     0x411ad1
  411ac3:	85 c0                	test   eax,eax
  411ac5:	74 0a                	je     0x411ad1
  411ac7:	ff 71 04             	push   DWORD PTR [ecx+0x4]
  411aca:	8b cf                	mov    ecx,edi
  411acc:	e8 af f1 ff ff       	call   0x410c80
  411ad1:	56                   	push   esi
  411ad2:	8b cf                	mov    ecx,edi
  411ad4:	ff 15 b0 92 41 00    	call   DWORD PTR ds:0x4192b0
  411ada:	56                   	push   esi
  411adb:	8b cf                	mov    ecx,edi
  411add:	ff 15 34 92 41 00    	call   DWORD PTR ds:0x419234
  411ae3:	5f                   	pop    edi
  411ae4:	5e                   	pop    esi
  411ae5:	5b                   	pop    ebx
  411ae6:	8b e5                	mov    esp,ebp
  411ae8:	5d                   	pop    ebp
  411ae9:	c3                   	ret
  411aea:	cc                   	int3
  411aeb:	cc                   	int3
  411aec:	cc                   	int3
  411aed:	cc                   	int3
  411aee:	cc                   	int3
  411aef:	cc                   	int3

===== module QListData collection copy/assignment helper [0x00404320..0x00404340) =====

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/IS.exe:     file format pei-i386


Disassembly of section .text:

00404320 <.text+0x3320>:
  404320:	55                   	push   ebp
  404321:	8b ec                	mov    ebp,esp
  404323:	51                   	push   ecx
  404324:	8d 41 0c             	lea    eax,[ecx+0xc]
  404327:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
  40432e:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  404331:	50                   	push   eax
  404332:	e8 d9 f7 ff ff       	call   0x403b10
  404337:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  40433a:	8b e5                	mov    esp,ebp
  40433c:	5d                   	pop    ebp
  40433d:	c2 04 00             	ret    0x4

===== IS.exe module loader / loadModule resolution [0x00404340..0x004045fb) =====

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/IS.exe:     file format pei-i386


Disassembly of section .text:

00404340 <.text+0x3340>:
  404340:	55                   	push   ebp
  404341:	8b ec                	mov    ebp,esp
  404343:	6a ff                	push   0xffffffff
  404345:	68 6f 5d 41 00       	push   0x415d6f
  40434a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  404350:	50                   	push   eax
  404351:	83 ec 40             	sub    esp,0x40
  404354:	53                   	push   ebx
  404355:	56                   	push   esi
  404356:	57                   	push   edi
  404357:	a1 cc 90 46 00       	mov    eax,ds:0x4690cc
  40435c:	33 c5                	xor    eax,ebp
  40435e:	50                   	push   eax
  40435f:	8d 45 f4             	lea    eax,[ebp-0xc]
  404362:	64 a3 00 00 00 00    	mov    fs:0x0,eax
  404368:	8b 15 b4 96 46 00    	mov    edx,DWORD PTR ds:0x4696b4
  40436e:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [ebp-0x4],0x1
  404375:	8b 4a 04             	mov    ecx,DWORD PTR [edx+0x4]
  404378:	8b 42 0c             	mov    eax,DWORD PTR [edx+0xc]
  40437b:	8b 72 0c             	mov    esi,DWORD PTR [edx+0xc]
  40437e:	03 f2                	add    esi,edx
  404380:	8d 3c 88             	lea    edi,[eax+ecx*4]
  404383:	03 fa                	add    edi,edx
  404385:	3b f7                	cmp    esi,edi
  404387:	74 20                	je     0x4043a9
  404389:	8b 1d b8 93 41 00    	mov    ebx,DWORD PTR ds:0x4193b8
  40438f:	90                   	nop
  404390:	8d 45 08             	lea    eax,[ebp+0x8]
  404393:	50                   	push   eax
  404394:	56                   	push   esi
  404395:	ff d3                	call   ebx
  404397:	83 c4 08             	add    esp,0x8
  40439a:	84 c0                	test   al,al
  40439c:	0f 85 b9 01 00 00    	jne    0x40455b
  4043a2:	83 c6 04             	add    esi,0x4
  4043a5:	3b f7                	cmp    esi,edi
  4043a7:	75 e7                	jne    0x404390
  4043a9:	8d 45 e4             	lea    eax,[ebp-0x1c]
  4043ac:	50                   	push   eax
  4043ad:	ff 15 f4 92 41 00    	call   DWORD PTR ds:0x4192f4
  4043b3:	68 88 7a 45 00       	push   0x457a88
  4043b8:	50                   	push   eax
  4043b9:	8d 45 f0             	lea    eax,[ebp-0x10]
  4043bc:	c6 45 fc 04          	mov    BYTE PTR [ebp-0x4],0x4
  4043c0:	50                   	push   eax
  4043c1:	e8 2a d1 ff ff       	call   0x4014f0
  4043c6:	83 c4 10             	add    esp,0x10
  4043c9:	50                   	push   eax
  4043ca:	8d 4d e8             	lea    ecx,[ebp-0x18]
  4043cd:	c6 45 fc 05          	mov    BYTE PTR [ebp-0x4],0x5
  4043d1:	ff 15 98 92 41 00    	call   DWORD PTR ds:0x419298
  4043d7:	8d 4d f0             	lea    ecx,[ebp-0x10]
  4043da:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  4043e0:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  4043e3:	c6 45 fc 08          	mov    BYTE PTR [ebp-0x4],0x8
  4043e7:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  4043ed:	8d 45 dc             	lea    eax,[ebp-0x24]
  4043f0:	50                   	push   eax
  4043f1:	8d 4d e8             	lea    ecx,[ebp-0x18]
  4043f4:	ff 15 90 92 41 00    	call   DWORD PTR ds:0x419290
  4043fa:	68 94 7a 45 00       	push   0x457a94
  4043ff:	50                   	push   eax
  404400:	8d 45 e0             	lea    eax,[ebp-0x20]
  404403:	c6 45 fc 09          	mov    BYTE PTR [ebp-0x4],0x9
  404407:	50                   	push   eax
  404408:	e8 e3 d0 ff ff       	call   0x4014f0
  40440d:	8d 4d 08             	lea    ecx,[ebp+0x8]
  404410:	c6 45 fc 0a          	mov    BYTE PTR [ebp-0x4],0xa
  404414:	51                   	push   ecx
  404415:	50                   	push   eax
  404416:	8d 45 ec             	lea    eax,[ebp-0x14]
  404419:	50                   	push   eax
  40441a:	e8 61 d0 ff ff       	call   0x401480
  40441f:	83 c4 18             	add    esp,0x18
  404422:	8d 4d e0             	lea    ecx,[ebp-0x20]
  404425:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40442b:	8d 4d dc             	lea    ecx,[ebp-0x24]
  40442e:	c6 45 fc 0d          	mov    BYTE PTR [ebp-0x4],0xd
  404432:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  404438:	6a 00                	push   0x0
  40443a:	8d 45 ec             	lea    eax,[ebp-0x14]
  40443d:	50                   	push   eax
  40443e:	8d 4d b4             	lea    ecx,[ebp-0x4c]
  404441:	ff 15 a4 92 41 00    	call   DWORD PTR ds:0x4192a4
  404447:	68 98 7a 45 00       	push   0x457a98
  40444c:	8d 4d b4             	lea    ecx,[ebp-0x4c]
  40444f:	c6 45 fc 0e          	mov    BYTE PTR [ebp-0x4],0xe
  404453:	ff 15 9c 92 41 00    	call   DWORD PTR ds:0x41929c
  404459:	85 c0                	test   eax,eax
  40445b:	0f 84 57 01 00 00    	je     0x4045b8
  404461:	ff d0                	call   eax
  404463:	8b f8                	mov    edi,eax
  404465:	8b cf                	mov    ecx,edi
  404467:	89 7d dc             	mov    DWORD PTR [ebp-0x24],edi
  40446a:	8b 07                	mov    eax,DWORD PTR [edi]
  40446c:	ff 50 08             	call   DWORD PTR [eax+0x8]
  40446f:	89 47 04             	mov    DWORD PTR [edi+0x4],eax
  404472:	8b cf                	mov    ecx,edi
  404474:	8b 07                	mov    eax,DWORD PTR [edi]
  404476:	ff 50 04             	call   DWORD PTR [eax+0x4]
  404479:	8b 07                	mov    eax,DWORD PTR [edi]
  40447b:	8b cf                	mov    ecx,edi
  40447d:	ff 10                	call   DWORD PTR [eax]
  40447f:	8d 45 f0             	lea    eax,[ebp-0x10]
  404482:	8b cf                	mov    ecx,edi
  404484:	50                   	push   eax
  404485:	e8 96 fe ff ff       	call   0x404320
  40448a:	8d 45 f0             	lea    eax,[ebp-0x10]
  40448d:	c6 45 fc 0f          	mov    BYTE PTR [ebp-0x4],0xf
  404491:	50                   	push   eax
  404492:	8d 45 cc             	lea    eax,[ebp-0x34]
  404495:	50                   	push   eax
  404496:	e8 35 f6 ff ff       	call   0x403ad0
  40449b:	83 c4 08             	add    esp,0x8
  40449e:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
  4044a1:	c6 45 fc 10          	mov    BYTE PTR [ebp-0x4],0x10
  4044a5:	85 d2                	test   edx,edx
  4044a7:	74 39                	je     0x4044e2
  4044a9:	8b 4d d0             	mov    ecx,DWORD PTR [ebp-0x30]
  4044ac:	0f 1f 40 00          	nop    DWORD PTR [eax+0x0]
  4044b0:	3b 4d d4             	cmp    ecx,DWORD PTR [ebp-0x2c]
  4044b3:	0f 95 c0             	setne  al
  4044b6:	84 c0                	test   al,al
  4044b8:	74 28                	je     0x4044e2
  4044ba:	8b 31                	mov    esi,DWORD PTR [ecx]
  4044bc:	85 d2                	test   edx,edx
  4044be:	74 14                	je     0x4044d4
  4044c0:	8b 0d a8 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a8
  4044c6:	56                   	push   esi
  4044c7:	e8 44 c6 00 00       	call   0x410b10
  4044cc:	89 7e 18             	mov    DWORD PTR [esi+0x18],edi
  4044cf:	33 d2                	xor    edx,edx
  4044d1:	8b 4d d0             	mov    ecx,DWORD PTR [ebp-0x30]
  4044d4:	83 c1 04             	add    ecx,0x4
  4044d7:	83 f2 01             	xor    edx,0x1
  4044da:	89 4d d0             	mov    DWORD PTR [ebp-0x30],ecx
  4044dd:	89 55 d8             	mov    DWORD PTR [ebp-0x28],edx
  4044e0:	75 ce                	jne    0x4044b0
  4044e2:	8b 4d cc             	mov    ecx,DWORD PTR [ebp-0x34]
  4044e5:	83 ce ff             	or     esi,0xffffffff
  4044e8:	8b 1d 98 93 41 00    	mov    ebx,DWORD PTR ds:0x419398
  4044ee:	c6 45 fc 11          	mov    BYTE PTR [ebp-0x4],0x11
  4044f2:	8b 01                	mov    eax,DWORD PTR [ecx]
  4044f4:	85 c0                	test   eax,eax
  4044f6:	74 14                	je     0x40450c
  4044f8:	3b c6                	cmp    eax,esi
  4044fa:	74 16                	je     0x404512
  4044fc:	8b c6                	mov    eax,esi
  4044fe:	f0 0f c1 01          	lock xadd DWORD PTR [ecx],eax
  404502:	0f 95 c0             	setne  al
  404505:	84 c0                	test   al,al
  404507:	75 09                	jne    0x404512
  404509:	8b 4d cc             	mov    ecx,DWORD PTR [ebp-0x34]
  40450c:	51                   	push   ecx
  40450d:	ff d3                	call   ebx
  40450f:	83 c4 04             	add    esp,0x4
  404512:	8d 45 dc             	lea    eax,[ebp-0x24]
  404515:	c6 45 fc 0f          	mov    BYTE PTR [ebp-0x4],0xf
  404519:	50                   	push   eax
  40451a:	b9 b8 96 46 00       	mov    ecx,0x4696b8
  40451f:	e8 2c 07 00 00       	call   0x404c50
  404524:	8d 45 08             	lea    eax,[ebp+0x8]
  404527:	b9 b4 96 46 00       	mov    ecx,0x4696b4
  40452c:	50                   	push   eax
  40452d:	e8 9e 07 00 00       	call   0x404cd0
  404532:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
  404535:	c6 45 fc 12          	mov    BYTE PTR [ebp-0x4],0x12
  404539:	8b 08                	mov    ecx,DWORD PTR [eax]
  40453b:	85 c9                	test   ecx,ecx
  40453d:	74 14                	je     0x404553
  40453f:	83 f9 ff             	cmp    ecx,0xffffffff
  404542:	74 76                	je     0x4045ba
  404544:	f0 0f c1 30          	lock xadd DWORD PTR [eax],esi
  404548:	4e                   	dec    esi
  404549:	0f 95 c0             	setne  al
  40454c:	84 c0                	test   al,al
  40454e:	75 6a                	jne    0x4045ba
  404550:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
  404553:	50                   	push   eax
  404554:	ff d3                	call   ebx
  404556:	83 c4 04             	add    esp,0x4
  404559:	eb 5f                	jmp    0x4045ba
  40455b:	3b f7                	cmp    esi,edi
  40455d:	0f 84 46 fe ff ff    	je     0x4043a9
  404563:	6a 00                	push   0x0
  404565:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  404568:	ff 15 50 9a 41 00    	call   DWORD PTR ds:0x419a50
  40456e:	68 74 7a 45 00       	push   0x457a74
  404573:	8d 45 08             	lea    eax,[ebp+0x8]
  404576:	c6 45 fc 02          	mov    BYTE PTR [ebp-0x4],0x2
  40457a:	50                   	push   eax
  40457b:	8d 45 f0             	lea    eax,[ebp-0x10]
  40457e:	50                   	push   eax
  40457f:	e8 6c cf ff ff       	call   0x4014f0
  404584:	83 c4 0c             	add    esp,0xc
  404587:	50                   	push   eax
  404588:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  40458b:	c6 45 fc 03          	mov    BYTE PTR [ebp-0x4],0x3
  40458f:	ff 15 3c 9a 41 00    	call   DWORD PTR ds:0x419a3c
  404595:	8d 4d f0             	lea    ecx,[ebp-0x10]
  404598:	c6 45 fc 02          	mov    BYTE PTR [ebp-0x4],0x2
  40459c:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  4045a2:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  4045a5:	ff 15 54 9a 41 00    	call   DWORD PTR ds:0x419a54
  4045ab:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  4045ae:	ff 15 4c 9a 41 00    	call   DWORD PTR ds:0x419a4c
  4045b4:	33 ff                	xor    edi,edi
  4045b6:	eb 1d                	jmp    0x4045d5
  4045b8:	33 ff                	xor    edi,edi
  4045ba:	8d 4d b4             	lea    ecx,[ebp-0x4c]
  4045bd:	ff 15 a0 92 41 00    	call   DWORD PTR ds:0x4192a0
  4045c3:	8d 4d ec             	lea    ecx,[ebp-0x14]
  4045c6:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  4045cc:	8d 4d e8             	lea    ecx,[ebp-0x18]
  4045cf:	ff 15 94 92 41 00    	call   DWORD PTR ds:0x419294
  4045d5:	8d 4d 08             	lea    ecx,[ebp+0x8]
  4045d8:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  4045de:	8d 4d 0c             	lea    ecx,[ebp+0xc]
  4045e1:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  4045e7:	8b c7                	mov    eax,edi
  4045e9:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
  4045ec:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  4045f3:	59                   	pop    ecx
  4045f4:	5f                   	pop    edi
  4045f5:	5e                   	pop    esi
  4045f6:	5b                   	pop    ebx
  4045f7:	8b e5                	mov    esp,ebp
  4045f9:	5d                   	pop    ebp
  4045fa:	c3                   	ret

===== Qt shared-handle copy/refcount helper [0x00403b10..0x00403ba0) =====

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/IS.exe:     file format pei-i386


Disassembly of section .text:

00403b10 <.text+0x2b10>:
  403b10:	55                   	push   ebp
  403b11:	8b ec                	mov    ebp,esp
  403b13:	6a ff                	push   0xffffffff
  403b15:	68 00 5c 41 00       	push   0x415c00
  403b1a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  403b20:	50                   	push   eax
  403b21:	83 ec 08             	sub    esp,0x8
  403b24:	53                   	push   ebx
  403b25:	56                   	push   esi
  403b26:	57                   	push   edi
  403b27:	a1 cc 90 46 00       	mov    eax,ds:0x4690cc
  403b2c:	33 c5                	xor    eax,ebp
  403b2e:	50                   	push   eax
  403b2f:	8d 45 f4             	lea    eax,[ebp-0xc]
  403b32:	64 a3 00 00 00 00    	mov    fs:0x0,eax
  403b38:	89 65 f0             	mov    DWORD PTR [ebp-0x10],esp
  403b3b:	8b f1                	mov    esi,ecx
  403b3d:	89 75 ec             	mov    DWORD PTR [ebp-0x14],esi
  403b40:	8b 7d 08             	mov    edi,DWORD PTR [ebp+0x8]
  403b43:	8b 07                	mov    eax,DWORD PTR [edi]
  403b45:	89 06                	mov    DWORD PTR [esi],eax
  403b47:	8b 08                	mov    ecx,DWORD PTR [eax]
  403b49:	85 c9                	test   ecx,ecx
  403b4b:	74 0a                	je     0x403b57
  403b4d:	83 f9 ff             	cmp    ecx,0xffffffff
  403b50:	74 39                	je     0x403b8b
  403b52:	f0 ff 00             	lock inc DWORD PTR [eax]
  403b55:	eb 34                	jmp    0x403b8b
  403b57:	ff 70 04             	push   DWORD PTR [eax+0x4]
  403b5a:	8b ce                	mov    ecx,esi
  403b5c:	ff 15 a4 93 41 00    	call   DWORD PTR ds:0x4193a4
  403b62:	8b cf                	mov    ecx,edi
  403b64:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
  403b6b:	ff 15 90 93 41 00    	call   DWORD PTR ds:0x419390
  403b71:	50                   	push   eax
  403b72:	8b ce                	mov    ecx,esi
  403b74:	ff 15 8c 93 41 00    	call   DWORD PTR ds:0x41938c
  403b7a:	50                   	push   eax
  403b7b:	8b ce                	mov    ecx,esi
  403b7d:	ff 15 90 93 41 00    	call   DWORD PTR ds:0x419390
  403b83:	50                   	push   eax
  403b84:	8b ce                	mov    ecx,esi
  403b86:	e8 95 e7 ff ff       	call   0x402320
  403b8b:	8b c6                	mov    eax,esi
  403b8d:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
  403b90:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  403b97:	59                   	pop    ecx
  403b98:	5f                   	pop    edi
  403b99:	5e                   	pop    esi
  403b9a:	5b                   	pop    ebx
  403b9b:	8b e5                	mov    esp,ebp
  403b9d:	5d                   	pop    ebp
  403b9e:	c2                   	.byte 0xc2
  403b9f:	04                   	.byte 0x4

===== static destructors for module-name and raw module-pointer lists [0x00418730..0x00418780) =====

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/IS.exe:     file format pei-i386


Disassembly of section .text:

00418730 <.text+0x17730>:
  418730:	b9 b4 96 46 00       	mov    ecx,0x4696b4
  418735:	e9 76 b5 fe ff       	jmp    0x403cb0
  41873a:	cc                   	int3
  41873b:	cc                   	int3
  41873c:	cc                   	int3
  41873d:	cc                   	int3
  41873e:	cc                   	int3
  41873f:	cc                   	int3
  418740:	8b 0d b8 96 46 00    	mov    ecx,DWORD PTR ds:0x4696b8
  418746:	8b 01                	mov    eax,DWORD PTR [ecx]
  418748:	85 c0                	test   eax,eax
  41874a:	74 19                	je     0x418765
  41874c:	83 f8 ff             	cmp    eax,0xffffffff
  41874f:	74 22                	je     0x418773
  418751:	83 c8 ff             	or     eax,0xffffffff
  418754:	f0 0f c1 01          	lock xadd DWORD PTR [ecx],eax
  418758:	0f 95 c0             	setne  al
  41875b:	84 c0                	test   al,al
  41875d:	75 14                	jne    0x418773
  41875f:	8b 0d b8 96 46 00    	mov    ecx,DWORD PTR ds:0x4696b8
  418765:	6a 04                	push   0x4
  418767:	6a 04                	push   0x4
  418769:	51                   	push   ecx
  41876a:	ff 15 e0 92 41 00    	call   DWORD PTR ds:0x4192e0
  418770:	83 c4 0c             	add    esp,0xc
  418773:	c3                   	ret

===== PM_auto WorkWidget collection producer [0x100027D0..0x10002844) =====

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/PM_auto.dll:     file format pei-i386


Disassembly of section .text:

100027d0 <.text+0x17d0>:
100027d0:	55                   	push   ebp
100027d1:	8b ec                	mov    ebp,esp
100027d3:	6a ff                	push   0xffffffff
100027d5:	68 a2 e7 01 10       	push   0x1001e7a2
100027da:	64 a1 00 00 00 00    	mov    eax,fs:0x0
100027e0:	50                   	push   eax
100027e1:	51                   	push   ecx
100027e2:	56                   	push   esi
100027e3:	a1 cc f0 06 10       	mov    eax,ds:0x1006f0cc
100027e8:	33 c5                	xor    eax,ebp
100027ea:	50                   	push   eax
100027eb:	8d 45 f4             	lea    eax,[ebp-0xc]
100027ee:	64 a3 00 00 00 00    	mov    fs:0x0,eax
100027f4:	8b f1                	mov    esi,ecx
100027f6:	68 74 01 00 00       	push   0x174
100027fb:	e8 7b a4 01 00       	call   0x1001cc7b
10002800:	83 c4 04             	add    esp,0x4
10002803:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
10002806:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000280d:	85 c0                	test   eax,eax
1000280f:	74 0b                	je     0x1000281c
10002811:	6a 00                	push   0x0
10002813:	8b c8                	mov    ecx,eax
10002815:	e8 46 ed ff ff       	call   0x10001560
1000281a:	eb 02                	jmp    0x1000281e
1000281c:	33 c0                	xor    eax,eax
1000281e:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
10002821:	8d 4e 0c             	lea    ecx,[esi+0xc]
10002824:	8d 45 f0             	lea    eax,[ebp-0x10]
10002827:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
1000282e:	50                   	push   eax
1000282f:	e8 7c 6d 00 00       	call   0x100095b0
10002834:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10002837:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000283e:	59                   	pop    ecx
1000283f:	5e                   	pop    esi
10002840:	8b e5                	mov    esp,ebp
10002842:	5d                   	pop    ebp
10002843:	c3                   	ret

===== PM_auto QListData append helper [0x100095B0..0x10009630) =====

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/PM_auto.dll:     file format pei-i386


Disassembly of section .text:

100095b0 <.text+0x85b0>:
100095b0:	55                   	push   ebp
100095b1:	8b ec                	mov    ebp,esp
100095b3:	6a ff                	push   0xffffffff
100095b5:	68 50 f0 01 10       	push   0x1001f050
100095ba:	64 a1 00 00 00 00    	mov    eax,fs:0x0
100095c0:	50                   	push   eax
100095c1:	51                   	push   ecx
100095c2:	53                   	push   ebx
100095c3:	56                   	push   esi
100095c4:	57                   	push   edi
100095c5:	a1 cc f0 06 10       	mov    eax,ds:0x1006f0cc
100095ca:	33 c5                	xor    eax,ebp
100095cc:	50                   	push   eax
100095cd:	8d 45 f4             	lea    eax,[ebp-0xc]
100095d0:	64 a3 00 00 00 00    	mov    fs:0x0,eax
100095d6:	89 65 f0             	mov    DWORD PTR [ebp-0x10],esp
100095d9:	8b 01                	mov    eax,DWORD PTR [ecx]
100095db:	8b 00                	mov    eax,DWORD PTR [eax]
100095dd:	83 f8 01             	cmp    eax,0x1
100095e0:	74 2b                	je     0x1000960d
100095e2:	85 c0                	test   eax,eax
100095e4:	74 27                	je     0x1000960d
100095e6:	6a 01                	push   0x1
100095e8:	68 ff ff ff 7f       	push   0x7fffffff
100095ed:	e8 4e 11 00 00       	call   0x1000a740
100095f2:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
100095f5:	8b 09                	mov    ecx,DWORD PTR [ecx]
100095f7:	89 08                	mov    DWORD PTR [eax],ecx
100095f9:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
100095fc:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10009603:	59                   	pop    ecx
10009604:	5f                   	pop    edi
10009605:	5e                   	pop    esi
10009606:	5b                   	pop    ebx
10009607:	8b e5                	mov    esp,ebp
10009609:	5d                   	pop    ebp
1000960a:	c2 04 00             	ret    0x4
1000960d:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
10009610:	c7 45 fc 04 00 00 00 	mov    DWORD PTR [ebp-0x4],0x4
10009617:	8b 36                	mov    esi,DWORD PTR [esi]
10009619:	ff 15 78 23 02 10    	call   DWORD PTR ds:0x10022378
1000961f:	89 30                	mov    DWORD PTR [eax],esi
10009621:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10009624:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000962b:	59                   	pop    ecx
1000962c:	5f                   	pop    edi
1000962d:	5e                   	pop    esi
1000962e:	5b                   	pop    ebx
1000962f:	8b                   	.byte 0x8b
