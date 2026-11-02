
/mnt/data/work_stage117/original/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

1000dd30 <.text+0xcd30>:
1000dd30:	55                   	push   ebp
1000dd31:	8b ec                	mov    ebp,esp
1000dd33:	83 ec 30             	sub    esp,0x30
1000dd36:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000dd3b:	33 c5                	xor    eax,ebp
1000dd3d:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
1000dd40:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000dd43:	56                   	push   esi
1000dd44:	8b f1                	mov    esi,ecx
1000dd46:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
1000dd49:	8d 45 d0             	lea    eax,[ebp-0x30]
1000dd4c:	50                   	push   eax
1000dd4d:	8b 4e 04             	mov    ecx,DWORD PTR [esi+0x4]
1000dd50:	83 c1 20             	add    ecx,0x20
1000dd53:	e8 08 4d ff ff       	call   0x10002a60
1000dd58:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
1000dd5b:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
1000dd5e:	c7 45 d4 68 73 01 10 	mov    DWORD PTR [ebp-0x2c],0x10017368
1000dd65:	89 75 d8             	mov    DWORD PTR [ebp-0x28],esi
1000dd68:	8d 48 08             	lea    ecx,[eax+0x8]
1000dd6b:	8d 45 d4             	lea    eax,[ebp-0x2c]
1000dd6e:	51                   	push   ecx
1000dd6f:	8b c8                	mov    ecx,eax
1000dd71:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
1000dd74:	e8 f7 47 ff ff       	call   0x10002570
1000dd79:	8b 4d f8             	mov    ecx,DWORD PTR [ebp-0x8]
1000dd7c:	5e                   	pop    esi
1000dd7d:	85 c9                	test   ecx,ecx
1000dd7f:	74 11                	je     0x1000dd92
1000dd81:	8b 11                	mov    edx,DWORD PTR [ecx]
1000dd83:	8d 45 d4             	lea    eax,[ebp-0x2c]
1000dd86:	3b c8                	cmp    ecx,eax
1000dd88:	0f 95 c0             	setne  al
1000dd8b:	0f b6 c0             	movzx  eax,al
1000dd8e:	50                   	push   eax
1000dd8f:	ff 52 10             	call   DWORD PTR [edx+0x10]
1000dd92:	8b 4d fc             	mov    ecx,DWORD PTR [ebp-0x4]
1000dd95:	33 cd                	xor    ecx,ebp
1000dd97:	e8 b1 6f 00 00       	call   0x10014d4d
1000dd9c:	8b e5                	mov    esp,ebp
1000dd9e:	5d                   	pop    ebp
1000dd9f:	c2 04 00             	ret    0x4
