; MAIWmodels.dll (PE32 / x86)
; Image base: 0x10000000
; SHA-256: 80ccc6678bdf057152f473369a56eb3b76a1ce643edca2832345f7b53e09c525
; Allocate outer tree node; copy a DWORD and deep-clone the nested tree handle.
; Range: 0x1000d470..0x1000d510


/mnt/data/work_stage117/original/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

1000d470 <.text+0xc470>:
1000d470:	55                   	push   ebp
1000d471:	8b ec                	mov    ebp,esp
1000d473:	6a ff                	push   0xffffffff
1000d475:	68 91 66 01 10       	push   0x10016691
1000d47a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000d480:	50                   	push   eax
1000d481:	83 ec 10             	sub    esp,0x10
1000d484:	53                   	push   ebx
1000d485:	56                   	push   esi
1000d486:	57                   	push   edi
1000d487:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000d48c:	33 c5                	xor    eax,ebp
1000d48e:	50                   	push   eax
1000d48f:	8d 45 f4             	lea    eax,[ebp-0xc]
1000d492:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000d498:	89 65 f0             	mov    DWORD PTR [ebp-0x10],esp
1000d49b:	e8 50 24 00 00       	call   0x1000f8f0
1000d4a0:	8b f0                	mov    esi,eax
1000d4a2:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000d4a9:	89 75 ec             	mov    DWORD PTR [ebp-0x14],esi
1000d4ac:	8d 56 10             	lea    edx,[esi+0x10]
1000d4af:	66 c7 46 0c 00 00    	mov    WORD PTR [esi+0xc],0x0
1000d4b5:	89 55 e8             	mov    DWORD PTR [ebp-0x18],edx
1000d4b8:	89 55 e4             	mov    DWORD PTR [ebp-0x1c],edx
1000d4bb:	c6 45 fc 01          	mov    BYTE PTR [ebp-0x4],0x1
1000d4bf:	85 d2                	test   edx,edx
1000d4c1:	74 1a                	je     0x1000d4dd
1000d4c3:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
1000d4c6:	8b 01                	mov    eax,DWORD PTR [ecx]
1000d4c8:	89 02                	mov    DWORD PTR [edx],eax
1000d4ca:	8d 41 04             	lea    eax,[ecx+0x4]
1000d4cd:	8d 4a 04             	lea    ecx,[edx+0x4]
1000d4d0:	8d 55 0b             	lea    edx,[ebp+0xb]
1000d4d3:	89 4d 08             	mov    DWORD PTR [ebp+0x8],ecx
1000d4d6:	52                   	push   edx
1000d4d7:	50                   	push   eax
1000d4d8:	e8 23 3b ff ff       	call   0x10001000
1000d4dd:	8b c6                	mov    eax,esi
1000d4df:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000d4e2:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000d4e9:	59                   	pop    ecx
1000d4ea:	5f                   	pop    edi
1000d4eb:	5e                   	pop    esi
1000d4ec:	5b                   	pop    ebx
1000d4ed:	8b e5                	mov    esp,ebp
1000d4ef:	5d                   	pop    ebp
1000d4f0:	c2 04 00             	ret    0x4
1000d4f3:	6a 1c                	push   0x1c
1000d4f5:	6a 01                	push   0x1
1000d4f7:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
1000d4fa:	e8 81 47 ff ff       	call   0x10001c80
1000d4ff:	83 c4 0c             	add    esp,0xc
1000d502:	6a 00                	push   0x0
1000d504:	6a 00                	push   0x0
1000d506:	e8 9d 85 00 00       	call   0x10015aa8
1000d50b:	cc                   	int3
1000d50c:	cc                   	int3
1000d50d:	cc                   	int3
1000d50e:	cc                   	int3
1000d50f:	cc                   	int3
