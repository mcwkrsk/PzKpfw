; Stage 1.16 evidence excerpts — exact PM_auto.dll build
; SHA256 PM_auto.dll: c3cbde9cb83a7c10774a0faa4541622005856d09b79ce94dec3d8bd90d083018
; SHA256 MAIWmodels.dll: 80ccc6678bdf057152f473369a56eb3b76a1ce643edca2832345f7b53e09c525


; ===== removeElementFromDiagramModels [0x1000a360, 0x1000a4d8) =====

/mnt/data/work_stage117/re_inputs/modules/PM_auto.dll:     file format pei-i386


Disassembly of section .text:

1000a360 <.text+0x9360>:
1000a360:	55                   	push   ebp
1000a361:	8b ec                	mov    ebp,esp
1000a363:	6a ff                	push   0xffffffff
1000a365:	68 69 f2 01 10       	push   0x1001f269
1000a36a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000a370:	50                   	push   eax
1000a371:	83 ec 50             	sub    esp,0x50
1000a374:	53                   	push   ebx
1000a375:	56                   	push   esi
1000a376:	57                   	push   edi
1000a377:	a1 cc f0 06 10       	mov    eax,ds:0x1006f0cc
1000a37c:	33 c5                	xor    eax,ebp
1000a37e:	50                   	push   eax
1000a37f:	8d 45 f4             	lea    eax,[ebp-0xc]
1000a382:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000a388:	8b f1                	mov    esi,ecx
1000a38a:	8d be 40 01 00 00    	lea    edi,[esi+0x140]
1000a390:	8d 45 08             	lea    eax,[ebp+0x8]
1000a393:	89 7d ec             	mov    DWORD PTR [ebp-0x14],edi
1000a396:	50                   	push   eax
1000a397:	8b cf                	mov    ecx,edi
1000a399:	e8 e2 b1 ff ff       	call   0x10005580
1000a39e:	8d 4d d4             	lea    ecx,[ebp-0x2c]
1000a3a1:	51                   	push   ecx
1000a3a2:	8b 08                	mov    ecx,DWORD PTR [eax]
1000a3a4:	ff 15 18 26 02 10    	call   DWORD PTR ds:0x10022618
1000a3aa:	8d 45 c4             	lea    eax,[ebp-0x3c]
1000a3ad:	50                   	push   eax
1000a3ae:	8d 4d d4             	lea    ecx,[ebp-0x2c]
1000a3b1:	ff 15 68 22 02 10    	call   DWORD PTR ds:0x10022268
1000a3b7:	50                   	push   eax
1000a3b8:	8d 4d d4             	lea    ecx,[ebp-0x2c]
1000a3bb:	ff 15 b8 23 02 10    	call   DWORD PTR ds:0x100223b8
1000a3c1:	50                   	push   eax
1000a3c2:	8d 8e 20 01 00 00    	lea    ecx,[esi+0x120]
1000a3c8:	ff 15 5c 22 02 10    	call   DWORD PTR ds:0x1002225c
1000a3ce:	8d 45 08             	lea    eax,[ebp+0x8]
1000a3d1:	8d 9e 44 01 00 00    	lea    ebx,[esi+0x144]
1000a3d7:	50                   	push   eax
1000a3d8:	8b cb                	mov    ecx,ebx
1000a3da:	e8 a1 b1 ff ff       	call   0x10005580
1000a3df:	8d 4d c4             	lea    ecx,[ebp-0x3c]
1000a3e2:	51                   	push   ecx
1000a3e3:	8b 08                	mov    ecx,DWORD PTR [eax]
1000a3e5:	ff 15 18 26 02 10    	call   DWORD PTR ds:0x10022618
1000a3eb:	8d 4d c4             	lea    ecx,[ebp-0x3c]
1000a3ee:	0f 10 00             	movups xmm0,XMMWORD PTR [eax]
1000a3f1:	8d 86 28 01 00 00    	lea    eax,[esi+0x128]
1000a3f7:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
1000a3fa:	0f 11 45 d4          	movups XMMWORD PTR [ebp-0x2c],xmm0
1000a3fe:	ff 15 bc 23 02 10    	call   DWORD PTR ds:0x100223bc
1000a404:	50                   	push   eax
1000a405:	8d 4d d4             	lea    ecx,[ebp-0x2c]
1000a408:	ff 15 b8 23 02 10    	call   DWORD PTR ds:0x100223b8
1000a40e:	50                   	push   eax
1000a40f:	8d 8e 28 01 00 00    	lea    ecx,[esi+0x128]
1000a415:	ff 15 5c 22 02 10    	call   DWORD PTR ds:0x1002225c
1000a41b:	8d 45 08             	lea    eax,[ebp+0x8]
1000a41e:	8b cf                	mov    ecx,edi
1000a420:	50                   	push   eax
1000a421:	e8 3a 36 00 00       	call   0x1000da60
1000a426:	8d 45 08             	lea    eax,[ebp+0x8]
1000a429:	8b cb                	mov    ecx,ebx
1000a42b:	50                   	push   eax
1000a42c:	e8 2f 36 00 00       	call   0x1000da60
1000a431:	ff 75 08             	push   DWORD PTR [ebp+0x8]
1000a434:	8b 8e 1c 01 00 00    	mov    ecx,DWORD PTR [esi+0x11c]
1000a43a:	8d 45 e4             	lea    eax,[ebp-0x1c]
1000a43d:	50                   	push   eax
1000a43e:	6a 00                	push   0x0
1000a440:	ff 15 b8 20 02 10    	call   DWORD PTR ds:0x100220b8
1000a446:	8b c8                	mov    ecx,eax
1000a448:	ff 15 80 20 02 10    	call   DWORD PTR ds:0x10022080
1000a44e:	33 f6                	xor    esi,esi
1000a450:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000a457:	39 75 e4             	cmp    DWORD PTR [ebp-0x1c],esi
1000a45a:	7e 61                	jle    0x1000a4bd
1000a45c:	0f 1f 40 00          	nop    DWORD PTR [eax+0x0]
1000a460:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
1000a463:	8b cf                	mov    ecx,edi
1000a465:	8b 04 b0             	mov    eax,DWORD PTR [eax+esi*4]
1000a468:	89 45 08             	mov    DWORD PTR [ebp+0x8],eax
1000a46b:	8d 45 08             	lea    eax,[ebp+0x8]
1000a46e:	50                   	push   eax
1000a46f:	e8 ec 35 00 00       	call   0x1000da60
1000a474:	8d 45 08             	lea    eax,[ebp+0x8]
1000a477:	8b cb                	mov    ecx,ebx
1000a479:	50                   	push   eax
1000a47a:	e8 01 b1 ff ff       	call   0x10005580
1000a47f:	8d 4d b4             	lea    ecx,[ebp-0x4c]
1000a482:	8b f8                	mov    edi,eax
1000a484:	ff 15 bc 23 02 10    	call   DWORD PTR ds:0x100223bc
1000a48a:	8b 0f                	mov    ecx,DWORD PTR [edi]
1000a48c:	50                   	push   eax
1000a48d:	8d 45 a4             	lea    eax,[ebp-0x5c]
1000a490:	50                   	push   eax
1000a491:	ff 15 18 26 02 10    	call   DWORD PTR ds:0x10022618
1000a497:	8b c8                	mov    ecx,eax
1000a499:	ff 15 b8 23 02 10    	call   DWORD PTR ds:0x100223b8
1000a49f:	8b 4d f0             	mov    ecx,DWORD PTR [ebp-0x10]
1000a4a2:	50                   	push   eax
1000a4a3:	ff 15 5c 22 02 10    	call   DWORD PTR ds:0x1002225c
1000a4a9:	8d 45 08             	lea    eax,[ebp+0x8]
1000a4ac:	8b cb                	mov    ecx,ebx
1000a4ae:	50                   	push   eax
1000a4af:	e8 ac 35 00 00       	call   0x1000da60
1000a4b4:	8b 7d ec             	mov    edi,DWORD PTR [ebp-0x14]
1000a4b7:	46                   	inc    esi
1000a4b8:	3b 75 e4             	cmp    esi,DWORD PTR [ebp-0x1c]
1000a4bb:	7c a3                	jl     0x1000a460
1000a4bd:	8d 4d e4             	lea    ecx,[ebp-0x1c]
1000a4c0:	ff 15 cc 20 02 10    	call   DWORD PTR ds:0x100220cc
1000a4c6:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1000a4c9:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000a4d0:	59                   	pop    ecx
1000a4d1:	5f                   	pop    edi
1000a4d2:	5e                   	pop    esi
1000a4d3:	5b                   	pop    ebx
1000a4d4:	8b e5                	mov    esp,ebp
1000a4d6:	5d                   	pop    ebp
1000a4d7:	c2                   	.byte 0xc2

; ===== name_projection_update_secondary [0x10009730, 0x10009904) =====

/mnt/data/work_stage117/re_inputs/modules/PM_auto.dll:     file format pei-i386


Disassembly of section .text:

10009730 <.text+0x8730>:
10009730:	55                   	push   ebp
10009731:	8b ec                	mov    ebp,esp
10009733:	6a ff                	push   0xffffffff
10009735:	68 dc f0 01 10       	push   0x1001f0dc
1000973a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10009740:	50                   	push   eax
10009741:	83 ec 48             	sub    esp,0x48
10009744:	53                   	push   ebx
10009745:	56                   	push   esi
10009746:	57                   	push   edi
10009747:	a1 cc f0 06 10       	mov    eax,ds:0x1006f0cc
1000974c:	33 c5                	xor    eax,ebp
1000974e:	50                   	push   eax
1000974f:	8d 45 f4             	lea    eax,[ebp-0xc]
10009752:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10009758:	89 4d bc             	mov    DWORD PTR [ebp-0x44],ecx
1000975b:	8d 4d f0             	lea    ecx,[ebp-0x10]
1000975e:	ff 15 3c 24 02 10    	call   DWORD PTR ds:0x1002243c
10009764:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
10009767:	8d 45 c0             	lea    eax,[ebp-0x40]
1000976a:	50                   	push   eax
1000976b:	8b ce                	mov    ecx,esi
1000976d:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10009774:	ff 15 c4 20 02 10    	call   DWORD PTR ds:0x100220c4
1000977a:	8b 3d 90 20 02 10    	mov    edi,DWORD PTR ds:0x10022090
10009780:	8b c8                	mov    ecx,eax
10009782:	6a ff                	push   0xffffffff
10009784:	c6 45 fc 01          	mov    BYTE PTR [ebp-0x4],0x1
10009788:	ff d7                	call   edi
1000978a:	50                   	push   eax
1000978b:	8d 45 c4             	lea    eax,[ebp-0x3c]
1000978e:	50                   	push   eax
1000978f:	ff 15 90 23 02 10    	call   DWORD PTR ds:0x10022390
10009795:	83 c4 0c             	add    esp,0xc
10009798:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
1000979b:	8d 45 c8             	lea    eax,[ebp-0x38]
1000979e:	c6 45 fc 02          	mov    BYTE PTR [ebp-0x4],0x2
100097a2:	50                   	push   eax
100097a3:	8b ce                	mov    ecx,esi
100097a5:	ff 15 3c 21 02 10    	call   DWORD PTR ds:0x1002213c
100097ab:	6a ff                	push   0xffffffff
100097ad:	8b c8                	mov    ecx,eax
100097af:	c6 45 fc 03          	mov    BYTE PTR [ebp-0x4],0x3
100097b3:	ff d7                	call   edi
100097b5:	50                   	push   eax
100097b6:	8d 45 cc             	lea    eax,[ebp-0x34]
100097b9:	50                   	push   eax
100097ba:	ff 15 90 23 02 10    	call   DWORD PTR ds:0x10022390
100097c0:	83 c4 0c             	add    esp,0xc
100097c3:	8b d8                	mov    ebx,eax
100097c5:	8b 16                	mov    edx,DWORD PTR [esi]
100097c7:	8d 45 d0             	lea    eax,[ebp-0x30]
100097ca:	50                   	push   eax
100097cb:	8b ce                	mov    ecx,esi
100097cd:	c6 45 fc 04          	mov    BYTE PTR [ebp-0x4],0x4
100097d1:	ff 52 14             	call   DWORD PTR [edx+0x14]
100097d4:	6a ff                	push   0xffffffff
100097d6:	8b c8                	mov    ecx,eax
100097d8:	c6 45 fc 05          	mov    BYTE PTR [ebp-0x4],0x5
100097dc:	ff d7                	call   edi
100097de:	50                   	push   eax
100097df:	8d 45 d4             	lea    eax,[ebp-0x2c]
100097e2:	50                   	push   eax
100097e3:	ff 15 90 23 02 10    	call   DWORD PTR ds:0x10022390
100097e9:	50                   	push   eax
100097ea:	8d 45 d8             	lea    eax,[ebp-0x28]
100097ed:	c6 45 fc 06          	mov    BYTE PTR [ebp-0x4],0x6
100097f1:	68 40 ac 05 10       	push   0x1005ac40
100097f6:	50                   	push   eax
100097f7:	e8 74 be ff ff       	call   0x10005670
100097fc:	68 48 b8 05 10       	push   0x1005b848
10009801:	50                   	push   eax
10009802:	8d 45 dc             	lea    eax,[ebp-0x24]
10009805:	c6 45 fc 07          	mov    BYTE PTR [ebp-0x4],0x7
10009809:	50                   	push   eax
1000980a:	e8 41 7f ff ff       	call   0x10001750
1000980f:	53                   	push   ebx
10009810:	50                   	push   eax
10009811:	8d 45 e0             	lea    eax,[ebp-0x20]
10009814:	c6 45 fc 08          	mov    BYTE PTR [ebp-0x4],0x8
10009818:	50                   	push   eax
10009819:	e8 e2 bd ff ff       	call   0x10005600
1000981e:	68 f8 79 05 10       	push   0x100579f8
10009823:	50                   	push   eax
10009824:	8d 45 e4             	lea    eax,[ebp-0x1c]
10009827:	c6 45 fc 09          	mov    BYTE PTR [ebp-0x4],0x9
1000982b:	50                   	push   eax
1000982c:	e8 1f 7f ff ff       	call   0x10001750
10009831:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
10009834:	c6 45 fc 0a          	mov    BYTE PTR [ebp-0x4],0xa
10009838:	50                   	push   eax
10009839:	8d 45 e8             	lea    eax,[ebp-0x18]
1000983c:	50                   	push   eax
1000983d:	e8 be bd ff ff       	call   0x10005600
10009842:	83 c4 48             	add    esp,0x48
10009845:	8d 4d f0             	lea    ecx,[ebp-0x10]
10009848:	50                   	push   eax
10009849:	ff 15 8c 24 02 10    	call   DWORD PTR ds:0x1002248c
1000984f:	8d 4d e8             	lea    ecx,[ebp-0x18]
10009852:	ff 15 a4 23 02 10    	call   DWORD PTR ds:0x100223a4
10009858:	8d 4d e4             	lea    ecx,[ebp-0x1c]
1000985b:	ff 15 a4 23 02 10    	call   DWORD PTR ds:0x100223a4
10009861:	8d 4d e0             	lea    ecx,[ebp-0x20]
10009864:	ff 15 a4 23 02 10    	call   DWORD PTR ds:0x100223a4
1000986a:	8d 4d dc             	lea    ecx,[ebp-0x24]
1000986d:	ff 15 a4 23 02 10    	call   DWORD PTR ds:0x100223a4
10009873:	8d 4d d8             	lea    ecx,[ebp-0x28]
10009876:	ff 15 a4 23 02 10    	call   DWORD PTR ds:0x100223a4
1000987c:	8d 4d d4             	lea    ecx,[ebp-0x2c]
1000987f:	ff 15 a4 23 02 10    	call   DWORD PTR ds:0x100223a4
10009885:	8b 35 48 21 02 10    	mov    esi,DWORD PTR ds:0x10022148
1000988b:	8d 4d d0             	lea    ecx,[ebp-0x30]
1000988e:	ff d6                	call   esi
10009890:	8d 4d cc             	lea    ecx,[ebp-0x34]
10009893:	ff 15 a4 23 02 10    	call   DWORD PTR ds:0x100223a4
10009899:	8d 4d c8             	lea    ecx,[ebp-0x38]
1000989c:	ff d6                	call   esi
1000989e:	8d 4d c4             	lea    ecx,[ebp-0x3c]
100098a1:	ff 15 a4 23 02 10    	call   DWORD PTR ds:0x100223a4
100098a7:	8d 4d c0             	lea    ecx,[ebp-0x40]
100098aa:	c6 45 fc 00          	mov    BYTE PTR [ebp-0x4],0x0
100098ae:	ff d6                	call   esi
100098b0:	8d 45 f0             	lea    eax,[ebp-0x10]
100098b3:	50                   	push   eax
100098b4:	8d 4d ac             	lea    ecx,[ebp-0x54]
100098b7:	ff 15 50 23 02 10    	call   DWORD PTR ds:0x10022350
100098bd:	8b 4d bc             	mov    ecx,DWORD PTR [ebp-0x44]
100098c0:	8d 45 08             	lea    eax,[ebp+0x8]
100098c3:	50                   	push   eax
100098c4:	81 c1 44 01 00 00    	add    ecx,0x144
100098ca:	c6 45 fc 0b          	mov    BYTE PTR [ebp-0x4],0xb
100098ce:	e8 ad bc ff ff       	call   0x10005580
100098d3:	6a 02                	push   0x2
100098d5:	8d 55 ac             	lea    edx,[ebp-0x54]
100098d8:	52                   	push   edx
100098d9:	8b 08                	mov    ecx,DWORD PTR [eax]
100098db:	8b 01                	mov    eax,DWORD PTR [ecx]
100098dd:	ff 50 08             	call   DWORD PTR [eax+0x8]
100098e0:	8d 4d ac             	lea    ecx,[ebp-0x54]
100098e3:	ff 15 5c 23 02 10    	call   DWORD PTR ds:0x1002235c
100098e9:	8d 4d f0             	lea    ecx,[ebp-0x10]
100098ec:	ff 15 a4 23 02 10    	call   DWORD PTR ds:0x100223a4
100098f2:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
100098f5:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
100098fc:	59                   	pop    ecx
100098fd:	5f                   	pop    edi
100098fe:	5e                   	pop    esi
100098ff:	5b                   	pop    ebx
10009900:	8b e5                	mov    esp,ebp
10009902:	5d                   	pop    ebp
10009903:	c2                   	.byte 0xc2

; ===== property_panel_toggle [0x10009910, 0x10009930) =====

/mnt/data/work_stage117/re_inputs/modules/PM_auto.dll:     file format pei-i386


Disassembly of section .text:

10009910 <.text+0x8910>:
10009910:	8b 89 00 01 00 00    	mov    ecx,DWORD PTR [ecx+0x100]
10009916:	8b 41 14             	mov    eax,DWORD PTR [ecx+0x14]
10009919:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
1000991c:	c1 e8 0f             	shr    eax,0xf
1000991f:	a8 01                	test   al,0x1
10009921:	74 06                	je     0x10009929
10009923:	ff 25 24 28 02 10    	jmp    DWORD PTR ds:0x10022824
10009929:	ff 25 28 28 02 10    	jmp    DWORD PTR ds:0x10022828
1000992f:	cc                   	int3

; ===== set_context_value_and_emit_state [0x10009930, 0x10009970) =====

/mnt/data/work_stage117/re_inputs/modules/PM_auto.dll:     file format pei-i386


Disassembly of section .text:

10009930 <.text+0x8930>:
10009930:	55                   	push   ebp
10009931:	8b ec                	mov    ebp,esp
10009933:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10009936:	56                   	push   esi
10009937:	8b f1                	mov    esi,ecx
10009939:	8b 8e fc 00 00 00    	mov    ecx,DWORD PTR [esi+0xfc]
1000993f:	89 46 2c             	mov    DWORD PTR [esi+0x2c],eax
10009942:	ff 15 b0 28 02 10    	call   DWORD PTR ds:0x100228b0
10009948:	50                   	push   eax
10009949:	b9 90 bc 05 10       	mov    ecx,0x1005bc90
1000994e:	ff 15 54 24 02 10    	call   DWORD PTR ds:0x10022454
10009954:	8b c8                	mov    ecx,eax
10009956:	ff 70 7c             	push   DWORD PTR [eax+0x7c]
10009959:	ff 70 78             	push   DWORD PTR [eax+0x78]
1000995c:	e8 2f d6 00 00       	call   0x10016f90
10009961:	50                   	push   eax
10009962:	8b ce                	mov    ecx,esi
10009964:	e8 87 97 ff ff       	call   0x100030f0
10009969:	5e                   	pop    esi
1000996a:	5d                   	pop    ebp
1000996b:	c2 04 00             	ret    0x4
1000996e:	cc                   	int3
1000996f:	cc                   	int3

; ===== context_mode_selection [0x100073b0, 0x10008210) =====

/mnt/data/work_stage117/re_inputs/modules/PM_auto.dll:     file format pei-i386


Disassembly of section .text:

100073b0 <.text+0x63b0>:
100073b0:	55                   	push   ebp
100073b1:	8b ec                	mov    ebp,esp
100073b3:	6a ff                	push   0xffffffff
100073b5:	68 cb ed 01 10       	push   0x1001edcb
100073ba:	64 a1 00 00 00 00    	mov    eax,fs:0x0
100073c0:	50                   	push   eax
100073c1:	81 ec 00 03 00 00    	sub    esp,0x300
100073c7:	53                   	push   ebx
100073c8:	56                   	push   esi
100073c9:	57                   	push   edi
100073ca:	a1 cc f0 06 10       	mov    eax,ds:0x1006f0cc
100073cf:	33 c5                	xor    eax,ebp
100073d1:	50                   	push   eax
100073d2:	8d 45 f4             	lea    eax,[ebp-0xc]
100073d5:	64 a3 00 00 00 00    	mov    fs:0x0,eax
100073db:	8b f1                	mov    esi,ecx
100073dd:	8b 8e 48 01 00 00    	mov    ecx,DWORD PTR [esi+0x148]
100073e3:	8b 3d 24 28 02 10    	mov    edi,DWORD PTR ds:0x10022824
100073e9:	ff d7                	call   edi
100073eb:	8b 8e 54 01 00 00    	mov    ecx,DWORD PTR [esi+0x154]
100073f1:	ff d7                	call   edi
100073f3:	8b 8e 58 01 00 00    	mov    ecx,DWORD PTR [esi+0x158]
100073f9:	ff d7                	call   edi
100073fb:	8b 8e 50 01 00 00    	mov    ecx,DWORD PTR [esi+0x150]
10007401:	ff d7                	call   edi
10007403:	8b 8e 4c 01 00 00    	mov    ecx,DWORD PTR [esi+0x14c]
10007409:	ff d7                	call   edi
1000740b:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
1000740e:	85 db                	test   ebx,ebx
10007410:	0f 84 d7 0d 00 00    	je     0x100081ed
10007416:	8b ce                	mov    ecx,esi
10007418:	ff 15 f0 23 02 10    	call   DWORD PTR ds:0x100223f0
1000741e:	8b 8e fc 00 00 00    	mov    ecx,DWORD PTR [esi+0xfc]
10007424:	8b f8                	mov    edi,eax
10007426:	ff 15 b0 28 02 10    	call   DWORD PTR ds:0x100228b0
1000742c:	3b f8                	cmp    edi,eax
1000742e:	0f 85 b9 0d 00 00    	jne    0x100081ed
10007434:	8b 8e 50 01 00 00    	mov    ecx,DWORD PTR [esi+0x150]
1000743a:	8d 83 d0 01 00 00    	lea    eax,[ebx+0x1d0]
10007440:	89 45 b4             	mov    DWORD PTR [ebp-0x4c],eax
10007443:	8b 00                	mov    eax,DWORD PTR [eax]
10007445:	89 46 38             	mov    DWORD PTR [esi+0x38],eax
10007448:	ff 15 28 28 02 10    	call   DWORD PTR ds:0x10022828
1000744e:	8b 8e 54 01 00 00    	mov    ecx,DWORD PTR [esi+0x154]
10007454:	e8 37 40 01 00       	call   0x1001b490
10007459:	8b 8e 58 01 00 00    	mov    ecx,DWORD PTR [esi+0x158]
1000745f:	e8 2c 40 01 00       	call   0x1001b490
10007464:	8d be 64 01 00 00    	lea    edi,[esi+0x164]
1000746a:	8b cf                	mov    ecx,edi
1000746c:	ff 15 a4 24 02 10    	call   DWORD PTR ds:0x100224a4
10007472:	6a 03                	push   0x3
10007474:	8b cf                	mov    ecx,edi
10007476:	ff 15 a8 24 02 10    	call   DWORD PTR ds:0x100224a8
1000747c:	8d 45 ec             	lea    eax,[ebp-0x14]
1000747f:	c6 45 f3 00          	mov    BYTE PTR [ebp-0xd],0x0
10007483:	50                   	push   eax
10007484:	8d 4d f3             	lea    ecx,[ebp-0xd]
10007487:	e8 44 f0 ff ff       	call   0x100064d0
1000748c:	50                   	push   eax
1000748d:	8d 4d d4             	lea    ecx,[ebp-0x2c]
10007490:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10007497:	ff 15 50 23 02 10    	call   DWORD PTR ds:0x10022350
1000749d:	8b 07                	mov    eax,DWORD PTR [edi]
1000749f:	8d 4d d4             	lea    ecx,[ebp-0x2c]
100074a2:	6a 02                	push   0x2
100074a4:	51                   	push   ecx
100074a5:	6a 01                	push   0x1
100074a7:	6a 00                	push   0x0
100074a9:	8b cf                	mov    ecx,edi
100074ab:	c6 45 fc 01          	mov    BYTE PTR [ebp-0x4],0x1
100074af:	ff 50 50             	call   DWORD PTR [eax+0x50]
100074b2:	8b 1d 5c 23 02 10    	mov    ebx,DWORD PTR ds:0x1002235c
100074b8:	8d 4d d4             	lea    ecx,[ebp-0x2c]
100074bb:	ff d3                	call   ebx
100074bd:	8d 4d ec             	lea    ecx,[ebp-0x14]
100074c0:	ff 15 a4 23 02 10    	call   DWORD PTR ds:0x100223a4
100074c6:	8d 45 ec             	lea    eax,[ebp-0x14]
100074c9:	50                   	push   eax
100074ca:	8d 4d f3             	lea    ecx,[ebp-0xd]
100074cd:	e8 0e ed ff ff       	call   0x100061e0
100074d2:	50                   	push   eax
100074d3:	8d 4d d4             	lea    ecx,[ebp-0x2c]
100074d6:	c7 45 fc 02 00 00 00 	mov    DWORD PTR [ebp-0x4],0x2
100074dd:	ff 15 50 23 02 10    	call   DWORD PTR ds:0x10022350
100074e3:	8b 07                	mov    eax,DWORD PTR [edi]
100074e5:	8d 4d d4             	lea    ecx,[ebp-0x2c]
100074e8:	6a 02                	push   0x2
100074ea:	51                   	push   ecx
100074eb:	6a 01                	push   0x1
100074ed:	6a 01                	push   0x1
100074ef:	8b cf                	mov    ecx,edi
100074f1:	c6 45 fc 03          	mov    BYTE PTR [ebp-0x4],0x3
100074f5:	ff 50 50             	call   DWORD PTR [eax+0x50]
100074f8:	8d 4d d4             	lea    ecx,[ebp-0x2c]
100074fb:	ff d3                	call   ebx
100074fd:	8d 4d ec             	lea    ecx,[ebp-0x14]
10007500:	ff 15 a4 23 02 10    	call   DWORD PTR ds:0x100223a4
10007506:	8d 45 ec             	lea    eax,[ebp-0x14]
10007509:	50                   	push   eax
1000750a:	8d 4d f3             	lea    ecx,[ebp-0xd]
1000750d:	e8 1e e2 ff ff       	call   0x10005730
10007512:	50                   	push   eax
10007513:	8d 4d d4             	lea    ecx,[ebp-0x2c]
10007516:	c7 45 fc 04 00 00 00 	mov    DWORD PTR [ebp-0x4],0x4
1000751d:	ff 15 50 23 02 10    	call   DWORD PTR ds:0x10022350
10007523:	8b 07                	mov    eax,DWORD PTR [edi]
10007525:	8d 4d d4             	lea    ecx,[ebp-0x2c]
10007528:	6a 02                	push   0x2
1000752a:	51                   	push   ecx
1000752b:	6a 01                	push   0x1
1000752d:	c6 45 fc 05          	mov    BYTE PTR [ebp-0x4],0x5
10007531:	6a 02                	push   0x2
10007533:	8b cf                	mov    ecx,edi
10007535:	ff 50 50             	call   DWORD PTR [eax+0x50]
10007538:	8d 4d d4             	lea    ecx,[ebp-0x2c]
1000753b:	ff d3                	call   ebx
1000753d:	8d 4d ec             	lea    ecx,[ebp-0x14]
10007540:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
10007547:	ff 15 a4 23 02 10    	call   DWORD PTR ds:0x100223a4
1000754d:	8b 4e 38             	mov    ecx,DWORD PTR [esi+0x38]
10007550:	8b 1d 40 21 02 10    	mov    ebx,DWORD PTR ds:0x10022140
10007556:	ff d3                	call   ebx
10007558:	8b 3d 6c 23 02 10    	mov    edi,DWORD PTR ds:0x1002236c
1000755e:	85 c0                	test   eax,eax
10007560:	0f 85 4b 07 00 00    	jne    0x10007cb1
10007566:	6a 02                	push   0x2
10007568:	8b ce                	mov    ecx,esi
1000756a:	e8 c1 23 00 00       	call   0x10009930
1000756f:	8b 8e 48 01 00 00    	mov    ecx,DWORD PTR [esi+0x148]
10007575:	ff 15 28 28 02 10    	call   DWORD PTR ds:0x10022828
1000757b:	8b 8e 1c 01 00 00    	mov    ecx,DWORD PTR [esi+0x11c]
10007581:	6a 00                	push   0x0
10007583:	ff 15 bc 20 02 10    	call   DWORD PTR ds:0x100220bc
10007589:	ff 76 38             	push   DWORD PTR [esi+0x38]
1000758c:	8d 4d dc             	lea    ecx,[ebp-0x24]
1000758f:	51                   	push   ecx
10007590:	8b c8                	mov    ecx,eax
10007592:	ff 15 68 20 02 10    	call   DWORD PTR ds:0x10022068
10007598:	8b 8e 48 01 00 00    	mov    ecx,DWORD PTR [esi+0x148]
1000759e:	6a 01                	push   0x1
100075a0:	c7 45 fc 06 00 00 00 	mov    DWORD PTR [ebp-0x4],0x6
100075a7:	8b 49 20             	mov    ecx,DWORD PTR [ecx+0x20]
100075aa:	ff d7                	call   edi
100075ac:	8b 8e 48 01 00 00    	mov    ecx,DWORD PTR [esi+0x148]
100075b2:	6a 00                	push   0x0
100075b4:	8b 49 20             	mov    ecx,DWORD PTR [ecx+0x20]
100075b7:	ff 15 fc 28 02 10    	call   DWORD PTR ds:0x100228fc
100075bd:	33 c9                	xor    ecx,ecx
100075bf:	89 4d ec             	mov    DWORD PTR [ebp-0x14],ecx
100075c2:	39 4d dc             	cmp    DWORD PTR [ebp-0x24],ecx
100075c5:	0f 8e b8 06 00 00    	jle    0x10007c83
100075cb:	0f 1f 44 00 00       	nop    DWORD PTR [eax+eax*1+0x0]
100075d0:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
100075d3:	8b 1c 88             	mov    ebx,DWORD PTR [eax+ecx*4]
100075d6:	8b cb                	mov    ecx,ebx
100075d8:	89 5d d0             	mov    DWORD PTR [ebp-0x30],ebx
100075db:	ff 15 f8 20 02 10    	call   DWORD PTR ds:0x100220f8
100075e1:	3c 2a                	cmp    al,0x2a
100075e3:	75 58                	jne    0x1000763d
100075e5:	8b cb                	mov    ecx,ebx
100075e7:	ff 15 00 21 02 10    	call   DWORD PTR ds:0x10022100
100075ed:	50                   	push   eax
100075ee:	8d 8d 64 ff ff ff    	lea    ecx,[ebp-0x9c]
100075f4:	ff 15 58 23 02 10    	call   DWORD PTR ds:0x10022358
100075fa:	8b 8e 48 01 00 00    	mov    ecx,DWORD PTR [esi+0x148]
10007600:	8d 85 64 ff ff ff    	lea    eax,[ebp-0x9c]
10007606:	6a 10                	push   0x10
10007608:	68 01 01 00 00       	push   0x101
1000760d:	50                   	push   eax
1000760e:	8b 49 20             	mov    ecx,DWORD PTR [ecx+0x20]
10007611:	c6 45 fc 07          	mov    BYTE PTR [ebp-0x4],0x7
10007615:	ff 15 ec 28 02 10    	call   DWORD PTR ds:0x100228ec
1000761b:	8d 8d 64 ff ff ff    	lea    ecx,[ebp-0x9c]
10007621:	c6 45 fc 06          	mov    BYTE PTR [ebp-0x4],0x6
10007625:	8b f8                	mov    edi,eax
10007627:	ff 15 5c 23 02 10    	call   DWORD PTR ds:0x1002235c
1000762d:	8b 8e 48 01 00 00    	mov    ecx,DWORD PTR [esi+0x148]
10007633:	57                   	push   edi
10007634:	8b 49 20             	mov    ecx,DWORD PTR [ecx+0x20]
10007637:	ff 15 fc 28 02 10    	call   DWORD PTR ds:0x100228fc
1000763d:	8b cb                	mov    ecx,ebx
1000763f:	ff 15 f8 20 02 10    	call   DWORD PTR ds:0x100220f8
10007645:	3c 2b                	cmp    al,0x2b
10007647:	0f 85 03 03 00 00    	jne    0x10007950
1000764d:	8b cb                	mov    ecx,ebx
1000764f:	ff 15 00 21 02 10    	call   DWORD PTR ds:0x10022100
10007655:	8b be 64 01 00 00    	mov    edi,DWORD PTR [esi+0x164]
1000765b:	8d 8d d4 fd ff ff    	lea    ecx,[ebp-0x22c]
10007661:	8b d8                	mov    ebx,eax
10007663:	89 5d e4             	mov    DWORD PTR [ebp-0x1c],ebx
10007666:	ff 15 bc 23 02 10    	call   DWORD PTR ds:0x100223bc
1000766c:	50                   	push   eax
1000766d:	8d 8e 64 01 00 00    	lea    ecx,[esi+0x164]
10007673:	ff 57 38             	call   DWORD PTR [edi+0x38]
10007676:	40                   	inc    eax
10007677:	8d 8e 64 01 00 00    	lea    ecx,[esi+0x164]
1000767d:	50                   	push   eax
1000767e:	ff 15 f8 25 02 10    	call   DWORD PTR ds:0x100225f8
10007684:	8b 03                	mov    eax,DWORD PTR [ebx]
10007686:	8d 4d a4             	lea    ecx,[ebp-0x5c]
10007689:	51                   	push   ecx
1000768a:	8b cb                	mov    ecx,ebx
1000768c:	ff 50 14             	call   DWORD PTR [eax+0x14]
1000768f:	6a ff                	push   0xffffffff
10007691:	8b c8                	mov    ecx,eax
10007693:	c6 45 fc 08          	mov    BYTE PTR [ebp-0x4],0x8
10007697:	ff 15 90 20 02 10    	call   DWORD PTR ds:0x10022090
1000769d:	50                   	push   eax
1000769e:	8d 45 a8             	lea    eax,[ebp-0x58]
100076a1:	50                   	push   eax
100076a2:	ff 15 90 23 02 10    	call   DWORD PTR ds:0x10022390
100076a8:	83 c4 0c             	add    esp,0xc
100076ab:	50                   	push   eax
100076ac:	8d 8d 54 ff ff ff    	lea    ecx,[ebp-0xac]
100076b2:	c6 45 fc 09          	mov    BYTE PTR [ebp-0x4],0x9
100076b6:	ff 15 50 23 02 10    	call   DWORD PTR ds:0x10022350
100076bc:	8b 9e 64 01 00 00    	mov    ebx,DWORD PTR [esi+0x164]
100076c2:	8d 85 54 ff ff ff    	lea    eax,[ebp-0xac]
100076c8:	6a 02                	push   0x2
100076ca:	50                   	push   eax
100076cb:	8d 8d 04 fd ff ff    	lea    ecx,[ebp-0x2fc]
100076d1:	c6 45 fc 0a          	mov    BYTE PTR [ebp-0x4],0xa
100076d5:	8b fb                	mov    edi,ebx
100076d7:	ff 15 bc 23 02 10    	call   DWORD PTR ds:0x100223bc
100076dd:	50                   	push   eax
100076de:	6a 00                	push   0x0
100076e0:	8d 8d c4 fe ff ff    	lea    ecx,[ebp-0x13c]
100076e6:	ff 15 bc 23 02 10    	call   DWORD PTR ds:0x100223bc
100076ec:	50                   	push   eax
100076ed:	8d 8e 64 01 00 00    	lea    ecx,[esi+0x164]
100076f3:	ff 57 38             	call   DWORD PTR [edi+0x38]
100076f6:	48                   	dec    eax
100076f7:	8d 8e 64 01 00 00    	lea    ecx,[esi+0x164]
100076fd:	50                   	push   eax
100076fe:	8d 85 b4 fe ff ff    	lea    eax,[ebp-0x14c]
10007704:	50                   	push   eax
10007705:	ff 53 2c             	call   DWORD PTR [ebx+0x2c]
10007708:	50                   	push   eax
10007709:	8d 8e 64 01 00 00    	lea    ecx,[esi+0x164]
1000770f:	ff 53 48             	call   DWORD PTR [ebx+0x48]
10007712:	8d 8d 54 ff ff ff    	lea    ecx,[ebp-0xac]
10007718:	ff 15 5c 23 02 10    	call   DWORD PTR ds:0x1002235c
1000771e:	8d 4d a8             	lea    ecx,[ebp-0x58]
10007721:	ff 15 a4 23 02 10    	call   DWORD PTR ds:0x100223a4
10007727:	8d 4d a4             	lea    ecx,[ebp-0x5c]
1000772a:	c6 45 fc 06          	mov    BYTE PTR [ebp-0x4],0x6
1000772e:	ff 15 48 21 02 10    	call   DWORD PTR ds:0x10022148
10007734:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
10007737:	8d 8d 44 ff ff ff    	lea    ecx,[ebp-0xbc]
1000773d:	ff 15 58 23 02 10    	call   DWORD PTR ds:0x10022358
10007743:	8b 9e 64 01 00 00    	mov    ebx,DWORD PTR [esi+0x164]
10007749:	8d 85 44 ff ff ff    	lea    eax,[ebp-0xbc]
1000774f:	68 01 01 00 00       	push   0x101
10007754:	50                   	push   eax
10007755:	8d 8d a4 fe ff ff    	lea    ecx,[ebp-0x15c]
1000775b:	c6 45 fc 0b          	mov    BYTE PTR [ebp-0x4],0xb
1000775f:	8b fb                	mov    edi,ebx
10007761:	ff 15 bc 23 02 10    	call   DWORD PTR ds:0x100223bc
10007767:	50                   	push   eax
10007768:	6a 00                	push   0x0
1000776a:	8d 8d 94 fe ff ff    	lea    ecx,[ebp-0x16c]
10007770:	ff 15 bc 23 02 10    	call   DWORD PTR ds:0x100223bc
10007776:	50                   	push   eax
10007777:	8d 8e 64 01 00 00    	lea    ecx,[esi+0x164]
1000777d:	ff 57 38             	call   DWORD PTR [edi+0x38]
10007780:	48                   	dec    eax
10007781:	8d 8e 64 01 00 00    	lea    ecx,[esi+0x164]
10007787:	50                   	push   eax
10007788:	8d 85 84 fe ff ff    	lea    eax,[ebp-0x17c]
1000778e:	50                   	push   eax
1000778f:	ff 53 2c             	call   DWORD PTR [ebx+0x2c]
10007792:	50                   	push   eax
10007793:	8d 8e 64 01 00 00    	lea    ecx,[esi+0x164]
10007799:	ff 53 48             	call   DWORD PTR [ebx+0x48]
1000779c:	8d 8d 44 ff ff ff    	lea    ecx,[ebp-0xbc]
100077a2:	c6 45 fc 06          	mov    BYTE PTR [ebp-0x4],0x6
100077a6:	ff 15 5c 23 02 10    	call   DWORD PTR ds:0x1002235c
100077ac:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
100077af:	8d 8d 34 ff ff ff    	lea    ecx,[ebp-0xcc]
100077b5:	ff 15 58 23 02 10    	call   DWORD PTR ds:0x10022358
100077bb:	8b 9e 64 01 00 00    	mov    ebx,DWORD PTR [esi+0x164]
100077c1:	8d 85 34 ff ff ff    	lea    eax,[ebp-0xcc]
100077c7:	68 02 01 00 00       	push   0x102
100077cc:	50                   	push   eax
100077cd:	8d 8d 74 fe ff ff    	lea    ecx,[ebp-0x18c]
100077d3:	c6 45 fc 0c          	mov    BYTE PTR [ebp-0x4],0xc
100077d7:	8b fb                	mov    edi,ebx
100077d9:	ff 15 bc 23 02 10    	call   DWORD PTR ds:0x100223bc
100077df:	50                   	push   eax
100077e0:	6a 00                	push   0x0
100077e2:	8d 8d 64 fe ff ff    	lea    ecx,[ebp-0x19c]
100077e8:	ff 15 bc 23 02 10    	call   DWORD PTR ds:0x100223bc
100077ee:	50                   	push   eax
100077ef:	8d 8e 64 01 00 00    	lea    ecx,[esi+0x164]
100077f5:	ff 57 38             	call   DWORD PTR [edi+0x38]
100077f8:	48                   	dec    eax
100077f9:	8d 8e 64 01 00 00    	lea    ecx,[esi+0x164]
100077ff:	50                   	push   eax
10007800:	8d 85 54 fe ff ff    	lea    eax,[ebp-0x1ac]
10007806:	50                   	push   eax
10007807:	ff 53 2c             	call   DWORD PTR [ebx+0x2c]
1000780a:	50                   	push   eax
1000780b:	8d 8e 64 01 00 00    	lea    ecx,[esi+0x164]
10007811:	ff 53 48             	call   DWORD PTR [ebx+0x48]
10007814:	8d 8d 34 ff ff ff    	lea    ecx,[ebp-0xcc]
1000781a:	c6 45 fc 06          	mov    BYTE PTR [ebp-0x4],0x6
1000781e:	ff 15 5c 23 02 10    	call   DWORD PTR ds:0x1002235c
10007824:	68 c4 b3 05 10       	push   0x1005b3c4
10007829:	8d 8d 24 ff ff ff    	lea    ecx,[ebp-0xdc]
1000782f:	ff 15 54 23 02 10    	call   DWORD PTR ds:0x10022354
10007835:	8b 9e 64 01 00 00    	mov    ebx,DWORD PTR [esi+0x164]
1000783b:	8d 85 24 ff ff ff    	lea    eax,[ebp-0xdc]
10007841:	6a 02                	push   0x2
10007843:	50                   	push   eax
10007844:	8d 8d 44 fe ff ff    	lea    ecx,[ebp-0x1bc]
1000784a:	c6 45 fc 0d          	mov    BYTE PTR [ebp-0x4],0xd
1000784e:	8b fb                	mov    edi,ebx
10007850:	ff 15 bc 23 02 10    	call   DWORD PTR ds:0x100223bc
10007856:	50                   	push   eax
10007857:	6a 01                	push   0x1
10007859:	8d 8d 34 fe ff ff    	lea    ecx,[ebp-0x1cc]
1000785f:	ff 15 bc 23 02 10    	call   DWORD PTR ds:0x100223bc
10007865:	50                   	push   eax
10007866:	8d 8e 64 01 00 00    	lea    ecx,[esi+0x164]
1000786c:	ff 57 38             	call   DWORD PTR [edi+0x38]
1000786f:	48                   	dec    eax
10007870:	8d 8e 64 01 00 00    	lea    ecx,[esi+0x164]
10007876:	50                   	push   eax
10007877:	8d 85 24 fe ff ff    	lea    eax,[ebp-0x1dc]
1000787d:	50                   	push   eax
1000787e:	ff 53 2c             	call   DWORD PTR [ebx+0x2c]
10007881:	50                   	push   eax
10007882:	8d 8e 64 01 00 00    	lea    ecx,[esi+0x164]
10007888:	ff 53 48             	call   DWORD PTR [ebx+0x48]
1000788b:	8d 8d 24 ff ff ff    	lea    ecx,[ebp-0xdc]
10007891:	c6 45 fc 06          	mov    BYTE PTR [ebp-0x4],0x6
10007895:	ff 15 5c 23 02 10    	call   DWORD PTR ds:0x1002235c
1000789b:	8b 4d e4             	mov    ecx,DWORD PTR [ebp-0x1c]
1000789e:	8d 45 a0             	lea    eax,[ebp-0x60]
100078a1:	50                   	push   eax
100078a2:	ff 15 a8 20 02 10    	call   DWORD PTR ds:0x100220a8
100078a8:	6a ff                	push   0xffffffff
100078aa:	8b c8                	mov    ecx,eax
100078ac:	c6 45 fc 0e          	mov    BYTE PTR [ebp-0x4],0xe
100078b0:	ff 15 90 20 02 10    	call   DWORD PTR ds:0x10022090
100078b6:	50                   	push   eax
100078b7:	8d 45 94             	lea    eax,[ebp-0x6c]
100078ba:	50                   	push   eax
100078bb:	ff 15 90 23 02 10    	call   DWORD PTR ds:0x10022390
100078c1:	83 c4 0c             	add    esp,0xc
100078c4:	50                   	push   eax
100078c5:	8d 8d 14 ff ff ff    	lea    ecx,[ebp-0xec]
100078cb:	c6 45 fc 0f          	mov    BYTE PTR [ebp-0x4],0xf
100078cf:	ff 15 50 23 02 10    	call   DWORD PTR ds:0x10022350
100078d5:	8b 9e 64 01 00 00    	mov    ebx,DWORD PTR [esi+0x164]
100078db:	8d 85 14 ff ff ff    	lea    eax,[ebp-0xec]
100078e1:	6a 02                	push   0x2
100078e3:	50                   	push   eax
100078e4:	8d 8d 14 fe ff ff    	lea    ecx,[ebp-0x1ec]
100078ea:	c6 45 fc 10          	mov    BYTE PTR [ebp-0x4],0x10
100078ee:	8b fb                	mov    edi,ebx
100078f0:	ff 15 bc 23 02 10    	call   DWORD PTR ds:0x100223bc
100078f6:	50                   	push   eax
100078f7:	6a 02                	push   0x2
100078f9:	8d 8d 04 fe ff ff    	lea    ecx,[ebp-0x1fc]
100078ff:	ff 15 bc 23 02 10    	call   DWORD PTR ds:0x100223bc
10007905:	50                   	push   eax
10007906:	8d 8e 64 01 00 00    	lea    ecx,[esi+0x164]
1000790c:	ff 57 38             	call   DWORD PTR [edi+0x38]
1000790f:	48                   	dec    eax
10007910:	8d be 64 01 00 00    	lea    edi,[esi+0x164]
10007916:	50                   	push   eax
10007917:	8d 85 f4 fd ff ff    	lea    eax,[ebp-0x20c]
1000791d:	8b cf                	mov    ecx,edi
1000791f:	50                   	push   eax
10007920:	ff 53 2c             	call   DWORD PTR [ebx+0x2c]
10007923:	50                   	push   eax
10007924:	8b cf                	mov    ecx,edi
10007926:	ff 53 48             	call   DWORD PTR [ebx+0x48]
10007929:	8d 8d 14 ff ff ff    	lea    ecx,[ebp-0xec]
1000792f:	ff 15 5c 23 02 10    	call   DWORD PTR ds:0x1002235c
10007935:	8d 4d 94             	lea    ecx,[ebp-0x6c]
10007938:	ff 15 a4 23 02 10    	call   DWORD PTR ds:0x100223a4
1000793e:	8d 4d a0             	lea    ecx,[ebp-0x60]
10007941:	c6 45 fc 06          	mov    BYTE PTR [ebp-0x4],0x6
10007945:	ff 15 48 21 02 10    	call   DWORD PTR ds:0x10022148
1000794b:	8b 5d d0             	mov    ebx,DWORD PTR [ebp-0x30]
1000794e:	eb 06                	jmp    0x10007956
10007950:	8d be 64 01 00 00    	lea    edi,[esi+0x164]
10007956:	8b cb                	mov    ecx,ebx
10007958:	ff 15 f8 20 02 10    	call   DWORD PTR ds:0x100220f8
1000795e:	3c 2e                	cmp    al,0x2e
10007960:	0f 85 01 03 00 00    	jne    0x10007c67
10007966:	8b cb                	mov    ecx,ebx
10007968:	ff 15 00 21 02 10    	call   DWORD PTR ds:0x10022100
1000796e:	8b 3f                	mov    edi,DWORD PTR [edi]
10007970:	8d 8d e4 fd ff ff    	lea    ecx,[ebp-0x21c]
10007976:	8b d8                	mov    ebx,eax
10007978:	89 5d e4             	mov    DWORD PTR [ebp-0x1c],ebx
1000797b:	ff 15 bc 23 02 10    	call   DWORD PTR ds:0x100223bc
10007981:	50                   	push   eax
10007982:	8d 8e 64 01 00 00    	lea    ecx,[esi+0x164]
10007988:	ff 57 38             	call   DWORD PTR [edi+0x38]
1000798b:	40                   	inc    eax
1000798c:	8d 8e 64 01 00 00    	lea    ecx,[esi+0x164]
10007992:	50                   	push   eax
10007993:	ff 15 f8 25 02 10    	call   DWORD PTR ds:0x100225f8
10007999:	8b 03                	mov    eax,DWORD PTR [ebx]
1000799b:	8d 4d 98             	lea    ecx,[ebp-0x68]
1000799e:	51                   	push   ecx
1000799f:	8b cb                	mov    ecx,ebx
100079a1:	ff 50 14             	call   DWORD PTR [eax+0x14]
100079a4:	6a ff                	push   0xffffffff
100079a6:	8b c8                	mov    ecx,eax
100079a8:	c6 45 fc 11          	mov    BYTE PTR [ebp-0x4],0x11
100079ac:	ff 15 90 20 02 10    	call   DWORD PTR ds:0x10022090
100079b2:	50                   	push   eax
100079b3:	8d 45 9c             	lea    eax,[ebp-0x64]
100079b6:	50                   	push   eax
100079b7:	ff 15 90 23 02 10    	call   DWORD PTR ds:0x10022390
100079bd:	83 c4 0c             	add    esp,0xc
100079c0:	50                   	push   eax
100079c1:	8d 8d 04 ff ff ff    	lea    ecx,[ebp-0xfc]
100079c7:	c6 45 fc 12          	mov    BYTE PTR [ebp-0x4],0x12
100079cb:	ff 15 50 23 02 10    	call   DWORD PTR ds:0x10022350
100079d1:	8b 9e 64 01 00 00    	mov    ebx,DWORD PTR [esi+0x164]
100079d7:	8d 85 04 ff ff ff    	lea    eax,[ebp-0xfc]
100079dd:	6a 02                	push   0x2
100079df:	50                   	push   eax
100079e0:	8d 8d 64 fd ff ff    	lea    ecx,[ebp-0x29c]
100079e6:	c6 45 fc 13          	mov    BYTE PTR [ebp-0x4],0x13
100079ea:	8b fb                	mov    edi,ebx
100079ec:	ff 15 bc 23 02 10    	call   DWORD PTR ds:0x100223bc
100079f2:	50                   	push   eax
100079f3:	6a 00                	push   0x0
100079f5:	8d 8d c4 fd ff ff    	lea    ecx,[ebp-0x23c]
100079fb:	ff 15 bc 23 02 10    	call   DWORD PTR ds:0x100223bc
10007a01:	50                   	push   eax
10007a02:	8d 8e 64 01 00 00    	lea    ecx,[esi+0x164]
10007a08:	ff 57 38             	call   DWORD PTR [edi+0x38]
10007a0b:	48                   	dec    eax
10007a0c:	8d 8e 64 01 00 00    	lea    ecx,[esi+0x164]
10007a12:	50                   	push   eax
10007a13:	8d 85 b4 fd ff ff    	lea    eax,[ebp-0x24c]
10007a19:	50                   	push   eax
10007a1a:	ff 53 2c             	call   DWORD PTR [ebx+0x2c]
10007a1d:	50                   	push   eax
10007a1e:	8d 8e 64 01 00 00    	lea    ecx,[esi+0x164]
10007a24:	ff 53 48             	call   DWORD PTR [ebx+0x48]
10007a27:	8d 8d 04 ff ff ff    	lea    ecx,[ebp-0xfc]
10007a2d:	ff 15 5c 23 02 10    	call   DWORD PTR ds:0x1002235c
10007a33:	8d 4d 9c             	lea    ecx,[ebp-0x64]
10007a36:	ff 15 a4 23 02 10    	call   DWORD PTR ds:0x100223a4
10007a3c:	8d 4d 98             	lea    ecx,[ebp-0x68]
10007a3f:	c6 45 fc 06          	mov    BYTE PTR [ebp-0x4],0x6
10007a43:	ff 15 48 21 02 10    	call   DWORD PTR ds:0x10022148
10007a49:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
10007a4c:	8d 8d f4 fe ff ff    	lea    ecx,[ebp-0x10c]
10007a52:	ff 15 58 23 02 10    	call   DWORD PTR ds:0x10022358
10007a58:	8b 9e 64 01 00 00    	mov    ebx,DWORD PTR [esi+0x164]
10007a5e:	8d 85 f4 fe ff ff    	lea    eax,[ebp-0x10c]
10007a64:	68 01 01 00 00       	push   0x101
10007a69:	50                   	push   eax
10007a6a:	8d 8d a4 fd ff ff    	lea    ecx,[ebp-0x25c]
10007a70:	c6 45 fc 14          	mov    BYTE PTR [ebp-0x4],0x14
10007a74:	8b fb                	mov    edi,ebx
10007a76:	ff 15 bc 23 02 10    	call   DWORD PTR ds:0x100223bc
10007a7c:	50                   	push   eax
10007a7d:	6a 00                	push   0x0
10007a7f:	8d 8d 94 fd ff ff    	lea    ecx,[ebp-0x26c]
10007a85:	ff 15 bc 23 02 10    	call   DWORD PTR ds:0x100223bc
10007a8b:	50                   	push   eax
10007a8c:	8d 8e 64 01 00 00    	lea    ecx,[esi+0x164]
10007a92:	ff 57 38             	call   DWORD PTR [edi+0x38]
10007a95:	48                   	dec    eax
10007a96:	8d 8e 64 01 00 00    	lea    ecx,[esi+0x164]
10007a9c:	50                   	push   eax
10007a9d:	8d 85 84 fd ff ff    	lea    eax,[ebp-0x27c]
10007aa3:	50                   	push   eax
10007aa4:	ff 53 2c             	call   DWORD PTR [ebx+0x2c]
10007aa7:	50                   	push   eax
10007aa8:	8d 8e 64 01 00 00    	lea    ecx,[esi+0x164]
10007aae:	ff 53 48             	call   DWORD PTR [ebx+0x48]
10007ab1:	8d 8d f4 fe ff ff    	lea    ecx,[ebp-0x10c]
10007ab7:	c6 45 fc 06          	mov    BYTE PTR [ebp-0x4],0x6
10007abb:	ff 15 5c 23 02 10    	call   DWORD PTR ds:0x1002235c
10007ac1:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
10007ac4:	8d 8d e4 fe ff ff    	lea    ecx,[ebp-0x11c]
10007aca:	ff 15 58 23 02 10    	call   DWORD PTR ds:0x10022358
10007ad0:	8b 9e 64 01 00 00    	mov    ebx,DWORD PTR [esi+0x164]
10007ad6:	8d 85 e4 fe ff ff    	lea    eax,[ebp-0x11c]
10007adc:	68 02 01 00 00       	push   0x102
10007ae1:	50                   	push   eax
10007ae2:	8d 8d 74 fd ff ff    	lea    ecx,[ebp-0x28c]
10007ae8:	c6 45 fc 15          	mov    BYTE PTR [ebp-0x4],0x15
10007aec:	8b fb                	mov    edi,ebx
10007aee:	ff 15 bc 23 02 10    	call   DWORD PTR ds:0x100223bc
10007af4:	50                   	push   eax
10007af5:	6a 00                	push   0x0
10007af7:	8d 8d f4 fc ff ff    	lea    ecx,[ebp-0x30c]
10007afd:	ff 15 bc 23 02 10    	call   DWORD PTR ds:0x100223bc
10007b03:	50                   	push   eax
10007b04:	8d 8e 64 01 00 00    	lea    ecx,[esi+0x164]
10007b0a:	ff 57 38             	call   DWORD PTR [edi+0x38]
10007b0d:	48                   	dec    eax
10007b0e:	8d 8e 64 01 00 00    	lea    ecx,[esi+0x164]
10007b14:	50                   	push   eax
10007b15:	8d 85 54 fd ff ff    	lea    eax,[ebp-0x2ac]
10007b1b:	50                   	push   eax
10007b1c:	ff 53 2c             	call   DWORD PTR [ebx+0x2c]
10007b1f:	50                   	push   eax
10007b20:	8d 8e 64 01 00 00    	lea    ecx,[esi+0x164]
10007b26:	ff 53 48             	call   DWORD PTR [ebx+0x48]
10007b29:	8d 8d e4 fe ff ff    	lea    ecx,[ebp-0x11c]
10007b2f:	ff 15 5c 23 02 10    	call   DWORD PTR ds:0x1002235c
10007b35:	8d 45 cc             	lea    eax,[ebp-0x34]
10007b38:	50                   	push   eax
10007b39:	8d 4d f3             	lea    ecx,[ebp-0xd]
10007b3c:	e8 5f e8 ff ff       	call   0x100063a0
10007b41:	50                   	push   eax
10007b42:	8d 8d d4 fe ff ff    	lea    ecx,[ebp-0x12c]
10007b48:	c6 45 fc 16          	mov    BYTE PTR [ebp-0x4],0x16
10007b4c:	ff 15 50 23 02 10    	call   DWORD PTR ds:0x10022350
10007b52:	8b 9e 64 01 00 00    	mov    ebx,DWORD PTR [esi+0x164]
10007b58:	8d 85 d4 fe ff ff    	lea    eax,[ebp-0x12c]
10007b5e:	6a 02                	push   0x2
10007b60:	50                   	push   eax
10007b61:	8d 8d 44 fd ff ff    	lea    ecx,[ebp-0x2bc]
10007b67:	c6 45 fc 17          	mov    BYTE PTR [ebp-0x4],0x17
10007b6b:	8b fb                	mov    edi,ebx
10007b6d:	ff 15 bc 23 02 10    	call   DWORD PTR ds:0x100223bc
10007b73:	50                   	push   eax
10007b74:	6a 01                	push   0x1
10007b76:	8d 8d 34 fd ff ff    	lea    ecx,[ebp-0x2cc]
10007b7c:	ff 15 bc 23 02 10    	call   DWORD PTR ds:0x100223bc
10007b82:	50                   	push   eax
10007b83:	8d 8e 64 01 00 00    	lea    ecx,[esi+0x164]
10007b89:	ff 57 38             	call   DWORD PTR [edi+0x38]
10007b8c:	48                   	dec    eax
10007b8d:	8d 8e 64 01 00 00    	lea    ecx,[esi+0x164]
10007b93:	50                   	push   eax
10007b94:	8d 85 24 fd ff ff    	lea    eax,[ebp-0x2dc]
10007b9a:	50                   	push   eax
10007b9b:	ff 53 2c             	call   DWORD PTR [ebx+0x2c]
10007b9e:	50                   	push   eax
10007b9f:	8d 8e 64 01 00 00    	lea    ecx,[esi+0x164]
10007ba5:	ff 53 48             	call   DWORD PTR [ebx+0x48]
10007ba8:	8d 8d d4 fe ff ff    	lea    ecx,[ebp-0x12c]
10007bae:	ff 15 5c 23 02 10    	call   DWORD PTR ds:0x1002235c
10007bb4:	8d 4d cc             	lea    ecx,[ebp-0x34]
10007bb7:	c6 45 fc 06          	mov    BYTE PTR [ebp-0x4],0x6
10007bbb:	ff 15 a4 23 02 10    	call   DWORD PTR ds:0x100223a4
10007bc1:	8b 4d e4             	mov    ecx,DWORD PTR [ebp-0x1c]
10007bc4:	8d 45 e8             	lea    eax,[ebp-0x18]
10007bc7:	50                   	push   eax
10007bc8:	ff 15 a8 20 02 10    	call   DWORD PTR ds:0x100220a8
10007bce:	6a ff                	push   0xffffffff
10007bd0:	8b c8                	mov    ecx,eax
10007bd2:	c6 45 fc 18          	mov    BYTE PTR [ebp-0x4],0x18
10007bd6:	ff 15 90 20 02 10    	call   DWORD PTR ds:0x10022090
10007bdc:	50                   	push   eax
10007bdd:	8d 45 c8             	lea    eax,[ebp-0x38]
10007be0:	50                   	push   eax
10007be1:	ff 15 90 23 02 10    	call   DWORD PTR ds:0x10022390
10007be7:	83 c4 0c             	add    esp,0xc
10007bea:	50                   	push   eax
10007beb:	8d 4d b8             	lea    ecx,[ebp-0x48]
10007bee:	c6 45 fc 19          	mov    BYTE PTR [ebp-0x4],0x19
10007bf2:	ff 15 50 23 02 10    	call   DWORD PTR ds:0x10022350
10007bf8:	8b 9e 64 01 00 00    	mov    ebx,DWORD PTR [esi+0x164]
10007bfe:	8d 45 b8             	lea    eax,[ebp-0x48]
10007c01:	6a 02                	push   0x2
10007c03:	50                   	push   eax
10007c04:	8d 8d 14 fd ff ff    	lea    ecx,[ebp-0x2ec]
10007c0a:	c6 45 fc 1a          	mov    BYTE PTR [ebp-0x4],0x1a
10007c0e:	8b fb                	mov    edi,ebx
10007c10:	ff 15 bc 23 02 10    	call   DWORD PTR ds:0x100223bc
10007c16:	50                   	push   eax
10007c17:	6a 02                	push   0x2
10007c19:	8d 8d 74 ff ff ff    	lea    ecx,[ebp-0x8c]
10007c1f:	ff 15 bc 23 02 10    	call   DWORD PTR ds:0x100223bc
10007c25:	50                   	push   eax
10007c26:	8d 8e 64 01 00 00    	lea    ecx,[esi+0x164]
10007c2c:	ff 57 38             	call   DWORD PTR [edi+0x38]
10007c2f:	48                   	dec    eax
10007c30:	8d 8e 64 01 00 00    	lea    ecx,[esi+0x164]
10007c36:	50                   	push   eax
10007c37:	8d 45 84             	lea    eax,[ebp-0x7c]
10007c3a:	50                   	push   eax
10007c3b:	ff 53 2c             	call   DWORD PTR [ebx+0x2c]
10007c3e:	50                   	push   eax
10007c3f:	8d 8e 64 01 00 00    	lea    ecx,[esi+0x164]
10007c45:	ff 53 48             	call   DWORD PTR [ebx+0x48]
10007c48:	8d 4d b8             	lea    ecx,[ebp-0x48]
10007c4b:	ff 15 5c 23 02 10    	call   DWORD PTR ds:0x1002235c
10007c51:	8d 4d c8             	lea    ecx,[ebp-0x38]
10007c54:	ff 15 a4 23 02 10    	call   DWORD PTR ds:0x100223a4
10007c5a:	8d 4d e8             	lea    ecx,[ebp-0x18]
10007c5d:	c6 45 fc 06          	mov    BYTE PTR [ebp-0x4],0x6
10007c61:	ff 15 48 21 02 10    	call   DWORD PTR ds:0x10022148
10007c67:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
10007c6a:	41                   	inc    ecx
10007c6b:	89 4d ec             	mov    DWORD PTR [ebp-0x14],ecx
10007c6e:	3b 4d dc             	cmp    ecx,DWORD PTR [ebp-0x24]
10007c71:	0f 8c 59 f9 ff ff    	jl     0x100075d0
10007c77:	8b 3d 6c 23 02 10    	mov    edi,DWORD PTR ds:0x1002236c
10007c7d:	8b 1d 40 21 02 10    	mov    ebx,DWORD PTR ds:0x10022140
10007c83:	8b 8e 48 01 00 00    	mov    ecx,DWORD PTR [esi+0x148]
10007c89:	6a 00                	push   0x0
10007c8b:	8b 49 20             	mov    ecx,DWORD PTR [ecx+0x20]
10007c8e:	ff d7                	call   edi
10007c90:	8b 8e 50 01 00 00    	mov    ecx,DWORD PTR [esi+0x150]
10007c96:	6a 00                	push   0x0
10007c98:	8b 49 28             	mov    ecx,DWORD PTR [ecx+0x28]
10007c9b:	ff 15 60 28 02 10    	call   DWORD PTR ds:0x10022860
10007ca1:	8d 4d dc             	lea    ecx,[ebp-0x24]
10007ca4:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
10007cab:	ff 15 cc 20 02 10    	call   DWORD PTR ds:0x100220cc
10007cb1:	8b 4e 38             	mov    ecx,DWORD PTR [esi+0x38]
10007cb4:	ff d3                	call   ebx
10007cb6:	8b 1d 94 20 02 10    	mov    ebx,DWORD PTR ds:0x10022094
10007cbc:	83 f8 01             	cmp    eax,0x1
10007cbf:	75 4f                	jne    0x10007d10
10007cc1:	8b 4e 38             	mov    ecx,DWORD PTR [esi+0x38]
10007cc4:	ff d3                	call   ebx
10007cc6:	83 f8 02             	cmp    eax,0x2
10007cc9:	75 45                	jne    0x10007d10
10007ccb:	8b 8e fc 00 00 00    	mov    ecx,DWORD PTR [esi+0xfc]
10007cd1:	c7 46 2c 01 00 00 00 	mov    DWORD PTR [esi+0x2c],0x1
10007cd8:	ff 15 b0 28 02 10    	call   DWORD PTR ds:0x100228b0
10007cde:	50                   	push   eax
10007cdf:	b9 90 bc 05 10       	mov    ecx,0x1005bc90
10007ce4:	ff 15 54 24 02 10    	call   DWORD PTR ds:0x10022454
10007cea:	8b c8                	mov    ecx,eax
10007cec:	ff 70 7c             	push   DWORD PTR [eax+0x7c]
10007cef:	ff 70 78             	push   DWORD PTR [eax+0x78]
10007cf2:	e8 99 f2 00 00       	call   0x10016f90
10007cf7:	50                   	push   eax
10007cf8:	8b ce                	mov    ecx,esi
10007cfa:	e8 f1 b3 ff ff       	call   0x100030f0
10007cff:	8b 8e 50 01 00 00    	mov    ecx,DWORD PTR [esi+0x150]
10007d05:	6a 01                	push   0x1
10007d07:	8b 49 28             	mov    ecx,DWORD PTR [ecx+0x28]
10007d0a:	ff 15 60 28 02 10    	call   DWORD PTR ds:0x10022860
10007d10:	8b 4e 38             	mov    ecx,DWORD PTR [esi+0x38]
10007d13:	ff d3                	call   ebx
10007d15:	83 f8 01             	cmp    eax,0x1
10007d18:	0f 85 b7 02 00 00    	jne    0x10007fd5
10007d1e:	8b 8e 50 01 00 00    	mov    ecx,DWORD PTR [esi+0x150]
10007d24:	50                   	push   eax
10007d25:	8b 49 28             	mov    ecx,DWORD PTR [ecx+0x28]
10007d28:	ff 15 60 28 02 10    	call   DWORD PTR ds:0x10022860
10007d2e:	8b 8e 4c 01 00 00    	mov    ecx,DWORD PTR [esi+0x14c]
10007d34:	ff 15 28 28 02 10    	call   DWORD PTR ds:0x10022828
10007d3a:	8b 8e 4c 01 00 00    	mov    ecx,DWORD PTR [esi+0x14c]
10007d40:	8b 46 38             	mov    eax,DWORD PTR [esi+0x38]
10007d43:	89 41 2c             	mov    DWORD PTR [ecx+0x2c],eax
10007d46:	8d 4d cc             	lea    ecx,[ebp-0x34]
10007d49:	ff 15 3c 24 02 10    	call   DWORD PTR ds:0x1002243c
10007d4f:	8b 8e 4c 01 00 00    	mov    ecx,DWORD PTR [esi+0x14c]
10007d55:	6a 01                	push   0x1
10007d57:	83 c1 24             	add    ecx,0x24
10007d5a:	c7 45 fc 1b 00 00 00 	mov    DWORD PTR [ebp-0x4],0x1b
10007d61:	ff d7                	call   edi
10007d63:	8b 8e 4c 01 00 00    	mov    ecx,DWORD PTR [esi+0x14c]
10007d69:	83 c1 24             	add    ecx,0x24
10007d6c:	ff 15 a4 24 02 10    	call   DWORD PTR ds:0x100224a4
10007d72:	8b 8e 4c 01 00 00    	mov    ecx,DWORD PTR [esi+0x14c]
10007d78:	6a 01                	push   0x1
10007d7a:	83 c1 24             	add    ecx,0x24
10007d7d:	ff 15 a8 24 02 10    	call   DWORD PTR ds:0x100224a8
10007d83:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10007d86:	8b 8e 4c 01 00 00    	mov    ecx,DWORD PTR [esi+0x14c]
10007d8c:	83 c1 24             	add    ecx,0x24
10007d8f:	8b 80 cc 01 00 00    	mov    eax,DWORD PTR [eax+0x1cc]
10007d95:	ff 70 04             	push   DWORD PTR [eax+0x4]
10007d98:	ff 15 f8 25 02 10    	call   DWORD PTR ds:0x100225f8
10007d9e:	8b 4e 38             	mov    ecx,DWORD PTR [esi+0x38]
10007da1:	33 db                	xor    ebx,ebx
10007da3:	ff 15 38 21 02 10    	call   DWORD PTR ds:0x10022138
10007da9:	85 c0                	test   eax,eax
10007dab:	0f 8e e0 00 00 00    	jle    0x10007e91
10007db1:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10007db4:	8b 80 cc 01 00 00    	mov    eax,DWORD PTR [eax+0x1cc]
10007dba:	3b 58 04             	cmp    ebx,DWORD PTR [eax+0x4]
10007dbd:	0f 8d c8 00 00 00    	jge    0x10007e8b
10007dc3:	8b 4e 38             	mov    ecx,DWORD PTR [esi+0x38]
10007dc6:	8d 45 c8             	lea    eax,[ebp-0x38]
10007dc9:	53                   	push   ebx
10007dca:	50                   	push   eax
10007dcb:	ff 15 34 21 02 10    	call   DWORD PTR ds:0x10022134
10007dd1:	6a ff                	push   0xffffffff
10007dd3:	8b c8                	mov    ecx,eax
10007dd5:	c6 45 fc 1c          	mov    BYTE PTR [ebp-0x4],0x1c
10007dd9:	ff 15 90 20 02 10    	call   DWORD PTR ds:0x10022090
10007ddf:	50                   	push   eax
10007de0:	8d 45 e8             	lea    eax,[ebp-0x18]
10007de3:	50                   	push   eax
10007de4:	ff 15 90 23 02 10    	call   DWORD PTR ds:0x10022390
10007dea:	68 c8 b3 05 10       	push   0x1005b3c8
10007def:	50                   	push   eax
10007df0:	8d 45 ec             	lea    eax,[ebp-0x14]
10007df3:	c6 45 fc 1d          	mov    BYTE PTR [ebp-0x4],0x1d
10007df7:	50                   	push   eax
10007df8:	e8 53 99 ff ff       	call   0x10001750
10007dfd:	83 c4 18             	add    esp,0x18
10007e00:	8d 4d e8             	lea    ecx,[ebp-0x18]
10007e03:	ff 15 a4 23 02 10    	call   DWORD PTR ds:0x100223a4
10007e09:	8d 4d c8             	lea    ecx,[ebp-0x38]
10007e0c:	c6 45 fc 20          	mov    BYTE PTR [ebp-0x4],0x20
10007e10:	ff 15 48 21 02 10    	call   DWORD PTR ds:0x10022148
10007e16:	8d 45 ec             	lea    eax,[ebp-0x14]
10007e19:	50                   	push   eax
10007e1a:	8d 4d b8             	lea    ecx,[ebp-0x48]
10007e1d:	ff 15 50 23 02 10    	call   DWORD PTR ds:0x10022350
10007e23:	8b 86 4c 01 00 00    	mov    eax,DWORD PTR [esi+0x14c]
10007e29:	8d 4d 84             	lea    ecx,[ebp-0x7c]
10007e2c:	6a 02                	push   0x2
10007e2e:	c6 45 fc 21          	mov    BYTE PTR [ebp-0x4],0x21
10007e32:	8b 78 24             	mov    edi,DWORD PTR [eax+0x24]
10007e35:	8d 45 b8             	lea    eax,[ebp-0x48]
10007e38:	50                   	push   eax
10007e39:	ff 15 bc 23 02 10    	call   DWORD PTR ds:0x100223bc
10007e3f:	8b 8e 4c 01 00 00    	mov    ecx,DWORD PTR [esi+0x14c]
10007e45:	50                   	push   eax
10007e46:	6a 00                	push   0x0
10007e48:	53                   	push   ebx
10007e49:	8d 85 74 ff ff ff    	lea    eax,[ebp-0x8c]
10007e4f:	83 c1 24             	add    ecx,0x24
10007e52:	50                   	push   eax
10007e53:	ff 57 2c             	call   DWORD PTR [edi+0x2c]
10007e56:	8b 8e 4c 01 00 00    	mov    ecx,DWORD PTR [esi+0x14c]
10007e5c:	50                   	push   eax
10007e5d:	83 c1 24             	add    ecx,0x24
10007e60:	ff 57 48             	call   DWORD PTR [edi+0x48]
10007e63:	8d 4d b8             	lea    ecx,[ebp-0x48]
10007e66:	ff 15 5c 23 02 10    	call   DWORD PTR ds:0x1002235c
10007e6c:	8d 4d ec             	lea    ecx,[ebp-0x14]
10007e6f:	c6 45 fc 1b          	mov    BYTE PTR [ebp-0x4],0x1b
10007e73:	ff 15 a4 23 02 10    	call   DWORD PTR ds:0x100223a4
10007e79:	8b 4e 38             	mov    ecx,DWORD PTR [esi+0x38]
10007e7c:	43                   	inc    ebx
10007e7d:	ff 15 38 21 02 10    	call   DWORD PTR ds:0x10022138
10007e83:	3b d8                	cmp    ebx,eax
10007e85:	0f 8c 26 ff ff ff    	jl     0x10007db1
10007e8b:	8b 3d 6c 23 02 10    	mov    edi,DWORD PTR ds:0x1002236c
10007e91:	8b 8e 4c 01 00 00    	mov    ecx,DWORD PTR [esi+0x14c]
10007e97:	6a 00                	push   0x0
10007e99:	83 c1 24             	add    ecx,0x24
10007e9c:	ff d7                	call   edi
10007e9e:	8b 8e 54 01 00 00    	mov    ecx,DWORD PTR [esi+0x154]
10007ea4:	ff 15 28 28 02 10    	call   DWORD PTR ds:0x10022828
10007eaa:	8b 86 4c 01 00 00    	mov    eax,DWORD PTR [esi+0x14c]
10007eb0:	6a 00                	push   0x0
10007eb2:	8b 48 1c             	mov    ecx,DWORD PTR [eax+0x1c]
10007eb5:	8b 01                	mov    eax,DWORD PTR [ecx]
10007eb7:	ff 90 c4 00 00 00    	call   DWORD PTR [eax+0xc4]
10007ebd:	8b 86 4c 01 00 00    	mov    eax,DWORD PTR [esi+0x14c]
10007ec3:	8b 48 1c             	mov    ecx,DWORD PTR [eax+0x1c]
10007ec6:	83 c0 24             	add    eax,0x24
10007ec9:	50                   	push   eax
10007eca:	8b 11                	mov    edx,DWORD PTR [ecx]
10007ecc:	ff 92 c4 00 00 00    	call   DWORD PTR [edx+0xc4]
10007ed2:	8b 4e 38             	mov    ecx,DWORD PTR [esi+0x38]
10007ed5:	8d 45 dc             	lea    eax,[ebp-0x24]
10007ed8:	6a 3f                	push   0x3f
10007eda:	50                   	push   eax
10007edb:	ff 15 14 21 02 10    	call   DWORD PTR ds:0x10022114
10007ee1:	33 c9                	xor    ecx,ecx
10007ee3:	c6 45 fc 22          	mov    BYTE PTR [ebp-0x4],0x22
10007ee7:	89 4d 08             	mov    DWORD PTR [ebp+0x8],ecx
10007eea:	39 4d dc             	cmp    DWORD PTR [ebp-0x24],ecx
10007eed:	0f 8e 8b 00 00 00    	jle    0x10007f7e
10007ef3:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
10007ef6:	8b 3c 88             	mov    edi,DWORD PTR [eax+ecx*4]
10007ef9:	8b 8e 54 01 00 00    	mov    ecx,DWORD PTR [esi+0x154]
10007eff:	89 7d e8             	mov    DWORD PTR [ebp-0x18],edi
10007f02:	e8 b9 34 01 00       	call   0x1001b3c0
10007f07:	8b d8                	mov    ebx,eax
10007f09:	a1 6c 23 02 10       	mov    eax,ds:0x1002236c
10007f0e:	6a 01                	push   0x1
10007f10:	8b 4b 1c             	mov    ecx,DWORD PTR [ebx+0x1c]
10007f13:	ff d0                	call   eax
10007f15:	8b cf                	mov    ecx,edi
10007f17:	ff 15 00 21 02 10    	call   DWORD PTR ds:0x10022100
10007f1d:	50                   	push   eax
10007f1e:	8d 4d b8             	lea    ecx,[ebp-0x48]
10007f21:	ff 15 58 23 02 10    	call   DWORD PTR ds:0x10022358
10007f27:	8b 4b 1c             	mov    ecx,DWORD PTR [ebx+0x1c]
10007f2a:	8d 45 b8             	lea    eax,[ebp-0x48]
10007f2d:	6a 10                	push   0x10
10007f2f:	68 01 01 00 00       	push   0x101
10007f34:	50                   	push   eax
10007f35:	c6 45 fc 23          	mov    BYTE PTR [ebp-0x4],0x23
10007f39:	ff 15 ec 28 02 10    	call   DWORD PTR ds:0x100228ec
10007f3f:	8d 4d b8             	lea    ecx,[ebp-0x48]
10007f42:	c6 45 fc 22          	mov    BYTE PTR [ebp-0x4],0x22
10007f46:	8b f8                	mov    edi,eax
10007f48:	ff 15 5c 23 02 10    	call   DWORD PTR ds:0x1002235c
10007f4e:	8b 4b 1c             	mov    ecx,DWORD PTR [ebx+0x1c]
10007f51:	57                   	push   edi
10007f52:	ff 15 fc 28 02 10    	call   DWORD PTR ds:0x100228fc
10007f58:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
10007f5b:	8b 4b 1c             	mov    ecx,DWORD PTR [ebx+0x1c]
10007f5e:	89 7b 24             	mov    DWORD PTR [ebx+0x24],edi
10007f61:	8b 3d 6c 23 02 10    	mov    edi,DWORD PTR ds:0x1002236c
10007f67:	6a 00                	push   0x0
10007f69:	89 43 50             	mov    DWORD PTR [ebx+0x50],eax
10007f6c:	ff d7                	call   edi
10007f6e:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
10007f71:	41                   	inc    ecx
10007f72:	89 4d 08             	mov    DWORD PTR [ebp+0x8],ecx
10007f75:	3b 4d dc             	cmp    ecx,DWORD PTR [ebp-0x24]
10007f78:	0f 8c 75 ff ff ff    	jl     0x10007ef3
10007f7e:	8b 8e fc 00 00 00    	mov    ecx,DWORD PTR [esi+0xfc]
10007f84:	8b 3d b0 28 02 10    	mov    edi,DWORD PTR ds:0x100228b0
10007f8a:	c7 46 2c 03 00 00 00 	mov    DWORD PTR [esi+0x2c],0x3
10007f91:	ff d7                	call   edi
10007f93:	50                   	push   eax
10007f94:	b9 90 bc 05 10       	mov    ecx,0x1005bc90
10007f99:	ff 15 54 24 02 10    	call   DWORD PTR ds:0x10022454
10007f9f:	8b c8                	mov    ecx,eax
10007fa1:	ff 70 7c             	push   DWORD PTR [eax+0x7c]
10007fa4:	ff 70 78             	push   DWORD PTR [eax+0x78]
10007fa7:	e8 e4 ef 00 00       	call   0x10016f90
10007fac:	50                   	push   eax
10007fad:	8b ce                	mov    ecx,esi
10007faf:	e8 3c b1 ff ff       	call   0x100030f0
10007fb4:	8d 4d dc             	lea    ecx,[ebp-0x24]
10007fb7:	ff 15 cc 20 02 10    	call   DWORD PTR ds:0x100220cc
10007fbd:	8d 4d cc             	lea    ecx,[ebp-0x34]
10007fc0:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
10007fc7:	ff 15 a4 23 02 10    	call   DWORD PTR ds:0x100223a4
10007fcd:	8b 1d 94 20 02 10    	mov    ebx,DWORD PTR ds:0x10022094
10007fd3:	eb 06                	jmp    0x10007fdb
10007fd5:	8b 3d b0 28 02 10    	mov    edi,DWORD PTR ds:0x100228b0
10007fdb:	8b 4e 38             	mov    ecx,DWORD PTR [esi+0x38]
10007fde:	ff d3                	call   ebx
10007fe0:	83 f8 03             	cmp    eax,0x3
10007fe3:	75 41                	jne    0x10008026
10007fe5:	8b 8e fc 00 00 00    	mov    ecx,DWORD PTR [esi+0xfc]
10007feb:	c7 46 2c 04 00 00 00 	mov    DWORD PTR [esi+0x2c],0x4
10007ff2:	ff d7                	call   edi
10007ff4:	50                   	push   eax
10007ff5:	b9 90 bc 05 10       	mov    ecx,0x1005bc90
10007ffa:	ff 15 54 24 02 10    	call   DWORD PTR ds:0x10022454
10008000:	8b c8                	mov    ecx,eax
10008002:	ff 70 7c             	push   DWORD PTR [eax+0x7c]
10008005:	ff 70 78             	push   DWORD PTR [eax+0x78]
10008008:	e8 83 ef 00 00       	call   0x10016f90
1000800d:	50                   	push   eax
1000800e:	8b ce                	mov    ecx,esi
10008010:	e8 db b0 ff ff       	call   0x100030f0
10008015:	8b 8e 50 01 00 00    	mov    ecx,DWORD PTR [esi+0x150]
1000801b:	6a 01                	push   0x1
1000801d:	8b 49 28             	mov    ecx,DWORD PTR [ecx+0x28]
10008020:	ff 15 60 28 02 10    	call   DWORD PTR ds:0x10022860
10008026:	8b 4e 38             	mov    ecx,DWORD PTR [esi+0x38]
10008029:	8d 45 ac             	lea    eax,[ebp-0x54]
1000802c:	6a 21                	push   0x21
1000802e:	50                   	push   eax
1000802f:	ff 15 14 21 02 10    	call   DWORD PTR ds:0x10022114
10008035:	8b 4e 38             	mov    ecx,DWORD PTR [esi+0x38]
10008038:	8b 3d 18 21 02 10    	mov    edi,DWORD PTR ds:0x10022118
1000803e:	c7 45 fc 24 00 00 00 	mov    DWORD PTR [ebp-0x4],0x24
10008045:	ff d7                	call   edi
10008047:	85 c0                	test   eax,eax
10008049:	74 0e                	je     0x10008059
1000804b:	8b 4e 38             	mov    ecx,DWORD PTR [esi+0x38]
1000804e:	ff d7                	call   edi
10008050:	8b c8                	mov    ecx,eax
10008052:	ff d3                	call   ebx
10008054:	83 f8 03             	cmp    eax,0x3
10008057:	74 0a                	je     0x10008063
10008059:	83 7d ac 00          	cmp    DWORD PTR [ebp-0x54],0x0
1000805d:	0f 84 a6 00 00 00    	je     0x10008109
10008063:	8b 8e 58 01 00 00    	mov    ecx,DWORD PTR [esi+0x158]
10008069:	ff 15 28 28 02 10    	call   DWORD PTR ds:0x10022828
1000806f:	33 c9                	xor    ecx,ecx
10008071:	89 4d 08             	mov    DWORD PTR [ebp+0x8],ecx
10008074:	39 4d ac             	cmp    DWORD PTR [ebp-0x54],ecx
10008077:	0f 8e 8c 00 00 00    	jle    0x10008109
1000807d:	0f 1f 00             	nop    DWORD PTR [eax]
10008080:	8b 45 b0             	mov    eax,DWORD PTR [ebp-0x50]
10008083:	8b 3c 88             	mov    edi,DWORD PTR [eax+ecx*4]
10008086:	8b 8e 58 01 00 00    	mov    ecx,DWORD PTR [esi+0x158]
1000808c:	89 7d e8             	mov    DWORD PTR [ebp-0x18],edi
1000808f:	e8 2c 33 01 00       	call   0x1001b3c0
10008094:	8b d8                	mov    ebx,eax
10008096:	a1 6c 23 02 10       	mov    eax,ds:0x1002236c
1000809b:	6a 01                	push   0x1
1000809d:	8b 4b 1c             	mov    ecx,DWORD PTR [ebx+0x1c]
100080a0:	ff d0                	call   eax
100080a2:	8b cf                	mov    ecx,edi
100080a4:	ff 15 00 21 02 10    	call   DWORD PTR ds:0x10022100
100080aa:	50                   	push   eax
100080ab:	8d 4d b8             	lea    ecx,[ebp-0x48]
100080ae:	ff 15 58 23 02 10    	call   DWORD PTR ds:0x10022358
100080b4:	8b 4b 1c             	mov    ecx,DWORD PTR [ebx+0x1c]
100080b7:	8d 45 b8             	lea    eax,[ebp-0x48]
100080ba:	6a 10                	push   0x10
100080bc:	68 01 01 00 00       	push   0x101
100080c1:	50                   	push   eax
100080c2:	c6 45 fc 25          	mov    BYTE PTR [ebp-0x4],0x25
100080c6:	ff 15 ec 28 02 10    	call   DWORD PTR ds:0x100228ec
100080cc:	8d 4d b8             	lea    ecx,[ebp-0x48]
100080cf:	c6 45 fc 24          	mov    BYTE PTR [ebp-0x4],0x24
100080d3:	8b f8                	mov    edi,eax
100080d5:	ff 15 5c 23 02 10    	call   DWORD PTR ds:0x1002235c
100080db:	8b 4b 1c             	mov    ecx,DWORD PTR [ebx+0x1c]
100080de:	57                   	push   edi
100080df:	ff 15 fc 28 02 10    	call   DWORD PTR ds:0x100228fc
100080e5:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
100080e8:	8b 4b 1c             	mov    ecx,DWORD PTR [ebx+0x1c]
100080eb:	6a 00                	push   0x0
100080ed:	89 7b 24             	mov    DWORD PTR [ebx+0x24],edi
100080f0:	89 43 50             	mov    DWORD PTR [ebx+0x50],eax
100080f3:	ff 15 6c 23 02 10    	call   DWORD PTR ds:0x1002236c
100080f9:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
100080fc:	41                   	inc    ecx
100080fd:	89 4d 08             	mov    DWORD PTR [ebp+0x8],ecx
10008100:	3b 4d ac             	cmp    ecx,DWORD PTR [ebp-0x54]
10008103:	0f 8c 77 ff ff ff    	jl     0x10008080
10008109:	ff 75 b4             	push   DWORD PTR [ebp-0x4c]
1000810c:	8d 8e 40 01 00 00    	lea    ecx,[esi+0x140]
10008112:	e8 69 d4 ff ff       	call   0x10005580
10008117:	8d 4d 84             	lea    ecx,[ebp-0x7c]
1000811a:	51                   	push   ecx
1000811b:	8b 08                	mov    ecx,DWORD PTR [eax]
1000811d:	ff 15 18 26 02 10    	call   DWORD PTR ds:0x10022618
10008123:	8b 8e ec 00 00 00    	mov    ecx,DWORD PTR [esi+0xec]
10008129:	50                   	push   eax
1000812a:	ff 15 78 29 02 10    	call   DWORD PTR ds:0x10022978
10008130:	ff 75 b4             	push   DWORD PTR [ebp-0x4c]
10008133:	8b 9e 30 01 00 00    	mov    ebx,DWORD PTR [esi+0x130]
10008139:	8d 8e 44 01 00 00    	lea    ecx,[esi+0x144]
1000813f:	e8 3c d4 ff ff       	call   0x10005580
10008144:	8d 4d 84             	lea    ecx,[ebp-0x7c]
10008147:	51                   	push   ecx
10008148:	8b 08                	mov    ecx,DWORD PTR [eax]
1000814a:	ff 15 18 26 02 10    	call   DWORD PTR ds:0x10022618
10008150:	50                   	push   eax
10008151:	8d 85 74 ff ff ff    	lea    eax,[ebp-0x8c]
10008157:	50                   	push   eax
10008158:	8d 8e 30 01 00 00    	lea    ecx,[esi+0x130]
1000815e:	ff 93 bc 00 00 00    	call   DWORD PTR [ebx+0xbc]
10008164:	8b 8e f8 00 00 00    	mov    ecx,DWORD PTR [esi+0xf8]
1000816a:	50                   	push   eax
1000816b:	ff 15 78 29 02 10    	call   DWORD PTR ds:0x10022978
10008171:	8b 8e 50 01 00 00    	mov    ecx,DWORD PTR [esi+0x150]
10008177:	8b 1d 6c 23 02 10    	mov    ebx,DWORD PTR ds:0x1002236c
1000817d:	6a 01                	push   0x1
1000817f:	8b 49 28             	mov    ecx,DWORD PTR [ecx+0x28]
10008182:	ff d3                	call   ebx
10008184:	8b 4e 38             	mov    ecx,DWORD PTR [esi+0x38]
10008187:	ff 15 dc 20 02 10    	call   DWORD PTR ds:0x100220dc
1000818d:	50                   	push   eax
1000818e:	8d 4d b8             	lea    ecx,[ebp-0x48]
10008191:	ff 15 d0 23 02 10    	call   DWORD PTR ds:0x100223d0
10008197:	8b 8e 50 01 00 00    	mov    ecx,DWORD PTR [esi+0x150]
1000819d:	8d 45 b8             	lea    eax,[ebp-0x48]
100081a0:	6a 10                	push   0x10
100081a2:	68 01 01 00 00       	push   0x101
100081a7:	50                   	push   eax
100081a8:	8b 49 28             	mov    ecx,DWORD PTR [ecx+0x28]
100081ab:	c6 45 fc 26          	mov    BYTE PTR [ebp-0x4],0x26
100081af:	ff 15 ec 28 02 10    	call   DWORD PTR ds:0x100228ec
100081b5:	8b 8e 50 01 00 00    	mov    ecx,DWORD PTR [esi+0x150]
100081bb:	50                   	push   eax
100081bc:	8b 49 28             	mov    ecx,DWORD PTR [ecx+0x28]
100081bf:	ff 15 fc 28 02 10    	call   DWORD PTR ds:0x100228fc
100081c5:	8d 4d b8             	lea    ecx,[ebp-0x48]
100081c8:	ff 15 5c 23 02 10    	call   DWORD PTR ds:0x1002235c
100081ce:	8b 8e 50 01 00 00    	mov    ecx,DWORD PTR [esi+0x150]
100081d4:	6a 00                	push   0x0
100081d6:	8b 49 28             	mov    ecx,DWORD PTR [ecx+0x28]
100081d9:	ff d3                	call   ebx
100081db:	8d 4d ac             	lea    ecx,[ebp-0x54]
100081de:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
100081e5:	ff 15 cc 20 02 10    	call   DWORD PTR ds:0x100220cc
100081eb:	eb 68                	jmp    0x10008255
100081ed:	8b 8e fc 00 00 00    	mov    ecx,DWORD PTR [esi+0xfc]
100081f3:	c7 46 38 00 00 00 00 	mov    DWORD PTR [esi+0x38],0x0
100081fa:	c7 46 2c 00 00 00 00 	mov    DWORD PTR [esi+0x2c],0x0
10008201:	ff 15 b0 28 02 10    	call   DWORD PTR ds:0x100228b0
10008207:	50                   	push   eax
10008208:	b9 90 bc 05 10       	mov    ecx,0x1005bc90
1000820d:	ff                   	.byte 0xff
1000820e:	15                   	.byte 0x15
1000820f:	54                   	push   esp

; ===== create_and_delete_nested_diagram [0x10009fb0, 0x1000a290) =====

/mnt/data/work_stage117/re_inputs/modules/PM_auto.dll:     file format pei-i386


Disassembly of section .text:

10009fb0 <.text+0x8fb0>:
10009fb0:	53                   	push   ebx
10009fb1:	56                   	push   esi
10009fb2:	8b f1                	mov    esi,ecx
10009fb4:	57                   	push   edi
10009fb5:	8b 8e fc 00 00 00    	mov    ecx,DWORD PTR [esi+0xfc]
10009fbb:	ff 15 b0 28 02 10    	call   DWORD PTR ds:0x100228b0
10009fc1:	50                   	push   eax
10009fc2:	b9 90 bc 05 10       	mov    ecx,0x1005bc90
10009fc7:	ff 15 54 24 02 10    	call   DWORD PTR ds:0x10022454
10009fcd:	8b f8                	mov    edi,eax
10009fcf:	8b cf                	mov    ecx,edi
10009fd1:	e8 fa cf 00 00       	call   0x10016fd0
10009fd6:	8b d8                	mov    ebx,eax
10009fd8:	8b 8b d0 01 00 00    	mov    ecx,DWORD PTR [ebx+0x1d0]
10009fde:	ff 15 40 21 02 10    	call   DWORD PTR ds:0x10022140
10009fe4:	85 c0                	test   eax,eax
10009fe6:	74 40                	je     0x1000a028
10009fe8:	8b 8e fc 00 00 00    	mov    ecx,DWORD PTR [esi+0xfc]
10009fee:	ff 15 b0 28 02 10    	call   DWORD PTR ds:0x100228b0
10009ff4:	50                   	push   eax
10009ff5:	b9 90 bc 05 10       	mov    ecx,0x1005bc90
10009ffa:	ff 15 54 24 02 10    	call   DWORD PTR ds:0x10022454
1000a000:	53                   	push   ebx
1000a001:	8b ce                	mov    ecx,esi
1000a003:	e8 68 f1 ff ff       	call   0x10009170
1000a008:	8b f0                	mov    esi,eax
1000a00a:	6a 00                	push   0x0
1000a00c:	6a 00                	push   0x0
1000a00e:	8b ce                	mov    ecx,esi
1000a010:	e8 7b cf 00 00       	call   0x10016f90
1000a015:	8b cb                	mov    ecx,ebx
1000a017:	89 98 d8 01 00 00    	mov    DWORD PTR [eax+0x1d8],ebx
1000a01d:	e8 8e e2 00 00       	call   0x100182b0
1000a022:	89 b3 c4 01 00 00    	mov    DWORD PTR [ebx+0x1c4],esi
1000a028:	8b cf                	mov    ecx,edi
1000a02a:	e8 71 b0 00 00       	call   0x100150a0
1000a02f:	8b cf                	mov    ecx,edi
1000a031:	5f                   	pop    edi
1000a032:	5e                   	pop    esi
1000a033:	5b                   	pop    ebx
1000a034:	e9 37 cf 00 00       	jmp    0x10016f70
1000a039:	cc                   	int3
1000a03a:	cc                   	int3
1000a03b:	cc                   	int3
1000a03c:	cc                   	int3
1000a03d:	cc                   	int3
1000a03e:	cc                   	int3
1000a03f:	cc                   	int3
1000a040:	55                   	push   ebp
1000a041:	8b ec                	mov    ebp,esp
1000a043:	6a ff                	push   0xffffffff
1000a045:	68 2e f2 01 10       	push   0x1001f22e
1000a04a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
1000a050:	50                   	push   eax
1000a051:	b8 00 10 00 00       	mov    eax,0x1000
1000a056:	e8 15 32 01 00       	call   0x1001d270
1000a05b:	a1 cc f0 06 10       	mov    eax,ds:0x1006f0cc
1000a060:	33 c5                	xor    eax,ebp
1000a062:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
1000a065:	53                   	push   ebx
1000a066:	56                   	push   esi
1000a067:	57                   	push   edi
1000a068:	50                   	push   eax
1000a069:	8d 45 f4             	lea    eax,[ebp-0xc]
1000a06c:	64 a3 00 00 00 00    	mov    fs:0x0,eax
1000a072:	8b c1                	mov    eax,ecx
1000a074:	89 85 f4 ef ff ff    	mov    DWORD PTR [ebp-0x100c],eax
1000a07a:	8b 88 fc 00 00 00    	mov    ecx,DWORD PTR [eax+0xfc]
1000a080:	ff 15 b0 28 02 10    	call   DWORD PTR ds:0x100228b0
1000a086:	50                   	push   eax
1000a087:	b9 90 bc 05 10       	mov    ecx,0x1005bc90
1000a08c:	ff 15 54 24 02 10    	call   DWORD PTR ds:0x10022454
1000a092:	8b d8                	mov    ebx,eax
1000a094:	8b cb                	mov    ecx,ebx
1000a096:	89 9d 20 f0 ff ff    	mov    DWORD PTR [ebp-0xfe0],ebx
1000a09c:	e8 2f cf 00 00       	call   0x10016fd0
1000a0a1:	8b f8                	mov    edi,eax
1000a0a3:	6a 00                	push   0x0
1000a0a5:	6a 00                	push   0x0
1000a0a7:	8b 8f c4 01 00 00    	mov    ecx,DWORD PTR [edi+0x1c4]
1000a0ad:	e8 de ce 00 00       	call   0x10016f90
1000a0b2:	8b f0                	mov    esi,eax
1000a0b4:	c7 85 1c f0 ff ff 00 	mov    DWORD PTR [ebp-0xfe4],0x0
1000a0bb:	00 00 00 
1000a0be:	68 a0 0f 00 00       	push   0xfa0
1000a0c3:	8d 85 50 f0 ff ff    	lea    eax,[ebp-0xfb0]
1000a0c9:	89 b5 18 f0 ff ff    	mov    DWORD PTR [ebp-0xfe8],esi
1000a0cf:	6a 00                	push   0x0
1000a0d1:	50                   	push   eax
1000a0d2:	e8 a1 3a 01 00       	call   0x1001db78
1000a0d7:	8d 85 1c f0 ff ff    	lea    eax,[ebp-0xfe4]
1000a0dd:	c7 85 28 f0 ff ff 04 	mov    DWORD PTR [ebp-0xfd8],0x1005b904
1000a0e4:	b9 05 10 
1000a0e7:	89 85 0c f0 ff ff    	mov    DWORD PTR [ebp-0xff4],eax
1000a0ed:	83 c4 0c             	add    esp,0xc
1000a0f0:	8d 85 50 f0 ff ff    	lea    eax,[ebp-0xfb0]
1000a0f6:	89 85 10 f0 ff ff    	mov    DWORD PTR [ebp-0xff0],eax
1000a0fc:	8d 85 28 f0 ff ff    	lea    eax,[ebp-0xfd8]
1000a102:	f3 0f 7e 85 0c f0 ff 	movq   xmm0,QWORD PTR [ebp-0xff4]
1000a109:	ff 
1000a10a:	66 0f d6 85 2c f0 ff 	movq   QWORD PTR [ebp-0xfd4],xmm0
1000a111:	ff 
1000a112:	89 85 34 f0 ff ff    	mov    DWORD PTR [ebp-0xfcc],eax
1000a118:	89 85 4c f0 ff ff    	mov    DWORD PTR [ebp-0xfb4],eax
1000a11e:	8d 85 fc ef ff ff    	lea    eax,[ebp-0x1004]
1000a124:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000a12b:	50                   	push   eax
1000a12c:	8d 85 f8 ef ff ff    	lea    eax,[ebp-0x1008]
1000a132:	89 b5 fc ef ff ff    	mov    DWORD PTR [ebp-0x1004],esi
1000a138:	50                   	push   eax
1000a139:	8d 8d 28 f0 ff ff    	lea    ecx,[ebp-0xfd8]
1000a13f:	c7 85 f8 ef ff ff 00 	mov    DWORD PTR [ebp-0x1008],0x0
1000a146:	00 00 00 
1000a149:	e8 12 e9 ff ff       	call   0x10008a60
1000a14e:	8b b7 e0 01 00 00    	mov    esi,DWORD PTR [edi+0x1e0]
1000a154:	8b cb                	mov    ecx,ebx
1000a156:	e8 15 a1 00 00       	call   0x10014270
1000a15b:	8b 95 1c f0 ff ff    	mov    edx,DWORD PTR [ebp-0xfe4]
1000a161:	8d 0c 16             	lea    ecx,[esi+edx*1]
1000a164:	3b c8                	cmp    ecx,eax
1000a166:	0f 8d 2b 01 00 00    	jge    0x1000a297
1000a16c:	33 f6                	xor    esi,esi
1000a16e:	85 d2                	test   edx,edx
1000a170:	7e 37                	jle    0x1000a1a9
1000a172:	0f 1f 40 00          	nop    DWORD PTR [eax+0x0]
1000a176:	66 66 0f 1f 84 00 00 	data16 nop WORD PTR [eax+eax*1+0x0]
1000a17d:	00 00 00 
1000a180:	8b 87 e0 01 00 00    	mov    eax,DWORD PTR [edi+0x1e0]
1000a186:	8b cb                	mov    ecx,ebx
1000a188:	ff b4 b5 50 f0 ff ff 	push   DWORD PTR [ebp+esi*4-0xfb0]
1000a18f:	40                   	inc    eax
1000a190:	03 c6                	add    eax,esi
1000a192:	50                   	push   eax
1000a193:	e8 18 b6 00 00       	call   0x100157b0
1000a198:	84 c0                	test   al,al
1000a19a:	0f 84 f7 00 00 00    	je     0x1000a297
1000a1a0:	46                   	inc    esi
1000a1a1:	3b b5 1c f0 ff ff    	cmp    esi,DWORD PTR [ebp-0xfe4]
1000a1a7:	7c d7                	jl     0x1000a180
1000a1a9:	8b b5 18 f0 ff ff    	mov    esi,DWORD PTR [ebp-0xfe8]
1000a1af:	8d 86 cc 01 00 00    	lea    eax,[esi+0x1cc]
1000a1b5:	50                   	push   eax
1000a1b6:	8d 85 08 f0 ff ff    	lea    eax,[ebp-0xff8]
1000a1bc:	50                   	push   eax
1000a1bd:	e8 ee a5 ff ff       	call   0x100047b0
1000a1c2:	83 c4 08             	add    esp,0x8
1000a1c5:	8b 85 14 f0 ff ff    	mov    eax,DWORD PTR [ebp-0xfec]
1000a1cb:	c6 45 fc 03          	mov    BYTE PTR [ebp-0x4],0x3
1000a1cf:	85 c0                	test   eax,eax
1000a1d1:	74 4c                	je     0x1000a21f
1000a1d3:	8b b5 0c f0 ff ff    	mov    esi,DWORD PTR [ebp-0xff4]
1000a1d9:	8b 9d f4 ef ff ff    	mov    ebx,DWORD PTR [ebp-0x100c]
1000a1df:	90                   	nop
1000a1e0:	3b b5 10 f0 ff ff    	cmp    esi,DWORD PTR [ebp-0xff0]
1000a1e6:	74 2b                	je     0x1000a213
1000a1e8:	85 c0                	test   eax,eax
1000a1ea:	74 13                	je     0x1000a1ff
1000a1ec:	ff 36                	push   DWORD PTR [esi]
1000a1ee:	8b cb                	mov    ecx,ebx
1000a1f0:	e8 eb fb ff ff       	call   0x10009de0
1000a1f5:	50                   	push   eax
1000a1f6:	8b cf                	mov    ecx,edi
1000a1f8:	e8 13 e0 00 00       	call   0x10018210
1000a1fd:	33 c0                	xor    eax,eax
1000a1ff:	83 c6 04             	add    esi,0x4
1000a202:	83 f0 01             	xor    eax,0x1
1000a205:	89 b5 0c f0 ff ff    	mov    DWORD PTR [ebp-0xff4],esi
1000a20b:	89 85 14 f0 ff ff    	mov    DWORD PTR [ebp-0xfec],eax
1000a211:	75 cd                	jne    0x1000a1e0
1000a213:	8b 9d 20 f0 ff ff    	mov    ebx,DWORD PTR [ebp-0xfe0]
1000a219:	8b b5 18 f0 ff ff    	mov    esi,DWORD PTR [ebp-0xfe8]
1000a21f:	8b 8d 08 f0 ff ff    	mov    ecx,DWORD PTR [ebp-0xff8]
1000a225:	c6 45 fc 00          	mov    BYTE PTR [ebp-0x4],0x0
1000a229:	8b 01                	mov    eax,DWORD PTR [ecx]
1000a22b:	85 c0                	test   eax,eax
1000a22d:	74 13                	je     0x1000a242
1000a22f:	83 f8 ff             	cmp    eax,0xffffffff
1000a232:	74 1c                	je     0x1000a250
1000a234:	83 c8 ff             	or     eax,0xffffffff
1000a237:	f0 0f c1 01          	lock xadd DWORD PTR [ecx],eax
1000a23b:	0f 95 c0             	setne  al
1000a23e:	84 c0                	test   al,al
1000a240:	75 0e                	jne    0x1000a250
1000a242:	6a 04                	push   0x4
1000a244:	6a 04                	push   0x4
1000a246:	51                   	push   ecx
1000a247:	ff 15 68 24 02 10    	call   DWORD PTR ds:0x10022468
1000a24d:	83 c4 0c             	add    esp,0xc
1000a250:	8b ce                	mov    ecx,esi
1000a252:	e8 29 e1 00 00       	call   0x10018380
1000a257:	8b 8f c4 01 00 00    	mov    ecx,DWORD PTR [edi+0x1c4]
1000a25d:	e8 fe b5 00 00       	call   0x10015860
1000a262:	8b 8f c4 01 00 00    	mov    ecx,DWORD PTR [edi+0x1c4]
1000a268:	85 c9                	test   ecx,ecx
1000a26a:	74 07                	je     0x1000a273
1000a26c:	8b 01                	mov    eax,DWORD PTR [ecx]
1000a26e:	6a 01                	push   0x1
1000a270:	ff 50 0c             	call   DWORD PTR [eax+0xc]
1000a273:	8b cb                	mov    ecx,ebx
1000a275:	c7 87 c4 01 00 00 00 	mov    DWORD PTR [edi+0x1c4],0x0
1000a27c:	00 00 00 
1000a27f:	c6 87 c1 01 00 00 00 	mov    BYTE PTR [edi+0x1c1],0x0
1000a286:	e8 15 ae 00 00       	call   0x100150a0
1000a28b:	8b cb                	mov    ecx,ebx
1000a28d:	e8                   	.byte 0xe8
1000a28e:	de cc                	fmulp  st(4),st

; ===== context_enabled_matrix [0x10011b00, 0x10011d50) =====

/mnt/data/work_stage117/re_inputs/modules/PM_auto.dll:     file format pei-i386


Disassembly of section .text:

10011b00 <.text+0x10b00>:
10011b00:	45                   	inc    ebp
10011b01:	f4                   	hlt
10011b02:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10011b08:	8b f1                	mov    esi,ecx
10011b0a:	8b 8e fc 00 00 00    	mov    ecx,DWORD PTR [esi+0xfc]
10011b10:	ff 15 b0 28 02 10    	call   DWORD PTR ds:0x100228b0
10011b16:	50                   	push   eax
10011b17:	b9 90 bc 05 10       	mov    ecx,0x1005bc90
10011b1c:	ff 15 54 24 02 10    	call   DWORD PTR ds:0x10022454
10011b22:	8b d8                	mov    ebx,eax
10011b24:	85 db                	test   ebx,ebx
10011b26:	0f 84 12 02 00 00    	je     0x10011d3e
10011b2c:	ff 73 7c             	push   DWORD PTR [ebx+0x7c]
10011b2f:	8b cb                	mov    ecx,ebx
10011b31:	ff 73 78             	push   DWORD PTR [ebx+0x78]
10011b34:	e8 57 54 00 00       	call   0x10016f90
10011b39:	8b 4e 48             	mov    ecx,DWORD PTR [esi+0x48]
10011b3c:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
10011b3f:	ff 15 fc 23 02 10    	call   DWORD PTR ds:0x100223fc
10011b45:	50                   	push   eax
10011b46:	8d 45 e0             	lea    eax,[ebp-0x20]
10011b49:	50                   	push   eax
10011b4a:	e8 b1 2c ff ff       	call   0x10004800
10011b4f:	83 c4 08             	add    esp,0x8
10011b52:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
10011b55:	8b 3d 5c 28 02 10    	mov    edi,DWORD PTR ds:0x1002285c
10011b5b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
10011b62:	85 d2                	test   edx,edx
10011b64:	74 4e                	je     0x10011bb4
10011b66:	8b 4d e4             	mov    ecx,DWORD PTR [ebp-0x1c]
10011b69:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [eax+0x0]
10011b70:	3b 4d e8             	cmp    ecx,DWORD PTR [ebp-0x18]
10011b73:	0f 95 c0             	setne  al
10011b76:	84 c0                	test   al,al
10011b78:	74 3a                	je     0x10011bb4
10011b7a:	8b 01                	mov    eax,DWORD PTR [ecx]
10011b7c:	85 d2                	test   edx,edx
10011b7e:	74 26                	je     0x10011ba6
10011b80:	6a 00                	push   0x0
10011b82:	68 78 f2 06 10       	push   0x1006f278
10011b87:	68 10 f1 06 10       	push   0x1006f110
10011b8c:	6a 00                	push   0x0
10011b8e:	50                   	push   eax
10011b8f:	e8 de bf 00 00       	call   0x1001db72
10011b94:	83 c4 14             	add    esp,0x14
10011b97:	85 c0                	test   eax,eax
10011b99:	74 06                	je     0x10011ba1
10011b9b:	6a 00                	push   0x0
10011b9d:	8b c8                	mov    ecx,eax
10011b9f:	ff d7                	call   edi
10011ba1:	8b 4d e4             	mov    ecx,DWORD PTR [ebp-0x1c]
10011ba4:	33 d2                	xor    edx,edx
10011ba6:	83 c1 04             	add    ecx,0x4
10011ba9:	83 f2 01             	xor    edx,0x1
10011bac:	89 4d e4             	mov    DWORD PTR [ebp-0x1c],ecx
10011baf:	89 55 ec             	mov    DWORD PTR [ebp-0x14],edx
10011bb2:	75 bc                	jne    0x10011b70
10011bb4:	8b 4d e0             	mov    ecx,DWORD PTR [ebp-0x20]
10011bb7:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [ebp-0x4],0x1
10011bbe:	8b 01                	mov    eax,DWORD PTR [ecx]
10011bc0:	85 c0                	test   eax,eax
10011bc2:	74 16                	je     0x10011bda
10011bc4:	83 f8 ff             	cmp    eax,0xffffffff
10011bc7:	74 1b                	je     0x10011be4
10011bc9:	83 c8 ff             	or     eax,0xffffffff
10011bcc:	f0 0f c1 01          	lock xadd DWORD PTR [ecx],eax
10011bd0:	0f 95 c0             	setne  al
10011bd3:	84 c0                	test   al,al
10011bd5:	75 0d                	jne    0x10011be4
10011bd7:	8b 4d e0             	mov    ecx,DWORD PTR [ebp-0x20]
10011bda:	51                   	push   ecx
10011bdb:	ff 15 7c 23 02 10    	call   DWORD PTR ds:0x1002237c
10011be1:	83 c4 04             	add    esp,0x4
10011be4:	8b 4e 58             	mov    ecx,DWORD PTR [esi+0x58]
10011be7:	6a 01                	push   0x1
10011be9:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [ebp-0x4],0xffffffff
10011bf0:	ff d7                	call   edi
10011bf2:	8b 4e 54             	mov    ecx,DWORD PTR [esi+0x54]
10011bf5:	6a 01                	push   0x1
10011bf7:	ff d7                	call   edi
10011bf9:	8b 8e b8 00 00 00    	mov    ecx,DWORD PTR [esi+0xb8]
10011bff:	6a 01                	push   0x1
10011c01:	ff d7                	call   edi
10011c03:	83 7e 2c 02          	cmp    DWORD PTR [esi+0x2c],0x2
10011c07:	75 1f                	jne    0x10011c28
10011c09:	8b 4e 7c             	mov    ecx,DWORD PTR [esi+0x7c]
10011c0c:	6a 01                	push   0x1
10011c0e:	ff d7                	call   edi
10011c10:	8b 4e 78             	mov    ecx,DWORD PTR [esi+0x78]
10011c13:	6a 01                	push   0x1
10011c15:	ff d7                	call   edi
10011c17:	8b 4e 6c             	mov    ecx,DWORD PTR [esi+0x6c]
10011c1a:	6a 01                	push   0x1
10011c1c:	ff d7                	call   edi
10011c1e:	8b 8e a0 00 00 00    	mov    ecx,DWORD PTR [esi+0xa0]
10011c24:	6a 01                	push   0x1
10011c26:	ff d7                	call   edi
10011c28:	83 7e 2c 01          	cmp    DWORD PTR [esi+0x2c],0x1
10011c2c:	75 1f                	jne    0x10011c4d
10011c2e:	8b 4e 70             	mov    ecx,DWORD PTR [esi+0x70]
10011c31:	6a 01                	push   0x1
10011c33:	ff d7                	call   edi
10011c35:	8b 4e 78             	mov    ecx,DWORD PTR [esi+0x78]
10011c38:	6a 01                	push   0x1
10011c3a:	ff d7                	call   edi
10011c3c:	8b 4e 6c             	mov    ecx,DWORD PTR [esi+0x6c]
10011c3f:	6a 01                	push   0x1
10011c41:	ff d7                	call   edi
10011c43:	8b 8e a0 00 00 00    	mov    ecx,DWORD PTR [esi+0xa0]
10011c49:	6a 01                	push   0x1
10011c4b:	ff d7                	call   edi
10011c4d:	83 7e 2c 03          	cmp    DWORD PTR [esi+0x2c],0x3
10011c51:	75 1f                	jne    0x10011c72
10011c53:	8b 4e 70             	mov    ecx,DWORD PTR [esi+0x70]
10011c56:	6a 01                	push   0x1
10011c58:	ff d7                	call   edi
10011c5a:	8b 4e 7c             	mov    ecx,DWORD PTR [esi+0x7c]
10011c5d:	6a 01                	push   0x1
10011c5f:	ff d7                	call   edi
10011c61:	8b 4e 78             	mov    ecx,DWORD PTR [esi+0x78]
10011c64:	6a 01                	push   0x1
10011c66:	ff d7                	call   edi
10011c68:	8b 8e a0 00 00 00    	mov    ecx,DWORD PTR [esi+0xa0]
10011c6e:	6a 01                	push   0x1
10011c70:	ff d7                	call   edi
10011c72:	83 7e 2c 04          	cmp    DWORD PTR [esi+0x2c],0x4
10011c76:	75 1f                	jne    0x10011c97
10011c78:	8b 4e 70             	mov    ecx,DWORD PTR [esi+0x70]
10011c7b:	6a 01                	push   0x1
10011c7d:	ff d7                	call   edi
10011c7f:	8b 4e 7c             	mov    ecx,DWORD PTR [esi+0x7c]
10011c82:	6a 01                	push   0x1
10011c84:	ff d7                	call   edi
10011c86:	8b 4e 6c             	mov    ecx,DWORD PTR [esi+0x6c]
10011c89:	6a 01                	push   0x1
10011c8b:	ff d7                	call   edi
10011c8d:	8b 8e a0 00 00 00    	mov    ecx,DWORD PTR [esi+0xa0]
10011c93:	6a 01                	push   0x1
10011c95:	ff d7                	call   edi
10011c97:	8b 46 2c             	mov    eax,DWORD PTR [esi+0x2c]
10011c9a:	83 f8 01             	cmp    eax,0x1
10011c9d:	74 0a                	je     0x10011ca9
10011c9f:	83 f8 04             	cmp    eax,0x4
10011ca2:	74 05                	je     0x10011ca9
10011ca4:	83 f8 03             	cmp    eax,0x3
10011ca7:	75 38                	jne    0x10011ce1
10011ca9:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
10011cac:	83 b8 c4 01 00 00 00 	cmp    DWORD PTR [eax+0x1c4],0x0
10011cb3:	75 22                	jne    0x10011cd7
10011cb5:	83 7b 78 00          	cmp    DWORD PTR [ebx+0x78],0x0
10011cb9:	75 06                	jne    0x10011cc1
10011cbb:	83 7b 7c 00          	cmp    DWORD PTR [ebx+0x7c],0x0
10011cbf:	74 0d                	je     0x10011cce
10011cc1:	8b 8e a8 00 00 00    	mov    ecx,DWORD PTR [esi+0xa8]
10011cc7:	6a 01                	push   0x1
10011cc9:	ff d7                	call   edi
10011ccb:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
10011cce:	83 b8 c4 01 00 00 00 	cmp    DWORD PTR [eax+0x1c4],0x0
10011cd5:	74 0a                	je     0x10011ce1
10011cd7:	8b 8e 90 00 00 00    	mov    ecx,DWORD PTR [esi+0x90]
10011cdd:	6a 01                	push   0x1
10011cdf:	ff d7                	call   edi
10011ce1:	83 7e 2c 00          	cmp    DWORD PTR [esi+0x2c],0x0
10011ce5:	74 57                	je     0x10011d3e
10011ce7:	8b 4e 38             	mov    ecx,DWORD PTR [esi+0x38]
10011cea:	ff 15 18 21 02 10    	call   DWORD PTR ds:0x10022118
10011cf0:	85 c0                	test   eax,eax
10011cf2:	74 4a                	je     0x10011d3e
10011cf4:	83 7b 78 00          	cmp    DWORD PTR [ebx+0x78],0x0
10011cf8:	75 06                	jne    0x10011d00
10011cfa:	83 7b 7c 00          	cmp    DWORD PTR [ebx+0x7c],0x0
10011cfe:	74 3e                	je     0x10011d3e
10011d00:	8b 4e 38             	mov    ecx,DWORD PTR [esi+0x38]
10011d03:	ff 15 18 21 02 10    	call   DWORD PTR ds:0x10022118
10011d09:	8b c8                	mov    ecx,eax
10011d0b:	ff 15 24 21 02 10    	call   DWORD PTR ds:0x10022124
10011d11:	8b d8                	mov    ebx,eax
10011d13:	8d 4b fe             	lea    ecx,[ebx-0x2]
10011d16:	83 f9 03             	cmp    ecx,0x3
10011d19:	77 14                	ja     0x10011d2f
10011d1b:	8b 8e 8c 00 00 00    	mov    ecx,DWORD PTR [esi+0x8c]
10011d21:	6a 01                	push   0x1
10011d23:	ff d7                	call   edi
10011d25:	8b 8e 9c 00 00 00    	mov    ecx,DWORD PTR [esi+0x9c]
10011d2b:	6a 01                	push   0x1
10011d2d:	ff d7                	call   edi
10011d2f:	83 fb 02             	cmp    ebx,0x2
10011d32:	7e 0a                	jle    0x10011d3e
10011d34:	8b 8e 94 00 00 00    	mov    ecx,DWORD PTR [esi+0x94]
10011d3a:	6a 01                	push   0x1
10011d3c:	ff d7                	call   edi
10011d3e:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10011d41:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10011d48:	59                   	pop    ecx
10011d49:	5f                   	pop    edi
10011d4a:	5e                   	pop    esi
10011d4b:	5b                   	pop    ebx
10011d4c:	8b e5                	mov    esp,ebp
10011d4e:	5d                   	pop    ebp
10011d4f:	c3                   	ret
