; Additional private-class layout evidence for docs/07_maiwmodels_abi.md
; Target SHA-256: 80ccc6678bdf057152f473369a56eb3b76a1ce643edca2832345f7b53e09c525
; GNU objdump -d -Mintel. Function boundaries are bounded to reviewed ret sites.


;; ==== SubjectCategory constructor (allocates 0x5c, initialises category fields) ====
/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/MAIWmodels.dll:     file format pei-i386
10011230 <.text+0x10230>:
10011230:	55                   	push   ebp
10011231:	8b ec                	mov    ebp,esp
10011233:	6a ff                	push   0xffffffff
10011235:	68 9f 6a 01 10       	push   0x10016a9f
1001123a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10011240:	50                   	push   eax
10011241:	51                   	push   ecx
10011242:	56                   	push   esi
10011243:	57                   	push   edi
10011244:	a1 04 10 02 10       	mov    eax,ds:0x10021004
10011249:	33 c5                	xor    eax,ebp
1001124b:	50                   	push   eax
1001124c:	8d 45 f4             	lea    eax,[ebp-0xc]
1001124f:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10011255:	8b f9                	mov    edi,ecx
10011257:	89 7d f0             	mov    DWORD PTR [ebp-0x10],edi
1001125a:	6a 5c                	push   0x5c
1001125c:	e8 8f 3a 00 00       	call   0x10014cf0
10011261:	8b f0                	mov    esi,eax
10011263:	83 c4 04             	add    esp,0x4
10011266:	89 75 f0             	mov    DWORD PTR [ebp-0x10],esi
10011269:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10011270:	85 f6                	test   esi,esi
10011272:	74 3d                	je     0x100112b1
10011274:	8b ce                	mov    ecx,esi
10011276:	e8 b5 b5 ff ff       	call   0x1000c830
1001127b:	c7 06 f8 74 01 10    	mov    DWORD PTR [esi],0x100174f8
10011281:	c7 46 40 ff ff ff ff 	mov    DWORD PTR [esi+0x40],0xffffffff
10011288:	c7 46 44 ff ff ff ff 	mov    DWORD PTR [esi+0x44],0xffffffff
1001128f:	c7 46 48 ff ff ff ff 	mov    DWORD PTR [esi+0x48],0xffffffff
10011296:	c7 46 4c ff ff ff ff 	mov    DWORD PTR [esi+0x4c],0xffffffff
1001129d:	c7 46 50 ff ff ff ff 	mov    DWORD PTR [esi+0x50],0xffffffff
100112a4:	c7 46 54 ff ff ff ff 	mov    DWORD PTR [esi+0x54],0xffffffff
100112ab:	c6 46 58 01          	mov    BYTE PTR [esi+0x58],0x1
100112af:	eb 02                	jmp    0x100112b3
100112b1:	33 f6                	xor    esi,esi
100112b3:	56                   	push   esi
100112b4:	8b cf                	mov    ecx,edi
100112b6:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
100112bd:	e8 fe be ff ff       	call   0x1000d1c0
100112c2:	8b 47 04             	mov    eax,DWORD PTR [edi+0x4]
100112c5:	c7 07 b4 73 01 10    	mov    DWORD PTR [edi],0x100173b4
100112cb:	c7 40 4c 00 00 00 00 	mov    DWORD PTR [eax+0x4c],0x0
100112d2:	8b c7                	mov    eax,edi
100112d4:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
100112d7:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
100112de:	59                   	pop    ecx
100112df:	5f                   	pop    edi
100112e0:	5e                   	pop    esi
100112e1:	8b e5                	mov    esp,ebp
100112e3:	5d                   	pop    ebp
100112e4:	c3                   	ret

;; ==== Parameter constructor (allocates 0x50) ====
/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/MAIWmodels.dll:     file format pei-i386
10012a50 <.text+0x11a50>:
10012a50:	55                   	push   ebp
10012a51:	8b ec                	mov    ebp,esp
10012a53:	6a ff                	push   0xffffffff
10012a55:	68 07 6d 01 10       	push   0x10016d07
10012a5a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10012a60:	50                   	push   eax
10012a61:	51                   	push   ecx
10012a62:	56                   	push   esi
10012a63:	57                   	push   edi
10012a64:	a1 04 10 02 10       	mov    eax,ds:0x10021004
10012a69:	33 c5                	xor    eax,ebp
10012a6b:	50                   	push   eax
10012a6c:	8d 45 f4             	lea    eax,[ebp-0xc]
10012a6f:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10012a75:	8b f9                	mov    edi,ecx
10012a77:	89 7d f0             	mov    DWORD PTR [ebp-0x10],edi
10012a7a:	6a 50                	push   0x50
10012a7c:	e8 6f 22 00 00       	call   0x10014cf0
10012a81:	8b f0                	mov    esi,eax
10012a83:	83 c4 04             	add    esp,0x4
10012a86:	89 75 f0             	mov    DWORD PTR [ebp-0x10],esi
10012a89:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10012a90:	85 f6                	test   esi,esi
10012a92:	74 28                	je     0x10012abc
10012a94:	6a 50                	push   0x50
10012a96:	6a 00                	push   0x0
10012a98:	56                   	push   esi
10012a99:	e8 16 30 00 00       	call   0x10015ab4
10012a9e:	83 c4 0c             	add    esp,0xc
10012aa1:	8b ce                	mov    ecx,esi
10012aa3:	e8 88 9d ff ff       	call   0x1000c830
10012aa8:	8d 4e 48             	lea    ecx,[esi+0x48]
10012aab:	c6 45 fc 01          	mov    BYTE PTR [ebp-0x4],0x1
10012aaf:	c7 06 94 75 01 10    	mov    DWORD PTR [esi],0x10017594
10012ab5:	e8 e6 f2 ff ff       	call   0x10011da0
10012aba:	eb 02                	jmp    0x10012abe
10012abc:	33 f6                	xor    esi,esi
10012abe:	56                   	push   esi
10012abf:	8b cf                	mov    ecx,edi
10012ac1:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
10012ac8:	e8 f3 a6 ff ff       	call   0x1000d1c0
10012acd:	c7 07 74 75 01 10    	mov    DWORD PTR [edi],0x10017574
10012ad3:	8b c7                	mov    eax,edi
10012ad5:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10012ad8:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10012adf:	59                   	pop    ecx
10012ae0:	5f                   	pop    edi
10012ae1:	5e                   	pop    esi
10012ae2:	8b e5                	mov    esp,ebp
10012ae4:	5d                   	pop    ebp
10012ae5:	c3                   	ret
10012ae6:	cc                   	int3
10012ae7:	cc                   	int3
10012ae8:	cc                   	int3
10012ae9:	cc                   	int3
10012aea:	cc                   	int3
10012aeb:	cc                   	int3
10012aec:	cc                   	int3
10012aed:	cc                   	int3
10012aee:	cc                   	int3
10012aef:	cc                   	int3
10012af0:	55                   	push   ebp
10012af1:	8b ec                	mov    ebp,esp
10012af3:	51                   	push   ecx
10012af4:	56                   	push   esi
10012af5:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10012af8:	8b f1                	mov    esi,ecx
10012afa:	89 75 fc             	mov    DWORD PTR [ebp-0x4],esi
10012afd:	e8 be a6 ff ff       	call   0x1000d1c0
10012b02:	c7 06 74 75 01 10    	mov    DWORD PTR [esi],0x10017574
10012b08:	8b c6                	mov    eax,esi
10012b0a:	5e                   	pop    esi
10012b0b:	8b e5                	mov    esp,ebp
10012b0d:	5d                   	pop    ebp
10012b0e:	c2 04 00             	ret    0x4

;; ==== ParameterPrivate constructor (initialises MString sign) ====
/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/MAIWmodels.dll:     file format pei-i386
10012bd0 <.text+0x11bd0>:
10012bd0:	55                   	push   ebp
10012bd1:	8b ec                	mov    ebp,esp
10012bd3:	6a ff                	push   0xffffffff
10012bd5:	68 68 6d 01 10       	push   0x10016d68
10012bda:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10012be0:	50                   	push   eax
10012be1:	51                   	push   ecx
10012be2:	56                   	push   esi
10012be3:	a1 04 10 02 10       	mov    eax,ds:0x10021004
10012be8:	33 c5                	xor    eax,ebp
10012bea:	50                   	push   eax
10012beb:	8d 45 f4             	lea    eax,[ebp-0xc]
10012bee:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10012bf4:	8b f1                	mov    esi,ecx
10012bf6:	89 75 f0             	mov    DWORD PTR [ebp-0x10],esi
10012bf9:	e8 32 9c ff ff       	call   0x1000c830
10012bfe:	8d 4e 48             	lea    ecx,[esi+0x48]
10012c01:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10012c08:	c7 06 94 75 01 10    	mov    DWORD PTR [esi],0x10017594
10012c0e:	e8 8d f1 ff ff       	call   0x10011da0
10012c13:	8b c6                	mov    eax,esi
10012c15:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10012c18:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10012c1f:	59                   	pop    ecx
10012c20:	5e                   	pop    esi
10012c21:	8b e5                	mov    esp,ebp
10012c23:	5d                   	pop    ebp
10012c24:	c3                   	ret

;; ==== Parameter accessors group, number, sign, object ====
/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/MAIWmodels.dll:     file format pei-i386
10012f80 <.text+0x11f80>:
10012f80:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
10012f83:	8b 40 40             	mov    eax,DWORD PTR [eax+0x40]
10012f86:	c3                   	ret
10012f87:	cc                   	int3
10012f88:	cc                   	int3
10012f89:	cc                   	int3
10012f8a:	cc                   	int3
10012f8b:	cc                   	int3
10012f8c:	cc                   	int3
10012f8d:	cc                   	int3
10012f8e:	cc                   	int3
10012f8f:	cc                   	int3
10012f90:	55                   	push   ebp
10012f91:	8b ec                	mov    ebp,esp
10012f93:	51                   	push   ecx
10012f94:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
10012f97:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
10012f9a:	83 c0 48             	add    eax,0x48
10012f9d:	50                   	push   eax
10012f9e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10012fa5:	e8 b6 ec ff ff       	call   0x10011c60
10012faa:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10012fad:	8b e5                	mov    esp,ebp
10012faf:	5d                   	pop    ebp
10012fb0:	c2 04 00             	ret    0x4
10012fb3:	cc                   	int3
10012fb4:	cc                   	int3
10012fb5:	cc                   	int3
10012fb6:	cc                   	int3
10012fb7:	cc                   	int3
10012fb8:	cc                   	int3
10012fb9:	cc                   	int3
10012fba:	cc                   	int3
10012fbb:	cc                   	int3
10012fbc:	cc                   	int3
10012fbd:	cc                   	int3
10012fbe:	cc                   	int3
10012fbf:	cc                   	int3
10012fc0:	55                   	push   ebp
10012fc1:	8b ec                	mov    ebp,esp
10012fc3:	8b 49 04             	mov    ecx,DWORD PTR [ecx+0x4]
10012fc6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10012fc9:	89 41 40             	mov    DWORD PTR [ecx+0x40],eax
10012fcc:	5d                   	pop    ebp
10012fcd:	c2 04 00             	ret    0x4
10012fd0:	55                   	push   ebp
10012fd1:	8b ec                	mov    ebp,esp
10012fd3:	8b 49 04             	mov    ecx,DWORD PTR [ecx+0x4]
10012fd6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10012fd9:	89 41 4c             	mov    DWORD PTR [ecx+0x4c],eax
10012fdc:	5d                   	pop    ebp
10012fdd:	c2 04 00             	ret    0x4
10012fe0:	55                   	push   ebp
10012fe1:	8b ec                	mov    ebp,esp
10012fe3:	6a ff                	push   0xffffffff
10012fe5:	68 d8 6d 01 10       	push   0x10016dd8
10012fea:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10012ff0:	50                   	push   eax
10012ff1:	a1 04 10 02 10       	mov    eax,ds:0x10021004
10012ff6:	33 c5                	xor    eax,ebp
10012ff8:	50                   	push   eax
10012ff9:	8d 45 f4             	lea    eax,[ebp-0xc]
10012ffc:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10013002:	8b 49 04             	mov    ecx,DWORD PTR [ecx+0x4]
10013005:	8d 45 08             	lea    eax,[ebp+0x8]
10013008:	50                   	push   eax
10013009:	83 c1 48             	add    ecx,0x48
1001300c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10013013:	e8 28 ee ff ff       	call   0x10011e40
10013018:	8d 4d 08             	lea    ecx,[ebp+0x8]
1001301b:	e8 c0 ed ff ff       	call   0x10011de0

;; ==== SubjectOperationPrivate constructor (mark string storage) ====
/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/MAIWmodels.dll:     file format pei-i386
10014470 <.text+0x13470>:
10014470:	55                   	push   ebp
10014471:	8b ec                	mov    ebp,esp
10014473:	51                   	push   ecx
10014474:	56                   	push   esi
10014475:	8b f1                	mov    esi,ecx
10014477:	89 75 fc             	mov    DWORD PTR [ebp-0x4],esi
1001447a:	e8 51 1d ff ff       	call   0x100061d0
1001447f:	c7 06 ec 75 01 10    	mov    DWORD PTR [esi],0x100175ec
10014485:	33 c0                	xor    eax,eax
10014487:	c7 86 ac 00 00 00 07 	mov    DWORD PTR [esi+0xac],0x7
1001448e:	00 00 00 
10014491:	c7 86 a8 00 00 00 00 	mov    DWORD PTR [esi+0xa8],0x0
10014498:	00 00 00 
1001449b:	66 89 86 98 00 00 00 	mov    WORD PTR [esi+0x98],ax
100144a2:	8b c6                	mov    eax,esi
100144a4:	5e                   	pop    esi
100144a5:	8b e5                	mov    esp,ebp
100144a7:	5d                   	pop    ebp
100144a8:	c3                   	ret

;; ==== SubjectOperationPrivate mark getter and name delegation ====
/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/MAIWmodels.dll:     file format pei-i386
10014710 <.text+0x13710>:
10014710:	55                   	push   ebp
10014711:	8b ec                	mov    ebp,esp
10014713:	51                   	push   ecx
10014714:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
10014717:	05 98 00 00 00       	add    eax,0x98
1001471c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10014723:	83 78 14 08          	cmp    DWORD PTR [eax+0x14],0x8
10014727:	72 02                	jb     0x1001472b
10014729:	8b 00                	mov    eax,DWORD PTR [eax]
1001472b:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
1001472e:	50                   	push   eax
1001472f:	e8 cc d5 ff ff       	call   0x10011d00
10014734:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10014737:	8b e5                	mov    esp,ebp
10014739:	5d                   	pop    ebp
1001473a:	c2 04 00             	ret    0x4
1001473d:	cc                   	int3
1001473e:	cc                   	int3
1001473f:	cc                   	int3
10014740:	55                   	push   ebp
10014741:	8b ec                	mov    ebp,esp
10014743:	51                   	push   ecx
10014744:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10014747:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1001474e:	e8 1d f4 fe ff       	call   0x10003b70
10014753:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10014756:	8b e5                	mov    esp,ebp
10014758:	5d                   	pop    ebp
10014759:	c2 04 00             	ret    0x4
