
/mnt/data/is2_re_analysis_kit_stage1_17_continuation_2026-11-01/original/is.exe:     file format pei-i386


disassembly of section .text:

00402870 <.text+0x1870>:
  402870:	55                   	push   ebp
  402871:	8b ec                	mov    ebp,esp
  402873:	6a ff                	push   0xffffffff
  402875:	68 4b 5a 41 00       	push   0x415a4b
  40287a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  402880:	50                   	push   eax
  402881:	83 ec 08             	sub    esp,0x8
  402884:	56                   	push   esi
  402885:	57                   	push   edi
  402886:	a1 cc 90 46 00       	mov    eax,ds:0x4690cc
  40288b:	33 c5                	xor    eax,ebp
  40288d:	50                   	push   eax
  40288e:	8d 45 f4             	lea    eax,[ebp-0xc]
  402891:	64 a3 00 00 00 00    	mov    fs:0x0,eax
  402897:	8b f9                	mov    edi,ecx
  402899:	51                   	push   ecx
  40289a:	8d 45 08             	lea    eax,[ebp+0x8]
  40289d:	c7 45 fc 00 00 00 00 	mov    dword ptr [ebp-0x4],0x0
  4028a4:	8b cc                	mov    ecx,esp
  4028a6:	c6 87 b4 00 00 00 00 	mov    byte ptr [edi+0xb4],0x0
  4028ad:	50                   	push   eax
  4028ae:	ff 15 d4 93 41 00    	call   dword ptr ds:0x4193d4
  4028b4:	e8 07 63 00 00       	call   0x408bc0
  4028b9:	83 c4 04             	add    esp,0x4
  4028bc:	e8 1f 2e 00 00       	call   0x4056e0
  4028c1:	8b 4f 7c             	mov    ecx,dword ptr [edi+0x7c]
  4028c4:	8b 35 30 9a 41 00    	mov    esi,dword ptr ds:0x419a30
  4028ca:	89 87 a4 00 00 00    	mov    dword ptr [edi+0xa4],eax
  4028d0:	83 c0 14             	add    eax,0x14
  4028d3:	50                   	push   eax
  4028d4:	ff d6                	call   esi
  4028d6:	8b 87 a4 00 00 00    	mov    eax,dword ptr [edi+0xa4]
  4028dc:	8b 8f 84 00 00 00    	mov    ecx,dword ptr [edi+0x84]
  4028e2:	83 c0 18             	add    eax,0x18
  4028e5:	50                   	push   eax
  4028e6:	ff d6                	call   esi
  4028e8:	8b 87 a4 00 00 00    	mov    eax,dword ptr [edi+0xa4]
  4028ee:	8b 8f 94 00 00 00    	mov    ecx,dword ptr [edi+0x94]
  4028f4:	83 c0 04             	add    eax,0x4
  4028f7:	8b 35 58 9a 41 00    	mov    esi,dword ptr ds:0x419a58
  4028fd:	50                   	push   eax
  4028fe:	ff d6                	call   esi
  402900:	ff b7 a4 00 00 00    	push   dword ptr [edi+0xa4]
  402906:	8b 8f 8c 00 00 00    	mov    ecx,dword ptr [edi+0x8c]
  40290c:	ff d6                	call   esi
  40290e:	51                   	push   ecx
  40290f:	8d 45 08             	lea    eax,[ebp+0x8]
  402912:	8b cc                	mov    ecx,esp
  402914:	50                   	push   eax
  402915:	ff 15 d4 93 41 00    	call   dword ptr ds:0x4193d4
  40291b:	8b cf                	mov    ecx,edi
  40291d:	e8 4e ee ff ff       	call   0x401770
  402922:	8d 45 08             	lea    eax,[ebp+0x8]
  402925:	50                   	push   eax
  402926:	8d 4d f0             	lea    ecx,[ebp-0x10]
  402929:	ff 15 44 93 41 00    	call   dword ptr ds:0x419344
  40292f:	51                   	push   ecx
  402930:	8b c4                	mov    eax,esp
  402932:	89 65 ec             	mov    dword ptr [ebp-0x14],esp
  402935:	50                   	push   eax
  402936:	8d 4d f0             	lea    ecx,[ebp-0x10]
  402939:	c6 45 fc 01          	mov    byte ptr [ebp-0x4],0x1
  40293d:	ff 15 38 93 41 00    	call   dword ptr ds:0x419338
  402943:	c6 45 fc 02          	mov    byte ptr [ebp-0x4],0x2
  402947:	e8 54 6e 00 00       	call   0x4097a0
  40294c:	8b c8                	mov    ecx,eax
  40294e:	c6 45 fc 01          	mov    byte ptr [ebp-0x4],0x1
  402952:	e8 99 f7 00 00       	call   0x4120f0
  402957:	8d 45 08             	lea    eax,[ebp+0x8]
  40295a:	50                   	push   eax
  40295b:	8d 8f 9c 00 00 00    	lea    ecx,[edi+0x9c]
  402961:	ff 15 cc 93 41 00    	call   dword ptr ds:0x4193cc
  402967:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40296a:	ff 15 40 93 41 00    	call   dword ptr ds:0x419340
  402970:	8d 4d 08             	lea    ecx,[ebp+0x8]
  402973:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  402979:	8b 4d f4             	mov    ecx,dword ptr [ebp-0xc]
  40297c:	64 89 0d 00 00 00 00 	mov    dword ptr fs:0x0,ecx
  402983:	59                   	pop    ecx
  402984:	5f                   	pop    edi
  402985:	5e                   	pop    esi
  402986:	8b e5                	mov    esp,ebp
  402988:	5d                   	pop    ebp
  402989:	c2 04 00             	ret    0x4
  40298c:	cc                   	int3
  40298d:	cc                   	int3
  40298e:	cc                   	int3
  40298f:	cc                   	int3
