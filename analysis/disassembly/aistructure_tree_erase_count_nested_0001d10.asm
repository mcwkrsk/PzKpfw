; MAIWmodels.dll SHA-256: 80ccc6678bdf057152f473369a56eb3b76a1ce643edca2832345f7b53e09c525
; Function range: 0x10001d10..0x10001f53
; Static disassembly evidence; no runtime execution.

/mnt/data/work_stage117/original/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

10001d10 <.text+0xd10>:
10001d10:	55                   	push   ebp
10001d11:	8b ec                	mov    ebp,esp
10001d13:	83 ec 10             	sub    esp,0x10
10001d16:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10001d19:	53                   	push   ebx
10001d1a:	56                   	push   esi
10001d1b:	8b d9                	mov    ebx,ecx
10001d1d:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
10001d20:	57                   	push   edi
10001d21:	8d 4d 0c             	lea    ecx,[ebp+0xc]
10001d24:	e8 a7 19 01 00       	call   0x100136d0
10001d29:	8b 4d fc             	mov    ecx,DWORD PTR [ebp-0x4]
10001d2c:	8b 31                	mov    esi,DWORD PTR [ecx]
10001d2e:	80 7e 0d 00          	cmp    BYTE PTR [esi+0xd],0x0
10001d32:	74 05                	je     0x10001d39
10001d34:	8b 79 08             	mov    edi,DWORD PTR [ecx+0x8]
10001d37:	eb 1b                	jmp    0x10001d54
10001d39:	8b 41 08             	mov    eax,DWORD PTR [ecx+0x8]
10001d3c:	80 78 0d 00          	cmp    BYTE PTR [eax+0xd],0x0
10001d40:	74 04                	je     0x10001d46
10001d42:	8b fe                	mov    edi,esi
10001d44:	eb 0e                	jmp    0x10001d54
10001d46:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
10001d49:	8b 7a 08             	mov    edi,DWORD PTR [edx+0x8]
10001d4c:	3b d1                	cmp    edx,ecx
10001d4e:	0f 85 83 00 00 00    	jne    0x10001dd7
10001d54:	80 7f 0d 00          	cmp    BYTE PTR [edi+0xd],0x0
10001d58:	8b 71 04             	mov    esi,DWORD PTR [ecx+0x4]
10001d5b:	75 03                	jne    0x10001d60
10001d5d:	89 77 04             	mov    DWORD PTR [edi+0x4],esi
10001d60:	8b 03                	mov    eax,DWORD PTR [ebx]
10001d62:	39 48 04             	cmp    DWORD PTR [eax+0x4],ecx
10001d65:	75 05                	jne    0x10001d6c
10001d67:	89 78 04             	mov    DWORD PTR [eax+0x4],edi
10001d6a:	eb 0b                	jmp    0x10001d77
10001d6c:	39 0e                	cmp    DWORD PTR [esi],ecx
10001d6e:	75 04                	jne    0x10001d74
10001d70:	89 3e                	mov    DWORD PTR [esi],edi
10001d72:	eb 03                	jmp    0x10001d77
10001d74:	89 7e 08             	mov    DWORD PTR [esi+0x8],edi
10001d77:	8b 03                	mov    eax,DWORD PTR [ebx]
10001d79:	39 08                	cmp    DWORD PTR [eax],ecx
10001d7b:	75 22                	jne    0x10001d9f
10001d7d:	80 7f 0d 00          	cmp    BYTE PTR [edi+0xd],0x0
10001d81:	74 04                	je     0x10001d87
10001d83:	8b d6                	mov    edx,esi
10001d85:	eb 16                	jmp    0x10001d9d
10001d87:	8b 07                	mov    eax,DWORD PTR [edi]
10001d89:	8b d7                	mov    edx,edi
10001d8b:	80 78 0d 00          	cmp    BYTE PTR [eax+0xd],0x0
10001d8f:	75 0a                	jne    0x10001d9b
10001d91:	8b d0                	mov    edx,eax
10001d93:	8b 02                	mov    eax,DWORD PTR [edx]
10001d95:	80 78 0d 00          	cmp    BYTE PTR [eax+0xd],0x0
10001d99:	74 f6                	je     0x10001d91
10001d9b:	8b 03                	mov    eax,DWORD PTR [ebx]
10001d9d:	89 10                	mov    DWORD PTR [eax],edx
10001d9f:	8b 03                	mov    eax,DWORD PTR [ebx]
10001da1:	39 48 08             	cmp    DWORD PTR [eax+0x8],ecx
10001da4:	0f 85 8b 00 00 00    	jne    0x10001e35
10001daa:	80 7f 0d 00          	cmp    BYTE PTR [edi+0xd],0x0
10001dae:	74 0a                	je     0x10001dba
10001db0:	8b d6                	mov    edx,esi
10001db2:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
10001db5:	e9 7b 00 00 00       	jmp    0x10001e35
10001dba:	8b 47 08             	mov    eax,DWORD PTR [edi+0x8]
10001dbd:	8b d7                	mov    edx,edi
10001dbf:	80 78 0d 00          	cmp    BYTE PTR [eax+0xd],0x0
10001dc3:	75 0b                	jne    0x10001dd0
10001dc5:	8b d0                	mov    edx,eax
10001dc7:	8b 42 08             	mov    eax,DWORD PTR [edx+0x8]
10001dca:	80 78 0d 00          	cmp    BYTE PTR [eax+0xd],0x0
10001dce:	74 f5                	je     0x10001dc5
10001dd0:	8b 03                	mov    eax,DWORD PTR [ebx]
10001dd2:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
10001dd5:	eb 5e                	jmp    0x10001e35
10001dd7:	89 56 04             	mov    DWORD PTR [esi+0x4],edx
10001dda:	8b 01                	mov    eax,DWORD PTR [ecx]
10001ddc:	89 02                	mov    DWORD PTR [edx],eax
10001dde:	3b 51 08             	cmp    edx,DWORD PTR [ecx+0x8]
10001de1:	75 04                	jne    0x10001de7
10001de3:	8b f2                	mov    esi,edx
10001de5:	eb 1a                	jmp    0x10001e01
10001de7:	80 7f 0d 00          	cmp    BYTE PTR [edi+0xd],0x0
10001deb:	8b 72 04             	mov    esi,DWORD PTR [edx+0x4]
10001dee:	75 03                	jne    0x10001df3
10001df0:	89 77 04             	mov    DWORD PTR [edi+0x4],esi
10001df3:	89 3e                	mov    DWORD PTR [esi],edi
10001df5:	8b 41 08             	mov    eax,DWORD PTR [ecx+0x8]
10001df8:	89 42 08             	mov    DWORD PTR [edx+0x8],eax
10001dfb:	8b 41 08             	mov    eax,DWORD PTR [ecx+0x8]
10001dfe:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
10001e01:	8b 03                	mov    eax,DWORD PTR [ebx]
10001e03:	39 48 04             	cmp    DWORD PTR [eax+0x4],ecx
10001e06:	75 05                	jne    0x10001e0d
10001e08:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
10001e0b:	eb 0e                	jmp    0x10001e1b
10001e0d:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
10001e10:	39 08                	cmp    DWORD PTR [eax],ecx
10001e12:	75 04                	jne    0x10001e18
10001e14:	89 10                	mov    DWORD PTR [eax],edx
10001e16:	eb 03                	jmp    0x10001e1b
10001e18:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
10001e1b:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
10001e1e:	89 42 04             	mov    DWORD PTR [edx+0x4],eax
10001e21:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
10001e24:	8a 4a 0c             	mov    cl,BYTE PTR [edx+0xc]
10001e27:	8a 40 0c             	mov    al,BYTE PTR [eax+0xc]
10001e2a:	88 42 0c             	mov    BYTE PTR [edx+0xc],al
10001e2d:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
10001e30:	88 48 0c             	mov    BYTE PTR [eax+0xc],cl
10001e33:	8b c8                	mov    ecx,eax
10001e35:	80 79 0c 01          	cmp    BYTE PTR [ecx+0xc],0x1
10001e39:	0f 85 ef 00 00 00    	jne    0x10001f2e
10001e3f:	8b 03                	mov    eax,DWORD PTR [ebx]
10001e41:	3b 78 04             	cmp    edi,DWORD PTR [eax+0x4]
10001e44:	0f 84 e0 00 00 00    	je     0x10001f2a
10001e4a:	66 0f 1f 44 00 00    	nop    WORD PTR [eax+eax*1+0x0]
10001e50:	80 7f 0c 01          	cmp    BYTE PTR [edi+0xc],0x1
10001e54:	8b d6                	mov    edx,esi
10001e56:	89 55 f8             	mov    DWORD PTR [ebp-0x8],edx
10001e59:	89 75 f4             	mov    DWORD PTR [ebp-0xc],esi
10001e5c:	89 75 f0             	mov    DWORD PTR [ebp-0x10],esi
10001e5f:	0f 85 c2 00 00 00    	jne    0x10001f27
10001e65:	8b 0e                	mov    ecx,DWORD PTR [esi]
10001e67:	3b f9                	cmp    edi,ecx
10001e69:	75 72                	jne    0x10001edd
10001e6b:	8b 4e 08             	mov    ecx,DWORD PTR [esi+0x8]
10001e6e:	80 79 0c 00          	cmp    BYTE PTR [ecx+0xc],0x0
10001e72:	75 15                	jne    0x10001e89
10001e74:	c6 41 0c 01          	mov    BYTE PTR [ecx+0xc],0x1
10001e78:	8b cb                	mov    ecx,ebx
10001e7a:	56                   	push   esi
10001e7b:	c6 46 0c 00          	mov    BYTE PTR [esi+0xc],0x0
10001e7f:	e8 8c 1a 01 00       	call   0x10013910
10001e84:	8b 4e 08             	mov    ecx,DWORD PTR [esi+0x8]
10001e87:	8b d6                	mov    edx,esi
10001e89:	80 79 0d 00          	cmp    BYTE PTR [ecx+0xd],0x0
10001e8d:	0f 85 80 00 00 00    	jne    0x10001f13
10001e93:	8b 01                	mov    eax,DWORD PTR [ecx]
10001e95:	80 78 0c 01          	cmp    BYTE PTR [eax+0xc],0x1
10001e99:	75 09                	jne    0x10001ea4
10001e9b:	8b 41 08             	mov    eax,DWORD PTR [ecx+0x8]
10001e9e:	80 78 0c 01          	cmp    BYTE PTR [eax+0xc],0x1
10001ea2:	74 6b                	je     0x10001f0f
10001ea4:	8b 41 08             	mov    eax,DWORD PTR [ecx+0x8]
10001ea7:	80 78 0c 01          	cmp    BYTE PTR [eax+0xc],0x1
10001eab:	75 15                	jne    0x10001ec2
10001ead:	8b 01                	mov    eax,DWORD PTR [ecx]
10001eaf:	51                   	push   ecx
10001eb0:	c6 40 0c 01          	mov    BYTE PTR [eax+0xc],0x1
10001eb4:	c6 41 0c 00          	mov    BYTE PTR [ecx+0xc],0x0
10001eb8:	8b cb                	mov    ecx,ebx
10001eba:	e8 b1 1a 01 00       	call   0x10013970
10001ebf:	8b 4e 08             	mov    ecx,DWORD PTR [esi+0x8]
10001ec2:	8a 46 0c             	mov    al,BYTE PTR [esi+0xc]
10001ec5:	88 41 0c             	mov    BYTE PTR [ecx+0xc],al
10001ec8:	c6 46 0c 01          	mov    BYTE PTR [esi+0xc],0x1
10001ecc:	8b 41 08             	mov    eax,DWORD PTR [ecx+0x8]
10001ecf:	8b cb                	mov    ecx,ebx
10001ed1:	56                   	push   esi
10001ed2:	c6 40 0c 01          	mov    BYTE PTR [eax+0xc],0x1
10001ed6:	e8 35 1a 01 00       	call   0x10013910
10001edb:	eb 4a                	jmp    0x10001f27
10001edd:	80 79 0c 00          	cmp    BYTE PTR [ecx+0xc],0x0
10001ee1:	75 15                	jne    0x10001ef8
10001ee3:	c6 41 0c 01          	mov    BYTE PTR [ecx+0xc],0x1
10001ee7:	8b cb                	mov    ecx,ebx
10001ee9:	56                   	push   esi
10001eea:	c6 46 0c 00          	mov    BYTE PTR [esi+0xc],0x0
10001eee:	e8 7d 1a 01 00       	call   0x10013970
10001ef3:	8b 0e                	mov    ecx,DWORD PTR [esi]
10001ef5:	8b 55 f8             	mov    edx,DWORD PTR [ebp-0x8]
10001ef8:	80 79 0d 00          	cmp    BYTE PTR [ecx+0xd],0x0
10001efc:	75 15                	jne    0x10001f13
10001efe:	8b 41 08             	mov    eax,DWORD PTR [ecx+0x8]
10001f01:	80 78 0c 01          	cmp    BYTE PTR [eax+0xc],0x1
10001f05:	75 4c                	jne    0x10001f53
10001f07:	8b 01                	mov    eax,DWORD PTR [ecx]
10001f09:	80 78 0c 01          	cmp    BYTE PTR [eax+0xc],0x1
10001f0d:	75 44                	jne    0x10001f53
10001f0f:	c6 41 0c 00          	mov    BYTE PTR [ecx+0xc],0x0
10001f13:	8b 03                	mov    eax,DWORD PTR [ebx]
10001f15:	8b 76 04             	mov    esi,DWORD PTR [esi+0x4]
10001f18:	8b 7d f4             	mov    edi,DWORD PTR [ebp-0xc]
10001f1b:	3b 50 04             	cmp    edx,DWORD PTR [eax+0x4]
10001f1e:	0f 85 2c ff ff ff    	jne    0x10001e50
10001f24:	8b 7d f0             	mov    edi,DWORD PTR [ebp-0x10]
10001f27:	8b 4d fc             	mov    ecx,DWORD PTR [ebp-0x4]
10001f2a:	c6 47 0c 01          	mov    BYTE PTR [edi+0xc],0x1
10001f2e:	51                   	push   ecx
10001f2f:	e8 ef 2d 01 00       	call   0x10014d23
10001f34:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
10001f37:	83 c4 04             	add    esp,0x4
10001f3a:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
10001f3d:	85 c0                	test   eax,eax
10001f3f:	74 04                	je     0x10001f45
10001f41:	48                   	dec    eax
10001f42:	89 43 04             	mov    DWORD PTR [ebx+0x4],eax
10001f45:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10001f48:	5f                   	pop    edi
10001f49:	5e                   	pop    esi
10001f4a:	5b                   	pop    ebx
10001f4b:	89 08                	mov    DWORD PTR [eax],ecx
10001f4d:	8b e5                	mov    esp,ebp
10001f4f:	5d                   	pop    ebp
10001f50:	c2 08 00             	ret    0x8
