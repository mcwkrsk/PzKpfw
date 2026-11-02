; MAIWmodels.dll (PE32 / x86)
; Image base: 0x10000000
; SHA-256: 80ccc6678bdf057152f473369a56eb3b76a1ce643edca2832345f7b53e09c525
; Clear outer RB-tree and restore sentinel/header state.
; Range: 0x1000df30..0x1000e020


/mnt/data/work_stage117/original/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

1000df30 <.text+0xcf30>:
1000df30:	55                   	push   ebp
1000df31:	8b ec                	mov    ebp,esp
1000df33:	6a ff                	push   0xffffffff
1000df35:	68 36 67 01 10       	push   0x10016736
1000df3a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000df40:	50                   	push   eax
1000df41:	51                   	push   ecx
1000df42:	57                   	push   edi
1000df43:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000df48:	33 c5                	xor    eax,ebp
1000df4a:	50                   	push   eax
1000df4b:	8d 45 f4             	lea    eax,[ebp-0xc]
1000df4e:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000df54:	8b f9                	mov    edi,ecx
1000df56:	8b 17                	mov    edx,DWORD PTR [edi]
1000df58:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
1000df5b:	3b 02                	cmp    eax,DWORD PTR [edx]
1000df5d:	75 44                	jne    0x1000dfa3
1000df5f:	39 55 10             	cmp    DWORD PTR [ebp+0x10],edx
1000df62:	75 3f                	jne    0x1000dfa3
1000df64:	ff 72 04             	push   DWORD PTR [edx+0x4]
1000df67:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000df6e:	e8 3d fd ff ff       	call   0x1000dcb0
1000df73:	8b 07                	mov    eax,DWORD PTR [edi]
1000df75:	89 40 04             	mov    DWORD PTR [eax+0x4],eax
1000df78:	8b 07                	mov    eax,DWORD PTR [edi]
1000df7a:	89 00                	mov    DWORD PTR [eax],eax
1000df7c:	8b 07                	mov    eax,DWORD PTR [edi]
1000df7e:	89 40 08             	mov    DWORD PTR [eax+0x8],eax
1000df81:	c7 47 04 00 00 00 00 	mov    DWORD PTR [edi+0x4],0x0
1000df88:	8b 07                	mov    eax,DWORD PTR [edi]
1000df8a:	8b 08                	mov    ecx,DWORD PTR [eax]
1000df8c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000df8f:	89 08                	mov    DWORD PTR [eax],ecx
1000df91:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000df94:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000df9b:	59                   	pop    ecx
1000df9c:	5f                   	pop    edi
1000df9d:	8b e5                	mov    esp,ebp
1000df9f:	5d                   	pop    ebp
1000dfa0:	c2 0c 00             	ret    0xc
1000dfa3:	3b 45 10             	cmp    eax,DWORD PTR [ebp+0x10]
1000dfa6:	74 58                	je     0x1000e000
1000dfa8:	80 78 0d 00          	cmp    BYTE PTR [eax+0xd],0x0
1000dfac:	8b c8                	mov    ecx,eax
1000dfae:	75 3c                	jne    0x1000dfec
1000dfb0:	8b 50 08             	mov    edx,DWORD PTR [eax+0x8]
1000dfb3:	80 7a 0d 00          	cmp    BYTE PTR [edx+0xd],0x0
1000dfb7:	75 14                	jne    0x1000dfcd
1000dfb9:	8b 02                	mov    eax,DWORD PTR [edx]
1000dfbb:	80 78 0d 00          	cmp    BYTE PTR [eax+0xd],0x0
1000dfbf:	75 28                	jne    0x1000dfe9
1000dfc1:	8b d0                	mov    edx,eax
1000dfc3:	8b 02                	mov    eax,DWORD PTR [edx]
1000dfc5:	80 78 0d 00          	cmp    BYTE PTR [eax+0xd],0x0
1000dfc9:	74 f6                	je     0x1000dfc1
1000dfcb:	eb 1c                	jmp    0x1000dfe9
1000dfcd:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
1000dfd0:	80 7a 0d 00          	cmp    BYTE PTR [edx+0xd],0x0
1000dfd4:	75 13                	jne    0x1000dfe9
1000dfd6:	3b 42 08             	cmp    eax,DWORD PTR [edx+0x8]
1000dfd9:	75 0e                	jne    0x1000dfe9
1000dfdb:	8b c2                	mov    eax,edx
1000dfdd:	89 45 0c             	mov    DWORD PTR [ebp+0xc],eax
1000dfe0:	8b 52 04             	mov    edx,DWORD PTR [edx+0x4]
1000dfe3:	80 7a 0d 00          	cmp    BYTE PTR [edx+0xd],0x0
1000dfe7:	74 ed                	je     0x1000dfd6
1000dfe9:	89 55 0c             	mov    DWORD PTR [ebp+0xc],edx
1000dfec:	51                   	push   ecx
1000dfed:	8d 45 f0             	lea    eax,[ebp-0x10]
1000dff0:	8b cf                	mov    ecx,edi
1000dff2:	50                   	push   eax
1000dff3:	e8 28 00 00 00       	call   0x1000e020
1000dff8:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
1000dffb:	3b 45 10             	cmp    eax,DWORD PTR [ebp+0x10]
1000dffe:	75 a8                	jne    0x1000dfa8
1000e000:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
1000e003:	89 01                	mov    DWORD PTR [ecx],eax
1000e005:	8b c1                	mov    eax,ecx
1000e007:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000e00a:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000e011:	59                   	pop    ecx
1000e012:	5f                   	pop    edi
1000e013:	8b e5                	mov    esp,ebp
1000e015:	5d                   	pop    ebp
1000e016:	c2 0c 00             	ret    0xc
1000e019:	cc                   	int3
1000e01a:	cc                   	int3
1000e01b:	cc                   	int3
1000e01c:	cc                   	int3
1000e01d:	cc                   	int3
1000e01e:	cc                   	int3
1000e01f:	cc                   	int3
