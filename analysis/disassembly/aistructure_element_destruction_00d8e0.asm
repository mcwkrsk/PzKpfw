
/mnt/data/work_stage117/original/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

1000d8e0 <.text+0xc8e0>:
1000d8e0:	56                   	push   esi
1000d8e1:	8b f1                	mov    esi,ecx
1000d8e3:	57                   	push   edi
1000d8e4:	33 ff                	xor    edi,edi
1000d8e6:	8b 56 04             	mov    edx,DWORD PTR [esi+0x4]
1000d8e9:	c7 06 fc 70 01 10    	mov    DWORD PTR [esi],0x100170fc
1000d8ef:	8b 42 18             	mov    eax,DWORD PTR [edx+0x18]
1000d8f2:	2b 42 14             	sub    eax,DWORD PTR [edx+0x14]
1000d8f5:	a9 fc ff ff ff       	test   eax,0xfffffffc
1000d8fa:	7e 28                	jle    0x1000d924
1000d8fc:	0f 1f 40 00          	nop    DWORD PTR [eax+0x0]
1000d900:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
1000d903:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
1000d906:	8b 0c b8             	mov    ecx,DWORD PTR [eax+edi*4]
1000d909:	85 c9                	test   ecx,ecx
1000d90b:	74 06                	je     0x1000d913
1000d90d:	8b 01                	mov    eax,DWORD PTR [ecx]
1000d90f:	6a 01                	push   0x1
1000d911:	ff 10                	call   DWORD PTR [eax]
1000d913:	8b 4e 04             	mov    ecx,DWORD PTR [esi+0x4]
1000d916:	47                   	inc    edi
1000d917:	8b 41 18             	mov    eax,DWORD PTR [ecx+0x18]
1000d91a:	2b 41 14             	sub    eax,DWORD PTR [ecx+0x14]
1000d91d:	c1 f8 02             	sar    eax,0x2
1000d920:	3b f8                	cmp    edi,eax
1000d922:	7c dc                	jl     0x1000d900
1000d924:	8b 4e 04             	mov    ecx,DWORD PTR [esi+0x4]
1000d927:	33 ff                	xor    edi,edi
1000d929:	8b 41 24             	mov    eax,DWORD PTR [ecx+0x24]
1000d92c:	2b 41 20             	sub    eax,DWORD PTR [ecx+0x20]
1000d92f:	c1 f8 02             	sar    eax,0x2
1000d932:	85 c0                	test   eax,eax
1000d934:	74 24                	je     0x1000d95a
1000d936:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
1000d939:	8b 40 20             	mov    eax,DWORD PTR [eax+0x20]
1000d93c:	8b 0c b8             	mov    ecx,DWORD PTR [eax+edi*4]
1000d93f:	85 c9                	test   ecx,ecx
1000d941:	74 06                	je     0x1000d949
1000d943:	8b 01                	mov    eax,DWORD PTR [ecx]
1000d945:	6a 01                	push   0x1
1000d947:	ff 10                	call   DWORD PTR [eax]
1000d949:	8b 4e 04             	mov    ecx,DWORD PTR [esi+0x4]
1000d94c:	47                   	inc    edi
1000d94d:	8b 41 24             	mov    eax,DWORD PTR [ecx+0x24]
1000d950:	2b 41 20             	sub    eax,DWORD PTR [ecx+0x20]
1000d953:	c1 f8 02             	sar    eax,0x2
1000d956:	3b f8                	cmp    edi,eax
1000d958:	72 dc                	jb     0x1000d936
1000d95a:	8b 4e 04             	mov    ecx,DWORD PTR [esi+0x4]
1000d95d:	5f                   	pop    edi
1000d95e:	5e                   	pop    esi
1000d95f:	85 c9                	test   ecx,ecx
1000d961:	74 06                	je     0x1000d969
1000d963:	8b 01                	mov    eax,DWORD PTR [ecx]
1000d965:	6a 01                	push   0x1
1000d967:	ff 10                	call   DWORD PTR [eax]
1000d969:	c3                   	ret
1000d96a:	cc                   	int3
1000d96b:	cc                   	int3
1000d96c:	cc                   	int3
1000d96d:	cc                   	int3
1000d96e:	cc                   	int3
1000d96f:	cc                   	int3
