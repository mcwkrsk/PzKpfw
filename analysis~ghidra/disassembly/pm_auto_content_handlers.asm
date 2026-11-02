
/mnt/data/is2_work/original/is2_pmauto_beta/modules/pm_auto.dll:     file format pei-i386


disassembly of section .text:

10005890 <.text+0x4890>:
10005890:	55                   	push   ebp
10005891:	8b ec                	mov    ebp,esp
10005893:	6a ff                	push   0xffffffff
10005895:	68 d9 e9 01 10       	push   0x1001e9d9
1000589a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
100058a0:	50                   	push   eax
100058a1:	83 ec 40             	sub    esp,0x40
100058a4:	56                   	push   esi
100058a5:	57                   	push   edi
100058a6:	a1 cc f0 06 10       	mov    eax,ds:0x1006f0cc
100058ab:	33 c5                	xor    eax,ebp
100058ad:	50                   	push   eax
100058ae:	8d 45 f4             	lea    eax,[ebp-0xc]
100058b1:	64 a3 00 00 00 00    	mov    fs:0x0,eax
100058b7:	8b f9                	mov    edi,ecx
100058b9:	8d 45 e4             	lea    eax,[ebp-0x1c]
100058bc:	50                   	push   eax
100058bd:	8b 07                	mov    eax,dword ptr [edi]
100058bf:	8b 88 48 01 00 00    	mov    ecx,dword ptr [eax+0x148]
100058c5:	8b 49 38             	mov    ecx,dword ptr [ecx+0x38]
100058c8:	ff 15 58 29 02 10    	call   dword ptr ds:0x10022958
100058ce:	8d 4d e4             	lea    ecx,[ebp-0x1c]
100058d1:	ff 15 b8 23 02 10    	call   dword ptr ds:0x100223b8
100058d7:	85 c0                	test   eax,eax
100058d9:	0f 88 98 00 00 00    	js     0x10005977
100058df:	8b 07                	mov    eax,dword ptr [edi]
100058e1:	8d 4d c4             	lea    ecx,[ebp-0x3c]
100058e4:	68 02 01 00 00       	push   0x102
100058e9:	8b b0 64 01 00 00    	mov    esi,dword ptr [eax+0x164]
100058ef:	ff 15 bc 23 02 10    	call   dword ptr ds:0x100223bc
100058f5:	50                   	push   eax
100058f6:	6a 00                	push   0x0
100058f8:	8d 4d e4             	lea    ecx,[ebp-0x1c]
100058fb:	ff 15 b8 23 02 10    	call   dword ptr ds:0x100223b8
10005901:	8b 0f                	mov    ecx,dword ptr [edi]
10005903:	50                   	push   eax
10005904:	8d 45 b4             	lea    eax,[ebp-0x4c]
10005907:	81 c1 64 01 00 00    	add    ecx,0x164
1000590d:	50                   	push   eax
1000590e:	ff 56 2c             	call   dword ptr [esi+0x2c]
10005911:	8b 0f                	mov    ecx,dword ptr [edi]
10005913:	50                   	push   eax
10005914:	8d 45 d4             	lea    eax,[ebp-0x2c]
10005917:	81 c1 64 01 00 00    	add    ecx,0x164
1000591d:	50                   	push   eax
1000591e:	ff 56 44             	call   dword ptr [esi+0x44]
10005921:	6a 00                	push   0x0
10005923:	8b c8                	mov    ecx,eax
10005925:	c7 45 fc 00 00 00 00 	mov    dword ptr [ebp-0x4],0x0
1000592c:	ff 15 c4 23 02 10    	call   dword ptr ds:0x100223c4
10005932:	8d 4d d4             	lea    ecx,[ebp-0x2c]
10005935:	c7 45 fc ff ff ff ff 	mov    dword ptr [ebp-0x4],0xffffffff
1000593c:	8b f0                	mov    esi,eax
1000593e:	ff 15 5c 23 02 10    	call   dword ptr ds:0x1002235c
10005944:	6a 01                	push   0x1
10005946:	8b ce                	mov    ecx,esi
10005948:	ff 15 0c 21 02 10    	call   dword ptr ds:0x1002210c
1000594e:	8b ce                	mov    ecx,esi
10005950:	ff 15 08 21 02 10    	call   dword ptr ds:0x10022108
10005956:	8b 0f                	mov    ecx,dword ptr [edi]
10005958:	8b 89 fc 00 00 00    	mov    ecx,dword ptr [ecx+0xfc]
1000595e:	ff 15 b0 28 02 10    	call   dword ptr ds:0x100228b0
10005964:	50                   	push   eax
10005965:	b9 90 bc 05 10       	mov    ecx,0x1005bc90
1000596a:	ff 15 54 24 02 10    	call   dword ptr ds:0x10022454
10005970:	8b c8                	mov    ecx,eax
10005972:	e8 f9 15 01 00       	call   0x10016f70
10005977:	8b 4d f4             	mov    ecx,dword ptr [ebp-0xc]
1000597a:	64 89 0d 00 00 00 00 	mov    dword ptr fs:0x0,ecx
10005981:	59                   	pop    ecx
10005982:	5f                   	pop    edi
10005983:	5e                   	pop    esi
10005984:	8b e5                	mov    esp,ebp
10005986:	5d                   	pop    ebp
10005987:	c3                   	ret
10005988:	cc                   	int3
10005989:	cc                   	int3
1000598a:	cc                   	int3
1000598b:	cc                   	int3
1000598c:	cc                   	int3
1000598d:	cc                   	int3
1000598e:	cc                   	int3
1000598f:	cc                   	int3



/mnt/data/is2_work/original/is2_pmauto_beta/modules/pm_auto.dll:     file format pei-i386


disassembly of section .text:

100059c0 <.text+0x49c0>:
100059c0:	55                   	push   ebp
100059c1:	8b ec                	mov    ebp,esp
100059c3:	6a ff                	push   0xffffffff
100059c5:	68 23 ea 01 10       	push   0x1001ea23
100059ca:	64 a1 00 00 00 00    	mov    eax,fs:0x0
100059d0:	50                   	push   eax
100059d1:	83 ec 2c             	sub    esp,0x2c
100059d4:	a1 cc f0 06 10       	mov    eax,ds:0x1006f0cc
100059d9:	33 c5                	xor    eax,ebp
100059db:	89 45 f0             	mov    dword ptr [ebp-0x10],eax
100059de:	56                   	push   esi
100059df:	50                   	push   eax
100059e0:	8d 45 f4             	lea    eax,[ebp-0xc]
100059e3:	64 a3 00 00 00 00    	mov    fs:0x0,eax
100059e9:	8b f1                	mov    esi,ecx
100059eb:	8d 45 cc             	lea    eax,[ebp-0x34]
100059ee:	50                   	push   eax
100059ef:	8b 06                	mov    eax,dword ptr [esi]
100059f1:	8b 88 50 01 00 00    	mov    ecx,dword ptr [eax+0x150]
100059f7:	8b 49 20             	mov    ecx,dword ptr [ecx+0x20]
100059fa:	ff 15 08 28 02 10    	call   dword ptr ds:0x10022808
10005a00:	8d 4d d0             	lea    ecx,[ebp-0x30]
10005a03:	c7 45 fc 00 00 00 00 	mov    dword ptr [ebp-0x4],0x0
10005a0a:	51                   	push   ecx
10005a0b:	8b c8                	mov    ecx,eax
10005a0d:	ff 15 9c 23 02 10    	call   dword ptr ds:0x1002239c
10005a13:	8d 4d d4             	lea    ecx,[ebp-0x2c]
10005a16:	c6 45 fc 01          	mov    byte ptr [ebp-0x4],0x1
10005a1a:	51                   	push   ecx
10005a1b:	8b c8                	mov    ecx,eax
10005a1d:	ff 15 34 24 02 10    	call   dword ptr ds:0x10022434
10005a23:	8d 4d d8             	lea    ecx,[ebp-0x28]
10005a26:	c6 45 fc 02          	mov    byte ptr [ebp-0x4],0x2
10005a2a:	51                   	push   ecx
10005a2b:	8b c8                	mov    ecx,eax
10005a2d:	ff 15 84 23 02 10    	call   dword ptr ds:0x10022384
10005a33:	83 78 14 08          	cmp    dword ptr [eax+0x14],0x8
10005a37:	c6 45 fc 03          	mov    byte ptr [ebp-0x4],0x3
10005a3b:	72 02                	jb     0x10005a3f
10005a3d:	8b 00                	mov    eax,dword ptr [eax]
10005a3f:	51                   	push   ecx
10005a40:	8b cc                	mov    ecx,esp
10005a42:	50                   	push   eax
10005a43:	ff 15 8c 20 02 10    	call   dword ptr ds:0x1002208c
10005a49:	8b 0e                	mov    ecx,dword ptr [esi]
10005a4b:	8b 49 38             	mov    ecx,dword ptr [ecx+0x38]
10005a4e:	ff 15 c0 20 02 10    	call   dword ptr ds:0x100220c0
10005a54:	8b 45 ec             	mov    eax,dword ptr [ebp-0x14]
10005a57:	83 f8 08             	cmp    eax,0x8
10005a5a:	72 0f                	jb     0x10005a6b
10005a5c:	40                   	inc    eax
10005a5d:	6a 02                	push   0x2
10005a5f:	50                   	push   eax
10005a60:	ff 75 d8             	push   dword ptr [ebp-0x28]
10005a63:	e8 18 c8 ff ff       	call   0x10002280
10005a68:	83 c4 0c             	add    esp,0xc
10005a6b:	33 c0                	xor    eax,eax
10005a6d:	c7 45 ec 07 00 00 00 	mov    dword ptr [ebp-0x14],0x7
10005a74:	8d 4d d4             	lea    ecx,[ebp-0x2c]
10005a77:	c7 45 e8 00 00 00 00 	mov    dword ptr [ebp-0x18],0x0
10005a7e:	66 89 45 d8          	mov    word ptr [ebp-0x28],ax
10005a82:	ff 15 a4 23 02 10    	call   dword ptr ds:0x100223a4
10005a88:	8d 4d d0             	lea    ecx,[ebp-0x30]
10005a8b:	ff 15 a4 23 02 10    	call   dword ptr ds:0x100223a4
10005a91:	8d 4d cc             	lea    ecx,[ebp-0x34]
10005a94:	c7 45 fc ff ff ff ff 	mov    dword ptr [ebp-0x4],0xffffffff
10005a9b:	ff 15 a4 23 02 10    	call   dword ptr ds:0x100223a4
10005aa1:	8b 0e                	mov    ecx,dword ptr [esi]
10005aa3:	ff 71 38             	push   dword ptr [ecx+0x38]
10005aa6:	e8 c5 3e 00 00       	call   0x10009970
10005aab:	8b 0e                	mov    ecx,dword ptr [esi]
10005aad:	ff 71 38             	push   dword ptr [ecx+0x38]
10005ab0:	e8 7b 3c 00 00       	call   0x10009730
10005ab5:	8b 0e                	mov    ecx,dword ptr [esi]
10005ab7:	8b 89 fc 00 00 00    	mov    ecx,dword ptr [ecx+0xfc]
10005abd:	ff 15 b0 28 02 10    	call   dword ptr ds:0x100228b0
10005ac3:	8b c8                	mov    ecx,eax
10005ac5:	e8 b6 e7 00 00       	call   0x10014280
10005aca:	8b 4d f4             	mov    ecx,dword ptr [ebp-0xc]
10005acd:	64 89 0d 00 00 00 00 	mov    dword ptr fs:0x0,ecx
10005ad4:	59                   	pop    ecx
10005ad5:	5e                   	pop    esi
10005ad6:	8b 4d f0             	mov    ecx,dword ptr [ebp-0x10]
10005ad9:	33 cd                	xor    ecx,ebp
10005adb:	e8 8a 71 01 00       	call   0x1001cc6a
10005ae0:	8b e5                	mov    esp,ebp
10005ae2:	5d                   	pop    ebp
10005ae3:	c3                   	ret
10005ae4:	cc                   	int3
10005ae5:	cc                   	int3
10005ae6:	cc                   	int3
10005ae7:	cc                   	int3
10005ae8:	cc                   	int3
10005ae9:	cc                   	int3
10005aea:	cc                   	int3
10005aeb:	cc                   	int3
10005aec:	cc                   	int3
10005aed:	cc                   	int3
10005aee:	cc                   	int3
10005aef:	cc                   	int3



/mnt/data/is2_work/original/is2_pmauto_beta/modules/pm_auto.dll:     file format pei-i386


disassembly of section .text:

10005f00 <.text+0x4f00>:
10005f00:	55                   	push   ebp
10005f01:	8b ec                	mov    ebp,esp
10005f03:	6a ff                	push   0xffffffff
10005f05:	68 06 eb 01 10       	push   0x1001eb06
10005f0a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10005f10:	50                   	push   eax
10005f11:	83 ec 40             	sub    esp,0x40
10005f14:	53                   	push   ebx
10005f15:	56                   	push   esi
10005f16:	57                   	push   edi
10005f17:	a1 cc f0 06 10       	mov    eax,ds:0x1006f0cc
10005f1c:	33 c5                	xor    eax,ebp
10005f1e:	50                   	push   eax
10005f1f:	8d 45 f4             	lea    eax,[ebp-0xc]
10005f22:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10005f28:	8b f1                	mov    esi,ecx
10005f2a:	8b 0e                	mov    ecx,dword ptr [esi]
10005f2c:	6a 00                	push   0x0
10005f2e:	8b 89 1c 01 00 00    	mov    ecx,dword ptr [ecx+0x11c]
10005f34:	ff 15 bc 20 02 10    	call   dword ptr ds:0x100220bc
10005f3a:	8b 0e                	mov    ecx,dword ptr [esi]
10005f3c:	8b d8                	mov    ebx,eax
10005f3e:	68 01 01 00 00       	push   0x101
10005f43:	8d 45 c8             	lea    eax,[ebp-0x38]
10005f46:	89 5d ec             	mov    dword ptr [ebp-0x14],ebx
10005f49:	50                   	push   eax
10005f4a:	8b 89 48 01 00 00    	mov    ecx,dword ptr [ecx+0x148]
10005f50:	8b 49 28             	mov    ecx,dword ptr [ecx+0x28]
10005f53:	ff 15 f8 28 02 10    	call   dword ptr ds:0x100228f8
10005f59:	6a 00                	push   0x0
10005f5b:	8b c8                	mov    ecx,eax
10005f5d:	c7 45 fc 00 00 00 00 	mov    dword ptr [ebp-0x4],0x0
10005f64:	ff 15 c4 23 02 10    	call   dword ptr ds:0x100223c4
10005f6a:	8d 4d c8             	lea    ecx,[ebp-0x38]
10005f6d:	c7 45 fc ff ff ff ff 	mov    dword ptr [ebp-0x4],0xffffffff
10005f74:	8b f8                	mov    edi,eax
10005f76:	ff 15 5c 23 02 10    	call   dword ptr ds:0x1002235c
10005f7c:	85 ff                	test   edi,edi
10005f7e:	74 33                	je     0x10005fb3
10005f80:	8b 0e                	mov    ecx,dword ptr [esi]
10005f82:	6a 00                	push   0x0
10005f84:	6a 2b                	push   0x2b
10005f86:	ff 71 38             	push   dword ptr [ecx+0x38]
10005f89:	8b cb                	mov    ecx,ebx
10005f8b:	57                   	push   edi
10005f8c:	ff 15 64 20 02 10    	call   dword ptr ds:0x10022064
10005f92:	8b 0e                	mov    ecx,dword ptr [esi]
10005f94:	8b 89 fc 00 00 00    	mov    ecx,dword ptr [ecx+0xfc]
10005f9a:	ff 15 b0 28 02 10    	call   dword ptr ds:0x100228b0
10005fa0:	50                   	push   eax
10005fa1:	b9 90 bc 05 10       	mov    ecx,0x1005bc90
10005fa6:	ff 15 54 24 02 10    	call   dword ptr ds:0x10022454
10005fac:	8b c8                	mov    ecx,eax
10005fae:	e8 bd 0f 01 00       	call   0x10016f70
10005fb3:	33 ff                	xor    edi,edi
10005fb5:	8b cb                	mov    ecx,ebx
10005fb7:	89 7d f0             	mov    dword ptr [ebp-0x10],edi
10005fba:	ff 15 70 20 02 10    	call   dword ptr ds:0x10022070
10005fc0:	85 c0                	test   eax,eax
10005fc2:	0f 8e 3a 01 00 00    	jle    0x10006102
10005fc8:	0f 1f 84 00 00 00 00 	nop    dword ptr [eax+eax*1+0x0]
10005fcf:	00 
10005fd0:	57                   	push   edi
10005fd1:	8b cb                	mov    ecx,ebx
10005fd3:	ff 15 6c 20 02 10    	call   dword ptr ds:0x1002206c
10005fd9:	8b c8                	mov    ecx,eax
10005fdb:	ff 15 00 21 02 10    	call   dword ptr ds:0x10022100
10005fe1:	57                   	push   edi
10005fe2:	8b cb                	mov    ecx,ebx
10005fe4:	8b f0                	mov    esi,eax
10005fe6:	ff 15 6c 20 02 10    	call   dword ptr ds:0x1002206c
10005fec:	8b c8                	mov    ecx,eax
10005fee:	ff 15 fc 20 02 10    	call   dword ptr ds:0x100220fc
10005ff4:	8b 16                	mov    edx,dword ptr [esi]
10005ff6:	8b f8                	mov    edi,eax
10005ff8:	8d 45 d8             	lea    eax,[ebp-0x28]
10005ffb:	8b ce                	mov    ecx,esi
10005ffd:	50                   	push   eax
10005ffe:	ff 52 14             	call   dword ptr [edx+0x14]
10006001:	8b 35 90 20 02 10    	mov    esi,dword ptr ds:0x10022090
10006007:	8b c8                	mov    ecx,eax
10006009:	6a ff                	push   0xffffffff
1000600b:	c7 45 fc 01 00 00 00 	mov    dword ptr [ebp-0x4],0x1
10006012:	ff d6                	call   esi
10006014:	50                   	push   eax
10006015:	8d 45 dc             	lea    eax,[ebp-0x24]
10006018:	50                   	push   eax
10006019:	ff 15 90 23 02 10    	call   dword ptr ds:0x10022390
1000601f:	83 c4 0c             	add    esp,0xc
10006022:	8b d8                	mov    ebx,eax
10006024:	8b 17                	mov    edx,dword ptr [edi]
10006026:	8d 45 e0             	lea    eax,[ebp-0x20]
10006029:	50                   	push   eax
1000602a:	8b cf                	mov    ecx,edi
1000602c:	c6 45 fc 02          	mov    byte ptr [ebp-0x4],0x2
10006030:	ff 52 14             	call   dword ptr [edx+0x14]
10006033:	6a ff                	push   0xffffffff
10006035:	8b c8                	mov    ecx,eax
10006037:	c6 45 fc 03          	mov    byte ptr [ebp-0x4],0x3
1000603b:	ff d6                	call   esi
1000603d:	50                   	push   eax
1000603e:	8d 45 e4             	lea    eax,[ebp-0x1c]
10006041:	50                   	push   eax
10006042:	ff 15 90 23 02 10    	call   dword ptr ds:0x10022390
10006048:	83 c4 0c             	add    esp,0xc
1000604b:	8b f8                	mov    edi,eax
1000604d:	8d 45 e8             	lea    eax,[ebp-0x18]
10006050:	c6 45 fc 04          	mov    byte ptr [ebp-0x4],0x4
10006054:	50                   	push   eax
10006055:	6a 00                	push   0x0
10006057:	6a 00                	push   0x0
10006059:	6a 00                	push   0x0
1000605b:	8d 4d b4             	lea    ecx,[ebp-0x4c]
1000605e:	ff 15 4c 24 02 10    	call   dword ptr ds:0x1002244c
10006064:	8b c8                	mov    ecx,eax
10006066:	ff 15 50 24 02 10    	call   dword ptr ds:0x10022450
1000606c:	8b f0                	mov    esi,eax
1000606e:	ff 75 f0             	push   dword ptr [ebp-0x10]
10006071:	8b 4d ec             	mov    ecx,dword ptr [ebp-0x14]
10006074:	c6 45 fc 05          	mov    byte ptr [ebp-0x4],0x5
10006078:	ff 15 6c 20 02 10    	call   dword ptr ds:0x1002206c
1000607e:	8b c8                	mov    ecx,eax
10006080:	ff 15 f8 20 02 10    	call   dword ptr ds:0x100220f8
10006086:	0f b6 c8             	movzx  ecx,al
10006089:	51                   	push   ecx
1000608a:	53                   	push   ebx
1000608b:	8b 5d ec             	mov    ebx,dword ptr [ebp-0x14]
1000608e:	8b cb                	mov    ecx,ebx
10006090:	57                   	push   edi
10006091:	8b 7d f0             	mov    edi,dword ptr [ebp-0x10]
10006094:	57                   	push   edi
10006095:	ff 15 6c 20 02 10    	call   dword ptr ds:0x1002206c
1000609b:	50                   	push   eax
1000609c:	8b ce                	mov    ecx,esi
1000609e:	ff 15 3c 22 02 10    	call   dword ptr ds:0x1002223c
100060a4:	8b c8                	mov    ecx,eax
100060a6:	ff 15 34 22 02 10    	call   dword ptr ds:0x10022234
100060ac:	8b c8                	mov    ecx,eax
100060ae:	ff 15 34 22 02 10    	call   dword ptr ds:0x10022234
100060b4:	8b c8                	mov    ecx,eax
100060b6:	ff 15 44 22 02 10    	call   dword ptr ds:0x10022244
100060bc:	8d 4d e8             	lea    ecx,[ebp-0x18]
100060bf:	ff 15 48 22 02 10    	call   dword ptr ds:0x10022248
100060c5:	8d 4d e4             	lea    ecx,[ebp-0x1c]
100060c8:	ff 15 a4 23 02 10    	call   dword ptr ds:0x100223a4
100060ce:	8b 35 48 21 02 10    	mov    esi,dword ptr ds:0x10022148
100060d4:	8d 4d e0             	lea    ecx,[ebp-0x20]
100060d7:	ff d6                	call   esi
100060d9:	8d 4d dc             	lea    ecx,[ebp-0x24]
100060dc:	ff 15 a4 23 02 10    	call   dword ptr ds:0x100223a4
100060e2:	8d 4d d8             	lea    ecx,[ebp-0x28]
100060e5:	c7 45 fc ff ff ff ff 	mov    dword ptr [ebp-0x4],0xffffffff
100060ec:	ff d6                	call   esi
100060ee:	47                   	inc    edi
100060ef:	8b cb                	mov    ecx,ebx
100060f1:	89 7d f0             	mov    dword ptr [ebp-0x10],edi
100060f4:	ff 15 70 20 02 10    	call   dword ptr ds:0x10022070
100060fa:	3b f8                	cmp    edi,eax
100060fc:	0f 8c ce fe ff ff    	jl     0x10005fd0
10006102:	8b 4d f4             	mov    ecx,dword ptr [ebp-0xc]
10006105:	64 89 0d 00 00 00 00 	mov    dword ptr fs:0x0,ecx
1000610c:	59                   	pop    ecx
1000610d:	5f                   	pop    edi
1000610e:	5e                   	pop    esi
1000610f:	5b                   	pop    ebx
10006110:	8b e5                	mov    esp,ebp
10006112:	5d                   	pop    ebp
10006113:	c3                   	ret
10006114:	cc                   	int3
10006115:	cc                   	int3
10006116:	cc                   	int3
10006117:	cc                   	int3
10006118:	cc                   	int3
10006119:	cc                   	int3
1000611a:	cc                   	int3
1000611b:	cc                   	int3
1000611c:	cc                   	int3
1000611d:	cc                   	int3
1000611e:	cc                   	int3
1000611f:	cc                   	int3



/mnt/data/is2_work/original/is2_pmauto_beta/modules/pm_auto.dll:     file format pei-i386


disassembly of section .text:

10006bf0 <.text+0x5bf0>:
10006bf0:	55                   	push   ebp
10006bf1:	8b ec                	mov    ebp,esp
10006bf3:	6a ff                	push   0xffffffff
10006bf5:	68 db eb 01 10       	push   0x1001ebdb
10006bfa:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10006c00:	50                   	push   eax
10006c01:	83 ec 54             	sub    esp,0x54
10006c04:	53                   	push   ebx
10006c05:	56                   	push   esi
10006c06:	57                   	push   edi
10006c07:	a1 cc f0 06 10       	mov    eax,ds:0x1006f0cc
10006c0c:	33 c5                	xor    eax,ebp
10006c0e:	50                   	push   eax
10006c0f:	8d 45 f4             	lea    eax,[ebp-0xc]
10006c12:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10006c18:	8b d9                	mov    ebx,ecx
10006c1a:	89 5d f0             	mov    dword ptr [ebp-0x10],ebx
10006c1d:	8b 03                	mov    eax,dword ptr [ebx]
10006c1f:	83 78 38 00          	cmp    dword ptr [eax+0x38],0x0
10006c23:	0f 84 4d 01 00 00    	je     0x10006d76
10006c29:	8d 45 ec             	lea    eax,[ebp-0x14]
10006c2c:	50                   	push   eax
10006c2d:	6a 00                	push   0x0
10006c2f:	6a 00                	push   0x0
10006c31:	6a 00                	push   0x0
10006c33:	8d 4d a0             	lea    ecx,[ebp-0x60]
10006c36:	ff 15 4c 24 02 10    	call   dword ptr ds:0x1002244c
10006c3c:	8b c8                	mov    ecx,eax
10006c3e:	ff 15 50 24 02 10    	call   dword ptr ds:0x10022450
10006c44:	ff 75 08             	push   dword ptr [ebp+0x8]
10006c47:	8b c8                	mov    ecx,eax
10006c49:	c7 45 fc 00 00 00 00 	mov    dword ptr [ebp-0x4],0x0
10006c50:	68 a0 ac 05 10       	push   0x1005aca0
10006c55:	ff 15 38 22 02 10    	call   dword ptr ds:0x10022238
10006c5b:	8b c8                	mov    ecx,eax
10006c5d:	ff 15 40 22 02 10    	call   dword ptr ds:0x10022240
10006c63:	8d 4d ec             	lea    ecx,[ebp-0x14]
10006c66:	c7 45 fc ff ff ff ff 	mov    dword ptr [ebp-0x4],0xffffffff
10006c6d:	ff 15 48 22 02 10    	call   dword ptr ds:0x10022248
10006c73:	8b 0b                	mov    ecx,dword ptr [ebx]
10006c75:	6a 00                	push   0x0
10006c77:	8b 89 1c 01 00 00    	mov    ecx,dword ptr [ecx+0x11c]
10006c7d:	ff 15 bc 20 02 10    	call   dword ptr ds:0x100220bc
10006c83:	8b 0b                	mov    ecx,dword ptr [ebx]
10006c85:	89 45 ec             	mov    dword ptr [ebp-0x14],eax
10006c88:	ff 71 38             	push   dword ptr [ecx+0x38]
10006c8b:	8d 4d e4             	lea    ecx,[ebp-0x1c]
10006c8e:	51                   	push   ecx
10006c8f:	8b c8                	mov    ecx,eax
10006c91:	ff 15 68 20 02 10    	call   dword ptr ds:0x10022068
10006c97:	33 f6                	xor    esi,esi
10006c99:	c7 45 fc 01 00 00 00 	mov    dword ptr [ebp-0x4],0x1
10006ca0:	39 75 e4             	cmp    dword ptr [ebp-0x1c],esi
10006ca3:	7e 43                	jle    0x10006ce8
10006ca5:	8b 1d f8 20 02 10    	mov    ebx,dword ptr ds:0x100220f8
10006cab:	0f 1f 44 00 00       	nop    dword ptr [eax+eax*1+0x0]
10006cb0:	8b 45 e8             	mov    eax,dword ptr [ebp-0x18]
10006cb3:	8b 3c b0             	mov    edi,dword ptr [eax+esi*4]
10006cb6:	8b cf                	mov    ecx,edi
10006cb8:	ff d3                	call   ebx
10006cba:	3c 2a                	cmp    al,0x2a
10006cbc:	74 08                	je     0x10006cc6
10006cbe:	46                   	inc    esi
10006cbf:	3b 75 e4             	cmp    esi,dword ptr [ebp-0x1c]
10006cc2:	7c ec                	jl     0x10006cb0
10006cc4:	eb 1f                	jmp    0x10006ce5
10006cc6:	6a 00                	push   0x0
10006cc8:	6a 2a                	push   0x2a
10006cca:	8b cf                	mov    ecx,edi
10006ccc:	ff 15 fc 20 02 10    	call   dword ptr ds:0x100220fc
10006cd2:	50                   	push   eax
10006cd3:	8b cf                	mov    ecx,edi
10006cd5:	ff 15 00 21 02 10    	call   dword ptr ds:0x10022100
10006cdb:	8b 4d ec             	mov    ecx,dword ptr [ebp-0x14]
10006cde:	50                   	push   eax
10006cdf:	ff 15 5c 20 02 10    	call   dword ptr ds:0x1002205c
10006ce5:	8b 5d f0             	mov    ebx,dword ptr [ebp-0x10]
10006ce8:	8b 7d 08             	mov    edi,dword ptr [ebp+0x8]
10006ceb:	85 ff                	test   edi,edi
10006ced:	7e 69                	jle    0x10006d58
10006cef:	8b 03                	mov    eax,dword ptr [ebx]
10006cf1:	8d 4d c4             	lea    ecx,[ebp-0x3c]
10006cf4:	68 01 01 00 00       	push   0x101
10006cf9:	8b b0 5c 01 00 00    	mov    esi,dword ptr [eax+0x15c]
10006cff:	ff 15 bc 23 02 10    	call   dword ptr ds:0x100223bc
10006d05:	8b 0b                	mov    ecx,dword ptr [ebx]
10006d07:	50                   	push   eax
10006d08:	6a 00                	push   0x0
10006d0a:	57                   	push   edi
10006d0b:	8d 45 b4             	lea    eax,[ebp-0x4c]
10006d0e:	81 c1 5c 01 00 00    	add    ecx,0x15c
10006d14:	50                   	push   eax
10006d15:	ff 56 2c             	call   dword ptr [esi+0x2c]
10006d18:	8b 0b                	mov    ecx,dword ptr [ebx]
10006d1a:	50                   	push   eax
10006d1b:	8d 45 d4             	lea    eax,[ebp-0x2c]
10006d1e:	81 c1 5c 01 00 00    	add    ecx,0x15c
10006d24:	50                   	push   eax
10006d25:	ff 56 44             	call   dword ptr [esi+0x44]
10006d28:	6a 00                	push   0x0
10006d2a:	8b c8                	mov    ecx,eax
10006d2c:	c6 45 fc 02          	mov    byte ptr [ebp-0x4],0x2
10006d30:	ff 15 c4 23 02 10    	call   dword ptr ds:0x100223c4
10006d36:	8d 4d d4             	lea    ecx,[ebp-0x2c]
10006d39:	c6 45 fc 01          	mov    byte ptr [ebp-0x4],0x1
10006d3d:	8b f0                	mov    esi,eax
10006d3f:	ff 15 5c 23 02 10    	call   dword ptr ds:0x1002235c
10006d45:	8b 0b                	mov    ecx,dword ptr [ebx]
10006d47:	6a 01                	push   0x1
10006d49:	6a 2a                	push   0x2a
10006d4b:	ff 71 38             	push   dword ptr [ecx+0x38]
10006d4e:	8b 4d ec             	mov    ecx,dword ptr [ebp-0x14]
10006d51:	56                   	push   esi
10006d52:	ff 15 64 20 02 10    	call   dword ptr ds:0x10022064
10006d58:	8b 0b                	mov    ecx,dword ptr [ebx]
10006d5a:	8b 89 fc 00 00 00    	mov    ecx,dword ptr [ecx+0xfc]
10006d60:	ff 15 b0 28 02 10    	call   dword ptr ds:0x100228b0
10006d66:	8b c8                	mov    ecx,eax
10006d68:	e8 13 d5 00 00       	call   0x10014280
10006d6d:	8d 4d e4             	lea    ecx,[ebp-0x1c]
10006d70:	ff 15 cc 20 02 10    	call   dword ptr ds:0x100220cc
10006d76:	8b 4d f4             	mov    ecx,dword ptr [ebp-0xc]
10006d79:	64 89 0d 00 00 00 00 	mov    dword ptr fs:0x0,ecx
10006d80:	59                   	pop    ecx
10006d81:	5f                   	pop    edi
10006d82:	5e                   	pop    esi
10006d83:	5b                   	pop    ebx
10006d84:	8b e5                	mov    esp,ebp
10006d86:	5d                   	pop    ebp
10006d87:	c2 04 00             	ret    0x4
10006d8a:	cc                   	int3
10006d8b:	cc                   	int3
10006d8c:	cc                   	int3
10006d8d:	cc                   	int3
10006d8e:	cc                   	int3
10006d8f:	cc                   	int3



/mnt/data/is2_work/original/is2_pmauto_beta/modules/pm_auto.dll:     file format pei-i386


disassembly of section .text:

10006dc0 <.text+0x5dc0>:
10006dc0:	55                   	push   ebp
10006dc1:	8b ec                	mov    ebp,esp
10006dc3:	6a ff                	push   0xffffffff
10006dc5:	68 09 ec 01 10       	push   0x1001ec09
10006dca:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10006dd0:	50                   	push   eax
10006dd1:	83 ec 10             	sub    esp,0x10
10006dd4:	53                   	push   ebx
10006dd5:	56                   	push   esi
10006dd6:	57                   	push   edi
10006dd7:	a1 cc f0 06 10       	mov    eax,ds:0x1006f0cc
10006ddc:	33 c5                	xor    eax,ebp
10006dde:	50                   	push   eax
10006ddf:	8d 45 f4             	lea    eax,[ebp-0xc]
10006de2:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10006de8:	8b f1                	mov    esi,ecx
10006dea:	8b 0e                	mov    ecx,dword ptr [esi]
10006dec:	6a 00                	push   0x0
10006dee:	8b 89 1c 01 00 00    	mov    ecx,dword ptr [ecx+0x11c]
10006df4:	ff 15 bc 20 02 10    	call   dword ptr ds:0x100220bc
10006dfa:	8b 0e                	mov    ecx,dword ptr [esi]
10006dfc:	8b d8                	mov    ebx,eax
10006dfe:	68 01 01 00 00       	push   0x101
10006e03:	8d 45 e4             	lea    eax,[ebp-0x1c]
10006e06:	50                   	push   eax
10006e07:	8b 89 48 01 00 00    	mov    ecx,dword ptr [ecx+0x148]
10006e0d:	8b 49 28             	mov    ecx,dword ptr [ecx+0x28]
10006e10:	ff 15 f8 28 02 10    	call   dword ptr ds:0x100228f8
10006e16:	6a 00                	push   0x0
10006e18:	8b c8                	mov    ecx,eax
10006e1a:	c7 45 fc 00 00 00 00 	mov    dword ptr [ebp-0x4],0x0
10006e21:	ff 15 c4 23 02 10    	call   dword ptr ds:0x100223c4
10006e27:	8d 4d e4             	lea    ecx,[ebp-0x1c]
10006e2a:	c7 45 fc ff ff ff ff 	mov    dword ptr [ebp-0x4],0xffffffff
10006e31:	8b f8                	mov    edi,eax
10006e33:	ff 15 5c 23 02 10    	call   dword ptr ds:0x1002235c
10006e39:	85 ff                	test   edi,edi
10006e3b:	74 33                	je     0x10006e70
10006e3d:	8b 0e                	mov    ecx,dword ptr [esi]
10006e3f:	6a 00                	push   0x0
10006e41:	6a 2e                	push   0x2e
10006e43:	ff 71 38             	push   dword ptr [ecx+0x38]
10006e46:	8b cb                	mov    ecx,ebx
10006e48:	57                   	push   edi
10006e49:	ff 15 64 20 02 10    	call   dword ptr ds:0x10022064
10006e4f:	8b 0e                	mov    ecx,dword ptr [esi]
10006e51:	8b 89 fc 00 00 00    	mov    ecx,dword ptr [ecx+0xfc]
10006e57:	ff 15 b0 28 02 10    	call   dword ptr ds:0x100228b0
10006e5d:	50                   	push   eax
10006e5e:	b9 90 bc 05 10       	mov    ecx,0x1005bc90
10006e63:	ff 15 54 24 02 10    	call   dword ptr ds:0x10022454
10006e69:	8b c8                	mov    ecx,eax
10006e6b:	e8 00 01 01 00       	call   0x10016f70
10006e70:	8b 4d f4             	mov    ecx,dword ptr [ebp-0xc]
10006e73:	64 89 0d 00 00 00 00 	mov    dword ptr fs:0x0,ecx
10006e7a:	59                   	pop    ecx
10006e7b:	5f                   	pop    edi
10006e7c:	5e                   	pop    esi
10006e7d:	5b                   	pop    ebx
10006e7e:	8b e5                	mov    esp,ebp
10006e80:	5d                   	pop    ebp
10006e81:	c3                   	ret
10006e82:	cc                   	int3
10006e83:	cc                   	int3
10006e84:	cc                   	int3
10006e85:	cc                   	int3
10006e86:	cc                   	int3
10006e87:	cc                   	int3
10006e88:	cc                   	int3
10006e89:	cc                   	int3
10006e8a:	cc                   	int3
10006e8b:	cc                   	int3
10006e8c:	cc                   	int3
10006e8d:	cc                   	int3
10006e8e:	cc                   	int3
10006e8f:	cc                   	int3
