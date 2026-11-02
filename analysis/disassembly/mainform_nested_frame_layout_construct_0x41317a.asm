
/mnt/data/is2_re_analysis_kit_stage1_17_continuation_2026-11-01/original/is.exe:     file format pei-i386


disassembly of section .text:

0041317a <.text+0x1217a>:
  41317a:	8b d8                	mov    ebx,eax
  41317c:	83 c4 04             	add    esp,0x4
  41317f:	89 5d d4             	mov    dword ptr [ebp-0x2c],ebx
  413182:	c6 45 fc 36          	mov    byte ptr [ebp-0x4],0x36
  413186:	85 db                	test   ebx,ebx
  413188:	74 1c                	je     0x4131a6
  41318a:	6a 00                	push   0x0
  41318c:	ff 77 04             	push   dword ptr [edi+0x4]
  41318f:	8b cb                	mov    ecx,ebx
  413191:	ff 15 d0 9a 41 00    	call   dword ptr ds:0x419ad0
  413197:	c7 03 8c 7d 45 00    	mov    dword ptr [ebx],0x457d8c
  41319d:	c7 43 08 44 7e 45 00 	mov    dword ptr [ebx+0x8],0x457e44
  4131a4:	eb 02                	jmp    0x4131a8
  4131a6:	33 db                	xor    ebx,ebx
  4131a8:	8d 45 dc             	lea    eax,[ebp-0x24]
  4131ab:	89 5f 4c             	mov    dword ptr [edi+0x4c],ebx
  4131ae:	50                   	push   eax
  4131af:	8d 4d f3             	lea    ecx,[ebp-0xd]
  4131b2:	e8 29 d7 ff ff       	call   0x4108e0
  4131b7:	50                   	push   eax
  4131b8:	8b cb                	mov    ecx,ebx
  4131ba:	c6 45 fc 37          	mov    byte ptr [ebp-0x4],0x37
  4131be:	ff d6                	call   esi
  4131c0:	8d 4d dc             	lea    ecx,[ebp-0x24]
  4131c3:	c6 45 fc 2a          	mov    byte ptr [ebp-0x4],0x2a
  4131c7:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  4131cd:	8b 4f 4c             	mov    ecx,dword ptr [edi+0x4c]
  4131d0:	6a 01                	push   0x1
  4131d2:	ff 15 6c 98 41 00    	call   dword ptr ds:0x41986c
  4131d8:	8d 45 dc             	lea    eax,[ebp-0x24]
  4131db:	50                   	push   eax
  4131dc:	8d 4d f3             	lea    ecx,[ebp-0xd]
  4131df:	e8 cc d6 ff ff       	call   0x4108b0
  4131e4:	8b 4f 4c             	mov    ecx,dword ptr [edi+0x4c]
  4131e7:	50                   	push   eax
  4131e8:	c6 45 fc 38          	mov    byte ptr [ebp-0x4],0x38
  4131ec:	ff 15 00 9b 41 00    	call   dword ptr ds:0x419b00
  4131f2:	8d 4d dc             	lea    ecx,[ebp-0x24]
  4131f5:	c6 45 fc 2a          	mov    byte ptr [ebp-0x4],0x2a
  4131f9:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  4131ff:	8b 4f 4c             	mov    ecx,dword ptr [edi+0x4c]
  413202:	6a 00                	push   0x0
  413204:	ff 15 c8 9a 41 00    	call   dword ptr ds:0x419ac8
  41320a:	8b 4f 4c             	mov    ecx,dword ptr [edi+0x4c]
  41320d:	6a 10                	push   0x10
  41320f:	ff 15 c4 9a 41 00    	call   dword ptr ds:0x419ac4
  413215:	6a 10                	push   0x10
  413217:	e8 6d 15 00 00       	call   0x414789
  41321c:	8b d8                	mov    ebx,eax
  41321e:	83 c4 04             	add    esp,0x4
  413221:	89 5d d4             	mov    dword ptr [ebp-0x2c],ebx
  413224:	c6 45 fc 39          	mov    byte ptr [ebp-0x4],0x39
  413228:	85 db                	test   ebx,ebx
  41322a:	74 1a                	je     0x413246
  41322c:	ff 77 4c             	push   dword ptr [edi+0x4c]
  41322f:	8b cb                	mov    ecx,ebx
  413231:	ff 15 94 9a 41 00    	call   dword ptr ds:0x419a94
  413237:	c7 03 cc 7f 45 00    	mov    dword ptr [ebx],0x457fcc
  41323d:	c7 43 08 14 80 45 00 	mov    dword ptr [ebx+0x8],0x458014
  413244:	eb 02                	jmp    0x413248
  413246:	33 db                	xor    ebx,ebx
  413248:	6a 00                	push   0x0
  41324a:	8b cb                	mov    ecx,ebx
  41324c:	c6 45 fc 2a          	mov    byte ptr [ebp-0x4],0x2a
  413250:	89 5f 50             	mov    dword ptr [edi+0x50],ebx
  413253:	ff 15 f8 97 41 00    	call   dword ptr ds:0x4197f8
  413259:	8d 45 d4             	lea    eax,[ebp-0x2c]
  41325c:	50                   	push   eax
  41325d:	8d 4d f3             	lea    ecx,[ebp-0xd]
  413260:	e8 ab d5 ff ff       	call   0x410810
  413265:	8b 4f 50             	mov    ecx,dword ptr [edi+0x50]
  413268:	50                   	push   eax
  413269:	c6 45 fc 3a          	mov    byte ptr [ebp-0x4],0x3a
  41326d:	ff d6                	call   esi
  41326f:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  413272:	c6 45 fc 2a          	mov    byte ptr [ebp-0x4],0x2a
  413276:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  41327c:	8b 4f 50             	mov    ecx,dword ptr [edi+0x50]
  41327f:	6a 00                	push   0x0
  413281:	6a 00                	push   0x0
  413283:	6a 00                	push   0x0
  413285:	6a 00                	push   0x0
  413287:	ff 15 b4 9a 41 00    	call   dword ptr ds:0x419ab4
  41328d:	8b 4f 08             	mov    ecx,dword ptr [edi+0x8]
  413290:	6a 00                	push   0x0
  413292:	6a 00                	push   0x0
  413294:	ff 77 4c             	push   dword ptr [edi+0x4c]
  413297:	ff 15 70 9a 41 00    	call   dword ptr ds:0x419a70
  41329d:	8b 0f                	mov    ecx,dword ptr [edi]
