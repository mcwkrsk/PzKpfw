; MAIWmodels.dll — exact-address disassembly excerpts used by docs/07_maiwmodels_abi.md
; Image base: 0x10000000. Tool: GNU objdump -d -Mintel.
; Each excerpt is clipped to a reviewed function / constructor range.
; These are machine-code evidence snippets, not recovered original C++.

;; ==== AElementPrivate default constructor (RVA 0x2e20; bounded through ret) ====
/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/MAIWmodels.dll:     file format pei-i386
10002e20 <.text+0x1e20>:
10002e20:	55                   	push   ebp
10002e21:	8b ec                	mov    ebp,esp
10002e23:	6a ff                	push   0xffffffff
10002e25:	68 7b 65 01 10       	push   0x1001657b
10002e2a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10002e30:	50                   	push   eax
10002e31:	51                   	push   ecx
10002e32:	56                   	push   esi
10002e33:	a1 04 10 02 10       	mov    eax,ds:0x10021004
10002e38:	33 c5                	xor    eax,ebp
10002e3a:	50                   	push   eax
10002e3b:	8d 45 f4             	lea    eax,[ebp-0xc]
10002e3e:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10002e44:	8b f1                	mov    esi,ecx
10002e46:	89 75 f0             	mov    DWORD PTR [ebp-0x10],esi
10002e49:	68 e0 71 01 10       	push   0x100171e0
10002e4e:	8d 4e 08             	lea    ecx,[esi+0x8]
10002e51:	c7 06 dc 71 01 10    	mov    DWORD PTR [esi],0x100171dc
10002e57:	c7 46 04 00 00 00 00 	mov    DWORD PTR [esi+0x4],0x0
10002e5e:	e8 9d ee 00 00       	call   0x10011d00
10002e63:	68 e0 71 01 10       	push   0x100171e0
10002e68:	8d 4e 0c             	lea    ecx,[esi+0xc]
10002e6b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10002e72:	e8 89 ee 00 00       	call   0x10011d00
10002e77:	c7 46 10 00 00 00 00 	mov    DWORD PTR [esi+0x10],0x0
10002e7e:	8b c6                	mov    eax,esi
10002e80:	c7 46 14 00 00 00 00 	mov    DWORD PTR [esi+0x14],0x0
10002e87:	c7 46 18 00 00 00 00 	mov    DWORD PTR [esi+0x18],0x0
10002e8e:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10002e91:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10002e98:	59                   	pop    ecx
10002e99:	5e                   	pop    esi
10002e9a:	8b e5                	mov    esp,ebp
10002e9c:	5d                   	pop    ebp
10002e9d:	c3                   	ret
10002e9e:	cc                   	int3
10002e9f:	cc                   	int3

;; ==== AElement::getId (RVA 0x3b60) ====
10003b60 <.text+0x2b60>:
10003b60:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
10003b63:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
10003b66:	c3                   	ret
10003b67:	cc                   	int3
10003b68:	cc                   	int3
10003b69:	cc                   	int3
10003b6a:	cc                   	int3
10003b6b:	cc                   	int3
10003b6c:	cc                   	int3
10003b6d:	cc                   	int3
10003b6e:	cc                   	int3
10003b6f:	cc                   	int3

;; ==== AElement::getName (RVA 0x3b70) ====
10003b70 <.text+0x2b70>:
10003b70:	55                   	push   ebp
10003b71:	8b ec                	mov    ebp,esp
10003b73:	51                   	push   ecx
10003b74:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
10003b77:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
10003b7a:	83 c0 08             	add    eax,0x8
10003b7d:	50                   	push   eax
10003b7e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10003b85:	e8 d6 e0 00 00       	call   0x10011c60
10003b8a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10003b8d:	8b e5                	mov    esp,ebp
10003b8f:	5d                   	pop    ebp
10003b90:	c2 04 00             	ret    0x4

;; ==== AElement::getBinaryLinksCount (RVA 0x3aa0) ====
10003aa0 <.text+0x2aa0>:
10003aa0:	8b 49 04             	mov    ecx,DWORD PTR [ecx+0x4]
10003aa3:	8b 41 14             	mov    eax,DWORD PTR [ecx+0x14]
10003aa6:	2b 41 10             	sub    eax,DWORD PTR [ecx+0x10]
10003aa9:	c1 f8 02             	sar    eax,0x2
10003aac:	c3                   	ret
10003aad:	cc                   	int3
10003aae:	cc                   	int3
10003aaf:	cc                   	int3

;; ==== AEBinaryLink::getElement (RVA 0x3160) ====
10003160 <.text+0x2160>:
10003160:	55                   	push   ebp
10003161:	8b ec                	mov    ebp,esp
10003163:	8b 49 04             	mov    ecx,DWORD PTR [ecx+0x4]
10003166:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10003169:	8b 44 81 1c          	mov    eax,DWORD PTR [ecx+eax*4+0x1c]
1000316d:	5d                   	pop    ebp
1000316e:	c2 04 00             	ret    0x4
10003171:	cc                   	int3
10003172:	cc                   	int3
10003173:	cc                   	int3
10003174:	cc                   	int3
10003175:	cc                   	int3
10003176:	cc                   	int3
10003177:	cc                   	int3
10003178:	cc                   	int3
10003179:	cc                   	int3
1000317a:	cc                   	int3
1000317b:	cc                   	int3
1000317c:	cc                   	int3
1000317d:	cc                   	int3
1000317e:	cc                   	int3
1000317f:	cc                   	int3

;; ==== AEBinaryLink::getType (RVA 0x3180) ====
10003180 <.text+0x2180>:
10003180:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
10003183:	8b 40 28             	mov    eax,DWORD PTR [eax+0x28]
10003186:	c3                   	ret
10003187:	cc                   	int3
10003188:	cc                   	int3
10003189:	cc                   	int3
1000318a:	cc                   	int3
1000318b:	cc                   	int3
1000318c:	cc                   	int3
1000318d:	cc                   	int3
1000318e:	cc                   	int3
1000318f:	cc                   	int3

;; ==== AEBinaryLink::setType (RVA 0x3310) ====
10003310 <.text+0x2310>:
10003310:	55                   	push   ebp
10003311:	8b ec                	mov    ebp,esp
10003313:	8b 49 04             	mov    ecx,DWORD PTR [ecx+0x4]
10003316:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10003319:	89 41 28             	mov    DWORD PTR [ecx+0x28],eax
1000331c:	5d                   	pop    ebp
1000331d:	c2 04 00             	ret    0x4

;; ==== AFEBinaryLink endpoint accessors (RVA 0x4330..0x4360) ====
10004330 <.text+0x3330>:
10004330:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
10004333:	8b 40 1c             	mov    eax,DWORD PTR [eax+0x1c]
10004336:	c3                   	ret
10004337:	cc                   	int3
10004338:	cc                   	int3
10004339:	cc                   	int3
1000433a:	cc                   	int3
1000433b:	cc                   	int3
1000433c:	cc                   	int3
1000433d:	cc                   	int3
1000433e:	cc                   	int3
1000433f:	cc                   	int3
10004340:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
10004343:	8b 40 20             	mov    eax,DWORD PTR [eax+0x20]
10004346:	c3                   	ret
10004347:	cc                   	int3
10004348:	cc                   	int3
10004349:	cc                   	int3
1000434a:	cc                   	int3
1000434b:	cc                   	int3
1000434c:	cc                   	int3
1000434d:	cc                   	int3
1000434e:	cc                   	int3
1000434f:	cc                   	int3
10004350:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
10004353:	8b 40 24             	mov    eax,DWORD PTR [eax+0x24]
10004356:	c3                   	ret
10004357:	cc                   	int3
10004358:	cc                   	int3
10004359:	cc                   	int3
1000435a:	cc                   	int3
1000435b:	cc                   	int3
1000435c:	cc                   	int3
1000435d:	cc                   	int3
1000435e:	cc                   	int3
1000435f:	cc                   	int3

;; ==== AFElement::getAltCount (RVA 0x8390) ====
10008390 <.text+0x7390>:
10008390:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
10008393:	8b 88 90 00 00 00    	mov    ecx,DWORD PTR [eax+0x90]
10008399:	2b 88 8c 00 00 00    	sub    ecx,DWORD PTR [eax+0x8c]
1000839f:	b8 ab aa aa 2a       	mov    eax,0x2aaaaaab
100083a4:	f7 e9                	imul   ecx
100083a6:	c1 fa 02             	sar    edx,0x2
100083a9:	8b c2                	mov    eax,edx
100083ab:	c1 e8 1f             	shr    eax,0x1f
100083ae:	03 c2                	add    eax,edx
100083b0:	c3                   	ret
100083b1:	cc                   	int3
100083b2:	cc                   	int3
100083b3:	cc                   	int3
100083b4:	cc                   	int3
100083b5:	cc                   	int3
100083b6:	cc                   	int3
100083b7:	cc                   	int3
100083b8:	cc                   	int3
100083b9:	cc                   	int3
100083ba:	cc                   	int3
100083bb:	cc                   	int3
100083bc:	cc                   	int3
100083bd:	cc                   	int3
100083be:	cc                   	int3
100083bf:	cc                   	int3

;; ==== AFElement::getChilds (RVA 0x8aa0) ====
10008aa0 <.text+0x7aa0>:
10008aa0:	55                   	push   ebp
10008aa1:	8b ec                	mov    ebp,esp
10008aa3:	8b 49 04             	mov    ecx,DWORD PTR [ecx+0x4]
10008aa6:	8d 45 f4             	lea    eax,[ebp-0xc]
10008aa9:	83 ec 18             	sub    esp,0x18
10008aac:	83 c1 6c             	add    ecx,0x6c
10008aaf:	56                   	push   esi
10008ab0:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10008ab3:	50                   	push   eax
10008ab4:	8d 45 e8             	lea    eax,[ebp-0x18]
10008ab7:	50                   	push   eax
10008ab8:	e8 93 f4 ff ff       	call   0x10007f50
10008abd:	8b c8                	mov    ecx,eax
10008abf:	e8 4c e0 ff ff       	call   0x10006b10
10008ac4:	8b f0                	mov    esi,eax
10008ac6:	8b 06                	mov    eax,DWORD PTR [esi]
10008ac8:	85 c0                	test   eax,eax
10008aca:	74 02                	je     0x10008ace
10008acc:	8b 00                	mov    eax,DWORD PTR [eax]
10008ace:	8b 76 08             	mov    esi,DWORD PTR [esi+0x8]
10008ad1:	8b d6                	mov    edx,esi
10008ad3:	8b 48 08             	mov    ecx,DWORD PTR [eax+0x8]
10008ad6:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
10008ad9:	49                   	dec    ecx
10008ada:	c1 ea 02             	shr    edx,0x2
10008add:	23 d1                	and    edx,ecx
10008adf:	83 e6 03             	and    esi,0x3
10008ae2:	8b 04 90             	mov    eax,DWORD PTR [eax+edx*4]
10008ae5:	8b 04 b0             	mov    eax,DWORD PTR [eax+esi*4]
10008ae8:	5e                   	pop    esi
10008ae9:	8b e5                	mov    esp,ebp
10008aeb:	5d                   	pop    ebp
10008aec:	c2 04 00             	ret    0x4
10008aef:	cc                   	int3

;; ==== AFElement::getNumber (RVA 0x96a0) ====
100096a0 <.text+0x86a0>:
100096a0:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
100096a3:	8b 40 54             	mov    eax,DWORD PTR [eax+0x54]
100096a6:	c3                   	ret
100096a7:	cc                   	int3
100096a8:	cc                   	int3
100096a9:	cc                   	int3
100096aa:	cc                   	int3
100096ab:	cc                   	int3
100096ac:	cc                   	int3
100096ad:	cc                   	int3
100096ae:	cc                   	int3
100096af:	cc                   	int3

;; ==== AFElement::getQueryNumber (RVA 0x9850) ====
10009850 <.text+0x8850>:
10009850:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
10009853:	8b 40 5c             	mov    eax,DWORD PTR [eax+0x5c]
10009856:	c3                   	ret
10009857:	cc                   	int3
10009858:	cc                   	int3
10009859:	cc                   	int3
1000985a:	cc                   	int3
1000985b:	cc                   	int3
1000985c:	cc                   	int3
1000985d:	cc                   	int3
1000985e:	cc                   	int3
1000985f:	cc                   	int3

;; ==== AFElement::getStatus (RVA 0x9860) ====
10009860 <.text+0x8860>:
10009860:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
10009863:	8b 80 84 00 00 00    	mov    eax,DWORD PTR [eax+0x84]
10009869:	c3                   	ret
1000986a:	cc                   	int3
1000986b:	cc                   	int3
1000986c:	cc                   	int3
1000986d:	cc                   	int3
1000986e:	cc                   	int3
1000986f:	cc                   	int3

;; ==== AFElement::getStructureSymbols (RVA 0x9870) ====
10009870 <.text+0x8870>:
10009870:	55                   	push   ebp
10009871:	8b ec                	mov    ebp,esp
10009873:	51                   	push   ecx
10009874:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
10009877:	83 c0 38             	add    eax,0x38
1000987a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10009881:	83 78 14 08          	cmp    DWORD PTR [eax+0x14],0x8
10009885:	72 02                	jb     0x10009889
10009887:	8b 00                	mov    eax,DWORD PTR [eax]
10009889:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
1000988c:	50                   	push   eax
1000988d:	e8 6e 84 00 00       	call   0x10011d00
10009892:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10009895:	8b e5                	mov    esp,ebp
10009897:	5d                   	pop    ebp
10009898:	c2 04 00             	ret    0x4
1000989b:	cc                   	int3
1000989c:	cc                   	int3
1000989d:	cc                   	int3
1000989e:	cc                   	int3
1000989f:	cc                   	int3

;; ==== AFElement::getSymbol (RVA 0x98a0) ====
100098a0 <.text+0x88a0>:
100098a0:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
100098a3:	66 8b 40 58          	mov    ax,WORD PTR [eax+0x58]
100098a7:	c3                   	ret
100098a8:	cc                   	int3
100098a9:	cc                   	int3
100098aa:	cc                   	int3
100098ab:	cc                   	int3
100098ac:	cc                   	int3
100098ad:	cc                   	int3
100098ae:	cc                   	int3
100098af:	cc                   	int3

;; ==== AFElement::getType (RVA 0x98b0) ====
100098b0 <.text+0x88b0>:
100098b0:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
100098b3:	8b 80 80 00 00 00    	mov    eax,DWORD PTR [eax+0x80]
100098b9:	c3                   	ret
100098ba:	cc                   	int3
100098bb:	cc                   	int3
100098bc:	cc                   	int3
100098bd:	cc                   	int3
100098be:	cc                   	int3
100098bf:	cc                   	int3

;; ==== AFElement::getFormalization (RVA 0x9300) ====
10009300 <.text+0x8300>:
10009300:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
10009303:	8b 80 88 00 00 00    	mov    eax,DWORD PTR [eax+0x88]
10009309:	c3                   	ret
1000930a:	cc                   	int3
1000930b:	cc                   	int3
1000930c:	cc                   	int3
1000930d:	cc                   	int3
1000930e:	cc                   	int3
1000930f:	cc                   	int3

;; ==== AFElement::getIERolesCount (RVA 0x94e0) ====
100094e0 <.text+0x84e0>:
100094e0:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
100094e3:	8b 48 64             	mov    ecx,DWORD PTR [eax+0x64]
100094e6:	2b 48 60             	sub    ecx,DWORD PTR [eax+0x60]
100094e9:	b8 ab aa aa 2a       	mov    eax,0x2aaaaaab
100094ee:	f7 e9                	imul   ecx
100094f0:	d1 fa                	sar    edx,1
100094f2:	8b c2                	mov    eax,edx
100094f4:	c1 e8 1f             	shr    eax,0x1f
100094f7:	03 c2                	add    eax,edx
100094f9:	c3                   	ret
100094fa:	cc                   	int3
100094fb:	cc                   	int3
100094fc:	cc                   	int3
100094fd:	cc                   	int3
100094fe:	cc                   	int3
100094ff:	cc                   	int3

;; ==== AFElement::setFormalization (RVA 0x9d40) ====
10009d40 <.text+0x8d40>:
10009d40:	55                   	push   ebp
10009d41:	8b ec                	mov    ebp,esp
10009d43:	8b 49 04             	mov    ecx,DWORD PTR [ecx+0x4]
10009d46:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10009d49:	89 81 88 00 00 00    	mov    DWORD PTR [ecx+0x88],eax
10009d4f:	5d                   	pop    ebp
10009d50:	c2 04 00             	ret    0x4
10009d53:	cc                   	int3
10009d54:	cc                   	int3
10009d55:	cc                   	int3
10009d56:	cc                   	int3
10009d57:	cc                   	int3
10009d58:	cc                   	int3
10009d59:	cc                   	int3
10009d5a:	cc                   	int3
10009d5b:	cc                   	int3
10009d5c:	cc                   	int3
10009d5d:	cc                   	int3
10009d5e:	cc                   	int3
10009d5f:	cc                   	int3

;; ==== AFElement::setStatus (RVA 0x9d60) ====
10009d60 <.text+0x8d60>:
10009d60:	55                   	push   ebp
10009d61:	8b ec                	mov    ebp,esp
10009d63:	8b 49 04             	mov    ecx,DWORD PTR [ecx+0x4]
10009d66:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10009d69:	89 81 84 00 00 00    	mov    DWORD PTR [ecx+0x84],eax
10009d6f:	5d                   	pop    ebp
10009d70:	c2 04 00             	ret    0x4
10009d73:	cc                   	int3
10009d74:	cc                   	int3
10009d75:	cc                   	int3
10009d76:	cc                   	int3
10009d77:	cc                   	int3
10009d78:	cc                   	int3
10009d79:	cc                   	int3
10009d7a:	cc                   	int3
10009d7b:	cc                   	int3
10009d7c:	cc                   	int3
10009d7d:	cc                   	int3
10009d7e:	cc                   	int3
10009d7f:	cc                   	int3

;; ==== AFElement::setSymbol (RVA 0x9e90) ====
10009e90 <.text+0x8e90>:
10009e90:	55                   	push   ebp
10009e91:	8b ec                	mov    ebp,esp
10009e93:	66 0f be 55 08       	movsx  dx,BYTE PTR [ebp+0x8]
10009e98:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
10009e9b:	66 89 50 58          	mov    WORD PTR [eax+0x58],dx
10009e9f:	5d                   	pop    ebp
10009ea0:	c2 04 00             	ret    0x4
10009ea3:	cc                   	int3
10009ea4:	cc                   	int3
10009ea5:	cc                   	int3
10009ea6:	cc                   	int3
10009ea7:	cc                   	int3
10009ea8:	cc                   	int3
10009ea9:	cc                   	int3
10009eaa:	cc                   	int3
10009eab:	cc                   	int3
10009eac:	cc                   	int3
10009ead:	cc                   	int3
10009eae:	cc                   	int3
10009eaf:	cc                   	int3

;; ==== AFElement::setType (RVA 0x9eb0) ====
10009eb0 <.text+0x8eb0>:
10009eb0:	55                   	push   ebp
10009eb1:	8b ec                	mov    ebp,esp
10009eb3:	8b 49 04             	mov    ecx,DWORD PTR [ecx+0x4]
10009eb6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10009eb9:	89 81 80 00 00 00    	mov    DWORD PTR [ecx+0x80],eax
10009ebf:	5d                   	pop    ebp
10009ec0:	c2 04 00             	ret    0x4
10009ec3:	cc                   	int3
10009ec4:	cc                   	int3
10009ec5:	cc                   	int3
10009ec6:	cc                   	int3
10009ec7:	cc                   	int3
10009ec8:	cc                   	int3
10009ec9:	cc                   	int3
10009eca:	cc                   	int3
10009ecb:	cc                   	int3
10009ecc:	cc                   	int3
10009ecd:	cc                   	int3
10009ece:	cc                   	int3
10009ecf:	cc                   	int3

;; ==== AFStructure::getAFElement (RVA 0xb2e0) ====
1000b2e0 <.text+0xa2e0>:
1000b2e0:	55                   	push   ebp
1000b2e1:	8b ec                	mov    ebp,esp
1000b2e3:	8b 41 0c             	mov    eax,DWORD PTR [ecx+0xc]
1000b2e6:	8b 48 04             	mov    ecx,DWORD PTR [eax+0x4]
1000b2e9:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000b2ec:	8b 04 81             	mov    eax,DWORD PTR [ecx+eax*4]
1000b2ef:	5d                   	pop    ebp
1000b2f0:	c2 04 00             	ret    0x4
1000b2f3:	cc                   	int3
1000b2f4:	cc                   	int3
1000b2f5:	cc                   	int3
1000b2f6:	cc                   	int3
1000b2f7:	cc                   	int3
1000b2f8:	cc                   	int3
1000b2f9:	cc                   	int3
1000b2fa:	cc                   	int3
1000b2fb:	cc                   	int3
1000b2fc:	cc                   	int3
1000b2fd:	cc                   	int3
1000b2fe:	cc                   	int3
1000b2ff:	cc                   	int3

;; ==== AFStructure::getElementsCount (RVA 0xb730) ====
1000b730 <.text+0xa730>:
1000b730:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
1000b733:	8b 41 08             	mov    eax,DWORD PTR [ecx+0x8]
1000b736:	2b 41 04             	sub    eax,DWORD PTR [ecx+0x4]
1000b739:	c1 f8 02             	sar    eax,0x2
1000b73c:	c3                   	ret
1000b73d:	cc                   	int3
1000b73e:	cc                   	int3
1000b73f:	cc                   	int3

;; ==== AFStructure::getLink (RVA 0xb740) ====
1000b740 <.text+0xa740>:
1000b740:	55                   	push   ebp
1000b741:	8b ec                	mov    ebp,esp
1000b743:	8b 41 0c             	mov    eax,DWORD PTR [ecx+0xc]
1000b746:	8b 48 10             	mov    ecx,DWORD PTR [eax+0x10]
1000b749:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000b74c:	8b 04 81             	mov    eax,DWORD PTR [ecx+eax*4]
1000b74f:	5d                   	pop    ebp
1000b750:	c2 04 00             	ret    0x4
1000b753:	cc                   	int3
1000b754:	cc                   	int3
1000b755:	cc                   	int3
1000b756:	cc                   	int3
1000b757:	cc                   	int3
1000b758:	cc                   	int3
1000b759:	cc                   	int3
1000b75a:	cc                   	int3
1000b75b:	cc                   	int3
1000b75c:	cc                   	int3
1000b75d:	cc                   	int3
1000b75e:	cc                   	int3
1000b75f:	cc                   	int3

;; ==== AFStructure::getLinksCount (RVA 0x14be0) ====
10014be0 <.text+0x13be0>:
10014be0:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
10014be3:	8b 41 14             	mov    eax,DWORD PTR [ecx+0x14]
10014be6:	2b 41 10             	sub    eax,DWORD PTR [ecx+0x10]
10014be9:	c1 f8 02             	sar    eax,0x2
10014bec:	c3                   	ret
10014bed:	cc                   	int3
10014bee:	cc                   	int3
10014bef:	cc                   	int3

;; ==== AFStructure::addAFElement (RVA 0xad90) ====
1000ad90 <.text+0x9d90>:
1000ad90:	55                   	push   ebp
1000ad91:	8b ec                	mov    ebp,esp
1000ad93:	51                   	push   ecx
1000ad94:	56                   	push   esi
1000ad95:	8b f1                	mov    esi,ecx
1000ad97:	8b 06                	mov    eax,DWORD PTR [esi]
1000ad99:	ff 50 04             	call   DWORD PTR [eax+0x4]
1000ad9c:	8b 4e 0c             	mov    ecx,DWORD PTR [esi+0xc]
1000ad9f:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
1000ada2:	83 c1 04             	add    ecx,0x4
1000ada5:	8d 45 fc             	lea    eax,[ebp-0x4]
1000ada8:	50                   	push   eax
1000ada9:	e8 b2 7c ff ff       	call   0x10002a60
1000adae:	8b 4e 0c             	mov    ecx,DWORD PTR [esi+0xc]
1000adb1:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
1000adb4:	5e                   	pop    esi
1000adb5:	ff 41 24             	inc    DWORD PTR [ecx+0x24]
1000adb8:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
1000adbb:	8b 49 24             	mov    ecx,DWORD PTR [ecx+0x24]
1000adbe:	89 4a 04             	mov    DWORD PTR [edx+0x4],ecx
1000adc1:	8b e5                	mov    esp,ebp
1000adc3:	5d                   	pop    ebp
1000adc4:	c3                   	ret
1000adc5:	cc                   	int3
1000adc6:	cc                   	int3
1000adc7:	cc                   	int3
1000adc8:	cc                   	int3
1000adc9:	cc                   	int3
1000adca:	cc                   	int3
1000adcb:	cc                   	int3
1000adcc:	cc                   	int3
1000adcd:	cc                   	int3
1000adce:	cc                   	int3
1000adcf:	cc                   	int3

;; ==== AIElement::getCodingType (RVA 0xd360) ====
1000d360 <.text+0xc360>:
1000d360:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
1000d363:	8b 40 3c             	mov    eax,DWORD PTR [eax+0x3c]
1000d366:	c3                   	ret
1000d367:	cc                   	int3
1000d368:	cc                   	int3
1000d369:	cc                   	int3
1000d36a:	cc                   	int3
1000d36b:	cc                   	int3
1000d36c:	cc                   	int3
1000d36d:	cc                   	int3
1000d36e:	cc                   	int3
1000d36f:	cc                   	int3

;; ==== AIElement::isAdded (RVA 0xd370) ====
1000d370 <.text+0xc370>:
1000d370:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
1000d373:	8a 40 1c             	mov    al,BYTE PTR [eax+0x1c]
1000d376:	c3                   	ret
1000d377:	cc                   	int3
1000d378:	cc                   	int3
1000d379:	cc                   	int3
1000d37a:	cc                   	int3
1000d37b:	cc                   	int3
1000d37c:	cc                   	int3
1000d37d:	cc                   	int3
1000d37e:	cc                   	int3
1000d37f:	cc                   	int3

;; ==== AIStructure::getAIEBinaryLink (RVA 0xe2c0) ====
1000e2c0 <.text+0xd2c0>:
1000e2c0:	55                   	push   ebp
1000e2c1:	8b ec                	mov    ebp,esp
1000e2c3:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
1000e2c6:	8b 48 20             	mov    ecx,DWORD PTR [eax+0x20]
1000e2c9:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000e2cc:	8b 04 81             	mov    eax,DWORD PTR [ecx+eax*4]
1000e2cf:	5d                   	pop    ebp
1000e2d0:	c2 04 00             	ret    0x4
1000e2d3:	cc                   	int3
1000e2d4:	cc                   	int3
1000e2d5:	cc                   	int3
1000e2d6:	cc                   	int3
1000e2d7:	cc                   	int3
1000e2d8:	cc                   	int3
1000e2d9:	cc                   	int3
1000e2da:	cc                   	int3
1000e2db:	cc                   	int3
1000e2dc:	cc                   	int3
1000e2dd:	cc                   	int3
1000e2de:	cc                   	int3
1000e2df:	cc                   	int3

;; ==== AIStructure::getAIElement (RVA 0xe2e0) ====
1000e2e0 <.text+0xd2e0>:
1000e2e0:	55                   	push   ebp
1000e2e1:	8b ec                	mov    ebp,esp
1000e2e3:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
1000e2e6:	8b 48 14             	mov    ecx,DWORD PTR [eax+0x14]
1000e2e9:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000e2ec:	8b 04 81             	mov    eax,DWORD PTR [ecx+eax*4]
1000e2ef:	5d                   	pop    ebp
1000e2f0:	c2 04 00             	ret    0x4
1000e2f3:	cc                   	int3
1000e2f4:	cc                   	int3
1000e2f5:	cc                   	int3
1000e2f6:	cc                   	int3
1000e2f7:	cc                   	int3
1000e2f8:	cc                   	int3
1000e2f9:	cc                   	int3
1000e2fa:	cc                   	int3
1000e2fb:	cc                   	int3
1000e2fc:	cc                   	int3
1000e2fd:	cc                   	int3
1000e2fe:	cc                   	int3
1000e2ff:	cc                   	int3

;; ==== AIStructure::elementsCount (RVA 0xdf20) ====
1000df20 <.text+0xcf20>:
1000df20:	8b 49 04             	mov    ecx,DWORD PTR [ecx+0x4]
1000df23:	8b 41 18             	mov    eax,DWORD PTR [ecx+0x18]
1000df26:	2b 41 14             	sub    eax,DWORD PTR [ecx+0x14]
1000df29:	c1 f8 02             	sar    eax,0x2
1000df2c:	c3                   	ret
1000df2d:	cc                   	int3
1000df2e:	cc                   	int3
1000df2f:	cc                   	int3

;; ==== AIStructure::linksCount (RVA 0xe360) ====
1000e360 <.text+0xd360>:
1000e360:	8b 49 04             	mov    ecx,DWORD PTR [ecx+0x4]
1000e363:	8b 41 24             	mov    eax,DWORD PTR [ecx+0x24]
1000e366:	2b 41 20             	sub    eax,DWORD PTR [ecx+0x20]
1000e369:	c1 f8 02             	sar    eax,0x2
1000e36c:	c3                   	ret
1000e36d:	cc                   	int3
1000e36e:	cc                   	int3
1000e36f:	cc                   	int3

;; ==== AbstractModel::getContentStructureCount (RVA 0x1fb0) ====
10001fb0 <.text+0xfb0>:
10001fb0:	8b 49 04             	mov    ecx,DWORD PTR [ecx+0x4]
10001fb3:	8b 41 20             	mov    eax,DWORD PTR [ecx+0x20]
10001fb6:	2b 41 1c             	sub    eax,DWORD PTR [ecx+0x1c]
10001fb9:	c1 f8 02             	sar    eax,0x2
10001fbc:	c3                   	ret
10001fbd:	cc                   	int3
10001fbe:	cc                   	int3
10001fbf:	cc                   	int3

;; ==== AbstractModel::getDynamicStructure (RVA 0x1fc0) ====
10001fc0 <.text+0xfc0>:
10001fc0:	55                   	push   ebp
10001fc1:	8b ec                	mov    ebp,esp
10001fc3:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
10001fc6:	8b 48 10             	mov    ecx,DWORD PTR [eax+0x10]
10001fc9:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10001fcc:	8b 04 81             	mov    eax,DWORD PTR [ecx+eax*4]
10001fcf:	5d                   	pop    ebp
10001fd0:	c2 04 00             	ret    0x4
10001fd3:	cc                   	int3
10001fd4:	cc                   	int3
10001fd5:	cc                   	int3
10001fd6:	cc                   	int3
10001fd7:	cc                   	int3
10001fd8:	cc                   	int3
10001fd9:	cc                   	int3
10001fda:	cc                   	int3
10001fdb:	cc                   	int3
10001fdc:	cc                   	int3
10001fdd:	cc                   	int3
10001fde:	cc                   	int3
10001fdf:	cc                   	int3

;; ==== AbstractModel::getStaticStructure (RVA 0x1fe0) ====
10001fe0 <.text+0xfe0>:
10001fe0:	55                   	push   ebp
10001fe1:	8b ec                	mov    ebp,esp
10001fe3:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
10001fe6:	8b 48 04             	mov    ecx,DWORD PTR [eax+0x4]
10001fe9:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10001fec:	8b 04 81             	mov    eax,DWORD PTR [ecx+eax*4]
10001fef:	5d                   	pop    ebp
10001ff0:	c2 04 00             	ret    0x4
10001ff3:	cc                   	int3
10001ff4:	cc                   	int3
10001ff5:	cc                   	int3
10001ff6:	cc                   	int3
10001ff7:	cc                   	int3
10001ff8:	cc                   	int3
10001ff9:	cc                   	int3
10001ffa:	cc                   	int3
10001ffb:	cc                   	int3
10001ffc:	cc                   	int3
10001ffd:	cc                   	int3
10001ffe:	cc                   	int3
10001fff:	cc                   	int3

;; ==== AbstractModel::getStaticStructureCount (RVA 0x2000) ====
10002000 <.text+0x1000>:
10002000:	8b 49 04             	mov    ecx,DWORD PTR [ecx+0x4]
10002003:	8b 41 08             	mov    eax,DWORD PTR [ecx+0x8]
10002006:	2b 41 04             	sub    eax,DWORD PTR [ecx+0x4]
10002009:	c1 f8 02             	sar    eax,0x2
1000200c:	c3                   	ret
1000200d:	cc                   	int3
1000200e:	cc                   	int3
1000200f:	cc                   	int3

;; ==== AFElementPrivate constructor (RVA 0x61d0) ====
100061d0 <.text+0x51d0>:
100061d0:	55                   	push   ebp
100061d1:	8b ec                	mov    ebp,esp
100061d3:	6a ff                	push   0xffffffff
100061d5:	68 e4 5f 01 10       	push   0x10015fe4
100061da:	64 a1 00 00 00 00    	mov    eax,fs:0x0
100061e0:	50                   	push   eax
100061e1:	83 ec 08             	sub    esp,0x8
100061e4:	56                   	push   esi
100061e5:	57                   	push   edi
100061e6:	a1 04 10 02 10       	mov    eax,ds:0x10021004
100061eb:	33 c5                	xor    eax,ebp
100061ed:	50                   	push   eax
100061ee:	8d 45 f4             	lea    eax,[ebp-0xc]
100061f1:	64 a3 00 00 00 00    	mov    fs:0x0,eax
100061f7:	8b f1                	mov    esi,ecx
100061f9:	89 75 f0             	mov    DWORD PTR [ebp-0x10],esi
100061fc:	68 e0 71 01 10       	push   0x100171e0
10006201:	8d 4e 08             	lea    ecx,[esi+0x8]
10006204:	c7 06 dc 71 01 10    	mov    DWORD PTR [esi],0x100171dc
1000620a:	c7 46 04 00 00 00 00 	mov    DWORD PTR [esi+0x4],0x0
10006211:	e8 ea ba 00 00       	call   0x10011d00
10006216:	68 e0 71 01 10       	push   0x100171e0
1000621b:	8d 4e 0c             	lea    ecx,[esi+0xc]
1000621e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10006225:	e8 d6 ba 00 00       	call   0x10011d00
1000622a:	c7 46 10 00 00 00 00 	mov    DWORD PTR [esi+0x10],0x0
10006231:	c7 46 14 00 00 00 00 	mov    DWORD PTR [esi+0x14],0x0
10006238:	c7 46 18 00 00 00 00 	mov    DWORD PTR [esi+0x18],0x0
1000623f:	8d 46 20             	lea    eax,[esi+0x20]
10006242:	c7 06 78 72 01 10    	mov    DWORD PTR [esi],0x10017278
10006248:	c7 40 14 07 00 00 00 	mov    DWORD PTR [eax+0x14],0x7
1000624f:	c7 40 10 00 00 00 00 	mov    DWORD PTR [eax+0x10],0x0
10006256:	83 78 14 08          	cmp    DWORD PTR [eax+0x14],0x8
1000625a:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [ebp-0x4],0x1
10006261:	72 02                	jb     0x10006265
10006263:	8b 00                	mov    eax,DWORD PTR [eax]
10006265:	33 c9                	xor    ecx,ecx
10006267:	66 89 08             	mov    WORD PTR [eax],cx
1000626a:	8d 46 38             	lea    eax,[esi+0x38]
1000626d:	c7 40 14 07 00 00 00 	mov    DWORD PTR [eax+0x14],0x7
10006274:	89 48 10             	mov    DWORD PTR [eax+0x10],ecx
10006277:	83 78 14 08          	cmp    DWORD PTR [eax+0x14],0x8
1000627b:	72 02                	jb     0x1000627f
1000627d:	8b 00                	mov    eax,DWORD PTR [eax]
1000627f:	33 c9                	xor    ecx,ecx
10006281:	66 89 08             	mov    WORD PTR [eax],cx
10006284:	89 4e 60             	mov    DWORD PTR [esi+0x60],ecx
10006287:	89 4e 64             	mov    DWORD PTR [esi+0x64],ecx
1000628a:	89 4e 68             	mov    DWORD PTR [esi+0x68],ecx
1000628d:	8d 7e 6c             	lea    edi,[esi+0x6c]
10006290:	c6 45 fc 04          	mov    BYTE PTR [ebp-0x4],0x4
10006294:	6a 08                	push   0x8
10006296:	89 7d ec             	mov    DWORD PTR [ebp-0x14],edi
10006299:	89 0f                	mov    DWORD PTR [edi],ecx
1000629b:	89 4f 04             	mov    DWORD PTR [edi+0x4],ecx
1000629e:	89 4f 08             	mov    DWORD PTR [edi+0x8],ecx
100062a1:	89 4f 0c             	mov    DWORD PTR [edi+0xc],ecx
100062a4:	89 4f 10             	mov    DWORD PTR [edi+0x10],ecx
100062a7:	e8 44 ea 00 00       	call   0x10014cf0
100062ac:	83 c4 04             	add    esp,0x4
100062af:	85 c0                	test   eax,eax
100062b1:	75 06                	jne    0x100062b9
100062b3:	ff 15 b8 70 01 10    	call   DWORD PTR ds:0x100170b8
100062b9:	89 07                	mov    DWORD PTR [edi],eax
100062bb:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
100062c1:	c7 40 04 00 00 00 00 	mov    DWORD PTR [eax+0x4],0x0
100062c8:	8b 07                	mov    eax,DWORD PTR [edi]
100062ca:	89 38                	mov    DWORD PTR [eax],edi
100062cc:	8b c6                	mov    eax,esi
100062ce:	c7 86 8c 00 00 00 00 	mov    DWORD PTR [esi+0x8c],0x0
100062d5:	00 00 00 
100062d8:	c7 86 90 00 00 00 00 	mov    DWORD PTR [esi+0x90],0x0
100062df:	00 00 00 
100062e2:	c7 86 94 00 00 00 00 	mov    DWORD PTR [esi+0x94],0x0
100062e9:	00 00 00 
100062ec:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
100062ef:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
100062f6:	59                   	pop    ecx
100062f7:	5f                   	pop    edi
100062f8:	5e                   	pop    esi
100062f9:	8b e5                	mov    esp,ebp
100062fb:	5d                   	pop    ebp
100062fc:	c3                   	ret
100062fd:	cc                   	int3
100062fe:	cc                   	int3
100062ff:	cc                   	int3

;; ==== AIElementPrivate constructor (RVA 0xc830) ====
1000c830 <.text+0xb830>:
1000c830:	55                   	push   ebp
1000c831:	8b ec                	mov    ebp,esp
1000c833:	6a ff                	push   0xffffffff
1000c835:	68 7b 65 01 10       	push   0x1001657b
1000c83a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000c840:	50                   	push   eax
1000c841:	51                   	push   ecx
1000c842:	56                   	push   esi
1000c843:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000c848:	33 c5                	xor    eax,ebp
1000c84a:	50                   	push   eax
1000c84b:	8d 45 f4             	lea    eax,[ebp-0xc]
1000c84e:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000c854:	8b f1                	mov    esi,ecx
1000c856:	89 75 f0             	mov    DWORD PTR [ebp-0x10],esi
1000c859:	68 e0 71 01 10       	push   0x100171e0
1000c85e:	8d 4e 08             	lea    ecx,[esi+0x8]
1000c861:	c7 06 dc 71 01 10    	mov    DWORD PTR [esi],0x100171dc
1000c867:	c7 46 04 00 00 00 00 	mov    DWORD PTR [esi+0x4],0x0
1000c86e:	e8 8d 54 00 00       	call   0x10011d00
1000c873:	68 e0 71 01 10       	push   0x100171e0
1000c878:	8d 4e 0c             	lea    ecx,[esi+0xc]
1000c87b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000c882:	e8 79 54 00 00       	call   0x10011d00
1000c887:	c7 46 10 00 00 00 00 	mov    DWORD PTR [esi+0x10],0x0
1000c88e:	8b c6                	mov    eax,esi
1000c890:	c7 46 14 00 00 00 00 	mov    DWORD PTR [esi+0x14],0x0
1000c897:	c7 46 18 00 00 00 00 	mov    DWORD PTR [esi+0x18],0x0
1000c89e:	c7 06 38 73 01 10    	mov    DWORD PTR [esi],0x10017338
1000c8a4:	c7 46 34 0f 00 00 00 	mov    DWORD PTR [esi+0x34],0xf
1000c8ab:	c7 46 30 00 00 00 00 	mov    DWORD PTR [esi+0x30],0x0
1000c8b2:	c6 46 20 00          	mov    BYTE PTR [esi+0x20],0x0
1000c8b6:	c7 46 3c 01 00 00 00 	mov    DWORD PTR [esi+0x3c],0x1
1000c8bd:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000c8c0:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000c8c7:	59                   	pop    ecx
1000c8c8:	5e                   	pop    esi
1000c8c9:	8b e5                	mov    esp,ebp
1000c8cb:	5d                   	pop    ebp
1000c8cc:	c3                   	ret
1000c8cd:	cc                   	int3
1000c8ce:	cc                   	int3
1000c8cf:	cc                   	int3

;; ==== AFStructurePrivate constructor (RVA 0xa6b0) ====
1000a6b0 <.text+0x96b0>:
1000a6b0:	55                   	push   ebp
1000a6b1:	8b ec                	mov    ebp,esp
1000a6b3:	6a ff                	push   0xffffffff
1000a6b5:	68 a6 63 01 10       	push   0x100163a6
1000a6ba:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000a6c0:	50                   	push   eax
1000a6c1:	83 ec 08             	sub    esp,0x8
1000a6c4:	56                   	push   esi
1000a6c5:	57                   	push   edi
1000a6c6:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000a6cb:	33 c5                	xor    eax,ebp
1000a6cd:	50                   	push   eax
1000a6ce:	8d 45 f4             	lea    eax,[ebp-0xc]
1000a6d1:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000a6d7:	8b f9                	mov    edi,ecx
1000a6d9:	89 7d f0             	mov    DWORD PTR [ebp-0x10],edi
1000a6dc:	c7 07 d8 72 01 10    	mov    DWORD PTR [edi],0x100172d8
1000a6e2:	c7 47 04 00 00 00 00 	mov    DWORD PTR [edi+0x4],0x0
1000a6e9:	c7 47 08 00 00 00 00 	mov    DWORD PTR [edi+0x8],0x0
1000a6f0:	c7 47 0c 00 00 00 00 	mov    DWORD PTR [edi+0xc],0x0
1000a6f7:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000a6fe:	c7 47 10 00 00 00 00 	mov    DWORD PTR [edi+0x10],0x0
1000a705:	c7 47 14 00 00 00 00 	mov    DWORD PTR [edi+0x14],0x0
1000a70c:	c7 47 18 00 00 00 00 	mov    DWORD PTR [edi+0x18],0x0
1000a713:	8d 77 1c             	lea    esi,[edi+0x1c]
1000a716:	c6 45 fc 01          	mov    BYTE PTR [ebp-0x4],0x1
1000a71a:	8b ce                	mov    ecx,esi
1000a71c:	89 75 ec             	mov    DWORD PTR [ebp-0x14],esi
1000a71f:	c7 06 00 00 00 00    	mov    DWORD PTR [esi],0x0
1000a725:	c7 46 04 00 00 00 00 	mov    DWORD PTR [esi+0x4],0x0
1000a72c:	e8 df 74 ff ff       	call   0x10001c10
1000a731:	89 06                	mov    DWORD PTR [esi],eax
1000a733:	8b c7                	mov    eax,edi
1000a735:	c7 47 24 00 00 00 00 	mov    DWORD PTR [edi+0x24],0x0
1000a73c:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000a73f:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000a746:	59                   	pop    ecx
1000a747:	5f                   	pop    edi
1000a748:	5e                   	pop    esi
1000a749:	8b e5                	mov    esp,ebp
1000a74b:	5d                   	pop    ebp
1000a74c:	c3                   	ret
1000a74d:	cc                   	int3
1000a74e:	cc                   	int3
1000a74f:	cc                   	int3

;; ==== AIStructurePrivate constructor (RVA 0xd800) ====
1000d800 <.text+0xc800>:
1000d800:	55                   	push   ebp
1000d801:	8b ec                	mov    ebp,esp
1000d803:	51                   	push   ecx
1000d804:	56                   	push   esi
1000d805:	57                   	push   edi
1000d806:	8b f9                	mov    edi,ecx
1000d808:	8d 77 04             	lea    esi,[edi+0x4]
1000d80b:	89 7d fc             	mov    DWORD PTR [ebp-0x4],edi
1000d80e:	8b ce                	mov    ecx,esi
1000d810:	89 75 fc             	mov    DWORD PTR [ebp-0x4],esi
1000d813:	c7 07 60 73 01 10    	mov    DWORD PTR [edi],0x10017360
1000d819:	c7 06 00 00 00 00    	mov    DWORD PTR [esi],0x0
1000d81f:	c7 46 04 00 00 00 00 	mov    DWORD PTR [esi+0x4],0x0
1000d826:	e8 c5 03 00 00       	call   0x1000dbf0
1000d82b:	89 06                	mov    DWORD PTR [esi],eax
1000d82d:	8b c7                	mov    eax,edi
1000d82f:	c7 47 0c 00 00 00 00 	mov    DWORD PTR [edi+0xc],0x0
1000d836:	c7 47 10 00 00 00 00 	mov    DWORD PTR [edi+0x10],0x0
1000d83d:	c7 47 14 00 00 00 00 	mov    DWORD PTR [edi+0x14],0x0
1000d844:	c7 47 18 00 00 00 00 	mov    DWORD PTR [edi+0x18],0x0
1000d84b:	c7 47 1c 00 00 00 00 	mov    DWORD PTR [edi+0x1c],0x0
1000d852:	c7 47 20 00 00 00 00 	mov    DWORD PTR [edi+0x20],0x0
1000d859:	c7 47 24 00 00 00 00 	mov    DWORD PTR [edi+0x24],0x0
1000d860:	c7 47 28 00 00 00 00 	mov    DWORD PTR [edi+0x28],0x0
1000d867:	5f                   	pop    edi
1000d868:	5e                   	pop    esi
1000d869:	8b e5                	mov    esp,ebp
1000d86b:	5d                   	pop    ebp
1000d86c:	c3                   	ret
1000d86d:	cc                   	int3
1000d86e:	cc                   	int3
1000d86f:	cc                   	int3

;; ==== AbstractModelPrivate constructor (RVA 0x1550) ====
10001550 <.text+0x550>:
10001550:	c7 01 48 71 01 10    	mov    DWORD PTR [ecx],0x10017148
10001556:	8b c1                	mov    eax,ecx
10001558:	c7 41 04 00 00 00 00 	mov    DWORD PTR [ecx+0x4],0x0
1000155f:	c7 41 08 00 00 00 00 	mov    DWORD PTR [ecx+0x8],0x0
10001566:	c7 41 0c 00 00 00 00 	mov    DWORD PTR [ecx+0xc],0x0
1000156d:	c7 41 10 00 00 00 00 	mov    DWORD PTR [ecx+0x10],0x0
10001574:	c7 41 14 00 00 00 00 	mov    DWORD PTR [ecx+0x14],0x0
1000157b:	c7 41 18 00 00 00 00 	mov    DWORD PTR [ecx+0x18],0x0
10001582:	c7 41 1c 00 00 00 00 	mov    DWORD PTR [ecx+0x1c],0x0
10001589:	c7 41 20 00 00 00 00 	mov    DWORD PTR [ecx+0x20],0x0
10001590:	c7 41 24 00 00 00 00 	mov    DWORD PTR [ecx+0x24],0x0
10001597:	c3                   	ret

;; ==== VCRUNTIME140 purecall thunk (VA 0x10015aa2) ====
10015a9c <.text+0x14a9c>:
10015a9c:	ff 25 10 70 01 10    	jmp    DWORD PTR ds:0x10017010
10015aa2:	ff 25 48 70 01 10    	jmp    DWORD PTR ds:0x10017048
10015aa8:	ff 25 50 70 01 10    	jmp    DWORD PTR ds:0x10017050

