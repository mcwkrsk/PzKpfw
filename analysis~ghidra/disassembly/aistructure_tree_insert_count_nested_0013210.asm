; MAIWmodels.dll SHA-256: 80ccc6678bdf057152f473369a56eb3b76a1ce643edca2832345f7b53e09c525
; Function range: 0x10013210..0x10013280
; Static disassembly evidence; no runtime execution.

/mnt/data/work_stage117/original/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

10013210 <.text+0x12210>:
10013210:	55                   	push   ebp
10013211:	8b ec                	mov    ebp,esp
10013213:	53                   	push   ebx
10013214:	56                   	push   esi
10013215:	57                   	push   edi
10013216:	8b f9                	mov    edi,ecx
10013218:	81 7f 04 a9 aa aa 0a 	cmp    DWORD PTR [edi+0x4],0xaaaaaa9
1001321f:	72 0b                	jb     0x1001322c
10013221:	68 f8 72 01 10       	push   0x100172f8
10013226:	ff 15 34 70 01 10    	call   DWORD PTR ds:0x10017034
1001322c:	ff 75 14             	push   DWORD PTR [ebp+0x14]
1001322f:	e8 5c de fe ff       	call   0x10001090
10013234:	ff 47 04             	inc    DWORD PTR [edi+0x4]
10013237:	8b d8                	mov    ebx,eax
10013239:	8b 4d 10             	mov    ecx,DWORD PTR [ebp+0x10]
1001323c:	89 4b 04             	mov    DWORD PTR [ebx+0x4],ecx
1001323f:	8b 07                	mov    eax,DWORD PTR [edi]
10013241:	3b c8                	cmp    ecx,eax
10013243:	75 0b                	jne    0x10013250
10013245:	89 58 04             	mov    DWORD PTR [eax+0x4],ebx
10013248:	8b 07                	mov    eax,DWORD PTR [edi]
1001324a:	89 18                	mov    DWORD PTR [eax],ebx
1001324c:	8b 07                	mov    eax,DWORD PTR [edi]
1001324e:	eb 1c                	jmp    0x1001326c
10013250:	80 7d 0c 00          	cmp    BYTE PTR [ebp+0xc],0x0
10013254:	74 0c                	je     0x10013262
10013256:	89 19                	mov    DWORD PTR [ecx],ebx
10013258:	8b 07                	mov    eax,DWORD PTR [edi]
1001325a:	3b 08                	cmp    ecx,DWORD PTR [eax]
1001325c:	75 11                	jne    0x1001326f
1001325e:	89 18                	mov    DWORD PTR [eax],ebx
10013260:	eb 0d                	jmp    0x1001326f
10013262:	89 59 08             	mov    DWORD PTR [ecx+0x8],ebx
10013265:	8b 07                	mov    eax,DWORD PTR [edi]
10013267:	3b 48 08             	cmp    ecx,DWORD PTR [eax+0x8]
1001326a:	75 03                	jne    0x1001326f
1001326c:	89 58 08             	mov    DWORD PTR [eax+0x8],ebx
1001326f:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
10013272:	8b f3                	mov    esi,ebx
10013274:	80 78 0c 00          	cmp    BYTE PTR [eax+0xc],0x0
10013278:	0f 85 0c 01 00 00    	jne    0x1001338a
1001327e:	66 90                	xchg   ax,ax
