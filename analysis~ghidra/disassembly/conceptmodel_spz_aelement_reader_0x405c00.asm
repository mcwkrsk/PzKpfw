
/mnt/data/IS2_RE_Stage2_MVP_2026-11-01/original/IS.exe:     file format pei-i386


Disassembly of section .text:

00405c00 <.text+0x4c00>:
  405c00:	55                   	push   ebp
  405c01:	8b ec                	mov    ebp,esp
  405c03:	6a ff                	push   0xffffffff
  405c05:	68 be 5f 41 00       	push   0x415fbe
  405c0a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  405c10:	50                   	push   eax
  405c11:	83 ec 34             	sub    esp,0x34
  405c14:	a1 cc 90 46 00       	mov    eax,ds:0x4690cc
  405c19:	33 c5                	xor    eax,ebp
  405c1b:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
  405c1e:	56                   	push   esi
  405c1f:	57                   	push   edi
  405c20:	50                   	push   eax
  405c21:	8d 45 f4             	lea    eax,[ebp-0xc]
  405c24:	64 a3 00 00 00 00    	mov    fs:0x0,eax
  405c2a:	8b 7d 08             	mov    edi,DWORD PTR [ebp+0x8]
  405c2d:	8b 75 0c             	mov    esi,DWORD PTR [ebp+0xc]
  405c30:	6a 04                	push   0x4
  405c32:	68 0c 7a 45 00       	push   0x457a0c
  405c37:	ff 15 a8 93 41 00    	call   DWORD PTR ds:0x4193a8
  405c3d:	83 c4 08             	add    esp,0x8
  405c40:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
  405c43:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  405c46:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
  405c4d:	ff 15 d8 93 41 00    	call   DWORD PTR ds:0x4193d8
  405c53:	50                   	push   eax
  405c54:	8d 45 d4             	lea    eax,[ebp-0x2c]
  405c57:	c6 45 fc 01          	mov    BYTE PTR [ebp-0x4],0x1
  405c5b:	50                   	push   eax
  405c5c:	8d 45 c8             	lea    eax,[ebp-0x38]
  405c5f:	8b cf                	mov    ecx,edi
  405c61:	50                   	push   eax
  405c62:	ff 15 7c 9b 41 00    	call   DWORD PTR ds:0x419b7c
  405c68:	8d 4d d8             	lea    ecx,[ebp-0x28]
  405c6b:	c6 45 fc 02          	mov    BYTE PTR [ebp-0x4],0x2
  405c6f:	51                   	push   ecx
  405c70:	8b c8                	mov    ecx,eax
  405c72:	ff 15 b4 92 41 00    	call   DWORD PTR ds:0x4192b4
  405c78:	83 78 14 08          	cmp    DWORD PTR [eax+0x14],0x8
  405c7c:	c6 45 fc 03          	mov    BYTE PTR [ebp-0x4],0x3
  405c80:	72 02                	jb     0x405c84
  405c82:	8b 00                	mov    eax,DWORD PTR [eax]
  405c84:	51                   	push   ecx
  405c85:	8b cc                	mov    ecx,esp
  405c87:	50                   	push   eax
  405c88:	ff 15 80 90 41 00    	call   DWORD PTR ds:0x419080
  405c8e:	8b ce                	mov    ecx,esi
  405c90:	ff 15 8c 90 41 00    	call   DWORD PTR ds:0x41908c
  405c96:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
  405c99:	83 f8 08             	cmp    eax,0x8
  405c9c:	72 0f                	jb     0x405cad
  405c9e:	40                   	inc    eax
  405c9f:	6a 02                	push   0x2
  405ca1:	50                   	push   eax
  405ca2:	ff 75 d8             	push   DWORD PTR [ebp-0x28]
  405ca5:	e8 46 eb ff ff       	call   0x4047f0
  405caa:	83 c4 0c             	add    esp,0xc
  405cad:	33 c0                	xor    eax,eax
  405caf:	c7 45 ec 07 00 00 00 	mov    DWORD PTR [ebp-0x14],0x7
  405cb6:	8d 4d c8             	lea    ecx,[ebp-0x38]
  405cb9:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
  405cc0:	66 89 45 d8          	mov    WORD PTR [ebp-0x28],ax
  405cc4:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  405cca:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  405ccd:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  405cd3:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  405cd6:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
  405cdd:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  405ce3:	6a 02                	push   0x2
  405ce5:	68 c8 7a 45 00       	push   0x457ac8
  405cea:	ff 15 a8 93 41 00    	call   DWORD PTR ds:0x4193a8
  405cf0:	83 c4 08             	add    esp,0x8
  405cf3:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
  405cf6:	8d 4d cc             	lea    ecx,[ebp-0x34]
  405cf9:	c7 45 fc 04 00 00 00 	mov    DWORD PTR [ebp-0x4],0x4
  405d00:	ff 15 d8 93 41 00    	call   DWORD PTR ds:0x4193d8
  405d06:	50                   	push   eax
  405d07:	8d 45 d0             	lea    eax,[ebp-0x30]
  405d0a:	c6 45 fc 05          	mov    BYTE PTR [ebp-0x4],0x5
  405d0e:	50                   	push   eax
  405d0f:	8d 45 c0             	lea    eax,[ebp-0x40]
  405d12:	8b cf                	mov    ecx,edi
  405d14:	50                   	push   eax
  405d15:	ff 15 7c 9b 41 00    	call   DWORD PTR ds:0x419b7c
  405d1b:	8b 76 04             	mov    esi,DWORD PTR [esi+0x4]
  405d1e:	8b c8                	mov    ecx,eax
  405d20:	6a 0a                	push   0xa
  405d22:	6a 00                	push   0x0
  405d24:	c6 45 fc 06          	mov    BYTE PTR [ebp-0x4],0x6
  405d28:	ff 15 cc 92 41 00    	call   DWORD PTR ds:0x4192cc
  405d2e:	8d 4d c0             	lea    ecx,[ebp-0x40]
  405d31:	89 46 04             	mov    DWORD PTR [esi+0x4],eax
  405d34:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  405d3a:	8d 4d cc             	lea    ecx,[ebp-0x34]
  405d3d:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  405d43:	8d 4d d0             	lea    ecx,[ebp-0x30]
  405d46:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  405d4c:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
  405d4f:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  405d56:	59                   	pop    ecx
  405d57:	5f                   	pop    edi
  405d58:	5e                   	pop    esi
  405d59:	8b 4d f0             	mov    ecx,DWORD PTR [ebp-0x10]
  405d5c:	33 cd                	xor    ecx,ebp
  405d5e:	e8 15 ea 00 00       	call   0x414778
  405d63:	8b e5                	mov    esp,ebp
  405d65:	5d                   	pop    ebp
  405d66:	c3                   	ret
  405d67:	cc                   	int3
  405d68:	cc                   	int3
  405d69:	cc                   	int3
  405d6a:	cc                   	int3
  405d6b:	cc                   	int3
  405d6c:	cc                   	int3
  405d6d:	cc                   	int3
  405d6e:	cc                   	int3
  405d6f:	cc                   	int3
