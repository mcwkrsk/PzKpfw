; MAIWmodels.dll SHA-256: 80ccc6678bdf057152f473369a56eb3b76a1ce643edca2832345f7b53e09c525
; Function range: 0x1000e020..0x1000e280
; Static disassembly evidence; no runtime execution.

/mnt/data/work_stage117/original/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

1000e020 <.text+0xd020>:
1000e020:	55                   	push   ebp
1000e021:	8b ec                	mov    ebp,esp
1000e023:	83 ec 10             	sub    esp,0x10
1000e026:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
1000e029:	53                   	push   ebx
1000e02a:	56                   	push   esi
1000e02b:	8b d9                	mov    ebx,ecx
1000e02d:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
1000e030:	57                   	push   edi
1000e031:	8d 4d 0c             	lea    ecx,[ebp+0xc]
1000e034:	e8 97 56 00 00       	call   0x100136d0
1000e039:	8b 4d fc             	mov    ecx,DWORD PTR [ebp-0x4]
1000e03c:	8b 31                	mov    esi,DWORD PTR [ecx]
1000e03e:	80 7e 0d 00          	cmp    BYTE PTR [esi+0xd],0x0
1000e042:	74 05                	je     0x1000e049
1000e044:	8b 79 08             	mov    edi,DWORD PTR [ecx+0x8]
1000e047:	eb 1b                	jmp    0x1000e064
1000e049:	8b 41 08             	mov    eax,DWORD PTR [ecx+0x8]
1000e04c:	80 78 0d 00          	cmp    BYTE PTR [eax+0xd],0x0
1000e050:	74 04                	je     0x1000e056
1000e052:	8b fe                	mov    edi,esi
1000e054:	eb 0e                	jmp    0x1000e064
1000e056:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
1000e059:	8b 7a 08             	mov    edi,DWORD PTR [edx+0x8]
1000e05c:	3b d1                	cmp    edx,ecx
1000e05e:	0f 85 83 00 00 00    	jne    0x1000e0e7
1000e064:	80 7f 0d 00          	cmp    BYTE PTR [edi+0xd],0x0
1000e068:	8b 71 04             	mov    esi,DWORD PTR [ecx+0x4]
1000e06b:	75 03                	jne    0x1000e070
1000e06d:	89 77 04             	mov    DWORD PTR [edi+0x4],esi
1000e070:	8b 03                	mov    eax,DWORD PTR [ebx]
1000e072:	39 48 04             	cmp    DWORD PTR [eax+0x4],ecx
1000e075:	75 05                	jne    0x1000e07c
1000e077:	89 78 04             	mov    DWORD PTR [eax+0x4],edi
1000e07a:	eb 0b                	jmp    0x1000e087
1000e07c:	39 0e                	cmp    DWORD PTR [esi],ecx
1000e07e:	75 04                	jne    0x1000e084
1000e080:	89 3e                	mov    DWORD PTR [esi],edi
1000e082:	eb 03                	jmp    0x1000e087
1000e084:	89 7e 08             	mov    DWORD PTR [esi+0x8],edi
1000e087:	8b 03                	mov    eax,DWORD PTR [ebx]
1000e089:	39 08                	cmp    DWORD PTR [eax],ecx
1000e08b:	75 22                	jne    0x1000e0af
1000e08d:	80 7f 0d 00          	cmp    BYTE PTR [edi+0xd],0x0
1000e091:	74 04                	je     0x1000e097
1000e093:	8b d6                	mov    edx,esi
1000e095:	eb 16                	jmp    0x1000e0ad
1000e097:	8b 07                	mov    eax,DWORD PTR [edi]
1000e099:	8b d7                	mov    edx,edi
1000e09b:	80 78 0d 00          	cmp    BYTE PTR [eax+0xd],0x0
1000e09f:	75 0a                	jne    0x1000e0ab
1000e0a1:	8b d0                	mov    edx,eax
1000e0a3:	8b 02                	mov    eax,DWORD PTR [edx]
1000e0a5:	80 78 0d 00          	cmp    BYTE PTR [eax+0xd],0x0
1000e0a9:	74 f6                	je     0x1000e0a1
1000e0ab:	8b 03                	mov    eax,DWORD PTR [ebx]
1000e0ad:	89 10                	mov    DWORD PTR [eax],edx
1000e0af:	8b 03                	mov    eax,DWORD PTR [ebx]
1000e0b1:	39 48 08             	cmp    DWORD PTR [eax+0x8],ecx
1000e0b4:	0f 85 8b 00 00 00    	jne    0x1000e145
1000e0ba:	80 7f 0d 00          	cmp    BYTE PTR [edi+0xd],0x0
1000e0be:	74 0a                	je     0x1000e0ca
1000e0c0:	8b d6                	mov    edx,esi
1000e0c2:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
1000e0c5:	e9 7b 00 00 00       	jmp    0x1000e145
1000e0ca:	8b 47 08             	mov    eax,DWORD PTR [edi+0x8]
1000e0cd:	8b d7                	mov    edx,edi
1000e0cf:	80 78 0d 00          	cmp    BYTE PTR [eax+0xd],0x0
1000e0d3:	75 0b                	jne    0x1000e0e0
1000e0d5:	8b d0                	mov    edx,eax
1000e0d7:	8b 42 08             	mov    eax,DWORD PTR [edx+0x8]
1000e0da:	80 78 0d 00          	cmp    BYTE PTR [eax+0xd],0x0
1000e0de:	74 f5                	je     0x1000e0d5
1000e0e0:	8b 03                	mov    eax,DWORD PTR [ebx]
1000e0e2:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
1000e0e5:	eb 5e                	jmp    0x1000e145
1000e0e7:	89 56 04             	mov    DWORD PTR [esi+0x4],edx
1000e0ea:	8b 01                	mov    eax,DWORD PTR [ecx]
1000e0ec:	89 02                	mov    DWORD PTR [edx],eax
1000e0ee:	3b 51 08             	cmp    edx,DWORD PTR [ecx+0x8]
1000e0f1:	75 04                	jne    0x1000e0f7
1000e0f3:	8b f2                	mov    esi,edx
1000e0f5:	eb 1a                	jmp    0x1000e111
1000e0f7:	80 7f 0d 00          	cmp    BYTE PTR [edi+0xd],0x0
1000e0fb:	8b 72 04             	mov    esi,DWORD PTR [edx+0x4]
1000e0fe:	75 03                	jne    0x1000e103
1000e100:	89 77 04             	mov    DWORD PTR [edi+0x4],esi
1000e103:	89 3e                	mov    DWORD PTR [esi],edi
1000e105:	8b 41 08             	mov    eax,DWORD PTR [ecx+0x8]
1000e108:	89 42 08             	mov    DWORD PTR [edx+0x8],eax
1000e10b:	8b 41 08             	mov    eax,DWORD PTR [ecx+0x8]
1000e10e:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
1000e111:	8b 03                	mov    eax,DWORD PTR [ebx]
1000e113:	39 48 04             	cmp    DWORD PTR [eax+0x4],ecx
1000e116:	75 05                	jne    0x1000e11d
1000e118:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
1000e11b:	eb 0e                	jmp    0x1000e12b
1000e11d:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
1000e120:	39 08                	cmp    DWORD PTR [eax],ecx
1000e122:	75 04                	jne    0x1000e128
1000e124:	89 10                	mov    DWORD PTR [eax],edx
1000e126:	eb 03                	jmp    0x1000e12b
1000e128:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
1000e12b:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
1000e12e:	89 42 04             	mov    DWORD PTR [edx+0x4],eax
1000e131:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
1000e134:	8a 4a 0c             	mov    cl,BYTE PTR [edx+0xc]
1000e137:	8a 40 0c             	mov    al,BYTE PTR [eax+0xc]
1000e13a:	88 42 0c             	mov    BYTE PTR [edx+0xc],al
1000e13d:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
1000e140:	88 48 0c             	mov    BYTE PTR [eax+0xc],cl
1000e143:	8b c8                	mov    ecx,eax
1000e145:	80 79 0c 01          	cmp    BYTE PTR [ecx+0xc],0x1
1000e149:	0f 85 ef 00 00 00    	jne    0x1000e23e
1000e14f:	8b 03                	mov    eax,DWORD PTR [ebx]
1000e151:	3b 78 04             	cmp    edi,DWORD PTR [eax+0x4]
1000e154:	0f 84 e0 00 00 00    	je     0x1000e23a
1000e15a:	66 0f 1f 44 00 00    	nop    WORD PTR [eax+eax*1+0x0]
1000e160:	80 7f 0c 01          	cmp    BYTE PTR [edi+0xc],0x1
1000e164:	8b d6                	mov    edx,esi
1000e166:	89 55 f8             	mov    DWORD PTR [ebp-0x8],edx
1000e169:	89 75 f4             	mov    DWORD PTR [ebp-0xc],esi
1000e16c:	89 75 f0             	mov    DWORD PTR [ebp-0x10],esi
1000e16f:	0f 85 c2 00 00 00    	jne    0x1000e237
1000e175:	8b 0e                	mov    ecx,DWORD PTR [esi]
1000e177:	3b f9                	cmp    edi,ecx
1000e179:	75 72                	jne    0x1000e1ed
1000e17b:	8b 4e 08             	mov    ecx,DWORD PTR [esi+0x8]
1000e17e:	80 79 0c 00          	cmp    BYTE PTR [ecx+0xc],0x0
1000e182:	75 15                	jne    0x1000e199
1000e184:	c6 41 0c 01          	mov    BYTE PTR [ecx+0xc],0x1
1000e188:	8b cb                	mov    ecx,ebx
1000e18a:	56                   	push   esi
1000e18b:	c6 46 0c 00          	mov    BYTE PTR [esi+0xc],0x0
1000e18f:	e8 7c 57 00 00       	call   0x10013910
1000e194:	8b 4e 08             	mov    ecx,DWORD PTR [esi+0x8]
1000e197:	8b d6                	mov    edx,esi
1000e199:	80 79 0d 00          	cmp    BYTE PTR [ecx+0xd],0x0
1000e19d:	0f 85 80 00 00 00    	jne    0x1000e223
1000e1a3:	8b 01                	mov    eax,DWORD PTR [ecx]
1000e1a5:	80 78 0c 01          	cmp    BYTE PTR [eax+0xc],0x1
1000e1a9:	75 09                	jne    0x1000e1b4
1000e1ab:	8b 41 08             	mov    eax,DWORD PTR [ecx+0x8]
1000e1ae:	80 78 0c 01          	cmp    BYTE PTR [eax+0xc],0x1
1000e1b2:	74 6b                	je     0x1000e21f
1000e1b4:	8b 41 08             	mov    eax,DWORD PTR [ecx+0x8]
1000e1b7:	80 78 0c 01          	cmp    BYTE PTR [eax+0xc],0x1
1000e1bb:	75 15                	jne    0x1000e1d2
1000e1bd:	8b 01                	mov    eax,DWORD PTR [ecx]
1000e1bf:	51                   	push   ecx
1000e1c0:	c6 40 0c 01          	mov    BYTE PTR [eax+0xc],0x1
1000e1c4:	c6 41 0c 00          	mov    BYTE PTR [ecx+0xc],0x0
1000e1c8:	8b cb                	mov    ecx,ebx
1000e1ca:	e8 a1 57 00 00       	call   0x10013970
1000e1cf:	8b 4e 08             	mov    ecx,DWORD PTR [esi+0x8]
1000e1d2:	8a 46 0c             	mov    al,BYTE PTR [esi+0xc]
1000e1d5:	88 41 0c             	mov    BYTE PTR [ecx+0xc],al
1000e1d8:	c6 46 0c 01          	mov    BYTE PTR [esi+0xc],0x1
1000e1dc:	8b 41 08             	mov    eax,DWORD PTR [ecx+0x8]
1000e1df:	8b cb                	mov    ecx,ebx
1000e1e1:	56                   	push   esi
1000e1e2:	c6 40 0c 01          	mov    BYTE PTR [eax+0xc],0x1
1000e1e6:	e8 25 57 00 00       	call   0x10013910
1000e1eb:	eb 4a                	jmp    0x1000e237
1000e1ed:	80 79 0c 00          	cmp    BYTE PTR [ecx+0xc],0x0
1000e1f1:	75 15                	jne    0x1000e208
1000e1f3:	c6 41 0c 01          	mov    BYTE PTR [ecx+0xc],0x1
1000e1f7:	8b cb                	mov    ecx,ebx
1000e1f9:	56                   	push   esi
1000e1fa:	c6 46 0c 00          	mov    BYTE PTR [esi+0xc],0x0
1000e1fe:	e8 6d 57 00 00       	call   0x10013970
1000e203:	8b 0e                	mov    ecx,DWORD PTR [esi]
1000e205:	8b 55 f8             	mov    edx,DWORD PTR [ebp-0x8]
1000e208:	80 79 0d 00          	cmp    BYTE PTR [ecx+0xd],0x0
1000e20c:	75 15                	jne    0x1000e223
1000e20e:	8b 41 08             	mov    eax,DWORD PTR [ecx+0x8]
1000e211:	80 78 0c 01          	cmp    BYTE PTR [eax+0xc],0x1
1000e215:	75 69                	jne    0x1000e280
1000e217:	8b 01                	mov    eax,DWORD PTR [ecx]
1000e219:	80 78 0c 01          	cmp    BYTE PTR [eax+0xc],0x1
1000e21d:	75 61                	jne    0x1000e280
1000e21f:	c6 41 0c 00          	mov    BYTE PTR [ecx+0xc],0x0
1000e223:	8b 03                	mov    eax,DWORD PTR [ebx]
1000e225:	8b 76 04             	mov    esi,DWORD PTR [esi+0x4]
1000e228:	8b 7d f4             	mov    edi,DWORD PTR [ebp-0xc]
1000e22b:	3b 50 04             	cmp    edx,DWORD PTR [eax+0x4]
1000e22e:	0f 85 2c ff ff ff    	jne    0x1000e160
1000e234:	8b 7d f0             	mov    edi,DWORD PTR [ebp-0x10]
1000e237:	8b 4d fc             	mov    ecx,DWORD PTR [ebp-0x4]
1000e23a:	c6 47 0c 01          	mov    BYTE PTR [edi+0xc],0x1
1000e23e:	8b 41 14             	mov    eax,DWORD PTR [ecx+0x14]
1000e241:	8d 71 14             	lea    esi,[ecx+0x14]
1000e244:	50                   	push   eax
1000e245:	8b ce                	mov    ecx,esi
1000e247:	ff 30                	push   DWORD PTR [eax]
1000e249:	8d 45 f0             	lea    eax,[ebp-0x10]
1000e24c:	50                   	push   eax
1000e24d:	e8 7e 59 00 00       	call   0x10013bd0
1000e252:	ff 36                	push   DWORD PTR [esi]
1000e254:	e8 ca 6a 00 00       	call   0x10014d23
1000e259:	ff 75 fc             	push   DWORD PTR [ebp-0x4]
1000e25c:	e8 c2 6a 00 00       	call   0x10014d23
1000e261:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
1000e264:	83 c4 08             	add    esp,0x8
1000e267:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
1000e26a:	85 c0                	test   eax,eax
1000e26c:	74 04                	je     0x1000e272
1000e26e:	48                   	dec    eax
1000e26f:	89 43 04             	mov    DWORD PTR [ebx+0x4],eax
1000e272:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000e275:	5f                   	pop    edi
1000e276:	5e                   	pop    esi
1000e277:	5b                   	pop    ebx
1000e278:	89 08                	mov    DWORD PTR [eax],ecx
1000e27a:	8b e5                	mov    esp,ebp
1000e27c:	5d                   	pop    ebp
1000e27d:	c2 08 00             	ret    0x8
