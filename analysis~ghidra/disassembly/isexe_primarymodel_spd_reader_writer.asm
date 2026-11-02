===== PRIMARY MODEL WRITER: IS.exe 0x0040ACD0..0x0040B9C3 =====

/mnt/data/IS2_original_binaries/IS.exe:     file format pei-i386


Disassembly of section .text:

0040acd0 <.text+0x9cd0>:
  40acd0:	55                   	push   ebp
  40acd1:	8b ec                	mov    ebp,esp
  40acd3:	6a ff                	push   0xffffffff
  40acd5:	68 52 73 41 00       	push   0x417352
  40acda:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  40ace0:	50                   	push   eax
  40ace1:	83 ec 78             	sub    esp,0x78
  40ace4:	53                   	push   ebx
  40ace5:	56                   	push   esi
  40ace6:	57                   	push   edi
  40ace7:	a1 cc 90 46 00       	mov    eax,ds:0x4690cc
  40acec:	33 c5                	xor    eax,ebp
  40acee:	50                   	push   eax
  40acef:	8d 45 f4             	lea    eax,[ebp-0xc]
  40acf2:	64 a3 00 00 00 00    	mov    fs:0x0,eax
  40acf8:	c7 45 a0 00 00 00 00 	mov    DWORD PTR [ebp-0x60],0x0
  40acff:	8b 75 0c             	mov    esi,DWORD PTR [ebp+0xc]
  40ad02:	8b 1d a8 93 41 00    	mov    ebx,DWORD PTR ds:0x4193a8
  40ad08:	6a 0c                	push   0xc
  40ad0a:	68 54 7a 45 00       	push   0x457a54
  40ad0f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
  40ad16:	89 35 b0 96 46 00    	mov    DWORD PTR ds:0x4696b0,esi
  40ad1c:	ff d3                	call   ebx
  40ad1e:	83 c4 08             	add    esp,0x8
  40ad21:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
  40ad24:	8b 3d 74 9b 41 00    	mov    edi,DWORD PTR ds:0x419b74
  40ad2a:	8d 45 ec             	lea    eax,[ebp-0x14]
  40ad2d:	50                   	push   eax
  40ad2e:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  40ad31:	8b ce                	mov    ecx,esi
  40ad33:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [ebp-0x4],0x1
  40ad3a:	ff d7                	call   edi
  40ad3c:	8d 4d ec             	lea    ecx,[ebp-0x14]
  40ad3f:	c7 45 a0 01 00 00 00 	mov    DWORD PTR [ebp-0x60],0x1
  40ad46:	c6 45 fc 00          	mov    BYTE PTR [ebp-0x4],0x0
  40ad4a:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40ad50:	6a 06                	push   0x6
  40ad52:	68 d4 7a 45 00       	push   0x457ad4
  40ad57:	ff d3                	call   ebx
  40ad59:	83 c4 08             	add    esp,0x8
  40ad5c:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
  40ad5f:	8d 45 d0             	lea    eax,[ebp-0x30]
  40ad62:	c7 45 fc 02 00 00 00 	mov    DWORD PTR [ebp-0x4],0x2
  40ad69:	50                   	push   eax
  40ad6a:	8d 45 dc             	lea    eax,[ebp-0x24]
  40ad6d:	8b ce                	mov    ecx,esi
  40ad6f:	50                   	push   eax
  40ad70:	ff d7                	call   edi
  40ad72:	8d 4d d0             	lea    ecx,[ebp-0x30]
  40ad75:	c6 45 fc 04          	mov    BYTE PTR [ebp-0x4],0x4
  40ad79:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40ad7f:	6a 06                	push   0x6
  40ad81:	68 dc 7a 45 00       	push   0x457adc
  40ad86:	ff d3                	call   ebx
  40ad88:	83 c4 08             	add    esp,0x8
  40ad8b:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
  40ad8e:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  40ad94:	8b 3d fc 90 41 00    	mov    edi,DWORD PTR ds:0x4190fc
  40ad9a:	c6 45 fc 05          	mov    BYTE PTR [ebp-0x4],0x5
  40ad9e:	8b 49 08             	mov    ecx,DWORD PTR [ecx+0x8]
  40ada1:	ff d7                	call   edi
  40ada3:	8d 4d dc             	lea    ecx,[ebp-0x24]
  40ada6:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
  40ada9:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  40adac:	99                   	cdq
  40adad:	52                   	push   edx
  40adae:	50                   	push   eax
  40adaf:	8d 45 ec             	lea    eax,[ebp-0x14]
  40adb2:	50                   	push   eax
  40adb3:	ff 15 4c 9b 41 00    	call   DWORD PTR ds:0x419b4c
  40adb9:	8d 4d ec             	lea    ecx,[ebp-0x14]
  40adbc:	c6 45 fc 04          	mov    BYTE PTR [ebp-0x4],0x4
  40adc0:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40adc6:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  40adc9:	8d 45 dc             	lea    eax,[ebp-0x24]
  40adcc:	8b 35 58 9b 41 00    	mov    esi,DWORD PTR ds:0x419b58
  40add2:	50                   	push   eax
  40add3:	8d 45 a4             	lea    eax,[ebp-0x5c]
  40add6:	50                   	push   eax
  40add7:	ff d6                	call   esi
  40add9:	8d 4d a4             	lea    ecx,[ebp-0x5c]
  40addc:	ff 15 50 9b 41 00    	call   DWORD PTR ds:0x419b50
  40ade2:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  40ade8:	8b 49 08             	mov    ecx,DWORD PTR [ecx+0x8]
  40adeb:	ff d7                	call   edi
  40aded:	8b c8                	mov    ecx,eax
  40adef:	ff 15 24 91 41 00    	call   DWORD PTR ds:0x419124
  40adf5:	8b c8                	mov    ecx,eax
  40adf7:	33 c0                	xor    eax,eax
  40adf9:	89 4d 90             	mov    DWORD PTR [ebp-0x70],ecx
  40adfc:	8b 3d bc 9b 41 00    	mov    edi,DWORD PTR ds:0x419bbc
  40ae02:	89 45 ac             	mov    DWORD PTR [ebp-0x54],eax
  40ae05:	85 c9                	test   ecx,ecx
  40ae07:	0f 8e 72 02 00 00    	jle    0x40b07f
  40ae0d:	0f 1f 00             	nop    DWORD PTR [eax]
  40ae10:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  40ae16:	50                   	push   eax
  40ae17:	8b 49 08             	mov    ecx,DWORD PTR [ecx+0x8]
  40ae1a:	ff 15 fc 90 41 00    	call   DWORD PTR ds:0x4190fc
  40ae20:	8b c8                	mov    ecx,eax
  40ae22:	ff 15 1c 91 41 00    	call   DWORD PTR ds:0x41911c
  40ae28:	8b f0                	mov    esi,eax
  40ae2a:	6a 05                	push   0x5
  40ae2c:	68 44 7a 45 00       	push   0x457a44
  40ae31:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
  40ae34:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
  40ae37:	ff d3                	call   ebx
  40ae39:	83 c4 08             	add    esp,0x8
  40ae3c:	89 45 cc             	mov    DWORD PTR [ebp-0x34],eax
  40ae3f:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
  40ae42:	8d 45 cc             	lea    eax,[ebp-0x34]
  40ae45:	50                   	push   eax
  40ae46:	8d 45 f0             	lea    eax,[ebp-0x10]
  40ae49:	c6 45 fc 06          	mov    BYTE PTR [ebp-0x4],0x6
  40ae4d:	50                   	push   eax
  40ae4e:	ff 15 74 9b 41 00    	call   DWORD PTR ds:0x419b74
  40ae54:	8d 4d cc             	lea    ecx,[ebp-0x34]
  40ae57:	c6 45 fc 08          	mov    BYTE PTR [ebp-0x4],0x8
  40ae5b:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40ae61:	8d 45 f0             	lea    eax,[ebp-0x10]
  40ae64:	50                   	push   eax
  40ae65:	8d 45 a4             	lea    eax,[ebp-0x5c]
  40ae68:	50                   	push   eax
  40ae69:	8d 4d dc             	lea    ecx,[ebp-0x24]
  40ae6c:	ff 15 58 9b 41 00    	call   DWORD PTR ds:0x419b58
  40ae72:	8d 4d a4             	lea    ecx,[ebp-0x5c]
  40ae75:	ff 15 50 9b 41 00    	call   DWORD PTR ds:0x419b50
  40ae7b:	6a 02                	push   0x2
  40ae7d:	68 c8 7a 45 00       	push   0x457ac8
  40ae82:	ff d3                	call   ebx
  40ae84:	83 c4 08             	add    esp,0x8
  40ae87:	89 45 c8             	mov    DWORD PTR [ebp-0x38],eax
  40ae8a:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
  40ae8d:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40ae90:	6a 00                	push   0x0
  40ae92:	c6 45 fc 09          	mov    BYTE PTR [ebp-0x4],0x9
  40ae96:	ff 70 04             	push   DWORD PTR [eax+0x4]
  40ae99:	8d 45 c8             	lea    eax,[ebp-0x38]
  40ae9c:	50                   	push   eax
  40ae9d:	ff d7                	call   edi
  40ae9f:	8d 4d c8             	lea    ecx,[ebp-0x38]
  40aea2:	c6 45 fc 08          	mov    BYTE PTR [ebp-0x4],0x8
  40aea6:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40aeac:	6a 05                	push   0x5
  40aeae:	68 e4 7a 45 00       	push   0x457ae4
  40aeb3:	ff d3                	call   ebx
  40aeb5:	83 c4 08             	add    esp,0x8
  40aeb8:	89 45 c4             	mov    DWORD PTR [ebp-0x3c],eax
  40aebb:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
  40aebe:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40aec1:	c6 45 fc 0a          	mov    BYTE PTR [ebp-0x4],0xa
  40aec5:	8b 40 40             	mov    eax,DWORD PTR [eax+0x40]
  40aec8:	99                   	cdq
  40aec9:	52                   	push   edx
  40aeca:	50                   	push   eax
  40aecb:	8d 45 c4             	lea    eax,[ebp-0x3c]
  40aece:	50                   	push   eax
  40aecf:	ff 15 4c 9b 41 00    	call   DWORD PTR ds:0x419b4c
  40aed5:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  40aed8:	c6 45 fc 08          	mov    BYTE PTR [ebp-0x4],0x8
  40aedc:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40aee2:	6a 06                	push   0x6
  40aee4:	68 ec 7a 45 00       	push   0x457aec
  40aee9:	ff d3                	call   ebx
  40aeeb:	83 c4 08             	add    esp,0x8
  40aeee:	89 45 c0             	mov    DWORD PTR [ebp-0x40],eax
  40aef1:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
  40aef4:	6a 00                	push   0x0
  40aef6:	c6 45 fc 0b          	mov    BYTE PTR [ebp-0x4],0xb
  40aefa:	ff 70 44             	push   DWORD PTR [eax+0x44]
  40aefd:	8d 45 c0             	lea    eax,[ebp-0x40]
  40af00:	50                   	push   eax
  40af01:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40af04:	ff d7                	call   edi
  40af06:	8d 4d c0             	lea    ecx,[ebp-0x40]
  40af09:	c6 45 fc 08          	mov    BYTE PTR [ebp-0x4],0x8
  40af0d:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40af13:	6a 04                	push   0x4
  40af15:	68 0c 7a 45 00       	push   0x457a0c
  40af1a:	ff d3                	call   ebx
  40af1c:	83 c4 08             	add    esp,0x8
  40af1f:	89 45 bc             	mov    DWORD PTR [ebp-0x44],eax
  40af22:	8d 45 9c             	lea    eax,[ebp-0x64]
  40af25:	c6 45 fc 0c          	mov    BYTE PTR [ebp-0x4],0xc
  40af29:	50                   	push   eax
  40af2a:	8b ce                	mov    ecx,esi
  40af2c:	ff 15 98 90 41 00    	call   DWORD PTR ds:0x419098
  40af32:	6a ff                	push   0xffffffff
  40af34:	8b c8                	mov    ecx,eax
  40af36:	c6 45 fc 0d          	mov    BYTE PTR [ebp-0x4],0xd
  40af3a:	ff 15 84 90 41 00    	call   DWORD PTR ds:0x419084
  40af40:	50                   	push   eax
  40af41:	8d 45 a8             	lea    eax,[ebp-0x58]
  40af44:	50                   	push   eax
  40af45:	ff 15 d4 92 41 00    	call   DWORD PTR ds:0x4192d4
  40af4b:	83 c4 0c             	add    esp,0xc
  40af4e:	50                   	push   eax
  40af4f:	8d 45 bc             	lea    eax,[ebp-0x44]
  40af52:	c6 45 fc 0e          	mov    BYTE PTR [ebp-0x4],0xe
  40af56:	50                   	push   eax
  40af57:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40af5a:	ff 15 80 9b 41 00    	call   DWORD PTR ds:0x419b80
  40af60:	8d 4d a8             	lea    ecx,[ebp-0x58]
  40af63:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40af69:	8d 4d 9c             	lea    ecx,[ebp-0x64]
  40af6c:	ff 15 7c 90 41 00    	call   DWORD PTR ds:0x41907c
  40af72:	8d 4d bc             	lea    ecx,[ebp-0x44]
  40af75:	c6 45 fc 08          	mov    BYTE PTR [ebp-0x4],0x8
  40af79:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40af7f:	6a 04                	push   0x4
  40af81:	68 f4 7a 45 00       	push   0x457af4
  40af86:	ff d3                	call   ebx
  40af88:	83 c4 08             	add    esp,0x8
  40af8b:	89 45 b8             	mov    DWORD PTR [ebp-0x48],eax
  40af8e:	8d 45 94             	lea    eax,[ebp-0x6c]
  40af91:	c6 45 fc 0f          	mov    BYTE PTR [ebp-0x4],0xf
  40af95:	50                   	push   eax
  40af96:	8b ce                	mov    ecx,esi
  40af98:	ff 15 28 91 41 00    	call   DWORD PTR ds:0x419128
  40af9e:	6a ff                	push   0xffffffff
  40afa0:	8b c8                	mov    ecx,eax
  40afa2:	c6 45 fc 10          	mov    BYTE PTR [ebp-0x4],0x10
  40afa6:	ff 15 84 90 41 00    	call   DWORD PTR ds:0x419084
  40afac:	50                   	push   eax
  40afad:	8d 45 98             	lea    eax,[ebp-0x68]
  40afb0:	50                   	push   eax
  40afb1:	ff 15 d4 92 41 00    	call   DWORD PTR ds:0x4192d4
  40afb7:	83 c4 0c             	add    esp,0xc
  40afba:	50                   	push   eax
  40afbb:	8d 45 b8             	lea    eax,[ebp-0x48]
  40afbe:	c6 45 fc 11          	mov    BYTE PTR [ebp-0x4],0x11
  40afc2:	50                   	push   eax
  40afc3:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40afc6:	ff 15 80 9b 41 00    	call   DWORD PTR ds:0x419b80
  40afcc:	8d 4d 98             	lea    ecx,[ebp-0x68]
  40afcf:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40afd5:	8d 4d 94             	lea    ecx,[ebp-0x6c]
  40afd8:	ff 15 7c 90 41 00    	call   DWORD PTR ds:0x41907c
  40afde:	8d 4d b8             	lea    ecx,[ebp-0x48]
  40afe1:	c6 45 fc 08          	mov    BYTE PTR [ebp-0x4],0x8
  40afe5:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40afeb:	6a 0a                	push   0xa
  40afed:	68 fc 7a 45 00       	push   0x457afc
  40aff2:	ff d3                	call   ebx
  40aff4:	83 c4 08             	add    esp,0x8
  40aff7:	89 45 b4             	mov    DWORD PTR [ebp-0x4c],eax
  40affa:	8b ce                	mov    ecx,esi
  40affc:	c6 45 fc 12          	mov    BYTE PTR [ebp-0x4],0x12
  40b000:	ff 15 9c 90 41 00    	call   DWORD PTR ds:0x41909c
  40b006:	99                   	cdq
  40b007:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40b00a:	52                   	push   edx
  40b00b:	50                   	push   eax
  40b00c:	8d 45 b4             	lea    eax,[ebp-0x4c]
  40b00f:	50                   	push   eax
  40b010:	ff 15 4c 9b 41 00    	call   DWORD PTR ds:0x419b4c
  40b016:	8d 4d b4             	lea    ecx,[ebp-0x4c]
  40b019:	c6 45 fc 08          	mov    BYTE PTR [ebp-0x4],0x8
  40b01d:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40b023:	8b 75 ec             	mov    esi,DWORD PTR [ebp-0x14]
  40b026:	83 7e 4c 00          	cmp    DWORD PTR [esi+0x4c],0x0
  40b02a:	74 30                	je     0x40b05c
  40b02c:	6a 01                	push   0x1
  40b02e:	68 08 7b 45 00       	push   0x457b08
  40b033:	ff d3                	call   ebx
  40b035:	83 c4 08             	add    esp,0x8
  40b038:	89 45 b0             	mov    DWORD PTR [ebp-0x50],eax
  40b03b:	8b 46 4c             	mov    eax,DWORD PTR [esi+0x4c]
  40b03e:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40b041:	6a 00                	push   0x0
  40b043:	c6 45 fc 13          	mov    BYTE PTR [ebp-0x4],0x13
  40b047:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
  40b04a:	ff 70 04             	push   DWORD PTR [eax+0x4]
  40b04d:	8d 45 b0             	lea    eax,[ebp-0x50]
  40b050:	50                   	push   eax
  40b051:	ff d7                	call   edi
  40b053:	8d 4d b0             	lea    ecx,[ebp-0x50]
  40b056:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40b05c:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40b05f:	c6 45 fc 04          	mov    BYTE PTR [ebp-0x4],0x4
  40b063:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  40b069:	8b 45 ac             	mov    eax,DWORD PTR [ebp-0x54]
  40b06c:	40                   	inc    eax
  40b06d:	89 45 ac             	mov    DWORD PTR [ebp-0x54],eax
  40b070:	3b 45 90             	cmp    eax,DWORD PTR [ebp-0x70]
  40b073:	0f 8c 97 fd ff ff    	jl     0x40ae10
  40b079:	8b 35 58 9b 41 00    	mov    esi,DWORD PTR ds:0x419b58
  40b07f:	6a 07                	push   0x7
  40b081:	68 0c 7b 45 00       	push   0x457b0c
  40b086:	ff d3                	call   ebx
  40b088:	83 c4 08             	add    esp,0x8
  40b08b:	89 45 ac             	mov    DWORD PTR [ebp-0x54],eax
  40b08e:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
  40b091:	8d 45 ac             	lea    eax,[ebp-0x54]
  40b094:	50                   	push   eax
  40b095:	8d 45 e0             	lea    eax,[ebp-0x20]
  40b098:	c6 45 fc 14          	mov    BYTE PTR [ebp-0x4],0x14
  40b09c:	50                   	push   eax
  40b09d:	ff 15 74 9b 41 00    	call   DWORD PTR ds:0x419b74
  40b0a3:	8d 4d ac             	lea    ecx,[ebp-0x54]
  40b0a6:	c6 45 fc 16          	mov    BYTE PTR [ebp-0x4],0x16
  40b0aa:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40b0b0:	6a 06                	push   0x6
  40b0b2:	68 dc 7a 45 00       	push   0x457adc
  40b0b7:	ff d3                	call   ebx
  40b0b9:	83 c4 08             	add    esp,0x8
  40b0bc:	89 45 b0             	mov    DWORD PTR [ebp-0x50],eax
  40b0bf:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  40b0c5:	c6 45 fc 17          	mov    BYTE PTR [ebp-0x4],0x17
  40b0c9:	8b 49 08             	mov    ecx,DWORD PTR [ecx+0x8]
  40b0cc:	ff 15 00 91 41 00    	call   DWORD PTR ds:0x419100
  40b0d2:	8d 4d e0             	lea    ecx,[ebp-0x20]
  40b0d5:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
  40b0d8:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  40b0db:	99                   	cdq
  40b0dc:	52                   	push   edx
  40b0dd:	50                   	push   eax
  40b0de:	8d 45 b0             	lea    eax,[ebp-0x50]
  40b0e1:	50                   	push   eax
  40b0e2:	ff 15 4c 9b 41 00    	call   DWORD PTR ds:0x419b4c
  40b0e8:	8d 4d b0             	lea    ecx,[ebp-0x50]
  40b0eb:	c6 45 fc 16          	mov    BYTE PTR [ebp-0x4],0x16
  40b0ef:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40b0f5:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  40b0f8:	8d 45 e0             	lea    eax,[ebp-0x20]
  40b0fb:	50                   	push   eax
  40b0fc:	8d 45 90             	lea    eax,[ebp-0x70]
  40b0ff:	50                   	push   eax
  40b100:	ff d6                	call   esi
  40b102:	8d 4d 90             	lea    ecx,[ebp-0x70]
  40b105:	ff 15 50 9b 41 00    	call   DWORD PTR ds:0x419b50
  40b10b:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  40b111:	8b 49 08             	mov    ecx,DWORD PTR [ecx+0x8]
  40b114:	ff 15 00 91 41 00    	call   DWORD PTR ds:0x419100
  40b11a:	8b c8                	mov    ecx,eax
  40b11c:	ff 15 10 91 41 00    	call   DWORD PTR ds:0x419110
  40b122:	8b c8                	mov    ecx,eax
  40b124:	33 c0                	xor    eax,eax
  40b126:	89 4d 9c             	mov    DWORD PTR [ebp-0x64],ecx
  40b129:	89 45 bc             	mov    DWORD PTR [ebp-0x44],eax
  40b12c:	85 c9                	test   ecx,ecx
  40b12e:	0f 8e 21 01 00 00    	jle    0x40b255
  40b134:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  40b13a:	50                   	push   eax
  40b13b:	8b 49 08             	mov    ecx,DWORD PTR [ecx+0x8]
  40b13e:	ff 15 00 91 41 00    	call   DWORD PTR ds:0x419100
  40b144:	8b c8                	mov    ecx,eax
  40b146:	ff 15 68 91 41 00    	call   DWORD PTR ds:0x419168
  40b14c:	6a 06                	push   0x6
  40b14e:	68 14 7b 45 00       	push   0x457b14
  40b153:	8b f0                	mov    esi,eax
  40b155:	ff d3                	call   ebx
  40b157:	83 c4 08             	add    esp,0x8
  40b15a:	89 45 b0             	mov    DWORD PTR [ebp-0x50],eax
  40b15d:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
  40b160:	8d 45 b0             	lea    eax,[ebp-0x50]
  40b163:	50                   	push   eax
  40b164:	8d 45 ec             	lea    eax,[ebp-0x14]
  40b167:	c6 45 fc 18          	mov    BYTE PTR [ebp-0x4],0x18
  40b16b:	50                   	push   eax
  40b16c:	ff 15 74 9b 41 00    	call   DWORD PTR ds:0x419b74
  40b172:	8d 4d b0             	lea    ecx,[ebp-0x50]
  40b175:	c6 45 fc 1a          	mov    BYTE PTR [ebp-0x4],0x1a
  40b179:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40b17f:	8d 45 ec             	lea    eax,[ebp-0x14]
  40b182:	50                   	push   eax
  40b183:	8d 45 90             	lea    eax,[ebp-0x70]
  40b186:	50                   	push   eax
  40b187:	8d 4d e0             	lea    ecx,[ebp-0x20]
  40b18a:	ff 15 58 9b 41 00    	call   DWORD PTR ds:0x419b58
  40b190:	8d 4d 90             	lea    ecx,[ebp-0x70]
  40b193:	ff 15 50 9b 41 00    	call   DWORD PTR ds:0x419b50
  40b199:	6a 02                	push   0x2
  40b19b:	68 c8 7a 45 00       	push   0x457ac8
  40b1a0:	ff d3                	call   ebx
  40b1a2:	83 c4 08             	add    esp,0x8
  40b1a5:	89 45 b4             	mov    DWORD PTR [ebp-0x4c],eax
  40b1a8:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
  40b1ab:	8d 4d ec             	lea    ecx,[ebp-0x14]
  40b1ae:	6a 00                	push   0x0
  40b1b0:	c6 45 fc 1b          	mov    BYTE PTR [ebp-0x4],0x1b
  40b1b4:	ff 70 04             	push   DWORD PTR [eax+0x4]
  40b1b7:	8d 45 b4             	lea    eax,[ebp-0x4c]
  40b1ba:	50                   	push   eax
  40b1bb:	ff d7                	call   edi
  40b1bd:	8d 4d b4             	lea    ecx,[ebp-0x4c]
  40b1c0:	c6 45 fc 1a          	mov    BYTE PTR [ebp-0x4],0x1a
  40b1c4:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40b1ca:	6a 04                	push   0x4
  40b1cc:	68 0c 7a 45 00       	push   0x457a0c
  40b1d1:	ff d3                	call   ebx
  40b1d3:	83 c4 08             	add    esp,0x8
  40b1d6:	89 45 b8             	mov    DWORD PTR [ebp-0x48],eax
  40b1d9:	8d 45 98             	lea    eax,[ebp-0x68]
  40b1dc:	c6 45 fc 1c          	mov    BYTE PTR [ebp-0x4],0x1c
  40b1e0:	50                   	push   eax
  40b1e1:	8b ce                	mov    ecx,esi
  40b1e3:	ff 15 60 91 41 00    	call   DWORD PTR ds:0x419160
  40b1e9:	6a ff                	push   0xffffffff
  40b1eb:	8b c8                	mov    ecx,eax
  40b1ed:	c6 45 fc 1d          	mov    BYTE PTR [ebp-0x4],0x1d
  40b1f1:	ff 15 84 90 41 00    	call   DWORD PTR ds:0x419084
  40b1f7:	50                   	push   eax
  40b1f8:	8d 45 94             	lea    eax,[ebp-0x6c]
  40b1fb:	50                   	push   eax
  40b1fc:	ff 15 d4 92 41 00    	call   DWORD PTR ds:0x4192d4
  40b202:	83 c4 0c             	add    esp,0xc
  40b205:	50                   	push   eax
  40b206:	8d 45 b8             	lea    eax,[ebp-0x48]
  40b209:	c6 45 fc 1e          	mov    BYTE PTR [ebp-0x4],0x1e
  40b20d:	50                   	push   eax
  40b20e:	8d 4d ec             	lea    ecx,[ebp-0x14]
  40b211:	ff 15 80 9b 41 00    	call   DWORD PTR ds:0x419b80
  40b217:	8d 4d 94             	lea    ecx,[ebp-0x6c]
  40b21a:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40b220:	8d 4d 98             	lea    ecx,[ebp-0x68]
  40b223:	ff 15 7c 90 41 00    	call   DWORD PTR ds:0x41907c
  40b229:	8d 4d b8             	lea    ecx,[ebp-0x48]
  40b22c:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40b232:	8d 4d ec             	lea    ecx,[ebp-0x14]
  40b235:	c6 45 fc 16          	mov    BYTE PTR [ebp-0x4],0x16
  40b239:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  40b23f:	8b 45 bc             	mov    eax,DWORD PTR [ebp-0x44]
  40b242:	40                   	inc    eax
  40b243:	89 45 bc             	mov    DWORD PTR [ebp-0x44],eax
  40b246:	3b 45 9c             	cmp    eax,DWORD PTR [ebp-0x64]
  40b249:	0f 8c e5 fe ff ff    	jl     0x40b134
  40b24f:	8b 35 58 9b 41 00    	mov    esi,DWORD PTR ds:0x419b58
  40b255:	6a 03                	push   0x3
  40b257:	68 1c 7b 45 00       	push   0x457b1c
  40b25c:	ff d3                	call   ebx
  40b25e:	83 c4 08             	add    esp,0x8
  40b261:	89 45 b0             	mov    DWORD PTR [ebp-0x50],eax
  40b264:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
  40b267:	8d 45 b0             	lea    eax,[ebp-0x50]
  40b26a:	50                   	push   eax
  40b26b:	8d 45 e4             	lea    eax,[ebp-0x1c]
  40b26e:	c6 45 fc 1f          	mov    BYTE PTR [ebp-0x4],0x1f
  40b272:	50                   	push   eax
  40b273:	ff 15 74 9b 41 00    	call   DWORD PTR ds:0x419b74
  40b279:	8d 4d b0             	lea    ecx,[ebp-0x50]
  40b27c:	c6 45 fc 21          	mov    BYTE PTR [ebp-0x4],0x21
  40b280:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40b286:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  40b289:	8d 45 e4             	lea    eax,[ebp-0x1c]
  40b28c:	50                   	push   eax
  40b28d:	8d 45 90             	lea    eax,[ebp-0x70]
  40b290:	50                   	push   eax
  40b291:	ff d6                	call   esi
  40b293:	8d 4d 90             	lea    ecx,[ebp-0x70]
  40b296:	ff 15 50 9b 41 00    	call   DWORD PTR ds:0x419b50
  40b29c:	6a 07                	push   0x7
  40b29e:	68 20 7b 45 00       	push   0x457b20
  40b2a3:	ff d3                	call   ebx
  40b2a5:	83 c4 08             	add    esp,0x8
  40b2a8:	89 45 ac             	mov    DWORD PTR [ebp-0x54],eax
  40b2ab:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
  40b2ae:	8d 45 ac             	lea    eax,[ebp-0x54]
  40b2b1:	50                   	push   eax
  40b2b2:	8d 45 e8             	lea    eax,[ebp-0x18]
  40b2b5:	c6 45 fc 22          	mov    BYTE PTR [ebp-0x4],0x22
  40b2b9:	50                   	push   eax
  40b2ba:	ff 15 74 9b 41 00    	call   DWORD PTR ds:0x419b74
  40b2c0:	8d 4d ac             	lea    ecx,[ebp-0x54]
  40b2c3:	c6 45 fc 24          	mov    BYTE PTR [ebp-0x4],0x24
  40b2c7:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40b2cd:	8d 45 e8             	lea    eax,[ebp-0x18]
  40b2d0:	50                   	push   eax
  40b2d1:	8d 45 90             	lea    eax,[ebp-0x70]
  40b2d4:	50                   	push   eax
  40b2d5:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  40b2d8:	ff d6                	call   esi
  40b2da:	8d 4d 90             	lea    ecx,[ebp-0x70]
  40b2dd:	ff 15 50 9b 41 00    	call   DWORD PTR ds:0x419b50
  40b2e3:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  40b2e9:	8b 49 08             	mov    ecx,DWORD PTR [ecx+0x8]
  40b2ec:	ff 15 04 91 41 00    	call   DWORD PTR ds:0x419104
  40b2f2:	8b c8                	mov    ecx,eax
  40b2f4:	ff 15 50 91 41 00    	call   DWORD PTR ds:0x419150
  40b2fa:	6a 06                	push   0x6
  40b2fc:	68 28 7b 45 00       	push   0x457b28
  40b301:	89 45 a4             	mov    DWORD PTR [ebp-0x5c],eax
  40b304:	ff d3                	call   ebx
  40b306:	83 c4 08             	add    esp,0x8
  40b309:	89 45 b0             	mov    DWORD PTR [ebp-0x50],eax
  40b30c:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  40b312:	c6 45 fc 25          	mov    BYTE PTR [ebp-0x4],0x25
  40b316:	8b 49 08             	mov    ecx,DWORD PTR [ecx+0x8]
  40b319:	ff 15 04 91 41 00    	call   DWORD PTR ds:0x419104
  40b31f:	8d 4d e8             	lea    ecx,[ebp-0x18]
  40b322:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  40b325:	8b 40 24             	mov    eax,DWORD PTR [eax+0x24]
  40b328:	99                   	cdq
  40b329:	52                   	push   edx
  40b32a:	50                   	push   eax
  40b32b:	8d 45 b0             	lea    eax,[ebp-0x50]
  40b32e:	50                   	push   eax
  40b32f:	ff 15 4c 9b 41 00    	call   DWORD PTR ds:0x419b4c
  40b335:	8d 4d b0             	lea    ecx,[ebp-0x50]
  40b338:	c6 45 fc 24          	mov    BYTE PTR [ebp-0x4],0x24
  40b33c:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40b342:	33 c9                	xor    ecx,ecx
  40b344:	89 4d a8             	mov    DWORD PTR [ebp-0x58],ecx
  40b347:	39 4d a4             	cmp    DWORD PTR [ebp-0x5c],ecx
  40b34a:	0f 8e 44 03 00 00    	jle    0x40b694
  40b350:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  40b353:	8d 55 f0             	lea    edx,[ebp-0x10]
  40b356:	89 85 7c ff ff ff    	mov    DWORD PTR [ebp-0x84],eax
  40b35c:	89 55 80             	mov    DWORD PTR [ebp-0x80],edx
  40b35f:	90                   	nop
  40b360:	51                   	push   ecx
  40b361:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  40b367:	8b 49 08             	mov    ecx,DWORD PTR [ecx+0x8]
  40b36a:	ff 15 04 91 41 00    	call   DWORD PTR ds:0x419104
  40b370:	8b c8                	mov    ecx,eax
  40b372:	ff 15 48 91 41 00    	call   DWORD PTR ds:0x419148
  40b378:	8b f0                	mov    esi,eax
  40b37a:	6a 02                	push   0x2
  40b37c:	68 30 7b 45 00       	push   0x457b30
  40b381:	89 75 98             	mov    DWORD PTR [ebp-0x68],esi
  40b384:	ff d3                	call   ebx
  40b386:	83 c4 08             	add    esp,0x8
  40b389:	89 45 b0             	mov    DWORD PTR [ebp-0x50],eax
  40b38c:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
  40b38f:	8d 45 b0             	lea    eax,[ebp-0x50]
  40b392:	50                   	push   eax
  40b393:	8d 45 f0             	lea    eax,[ebp-0x10]
  40b396:	c6 45 fc 26          	mov    BYTE PTR [ebp-0x4],0x26
  40b39a:	50                   	push   eax
  40b39b:	ff 15 74 9b 41 00    	call   DWORD PTR ds:0x419b74
  40b3a1:	8d 4d b0             	lea    ecx,[ebp-0x50]
  40b3a4:	c6 45 fc 28          	mov    BYTE PTR [ebp-0x4],0x28
  40b3a8:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40b3ae:	6a 04                	push   0x4
  40b3b0:	68 0c 7a 45 00       	push   0x457a0c
  40b3b5:	ff d3                	call   ebx
  40b3b7:	83 c4 08             	add    esp,0x8
  40b3ba:	89 45 b4             	mov    DWORD PTR [ebp-0x4c],eax
  40b3bd:	8b 4e 04             	mov    ecx,DWORD PTR [esi+0x4]
  40b3c0:	6a ff                	push   0xffffffff
  40b3c2:	83 c1 08             	add    ecx,0x8
  40b3c5:	c6 45 fc 29          	mov    BYTE PTR [ebp-0x4],0x29
  40b3c9:	ff 15 84 90 41 00    	call   DWORD PTR ds:0x419084
  40b3cf:	50                   	push   eax
  40b3d0:	8d 45 90             	lea    eax,[ebp-0x70]
  40b3d3:	50                   	push   eax
  40b3d4:	ff 15 d4 92 41 00    	call   DWORD PTR ds:0x4192d4
  40b3da:	83 c4 0c             	add    esp,0xc
  40b3dd:	50                   	push   eax
  40b3de:	8d 45 b4             	lea    eax,[ebp-0x4c]
  40b3e1:	c6 45 fc 2a          	mov    BYTE PTR [ebp-0x4],0x2a
  40b3e5:	50                   	push   eax
  40b3e6:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40b3e9:	ff 15 80 9b 41 00    	call   DWORD PTR ds:0x419b80
  40b3ef:	8d 4d 90             	lea    ecx,[ebp-0x70]
  40b3f2:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40b3f8:	8d 4d b4             	lea    ecx,[ebp-0x4c]
  40b3fb:	c6 45 fc 28          	mov    BYTE PTR [ebp-0x4],0x28
  40b3ff:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40b405:	6a 02                	push   0x2
  40b407:	68 c8 7a 45 00       	push   0x457ac8
  40b40c:	ff d3                	call   ebx
  40b40e:	83 c4 08             	add    esp,0x8
  40b411:	89 45 b8             	mov    DWORD PTR [ebp-0x48],eax
  40b414:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
  40b417:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40b41a:	6a 00                	push   0x0
  40b41c:	c6 45 fc 2b          	mov    BYTE PTR [ebp-0x4],0x2b
  40b420:	ff 70 04             	push   DWORD PTR [eax+0x4]
  40b423:	8d 45 b8             	lea    eax,[ebp-0x48]
  40b426:	50                   	push   eax
  40b427:	ff d7                	call   edi
  40b429:	8d 4d b8             	lea    ecx,[ebp-0x48]
  40b42c:	c6 45 fc 28          	mov    BYTE PTR [ebp-0x4],0x28
  40b430:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40b436:	6a 04                	push   0x4
  40b438:	68 34 7b 45 00       	push   0x457b34
  40b43d:	ff d3                	call   ebx
  40b43f:	83 c4 08             	add    esp,0x8
  40b442:	89 45 bc             	mov    DWORD PTR [ebp-0x44],eax
  40b445:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
  40b448:	c6 45 fc 2c          	mov    BYTE PTR [ebp-0x4],0x2c
  40b44c:	8b 80 80 00 00 00    	mov    eax,DWORD PTR [eax+0x80]
  40b452:	99                   	cdq
  40b453:	8b 3d 4c 9b 41 00    	mov    edi,DWORD PTR ds:0x419b4c
  40b459:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40b45c:	52                   	push   edx
  40b45d:	50                   	push   eax
  40b45e:	8d 45 bc             	lea    eax,[ebp-0x44]
  40b461:	50                   	push   eax
  40b462:	ff d7                	call   edi
  40b464:	8d 4d bc             	lea    ecx,[ebp-0x44]
  40b467:	c6 45 fc 28          	mov    BYTE PTR [ebp-0x4],0x28
  40b46b:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40b471:	6a 06                	push   0x6
  40b473:	68 3c 7b 45 00       	push   0x457b3c
  40b478:	ff d3                	call   ebx
  40b47a:	83 c4 08             	add    esp,0x8
  40b47d:	89 45 c0             	mov    DWORD PTR [ebp-0x40],eax
  40b480:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
  40b483:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40b486:	c6 45 fc 2d          	mov    BYTE PTR [ebp-0x4],0x2d
  40b48a:	8b 80 84 00 00 00    	mov    eax,DWORD PTR [eax+0x84]
  40b490:	99                   	cdq
  40b491:	52                   	push   edx
  40b492:	50                   	push   eax
  40b493:	8d 45 c0             	lea    eax,[ebp-0x40]
  40b496:	50                   	push   eax
  40b497:	ff d7                	call   edi
  40b499:	8d 4d c0             	lea    ecx,[ebp-0x40]
  40b49c:	c6 45 fc 28          	mov    BYTE PTR [ebp-0x4],0x28
  40b4a0:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40b4a6:	6a 0d                	push   0xd
  40b4a8:	68 44 7b 45 00       	push   0x457b44
  40b4ad:	ff d3                	call   ebx
  40b4af:	83 c4 08             	add    esp,0x8
  40b4b2:	89 45 c4             	mov    DWORD PTR [ebp-0x3c],eax
  40b4b5:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
  40b4b8:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40b4bb:	c6 45 fc 2e          	mov    BYTE PTR [ebp-0x4],0x2e
  40b4bf:	8b 80 88 00 00 00    	mov    eax,DWORD PTR [eax+0x88]
  40b4c5:	99                   	cdq
  40b4c6:	52                   	push   edx
  40b4c7:	50                   	push   eax
  40b4c8:	8d 45 c4             	lea    eax,[ebp-0x3c]
  40b4cb:	50                   	push   eax
  40b4cc:	ff d7                	call   edi
  40b4ce:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  40b4d1:	c6 45 fc 28          	mov    BYTE PTR [ebp-0x4],0x28
  40b4d5:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40b4db:	6a 05                	push   0x5
  40b4dd:	68 54 7b 45 00       	push   0x457b54
  40b4e2:	ff d3                	call   ebx
  40b4e4:	83 c4 08             	add    esp,0x8
  40b4e7:	89 45 c8             	mov    DWORD PTR [ebp-0x38],eax
  40b4ea:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
  40b4ed:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40b4f0:	c6 45 fc 2f          	mov    BYTE PTR [ebp-0x4],0x2f
  40b4f4:	8b 40 50             	mov    eax,DWORD PTR [eax+0x50]
  40b4f7:	99                   	cdq
  40b4f8:	52                   	push   edx
  40b4f9:	50                   	push   eax
  40b4fa:	8d 45 c8             	lea    eax,[ebp-0x38]
  40b4fd:	50                   	push   eax
  40b4fe:	ff d7                	call   edi
  40b500:	8d 4d c8             	lea    ecx,[ebp-0x38]
  40b503:	c6 45 fc 28          	mov    BYTE PTR [ebp-0x4],0x28
  40b507:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40b50d:	6a 06                	push   0x6
  40b50f:	68 ec 7a 45 00       	push   0x457aec
  40b514:	ff d3                	call   ebx
  40b516:	83 c4 08             	add    esp,0x8
  40b519:	89 45 cc             	mov    DWORD PTR [ebp-0x34],eax
  40b51c:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
  40b51f:	c6 45 fc 30          	mov    BYTE PTR [ebp-0x4],0x30
  40b523:	8b 40 54             	mov    eax,DWORD PTR [eax+0x54]
  40b526:	99                   	cdq
  40b527:	52                   	push   edx
  40b528:	50                   	push   eax
  40b529:	8d 45 cc             	lea    eax,[ebp-0x34]
  40b52c:	50                   	push   eax
  40b52d:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40b530:	ff d7                	call   edi
  40b532:	8d 4d cc             	lea    ecx,[ebp-0x34]
  40b535:	c6 45 fc 28          	mov    BYTE PTR [ebp-0x4],0x28
  40b539:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40b53f:	6a 06                	push   0x6
  40b541:	68 5c 7b 45 00       	push   0x457b5c
  40b546:	ff d3                	call   ebx
  40b548:	83 c4 08             	add    esp,0x8
  40b54b:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
  40b54e:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
  40b551:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40b554:	c6 45 fc 31          	mov    BYTE PTR [ebp-0x4],0x31
  40b558:	0f b7 40 58          	movzx  eax,WORD PTR [eax+0x58]
  40b55c:	99                   	cdq
  40b55d:	52                   	push   edx
  40b55e:	50                   	push   eax
  40b55f:	8d 45 d0             	lea    eax,[ebp-0x30]
  40b562:	50                   	push   eax
  40b563:	ff d7                	call   edi
  40b565:	8d 4d d0             	lea    ecx,[ebp-0x30]
  40b568:	c6 45 fc 28          	mov    BYTE PTR [ebp-0x4],0x28
  40b56c:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40b572:	6a 04                	push   0x4
  40b574:	68 64 7b 45 00       	push   0x457b64
  40b579:	ff d3                	call   ebx
  40b57b:	83 c4 08             	add    esp,0x8
  40b57e:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
  40b581:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
  40b584:	05 98 00 00 00       	add    eax,0x98
  40b589:	c6 45 fc 32          	mov    BYTE PTR [ebp-0x4],0x32
  40b58d:	83 78 14 08          	cmp    DWORD PTR [eax+0x14],0x8
  40b591:	72 02                	jb     0x40b595
  40b593:	8b 00                	mov    eax,DWORD PTR [eax]
  40b595:	6a ff                	push   0xffffffff
  40b597:	50                   	push   eax
  40b598:	8d 45 94             	lea    eax,[ebp-0x6c]
  40b59b:	50                   	push   eax
  40b59c:	ff 15 d4 92 41 00    	call   DWORD PTR ds:0x4192d4
  40b5a2:	83 c4 0c             	add    esp,0xc
  40b5a5:	50                   	push   eax
  40b5a6:	8d 45 ec             	lea    eax,[ebp-0x14]
  40b5a9:	c6 45 fc 33          	mov    BYTE PTR [ebp-0x4],0x33
  40b5ad:	50                   	push   eax
  40b5ae:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40b5b1:	ff 15 80 9b 41 00    	call   DWORD PTR ds:0x419b80
  40b5b7:	8d 4d 94             	lea    ecx,[ebp-0x6c]
  40b5ba:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40b5c0:	8d 4d ec             	lea    ecx,[ebp-0x14]
  40b5c3:	c6 45 fc 28          	mov    BYTE PTR [ebp-0x4],0x28
  40b5c7:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40b5cd:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
  40b5d0:	8b b0 90 00 00 00    	mov    esi,DWORD PTR [eax+0x90]
  40b5d6:	8b b8 8c 00 00 00    	mov    edi,DWORD PTR [eax+0x8c]
  40b5dc:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  40b5df:	89 45 84             	mov    DWORD PTR [ebp-0x7c],eax
  40b5e2:	8d 45 f0             	lea    eax,[ebp-0x10]
  40b5e5:	89 45 88             	mov    DWORD PTR [ebp-0x78],eax
  40b5e8:	3b fe                	cmp    edi,esi
  40b5ea:	74 4e                	je     0x40b63a
  40b5ec:	0f 1f 40 00          	nop    DWORD PTR [eax+0x0]
  40b5f0:	83 ec 18             	sub    esp,0x18
  40b5f3:	8b cc                	mov    ecx,esp
  40b5f5:	c7 41 10 00 00 00 00 	mov    DWORD PTR [ecx+0x10],0x0
  40b5fc:	c7 41 14 00 00 00 00 	mov    DWORD PTR [ecx+0x14],0x0
  40b603:	c7 41 14 07 00 00 00 	mov    DWORD PTR [ecx+0x14],0x7
  40b60a:	83 79 14 08          	cmp    DWORD PTR [ecx+0x14],0x8
  40b60e:	c7 41 10 00 00 00 00 	mov    DWORD PTR [ecx+0x10],0x0
  40b615:	72 04                	jb     0x40b61b
  40b617:	8b 01                	mov    eax,DWORD PTR [ecx]
  40b619:	eb 02                	jmp    0x40b61d
  40b61b:	8b c1                	mov    eax,ecx
  40b61d:	33 d2                	xor    edx,edx
  40b61f:	6a ff                	push   0xffffffff
  40b621:	52                   	push   edx
  40b622:	57                   	push   edi
  40b623:	66 89 10             	mov    WORD PTR [eax],dx
  40b626:	e8 85 97 ff ff       	call   0x404db0
  40b62b:	8d 4d 84             	lea    ecx,[ebp-0x7c]
  40b62e:	e8 bd 8a ff ff       	call   0x4040f0
  40b633:	83 c7 18             	add    edi,0x18
  40b636:	3b fe                	cmp    edi,esi
  40b638:	75 b6                	jne    0x40b5f0
  40b63a:	8b 45 98             	mov    eax,DWORD PTR [ebp-0x68]
  40b63d:	8d 8d 7c ff ff ff    	lea    ecx,[ebp-0x84]
  40b643:	51                   	push   ecx
  40b644:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
  40b647:	ff 70 64             	push   DWORD PTR [eax+0x64]
  40b64a:	ff 70 60             	push   DWORD PTR [eax+0x60]
  40b64d:	e8 fe 81 ff ff       	call   0x403850
  40b652:	8b 35 58 9b 41 00    	mov    esi,DWORD PTR ds:0x419b58
  40b658:	8d 45 f0             	lea    eax,[ebp-0x10]
  40b65b:	83 c4 0c             	add    esp,0xc
  40b65e:	8d 4d e8             	lea    ecx,[ebp-0x18]
  40b661:	50                   	push   eax
  40b662:	8d 45 9c             	lea    eax,[ebp-0x64]
  40b665:	50                   	push   eax
  40b666:	ff d6                	call   esi
  40b668:	8d 4d 9c             	lea    ecx,[ebp-0x64]
  40b66b:	ff 15 50 9b 41 00    	call   DWORD PTR ds:0x419b50
  40b671:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40b674:	c6 45 fc 24          	mov    BYTE PTR [ebp-0x4],0x24
  40b678:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  40b67e:	8b 4d a8             	mov    ecx,DWORD PTR [ebp-0x58]
  40b681:	8b 3d bc 9b 41 00    	mov    edi,DWORD PTR ds:0x419bbc
  40b687:	41                   	inc    ecx
  40b688:	89 4d a8             	mov    DWORD PTR [ebp-0x58],ecx
  40b68b:	3b 4d a4             	cmp    ecx,DWORD PTR [ebp-0x5c]
  40b68e:	0f 8c cc fc ff ff    	jl     0x40b360
  40b694:	6a 05                	push   0x5
  40b696:	68 6c 7b 45 00       	push   0x457b6c
  40b69b:	ff d3                	call   ebx
  40b69d:	83 c4 08             	add    esp,0x8
  40b6a0:	89 45 a4             	mov    DWORD PTR [ebp-0x5c],eax
  40b6a3:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
  40b6a6:	8d 45 a4             	lea    eax,[ebp-0x5c]
  40b6a9:	50                   	push   eax
  40b6aa:	8d 45 d4             	lea    eax,[ebp-0x2c]
  40b6ad:	c6 45 fc 34          	mov    BYTE PTR [ebp-0x4],0x34
  40b6b1:	50                   	push   eax
  40b6b2:	ff 15 74 9b 41 00    	call   DWORD PTR ds:0x419b74
  40b6b8:	8d 4d a4             	lea    ecx,[ebp-0x5c]
  40b6bb:	c6 45 fc 36          	mov    BYTE PTR [ebp-0x4],0x36
  40b6bf:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40b6c5:	8d 45 d4             	lea    eax,[ebp-0x2c]
  40b6c8:	50                   	push   eax
  40b6c9:	8d 45 90             	lea    eax,[ebp-0x70]
  40b6cc:	50                   	push   eax
  40b6cd:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  40b6d0:	ff d6                	call   esi
  40b6d2:	8d 4d 90             	lea    ecx,[ebp-0x70]
  40b6d5:	ff 15 50 9b 41 00    	call   DWORD PTR ds:0x419b50
  40b6db:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  40b6e1:	8b 35 04 91 41 00    	mov    esi,DWORD PTR ds:0x419104
  40b6e7:	8b 49 08             	mov    ecx,DWORD PTR [ecx+0x8]
  40b6ea:	ff d6                	call   esi
  40b6ec:	8b c8                	mov    ecx,eax
  40b6ee:	ff 15 58 91 41 00    	call   DWORD PTR ds:0x419158
  40b6f4:	8b c8                	mov    ecx,eax
  40b6f6:	33 c0                	xor    eax,eax
  40b6f8:	89 4d 94             	mov    DWORD PTR [ebp-0x6c],ecx
  40b6fb:	89 45 c0             	mov    DWORD PTR [ebp-0x40],eax
  40b6fe:	85 c9                	test   ecx,ecx
  40b700:	0f 8e 9a 01 00 00    	jle    0x40b8a0
  40b706:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  40b70c:	50                   	push   eax
  40b70d:	8b 49 08             	mov    ecx,DWORD PTR [ecx+0x8]
  40b710:	ff d6                	call   esi
  40b712:	8b c8                	mov    ecx,eax
  40b714:	ff 15 54 91 41 00    	call   DWORD PTR ds:0x419154
  40b71a:	6a 04                	push   0x4
  40b71c:	68 74 7b 45 00       	push   0x457b74
  40b721:	8b f0                	mov    esi,eax
  40b723:	ff d3                	call   ebx
  40b725:	83 c4 08             	add    esp,0x8
  40b728:	89 45 a8             	mov    DWORD PTR [ebp-0x58],eax
  40b72b:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
  40b72e:	8d 45 a8             	lea    eax,[ebp-0x58]
  40b731:	50                   	push   eax
  40b732:	8d 45 f0             	lea    eax,[ebp-0x10]
  40b735:	c6 45 fc 37          	mov    BYTE PTR [ebp-0x4],0x37
  40b739:	50                   	push   eax
  40b73a:	ff 15 74 9b 41 00    	call   DWORD PTR ds:0x419b74
  40b740:	8d 4d a8             	lea    ecx,[ebp-0x58]
  40b743:	c6 45 fc 39          	mov    BYTE PTR [ebp-0x4],0x39
  40b747:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40b74d:	6a 04                	push   0x4
  40b74f:	68 7c 7b 45 00       	push   0x457b7c
  40b754:	ff d3                	call   ebx
  40b756:	83 c4 08             	add    esp,0x8
  40b759:	89 45 ac             	mov    DWORD PTR [ebp-0x54],eax
  40b75c:	8b ce                	mov    ecx,esi
  40b75e:	c6 45 fc 3a          	mov    BYTE PTR [ebp-0x4],0x3a
  40b762:	ff 15 c8 90 41 00    	call   DWORD PTR ds:0x4190c8
  40b768:	8b c8                	mov    ecx,eax
  40b76a:	ff 15 90 90 41 00    	call   DWORD PTR ds:0x419090
  40b770:	6a 00                	push   0x0
  40b772:	50                   	push   eax
  40b773:	8d 45 ac             	lea    eax,[ebp-0x54]
  40b776:	50                   	push   eax
  40b777:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40b77a:	ff d7                	call   edi
  40b77c:	8d 4d ac             	lea    ecx,[ebp-0x54]
  40b77f:	c6 45 fc 39          	mov    BYTE PTR [ebp-0x4],0x39
  40b783:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40b789:	6a 04                	push   0x4
  40b78b:	68 84 7b 45 00       	push   0x457b84
  40b790:	ff d3                	call   ebx
  40b792:	83 c4 08             	add    esp,0x8
  40b795:	89 45 b0             	mov    DWORD PTR [ebp-0x50],eax
  40b798:	8b ce                	mov    ecx,esi
  40b79a:	c6 45 fc 3b          	mov    BYTE PTR [ebp-0x4],0x3b
  40b79e:	ff 15 cc 90 41 00    	call   DWORD PTR ds:0x4190cc
  40b7a4:	8b c8                	mov    ecx,eax
  40b7a6:	ff 15 90 90 41 00    	call   DWORD PTR ds:0x419090
  40b7ac:	6a 00                	push   0x0
  40b7ae:	50                   	push   eax
  40b7af:	8d 45 b0             	lea    eax,[ebp-0x50]
  40b7b2:	50                   	push   eax
  40b7b3:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40b7b6:	ff d7                	call   edi
  40b7b8:	8d 4d b0             	lea    ecx,[ebp-0x50]
  40b7bb:	c6 45 fc 39          	mov    BYTE PTR [ebp-0x4],0x39
  40b7bf:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40b7c5:	8b ce                	mov    ecx,esi
  40b7c7:	ff 15 d0 90 41 00    	call   DWORD PTR ds:0x4190d0
  40b7cd:	6a 04                	push   0x4
  40b7cf:	68 8c 7b 45 00       	push   0x457b8c
  40b7d4:	85 c0                	test   eax,eax
  40b7d6:	74 2d                	je     0x40b805
  40b7d8:	ff d3                	call   ebx
  40b7da:	83 c4 08             	add    esp,0x8
  40b7dd:	89 45 b4             	mov    DWORD PTR [ebp-0x4c],eax
  40b7e0:	8b ce                	mov    ecx,esi
  40b7e2:	c6 45 fc 3c          	mov    BYTE PTR [ebp-0x4],0x3c
  40b7e6:	ff 15 d0 90 41 00    	call   DWORD PTR ds:0x4190d0
  40b7ec:	8b c8                	mov    ecx,eax
  40b7ee:	ff 15 90 90 41 00    	call   DWORD PTR ds:0x419090
  40b7f4:	6a 00                	push   0x0
  40b7f6:	50                   	push   eax
  40b7f7:	8d 45 b4             	lea    eax,[ebp-0x4c]
  40b7fa:	50                   	push   eax
  40b7fb:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40b7fe:	ff d7                	call   edi
  40b800:	8d 4d b4             	lea    ecx,[ebp-0x4c]
  40b803:	eb 1c                	jmp    0x40b821
  40b805:	ff d3                	call   ebx
  40b807:	83 c4 08             	add    esp,0x8
  40b80a:	89 45 b8             	mov    DWORD PTR [ebp-0x48],eax
  40b80d:	6a 00                	push   0x0
  40b80f:	6a 00                	push   0x0
  40b811:	8d 45 b8             	lea    eax,[ebp-0x48]
  40b814:	c6 45 fc 3d          	mov    BYTE PTR [ebp-0x4],0x3d
  40b818:	50                   	push   eax
  40b819:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40b81c:	ff d7                	call   edi
  40b81e:	8d 4d b8             	lea    ecx,[ebp-0x48]
  40b821:	c6 45 fc 39          	mov    BYTE PTR [ebp-0x4],0x39
  40b825:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40b82b:	6a 04                	push   0x4
  40b82d:	68 34 7b 45 00       	push   0x457b34
  40b832:	ff d3                	call   ebx
  40b834:	83 c4 08             	add    esp,0x8
  40b837:	89 45 bc             	mov    DWORD PTR [ebp-0x44],eax
  40b83a:	8b ce                	mov    ecx,esi
  40b83c:	c6 45 fc 3e          	mov    BYTE PTR [ebp-0x4],0x3e
  40b840:	ff 15 d4 90 41 00    	call   DWORD PTR ds:0x4190d4
  40b846:	99                   	cdq
  40b847:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40b84a:	52                   	push   edx
  40b84b:	50                   	push   eax
  40b84c:	8d 45 bc             	lea    eax,[ebp-0x44]
  40b84f:	50                   	push   eax
  40b850:	ff 15 4c 9b 41 00    	call   DWORD PTR ds:0x419b4c
  40b856:	8d 4d bc             	lea    ecx,[ebp-0x44]
  40b859:	c6 45 fc 39          	mov    BYTE PTR [ebp-0x4],0x39
  40b85d:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40b863:	8d 45 f0             	lea    eax,[ebp-0x10]
  40b866:	50                   	push   eax
  40b867:	8d 45 90             	lea    eax,[ebp-0x70]
  40b86a:	50                   	push   eax
  40b86b:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  40b86e:	ff 15 58 9b 41 00    	call   DWORD PTR ds:0x419b58
  40b874:	8d 4d 90             	lea    ecx,[ebp-0x70]
  40b877:	ff 15 50 9b 41 00    	call   DWORD PTR ds:0x419b50
  40b87d:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40b880:	c6 45 fc 36          	mov    BYTE PTR [ebp-0x4],0x36
  40b884:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  40b88a:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
  40b88d:	8b 35 04 91 41 00    	mov    esi,DWORD PTR ds:0x419104
  40b893:	40                   	inc    eax
  40b894:	89 45 c0             	mov    DWORD PTR [ebp-0x40],eax
  40b897:	3b 45 94             	cmp    eax,DWORD PTR [ebp-0x6c]
  40b89a:	0f 8c 66 fe ff ff    	jl     0x40b706
  40b8a0:	6a 06                	push   0x6
  40b8a2:	68 94 7b 45 00       	push   0x457b94
  40b8a7:	ff d3                	call   ebx
  40b8a9:	83 c4 08             	add    esp,0x8
  40b8ac:	89 45 a8             	mov    DWORD PTR [ebp-0x58],eax
  40b8af:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
  40b8b2:	8d 45 a8             	lea    eax,[ebp-0x58]
  40b8b5:	50                   	push   eax
  40b8b6:	8d 45 d8             	lea    eax,[ebp-0x28]
  40b8b9:	c6 45 fc 3f          	mov    BYTE PTR [ebp-0x4],0x3f
  40b8bd:	50                   	push   eax
  40b8be:	ff 15 74 9b 41 00    	call   DWORD PTR ds:0x419b74
  40b8c4:	8d 4d a8             	lea    ecx,[ebp-0x58]
  40b8c7:	c6 45 fc 41          	mov    BYTE PTR [ebp-0x4],0x41
  40b8cb:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40b8d1:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  40b8d4:	8d 45 d8             	lea    eax,[ebp-0x28]
  40b8d7:	8b 1d 58 9b 41 00    	mov    ebx,DWORD PTR ds:0x419b58
  40b8dd:	50                   	push   eax
  40b8de:	8d 45 0c             	lea    eax,[ebp+0xc]
  40b8e1:	50                   	push   eax
  40b8e2:	ff d3                	call   ebx
  40b8e4:	8b 3d 50 9b 41 00    	mov    edi,DWORD PTR ds:0x419b50
  40b8ea:	8d 4d 0c             	lea    ecx,[ebp+0xc]
  40b8ed:	ff d7                	call   edi
  40b8ef:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  40b8f5:	33 f6                	xor    esi,esi
  40b8f7:	56                   	push   esi
  40b8f8:	8b 49 08             	mov    ecx,DWORD PTR [ecx+0x8]
  40b8fb:	ff 15 f8 90 41 00    	call   DWORD PTR ds:0x4190f8
  40b901:	8b c8                	mov    ecx,eax
  40b903:	ff 15 d8 90 41 00    	call   DWORD PTR ds:0x4190d8
  40b909:	85 c0                	test   eax,eax
  40b90b:	7e 6b                	jle    0x40b978
  40b90d:	0f 1f 00             	nop    DWORD PTR [eax]
  40b910:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  40b916:	56                   	push   esi
  40b917:	6a 00                	push   0x0
  40b919:	8b 49 08             	mov    ecx,DWORD PTR [ecx+0x8]
  40b91c:	ff 15 f8 90 41 00    	call   DWORD PTR ds:0x4190f8
  40b922:	8b c8                	mov    ecx,eax
  40b924:	ff 15 dc 90 41 00    	call   DWORD PTR ds:0x4190dc
  40b92a:	50                   	push   eax
  40b92b:	8d 45 0c             	lea    eax,[ebp+0xc]
  40b92e:	50                   	push   eax
  40b92f:	e8 0c e7 ff ff       	call   0x40a040
  40b934:	83 c4 08             	add    esp,0x8
  40b937:	8d 45 0c             	lea    eax,[ebp+0xc]
  40b93a:	c6 45 fc 42          	mov    BYTE PTR [ebp-0x4],0x42
  40b93e:	50                   	push   eax
  40b93f:	8d 45 90             	lea    eax,[ebp-0x70]
  40b942:	50                   	push   eax
  40b943:	8d 4d d8             	lea    ecx,[ebp-0x28]
  40b946:	ff d3                	call   ebx
  40b948:	8d 4d 90             	lea    ecx,[ebp-0x70]
  40b94b:	ff d7                	call   edi
  40b94d:	8d 4d 0c             	lea    ecx,[ebp+0xc]
  40b950:	c6 45 fc 41          	mov    BYTE PTR [ebp-0x4],0x41
  40b954:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  40b95a:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  40b960:	46                   	inc    esi
  40b961:	6a 00                	push   0x0
  40b963:	8b 49 08             	mov    ecx,DWORD PTR [ecx+0x8]
  40b966:	ff 15 f8 90 41 00    	call   DWORD PTR ds:0x4190f8
  40b96c:	8b c8                	mov    ecx,eax
  40b96e:	ff 15 d8 90 41 00    	call   DWORD PTR ds:0x4190d8
  40b974:	3b f0                	cmp    esi,eax
  40b976:	7c 98                	jl     0x40b910
  40b978:	8d 4d d8             	lea    ecx,[ebp-0x28]
  40b97b:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  40b981:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  40b984:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  40b98a:	8d 4d e8             	lea    ecx,[ebp-0x18]
  40b98d:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  40b993:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  40b996:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  40b99c:	8d 4d e0             	lea    ecx,[ebp-0x20]
  40b99f:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  40b9a5:	8d 4d dc             	lea    ecx,[ebp-0x24]
  40b9a8:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  40b9ae:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  40b9b1:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
  40b9b4:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  40b9bb:	59                   	pop    ecx
  40b9bc:	5f                   	pop    edi
  40b9bd:	5e                   	pop    esi
  40b9be:	5b                   	pop    ebx
  40b9bf:	8b e5                	mov    esp,ebp
  40b9c1:	5d                   	pop    ebp
  40b9c2:	c3                   	ret

===== PRIMARY MODEL READER: IS.exe 0x004071C0..0x00408BB6 =====

/mnt/data/IS2_original_binaries/IS.exe:     file format pei-i386


Disassembly of section .text:

004071c0 <.text+0x61c0>:
  4071c0:	55                   	push   ebp
  4071c1:	8b ec                	mov    ebp,esp
  4071c3:	6a ff                	push   0xffffffff
  4071c5:	68 45 6a 41 00       	push   0x416a45
  4071ca:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  4071d0:	50                   	push   eax
  4071d1:	81 ec 4c 01 00 00    	sub    esp,0x14c
  4071d7:	a1 cc 90 46 00       	mov    eax,ds:0x4690cc
  4071dc:	33 c5                	xor    eax,ebp
  4071de:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
  4071e1:	53                   	push   ebx
  4071e2:	56                   	push   esi
  4071e3:	57                   	push   edi
  4071e4:	50                   	push   eax
  4071e5:	8d 45 f4             	lea    eax,[ebp-0xc]
  4071e8:	64 a3 00 00 00 00    	mov    fs:0x0,eax
  4071ee:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  4071f1:	8b 75 0c             	mov    esi,DWORD PTR [ebp+0xc]
  4071f4:	8b 1d a8 93 41 00    	mov    ebx,DWORD PTR ds:0x4193a8
  4071fa:	6a 07                	push   0x7
  4071fc:	68 0c 7b 45 00       	push   0x457b0c
  407201:	89 b5 28 ff ff ff    	mov    DWORD PTR [ebp-0xd8],esi
  407207:	a3 b0 96 46 00       	mov    ds:0x4696b0,eax
  40720c:	ff d3                	call   ebx
  40720e:	83 c4 08             	add    esp,0x8
  407211:	89 45 9c             	mov    DWORD PTR [ebp-0x64],eax
  407214:	8d 45 9c             	lea    eax,[ebp-0x64]
  407217:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
  40721e:	50                   	push   eax
  40721f:	8d 85 38 ff ff ff    	lea    eax,[ebp-0xc8]
  407225:	8b ce                	mov    ecx,esi
  407227:	50                   	push   eax
  407228:	ff 15 8c 9b 41 00    	call   DWORD PTR ds:0x419b8c
  40722e:	8d 4d 9c             	lea    ecx,[ebp-0x64]
  407231:	c6 45 fc 02          	mov    BYTE PTR [ebp-0x4],0x2
  407235:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40723b:	8d 85 3c ff ff ff    	lea    eax,[ebp-0xc4]
  407241:	50                   	push   eax
  407242:	8d 8d 38 ff ff ff    	lea    ecx,[ebp-0xc8]
  407248:	ff 15 5c 9b 41 00    	call   DWORD PTR ds:0x419b5c
  40724e:	33 f6                	xor    esi,esi
  407250:	c6 45 fc 03          	mov    BYTE PTR [ebp-0x4],0x3
  407254:	8d 8d 3c ff ff ff    	lea    ecx,[ebp-0xc4]
  40725a:	89 75 a4             	mov    DWORD PTR [ebp-0x5c],esi
  40725d:	ff 15 70 9b 41 00    	call   DWORD PTR ds:0x419b70
  407263:	8b 3d 7c 9b 41 00    	mov    edi,DWORD PTR ds:0x419b7c
  407269:	85 c0                	test   eax,eax
  40726b:	0f 8e c8 01 00 00    	jle    0x407439
  407271:	56                   	push   esi
  407272:	8d 45 8c             	lea    eax,[ebp-0x74]
  407275:	50                   	push   eax
  407276:	8d 8d 3c ff ff ff    	lea    ecx,[ebp-0xc4]
  40727c:	ff 15 6c 9b 41 00    	call   DWORD PTR ds:0x419b6c
  407282:	8d 4d 88             	lea    ecx,[ebp-0x78]
  407285:	c6 45 fc 04          	mov    BYTE PTR [ebp-0x4],0x4
  407289:	51                   	push   ecx
  40728a:	8b c8                	mov    ecx,eax
  40728c:	ff 15 64 9b 41 00    	call   DWORD PTR ds:0x419b64
  407292:	8d 4d 8c             	lea    ecx,[ebp-0x74]
  407295:	c6 45 fc 06          	mov    BYTE PTR [ebp-0x4],0x6
  407299:	ff 15 50 9b 41 00    	call   DWORD PTR ds:0x419b50
  40729f:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  4072a5:	8b 49 08             	mov    ecx,DWORD PTR [ecx+0x8]
  4072a8:	ff 15 00 91 41 00    	call   DWORD PTR ds:0x419100
  4072ae:	8b c8                	mov    ecx,eax
  4072b0:	ff 15 64 91 41 00    	call   DWORD PTR ds:0x419164
  4072b6:	8b f0                	mov    esi,eax
  4072b8:	6a 02                	push   0x2
  4072ba:	68 c8 7a 45 00       	push   0x457ac8
  4072bf:	89 b5 6c ff ff ff    	mov    DWORD PTR [ebp-0x94],esi
  4072c5:	ff d3                	call   ebx
  4072c7:	83 c4 08             	add    esp,0x8
  4072ca:	89 45 9c             	mov    DWORD PTR [ebp-0x64],eax
  4072cd:	8d 8d 7c ff ff ff    	lea    ecx,[ebp-0x84]
  4072d3:	ff 15 d8 93 41 00    	call   DWORD PTR ds:0x4193d8
  4072d9:	50                   	push   eax
  4072da:	8d 45 9c             	lea    eax,[ebp-0x64]
  4072dd:	c6 45 fc 08          	mov    BYTE PTR [ebp-0x4],0x8
  4072e1:	50                   	push   eax
  4072e2:	8d 45 90             	lea    eax,[ebp-0x70]
  4072e5:	50                   	push   eax
  4072e6:	8d 4d 88             	lea    ecx,[ebp-0x78]
  4072e9:	ff d7                	call   edi
  4072eb:	8b 76 04             	mov    esi,DWORD PTR [esi+0x4]
  4072ee:	8b c8                	mov    ecx,eax
  4072f0:	6a 0a                	push   0xa
  4072f2:	6a 00                	push   0x0
  4072f4:	c6 45 fc 09          	mov    BYTE PTR [ebp-0x4],0x9
  4072f8:	ff 15 d0 92 41 00    	call   DWORD PTR ds:0x4192d0
  4072fe:	8d 4d 90             	lea    ecx,[ebp-0x70]
  407301:	89 46 04             	mov    DWORD PTR [esi+0x4],eax
  407304:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40730a:	8d 8d 7c ff ff ff    	lea    ecx,[ebp-0x84]
  407310:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  407316:	8d 4d 9c             	lea    ecx,[ebp-0x64]
  407319:	c6 45 fc 06          	mov    BYTE PTR [ebp-0x4],0x6
  40731d:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  407323:	6a 04                	push   0x4
  407325:	68 0c 7a 45 00       	push   0x457a0c
  40732a:	ff d3                	call   ebx
  40732c:	83 c4 08             	add    esp,0x8
  40732f:	89 45 84             	mov    DWORD PTR [ebp-0x7c],eax
  407332:	8d 8d 74 ff ff ff    	lea    ecx,[ebp-0x8c]
  407338:	ff 15 d8 93 41 00    	call   DWORD PTR ds:0x4193d8
  40733e:	50                   	push   eax
  40733f:	8d 45 84             	lea    eax,[ebp-0x7c]
  407342:	c6 45 fc 0b          	mov    BYTE PTR [ebp-0x4],0xb
  407346:	50                   	push   eax
  407347:	8d 85 70 ff ff ff    	lea    eax,[ebp-0x90]
  40734d:	50                   	push   eax
  40734e:	8d 4d 88             	lea    ecx,[ebp-0x78]
  407351:	ff d7                	call   edi
  407353:	8d 4d d8             	lea    ecx,[ebp-0x28]
  407356:	c6 45 fc 0c          	mov    BYTE PTR [ebp-0x4],0xc
  40735a:	51                   	push   ecx
  40735b:	8b c8                	mov    ecx,eax
  40735d:	ff 15 b4 92 41 00    	call   DWORD PTR ds:0x4192b4
  407363:	83 78 14 08          	cmp    DWORD PTR [eax+0x14],0x8
  407367:	c6 45 fc 0d          	mov    BYTE PTR [ebp-0x4],0xd
  40736b:	72 02                	jb     0x40736f
  40736d:	8b 00                	mov    eax,DWORD PTR [eax]
  40736f:	51                   	push   ecx
  407370:	8b cc                	mov    ecx,esp
  407372:	50                   	push   eax
  407373:	ff 15 80 90 41 00    	call   DWORD PTR ds:0x419080
  407379:	8b 8d 6c ff ff ff    	mov    ecx,DWORD PTR [ebp-0x94]
  40737f:	ff 15 5c 91 41 00    	call   DWORD PTR ds:0x41915c
  407385:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
  407388:	c6 45 fc 0c          	mov    BYTE PTR [ebp-0x4],0xc
  40738c:	83 f8 08             	cmp    eax,0x8
  40738f:	72 4b                	jb     0x4073dc
  407391:	8b 4d d8             	mov    ecx,DWORD PTR [ebp-0x28]
  407394:	40                   	inc    eax
  407395:	3d ff ff ff 7f       	cmp    eax,0x7fffffff
  40739a:	0f 87 da 08 00 00    	ja     0x407c7a
  4073a0:	03 c0                	add    eax,eax
  4073a2:	3d 00 10 00 00       	cmp    eax,0x1000
  4073a7:	72 2a                	jb     0x4073d3
  4073a9:	f6 c1 1f             	test   cl,0x1f
  4073ac:	0f 85 c8 08 00 00    	jne    0x407c7a
  4073b2:	8b 41 fc             	mov    eax,DWORD PTR [ecx-0x4]
  4073b5:	3b c1                	cmp    eax,ecx
  4073b7:	0f 83 bd 08 00 00    	jae    0x407c7a
  4073bd:	2b c8                	sub    ecx,eax
  4073bf:	83 f9 04             	cmp    ecx,0x4
  4073c2:	0f 82 b2 08 00 00    	jb     0x407c7a
  4073c8:	83 f9 23             	cmp    ecx,0x23
  4073cb:	0f 87 a9 08 00 00    	ja     0x407c7a
  4073d1:	8b c8                	mov    ecx,eax
  4073d3:	51                   	push   ecx
  4073d4:	e8 69 d6 00 00       	call   0x414a42
  4073d9:	83 c4 04             	add    esp,0x4
  4073dc:	33 c0                	xor    eax,eax
  4073de:	c7 45 ec 07 00 00 00 	mov    DWORD PTR [ebp-0x14],0x7
  4073e5:	8d 8d 70 ff ff ff    	lea    ecx,[ebp-0x90]
  4073eb:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
  4073f2:	66 89 45 d8          	mov    WORD PTR [ebp-0x28],ax
  4073f6:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  4073fc:	8d 8d 74 ff ff ff    	lea    ecx,[ebp-0x8c]
  407402:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  407408:	8d 4d 84             	lea    ecx,[ebp-0x7c]
  40740b:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  407411:	8d 4d 88             	lea    ecx,[ebp-0x78]
  407414:	c6 45 fc 03          	mov    BYTE PTR [ebp-0x4],0x3
  407418:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  40741e:	8b 75 a4             	mov    esi,DWORD PTR [ebp-0x5c]
  407421:	8d 8d 3c ff ff ff    	lea    ecx,[ebp-0xc4]
  407427:	46                   	inc    esi
  407428:	89 75 a4             	mov    DWORD PTR [ebp-0x5c],esi
  40742b:	ff 15 70 9b 41 00    	call   DWORD PTR ds:0x419b70
  407431:	3b f0                	cmp    esi,eax
  407433:	0f 8c 38 fe ff ff    	jl     0x407271
  407439:	6a 06                	push   0x6
  40743b:	68 dc 7a 45 00       	push   0x457adc
  407440:	ff d3                	call   ebx
  407442:	83 c4 08             	add    esp,0x8
  407445:	89 45 9c             	mov    DWORD PTR [ebp-0x64],eax
  407448:	8d 4d 90             	lea    ecx,[ebp-0x70]
  40744b:	ff 15 d8 93 41 00    	call   DWORD PTR ds:0x4193d8
  407451:	50                   	push   eax
  407452:	8d 45 9c             	lea    eax,[ebp-0x64]
  407455:	c6 45 fc 0f          	mov    BYTE PTR [ebp-0x4],0xf
  407459:	50                   	push   eax
  40745a:	8d 45 8c             	lea    eax,[ebp-0x74]
  40745d:	50                   	push   eax
  40745e:	8d 8d 38 ff ff ff    	lea    ecx,[ebp-0xc8]
  407464:	ff d7                	call   edi
  407466:	8b f8                	mov    edi,eax
  407468:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  40746e:	c6 45 fc 10          	mov    BYTE PTR [ebp-0x4],0x10
  407472:	8b 49 08             	mov    ecx,DWORD PTR [ecx+0x8]
  407475:	ff 15 00 91 41 00    	call   DWORD PTR ds:0x419100
  40747b:	6a 0a                	push   0xa
  40747d:	6a 00                	push   0x0
  40747f:	8b cf                	mov    ecx,edi
  407481:	8b 70 04             	mov    esi,DWORD PTR [eax+0x4]
  407484:	ff 15 d0 92 41 00    	call   DWORD PTR ds:0x4192d0
  40748a:	8d 4d 8c             	lea    ecx,[ebp-0x74]
  40748d:	89 46 0c             	mov    DWORD PTR [esi+0xc],eax
  407490:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  407496:	8d 4d 90             	lea    ecx,[ebp-0x70]
  407499:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40749f:	8d 4d 9c             	lea    ecx,[ebp-0x64]
  4074a2:	c6 45 fc 03          	mov    BYTE PTR [ebp-0x4],0x3
  4074a6:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  4074ac:	6a 06                	push   0x6
  4074ae:	68 d4 7a 45 00       	push   0x457ad4
  4074b3:	ff d3                	call   ebx
  4074b5:	83 c4 08             	add    esp,0x8
  4074b8:	89 45 9c             	mov    DWORD PTR [ebp-0x64],eax
  4074bb:	8b 8d 28 ff ff ff    	mov    ecx,DWORD PTR [ebp-0xd8]
  4074c1:	8d 45 9c             	lea    eax,[ebp-0x64]
  4074c4:	50                   	push   eax
  4074c5:	8d 85 fc fe ff ff    	lea    eax,[ebp-0x104]
  4074cb:	c6 45 fc 11          	mov    BYTE PTR [ebp-0x4],0x11
  4074cf:	50                   	push   eax
  4074d0:	a1 8c 9b 41 00       	mov    eax,ds:0x419b8c
  4074d5:	ff d0                	call   eax
  4074d7:	8d 4d 9c             	lea    ecx,[ebp-0x64]
  4074da:	c6 45 fc 13          	mov    BYTE PTR [ebp-0x4],0x13
  4074de:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  4074e4:	8d 85 40 ff ff ff    	lea    eax,[ebp-0xc0]
  4074ea:	50                   	push   eax
  4074eb:	8d 8d fc fe ff ff    	lea    ecx,[ebp-0x104]
  4074f1:	ff 15 5c 9b 41 00    	call   DWORD PTR ds:0x419b5c
  4074f7:	33 f6                	xor    esi,esi
  4074f9:	c6 45 fc 14          	mov    BYTE PTR [ebp-0x4],0x14
  4074fd:	8d 8d 40 ff ff ff    	lea    ecx,[ebp-0xc0]
  407503:	89 75 98             	mov    DWORD PTR [ebp-0x68],esi
  407506:	ff 15 70 9b 41 00    	call   DWORD PTR ds:0x419b70
  40750c:	8b 3d 7c 9b 41 00    	mov    edi,DWORD PTR ds:0x419b7c
  407512:	85 c0                	test   eax,eax
  407514:	0f 8e a0 04 00 00    	jle    0x4079ba
  40751a:	66 0f 1f 44 00 00    	nop    WORD PTR [eax+eax*1+0x0]
  407520:	56                   	push   esi
  407521:	8d 45 8c             	lea    eax,[ebp-0x74]
  407524:	50                   	push   eax
  407525:	8d 8d 40 ff ff ff    	lea    ecx,[ebp-0xc0]
  40752b:	ff 15 6c 9b 41 00    	call   DWORD PTR ds:0x419b6c
  407531:	8d 4d a0             	lea    ecx,[ebp-0x60]
  407534:	c6 45 fc 15          	mov    BYTE PTR [ebp-0x4],0x15
  407538:	51                   	push   ecx
  407539:	8b c8                	mov    ecx,eax
  40753b:	ff 15 64 9b 41 00    	call   DWORD PTR ds:0x419b64
  407541:	8d 4d 8c             	lea    ecx,[ebp-0x74]
  407544:	c6 45 fc 17          	mov    BYTE PTR [ebp-0x4],0x17
  407548:	ff 15 50 9b 41 00    	call   DWORD PTR ds:0x419b50
  40754e:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  407554:	8b 49 08             	mov    ecx,DWORD PTR [ecx+0x8]
  407557:	ff 15 fc 90 41 00    	call   DWORD PTR ds:0x4190fc
  40755d:	8b c8                	mov    ecx,eax
  40755f:	ff 15 18 91 41 00    	call   DWORD PTR ds:0x419118
  407565:	8b f0                	mov    esi,eax
  407567:	6a 05                	push   0x5
  407569:	68 e4 7a 45 00       	push   0x457ae4
  40756e:	89 75 a4             	mov    DWORD PTR [ebp-0x5c],esi
  407571:	ff d3                	call   ebx
  407573:	83 c4 08             	add    esp,0x8
  407576:	89 45 9c             	mov    DWORD PTR [ebp-0x64],eax
  407579:	8d 8d 7c ff ff ff    	lea    ecx,[ebp-0x84]
  40757f:	ff 15 d8 93 41 00    	call   DWORD PTR ds:0x4193d8
  407585:	50                   	push   eax
  407586:	8d 45 9c             	lea    eax,[ebp-0x64]
  407589:	c6 45 fc 19          	mov    BYTE PTR [ebp-0x4],0x19
  40758d:	50                   	push   eax
  40758e:	8d 45 90             	lea    eax,[ebp-0x70]
  407591:	50                   	push   eax
  407592:	8d 4d a0             	lea    ecx,[ebp-0x60]
  407595:	ff d7                	call   edi
  407597:	8b 76 04             	mov    esi,DWORD PTR [esi+0x4]
  40759a:	8b c8                	mov    ecx,eax
  40759c:	6a 0a                	push   0xa
  40759e:	6a 00                	push   0x0
  4075a0:	c6 45 fc 1a          	mov    BYTE PTR [ebp-0x4],0x1a
  4075a4:	ff 15 d0 92 41 00    	call   DWORD PTR ds:0x4192d0
  4075aa:	8d 4d 90             	lea    ecx,[ebp-0x70]
  4075ad:	89 46 40             	mov    DWORD PTR [esi+0x40],eax
  4075b0:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  4075b6:	8d 8d 7c ff ff ff    	lea    ecx,[ebp-0x84]
  4075bc:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  4075c2:	8d 4d 9c             	lea    ecx,[ebp-0x64]
  4075c5:	c6 45 fc 17          	mov    BYTE PTR [ebp-0x4],0x17
  4075c9:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  4075cf:	6a 06                	push   0x6
  4075d1:	68 ec 7a 45 00       	push   0x457aec
  4075d6:	ff d3                	call   ebx
  4075d8:	83 c4 08             	add    esp,0x8
  4075db:	89 45 88             	mov    DWORD PTR [ebp-0x78],eax
  4075de:	8d 8d 70 ff ff ff    	lea    ecx,[ebp-0x90]
  4075e4:	ff 15 d8 93 41 00    	call   DWORD PTR ds:0x4193d8
  4075ea:	50                   	push   eax
  4075eb:	8d 45 88             	lea    eax,[ebp-0x78]
  4075ee:	c6 45 fc 1c          	mov    BYTE PTR [ebp-0x4],0x1c
  4075f2:	50                   	push   eax
  4075f3:	8d 85 6c ff ff ff    	lea    eax,[ebp-0x94]
  4075f9:	50                   	push   eax
  4075fa:	8d 4d a0             	lea    ecx,[ebp-0x60]
  4075fd:	ff d7                	call   edi
  4075ff:	8b 75 a4             	mov    esi,DWORD PTR [ebp-0x5c]
  407602:	8b c8                	mov    ecx,eax
  407604:	6a 0a                	push   0xa
  407606:	6a 00                	push   0x0
  407608:	c6 45 fc 1d          	mov    BYTE PTR [ebp-0x4],0x1d
  40760c:	8b 76 04             	mov    esi,DWORD PTR [esi+0x4]
  40760f:	ff 15 d0 92 41 00    	call   DWORD PTR ds:0x4192d0
  407615:	89 46 44             	mov    DWORD PTR [esi+0x44],eax
  407618:	8d 8d 6c ff ff ff    	lea    ecx,[ebp-0x94]
  40761e:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  407624:	8d 8d 70 ff ff ff    	lea    ecx,[ebp-0x90]
  40762a:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  407630:	8d 4d 88             	lea    ecx,[ebp-0x78]
  407633:	c6 45 fc 17          	mov    BYTE PTR [ebp-0x4],0x17
  407637:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40763d:	6a 02                	push   0x2
  40763f:	68 c8 7a 45 00       	push   0x457ac8
  407644:	ff d3                	call   ebx
  407646:	83 c4 08             	add    esp,0x8
  407649:	89 45 84             	mov    DWORD PTR [ebp-0x7c],eax
  40764c:	8d 8d 50 ff ff ff    	lea    ecx,[ebp-0xb0]
  407652:	ff 15 d8 93 41 00    	call   DWORD PTR ds:0x4193d8
  407658:	50                   	push   eax
  407659:	8d 45 84             	lea    eax,[ebp-0x7c]
  40765c:	c6 45 fc 1f          	mov    BYTE PTR [ebp-0x4],0x1f
  407660:	50                   	push   eax
  407661:	8d 85 74 ff ff ff    	lea    eax,[ebp-0x8c]
  407667:	50                   	push   eax
  407668:	8d 4d a0             	lea    ecx,[ebp-0x60]
  40766b:	ff d7                	call   edi
  40766d:	8b 4d a4             	mov    ecx,DWORD PTR [ebp-0x5c]
  407670:	6a 0a                	push   0xa
  407672:	6a 00                	push   0x0
  407674:	c6 45 fc 20          	mov    BYTE PTR [ebp-0x4],0x20
  407678:	8b 71 04             	mov    esi,DWORD PTR [ecx+0x4]
  40767b:	8b c8                	mov    ecx,eax
  40767d:	ff 15 d0 92 41 00    	call   DWORD PTR ds:0x4192d0
  407683:	8d 8d 74 ff ff ff    	lea    ecx,[ebp-0x8c]
  407689:	89 46 04             	mov    DWORD PTR [esi+0x4],eax
  40768c:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  407692:	8d 8d 50 ff ff ff    	lea    ecx,[ebp-0xb0]
  407698:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40769e:	8d 4d 84             	lea    ecx,[ebp-0x7c]
  4076a1:	c6 45 fc 17          	mov    BYTE PTR [ebp-0x4],0x17
  4076a5:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  4076ab:	6a 04                	push   0x4
  4076ad:	68 0c 7a 45 00       	push   0x457a0c
  4076b2:	ff d3                	call   ebx
  4076b4:	83 c4 08             	add    esp,0x8
  4076b7:	89 45 94             	mov    DWORD PTR [ebp-0x6c],eax
  4076ba:	8d 8d 58 ff ff ff    	lea    ecx,[ebp-0xa8]
  4076c0:	ff 15 d8 93 41 00    	call   DWORD PTR ds:0x4193d8
  4076c6:	50                   	push   eax
  4076c7:	8d 45 94             	lea    eax,[ebp-0x6c]
  4076ca:	c6 45 fc 22          	mov    BYTE PTR [ebp-0x4],0x22
  4076ce:	50                   	push   eax
  4076cf:	8d 85 54 ff ff ff    	lea    eax,[ebp-0xac]
  4076d5:	50                   	push   eax
  4076d6:	8d 4d a0             	lea    ecx,[ebp-0x60]
  4076d9:	ff d7                	call   edi
  4076db:	8d 4d d8             	lea    ecx,[ebp-0x28]
  4076de:	c6 45 fc 23          	mov    BYTE PTR [ebp-0x4],0x23
  4076e2:	51                   	push   ecx
  4076e3:	8b c8                	mov    ecx,eax
  4076e5:	ff 15 b4 92 41 00    	call   DWORD PTR ds:0x4192b4
  4076eb:	83 78 14 08          	cmp    DWORD PTR [eax+0x14],0x8
  4076ef:	c6 45 fc 24          	mov    BYTE PTR [ebp-0x4],0x24
  4076f3:	72 02                	jb     0x4076f7
  4076f5:	8b 00                	mov    eax,DWORD PTR [eax]
  4076f7:	51                   	push   ecx
  4076f8:	8b cc                	mov    ecx,esp
  4076fa:	50                   	push   eax
  4076fb:	ff 15 80 90 41 00    	call   DWORD PTR ds:0x419080
  407701:	8b 75 a4             	mov    esi,DWORD PTR [ebp-0x5c]
  407704:	8b ce                	mov    ecx,esi
  407706:	ff 15 94 90 41 00    	call   DWORD PTR ds:0x419094
  40770c:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
  40770f:	c6 45 fc 23          	mov    BYTE PTR [ebp-0x4],0x23
  407713:	83 f8 08             	cmp    eax,0x8
  407716:	72 4b                	jb     0x407763
  407718:	8b 4d d8             	mov    ecx,DWORD PTR [ebp-0x28]
  40771b:	40                   	inc    eax
  40771c:	3d ff ff ff 7f       	cmp    eax,0x7fffffff
  407721:	0f 87 53 05 00 00    	ja     0x407c7a
  407727:	03 c0                	add    eax,eax
  407729:	3d 00 10 00 00       	cmp    eax,0x1000
  40772e:	72 2a                	jb     0x40775a
  407730:	f6 c1 1f             	test   cl,0x1f
  407733:	0f 85 41 05 00 00    	jne    0x407c7a
  407739:	8b 41 fc             	mov    eax,DWORD PTR [ecx-0x4]
  40773c:	3b c1                	cmp    eax,ecx
  40773e:	0f 83 36 05 00 00    	jae    0x407c7a
  407744:	2b c8                	sub    ecx,eax
  407746:	83 f9 04             	cmp    ecx,0x4
  407749:	0f 82 2b 05 00 00    	jb     0x407c7a
  40774f:	83 f9 23             	cmp    ecx,0x23
  407752:	0f 87 22 05 00 00    	ja     0x407c7a
  407758:	8b c8                	mov    ecx,eax
  40775a:	51                   	push   ecx
  40775b:	e8 e2 d2 00 00       	call   0x414a42
  407760:	83 c4 04             	add    esp,0x4
  407763:	33 c0                	xor    eax,eax
  407765:	c7 45 ec 07 00 00 00 	mov    DWORD PTR [ebp-0x14],0x7
  40776c:	8d 8d 54 ff ff ff    	lea    ecx,[ebp-0xac]
  407772:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
  407779:	66 89 45 d8          	mov    WORD PTR [ebp-0x28],ax
  40777d:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  407783:	8d 8d 58 ff ff ff    	lea    ecx,[ebp-0xa8]
  407789:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40778f:	8d 4d 94             	lea    ecx,[ebp-0x6c]
  407792:	c6 45 fc 17          	mov    BYTE PTR [ebp-0x4],0x17
  407796:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40779c:	6a 04                	push   0x4
  40779e:	68 f4 7a 45 00       	push   0x457af4
  4077a3:	ff d3                	call   ebx
  4077a5:	83 c4 08             	add    esp,0x8
  4077a8:	89 85 48 ff ff ff    	mov    DWORD PTR [ebp-0xb8],eax
  4077ae:	8d 8d 34 ff ff ff    	lea    ecx,[ebp-0xcc]
  4077b4:	ff 15 d8 93 41 00    	call   DWORD PTR ds:0x4193d8
  4077ba:	50                   	push   eax
  4077bb:	8d 85 48 ff ff ff    	lea    eax,[ebp-0xb8]
  4077c1:	c6 45 fc 26          	mov    BYTE PTR [ebp-0x4],0x26
  4077c5:	50                   	push   eax
  4077c6:	8d 85 5c ff ff ff    	lea    eax,[ebp-0xa4]
  4077cc:	50                   	push   eax
  4077cd:	8d 4d a0             	lea    ecx,[ebp-0x60]
  4077d0:	ff d7                	call   edi
  4077d2:	8d 4d d8             	lea    ecx,[ebp-0x28]
  4077d5:	c6 45 fc 27          	mov    BYTE PTR [ebp-0x4],0x27
  4077d9:	51                   	push   ecx
  4077da:	8b c8                	mov    ecx,eax
  4077dc:	ff 15 b4 92 41 00    	call   DWORD PTR ds:0x4192b4
  4077e2:	83 78 14 08          	cmp    DWORD PTR [eax+0x14],0x8
  4077e6:	c6 45 fc 28          	mov    BYTE PTR [ebp-0x4],0x28
  4077ea:	72 02                	jb     0x4077ee
  4077ec:	8b 00                	mov    eax,DWORD PTR [eax]
  4077ee:	51                   	push   ecx
  4077ef:	8b cc                	mov    ecx,esp
  4077f1:	50                   	push   eax
  4077f2:	ff 15 80 90 41 00    	call   DWORD PTR ds:0x419080
  4077f8:	8b ce                	mov    ecx,esi
  4077fa:	ff 15 2c 91 41 00    	call   DWORD PTR ds:0x41912c
  407800:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
  407803:	c6 45 fc 27          	mov    BYTE PTR [ebp-0x4],0x27
  407807:	83 f8 08             	cmp    eax,0x8
  40780a:	72 4b                	jb     0x407857
  40780c:	8b 4d d8             	mov    ecx,DWORD PTR [ebp-0x28]
  40780f:	40                   	inc    eax
  407810:	3d ff ff ff 7f       	cmp    eax,0x7fffffff
  407815:	0f 87 5f 04 00 00    	ja     0x407c7a
  40781b:	03 c0                	add    eax,eax
  40781d:	3d 00 10 00 00       	cmp    eax,0x1000
  407822:	72 2a                	jb     0x40784e
  407824:	f6 c1 1f             	test   cl,0x1f
  407827:	0f 85 4d 04 00 00    	jne    0x407c7a
  40782d:	8b 41 fc             	mov    eax,DWORD PTR [ecx-0x4]
  407830:	3b c1                	cmp    eax,ecx
  407832:	0f 83 42 04 00 00    	jae    0x407c7a
  407838:	2b c8                	sub    ecx,eax
  40783a:	83 f9 04             	cmp    ecx,0x4
  40783d:	0f 82 37 04 00 00    	jb     0x407c7a
  407843:	83 f9 23             	cmp    ecx,0x23
  407846:	0f 87 2e 04 00 00    	ja     0x407c7a
  40784c:	8b c8                	mov    ecx,eax
  40784e:	51                   	push   ecx
  40784f:	e8 ee d1 00 00       	call   0x414a42
  407854:	83 c4 04             	add    esp,0x4
  407857:	33 c0                	xor    eax,eax
  407859:	c7 45 ec 07 00 00 00 	mov    DWORD PTR [ebp-0x14],0x7
  407860:	8d 8d 5c ff ff ff    	lea    ecx,[ebp-0xa4]
  407866:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
  40786d:	66 89 45 d8          	mov    WORD PTR [ebp-0x28],ax
  407871:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  407877:	8d 8d 34 ff ff ff    	lea    ecx,[ebp-0xcc]
  40787d:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  407883:	8d 8d 48 ff ff ff    	lea    ecx,[ebp-0xb8]
  407889:	c6 45 fc 17          	mov    BYTE PTR [ebp-0x4],0x17
  40788d:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  407893:	6a 01                	push   0x1
  407895:	68 08 7b 45 00       	push   0x457b08
  40789a:	ff d3                	call   ebx
  40789c:	83 c4 08             	add    esp,0x8
  40789f:	89 85 4c ff ff ff    	mov    DWORD PTR [ebp-0xb4],eax
  4078a5:	8d 8d 2c ff ff ff    	lea    ecx,[ebp-0xd4]
  4078ab:	ff 15 d8 93 41 00    	call   DWORD PTR ds:0x4193d8
  4078b1:	50                   	push   eax
  4078b2:	8d 85 4c ff ff ff    	lea    eax,[ebp-0xb4]
  4078b8:	c6 45 fc 2a          	mov    BYTE PTR [ebp-0x4],0x2a
  4078bc:	50                   	push   eax
  4078bd:	8d 85 30 ff ff ff    	lea    eax,[ebp-0xd0]
  4078c3:	50                   	push   eax
  4078c4:	8d 4d a0             	lea    ecx,[ebp-0x60]
  4078c7:	ff d7                	call   edi
  4078c9:	8b 76 04             	mov    esi,DWORD PTR [esi+0x4]
  4078cc:	8b c8                	mov    ecx,eax
  4078ce:	6a 0a                	push   0xa
  4078d0:	6a 00                	push   0x0
  4078d2:	c6 45 fc 2b          	mov    BYTE PTR [ebp-0x4],0x2b
  4078d6:	ff 15 cc 92 41 00    	call   DWORD PTR ds:0x4192cc
  4078dc:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  4078e2:	50                   	push   eax
  4078e3:	8b 49 08             	mov    ecx,DWORD PTR [ecx+0x8]
  4078e6:	ff 15 00 91 41 00    	call   DWORD PTR ds:0x419100
  4078ec:	8b c8                	mov    ecx,eax
  4078ee:	ff 15 6c 91 41 00    	call   DWORD PTR ds:0x41916c
  4078f4:	8d 8d 30 ff ff ff    	lea    ecx,[ebp-0xd0]
  4078fa:	89 46 4c             	mov    DWORD PTR [esi+0x4c],eax
  4078fd:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  407903:	8d 8d 2c ff ff ff    	lea    ecx,[ebp-0xd4]
  407909:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40790f:	8d 8d 4c ff ff ff    	lea    ecx,[ebp-0xb4]
  407915:	c6 45 fc 17          	mov    BYTE PTR [ebp-0x4],0x17
  407919:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40791f:	6a 0a                	push   0xa
  407921:	68 fc 7a 45 00       	push   0x457afc
  407926:	ff d3                	call   ebx
  407928:	83 c4 08             	add    esp,0x8
  40792b:	89 85 64 ff ff ff    	mov    DWORD PTR [ebp-0x9c],eax
  407931:	8d 8d 60 ff ff ff    	lea    ecx,[ebp-0xa0]
  407937:	ff 15 d8 93 41 00    	call   DWORD PTR ds:0x4193d8
  40793d:	50                   	push   eax
  40793e:	8d 85 64 ff ff ff    	lea    eax,[ebp-0x9c]
  407944:	c6 45 fc 2d          	mov    BYTE PTR [ebp-0x4],0x2d
  407948:	50                   	push   eax
  407949:	8d 85 78 ff ff ff    	lea    eax,[ebp-0x88]
  40794f:	50                   	push   eax
  407950:	8d 4d a0             	lea    ecx,[ebp-0x60]
  407953:	ff d7                	call   edi
  407955:	8b 4d a4             	mov    ecx,DWORD PTR [ebp-0x5c]
  407958:	6a 0a                	push   0xa
  40795a:	6a 00                	push   0x0
  40795c:	c6 45 fc 2e          	mov    BYTE PTR [ebp-0x4],0x2e
  407960:	8b 71 04             	mov    esi,DWORD PTR [ecx+0x4]
  407963:	8b c8                	mov    ecx,eax
  407965:	ff 15 d0 92 41 00    	call   DWORD PTR ds:0x4192d0
  40796b:	8d 8d 78 ff ff ff    	lea    ecx,[ebp-0x88]
  407971:	89 46 3c             	mov    DWORD PTR [esi+0x3c],eax
  407974:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40797a:	8d 8d 60 ff ff ff    	lea    ecx,[ebp-0xa0]
  407980:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  407986:	8d 8d 64 ff ff ff    	lea    ecx,[ebp-0x9c]
  40798c:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  407992:	8d 4d a0             	lea    ecx,[ebp-0x60]
  407995:	c6 45 fc 14          	mov    BYTE PTR [ebp-0x4],0x14
  407999:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  40799f:	8b 75 98             	mov    esi,DWORD PTR [ebp-0x68]
  4079a2:	8d 8d 40 ff ff ff    	lea    ecx,[ebp-0xc0]
  4079a8:	46                   	inc    esi
  4079a9:	89 75 98             	mov    DWORD PTR [ebp-0x68],esi
  4079ac:	ff 15 70 9b 41 00    	call   DWORD PTR ds:0x419b70
  4079b2:	3b f0                	cmp    esi,eax
  4079b4:	0f 8c 66 fb ff ff    	jl     0x407520
  4079ba:	6a 06                	push   0x6
  4079bc:	68 dc 7a 45 00       	push   0x457adc
  4079c1:	ff d3                	call   ebx
  4079c3:	83 c4 08             	add    esp,0x8
  4079c6:	89 45 98             	mov    DWORD PTR [ebp-0x68],eax
  4079c9:	8d 8d 78 ff ff ff    	lea    ecx,[ebp-0x88]
  4079cf:	ff 15 d8 93 41 00    	call   DWORD PTR ds:0x4193d8
  4079d5:	50                   	push   eax
  4079d6:	8d 45 98             	lea    eax,[ebp-0x68]
  4079d9:	c6 45 fc 30          	mov    BYTE PTR [ebp-0x4],0x30
  4079dd:	50                   	push   eax
  4079de:	8d 85 60 ff ff ff    	lea    eax,[ebp-0xa0]
  4079e4:	50                   	push   eax
  4079e5:	8d 8d fc fe ff ff    	lea    ecx,[ebp-0x104]
  4079eb:	ff d7                	call   edi
  4079ed:	8b f8                	mov    edi,eax
  4079ef:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  4079f5:	c6 45 fc 31          	mov    BYTE PTR [ebp-0x4],0x31
  4079f9:	8b 49 08             	mov    ecx,DWORD PTR [ecx+0x8]
  4079fc:	ff 15 fc 90 41 00    	call   DWORD PTR ds:0x4190fc
  407a02:	6a 0a                	push   0xa
  407a04:	6a 00                	push   0x0
  407a06:	8b cf                	mov    ecx,edi
  407a08:	8b 70 04             	mov    esi,DWORD PTR [eax+0x4]
  407a0b:	ff 15 d0 92 41 00    	call   DWORD PTR ds:0x4192d0
  407a11:	8d 8d 60 ff ff ff    	lea    ecx,[ebp-0xa0]
  407a17:	89 46 0c             	mov    DWORD PTR [esi+0xc],eax
  407a1a:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  407a20:	8d 8d 78 ff ff ff    	lea    ecx,[ebp-0x88]
  407a26:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  407a2c:	8d 4d 98             	lea    ecx,[ebp-0x68]
  407a2f:	c6 45 fc 14          	mov    BYTE PTR [ebp-0x4],0x14
  407a33:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  407a39:	6a 03                	push   0x3
  407a3b:	68 1c 7b 45 00       	push   0x457b1c
  407a40:	ff d3                	call   ebx
  407a42:	83 c4 08             	add    esp,0x8
  407a45:	89 45 98             	mov    DWORD PTR [ebp-0x68],eax
  407a48:	8b 8d 28 ff ff ff    	mov    ecx,DWORD PTR [ebp-0xd8]
  407a4e:	8d 45 98             	lea    eax,[ebp-0x68]
  407a51:	8b 35 8c 9b 41 00    	mov    esi,DWORD PTR ds:0x419b8c
  407a57:	50                   	push   eax
  407a58:	8d 85 00 ff ff ff    	lea    eax,[ebp-0x100]
  407a5e:	c6 45 fc 32          	mov    BYTE PTR [ebp-0x4],0x32
  407a62:	50                   	push   eax
  407a63:	ff d6                	call   esi
  407a65:	8d 4d 98             	lea    ecx,[ebp-0x68]
  407a68:	c6 45 fc 34          	mov    BYTE PTR [ebp-0x4],0x34
  407a6c:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  407a72:	6a 07                	push   0x7
  407a74:	68 20 7b 45 00       	push   0x457b20
  407a79:	ff d3                	call   ebx
  407a7b:	83 c4 08             	add    esp,0x8
  407a7e:	89 85 64 ff ff ff    	mov    DWORD PTR [ebp-0x9c],eax
  407a84:	8d 85 64 ff ff ff    	lea    eax,[ebp-0x9c]
  407a8a:	c6 45 fc 35          	mov    BYTE PTR [ebp-0x4],0x35
  407a8e:	50                   	push   eax
  407a8f:	8d 85 04 ff ff ff    	lea    eax,[ebp-0xfc]
  407a95:	50                   	push   eax
  407a96:	8d 8d 00 ff ff ff    	lea    ecx,[ebp-0x100]
  407a9c:	ff d6                	call   esi
  407a9e:	8d 8d 64 ff ff ff    	lea    ecx,[ebp-0x9c]
  407aa4:	c6 45 fc 37          	mov    BYTE PTR [ebp-0x4],0x37
  407aa8:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  407aae:	8d 85 68 ff ff ff    	lea    eax,[ebp-0x98]
  407ab4:	50                   	push   eax
  407ab5:	8d 8d 04 ff ff ff    	lea    ecx,[ebp-0xfc]
  407abb:	ff 15 5c 9b 41 00    	call   DWORD PTR ds:0x419b5c
  407ac1:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  407ac7:	c6 45 fc 38          	mov    BYTE PTR [ebp-0x4],0x38
  407acb:	8b 49 08             	mov    ecx,DWORD PTR [ecx+0x8]
  407ace:	8b 35 04 91 41 00    	mov    esi,DWORD PTR ds:0x419104
  407ad4:	ff d6                	call   esi
  407ad6:	8b c8                	mov    ecx,eax
  407ad8:	ff 15 40 91 41 00    	call   DWORD PTR ds:0x419140
  407ade:	6a 06                	push   0x6
  407ae0:	68 28 7b 45 00       	push   0x457b28
  407ae5:	ff d3                	call   ebx
  407ae7:	83 c4 08             	add    esp,0x8
  407aea:	89 45 98             	mov    DWORD PTR [ebp-0x68],eax
  407aed:	8d 8d 78 ff ff ff    	lea    ecx,[ebp-0x88]
  407af3:	ff 15 d8 93 41 00    	call   DWORD PTR ds:0x4193d8
  407af9:	50                   	push   eax
  407afa:	8d 45 98             	lea    eax,[ebp-0x68]
  407afd:	c6 45 fc 3a          	mov    BYTE PTR [ebp-0x4],0x3a
  407b01:	50                   	push   eax
  407b02:	8d 85 60 ff ff ff    	lea    eax,[ebp-0xa0]
  407b08:	50                   	push   eax
  407b09:	a1 7c 9b 41 00       	mov    eax,ds:0x419b7c
  407b0e:	8d 8d 04 ff ff ff    	lea    ecx,[ebp-0xfc]
  407b14:	ff d0                	call   eax
  407b16:	8b f8                	mov    edi,eax
  407b18:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  407b1e:	c6 45 fc 3b          	mov    BYTE PTR [ebp-0x4],0x3b
  407b22:	8b 49 08             	mov    ecx,DWORD PTR [ecx+0x8]
  407b25:	ff d6                	call   esi
  407b27:	6a 0a                	push   0xa
  407b29:	6a 00                	push   0x0
  407b2b:	8b cf                	mov    ecx,edi
  407b2d:	8b 70 0c             	mov    esi,DWORD PTR [eax+0xc]
  407b30:	ff 15 d0 92 41 00    	call   DWORD PTR ds:0x4192d0
  407b36:	8d 8d 60 ff ff ff    	lea    ecx,[ebp-0xa0]
  407b3c:	89 46 24             	mov    DWORD PTR [esi+0x24],eax
  407b3f:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  407b45:	8d 8d 78 ff ff ff    	lea    ecx,[ebp-0x88]
  407b4b:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  407b51:	8d 4d 98             	lea    ecx,[ebp-0x68]
  407b54:	c6 45 fc 38          	mov    BYTE PTR [ebp-0x4],0x38
  407b58:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  407b5e:	33 f6                	xor    esi,esi
  407b60:	8d 8d 68 ff ff ff    	lea    ecx,[ebp-0x98]
  407b66:	89 75 8c             	mov    DWORD PTR [ebp-0x74],esi
  407b69:	ff 15 70 9b 41 00    	call   DWORD PTR ds:0x419b70
  407b6f:	85 c0                	test   eax,eax
  407b71:	0f 8e ef 0a 00 00    	jle    0x408666
  407b77:	56                   	push   esi
  407b78:	8d 85 60 ff ff ff    	lea    eax,[ebp-0xa0]
  407b7e:	50                   	push   eax
  407b7f:	8d 8d 68 ff ff ff    	lea    ecx,[ebp-0x98]
  407b85:	ff 15 6c 9b 41 00    	call   DWORD PTR ds:0x419b6c
  407b8b:	8d 4d a0             	lea    ecx,[ebp-0x60]
  407b8e:	c6 45 fc 3c          	mov    BYTE PTR [ebp-0x4],0x3c
  407b92:	51                   	push   ecx
  407b93:	8b c8                	mov    ecx,eax
  407b95:	ff 15 64 9b 41 00    	call   DWORD PTR ds:0x419b64
  407b9b:	8d 8d 60 ff ff ff    	lea    ecx,[ebp-0xa0]
  407ba1:	c6 45 fc 3e          	mov    BYTE PTR [ebp-0x4],0x3e
  407ba5:	ff 15 50 9b 41 00    	call   DWORD PTR ds:0x419b50
  407bab:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  407bb1:	8b 35 04 91 41 00    	mov    esi,DWORD PTR ds:0x419104
  407bb7:	8b 49 08             	mov    ecx,DWORD PTR [ecx+0x8]
  407bba:	ff d6                	call   esi
  407bbc:	8b c8                	mov    ecx,eax
  407bbe:	8b 10                	mov    edx,DWORD PTR [eax]
  407bc0:	ff 52 04             	call   DWORD PTR [edx+0x4]
  407bc3:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  407bc9:	8b f8                	mov    edi,eax
  407bcb:	89 7d 94             	mov    DWORD PTR [ebp-0x6c],edi
  407bce:	8b 49 08             	mov    ecx,DWORD PTR [ecx+0x8]
  407bd1:	ff d6                	call   esi
  407bd3:	8b 70 0c             	mov    esi,DWORD PTR [eax+0xc]
  407bd6:	8d 45 94             	lea    eax,[ebp-0x6c]
  407bd9:	3b 46 08             	cmp    eax,DWORD PTR [esi+0x8]
  407bdc:	0f 83 9e 00 00 00    	jae    0x407c80
  407be2:	8b 56 04             	mov    edx,DWORD PTR [esi+0x4]
  407be5:	3b d0                	cmp    edx,eax
  407be7:	0f 87 93 00 00 00    	ja     0x407c80
  407bed:	2b c2                	sub    eax,edx
  407bef:	c1 f8 02             	sar    eax,0x2
  407bf2:	89 85 78 ff ff ff    	mov    DWORD PTR [ebp-0x88],eax
  407bf8:	8b 46 08             	mov    eax,DWORD PTR [esi+0x8]
  407bfb:	3b 46 0c             	cmp    eax,DWORD PTR [esi+0xc]
  407bfe:	75 5f                	jne    0x407c5f
  407c00:	8b 46 0c             	mov    eax,DWORD PTR [esi+0xc]
  407c03:	2b 46 08             	sub    eax,DWORD PTR [esi+0x8]
  407c06:	c1 f8 02             	sar    eax,0x2
  407c09:	83 f8 01             	cmp    eax,0x1
  407c0c:	73 51                	jae    0x407c5f
  407c0e:	8b 4e 08             	mov    ecx,DWORD PTR [esi+0x8]
  407c11:	b8 ff ff ff 3f       	mov    eax,0x3fffffff
  407c16:	2b ca                	sub    ecx,edx
  407c18:	c1 f9 02             	sar    ecx,0x2
  407c1b:	2b c1                	sub    eax,ecx
  407c1d:	83 f8 01             	cmp    eax,0x1
  407c20:	0f 82 35 0a 00 00    	jb     0x40865b
  407c26:	8b 7e 0c             	mov    edi,DWORD PTR [esi+0xc]
  407c29:	b9 ff ff ff 3f       	mov    ecx,0x3fffffff
  407c2e:	8b 5e 08             	mov    ebx,DWORD PTR [esi+0x8]
  407c31:	2b fa                	sub    edi,edx
  407c33:	2b da                	sub    ebx,edx
  407c35:	c1 ff 02             	sar    edi,0x2
  407c38:	c1 fb 02             	sar    ebx,0x2
  407c3b:	8b c7                	mov    eax,edi
  407c3d:	d1 e8                	shr    eax,1
  407c3f:	43                   	inc    ebx
  407c40:	2b c8                	sub    ecx,eax
  407c42:	33 d2                	xor    edx,edx
  407c44:	03 c7                	add    eax,edi
  407c46:	3b cf                	cmp    ecx,edi
  407c48:	8d 4e 04             	lea    ecx,[esi+0x4]
  407c4b:	0f 43 d0             	cmovae edx,eax
  407c4e:	3b d3                	cmp    edx,ebx
  407c50:	0f 43 da             	cmovae ebx,edx
  407c53:	53                   	push   ebx
  407c54:	e8 07 cc ff ff       	call   0x404860
  407c59:	8b 1d a8 93 41 00    	mov    ebx,DWORD PTR ds:0x4193a8
  407c5f:	8b 56 08             	mov    edx,DWORD PTR [esi+0x8]
  407c62:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
  407c65:	8b 8d 78 ff ff ff    	mov    ecx,DWORD PTR [ebp-0x88]
  407c6b:	85 d2                	test   edx,edx
  407c6d:	0f 84 83 00 00 00    	je     0x407cf6
  407c73:	8b 04 88             	mov    eax,DWORD PTR [eax+ecx*4]
  407c76:	89 02                	mov    DWORD PTR [edx],eax
  407c78:	eb 7c                	jmp    0x407cf6
  407c7a:	ff 15 90 9c 41 00    	call   DWORD PTR ds:0x419c90
  407c80:	8b 46 08             	mov    eax,DWORD PTR [esi+0x8]
  407c83:	3b 46 0c             	cmp    eax,DWORD PTR [esi+0xc]
  407c86:	75 65                	jne    0x407ced
  407c88:	8b 46 0c             	mov    eax,DWORD PTR [esi+0xc]
  407c8b:	2b 46 08             	sub    eax,DWORD PTR [esi+0x8]
  407c8e:	c1 f8 02             	sar    eax,0x2
  407c91:	83 f8 01             	cmp    eax,0x1
  407c94:	73 57                	jae    0x407ced
  407c96:	8b 4e 08             	mov    ecx,DWORD PTR [esi+0x8]
  407c99:	b8 ff ff ff 3f       	mov    eax,0x3fffffff
  407c9e:	8b 56 04             	mov    edx,DWORD PTR [esi+0x4]
  407ca1:	2b ca                	sub    ecx,edx
  407ca3:	c1 f9 02             	sar    ecx,0x2
  407ca6:	2b c1                	sub    eax,ecx
  407ca8:	83 f8 01             	cmp    eax,0x1
  407cab:	0f 82 aa 09 00 00    	jb     0x40865b
  407cb1:	8b 7e 0c             	mov    edi,DWORD PTR [esi+0xc]
  407cb4:	b9 ff ff ff 3f       	mov    ecx,0x3fffffff
  407cb9:	8b 5e 08             	mov    ebx,DWORD PTR [esi+0x8]
  407cbc:	2b fa                	sub    edi,edx
  407cbe:	2b da                	sub    ebx,edx
  407cc0:	c1 ff 02             	sar    edi,0x2
  407cc3:	c1 fb 02             	sar    ebx,0x2
  407cc6:	8b c7                	mov    eax,edi
  407cc8:	d1 e8                	shr    eax,1
  407cca:	43                   	inc    ebx
  407ccb:	2b c8                	sub    ecx,eax
  407ccd:	33 d2                	xor    edx,edx
  407ccf:	03 c7                	add    eax,edi
  407cd1:	3b cf                	cmp    ecx,edi
  407cd3:	8d 4e 04             	lea    ecx,[esi+0x4]
  407cd6:	0f 43 d0             	cmovae edx,eax
  407cd9:	3b d3                	cmp    edx,ebx
  407cdb:	0f 43 da             	cmovae ebx,edx
  407cde:	53                   	push   ebx
  407cdf:	e8 7c cb ff ff       	call   0x404860
  407ce4:	8b 1d a8 93 41 00    	mov    ebx,DWORD PTR ds:0x4193a8
  407cea:	8b 7d 94             	mov    edi,DWORD PTR [ebp-0x6c]
  407ced:	8b 46 08             	mov    eax,DWORD PTR [esi+0x8]
  407cf0:	85 c0                	test   eax,eax
  407cf2:	74 02                	je     0x407cf6
  407cf4:	89 38                	mov    DWORD PTR [eax],edi
  407cf6:	83 46 08 04          	add    DWORD PTR [esi+0x8],0x4
  407cfa:	6a 04                	push   0x4
  407cfc:	68 0c 7a 45 00       	push   0x457a0c
  407d01:	ff d3                	call   ebx
  407d03:	83 c4 08             	add    esp,0x8
  407d06:	89 45 98             	mov    DWORD PTR [ebp-0x68],eax
  407d09:	8d 8d 30 ff ff ff    	lea    ecx,[ebp-0xd0]
  407d0f:	ff 15 d8 93 41 00    	call   DWORD PTR ds:0x4193d8
  407d15:	8b 3d 7c 9b 41 00    	mov    edi,DWORD PTR ds:0x419b7c
  407d1b:	8d 4d a0             	lea    ecx,[ebp-0x60]
  407d1e:	50                   	push   eax
  407d1f:	8d 45 98             	lea    eax,[ebp-0x68]
  407d22:	c6 45 fc 40          	mov    BYTE PTR [ebp-0x4],0x40
  407d26:	50                   	push   eax
  407d27:	8d 85 2c ff ff ff    	lea    eax,[ebp-0xd4]
  407d2d:	50                   	push   eax
  407d2e:	ff d7                	call   edi
  407d30:	8d 4d a8             	lea    ecx,[ebp-0x58]
  407d33:	c6 45 fc 41          	mov    BYTE PTR [ebp-0x4],0x41
  407d37:	51                   	push   ecx
  407d38:	8b c8                	mov    ecx,eax
  407d3a:	ff 15 b8 92 41 00    	call   DWORD PTR ds:0x4192b8
  407d40:	8b d0                	mov    edx,eax
  407d42:	83 7a 14 10          	cmp    DWORD PTR [edx+0x14],0x10
  407d46:	c6 45 fc 42          	mov    BYTE PTR [ebp-0x4],0x42
  407d4a:	72 02                	jb     0x407d4e
  407d4c:	8b 12                	mov    edx,DWORD PTR [edx]
  407d4e:	85 d2                	test   edx,edx
  407d50:	74 10                	je     0x407d62
  407d52:	8b ca                	mov    ecx,edx
  407d54:	8d 71 01             	lea    esi,[ecx+0x1]
  407d57:	8a 01                	mov    al,BYTE PTR [ecx]
  407d59:	41                   	inc    ecx
  407d5a:	84 c0                	test   al,al
  407d5c:	75 f9                	jne    0x407d57
  407d5e:	2b ce                	sub    ecx,esi
  407d60:	eb 03                	jmp    0x407d65
  407d62:	83 c9 ff             	or     ecx,0xffffffff
  407d65:	51                   	push   ecx
  407d66:	52                   	push   edx
  407d67:	ff d3                	call   ebx
  407d69:	83 c4 08             	add    esp,0x8
  407d6c:	89 45 88             	mov    DWORD PTR [ebp-0x78],eax
  407d6f:	8b 45 bc             	mov    eax,DWORD PTR [ebp-0x44]
  407d72:	c6 45 fc 44          	mov    BYTE PTR [ebp-0x4],0x44
  407d76:	83 f8 10             	cmp    eax,0x10
  407d79:	72 3e                	jb     0x407db9
  407d7b:	8b 4d a8             	mov    ecx,DWORD PTR [ebp-0x58]
  407d7e:	40                   	inc    eax
  407d7f:	3d 00 10 00 00       	cmp    eax,0x1000
  407d84:	72 2a                	jb     0x407db0
  407d86:	f6 c1 1f             	test   cl,0x1f
  407d89:	0f 85 eb fe ff ff    	jne    0x407c7a
  407d8f:	8b 41 fc             	mov    eax,DWORD PTR [ecx-0x4]
  407d92:	3b c1                	cmp    eax,ecx
  407d94:	0f 83 e0 fe ff ff    	jae    0x407c7a
  407d9a:	2b c8                	sub    ecx,eax
  407d9c:	83 f9 04             	cmp    ecx,0x4
  407d9f:	0f 82 d5 fe ff ff    	jb     0x407c7a
  407da5:	83 f9 23             	cmp    ecx,0x23
  407da8:	0f 87 cc fe ff ff    	ja     0x407c7a
  407dae:	8b c8                	mov    ecx,eax
  407db0:	51                   	push   ecx
  407db1:	e8 8c cc 00 00       	call   0x414a42
  407db6:	83 c4 04             	add    esp,0x4
  407db9:	c7 45 bc 0f 00 00 00 	mov    DWORD PTR [ebp-0x44],0xf
  407dc0:	c7 45 b8 00 00 00 00 	mov    DWORD PTR [ebp-0x48],0x0
  407dc7:	c6 45 a8 00          	mov    BYTE PTR [ebp-0x58],0x0
  407dcb:	8d 8d 2c ff ff ff    	lea    ecx,[ebp-0xd4]
  407dd1:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  407dd7:	8d 8d 30 ff ff ff    	lea    ecx,[ebp-0xd0]
  407ddd:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  407de3:	8d 4d 98             	lea    ecx,[ebp-0x68]
  407de6:	c6 45 fc 47          	mov    BYTE PTR [ebp-0x4],0x47
  407dea:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  407df0:	8d 45 c0             	lea    eax,[ebp-0x40]
  407df3:	50                   	push   eax
  407df4:	8d 4d 88             	lea    ecx,[ebp-0x78]
  407df7:	ff 15 b4 92 41 00    	call   DWORD PTR ds:0x4192b4
  407dfd:	83 78 14 08          	cmp    DWORD PTR [eax+0x14],0x8
  407e01:	c6 45 fc 48          	mov    BYTE PTR [ebp-0x4],0x48
  407e05:	72 02                	jb     0x407e09
  407e07:	8b 00                	mov    eax,DWORD PTR [eax]
  407e09:	50                   	push   eax
  407e0a:	8d 8d 34 ff ff ff    	lea    ecx,[ebp-0xcc]
  407e10:	ff 15 80 90 41 00    	call   DWORD PTR ds:0x419080
  407e16:	8b 75 94             	mov    esi,DWORD PTR [ebp-0x6c]
  407e19:	50                   	push   eax
  407e1a:	c6 45 fc 49          	mov    BYTE PTR [ebp-0x4],0x49
  407e1e:	8b 4e 04             	mov    ecx,DWORD PTR [esi+0x4]
  407e21:	83 c1 08             	add    ecx,0x8
  407e24:	ff 15 88 90 41 00    	call   DWORD PTR ds:0x419088
  407e2a:	8d 8d 34 ff ff ff    	lea    ecx,[ebp-0xcc]
  407e30:	ff 15 7c 90 41 00    	call   DWORD PTR ds:0x41907c
  407e36:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
  407e39:	c6 45 fc 47          	mov    BYTE PTR [ebp-0x4],0x47
  407e3d:	83 f8 08             	cmp    eax,0x8
  407e40:	72 4b                	jb     0x407e8d
  407e42:	8b 4d c0             	mov    ecx,DWORD PTR [ebp-0x40]
  407e45:	40                   	inc    eax
  407e46:	3d ff ff ff 7f       	cmp    eax,0x7fffffff
  407e4b:	0f 87 29 fe ff ff    	ja     0x407c7a
  407e51:	03 c0                	add    eax,eax
  407e53:	3d 00 10 00 00       	cmp    eax,0x1000
  407e58:	72 2a                	jb     0x407e84
  407e5a:	f6 c1 1f             	test   cl,0x1f
  407e5d:	0f 85 17 fe ff ff    	jne    0x407c7a
  407e63:	8b 41 fc             	mov    eax,DWORD PTR [ecx-0x4]
  407e66:	3b c1                	cmp    eax,ecx
  407e68:	0f 83 0c fe ff ff    	jae    0x407c7a
  407e6e:	2b c8                	sub    ecx,eax
  407e70:	83 f9 04             	cmp    ecx,0x4
  407e73:	0f 82 01 fe ff ff    	jb     0x407c7a
  407e79:	83 f9 23             	cmp    ecx,0x23
  407e7c:	0f 87 f8 fd ff ff    	ja     0x407c7a
  407e82:	8b c8                	mov    ecx,eax
  407e84:	51                   	push   ecx
  407e85:	e8 b8 cb 00 00       	call   0x414a42
  407e8a:	83 c4 04             	add    esp,0x4
  407e8d:	6a 04                	push   0x4
  407e8f:	68 64 7b 45 00       	push   0x457b64
  407e94:	ff d3                	call   ebx
  407e96:	83 c4 08             	add    esp,0x8
  407e99:	89 85 64 ff ff ff    	mov    DWORD PTR [ebp-0x9c],eax
  407e9f:	8d 8d cc fe ff ff    	lea    ecx,[ebp-0x134]
  407ea5:	ff 15 d8 93 41 00    	call   DWORD PTR ds:0x4193d8
  407eab:	50                   	push   eax
  407eac:	8d 85 64 ff ff ff    	lea    eax,[ebp-0x9c]
  407eb2:	c6 45 fc 4b          	mov    BYTE PTR [ebp-0x4],0x4b
  407eb6:	50                   	push   eax
  407eb7:	8d 85 d0 fe ff ff    	lea    eax,[ebp-0x130]
  407ebd:	50                   	push   eax
  407ebe:	8d 4d a0             	lea    ecx,[ebp-0x60]
  407ec1:	ff d7                	call   edi
  407ec3:	8d 4d c0             	lea    ecx,[ebp-0x40]
  407ec6:	c6 45 fc 4c          	mov    BYTE PTR [ebp-0x4],0x4c
  407eca:	51                   	push   ecx
  407ecb:	8b c8                	mov    ecx,eax
  407ecd:	ff 15 b8 92 41 00    	call   DWORD PTR ds:0x4192b8
  407ed3:	83 78 14 10          	cmp    DWORD PTR [eax+0x14],0x10
  407ed7:	c6 45 fc 4d          	mov    BYTE PTR [ebp-0x4],0x4d
  407edb:	72 02                	jb     0x407edf
  407edd:	8b 00                	mov    eax,DWORD PTR [eax]
  407edf:	50                   	push   eax
  407ee0:	8d 4d 88             	lea    ecx,[ebp-0x78]
  407ee3:	ff 15 b4 93 41 00    	call   DWORD PTR ds:0x4193b4
  407ee9:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
  407eec:	83 f8 10             	cmp    eax,0x10
  407eef:	72 0f                	jb     0x407f00
  407ef1:	40                   	inc    eax
  407ef2:	6a 01                	push   0x1
  407ef4:	50                   	push   eax
  407ef5:	ff 75 c0             	push   DWORD PTR [ebp-0x40]
  407ef8:	e8 f3 c8 ff ff       	call   0x4047f0
  407efd:	83 c4 0c             	add    esp,0xc
  407f00:	8d 8d d0 fe ff ff    	lea    ecx,[ebp-0x130]
  407f06:	c7 45 d4 0f 00 00 00 	mov    DWORD PTR [ebp-0x2c],0xf
  407f0d:	c7 45 d0 00 00 00 00 	mov    DWORD PTR [ebp-0x30],0x0
  407f14:	c6 45 c0 00          	mov    BYTE PTR [ebp-0x40],0x0
  407f18:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  407f1e:	8d 8d cc fe ff ff    	lea    ecx,[ebp-0x134]
  407f24:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  407f2a:	8d 8d 64 ff ff ff    	lea    ecx,[ebp-0x9c]
  407f30:	c6 45 fc 47          	mov    BYTE PTR [ebp-0x4],0x47
  407f34:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  407f3a:	8d 45 c0             	lea    eax,[ebp-0x40]
  407f3d:	50                   	push   eax
  407f3e:	8d 4d 88             	lea    ecx,[ebp-0x78]
  407f41:	ff 15 b4 92 41 00    	call   DWORD PTR ds:0x4192b4
  407f47:	8b d0                	mov    edx,eax
  407f49:	83 7a 14 08          	cmp    DWORD PTR [edx+0x14],0x8
  407f4d:	c6 45 fc 4e          	mov    BYTE PTR [ebp-0x4],0x4e
  407f51:	72 02                	jb     0x407f55
  407f53:	8b 12                	mov    edx,DWORD PTR [edx]
  407f55:	66 83 3a 00          	cmp    WORD PTR [edx],0x0
  407f59:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
  407f5c:	75 04                	jne    0x407f62
  407f5e:	33 c9                	xor    ecx,ecx
  407f60:	eb 24                	jmp    0x407f86
  407f62:	8b ca                	mov    ecx,edx
  407f64:	8d 41 02             	lea    eax,[ecx+0x2]
  407f67:	89 85 78 ff ff ff    	mov    DWORD PTR [ebp-0x88],eax
  407f6d:	0f 1f 00             	nop    DWORD PTR [eax]
  407f70:	66 8b 01             	mov    ax,WORD PTR [ecx]
  407f73:	83 c1 02             	add    ecx,0x2
  407f76:	66 85 c0             	test   ax,ax
  407f79:	75 f5                	jne    0x407f70
  407f7b:	2b 8d 78 ff ff ff    	sub    ecx,DWORD PTR [ebp-0x88]
  407f81:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
  407f84:	d1 f9                	sar    ecx,1
  407f86:	51                   	push   ecx
  407f87:	52                   	push   edx
  407f88:	8d 88 98 00 00 00    	lea    ecx,[eax+0x98]
  407f8e:	e8 3d cf ff ff       	call   0x404ed0
  407f93:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
  407f96:	c6 45 fc 47          	mov    BYTE PTR [ebp-0x4],0x47
  407f9a:	83 f8 08             	cmp    eax,0x8
  407f9d:	72 0f                	jb     0x407fae
  407f9f:	40                   	inc    eax
  407fa0:	6a 02                	push   0x2
  407fa2:	50                   	push   eax
  407fa3:	ff 75 c0             	push   DWORD PTR [ebp-0x40]
  407fa6:	e8 45 c8 ff ff       	call   0x4047f0
  407fab:	83 c4 0c             	add    esp,0xc
  407fae:	6a 02                	push   0x2
  407fb0:	68 c8 7a 45 00       	push   0x457ac8
  407fb5:	ff d3                	call   ebx
  407fb7:	83 c4 08             	add    esp,0x8
  407fba:	89 85 4c ff ff ff    	mov    DWORD PTR [ebp-0xb4],eax
  407fc0:	8d 8d c4 fe ff ff    	lea    ecx,[ebp-0x13c]
  407fc6:	ff 15 d8 93 41 00    	call   DWORD PTR ds:0x4193d8
  407fcc:	50                   	push   eax
  407fcd:	8d 85 4c ff ff ff    	lea    eax,[ebp-0xb4]
  407fd3:	c6 45 fc 50          	mov    BYTE PTR [ebp-0x4],0x50
  407fd7:	50                   	push   eax
  407fd8:	8d 85 c8 fe ff ff    	lea    eax,[ebp-0x138]
  407fde:	50                   	push   eax
  407fdf:	8d 4d a0             	lea    ecx,[ebp-0x60]
  407fe2:	ff d7                	call   edi
  407fe4:	8b 76 04             	mov    esi,DWORD PTR [esi+0x4]
  407fe7:	8b c8                	mov    ecx,eax
  407fe9:	6a 0a                	push   0xa
  407feb:	6a 00                	push   0x0
  407fed:	c6 45 fc 51          	mov    BYTE PTR [ebp-0x4],0x51
  407ff1:	ff 15 c4 92 41 00    	call   DWORD PTR ds:0x4192c4
  407ff7:	8d 8d c8 fe ff ff    	lea    ecx,[ebp-0x138]
  407ffd:	89 46 04             	mov    DWORD PTR [esi+0x4],eax
  408000:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  408006:	8d 8d c4 fe ff ff    	lea    ecx,[ebp-0x13c]
  40800c:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  408012:	8d 8d 4c ff ff ff    	lea    ecx,[ebp-0xb4]
  408018:	c6 45 fc 47          	mov    BYTE PTR [ebp-0x4],0x47
  40801c:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  408022:	6a 05                	push   0x5
  408024:	68 54 7b 45 00       	push   0x457b54
  408029:	ff d3                	call   ebx
  40802b:	83 c4 08             	add    esp,0x8
  40802e:	89 85 48 ff ff ff    	mov    DWORD PTR [ebp-0xb8],eax
  408034:	8d 8d bc fe ff ff    	lea    ecx,[ebp-0x144]
  40803a:	ff 15 d8 93 41 00    	call   DWORD PTR ds:0x4193d8
  408040:	50                   	push   eax
  408041:	8d 85 48 ff ff ff    	lea    eax,[ebp-0xb8]
  408047:	c6 45 fc 53          	mov    BYTE PTR [ebp-0x4],0x53
  40804b:	50                   	push   eax
  40804c:	8d 85 c0 fe ff ff    	lea    eax,[ebp-0x140]
  408052:	50                   	push   eax
  408053:	8d 4d a0             	lea    ecx,[ebp-0x60]
  408056:	ff d7                	call   edi
  408058:	8b 75 94             	mov    esi,DWORD PTR [ebp-0x6c]
  40805b:	8b c8                	mov    ecx,eax
  40805d:	6a 0a                	push   0xa
  40805f:	6a 00                	push   0x0
  408061:	c6 45 fc 54          	mov    BYTE PTR [ebp-0x4],0x54
  408065:	8b 76 04             	mov    esi,DWORD PTR [esi+0x4]
  408068:	ff 15 d0 92 41 00    	call   DWORD PTR ds:0x4192d0
  40806e:	8d 8d c0 fe ff ff    	lea    ecx,[ebp-0x140]
  408074:	89 46 50             	mov    DWORD PTR [esi+0x50],eax
  408077:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40807d:	8d 8d bc fe ff ff    	lea    ecx,[ebp-0x144]
  408083:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  408089:	8d 8d 48 ff ff ff    	lea    ecx,[ebp-0xb8]
  40808f:	c6 45 fc 47          	mov    BYTE PTR [ebp-0x4],0x47
  408093:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  408099:	6a 06                	push   0x6
  40809b:	68 ec 7a 45 00       	push   0x457aec
  4080a0:	ff d3                	call   ebx
  4080a2:	83 c4 08             	add    esp,0x8
  4080a5:	89 85 5c ff ff ff    	mov    DWORD PTR [ebp-0xa4],eax
  4080ab:	8d 8d b4 fe ff ff    	lea    ecx,[ebp-0x14c]
  4080b1:	ff 15 d8 93 41 00    	call   DWORD PTR ds:0x4193d8
  4080b7:	50                   	push   eax
  4080b8:	8d 85 5c ff ff ff    	lea    eax,[ebp-0xa4]
  4080be:	c6 45 fc 56          	mov    BYTE PTR [ebp-0x4],0x56
  4080c2:	50                   	push   eax
  4080c3:	8d 85 b8 fe ff ff    	lea    eax,[ebp-0x148]
  4080c9:	50                   	push   eax
  4080ca:	8d 4d a0             	lea    ecx,[ebp-0x60]
  4080cd:	ff d7                	call   edi
  4080cf:	8b 4d 94             	mov    ecx,DWORD PTR [ebp-0x6c]
  4080d2:	6a 0a                	push   0xa
  4080d4:	6a 00                	push   0x0
  4080d6:	c6 45 fc 57          	mov    BYTE PTR [ebp-0x4],0x57
  4080da:	8b 71 04             	mov    esi,DWORD PTR [ecx+0x4]
  4080dd:	8b c8                	mov    ecx,eax
  4080df:	ff 15 d0 92 41 00    	call   DWORD PTR ds:0x4192d0
  4080e5:	8d 8d b8 fe ff ff    	lea    ecx,[ebp-0x148]
  4080eb:	89 46 54             	mov    DWORD PTR [esi+0x54],eax
  4080ee:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  4080f4:	8d 8d b4 fe ff ff    	lea    ecx,[ebp-0x14c]
  4080fa:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  408100:	8d 8d 5c ff ff ff    	lea    ecx,[ebp-0xa4]
  408106:	c6 45 fc 47          	mov    BYTE PTR [ebp-0x4],0x47
  40810a:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  408110:	6a 06                	push   0x6
  408112:	68 5c 7b 45 00       	push   0x457b5c
  408117:	ff d3                	call   ebx
  408119:	83 c4 08             	add    esp,0x8
  40811c:	89 85 58 ff ff ff    	mov    DWORD PTR [ebp-0xa8],eax
  408122:	8d 8d ac fe ff ff    	lea    ecx,[ebp-0x154]
  408128:	ff 15 d8 93 41 00    	call   DWORD PTR ds:0x4193d8
  40812e:	50                   	push   eax
  40812f:	8d 85 58 ff ff ff    	lea    eax,[ebp-0xa8]
  408135:	c6 45 fc 59          	mov    BYTE PTR [ebp-0x4],0x59
  408139:	50                   	push   eax
  40813a:	8d 85 b0 fe ff ff    	lea    eax,[ebp-0x150]
  408140:	50                   	push   eax
  408141:	8d 4d a0             	lea    ecx,[ebp-0x60]
  408144:	ff d7                	call   edi
  408146:	8b 4d 94             	mov    ecx,DWORD PTR [ebp-0x6c]
  408149:	6a 0a                	push   0xa
  40814b:	6a 00                	push   0x0
  40814d:	c6 45 fc 5a          	mov    BYTE PTR [ebp-0x4],0x5a
  408151:	8b 71 04             	mov    esi,DWORD PTR [ecx+0x4]
  408154:	8b c8                	mov    ecx,eax
  408156:	ff 15 d0 92 41 00    	call   DWORD PTR ds:0x4192d0
  40815c:	8d 8d b0 fe ff ff    	lea    ecx,[ebp-0x150]
  408162:	66 89 46 58          	mov    WORD PTR [esi+0x58],ax
  408166:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40816c:	8d 8d ac fe ff ff    	lea    ecx,[ebp-0x154]
  408172:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  408178:	8d 8d 58 ff ff ff    	lea    ecx,[ebp-0xa8]
  40817e:	c6 45 fc 47          	mov    BYTE PTR [ebp-0x4],0x47
  408182:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  408188:	6a 04                	push   0x4
  40818a:	68 34 7b 45 00       	push   0x457b34
  40818f:	ff d3                	call   ebx
  408191:	83 c4 08             	add    esp,0x8
  408194:	89 85 54 ff ff ff    	mov    DWORD PTR [ebp-0xac],eax
  40819a:	8d 8d ec fe ff ff    	lea    ecx,[ebp-0x114]
  4081a0:	ff 15 d8 93 41 00    	call   DWORD PTR ds:0x4193d8
  4081a6:	50                   	push   eax
  4081a7:	8d 85 54 ff ff ff    	lea    eax,[ebp-0xac]
  4081ad:	c6 45 fc 5c          	mov    BYTE PTR [ebp-0x4],0x5c
  4081b1:	50                   	push   eax
  4081b2:	8d 85 f0 fe ff ff    	lea    eax,[ebp-0x110]
  4081b8:	50                   	push   eax
  4081b9:	8d 4d a0             	lea    ecx,[ebp-0x60]
  4081bc:	ff d7                	call   edi
  4081be:	8b 4d 94             	mov    ecx,DWORD PTR [ebp-0x6c]
  4081c1:	6a 0a                	push   0xa
  4081c3:	6a 00                	push   0x0
  4081c5:	c6 45 fc 5d          	mov    BYTE PTR [ebp-0x4],0x5d
  4081c9:	8b 71 04             	mov    esi,DWORD PTR [ecx+0x4]
  4081cc:	8b c8                	mov    ecx,eax
  4081ce:	ff 15 d0 92 41 00    	call   DWORD PTR ds:0x4192d0
  4081d4:	8d 8d f0 fe ff ff    	lea    ecx,[ebp-0x110]
  4081da:	89 86 80 00 00 00    	mov    DWORD PTR [esi+0x80],eax
  4081e0:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  4081e6:	8d 8d ec fe ff ff    	lea    ecx,[ebp-0x114]
  4081ec:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  4081f2:	c6 45 fc 47          	mov    BYTE PTR [ebp-0x4],0x47
  4081f6:	8d 8d 54 ff ff ff    	lea    ecx,[ebp-0xac]
  4081fc:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  408202:	6a 0d                	push   0xd
  408204:	68 44 7b 45 00       	push   0x457b44
  408209:	ff d3                	call   ebx
  40820b:	83 c4 08             	add    esp,0x8
  40820e:	89 85 50 ff ff ff    	mov    DWORD PTR [ebp-0xb0],eax
  408214:	8d 8d a8 fe ff ff    	lea    ecx,[ebp-0x158]
  40821a:	ff 15 d8 93 41 00    	call   DWORD PTR ds:0x4193d8
  408220:	50                   	push   eax
  408221:	8d 85 50 ff ff ff    	lea    eax,[ebp-0xb0]
  408227:	c6 45 fc 5f          	mov    BYTE PTR [ebp-0x4],0x5f
  40822b:	50                   	push   eax
  40822c:	8d 85 e8 fe ff ff    	lea    eax,[ebp-0x118]
  408232:	50                   	push   eax
  408233:	8d 4d a0             	lea    ecx,[ebp-0x60]
  408236:	ff d7                	call   edi
  408238:	8b 4d 94             	mov    ecx,DWORD PTR [ebp-0x6c]
  40823b:	6a 0a                	push   0xa
  40823d:	6a 00                	push   0x0
  40823f:	c6 45 fc 60          	mov    BYTE PTR [ebp-0x4],0x60
  408243:	8b 71 04             	mov    esi,DWORD PTR [ecx+0x4]
  408246:	8b c8                	mov    ecx,eax
  408248:	ff 15 d0 92 41 00    	call   DWORD PTR ds:0x4192d0
  40824e:	8d 8d e8 fe ff ff    	lea    ecx,[ebp-0x118]
  408254:	89 86 88 00 00 00    	mov    DWORD PTR [esi+0x88],eax
  40825a:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  408260:	8d 8d a8 fe ff ff    	lea    ecx,[ebp-0x158]
  408266:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40826c:	8d 8d 50 ff ff ff    	lea    ecx,[ebp-0xb0]
  408272:	c6 45 fc 47          	mov    BYTE PTR [ebp-0x4],0x47
  408276:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40827c:	6a 06                	push   0x6
  40827e:	68 3c 7b 45 00       	push   0x457b3c
  408283:	ff d3                	call   ebx
  408285:	83 c4 08             	add    esp,0x8
  408288:	89 85 74 ff ff ff    	mov    DWORD PTR [ebp-0x8c],eax
  40828e:	8d 8d e0 fe ff ff    	lea    ecx,[ebp-0x120]
  408294:	ff 15 d8 93 41 00    	call   DWORD PTR ds:0x4193d8
  40829a:	50                   	push   eax
  40829b:	8d 85 74 ff ff ff    	lea    eax,[ebp-0x8c]
  4082a1:	c6 45 fc 62          	mov    BYTE PTR [ebp-0x4],0x62
  4082a5:	50                   	push   eax
  4082a6:	8d 85 e4 fe ff ff    	lea    eax,[ebp-0x11c]
  4082ac:	50                   	push   eax
  4082ad:	8d 4d a0             	lea    ecx,[ebp-0x60]
  4082b0:	ff d7                	call   edi
  4082b2:	8b 4d 94             	mov    ecx,DWORD PTR [ebp-0x6c]
  4082b5:	6a 0a                	push   0xa
  4082b7:	6a 00                	push   0x0
  4082b9:	c6 45 fc 63          	mov    BYTE PTR [ebp-0x4],0x63
  4082bd:	8b 71 04             	mov    esi,DWORD PTR [ecx+0x4]
  4082c0:	8b c8                	mov    ecx,eax
  4082c2:	ff 15 d0 92 41 00    	call   DWORD PTR ds:0x4192d0
  4082c8:	8d 8d e4 fe ff ff    	lea    ecx,[ebp-0x11c]
  4082ce:	89 86 84 00 00 00    	mov    DWORD PTR [esi+0x84],eax
  4082d4:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  4082da:	8d 8d e0 fe ff ff    	lea    ecx,[ebp-0x120]
  4082e0:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  4082e6:	8d 8d 74 ff ff ff    	lea    ecx,[ebp-0x8c]
  4082ec:	c6 45 fc 47          	mov    BYTE PTR [ebp-0x4],0x47
  4082f0:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  4082f6:	8d 45 84             	lea    eax,[ebp-0x7c]
  4082f9:	50                   	push   eax
  4082fa:	8d 4d a0             	lea    ecx,[ebp-0x60]
  4082fd:	ff 15 5c 9b 41 00    	call   DWORD PTR ds:0x419b5c
  408303:	33 f6                	xor    esi,esi
  408305:	c6 45 fc 64          	mov    BYTE PTR [ebp-0x4],0x64
  408309:	8d 4d 84             	lea    ecx,[ebp-0x7c]
  40830c:	89 75 9c             	mov    DWORD PTR [ebp-0x64],esi
  40830f:	ff 15 70 9b 41 00    	call   DWORD PTR ds:0x419b70
  408315:	85 c0                	test   eax,eax
  408317:	0f 8e 02 03 00 00    	jle    0x40861f
  40831d:	0f 1f 00             	nop    DWORD PTR [eax]
  408320:	56                   	push   esi
  408321:	8d 85 dc fe ff ff    	lea    eax,[ebp-0x124]
  408327:	50                   	push   eax
  408328:	8d 4d 84             	lea    ecx,[ebp-0x7c]
  40832b:	ff 15 6c 9b 41 00    	call   DWORD PTR ds:0x419b6c
  408331:	8d 4d a4             	lea    ecx,[ebp-0x5c]
  408334:	c6 45 fc 65          	mov    BYTE PTR [ebp-0x4],0x65
  408338:	51                   	push   ecx
  408339:	8b c8                	mov    ecx,eax
  40833b:	ff 15 64 9b 41 00    	call   DWORD PTR ds:0x419b64
  408341:	8d 8d dc fe ff ff    	lea    ecx,[ebp-0x124]
  408347:	c6 45 fc 67          	mov    BYTE PTR [ebp-0x4],0x67
  40834b:	ff 15 50 9b 41 00    	call   DWORD PTR ds:0x419b50
  408351:	8d 85 d8 fe ff ff    	lea    eax,[ebp-0x128]
  408357:	50                   	push   eax
  408358:	8d 4d a4             	lea    ecx,[ebp-0x5c]
  40835b:	ff 15 b8 9b 41 00    	call   DWORD PTR ds:0x419bb8
  408361:	68 b0 7a 45 00       	push   0x457ab0
  408366:	8b c8                	mov    ecx,eax
  408368:	c6 45 fc 68          	mov    BYTE PTR [ebp-0x4],0x68
  40836c:	ff 15 b0 93 41 00    	call   DWORD PTR ds:0x4193b0
  408372:	8d 8d d8 fe ff ff    	lea    ecx,[ebp-0x128]
  408378:	c6 45 fc 67          	mov    BYTE PTR [ebp-0x4],0x67
  40837c:	8a d8                	mov    bl,al
  40837e:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  408384:	84 db                	test   bl,bl
  408386:	0f 84 b8 00 00 00    	je     0x408444
  40838c:	8b 35 a8 93 41 00    	mov    esi,DWORD PTR ds:0x4193a8
  408392:	6a 04                	push   0x4
  408394:	68 b8 7a 45 00       	push   0x457ab8
  408399:	ff d6                	call   esi
  40839b:	83 c4 08             	add    esp,0x8
  40839e:	89 85 70 ff ff ff    	mov    DWORD PTR [ebp-0x90],eax
  4083a4:	8d 8d 20 ff ff ff    	lea    ecx,[ebp-0xe0]
  4083aa:	ff 15 d8 93 41 00    	call   DWORD PTR ds:0x4193d8
  4083b0:	50                   	push   eax
  4083b1:	8d 85 70 ff ff ff    	lea    eax,[ebp-0x90]
  4083b7:	c6 45 fc 6a          	mov    BYTE PTR [ebp-0x4],0x6a
  4083bb:	50                   	push   eax
  4083bc:	8d 85 24 ff ff ff    	lea    eax,[ebp-0xdc]
  4083c2:	50                   	push   eax
  4083c3:	8d 4d a4             	lea    ecx,[ebp-0x5c]
  4083c6:	ff d7                	call   edi
  4083c8:	8d 4d c0             	lea    ecx,[ebp-0x40]
  4083cb:	c6 45 fc 6b          	mov    BYTE PTR [ebp-0x4],0x6b
  4083cf:	51                   	push   ecx
  4083d0:	8b c8                	mov    ecx,eax
  4083d2:	ff 15 b4 92 41 00    	call   DWORD PTR ds:0x4192b4
  4083d8:	8b 4d 94             	mov    ecx,DWORD PTR [ebp-0x6c]
  4083db:	50                   	push   eax
  4083dc:	c6 45 fc 6c          	mov    BYTE PTR [ebp-0x4],0x6c
  4083e0:	8b 49 04             	mov    ecx,DWORD PTR [ecx+0x4]
  4083e3:	81 c1 8c 00 00 00    	add    ecx,0x8c
  4083e9:	e8 62 15 00 00       	call   0x409950
  4083ee:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
  4083f1:	83 f8 08             	cmp    eax,0x8
  4083f4:	72 0f                	jb     0x408405
  4083f6:	40                   	inc    eax
  4083f7:	6a 02                	push   0x2
  4083f9:	50                   	push   eax
  4083fa:	ff 75 c0             	push   DWORD PTR [ebp-0x40]
  4083fd:	e8 ee c3 ff ff       	call   0x4047f0
  408402:	83 c4 0c             	add    esp,0xc
  408405:	33 c0                	xor    eax,eax
  408407:	c7 45 d4 07 00 00 00 	mov    DWORD PTR [ebp-0x2c],0x7
  40840e:	8d 8d 24 ff ff ff    	lea    ecx,[ebp-0xdc]
  408414:	c7 45 d0 00 00 00 00 	mov    DWORD PTR [ebp-0x30],0x0
  40841b:	66 89 45 c0          	mov    WORD PTR [ebp-0x40],ax
  40841f:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  408425:	8d 8d 20 ff ff ff    	lea    ecx,[ebp-0xe0]
  40842b:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  408431:	8d 8d 70 ff ff ff    	lea    ecx,[ebp-0x90]
  408437:	c6 45 fc 67          	mov    BYTE PTR [ebp-0x4],0x67
  40843b:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  408441:	8b 75 9c             	mov    esi,DWORD PTR [ebp-0x64]
  408444:	8d 85 1c ff ff ff    	lea    eax,[ebp-0xe4]
  40844a:	50                   	push   eax
  40844b:	8d 4d a4             	lea    ecx,[ebp-0x5c]
  40844e:	ff 15 b8 9b 41 00    	call   DWORD PTR ds:0x419bb8
  408454:	68 c0 7a 45 00       	push   0x457ac0
  408459:	8b c8                	mov    ecx,eax
  40845b:	c6 45 fc 6d          	mov    BYTE PTR [ebp-0x4],0x6d
  40845f:	ff 15 b0 93 41 00    	call   DWORD PTR ds:0x4193b0
  408465:	8d 8d 1c ff ff ff    	lea    ecx,[ebp-0xe4]
  40846b:	c6 45 fc 67          	mov    BYTE PTR [ebp-0x4],0x67
  40846f:	8a d8                	mov    bl,al
  408471:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  408477:	84 db                	test   bl,bl
  408479:	8b 1d a8 93 41 00    	mov    ebx,DWORD PTR ds:0x4193a8
  40847f:	0f 84 78 01 00 00    	je     0x4085fd
  408485:	6a 02                	push   0x2
  408487:	68 c8 7a 45 00       	push   0x457ac8
  40848c:	ff d3                	call   ebx
  40848e:	83 c4 08             	add    esp,0x8
  408491:	89 85 6c ff ff ff    	mov    DWORD PTR [ebp-0x94],eax
  408497:	8d 8d 14 ff ff ff    	lea    ecx,[ebp-0xec]
  40849d:	ff 15 d8 93 41 00    	call   DWORD PTR ds:0x4193d8
  4084a3:	50                   	push   eax
  4084a4:	8d 85 6c ff ff ff    	lea    eax,[ebp-0x94]
  4084aa:	c6 45 fc 6f          	mov    BYTE PTR [ebp-0x4],0x6f
  4084ae:	50                   	push   eax
  4084af:	8d 85 18 ff ff ff    	lea    eax,[ebp-0xe8]
  4084b5:	50                   	push   eax
  4084b6:	8d 4d a4             	lea    ecx,[ebp-0x5c]
  4084b9:	ff d7                	call   edi
  4084bb:	6a 0a                	push   0xa
  4084bd:	6a 00                	push   0x0
  4084bf:	8b c8                	mov    ecx,eax
  4084c1:	c6 45 fc 70          	mov    BYTE PTR [ebp-0x4],0x70
  4084c5:	ff 15 cc 92 41 00    	call   DWORD PTR ds:0x4192cc
  4084cb:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  4084d1:	50                   	push   eax
  4084d2:	8b 49 08             	mov    ecx,DWORD PTR [ecx+0x8]
  4084d5:	ff 15 fc 90 41 00    	call   DWORD PTR ds:0x4190fc
  4084db:	8b c8                	mov    ecx,eax
  4084dd:	ff 15 20 91 41 00    	call   DWORD PTR ds:0x419120
  4084e3:	8d 8d 18 ff ff ff    	lea    ecx,[ebp-0xe8]
  4084e9:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
  4084ec:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  4084f2:	8d 8d 14 ff ff ff    	lea    ecx,[ebp-0xec]
  4084f8:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  4084fe:	8d 8d 6c ff ff ff    	lea    ecx,[ebp-0x94]
  408504:	c6 45 fc 67          	mov    BYTE PTR [ebp-0x4],0x67
  408508:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40850e:	6a 01                	push   0x1
  408510:	68 cc 7a 45 00       	push   0x457acc
  408515:	ff d3                	call   ebx
  408517:	83 c4 08             	add    esp,0x8
  40851a:	89 85 7c ff ff ff    	mov    DWORD PTR [ebp-0x84],eax
  408520:	8d 8d 0c ff ff ff    	lea    ecx,[ebp-0xf4]
  408526:	ff 15 d8 93 41 00    	call   DWORD PTR ds:0x4193d8
  40852c:	50                   	push   eax
  40852d:	8d 85 7c ff ff ff    	lea    eax,[ebp-0x84]
  408533:	c6 45 fc 72          	mov    BYTE PTR [ebp-0x4],0x72
  408537:	50                   	push   eax
  408538:	8d 85 10 ff ff ff    	lea    eax,[ebp-0xf0]
  40853e:	50                   	push   eax
  40853f:	8d 4d a4             	lea    ecx,[ebp-0x5c]
  408542:	ff d7                	call   edi
  408544:	8b 35 d0 92 41 00    	mov    esi,DWORD PTR ds:0x4192d0
  40854a:	8b c8                	mov    ecx,eax
  40854c:	6a 0a                	push   0xa
  40854e:	6a 00                	push   0x0
  408550:	c6 45 fc 73          	mov    BYTE PTR [ebp-0x4],0x73
  408554:	ff d6                	call   esi
  408556:	8d 8d 10 ff ff ff    	lea    ecx,[ebp-0xf0]
  40855c:	88 45 e8             	mov    BYTE PTR [ebp-0x18],al
  40855f:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  408565:	8d 8d 0c ff ff ff    	lea    ecx,[ebp-0xf4]
  40856b:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  408571:	8d 8d 7c ff ff ff    	lea    ecx,[ebp-0x84]
  408577:	c6 45 fc 67          	mov    BYTE PTR [ebp-0x4],0x67
  40857b:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  408581:	6a 01                	push   0x1
  408583:	68 d0 7a 45 00       	push   0x457ad0
  408588:	ff d3                	call   ebx
  40858a:	83 c4 08             	add    esp,0x8
  40858d:	89 45 90             	mov    DWORD PTR [ebp-0x70],eax
  408590:	8d 4d 80             	lea    ecx,[ebp-0x80]
  408593:	ff 15 d8 93 41 00    	call   DWORD PTR ds:0x4193d8
  408599:	50                   	push   eax
  40859a:	c6 45 fc 75          	mov    BYTE PTR [ebp-0x4],0x75
  40859e:	8d 45 90             	lea    eax,[ebp-0x70]
  4085a1:	50                   	push   eax
  4085a2:	8d 85 08 ff ff ff    	lea    eax,[ebp-0xf8]
  4085a8:	50                   	push   eax
  4085a9:	8d 4d a4             	lea    ecx,[ebp-0x5c]
  4085ac:	ff d7                	call   edi
  4085ae:	6a 0a                	push   0xa
  4085b0:	6a 00                	push   0x0
  4085b2:	8b c8                	mov    ecx,eax
  4085b4:	c6 45 fc 76          	mov    BYTE PTR [ebp-0x4],0x76
  4085b8:	ff d6                	call   esi
  4085ba:	8d 8d 08 ff ff ff    	lea    ecx,[ebp-0xf8]
  4085c0:	8b f0                	mov    esi,eax
  4085c2:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  4085c8:	8d 4d 80             	lea    ecx,[ebp-0x80]
  4085cb:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  4085d1:	8d 4d 90             	lea    ecx,[ebp-0x70]
  4085d4:	c6 45 fc 67          	mov    BYTE PTR [ebp-0x4],0x67
  4085d8:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  4085de:	f3 0f 7e 45 e4       	movq   xmm0,QWORD PTR [ebp-0x1c]
  4085e3:	8b 4d 94             	mov    ecx,DWORD PTR [ebp-0x6c]
  4085e6:	6a 00                	push   0x0
  4085e8:	83 ec 0c             	sub    esp,0xc
  4085eb:	8b c4                	mov    eax,esp
  4085ed:	66 0f d6 00          	movq   QWORD PTR [eax],xmm0
  4085f1:	89 70 08             	mov    DWORD PTR [eax+0x8],esi
  4085f4:	ff 15 b0 90 41 00    	call   DWORD PTR ds:0x4190b0
  4085fa:	8b 75 9c             	mov    esi,DWORD PTR [ebp-0x64]
  4085fd:	8d 4d a4             	lea    ecx,[ebp-0x5c]
  408600:	c6 45 fc 64          	mov    BYTE PTR [ebp-0x4],0x64
  408604:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  40860a:	46                   	inc    esi
  40860b:	8d 4d 84             	lea    ecx,[ebp-0x7c]
  40860e:	89 75 9c             	mov    DWORD PTR [ebp-0x64],esi
  408611:	ff 15 70 9b 41 00    	call   DWORD PTR ds:0x419b70
  408617:	3b f0                	cmp    esi,eax
  408619:	0f 8c 01 fd ff ff    	jl     0x408320
  40861f:	8d 4d 84             	lea    ecx,[ebp-0x7c]
  408622:	ff 15 68 9b 41 00    	call   DWORD PTR ds:0x419b68
  408628:	8d 4d 88             	lea    ecx,[ebp-0x78]
  40862b:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  408631:	8d 4d a0             	lea    ecx,[ebp-0x60]
  408634:	c6 45 fc 38          	mov    BYTE PTR [ebp-0x4],0x38
  408638:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  40863e:	8b 75 8c             	mov    esi,DWORD PTR [ebp-0x74]
  408641:	8d 8d 68 ff ff ff    	lea    ecx,[ebp-0x98]
  408647:	46                   	inc    esi
  408648:	89 75 8c             	mov    DWORD PTR [ebp-0x74],esi
  40864b:	ff 15 70 9b 41 00    	call   DWORD PTR ds:0x419b70
  408651:	3b f0                	cmp    esi,eax
  408653:	0f 8c 1e f5 ff ff    	jl     0x407b77
  408659:	eb 11                	jmp    0x40866c
  40865b:	68 40 7c 45 00       	push   0x457c40
  408660:	ff 15 b8 91 41 00    	call   DWORD PTR ds:0x4191b8
  408666:	8b 3d 7c 9b 41 00    	mov    edi,DWORD PTR ds:0x419b7c
  40866c:	6a 05                	push   0x5
  40866e:	68 6c 7b 45 00       	push   0x457b6c
  408673:	ff d3                	call   ebx
  408675:	83 c4 08             	add    esp,0x8
  408678:	89 45 8c             	mov    DWORD PTR [ebp-0x74],eax
  40867b:	8d 45 8c             	lea    eax,[ebp-0x74]
  40867e:	c6 45 fc 77          	mov    BYTE PTR [ebp-0x4],0x77
  408682:	50                   	push   eax
  408683:	8d 85 f8 fe ff ff    	lea    eax,[ebp-0x108]
  408689:	50                   	push   eax
  40868a:	a1 8c 9b 41 00       	mov    eax,ds:0x419b8c
  40868f:	8d 8d 00 ff ff ff    	lea    ecx,[ebp-0x100]
  408695:	ff d0                	call   eax
  408697:	8d 4d 8c             	lea    ecx,[ebp-0x74]
  40869a:	c6 45 fc 79          	mov    BYTE PTR [ebp-0x4],0x79
  40869e:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  4086a4:	8d 45 80             	lea    eax,[ebp-0x80]
  4086a7:	50                   	push   eax
  4086a8:	8d 8d f8 fe ff ff    	lea    ecx,[ebp-0x108]
  4086ae:	ff 15 5c 9b 41 00    	call   DWORD PTR ds:0x419b5c
  4086b4:	50                   	push   eax
  4086b5:	8d 8d 68 ff ff ff    	lea    ecx,[ebp-0x98]
  4086bb:	c6 45 fc 7a          	mov    BYTE PTR [ebp-0x4],0x7a
  4086bf:	ff 15 90 9b 41 00    	call   DWORD PTR ds:0x419b90
  4086c5:	8d 4d 80             	lea    ecx,[ebp-0x80]
  4086c8:	c6 45 fc 79          	mov    BYTE PTR [ebp-0x4],0x79
  4086cc:	ff 15 68 9b 41 00    	call   DWORD PTR ds:0x419b68
  4086d2:	33 f6                	xor    esi,esi
  4086d4:	8d 8d 68 ff ff ff    	lea    ecx,[ebp-0x98]
  4086da:	89 75 98             	mov    DWORD PTR [ebp-0x68],esi
  4086dd:	ff 15 70 9b 41 00    	call   DWORD PTR ds:0x419b70
  4086e3:	85 c0                	test   eax,eax
  4086e5:	0f 8e 30 03 00 00    	jle    0x408a1b
  4086eb:	0f 1f 44 00 00       	nop    DWORD PTR [eax+eax*1+0x0]
  4086f0:	56                   	push   esi
  4086f1:	8d 45 80             	lea    eax,[ebp-0x80]
  4086f4:	50                   	push   eax
  4086f5:	8d 8d 68 ff ff ff    	lea    ecx,[ebp-0x98]
  4086fb:	ff 15 6c 9b 41 00    	call   DWORD PTR ds:0x419b6c
  408701:	8d 4d a4             	lea    ecx,[ebp-0x5c]
  408704:	c6 45 fc 7b          	mov    BYTE PTR [ebp-0x4],0x7b
  408708:	51                   	push   ecx
  408709:	8b c8                	mov    ecx,eax
  40870b:	ff 15 64 9b 41 00    	call   DWORD PTR ds:0x419b64
  408711:	8d 4d 80             	lea    ecx,[ebp-0x80]
  408714:	c6 45 fc 7d          	mov    BYTE PTR [ebp-0x4],0x7d
  408718:	ff 15 50 9b 41 00    	call   DWORD PTR ds:0x419b50
  40871e:	6a 04                	push   0x4
  408720:	68 7c 7b 45 00       	push   0x457b7c
  408725:	ff d3                	call   ebx
  408727:	83 c4 08             	add    esp,0x8
  40872a:	89 45 90             	mov    DWORD PTR [ebp-0x70],eax
  40872d:	8d 8d 0c ff ff ff    	lea    ecx,[ebp-0xf4]
  408733:	ff 15 d8 93 41 00    	call   DWORD PTR ds:0x4193d8
  408739:	50                   	push   eax
  40873a:	8d 45 90             	lea    eax,[ebp-0x70]
  40873d:	c6 45 fc 7f          	mov    BYTE PTR [ebp-0x4],0x7f
  408741:	50                   	push   eax
  408742:	8d 85 08 ff ff ff    	lea    eax,[ebp-0xf8]
  408748:	50                   	push   eax
  408749:	8d 4d a4             	lea    ecx,[ebp-0x5c]
  40874c:	ff d7                	call   edi
  40874e:	6a 0a                	push   0xa
  408750:	6a 00                	push   0x0
  408752:	8b c8                	mov    ecx,eax
  408754:	c6 45 fc 80          	mov    BYTE PTR [ebp-0x4],0x80
  408758:	ff 15 c8 92 41 00    	call   DWORD PTR ds:0x4192c8
  40875e:	8d 8d 08 ff ff ff    	lea    ecx,[ebp-0xf8]
  408764:	8b d8                	mov    ebx,eax
  408766:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40876c:	8d 8d 0c ff ff ff    	lea    ecx,[ebp-0xf4]
  408772:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  408778:	8d 4d 90             	lea    ecx,[ebp-0x70]
  40877b:	c6 45 fc 7d          	mov    BYTE PTR [ebp-0x4],0x7d
  40877f:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  408785:	8b 35 a8 93 41 00    	mov    esi,DWORD PTR ds:0x4193a8
  40878b:	6a 04                	push   0x4
  40878d:	68 84 7b 45 00       	push   0x457b84
  408792:	ff d6                	call   esi
  408794:	83 c4 08             	add    esp,0x8
  408797:	89 85 7c ff ff ff    	mov    DWORD PTR [ebp-0x84],eax
  40879d:	8d 8d 14 ff ff ff    	lea    ecx,[ebp-0xec]
  4087a3:	ff 15 d8 93 41 00    	call   DWORD PTR ds:0x4193d8
  4087a9:	50                   	push   eax
  4087aa:	8d 85 7c ff ff ff    	lea    eax,[ebp-0x84]
  4087b0:	c6 45 fc 82          	mov    BYTE PTR [ebp-0x4],0x82
  4087b4:	50                   	push   eax
  4087b5:	8d 85 10 ff ff ff    	lea    eax,[ebp-0xf0]
  4087bb:	50                   	push   eax
  4087bc:	8d 4d a4             	lea    ecx,[ebp-0x5c]
  4087bf:	ff d7                	call   edi
  4087c1:	6a 0a                	push   0xa
  4087c3:	6a 00                	push   0x0
  4087c5:	8b c8                	mov    ecx,eax
  4087c7:	c6 45 fc 83          	mov    BYTE PTR [ebp-0x4],0x83
  4087cb:	ff 15 c8 92 41 00    	call   DWORD PTR ds:0x4192c8
  4087d1:	8d 8d 10 ff ff ff    	lea    ecx,[ebp-0xf0]
  4087d7:	8b f8                	mov    edi,eax
  4087d9:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  4087df:	8d 8d 14 ff ff ff    	lea    ecx,[ebp-0xec]
  4087e5:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  4087eb:	8d 8d 7c ff ff ff    	lea    ecx,[ebp-0x84]
  4087f1:	c6 45 fc 7d          	mov    BYTE PTR [ebp-0x4],0x7d
  4087f5:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  4087fb:	6a 01                	push   0x1
  4087fd:	68 9c 7b 45 00       	push   0x457b9c
  408802:	ff d6                	call   esi
  408804:	89 85 70 ff ff ff    	mov    DWORD PTR [ebp-0x90],eax
  40880a:	6a 04                	push   0x4
  40880c:	68 8c 7b 45 00       	push   0x457b8c
  408811:	c6 45 fc 84          	mov    BYTE PTR [ebp-0x4],0x84
  408815:	ff d6                	call   esi
  408817:	83 c4 10             	add    esp,0x10
  40881a:	89 85 6c ff ff ff    	mov    DWORD PTR [ebp-0x94],eax
  408820:	8d 85 70 ff ff ff    	lea    eax,[ebp-0x90]
  408826:	c6 45 fc 85          	mov    BYTE PTR [ebp-0x4],0x85
  40882a:	50                   	push   eax
  40882b:	8d 85 6c ff ff ff    	lea    eax,[ebp-0x94]
  408831:	50                   	push   eax
  408832:	8d 85 18 ff ff ff    	lea    eax,[ebp-0xe8]
  408838:	50                   	push   eax
  408839:	a1 7c 9b 41 00       	mov    eax,ds:0x419b7c
  40883e:	8d 4d a4             	lea    ecx,[ebp-0x5c]
  408841:	ff d0                	call   eax
  408843:	6a 0a                	push   0xa
  408845:	6a 00                	push   0x0
  408847:	8b c8                	mov    ecx,eax
  408849:	c6 45 fc 86          	mov    BYTE PTR [ebp-0x4],0x86
  40884d:	ff 15 c8 92 41 00    	call   DWORD PTR ds:0x4192c8
  408853:	8d 8d 18 ff ff ff    	lea    ecx,[ebp-0xe8]
  408859:	89 85 74 ff ff ff    	mov    DWORD PTR [ebp-0x8c],eax
  40885f:	8b f2                	mov    esi,edx
  408861:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  408867:	8d 8d 6c ff ff ff    	lea    ecx,[ebp-0x94]
  40886d:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  408873:	8d 8d 70 ff ff ff    	lea    ecx,[ebp-0x90]
  408879:	c6 45 fc 7d          	mov    BYTE PTR [ebp-0x4],0x7d
  40887d:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  408883:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  408889:	53                   	push   ebx
  40888a:	8b 1d 04 91 41 00    	mov    ebx,DWORD PTR ds:0x419104
  408890:	8b 49 08             	mov    ecx,DWORD PTR [ecx+0x8]
  408893:	ff d3                	call   ebx
  408895:	8b c8                	mov    ecx,eax
  408897:	ff 15 4c 91 41 00    	call   DWORD PTR ds:0x41914c
  40889d:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  4088a3:	57                   	push   edi
  4088a4:	89 85 5c ff ff ff    	mov    DWORD PTR [ebp-0xa4],eax
  4088aa:	8b 49 08             	mov    ecx,DWORD PTR [ecx+0x8]
  4088ad:	ff d3                	call   ebx
  4088af:	8b 3d 4c 91 41 00    	mov    edi,DWORD PTR ds:0x41914c
  4088b5:	8b c8                	mov    ecx,eax
  4088b7:	ff d7                	call   edi
  4088b9:	89 85 58 ff ff ff    	mov    DWORD PTR [ebp-0xa8],eax
  4088bf:	8b 85 74 ff ff ff    	mov    eax,DWORD PTR [ebp-0x8c]
  4088c5:	c7 85 54 ff ff ff 00 	mov    DWORD PTR [ebp-0xac],0x0
  4088cc:	00 00 00 
  4088cf:	85 f6                	test   esi,esi
  4088d1:	75 04                	jne    0x4088d7
  4088d3:	85 c0                	test   eax,eax
  4088d5:	74 16                	je     0x4088ed
  4088d7:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  4088dd:	50                   	push   eax
  4088de:	8b 49 08             	mov    ecx,DWORD PTR [ecx+0x8]
  4088e1:	ff d3                	call   ebx
  4088e3:	8b c8                	mov    ecx,eax
  4088e5:	ff d7                	call   edi
  4088e7:	89 85 54 ff ff ff    	mov    DWORD PTR [ebp-0xac],eax
  4088ed:	8b 1d a8 93 41 00    	mov    ebx,DWORD PTR ds:0x4193a8
  4088f3:	6a 04                	push   0x4
  4088f5:	68 34 7b 45 00       	push   0x457b34
  4088fa:	ff d3                	call   ebx
  4088fc:	83 c4 08             	add    esp,0x8
  4088ff:	89 85 50 ff ff ff    	mov    DWORD PTR [ebp-0xb0],eax
  408905:	8d 8d 20 ff ff ff    	lea    ecx,[ebp-0xe0]
  40890b:	ff 15 d8 93 41 00    	call   DWORD PTR ds:0x4193d8
  408911:	8b 3d 7c 9b 41 00    	mov    edi,DWORD PTR ds:0x419b7c
  408917:	8d 4d a4             	lea    ecx,[ebp-0x5c]
  40891a:	50                   	push   eax
  40891b:	8d 85 50 ff ff ff    	lea    eax,[ebp-0xb0]
  408921:	c6 45 fc 88          	mov    BYTE PTR [ebp-0x4],0x88
  408925:	50                   	push   eax
  408926:	8d 85 1c ff ff ff    	lea    eax,[ebp-0xe4]
  40892c:	50                   	push   eax
  40892d:	ff d7                	call   edi
  40892f:	6a 0a                	push   0xa
  408931:	6a 00                	push   0x0
  408933:	8b c8                	mov    ecx,eax
  408935:	c6 45 fc 89          	mov    BYTE PTR [ebp-0x4],0x89
  408939:	ff 15 d0 92 41 00    	call   DWORD PTR ds:0x4192d0
  40893f:	8d 8d 1c ff ff ff    	lea    ecx,[ebp-0xe4]
  408945:	8b f0                	mov    esi,eax
  408947:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40894d:	8d 8d 20 ff ff ff    	lea    ecx,[ebp-0xe0]
  408953:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  408959:	8d 8d 50 ff ff ff    	lea    ecx,[ebp-0xb0]
  40895f:	c6 45 fc 7d          	mov    BYTE PTR [ebp-0x4],0x7d
  408963:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  408969:	6a 30                	push   0x30
  40896b:	e8 19 be 00 00       	call   0x414789
  408970:	83 c4 04             	add    esp,0x4
  408973:	89 85 24 ff ff ff    	mov    DWORD PTR [ebp-0xdc],eax
  408979:	c6 45 fc 8a          	mov    BYTE PTR [ebp-0x4],0x8a
  40897d:	85 c0                	test   eax,eax
  40897f:	74 14                	je     0x408995
  408981:	8b c8                	mov    ecx,eax
  408983:	ff 15 c0 90 41 00    	call   DWORD PTR ds:0x4190c0
  408989:	8b 85 24 ff ff ff    	mov    eax,DWORD PTR [ebp-0xdc]
  40898f:	c7 00 5c 79 45 00    	mov    DWORD PTR [eax],0x45795c
  408995:	c6 45 fc 7d          	mov    BYTE PTR [ebp-0x4],0x7d
  408999:	83 ee 02             	sub    esi,0x2
  40899c:	74 31                	je     0x4089cf
  40899e:	83 ee 01             	sub    esi,0x1
  4089a1:	75 50                	jne    0x4089f3
  4089a3:	ff b5 54 ff ff ff    	push   DWORD PTR [ebp-0xac]
  4089a9:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  4089af:	ff b5 58 ff ff ff    	push   DWORD PTR [ebp-0xa8]
  4089b5:	a1 04 91 41 00       	mov    eax,ds:0x419104
  4089ba:	ff b5 5c ff ff ff    	push   DWORD PTR [ebp-0xa4]
  4089c0:	8b 49 08             	mov    ecx,DWORD PTR [ecx+0x8]
  4089c3:	ff d0                	call   eax
  4089c5:	8b c8                	mov    ecx,eax
  4089c7:	ff 15 34 91 41 00    	call   DWORD PTR ds:0x419134
  4089cd:	eb 24                	jmp    0x4089f3
  4089cf:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  4089d5:	ff b5 58 ff ff ff    	push   DWORD PTR [ebp-0xa8]
  4089db:	a1 04 91 41 00       	mov    eax,ds:0x419104
  4089e0:	ff b5 5c ff ff ff    	push   DWORD PTR [ebp-0xa4]
  4089e6:	8b 49 08             	mov    ecx,DWORD PTR [ecx+0x8]
  4089e9:	ff d0                	call   eax
  4089eb:	8b c8                	mov    ecx,eax
  4089ed:	ff 15 38 91 41 00    	call   DWORD PTR ds:0x419138
  4089f3:	8d 4d a4             	lea    ecx,[ebp-0x5c]
  4089f6:	c6 45 fc 79          	mov    BYTE PTR [ebp-0x4],0x79
  4089fa:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  408a00:	8b 75 98             	mov    esi,DWORD PTR [ebp-0x68]
  408a03:	8d 8d 68 ff ff ff    	lea    ecx,[ebp-0x98]
  408a09:	46                   	inc    esi
  408a0a:	89 75 98             	mov    DWORD PTR [ebp-0x68],esi
  408a0d:	ff 15 70 9b 41 00    	call   DWORD PTR ds:0x419b70
  408a13:	3b f0                	cmp    esi,eax
  408a15:	0f 8c d5 fc ff ff    	jl     0x4086f0
  408a1b:	6a 06                	push   0x6
  408a1d:	68 94 7b 45 00       	push   0x457b94
  408a22:	ff d3                	call   ebx
  408a24:	83 c4 08             	add    esp,0x8
  408a27:	89 45 90             	mov    DWORD PTR [ebp-0x70],eax
  408a2a:	8b 8d 28 ff ff ff    	mov    ecx,DWORD PTR [ebp-0xd8]
  408a30:	8d 45 90             	lea    eax,[ebp-0x70]
  408a33:	50                   	push   eax
  408a34:	8d 85 f4 fe ff ff    	lea    eax,[ebp-0x10c]
  408a3a:	c6 45 fc 8b          	mov    BYTE PTR [ebp-0x4],0x8b
  408a3e:	50                   	push   eax
  408a3f:	ff 15 8c 9b 41 00    	call   DWORD PTR ds:0x419b8c
  408a45:	8d 4d 90             	lea    ecx,[ebp-0x70]
  408a48:	c6 45 fc 8d          	mov    BYTE PTR [ebp-0x4],0x8d
  408a4c:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  408a52:	8d 85 44 ff ff ff    	lea    eax,[ebp-0xbc]
  408a58:	50                   	push   eax
  408a59:	8d 8d f4 fe ff ff    	lea    ecx,[ebp-0x10c]
  408a5f:	ff 15 5c 9b 41 00    	call   DWORD PTR ds:0x419b5c
  408a65:	8b 1d 70 9b 41 00    	mov    ebx,DWORD PTR ds:0x419b70
  408a6b:	8d 8d 44 ff ff ff    	lea    ecx,[ebp-0xbc]
  408a71:	c6 45 fc 8e          	mov    BYTE PTR [ebp-0x4],0x8e
  408a75:	33 ff                	xor    edi,edi
  408a77:	ff d3                	call   ebx
  408a79:	85 c0                	test   eax,eax
  408a7b:	0f 8e 94 00 00 00    	jle    0x408b15
  408a81:	57                   	push   edi
  408a82:	8d 45 80             	lea    eax,[ebp-0x80]
  408a85:	50                   	push   eax
  408a86:	8d 8d 44 ff ff ff    	lea    ecx,[ebp-0xbc]
  408a8c:	ff 15 6c 9b 41 00    	call   DWORD PTR ds:0x419b6c
  408a92:	8d 4d 8c             	lea    ecx,[ebp-0x74]
  408a95:	c6 45 fc 8f          	mov    BYTE PTR [ebp-0x4],0x8f
  408a99:	51                   	push   ecx
  408a9a:	8b c8                	mov    ecx,eax
  408a9c:	ff 15 64 9b 41 00    	call   DWORD PTR ds:0x419b64
  408aa2:	8d 4d 80             	lea    ecx,[ebp-0x80]
  408aa5:	c6 45 fc 91          	mov    BYTE PTR [ebp-0x4],0x91
  408aa9:	ff 15 50 9b 41 00    	call   DWORD PTR ds:0x419b50
  408aaf:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  408ab5:	6a 00                	push   0x0
  408ab7:	8b 49 08             	mov    ecx,DWORD PTR [ecx+0x8]
  408aba:	ff 15 f8 90 41 00    	call   DWORD PTR ds:0x4190f8
  408ac0:	8b c8                	mov    ecx,eax
  408ac2:	ff 15 e0 90 41 00    	call   DWORD PTR ds:0x4190e0
  408ac8:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  408ace:	8b f0                	mov    esi,eax
  408ad0:	8b 49 08             	mov    ecx,DWORD PTR [ecx+0x8]
  408ad3:	ff 15 fc 90 41 00    	call   DWORD PTR ds:0x4190fc
  408ad9:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  408adf:	50                   	push   eax
  408ae0:	8b 49 08             	mov    ecx,DWORD PTR [ecx+0x8]
  408ae3:	ff 15 04 91 41 00    	call   DWORD PTR ds:0x419104
  408ae9:	50                   	push   eax
  408aea:	8d 45 8c             	lea    eax,[ebp-0x74]
  408aed:	56                   	push   esi
  408aee:	50                   	push   eax
  408aef:	e8 ec ce ff ff       	call   0x4059e0
  408af4:	83 c4 10             	add    esp,0x10
  408af7:	c6 45 fc 8e          	mov    BYTE PTR [ebp-0x4],0x8e
  408afb:	8d 4d 8c             	lea    ecx,[ebp-0x74]
  408afe:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  408b04:	8d 8d 44 ff ff ff    	lea    ecx,[ebp-0xbc]
  408b0a:	47                   	inc    edi
  408b0b:	ff d3                	call   ebx
  408b0d:	3b f8                	cmp    edi,eax
  408b0f:	0f 8c 6c ff ff ff    	jl     0x408a81
  408b15:	8b 0d a4 96 46 00    	mov    ecx,DWORD PTR ds:0x4696a4
  408b1b:	8b 49 08             	mov    ecx,DWORD PTR [ecx+0x8]
  408b1e:	ff 15 04 91 41 00    	call   DWORD PTR ds:0x419104
  408b24:	8b c8                	mov    ecx,eax
  408b26:	ff 15 3c 91 41 00    	call   DWORD PTR ds:0x41913c
  408b2c:	8b 1d 68 9b 41 00    	mov    ebx,DWORD PTR ds:0x419b68
  408b32:	8d 8d 44 ff ff ff    	lea    ecx,[ebp-0xbc]
  408b38:	ff d3                	call   ebx
  408b3a:	8d 8d f4 fe ff ff    	lea    ecx,[ebp-0x10c]
  408b40:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  408b46:	8d 8d f8 fe ff ff    	lea    ecx,[ebp-0x108]
  408b4c:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  408b52:	8d 8d 68 ff ff ff    	lea    ecx,[ebp-0x98]
  408b58:	ff d3                	call   ebx
  408b5a:	8d 8d 04 ff ff ff    	lea    ecx,[ebp-0xfc]
  408b60:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  408b66:	8d 8d 00 ff ff ff    	lea    ecx,[ebp-0x100]
  408b6c:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  408b72:	8d 8d 40 ff ff ff    	lea    ecx,[ebp-0xc0]
  408b78:	ff d3                	call   ebx
  408b7a:	8d 8d fc fe ff ff    	lea    ecx,[ebp-0x104]
  408b80:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  408b86:	8d 8d 3c ff ff ff    	lea    ecx,[ebp-0xc4]
  408b8c:	ff d3                	call   ebx
  408b8e:	8d 8d 38 ff ff ff    	lea    ecx,[ebp-0xc8]
  408b94:	ff 15 84 9b 41 00    	call   DWORD PTR ds:0x419b84
  408b9a:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
  408b9d:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  408ba4:	59                   	pop    ecx
  408ba5:	5f                   	pop    edi
  408ba6:	5e                   	pop    esi
  408ba7:	5b                   	pop    ebx
  408ba8:	8b 4d f0             	mov    ecx,DWORD PTR [ebp-0x10]
  408bab:	33 cd                	xor    ecx,ebp
  408bad:	e8 c6 bb 00 00       	call   0x414778
  408bb2:	8b e5                	mov    esp,ebp
  408bb4:	5d                   	pop    ebp
  408bb5:	c3                   	ret

===== WRITER CALLER WINDOW: IS.exe 0x0040BB90..0x0040BC10 =====

/mnt/data/IS2_original_binaries/IS.exe:     file format pei-i386


Disassembly of section .text:

0040bb90 <.text+0xab90>:
  40bb90:	50                   	push   eax
  40bb91:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40bb94:	ff 15 74 9b 41 00    	call   DWORD PTR ds:0x419b74
  40bb9a:	8d 4d d0             	lea    ecx,[ebp-0x30]
  40bb9d:	c6 45 fc 0e          	mov    BYTE PTR [ebp-0x4],0xe
  40bba1:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40bba7:	8d 45 dc             	lea    eax,[ebp-0x24]
  40bbaa:	50                   	push   eax
  40bbab:	8d 45 ac             	lea    eax,[ebp-0x54]
  40bbae:	50                   	push   eax
  40bbaf:	8d 4d ec             	lea    ecx,[ebp-0x14]
  40bbb2:	ff d7                	call   edi
  40bbb4:	8d 4d ac             	lea    ecx,[ebp-0x54]
  40bbb7:	ff 15 50 9b 41 00    	call   DWORD PTR ds:0x419b50
  40bbbd:	8d 45 f0             	lea    eax,[ebp-0x10]
  40bbc0:	50                   	push   eax
  40bbc1:	8d 45 a4             	lea    eax,[ebp-0x5c]
  40bbc4:	50                   	push   eax
  40bbc5:	e8 06 f1 ff ff       	call   0x40acd0
  40bbca:	83 c4 08             	add    esp,0x8
  40bbcd:	c6 45 fc 0f          	mov    BYTE PTR [ebp-0x4],0xf
  40bbd1:	8d 45 a4             	lea    eax,[ebp-0x5c]
  40bbd4:	50                   	push   eax
  40bbd5:	8d 45 ac             	lea    eax,[ebp-0x54]
  40bbd8:	50                   	push   eax
  40bbd9:	8d 4d dc             	lea    ecx,[ebp-0x24]
  40bbdc:	ff d7                	call   edi
  40bbde:	8d 4d ac             	lea    ecx,[ebp-0x54]
  40bbe1:	ff 15 50 9b 41 00    	call   DWORD PTR ds:0x419b50
  40bbe7:	8d 45 f0             	lea    eax,[ebp-0x10]
  40bbea:	50                   	push   eax
  40bbeb:	8d 45 a8             	lea    eax,[ebp-0x58]
  40bbee:	50                   	push   eax
  40bbef:	e8 dc ea ff ff       	call   0x40a6d0
  40bbf4:	83 c4 08             	add    esp,0x8
  40bbf7:	8d 45 a8             	lea    eax,[ebp-0x58]
  40bbfa:	c6 45 fc 10          	mov    BYTE PTR [ebp-0x4],0x10
  40bbfe:	50                   	push   eax
  40bbff:	8d 45 ac             	lea    eax,[ebp-0x54]
  40bc02:	50                   	push   eax
  40bc03:	8d 4d dc             	lea    ecx,[ebp-0x24]
  40bc06:	ff d7                	call   edi
  40bc08:	8d 4d ac             	lea    ecx,[ebp-0x54]
  40bc0b:	ff                   	.byte 0xff
  40bc0c:	15                   	.byte 0x15
  40bc0d:	50                   	push   eax
  40bc0e:	9b                   	fwait
  40bc0f:	41                   	inc    ecx

===== READER CALLER WINDOW: IS.exe 0x00408F80..0x00409030 =====

/mnt/data/IS2_original_binaries/IS.exe:     file format pei-i386


Disassembly of section .text:

00408f80 <.text+0x7f80>:
  408f80:	17                   	pop    ss
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
  409020:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
  409023:	8d 45 d8             	lea    eax,[ebp-0x28]
  409026:	c6 45 fc 1e          	mov    BYTE PTR [ebp-0x4],0x1e
  40902a:	50                   	push   eax
  40902b:	8d 45 b0             	lea    eax,[ebp-0x50]
  40902e:	50                   	push   eax
  40902f:	8d                   	.byte 0x8d
