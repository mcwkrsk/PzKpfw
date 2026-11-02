
; ===== child_cleanup 0x100182b0..0x10018380 =====

/mnt/data/is2_rar/IS2_PMauto_beta/modules/PM_auto.dll:     file format pei-i386


Disassembly of section .text:

100182b0 <.text+0x172b0>:
100182b0:	55                   	push   ebp
100182b1:	8b ec                	mov    ebp,esp
100182b3:	6a ff                	push   0xffffffff
100182b5:	68 18 06 02 10       	push   0x10020618
100182ba:	64 a1 00 00 00 00    	mov    eax,fs:0x0
100182c0:	50                   	push   eax
100182c1:	83 ec 10             	sub    esp,0x10
100182c4:	53                   	push   ebx
100182c5:	56                   	push   esi
100182c6:	57                   	push   edi
100182c7:	a1 cc f0 06 10       	mov    eax,ds:0x1006f0cc
100182cc:	33 c5                	xor    eax,ebp
100182ce:	50                   	push   eax
100182cf:	8d 45 f4             	lea    eax,[ebp-0xc]
100182d2:	64 a3 00 00 00 00    	mov    fs:0x0,eax
100182d8:	8d 99 cc 01 00 00    	lea    ebx,[ecx+0x1cc]
100182de:	8d 45 e4             	lea    eax,[ebp-0x1c]
100182e1:	53                   	push   ebx
100182e2:	50                   	push   eax
100182e3:	e8 c8 c4 fe ff       	call   0x100047b0
100182e8:	83 c4 08             	add    esp,0x8
100182eb:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
100182ee:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
100182f5:	85 c0                	test   eax,eax
100182f7:	74 26                	je     0x1001831f
100182f9:	8b 7d ec             	mov    edi,DWORD PTR [ebp-0x14]
100182fc:	8b 75 e8             	mov    esi,DWORD PTR [ebp-0x18]
100182ff:	90                   	nop
10018300:	3b f7                	cmp    esi,edi
10018302:	74 1b                	je     0x1001831f
10018304:	85 c0                	test   eax,eax
10018306:	74 09                	je     0x10018311
10018308:	8b 0e                	mov    ecx,DWORD PTR [esi]
1001830a:	e8 71 00 00 00       	call   0x10018380
1001830f:	33 c0                	xor    eax,eax
10018311:	83 c6 04             	add    esi,0x4
10018314:	83 f0 01             	xor    eax,0x1
10018317:	89 75 e8             	mov    DWORD PTR [ebp-0x18],esi
1001831a:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
1001831d:	75 e1                	jne    0x10018300
1001831f:	8b 4d e4             	mov    ecx,DWORD PTR [ebp-0x1c]
10018322:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
10018329:	8b 01                	mov    eax,DWORD PTR [ecx]
1001832b:	85 c0                	test   eax,eax
1001832d:	74 13                	je     0x10018342
1001832f:	83 f8 ff             	cmp    eax,0xffffffff
10018332:	74 1c                	je     0x10018350
10018334:	83 c8 ff             	or     eax,0xffffffff
10018337:	f0 0f c1 01          	lock xadd DWORD PTR [ecx],eax
1001833b:	0f 95 c0             	setne  al
1001833e:	84 c0                	test   al,al
10018340:	75 0e                	jne    0x10018350
10018342:	6a 04                	push   0x4
10018344:	6a 04                	push   0x4
10018346:	51                   	push   ecx
10018347:	ff 15 68 24 02 10    	call   DWORD PTR ds:0x10022468
1001834d:	83 c4 0c             	add    esp,0xc
10018350:	8b 03                	mov    eax,DWORD PTR [ebx]
10018352:	8b cb                	mov    ecx,ebx
10018354:	6a 00                	push   0x0
10018356:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
10018359:	25 ff ff ff 7f       	and    eax,0x7fffffff
1001835e:	50                   	push   eax
1001835f:	6a 00                	push   0x0
10018361:	e8 ca 54 ff ff       	call   0x1000d830
10018366:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10018369:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10018370:	59                   	pop    ecx
10018371:	5f                   	pop    edi
10018372:	5e                   	pop    esi
10018373:	5b                   	pop    ebx
10018374:	8b e5                	mov    esp,ebp
10018376:	5d                   	pop    ebp
10018377:	c3                   	ret
10018378:	cc                   	int3
10018379:	cc                   	int3
1001837a:	cc                   	int3
1001837b:	cc                   	int3
1001837c:	cc                   	int3
1001837d:	cc                   	int3
1001837e:	cc                   	int3
1001837f:	cc                   	int3


; ===== destroy_helper 0x10018380..0x100183a3 =====

/mnt/data/is2_rar/IS2_PMauto_beta/modules/PM_auto.dll:     file format pei-i386


Disassembly of section .text:

10018380 <.text+0x17380>:
10018380:	56                   	push   esi
10018381:	8b f1                	mov    esi,ecx
10018383:	e8 28 ff ff ff       	call   0x100182b0
10018388:	85 f6                	test   esi,esi
1001838a:	74 15                	je     0x100183a1
1001838c:	8b ce                	mov    ecx,esi
1001838e:	e8 dd fb ff ff       	call   0x10017f70
10018393:	68 78 02 00 00       	push   0x278
10018398:	56                   	push   esi
10018399:	e8 15 49 00 00       	call   0x1001ccb3
1001839e:	83 c4 08             	add    esp,0x8
100183a1:	5e                   	pop    esi
100183a2:	c3                   	ret


; ===== destructor_body 0x10017f70..0x10018040 =====

/mnt/data/is2_rar/IS2_PMauto_beta/modules/PM_auto.dll:     file format pei-i386


Disassembly of section .text:

10017f70 <.text+0x16f70>:
10017f70:	56                   	push   esi
10017f71:	8b f1                	mov    esi,ecx
10017f73:	57                   	push   edi
10017f74:	8d 8e 70 02 00 00    	lea    ecx,[esi+0x270]
10017f7a:	c7 06 84 be 05 10    	mov    DWORD PTR [esi],0x1005be84
10017f80:	ff 15 b0 25 02 10    	call   DWORD PTR ds:0x100225b0
10017f86:	8d 8e 48 02 00 00    	lea    ecx,[esi+0x248]
10017f8c:	ff 15 a4 23 02 10    	call   DWORD PTR ds:0x100223a4
10017f92:	8d 8e 34 02 00 00    	lea    ecx,[esi+0x234]
10017f98:	ff 15 a4 23 02 10    	call   DWORD PTR ds:0x100223a4
10017f9e:	8b 8e 28 02 00 00    	mov    ecx,DWORD PTR [esi+0x228]
10017fa4:	85 c9                	test   ecx,ecx
10017fa6:	74 35                	je     0x10017fdd
10017fa8:	8b 86 30 02 00 00    	mov    eax,DWORD PTR [esi+0x230]
10017fae:	2b c1                	sub    eax,ecx
10017fb0:	6a 10                	push   0x10
10017fb2:	c1 f8 04             	sar    eax,0x4
10017fb5:	50                   	push   eax
10017fb6:	51                   	push   ecx
10017fb7:	e8 c4 a2 fe ff       	call   0x10002280
10017fbc:	c7 86 28 02 00 00 00 	mov    DWORD PTR [esi+0x228],0x0
10017fc3:	00 00 00 
10017fc6:	83 c4 0c             	add    esp,0xc
10017fc9:	c7 86 2c 02 00 00 00 	mov    DWORD PTR [esi+0x22c],0x0
10017fd0:	00 00 00 
10017fd3:	c7 86 30 02 00 00 00 	mov    DWORD PTR [esi+0x230],0x0
10017fda:	00 00 00 
10017fdd:	8d 8e 0c 02 00 00    	lea    ecx,[esi+0x20c]
10017fe3:	e8 d8 01 00 00       	call   0x100181c0
10017fe8:	8d 8e 08 02 00 00    	lea    ecx,[esi+0x208]
10017fee:	ff 15 a4 23 02 10    	call   DWORD PTR ds:0x100223a4
10017ff4:	8d 8e 04 02 00 00    	lea    ecx,[esi+0x204]
10017ffa:	ff 15 a4 23 02 10    	call   DWORD PTR ds:0x100223a4
10018000:	8b 8e cc 01 00 00    	mov    ecx,DWORD PTR [esi+0x1cc]
10018006:	83 cf ff             	or     edi,0xffffffff
10018009:	8b 01                	mov    eax,DWORD PTR [ecx]
1001800b:	85 c0                	test   eax,eax
1001800d:	74 11                	je     0x10018020
1001800f:	3b c7                	cmp    eax,edi
10018011:	74 20                	je     0x10018033
10018013:	8b c7                	mov    eax,edi
10018015:	f0 0f c1 01          	lock xadd DWORD PTR [ecx],eax
10018019:	0f 95 c0             	setne  al
1001801c:	84 c0                	test   al,al
1001801e:	75 13                	jne    0x10018033
10018020:	6a 04                	push   0x4
10018022:	6a 04                	push   0x4
10018024:	ff b6 cc 01 00 00    	push   DWORD PTR [esi+0x1cc]
1001802a:	ff 15 68 24 02 10    	call   DWORD PTR ds:0x10022468
10018030:	83 c4 0c             	add    esp,0xc
10018033:	8d 8e e8 00 00 00    	lea    ecx,[esi+0xe8]
10018039:	e8 62 fd ff ff       	call   0x10017da0
1001803e:	8d                   	.byte 0x8d
1001803f:	4e                   	dec    esi


; ===== type_dispatch 0x100183b0..0x10018410 =====

/mnt/data/is2_rar/IS2_PMauto_beta/modules/PM_auto.dll:     file format pei-i386


Disassembly of section .text:

100183b0 <.text+0x173b0>:
100183b0:	55                   	push   ebp
100183b1:	8b ec                	mov    ebp,esp
100183b3:	53                   	push   ebx
100183b4:	8b 1d 94 20 02 10    	mov    ebx,DWORD PTR ds:0x10022094
100183ba:	56                   	push   esi
100183bb:	8b f1                	mov    esi,ecx
100183bd:	57                   	push   edi
100183be:	8b 8e d0 01 00 00    	mov    ecx,DWORD PTR [esi+0x1d0]
100183c4:	ff d3                	call   ebx
100183c6:	8b 7d 08             	mov    edi,DWORD PTR [ebp+0x8]
100183c9:	83 f8 02             	cmp    eax,0x2
100183cc:	75 08                	jne    0x100183d6
100183ce:	8b 06                	mov    eax,DWORD PTR [esi]
100183d0:	8b ce                	mov    ecx,esi
100183d2:	57                   	push   edi
100183d3:	ff 50 0c             	call   DWORD PTR [eax+0xc]
100183d6:	8b 8e d0 01 00 00    	mov    ecx,DWORD PTR [esi+0x1d0]
100183dc:	ff d3                	call   ebx
100183de:	83 f8 01             	cmp    eax,0x1
100183e1:	75 08                	jne    0x100183eb
100183e3:	8b 06                	mov    eax,DWORD PTR [esi]
100183e5:	8b ce                	mov    ecx,esi
100183e7:	57                   	push   edi
100183e8:	ff 50 10             	call   DWORD PTR [eax+0x10]
100183eb:	8b 8e d0 01 00 00    	mov    ecx,DWORD PTR [esi+0x1d0]
100183f1:	ff d3                	call   ebx
100183f3:	83 f8 03             	cmp    eax,0x3
100183f6:	75 08                	jne    0x10018400
100183f8:	8b 06                	mov    eax,DWORD PTR [esi]
100183fa:	8b ce                	mov    ecx,esi
100183fc:	57                   	push   edi
100183fd:	ff 50 14             	call   DWORD PTR [eax+0x14]
10018400:	5f                   	pop    edi
10018401:	5e                   	pop    esi
10018402:	5b                   	pop    ebx
10018403:	5d                   	pop    ebp
10018404:	c2 04 00             	ret    0x4
10018407:	cc                   	int3
10018408:	cc                   	int3
10018409:	cc                   	int3
1001840a:	cc                   	int3
1001840b:	cc                   	int3
1001840c:	cc                   	int3
1001840d:	cc                   	int3
1001840e:	cc                   	int3
1001840f:	cc                   	int3


; ===== del_list 0x1000a040..0x1000a360 =====

/mnt/data/is2_rar/IS2_PMauto_beta/modules/PM_auto.dll:     file format pei-i386


Disassembly of section .text:

1000a040 <.text+0x9040>:
1000a040:	55                   	push   ebp
1000a041:	8b ec                	mov    ebp,esp
1000a043:	6a ff                	push   0xffffffff
1000a045:	68 2e f2 01 10       	push   0x1001f22e
1000a04a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000a050:	50                   	push   eax
1000a051:	b8 00 10 00 00       	mov    eax,0x1000
1000a056:	e8 15 32 01 00       	call   0x1001d270
1000a05b:	a1 cc f0 06 10       	mov    eax,ds:0x1006f0cc
1000a060:	33 c5                	xor    eax,ebp
1000a062:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
1000a065:	53                   	push   ebx
1000a066:	56                   	push   esi
1000a067:	57                   	push   edi
1000a068:	50                   	push   eax
1000a069:	8d 45 f4             	lea    eax,[ebp-0xc]
1000a06c:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000a072:	8b c1                	mov    eax,ecx
1000a074:	89 85 f4 ef ff ff    	mov    DWORD PTR [ebp-0x100c],eax
1000a07a:	8b 88 fc 00 00 00    	mov    ecx,DWORD PTR [eax+0xfc]
1000a080:	ff 15 b0 28 02 10    	call   DWORD PTR ds:0x100228b0
1000a086:	50                   	push   eax
1000a087:	b9 90 bc 05 10       	mov    ecx,0x1005bc90
1000a08c:	ff 15 54 24 02 10    	call   DWORD PTR ds:0x10022454
1000a092:	8b d8                	mov    ebx,eax
1000a094:	8b cb                	mov    ecx,ebx
1000a096:	89 9d 20 f0 ff ff    	mov    DWORD PTR [ebp-0xfe0],ebx
1000a09c:	e8 2f cf 00 00       	call   0x10016fd0
1000a0a1:	8b f8                	mov    edi,eax
1000a0a3:	6a 00                	push   0x0
1000a0a5:	6a 00                	push   0x0
1000a0a7:	8b 8f c4 01 00 00    	mov    ecx,DWORD PTR [edi+0x1c4]
1000a0ad:	e8 de ce 00 00       	call   0x10016f90
1000a0b2:	8b f0                	mov    esi,eax
1000a0b4:	c7 85 1c f0 ff ff 00 	mov    DWORD PTR [ebp-0xfe4],0x0
1000a0bb:	00 00 00 
1000a0be:	68 a0 0f 00 00       	push   0xfa0
1000a0c3:	8d 85 50 f0 ff ff    	lea    eax,[ebp-0xfb0]
1000a0c9:	89 b5 18 f0 ff ff    	mov    DWORD PTR [ebp-0xfe8],esi
1000a0cf:	6a 00                	push   0x0
1000a0d1:	50                   	push   eax
1000a0d2:	e8 a1 3a 01 00       	call   0x1001db78
1000a0d7:	8d 85 1c f0 ff ff    	lea    eax,[ebp-0xfe4]
1000a0dd:	c7 85 28 f0 ff ff 04 	mov    DWORD PTR [ebp-0xfd8],0x1005b904
1000a0e4:	b9 05 10 
1000a0e7:	89 85 0c f0 ff ff    	mov    DWORD PTR [ebp-0xff4],eax
1000a0ed:	83 c4 0c             	add    esp,0xc
1000a0f0:	8d 85 50 f0 ff ff    	lea    eax,[ebp-0xfb0]
1000a0f6:	89 85 10 f0 ff ff    	mov    DWORD PTR [ebp-0xff0],eax
1000a0fc:	8d 85 28 f0 ff ff    	lea    eax,[ebp-0xfd8]
1000a102:	f3 0f 7e 85 0c f0 ff 	movq   xmm0,QWORD PTR [ebp-0xff4]
1000a109:	ff 
1000a10a:	66 0f d6 85 2c f0 ff 	movq   QWORD PTR [ebp-0xfd4],xmm0
1000a111:	ff 
1000a112:	89 85 34 f0 ff ff    	mov    DWORD PTR [ebp-0xfcc],eax
1000a118:	89 85 4c f0 ff ff    	mov    DWORD PTR [ebp-0xfb4],eax
1000a11e:	8d 85 fc ef ff ff    	lea    eax,[ebp-0x1004]
1000a124:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000a12b:	50                   	push   eax
1000a12c:	8d 85 f8 ef ff ff    	lea    eax,[ebp-0x1008]
1000a132:	89 b5 fc ef ff ff    	mov    DWORD PTR [ebp-0x1004],esi
1000a138:	50                   	push   eax
1000a139:	8d 8d 28 f0 ff ff    	lea    ecx,[ebp-0xfd8]
1000a13f:	c7 85 f8 ef ff ff 00 	mov    DWORD PTR [ebp-0x1008],0x0
1000a146:	00 00 00 
1000a149:	e8 12 e9 ff ff       	call   0x10008a60
1000a14e:	8b b7 e0 01 00 00    	mov    esi,DWORD PTR [edi+0x1e0]
1000a154:	8b cb                	mov    ecx,ebx
1000a156:	e8 15 a1 00 00       	call   0x10014270
1000a15b:	8b 95 1c f0 ff ff    	mov    edx,DWORD PTR [ebp-0xfe4]
1000a161:	8d 0c 16             	lea    ecx,[esi+edx*1]
1000a164:	3b c8                	cmp    ecx,eax
1000a166:	0f 8d 2b 01 00 00    	jge    0x1000a297
1000a16c:	33 f6                	xor    esi,esi
1000a16e:	85 d2                	test   edx,edx
1000a170:	7e 37                	jle    0x1000a1a9
1000a172:	0f 1f 40 00          	nop    DWORD PTR [eax+0x0]
1000a176:	66 66 0f 1f 84 00 00 	data16 nop WORD PTR [eax+eax*1+0x0]
1000a17d:	00 00 00 
1000a180:	8b 87 e0 01 00 00    	mov    eax,DWORD PTR [edi+0x1e0]
1000a186:	8b cb                	mov    ecx,ebx
1000a188:	ff b4 b5 50 f0 ff ff 	push   DWORD PTR [ebp+esi*4-0xfb0]
1000a18f:	40                   	inc    eax
1000a190:	03 c6                	add    eax,esi
1000a192:	50                   	push   eax
1000a193:	e8 18 b6 00 00       	call   0x100157b0
1000a198:	84 c0                	test   al,al
1000a19a:	0f 84 f7 00 00 00    	je     0x1000a297
1000a1a0:	46                   	inc    esi
1000a1a1:	3b b5 1c f0 ff ff    	cmp    esi,DWORD PTR [ebp-0xfe4]
1000a1a7:	7c d7                	jl     0x1000a180
1000a1a9:	8b b5 18 f0 ff ff    	mov    esi,DWORD PTR [ebp-0xfe8]
1000a1af:	8d 86 cc 01 00 00    	lea    eax,[esi+0x1cc]
1000a1b5:	50                   	push   eax
1000a1b6:	8d 85 08 f0 ff ff    	lea    eax,[ebp-0xff8]
1000a1bc:	50                   	push   eax
1000a1bd:	e8 ee a5 ff ff       	call   0x100047b0
1000a1c2:	83 c4 08             	add    esp,0x8
1000a1c5:	8b 85 14 f0 ff ff    	mov    eax,DWORD PTR [ebp-0xfec]
1000a1cb:	c6 45 fc 03          	mov    BYTE PTR [ebp-0x4],0x3
1000a1cf:	85 c0                	test   eax,eax
1000a1d1:	74 4c                	je     0x1000a21f
1000a1d3:	8b b5 0c f0 ff ff    	mov    esi,DWORD PTR [ebp-0xff4]
1000a1d9:	8b 9d f4 ef ff ff    	mov    ebx,DWORD PTR [ebp-0x100c]
1000a1df:	90                   	nop
1000a1e0:	3b b5 10 f0 ff ff    	cmp    esi,DWORD PTR [ebp-0xff0]
1000a1e6:	74 2b                	je     0x1000a213
1000a1e8:	85 c0                	test   eax,eax
1000a1ea:	74 13                	je     0x1000a1ff
1000a1ec:	ff 36                	push   DWORD PTR [esi]
1000a1ee:	8b cb                	mov    ecx,ebx
1000a1f0:	e8 eb fb ff ff       	call   0x10009de0
1000a1f5:	50                   	push   eax
1000a1f6:	8b cf                	mov    ecx,edi
1000a1f8:	e8 13 e0 00 00       	call   0x10018210
1000a1fd:	33 c0                	xor    eax,eax
1000a1ff:	83 c6 04             	add    esi,0x4
1000a202:	83 f0 01             	xor    eax,0x1
1000a205:	89 b5 0c f0 ff ff    	mov    DWORD PTR [ebp-0xff4],esi
1000a20b:	89 85 14 f0 ff ff    	mov    DWORD PTR [ebp-0xfec],eax
1000a211:	75 cd                	jne    0x1000a1e0
1000a213:	8b 9d 20 f0 ff ff    	mov    ebx,DWORD PTR [ebp-0xfe0]
1000a219:	8b b5 18 f0 ff ff    	mov    esi,DWORD PTR [ebp-0xfe8]
1000a21f:	8b 8d 08 f0 ff ff    	mov    ecx,DWORD PTR [ebp-0xff8]
1000a225:	c6 45 fc 00          	mov    BYTE PTR [ebp-0x4],0x0
1000a229:	8b 01                	mov    eax,DWORD PTR [ecx]
1000a22b:	85 c0                	test   eax,eax
1000a22d:	74 13                	je     0x1000a242
1000a22f:	83 f8 ff             	cmp    eax,0xffffffff
1000a232:	74 1c                	je     0x1000a250
1000a234:	83 c8 ff             	or     eax,0xffffffff
1000a237:	f0 0f c1 01          	lock xadd DWORD PTR [ecx],eax
1000a23b:	0f 95 c0             	setne  al
1000a23e:	84 c0                	test   al,al
1000a240:	75 0e                	jne    0x1000a250
1000a242:	6a 04                	push   0x4
1000a244:	6a 04                	push   0x4
1000a246:	51                   	push   ecx
1000a247:	ff 15 68 24 02 10    	call   DWORD PTR ds:0x10022468
1000a24d:	83 c4 0c             	add    esp,0xc
1000a250:	8b ce                	mov    ecx,esi
1000a252:	e8 29 e1 00 00       	call   0x10018380
1000a257:	8b 8f c4 01 00 00    	mov    ecx,DWORD PTR [edi+0x1c4]
1000a25d:	e8 fe b5 00 00       	call   0x10015860
1000a262:	8b 8f c4 01 00 00    	mov    ecx,DWORD PTR [edi+0x1c4]
1000a268:	85 c9                	test   ecx,ecx
1000a26a:	74 07                	je     0x1000a273
1000a26c:	8b 01                	mov    eax,DWORD PTR [ecx]
1000a26e:	6a 01                	push   0x1
1000a270:	ff 50 0c             	call   DWORD PTR [eax+0xc]
1000a273:	8b cb                	mov    ecx,ebx
1000a275:	c7 87 c4 01 00 00 00 	mov    DWORD PTR [edi+0x1c4],0x0
1000a27c:	00 00 00 
1000a27f:	c6 87 c1 01 00 00 00 	mov    BYTE PTR [edi+0x1c1],0x0
1000a286:	e8 15 ae 00 00       	call   0x100150a0
1000a28b:	8b cb                	mov    ecx,ebx
1000a28d:	e8 de cc 00 00       	call   0x10016f70
1000a292:	e9 86 00 00 00       	jmp    0x1000a31d
1000a297:	6a 00                	push   0x0
1000a299:	8d 8d 00 f0 ff ff    	lea    ecx,[ebp-0x1000]
1000a29f:	ff 15 28 2a 02 10    	call   DWORD PTR ds:0x10022a28
1000a2a5:	8d 85 20 f0 ff ff    	lea    eax,[ebp-0xfe0]
1000a2ab:	c6 85 27 f0 ff ff 00 	mov    BYTE PTR [ebp-0xfd9],0x0
1000a2b2:	50                   	push   eax
1000a2b3:	8d 8d 27 f0 ff ff    	lea    ecx,[ebp-0xfd9]
1000a2b9:	e8 f2 c1 ff ff       	call   0x100064b0
1000a2be:	50                   	push   eax
1000a2bf:	8d 8d 00 f0 ff ff    	lea    ecx,[ebp-0x1000]
1000a2c5:	c6 45 fc 02          	mov    BYTE PTR [ebp-0x4],0x2
1000a2c9:	ff 15 38 2a 02 10    	call   DWORD PTR ds:0x10022a38
1000a2cf:	8d 8d 20 f0 ff ff    	lea    ecx,[ebp-0xfe0]
1000a2d5:	c6 45 fc 01          	mov    BYTE PTR [ebp-0x4],0x1
1000a2d9:	ff 15 a4 23 02 10    	call   DWORD PTR ds:0x100223a4
1000a2df:	51                   	push   ecx
1000a2e0:	8b c4                	mov    eax,esp
1000a2e2:	8d 8d 00 f0 ff ff    	lea    ecx,[ebp-0x1000]
1000a2e8:	c7 00 00 04 00 00    	mov    DWORD PTR [eax],0x400
1000a2ee:	ff 15 30 2a 02 10    	call   DWORD PTR ds:0x10022a30
1000a2f4:	68 00 04 00 00       	push   0x400
1000a2f9:	8d 8d 00 f0 ff ff    	lea    ecx,[ebp-0x1000]
1000a2ff:	ff 15 34 2a 02 10    	call   DWORD PTR ds:0x10022a34
1000a305:	8d 8d 00 f0 ff ff    	lea    ecx,[ebp-0x1000]
1000a30b:	ff 15 24 2a 02 10    	call   DWORD PTR ds:0x10022a24
1000a311:	8d 8d 00 f0 ff ff    	lea    ecx,[ebp-0x1000]
1000a317:	ff 15 2c 2a 02 10    	call   DWORD PTR ds:0x10022a2c
1000a31d:	8b 8d 4c f0 ff ff    	mov    ecx,DWORD PTR [ebp-0xfb4]
1000a323:	85 c9                	test   ecx,ecx
1000a325:	74 14                	je     0x1000a33b
1000a327:	8b 11                	mov    edx,DWORD PTR [ecx]
1000a329:	8d 85 28 f0 ff ff    	lea    eax,[ebp-0xfd8]
1000a32f:	3b c8                	cmp    ecx,eax
1000a331:	0f 95 c0             	setne  al
1000a334:	0f b6 c0             	movzx  eax,al
1000a337:	50                   	push   eax
1000a338:	ff 52 10             	call   DWORD PTR [edx+0x10]
1000a33b:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000a33e:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000a345:	59                   	pop    ecx
1000a346:	5f                   	pop    edi
1000a347:	5e                   	pop    esi
1000a348:	5b                   	pop    ebx
1000a349:	8b 4d f0             	mov    ecx,DWORD PTR [ebp-0x10]
1000a34c:	33 cd                	xor    ecx,ebp
1000a34e:	e8 17 29 01 00       	call   0x1001cc6a
1000a353:	8b e5                	mov    esp,ebp
1000a355:	5d                   	pop    ebp
1000a356:	c3                   	ret
1000a357:	cc                   	int3
1000a358:	cc                   	int3
1000a359:	cc                   	int3
1000a35a:	cc                   	int3
1000a35b:	cc                   	int3
1000a35c:	cc                   	int3
1000a35d:	cc                   	int3
1000a35e:	cc                   	int3
1000a35f:	cc                   	int3


; ===== nested_grid_lookup 0x10016f90..0x10016fc8 =====

/mnt/data/is2_rar/IS2_PMauto_beta/modules/PM_auto.dll:     file format pei-i386


Disassembly of section .text:

10016f90 <.text+0x15f90>:
10016f90:	55                   	push   ebp
10016f91:	8b ec                	mov    ebp,esp
10016f93:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
10016f96:	85 d2                	test   edx,edx
10016f98:	78 28                	js     0x10016fc2
10016f9a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10016f9d:	3b 41 74             	cmp    eax,DWORD PTR [ecx+0x74]
10016fa0:	7d 20                	jge    0x10016fc2
10016fa2:	85 c0                	test   eax,eax
10016fa4:	78 1c                	js     0x10016fc2
10016fa6:	3b 51 70             	cmp    edx,DWORD PTR [ecx+0x70]
10016fa9:	7d 17                	jge    0x10016fc2
10016fab:	50                   	push   eax
10016fac:	52                   	push   edx
10016fad:	83 c1 68             	add    ecx,0x68
10016fb0:	e8 ab cd ff ff       	call   0x10013d60
10016fb5:	8b c8                	mov    ecx,eax
10016fb7:	e8 24 cd ff ff       	call   0x10013ce0
10016fbc:	8b 00                	mov    eax,DWORD PTR [eax]
10016fbe:	5d                   	pop    ebp
10016fbf:	c2 08 00             	ret    0x8
10016fc2:	33 c0                	xor    eax,eax
10016fc4:	5d                   	pop    ebp
10016fc5:	c2 08 00             	ret    0x8


; ===== composition_link 0x100043d0..0x10004410 =====

/mnt/data/is2_rar/IS2_PMauto_beta/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

100043d0 <.text+0x33d0>:
100043d0:	55                   	push   ebp
100043d1:	8b ec                	mov    ebp,esp
100043d3:	56                   	push   esi
100043d4:	6a 02                	push   0x2
100043d6:	8b f1                	mov    esi,ecx
100043d8:	e8 33 ef ff ff       	call   0x10003310
100043dd:	ff 75 08             	push   DWORD PTR [ebp+0x8]
100043e0:	8b ce                	mov    ecx,esi
100043e2:	6a 00                	push   0x0
100043e4:	e8 97 ec ff ff       	call   0x10003080
100043e9:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
100043ec:	8b ce                	mov    ecx,esi
100043ee:	6a 01                	push   0x1
100043f0:	e8 8b ec ff ff       	call   0x10003080
100043f5:	6a 00                	push   0x0
100043f7:	6a 02                	push   0x2
100043f9:	8b ce                	mov    ecx,esi
100043fb:	e8 80 ec ff ff       	call   0x10003080
10004400:	5e                   	pop    esi
10004401:	5d                   	pop    ebp
10004402:	c2 08 00             	ret    0x8
10004405:	cc                   	int3
10004406:	cc                   	int3
10004407:	cc                   	int3
10004408:	cc                   	int3
10004409:	cc                   	int3
1000440a:	cc                   	int3
1000440b:	cc                   	int3
1000440c:	cc                   	int3
1000440d:	cc                   	int3
1000440e:	cc                   	int3
1000440f:	cc                   	int3


; ===== arrangement_link 0x10004390..0x100043d0 =====

/mnt/data/is2_rar/IS2_PMauto_beta/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

10004390 <.text+0x3390>:
10004390:	55                   	push   ebp
10004391:	8b ec                	mov    ebp,esp
10004393:	56                   	push   esi
10004394:	6a 03                	push   0x3
10004396:	8b f1                	mov    esi,ecx
10004398:	e8 73 ef ff ff       	call   0x10003310
1000439d:	ff 75 08             	push   DWORD PTR [ebp+0x8]
100043a0:	8b ce                	mov    ecx,esi
100043a2:	6a 00                	push   0x0
100043a4:	e8 d7 ec ff ff       	call   0x10003080
100043a9:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
100043ac:	8b ce                	mov    ecx,esi
100043ae:	6a 01                	push   0x1
100043b0:	e8 cb ec ff ff       	call   0x10003080
100043b5:	ff 75 10             	push   DWORD PTR [ebp+0x10]
100043b8:	8b ce                	mov    ecx,esi
100043ba:	6a 02                	push   0x2
100043bc:	e8 bf ec ff ff       	call   0x10003080
100043c1:	5e                   	pop    esi
100043c2:	5d                   	pop    ebp
100043c3:	c2 0c 00             	ret    0xc
100043c6:	cc                   	int3
100043c7:	cc                   	int3
100043c8:	cc                   	int3
100043c9:	cc                   	int3
100043ca:	cc                   	int3
100043cb:	cc                   	int3
100043cc:	cc                   	int3
100043cd:	cc                   	int3
100043ce:	cc                   	int3
100043cf:	cc                   	int3


; ===== link_type_setter 0x10003310..0x10003320 =====

/mnt/data/is2_rar/IS2_PMauto_beta/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

10003310 <.text+0x2310>:
10003310:	55                   	push   ebp
10003311:	8b ec                	mov    ebp,esp
10003313:	8b 49 04             	mov    ecx,DWORD PTR [ecx+0x4]
10003316:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10003319:	89 41 28             	mov    DWORD PTR [ecx+0x28],eax
1000331c:	5d                   	pop    ebp
1000331d:	c2 04 00             	ret    0x4
