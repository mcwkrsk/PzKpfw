
/mnt/data/work_stage117/original/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

1000d970 <.text+0xc970>:
1000d970:	55                   	push   ebp
1000d971:	8b ec                	mov    ebp,esp
1000d973:	6a ff                	push   0xffffffff
1000d975:	68 d6 66 01 10       	push   0x100166d6
1000d97a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000d980:	50                   	push   eax
1000d981:	51                   	push   ecx
1000d982:	56                   	push   esi
1000d983:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000d988:	33 c5                	xor    eax,ebp
1000d98a:	50                   	push   eax
1000d98b:	8d 45 f4             	lea    eax,[ebp-0xc]
1000d98e:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000d994:	8b f1                	mov    esi,ecx
1000d996:	c7 06 60 73 01 10    	mov    DWORD PTR [esi],0x10017360
1000d99c:	8b 4e 20             	mov    ecx,DWORD PTR [esi+0x20]
1000d99f:	85 c9                	test   ecx,ecx
1000d9a1:	74 29                	je     0x1000d9cc
1000d9a3:	8b 46 28             	mov    eax,DWORD PTR [esi+0x28]
1000d9a6:	2b c1                	sub    eax,ecx
1000d9a8:	c1 f8 02             	sar    eax,0x2
1000d9ab:	6a 04                	push   0x4
1000d9ad:	50                   	push   eax
1000d9ae:	51                   	push   ecx
1000d9af:	e8 cc 42 ff ff       	call   0x10001c80
1000d9b4:	c7 46 20 00 00 00 00 	mov    DWORD PTR [esi+0x20],0x0
1000d9bb:	83 c4 0c             	add    esp,0xc
1000d9be:	c7 46 24 00 00 00 00 	mov    DWORD PTR [esi+0x24],0x0
1000d9c5:	c7 46 28 00 00 00 00 	mov    DWORD PTR [esi+0x28],0x0
1000d9cc:	8b 4e 14             	mov    ecx,DWORD PTR [esi+0x14]
1000d9cf:	85 c9                	test   ecx,ecx
1000d9d1:	74 29                	je     0x1000d9fc
1000d9d3:	8b 46 1c             	mov    eax,DWORD PTR [esi+0x1c]
1000d9d6:	2b c1                	sub    eax,ecx
1000d9d8:	c1 f8 02             	sar    eax,0x2
1000d9db:	6a 04                	push   0x4
1000d9dd:	50                   	push   eax
1000d9de:	51                   	push   ecx
1000d9df:	e8 9c 42 ff ff       	call   0x10001c80
1000d9e4:	c7 46 14 00 00 00 00 	mov    DWORD PTR [esi+0x14],0x0
1000d9eb:	83 c4 0c             	add    esp,0xc
1000d9ee:	c7 46 18 00 00 00 00 	mov    DWORD PTR [esi+0x18],0x0
1000d9f5:	c7 46 1c 00 00 00 00 	mov    DWORD PTR [esi+0x1c],0x0
1000d9fc:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
1000d9ff:	8d 4e 04             	lea    ecx,[esi+0x4]
1000da02:	50                   	push   eax
1000da03:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000da0a:	ff 30                	push   DWORD PTR [eax]
1000da0c:	8d 45 f0             	lea    eax,[ebp-0x10]
1000da0f:	50                   	push   eax
1000da10:	e8 1b 05 00 00       	call   0x1000df30
1000da15:	6a 1c                	push   0x1c
1000da17:	6a 01                	push   0x1
1000da19:	ff 76 04             	push   DWORD PTR [esi+0x4]
1000da1c:	e8 5f 42 ff ff       	call   0x10001c80
1000da21:	83 c4 0c             	add    esp,0xc
1000da24:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000da27:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000da2e:	59                   	pop    ecx
1000da2f:	5e                   	pop    esi
1000da30:	8b e5                	mov    esp,ebp
1000da32:	5d                   	pop    ebp
1000da33:	c3                   	ret
