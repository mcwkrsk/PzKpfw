## IS.exe: plugin widget registration, host context construction, and paired widgets
# Binary SHA256: ed526d51da184685dab5ddd89eae0e486b37001ed5781e623cb25f9166410dc2


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

## IS.exe: base WorkWidget menu factory and WorkWidget/MenuWidget reciprocal pointer setup

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/IS.exe:     file format pei-i386


Disassembly of section .text:

00413d60 <.text+0x12d60>:
  413d60:	55                   	push   ebp
  413d61:	8b ec                	mov    ebp,esp
  413d63:	6a ff                	push   0xffffffff
  413d65:	68 af 86 41 00       	push   0x4186af
  413d6a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  413d70:	50                   	push   eax
  413d71:	51                   	push   ecx
  413d72:	a1 cc 90 46 00       	mov    eax,ds:0x4690cc
  413d77:	33 c5                	xor    eax,ebp
  413d79:	50                   	push   eax
  413d7a:	8d 45 f4             	lea    eax,[ebp-0xc]
  413d7d:	64 a3 00 00 00 00    	mov    fs:0x0,eax
  413d83:	6a 20                	push   0x20
  413d85:	e8 ff 09 00 00       	call   0x414789
  413d8a:	83 c4 04             	add    esp,0x4
  413d8d:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
  413d90:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
  413d97:	85 c0                	test   eax,eax
  413d99:	74 18                	je     0x413db3
  413d9b:	6a 00                	push   0x0
  413d9d:	8b c8                	mov    ecx,eax
  413d9f:	e8 ac f6 ff ff       	call   0x413450
  413da4:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
  413da7:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  413dae:	59                   	pop    ecx
  413daf:	8b e5                	mov    esp,ebp
  413db1:	5d                   	pop    ebp
  413db2:	c3                   	ret
  413db3:	33 c0                	xor    eax,eax
  413db5:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
  413db8:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  413dbf:	59                   	pop    ecx
  413dc0:	8b e5                	mov    esp,ebp
  413dc2:	5d                   	pop    ebp
  413dc3:	c3                   	ret
  413dc4:	cc                   	int3
  413dc5:	cc                   	int3
  413dc6:	cc                   	int3
  413dc7:	cc                   	int3
  413dc8:	cc                   	int3
  413dc9:	cc                   	int3
  413dca:	cc                   	int3
  413dcb:	cc                   	int3
  413dcc:	cc                   	int3
  413dcd:	cc                   	int3
  413dce:	cc                   	int3
  413dcf:	cc                   	int3
  413dd0:	55                   	push   ebp
  413dd1:	8b ec                	mov    ebp,esp
  413dd3:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  413dd6:	89 51 20             	mov    DWORD PTR [ecx+0x20],edx
  413dd9:	8b 02                	mov    eax,DWORD PTR [edx]
  413ddb:	89 4a 18             	mov    DWORD PTR [edx+0x18],ecx
  413dde:	8b ca                	mov    ecx,edx
  413de0:	ff 90 b4 00 00 00    	call   DWORD PTR [eax+0xb4]
  413de6:	5d                   	pop    ebp
  413de7:	c2                   	.byte 0xc2

## IS.exe: PluginHostContext allocation / QColor subobject construction

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/IS.exe:     file format pei-i386


Disassembly of section .text:

004050f0 <.text+0x40f0>:
  4050f0:	56                   	push   esi
  4050f1:	6a 14                	push   0x14
  4050f3:	e8 91 f6 00 00       	call   0x414789
  4050f8:	8b f0                	mov    esi,eax
  4050fa:	83 c4 04             	add    esp,0x4
  4050fd:	85 f6                	test   esi,esi
  4050ff:	74 11                	je     0x405112
  405101:	8d 4e 04             	lea    ecx,[esi+0x4]
  405104:	ff 15 2c 94 41 00    	call   DWORD PTR ds:0x41942c
  40510a:	89 35 ac 96 46 00    	mov    DWORD PTR ds:0x4696ac,esi
  405110:	5e                   	pop    esi
  405111:	c3                   	ret
  405112:	c7 05 ac 96 46 00 00 	mov    DWORD PTR ds:0x4696ac,0x0
  405119:	00 00 00 
  40511c:	5e                   	pop    esi
  40511d:	c3                   	ret
  40511e:	cc                   	int3
  40511f:	cc                   	int3

## IS.exe: PrimaryModel and ConceptModel wrappers installed in app-state context

/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/IS.exe:     file format pei-i386


Disassembly of section .text:

00408ef0 <.text+0x7ef0>:
  408ef0:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  408ef6:	a1 ac 96 46 00       	mov    eax,ds:0x4696ac
  408efb:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  408f01:	6a 0c                	push   0xc
  408f03:	89 08                	mov    DWORD PTR [eax],ecx
  408f05:	e8 7f b8 00 00       	call   0x414789
  408f0a:	8b f0                	mov    esi,eax
  408f0c:	83 c4 04             	add    esp,0x4
  408f0f:	89 75 88             	mov    DWORD PTR [ebp-0x78],esi
  408f12:	c6 45 fc 13          	mov    BYTE PTR [ebp-0x4],0x13
  408f16:	85 f6                	test   esi,esi
  408f18:	74 10                	je     0x408f2a
  408f1a:	8b ce                	mov    ecx,esi
  408f1c:	ff 15 08 91 41 00    	call   DWORD PTR ds:0x419108
  408f22:	c7 06 78 79 45 00    	mov    DWORD PTR [esi],0x457978
  408f28:	eb 02                	jmp    0x408f2c
  408f2a:	33 f6                	xor    esi,esi
  408f2c:	a1 a4 96 46 00       	mov    eax,ds:0x4696a4
  408f31:	8b 1d a8 93 41 00    	mov    ebx,DWORD PTR ds:0x4193a8
  408f37:	6a 06                	push   0x6
  408f39:	68 24 7a 45 00       	push   0x457a24
  408f3e:	c6 45 fc 0a          	mov    BYTE PTR [ebp-0x4],0xa
  408f42:	89 70 08             	mov    DWORD PTR [eax+0x8],esi
  408f45:	ff d3                	call   ebx
  408f47:	83 c4 08             	add    esp,0x8
  408f4a:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
  408f4d:	8d 45 dc             	lea    eax,[ebp-0x24]
  408f50:	c6 45 fc 14          	mov    BYTE PTR [ebp-0x4],0x14
  408f54:	50                   	push   eax
  408f55:	8d 45 d4             	lea    eax,[ebp-0x2c]
  408f58:	50                   	push   eax
  408f59:	8d 4d f0             	lea    ecx,[ebp-0x10]
  408f5c:	ff d7                	call   edi
  408f5e:	8d 4d dc             	lea    ecx,[ebp-0x24]
  408f61:	c6 45 fc 16          	mov    BYTE PTR [ebp-0x4],0x16
  408f65:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  408f6b:	6a 0c                	push   0xc
  408f6d:	68 54 7a 45 00       	push   0x457a54
  408f72:	ff d3                	call   ebx
  408f74:	83 c4 08             	add    esp,0x8
  408f77:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
  408f7a:	8d 45 d8             	lea    eax,[ebp-0x28]
  408f7d:	c6 45 fc 17          	mov    BYTE PTR [ebp-0x4],0x17
  408f81:	50                   	push   eax
  408f82:	8d 45 a8             	lea    eax,[ebp-0x58]
  408f85:	50                   	push   eax
  408f86:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  408f89:	ff d7                	call   edi
  408f8b:	8d 4d d8             	lea    ecx,[ebp-0x28]
  408f8e:	c6 45 fc 19          	mov    BYTE PTR [ebp-0x4],0x19
  408f92:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  408f98:	8d 45 a8             	lea    eax,[ebp-0x58]
  408f9b:	50                   	push   eax
  408f9c:	8d 45 e8             	lea    eax,[ebp-0x18]
  408f9f:	50                   	push   eax
  408fa0:	e8 1b e2 ff ff       	call   0x4071c0
  408fa5:	6a 08                	push   0x8
  408fa7:	e8 dd b7 00 00       	call   0x414789
  408fac:	8b f0                	mov    esi,eax
  408fae:	83 c4 0c             	add    esp,0xc
  408fb1:	89 75 88             	mov    DWORD PTR [ebp-0x78],esi
  408fb4:	c6 45 fc 1a          	mov    BYTE PTR [ebp-0x4],0x1a
  408fb8:	85 f6                	test   esi,esi
  408fba:	74 10                	je     0x408fcc
  408fbc:	8b ce                	mov    ecx,esi
  408fbe:	ff 15 70 91 41 00    	call   DWORD PTR ds:0x419170
  408fc4:	c7 06 80 79 45 00    	mov    DWORD PTR [esi],0x457980
  408fca:	eb 02                	jmp    0x408fce
  408fcc:	33 f6                	xor    esi,esi
  408fce:	a1 a4 96 46 00       	mov    eax,ds:0x4696a4
  408fd3:	6a 0c                	push   0xc
  408fd5:	68 64 7a 45 00       	push   0x457a64
  408fda:	c6 45 fc 19          	mov    BYTE PTR [ebp-0x4],0x19
  408fde:	89 70 0c             	mov    DWORD PTR [eax+0xc],esi
  408fe1:	ff d3                	call   ebx
  408fe3:	83 c4 08             	add    esp,0x8
  408fe6:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
  408fe9:	8d 45 dc             	lea    eax,[ebp-0x24]
  408fec:	c6 45 fc 1b          	mov    BYTE PTR [ebp-0x4],0x1b
  408ff0:	50                   	push   eax
  408ff1:	8d 45 ac             	lea    eax,[ebp-0x54]
  408ff4:	50                   	push   eax
  408ff5:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  408ff8:	ff d7                	call   edi
  408ffa:	8d 4d dc             	lea    ecx,[ebp-0x24]
  408ffd:	c6 45 fc 1d          	mov    BYTE PTR [ebp-0x4],0x1d
  409001:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  409007:	8d 45 ac             	lea    eax,[ebp-0x54]
  40900a:	50                   	push   eax
  40900b:	8d 45 e8             	lea    eax,[ebp-0x18]
  40900e:	50                   	push   eax
  40900f:	e8 bc d6 ff ff       	call   0x4066d0
  409014:	6a 0c                	push   0xc
  409016:	68 2c 7a 45 00       	push   0x457a2c
  40901b:	ff d3                	call   ebx
  40901d:	83 c4 10             	add    esp,0x10
