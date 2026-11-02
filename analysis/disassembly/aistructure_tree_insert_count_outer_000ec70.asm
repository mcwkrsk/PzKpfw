; MAIWmodels.dll SHA-256: 80ccc6678bdf057152f473369a56eb3b76a1ce643edca2832345f7b53e09c525
; Function range: 0x1000ec70..0x1000ed10
; Static disassembly evidence; no runtime execution.

/mnt/data/work_stage117/original/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

1000ec70 <.text+0xdc70>:
1000ec70:	55                   	push   ebp
1000ec71:	8b ec                	mov    ebp,esp
1000ec73:	53                   	push   ebx
1000ec74:	56                   	push   esi
1000ec75:	57                   	push   edi
1000ec76:	8b f9                	mov    edi,ecx
1000ec78:	81 7f 04 48 92 24 09 	cmp    DWORD PTR [edi+0x4],0x9249248
1000ec7f:	72 0b                	jb     0x1000ec8c
1000ec81:	68 f8 72 01 10       	push   0x100172f8
1000ec86:	ff 15 34 70 01 10    	call   DWORD PTR ds:0x10017034
1000ec8c:	ff 75 14             	push   DWORD PTR [ebp+0x14]
1000ec8f:	e8 6c fd ff ff       	call   0x1000ea00
1000ec94:	ff 47 04             	inc    DWORD PTR [edi+0x4]
1000ec97:	8b d8                	mov    ebx,eax
1000ec99:	8b 4d 10             	mov    ecx,DWORD PTR [ebp+0x10]
1000ec9c:	89 4b 04             	mov    DWORD PTR [ebx+0x4],ecx
1000ec9f:	8b 07                	mov    eax,DWORD PTR [edi]
1000eca1:	3b c8                	cmp    ecx,eax
1000eca3:	75 0b                	jne    0x1000ecb0
1000eca5:	89 58 04             	mov    DWORD PTR [eax+0x4],ebx
1000eca8:	8b 07                	mov    eax,DWORD PTR [edi]
1000ecaa:	89 18                	mov    DWORD PTR [eax],ebx
1000ecac:	8b 07                	mov    eax,DWORD PTR [edi]
1000ecae:	eb 1c                	jmp    0x1000eccc
1000ecb0:	80 7d 0c 00          	cmp    BYTE PTR [ebp+0xc],0x0
1000ecb4:	74 0c                	je     0x1000ecc2
1000ecb6:	89 19                	mov    DWORD PTR [ecx],ebx
1000ecb8:	8b 07                	mov    eax,DWORD PTR [edi]
1000ecba:	3b 08                	cmp    ecx,DWORD PTR [eax]
1000ecbc:	75 11                	jne    0x1000eccf
1000ecbe:	89 18                	mov    DWORD PTR [eax],ebx
1000ecc0:	eb 0d                	jmp    0x1000eccf
1000ecc2:	89 59 08             	mov    DWORD PTR [ecx+0x8],ebx
1000ecc5:	8b 07                	mov    eax,DWORD PTR [edi]
1000ecc7:	3b 48 08             	cmp    ecx,DWORD PTR [eax+0x8]
1000ecca:	75 03                	jne    0x1000eccf
1000eccc:	89 58 08             	mov    DWORD PTR [eax+0x8],ebx
1000eccf:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
1000ecd2:	8b f3                	mov    esi,ebx
1000ecd4:	80 78 0c 00          	cmp    BYTE PTR [eax+0xc],0x0
1000ecd8:	0f 85 0c 01 00 00    	jne    0x1000edea
1000ecde:	66 90                	xchg   ax,ax
1000ece0:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
1000ece3:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
1000ece6:	8b 0a                	mov    ecx,DWORD PTR [edx]
1000ece8:	3b c1                	cmp    eax,ecx
1000ecea:	75 74                	jne    0x1000ed60
1000ecec:	8b 4a 08             	mov    ecx,DWORD PTR [edx+0x8]
1000ecef:	80 79 0c 00          	cmp    BYTE PTR [ecx+0xc],0x0
1000ecf3:	74 71                	je     0x1000ed66
1000ecf5:	3b 70 08             	cmp    esi,DWORD PTR [eax+0x8]
1000ecf8:	75 0a                	jne    0x1000ed04
1000ecfa:	8b f0                	mov    esi,eax
1000ecfc:	8b cf                	mov    ecx,edi
1000ecfe:	56                   	push   esi
1000ecff:	e8 0c 4c 00 00       	call   0x10013910
1000ed04:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
1000ed07:	c6 40 0c 01          	mov    BYTE PTR [eax+0xc],0x1
1000ed0b:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
1000ed0e:	8b                   	.byte 0x8b
1000ed0f:	40                   	inc    eax
