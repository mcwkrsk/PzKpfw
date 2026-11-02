
/mnt/data/work_stage117/original/PM_params.dll:     file format pei-i386


Disassembly of section .text:

100059d0 <.text+0x49d0>:
100059d0:	55                   	push   ebp
100059d1:	8b ec                	mov    ebp,esp
100059d3:	6a ff                	push   0xffffffff
100059d5:	68 52 98 00 10       	push   0x10009852
100059da:	64 a1 00 00 00 00    	mov    eax,fs:0x0
100059e0:	50                   	push   eax
100059e1:	83 ec 5c             	sub    esp,0x5c
100059e4:	53                   	push   ebx
100059e5:	56                   	push   esi
100059e6:	57                   	push   edi
100059e7:	a1 50 30 02 10       	mov    eax,ds:0x10023050
100059ec:	33 c5                	xor    eax,ebp
100059ee:	50                   	push   eax
100059ef:	8d 45 f4             	lea    eax,[ebp-0xc]
100059f2:	64 a3 00 00 00 00    	mov    fs:0x0,eax
100059f8:	8b 49 48             	mov    ecx,DWORD PTR [ecx+0x48]
100059fb:	8d 45 d8             	lea    eax,[ebp-0x28]
100059fe:	50                   	push   eax
100059ff:	ff 15 cc a8 00 10    	call   DWORD PTR ds:0x1000a8cc
10005a05:	8d 4d d8             	lea    ecx,[ebp-0x28]
10005a08:	ff 15 fc a1 00 10    	call   DWORD PTR ds:0x1000a1fc
10005a0e:	85 c0                	test   eax,eax
10005a10:	0f 88 13 01 00 00    	js     0x10005b29
10005a16:	8d 4d d8             	lea    ecx,[ebp-0x28]
10005a19:	ff 15 f8 a1 00 10    	call   DWORD PTR ds:0x1000a1f8
10005a1f:	85 c0                	test   eax,eax
10005a21:	0f 88 02 01 00 00    	js     0x10005b29
10005a27:	68 01 01 00 00       	push   0x101
10005a2c:	8d 4d b8             	lea    ecx,[ebp-0x48]
10005a2f:	ff 15 00 a2 00 10    	call   DWORD PTR ds:0x1000a200
10005a35:	50                   	push   eax
10005a36:	6a 00                	push   0x0
10005a38:	8d 4d d8             	lea    ecx,[ebp-0x28]
10005a3b:	ff 15 fc a1 00 10    	call   DWORD PTR ds:0x1000a1fc
10005a41:	50                   	push   eax
10005a42:	8d 45 a8             	lea    eax,[ebp-0x58]
10005a45:	b9 fc 34 02 10       	mov    ecx,0x100234fc
10005a4a:	50                   	push   eax
10005a4b:	ff 15 6c a2 00 10    	call   DWORD PTR ds:0x1000a26c
10005a51:	50                   	push   eax
10005a52:	8d 45 c8             	lea    eax,[ebp-0x38]
10005a55:	b9 fc 34 02 10       	mov    ecx,0x100234fc
10005a5a:	50                   	push   eax
10005a5b:	ff 15 80 a2 00 10    	call   DWORD PTR ds:0x1000a280
10005a61:	6a 00                	push   0x0
10005a63:	8b c8                	mov    ecx,eax
10005a65:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10005a6c:	ff 15 24 a1 00 10    	call   DWORD PTR ds:0x1000a124
10005a72:	8b d8                	mov    ebx,eax
10005a74:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
10005a7b:	8d 4d c8             	lea    ecx,[ebp-0x38]
10005a7e:	89 5d f0             	mov    DWORD PTR [ebp-0x10],ebx
10005a81:	ff 15 1c a2 00 10    	call   DWORD PTR ds:0x1000a21c
10005a87:	8b 13                	mov    edx,DWORD PTR [ebx]
10005a89:	8d 45 e8             	lea    eax,[ebp-0x18]
10005a8c:	50                   	push   eax
10005a8d:	8b cb                	mov    ecx,ebx
10005a8f:	ff 52 0c             	call   DWORD PTR [edx+0xc]
10005a92:	33 f6                	xor    esi,esi
10005a94:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [ebp-0x4],0x1
10005a9b:	39 75 e8             	cmp    DWORD PTR [ebp-0x18],esi
10005a9e:	7e 4c                	jle    0x10005aec
10005aa0:	8b 3d 94 a0 00 10    	mov    edi,DWORD PTR ds:0x1000a094
10005aa6:	8b 1d 98 a0 00 10    	mov    ebx,DWORD PTR ds:0x1000a098
10005aac:	0f 1f 40 00          	nop    DWORD PTR [eax+0x0]
10005ab0:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
10005ab3:	8b 0c b0             	mov    ecx,DWORD PTR [eax+esi*4]
10005ab6:	ff d7                	call   edi
10005ab8:	83 f8 04             	cmp    eax,0x4
10005abb:	75 26                	jne    0x10005ae3
10005abd:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
10005ac0:	6a 01                	push   0x1
10005ac2:	8b 0c b1             	mov    ecx,DWORD PTR [ecx+esi*4]
10005ac5:	ff d3                	call   ebx
10005ac7:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
10005aca:	8b 0c b1             	mov    ecx,DWORD PTR [ecx+esi*4]
10005acd:	ff 15 90 a0 00 10    	call   DWORD PTR ds:0x1000a090
10005ad3:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
10005ad6:	8b 0c b0             	mov    ecx,DWORD PTR [eax+esi*4]
10005ad9:	85 c9                	test   ecx,ecx
10005adb:	74 06                	je     0x10005ae3
10005add:	8b 01                	mov    eax,DWORD PTR [ecx]
10005adf:	6a 01                	push   0x1
10005ae1:	ff 10                	call   DWORD PTR [eax]
10005ae3:	46                   	inc    esi
10005ae4:	3b 75 e8             	cmp    esi,DWORD PTR [ebp-0x18]
10005ae7:	7c c7                	jl     0x10005ab0
10005ae9:	8b 5d f0             	mov    ebx,DWORD PTR [ebp-0x10]
10005aec:	8b 0d f0 34 02 10    	mov    ecx,DWORD PTR ds:0x100234f0
10005af2:	53                   	push   ebx
10005af3:	ff 15 d4 a0 00 10    	call   DWORD PTR ds:0x1000a0d4
10005af9:	8b c8                	mov    ecx,eax
10005afb:	ff 15 70 a0 00 10    	call   DWORD PTR ds:0x1000a070
10005b01:	8d 4d 98             	lea    ecx,[ebp-0x68]
10005b04:	ff 15 00 a2 00 10    	call   DWORD PTR ds:0x1000a200
10005b0a:	50                   	push   eax
10005b0b:	8d 4d d8             	lea    ecx,[ebp-0x28]
10005b0e:	ff 15 fc a1 00 10    	call   DWORD PTR ds:0x1000a1fc
10005b14:	50                   	push   eax
10005b15:	b9 fc 34 02 10       	mov    ecx,0x100234fc
10005b1a:	ff 15 f4 a1 00 10    	call   DWORD PTR ds:0x1000a1f4
10005b20:	8d 4d e8             	lea    ecx,[ebp-0x18]
10005b23:	ff 15 9c a0 00 10    	call   DWORD PTR ds:0x1000a09c
10005b29:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10005b2c:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10005b33:	59                   	pop    ecx
10005b34:	5f                   	pop    edi
10005b35:	5e                   	pop    esi
10005b36:	5b                   	pop    ebx
10005b37:	8b e5                	mov    esp,ebp
10005b39:	5d                   	pop    ebp
10005b3a:	c3                   	ret
