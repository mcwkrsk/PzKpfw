## Five plugins: WorkWidget primary vtable slot +0xb4 (MenuWidget factory), slot +0xcc (context setter), factory and MenuWidget constructor
# Static x86 disassembly; addresses are image VAs tied to source hashes in workwidget_interface.json.

### PM_auto.dll: WorkWidget +0xb4 factory 0x10002ca0-0x10002d10

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/PM_auto.dll:     file format pei-i386


Disassembly of section .text:

10002ca0 <.text+0x1ca0>:
10002ca0:	55                   	push   ebp
10002ca1:	8b ec                	mov    ebp,esp
10002ca3:	6a ff                	push   0xffffffff
10002ca5:	68 cf e7 01 10       	push   0x1001e7cf
10002caa:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10002cb0:	50                   	push   eax
10002cb1:	51                   	push   ecx
10002cb2:	a1 cc f0 06 10       	mov    eax,ds:0x1006f0cc
10002cb7:	33 c5                	xor    eax,ebp
10002cb9:	50                   	push   eax
10002cba:	8d 45 f4             	lea    eax,[ebp-0xc]
10002cbd:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10002cc3:	6a 20                	push   0x20
10002cc5:	e8 b1 9f 01 00       	call   0x1001cc7b
10002cca:	83 c4 04             	add    esp,0x4
10002ccd:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
10002cd0:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10002cd7:	85 c0                	test   eax,eax
10002cd9:	74 18                	je     0x10002cf3
10002cdb:	6a 00                	push   0x0
10002cdd:	8b c8                	mov    ecx,eax
10002cdf:	e8 bc 00 00 00       	call   0x10002da0
10002ce4:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10002ce7:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10002cee:	59                   	pop    ecx
10002cef:	8b e5                	mov    esp,ebp
10002cf1:	5d                   	pop    ebp
10002cf2:	c3                   	ret
10002cf3:	33 c0                	xor    eax,eax
10002cf5:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10002cf8:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10002cff:	59                   	pop    ecx
10002d00:	8b e5                	mov    esp,ebp
10002d02:	5d                   	pop    ebp
10002d03:	c3                   	ret
10002d04:	cc                   	int3
10002d05:	cc                   	int3
10002d06:	cc                   	int3
10002d07:	cc                   	int3
10002d08:	cc                   	int3
10002d09:	cc                   	int3
10002d0a:	cc                   	int3
10002d0b:	cc                   	int3
10002d0c:	cc                   	int3
10002d0d:	cc                   	int3
10002d0e:	cc                   	int3
10002d0f:	cc                   	int3

### PM_auto.dll: WorkWidget +0xcc wrapper 0x10002c80-0x10002c92

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/PM_auto.dll:     file format pei-i386


Disassembly of section .text:

10002c80 <.text+0x1c80>:
10002c80:	55                   	push   ebp
10002c81:	8b ec                	mov    ebp,esp
10002c83:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10002c86:	e8 55 ff ff ff       	call   0x10002be0
10002c8b:	83 c4 04             	add    esp,0x4
10002c8e:	5d                   	pop    ebp
10002c8f:	c2 04 00             	ret    0x4

### PM_auto.dll: host context store helper 0x10002be0-0x10002bf0

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/PM_auto.dll:     file format pei-i386


Disassembly of section .text:

10002be0 <.text+0x1be0>:
10002be0:	55                   	push   ebp
10002be1:	8b ec                	mov    ebp,esp
10002be3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10002be6:	a3 2c 05 07 10       	mov    ds:0x1007052c,eax
10002beb:	5d                   	pop    ebp
10002bec:	c3                   	ret
10002bed:	cc                   	int3
10002bee:	cc                   	int3
10002bef:	cc                   	int3

### PM_auto.dll: MenuWidget constructor 0x10002da0-0x10002e10

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/PM_auto.dll:     file format pei-i386


Disassembly of section .text:

10002da0 <.text+0x1da0>:
10002da0:	55                   	push   ebp
10002da1:	8b ec                	mov    ebp,esp
10002da3:	51                   	push   ecx
10002da4:	56                   	push   esi
10002da5:	6a 00                	push   0x0
10002da7:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10002daa:	8b f1                	mov    esi,ecx
10002dac:	89 75 fc             	mov    DWORD PTR [ebp-0x4],esi
10002daf:	ff 15 30 28 02 10    	call   DWORD PTR ds:0x10022830
10002db5:	8d 4e 1c             	lea    ecx,[esi+0x1c]
10002db8:	c7 06 88 7b 05 10    	mov    DWORD PTR [esi],0x10057b88
10002dbe:	c7 46 08 44 7c 05 10 	mov    DWORD PTR [esi+0x8],0x10057c44
10002dc5:	ff 15 3c 24 02 10    	call   DWORD PTR ds:0x1002243c
10002dcb:	8b c6                	mov    eax,esi
10002dcd:	5e                   	pop    esi
10002dce:	8b e5                	mov    esp,ebp
10002dd0:	5d                   	pop    ebp
10002dd1:	c2 04 00             	ret    0x4
10002dd4:	83 e9 08             	sub    ecx,0x8
10002dd7:	e9 04 00 00 00       	jmp    0x10002de0
10002ddc:	cc                   	int3
10002ddd:	cc                   	int3
10002dde:	cc                   	int3
10002ddf:	cc                   	int3
10002de0:	55                   	push   ebp
10002de1:	8b ec                	mov    ebp,esp
10002de3:	56                   	push   esi
10002de4:	8b f1                	mov    esi,ecx
10002de6:	8d 4e 1c             	lea    ecx,[esi+0x1c]
10002de9:	ff 15 a4 23 02 10    	call   DWORD PTR ds:0x100223a4
10002def:	8b ce                	mov    ecx,esi
10002df1:	ff 15 34 28 02 10    	call   DWORD PTR ds:0x10022834
10002df7:	f6 45 08 01          	test   BYTE PTR [ebp+0x8],0x1
10002dfb:	74 0b                	je     0x10002e08
10002dfd:	6a 20                	push   0x20
10002dff:	56                   	push   esi
10002e00:	e8 ae 9e 01 00       	call   0x1001ccb3
10002e05:	83 c4 08             	add    esp,0x8
10002e08:	8b c6                	mov    eax,esi
10002e0a:	5e                   	pop    esi
10002e0b:	5d                   	pop    ebp
10002e0c:	c2 04 00             	ret    0x4
10002e0f:	cc                   	int3

### PM_params.dll: WorkWidget +0xb4 factory 0x10007d30-0x10007e10

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/PM_params.dll:     file format pei-i386


Disassembly of section .text:

10007d30 <.text+0x6d30>:
10007d30:	55                   	push   ebp
10007d31:	8b ec                	mov    ebp,esp
10007d33:	6a ff                	push   0xffffffff
10007d35:	68 ef 9c 00 10       	push   0x10009cef
10007d3a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10007d40:	50                   	push   eax
10007d41:	51                   	push   ecx
10007d42:	a1 50 30 02 10       	mov    eax,ds:0x10023050
10007d47:	33 c5                	xor    eax,ebp
10007d49:	50                   	push   eax
10007d4a:	8d 45 f4             	lea    eax,[ebp-0xc]
10007d4d:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10007d53:	6a 20                	push   0x20
10007d55:	e8 97 04 00 00       	call   0x100081f1
10007d5a:	83 c4 04             	add    esp,0x4
10007d5d:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
10007d60:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10007d67:	85 c0                	test   eax,eax
10007d69:	74 18                	je     0x10007d83
10007d6b:	6a 00                	push   0x0
10007d6d:	8b c8                	mov    ecx,eax
10007d6f:	e8 2c 00 00 00       	call   0x10007da0
10007d74:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10007d77:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10007d7e:	59                   	pop    ecx
10007d7f:	8b e5                	mov    esp,ebp
10007d81:	5d                   	pop    ebp
10007d82:	c3                   	ret
10007d83:	33 c0                	xor    eax,eax
10007d85:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10007d88:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10007d8f:	59                   	pop    ecx
10007d90:	8b e5                	mov    esp,ebp
10007d92:	5d                   	pop    ebp
10007d93:	c3                   	ret
10007d94:	cc                   	int3
10007d95:	cc                   	int3
10007d96:	cc                   	int3
10007d97:	cc                   	int3
10007d98:	cc                   	int3
10007d99:	cc                   	int3
10007d9a:	cc                   	int3
10007d9b:	cc                   	int3
10007d9c:	cc                   	int3
10007d9d:	cc                   	int3
10007d9e:	cc                   	int3
10007d9f:	cc                   	int3
10007da0:	55                   	push   ebp
10007da1:	8b ec                	mov    ebp,esp
10007da3:	51                   	push   ecx
10007da4:	56                   	push   esi
10007da5:	6a 00                	push   0x0
10007da7:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10007daa:	8b f1                	mov    esi,ecx
10007dac:	89 75 fc             	mov    DWORD PTR [ebp-0x4],esi
10007daf:	ff 15 00 a8 00 10    	call   DWORD PTR ds:0x1000a800
10007db5:	8d 4e 1c             	lea    ecx,[esi+0x1c]
10007db8:	c7 06 94 8e 01 10    	mov    DWORD PTR [esi],0x10018e94
10007dbe:	c7 46 08 50 8f 01 10 	mov    DWORD PTR [esi+0x8],0x10018f50
10007dc5:	ff 15 70 a1 00 10    	call   DWORD PTR ds:0x1000a170
10007dcb:	8b c6                	mov    eax,esi
10007dcd:	5e                   	pop    esi
10007dce:	8b e5                	mov    esp,ebp
10007dd0:	5d                   	pop    ebp
10007dd1:	c2 04 00             	ret    0x4
10007dd4:	83 e9 08             	sub    ecx,0x8
10007dd7:	e9 04 00 00 00       	jmp    0x10007de0
10007ddc:	cc                   	int3
10007ddd:	cc                   	int3
10007dde:	cc                   	int3
10007ddf:	cc                   	int3
10007de0:	55                   	push   ebp
10007de1:	8b ec                	mov    ebp,esp
10007de3:	56                   	push   esi
10007de4:	8b f1                	mov    esi,ecx
10007de6:	8d 4e 1c             	lea    ecx,[esi+0x1c]
10007de9:	ff 15 40 a2 00 10    	call   DWORD PTR ds:0x1000a240
10007def:	8b ce                	mov    ecx,esi
10007df1:	ff 15 fc a7 00 10    	call   DWORD PTR ds:0x1000a7fc
10007df7:	f6 45 08 01          	test   BYTE PTR [ebp+0x8],0x1
10007dfb:	74 0b                	je     0x10007e08
10007dfd:	6a 20                	push   0x20
10007dff:	56                   	push   esi
10007e00:	e8 24 04 00 00       	call   0x10008229
10007e05:	83 c4 08             	add    esp,0x8
10007e08:	8b c6                	mov    eax,esi
10007e0a:	5e                   	pop    esi
10007e0b:	5d                   	pop    ebp
10007e0c:	c2 04 00             	ret    0x4
10007e0f:	cc                   	int3

### PM_params.dll: WorkWidget +0xcc wrapper 0x10007d10-0x10007d22

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/PM_params.dll:     file format pei-i386


Disassembly of section .text:

10007d10 <.text+0x6d10>:
10007d10:	55                   	push   ebp
10007d11:	8b ec                	mov    ebp,esp
10007d13:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10007d16:	e8 65 ff ff ff       	call   0x10007c80
10007d1b:	83 c4 04             	add    esp,0x4
10007d1e:	5d                   	pop    ebp
10007d1f:	c2 04 00             	ret    0x4

### PM_params.dll: host context store helper 0x10007c80-0x10007c90

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/PM_params.dll:     file format pei-i386


Disassembly of section .text:

10007c80 <.text+0x6c80>:
10007c80:	55                   	push   ebp
10007c81:	8b ec                	mov    ebp,esp
10007c83:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10007c86:	a3 44 35 02 10       	mov    ds:0x10023544,eax
10007c8b:	5d                   	pop    ebp
10007c8c:	c3                   	ret
10007c8d:	cc                   	int3
10007c8e:	cc                   	int3
10007c8f:	cc                   	int3

### PM_params.dll: MenuWidget constructor 0x10007da0-0x10007e20

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/PM_params.dll:     file format pei-i386


Disassembly of section .text:

10007da0 <.text+0x6da0>:
10007da0:	55                   	push   ebp
10007da1:	8b ec                	mov    ebp,esp
10007da3:	51                   	push   ecx
10007da4:	56                   	push   esi
10007da5:	6a 00                	push   0x0
10007da7:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10007daa:	8b f1                	mov    esi,ecx
10007dac:	89 75 fc             	mov    DWORD PTR [ebp-0x4],esi
10007daf:	ff 15 00 a8 00 10    	call   DWORD PTR ds:0x1000a800
10007db5:	8d 4e 1c             	lea    ecx,[esi+0x1c]
10007db8:	c7 06 94 8e 01 10    	mov    DWORD PTR [esi],0x10018e94
10007dbe:	c7 46 08 50 8f 01 10 	mov    DWORD PTR [esi+0x8],0x10018f50
10007dc5:	ff 15 70 a1 00 10    	call   DWORD PTR ds:0x1000a170
10007dcb:	8b c6                	mov    eax,esi
10007dcd:	5e                   	pop    esi
10007dce:	8b e5                	mov    esp,ebp
10007dd0:	5d                   	pop    ebp
10007dd1:	c2 04 00             	ret    0x4
10007dd4:	83 e9 08             	sub    ecx,0x8
10007dd7:	e9 04 00 00 00       	jmp    0x10007de0
10007ddc:	cc                   	int3
10007ddd:	cc                   	int3
10007dde:	cc                   	int3
10007ddf:	cc                   	int3
10007de0:	55                   	push   ebp
10007de1:	8b ec                	mov    ebp,esp
10007de3:	56                   	push   esi
10007de4:	8b f1                	mov    esi,ecx
10007de6:	8d 4e 1c             	lea    ecx,[esi+0x1c]
10007de9:	ff 15 40 a2 00 10    	call   DWORD PTR ds:0x1000a240
10007def:	8b ce                	mov    ecx,esi
10007df1:	ff 15 fc a7 00 10    	call   DWORD PTR ds:0x1000a7fc
10007df7:	f6 45 08 01          	test   BYTE PTR [ebp+0x8],0x1
10007dfb:	74 0b                	je     0x10007e08
10007dfd:	6a 20                	push   0x20
10007dff:	56                   	push   esi
10007e00:	e8 24 04 00 00       	call   0x10008229
10007e05:	83 c4 08             	add    esp,0x8
10007e08:	8b c6                	mov    eax,esi
10007e0a:	5e                   	pop    esi
10007e0b:	5d                   	pop    ebp
10007e0c:	c2 04 00             	ret    0x4
10007e0f:	cc                   	int3
10007e10:	c3                   	ret
10007e11:	cc                   	int3
10007e12:	cc                   	int3
10007e13:	cc                   	int3
10007e14:	cc                   	int3
10007e15:	cc                   	int3
10007e16:	cc                   	int3
10007e17:	cc                   	int3
10007e18:	cc                   	int3
10007e19:	cc                   	int3
10007e1a:	cc                   	int3
10007e1b:	cc                   	int3
10007e1c:	cc                   	int3
10007e1d:	cc                   	int3
10007e1e:	cc                   	int3
10007e1f:	cc                   	int3

### PM_spec_WEB.dll: WorkWidget +0xb4 factory 0x100088c0-0x10008930

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/PM_spec_WEB.dll:     file format pei-i386


Disassembly of section .text:

100088c0 <.text+0x78c0>:
100088c0:	55                   	push   ebp
100088c1:	8b ec                	mov    ebp,esp
100088c3:	6a ff                	push   0xffffffff
100088c5:	68 4f b2 00 10       	push   0x1000b24f
100088ca:	64 a1 00 00 00 00    	mov    eax,fs:0x0
100088d0:	50                   	push   eax
100088d1:	51                   	push   ecx
100088d2:	a1 68 60 01 10       	mov    eax,ds:0x10016068
100088d7:	33 c5                	xor    eax,ebp
100088d9:	50                   	push   eax
100088da:	8d 45 f4             	lea    eax,[ebp-0xc]
100088dd:	64 a3 00 00 00 00    	mov    fs:0x0,eax
100088e3:	6a 20                	push   0x20
100088e5:	e8 b6 01 00 00       	call   0x10008aa0
100088ea:	83 c4 04             	add    esp,0x4
100088ed:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
100088f0:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
100088f7:	85 c0                	test   eax,eax
100088f9:	74 18                	je     0x10008913
100088fb:	6a 00                	push   0x0
100088fd:	8b c8                	mov    ecx,eax
100088ff:	e8 ac 00 00 00       	call   0x100089b0
10008904:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10008907:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000890e:	59                   	pop    ecx
1000890f:	8b e5                	mov    esp,ebp
10008911:	5d                   	pop    ebp
10008912:	c3                   	ret
10008913:	33 c0                	xor    eax,eax
10008915:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10008918:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000891f:	59                   	pop    ecx
10008920:	8b e5                	mov    esp,ebp
10008922:	5d                   	pop    ebp
10008923:	c3                   	ret
10008924:	cc                   	int3
10008925:	cc                   	int3
10008926:	cc                   	int3
10008927:	cc                   	int3
10008928:	cc                   	int3
10008929:	cc                   	int3
1000892a:	cc                   	int3
1000892b:	cc                   	int3
1000892c:	cc                   	int3
1000892d:	cc                   	int3
1000892e:	cc                   	int3
1000892f:	cc                   	int3

### PM_spec_WEB.dll: WorkWidget +0xcc wrapper 0x100088a0-0x100088b2

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/PM_spec_WEB.dll:     file format pei-i386


Disassembly of section .text:

100088a0 <.text+0x78a0>:
100088a0:	55                   	push   ebp
100088a1:	8b ec                	mov    ebp,esp
100088a3:	ff 75 08             	push   DWORD PTR [ebp+0x8]
100088a6:	e8 65 ff ff ff       	call   0x10008810
100088ab:	83 c4 04             	add    esp,0x4
100088ae:	5d                   	pop    ebp
100088af:	c2 04 00             	ret    0x4

### PM_spec_WEB.dll: host context store helper 0x10008810-0x10008820

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/PM_spec_WEB.dll:     file format pei-i386


Disassembly of section .text:

10008810 <.text+0x7810>:
10008810:	55                   	push   ebp
10008811:	8b ec                	mov    ebp,esp
10008813:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10008816:	a3 dc 63 01 10       	mov    ds:0x100163dc,eax
1000881b:	5d                   	pop    ebp
1000881c:	c3                   	ret
1000881d:	cc                   	int3
1000881e:	cc                   	int3
1000881f:	cc                   	int3

### PM_spec_WEB.dll: MenuWidget constructor 0x100089b0-0x10008a20

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/PM_spec_WEB.dll:     file format pei-i386


Disassembly of section .text:

100089b0 <.text+0x79b0>:
100089b0:	55                   	push   ebp
100089b1:	8b ec                	mov    ebp,esp
100089b3:	51                   	push   ecx
100089b4:	56                   	push   esi
100089b5:	6a 00                	push   0x0
100089b7:	ff 75 08             	push   DWORD PTR [ebp+0x8]
100089ba:	8b f1                	mov    esi,ecx
100089bc:	89 75 fc             	mov    DWORD PTR [ebp-0x4],esi
100089bf:	ff 15 20 c3 00 10    	call   DWORD PTR ds:0x1000c320
100089c5:	8d 4e 1c             	lea    ecx,[esi+0x1c]
100089c8:	c7 06 60 e6 00 10    	mov    DWORD PTR [esi],0x1000e660
100089ce:	c7 46 08 1c e7 00 10 	mov    DWORD PTR [esi+0x8],0x1000e71c
100089d5:	ff 15 e0 c1 00 10    	call   DWORD PTR ds:0x1000c1e0
100089db:	8b c6                	mov    eax,esi
100089dd:	5e                   	pop    esi
100089de:	8b e5                	mov    esp,ebp
100089e0:	5d                   	pop    ebp
100089e1:	c2 04 00             	ret    0x4
100089e4:	83 e9 08             	sub    ecx,0x8
100089e7:	e9 04 00 00 00       	jmp    0x100089f0
100089ec:	cc                   	int3
100089ed:	cc                   	int3
100089ee:	cc                   	int3
100089ef:	cc                   	int3
100089f0:	55                   	push   ebp
100089f1:	8b ec                	mov    ebp,esp
100089f3:	56                   	push   esi
100089f4:	8b f1                	mov    esi,ecx
100089f6:	8d 4e 1c             	lea    ecx,[esi+0x1c]
100089f9:	ff 15 d8 c1 00 10    	call   DWORD PTR ds:0x1000c1d8
100089ff:	8b ce                	mov    ecx,esi
10008a01:	ff 15 0c c3 00 10    	call   DWORD PTR ds:0x1000c30c
10008a07:	f6 45 08 01          	test   BYTE PTR [ebp+0x8],0x1
10008a0b:	74 0b                	je     0x10008a18
10008a0d:	6a 20                	push   0x20
10008a0f:	56                   	push   esi
10008a10:	e8 c3 00 00 00       	call   0x10008ad8
10008a15:	83 c4 08             	add    esp,0x8
10008a18:	8b c6                	mov    eax,esi
10008a1a:	5e                   	pop    esi
10008a1b:	5d                   	pop    ebp
10008a1c:	c2 04 00             	ret    0x4
10008a1f:	cc                   	int3

### PM_matrix_web.dll: WorkWidget +0xb4 factory 0x10002b70-0x10002c00

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/PM_matrix_web.dll:     file format pei-i386


Disassembly of section .text:

10002b70 <.text+0x1b70>:
10002b70:	55                   	push   ebp
10002b71:	8b ec                	mov    ebp,esp
10002b73:	6a ff                	push   0xffffffff
10002b75:	68 6f 70 00 10       	push   0x1000706f
10002b7a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10002b80:	50                   	push   eax
10002b81:	51                   	push   ecx
10002b82:	a1 34 f0 00 10       	mov    eax,ds:0x1000f034
10002b87:	33 c5                	xor    eax,ebp
10002b89:	50                   	push   eax
10002b8a:	8d 45 f4             	lea    eax,[ebp-0xc]
10002b8d:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10002b93:	6a 20                	push   0x20
10002b95:	e8 f1 2e 00 00       	call   0x10005a8b
10002b9a:	83 c4 04             	add    esp,0x4
10002b9d:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
10002ba0:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10002ba7:	85 c0                	test   eax,eax
10002ba9:	74 18                	je     0x10002bc3
10002bab:	6a 00                	push   0x0
10002bad:	8b c8                	mov    ecx,eax
10002baf:	e8 ac 00 00 00       	call   0x10002c60
10002bb4:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10002bb7:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10002bbe:	59                   	pop    ecx
10002bbf:	8b e5                	mov    esp,ebp
10002bc1:	5d                   	pop    ebp
10002bc2:	c3                   	ret
10002bc3:	33 c0                	xor    eax,eax
10002bc5:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10002bc8:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10002bcf:	59                   	pop    ecx
10002bd0:	8b e5                	mov    esp,ebp
10002bd2:	5d                   	pop    ebp
10002bd3:	c3                   	ret
10002bd4:	cc                   	int3
10002bd5:	cc                   	int3
10002bd6:	cc                   	int3
10002bd7:	cc                   	int3
10002bd8:	cc                   	int3
10002bd9:	cc                   	int3
10002bda:	cc                   	int3
10002bdb:	cc                   	int3
10002bdc:	cc                   	int3
10002bdd:	cc                   	int3
10002bde:	cc                   	int3
10002bdf:	cc                   	int3
10002be0:	8b 49 04             	mov    ecx,DWORD PTR [ecx+0x4]
10002be3:	83 79 18 00          	cmp    DWORD PTR [ecx+0x18],0x0
10002be7:	74 06                	je     0x10002bef
10002be9:	ff 25 24 81 00 10    	jmp    DWORD PTR ds:0x10008124
10002bef:	b8 00 f0 00 10       	mov    eax,0x1000f000
10002bf4:	c3                   	ret
10002bf5:	cc                   	int3
10002bf6:	cc                   	int3
10002bf7:	cc                   	int3
10002bf8:	cc                   	int3
10002bf9:	cc                   	int3
10002bfa:	cc                   	int3
10002bfb:	cc                   	int3
10002bfc:	cc                   	int3
10002bfd:	cc                   	int3
10002bfe:	cc                   	int3
10002bff:	cc                   	int3

### PM_matrix_web.dll: WorkWidget +0xcc wrapper 0x10002b50-0x10002b62

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/PM_matrix_web.dll:     file format pei-i386


Disassembly of section .text:

10002b50 <.text+0x1b50>:
10002b50:	55                   	push   ebp
10002b51:	8b ec                	mov    ebp,esp
10002b53:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10002b56:	e8 65 ff ff ff       	call   0x10002ac0
10002b5b:	83 c4 04             	add    esp,0x4
10002b5e:	5d                   	pop    ebp
10002b5f:	c2 04 00             	ret    0x4

### PM_matrix_web.dll: host context store helper 0x10002ac0-0x10002ad0

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/PM_matrix_web.dll:     file format pei-i386


Disassembly of section .text:

10002ac0 <.text+0x1ac0>:
10002ac0:	55                   	push   ebp
10002ac1:	8b ec                	mov    ebp,esp
10002ac3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10002ac6:	a3 10 f3 00 10       	mov    ds:0x1000f310,eax
10002acb:	5d                   	pop    ebp
10002acc:	c3                   	ret
10002acd:	cc                   	int3
10002ace:	cc                   	int3
10002acf:	cc                   	int3

### PM_matrix_web.dll: MenuWidget constructor 0x10002c60-0x10002cd0

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/PM_matrix_web.dll:     file format pei-i386


Disassembly of section .text:

10002c60 <.text+0x1c60>:
10002c60:	55                   	push   ebp
10002c61:	8b ec                	mov    ebp,esp
10002c63:	51                   	push   ecx
10002c64:	56                   	push   esi
10002c65:	6a 00                	push   0x0
10002c67:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10002c6a:	8b f1                	mov    esi,ecx
10002c6c:	89 75 fc             	mov    DWORD PTR [ebp-0x4],esi
10002c6f:	ff 15 a8 82 00 10    	call   DWORD PTR ds:0x100082a8
10002c75:	8d 4e 1c             	lea    ecx,[esi+0x1c]
10002c78:	c7 06 3c 8a 00 10    	mov    DWORD PTR [esi],0x10008a3c
10002c7e:	c7 46 08 f8 8a 00 10 	mov    DWORD PTR [esi+0x8],0x10008af8
10002c85:	ff 15 dc 80 00 10    	call   DWORD PTR ds:0x100080dc
10002c8b:	8b c6                	mov    eax,esi
10002c8d:	5e                   	pop    esi
10002c8e:	8b e5                	mov    esp,ebp
10002c90:	5d                   	pop    ebp
10002c91:	c2 04 00             	ret    0x4
10002c94:	83 e9 08             	sub    ecx,0x8
10002c97:	e9 04 00 00 00       	jmp    0x10002ca0
10002c9c:	cc                   	int3
10002c9d:	cc                   	int3
10002c9e:	cc                   	int3
10002c9f:	cc                   	int3
10002ca0:	55                   	push   ebp
10002ca1:	8b ec                	mov    ebp,esp
10002ca3:	56                   	push   esi
10002ca4:	8b f1                	mov    esi,ecx
10002ca6:	8d 4e 1c             	lea    ecx,[esi+0x1c]
10002ca9:	ff 15 e8 80 00 10    	call   DWORD PTR ds:0x100080e8
10002caf:	8b ce                	mov    ecx,esi
10002cb1:	ff 15 54 85 00 10    	call   DWORD PTR ds:0x10008554
10002cb7:	f6 45 08 01          	test   BYTE PTR [ebp+0x8],0x1
10002cbb:	74 0b                	je     0x10002cc8
10002cbd:	6a 20                	push   0x20
10002cbf:	56                   	push   esi
10002cc0:	e8 fe 2d 00 00       	call   0x10005ac3
10002cc5:	83 c4 08             	add    esp,0x8
10002cc8:	8b c6                	mov    eax,esi
10002cca:	5e                   	pop    esi
10002ccb:	5d                   	pop    ebp
10002ccc:	c2 04 00             	ret    0x4
10002ccf:	cc                   	int3

### Model_Visualiser.dll: WorkWidget +0xb4 factory 0x1000a240-0x1000a2b0

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/Model_Visualiser.dll:     file format pei-i386


Disassembly of section .text:

1000a240 <.text+0x9240>:
1000a240:	55                   	push   ebp
1000a241:	8b ec                	mov    ebp,esp
1000a243:	6a ff                	push   0xffffffff
1000a245:	68 df bf 00 10       	push   0x1000bfdf
1000a24a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000a250:	50                   	push   eax
1000a251:	51                   	push   ecx
1000a252:	a1 6c 50 01 10       	mov    eax,ds:0x1001506c
1000a257:	33 c5                	xor    eax,ebp
1000a259:	50                   	push   eax
1000a25a:	8d 45 f4             	lea    eax,[ebp-0xc]
1000a25d:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000a263:	6a 20                	push   0x20
1000a265:	e8 36 01 00 00       	call   0x1000a3a0
1000a26a:	83 c4 04             	add    esp,0x4
1000a26d:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
1000a270:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000a277:	85 c0                	test   eax,eax
1000a279:	74 18                	je     0x1000a293
1000a27b:	6a 00                	push   0x0
1000a27d:	8b c8                	mov    ecx,eax
1000a27f:	e8 2c 00 00 00       	call   0x1000a2b0
1000a284:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000a287:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000a28e:	59                   	pop    ecx
1000a28f:	8b e5                	mov    esp,ebp
1000a291:	5d                   	pop    ebp
1000a292:	c3                   	ret
1000a293:	33 c0                	xor    eax,eax
1000a295:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000a298:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000a29f:	59                   	pop    ecx
1000a2a0:	8b e5                	mov    esp,ebp
1000a2a2:	5d                   	pop    ebp
1000a2a3:	c3                   	ret
1000a2a4:	cc                   	int3
1000a2a5:	cc                   	int3
1000a2a6:	cc                   	int3
1000a2a7:	cc                   	int3
1000a2a8:	cc                   	int3
1000a2a9:	cc                   	int3
1000a2aa:	cc                   	int3
1000a2ab:	cc                   	int3
1000a2ac:	cc                   	int3
1000a2ad:	cc                   	int3
1000a2ae:	cc                   	int3
1000a2af:	cc                   	int3

### Model_Visualiser.dll: WorkWidget +0xcc wrapper 0x1000a220-0x1000a232

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/Model_Visualiser.dll:     file format pei-i386


Disassembly of section .text:

1000a220 <.text+0x9220>:
1000a220:	55                   	push   ebp
1000a221:	8b ec                	mov    ebp,esp
1000a223:	ff 75 08             	push   DWORD PTR [ebp+0x8]
1000a226:	e8 65 ff ff ff       	call   0x1000a190
1000a22b:	83 c4 04             	add    esp,0x4
1000a22e:	5d                   	pop    ebp
1000a22f:	c2 04 00             	ret    0x4

### Model_Visualiser.dll: host context store helper 0x1000a190-0x1000a1a0

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/Model_Visualiser.dll:     file format pei-i386


Disassembly of section .text:

1000a190 <.text+0x9190>:
1000a190:	55                   	push   ebp
1000a191:	8b ec                	mov    ebp,esp
1000a193:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000a196:	a3 d0 53 01 10       	mov    ds:0x100153d0,eax
1000a19b:	5d                   	pop    ebp
1000a19c:	c3                   	ret
1000a19d:	cc                   	int3
1000a19e:	cc                   	int3
1000a19f:	cc                   	int3

### Model_Visualiser.dll: MenuWidget constructor 0x1000a2b0-0x1000a320

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/Model_Visualiser.dll:     file format pei-i386


Disassembly of section .text:

1000a2b0 <.text+0x92b0>:
1000a2b0:	55                   	push   ebp
1000a2b1:	8b ec                	mov    ebp,esp
1000a2b3:	51                   	push   ecx
1000a2b4:	56                   	push   esi
1000a2b5:	6a 00                	push   0x0
1000a2b7:	ff 75 08             	push   DWORD PTR [ebp+0x8]
1000a2ba:	8b f1                	mov    esi,ecx
1000a2bc:	89 75 fc             	mov    DWORD PTR [ebp-0x4],esi
1000a2bf:	ff 15 58 d5 00 10    	call   DWORD PTR ds:0x1000d558
1000a2c5:	8d 4e 1c             	lea    ecx,[esi+0x1c]
1000a2c8:	c7 06 e0 e8 00 10    	mov    DWORD PTR [esi],0x1000e8e0
1000a2ce:	c7 46 08 9c e9 00 10 	mov    DWORD PTR [esi+0x8],0x1000e99c
1000a2d5:	ff 15 70 d1 00 10    	call   DWORD PTR ds:0x1000d170
1000a2db:	8b c6                	mov    eax,esi
1000a2dd:	5e                   	pop    esi
1000a2de:	8b e5                	mov    esp,ebp
1000a2e0:	5d                   	pop    ebp
1000a2e1:	c2 04 00             	ret    0x4
1000a2e4:	83 e9 08             	sub    ecx,0x8
1000a2e7:	e9 04 00 00 00       	jmp    0x1000a2f0
1000a2ec:	cc                   	int3
1000a2ed:	cc                   	int3
1000a2ee:	cc                   	int3
1000a2ef:	cc                   	int3
1000a2f0:	55                   	push   ebp
1000a2f1:	8b ec                	mov    ebp,esp
1000a2f3:	56                   	push   esi
1000a2f4:	8b f1                	mov    esi,ecx
1000a2f6:	8d 4e 1c             	lea    ecx,[esi+0x1c]
1000a2f9:	ff 15 68 d1 00 10    	call   DWORD PTR ds:0x1000d168
1000a2ff:	8b ce                	mov    ecx,esi
1000a301:	ff 15 54 d5 00 10    	call   DWORD PTR ds:0x1000d554
1000a307:	f6 45 08 01          	test   BYTE PTR [ebp+0x8],0x1
1000a30b:	74 0b                	je     0x1000a318
1000a30d:	6a 20                	push   0x20
1000a30f:	56                   	push   esi
1000a310:	e8 be 00 00 00       	call   0x1000a3d3
1000a315:	83 c4 08             	add    esp,0x8
1000a318:	8b c6                	mov    eax,esi
1000a31a:	5e                   	pop    esi
1000a31b:	5d                   	pop    ebp
1000a31c:	c2 04 00             	ret    0x4
1000a31f:	cc                   	int3
