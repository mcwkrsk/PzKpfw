; ===== new_alternative =====

/mnt/data/work_stage117/re_inputs/modules/pm_auto.dll:     file format pei-i386


disassembly of section .text:

1000bb60 <.text+0xab60>:
1000bb60:	55                   	push   ebp
1000bb61:	8b ec                	mov    ebp,esp
1000bb63:	6a ff                	push   0xffffffff
1000bb65:	68 2e f5 01 10       	push   0x1001f52e
1000bb6a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000bb70:	50                   	push   eax
1000bb71:	83 ec 50             	sub    esp,0x50
1000bb74:	53                   	push   ebx
1000bb75:	56                   	push   esi
1000bb76:	57                   	push   edi
1000bb77:	a1 cc f0 06 10       	mov    eax,ds:0x1006f0cc
1000bb7c:	33 c5                	xor    eax,ebp
1000bb7e:	50                   	push   eax
1000bb7f:	8d 45 f4             	lea    eax,[ebp-0xc]
1000bb82:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000bb88:	8b f9                	mov    edi,ecx
1000bb8a:	8b 8f fc 00 00 00    	mov    ecx,dword ptr [edi+0xfc]
1000bb90:	ff 15 b0 28 02 10    	call   dword ptr ds:0x100228b0
1000bb96:	50                   	push   eax
1000bb97:	b9 90 bc 05 10       	mov    ecx,0x1005bc90
1000bb9c:	ff 15 54 24 02 10    	call   dword ptr ds:0x10022454
1000bba2:	8b c8                	mov    ecx,eax
1000bba4:	89 45 e8             	mov    dword ptr [ebp-0x18],eax
1000bba7:	ff 70 7c             	push   dword ptr [eax+0x7c]
1000bbaa:	ff 70 78             	push   dword ptr [eax+0x78]
1000bbad:	e8 de b3 00 00       	call   0x10016f90
1000bbb2:	ff 77 38             	push   dword ptr [edi+0x38]
1000bbb5:	8b 8f 1c 01 00 00    	mov    ecx,dword ptr [edi+0x11c]
1000bbbb:	89 45 ec             	mov    dword ptr [ebp-0x14],eax
1000bbbe:	8d 45 d4             	lea    eax,[ebp-0x2c]
1000bbc1:	50                   	push   eax
1000bbc2:	6a 00                	push   0x0
1000bbc4:	ff 15 bc 20 02 10    	call   dword ptr ds:0x100220bc
1000bbca:	8b c8                	mov    ecx,eax
1000bbcc:	ff 15 68 20 02 10    	call   dword ptr ds:0x10022068
1000bbd2:	8b 1d 0c 21 02 10    	mov    ebx,dword ptr ds:0x1002210c
1000bbd8:	33 f6                	xor    esi,esi
1000bbda:	c7 45 fc 00 00 00 00 	mov    dword ptr [ebp-0x4],0x0
1000bbe1:	39 75 d4             	cmp    dword ptr [ebp-0x2c],esi
1000bbe4:	7e 36                	jle    0x1000bc1c
1000bbe6:	66 66 0f 1f 84 00 00 	data16 nop word ptr [eax+eax*1+0x0]
1000bbed:	00 00 00 
1000bbf0:	8b 45 d8             	mov    eax,dword ptr [ebp-0x28]
1000bbf3:	8b 0c b0             	mov    ecx,dword ptr [eax+esi*4]
1000bbf6:	ff 15 08 21 02 10    	call   dword ptr ds:0x10022108
1000bbfc:	8b 45 d8             	mov    eax,dword ptr [ebp-0x28]
1000bbff:	6a 01                	push   0x1
1000bc01:	8b 0c b0             	mov    ecx,dword ptr [eax+esi*4]
1000bc04:	ff d3                	call   ebx
1000bc06:	8b 45 d8             	mov    eax,dword ptr [ebp-0x28]
1000bc09:	8b 0c b0             	mov    ecx,dword ptr [eax+esi*4]
1000bc0c:	85 c9                	test   ecx,ecx
1000bc0e:	74 06                	je     0x1000bc16
1000bc10:	8b 01                	mov    eax,dword ptr [ecx]
1000bc12:	6a 01                	push   0x1
1000bc14:	ff 10                	call   dword ptr [eax]
1000bc16:	46                   	inc    esi
1000bc17:	3b 75 d4             	cmp    esi,dword ptr [ebp-0x2c]
1000bc1a:	7c d4                	jl     0x1000bbf0
1000bc1c:	83 7f 2c 02          	cmp    dword ptr [edi+0x2c],0x2
1000bc20:	0f 85 09 02 00 00    	jne    0x1000be2f
1000bc26:	8b 5d e8             	mov    ebx,dword ptr [ebp-0x18]
1000bc29:	8b cb                	mov    ecx,ebx
1000bc2b:	6a 02                	push   0x2
1000bc2d:	8b 43 7c             	mov    eax,dword ptr [ebx+0x7c]
1000bc30:	40                   	inc    eax
1000bc31:	50                   	push   eax
1000bc32:	e8 79 9b 00 00       	call   0x100157b0
1000bc37:	84 c0                	test   al,al
1000bc39:	0f 85 c2 00 00 00    	jne    0x1000bd01
1000bc3f:	6a 00                	push   0x0
1000bc41:	8d 4d bc             	lea    ecx,[ebp-0x44]
1000bc44:	ff 15 28 2a 02 10    	call   dword ptr ds:0x10022a28
1000bc4a:	8d 45 e4             	lea    eax,[ebp-0x1c]
1000bc4d:	c6 45 f3 00          	mov    byte ptr [ebp-0xd],0x0
1000bc51:	50                   	push   eax
1000bc52:	8d 4d f3             	lea    ecx,[ebp-0xd]
1000bc55:	e8 66 a2 ff ff       	call   0x10005ec0
1000bc5a:	50                   	push   eax
1000bc5b:	8d 4d bc             	lea    ecx,[ebp-0x44]
1000bc5e:	c6 45 fc 02          	mov    byte ptr [ebp-0x4],0x2
1000bc62:	ff 15 38 2a 02 10    	call   dword ptr ds:0x10022a38
1000bc68:	8d 4d e4             	lea    ecx,[ebp-0x1c]
1000bc6b:	ff 15 a4 23 02 10    	call   dword ptr ds:0x100223a4
1000bc71:	8d 45 e4             	lea    eax,[ebp-0x1c]
1000bc74:	50                   	push   eax
1000bc75:	8d 4d f3             	lea    ecx,[ebp-0xd]
1000bc78:	e8 63 a2 ff ff       	call   0x10005ee0
1000bc7d:	50                   	push   eax
1000bc7e:	8d 4d bc             	lea    ecx,[ebp-0x44]
1000bc81:	c6 45 fc 03          	mov    byte ptr [ebp-0x4],0x3
1000bc85:	ff 15 40 2a 02 10    	call   dword ptr ds:0x10022a40
1000bc8b:	8d 4d e4             	lea    ecx,[ebp-0x1c]
1000bc8e:	c6 45 fc 01          	mov    byte ptr [ebp-0x4],0x1
1000bc92:	ff 15 a4 23 02 10    	call   dword ptr ds:0x100223a4
1000bc98:	68 00 04 40 00       	push   0x400400
1000bc9d:	8d 4d bc             	lea    ecx,[ebp-0x44]
1000bca0:	ff 15 30 2a 02 10    	call   dword ptr ds:0x10022a30
1000bca6:	68 00 04 00 00       	push   0x400
1000bcab:	8d 4d bc             	lea    ecx,[ebp-0x44]
1000bcae:	ff 15 34 2a 02 10    	call   dword ptr ds:0x10022a34
1000bcb4:	8d 4d bc             	lea    ecx,[ebp-0x44]
1000bcb7:	ff 15 24 2a 02 10    	call   dword ptr ds:0x10022a24
1000bcbd:	3d 00 00 40 00       	cmp    eax,0x400000
1000bcc2:	75 0e                	jne    0x1000bcd2
1000bcc4:	8d 4d bc             	lea    ecx,[ebp-0x44]
1000bcc7:	ff 15 2c 2a 02 10    	call   dword ptr ds:0x10022a2c
1000bccd:	e9 73 04 00 00       	jmp    0x1000c145
1000bcd2:	3d 00 04 00 00       	cmp    eax,0x400
1000bcd7:	75 1b                	jne    0x1000bcf4
1000bcd9:	ff 75 ec             	push   dword ptr [ebp-0x14]
1000bcdc:	8b cf                	mov    ecx,edi
1000bcde:	e8 6d e2 ff ff       	call   0x10009f50
1000bce3:	6a 00                	push   0x0
1000bce5:	6a 00                	push   0x0
1000bce7:	8b c8                	mov    ecx,eax
1000bce9:	89 45 e8             	mov    dword ptr [ebp-0x18],eax
1000bcec:	e8 9f b2 00 00       	call   0x10016f90
1000bcf1:	89 45 ec             	mov    dword ptr [ebp-0x14],eax
1000bcf4:	8d 4d bc             	lea    ecx,[ebp-0x44]
1000bcf7:	c6 45 fc 00          	mov    byte ptr [ebp-0x4],0x0
1000bcfb:	ff 15 2c 2a 02 10    	call   dword ptr ds:0x10022a2c
1000bd01:	8b 5d ec             	mov    ebx,dword ptr [ebp-0x14]
1000bd04:	8b 8f 1c 01 00 00    	mov    ecx,dword ptr [edi+0x11c]
1000bd0a:	6a 02                	push   0x2
1000bd0c:	8b b3 d0 01 00 00    	mov    esi,dword ptr [ebx+0x1d0]
1000bd12:	56                   	push   esi
1000bd13:	6a 00                	push   0x0
1000bd15:	ff 15 b8 20 02 10    	call   dword ptr ds:0x100220b8
1000bd1b:	8b c8                	mov    ecx,eax
1000bd1d:	ff 15 ec 20 02 10    	call   dword ptr ds:0x100220ec
1000bd23:	8b ce                	mov    ecx,esi
1000bd25:	ff 15 24 21 02 10    	call   dword ptr ds:0x10022124
1000bd2b:	6a 00                	push   0x0
1000bd2d:	8b ce                	mov    ecx,esi
1000bd2f:	ff 15 28 21 02 10    	call   dword ptr ds:0x10022128
1000bd35:	68 78 02 00 00       	push   0x278
1000bd3a:	89 45 ec             	mov    dword ptr [ebp-0x14],eax
1000bd3d:	e8 39 0f 01 00       	call   0x1001cc7b
1000bd42:	83 c4 04             	add    esp,0x4
1000bd45:	89 45 e4             	mov    dword ptr [ebp-0x1c],eax
1000bd48:	c6 45 fc 04          	mov    byte ptr [ebp-0x4],0x4
1000bd4c:	85 c0                	test   eax,eax
1000bd4e:	74 09                	je     0x1000bd59
1000bd50:	8b c8                	mov    ecx,eax
1000bd52:	e8 a9 bd 00 00       	call   0x10017b00
1000bd57:	eb 02                	jmp    0x1000bd5b
1000bd59:	33 c0                	xor    eax,eax
1000bd5b:	8b 4d ec             	mov    ecx,dword ptr [ebp-0x14]
1000bd5e:	89 88 d0 01 00 00    	mov    dword ptr [eax+0x1d0],ecx
1000bd64:	8b cb                	mov    ecx,ebx
1000bd66:	50                   	push   eax
1000bd67:	c6 45 fc 00          	mov    byte ptr [ebp-0x4],0x0
1000bd6b:	e8 a0 c4 00 00       	call   0x10018210
1000bd70:	6a ff                	push   0xffffffff
1000bd72:	ff 75 ec             	push   dword ptr [ebp-0x14]
1000bd75:	8b cf                	mov    ecx,edi
1000bd77:	ff b3 d0 01 00 00    	push   dword ptr [ebx+0x1d0]
1000bd7d:	e8 1e d2 ff ff       	call   0x10008fa0
1000bd82:	8b cf                	mov    ecx,edi
1000bd84:	e8 17 61 00 00       	call   0x10011ea0
1000bd89:	8b cf                	mov    ecx,edi
1000bd8b:	e8 c0 5f 00 00       	call   0x10011d50
1000bd90:	8b 8f fc 00 00 00    	mov    ecx,dword ptr [edi+0xfc]
1000bd96:	ff 15 b0 28 02 10    	call   dword ptr ds:0x100228b0
1000bd9c:	8b c8                	mov    ecx,eax
1000bd9e:	e8 dd 84 00 00       	call   0x10014280
1000bda3:	6a 01                	push   0x1
1000bda5:	8b ce                	mov    ecx,esi
1000bda7:	ff 15 28 21 02 10    	call   dword ptr ds:0x10022128
1000bdad:	68 78 02 00 00       	push   0x278
1000bdb2:	8b f0                	mov    esi,eax
1000bdb4:	e8 c2 0e 01 00       	call   0x1001cc7b
1000bdb9:	83 c4 04             	add    esp,0x4
1000bdbc:	89 45 e4             	mov    dword ptr [ebp-0x1c],eax
1000bdbf:	c6 45 fc 05          	mov    byte ptr [ebp-0x4],0x5
1000bdc3:	85 c0                	test   eax,eax
1000bdc5:	74 09                	je     0x1000bdd0
1000bdc7:	8b c8                	mov    ecx,eax
1000bdc9:	e8 32 bd 00 00       	call   0x10017b00
1000bdce:	eb 02                	jmp    0x1000bdd2
1000bdd0:	33 c0                	xor    eax,eax
1000bdd2:	50                   	push   eax
1000bdd3:	8b cb                	mov    ecx,ebx
1000bdd5:	c6 45 fc 00          	mov    byte ptr [ebp-0x4],0x0
1000bdd9:	89 b0 d0 01 00 00    	mov    dword ptr [eax+0x1d0],esi
1000bddf:	e8 2c c4 00 00       	call   0x10018210
1000bde4:	6a ff                	push   0xffffffff
1000bde6:	56                   	push   esi
1000bde7:	ff b3 d0 01 00 00    	push   dword ptr [ebx+0x1d0]
1000bded:	8b cf                	mov    ecx,edi
1000bdef:	e8 ac d1 ff ff       	call   0x10008fa0
1000bdf4:	8b cf                	mov    ecx,edi
1000bdf6:	e8 a5 60 00 00       	call   0x10011ea0
1000bdfb:	8b cf                	mov    ecx,edi
1000bdfd:	e8 4e 5f 00 00       	call   0x10011d50
1000be02:	8b 8f fc 00 00 00    	mov    ecx,dword ptr [edi+0xfc]
1000be08:	8b 1d b0 28 02 10    	mov    ebx,dword ptr ds:0x100228b0
1000be0e:	ff d3                	call   ebx
1000be10:	8b c8                	mov    ecx,eax
1000be12:	e8 69 84 00 00       	call   0x10014280
1000be17:	8b 8f 1c 01 00 00    	mov    ecx,dword ptr [edi+0x11c]
1000be1d:	6a 00                	push   0x0
1000be1f:	ff 15 b8 20 02 10    	call   dword ptr ds:0x100220b8
1000be25:	8b c8                	mov    ecx,eax
1000be27:	ff 15 7c 20 02 10    	call   dword ptr ds:0x1002207c
1000be2d:	eb 06                	jmp    0x1000be35
1000be2f:	8b 1d b0 28 02 10    	mov    ebx,dword ptr ds:0x100228b0
1000be35:	83 7f 2c 04          	cmp    dword ptr [edi+0x2c],0x4
1000be39:	0f 85 77 02 00 00    	jne    0x1000c0b6
1000be3f:	8b 8f fc 00 00 00    	mov    ecx,dword ptr [edi+0xfc]
1000be45:	ff d3                	call   ebx
1000be47:	50                   	push   eax
1000be48:	b9 90 bc 05 10       	mov    ecx,0x1005bc90
1000be4d:	ff 15 54 24 02 10    	call   dword ptr ds:0x10022454
1000be53:	8b f0                	mov    esi,eax
1000be55:	8b ce                	mov    ecx,esi
1000be57:	ff 76 7c             	push   dword ptr [esi+0x7c]
1000be5a:	ff 76 78             	push   dword ptr [esi+0x78]
1000be5d:	e8 2e b1 00 00       	call   0x10016f90
1000be62:	8b 4e 7c             	mov    ecx,dword ptr [esi+0x7c]
1000be65:	8b d8                	mov    ebx,eax
1000be67:	41                   	inc    ecx
1000be68:	6a 01                	push   0x1
1000be6a:	51                   	push   ecx
1000be6b:	8b ce                	mov    ecx,esi
1000be6d:	e8 3e 99 00 00       	call   0x100157b0
1000be72:	84 c0                	test   al,al
1000be74:	0f 85 ba 00 00 00    	jne    0x1000bf34
1000be7a:	6a 00                	push   0x0
1000be7c:	8d 4d a4             	lea    ecx,[ebp-0x5c]
1000be7f:	ff 15 28 2a 02 10    	call   dword ptr ds:0x10022a28
1000be85:	8d 45 e4             	lea    eax,[ebp-0x1c]
1000be88:	50                   	push   eax
1000be89:	8d 4d f3             	lea    ecx,[ebp-0xd]
1000be8c:	e8 3f a0 ff ff       	call   0x10005ed0
1000be91:	50                   	push   eax
1000be92:	8d 4d a4             	lea    ecx,[ebp-0x5c]
1000be95:	c6 45 fc 07          	mov    byte ptr [ebp-0x4],0x7
1000be99:	ff 15 38 2a 02 10    	call   dword ptr ds:0x10022a38
1000be9f:	8d 4d e4             	lea    ecx,[ebp-0x1c]
1000bea2:	ff 15 a4 23 02 10    	call   dword ptr ds:0x100223a4
1000bea8:	8d 45 e4             	lea    eax,[ebp-0x1c]
1000beab:	50                   	push   eax
1000beac:	8d 4d f3             	lea    ecx,[ebp-0xd]
1000beaf:	e8 8c 99 ff ff       	call   0x10005840
1000beb4:	50                   	push   eax
1000beb5:	8d 4d a4             	lea    ecx,[ebp-0x5c]
1000beb8:	c6 45 fc 08          	mov    byte ptr [ebp-0x4],0x8
1000bebc:	ff 15 40 2a 02 10    	call   dword ptr ds:0x10022a40
1000bec2:	8d 4d e4             	lea    ecx,[ebp-0x1c]
1000bec5:	c6 45 fc 06          	mov    byte ptr [ebp-0x4],0x6
1000bec9:	ff 15 a4 23 02 10    	call   dword ptr ds:0x100223a4
1000becf:	68 00 04 40 00       	push   0x400400
1000bed4:	8d 4d a4             	lea    ecx,[ebp-0x5c]
1000bed7:	ff 15 30 2a 02 10    	call   dword ptr ds:0x10022a30
1000bedd:	68 00 04 00 00       	push   0x400
1000bee2:	8d 4d a4             	lea    ecx,[ebp-0x5c]
1000bee5:	ff 15 34 2a 02 10    	call   dword ptr ds:0x10022a34
1000beeb:	8d 4d a4             	lea    ecx,[ebp-0x5c]
1000beee:	ff 15 24 2a 02 10    	call   dword ptr ds:0x10022a24
1000bef4:	3d 00 00 40 00       	cmp    eax,0x400000
1000bef9:	75 0f                	jne    0x1000bf0a
1000befb:	a1 2c 2a 02 10       	mov    eax,ds:0x10022a2c
1000bf00:	8d 4d a4             	lea    ecx,[ebp-0x5c]
1000bf03:	ff d0                	call   eax
1000bf05:	e9 3b 02 00 00       	jmp    0x1000c145
1000bf0a:	3d 00 04 00 00       	cmp    eax,0x400
1000bf0f:	75 15                	jne    0x1000bf26
1000bf11:	53                   	push   ebx
1000bf12:	8b cf                	mov    ecx,edi
1000bf14:	e8 37 e0 ff ff       	call   0x10009f50
1000bf19:	6a 00                	push   0x0
1000bf1b:	6a 00                	push   0x0
1000bf1d:	8b c8                	mov    ecx,eax
1000bf1f:	e8 6c b0 00 00       	call   0x10016f90
1000bf24:	8b d8                	mov    ebx,eax
1000bf26:	a1 2c 2a 02 10       	mov    eax,ds:0x10022a2c
1000bf2b:	8d 4d a4             	lea    ecx,[ebp-0x5c]
1000bf2e:	c6 45 fc 00          	mov    byte ptr [ebp-0x4],0x0
1000bf32:	ff d0                	call   eax
1000bf34:	ff 77 38             	push   dword ptr [edi+0x38]
1000bf37:	8b 8f 1c 01 00 00    	mov    ecx,dword ptr [edi+0x11c]
1000bf3d:	8d 45 dc             	lea    eax,[ebp-0x24]
1000bf40:	50                   	push   eax
1000bf41:	6a 00                	push   0x0
1000bf43:	ff 15 bc 20 02 10    	call   dword ptr ds:0x100220bc
1000bf49:	8b c8                	mov    ecx,eax
1000bf4b:	ff 15 68 20 02 10    	call   dword ptr ds:0x10022068
1000bf51:	33 f6                	xor    esi,esi
1000bf53:	c6 45 fc 09          	mov    byte ptr [ebp-0x4],0x9
1000bf57:	39 75 dc             	cmp    dword ptr [ebp-0x24],esi
1000bf5a:	7e 34                	jle    0x1000bf90
1000bf5c:	0f 1f 40 00          	nop    dword ptr [eax+0x0]
1000bf60:	8b 45 e0             	mov    eax,dword ptr [ebp-0x20]
1000bf63:	8b 0c b0             	mov    ecx,dword ptr [eax+esi*4]
1000bf66:	ff 15 08 21 02 10    	call   dword ptr ds:0x10022108
1000bf6c:	8b 45 e0             	mov    eax,dword ptr [ebp-0x20]
1000bf6f:	6a 01                	push   0x1
1000bf71:	8b 0c b0             	mov    ecx,dword ptr [eax+esi*4]
1000bf74:	ff 15 0c 21 02 10    	call   dword ptr ds:0x1002210c
1000bf7a:	8b 45 e0             	mov    eax,dword ptr [ebp-0x20]
1000bf7d:	8b 0c b0             	mov    ecx,dword ptr [eax+esi*4]
1000bf80:	85 c9                	test   ecx,ecx
1000bf82:	74 06                	je     0x1000bf8a
1000bf84:	8b 01                	mov    eax,dword ptr [ecx]
1000bf86:	6a 01                	push   0x1
1000bf88:	ff 10                	call   dword ptr [eax]
1000bf8a:	46                   	inc    esi
1000bf8b:	3b 75 dc             	cmp    esi,dword ptr [ebp-0x24]
1000bf8e:	7c d0                	jl     0x1000bf60
1000bf90:	8b 8b cc 01 00 00    	mov    ecx,dword ptr [ebx+0x1cc]
1000bf96:	8b 01                	mov    eax,dword ptr [ecx]
1000bf98:	83 f8 01             	cmp    eax,0x1
1000bf9b:	74 4c                	je     0x1000bfe9
1000bf9d:	85 c0                	test   eax,eax
1000bf9f:	74 48                	je     0x1000bfe9
1000bfa1:	f7 41 08 ff ff ff 7f 	test   dword ptr [ecx+0x8],0x7fffffff
1000bfa8:	75 19                	jne    0x1000bfc3
1000bfaa:	6a 02                	push   0x2
1000bfac:	6a 00                	push   0x0
1000bfae:	6a 04                	push   0x4
1000bfb0:	6a 04                	push   0x4
1000bfb2:	ff 15 64 24 02 10    	call   dword ptr ds:0x10022464
1000bfb8:	83 c4 10             	add    esp,0x10
1000bfbb:	89 83 cc 01 00 00    	mov    dword ptr [ebx+0x1cc],eax
1000bfc1:	eb 26                	jmp    0x1000bfe9
1000bfc3:	51                   	push   ecx
1000bfc4:	8b c4                	mov    eax,esp
1000bfc6:	c7 00 00 00 00 00    	mov    dword ptr [eax],0x0
1000bfcc:	8b 8b cc 01 00 00    	mov    ecx,dword ptr [ebx+0x1cc]
1000bfd2:	8b 41 08             	mov    eax,dword ptr [ecx+0x8]
1000bfd5:	25 ff ff ff 7f       	and    eax,0x7fffffff
1000bfda:	50                   	push   eax
1000bfdb:	ff 71 04             	push   dword ptr [ecx+0x4]
1000bfde:	8d 8b cc 01 00 00    	lea    ecx,[ebx+0x1cc]
1000bfe4:	e8 47 18 00 00       	call   0x1000d830
1000bfe9:	8b 8b cc 01 00 00    	mov    ecx,dword ptr [ebx+0x1cc]
1000bfef:	8b 41 0c             	mov    eax,dword ptr [ecx+0xc]
1000bff2:	8b 04 01             	mov    eax,dword ptr [ecx+eax*1]
1000bff5:	8b b0 d0 01 00 00    	mov    esi,dword ptr [eax+0x1d0]
1000bffb:	8b ce                	mov    ecx,esi
1000bffd:	56                   	push   esi
1000bffe:	ff 15 18 21 02 10    	call   dword ptr ds:0x10022118
1000c004:	8b 8f 1c 01 00 00    	mov    ecx,dword ptr [edi+0x11c]
1000c00a:	50                   	push   eax
1000c00b:	6a 00                	push   0x0
1000c00d:	ff 15 b8 20 02 10    	call   dword ptr ds:0x100220b8
1000c013:	8b c8                	mov    ecx,eax
1000c015:	ff 15 e0 20 02 10    	call   dword ptr ds:0x100220e0
1000c01b:	8b 8b d0 01 00 00    	mov    ecx,dword ptr [ebx+0x1d0]
1000c021:	6a 00                	push   0x0
1000c023:	ff 15 d8 20 02 10    	call   dword ptr ds:0x100220d8
1000c029:	8b 8b d0 01 00 00    	mov    ecx,dword ptr [ebx+0x1d0]
1000c02f:	6a 01                	push   0x1
1000c031:	ff 15 d4 20 02 10    	call   dword ptr ds:0x100220d4
1000c037:	8b ce                	mov    ecx,esi
1000c039:	ff 15 20 21 02 10    	call   dword ptr ds:0x10022120
1000c03f:	68 78 02 00 00       	push   0x278
1000c044:	8b f0                	mov    esi,eax
1000c046:	e8 30 0c 01 00       	call   0x1001cc7b
1000c04b:	83 c4 04             	add    esp,0x4
1000c04e:	89 45 e4             	mov    dword ptr [ebp-0x1c],eax
1000c051:	c6 45 fc 0a          	mov    byte ptr [ebp-0x4],0xa
1000c055:	85 c0                	test   eax,eax
1000c057:	74 09                	je     0x1000c062
1000c059:	8b c8                	mov    ecx,eax
1000c05b:	e8 a0 ba 00 00       	call   0x10017b00
1000c060:	eb 02                	jmp    0x1000c064
1000c062:	33 c0                	xor    eax,eax
1000c064:	50                   	push   eax
1000c065:	8b cb                	mov    ecx,ebx
1000c067:	c6 45 fc 09          	mov    byte ptr [ebp-0x4],0x9
1000c06b:	89 b0 d0 01 00 00    	mov    dword ptr [eax+0x1d0],esi
1000c071:	e8 9a c1 00 00       	call   0x10018210
1000c076:	6a ff                	push   0xffffffff
1000c078:	56                   	push   esi
1000c079:	ff b3 d0 01 00 00    	push   dword ptr [ebx+0x1d0]
1000c07f:	8b cf                	mov    ecx,edi
1000c081:	e8 1a cf ff ff       	call   0x10008fa0
1000c086:	8b cf                	mov    ecx,edi
1000c088:	e8 13 5e 00 00       	call   0x10011ea0
1000c08d:	8b cf                	mov    ecx,edi
1000c08f:	e8 bc 5c 00 00       	call   0x10011d50
1000c094:	8b 8f fc 00 00 00    	mov    ecx,dword ptr [edi+0xfc]
1000c09a:	8b 1d b0 28 02 10    	mov    ebx,dword ptr ds:0x100228b0
1000c0a0:	ff d3                	call   ebx
1000c0a2:	8b c8                	mov    ecx,eax
1000c0a4:	e8 d7 81 00 00       	call   0x10014280
1000c0a9:	8d 4d dc             	lea    ecx,[ebp-0x24]
1000c0ac:	c6 45 fc 00          	mov    byte ptr [ebp-0x4],0x0
1000c0b0:	ff 15 cc 20 02 10    	call   dword ptr ds:0x100220cc
1000c0b6:	83 7f 2c 01          	cmp    dword ptr [edi+0x2c],0x1
1000c0ba:	75 3f                	jne    0x1000c0fb
1000c0bc:	8b 8f fc 00 00 00    	mov    ecx,dword ptr [edi+0xfc]
1000c0c2:	ff d3                	call   ebx
1000c0c4:	50                   	push   eax
1000c0c5:	b9 90 bc 05 10       	mov    ecx,0x1005bc90
1000c0ca:	ff 15 54 24 02 10    	call   dword ptr ds:0x10022454
1000c0d0:	8b c8                	mov    ecx,eax
1000c0d2:	ff 70 7c             	push   dword ptr [eax+0x7c]
1000c0d5:	ff 70 78             	push   dword ptr [eax+0x78]
1000c0d8:	e8 b3 ae 00 00       	call   0x10016f90
1000c0dd:	8b f0                	mov    esi,eax
1000c0df:	6a 00                	push   0x0
1000c0e1:	8b 8e d0 01 00 00    	mov    ecx,dword ptr [esi+0x1d0]
1000c0e7:	ff 15 d8 20 02 10    	call   dword ptr ds:0x100220d8
1000c0ed:	8b 8e d0 01 00 00    	mov    ecx,dword ptr [esi+0x1d0]
1000c0f3:	6a 01                	push   0x1
1000c0f5:	ff 15 d4 20 02 10    	call   dword ptr ds:0x100220d4
1000c0fb:	8b 8f 1c 01 00 00    	mov    ecx,dword ptr [edi+0x11c]
1000c101:	6a 00                	push   0x0
1000c103:	ff 15 b8 20 02 10    	call   dword ptr ds:0x100220b8
1000c109:	8b c8                	mov    ecx,eax
1000c10b:	ff 15 7c 20 02 10    	call   dword ptr ds:0x1002207c
1000c111:	8b 4d e8             	mov    ecx,dword ptr [ebp-0x18]
1000c114:	e8 87 8f 00 00       	call   0x100150a0
1000c119:	8b 4d e8             	mov    ecx,dword ptr [ebp-0x18]
1000c11c:	e8 4f ae 00 00       	call   0x10016f70
1000c121:	8b cf                	mov    ecx,edi
1000c123:	e8 28 5c 00 00       	call   0x10011d50
1000c128:	8b cf                	mov    ecx,edi
1000c12a:	e8 71 5d 00 00       	call   0x10011ea0
1000c12f:	8b cf                	mov    ecx,edi
1000c131:	e8 ea f4 ff ff       	call   0x1000b620
1000c136:	8b 8f fc 00 00 00    	mov    ecx,dword ptr [edi+0xfc]
1000c13c:	ff d3                	call   ebx
1000c13e:	8b c8                	mov    ecx,eax
1000c140:	e8 3b 81 00 00       	call   0x10014280
1000c145:	8d 4d d4             	lea    ecx,[ebp-0x2c]
1000c148:	ff 15 cc 20 02 10    	call   dword ptr ds:0x100220cc
1000c14e:	8b 4d f4             	mov    ecx,dword ptr [ebp-0xc]
1000c151:	64 89 0d 00 00 00 00 	mov    dword ptr fs:0x0,ecx
1000c158:	59                   	pop    ecx
1000c159:	5f                   	pop    edi
1000c15a:	5e                   	pop    esi
1000c15b:	5b                   	pop    ebx
1000c15c:	8b e5                	mov    esp,ebp
1000c15e:	5d                   	pop    ebp
1000c15f:	c3                   	ret


; ===== new_iteration =====

/mnt/data/work_stage117/re_inputs/modules/pm_auto.dll:     file format pei-i386


disassembly of section .text:

1000c3a0 <.text+0xb3a0>:
1000c3a0:	55                   	push   ebp
1000c3a1:	8b ec                	mov    ebp,esp
1000c3a3:	6a ff                	push   0xffffffff
1000c3a5:	68 a9 f5 01 10       	push   0x1001f5a9
1000c3aa:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000c3b0:	50                   	push   eax
1000c3b1:	83 ec 30             	sub    esp,0x30
1000c3b4:	53                   	push   ebx
1000c3b5:	56                   	push   esi
1000c3b6:	57                   	push   edi
1000c3b7:	a1 cc f0 06 10       	mov    eax,ds:0x1006f0cc
1000c3bc:	33 c5                	xor    eax,ebp
1000c3be:	50                   	push   eax
1000c3bf:	8d 45 f4             	lea    eax,[ebp-0xc]
1000c3c2:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000c3c8:	8b d9                	mov    ebx,ecx
1000c3ca:	8b 8b fc 00 00 00    	mov    ecx,dword ptr [ebx+0xfc]
1000c3d0:	ff 15 b0 28 02 10    	call   dword ptr ds:0x100228b0
1000c3d6:	50                   	push   eax
1000c3d7:	b9 90 bc 05 10       	mov    ecx,0x1005bc90
1000c3dc:	ff 15 54 24 02 10    	call   dword ptr ds:0x10022454
1000c3e2:	8b c8                	mov    ecx,eax
1000c3e4:	89 45 e8             	mov    dword ptr [ebp-0x18],eax
1000c3e7:	ff 70 7c             	push   dword ptr [eax+0x7c]
1000c3ea:	ff 70 78             	push   dword ptr [eax+0x78]
1000c3ed:	e8 9e ab 00 00       	call   0x10016f90
1000c3f2:	ff 73 38             	push   dword ptr [ebx+0x38]
1000c3f5:	8b 8b 1c 01 00 00    	mov    ecx,dword ptr [ebx+0x11c]
1000c3fb:	8b f8                	mov    edi,eax
1000c3fd:	8d 45 dc             	lea    eax,[ebp-0x24]
1000c400:	89 7d ec             	mov    dword ptr [ebp-0x14],edi
1000c403:	50                   	push   eax
1000c404:	6a 00                	push   0x0
1000c406:	ff 15 bc 20 02 10    	call   dword ptr ds:0x100220bc
1000c40c:	8b c8                	mov    ecx,eax
1000c40e:	ff 15 68 20 02 10    	call   dword ptr ds:0x10022068
1000c414:	33 f6                	xor    esi,esi
1000c416:	c7 45 fc 00 00 00 00 	mov    dword ptr [ebp-0x4],0x0
1000c41d:	39 75 dc             	cmp    dword ptr [ebp-0x24],esi
1000c420:	7e 35                	jle    0x1000c457
1000c422:	8b 3d 08 21 02 10    	mov    edi,dword ptr ds:0x10022108
1000c428:	8b 45 e0             	mov    eax,dword ptr [ebp-0x20]
1000c42b:	8b 0c b0             	mov    ecx,dword ptr [eax+esi*4]
1000c42e:	ff d7                	call   edi
1000c430:	8b 45 e0             	mov    eax,dword ptr [ebp-0x20]
1000c433:	6a 01                	push   0x1
1000c435:	8b 0c b0             	mov    ecx,dword ptr [eax+esi*4]
1000c438:	ff 15 0c 21 02 10    	call   dword ptr ds:0x1002210c
1000c43e:	8b 45 e0             	mov    eax,dword ptr [ebp-0x20]
1000c441:	8b 0c b0             	mov    ecx,dword ptr [eax+esi*4]
1000c444:	85 c9                	test   ecx,ecx
1000c446:	74 06                	je     0x1000c44e
1000c448:	8b 01                	mov    eax,dword ptr [ecx]
1000c44a:	6a 01                	push   0x1
1000c44c:	ff 10                	call   dword ptr [eax]
1000c44e:	46                   	inc    esi
1000c44f:	3b 75 dc             	cmp    esi,dword ptr [ebp-0x24]
1000c452:	7c d4                	jl     0x1000c428
1000c454:	8b 7d ec             	mov    edi,dword ptr [ebp-0x14]
1000c457:	83 7b 2c 02          	cmp    dword ptr [ebx+0x2c],0x2
1000c45b:	0f 85 6b 01 00 00    	jne    0x1000c5cc
1000c461:	8b 75 e8             	mov    esi,dword ptr [ebp-0x18]
1000c464:	8b ce                	mov    ecx,esi
1000c466:	6a 01                	push   0x1
1000c468:	8b 46 7c             	mov    eax,dword ptr [esi+0x7c]
1000c46b:	40                   	inc    eax
1000c46c:	50                   	push   eax
1000c46d:	e8 3e 93 00 00       	call   0x100157b0
1000c472:	84 c0                	test   al,al
1000c474:	0f 85 b5 00 00 00    	jne    0x1000c52f
1000c47a:	6a 00                	push   0x0
1000c47c:	8d 4d c4             	lea    ecx,[ebp-0x3c]
1000c47f:	ff 15 28 2a 02 10    	call   dword ptr ds:0x10022a28
1000c485:	8d 45 ec             	lea    eax,[ebp-0x14]
1000c488:	c6 45 f3 00          	mov    byte ptr [ebp-0xd],0x0
1000c48c:	50                   	push   eax
1000c48d:	8d 4d f3             	lea    ecx,[ebp-0xd]
1000c490:	e8 8b 93 ff ff       	call   0x10005820
1000c495:	50                   	push   eax
1000c496:	8d 4d c4             	lea    ecx,[ebp-0x3c]
1000c499:	c6 45 fc 02          	mov    byte ptr [ebp-0x4],0x2
1000c49d:	ff 15 38 2a 02 10    	call   dword ptr ds:0x10022a38
1000c4a3:	8d 4d ec             	lea    ecx,[ebp-0x14]
1000c4a6:	ff 15 a4 23 02 10    	call   dword ptr ds:0x100223a4
1000c4ac:	8d 45 ec             	lea    eax,[ebp-0x14]
1000c4af:	50                   	push   eax
1000c4b0:	8d 4d f3             	lea    ecx,[ebp-0xd]
1000c4b3:	e8 d8 9e ff ff       	call   0x10006390
1000c4b8:	50                   	push   eax
1000c4b9:	8d 4d c4             	lea    ecx,[ebp-0x3c]
1000c4bc:	c6 45 fc 03          	mov    byte ptr [ebp-0x4],0x3
1000c4c0:	ff 15 40 2a 02 10    	call   dword ptr ds:0x10022a40
1000c4c6:	8d 4d ec             	lea    ecx,[ebp-0x14]
1000c4c9:	c6 45 fc 01          	mov    byte ptr [ebp-0x4],0x1
1000c4cd:	ff 15 a4 23 02 10    	call   dword ptr ds:0x100223a4
1000c4d3:	68 00 04 40 00       	push   0x400400
1000c4d8:	8d 4d c4             	lea    ecx,[ebp-0x3c]
1000c4db:	ff 15 30 2a 02 10    	call   dword ptr ds:0x10022a30
1000c4e1:	68 00 04 00 00       	push   0x400
1000c4e6:	8d 4d c4             	lea    ecx,[ebp-0x3c]
1000c4e9:	ff 15 34 2a 02 10    	call   dword ptr ds:0x10022a34
1000c4ef:	8d 4d c4             	lea    ecx,[ebp-0x3c]
1000c4f2:	ff 15 24 2a 02 10    	call   dword ptr ds:0x10022a24
1000c4f8:	3d 00 00 40 00       	cmp    eax,0x400000
1000c4fd:	0f 84 4a 01 00 00    	je     0x1000c64d
1000c503:	3d 00 04 00 00       	cmp    eax,0x400
1000c508:	75 18                	jne    0x1000c522
1000c50a:	57                   	push   edi
1000c50b:	8b cb                	mov    ecx,ebx
1000c50d:	e8 3e da ff ff       	call   0x10009f50
1000c512:	6a 00                	push   0x0
1000c514:	6a 00                	push   0x0
1000c516:	8b c8                	mov    ecx,eax
1000c518:	89 45 e8             	mov    dword ptr [ebp-0x18],eax
1000c51b:	e8 70 aa 00 00       	call   0x10016f90
1000c520:	8b f8                	mov    edi,eax
1000c522:	8d 4d c4             	lea    ecx,[ebp-0x3c]
1000c525:	c6 45 fc 00          	mov    byte ptr [ebp-0x4],0x0
1000c529:	ff 15 2c 2a 02 10    	call   dword ptr ds:0x10022a2c
1000c52f:	8b b7 d0 01 00 00    	mov    esi,dword ptr [edi+0x1d0]
1000c535:	8b 8b 1c 01 00 00    	mov    ecx,dword ptr [ebx+0x11c]
1000c53b:	56                   	push   esi
1000c53c:	6a 00                	push   0x0
1000c53e:	ff 15 b8 20 02 10    	call   dword ptr ds:0x100220b8
1000c544:	8b c8                	mov    ecx,eax
1000c546:	ff 15 e8 20 02 10    	call   dword ptr ds:0x100220e8
1000c54c:	8b ce                	mov    ecx,esi
1000c54e:	ff 15 24 21 02 10    	call   dword ptr ds:0x10022124
1000c554:	6a 00                	push   0x0
1000c556:	8b ce                	mov    ecx,esi
1000c558:	ff 15 28 21 02 10    	call   dword ptr ds:0x10022128
1000c55e:	68 78 02 00 00       	push   0x278
1000c563:	8b f0                	mov    esi,eax
1000c565:	e8 11 07 01 00       	call   0x1001cc7b
1000c56a:	83 c4 04             	add    esp,0x4
1000c56d:	89 45 e4             	mov    dword ptr [ebp-0x1c],eax
1000c570:	c6 45 fc 04          	mov    byte ptr [ebp-0x4],0x4
1000c574:	85 c0                	test   eax,eax
1000c576:	74 09                	je     0x1000c581
1000c578:	8b c8                	mov    ecx,eax
1000c57a:	e8 81 b5 00 00       	call   0x10017b00
1000c57f:	eb 02                	jmp    0x1000c583
1000c581:	33 c0                	xor    eax,eax
1000c583:	50                   	push   eax
1000c584:	8b cf                	mov    ecx,edi
1000c586:	c6 45 fc 00          	mov    byte ptr [ebp-0x4],0x0
1000c58a:	89 b0 d0 01 00 00    	mov    dword ptr [eax+0x1d0],esi
1000c590:	e8 7b bc 00 00       	call   0x10018210
1000c595:	6a ff                	push   0xffffffff
1000c597:	56                   	push   esi
1000c598:	ff b7 d0 01 00 00    	push   dword ptr [edi+0x1d0]
1000c59e:	8b cb                	mov    ecx,ebx
1000c5a0:	e8 fb c9 ff ff       	call   0x10008fa0
1000c5a5:	8b cb                	mov    ecx,ebx
1000c5a7:	e8 f4 58 00 00       	call   0x10011ea0
1000c5ac:	8b cb                	mov    ecx,ebx
1000c5ae:	e8 9d 57 00 00       	call   0x10011d50
1000c5b3:	8b 8b fc 00 00 00    	mov    ecx,dword ptr [ebx+0xfc]
1000c5b9:	a1 b0 28 02 10       	mov    eax,ds:0x100228b0
1000c5be:	ff d0                	call   eax
1000c5c0:	8b c8                	mov    ecx,eax
1000c5c2:	e8 b9 7c 00 00       	call   0x10014280
1000c5c7:	e9 42 02 00 00       	jmp    0x1000c80e
1000c5cc:	6a 00                	push   0x0
1000c5ce:	8d 4d c4             	lea    ecx,[ebp-0x3c]
1000c5d1:	ff 15 28 2a 02 10    	call   dword ptr ds:0x10022a28
1000c5d7:	8d 45 ec             	lea    eax,[ebp-0x14]
1000c5da:	50                   	push   eax
1000c5db:	8d 4d f3             	lea    ecx,[ebp-0xd]
1000c5de:	e8 bd 9e ff ff       	call   0x100064a0
1000c5e3:	50                   	push   eax
1000c5e4:	8d 4d c4             	lea    ecx,[ebp-0x3c]
1000c5e7:	c6 45 fc 06          	mov    byte ptr [ebp-0x4],0x6
1000c5eb:	ff 15 38 2a 02 10    	call   dword ptr ds:0x10022a38
1000c5f1:	8d 4d ec             	lea    ecx,[ebp-0x14]
1000c5f4:	ff 15 a4 23 02 10    	call   dword ptr ds:0x100223a4
1000c5fa:	8d 45 ec             	lea    eax,[ebp-0x14]
1000c5fd:	50                   	push   eax
1000c5fe:	8d 4d f3             	lea    ecx,[ebp-0xd]
1000c601:	e8 7a 91 ff ff       	call   0x10005780
1000c606:	50                   	push   eax
1000c607:	8d 4d c4             	lea    ecx,[ebp-0x3c]
1000c60a:	c6 45 fc 07          	mov    byte ptr [ebp-0x4],0x7
1000c60e:	ff 15 40 2a 02 10    	call   dword ptr ds:0x10022a40
1000c614:	8d 4d ec             	lea    ecx,[ebp-0x14]
1000c617:	c6 45 fc 05          	mov    byte ptr [ebp-0x4],0x5
1000c61b:	ff 15 a4 23 02 10    	call   dword ptr ds:0x100223a4
1000c621:	68 00 04 40 00       	push   0x400400
1000c626:	8d 4d c4             	lea    ecx,[ebp-0x3c]
1000c629:	ff 15 30 2a 02 10    	call   dword ptr ds:0x10022a30
1000c62f:	68 00 04 00 00       	push   0x400
1000c634:	8d 4d c4             	lea    ecx,[ebp-0x3c]
1000c637:	ff 15 34 2a 02 10    	call   dword ptr ds:0x10022a34
1000c63d:	8d 4d c4             	lea    ecx,[ebp-0x3c]
1000c640:	ff 15 24 2a 02 10    	call   dword ptr ds:0x10022a24
1000c646:	3d 00 00 40 00       	cmp    eax,0x400000
1000c64b:	75 0e                	jne    0x1000c65b
1000c64d:	8d 4d c4             	lea    ecx,[ebp-0x3c]
1000c650:	ff 15 2c 2a 02 10    	call   dword ptr ds:0x10022a2c
1000c656:	e9 f6 01 00 00       	jmp    0x1000c851
1000c65b:	3d 00 04 00 00       	cmp    eax,0x400
1000c660:	0f 85 9b 01 00 00    	jne    0x1000c801
1000c666:	8b 8b fc 00 00 00    	mov    ecx,dword ptr [ebx+0xfc]
1000c66c:	a1 b0 28 02 10       	mov    eax,ds:0x100228b0
1000c671:	ff d0                	call   eax
1000c673:	50                   	push   eax
1000c674:	b9 90 bc 05 10       	mov    ecx,0x1005bc90
1000c679:	ff 15 54 24 02 10    	call   dword ptr ds:0x10022454
1000c67f:	8b c8                	mov    ecx,eax
1000c681:	ff 70 7c             	push   dword ptr [eax+0x7c]
1000c684:	ff 70 78             	push   dword ptr [eax+0x78]
1000c687:	e8 04 a9 00 00       	call   0x10016f90
1000c68c:	89 45 e4             	mov    dword ptr [ebp-0x1c],eax
1000c68f:	8b 88 c4 01 00 00    	mov    ecx,dword ptr [eax+0x1c4]
1000c695:	85 c9                	test   ecx,ecx
1000c697:	0f 84 8b 00 00 00    	je     0x1000c728
1000c69d:	6a 00                	push   0x0
1000c69f:	6a 00                	push   0x0
1000c6a1:	e8 3a af 00 00       	call   0x100175e0
1000c6a6:	bf 01 00 00 00       	mov    edi,0x1
1000c6ab:	8d b0 cc 01 00 00    	lea    esi,[eax+0x1cc]
1000c6b1:	8b 06                	mov    eax,dword ptr [esi]
1000c6b3:	39 78 04             	cmp    dword ptr [eax+0x4],edi
1000c6b6:	0f 8e 18 01 00 00    	jle    0x1000c7d4
1000c6bc:	0f 1f 40 00          	nop    dword ptr [eax+0x0]
1000c6c0:	8b 0e                	mov    ecx,dword ptr [esi]
1000c6c2:	8b 01                	mov    eax,dword ptr [ecx]
1000c6c4:	83 f8 01             	cmp    eax,0x1
1000c6c7:	74 40                	je     0x1000c709
1000c6c9:	85 c0                	test   eax,eax
1000c6cb:	74 3c                	je     0x1000c709
1000c6cd:	f7 41 08 ff ff ff 7f 	test   dword ptr [ecx+0x8],0x7fffffff
1000c6d4:	75 15                	jne    0x1000c6eb
1000c6d6:	6a 02                	push   0x2
1000c6d8:	6a 00                	push   0x0
1000c6da:	6a 04                	push   0x4
1000c6dc:	6a 04                	push   0x4
1000c6de:	ff 15 64 24 02 10    	call   dword ptr ds:0x10022464
1000c6e4:	83 c4 10             	add    esp,0x10
1000c6e7:	89 06                	mov    dword ptr [esi],eax
1000c6e9:	eb 1e                	jmp    0x1000c709
1000c6eb:	51                   	push   ecx
1000c6ec:	8b c4                	mov    eax,esp
1000c6ee:	c7 00 00 00 00 00    	mov    dword ptr [eax],0x0
1000c6f4:	8b 0e                	mov    ecx,dword ptr [esi]
1000c6f6:	8b 41 08             	mov    eax,dword ptr [ecx+0x8]
1000c6f9:	25 ff ff ff 7f       	and    eax,0x7fffffff
1000c6fe:	50                   	push   eax
1000c6ff:	ff 71 04             	push   dword ptr [ecx+0x4]
1000c702:	8b ce                	mov    ecx,esi
1000c704:	e8 27 11 00 00       	call   0x1000d830
1000c709:	8b 0e                	mov    ecx,dword ptr [esi]
1000c70b:	8b 41 0c             	mov    eax,dword ptr [ecx+0xc]
1000c70e:	8d 04 b8             	lea    eax,[eax+edi*4]
1000c711:	ff 34 08             	push   dword ptr [eax+ecx*1]
1000c714:	8b cb                	mov    ecx,ebx
1000c716:	e8 45 14 00 00       	call   0x1000db60
1000c71b:	8b 06                	mov    eax,dword ptr [esi]
1000c71d:	47                   	inc    edi
1000c71e:	3b 78 04             	cmp    edi,dword ptr [eax+0x4]
1000c721:	7c 9d                	jl     0x1000c6c0
1000c723:	e9 ac 00 00 00       	jmp    0x1000c7d4
1000c728:	05 cc 01 00 00       	add    eax,0x1cc
1000c72d:	8d 4d ec             	lea    ecx,[ebp-0x14]
1000c730:	50                   	push   eax
1000c731:	e8 6a 81 ff ff       	call   0x100048a0
1000c736:	8b 75 ec             	mov    esi,dword ptr [ebp-0x14]
1000c739:	bf 01 00 00 00       	mov    edi,0x1
1000c73e:	c6 45 fc 08          	mov    byte ptr [ebp-0x4],0x8
1000c742:	39 7e 04             	cmp    dword ptr [esi+0x4],edi
1000c745:	7e 62                	jle    0x1000c7a9
1000c747:	8b 06                	mov    eax,dword ptr [esi]
1000c749:	83 f8 01             	cmp    eax,0x1
1000c74c:	74 45                	je     0x1000c793
1000c74e:	85 c0                	test   eax,eax
1000c750:	74 41                	je     0x1000c793
1000c752:	f7 46 08 ff ff ff 7f 	test   dword ptr [esi+0x8],0x7fffffff
1000c759:	75 18                	jne    0x1000c773
1000c75b:	6a 02                	push   0x2
1000c75d:	6a 00                	push   0x0
1000c75f:	6a 04                	push   0x4
1000c761:	6a 04                	push   0x4
1000c763:	ff 15 64 24 02 10    	call   dword ptr ds:0x10022464
1000c769:	8b f0                	mov    esi,eax
1000c76b:	83 c4 10             	add    esp,0x10
1000c76e:	89 75 ec             	mov    dword ptr [ebp-0x14],esi
1000c771:	eb 20                	jmp    0x1000c793
1000c773:	51                   	push   ecx
1000c774:	8b c4                	mov    eax,esp
1000c776:	8d 4d ec             	lea    ecx,[ebp-0x14]
1000c779:	c7 00 00 00 00 00    	mov    dword ptr [eax],0x0
1000c77f:	8b 46 08             	mov    eax,dword ptr [esi+0x8]
1000c782:	25 ff ff ff 7f       	and    eax,0x7fffffff
1000c787:	50                   	push   eax
1000c788:	ff 76 04             	push   dword ptr [esi+0x4]
1000c78b:	e8 a0 10 00 00       	call   0x1000d830
1000c790:	8b 75 ec             	mov    esi,dword ptr [ebp-0x14]
1000c793:	8b 46 0c             	mov    eax,dword ptr [esi+0xc]
1000c796:	8b cb                	mov    ecx,ebx
1000c798:	8d 04 b8             	lea    eax,[eax+edi*4]
1000c79b:	ff 34 30             	push   dword ptr [eax+esi*1]
1000c79e:	e8 bd 13 00 00       	call   0x1000db60
1000c7a3:	47                   	inc    edi
1000c7a4:	3b 7e 04             	cmp    edi,dword ptr [esi+0x4]
1000c7a7:	7c 9e                	jl     0x1000c747
1000c7a9:	8b 06                	mov    eax,dword ptr [esi]
1000c7ab:	c6 45 fc 05          	mov    byte ptr [ebp-0x4],0x5
1000c7af:	85 c0                	test   eax,eax
1000c7b1:	74 13                	je     0x1000c7c6
1000c7b3:	83 f8 ff             	cmp    eax,0xffffffff
1000c7b6:	74 1c                	je     0x1000c7d4
1000c7b8:	83 c8 ff             	or     eax,0xffffffff
1000c7bb:	f0 0f c1 06          	lock xadd dword ptr [esi],eax
1000c7bf:	0f 95 c0             	setne  al
1000c7c2:	84 c0                	test   al,al
1000c7c4:	75 0e                	jne    0x1000c7d4
1000c7c6:	6a 04                	push   0x4
1000c7c8:	6a 04                	push   0x4
1000c7ca:	56                   	push   esi
1000c7cb:	ff 15 68 24 02 10    	call   dword ptr ds:0x10022468
1000c7d1:	83 c4 0c             	add    esp,0xc
1000c7d4:	8b 75 e4             	mov    esi,dword ptr [ebp-0x1c]
1000c7d7:	6a 03                	push   0x3
1000c7d9:	8b 8e d0 01 00 00    	mov    ecx,dword ptr [esi+0x1d0]
1000c7df:	ff 15 d4 20 02 10    	call   dword ptr ds:0x100220d4
1000c7e5:	8b 8e d0 01 00 00    	mov    ecx,dword ptr [esi+0x1d0]
1000c7eb:	6a 01                	push   0x1
1000c7ed:	ff 15 44 21 02 10    	call   dword ptr ds:0x10022144
1000c7f3:	8b 8e d0 01 00 00    	mov    ecx,dword ptr [esi+0x1d0]
1000c7f9:	6a 00                	push   0x0
1000c7fb:	ff 15 d8 20 02 10    	call   dword ptr ds:0x100220d8
1000c801:	8d 4d c4             	lea    ecx,[ebp-0x3c]
1000c804:	c6 45 fc 00          	mov    byte ptr [ebp-0x4],0x0
1000c808:	ff 15 2c 2a 02 10    	call   dword ptr ds:0x10022a2c
1000c80e:	8b 8b 1c 01 00 00    	mov    ecx,dword ptr [ebx+0x11c]
1000c814:	6a 00                	push   0x0
1000c816:	ff 15 b8 20 02 10    	call   dword ptr ds:0x100220b8
1000c81c:	8b c8                	mov    ecx,eax
1000c81e:	ff 15 7c 20 02 10    	call   dword ptr ds:0x1002207c
1000c824:	8b 75 e8             	mov    esi,dword ptr [ebp-0x18]
1000c827:	8b ce                	mov    ecx,esi
1000c829:	e8 72 88 00 00       	call   0x100150a0
1000c82e:	8b ce                	mov    ecx,esi
1000c830:	e8 3b a7 00 00       	call   0x10016f70
1000c835:	8b ce                	mov    ecx,esi
1000c837:	e8 44 7a 00 00       	call   0x10014280
1000c83c:	8b cb                	mov    ecx,ebx
1000c83e:	e8 0d 55 00 00       	call   0x10011d50
1000c843:	8b cb                	mov    ecx,ebx
1000c845:	e8 56 56 00 00       	call   0x10011ea0
1000c84a:	8b cb                	mov    ecx,ebx
1000c84c:	e8 cf ed ff ff       	call   0x1000b620
1000c851:	8d 4d dc             	lea    ecx,[ebp-0x24]
1000c854:	ff 15 cc 20 02 10    	call   dword ptr ds:0x100220cc
1000c85a:	8b 4d f4             	mov    ecx,dword ptr [ebp-0xc]
1000c85d:	64 89 0d 00 00 00 00 	mov    dword ptr fs:0x0,ecx
1000c864:	59                   	pop    ecx
1000c865:	5f                   	pop    edi
1000c866:	5e                   	pop    esi
1000c867:	5b                   	pop    ebx
1000c868:	8b e5                	mov    esp,ebp
1000c86a:	5d                   	pop    ebp
1000c86b:	c3                   	ret
1000c86c:	cc                   	int3
1000c86d:	cc                   	int3
1000c86e:	cc                   	int3
1000c86f:	cc                   	int3


; ===== new_sequence =====

/mnt/data/work_stage117/re_inputs/modules/pm_auto.dll:     file format pei-i386


disassembly of section .text:

1000c870 <.text+0xb870>:
1000c870:	55                   	push   ebp
1000c871:	8b ec                	mov    ebp,esp
1000c873:	6a ff                	push   0xffffffff
1000c875:	68 4e f6 01 10       	push   0x1001f64e
1000c87a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000c880:	50                   	push   eax
1000c881:	83 ec 50             	sub    esp,0x50
1000c884:	53                   	push   ebx
1000c885:	56                   	push   esi
1000c886:	57                   	push   edi
1000c887:	a1 cc f0 06 10       	mov    eax,ds:0x1006f0cc
1000c88c:	33 c5                	xor    eax,ebp
1000c88e:	50                   	push   eax
1000c88f:	8d 45 f4             	lea    eax,[ebp-0xc]
1000c892:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000c898:	8b f9                	mov    edi,ecx
1000c89a:	8b 8f fc 00 00 00    	mov    ecx,dword ptr [edi+0xfc]
1000c8a0:	ff 15 b0 28 02 10    	call   dword ptr ds:0x100228b0
1000c8a6:	50                   	push   eax
1000c8a7:	b9 90 bc 05 10       	mov    ecx,0x1005bc90
1000c8ac:	ff 15 54 24 02 10    	call   dword ptr ds:0x10022454
1000c8b2:	8b c8                	mov    ecx,eax
1000c8b4:	89 45 ec             	mov    dword ptr [ebp-0x14],eax
1000c8b7:	ff 70 7c             	push   dword ptr [eax+0x7c]
1000c8ba:	ff 70 78             	push   dword ptr [eax+0x78]
1000c8bd:	e8 ce a6 00 00       	call   0x10016f90
1000c8c2:	ff 77 38             	push   dword ptr [edi+0x38]
1000c8c5:	8b 8f 1c 01 00 00    	mov    ecx,dword ptr [edi+0x11c]
1000c8cb:	8b d8                	mov    ebx,eax
1000c8cd:	8d 45 d4             	lea    eax,[ebp-0x2c]
1000c8d0:	50                   	push   eax
1000c8d1:	6a 00                	push   0x0
1000c8d3:	ff 15 bc 20 02 10    	call   dword ptr ds:0x100220bc
1000c8d9:	8b c8                	mov    ecx,eax
1000c8db:	ff 15 68 20 02 10    	call   dword ptr ds:0x10022068
1000c8e1:	33 f6                	xor    esi,esi
1000c8e3:	c7 45 fc 00 00 00 00 	mov    dword ptr [ebp-0x4],0x0
1000c8ea:	39 75 d4             	cmp    dword ptr [ebp-0x2c],esi
1000c8ed:	7e 31                	jle    0x1000c920
1000c8ef:	90                   	nop
1000c8f0:	8b 45 d8             	mov    eax,dword ptr [ebp-0x28]
1000c8f3:	8b 0c b0             	mov    ecx,dword ptr [eax+esi*4]
1000c8f6:	ff 15 08 21 02 10    	call   dword ptr ds:0x10022108
1000c8fc:	8b 45 d8             	mov    eax,dword ptr [ebp-0x28]
1000c8ff:	6a 01                	push   0x1
1000c901:	8b 0c b0             	mov    ecx,dword ptr [eax+esi*4]
1000c904:	ff 15 0c 21 02 10    	call   dword ptr ds:0x1002210c
1000c90a:	8b 45 d8             	mov    eax,dword ptr [ebp-0x28]
1000c90d:	8b 0c b0             	mov    ecx,dword ptr [eax+esi*4]
1000c910:	85 c9                	test   ecx,ecx
1000c912:	74 06                	je     0x1000c91a
1000c914:	8b 01                	mov    eax,dword ptr [ecx]
1000c916:	6a 01                	push   0x1
1000c918:	ff 10                	call   dword ptr [eax]
1000c91a:	46                   	inc    esi
1000c91b:	3b 75 d4             	cmp    esi,dword ptr [ebp-0x2c]
1000c91e:	7c d0                	jl     0x1000c8f0
1000c920:	83 7f 2c 02          	cmp    dword ptr [edi+0x2c],0x2
1000c924:	8b 75 ec             	mov    esi,dword ptr [ebp-0x14]
1000c927:	0f 85 0f 02 00 00    	jne    0x1000cb3c
1000c92d:	8b 46 7c             	mov    eax,dword ptr [esi+0x7c]
1000c930:	8b ce                	mov    ecx,esi
1000c932:	6a 02                	push   0x2
1000c934:	40                   	inc    eax
1000c935:	50                   	push   eax
1000c936:	e8 75 8e 00 00       	call   0x100157b0
1000c93b:	84 c0                	test   al,al
1000c93d:	0f 85 c6 00 00 00    	jne    0x1000ca09
1000c943:	6a 00                	push   0x0
1000c945:	8d 4d bc             	lea    ecx,[ebp-0x44]
1000c948:	ff 15 28 2a 02 10    	call   dword ptr ds:0x10022a28
1000c94e:	8d 45 e0             	lea    eax,[ebp-0x20]
1000c951:	c6 45 f3 00          	mov    byte ptr [ebp-0xd],0x0
1000c955:	50                   	push   eax
1000c956:	8d 4d f3             	lea    ecx,[ebp-0xd]
1000c959:	e8 62 a2 ff ff       	call   0x10006bc0
1000c95e:	50                   	push   eax
1000c95f:	8d 4d bc             	lea    ecx,[ebp-0x44]
1000c962:	c6 45 fc 02          	mov    byte ptr [ebp-0x4],0x2
1000c966:	ff 15 38 2a 02 10    	call   dword ptr ds:0x10022a38
1000c96c:	8d 4d e0             	lea    ecx,[ebp-0x20]
1000c96f:	ff 15 a4 23 02 10    	call   dword ptr ds:0x100223a4
1000c975:	8d 45 e0             	lea    eax,[ebp-0x20]
1000c978:	50                   	push   eax
1000c979:	8d 4d f3             	lea    ecx,[ebp-0xd]
1000c97c:	e8 0f 9b ff ff       	call   0x10006490
1000c981:	50                   	push   eax
1000c982:	8d 4d bc             	lea    ecx,[ebp-0x44]
1000c985:	c6 45 fc 03          	mov    byte ptr [ebp-0x4],0x3
1000c989:	ff 15 40 2a 02 10    	call   dword ptr ds:0x10022a40
1000c98f:	8d 4d e0             	lea    ecx,[ebp-0x20]
1000c992:	c6 45 fc 01          	mov    byte ptr [ebp-0x4],0x1
1000c996:	ff 15 a4 23 02 10    	call   dword ptr ds:0x100223a4
1000c99c:	68 00 04 40 00       	push   0x400400
1000c9a1:	8d 4d bc             	lea    ecx,[ebp-0x44]
1000c9a4:	ff 15 30 2a 02 10    	call   dword ptr ds:0x10022a30
1000c9aa:	68 00 04 00 00       	push   0x400
1000c9af:	8d 4d bc             	lea    ecx,[ebp-0x44]
1000c9b2:	ff 15 34 2a 02 10    	call   dword ptr ds:0x10022a34
1000c9b8:	8d 4d bc             	lea    ecx,[ebp-0x44]
1000c9bb:	ff 15 24 2a 02 10    	call   dword ptr ds:0x10022a24
1000c9c1:	3d 00 00 40 00       	cmp    eax,0x400000
1000c9c6:	75 0e                	jne    0x1000c9d6
1000c9c8:	8d 4d bc             	lea    ecx,[ebp-0x44]
1000c9cb:	ff 15 2c 2a 02 10    	call   dword ptr ds:0x10022a2c
1000c9d1:	e9 31 04 00 00       	jmp    0x1000ce07
1000c9d6:	3d 00 04 00 00       	cmp    eax,0x400
1000c9db:	75 1c                	jne    0x1000c9f9
1000c9dd:	53                   	push   ebx
1000c9de:	8b cf                	mov    ecx,edi
1000c9e0:	e8 6b d5 ff ff       	call   0x10009f50
1000c9e5:	8b f0                	mov    esi,eax
1000c9e7:	6a 00                	push   0x0
1000c9e9:	6a 00                	push   0x0
1000c9eb:	8b ce                	mov    ecx,esi
1000c9ed:	89 75 ec             	mov    dword ptr [ebp-0x14],esi
1000c9f0:	e8 9b a5 00 00       	call   0x10016f90
1000c9f5:	8b d8                	mov    ebx,eax
1000c9f7:	eb 03                	jmp    0x1000c9fc
1000c9f9:	8b 75 ec             	mov    esi,dword ptr [ebp-0x14]
1000c9fc:	8d 4d bc             	lea    ecx,[ebp-0x44]
1000c9ff:	c6 45 fc 00          	mov    byte ptr [ebp-0x4],0x0
1000ca03:	ff 15 2c 2a 02 10    	call   dword ptr ds:0x10022a2c
1000ca09:	8b 83 d0 01 00 00    	mov    eax,dword ptr [ebx+0x1d0]
1000ca0f:	8b 8f 1c 01 00 00    	mov    ecx,dword ptr [edi+0x11c]
1000ca15:	6a 02                	push   0x2
1000ca17:	50                   	push   eax
1000ca18:	6a 00                	push   0x0
1000ca1a:	89 45 e8             	mov    dword ptr [ebp-0x18],eax
1000ca1d:	ff 15 b8 20 02 10    	call   dword ptr ds:0x100220b8
1000ca23:	8b c8                	mov    ecx,eax
1000ca25:	ff 15 f0 20 02 10    	call   dword ptr ds:0x100220f0
1000ca2b:	8b 4d e8             	mov    ecx,dword ptr [ebp-0x18]
1000ca2e:	ff 15 24 21 02 10    	call   dword ptr ds:0x10022124
1000ca34:	8b 4d e8             	mov    ecx,dword ptr [ebp-0x18]
1000ca37:	6a 00                	push   0x0
1000ca39:	ff 15 28 21 02 10    	call   dword ptr ds:0x10022128
1000ca3f:	68 78 02 00 00       	push   0x278
1000ca44:	89 45 e0             	mov    dword ptr [ebp-0x20],eax
1000ca47:	e8 2f 02 01 00       	call   0x1001cc7b
1000ca4c:	83 c4 04             	add    esp,0x4
1000ca4f:	89 45 dc             	mov    dword ptr [ebp-0x24],eax
1000ca52:	c6 45 fc 04          	mov    byte ptr [ebp-0x4],0x4
1000ca56:	85 c0                	test   eax,eax
1000ca58:	74 09                	je     0x1000ca63
1000ca5a:	8b c8                	mov    ecx,eax
1000ca5c:	e8 9f b0 00 00       	call   0x10017b00
1000ca61:	eb 02                	jmp    0x1000ca65
1000ca63:	33 c0                	xor    eax,eax
1000ca65:	8b 4d e0             	mov    ecx,dword ptr [ebp-0x20]
1000ca68:	89 88 d0 01 00 00    	mov    dword ptr [eax+0x1d0],ecx
1000ca6e:	8b cb                	mov    ecx,ebx
1000ca70:	50                   	push   eax
1000ca71:	c6 45 fc 00          	mov    byte ptr [ebp-0x4],0x0
1000ca75:	e8 96 b7 00 00       	call   0x10018210
1000ca7a:	6a ff                	push   0xffffffff
1000ca7c:	ff 75 e0             	push   dword ptr [ebp-0x20]
1000ca7f:	8b cf                	mov    ecx,edi
1000ca81:	ff b3 d0 01 00 00    	push   dword ptr [ebx+0x1d0]
1000ca87:	e8 14 c5 ff ff       	call   0x10008fa0
1000ca8c:	8b cf                	mov    ecx,edi
1000ca8e:	e8 0d 54 00 00       	call   0x10011ea0
1000ca93:	8b cf                	mov    ecx,edi
1000ca95:	e8 b6 52 00 00       	call   0x10011d50
1000ca9a:	8b 8f fc 00 00 00    	mov    ecx,dword ptr [edi+0xfc]
1000caa0:	ff 15 b0 28 02 10    	call   dword ptr ds:0x100228b0
1000caa6:	8b c8                	mov    ecx,eax
1000caa8:	e8 d3 77 00 00       	call   0x10014280
1000caad:	8b 4d e8             	mov    ecx,dword ptr [ebp-0x18]
1000cab0:	6a 01                	push   0x1
1000cab2:	ff 15 28 21 02 10    	call   dword ptr ds:0x10022128
1000cab8:	68 78 02 00 00       	push   0x278
1000cabd:	89 45 e0             	mov    dword ptr [ebp-0x20],eax
1000cac0:	e8 b6 01 01 00       	call   0x1001cc7b
1000cac5:	83 c4 04             	add    esp,0x4
1000cac8:	89 45 dc             	mov    dword ptr [ebp-0x24],eax
1000cacb:	c6 45 fc 05          	mov    byte ptr [ebp-0x4],0x5
1000cacf:	85 c0                	test   eax,eax
1000cad1:	74 09                	je     0x1000cadc
1000cad3:	8b c8                	mov    ecx,eax
1000cad5:	e8 26 b0 00 00       	call   0x10017b00
1000cada:	eb 02                	jmp    0x1000cade
1000cadc:	33 c0                	xor    eax,eax
1000cade:	8b 4d e0             	mov    ecx,dword ptr [ebp-0x20]
1000cae1:	89 88 d0 01 00 00    	mov    dword ptr [eax+0x1d0],ecx
1000cae7:	8b cb                	mov    ecx,ebx
1000cae9:	50                   	push   eax
1000caea:	c6 45 fc 00          	mov    byte ptr [ebp-0x4],0x0
1000caee:	e8 1d b7 00 00       	call   0x10018210
1000caf3:	6a ff                	push   0xffffffff
1000caf5:	ff 75 e0             	push   dword ptr [ebp-0x20]
1000caf8:	8b cf                	mov    ecx,edi
1000cafa:	ff b3 d0 01 00 00    	push   dword ptr [ebx+0x1d0]
1000cb00:	e8 9b c4 ff ff       	call   0x10008fa0
1000cb05:	8b cf                	mov    ecx,edi
1000cb07:	e8 94 53 00 00       	call   0x10011ea0
1000cb0c:	8b cf                	mov    ecx,edi
1000cb0e:	e8 3d 52 00 00       	call   0x10011d50
1000cb13:	8b 8f fc 00 00 00    	mov    ecx,dword ptr [edi+0xfc]
1000cb19:	ff 15 b0 28 02 10    	call   dword ptr ds:0x100228b0
1000cb1f:	8b c8                	mov    ecx,eax
1000cb21:	e8 5a 77 00 00       	call   0x10014280
1000cb26:	8b 8f 1c 01 00 00    	mov    ecx,dword ptr [edi+0x11c]
1000cb2c:	6a 00                	push   0x0
1000cb2e:	ff 15 b8 20 02 10    	call   dword ptr ds:0x100220b8
1000cb34:	8b c8                	mov    ecx,eax
1000cb36:	ff 15 7c 20 02 10    	call   dword ptr ds:0x1002207c
1000cb3c:	83 7f 2c 03          	cmp    dword ptr [edi+0x2c],0x3
1000cb40:	75 1c                	jne    0x1000cb5e
1000cb42:	8b 8b d0 01 00 00    	mov    ecx,dword ptr [ebx+0x1d0]
1000cb48:	6a 02                	push   0x2
1000cb4a:	ff 15 d8 20 02 10    	call   dword ptr ds:0x100220d8
1000cb50:	8b 8b d0 01 00 00    	mov    ecx,dword ptr [ebx+0x1d0]
1000cb56:	6a 02                	push   0x2
1000cb58:	ff 15 d4 20 02 10    	call   dword ptr ds:0x100220d4
1000cb5e:	83 7f 2c 04          	cmp    dword ptr [edi+0x2c],0x4
1000cb62:	0f 85 53 02 00 00    	jne    0x1000cdbb
1000cb68:	8b 75 ec             	mov    esi,dword ptr [ebp-0x14]
1000cb6b:	8b ce                	mov    ecx,esi
1000cb6d:	6a 01                	push   0x1
1000cb6f:	8b 46 7c             	mov    eax,dword ptr [esi+0x7c]
1000cb72:	40                   	inc    eax
1000cb73:	50                   	push   eax
1000cb74:	e8 37 8c 00 00       	call   0x100157b0
1000cb79:	84 c0                	test   al,al
1000cb7b:	0f 85 bb 00 00 00    	jne    0x1000cc3c
1000cb81:	6a 00                	push   0x0
1000cb83:	8d 4d a4             	lea    ecx,[ebp-0x5c]
1000cb86:	ff 15 28 2a 02 10    	call   dword ptr ds:0x10022a28
1000cb8c:	8d 45 e0             	lea    eax,[ebp-0x20]
1000cb8f:	50                   	push   eax
1000cb90:	8d 4d f3             	lea    ecx,[ebp-0xd]
1000cb93:	e8 d8 95 ff ff       	call   0x10006170
1000cb98:	50                   	push   eax
1000cb99:	8d 4d a4             	lea    ecx,[ebp-0x5c]
1000cb9c:	c6 45 fc 07          	mov    byte ptr [ebp-0x4],0x7
1000cba0:	ff 15 38 2a 02 10    	call   dword ptr ds:0x10022a38
1000cba6:	8d 4d e0             	lea    ecx,[ebp-0x20]
1000cba9:	ff 15 a4 23 02 10    	call   dword ptr ds:0x100223a4
1000cbaf:	8d 45 e0             	lea    eax,[ebp-0x20]
1000cbb2:	50                   	push   eax
1000cbb3:	8d 4d f3             	lea    ecx,[ebp-0xd]
1000cbb6:	e8 f5 8b ff ff       	call   0x100057b0
1000cbbb:	50                   	push   eax
1000cbbc:	8d 4d a4             	lea    ecx,[ebp-0x5c]
1000cbbf:	c6 45 fc 08          	mov    byte ptr [ebp-0x4],0x8
1000cbc3:	ff 15 40 2a 02 10    	call   dword ptr ds:0x10022a40
1000cbc9:	8d 4d e0             	lea    ecx,[ebp-0x20]
1000cbcc:	c6 45 fc 06          	mov    byte ptr [ebp-0x4],0x6
1000cbd0:	ff 15 a4 23 02 10    	call   dword ptr ds:0x100223a4
1000cbd6:	68 00 04 40 00       	push   0x400400
1000cbdb:	8d 4d a4             	lea    ecx,[ebp-0x5c]
1000cbde:	ff 15 30 2a 02 10    	call   dword ptr ds:0x10022a30
1000cbe4:	68 00 04 00 00       	push   0x400
1000cbe9:	8d 4d a4             	lea    ecx,[ebp-0x5c]
1000cbec:	ff 15 34 2a 02 10    	call   dword ptr ds:0x10022a34
1000cbf2:	8d 4d a4             	lea    ecx,[ebp-0x5c]
1000cbf5:	ff 15 24 2a 02 10    	call   dword ptr ds:0x10022a24
1000cbfb:	3d 00 00 40 00       	cmp    eax,0x400000
1000cc00:	75 0e                	jne    0x1000cc10
1000cc02:	8d 4d a4             	lea    ecx,[ebp-0x5c]
1000cc05:	ff 15 2c 2a 02 10    	call   dword ptr ds:0x10022a2c
1000cc0b:	e9 f7 01 00 00       	jmp    0x1000ce07
1000cc10:	3d 00 04 00 00       	cmp    eax,0x400
1000cc15:	75 18                	jne    0x1000cc2f
1000cc17:	53                   	push   ebx
1000cc18:	8b cf                	mov    ecx,edi
1000cc1a:	e8 31 d3 ff ff       	call   0x10009f50
1000cc1f:	6a 00                	push   0x0
1000cc21:	6a 00                	push   0x0
1000cc23:	8b c8                	mov    ecx,eax
1000cc25:	89 45 ec             	mov    dword ptr [ebp-0x14],eax
1000cc28:	e8 63 a3 00 00       	call   0x10016f90
1000cc2d:	8b d8                	mov    ebx,eax
1000cc2f:	8d 4d a4             	lea    ecx,[ebp-0x5c]
1000cc32:	c6 45 fc 00          	mov    byte ptr [ebp-0x4],0x0
1000cc36:	ff 15 2c 2a 02 10    	call   dword ptr ds:0x10022a2c
1000cc3c:	ff 77 38             	push   dword ptr [edi+0x38]
1000cc3f:	8b 8f 1c 01 00 00    	mov    ecx,dword ptr [edi+0x11c]
1000cc45:	8d 45 e4             	lea    eax,[ebp-0x1c]
1000cc48:	50                   	push   eax
1000cc49:	6a 00                	push   0x0
1000cc4b:	ff 15 bc 20 02 10    	call   dword ptr ds:0x100220bc
1000cc51:	8b c8                	mov    ecx,eax
1000cc53:	ff 15 68 20 02 10    	call   dword ptr ds:0x10022068
1000cc59:	33 f6                	xor    esi,esi
1000cc5b:	c6 45 fc 09          	mov    byte ptr [ebp-0x4],0x9
1000cc5f:	39 75 e4             	cmp    dword ptr [ebp-0x1c],esi
1000cc62:	7e 30                	jle    0x1000cc94
1000cc64:	8b 45 e8             	mov    eax,dword ptr [ebp-0x18]
1000cc67:	8b 0c b0             	mov    ecx,dword ptr [eax+esi*4]
1000cc6a:	ff 15 08 21 02 10    	call   dword ptr ds:0x10022108
1000cc70:	8b 45 e8             	mov    eax,dword ptr [ebp-0x18]
1000cc73:	6a 01                	push   0x1
1000cc75:	8b 0c b0             	mov    ecx,dword ptr [eax+esi*4]
1000cc78:	ff 15 0c 21 02 10    	call   dword ptr ds:0x1002210c
1000cc7e:	8b 45 e8             	mov    eax,dword ptr [ebp-0x18]
1000cc81:	8b 0c b0             	mov    ecx,dword ptr [eax+esi*4]
1000cc84:	85 c9                	test   ecx,ecx
1000cc86:	74 06                	je     0x1000cc8e
1000cc88:	8b 01                	mov    eax,dword ptr [ecx]
1000cc8a:	6a 01                	push   0x1
1000cc8c:	ff 10                	call   dword ptr [eax]
1000cc8e:	46                   	inc    esi
1000cc8f:	3b 75 e4             	cmp    esi,dword ptr [ebp-0x1c]
1000cc92:	7c d0                	jl     0x1000cc64
1000cc94:	8b 8b cc 01 00 00    	mov    ecx,dword ptr [ebx+0x1cc]
1000cc9a:	8b 01                	mov    eax,dword ptr [ecx]
1000cc9c:	83 f8 01             	cmp    eax,0x1
1000cc9f:	74 4c                	je     0x1000cced
1000cca1:	85 c0                	test   eax,eax
1000cca3:	74 48                	je     0x1000cced
1000cca5:	f7 41 08 ff ff ff 7f 	test   dword ptr [ecx+0x8],0x7fffffff
1000ccac:	75 19                	jne    0x1000ccc7
1000ccae:	6a 02                	push   0x2
1000ccb0:	6a 00                	push   0x0
1000ccb2:	6a 04                	push   0x4
1000ccb4:	6a 04                	push   0x4
1000ccb6:	ff 15 64 24 02 10    	call   dword ptr ds:0x10022464
1000ccbc:	83 c4 10             	add    esp,0x10
1000ccbf:	89 83 cc 01 00 00    	mov    dword ptr [ebx+0x1cc],eax
1000ccc5:	eb 26                	jmp    0x1000cced
1000ccc7:	51                   	push   ecx
1000ccc8:	8b c4                	mov    eax,esp
1000ccca:	c7 00 00 00 00 00    	mov    dword ptr [eax],0x0
1000ccd0:	8b 8b cc 01 00 00    	mov    ecx,dword ptr [ebx+0x1cc]
1000ccd6:	8b 41 08             	mov    eax,dword ptr [ecx+0x8]
1000ccd9:	25 ff ff ff 7f       	and    eax,0x7fffffff
1000ccde:	50                   	push   eax
1000ccdf:	ff 71 04             	push   dword ptr [ecx+0x4]
1000cce2:	8d 8b cc 01 00 00    	lea    ecx,[ebx+0x1cc]
1000cce8:	e8 43 0b 00 00       	call   0x1000d830
1000cced:	8b 8b cc 01 00 00    	mov    ecx,dword ptr [ebx+0x1cc]
1000ccf3:	8b 41 0c             	mov    eax,dword ptr [ecx+0xc]
1000ccf6:	8b 04 01             	mov    eax,dword ptr [ecx+eax*1]
1000ccf9:	8b b0 d0 01 00 00    	mov    esi,dword ptr [eax+0x1d0]
1000ccff:	8b ce                	mov    ecx,esi
1000cd01:	56                   	push   esi
1000cd02:	ff 15 18 21 02 10    	call   dword ptr ds:0x10022118
1000cd08:	8b 8f 1c 01 00 00    	mov    ecx,dword ptr [edi+0x11c]
1000cd0e:	50                   	push   eax
1000cd0f:	6a 00                	push   0x0
1000cd11:	ff 15 b8 20 02 10    	call   dword ptr ds:0x100220b8
1000cd17:	8b c8                	mov    ecx,eax
1000cd19:	ff 15 e0 20 02 10    	call   dword ptr ds:0x100220e0
1000cd1f:	8b 8b d0 01 00 00    	mov    ecx,dword ptr [ebx+0x1d0]
1000cd25:	6a 02                	push   0x2
1000cd27:	ff 15 d8 20 02 10    	call   dword ptr ds:0x100220d8
1000cd2d:	8b 8b d0 01 00 00    	mov    ecx,dword ptr [ebx+0x1d0]
1000cd33:	6a 02                	push   0x2
1000cd35:	ff 15 d4 20 02 10    	call   dword ptr ds:0x100220d4
1000cd3b:	8b ce                	mov    ecx,esi
1000cd3d:	ff 15 20 21 02 10    	call   dword ptr ds:0x10022120
1000cd43:	68 78 02 00 00       	push   0x278
1000cd48:	8b f0                	mov    esi,eax
1000cd4a:	e8 2c ff 00 00       	call   0x1001cc7b
1000cd4f:	83 c4 04             	add    esp,0x4
1000cd52:	89 45 dc             	mov    dword ptr [ebp-0x24],eax
1000cd55:	c6 45 fc 0a          	mov    byte ptr [ebp-0x4],0xa
1000cd59:	85 c0                	test   eax,eax
1000cd5b:	74 09                	je     0x1000cd66
1000cd5d:	8b c8                	mov    ecx,eax
1000cd5f:	e8 9c ad 00 00       	call   0x10017b00
1000cd64:	eb 02                	jmp    0x1000cd68
1000cd66:	33 c0                	xor    eax,eax
1000cd68:	50                   	push   eax
1000cd69:	8b cb                	mov    ecx,ebx
1000cd6b:	c6 45 fc 09          	mov    byte ptr [ebp-0x4],0x9
1000cd6f:	89 b0 d0 01 00 00    	mov    dword ptr [eax+0x1d0],esi
1000cd75:	e8 96 b4 00 00       	call   0x10018210
1000cd7a:	6a ff                	push   0xffffffff
1000cd7c:	56                   	push   esi
1000cd7d:	ff b3 d0 01 00 00    	push   dword ptr [ebx+0x1d0]
1000cd83:	8b cf                	mov    ecx,edi
1000cd85:	e8 16 c2 ff ff       	call   0x10008fa0
1000cd8a:	8b cf                	mov    ecx,edi
1000cd8c:	e8 0f 51 00 00       	call   0x10011ea0
1000cd91:	8b cf                	mov    ecx,edi
1000cd93:	e8 b8 4f 00 00       	call   0x10011d50
1000cd98:	8b 8f fc 00 00 00    	mov    ecx,dword ptr [edi+0xfc]
1000cd9e:	ff 15 b0 28 02 10    	call   dword ptr ds:0x100228b0
1000cda4:	8b c8                	mov    ecx,eax
1000cda6:	e8 d5 74 00 00       	call   0x10014280
1000cdab:	8d 4d e4             	lea    ecx,[ebp-0x1c]
1000cdae:	c6 45 fc 00          	mov    byte ptr [ebp-0x4],0x0
1000cdb2:	ff 15 cc 20 02 10    	call   dword ptr ds:0x100220cc
1000cdb8:	8b 75 ec             	mov    esi,dword ptr [ebp-0x14]
1000cdbb:	8b 8f 1c 01 00 00    	mov    ecx,dword ptr [edi+0x11c]
1000cdc1:	6a 00                	push   0x0
1000cdc3:	ff 15 b8 20 02 10    	call   dword ptr ds:0x100220b8
1000cdc9:	8b c8                	mov    ecx,eax
1000cdcb:	ff 15 7c 20 02 10    	call   dword ptr ds:0x1002207c
1000cdd1:	8b ce                	mov    ecx,esi
1000cdd3:	e8 c8 82 00 00       	call   0x100150a0
1000cdd8:	8b ce                	mov    ecx,esi
1000cdda:	e8 91 a1 00 00       	call   0x10016f70
1000cddf:	8b cf                	mov    ecx,edi
1000cde1:	e8 6a 4f 00 00       	call   0x10011d50
1000cde6:	8b cf                	mov    ecx,edi
1000cde8:	e8 b3 50 00 00       	call   0x10011ea0
1000cded:	8b cf                	mov    ecx,edi
1000cdef:	e8 2c e8 ff ff       	call   0x1000b620
1000cdf4:	8b 8f fc 00 00 00    	mov    ecx,dword ptr [edi+0xfc]
1000cdfa:	ff 15 b0 28 02 10    	call   dword ptr ds:0x100228b0
1000ce00:	8b c8                	mov    ecx,eax
1000ce02:	e8 79 74 00 00       	call   0x10014280
1000ce07:	8d 4d d4             	lea    ecx,[ebp-0x2c]
1000ce0a:	ff 15 cc 20 02 10    	call   dword ptr ds:0x100220cc
1000ce10:	8b 4d f4             	mov    ecx,dword ptr [ebp-0xc]
1000ce13:	64 89 0d 00 00 00 00 	mov    dword ptr fs:0x0,ecx
1000ce1a:	59                   	pop    ecx
1000ce1b:	5f                   	pop    edi
1000ce1c:	5e                   	pop    esi
1000ce1d:	5b                   	pop    ebx
1000ce1e:	8b e5                	mov    esp,ebp
1000ce20:	5d                   	pop    ebp
1000ce21:	c3                   	ret
1000ce22:	cc                   	int3
1000ce23:	cc                   	int3
1000ce24:	cc                   	int3
1000ce25:	cc                   	int3
1000ce26:	cc                   	int3
1000ce27:	cc                   	int3
1000ce28:	cc                   	int3
1000ce29:	cc                   	int3
1000ce2a:	cc                   	int3
1000ce2b:	cc                   	int3
1000ce2c:	cc                   	int3
1000ce2d:	cc                   	int3
1000ce2e:	cc                   	int3
1000ce2f:	cc                   	int3
1000ce30:	55                   	push   ebp
1000ce31:	8b ec                	mov    ebp,esp
1000ce33:	6a ff                	push   0xffffffff
1000ce35:	68 f6 f6 01 10       	push   0x1001f6f6
1000ce3a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000ce40:	50                   	push   eax
1000ce41:	83 ec 68             	sub    esp,0x68
1000ce44:	a1 cc f0 06 10       	mov    eax,ds:0x1006f0cc
1000ce49:	33 c5                	xor    eax,ebp
1000ce4b:	89 45 f0             	mov    dword ptr [ebp-0x10],eax
1000ce4e:	53                   	push   ebx
1000ce4f:	56                   	push   esi
1000ce50:	57                   	push   edi
1000ce51:	50                   	push   eax
1000ce52:	8d 45 f4             	lea    eax,[ebp-0xc]
1000ce55:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000ce5b:	8b f9                	mov    edi,ecx
1000ce5d:	89 7d cc             	mov    dword ptr [ebp-0x34],edi
1000ce60:	8b 8f fc 00 00 00    	mov    ecx,dword ptr [edi+0xfc]
1000ce66:	ff 15 b0 28 02 10    	call   dword ptr ds:0x100228b0
1000ce6c:	50                   	push   eax
1000ce6d:	b9                   	.byte 0xb9
1000ce6e:	90                   	nop
1000ce6f:	bc                   	.byte 0xbc


; ===== insert_after =====

/mnt/data/work_stage117/re_inputs/modules/pm_auto.dll:     file format pei-i386


disassembly of section .text:

1000c160 <.text+0xb160>:
1000c160:	55                   	push   ebp
1000c161:	8b ec                	mov    ebp,esp
1000c163:	83 ec 08             	sub    esp,0x8
1000c166:	53                   	push   ebx
1000c167:	8b d9                	mov    ebx,ecx
1000c169:	e8 52 12 00 00       	call   0x1000d3c0
1000c16e:	84 c0                	test   al,al
1000c170:	0f 84 fc 00 00 00    	je     0x1000c272
1000c176:	8b 8b fc 00 00 00    	mov    ecx,dword ptr [ebx+0xfc]
1000c17c:	57                   	push   edi
1000c17d:	ff 15 b0 28 02 10    	call   dword ptr ds:0x100228b0
1000c183:	50                   	push   eax
1000c184:	b9 90 bc 05 10       	mov    ecx,0x1005bc90
1000c189:	ff 15 54 24 02 10    	call   dword ptr ds:0x10022454
1000c18f:	8b c8                	mov    ecx,eax
1000c191:	89 45 f8             	mov    dword ptr [ebp-0x8],eax
1000c194:	e8 37 ae 00 00       	call   0x10016fd0
1000c199:	8b f8                	mov    edi,eax
1000c19b:	85 ff                	test   edi,edi
1000c19d:	0f 84 ce 00 00 00    	je     0x1000c271
1000c1a3:	8b 4b 38             	mov    ecx,dword ptr [ebx+0x38]
1000c1a6:	56                   	push   esi
1000c1a7:	51                   	push   ecx
1000c1a8:	ff 15 18 21 02 10    	call   dword ptr ds:0x10022118
1000c1ae:	8b 8b 1c 01 00 00    	mov    ecx,dword ptr [ebx+0x11c]
1000c1b4:	50                   	push   eax
1000c1b5:	6a 00                	push   0x0
1000c1b7:	ff 15 b8 20 02 10    	call   dword ptr ds:0x100220b8
1000c1bd:	8b c8                	mov    ecx,eax
1000c1bf:	ff 15 e0 20 02 10    	call   dword ptr ds:0x100220e0
1000c1c5:	8b 87 d4 01 00 00    	mov    eax,dword ptr [edi+0x1d4]
1000c1cb:	05 cc 01 00 00       	add    eax,0x1cc
1000c1d0:	89 45 fc             	mov    dword ptr [ebp-0x4],eax
1000c1d3:	8b 10                	mov    edx,dword ptr [eax]
1000c1d5:	8b 4a 04             	mov    ecx,dword ptr [edx+0x4]
1000c1d8:	8b 42 0c             	mov    eax,dword ptr [edx+0xc]
1000c1db:	8b 72 0c             	mov    esi,dword ptr [edx+0xc]
1000c1de:	03 f2                	add    esi,edx
1000c1e0:	8d 04 88             	lea    eax,[eax+ecx*4]
1000c1e3:	03 c2                	add    eax,edx
1000c1e5:	3b f0                	cmp    esi,eax
1000c1e7:	74 12                	je     0x1000c1fb
1000c1e9:	0f 1f 80 00 00 00 00 	nop    dword ptr [eax+0x0]
1000c1f0:	39 3e                	cmp    dword ptr [esi],edi
1000c1f2:	74 07                	je     0x1000c1fb
1000c1f4:	83 c6 04             	add    esi,0x4
1000c1f7:	3b f0                	cmp    esi,eax
1000c1f9:	75 f5                	jne    0x1000c1f0
1000c1fb:	8b 4d fc             	mov    ecx,dword ptr [ebp-0x4]
1000c1fe:	e8 cd d4 ff ff       	call   0x100096d0
1000c203:	8b 4b 38             	mov    ecx,dword ptr [ebx+0x38]
1000c206:	2b f0                	sub    esi,eax
1000c208:	c1 fe 02             	sar    esi,0x2
1000c20b:	46                   	inc    esi
1000c20c:	56                   	push   esi
1000c20d:	ff b7 d4 01 00 00    	push   dword ptr [edi+0x1d4]
1000c213:	ff 15 20 21 02 10    	call   dword ptr ds:0x10022120
1000c219:	50                   	push   eax
1000c21a:	8b cb                	mov    ecx,ebx
1000c21c:	e8 af cc ff ff       	call   0x10008ed0
1000c221:	8b 4f 08             	mov    ecx,dword ptr [edi+0x8]
1000c224:	8b 75 f8             	mov    esi,dword ptr [ebp-0x8]
1000c227:	89 48 08             	mov    dword ptr [eax+0x8],ecx
1000c22a:	8b 4f 0c             	mov    ecx,dword ptr [edi+0xc]
1000c22d:	89 48 0c             	mov    dword ptr [eax+0xc],ecx
1000c230:	8b 8f dc 01 00 00    	mov    ecx,dword ptr [edi+0x1dc]
1000c236:	89 88 dc 01 00 00    	mov    dword ptr [eax+0x1dc],ecx
1000c23c:	8b 8f e0 01 00 00    	mov    ecx,dword ptr [edi+0x1e0]
1000c242:	89 88 e0 01 00 00    	mov    dword ptr [eax+0x1e0],ecx
1000c248:	8b ce                	mov    ecx,esi
1000c24a:	e8 51 8e 00 00       	call   0x100150a0
1000c24f:	ff b7 e0 01 00 00    	push   dword ptr [edi+0x1e0]
1000c255:	8b ce                	mov    ecx,esi
1000c257:	ff b7 dc 01 00 00    	push   dword ptr [edi+0x1dc]
1000c25d:	e8 2e 97 00 00       	call   0x10015990
1000c262:	8b ce                	mov    ecx,esi
1000c264:	e8 17 80 00 00       	call   0x10014280
1000c269:	8b cb                	mov    ecx,ebx
1000c26b:	e8 b0 f3 ff ff       	call   0x1000b620
1000c270:	5e                   	pop    esi
1000c271:	5f                   	pop    edi
1000c272:	5b                   	pop    ebx
1000c273:	8b e5                	mov    esp,ebp
1000c275:	5d                   	pop    ebp
1000c276:	c3                   	ret
1000c277:	cc                   	int3
1000c278:	cc                   	int3
1000c279:	cc                   	int3
1000c27a:	cc                   	int3
1000c27b:	cc                   	int3
1000c27c:	cc                   	int3
1000c27d:	cc                   	int3
1000c27e:	cc                   	int3
1000c27f:	cc                   	int3


; ===== insert_before =====

/mnt/data/work_stage117/re_inputs/modules/pm_auto.dll:     file format pei-i386


disassembly of section .text:

1000c280 <.text+0xb280>:
1000c280:	55                   	push   ebp
1000c281:	8b ec                	mov    ebp,esp
1000c283:	83 ec 08             	sub    esp,0x8
1000c286:	53                   	push   ebx
1000c287:	8b d9                	mov    ebx,ecx
1000c289:	e8 32 11 00 00       	call   0x1000d3c0
1000c28e:	84 c0                	test   al,al
1000c290:	0f 84 fd 00 00 00    	je     0x1000c393
1000c296:	8b 8b fc 00 00 00    	mov    ecx,dword ptr [ebx+0xfc]
1000c29c:	57                   	push   edi
1000c29d:	ff 15 b0 28 02 10    	call   dword ptr ds:0x100228b0
1000c2a3:	50                   	push   eax
1000c2a4:	b9 90 bc 05 10       	mov    ecx,0x1005bc90
1000c2a9:	ff 15 54 24 02 10    	call   dword ptr ds:0x10022454
1000c2af:	8b c8                	mov    ecx,eax
1000c2b1:	89 45 f8             	mov    dword ptr [ebp-0x8],eax
1000c2b4:	e8 17 ad 00 00       	call   0x10016fd0
1000c2b9:	8b f8                	mov    edi,eax
1000c2bb:	85 ff                	test   edi,edi
1000c2bd:	0f 84 cf 00 00 00    	je     0x1000c392
1000c2c3:	8b 4b 38             	mov    ecx,dword ptr [ebx+0x38]
1000c2c6:	56                   	push   esi
1000c2c7:	ff 15 1c 21 02 10    	call   dword ptr ds:0x1002211c
1000c2cd:	8b 4b 38             	mov    ecx,dword ptr [ebx+0x38]
1000c2d0:	50                   	push   eax
1000c2d1:	ff 15 18 21 02 10    	call   dword ptr ds:0x10022118
1000c2d7:	8b 8b 1c 01 00 00    	mov    ecx,dword ptr [ebx+0x11c]
1000c2dd:	50                   	push   eax
1000c2de:	6a 00                	push   0x0
1000c2e0:	ff 15 b8 20 02 10    	call   dword ptr ds:0x100220b8
1000c2e6:	8b c8                	mov    ecx,eax
1000c2e8:	ff 15 e0 20 02 10    	call   dword ptr ds:0x100220e0
1000c2ee:	8b 87 d4 01 00 00    	mov    eax,dword ptr [edi+0x1d4]
1000c2f4:	05 cc 01 00 00       	add    eax,0x1cc
1000c2f9:	89 45 fc             	mov    dword ptr [ebp-0x4],eax
1000c2fc:	8b 10                	mov    edx,dword ptr [eax]
1000c2fe:	8b 4a 04             	mov    ecx,dword ptr [edx+0x4]
1000c301:	8b 42 0c             	mov    eax,dword ptr [edx+0xc]
1000c304:	8b 72 0c             	mov    esi,dword ptr [edx+0xc]
1000c307:	03 f2                	add    esi,edx
1000c309:	8d 04 88             	lea    eax,[eax+ecx*4]
1000c30c:	03 c2                	add    eax,edx
1000c30e:	3b f0                	cmp    esi,eax
1000c310:	74 0b                	je     0x1000c31d
1000c312:	39 3e                	cmp    dword ptr [esi],edi
1000c314:	74 07                	je     0x1000c31d
1000c316:	83 c6 04             	add    esi,0x4
1000c319:	3b f0                	cmp    esi,eax
1000c31b:	75 f5                	jne    0x1000c312
1000c31d:	8b 4d fc             	mov    ecx,dword ptr [ebp-0x4]
1000c320:	e8 ab d3 ff ff       	call   0x100096d0
1000c325:	8b 4b 38             	mov    ecx,dword ptr [ebx+0x38]
1000c328:	2b f0                	sub    esi,eax
1000c32a:	c1 fe 02             	sar    esi,0x2
1000c32d:	56                   	push   esi
1000c32e:	ff b7 d4 01 00 00    	push   dword ptr [edi+0x1d4]
1000c334:	ff 15 1c 21 02 10    	call   dword ptr ds:0x1002211c
1000c33a:	50                   	push   eax
1000c33b:	8b cb                	mov    ecx,ebx
1000c33d:	e8 8e cb ff ff       	call   0x10008ed0
1000c342:	8b 4f 08             	mov    ecx,dword ptr [edi+0x8]
1000c345:	8b 75 f8             	mov    esi,dword ptr [ebp-0x8]
1000c348:	89 48 08             	mov    dword ptr [eax+0x8],ecx
1000c34b:	8b 4f 0c             	mov    ecx,dword ptr [edi+0xc]
1000c34e:	89 48 0c             	mov    dword ptr [eax+0xc],ecx
1000c351:	8b 8f dc 01 00 00    	mov    ecx,dword ptr [edi+0x1dc]
1000c357:	89 88 dc 01 00 00    	mov    dword ptr [eax+0x1dc],ecx
1000c35d:	8b 8f e0 01 00 00    	mov    ecx,dword ptr [edi+0x1e0]
1000c363:	89 88 e0 01 00 00    	mov    dword ptr [eax+0x1e0],ecx
1000c369:	8b ce                	mov    ecx,esi
1000c36b:	e8 30 8d 00 00       	call   0x100150a0
1000c370:	ff b7 e0 01 00 00    	push   dword ptr [edi+0x1e0]
1000c376:	8b ce                	mov    ecx,esi
1000c378:	ff b7 dc 01 00 00    	push   dword ptr [edi+0x1dc]
1000c37e:	e8 0d 96 00 00       	call   0x10015990
1000c383:	8b ce                	mov    ecx,esi
1000c385:	e8 f6 7e 00 00       	call   0x10014280
1000c38a:	8b cb                	mov    ecx,ebx
1000c38c:	e8 8f f2 ff ff       	call   0x1000b620
1000c391:	5e                   	pop    esi
1000c392:	5f                   	pop    edi
1000c393:	5b                   	pop    ebx
1000c394:	8b e5                	mov    esp,ebp
1000c396:	5d                   	pop    ebp
1000c397:	c3                   	ret
1000c398:	cc                   	int3
1000c399:	cc                   	int3
1000c39a:	cc                   	int3
1000c39b:	cc                   	int3
1000c39c:	cc                   	int3
1000c39d:	cc                   	int3
1000c39e:	cc                   	int3
1000c39f:	cc                   	int3


; ===== delete_selected =====

/mnt/data/work_stage117/re_inputs/modules/pm_auto.dll:     file format pei-i386


disassembly of section .text:

1000a4e0 <.text+0x94e0>:
1000a4e0:	55                   	push   ebp
1000a4e1:	8b ec                	mov    ebp,esp
1000a4e3:	83 ec 08             	sub    esp,0x8
1000a4e6:	53                   	push   ebx
1000a4e7:	8b d9                	mov    ebx,ecx
1000a4e9:	83 7b 2c 00          	cmp    dword ptr [ebx+0x2c],0x0
1000a4ed:	0f 84 a6 00 00 00    	je     0x1000a599
1000a4f3:	8b 8b fc 00 00 00    	mov    ecx,dword ptr [ebx+0xfc]
1000a4f9:	56                   	push   esi
1000a4fa:	57                   	push   edi
1000a4fb:	ff 15 b0 28 02 10    	call   dword ptr ds:0x100228b0
1000a501:	50                   	push   eax
1000a502:	b9 90 bc 05 10       	mov    ecx,0x1005bc90
1000a507:	ff 15 54 24 02 10    	call   dword ptr ds:0x10022454
1000a50d:	8b f0                	mov    esi,eax
1000a50f:	8b ce                	mov    ecx,esi
1000a511:	89 75 fc             	mov    dword ptr [ebp-0x4],esi
1000a514:	e8 b7 ca 00 00       	call   0x10016fd0
1000a519:	89 45 f8             	mov    dword ptr [ebp-0x8],eax
1000a51c:	8b b8 d0 01 00 00    	mov    edi,dword ptr [eax+0x1d0]
1000a522:	8b cf                	mov    ecx,edi
1000a524:	ff 15 24 21 02 10    	call   dword ptr ds:0x10022124
1000a52a:	83 7e 7c 00          	cmp    dword ptr [esi+0x7c],0x0
1000a52e:	74 67                	je     0x1000a597
1000a530:	8b cf                	mov    ecx,edi
1000a532:	ff 15 18 21 02 10    	call   dword ptr ds:0x10022118
1000a538:	8b c8                	mov    ecx,eax
1000a53a:	ff 15 24 21 02 10    	call   dword ptr ds:0x10022124
1000a540:	83 f8 02             	cmp    eax,0x2
1000a543:	7e 52                	jle    0x1000a597
1000a545:	8b 7e 78             	mov    edi,dword ptr [esi+0x78]
1000a548:	8b 4d fc             	mov    ecx,dword ptr [ebp-0x4]
1000a54b:	8b 76 7c             	mov    esi,dword ptr [esi+0x7c]
1000a54e:	e8 fd d0 00 00       	call   0x10017650
1000a553:	ff 75 f8             	push   dword ptr [ebp-0x8]
1000a556:	8b cb                	mov    ecx,ebx
1000a558:	e8 03 36 00 00       	call   0x1000db60
1000a55d:	8b 4d fc             	mov    ecx,dword ptr [ebp-0x4]
1000a560:	e8 3b ab 00 00       	call   0x100150a0
1000a565:	8b 4d fc             	mov    ecx,dword ptr [ebp-0x4]
1000a568:	56                   	push   esi
1000a569:	57                   	push   edi
1000a56a:	e8 21 b4 00 00       	call   0x10015990
1000a56f:	8b 8b fc 00 00 00    	mov    ecx,dword ptr [ebx+0xfc]
1000a575:	ff 15 b0 28 02 10    	call   dword ptr ds:0x100228b0
1000a57b:	8b c8                	mov    ecx,eax
1000a57d:	e8 fe 9c 00 00       	call   0x10014280
1000a582:	8b cb                	mov    ecx,ebx
1000a584:	e8 c7 77 00 00       	call   0x10011d50
1000a589:	8b cb                	mov    ecx,ebx
1000a58b:	e8 10 79 00 00       	call   0x10011ea0
1000a590:	8b cb                	mov    ecx,ebx
1000a592:	e8 89 10 00 00       	call   0x1000b620
1000a597:	5f                   	pop    edi
1000a598:	5e                   	pop    esi
1000a599:	5b                   	pop    ebx
1000a59a:	8b e5                	mov    esp,ebp
1000a59c:	5d                   	pop    ebp
1000a59d:	c3                   	ret


; ===== delete_core_path =====

/mnt/data/work_stage117/re_inputs/modules/pm_auto.dll:     file format pei-i386


disassembly of section .text:

1000db60 <.text+0xcb60>:
1000db60:	55                   	push   ebp
1000db61:	8b ec                	mov    ebp,esp
1000db63:	6a ff                	push   0xffffffff
1000db65:	68 f8 f7 01 10       	push   0x1001f7f8
1000db6a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000db70:	50                   	push   eax
1000db71:	83 ec 34             	sub    esp,0x34
1000db74:	a1 cc f0 06 10       	mov    eax,ds:0x1006f0cc
1000db79:	33 c5                	xor    eax,ebp
1000db7b:	89 45 f0             	mov    dword ptr [ebp-0x10],eax
1000db7e:	53                   	push   ebx
1000db7f:	56                   	push   esi
1000db80:	57                   	push   edi
1000db81:	50                   	push   eax
1000db82:	8d 45 f4             	lea    eax,[ebp-0xc]
1000db85:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000db8b:	8b f1                	mov    esi,ecx
1000db8d:	89 75 c0             	mov    dword ptr [ebp-0x40],esi
1000db90:	8b 7d 08             	mov    edi,dword ptr [ebp+0x8]
1000db93:	8b 9f d0 01 00 00    	mov    ebx,dword ptr [edi+0x1d0]
1000db99:	8b cb                	mov    ecx,ebx
1000db9b:	ff 15 24 21 02 10    	call   dword ptr ds:0x10022124
1000dba1:	53                   	push   ebx
1000dba2:	8b ce                	mov    ecx,esi
1000dba4:	e8 b7 c7 ff ff       	call   0x1000a360
1000dba9:	8b b7 d4 01 00 00    	mov    esi,dword ptr [edi+0x1d4]
1000dbaf:	81 c6 cc 01 00 00    	add    esi,0x1cc
1000dbb5:	89 75 c4             	mov    dword ptr [ebp-0x3c],esi
1000dbb8:	8b 16                	mov    edx,dword ptr [esi]
1000dbba:	83 7a 04 00          	cmp    dword ptr [edx+0x4],0x0
1000dbbe:	7e 20                	jle    0x1000dbe0
1000dbc0:	8b 42 0c             	mov    eax,dword ptr [edx+0xc]
1000dbc3:	8b 4a 04             	mov    ecx,dword ptr [edx+0x4]
1000dbc6:	8d 0c 88             	lea    ecx,[eax+ecx*4]
1000dbc9:	03 c2                	add    eax,edx
1000dbcb:	03 ca                	add    ecx,edx
1000dbcd:	3b c1                	cmp    eax,ecx
1000dbcf:	74 0f                	je     0x1000dbe0
1000dbd1:	39 38                	cmp    dword ptr [eax],edi
1000dbd3:	0f 84 ba 00 00 00    	je     0x1000dc93
1000dbd9:	83 c0 04             	add    eax,0x4
1000dbdc:	3b c1                	cmp    eax,ecx
1000dbde:	75 f1                	jne    0x1000dbd1
1000dbe0:	83 c8 ff             	or     eax,0xffffffff
1000dbe3:	8b 4d c4             	mov    ecx,dword ptr [ebp-0x3c]
1000dbe6:	8b f2                	mov    esi,edx
1000dbe8:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
1000dbef:	8b 46 0c             	mov    eax,dword ptr [esi+0xc]
1000dbf2:	83 c0 04             	add    eax,0x4
1000dbf5:	03 c2                	add    eax,edx
1000dbf7:	03 c6                	add    eax,esi
1000dbf9:	50                   	push   eax
1000dbfa:	8b 46 0c             	mov    eax,dword ptr [esi+0xc]
1000dbfd:	03 c2                	add    eax,edx
1000dbff:	03 c6                	add    eax,esi
1000dc01:	50                   	push   eax
1000dc02:	e8 f9 cd ff ff       	call   0x1000aa00
1000dc07:	8b 75 c0             	mov    esi,dword ptr [ebp-0x40]
1000dc0a:	8d 45 c8             	lea    eax,[ebp-0x38]
1000dc0d:	c7 45 c8 e8 b8 05 10 	mov    dword ptr [ebp-0x38],0x1005b8e8
1000dc14:	89 45 cc             	mov    dword ptr [ebp-0x34],eax
1000dc17:	89 75 d0             	mov    dword ptr [ebp-0x30],esi
1000dc1a:	89 45 ec             	mov    dword ptr [ebp-0x14],eax
1000dc1d:	8d 45 c4             	lea    eax,[ebp-0x3c]
1000dc20:	c7 45 fc 00 00 00 00 	mov    dword ptr [ebp-0x4],0x0
1000dc27:	50                   	push   eax
1000dc28:	8d 4d c8             	lea    ecx,[ebp-0x38]
1000dc2b:	89 7d c4             	mov    dword ptr [ebp-0x3c],edi
1000dc2e:	e8 6d ae ff ff       	call   0x10008aa0
1000dc33:	8b 8e 1c 01 00 00    	mov    ecx,dword ptr [esi+0x11c]
1000dc39:	53                   	push   ebx
1000dc3a:	6a 00                	push   0x0
1000dc3c:	ff 15 b8 20 02 10    	call   dword ptr ds:0x100220b8
1000dc42:	8b c8                	mov    ecx,eax
1000dc44:	ff 15 f4 20 02 10    	call   dword ptr ds:0x100220f4
1000dc4a:	8b 8e fc 00 00 00    	mov    ecx,dword ptr [esi+0xfc]
1000dc50:	ff 15 b0 28 02 10    	call   dword ptr ds:0x100228b0
1000dc56:	8b c8                	mov    ecx,eax
1000dc58:	e8 23 66 00 00       	call   0x10014280
1000dc5d:	8b 4d ec             	mov    ecx,dword ptr [ebp-0x14]
1000dc60:	85 c9                	test   ecx,ecx
1000dc62:	74 11                	je     0x1000dc75
1000dc64:	8b 11                	mov    edx,dword ptr [ecx]
1000dc66:	8d 45 c8             	lea    eax,[ebp-0x38]
1000dc69:	3b c8                	cmp    ecx,eax
1000dc6b:	0f 95 c0             	setne  al
1000dc6e:	0f b6 c0             	movzx  eax,al
1000dc71:	50                   	push   eax
1000dc72:	ff 52 10             	call   dword ptr [edx+0x10]
1000dc75:	8b 4d f4             	mov    ecx,dword ptr [ebp-0xc]
1000dc78:	64 89 0d 00 00 00 00 	mov    dword ptr fs:0x0,ecx
1000dc7f:	59                   	pop    ecx
1000dc80:	5f                   	pop    edi
1000dc81:	5e                   	pop    esi
1000dc82:	5b                   	pop    ebx
1000dc83:	8b 4d f0             	mov    ecx,dword ptr [ebp-0x10]
1000dc86:	33 cd                	xor    ecx,ebp
1000dc88:	e8 dd ef 00 00       	call   0x1001cc6a
1000dc8d:	8b e5                	mov    esp,ebp
1000dc8f:	5d                   	pop    ebp
1000dc90:	c2 04 00             	ret    0x4
1000dc93:	2b 42 0c             	sub    eax,dword ptr [edx+0xc]
1000dc96:	2b c2                	sub    eax,edx
1000dc98:	c1 f8 02             	sar    eax,0x2
1000dc9b:	e9 43 ff ff ff       	jmp    0x1000dbe3


; ===== to_elementary =====

/mnt/data/work_stage117/re_inputs/modules/pm_auto.dll:     file format pei-i386


disassembly of section .text:

10011470 <.text+0x10470>:
10011470:	55                   	push   ebp
10011471:	8b ec                	mov    ebp,esp
10011473:	6a ff                	push   0xffffffff
10011475:	68 37 00 02 10       	push   0x10020037
1001147a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10011480:	50                   	push   eax
10011481:	83 ec 78             	sub    esp,0x78
10011484:	a1 cc f0 06 10       	mov    eax,ds:0x1006f0cc
10011489:	33 c5                	xor    eax,ebp
1001148b:	89 45 f0             	mov    dword ptr [ebp-0x10],eax
1001148e:	53                   	push   ebx
1001148f:	56                   	push   esi
10011490:	57                   	push   edi
10011491:	50                   	push   eax
10011492:	8d 45 f4             	lea    eax,[ebp-0xc]
10011495:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1001149b:	8b f9                	mov    edi,ecx
1001149d:	ff 77 38             	push   dword ptr [edi+0x38]
100114a0:	8b 8f 1c 01 00 00    	mov    ecx,dword ptr [edi+0x11c]
100114a6:	8d 45 b4             	lea    eax,[ebp-0x4c]
100114a9:	50                   	push   eax
100114aa:	6a 00                	push   0x0
100114ac:	ff 15 bc 20 02 10    	call   dword ptr ds:0x100220bc
100114b2:	8b c8                	mov    ecx,eax
100114b4:	ff 15 68 20 02 10    	call   dword ptr ds:0x10022068
100114ba:	33 f6                	xor    esi,esi
100114bc:	c7 45 fc 00 00 00 00 	mov    dword ptr [ebp-0x4],0x0
100114c3:	39 75 b4             	cmp    dword ptr [ebp-0x4c],esi
100114c6:	7e 34                	jle    0x100114fc
100114c8:	8b 1d 08 21 02 10    	mov    ebx,dword ptr ds:0x10022108
100114ce:	66 90                	xchg   ax,ax
100114d0:	8b 45 b8             	mov    eax,dword ptr [ebp-0x48]
100114d3:	8b 0c b0             	mov    ecx,dword ptr [eax+esi*4]
100114d6:	ff d3                	call   ebx
100114d8:	8b 45 b8             	mov    eax,dword ptr [ebp-0x48]
100114db:	6a 01                	push   0x1
100114dd:	8b 0c b0             	mov    ecx,dword ptr [eax+esi*4]
100114e0:	ff 15 0c 21 02 10    	call   dword ptr ds:0x1002210c
100114e6:	8b 45 b8             	mov    eax,dword ptr [ebp-0x48]
100114e9:	8b 0c b0             	mov    ecx,dword ptr [eax+esi*4]
100114ec:	85 c9                	test   ecx,ecx
100114ee:	74 06                	je     0x100114f6
100114f0:	8b 01                	mov    eax,dword ptr [ecx]
100114f2:	6a 01                	push   0x1
100114f4:	ff 10                	call   dword ptr [eax]
100114f6:	46                   	inc    esi
100114f7:	3b 75 b4             	cmp    esi,dword ptr [ebp-0x4c]
100114fa:	7c d4                	jl     0x100114d0
100114fc:	8b 8f fc 00 00 00    	mov    ecx,dword ptr [edi+0xfc]
10011502:	ff 15 b0 28 02 10    	call   dword ptr ds:0x100228b0
10011508:	50                   	push   eax
10011509:	b9 90 bc 05 10       	mov    ecx,0x1005bc90
1001150e:	ff 15 54 24 02 10    	call   dword ptr ds:0x10022454
10011514:	8b f0                	mov    esi,eax
10011516:	8b ce                	mov    ecx,esi
10011518:	89 75 ac             	mov    dword ptr [ebp-0x54],esi
1001151b:	e8 b0 5a 00 00       	call   0x10016fd0
10011520:	8b d8                	mov    ebx,eax
10011522:	8d 8d 7c ff ff ff    	lea    ecx,[ebp-0x84]
10011528:	6a 00                	push   0x0
1001152a:	89 5d b0             	mov    dword ptr [ebp-0x50],ebx
1001152d:	8b 83 d0 01 00 00    	mov    eax,dword ptr [ebx+0x1d0]
10011533:	89 45 bc             	mov    dword ptr [ebp-0x44],eax
10011536:	ff 15 28 2a 02 10    	call   dword ptr ds:0x10022a28
1001153c:	8d 45 c0             	lea    eax,[ebp-0x40]
1001153f:	c6 45 c7 00          	mov    byte ptr [ebp-0x39],0x0
10011543:	50                   	push   eax
10011544:	8d 4d c7             	lea    ecx,[ebp-0x39]
10011547:	e8 d4 4b ff ff       	call   0x10006120
1001154c:	50                   	push   eax
1001154d:	8d 8d 7c ff ff ff    	lea    ecx,[ebp-0x84]
10011553:	c6 45 fc 02          	mov    byte ptr [ebp-0x4],0x2
10011557:	ff 15 38 2a 02 10    	call   dword ptr ds:0x10022a38
1001155d:	8d 4d c0             	lea    ecx,[ebp-0x40]
10011560:	ff 15 a4 23 02 10    	call   dword ptr ds:0x100223a4
10011566:	8d 45 c0             	lea    eax,[ebp-0x40]
10011569:	50                   	push   eax
1001156a:	8d 4d c7             	lea    ecx,[ebp-0x39]
1001156d:	e8 1e 42 ff ff       	call   0x10005790
10011572:	50                   	push   eax
10011573:	8d 8d 7c ff ff ff    	lea    ecx,[ebp-0x84]
10011579:	c6 45 fc 03          	mov    byte ptr [ebp-0x4],0x3
1001157d:	ff 15 40 2a 02 10    	call   dword ptr ds:0x10022a40
10011583:	8d 4d c0             	lea    ecx,[ebp-0x40]
10011586:	c6 45 fc 01          	mov    byte ptr [ebp-0x4],0x1
1001158a:	ff 15 a4 23 02 10    	call   dword ptr ds:0x100223a4
10011590:	68 00 04 40 00       	push   0x400400
10011595:	8d 8d 7c ff ff ff    	lea    ecx,[ebp-0x84]
1001159b:	ff 15 30 2a 02 10    	call   dword ptr ds:0x10022a30
100115a1:	68 00 04 00 00       	push   0x400
100115a6:	8d 8d 7c ff ff ff    	lea    ecx,[ebp-0x84]
100115ac:	ff 15 34 2a 02 10    	call   dword ptr ds:0x10022a34
100115b2:	8d 8d 7c ff ff ff    	lea    ecx,[ebp-0x84]
100115b8:	ff 15 24 2a 02 10    	call   dword ptr ds:0x10022a24
100115be:	3d 00 00 40 00       	cmp    eax,0x400000
100115c3:	0f 84 b0 01 00 00    	je     0x10011779
100115c9:	8b 83 d8 01 00 00    	mov    eax,dword ptr [ebx+0x1d8]
100115cf:	85 c0                	test   eax,eax
100115d1:	74 28                	je     0x100115fb
100115d3:	3b 47 34             	cmp    eax,dword ptr [edi+0x34]
100115d6:	74 23                	je     0x100115fb
100115d8:	8b 8f fc 00 00 00    	mov    ecx,dword ptr [edi+0xfc]
100115de:	8b d8                	mov    ebx,eax
100115e0:	89 45 b0             	mov    dword ptr [ebp-0x50],eax
100115e3:	8b b3 c8 01 00 00    	mov    esi,dword ptr [ebx+0x1c8]
100115e9:	56                   	push   esi
100115ea:	89 75 ac             	mov    dword ptr [ebp-0x54],esi
100115ed:	ff 15 d0 28 02 10    	call   dword ptr ds:0x100228d0
100115f3:	53                   	push   ebx
100115f4:	8b ce                	mov    ecx,esi
100115f6:	e8 65 5c 00 00       	call   0x10017260
100115fb:	8b 46 78             	mov    eax,dword ptr [esi+0x78]
100115fe:	89 45 a4             	mov    dword ptr [ebp-0x5c],eax
10011601:	8b 46 7c             	mov    eax,dword ptr [esi+0x7c]
10011604:	89 45 a8             	mov    dword ptr [ebp-0x58],eax
10011607:	8d 45 c8             	lea    eax,[ebp-0x38]
1001160a:	c7 45 c8 cc b8 05 10 	mov    dword ptr [ebp-0x38],0x1005b8cc
10011611:	89 45 cc             	mov    dword ptr [ebp-0x34],eax
10011614:	89 45 ec             	mov    dword ptr [ebp-0x14],eax
10011617:	8b 4d bc             	mov    ecx,dword ptr [ebp-0x44]
1001161a:	c6 45 fc 04          	mov    byte ptr [ebp-0x4],0x4
1001161e:	ff 15 24 21 02 10    	call   dword ptr ds:0x10022124
10011624:	33 f6                	xor    esi,esi
10011626:	89 45 c0             	mov    dword ptr [ebp-0x40],eax
10011629:	85 c0                	test   eax,eax
1001162b:	7e 1d                	jle    0x1001164a
1001162d:	8b d8                	mov    ebx,eax
1001162f:	90                   	nop
10011630:	8b 4d bc             	mov    ecx,dword ptr [ebp-0x44]
10011633:	56                   	push   esi
10011634:	ff 15 28 21 02 10    	call   dword ptr ds:0x10022128
1001163a:	50                   	push   eax
1001163b:	8b cf                	mov    ecx,edi
1001163d:	e8 1e 8d ff ff       	call   0x1000a360
10011642:	46                   	inc    esi
10011643:	3b f3                	cmp    esi,ebx
10011645:	7c e9                	jl     0x10011630
10011647:	8b 5d b0             	mov    ebx,dword ptr [ebp-0x50]
1001164a:	8d b3 cc 01 00 00    	lea    esi,[ebx+0x1cc]
10011650:	8d 45 94             	lea    eax,[ebp-0x6c]
10011653:	56                   	push   esi
10011654:	50                   	push   eax
10011655:	e8 56 31 ff ff       	call   0x100047b0
1001165a:	83 c4 08             	add    esp,0x8
1001165d:	8b 45 a0             	mov    eax,dword ptr [ebp-0x60]
10011660:	c6 45 fc 05          	mov    byte ptr [ebp-0x4],0x5
10011664:	85 c0                	test   eax,eax
10011666:	74 40                	je     0x100116a8
10011668:	8b 75 98             	mov    esi,dword ptr [ebp-0x68]
1001166b:	0f 1f 44 00 00       	nop    dword ptr [eax+eax*1+0x0]
10011670:	3b 75 9c             	cmp    esi,dword ptr [ebp-0x64]
10011673:	74 2d                	je     0x100116a2
10011675:	8b 0e                	mov    ecx,dword ptr [esi]
10011677:	85 c0                	test   eax,eax
10011679:	74 19                	je     0x10011694
1001167b:	89 4d c0             	mov    dword ptr [ebp-0x40],ecx
1001167e:	8b 4d ec             	mov    ecx,dword ptr [ebp-0x14]
10011681:	85 c9                	test   ecx,ecx
10011683:	0f 84 21 01 00 00    	je     0x100117aa
10011689:	8b 01                	mov    eax,dword ptr [ecx]
1001168b:	8d 55 c0             	lea    edx,[ebp-0x40]
1001168e:	52                   	push   edx
1001168f:	ff 50 08             	call   dword ptr [eax+0x8]
10011692:	33 c0                	xor    eax,eax
10011694:	83 c6 04             	add    esi,0x4
10011697:	83 f0 01             	xor    eax,0x1
1001169a:	89 75 98             	mov    dword ptr [ebp-0x68],esi
1001169d:	89 45 a0             	mov    dword ptr [ebp-0x60],eax
100116a0:	75 ce                	jne    0x10011670
100116a2:	8d b3 cc 01 00 00    	lea    esi,[ebx+0x1cc]
100116a8:	8b 4d 94             	mov    ecx,dword ptr [ebp-0x6c]
100116ab:	c6 45 fc 04          	mov    byte ptr [ebp-0x4],0x4
100116af:	8b 01                	mov    eax,dword ptr [ecx]
100116b1:	85 c0                	test   eax,eax
100116b3:	74 13                	je     0x100116c8
100116b5:	83 f8 ff             	cmp    eax,0xffffffff
100116b8:	74 1c                	je     0x100116d6
100116ba:	83 c8 ff             	or     eax,0xffffffff
100116bd:	f0 0f c1 01          	lock xadd dword ptr [ecx],eax
100116c1:	0f 95 c0             	setne  al
100116c4:	84 c0                	test   al,al
100116c6:	75 0e                	jne    0x100116d6
100116c8:	6a 04                	push   0x4
100116ca:	6a 04                	push   0x4
100116cc:	51                   	push   ecx
100116cd:	ff 15 68 24 02 10    	call   dword ptr ds:0x10022468
100116d3:	83 c4 0c             	add    esp,0xc
100116d6:	8b 06                	mov    eax,dword ptr [esi]
100116d8:	8b ce                	mov    ecx,esi
100116da:	6a 00                	push   0x0
100116dc:	8b 40 08             	mov    eax,dword ptr [eax+0x8]
100116df:	25 ff ff ff 7f       	and    eax,0x7fffffff
100116e4:	50                   	push   eax
100116e5:	6a 00                	push   0x0
100116e7:	e8 44 c1 ff ff       	call   0x1000d830
100116ec:	8b 8b c4 01 00 00    	mov    ecx,dword ptr [ebx+0x1c4]
100116f2:	85 c9                	test   ecx,ecx
100116f4:	74 18                	je     0x1001170e
100116f6:	8b 01                	mov    eax,dword ptr [ecx]
100116f8:	6a 01                	push   0x1
100116fa:	ff 50 0c             	call   dword ptr [eax+0xc]
100116fd:	c7 83 c4 01 00 00 00 	mov    dword ptr [ebx+0x1c4],0x0
10011704:	00 00 00 
10011707:	c6 83 c1 01 00 00 00 	mov    byte ptr [ebx+0x1c1],0x0
1001170e:	ff 75 bc             	push   dword ptr [ebp-0x44]
10011711:	8b 8f 1c 01 00 00    	mov    ecx,dword ptr [edi+0x11c]
10011717:	6a 00                	push   0x0
10011719:	ff 15 b8 20 02 10    	call   dword ptr ds:0x100220b8
1001171f:	8b c8                	mov    ecx,eax
10011721:	ff 15 e4 20 02 10    	call   dword ptr ds:0x100220e4
10011727:	8b 75 ac             	mov    esi,dword ptr [ebp-0x54]
1001172a:	8b ce                	mov    ecx,esi
1001172c:	e8 6f 39 00 00       	call   0x100150a0
10011731:	ff 75 a8             	push   dword ptr [ebp-0x58]
10011734:	8b ce                	mov    ecx,esi
10011736:	ff 75 a4             	push   dword ptr [ebp-0x5c]
10011739:	e8 52 42 00 00       	call   0x10015990
1001173e:	8b cf                	mov    ecx,edi
10011740:	e8 0b 06 00 00       	call   0x10011d50
10011745:	8b cf                	mov    ecx,edi
10011747:	e8 54 07 00 00       	call   0x10011ea0
1001174c:	8b ce                	mov    ecx,esi
1001174e:	e8 2d 2b 00 00       	call   0x10014280
10011753:	8b cf                	mov    ecx,edi
10011755:	e8 c6 9e ff ff       	call   0x1000b620
1001175a:	8b 4d ec             	mov    ecx,dword ptr [ebp-0x14]
1001175d:	85 c9                	test   ecx,ecx
1001175f:	74 18                	je     0x10011779
10011761:	8b 11                	mov    edx,dword ptr [ecx]
10011763:	8d 45 c8             	lea    eax,[ebp-0x38]
10011766:	3b c8                	cmp    ecx,eax
10011768:	0f 95 c0             	setne  al
1001176b:	0f b6 c0             	movzx  eax,al
1001176e:	50                   	push   eax
1001176f:	ff 52 10             	call   dword ptr [edx+0x10]
10011772:	c7 45 ec 00 00 00 00 	mov    dword ptr [ebp-0x14],0x0
10011779:	8d 8d 7c ff ff ff    	lea    ecx,[ebp-0x84]
1001177f:	ff 15 2c 2a 02 10    	call   dword ptr ds:0x10022a2c
10011785:	8d 4d b4             	lea    ecx,[ebp-0x4c]
10011788:	ff 15 cc 20 02 10    	call   dword ptr ds:0x100220cc
1001178e:	8b 4d f4             	mov    ecx,dword ptr [ebp-0xc]
10011791:	64 89 0d 00 00 00 00 	mov    dword ptr fs:0x0,ecx
10011798:	59                   	pop    ecx
10011799:	5f                   	pop    edi
1001179a:	5e                   	pop    esi
1001179b:	5b                   	pop    ebx
1001179c:	8b 4d f0             	mov    ecx,dword ptr [ebp-0x10]
1001179f:	33 cd                	xor    ecx,ebp
100117a1:	e8 c4 b4 00 00       	call   0x1001cc6a
100117a6:	8b e5                	mov    esp,ebp
100117a8:	5d                   	pop    ebp
100117a9:	c3                   	ret


; ===== core_paste_new_element =====

/mnt/data/work_stage117/re_inputs/maiwmodels.dll:     file format pei-i386


disassembly of section .text:

1000c160 <.text+0xb160>:
1000c160:	55                   	push   ebp
1000c161:	8b ec                	mov    ebp,esp
1000c163:	53                   	push   ebx
1000c164:	56                   	push   esi
1000c165:	8b 75 0c             	mov    esi,dword ptr [ebp+0xc]
1000c168:	8b d9                	mov    ebx,ecx
1000c16a:	57                   	push   edi
1000c16b:	8b 7d 08             	mov    edi,dword ptr [ebp+0x8]
1000c16e:	85 f6                	test   esi,esi
1000c170:	74 0f                	je     0x1000c181
1000c172:	8b ce                	mov    ecx,esi
1000c174:	e8 37 d5 ff ff       	call   0x100096b0
1000c179:	3b c7                	cmp    eax,edi
1000c17b:	0f 85 a0 00 00 00    	jne    0x1000c221
1000c181:	8b 03                	mov    eax,dword ptr [ebx]
1000c183:	8b cb                	mov    ecx,ebx
1000c185:	ff 50 04             	call   dword ptr [eax+0x4]
1000c188:	8b 4b 0c             	mov    ecx,dword ptr [ebx+0xc]
1000c18b:	89 45 08             	mov    dword ptr [ebp+0x8],eax
1000c18e:	83 c1 04             	add    ecx,0x4
1000c191:	8d 45 08             	lea    eax,[ebp+0x8]
1000c194:	50                   	push   eax
1000c195:	e8 c6 68 ff ff       	call   0x10002a60
1000c19a:	8b 43 0c             	mov    eax,dword ptr [ebx+0xc]
1000c19d:	8b 55 08             	mov    edx,dword ptr [ebp+0x8]
1000c1a0:	52                   	push   edx
1000c1a1:	57                   	push   edi
1000c1a2:	ff 40 24             	inc    dword ptr [eax+0x24]
1000c1a5:	8b 4a 04             	mov    ecx,dword ptr [edx+0x4]
1000c1a8:	8b 40 24             	mov    eax,dword ptr [eax+0x24]
1000c1ab:	89 41 04             	mov    dword ptr [ecx+0x4],eax
1000c1ae:	8b cb                	mov    ecx,ebx
1000c1b0:	e8 fb ec ff ff       	call   0x1000aeb0
1000c1b5:	85 f6                	test   esi,esi
1000c1b7:	75 12                	jne    0x1000c1cb
1000c1b9:	8b cf                	mov    ecx,edi
1000c1bb:	e8 b0 bd ff ff       	call   0x10007f70
1000c1c0:	56                   	push   esi
1000c1c1:	8b cf                	mov    ecx,edi
1000c1c3:	e8 d8 c8 ff ff       	call   0x10008aa0
1000c1c8:	50                   	push   eax
1000c1c9:	eb 44                	jmp    0x1000c20f
1000c1cb:	8b ce                	mov    ecx,esi
1000c1cd:	e8 fe d3 ff ff       	call   0x100095d0
1000c1d2:	85 c0                	test   eax,eax
1000c1d4:	75 1d                	jne    0x1000c1f3
1000c1d6:	8b cf                	mov    ecx,edi
1000c1d8:	e8 93 bd ff ff       	call   0x10007f70
1000c1dd:	6a 01                	push   0x1
1000c1df:	6a 03                	push   0x3
1000c1e1:	ff 75 08             	push   dword ptr [ebp+0x8]
1000c1e4:	8b ce                	mov    ecx,esi
1000c1e6:	6a 02                	push   0x2
1000c1e8:	6a 00                	push   0x0
1000c1ea:	e8 71 76 ff ff       	call   0x10003860
1000c1ef:	6a 00                	push   0x0
1000c1f1:	eb 1c                	jmp    0x1000c20f
1000c1f3:	8b ce                	mov    ecx,esi
1000c1f5:	e8 d6 d3 ff ff       	call   0x100095d0
1000c1fa:	8b 4d 0c             	mov    ecx,dword ptr [ebp+0xc]
1000c1fd:	8b f0                	mov    esi,eax
1000c1ff:	6a 01                	push   0x1
1000c201:	6a 03                	push   0x3
1000c203:	ff 75 08             	push   dword ptr [ebp+0x8]
1000c206:	6a 02                	push   0x2
1000c208:	56                   	push   esi
1000c209:	e8 52 76 ff ff       	call   0x10003860
1000c20e:	56                   	push   esi
1000c20f:	ff 75 08             	push   dword ptr [ebp+0x8]
1000c212:	8b cb                	mov    ecx,ebx
1000c214:	57                   	push   edi
1000c215:	e8 b6 eb ff ff       	call   0x1000add0
1000c21a:	8b cb                	mov    ecx,ebx
1000c21c:	e8 df ee ff ff       	call   0x1000b100
1000c221:	5f                   	pop    edi
1000c222:	5e                   	pop    esi
1000c223:	5b                   	pop    ebx
1000c224:	5d                   	pop    ebp
1000c225:	c2 08 00             	ret    0x8


; ===== core_remove_element =====

/mnt/data/work_stage117/re_inputs/maiwmodels.dll:     file format pei-i386


disassembly of section .text:

1000c230 <.text+0xb230>:
1000c230:	55                   	push   ebp
1000c231:	8b ec                	mov    ebp,esp
1000c233:	6a ff                	push   0xffffffff
1000c235:	68 e8 64 01 10       	push   0x100164e8
1000c23a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000c240:	50                   	push   eax
1000c241:	83 ec 10             	sub    esp,0x10
1000c244:	53                   	push   ebx
1000c245:	56                   	push   esi
1000c246:	57                   	push   edi
1000c247:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000c24c:	33 c5                	xor    eax,ebp
1000c24e:	50                   	push   eax
1000c24f:	8d 45 f4             	lea    eax,[ebp-0xc]
1000c252:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000c258:	8b f1                	mov    esi,ecx
1000c25a:	89 75 f0             	mov    dword ptr [ebp-0x10],esi
1000c25d:	8b 5d 08             	mov    ebx,dword ptr [ebp+0x8]
1000c260:	53                   	push   ebx
1000c261:	e8 1a e9 ff ff       	call   0x1000ab80
1000c266:	8b cb                	mov    ecx,ebx
1000c268:	e8 13 d5 ff ff       	call   0x10009780
1000c26d:	85 c0                	test   eax,eax
1000c26f:	74 1f                	je     0x1000c290
1000c271:	8b cb                	mov    ecx,ebx
1000c273:	e8 58 d3 ff ff       	call   0x100095d0
1000c278:	50                   	push   eax
1000c279:	8b cb                	mov    ecx,ebx
1000c27b:	e8 00 d5 ff ff       	call   0x10009780
1000c280:	50                   	push   eax
1000c281:	8b cb                	mov    ecx,ebx
1000c283:	e8 28 d4 ff ff       	call   0x100096b0
1000c288:	50                   	push   eax
1000c289:	8b ce                	mov    ecx,esi
1000c28b:	e8 40 eb ff ff       	call   0x1000add0
1000c290:	8b 03                	mov    eax,dword ptr [ebx]
1000c292:	8d 4d e4             	lea    ecx,[ebp-0x1c]
1000c295:	51                   	push   ecx
1000c296:	8b cb                	mov    ecx,ebx
1000c298:	ff 50 0c             	call   dword ptr [eax+0xc]
1000c29b:	33 ff                	xor    edi,edi
1000c29d:	c7 45 fc 00 00 00 00 	mov    dword ptr [ebp-0x4],0x0
1000c2a4:	39 7d e4             	cmp    dword ptr [ebp-0x1c],edi
1000c2a7:	7e 32                	jle    0x1000c2db
1000c2a9:	0f 1f 80 00 00 00 00 	nop    dword ptr [eax+0x0]
1000c2b0:	8b 45 e8             	mov    eax,dword ptr [ebp-0x18]
1000c2b3:	6a 01                	push   0x1
1000c2b5:	8b 34 b8             	mov    esi,dword ptr [eax+edi*4]
1000c2b8:	8b ce                	mov    ecx,esi
1000c2ba:	e8 61 70 ff ff       	call   0x10003320
1000c2bf:	8b ce                	mov    ecx,esi
1000c2c1:	e8 2a 70 ff ff       	call   0x100032f0
1000c2c6:	85 f6                	test   esi,esi
1000c2c8:	74 08                	je     0x1000c2d2
1000c2ca:	8b 06                	mov    eax,dword ptr [esi]
1000c2cc:	8b ce                	mov    ecx,esi
1000c2ce:	6a 01                	push   0x1
1000c2d0:	ff 10                	call   dword ptr [eax]
1000c2d2:	47                   	inc    edi
1000c2d3:	3b 7d e4             	cmp    edi,dword ptr [ebp-0x1c]
1000c2d6:	7c d8                	jl     0x1000c2b0
1000c2d8:	8b 75 f0             	mov    esi,dword ptr [ebp-0x10]
1000c2db:	8b 76 0c             	mov    esi,dword ptr [esi+0xc]
1000c2de:	8b 46 08             	mov    eax,dword ptr [esi+0x8]
1000c2e1:	8b 76 04             	mov    esi,dword ptr [esi+0x4]
1000c2e4:	89 45 ec             	mov    dword ptr [ebp-0x14],eax
1000c2e7:	3b f0                	cmp    esi,eax
1000c2e9:	74 4b                	je     0x1000c336
1000c2eb:	0f 1f 44 00 00       	nop    dword ptr [eax+eax*1+0x0]
1000c2f0:	39 1e                	cmp    dword ptr [esi],ebx
1000c2f2:	74 07                	je     0x1000c2fb
1000c2f4:	83 c6 04             	add    esi,0x4
1000c2f7:	3b f0                	cmp    esi,eax
1000c2f9:	75 f5                	jne    0x1000c2f0
1000c2fb:	3b f0                	cmp    esi,eax
1000c2fd:	74 37                	je     0x1000c336
1000c2ff:	8d 4e 04             	lea    ecx,[esi+0x4]
1000c302:	8b f8                	mov    edi,eax
1000c304:	2b f9                	sub    edi,ecx
1000c306:	33 d2                	xor    edx,edx
1000c308:	83 c7 03             	add    edi,0x3
1000c30b:	c1 ef 02             	shr    edi,0x2
1000c30e:	3b c8                	cmp    ecx,eax
1000c310:	0f 47 fa             	cmova  edi,edx
1000c313:	89 7d 08             	mov    dword ptr [ebp+0x8],edi
1000c316:	85 ff                	test   edi,edi
1000c318:	74 1c                	je     0x1000c336
1000c31a:	8b c7                	mov    eax,edi
1000c31c:	0f 1f 40 00          	nop    dword ptr [eax+0x0]
1000c320:	8b 39                	mov    edi,dword ptr [ecx]
1000c322:	3b fb                	cmp    edi,ebx
1000c324:	74 05                	je     0x1000c32b
1000c326:	89 3e                	mov    dword ptr [esi],edi
1000c328:	83 c6 04             	add    esi,0x4
1000c32b:	42                   	inc    edx
1000c32c:	83 c1 04             	add    ecx,0x4
1000c32f:	3b d0                	cmp    edx,eax
1000c331:	75 ed                	jne    0x1000c320
1000c333:	8b 45 ec             	mov    eax,dword ptr [ebp-0x14]
1000c336:	8b 55 f0             	mov    edx,dword ptr [ebp-0x10]
1000c339:	8b 52 0c             	mov    edx,dword ptr [edx+0xc]
1000c33c:	83 c2 04             	add    edx,0x4
1000c33f:	89 55 08             	mov    dword ptr [ebp+0x8],edx
1000c342:	8b 0a                	mov    ecx,dword ptr [edx]
1000c344:	3b f1                	cmp    esi,ecx
1000c346:	75 0a                	jne    0x1000c352
1000c348:	3b 42 04             	cmp    eax,dword ptr [edx+0x4]
1000c34b:	75 05                	jne    0x1000c352
1000c34d:	89 4a 04             	mov    dword ptr [edx+0x4],ecx
1000c350:	eb 1e                	jmp    0x1000c370
1000c352:	3b f0                	cmp    esi,eax
1000c354:	74 1a                	je     0x1000c370
1000c356:	8b 7a 04             	mov    edi,dword ptr [edx+0x4]
1000c359:	2b f8                	sub    edi,eax
1000c35b:	57                   	push   edi
1000c35c:	50                   	push   eax
1000c35d:	56                   	push   esi
1000c35e:	ff 15 4c 70 01 10    	call   dword ptr ds:0x1001704c
1000c364:	8b 4d 08             	mov    ecx,dword ptr [ebp+0x8]
1000c367:	8d 04 37             	lea    eax,[edi+esi*1]
1000c36a:	83 c4 0c             	add    esp,0xc
1000c36d:	89 41 04             	mov    dword ptr [ecx+0x4],eax
1000c370:	8b 03                	mov    eax,dword ptr [ebx]
1000c372:	8b cb                	mov    ecx,ebx
1000c374:	6a 01                	push   0x1
1000c376:	ff 10                	call   dword ptr [eax]
1000c378:	8b 4d f0             	mov    ecx,dword ptr [ebp-0x10]
1000c37b:	e8 80 ed ff ff       	call   0x1000b100
1000c380:	6a 04                	push   0x4
1000c382:	ff 75 e8             	push   dword ptr [ebp-0x18]
1000c385:	e8 9e 89 00 00       	call   0x10014d28
1000c38a:	83 c4 08             	add    esp,0x8
1000c38d:	8b 4d f4             	mov    ecx,dword ptr [ebp-0xc]
1000c390:	64 89 0d 00 00 00 00 	mov    dword ptr fs:0x0,ecx
1000c397:	59                   	pop    ecx
1000c398:	5f                   	pop    edi
1000c399:	5e                   	pop    esi
1000c39a:	5b                   	pop    ebx
1000c39b:	8b e5                	mov    esp,ebp
1000c39d:	5d                   	pop    ebp
1000c39e:	c2                   	.byte 0xc2
1000c39f:	04                   	.byte 0x4


; ===== core_make_alternative =====

/mnt/data/work_stage117/re_inputs/maiwmodels.dll:     file format pei-i386


disassembly of section .text:

1000b760 <.text+0xa760>:
1000b760:	55                   	push   ebp
1000b761:	8b ec                	mov    ebp,esp
1000b763:	6a ff                	push   0xffffffff
1000b765:	68 88 64 01 10       	push   0x10016488
1000b76a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000b770:	50                   	push   eax
1000b771:	83 ec 2c             	sub    esp,0x2c
1000b774:	53                   	push   ebx
1000b775:	56                   	push   esi
1000b776:	57                   	push   edi
1000b777:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000b77c:	33 c5                	xor    eax,ebp
1000b77e:	50                   	push   eax
1000b77f:	8d 45 f4             	lea    eax,[ebp-0xc]
1000b782:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000b788:	8b f9                	mov    edi,ecx
1000b78a:	89 7d e4             	mov    dword ptr [ebp-0x1c],edi
1000b78d:	83 7d 0c 02          	cmp    dword ptr [ebp+0xc],0x2
1000b791:	0f 8c aa 03 00 00    	jl     0x1000bb41
1000b797:	8b 5d 08             	mov    ebx,dword ptr [ebp+0x8]
1000b79a:	8b cb                	mov    ecx,ebx
1000b79c:	8b 03                	mov    eax,dword ptr [ebx]
1000b79e:	ff 50 04             	call   dword ptr [eax+0x4]
1000b7a1:	33 f6                	xor    esi,esi
1000b7a3:	89 45 d4             	mov    dword ptr [ebp-0x2c],eax
1000b7a6:	85 c0                	test   eax,eax
1000b7a8:	7e 37                	jle    0x1000b7e1
1000b7aa:	66 0f 1f 44 00 00    	nop    word ptr [eax+eax*1+0x0]
1000b7b0:	8b 13                	mov    edx,dword ptr [ebx]
1000b7b2:	8d 45 d8             	lea    eax,[ebp-0x28]
1000b7b5:	56                   	push   esi
1000b7b6:	50                   	push   eax
1000b7b7:	8b cb                	mov    ecx,ebx
1000b7b9:	ff 52 08             	call   dword ptr [edx+0x8]
1000b7bc:	8b 4d dc             	mov    ecx,dword ptr [ebp-0x24]
1000b7bf:	e8 bc 79 ff ff       	call   0x10003180
1000b7c4:	83 f8 02             	cmp    eax,0x2
1000b7c7:	75 12                	jne    0x1000b7db
1000b7c9:	8b 4d dc             	mov    ecx,dword ptr [ebp-0x24]
1000b7cc:	6a 00                	push   0x0
1000b7ce:	e8 8d 79 ff ff       	call   0x10003160
1000b7d3:	3b c3                	cmp    eax,ebx
1000b7d5:	0f 84 66 03 00 00    	je     0x1000bb41
1000b7db:	46                   	inc    esi
1000b7dc:	3b 75 d4             	cmp    esi,dword ptr [ebp-0x2c]
1000b7df:	7c cf                	jl     0x1000b7b0
1000b7e1:	6a 01                	push   0x1
1000b7e3:	8b cb                	mov    ecx,ebx
1000b7e5:	e8 c6 e6 ff ff       	call   0x10009eb0
1000b7ea:	6a 01                	push   0x1
1000b7ec:	8b cb                	mov    ecx,ebx
1000b7ee:	e8 6d e5 ff ff       	call   0x10009d60
1000b7f3:	6a 00                	push   0x0
1000b7f5:	8b cb                	mov    ecx,ebx
1000b7f7:	e8 44 e5 ff ff       	call   0x10009d40
1000b7fc:	33 c0                	xor    eax,eax
1000b7fe:	33 f6                	xor    esi,esi
1000b800:	33 db                	xor    ebx,ebx
1000b802:	89 45 e8             	mov    dword ptr [ebp-0x18],eax
1000b805:	89 45 c8             	mov    dword ptr [ebp-0x38],eax
1000b808:	89 5d cc             	mov    dword ptr [ebp-0x34],ebx
1000b80b:	89 75 f0             	mov    dword ptr [ebp-0x10],esi
1000b80e:	89 75 d0             	mov    dword ptr [ebp-0x30],esi
1000b811:	89 75 fc             	mov    dword ptr [ebp-0x4],esi
1000b814:	89 75 d4             	mov    dword ptr [ebp-0x2c],esi
1000b817:	39 75 0c             	cmp    dword ptr [ebp+0xc],esi
1000b81a:	0f 8e 79 02 00 00    	jle    0x1000ba99
1000b820:	8b 07                	mov    eax,dword ptr [edi]
1000b822:	8b cf                	mov    ecx,edi
1000b824:	ff 50 04             	call   dword ptr [eax+0x4]
1000b827:	8b 77 0c             	mov    esi,dword ptr [edi+0xc]
1000b82a:	8b d0                	mov    edx,eax
1000b82c:	8d 45 ec             	lea    eax,[ebp-0x14]
1000b82f:	89 55 ec             	mov    dword ptr [ebp-0x14],edx
1000b832:	8b 7e 08             	mov    edi,dword ptr [esi+0x8]
1000b835:	3b c7                	cmp    eax,edi
1000b837:	0f 83 84 00 00 00    	jae    0x1000b8c1
1000b83d:	8b 46 04             	mov    eax,dword ptr [esi+0x4]
1000b840:	8d 4d ec             	lea    ecx,[ebp-0x14]
1000b843:	3b c1                	cmp    eax,ecx
1000b845:	77 7a                	ja     0x1000b8c1
1000b847:	2b c8                	sub    ecx,eax
1000b849:	8b 46 0c             	mov    eax,dword ptr [esi+0xc]
1000b84c:	c1 f9 02             	sar    ecx,0x2
1000b84f:	89 4d dc             	mov    dword ptr [ebp-0x24],ecx
1000b852:	89 45 e0             	mov    dword ptr [ebp-0x20],eax
1000b855:	3b f8                	cmp    edi,eax
1000b857:	75 57                	jne    0x1000b8b0
1000b859:	2b c7                	sub    eax,edi
1000b85b:	c1 f8 02             	sar    eax,0x2
1000b85e:	83 f8 01             	cmp    eax,0x1
1000b861:	73 4d                	jae    0x1000b8b0
1000b863:	8b 4e 04             	mov    ecx,dword ptr [esi+0x4]
1000b866:	b8 ff ff ff 3f       	mov    eax,0x3fffffff
1000b86b:	2b f9                	sub    edi,ecx
1000b86d:	c1 ff 02             	sar    edi,0x2
1000b870:	2b c7                	sub    eax,edi
1000b872:	83 f8 01             	cmp    eax,0x1
1000b875:	0f 82 10 02 00 00    	jb     0x1000ba8b
1000b87b:	8b 55 e0             	mov    edx,dword ptr [ebp-0x20]
1000b87e:	47                   	inc    edi
1000b87f:	2b d1                	sub    edx,ecx
1000b881:	b9 ff ff ff 3f       	mov    ecx,0x3fffffff
1000b886:	c1 fa 02             	sar    edx,0x2
1000b889:	8b c2                	mov    eax,edx
1000b88b:	89 55 e0             	mov    dword ptr [ebp-0x20],edx
1000b88e:	d1 e8                	shr    eax,1
1000b890:	2b c8                	sub    ecx,eax
1000b892:	03 c2                	add    eax,edx
1000b894:	33 d2                	xor    edx,edx
1000b896:	3b 4d e0             	cmp    ecx,dword ptr [ebp-0x20]
1000b899:	8d 4e 04             	lea    ecx,[esi+0x4]
1000b89c:	0f 43 d0             	cmovae edx,eax
1000b89f:	3b d7                	cmp    edx,edi
1000b8a1:	0f 43 fa             	cmovae edi,edx
1000b8a4:	57                   	push   edi
1000b8a5:	e8 66 6c ff ff       	call   0x10002510
1000b8aa:	8b 55 ec             	mov    edx,dword ptr [ebp-0x14]
1000b8ad:	8b 4d dc             	mov    ecx,dword ptr [ebp-0x24]
1000b8b0:	8b 7e 08             	mov    edi,dword ptr [esi+0x8]
1000b8b3:	85 ff                	test   edi,edi
1000b8b5:	74 6e                	je     0x1000b925
1000b8b7:	8b 46 04             	mov    eax,dword ptr [esi+0x4]
1000b8ba:	8b 04 88             	mov    eax,dword ptr [eax+ecx*4]
1000b8bd:	89 07                	mov    dword ptr [edi],eax
1000b8bf:	eb 64                	jmp    0x1000b925
1000b8c1:	8b 4e 0c             	mov    ecx,dword ptr [esi+0xc]
1000b8c4:	3b f9                	cmp    edi,ecx
1000b8c6:	75 54                	jne    0x1000b91c
1000b8c8:	8b c1                	mov    eax,ecx
1000b8ca:	2b c7                	sub    eax,edi
1000b8cc:	c1 f8 02             	sar    eax,0x2
1000b8cf:	83 f8 01             	cmp    eax,0x1
1000b8d2:	73 48                	jae    0x1000b91c
1000b8d4:	8b 56 04             	mov    edx,dword ptr [esi+0x4]
1000b8d7:	b8 ff ff ff 3f       	mov    eax,0x3fffffff
1000b8dc:	2b fa                	sub    edi,edx
1000b8de:	c1 ff 02             	sar    edi,0x2
1000b8e1:	2b c7                	sub    eax,edi
1000b8e3:	83 f8 01             	cmp    eax,0x1
1000b8e6:	0f 82 9f 01 00 00    	jb     0x1000ba8b
1000b8ec:	2b ca                	sub    ecx,edx
1000b8ee:	47                   	inc    edi
1000b8ef:	c1 f9 02             	sar    ecx,0x2
1000b8f2:	33 d2                	xor    edx,edx
1000b8f4:	89 4d e0             	mov    dword ptr [ebp-0x20],ecx
1000b8f7:	8b c1                	mov    eax,ecx
1000b8f9:	d1 e8                	shr    eax,1
1000b8fb:	b9 ff ff ff 3f       	mov    ecx,0x3fffffff
1000b900:	2b c8                	sub    ecx,eax
1000b902:	03 45 e0             	add    eax,dword ptr [ebp-0x20]
1000b905:	3b 4d e0             	cmp    ecx,dword ptr [ebp-0x20]
1000b908:	8d 4e 04             	lea    ecx,[esi+0x4]
1000b90b:	0f 43 d0             	cmovae edx,eax
1000b90e:	3b d7                	cmp    edx,edi
1000b910:	0f 43 fa             	cmovae edi,edx
1000b913:	57                   	push   edi
1000b914:	e8 f7 6b ff ff       	call   0x10002510
1000b919:	8b 55 ec             	mov    edx,dword ptr [ebp-0x14]
1000b91c:	8b 46 08             	mov    eax,dword ptr [esi+0x8]
1000b91f:	85 c0                	test   eax,eax
1000b921:	74 02                	je     0x1000b925
1000b923:	89 10                	mov    dword ptr [eax],edx
1000b925:	83 46 08 04          	add    dword ptr [esi+0x8],0x4
1000b929:	8b 4d e4             	mov    ecx,dword ptr [ebp-0x1c]
1000b92c:	89 55 e0             	mov    dword ptr [ebp-0x20],edx
1000b92f:	8b 49 0c             	mov    ecx,dword ptr [ecx+0xc]
1000b932:	ff 41 24             	inc    dword ptr [ecx+0x24]
1000b935:	8b 42 04             	mov    eax,dword ptr [edx+0x4]
1000b938:	8b 49 24             	mov    ecx,dword ptr [ecx+0x24]
1000b93b:	89 48 04             	mov    dword ptr [eax+0x4],ecx
1000b93e:	8d 45 e0             	lea    eax,[ebp-0x20]
1000b941:	8b 4d e8             	mov    ecx,dword ptr [ebp-0x18]
1000b944:	3b c3                	cmp    eax,ebx
1000b946:	0f 83 8c 00 00 00    	jae    0x1000b9d8
1000b94c:	3b c8                	cmp    ecx,eax
1000b94e:	0f 87 84 00 00 00    	ja     0x1000b9d8
1000b954:	8b 7d f0             	mov    edi,dword ptr [ebp-0x10]
1000b957:	2b c1                	sub    eax,ecx
1000b959:	c1 f8 02             	sar    eax,0x2
1000b95c:	89 45 dc             	mov    dword ptr [ebp-0x24],eax
1000b95f:	3b df                	cmp    ebx,edi
1000b961:	75 5f                	jne    0x1000b9c2
1000b963:	8b c7                	mov    eax,edi
1000b965:	2b c3                	sub    eax,ebx
1000b967:	c1 f8 02             	sar    eax,0x2
1000b96a:	83 f8 01             	cmp    eax,0x1
1000b96d:	73 58                	jae    0x1000b9c7
1000b96f:	2b d9                	sub    ebx,ecx
1000b971:	b8 ff ff ff 3f       	mov    eax,0x3fffffff
1000b976:	c1 fb 02             	sar    ebx,0x2
1000b979:	2b c3                	sub    eax,ebx
1000b97b:	83 f8 01             	cmp    eax,0x1
1000b97e:	0f 82 07 01 00 00    	jb     0x1000ba8b
1000b984:	2b f9                	sub    edi,ecx
1000b986:	8d 73 01             	lea    esi,[ebx+0x1]
1000b989:	c1 ff 02             	sar    edi,0x2
1000b98c:	b9 ff ff ff 3f       	mov    ecx,0x3fffffff
1000b991:	8b c7                	mov    eax,edi
1000b993:	33 d2                	xor    edx,edx
1000b995:	d1 e8                	shr    eax,1
1000b997:	2b c8                	sub    ecx,eax
1000b999:	03 c7                	add    eax,edi
1000b99b:	3b cf                	cmp    ecx,edi
1000b99d:	8d 4d c8             	lea    ecx,[ebp-0x38]
1000b9a0:	0f 43 d0             	cmovae edx,eax
1000b9a3:	3b d6                	cmp    edx,esi
1000b9a5:	0f 43 f2             	cmovae esi,edx
1000b9a8:	56                   	push   esi
1000b9a9:	e8 62 6b ff ff       	call   0x10002510
1000b9ae:	8b 75 d0             	mov    esi,dword ptr [ebp-0x30]
1000b9b1:	8b 4d c8             	mov    ecx,dword ptr [ebp-0x38]
1000b9b4:	8b 5d cc             	mov    ebx,dword ptr [ebp-0x34]
1000b9b7:	8b 55 ec             	mov    edx,dword ptr [ebp-0x14]
1000b9ba:	89 75 f0             	mov    dword ptr [ebp-0x10],esi
1000b9bd:	89 4d e8             	mov    dword ptr [ebp-0x18],ecx
1000b9c0:	eb 08                	jmp    0x1000b9ca
1000b9c2:	8b 75 f0             	mov    esi,dword ptr [ebp-0x10]
1000b9c5:	eb 06                	jmp    0x1000b9cd
1000b9c7:	8b 75 f0             	mov    esi,dword ptr [ebp-0x10]
1000b9ca:	8b 45 dc             	mov    eax,dword ptr [ebp-0x24]
1000b9cd:	85 db                	test   ebx,ebx
1000b9cf:	74 76                	je     0x1000ba47
1000b9d1:	8b 04 81             	mov    eax,dword ptr [ecx+eax*4]
1000b9d4:	89 03                	mov    dword ptr [ebx],eax
1000b9d6:	eb 6f                	jmp    0x1000ba47
1000b9d8:	8b 7d f0             	mov    edi,dword ptr [ebp-0x10]
1000b9db:	3b df                	cmp    ebx,edi
1000b9dd:	75 5f                	jne    0x1000ba3e
1000b9df:	8b c7                	mov    eax,edi
1000b9e1:	2b c3                	sub    eax,ebx
1000b9e3:	c1 f8 02             	sar    eax,0x2
1000b9e6:	83 f8 01             	cmp    eax,0x1
1000b9e9:	73 53                	jae    0x1000ba3e
1000b9eb:	2b d9                	sub    ebx,ecx
1000b9ed:	b8 ff ff ff 3f       	mov    eax,0x3fffffff
1000b9f2:	c1 fb 02             	sar    ebx,0x2
1000b9f5:	2b c3                	sub    eax,ebx
1000b9f7:	83 f8 01             	cmp    eax,0x1
1000b9fa:	0f 82 8b 00 00 00    	jb     0x1000ba8b
1000ba00:	2b f9                	sub    edi,ecx
1000ba02:	8d 73 01             	lea    esi,[ebx+0x1]
1000ba05:	c1 ff 02             	sar    edi,0x2
1000ba08:	b9 ff ff ff 3f       	mov    ecx,0x3fffffff
1000ba0d:	8b c7                	mov    eax,edi
1000ba0f:	33 d2                	xor    edx,edx
1000ba11:	d1 e8                	shr    eax,1
1000ba13:	2b c8                	sub    ecx,eax
1000ba15:	03 c7                	add    eax,edi
1000ba17:	3b cf                	cmp    ecx,edi
1000ba19:	8d 4d c8             	lea    ecx,[ebp-0x38]
1000ba1c:	0f 43 d0             	cmovae edx,eax
1000ba1f:	3b d6                	cmp    edx,esi
1000ba21:	0f 43 f2             	cmovae esi,edx
1000ba24:	56                   	push   esi
1000ba25:	e8 e6 6a ff ff       	call   0x10002510
1000ba2a:	8b 75 d0             	mov    esi,dword ptr [ebp-0x30]
1000ba2d:	8b 4d c8             	mov    ecx,dword ptr [ebp-0x38]
1000ba30:	8b 5d cc             	mov    ebx,dword ptr [ebp-0x34]
1000ba33:	8b 55 ec             	mov    edx,dword ptr [ebp-0x14]
1000ba36:	89 75 f0             	mov    dword ptr [ebp-0x10],esi
1000ba39:	89 4d e8             	mov    dword ptr [ebp-0x18],ecx
1000ba3c:	eb 03                	jmp    0x1000ba41
1000ba3e:	8b 75 f0             	mov    esi,dword ptr [ebp-0x10]
1000ba41:	85 db                	test   ebx,ebx
1000ba43:	74 02                	je     0x1000ba47
1000ba45:	89 13                	mov    dword ptr [ebx],edx
1000ba47:	8b 4d e4             	mov    ecx,dword ptr [ebp-0x1c]
1000ba4a:	83 c3 04             	add    ebx,0x4
1000ba4d:	52                   	push   edx
1000ba4e:	ff 75 08             	push   dword ptr [ebp+0x8]
1000ba51:	89 5d cc             	mov    dword ptr [ebp-0x34],ebx
1000ba54:	e8 57 f4 ff ff       	call   0x1000aeb0
1000ba59:	8b 7d ec             	mov    edi,dword ptr [ebp-0x14]
1000ba5c:	8b cf                	mov    ecx,edi
1000ba5e:	6a 00                	push   0x0
1000ba60:	e8 fb e2 ff ff       	call   0x10009d60
1000ba65:	6a 00                	push   0x0
1000ba67:	8b cf                	mov    ecx,edi
1000ba69:	e8 42 e4 ff ff       	call   0x10009eb0
1000ba6e:	6a 00                	push   0x0
1000ba70:	8b cf                	mov    ecx,edi
1000ba72:	e8 c9 e2 ff ff       	call   0x10009d40
1000ba77:	8b 45 d4             	mov    eax,dword ptr [ebp-0x2c]
1000ba7a:	40                   	inc    eax
1000ba7b:	89 45 d4             	mov    dword ptr [ebp-0x2c],eax
1000ba7e:	3b 45 0c             	cmp    eax,dword ptr [ebp+0xc]
1000ba81:	7d 13                	jge    0x1000ba96
1000ba83:	8b 7d e4             	mov    edi,dword ptr [ebp-0x1c]
1000ba86:	e9 95 fd ff ff       	jmp    0x1000b820
1000ba8b:	68 4c 71 01 10       	push   0x1001714c
1000ba90:	ff 15 34 70 01 10    	call   dword ptr ds:0x10017034
1000ba96:	8b 45 e8             	mov    eax,dword ptr [ebp-0x18]
1000ba99:	2b d8                	sub    ebx,eax
1000ba9b:	33 ff                	xor    edi,edi
1000ba9d:	c1 fb 02             	sar    ebx,0x2
1000baa0:	85 db                	test   ebx,ebx
1000baa2:	74 32                	je     0x1000bad6
1000baa4:	8b 75 08             	mov    esi,dword ptr [ebp+0x8]
1000baa7:	8d 4b ff             	lea    ecx,[ebx-0x1]
1000baaa:	66 0f 1f 44 00 00    	nop    word ptr [eax+eax*1+0x0]
1000bab0:	3b f9                	cmp    edi,ecx
1000bab2:	8b 4d e4             	mov    ecx,dword ptr [ebp-0x1c]
1000bab5:	74 06                	je     0x1000babd
1000bab7:	ff 74 b8 04          	push   dword ptr [eax+edi*4+0x4]
1000babb:	eb 02                	jmp    0x1000babf
1000babd:	6a 00                	push   0x0
1000babf:	ff 34 b8             	push   dword ptr [eax+edi*4]
1000bac2:	56                   	push   esi
1000bac3:	e8 08 f3 ff ff       	call   0x1000add0
1000bac8:	8b 45 e8             	mov    eax,dword ptr [ebp-0x18]
1000bacb:	8d 4b ff             	lea    ecx,[ebx-0x1]
1000bace:	47                   	inc    edi
1000bacf:	3b fb                	cmp    edi,ebx
1000bad1:	72 dd                	jb     0x1000bab0
1000bad3:	8b 75 f0             	mov    esi,dword ptr [ebp-0x10]
1000bad6:	8b 4d e4             	mov    ecx,dword ptr [ebp-0x1c]
1000bad9:	e8 22 f6 ff ff       	call   0x1000b100
1000bade:	8b 4d e8             	mov    ecx,dword ptr [ebp-0x18]
1000bae1:	85 c9                	test   ecx,ecx
1000bae3:	74 5c                	je     0x1000bb41
1000bae5:	2b f1                	sub    esi,ecx
1000bae7:	c1 fe 02             	sar    esi,0x2
1000baea:	81 fe ff ff ff 3f    	cmp    esi,0x3fffffff
1000baf0:	76 06                	jbe    0x1000baf8
1000baf2:	ff 15 b8 70 01 10    	call   dword ptr ds:0x100170b8
1000baf8:	8d 04 b5 00 00 00 00 	lea    eax,[esi*4+0x0]
1000baff:	3d 00 10 00 00       	cmp    eax,0x1000
1000bb04:	72 32                	jb     0x1000bb38
1000bb06:	f6 c1 1f             	test   cl,0x1f
1000bb09:	74 06                	je     0x1000bb11
1000bb0b:	ff 15 b8 70 01 10    	call   dword ptr ds:0x100170b8
1000bb11:	8b 41 fc             	mov    eax,dword ptr [ecx-0x4]
1000bb14:	3b c1                	cmp    eax,ecx
1000bb16:	72 06                	jb     0x1000bb1e
1000bb18:	ff 15 b8 70 01 10    	call   dword ptr ds:0x100170b8
1000bb1e:	2b c8                	sub    ecx,eax
1000bb20:	83 f9 04             	cmp    ecx,0x4
1000bb23:	73 06                	jae    0x1000bb2b
1000bb25:	ff 15 b8 70 01 10    	call   dword ptr ds:0x100170b8
1000bb2b:	83 f9 23             	cmp    ecx,0x23
1000bb2e:	76 06                	jbe    0x1000bb36
1000bb30:	ff 15 b8 70 01 10    	call   dword ptr ds:0x100170b8
1000bb36:	8b c8                	mov    ecx,eax
1000bb38:	51                   	push   ecx
1000bb39:	e8 e5 91 00 00       	call   0x10014d23
1000bb3e:	83 c4 04             	add    esp,0x4
1000bb41:	8b 4d f4             	mov    ecx,dword ptr [ebp-0xc]
1000bb44:	64 89 0d 00 00 00 00 	mov    dword ptr fs:0x0,ecx
1000bb4b:	59                   	pop    ecx
1000bb4c:	5f                   	pop    edi
1000bb4d:	5e                   	pop    esi
1000bb4e:	5b                   	pop    ebx
1000bb4f:	8b e5                	mov    esp,ebp
1000bb51:	5d                   	pop    ebp
1000bb52:	c2 08 00             	ret    0x8
1000bb55:	cc                   	int3
1000bb56:	cc                   	int3
1000bb57:	cc                   	int3
1000bb58:	cc                   	int3
1000bb59:	cc                   	int3
1000bb5a:	cc                   	int3
1000bb5b:	cc                   	int3
1000bb5c:	cc                   	int3
1000bb5d:	cc                   	int3
1000bb5e:	cc                   	int3
1000bb5f:	cc                   	int3


; ===== core_make_elementary =====

/mnt/data/work_stage117/re_inputs/maiwmodels.dll:     file format pei-i386


disassembly of section .text:

1000bb60 <.text+0xab60>:
1000bb60:	55                   	push   ebp
1000bb61:	8b ec                	mov    ebp,esp
1000bb63:	56                   	push   esi
1000bb64:	8b 75 08             	mov    esi,dword ptr [ebp+0x8]
1000bb67:	57                   	push   edi
1000bb68:	56                   	push   esi
1000bb69:	8b f9                	mov    edi,ecx
1000bb6b:	e8 40 08 00 00       	call   0x1000c3b0
1000bb70:	6a 00                	push   0x0
1000bb72:	8b ce                	mov    ecx,esi
1000bb74:	e8 37 e3 ff ff       	call   0x10009eb0
1000bb79:	6a 00                	push   0x0
1000bb7b:	8b ce                	mov    ecx,esi
1000bb7d:	e8 de e1 ff ff       	call   0x10009d60
1000bb82:	6a 00                	push   0x0
1000bb84:	8b ce                	mov    ecx,esi
1000bb86:	e8 b5 e1 ff ff       	call   0x10009d40
1000bb8b:	8b cf                	mov    ecx,edi
1000bb8d:	e8 6e f5 ff ff       	call   0x1000b100
1000bb92:	5f                   	pop    edi
1000bb93:	5e                   	pop    esi
1000bb94:	5d                   	pop    ebp
1000bb95:	c2 04 00             	ret    0x4


; ===== core_make_iteration =====

/mnt/data/work_stage117/re_inputs/maiwmodels.dll:     file format pei-i386


disassembly of section .text:

1000bba0 <.text+0xaba0>:
1000bba0:	55                   	push   ebp
1000bba1:	8b ec                	mov    ebp,esp
1000bba3:	51                   	push   ecx
1000bba4:	53                   	push   ebx
1000bba5:	8b d9                	mov    ebx,ecx
1000bba7:	56                   	push   esi
1000bba8:	57                   	push   edi
1000bba9:	8b 03                	mov    eax,dword ptr [ebx]
1000bbab:	ff 50 04             	call   dword ptr [eax+0x4]
1000bbae:	8b 4b 0c             	mov    ecx,dword ptr [ebx+0xc]
1000bbb1:	89 45 fc             	mov    dword ptr [ebp-0x4],eax
1000bbb4:	83 c1 04             	add    ecx,0x4
1000bbb7:	8d 45 fc             	lea    eax,[ebp-0x4]
1000bbba:	50                   	push   eax
1000bbbb:	e8 a0 6e ff ff       	call   0x10002a60
1000bbc0:	8b 43 0c             	mov    eax,dword ptr [ebx+0xc]
1000bbc3:	8b 75 fc             	mov    esi,dword ptr [ebp-0x4]
1000bbc6:	8b 7d 08             	mov    edi,dword ptr [ebp+0x8]
1000bbc9:	56                   	push   esi
1000bbca:	ff 40 24             	inc    dword ptr [eax+0x24]
1000bbcd:	8b 4e 04             	mov    ecx,dword ptr [esi+0x4]
1000bbd0:	8b 40 24             	mov    eax,dword ptr [eax+0x24]
1000bbd3:	57                   	push   edi
1000bbd4:	89 41 04             	mov    dword ptr [ecx+0x4],eax
1000bbd7:	8b cb                	mov    ecx,ebx
1000bbd9:	e8 d2 f2 ff ff       	call   0x1000aeb0
1000bbde:	6a 00                	push   0x0
1000bbe0:	56                   	push   esi
1000bbe1:	57                   	push   edi
1000bbe2:	8b cb                	mov    ecx,ebx
1000bbe4:	e8 e7 f1 ff ff       	call   0x1000add0
1000bbe9:	6a 03                	push   0x3
1000bbeb:	8b cf                	mov    ecx,edi
1000bbed:	e8 be e2 ff ff       	call   0x10009eb0
1000bbf2:	6a 00                	push   0x0
1000bbf4:	8b cf                	mov    ecx,edi
1000bbf6:	e8 45 e1 ff ff       	call   0x10009d40
1000bbfb:	6a 01                	push   0x1
1000bbfd:	8b cf                	mov    ecx,edi
1000bbff:	e8 5c e1 ff ff       	call   0x10009d60
1000bc04:	8b cb                	mov    ecx,ebx
1000bc06:	e8 f5 f4 ff ff       	call   0x1000b100
1000bc0b:	5f                   	pop    edi
1000bc0c:	5e                   	pop    esi
1000bc0d:	5b                   	pop    ebx
1000bc0e:	8b e5                	mov    esp,ebp
1000bc10:	5d                   	pop    ebp
1000bc11:	c2 04 00             	ret    0x4


; ===== core_make_sequence =====

/mnt/data/work_stage117/re_inputs/maiwmodels.dll:     file format pei-i386


disassembly of section .text:

1000bc20 <.text+0xac20>:
1000bc20:	55                   	push   ebp
1000bc21:	8b ec                	mov    ebp,esp
1000bc23:	6a ff                	push   0xffffffff
1000bc25:	68 88 64 01 10       	push   0x10016488
1000bc2a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000bc30:	50                   	push   eax
1000bc31:	83 ec 2c             	sub    esp,0x2c
1000bc34:	53                   	push   ebx
1000bc35:	56                   	push   esi
1000bc36:	57                   	push   edi
1000bc37:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000bc3c:	33 c5                	xor    eax,ebp
1000bc3e:	50                   	push   eax
1000bc3f:	8d 45 f4             	lea    eax,[ebp-0xc]
1000bc42:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000bc48:	8b f9                	mov    edi,ecx
1000bc4a:	89 7d e4             	mov    dword ptr [ebp-0x1c],edi
1000bc4d:	83 7d 0c 02          	cmp    dword ptr [ebp+0xc],0x2
1000bc51:	0f 8c aa 03 00 00    	jl     0x1000c001
1000bc57:	8b 5d 08             	mov    ebx,dword ptr [ebp+0x8]
1000bc5a:	8b cb                	mov    ecx,ebx
1000bc5c:	8b 03                	mov    eax,dword ptr [ebx]
1000bc5e:	ff 50 04             	call   dword ptr [eax+0x4]
1000bc61:	33 f6                	xor    esi,esi
1000bc63:	89 45 d4             	mov    dword ptr [ebp-0x2c],eax
1000bc66:	85 c0                	test   eax,eax
1000bc68:	7e 37                	jle    0x1000bca1
1000bc6a:	66 0f 1f 44 00 00    	nop    word ptr [eax+eax*1+0x0]
1000bc70:	8b 13                	mov    edx,dword ptr [ebx]
1000bc72:	8d 45 d8             	lea    eax,[ebp-0x28]
1000bc75:	56                   	push   esi
1000bc76:	50                   	push   eax
1000bc77:	8b cb                	mov    ecx,ebx
1000bc79:	ff 52 08             	call   dword ptr [edx+0x8]
1000bc7c:	8b 4d dc             	mov    ecx,dword ptr [ebp-0x24]
1000bc7f:	e8 fc 74 ff ff       	call   0x10003180
1000bc84:	83 f8 02             	cmp    eax,0x2
1000bc87:	75 12                	jne    0x1000bc9b
1000bc89:	8b 4d dc             	mov    ecx,dword ptr [ebp-0x24]
1000bc8c:	6a 00                	push   0x0
1000bc8e:	e8 cd 74 ff ff       	call   0x10003160
1000bc93:	3b c3                	cmp    eax,ebx
1000bc95:	0f 84 66 03 00 00    	je     0x1000c001
1000bc9b:	46                   	inc    esi
1000bc9c:	3b 75 d4             	cmp    esi,dword ptr [ebp-0x2c]
1000bc9f:	7c cf                	jl     0x1000bc70
1000bca1:	6a 02                	push   0x2
1000bca3:	8b cb                	mov    ecx,ebx
1000bca5:	e8 06 e2 ff ff       	call   0x10009eb0
1000bcaa:	6a 01                	push   0x1
1000bcac:	8b cb                	mov    ecx,ebx
1000bcae:	e8 ad e0 ff ff       	call   0x10009d60
1000bcb3:	6a 02                	push   0x2
1000bcb5:	8b cb                	mov    ecx,ebx
1000bcb7:	e8 84 e0 ff ff       	call   0x10009d40
1000bcbc:	33 c0                	xor    eax,eax
1000bcbe:	33 f6                	xor    esi,esi
1000bcc0:	33 db                	xor    ebx,ebx
1000bcc2:	89 45 e8             	mov    dword ptr [ebp-0x18],eax
1000bcc5:	89 45 c8             	mov    dword ptr [ebp-0x38],eax
1000bcc8:	89 5d cc             	mov    dword ptr [ebp-0x34],ebx
1000bccb:	89 75 f0             	mov    dword ptr [ebp-0x10],esi
1000bcce:	89 75 d0             	mov    dword ptr [ebp-0x30],esi
1000bcd1:	89 75 fc             	mov    dword ptr [ebp-0x4],esi
1000bcd4:	89 75 d4             	mov    dword ptr [ebp-0x2c],esi
1000bcd7:	39 75 0c             	cmp    dword ptr [ebp+0xc],esi
1000bcda:	0f 8e 79 02 00 00    	jle    0x1000bf59
1000bce0:	8b 07                	mov    eax,dword ptr [edi]
1000bce2:	8b cf                	mov    ecx,edi
1000bce4:	ff 50 04             	call   dword ptr [eax+0x4]
1000bce7:	8b 77 0c             	mov    esi,dword ptr [edi+0xc]
1000bcea:	8b d0                	mov    edx,eax
1000bcec:	8d 45 ec             	lea    eax,[ebp-0x14]
1000bcef:	89 55 ec             	mov    dword ptr [ebp-0x14],edx
1000bcf2:	8b 7e 08             	mov    edi,dword ptr [esi+0x8]
1000bcf5:	3b c7                	cmp    eax,edi
1000bcf7:	0f 83 84 00 00 00    	jae    0x1000bd81
1000bcfd:	8b 46 04             	mov    eax,dword ptr [esi+0x4]
1000bd00:	8d 4d ec             	lea    ecx,[ebp-0x14]
1000bd03:	3b c1                	cmp    eax,ecx
1000bd05:	77 7a                	ja     0x1000bd81
1000bd07:	2b c8                	sub    ecx,eax
1000bd09:	8b 46 0c             	mov    eax,dword ptr [esi+0xc]
1000bd0c:	c1 f9 02             	sar    ecx,0x2
1000bd0f:	89 4d dc             	mov    dword ptr [ebp-0x24],ecx
1000bd12:	89 45 e0             	mov    dword ptr [ebp-0x20],eax
1000bd15:	3b f8                	cmp    edi,eax
1000bd17:	75 57                	jne    0x1000bd70
1000bd19:	2b c7                	sub    eax,edi
1000bd1b:	c1 f8 02             	sar    eax,0x2
1000bd1e:	83 f8 01             	cmp    eax,0x1
1000bd21:	73 4d                	jae    0x1000bd70
1000bd23:	8b 4e 04             	mov    ecx,dword ptr [esi+0x4]
1000bd26:	b8 ff ff ff 3f       	mov    eax,0x3fffffff
1000bd2b:	2b f9                	sub    edi,ecx
1000bd2d:	c1 ff 02             	sar    edi,0x2
1000bd30:	2b c7                	sub    eax,edi
1000bd32:	83 f8 01             	cmp    eax,0x1
1000bd35:	0f 82 10 02 00 00    	jb     0x1000bf4b
1000bd3b:	8b 55 e0             	mov    edx,dword ptr [ebp-0x20]
1000bd3e:	47                   	inc    edi
1000bd3f:	2b d1                	sub    edx,ecx
1000bd41:	b9 ff ff ff 3f       	mov    ecx,0x3fffffff
1000bd46:	c1 fa 02             	sar    edx,0x2
1000bd49:	8b c2                	mov    eax,edx
1000bd4b:	89 55 e0             	mov    dword ptr [ebp-0x20],edx
1000bd4e:	d1 e8                	shr    eax,1
1000bd50:	2b c8                	sub    ecx,eax
1000bd52:	03 c2                	add    eax,edx
1000bd54:	33 d2                	xor    edx,edx
1000bd56:	3b 4d e0             	cmp    ecx,dword ptr [ebp-0x20]
1000bd59:	8d 4e 04             	lea    ecx,[esi+0x4]
1000bd5c:	0f 43 d0             	cmovae edx,eax
1000bd5f:	3b d7                	cmp    edx,edi
1000bd61:	0f 43 fa             	cmovae edi,edx
1000bd64:	57                   	push   edi
1000bd65:	e8 a6 67 ff ff       	call   0x10002510
1000bd6a:	8b 55 ec             	mov    edx,dword ptr [ebp-0x14]
1000bd6d:	8b 4d dc             	mov    ecx,dword ptr [ebp-0x24]
1000bd70:	8b 7e 08             	mov    edi,dword ptr [esi+0x8]
1000bd73:	85 ff                	test   edi,edi
1000bd75:	74 6e                	je     0x1000bde5
1000bd77:	8b 46 04             	mov    eax,dword ptr [esi+0x4]
1000bd7a:	8b 04 88             	mov    eax,dword ptr [eax+ecx*4]
1000bd7d:	89 07                	mov    dword ptr [edi],eax
1000bd7f:	eb 64                	jmp    0x1000bde5
1000bd81:	8b 4e 0c             	mov    ecx,dword ptr [esi+0xc]
1000bd84:	3b f9                	cmp    edi,ecx
1000bd86:	75 54                	jne    0x1000bddc
1000bd88:	8b c1                	mov    eax,ecx
1000bd8a:	2b c7                	sub    eax,edi
1000bd8c:	c1 f8 02             	sar    eax,0x2
1000bd8f:	83 f8 01             	cmp    eax,0x1
1000bd92:	73 48                	jae    0x1000bddc
1000bd94:	8b 56 04             	mov    edx,dword ptr [esi+0x4]
1000bd97:	b8 ff ff ff 3f       	mov    eax,0x3fffffff
1000bd9c:	2b fa                	sub    edi,edx
1000bd9e:	c1 ff 02             	sar    edi,0x2
1000bda1:	2b c7                	sub    eax,edi
1000bda3:	83 f8 01             	cmp    eax,0x1
1000bda6:	0f 82 9f 01 00 00    	jb     0x1000bf4b
1000bdac:	2b ca                	sub    ecx,edx
1000bdae:	47                   	inc    edi
1000bdaf:	c1 f9 02             	sar    ecx,0x2
1000bdb2:	33 d2                	xor    edx,edx
1000bdb4:	89 4d e0             	mov    dword ptr [ebp-0x20],ecx
1000bdb7:	8b c1                	mov    eax,ecx
1000bdb9:	d1 e8                	shr    eax,1
1000bdbb:	b9 ff ff ff 3f       	mov    ecx,0x3fffffff
1000bdc0:	2b c8                	sub    ecx,eax
1000bdc2:	03 45 e0             	add    eax,dword ptr [ebp-0x20]
1000bdc5:	3b 4d e0             	cmp    ecx,dword ptr [ebp-0x20]
1000bdc8:	8d 4e 04             	lea    ecx,[esi+0x4]
1000bdcb:	0f 43 d0             	cmovae edx,eax
1000bdce:	3b d7                	cmp    edx,edi
1000bdd0:	0f 43 fa             	cmovae edi,edx
1000bdd3:	57                   	push   edi
1000bdd4:	e8 37 67 ff ff       	call   0x10002510
1000bdd9:	8b 55 ec             	mov    edx,dword ptr [ebp-0x14]
1000bddc:	8b 46 08             	mov    eax,dword ptr [esi+0x8]
1000bddf:	85 c0                	test   eax,eax
1000bde1:	74 02                	je     0x1000bde5
1000bde3:	89 10                	mov    dword ptr [eax],edx
1000bde5:	83 46 08 04          	add    dword ptr [esi+0x8],0x4
1000bde9:	8b 4d e4             	mov    ecx,dword ptr [ebp-0x1c]
1000bdec:	89 55 e0             	mov    dword ptr [ebp-0x20],edx
1000bdef:	8b 49 0c             	mov    ecx,dword ptr [ecx+0xc]
1000bdf2:	ff 41 24             	inc    dword ptr [ecx+0x24]
1000bdf5:	8b 42 04             	mov    eax,dword ptr [edx+0x4]
1000bdf8:	8b 49 24             	mov    ecx,dword ptr [ecx+0x24]
1000bdfb:	89 48 04             	mov    dword ptr [eax+0x4],ecx
1000bdfe:	8d 45 e0             	lea    eax,[ebp-0x20]
1000be01:	8b 4d e8             	mov    ecx,dword ptr [ebp-0x18]
1000be04:	3b c3                	cmp    eax,ebx
1000be06:	0f 83 8c 00 00 00    	jae    0x1000be98
1000be0c:	3b c8                	cmp    ecx,eax
1000be0e:	0f 87 84 00 00 00    	ja     0x1000be98
1000be14:	8b 7d f0             	mov    edi,dword ptr [ebp-0x10]
1000be17:	2b c1                	sub    eax,ecx
1000be19:	c1 f8 02             	sar    eax,0x2
1000be1c:	89 45 dc             	mov    dword ptr [ebp-0x24],eax
1000be1f:	3b df                	cmp    ebx,edi
1000be21:	75 5f                	jne    0x1000be82
1000be23:	8b c7                	mov    eax,edi
1000be25:	2b c3                	sub    eax,ebx
1000be27:	c1 f8 02             	sar    eax,0x2
1000be2a:	83 f8 01             	cmp    eax,0x1
1000be2d:	73 58                	jae    0x1000be87
1000be2f:	2b d9                	sub    ebx,ecx
1000be31:	b8 ff ff ff 3f       	mov    eax,0x3fffffff
1000be36:	c1 fb 02             	sar    ebx,0x2
1000be39:	2b c3                	sub    eax,ebx
1000be3b:	83 f8 01             	cmp    eax,0x1
1000be3e:	0f 82 07 01 00 00    	jb     0x1000bf4b
1000be44:	2b f9                	sub    edi,ecx
1000be46:	8d 73 01             	lea    esi,[ebx+0x1]
1000be49:	c1 ff 02             	sar    edi,0x2
1000be4c:	b9 ff ff ff 3f       	mov    ecx,0x3fffffff
1000be51:	8b c7                	mov    eax,edi
1000be53:	33 d2                	xor    edx,edx
1000be55:	d1 e8                	shr    eax,1
1000be57:	2b c8                	sub    ecx,eax
1000be59:	03 c7                	add    eax,edi
1000be5b:	3b cf                	cmp    ecx,edi
1000be5d:	8d 4d c8             	lea    ecx,[ebp-0x38]
1000be60:	0f 43 d0             	cmovae edx,eax
1000be63:	3b d6                	cmp    edx,esi
1000be65:	0f 43 f2             	cmovae esi,edx
1000be68:	56                   	push   esi
1000be69:	e8 a2 66 ff ff       	call   0x10002510
1000be6e:	8b 75 d0             	mov    esi,dword ptr [ebp-0x30]
1000be71:	8b 4d c8             	mov    ecx,dword ptr [ebp-0x38]
1000be74:	8b 5d cc             	mov    ebx,dword ptr [ebp-0x34]
1000be77:	8b 55 ec             	mov    edx,dword ptr [ebp-0x14]
1000be7a:	89 75 f0             	mov    dword ptr [ebp-0x10],esi
1000be7d:	89 4d e8             	mov    dword ptr [ebp-0x18],ecx
1000be80:	eb 08                	jmp    0x1000be8a
1000be82:	8b 75 f0             	mov    esi,dword ptr [ebp-0x10]
1000be85:	eb 06                	jmp    0x1000be8d
1000be87:	8b 75 f0             	mov    esi,dword ptr [ebp-0x10]
1000be8a:	8b 45 dc             	mov    eax,dword ptr [ebp-0x24]
1000be8d:	85 db                	test   ebx,ebx
1000be8f:	74 76                	je     0x1000bf07
1000be91:	8b 04 81             	mov    eax,dword ptr [ecx+eax*4]
1000be94:	89 03                	mov    dword ptr [ebx],eax
1000be96:	eb 6f                	jmp    0x1000bf07
1000be98:	8b 7d f0             	mov    edi,dword ptr [ebp-0x10]
1000be9b:	3b df                	cmp    ebx,edi
1000be9d:	75 5f                	jne    0x1000befe
1000be9f:	8b c7                	mov    eax,edi
1000bea1:	2b c3                	sub    eax,ebx
1000bea3:	c1 f8 02             	sar    eax,0x2
1000bea6:	83 f8 01             	cmp    eax,0x1
1000bea9:	73 53                	jae    0x1000befe
1000beab:	2b d9                	sub    ebx,ecx
1000bead:	b8 ff ff ff 3f       	mov    eax,0x3fffffff
1000beb2:	c1 fb 02             	sar    ebx,0x2
1000beb5:	2b c3                	sub    eax,ebx
1000beb7:	83 f8 01             	cmp    eax,0x1
1000beba:	0f 82 8b 00 00 00    	jb     0x1000bf4b
1000bec0:	2b f9                	sub    edi,ecx
1000bec2:	8d 73 01             	lea    esi,[ebx+0x1]
1000bec5:	c1 ff 02             	sar    edi,0x2
1000bec8:	b9 ff ff ff 3f       	mov    ecx,0x3fffffff
1000becd:	8b c7                	mov    eax,edi
1000becf:	33 d2                	xor    edx,edx
1000bed1:	d1 e8                	shr    eax,1
1000bed3:	2b c8                	sub    ecx,eax
1000bed5:	03 c7                	add    eax,edi
1000bed7:	3b cf                	cmp    ecx,edi
1000bed9:	8d 4d c8             	lea    ecx,[ebp-0x38]
1000bedc:	0f 43 d0             	cmovae edx,eax
1000bedf:	3b d6                	cmp    edx,esi
1000bee1:	0f 43 f2             	cmovae esi,edx
1000bee4:	56                   	push   esi
1000bee5:	e8 26 66 ff ff       	call   0x10002510
1000beea:	8b 75 d0             	mov    esi,dword ptr [ebp-0x30]
1000beed:	8b 4d c8             	mov    ecx,dword ptr [ebp-0x38]
1000bef0:	8b 5d cc             	mov    ebx,dword ptr [ebp-0x34]
1000bef3:	8b 55 ec             	mov    edx,dword ptr [ebp-0x14]
1000bef6:	89 75 f0             	mov    dword ptr [ebp-0x10],esi
1000bef9:	89 4d e8             	mov    dword ptr [ebp-0x18],ecx
1000befc:	eb 03                	jmp    0x1000bf01
1000befe:	8b 75 f0             	mov    esi,dword ptr [ebp-0x10]
1000bf01:	85 db                	test   ebx,ebx
1000bf03:	74 02                	je     0x1000bf07
1000bf05:	89 13                	mov    dword ptr [ebx],edx
1000bf07:	8b 4d e4             	mov    ecx,dword ptr [ebp-0x1c]
1000bf0a:	83 c3 04             	add    ebx,0x4
1000bf0d:	52                   	push   edx
1000bf0e:	ff 75 08             	push   dword ptr [ebp+0x8]
1000bf11:	89 5d cc             	mov    dword ptr [ebp-0x34],ebx
1000bf14:	e8 97 ef ff ff       	call   0x1000aeb0
1000bf19:	8b 7d ec             	mov    edi,dword ptr [ebp-0x14]
1000bf1c:	8b cf                	mov    ecx,edi
1000bf1e:	6a 00                	push   0x0
1000bf20:	e8 3b de ff ff       	call   0x10009d60
1000bf25:	6a 00                	push   0x0
1000bf27:	8b cf                	mov    ecx,edi
1000bf29:	e8 82 df ff ff       	call   0x10009eb0
1000bf2e:	6a 00                	push   0x0
1000bf30:	8b cf                	mov    ecx,edi
1000bf32:	e8 09 de ff ff       	call   0x10009d40
1000bf37:	8b 45 d4             	mov    eax,dword ptr [ebp-0x2c]
1000bf3a:	40                   	inc    eax
1000bf3b:	89 45 d4             	mov    dword ptr [ebp-0x2c],eax
1000bf3e:	3b 45 0c             	cmp    eax,dword ptr [ebp+0xc]
1000bf41:	7d 13                	jge    0x1000bf56
1000bf43:	8b 7d e4             	mov    edi,dword ptr [ebp-0x1c]
1000bf46:	e9 95 fd ff ff       	jmp    0x1000bce0
1000bf4b:	68 4c 71 01 10       	push   0x1001714c
1000bf50:	ff 15 34 70 01 10    	call   dword ptr ds:0x10017034
1000bf56:	8b 45 e8             	mov    eax,dword ptr [ebp-0x18]
1000bf59:	2b d8                	sub    ebx,eax
1000bf5b:	33 ff                	xor    edi,edi
1000bf5d:	c1 fb 02             	sar    ebx,0x2
1000bf60:	85 db                	test   ebx,ebx
1000bf62:	74 32                	je     0x1000bf96
1000bf64:	8b 75 08             	mov    esi,dword ptr [ebp+0x8]
1000bf67:	8d 4b ff             	lea    ecx,[ebx-0x1]
1000bf6a:	66 0f 1f 44 00 00    	nop    word ptr [eax+eax*1+0x0]
1000bf70:	3b f9                	cmp    edi,ecx
1000bf72:	8b 4d e4             	mov    ecx,dword ptr [ebp-0x1c]
1000bf75:	74 06                	je     0x1000bf7d
1000bf77:	ff 74 b8 04          	push   dword ptr [eax+edi*4+0x4]
1000bf7b:	eb 02                	jmp    0x1000bf7f
1000bf7d:	6a 00                	push   0x0
1000bf7f:	ff 34 b8             	push   dword ptr [eax+edi*4]
1000bf82:	56                   	push   esi
1000bf83:	e8 48 ee ff ff       	call   0x1000add0
1000bf88:	8b 45 e8             	mov    eax,dword ptr [ebp-0x18]
1000bf8b:	8d 4b ff             	lea    ecx,[ebx-0x1]
1000bf8e:	47                   	inc    edi
1000bf8f:	3b fb                	cmp    edi,ebx
1000bf91:	72 dd                	jb     0x1000bf70
1000bf93:	8b 75 f0             	mov    esi,dword ptr [ebp-0x10]
1000bf96:	8b 4d e4             	mov    ecx,dword ptr [ebp-0x1c]
1000bf99:	e8 62 f1 ff ff       	call   0x1000b100
1000bf9e:	8b 4d e8             	mov    ecx,dword ptr [ebp-0x18]
1000bfa1:	85 c9                	test   ecx,ecx
1000bfa3:	74 5c                	je     0x1000c001
1000bfa5:	2b f1                	sub    esi,ecx
1000bfa7:	c1 fe 02             	sar    esi,0x2
1000bfaa:	81 fe ff ff ff 3f    	cmp    esi,0x3fffffff
1000bfb0:	76 06                	jbe    0x1000bfb8
1000bfb2:	ff 15 b8 70 01 10    	call   dword ptr ds:0x100170b8
1000bfb8:	8d 04 b5 00 00 00 00 	lea    eax,[esi*4+0x0]
1000bfbf:	3d 00 10 00 00       	cmp    eax,0x1000
1000bfc4:	72 32                	jb     0x1000bff8
1000bfc6:	f6 c1 1f             	test   cl,0x1f
1000bfc9:	74 06                	je     0x1000bfd1
1000bfcb:	ff 15 b8 70 01 10    	call   dword ptr ds:0x100170b8
1000bfd1:	8b 41 fc             	mov    eax,dword ptr [ecx-0x4]
1000bfd4:	3b c1                	cmp    eax,ecx
1000bfd6:	72 06                	jb     0x1000bfde
1000bfd8:	ff 15 b8 70 01 10    	call   dword ptr ds:0x100170b8
1000bfde:	2b c8                	sub    ecx,eax
1000bfe0:	83 f9 04             	cmp    ecx,0x4
1000bfe3:	73 06                	jae    0x1000bfeb
1000bfe5:	ff 15 b8 70 01 10    	call   dword ptr ds:0x100170b8
1000bfeb:	83 f9 23             	cmp    ecx,0x23
1000bfee:	76 06                	jbe    0x1000bff6
1000bff0:	ff 15 b8 70 01 10    	call   dword ptr ds:0x100170b8
1000bff6:	8b c8                	mov    ecx,eax
1000bff8:	51                   	push   ecx
1000bff9:	e8 25 8d 00 00       	call   0x10014d23
1000bffe:	83 c4 04             	add    esp,0x4
1000c001:	8b 4d f4             	mov    ecx,dword ptr [ebp-0xc]
1000c004:	64 89 0d 00 00 00 00 	mov    dword ptr fs:0x0,ecx
1000c00b:	59                   	pop    ecx
1000c00c:	5f                   	pop    edi
1000c00d:	5e                   	pop    esi
1000c00e:	5b                   	pop    ebx
1000c00f:	8b e5                	mov    esp,ebp
1000c011:	5d                   	pop    ebp
1000c012:	c2 08 00             	ret    0x8
