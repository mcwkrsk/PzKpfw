===== ConceptStructure::codeStructure 0x1000FC10..0x10010359 =====

/mnt/data/IS2_original_binaries/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

1000fc10 <.text+0xec10>:
1000fc10:	55                   	push   ebp
1000fc11:	8b ec                	mov    ebp,esp
1000fc13:	6a ff                	push   0xffffffff
1000fc15:	68 f0 68 01 10       	push   0x100168f0
1000fc1a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000fc20:	50                   	push   eax
1000fc21:	83 ec 68             	sub    esp,0x68
1000fc24:	53                   	push   ebx
1000fc25:	56                   	push   esi
1000fc26:	57                   	push   edi
1000fc27:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000fc2c:	33 c5                	xor    eax,ebp
1000fc2e:	50                   	push   eax
1000fc2f:	8d 45 f4             	lea    eax,[ebp-0xc]
1000fc32:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000fc38:	8b d9                	mov    ebx,ecx
1000fc3a:	89 5d dc             	mov    DWORD PTR [ebp-0x24],ebx
1000fc3d:	8d 4d c4             	lea    ecx,[ebp-0x3c]
1000fc40:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [ebp-0x3c],0x0
1000fc47:	c7 45 c8 00 00 00 00 	mov    DWORD PTR [ebp-0x38],0x0
1000fc4e:	e8 9d df ff ff       	call   0x1000dbf0
1000fc53:	89 45 c4             	mov    DWORD PTR [ebp-0x3c],eax
1000fc56:	8d 4d bc             	lea    ecx,[ebp-0x44]
1000fc59:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000fc60:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [ebp-0x44],0x0
1000fc67:	c7 45 c0 00 00 00 00 	mov    DWORD PTR [ebp-0x40],0x0
1000fc6e:	e8 7d df ff ff       	call   0x1000dbf0
1000fc73:	89 45 bc             	mov    DWORD PTR [ebp-0x44],eax
1000fc76:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
1000fc79:	c6 45 fc 01          	mov    BYTE PTR [ebp-0x4],0x1
1000fc7d:	8b 70 14             	mov    esi,DWORD PTR [eax+0x14]
1000fc80:	3b 70 18             	cmp    esi,DWORD PTR [eax+0x18]
1000fc83:	73 56                	jae    0x1000fcdb
1000fc85:	8b 3e                	mov    edi,DWORD PTR [esi]
1000fc87:	8b cf                	mov    ecx,edi
1000fc89:	89 7d d4             	mov    DWORD PTR [ebp-0x2c],edi
1000fc8c:	e8 cf d6 ff ff       	call   0x1000d360
1000fc91:	85 c0                	test   eax,eax
1000fc93:	75 3b                	jne    0x1000fcd0
1000fc95:	8b cf                	mov    ecx,edi
1000fc97:	e8 c4 19 00 00       	call   0x10011660
1000fc9c:	8b cf                	mov    ecx,edi
1000fc9e:	8b d8                	mov    ebx,eax
1000fca0:	e8 db 32 00 00       	call   0x10012f80
1000fca5:	8b 4d d4             	mov    ecx,DWORD PTR [ebp-0x2c]
1000fca8:	8b f8                	mov    edi,eax
1000fcaa:	e8 91 17 00 00       	call   0x10011440
1000fcaf:	ff 75 cc             	push   DWORD PTR [ebp-0x34]
1000fcb2:	89 45 94             	mov    DWORD PTR [ebp-0x6c],eax
1000fcb5:	8d 4d bc             	lea    ecx,[ebp-0x44]
1000fcb8:	8d 45 8c             	lea    eax,[ebp-0x74]
1000fcbb:	89 5d 8c             	mov    DWORD PTR [ebp-0x74],ebx
1000fcbe:	50                   	push   eax
1000fcbf:	6a 00                	push   0x0
1000fcc1:	8d 45 9c             	lea    eax,[ebp-0x64]
1000fcc4:	89 7d 90             	mov    DWORD PTR [ebp-0x70],edi
1000fcc7:	50                   	push   eax
1000fcc8:	e8 f3 f4 ff ff       	call   0x1000f1c0
1000fccd:	8b 5d dc             	mov    ebx,DWORD PTR [ebp-0x24]
1000fcd0:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
1000fcd3:	83 c6 04             	add    esi,0x4
1000fcd6:	3b 70 18             	cmp    esi,DWORD PTR [eax+0x18]
1000fcd9:	72 aa                	jb     0x1000fc85
1000fcdb:	6a 00                	push   0x0
1000fcdd:	6a 00                	push   0x0
1000fcdf:	8d 4d b4             	lea    ecx,[ebp-0x4c]
1000fce2:	c7 45 b4 00 00 00 00 	mov    DWORD PTR [ebp-0x4c],0x0
1000fce9:	c7 45 b8 00 00 00 00 	mov    DWORD PTR [ebp-0x48],0x0
1000fcf0:	e8 bb fb ff ff       	call   0x1000f8b0
1000fcf5:	8b f0                	mov    esi,eax
1000fcf7:	89 75 e8             	mov    DWORD PTR [ebp-0x18],esi
1000fcfa:	89 75 b4             	mov    DWORD PTR [ebp-0x4c],esi
1000fcfd:	8b 4b 04             	mov    ecx,DWORD PTR [ebx+0x4]
1000fd00:	c6 45 fc 02          	mov    BYTE PTR [ebp-0x4],0x2
1000fd04:	8b 79 14             	mov    edi,DWORD PTR [ecx+0x14]
1000fd07:	89 7d d4             	mov    DWORD PTR [ebp-0x2c],edi
1000fd0a:	3b 79 18             	cmp    edi,DWORD PTR [ecx+0x18]
1000fd0d:	0f 83 93 02 00 00    	jae    0x1000ffa6
1000fd13:	8b 1f                	mov    ebx,DWORD PTR [edi]
1000fd15:	8b cb                	mov    ecx,ebx
1000fd17:	89 5d e4             	mov    DWORD PTR [ebp-0x1c],ebx
1000fd1a:	e8 21 17 00 00       	call   0x10011440
1000fd1f:	83 f8 05             	cmp    eax,0x5
1000fd22:	75 3f                	jne    0x1000fd63
1000fd24:	8d 45 e4             	lea    eax,[ebp-0x1c]
1000fd27:	50                   	push   eax
1000fd28:	ff 76 04             	push   DWORD PTR [esi+0x4]
1000fd2b:	8d 4d b4             	lea    ecx,[ebp-0x4c]
1000fd2e:	56                   	push   esi
1000fd2f:	e8 6c ec ff ff       	call   0x1000e9a0
1000fd34:	8b 55 b8             	mov    edx,DWORD PTR [ebp-0x48]
1000fd37:	b9 54 55 55 15       	mov    ecx,0x15555554
1000fd3c:	2b ca                	sub    ecx,edx
1000fd3e:	8b f0                	mov    esi,eax
1000fd40:	83 f9 01             	cmp    ecx,0x1
1000fd43:	0f 82 ef 02 00 00    	jb     0x10010038
1000fd49:	8b 5d e8             	mov    ebx,DWORD PTR [ebp-0x18]
1000fd4c:	42                   	inc    edx
1000fd4d:	89 55 b8             	mov    DWORD PTR [ebp-0x48],edx
1000fd50:	89 73 04             	mov    DWORD PTR [ebx+0x4],esi
1000fd53:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
1000fd56:	89 30                	mov    DWORD PTR [eax],esi
1000fd58:	8b 75 b4             	mov    esi,DWORD PTR [ebp-0x4c]
1000fd5b:	89 75 e8             	mov    DWORD PTR [ebp-0x18],esi
1000fd5e:	e9 2e 02 00 00       	jmp    0x1000ff91
1000fd63:	8b cb                	mov    ecx,ebx
1000fd65:	e8 d6 16 00 00       	call   0x10011440
1000fd6a:	83 f8 04             	cmp    eax,0x4
1000fd6d:	75 3f                	jne    0x1000fdae
1000fd6f:	8b cb                	mov    ecx,ebx
1000fd71:	e8 fa 18 00 00       	call   0x10011670
1000fd76:	85 c0                	test   eax,eax
1000fd78:	74 34                	je     0x1000fdae
1000fd7a:	8b cb                	mov    ecx,ebx
1000fd7c:	e8 ef 18 00 00       	call   0x10011670
1000fd81:	8b c8                	mov    ecx,eax
1000fd83:	e8 e8 18 00 00       	call   0x10011670
1000fd88:	85 c0                	test   eax,eax
1000fd8a:	74 22                	je     0x1000fdae
1000fd8c:	8b cb                	mov    ecx,ebx
1000fd8e:	e8 dd 18 00 00       	call   0x10011670
1000fd93:	8b c8                	mov    ecx,eax
1000fd95:	e8 d6 18 00 00       	call   0x10011670
1000fd9a:	8b c8                	mov    ecx,eax
1000fd9c:	e8 df 31 00 00       	call   0x10012f80
1000fda1:	50                   	push   eax
1000fda2:	8b cb                	mov    ecx,ebx
1000fda4:	e8 17 32 00 00       	call   0x10012fc0
1000fda9:	e9 e3 01 00 00       	jmp    0x1000ff91
1000fdae:	8b cb                	mov    ecx,ebx
1000fdb0:	e8 cb 31 00 00       	call   0x10012f80
1000fdb5:	83 f8 ff             	cmp    eax,0xffffffff
1000fdb8:	0f 84 d3 01 00 00    	je     0x1000ff91
1000fdbe:	8b cb                	mov    ecx,ebx
1000fdc0:	e8 9b d5 ff ff       	call   0x1000d360
1000fdc5:	85 c0                	test   eax,eax
1000fdc7:	0f 84 c4 01 00 00    	je     0x1000ff91
1000fdcd:	8b cb                	mov    ecx,ebx
1000fdcf:	e8 ac 31 00 00       	call   0x10012f80
1000fdd4:	8b f0                	mov    esi,eax
1000fdd6:	8b cb                	mov    ecx,ebx
1000fdd8:	89 75 e4             	mov    DWORD PTR [ebp-0x1c],esi
1000fddb:	e8 60 16 00 00       	call   0x10011440
1000fde0:	8b d0                	mov    edx,eax
1000fde2:	89 75 b0             	mov    DWORD PTR [ebp-0x50],esi
1000fde5:	8b 45 c4             	mov    eax,DWORD PTR [ebp-0x3c]
1000fde8:	8b f0                	mov    esi,eax
1000fdea:	89 55 ac             	mov    DWORD PTR [ebp-0x54],edx
1000fded:	8b 48 04             	mov    ecx,DWORD PTR [eax+0x4]
1000fdf0:	80 79 0d 00          	cmp    BYTE PTR [ecx+0xd],0x0
1000fdf4:	75 46                	jne    0x1000fe3c
1000fdf6:	8b 7d e4             	mov    edi,DWORD PTR [ebp-0x1c]
1000fdf9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [eax+0x0]
1000fe00:	8b 41 10             	mov    eax,DWORD PTR [ecx+0x10]
1000fe03:	3b c2                	cmp    eax,edx
1000fe05:	75 03                	jne    0x1000fe0a
1000fe07:	39 79 14             	cmp    DWORD PTR [ecx+0x14],edi
1000fe0a:	0f 9c c0             	setl   al
1000fe0d:	84 c0                	test   al,al
1000fe0f:	74 05                	je     0x1000fe16
1000fe11:	8b 49 08             	mov    ecx,DWORD PTR [ecx+0x8]
1000fe14:	eb 04                	jmp    0x1000fe1a
1000fe16:	8b f1                	mov    esi,ecx
1000fe18:	8b 09                	mov    ecx,DWORD PTR [ecx]
1000fe1a:	80 79 0d 00          	cmp    BYTE PTR [ecx+0xd],0x0
1000fe1e:	74 e0                	je     0x1000fe00
1000fe20:	8b 7d d4             	mov    edi,DWORD PTR [ebp-0x2c]
1000fe23:	3b 75 c4             	cmp    esi,DWORD PTR [ebp-0x3c]
1000fe26:	74 14                	je     0x1000fe3c
1000fe28:	8b 46 10             	mov    eax,DWORD PTR [esi+0x10]
1000fe2b:	8b 4e 14             	mov    ecx,DWORD PTR [esi+0x14]
1000fe2e:	3b d0                	cmp    edx,eax
1000fe30:	75 03                	jne    0x1000fe35
1000fe32:	39 4d e4             	cmp    DWORD PTR [ebp-0x1c],ecx
1000fe35:	0f 9c c0             	setl   al
1000fe38:	84 c0                	test   al,al
1000fe3a:	74 30                	je     0x1000fe6c
1000fe3c:	8d 45 ac             	lea    eax,[ebp-0x54]
1000fe3f:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
1000fe42:	8d 4d c4             	lea    ecx,[ebp-0x3c]
1000fe45:	8d 45 f0             	lea    eax,[ebp-0x10]
1000fe48:	50                   	push   eax
1000fe49:	8d 45 e4             	lea    eax,[ebp-0x1c]
1000fe4c:	50                   	push   eax
1000fe4d:	68 a4 73 01 10       	push   0x100173a4
1000fe52:	e8 69 eb ff ff       	call   0x1000e9c0
1000fe57:	50                   	push   eax
1000fe58:	83 c0 10             	add    eax,0x10
1000fe5b:	8d 4d c4             	lea    ecx,[ebp-0x3c]
1000fe5e:	50                   	push   eax
1000fe5f:	56                   	push   esi
1000fe60:	8d 45 d0             	lea    eax,[ebp-0x30]
1000fe63:	50                   	push   eax
1000fe64:	e8 97 ef ff ff       	call   0x1000ee00
1000fe69:	8b 75 d0             	mov    esi,DWORD PTR [ebp-0x30]
1000fe6c:	8b 46 18             	mov    eax,DWORD PTR [esi+0x18]
1000fe6f:	8b cb                	mov    ecx,ebx
1000fe71:	40                   	inc    eax
1000fe72:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
1000fe75:	e8 06 31 00 00       	call   0x10012f80
1000fe7a:	8b cb                	mov    ecx,ebx
1000fe7c:	8b f0                	mov    esi,eax
1000fe7e:	e8 bd 15 00 00       	call   0x10011440
1000fe83:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
1000fe86:	8b 4d e4             	mov    ecx,DWORD PTR [ebp-0x1c]
1000fe89:	89 45 a0             	mov    DWORD PTR [ebp-0x60],eax
1000fe8c:	8d 45 98             	lea    eax,[ebp-0x68]
1000fe8f:	50                   	push   eax
1000fe90:	89 75 9c             	mov    DWORD PTR [ebp-0x64],esi
1000fe93:	8d 45 d8             	lea    eax,[ebp-0x28]
1000fe96:	8b 75 bc             	mov    esi,DWORD PTR [ebp-0x44]
1000fe99:	56                   	push   esi
1000fe9a:	89 4d 98             	mov    DWORD PTR [ebp-0x68],ecx
1000fe9d:	ff 36                	push   DWORD PTR [esi]
1000fe9f:	50                   	push   eax
1000fea0:	e8 9b eb ff ff       	call   0x1000ea40
1000fea5:	83 c4 14             	add    esp,0x14
1000fea8:	39 75 d8             	cmp    DWORD PTR [ebp-0x28],esi
1000feab:	74 41                	je     0x1000feee
1000fead:	8b 7d e4             	mov    edi,DWORD PTR [ebp-0x1c]
1000feb0:	8b cb                	mov    ecx,ebx
1000feb2:	47                   	inc    edi
1000feb3:	e8 c8 30 00 00       	call   0x10012f80
1000feb8:	8b cb                	mov    ecx,ebx
1000feba:	8b f0                	mov    esi,eax
1000febc:	e8 7f 15 00 00       	call   0x10011440
1000fec1:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
1000fec4:	89 45 a0             	mov    DWORD PTR [ebp-0x60],eax
1000fec7:	8d 45 98             	lea    eax,[ebp-0x68]
1000feca:	50                   	push   eax
1000fecb:	89 75 9c             	mov    DWORD PTR [ebp-0x64],esi
1000fece:	8d 45 d8             	lea    eax,[ebp-0x28]
1000fed1:	8b 75 bc             	mov    esi,DWORD PTR [ebp-0x44]
1000fed4:	56                   	push   esi
1000fed5:	89 7d 98             	mov    DWORD PTR [ebp-0x68],edi
1000fed8:	ff 36                	push   DWORD PTR [esi]
1000feda:	50                   	push   eax
1000fedb:	e8 60 eb ff ff       	call   0x1000ea40
1000fee0:	83 c4 14             	add    esp,0x14
1000fee3:	39 75 d8             	cmp    DWORD PTR [ebp-0x28],esi
1000fee6:	75 c8                	jne    0x1000feb0
1000fee8:	89 7d e4             	mov    DWORD PTR [ebp-0x1c],edi
1000feeb:	8b 7d d4             	mov    edi,DWORD PTR [ebp-0x2c]
1000feee:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
1000fef1:	8b cb                	mov    ecx,ebx
1000fef3:	e8 b8 18 00 00       	call   0x100117b0
1000fef8:	8b cb                	mov    ecx,ebx
1000fefa:	e8 81 30 00 00       	call   0x10012f80
1000feff:	8b cb                	mov    ecx,ebx
1000ff01:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
1000ff04:	e8 37 15 00 00       	call   0x10011440
1000ff09:	8b 5d d4             	mov    ebx,DWORD PTR [ebp-0x2c]
1000ff0c:	8b d0                	mov    edx,eax
1000ff0e:	8b 45 c4             	mov    eax,DWORD PTR [ebp-0x3c]
1000ff11:	8b f0                	mov    esi,eax
1000ff13:	89 55 a4             	mov    DWORD PTR [ebp-0x5c],edx
1000ff16:	89 5d a8             	mov    DWORD PTR [ebp-0x58],ebx
1000ff19:	8b 48 04             	mov    ecx,DWORD PTR [eax+0x4]
1000ff1c:	80 79 0d 00          	cmp    BYTE PTR [ecx+0xd],0x0
1000ff20:	75 36                	jne    0x1000ff58
1000ff22:	8b 41 10             	mov    eax,DWORD PTR [ecx+0x10]
1000ff25:	3b c2                	cmp    eax,edx
1000ff27:	75 03                	jne    0x1000ff2c
1000ff29:	39 59 14             	cmp    DWORD PTR [ecx+0x14],ebx
1000ff2c:	0f 9c c0             	setl   al
1000ff2f:	84 c0                	test   al,al
1000ff31:	74 05                	je     0x1000ff38
1000ff33:	8b 49 08             	mov    ecx,DWORD PTR [ecx+0x8]
1000ff36:	eb 04                	jmp    0x1000ff3c
1000ff38:	8b f1                	mov    esi,ecx
1000ff3a:	8b 09                	mov    ecx,DWORD PTR [ecx]
1000ff3c:	80 79 0d 00          	cmp    BYTE PTR [ecx+0xd],0x0
1000ff40:	74 e0                	je     0x1000ff22
1000ff42:	3b 75 c4             	cmp    esi,DWORD PTR [ebp-0x3c]
1000ff45:	74 11                	je     0x1000ff58
1000ff47:	8b 46 10             	mov    eax,DWORD PTR [esi+0x10]
1000ff4a:	3b d0                	cmp    edx,eax
1000ff4c:	75 03                	jne    0x1000ff51
1000ff4e:	3b 5e 14             	cmp    ebx,DWORD PTR [esi+0x14]
1000ff51:	0f 9c c0             	setl   al
1000ff54:	84 c0                	test   al,al
1000ff56:	74 30                	je     0x1000ff88
1000ff58:	8d 45 a4             	lea    eax,[ebp-0x5c]
1000ff5b:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
1000ff5e:	8d 4d c4             	lea    ecx,[ebp-0x3c]
1000ff61:	8d 45 ef             	lea    eax,[ebp-0x11]
1000ff64:	50                   	push   eax
1000ff65:	8d 45 d4             	lea    eax,[ebp-0x2c]
1000ff68:	50                   	push   eax
1000ff69:	68 a4 73 01 10       	push   0x100173a4
1000ff6e:	e8 4d ea ff ff       	call   0x1000e9c0
1000ff73:	50                   	push   eax
1000ff74:	83 c0 10             	add    eax,0x10
1000ff77:	8d 4d c4             	lea    ecx,[ebp-0x3c]
1000ff7a:	50                   	push   eax
1000ff7b:	56                   	push   esi
1000ff7c:	8d 45 cc             	lea    eax,[ebp-0x34]
1000ff7f:	50                   	push   eax
1000ff80:	e8 7b ee ff ff       	call   0x1000ee00
1000ff85:	8b 75 cc             	mov    esi,DWORD PTR [ebp-0x34]
1000ff88:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
1000ff8b:	89 46 18             	mov    DWORD PTR [esi+0x18],eax
1000ff8e:	8b 75 e8             	mov    esi,DWORD PTR [ebp-0x18]
1000ff91:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
1000ff94:	83 c7 04             	add    edi,0x4
1000ff97:	89 7d d4             	mov    DWORD PTR [ebp-0x2c],edi
1000ff9a:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
1000ff9d:	3b 78 18             	cmp    edi,DWORD PTR [eax+0x18]
1000ffa0:	0f 82 6d fd ff ff    	jb     0x1000fd13
1000ffa6:	8b 3e                	mov    edi,DWORD PTR [esi]
1000ffa8:	89 7d d8             	mov    DWORD PTR [ebp-0x28],edi
1000ffab:	3b fe                	cmp    edi,esi
1000ffad:	0f 84 b4 01 00 00    	je     0x10010167
1000ffb3:	8b 5f 08             	mov    ebx,DWORD PTR [edi+0x8]
1000ffb6:	8b cb                	mov    ecx,ebx
1000ffb8:	e8 b3 16 00 00       	call   0x10011670
1000ffbd:	85 c0                	test   eax,eax
1000ffbf:	74 16                	je     0x1000ffd7
1000ffc1:	8b cb                	mov    ecx,ebx
1000ffc3:	e8 a8 16 00 00       	call   0x10011670
1000ffc8:	8b c8                	mov    ecx,eax
1000ffca:	e8 91 16 00 00       	call   0x10011660
1000ffcf:	50                   	push   eax
1000ffd0:	8b cb                	mov    ecx,ebx
1000ffd2:	e8 e9 2f 00 00       	call   0x10012fc0
1000ffd7:	8b cb                	mov    ecx,ebx
1000ffd9:	e8 a2 2f 00 00       	call   0x10012f80
1000ffde:	83 f8 ff             	cmp    eax,0xffffffff
1000ffe1:	0f 84 73 01 00 00    	je     0x1001015a
1000ffe7:	8b cb                	mov    ecx,ebx
1000ffe9:	e8 72 d3 ff ff       	call   0x1000d360
1000ffee:	85 c0                	test   eax,eax
1000fff0:	0f 84 64 01 00 00    	je     0x1001015a
1000fff6:	8b cb                	mov    ecx,ebx
1000fff8:	e8 83 2f 00 00       	call   0x10012f80
1000fffd:	8b f0                	mov    esi,eax
1000ffff:	8b cb                	mov    ecx,ebx
10010001:	89 75 e4             	mov    DWORD PTR [ebp-0x1c],esi
10010004:	e8 37 14 00 00       	call   0x10011440
10010009:	8b d0                	mov    edx,eax
1001000b:	89 75 a8             	mov    DWORD PTR [ebp-0x58],esi
1001000e:	8b 45 c4             	mov    eax,DWORD PTR [ebp-0x3c]
10010011:	8b f0                	mov    esi,eax
10010013:	89 55 a4             	mov    DWORD PTR [ebp-0x5c],edx
10010016:	8b 48 04             	mov    ecx,DWORD PTR [eax+0x4]
10010019:	80 79 0d 00          	cmp    BYTE PTR [ecx+0xd],0x0
1001001d:	75 4a                	jne    0x10010069
1001001f:	8b 7d e4             	mov    edi,DWORD PTR [ebp-0x1c]
10010022:	8b 41 10             	mov    eax,DWORD PTR [ecx+0x10]
10010025:	3b c2                	cmp    eax,edx
10010027:	75 03                	jne    0x1001002c
10010029:	39 79 14             	cmp    DWORD PTR [ecx+0x14],edi
1001002c:	0f 9c c0             	setl   al
1001002f:	84 c0                	test   al,al
10010031:	74 10                	je     0x10010043
10010033:	8b 49 08             	mov    ecx,DWORD PTR [ecx+0x8]
10010036:	eb 0f                	jmp    0x10010047
10010038:	68 f0 73 01 10       	push   0x100173f0
1001003d:	ff 15 34 70 01 10    	call   DWORD PTR ds:0x10017034
10010043:	8b f1                	mov    esi,ecx
10010045:	8b 09                	mov    ecx,DWORD PTR [ecx]
10010047:	80 79 0d 00          	cmp    BYTE PTR [ecx+0xd],0x0
1001004b:	74 d5                	je     0x10010022
1001004d:	8b 7d d8             	mov    edi,DWORD PTR [ebp-0x28]
10010050:	3b 75 c4             	cmp    esi,DWORD PTR [ebp-0x3c]
10010053:	74 14                	je     0x10010069
10010055:	8b 46 10             	mov    eax,DWORD PTR [esi+0x10]
10010058:	8b 4e 14             	mov    ecx,DWORD PTR [esi+0x14]
1001005b:	3b d0                	cmp    edx,eax
1001005d:	75 03                	jne    0x10010062
1001005f:	39 4d e4             	cmp    DWORD PTR [ebp-0x1c],ecx
10010062:	0f 9c c0             	setl   al
10010065:	84 c0                	test   al,al
10010067:	74 30                	je     0x10010099
10010069:	8d 45 a4             	lea    eax,[ebp-0x5c]
1001006c:	89 45 cc             	mov    DWORD PTR [ebp-0x34],eax
1001006f:	8d 4d c4             	lea    ecx,[ebp-0x3c]
10010072:	8d 45 ef             	lea    eax,[ebp-0x11]
10010075:	50                   	push   eax
10010076:	8d 45 cc             	lea    eax,[ebp-0x34]
10010079:	50                   	push   eax
1001007a:	68 a4 73 01 10       	push   0x100173a4
1001007f:	e8 3c e9 ff ff       	call   0x1000e9c0
10010084:	50                   	push   eax
10010085:	83 c0 10             	add    eax,0x10
10010088:	8d 4d c4             	lea    ecx,[ebp-0x3c]
1001008b:	50                   	push   eax
1001008c:	56                   	push   esi
1001008d:	8d 45 d0             	lea    eax,[ebp-0x30]
10010090:	50                   	push   eax
10010091:	e8 6a ed ff ff       	call   0x1000ee00
10010096:	8b 75 d0             	mov    esi,DWORD PTR [ebp-0x30]
10010099:	8b 46 18             	mov    eax,DWORD PTR [esi+0x18]
1001009c:	8b cb                	mov    ecx,ebx
1001009e:	40                   	inc    eax
1001009f:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
100100a2:	e8 d9 2e 00 00       	call   0x10012f80
100100a7:	8b cb                	mov    ecx,ebx
100100a9:	8b f0                	mov    esi,eax
100100ab:	e8 90 13 00 00       	call   0x10011440
100100b0:	ff 75 cc             	push   DWORD PTR [ebp-0x34]
100100b3:	8b 4d e4             	mov    ecx,DWORD PTR [ebp-0x1c]
100100b6:	89 45 94             	mov    DWORD PTR [ebp-0x6c],eax
100100b9:	8d 45 8c             	lea    eax,[ebp-0x74]
100100bc:	50                   	push   eax
100100bd:	89 75 90             	mov    DWORD PTR [ebp-0x70],esi
100100c0:	8d 45 d4             	lea    eax,[ebp-0x2c]
100100c3:	8b 75 bc             	mov    esi,DWORD PTR [ebp-0x44]
100100c6:	56                   	push   esi
100100c7:	89 4d 8c             	mov    DWORD PTR [ebp-0x74],ecx
100100ca:	ff 36                	push   DWORD PTR [esi]
100100cc:	50                   	push   eax
100100cd:	e8 6e e9 ff ff       	call   0x1000ea40
100100d2:	83 c4 14             	add    esp,0x14
100100d5:	39 75 d4             	cmp    DWORD PTR [ebp-0x2c],esi
100100d8:	74 44                	je     0x1001011e
100100da:	8b 7d e4             	mov    edi,DWORD PTR [ebp-0x1c]
100100dd:	0f 1f 00             	nop    DWORD PTR [eax]
100100e0:	8b cb                	mov    ecx,ebx
100100e2:	47                   	inc    edi
100100e3:	e8 98 2e 00 00       	call   0x10012f80
100100e8:	8b cb                	mov    ecx,ebx
100100ea:	8b f0                	mov    esi,eax
100100ec:	e8 4f 13 00 00       	call   0x10011440
100100f1:	ff 75 cc             	push   DWORD PTR [ebp-0x34]
100100f4:	89 45 94             	mov    DWORD PTR [ebp-0x6c],eax
100100f7:	8d 45 8c             	lea    eax,[ebp-0x74]
100100fa:	50                   	push   eax
100100fb:	89 75 90             	mov    DWORD PTR [ebp-0x70],esi
100100fe:	8d 45 d4             	lea    eax,[ebp-0x2c]
10010101:	8b 75 bc             	mov    esi,DWORD PTR [ebp-0x44]
10010104:	56                   	push   esi
10010105:	89 7d 8c             	mov    DWORD PTR [ebp-0x74],edi
10010108:	ff 36                	push   DWORD PTR [esi]
1001010a:	50                   	push   eax
1001010b:	e8 30 e9 ff ff       	call   0x1000ea40
10010110:	83 c4 14             	add    esp,0x14
10010113:	39 75 d4             	cmp    DWORD PTR [ebp-0x2c],esi
10010116:	75 c8                	jne    0x100100e0
10010118:	89 7d e4             	mov    DWORD PTR [ebp-0x1c],edi
1001011b:	8b 7d d8             	mov    edi,DWORD PTR [ebp-0x28]
1001011e:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
10010121:	8b cb                	mov    ecx,ebx
10010123:	e8 88 16 00 00       	call   0x100117b0
10010128:	8b cb                	mov    ecx,ebx
1001012a:	e8 51 2e 00 00       	call   0x10012f80
1001012f:	8b cb                	mov    ecx,ebx
10010131:	8b f0                	mov    esi,eax
10010133:	e8 08 13 00 00       	call   0x10011440
10010138:	89 45 ac             	mov    DWORD PTR [ebp-0x54],eax
1001013b:	8d 4d c4             	lea    ecx,[ebp-0x3c]
1001013e:	8d 45 ac             	lea    eax,[ebp-0x54]
10010141:	89 75 b0             	mov    DWORD PTR [ebp-0x50],esi
10010144:	50                   	push   eax
10010145:	8d 45 9c             	lea    eax,[ebp-0x64]
10010148:	50                   	push   eax
10010149:	e8 42 f3 ff ff       	call   0x1000f490
1001014e:	8b 45 9c             	mov    eax,DWORD PTR [ebp-0x64]
10010151:	8b 4d e4             	mov    ecx,DWORD PTR [ebp-0x1c]
10010154:	8b 75 e8             	mov    esi,DWORD PTR [ebp-0x18]
10010157:	89 48 18             	mov    DWORD PTR [eax+0x18],ecx
1001015a:	8b 3f                	mov    edi,DWORD PTR [edi]
1001015c:	89 7d d8             	mov    DWORD PTR [ebp-0x28],edi
1001015f:	3b fe                	cmp    edi,esi
10010161:	0f 85 4c fe ff ff    	jne    0x1000ffb3
10010167:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
1001016a:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
1001016d:	8b 78 14             	mov    edi,DWORD PTR [eax+0x14]
10010170:	3b 78 18             	cmp    edi,DWORD PTR [eax+0x18]
10010173:	0f 83 58 01 00 00    	jae    0x100102d1
10010179:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [eax+0x0]
10010180:	8b 37                	mov    esi,DWORD PTR [edi]
10010182:	8b ce                	mov    ecx,esi
10010184:	e8 07 12 00 00       	call   0x10011390
10010189:	84 c0                	test   al,al
1001018b:	0f 84 2b 01 00 00    	je     0x100102bc
10010191:	6a 00                	push   0x0
10010193:	6a 00                	push   0x0
10010195:	8d 4d e0             	lea    ecx,[ebp-0x20]
10010198:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
1001019f:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
100101a6:	e8 05 f7 ff ff       	call   0x1000f8b0
100101ab:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
100101ae:	8b 06                	mov    eax,DWORD PTR [esi]
100101b0:	33 db                	xor    ebx,ebx
100101b2:	8b ce                	mov    ecx,esi
100101b4:	c6 45 fc 03          	mov    BYTE PTR [ebp-0x4],0x3
100101b8:	89 5d d4             	mov    DWORD PTR [ebp-0x2c],ebx
100101bb:	ff 50 04             	call   DWORD PTR [eax+0x4]
100101be:	85 c0                	test   eax,eax
100101c0:	7e 7e                	jle    0x10010240
100101c2:	8b 06                	mov    eax,DWORD PTR [esi]
100101c4:	8d 4d a4             	lea    ecx,[ebp-0x5c]
100101c7:	53                   	push   ebx
100101c8:	51                   	push   ecx
100101c9:	8b ce                	mov    ecx,esi
100101cb:	ff 50 08             	call   DWORD PTR [eax+0x8]
100101ce:	8b 45 a8             	mov    eax,DWORD PTR [ebp-0x58]
100101d1:	8b c8                	mov    ecx,eax
100101d3:	89 45 cc             	mov    DWORD PTR [ebp-0x34],eax
100101d6:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
100101d9:	e8 a2 2f ff ff       	call   0x10003180
100101de:	83 f8 03             	cmp    eax,0x3
100101e1:	75 4e                	jne    0x10010231
100101e3:	8b 4d cc             	mov    ecx,DWORD PTR [ebp-0x34]
100101e6:	e8 75 ce ff ff       	call   0x1000d060
100101eb:	85 c0                	test   eax,eax
100101ed:	75 42                	jne    0x10010231
100101ef:	39 45 a4             	cmp    DWORD PTR [ebp-0x5c],eax
100101f2:	75 3d                	jne    0x10010231
100101f4:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
100101f7:	8d 4d d0             	lea    ecx,[ebp-0x30]
100101fa:	51                   	push   ecx
100101fb:	8d 4d e0             	lea    ecx,[ebp-0x20]
100101fe:	89 45 cc             	mov    DWORD PTR [ebp-0x34],eax
10010201:	ff 70 04             	push   DWORD PTR [eax+0x4]
10010204:	50                   	push   eax
10010205:	e8 96 e7 ff ff       	call   0x1000e9a0
1001020a:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
1001020d:	b9 54 55 55 15       	mov    ecx,0x15555554
10010212:	2b ca                	sub    ecx,edx
10010214:	8b d8                	mov    ebx,eax
10010216:	83 f9 01             	cmp    ecx,0x1
10010219:	0f 82 19 fe ff ff    	jb     0x10010038
1001021f:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
10010222:	42                   	inc    edx
10010223:	89 55 e4             	mov    DWORD PTR [ebp-0x1c],edx
10010226:	89 58 04             	mov    DWORD PTR [eax+0x4],ebx
10010229:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
1001022c:	89 18                	mov    DWORD PTR [eax],ebx
1001022e:	8b 5d d4             	mov    ebx,DWORD PTR [ebp-0x2c]
10010231:	8b 06                	mov    eax,DWORD PTR [esi]
10010233:	43                   	inc    ebx
10010234:	8b ce                	mov    ecx,esi
10010236:	89 5d d4             	mov    DWORD PTR [ebp-0x2c],ebx
10010239:	ff 50 04             	call   DWORD PTR [eax+0x4]
1001023c:	3b d8                	cmp    ebx,eax
1001023e:	7c 82                	jl     0x100101c2
10010240:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
10010243:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
10010246:	8d 4d f0             	lea    ecx,[ebp-0x10]
10010249:	51                   	push   ecx
1001024a:	50                   	push   eax
1001024b:	c6 45 f0 00          	mov    BYTE PTR [ebp-0x10],0x0
1001024f:	8d 4d e0             	lea    ecx,[ebp-0x20]
10010252:	ff 30                	push   DWORD PTR [eax]
10010254:	8d 45 d8             	lea    eax,[ebp-0x28]
10010257:	50                   	push   eax
10010258:	e8 33 f1 ff ff       	call   0x1000f390
1001025d:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
10010260:	33 db                	xor    ebx,ebx
10010262:	8b 30                	mov    esi,DWORD PTR [eax]
10010264:	3b f0                	cmp    esi,eax
10010266:	74 13                	je     0x1001027b
10010268:	8b 4e 08             	mov    ecx,DWORD PTR [esi+0x8]
1001026b:	43                   	inc    ebx
1001026c:	53                   	push   ebx
1001026d:	e8 3e cf ff ff       	call   0x1000d1b0
10010272:	8b 36                	mov    esi,DWORD PTR [esi]
10010274:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
10010277:	3b f0                	cmp    esi,eax
10010279:	75 ed                	jne    0x10010268
1001027b:	8b 08                	mov    ecx,DWORD PTR [eax]
1001027d:	89 00                	mov    DWORD PTR [eax],eax
1001027f:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
10010282:	c6 45 fc 02          	mov    BYTE PTR [ebp-0x4],0x2
10010286:	89 40 04             	mov    DWORD PTR [eax+0x4],eax
10010289:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
1001028c:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
10010293:	3b c8                	cmp    ecx,eax
10010295:	74 18                	je     0x100102af
10010297:	8b 31                	mov    esi,DWORD PTR [ecx]
10010299:	6a 0c                	push   0xc
1001029b:	6a 01                	push   0x1
1001029d:	51                   	push   ecx
1001029e:	e8 dd 19 ff ff       	call   0x10001c80
100102a3:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
100102a6:	83 c4 0c             	add    esp,0xc
100102a9:	8b ce                	mov    ecx,esi
100102ab:	3b f0                	cmp    esi,eax
100102ad:	75 e8                	jne    0x10010297
100102af:	6a 0c                	push   0xc
100102b1:	6a 01                	push   0x1
100102b3:	50                   	push   eax
100102b4:	e8 c7 19 ff ff       	call   0x10001c80
100102b9:	83 c4 0c             	add    esp,0xc
100102bc:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
100102bf:	83 c7 04             	add    edi,0x4
100102c2:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
100102c5:	3b 78 18             	cmp    edi,DWORD PTR [eax+0x18]
100102c8:	0f 82 b2 fe ff ff    	jb     0x10010180
100102ce:	8b 75 e8             	mov    esi,DWORD PTR [ebp-0x18]
100102d1:	8b 06                	mov    eax,DWORD PTR [esi]
100102d3:	89 36                	mov    DWORD PTR [esi],esi
100102d5:	89 76 04             	mov    DWORD PTR [esi+0x4],esi
100102d8:	3b c6                	cmp    eax,esi
100102da:	74 1c                	je     0x100102f8
100102dc:	8b 5d e8             	mov    ebx,DWORD PTR [ebp-0x18]
100102df:	90                   	nop
100102e0:	8b 30                	mov    esi,DWORD PTR [eax]
100102e2:	6a 0c                	push   0xc
100102e4:	6a 01                	push   0x1
100102e6:	50                   	push   eax
100102e7:	e8 94 19 ff ff       	call   0x10001c80
100102ec:	83 c4 0c             	add    esp,0xc
100102ef:	8b c6                	mov    eax,esi
100102f1:	3b f3                	cmp    esi,ebx
100102f3:	75 eb                	jne    0x100102e0
100102f5:	8b 75 e8             	mov    esi,DWORD PTR [ebp-0x18]
100102f8:	6a 0c                	push   0xc
100102fa:	6a 01                	push   0x1
100102fc:	56                   	push   esi
100102fd:	e8 7e 19 ff ff       	call   0x10001c80
10010302:	8b 45 bc             	mov    eax,DWORD PTR [ebp-0x44]
10010305:	8d 4d bc             	lea    ecx,[ebp-0x44]
10010308:	83 c4 0c             	add    esp,0xc
1001030b:	50                   	push   eax
1001030c:	ff 30                	push   DWORD PTR [eax]
1001030e:	8d 45 cc             	lea    eax,[ebp-0x34]
10010311:	50                   	push   eax
10010312:	e8 b9 38 00 00       	call   0x10013bd0
10010317:	6a 1c                	push   0x1c
10010319:	6a 01                	push   0x1
1001031b:	ff 75 bc             	push   DWORD PTR [ebp-0x44]
1001031e:	e8 5d 19 ff ff       	call   0x10001c80
10010323:	8b 45 c4             	mov    eax,DWORD PTR [ebp-0x3c]
10010326:	8d 4d c4             	lea    ecx,[ebp-0x3c]
10010329:	83 c4 0c             	add    esp,0xc
1001032c:	50                   	push   eax
1001032d:	ff 30                	push   DWORD PTR [eax]
1001032f:	8d 45 cc             	lea    eax,[ebp-0x34]
10010332:	50                   	push   eax
10010333:	e8 98 38 00 00       	call   0x10013bd0
10010338:	6a 1c                	push   0x1c
1001033a:	6a 01                	push   0x1
1001033c:	ff 75 c4             	push   DWORD PTR [ebp-0x3c]
1001033f:	e8 3c 19 ff ff       	call   0x10001c80
10010344:	83 c4 0c             	add    esp,0xc
10010347:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1001034a:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10010351:	59                   	pop    ecx
10010352:	5f                   	pop    edi
10010353:	5e                   	pop    esi
10010354:	5b                   	pop    ebx
10010355:	8b e5                	mov    esp,ebp
10010357:	5d                   	pop    ebp
10010358:	c2                   	.byte 0xc2


===== SubjectCategory::getParent 0x10011670..0x100116B5 =====

/mnt/data/IS2_original_binaries/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

10011670 <.text+0x10670>:
10011670:	56                   	push   esi
10011671:	57                   	push   edi
10011672:	8b f9                	mov    edi,ecx
10011674:	8b 47 04             	mov    eax,DWORD PTR [edi+0x4]
10011677:	8b 70 10             	mov    esi,DWORD PTR [eax+0x10]
1001167a:	3b 70 14             	cmp    esi,DWORD PTR [eax+0x14]
1001167d:	73 25                	jae    0x100116a4
1001167f:	90                   	nop
10011680:	8b 0e                	mov    ecx,DWORD PTR [esi]
10011682:	e8 f9 1a ff ff       	call   0x10003180
10011687:	83 f8 02             	cmp    eax,0x2
1001168a:	75 0d                	jne    0x10011699
1001168c:	8b 0e                	mov    ecx,DWORD PTR [esi]
1001168e:	6a 01                	push   0x1
10011690:	e8 cb 1a ff ff       	call   0x10003160
10011695:	3b c7                	cmp    eax,edi
10011697:	74 10                	je     0x100116a9
10011699:	8b 47 04             	mov    eax,DWORD PTR [edi+0x4]
1001169c:	83 c6 04             	add    esi,0x4
1001169f:	3b 70 14             	cmp    esi,DWORD PTR [eax+0x14]
100116a2:	72 dc                	jb     0x10011680
100116a4:	5f                   	pop    edi
100116a5:	33 c0                	xor    eax,eax
100116a7:	5e                   	pop    esi
100116a8:	c3                   	ret
100116a9:	8b 0e                	mov    ecx,DWORD PTR [esi]
100116ab:	6a 00                	push   0x0
100116ad:	e8 ae 1a ff ff       	call   0x10003160
100116b2:	5f                   	pop    edi
100116b3:	5e                   	pop    esi
100116b4:	c3                   	ret


===== SubjectCategory::getAutoRange 0x10011390..0x10011397 =====

/mnt/data/IS2_original_binaries/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

10011390 <.text+0x10390>:
10011390:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
10011393:	8a 40 58             	mov    al,BYTE PTR [eax+0x58]
10011396:	c3                   	ret


===== AIEBinaryLink::getType helper 0x10003180..0x10003188 =====

/mnt/data/IS2_original_binaries/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

10003180 <.text+0x2180>:
10003180:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
10003183:	8b 40 28             	mov    eax,DWORD PTR [eax+0x28]
10003186:	c3                   	ret
10003187:	cc                   	int3


===== AIEBinaryLink::getAIE2 helper 0x10003610..0x10003618 =====

/mnt/data/IS2_original_binaries/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

10003610 <.text+0x2610>:
10003610:	6a 01                	push   0x1
10003612:	e8 49 fb ff ff       	call   0x10003160
10003617:	c3                   	ret


===== AIEBinaryLink::getAIE3 0x1000D060..0x1000D067 =====

/mnt/data/IS2_original_binaries/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

1000d060 <.text+0xc060>:
1000d060:	6a 02                	push   0x2
1000d062:	e8 f9 60 ff ff       	call   0x10003160


===== AIEBinaryLink::setRange 0x1000D1B0..0x1000D1BD =====

/mnt/data/IS2_original_binaries/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

1000d1b0 <.text+0xc1b0>:
1000d1b0:	55                   	push   ebp
1000d1b1:	8b ec                	mov    ebp,esp
1000d1b3:	8b 49 04             	mov    ecx,DWORD PTR [ecx+0x4]
1000d1b6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000d1b9:	89 41 2c             	mov    DWORD PTR [ecx+0x2c],eax
1000d1bc:	5d                   	pop    ebp


===== SubjectCategory::SCcompare 0x1000F390..0x1000F480 =====

/mnt/data/IS2_original_binaries/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

1000f390 <.text+0xe390>:
1000f390:	55                   	push   ebp
1000f391:	8b ec                	mov    ebp,esp
1000f393:	83 ec 08             	sub    esp,0x8
1000f396:	8b 55 18             	mov    edx,DWORD PTR [ebp+0x18]
1000f399:	53                   	push   ebx
1000f39a:	8b d9                	mov    ebx,ecx
1000f39c:	89 5d f8             	mov    DWORD PTR [ebp-0x8],ebx
1000f39f:	83 fa 02             	cmp    edx,0x2
1000f3a2:	73 0f                	jae    0x1000f3b3
1000f3a4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000f3a7:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
1000f3aa:	5b                   	pop    ebx
1000f3ab:	89 08                	mov    DWORD PTR [eax],ecx
1000f3ad:	8b e5                	mov    esp,ebp
1000f3af:	5d                   	pop    ebp
1000f3b0:	c2 14 00             	ret    0x14
1000f3b3:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
1000f3b6:	d1 ea                	shr    edx,1
1000f3b8:	56                   	push   esi
1000f3b9:	8b f0                	mov    esi,eax
1000f3bb:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
1000f3be:	8b ca                	mov    ecx,edx
1000f3c0:	74 07                	je     0x1000f3c9
1000f3c2:	8b 36                	mov    esi,DWORD PTR [esi]
1000f3c4:	49                   	dec    ecx
1000f3c5:	85 c9                	test   ecx,ecx
1000f3c7:	7f f9                	jg     0x1000f3c2
1000f3c9:	85 c9                	test   ecx,ecx
1000f3cb:	79 0b                	jns    0x1000f3d8
1000f3cd:	f7 d9                	neg    ecx
1000f3cf:	90                   	nop
1000f3d0:	8b 76 04             	mov    esi,DWORD PTR [esi+0x4]
1000f3d3:	83 e9 01             	sub    ecx,0x1
1000f3d6:	75 f8                	jne    0x1000f3d0
1000f3d8:	57                   	push   edi
1000f3d9:	8b 7d 14             	mov    edi,DWORD PTR [ebp+0x14]
1000f3dc:	8b cb                	mov    ecx,ebx
1000f3de:	52                   	push   edx
1000f3df:	57                   	push   edi
1000f3e0:	56                   	push   esi
1000f3e1:	50                   	push   eax
1000f3e2:	8d 45 14             	lea    eax,[ebp+0x14]
1000f3e5:	50                   	push   eax
1000f3e6:	e8 a5 ff ff ff       	call   0x1000f390
1000f3eb:	8b cb                	mov    ecx,ebx
1000f3ed:	8b 00                	mov    eax,DWORD PTR [eax]
1000f3ef:	89 45 0c             	mov    DWORD PTR [ebp+0xc],eax
1000f3f2:	8b 45 18             	mov    eax,DWORD PTR [ebp+0x18]
1000f3f5:	2b 45 fc             	sub    eax,DWORD PTR [ebp-0x4]
1000f3f8:	50                   	push   eax
1000f3f9:	57                   	push   edi
1000f3fa:	ff 75 10             	push   DWORD PTR [ebp+0x10]
1000f3fd:	8d 45 14             	lea    eax,[ebp+0x14]
1000f400:	56                   	push   esi
1000f401:	50                   	push   eax
1000f402:	e8 89 ff ff ff       	call   0x1000f390
1000f407:	c6 45 1b 01          	mov    BYTE PTR [ebp+0x1b],0x1
1000f40b:	8b 30                	mov    esi,DWORD PTR [eax]
1000f40d:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
1000f410:	8b f8                	mov    edi,eax
1000f412:	8b 48 08             	mov    ecx,DWORD PTR [eax+0x8]
1000f415:	8b 5e 08             	mov    ebx,DWORD PTR [esi+0x8]
1000f418:	e8 f3 41 ff ff       	call   0x10003610
1000f41d:	50                   	push   eax
1000f41e:	8b cb                	mov    ecx,ebx
1000f420:	e8 eb 41 ff ff       	call   0x10003610
1000f425:	50                   	push   eax
1000f426:	e8 05 1f 00 00       	call   0x10011330
1000f42b:	83 c4 08             	add    esp,0x8
1000f42e:	84 c0                	test   al,al
1000f430:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
1000f433:	74 31                	je     0x1000f466
1000f435:	80 7d 1b 00          	cmp    BYTE PTR [ebp+0x1b],0x0
1000f439:	8b ce                	mov    ecx,esi
1000f43b:	8b 5d f8             	mov    ebx,DWORD PTR [ebp-0x8]
1000f43e:	0f 45 fe             	cmovne edi,esi
1000f441:	8b 36                	mov    esi,DWORD PTR [esi]
1000f443:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
1000f445:	74 1a                	je     0x1000f461
1000f447:	8b 11                	mov    edx,DWORD PTR [ecx]
1000f449:	3b c1                	cmp    eax,ecx
1000f44b:	74 14                	je     0x1000f461
1000f44d:	3b c2                	cmp    eax,edx
1000f44f:	74 10                	je     0x1000f461
1000f451:	6a 01                	push   0x1
1000f453:	52                   	push   edx
1000f454:	51                   	push   ecx
1000f455:	53                   	push   ebx
1000f456:	50                   	push   eax
1000f457:	8b cb                	mov    ecx,ebx
1000f459:	e8 d2 04 00 00       	call   0x1000f930
1000f45e:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
1000f461:	3b 75 10             	cmp    esi,DWORD PTR [ebp+0x10]
1000f464:	eb 07                	jmp    0x1000f46d
1000f466:	8b 00                	mov    eax,DWORD PTR [eax]
1000f468:	3b c6                	cmp    eax,esi
1000f46a:	89 45 0c             	mov    DWORD PTR [ebp+0xc],eax
1000f46d:	74 06                	je     0x1000f475
1000f46f:	c6 45 1b 00          	mov    BYTE PTR [ebp+0x1b],0x0
1000f473:	eb 9d                	jmp    0x1000f412
1000f475:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000f478:	89 38                	mov    DWORD PTR [eax],edi
1000f47a:	5f                   	pop    edi
1000f47b:	5e                   	pop    esi
1000f47c:	5b                   	pop    ebx
1000f47d:	8b e5                	mov    esp,ebp
1000f47f:	5d                   	pop    ebp
1000f480:	c2                   	.byte 0xc2


===== SubjectCategory::getClass 0x10011440..0x1001144A =====

/mnt/data/IS2_original_binaries/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

10011440 <.text+0x10440>:
10011440:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
10011443:	8b 40 38             	mov    eax,DWORD PTR [eax+0x38]
10011446:	c3                   	ret
10011447:	cc                   	int3
10011448:	cc                   	int3
10011449:	cc                   	int3
1001144a:	cc                   	int3


===== SubjectCategory::getClassChar 0x10011450..0x1001147B =====

/mnt/data/IS2_original_binaries/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

10011450 <.text+0x10450>:
10011450:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
10011453:	8b 40 38             	mov    eax,DWORD PTR [eax+0x38]
10011456:	48                   	dec    eax
10011457:	83 f8 06             	cmp    eax,0x6
1001145a:	77 1c                	ja     0x10011478
1001145c:	ff 24 85 7c 14 01 10 	jmp    DWORD PTR [eax*4+0x1001147c]
10011463:	b0 53                	mov    al,0x53
10011465:	c3                   	ret
10011466:	b0 50                	mov    al,0x50
10011468:	c3                   	ret
10011469:	b0 5a                	mov    al,0x5a
1001146b:	c3                   	ret
1001146c:	b0 4b                	mov    al,0x4b
1001146e:	c3                   	ret
1001146f:	b0 4f                	mov    al,0x4f
10011471:	c3                   	ret
10011472:	b0 52                	mov    al,0x52
10011474:	c3                   	ret
10011475:	b0 43                	mov    al,0x43
10011477:	c3                   	ret
10011478:	b0 2d                	mov    al,0x2d
1001147a:	c3                   	ret
1001147b:	90                   	nop


===== SubjectCategory::getGroup 0x10012F80..0x10012F87 =====

/mnt/data/IS2_original_binaries/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

10012f80 <.text+0x11f80>:
10012f80:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
10012f83:	8b 40 40             	mov    eax,DWORD PTR [eax+0x40]
10012f86:	c3                   	ret
10012f87:	cc                   	int3


===== SubjectCategory::getNumber 0x10011660..0x10011667 =====

/mnt/data/IS2_original_binaries/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

10011660 <.text+0x10660>:
10011660:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
10011663:	8b 40 44             	mov    eax,DWORD PTR [eax+0x44]
10011666:	c3                   	ret
10011667:	cc                   	int3


===== SubjectCategory::setNumber 0x100117B0..0x100117BE =====

/mnt/data/IS2_original_binaries/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

100117b0 <.text+0x107b0>:
100117b0:	55                   	push   ebp
100117b1:	8b ec                	mov    ebp,esp
100117b3:	8b 49 04             	mov    ecx,DWORD PTR [ecx+0x4]
100117b6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
100117b9:	89 41 44             	mov    DWORD PTR [ecx+0x44],eax
100117bc:	5d                   	pop    ebp
100117bd:	c2                   	.byte 0xc2
100117be:	04                   	.byte 0x4


===== SubjectCategory::setGroup 0x10012FC0..0x10012FD4 =====

/mnt/data/IS2_original_binaries/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

10012fc0 <.text+0x11fc0>:
10012fc0:	55                   	push   ebp
10012fc1:	8b ec                	mov    ebp,esp
10012fc3:	8b 49 04             	mov    ecx,DWORD PTR [ecx+0x4]
10012fc6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10012fc9:	89 41 40             	mov    DWORD PTR [ecx+0x40],eax
10012fcc:	5d                   	pop    ebp
10012fcd:	c2 04 00             	ret    0x4
10012fd0:	55                   	push   ebp
10012fd1:	8b ec                	mov    ebp,esp
10012fd3:	8b                   	.byte 0x8b
10012fd4:	49                   	dec    ecx
