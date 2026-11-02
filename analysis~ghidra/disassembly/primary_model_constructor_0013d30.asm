
/mnt/data/work_stage117/original/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

10013d30 <.text+0x12d30>:
10013d30:	55                   	push   ebp
10013d31:	8b ec                	mov    ebp,esp
10013d33:	6a ff                	push   0xffffffff
10013d35:	68 c4 6e 01 10       	push   0x10016ec4
10013d3a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10013d40:	50                   	push   eax
10013d41:	83 ec 08             	sub    esp,0x8
10013d44:	56                   	push   esi
10013d45:	a1 04 10 02 10       	mov    eax,ds:0x10021004
10013d4a:	33 c5                	xor    eax,ebp
10013d4c:	50                   	push   eax
10013d4d:	8d 45 f4             	lea    eax,[ebp-0xc]
10013d50:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10013d56:	8b f1                	mov    esi,ecx
10013d58:	89 75 ec             	mov    DWORD PTR [ebp-0x14],esi
10013d5b:	6a 28                	push   0x28
10013d5d:	e8 8e 0f 00 00       	call   0x10014cf0
10013d62:	83 c4 04             	add    esp,0x4
10013d65:	85 c0                	test   eax,eax
10013d67:	74 56                	je     0x10013dbf
10013d69:	0f 57 c0             	xorps  xmm0,xmm0
10013d6c:	0f 11 00             	movups XMMWORD PTR [eax],xmm0
10013d6f:	0f 11 40 10          	movups XMMWORD PTR [eax+0x10],xmm0
10013d73:	66 0f d6 40 20       	movq   QWORD PTR [eax+0x20],xmm0
10013d78:	c7 40 04 00 00 00 00 	mov    DWORD PTR [eax+0x4],0x0
10013d7f:	c7 40 08 00 00 00 00 	mov    DWORD PTR [eax+0x8],0x0
10013d86:	c7 40 0c 00 00 00 00 	mov    DWORD PTR [eax+0xc],0x0
10013d8d:	c7 40 10 00 00 00 00 	mov    DWORD PTR [eax+0x10],0x0
10013d94:	c7 40 14 00 00 00 00 	mov    DWORD PTR [eax+0x14],0x0
10013d9b:	c7 40 18 00 00 00 00 	mov    DWORD PTR [eax+0x18],0x0
10013da2:	c7 40 1c 00 00 00 00 	mov    DWORD PTR [eax+0x1c],0x0
10013da9:	c7 40 20 00 00 00 00 	mov    DWORD PTR [eax+0x20],0x0
10013db0:	c7 40 24 00 00 00 00 	mov    DWORD PTR [eax+0x24],0x0
10013db7:	c7 00 bc 75 01 10    	mov    DWORD PTR [eax],0x100175bc
10013dbd:	eb 02                	jmp    0x10013dc1
10013dbf:	33 c0                	xor    eax,eax
10013dc1:	50                   	push   eax
10013dc2:	8b ce                	mov    ecx,esi
10013dc4:	e8 47 d6 fe ff       	call   0x10001410
10013dc9:	6a 0c                	push   0xc
10013dcb:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10013dd2:	c7 06 b4 75 01 10    	mov    DWORD PTR [esi],0x100175b4
10013dd8:	e8 13 0f 00 00       	call   0x10014cf0
10013ddd:	83 c4 04             	add    esp,0x4
10013de0:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
10013de3:	c6 45 fc 01          	mov    BYTE PTR [ebp-0x4],0x1
10013de7:	85 c0                	test   eax,eax
10013de9:	74 09                	je     0x10013df4
10013deb:	8b c8                	mov    ecx,eax
10013ded:	e8 1e f7 ff ff       	call   0x10013510
10013df2:	eb 02                	jmp    0x10013df6
10013df4:	33 c0                	xor    eax,eax
10013df6:	8b 4e 04             	mov    ecx,DWORD PTR [esi+0x4]
10013df9:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
10013dfc:	83 c1 04             	add    ecx,0x4
10013dff:	8d 45 f0             	lea    eax,[ebp-0x10]
10013e02:	c6 45 fc 00          	mov    BYTE PTR [ebp-0x4],0x0
10013e06:	50                   	push   eax
10013e07:	e8 54 ec fe ff       	call   0x10002a60
10013e0c:	6a 0c                	push   0xc
10013e0e:	e8 dd 0e 00 00       	call   0x10014cf0
10013e13:	83 c4 04             	add    esp,0x4
10013e16:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
10013e19:	c6 45 fc 02          	mov    BYTE PTR [ebp-0x4],0x2
10013e1d:	85 c0                	test   eax,eax
10013e1f:	74 09                	je     0x10013e2a
10013e21:	8b c8                	mov    ecx,eax
10013e23:	e8 78 e8 ff ff       	call   0x100126a0
10013e28:	eb 02                	jmp    0x10013e2c
10013e2a:	33 c0                	xor    eax,eax
10013e2c:	8b 4e 04             	mov    ecx,DWORD PTR [esi+0x4]
10013e2f:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
10013e32:	83 c1 04             	add    ecx,0x4
10013e35:	8d 45 f0             	lea    eax,[ebp-0x10]
10013e38:	c6 45 fc 00          	mov    BYTE PTR [ebp-0x4],0x0
10013e3c:	50                   	push   eax
10013e3d:	e8 1e ec fe ff       	call   0x10002a60
10013e42:	6a 10                	push   0x10
10013e44:	e8 a7 0e 00 00       	call   0x10014cf0
10013e49:	83 c4 04             	add    esp,0x4
10013e4c:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
10013e4f:	c6 45 fc 03          	mov    BYTE PTR [ebp-0x4],0x3
10013e53:	85 c0                	test   eax,eax
10013e55:	74 09                	je     0x10013e60
10013e57:	8b c8                	mov    ecx,eax
10013e59:	e8 72 0a 00 00       	call   0x100148d0
10013e5e:	eb 02                	jmp    0x10013e62
10013e60:	33 c0                	xor    eax,eax
10013e62:	8b 4e 04             	mov    ecx,DWORD PTR [esi+0x4]
10013e65:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
10013e68:	83 c1 10             	add    ecx,0x10
10013e6b:	8d 45 f0             	lea    eax,[ebp-0x10]
10013e6e:	c6 45 fc 00          	mov    BYTE PTR [ebp-0x4],0x0
10013e72:	50                   	push   eax
10013e73:	e8 e8 eb fe ff       	call   0x10002a60
10013e78:	6a 08                	push   0x8
10013e7a:	e8 71 0e 00 00       	call   0x10014cf0
10013e7f:	83 c4 04             	add    esp,0x4
10013e82:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
10013e85:	c6 45 fc 04          	mov    BYTE PTR [ebp-0x4],0x4
10013e89:	85 c0                	test   eax,eax
10013e8b:	74 09                	je     0x10013e96
10013e8d:	8b c8                	mov    ecx,eax
10013e8f:	e8 bc e1 fe ff       	call   0x10002050
10013e94:	eb 02                	jmp    0x10013e98
10013e96:	33 c0                	xor    eax,eax
10013e98:	8b 4e 04             	mov    ecx,DWORD PTR [esi+0x4]
10013e9b:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
10013e9e:	83 c1 1c             	add    ecx,0x1c
10013ea1:	8d 45 f0             	lea    eax,[ebp-0x10]
10013ea4:	c6 45 fc 00          	mov    BYTE PTR [ebp-0x4],0x0
10013ea8:	50                   	push   eax
10013ea9:	e8 b2 eb fe ff       	call   0x10002a60
10013eae:	8b c6                	mov    eax,esi
10013eb0:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10013eb3:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10013eba:	59                   	pop    ecx
10013ebb:	5e                   	pop    esi
10013ebc:	8b e5                	mov    esp,ebp
10013ebe:	5d                   	pop    ebp
