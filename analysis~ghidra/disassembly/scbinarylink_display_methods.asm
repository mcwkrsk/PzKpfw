; Static disassembly excerpts from the supplied MAIWmodels.dll
; PE32/i386; image base 0x10000000
; SHA-256: 80ccc6678bdf057152f473369a56eb3b76a1ce643edca2832345f7b53e09c525
; Names resolved against MAIWmodels_exports.tsv and vtable_slots.tsv.

; ---- SCBinaryLink::getCode ----
10010800:	55                   	push   ebp
10010801:	8b ec                	mov    ebp,esp
10010803:	6a ff                	push   0xffffffff
10010805:	68 b9 69 01 10       	push   0x100169b9
1001080a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10010810:	50                   	push   eax
10010811:	83 ec 0c             	sub    esp,0xc
10010814:	56                   	push   esi
10010815:	57                   	push   edi
10010816:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1001081b:	33 c5                	xor    eax,ebp
1001081d:	50                   	push   eax
1001081e:	8d 45 f4             	lea    eax,[ebp-0xc]
10010821:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10010827:	8b f9                	mov    edi,ecx
10010829:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
10010830:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
10010833:	8b ce                	mov    ecx,esi
10010835:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1001083c:	e8 5f 15 00 00       	call   0x10011da0
10010841:	8b cf                	mov    ecx,edi
10010843:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1001084a:	c7 45 ec 01 00 00 00 	mov    DWORD PTR [ebp-0x14],0x1
10010851:	e8 fa c7 ff ff       	call   0x1000d050
10010856:	85 c0                	test   eax,eax
10010858:	74 3e                	je     0x10010898
1001085a:	8b cf                	mov    ecx,edi
1001085c:	e8 ef c7 ff ff       	call   0x1000d050
10010861:	8d 4d e8             	lea    ecx,[ebp-0x18]
10010864:	51                   	push   ecx
10010865:	8b c8                	mov    ecx,eax
10010867:	8b 10                	mov    edx,DWORD PTR [eax]
10010869:	ff 52 14             	call   DWORD PTR [edx+0x14]
1001086c:	50                   	push   eax
1001086d:	8d 45 f0             	lea    eax,[ebp-0x10]
10010870:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [ebp-0x4],0x1
10010877:	50                   	push   eax
10010878:	8b ce                	mov    ecx,esi
1001087a:	e8 11 17 00 00       	call   0x10011f90
1001087f:	50                   	push   eax
10010880:	8b ce                	mov    ecx,esi
10010882:	c6 45 fc 02          	mov    BYTE PTR [ebp-0x4],0x2
10010886:	e8 b5 15 00 00       	call   0x10011e40
1001088b:	8d 4d f0             	lea    ecx,[ebp-0x10]
1001088e:	e8 4d 15 00 00       	call   0x10011de0
10010893:	8d 4d e8             	lea    ecx,[ebp-0x18]
10010896:	eb 3a                	jmp    0x100108d2
10010898:	68 f0 74 01 10       	push   0x100174f0
1001089d:	8d 4d f0             	lea    ecx,[ebp-0x10]
100108a0:	e8 5b 14 00 00       	call   0x10011d00
100108a5:	8d 45 f0             	lea    eax,[ebp-0x10]
100108a8:	c7 45 fc 03 00 00 00 	mov    DWORD PTR [ebp-0x4],0x3
100108af:	50                   	push   eax
100108b0:	8d 45 e8             	lea    eax,[ebp-0x18]
100108b3:	8b ce                	mov    ecx,esi
100108b5:	50                   	push   eax
100108b6:	e8 d5 16 00 00       	call   0x10011f90
100108bb:	50                   	push   eax
100108bc:	8b ce                	mov    ecx,esi
100108be:	c6 45 fc 04          	mov    BYTE PTR [ebp-0x4],0x4
100108c2:	e8 79 15 00 00       	call   0x10011e40
100108c7:	8d 4d e8             	lea    ecx,[ebp-0x18]
100108ca:	e8 11 15 00 00       	call   0x10011de0
100108cf:	8d 4d f0             	lea    ecx,[ebp-0x10]
100108d2:	c6 45 fc 00          	mov    BYTE PTR [ebp-0x4],0x0
100108d6:	e8 05 15 00 00       	call   0x10011de0
100108db:	8b cf                	mov    ecx,edi
100108dd:	e8 2e 2d ff ff       	call   0x10003610
100108e2:	85 c0                	test   eax,eax
100108e4:	74 2b                	je     0x10010911
100108e6:	8b cf                	mov    ecx,edi
100108e8:	e8 23 2d ff ff       	call   0x10003610
100108ed:	8d 4d f0             	lea    ecx,[ebp-0x10]
100108f0:	51                   	push   ecx
100108f1:	8b c8                	mov    ecx,eax
100108f3:	8b 10                	mov    edx,DWORD PTR [eax]
100108f5:	ff 52 14             	call   DWORD PTR [edx+0x14]
100108f8:	50                   	push   eax
100108f9:	8d 45 e8             	lea    eax,[ebp-0x18]
100108fc:	c7 45 fc 05 00 00 00 	mov    DWORD PTR [ebp-0x4],0x5
10010903:	50                   	push   eax
10010904:	8b ce                	mov    ecx,esi
10010906:	e8 85 16 00 00       	call   0x10011f90
1001090b:	c6 45 fc 06          	mov    BYTE PTR [ebp-0x4],0x6
1001090f:	eb 27                	jmp    0x10010938
10010911:	68 f0 74 01 10       	push   0x100174f0
10010916:	8d 4d f0             	lea    ecx,[ebp-0x10]
10010919:	e8 e2 13 00 00       	call   0x10011d00
1001091e:	8d 45 f0             	lea    eax,[ebp-0x10]
10010921:	c7 45 fc 07 00 00 00 	mov    DWORD PTR [ebp-0x4],0x7
10010928:	50                   	push   eax
10010929:	8d 45 e8             	lea    eax,[ebp-0x18]
1001092c:	8b ce                	mov    ecx,esi
1001092e:	50                   	push   eax
1001092f:	e8 5c 16 00 00       	call   0x10011f90
10010934:	c6 45 fc 08          	mov    BYTE PTR [ebp-0x4],0x8
10010938:	50                   	push   eax
10010939:	8b ce                	mov    ecx,esi
1001093b:	e8 00 15 00 00       	call   0x10011e40
10010940:	8d 4d e8             	lea    ecx,[ebp-0x18]
10010943:	e8 98 14 00 00       	call   0x10011de0
10010948:	8d 4d f0             	lea    ecx,[ebp-0x10]
1001094b:	c6 45 fc 00          	mov    BYTE PTR [ebp-0x4],0x0
1001094f:	e8 8c 14 00 00       	call   0x10011de0
10010954:	8b cf                	mov    ecx,edi
10010956:	e8 05 c7 ff ff       	call   0x1000d060
1001095b:	85 c0                	test   eax,eax
1001095d:	74 2b                	je     0x1001098a
1001095f:	8b cf                	mov    ecx,edi
10010961:	e8 fa c6 ff ff       	call   0x1000d060
10010966:	8d 4d f0             	lea    ecx,[ebp-0x10]
10010969:	51                   	push   ecx
1001096a:	8b c8                	mov    ecx,eax
1001096c:	8b 10                	mov    edx,DWORD PTR [eax]
1001096e:	ff 52 14             	call   DWORD PTR [edx+0x14]
10010971:	50                   	push   eax
10010972:	8d 45 e8             	lea    eax,[ebp-0x18]
10010975:	c7 45 fc 09 00 00 00 	mov    DWORD PTR [ebp-0x4],0x9
1001097c:	50                   	push   eax
1001097d:	8b ce                	mov    ecx,esi
1001097f:	e8 0c 16 00 00       	call   0x10011f90
10010984:	c6 45 fc 0a          	mov    BYTE PTR [ebp-0x4],0xa
10010988:	eb 27                	jmp    0x100109b1
1001098a:	68 f0 74 01 10       	push   0x100174f0
1001098f:	8d 4d f0             	lea    ecx,[ebp-0x10]
10010992:	e8 69 13 00 00       	call   0x10011d00
10010997:	8d 45 f0             	lea    eax,[ebp-0x10]
1001099a:	c7 45 fc 0b 00 00 00 	mov    DWORD PTR [ebp-0x4],0xb
100109a1:	50                   	push   eax
100109a2:	8d 45 e8             	lea    eax,[ebp-0x18]
100109a5:	8b ce                	mov    ecx,esi
100109a7:	50                   	push   eax
100109a8:	e8 e3 15 00 00       	call   0x10011f90
100109ad:	c6 45 fc 0c          	mov    BYTE PTR [ebp-0x4],0xc
100109b1:	50                   	push   eax
100109b2:	8b ce                	mov    ecx,esi
100109b4:	e8 87 14 00 00       	call   0x10011e40
100109b9:	8d 4d e8             	lea    ecx,[ebp-0x18]
100109bc:	e8 1f 14 00 00       	call   0x10011de0
100109c1:	8d 4d f0             	lea    ecx,[ebp-0x10]
100109c4:	e8 17 14 00 00       	call   0x10011de0
100109c9:	8b c6                	mov    eax,esi
100109cb:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
100109ce:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
100109d5:	59                   	pop    ecx
100109d6:	5f                   	pop    edi
100109d7:	5e                   	pop    esi
100109d8:	8b e5                	mov    esp,ebp
100109da:	5d                   	pop    ebp
100109db:	c2 04 00             	ret    0x4
100109de:	cc                   	int3
100109df:	cc                   	int3

; ---- SCBinaryLink::getName ----
100109e0:	55                   	push   ebp
100109e1:	8b ec                	mov    ebp,esp
100109e3:	6a ff                	push   0xffffffff
100109e5:	68 60 6a 01 10       	push   0x10016a60
100109ea:	64 a1 00 00 00 00    	mov    eax,fs:0x0
100109f0:	50                   	push   eax
100109f1:	83 ec 6c             	sub    esp,0x6c
100109f4:	a1 04 10 02 10       	mov    eax,ds:0x10021004
100109f9:	33 c5                	xor    eax,ebp
100109fb:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
100109fe:	56                   	push   esi
100109ff:	57                   	push   edi
10010a00:	50                   	push   eax
10010a01:	8d 45 f4             	lea    eax,[ebp-0xc]
10010a04:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10010a0a:	8b f1                	mov    esi,ecx
10010a0c:	8b 7d 08             	mov    edi,DWORD PTR [ebp+0x8]
10010a0f:	33 c0                	xor    eax,eax
10010a11:	c7 45 88 00 00 00 00 	mov    DWORD PTR [ebp-0x78],0x0
10010a18:	c7 45 a4 07 00 00 00 	mov    DWORD PTR [ebp-0x5c],0x7
10010a1f:	c7 45 a0 00 00 00 00 	mov    DWORD PTR [ebp-0x60],0x0
10010a26:	66 89 45 90          	mov    WORD PTR [ebp-0x70],ax
10010a2a:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
10010a2d:	e8 4e 27 ff ff       	call   0x10003180
10010a32:	83 e8 01             	sub    eax,0x1
10010a35:	0f 84 fc 01 00 00    	je     0x10010c37
10010a3b:	83 e8 01             	sub    eax,0x1
10010a3e:	0f 84 45 01 00 00    	je     0x10010b89
10010a44:	83 e8 01             	sub    eax,0x1
10010a47:	0f 85 28 03 00 00    	jne    0x10010d75
10010a4d:	6a 0b                	push   0xb
10010a4f:	68 a4 74 01 10       	push   0x100174a4
10010a54:	8d 4d 90             	lea    ecx,[ebp-0x70]
10010a57:	e8 f4 73 ff ff       	call   0x10007e50
10010a5c:	8b ce                	mov    ecx,esi
10010a5e:	e8 ed c5 ff ff       	call   0x1000d050
10010a63:	8b c8                	mov    ecx,eax
10010a65:	e8 d6 09 00 00       	call   0x10011440
10010a6a:	50                   	push   eax
10010a6b:	8d 45 d8             	lea    eax,[ebp-0x28]
10010a6e:	50                   	push   eax
10010a6f:	e8 8c fa ff ff       	call   0x10010500
10010a74:	83 c4 08             	add    esp,0x8
10010a77:	6a ff                	push   0xffffffff
10010a79:	6a 00                	push   0x0
10010a7b:	50                   	push   eax
10010a7c:	8d 4d 90             	lea    ecx,[ebp-0x70]
10010a7f:	c6 45 fc 01          	mov    BYTE PTR [ebp-0x4],0x1
10010a83:	e8 c8 6f ff ff       	call   0x10007a50
10010a88:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
10010a8b:	c6 45 fc 00          	mov    BYTE PTR [ebp-0x4],0x0
10010a8f:	83 f8 08             	cmp    eax,0x8
10010a92:	72 0f                	jb     0x10010aa3
10010a94:	40                   	inc    eax
10010a95:	6a 02                	push   0x2
10010a97:	50                   	push   eax
10010a98:	ff 75 d8             	push   DWORD PTR [ebp-0x28]
10010a9b:	e8 e0 11 ff ff       	call   0x10001c80
10010aa0:	83 c4 0c             	add    esp,0xc
10010aa3:	8d 45 8c             	lea    eax,[ebp-0x74]
10010aa6:	8b ce                	mov    ecx,esi
10010aa8:	50                   	push   eax
10010aa9:	e8 a2 c5 ff ff       	call   0x1000d050
10010aae:	8b c8                	mov    ecx,eax
10010ab0:	e8 8b 3c 00 00       	call   0x10014740
10010ab5:	8b c8                	mov    ecx,eax
10010ab7:	c6 45 fc 02          	mov    BYTE PTR [ebp-0x4],0x2
10010abb:	e8 a0 17 00 00       	call   0x10012260
10010ac0:	50                   	push   eax
10010ac1:	8d 4d d8             	lea    ecx,[ebp-0x28]
10010ac4:	e8 57 f9 ff ff       	call   0x10010420
10010ac9:	50                   	push   eax
10010aca:	8d 45 a8             	lea    eax,[ebp-0x58]
10010acd:	c6 45 fc 03          	mov    BYTE PTR [ebp-0x4],0x3
10010ad1:	68 bc 74 01 10       	push   0x100174bc
10010ad6:	50                   	push   eax
10010ad7:	e8 e4 f8 ff ff       	call   0x100103c0
10010adc:	68 bc 74 01 10       	push   0x100174bc
10010ae1:	50                   	push   eax
10010ae2:	8d 45 c0             	lea    eax,[ebp-0x40]
10010ae5:	c6 45 fc 04          	mov    BYTE PTR [ebp-0x4],0x4
10010ae9:	50                   	push   eax
10010aea:	e8 71 f8 ff ff       	call   0x10010360
10010aef:	83 c4 18             	add    esp,0x18
10010af2:	6a ff                	push   0xffffffff
10010af4:	6a 00                	push   0x0
10010af6:	50                   	push   eax
10010af7:	8d 4d 90             	lea    ecx,[ebp-0x70]
10010afa:	c6 45 fc 05          	mov    BYTE PTR [ebp-0x4],0x5
10010afe:	e8 4d 6f ff ff       	call   0x10007a50
10010b03:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
10010b06:	83 f8 08             	cmp    eax,0x8
10010b09:	72 0f                	jb     0x10010b1a
10010b0b:	40                   	inc    eax
10010b0c:	6a 02                	push   0x2
10010b0e:	50                   	push   eax
10010b0f:	ff 75 c0             	push   DWORD PTR [ebp-0x40]
10010b12:	e8 69 11 ff ff       	call   0x10001c80
10010b17:	83 c4 0c             	add    esp,0xc
10010b1a:	33 c0                	xor    eax,eax
10010b1c:	c7 45 d4 07 00 00 00 	mov    DWORD PTR [ebp-0x2c],0x7
10010b23:	66 89 45 c0          	mov    WORD PTR [ebp-0x40],ax
10010b27:	8b 45 bc             	mov    eax,DWORD PTR [ebp-0x44]
10010b2a:	c7 45 d0 00 00 00 00 	mov    DWORD PTR [ebp-0x30],0x0
10010b31:	83 f8 08             	cmp    eax,0x8
10010b34:	72 0f                	jb     0x10010b45
10010b36:	40                   	inc    eax
10010b37:	6a 02                	push   0x2
10010b39:	50                   	push   eax
10010b3a:	ff 75 a8             	push   DWORD PTR [ebp-0x58]
10010b3d:	e8 3e 11 ff ff       	call   0x10001c80
10010b42:	83 c4 0c             	add    esp,0xc
10010b45:	33 c0                	xor    eax,eax
10010b47:	c7 45 bc 07 00 00 00 	mov    DWORD PTR [ebp-0x44],0x7
10010b4e:	66 89 45 a8          	mov    WORD PTR [ebp-0x58],ax
10010b52:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
10010b55:	c7 45 b8 00 00 00 00 	mov    DWORD PTR [ebp-0x48],0x0
10010b5c:	83 f8 08             	cmp    eax,0x8
10010b5f:	72 0f                	jb     0x10010b70
10010b61:	40                   	inc    eax
10010b62:	6a 02                	push   0x2
10010b64:	50                   	push   eax
10010b65:	ff 75 d8             	push   DWORD PTR [ebp-0x28]
10010b68:	e8 13 11 ff ff       	call   0x10001c80
10010b6d:	83 c4 0c             	add    esp,0xc
10010b70:	33 c0                	xor    eax,eax
10010b72:	c7 45 ec 07 00 00 00 	mov    DWORD PTR [ebp-0x14],0x7
10010b79:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
10010b80:	66 89 45 d8          	mov    WORD PTR [ebp-0x28],ax
10010b84:	e9 e1 01 00 00       	jmp    0x10010d6a
10010b89:	6a 07                	push   0x7
10010b8b:	68 c0 74 01 10       	push   0x100174c0
10010b90:	8d 4d 90             	lea    ecx,[ebp-0x70]
10010b93:	e8 b8 72 ff ff       	call   0x10007e50
10010b98:	8b ce                	mov    ecx,esi
10010b9a:	e8 b1 c4 ff ff       	call   0x1000d050
10010b9f:	8b c8                	mov    ecx,eax
10010ba1:	e8 9a 08 00 00       	call   0x10011440
10010ba6:	50                   	push   eax
10010ba7:	8d 45 d8             	lea    eax,[ebp-0x28]
10010baa:	50                   	push   eax
10010bab:	e8 50 f9 ff ff       	call   0x10010500
10010bb0:	83 c4 08             	add    esp,0x8
10010bb3:	6a ff                	push   0xffffffff
10010bb5:	6a 00                	push   0x0
10010bb7:	50                   	push   eax
10010bb8:	8d 4d 90             	lea    ecx,[ebp-0x70]
10010bbb:	c6 45 fc 06          	mov    BYTE PTR [ebp-0x4],0x6
10010bbf:	e8 8c 6e ff ff       	call   0x10007a50
10010bc4:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
10010bc7:	c6 45 fc 00          	mov    BYTE PTR [ebp-0x4],0x0
10010bcb:	83 f8 08             	cmp    eax,0x8
10010bce:	72 0f                	jb     0x10010bdf
10010bd0:	40                   	inc    eax
10010bd1:	6a 02                	push   0x2
10010bd3:	50                   	push   eax
10010bd4:	ff 75 d8             	push   DWORD PTR [ebp-0x28]
10010bd7:	e8 a4 10 ff ff       	call   0x10001c80
10010bdc:	83 c4 0c             	add    esp,0xc
10010bdf:	8d 45 8c             	lea    eax,[ebp-0x74]
10010be2:	8b ce                	mov    ecx,esi
10010be4:	50                   	push   eax
10010be5:	e8 66 c4 ff ff       	call   0x1000d050
10010bea:	8b c8                	mov    ecx,eax
10010bec:	e8 4f 3b 00 00       	call   0x10014740
10010bf1:	8b c8                	mov    ecx,eax
10010bf3:	c6 45 fc 07          	mov    BYTE PTR [ebp-0x4],0x7
10010bf7:	e8 64 16 00 00       	call   0x10012260
10010bfc:	50                   	push   eax
10010bfd:	8d 4d c0             	lea    ecx,[ebp-0x40]
10010c00:	e8 1b f8 ff ff       	call   0x10010420
10010c05:	50                   	push   eax
10010c06:	8d 45 a8             	lea    eax,[ebp-0x58]
10010c09:	c6 45 fc 08          	mov    BYTE PTR [ebp-0x4],0x8
10010c0d:	68 bc 74 01 10       	push   0x100174bc
10010c12:	50                   	push   eax
10010c13:	e8 a8 f7 ff ff       	call   0x100103c0
10010c18:	68 bc 74 01 10       	push   0x100174bc
10010c1d:	50                   	push   eax
10010c1e:	8d 45 d8             	lea    eax,[ebp-0x28]
10010c21:	c6 45 fc 09          	mov    BYTE PTR [ebp-0x4],0x9
10010c25:	50                   	push   eax
10010c26:	e8 35 f7 ff ff       	call   0x10010360
10010c2b:	83 c4 18             	add    esp,0x18
10010c2e:	c6 45 fc 0a          	mov    BYTE PTR [ebp-0x4],0xa
10010c32:	e9 a9 00 00 00       	jmp    0x10010ce0
10010c37:	6a 0f                	push   0xf
10010c39:	68 d0 74 01 10       	push   0x100174d0
10010c3e:	8d 4d 90             	lea    ecx,[ebp-0x70]
10010c41:	e8 0a 72 ff ff       	call   0x10007e50
10010c46:	8b ce                	mov    ecx,esi
10010c48:	e8 c3 29 ff ff       	call   0x10003610
10010c4d:	8b c8                	mov    ecx,eax
10010c4f:	e8 ec 07 00 00       	call   0x10011440
10010c54:	50                   	push   eax
10010c55:	8d 45 d8             	lea    eax,[ebp-0x28]
10010c58:	50                   	push   eax
10010c59:	e8 a2 f8 ff ff       	call   0x10010500
10010c5e:	83 c4 08             	add    esp,0x8
10010c61:	6a ff                	push   0xffffffff
10010c63:	6a 00                	push   0x0
10010c65:	50                   	push   eax
10010c66:	8d 4d 90             	lea    ecx,[ebp-0x70]
10010c69:	c6 45 fc 0b          	mov    BYTE PTR [ebp-0x4],0xb
10010c6d:	e8 de 6d ff ff       	call   0x10007a50
10010c72:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
10010c75:	c6 45 fc 00          	mov    BYTE PTR [ebp-0x4],0x0
10010c79:	83 f8 08             	cmp    eax,0x8
10010c7c:	72 0f                	jb     0x10010c8d
10010c7e:	40                   	inc    eax
10010c7f:	6a 02                	push   0x2
10010c81:	50                   	push   eax
10010c82:	ff 75 d8             	push   DWORD PTR [ebp-0x28]
10010c85:	e8 f6 0f ff ff       	call   0x10001c80
10010c8a:	83 c4 0c             	add    esp,0xc
10010c8d:	8d 45 8c             	lea    eax,[ebp-0x74]
10010c90:	8b ce                	mov    ecx,esi
10010c92:	50                   	push   eax
10010c93:	e8 78 29 ff ff       	call   0x10003610
10010c98:	8b c8                	mov    ecx,eax
10010c9a:	e8 a1 3a 00 00       	call   0x10014740
10010c9f:	8b c8                	mov    ecx,eax
10010ca1:	c6 45 fc 0c          	mov    BYTE PTR [ebp-0x4],0xc
10010ca5:	e8 b6 15 00 00       	call   0x10012260
10010caa:	50                   	push   eax
10010cab:	8d 4d c0             	lea    ecx,[ebp-0x40]
10010cae:	e8 6d f7 ff ff       	call   0x10010420
10010cb3:	50                   	push   eax
10010cb4:	8d 45 a8             	lea    eax,[ebp-0x58]
10010cb7:	c6 45 fc 0d          	mov    BYTE PTR [ebp-0x4],0xd
10010cbb:	68 bc 74 01 10       	push   0x100174bc
10010cc0:	50                   	push   eax
10010cc1:	e8 fa f6 ff ff       	call   0x100103c0
10010cc6:	68 bc 74 01 10       	push   0x100174bc
10010ccb:	50                   	push   eax
10010ccc:	8d 45 d8             	lea    eax,[ebp-0x28]
10010ccf:	c6 45 fc 0e          	mov    BYTE PTR [ebp-0x4],0xe
10010cd3:	50                   	push   eax
10010cd4:	e8 87 f6 ff ff       	call   0x10010360
10010cd9:	83 c4 18             	add    esp,0x18
10010cdc:	c6 45 fc 0f          	mov    BYTE PTR [ebp-0x4],0xf
10010ce0:	6a ff                	push   0xffffffff
10010ce2:	6a 00                	push   0x0
10010ce4:	50                   	push   eax
10010ce5:	8d 4d 90             	lea    ecx,[ebp-0x70]
10010ce8:	e8 63 6d ff ff       	call   0x10007a50
10010ced:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
10010cf0:	83 f8 08             	cmp    eax,0x8
10010cf3:	72 0f                	jb     0x10010d04
10010cf5:	6a 02                	push   0x2
10010cf7:	40                   	inc    eax
10010cf8:	50                   	push   eax
10010cf9:	ff 75 d8             	push   DWORD PTR [ebp-0x28]
10010cfc:	e8 7f 0f ff ff       	call   0x10001c80
10010d01:	83 c4 0c             	add    esp,0xc
10010d04:	33 c0                	xor    eax,eax
10010d06:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
10010d0d:	66 89 45 d8          	mov    WORD PTR [ebp-0x28],ax
10010d11:	8b 45 bc             	mov    eax,DWORD PTR [ebp-0x44]
10010d14:	c7 45 ec 07 00 00 00 	mov    DWORD PTR [ebp-0x14],0x7
10010d1b:	83 f8 08             	cmp    eax,0x8
10010d1e:	72 0f                	jb     0x10010d2f
10010d20:	6a 02                	push   0x2
10010d22:	40                   	inc    eax
10010d23:	50                   	push   eax
10010d24:	ff 75 a8             	push   DWORD PTR [ebp-0x58]
10010d27:	e8 54 0f ff ff       	call   0x10001c80
10010d2c:	83 c4 0c             	add    esp,0xc
10010d2f:	33 c0                	xor    eax,eax
10010d31:	c7 45 b8 00 00 00 00 	mov    DWORD PTR [ebp-0x48],0x0
10010d38:	66 89 45 a8          	mov    WORD PTR [ebp-0x58],ax
10010d3c:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
10010d3f:	c7 45 bc 07 00 00 00 	mov    DWORD PTR [ebp-0x44],0x7
10010d46:	83 f8 08             	cmp    eax,0x8
10010d49:	72 0f                	jb     0x10010d5a
10010d4b:	6a 02                	push   0x2
10010d4d:	40                   	inc    eax
10010d4e:	50                   	push   eax
10010d4f:	ff 75 c0             	push   DWORD PTR [ebp-0x40]
10010d52:	e8 29 0f ff ff       	call   0x10001c80
10010d57:	83 c4 0c             	add    esp,0xc
10010d5a:	33 c0                	xor    eax,eax
10010d5c:	c7 45 d4 07 00 00 00 	mov    DWORD PTR [ebp-0x2c],0x7
10010d63:	66 89 45 c0          	mov    WORD PTR [ebp-0x40],ax
10010d67:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
10010d6a:	8d 4d 8c             	lea    ecx,[ebp-0x74]
10010d6d:	88 45 fc             	mov    BYTE PTR [ebp-0x4],al
10010d70:	e8 6b 10 00 00       	call   0x10011de0
10010d75:	83 7d a4 08          	cmp    DWORD PTR [ebp-0x5c],0x8
10010d79:	8d 45 90             	lea    eax,[ebp-0x70]
10010d7c:	8b cf                	mov    ecx,edi
10010d7e:	0f 43 45 90          	cmovae eax,DWORD PTR [ebp-0x70]
10010d82:	50                   	push   eax
10010d83:	e8 78 0f 00 00       	call   0x10011d00
10010d88:	8b 4d a4             	mov    ecx,DWORD PTR [ebp-0x5c]
10010d8b:	83 f9 08             	cmp    ecx,0x8
10010d8e:	72 0f                	jb     0x10010d9f
10010d90:	6a 02                	push   0x2
10010d92:	41                   	inc    ecx
10010d93:	51                   	push   ecx
10010d94:	ff 75 90             	push   DWORD PTR [ebp-0x70]
10010d97:	e8 e4 0e ff ff       	call   0x10001c80
10010d9c:	83 c4 0c             	add    esp,0xc
10010d9f:	8b c7                	mov    eax,edi
10010da1:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10010da4:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10010dab:	59                   	pop    ecx
10010dac:	5f                   	pop    edi
10010dad:	5e                   	pop    esi
10010dae:	8b 4d f0             	mov    ecx,DWORD PTR [ebp-0x10]
10010db1:	33 cd                	xor    ecx,ebp
10010db3:	e8 95 3f 00 00       	call   0x10014d4d
10010db8:	8b e5                	mov    esp,ebp
10010dba:	5d                   	pop    ebp
10010dbb:	c2 04 00             	ret    0x4
10010dbe:	cc                   	int3
10010dbf:	cc                   	int3

; ---- AIEBinaryLink::getRange ----
1000d070:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
1000d073:	8b 40 2c             	mov    eax,DWORD PTR [eax+0x2c]
1000d076:	c3                   	ret
1000d077:	cc                   	int3
1000d078:	cc                   	int3
1000d079:	cc                   	int3
1000d07a:	cc                   	int3
1000d07b:	cc                   	int3
1000d07c:	cc                   	int3
1000d07d:	cc                   	int3
1000d07e:	cc                   	int3
1000d07f:	cc                   	int3

; ---- AIEBinaryLink::setRange ----
1000d1b0:	55                   	push   ebp
1000d1b1:	8b ec                	mov    ebp,esp
1000d1b3:	8b 49 04             	mov    ecx,DWORD PTR [ecx+0x4]
1000d1b6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000d1b9:	89 41 2c             	mov    DWORD PTR [ecx+0x2c],eax
1000d1bc:	5d                   	pop    ebp
1000d1bd:	c2 04 00             	ret    0x4
; ---- Decoded .rdata UTF-16LE literals referenced by getCode/getName ----
100174a4: ; UTF-16LE "Компоновка " (11 code units incl. trailing space)
100174c0: ; UTF-16LE "Состав " (7 code units incl. trailing space)
100174d0: ; UTF-16LE "Упорядочивание " (15 code units incl. trailing space)
100174f0: ; UTF-16LE "-" (missing-endpoint placeholder)
