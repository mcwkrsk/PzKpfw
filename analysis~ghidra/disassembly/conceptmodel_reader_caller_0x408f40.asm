
../original/is.exe:     file format pei-i386


disassembly of section .text:

00408f40 <.text+0x7f40>:
  408f40:	fc                   	cld
  408f41:	0a 89 70 08 ff d3    	or     cl,byte ptr [ecx-0x2c00f790]
  408f47:	83 c4 08             	add    esp,0x8
  408f4a:	89 45 dc             	mov    dword ptr [ebp-0x24],eax
  408f4d:	8d 45 dc             	lea    eax,[ebp-0x24]
  408f50:	c6 45 fc 14          	mov    byte ptr [ebp-0x4],0x14
  408f54:	50                   	push   eax
  408f55:	8d 45 d4             	lea    eax,[ebp-0x2c]
  408f58:	50                   	push   eax
  408f59:	8d 4d f0             	lea    ecx,[ebp-0x10]
  408f5c:	ff d7                	call   edi
  408f5e:	8d 4d dc             	lea    ecx,[ebp-0x24]
  408f61:	c6 45 fc 16          	mov    byte ptr [ebp-0x4],0x16
  408f65:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  408f6b:	6a 0c                	push   0xc
  408f6d:	68 54 7a 45 00       	push   0x457a54
  408f72:	ff d3                	call   ebx
  408f74:	83 c4 08             	add    esp,0x8
  408f77:	89 45 d8             	mov    dword ptr [ebp-0x28],eax
  408f7a:	8d 45 d8             	lea    eax,[ebp-0x28]
  408f7d:	c6 45 fc 17          	mov    byte ptr [ebp-0x4],0x17
  408f81:	50                   	push   eax
  408f82:	8d 45 a8             	lea    eax,[ebp-0x58]
  408f85:	50                   	push   eax
  408f86:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  408f89:	ff d7                	call   edi
  408f8b:	8d 4d d8             	lea    ecx,[ebp-0x28]
  408f8e:	c6 45 fc 19          	mov    byte ptr [ebp-0x4],0x19
  408f92:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  408f98:	8d 45 a8             	lea    eax,[ebp-0x58]
  408f9b:	50                   	push   eax
  408f9c:	8d 45 e8             	lea    eax,[ebp-0x18]
  408f9f:	50                   	push   eax
  408fa0:	e8 1b e2 ff ff       	call   0x4071c0
  408fa5:	6a 08                	push   0x8
  408fa7:	e8 dd b7 00 00       	call   0x414789
  408fac:	8b f0                	mov    esi,eax
  408fae:	83 c4 0c             	add    esp,0xc
  408fb1:	89 75 88             	mov    dword ptr [ebp-0x78],esi
  408fb4:	c6 45 fc 1a          	mov    byte ptr [ebp-0x4],0x1a
  408fb8:	85 f6                	test   esi,esi
  408fba:	74 10                	je     0x408fcc
  408fbc:	8b ce                	mov    ecx,esi
  408fbe:	ff 15 70 91 41 00    	call   dword ptr ds:0x419170
  408fc4:	c7 06 80 79 45 00    	mov    dword ptr [esi],0x457980
  408fca:	eb 02                	jmp    0x408fce
  408fcc:	33 f6                	xor    esi,esi
  408fce:	a1 a4 96 46 00       	mov    eax,ds:0x4696a4
  408fd3:	6a 0c                	push   0xc
  408fd5:	68 64 7a 45 00       	push   0x457a64
  408fda:	c6 45 fc 19          	mov    byte ptr [ebp-0x4],0x19
  408fde:	89 70 0c             	mov    dword ptr [eax+0xc],esi
  408fe1:	ff d3                	call   ebx
  408fe3:	83 c4 08             	add    esp,0x8
  408fe6:	89 45 dc             	mov    dword ptr [ebp-0x24],eax
  408fe9:	8d 45 dc             	lea    eax,[ebp-0x24]
  408fec:	c6 45 fc 1b          	mov    byte ptr [ebp-0x4],0x1b
  408ff0:	50                   	push   eax
  408ff1:	8d 45 ac             	lea    eax,[ebp-0x54]
  408ff4:	50                   	push   eax
  408ff5:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  408ff8:	ff d7                	call   edi
  408ffa:	8d 4d dc             	lea    ecx,[ebp-0x24]
  408ffd:	c6 45 fc 1d          	mov    byte ptr [ebp-0x4],0x1d
  409001:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  409007:	8d 45 ac             	lea    eax,[ebp-0x54]
  40900a:	50                   	push   eax
  40900b:	8d 45 e8             	lea    eax,[ebp-0x18]
  40900e:	50                   	push   eax
  40900f:	e8 bc d6 ff ff       	call   0x4066d0
  409014:	6a 0c                	push   0xc
  409016:	68 2c 7a 45 00       	push   0x457a2c
  40901b:	ff d3                	call   ebx
  40901d:	83 c4 10             	add    esp,0x10
  409020:	89 45 d8             	mov    dword ptr [ebp-0x28],eax
  409023:	8d 45 d8             	lea    eax,[ebp-0x28]
  409026:	c6 45 fc 1e          	mov    byte ptr [ebp-0x4],0x1e
  40902a:	50                   	push   eax
  40902b:	8d 45 b0             	lea    eax,[ebp-0x50]
  40902e:	50                   	push   eax
  40902f:	8d 4d f0             	lea    ecx,[ebp-0x10]
  409032:	ff d7                	call   edi
  409034:	8d 4d d8             	lea    ecx,[ebp-0x28]
  409037:	c6 45 fc 20          	mov    byte ptr [ebp-0x4],0x20
  40903b:	ff                   	.byte 0xff
  40903c:	15                   	.byte 0x15
  40903d:	d0                   	.byte 0xd0
  40903e:	93                   	xchg   ebx,eax
  40903f:	41                   	inc    ecx
