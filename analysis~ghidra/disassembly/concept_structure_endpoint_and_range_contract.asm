; Exact PE32 disassembly slices for Stage 1.17 category/link contracts.
; Source SHA-256: 80ccc6678bdf057152f473369a56eb3b76a1ce643edca2832345f7b53e09c525
; GNU objdump -d -Mintel; addresses are VAs at image base 0x10000000.


/mnt/data/work_stage117/original/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

10003a20 <.text+0x2a20>:
10003a20:	55                   	push   ebp
10003a21:	8b ec                	mov    ebp,esp
10003a23:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
10003a26:	83 ec 14             	sub    esp,0x14
10003a29:	8b 50 10             	mov    edx,DWORD PTR [eax+0x10]
10003a2c:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10003a2f:	56                   	push   esi
10003a30:	8b 34 82             	mov    esi,DWORD PTR [edx+eax*4]
10003a33:	33 c0                	xor    eax,eax
10003a35:	8b 56 04             	mov    edx,DWORD PTR [esi+0x4]
10003a38:	83 c2 1c             	add    edx,0x1c
10003a3b:	0f 1f 44 00 00       	nop    DWORD PTR [eax+eax*1+0x0]
10003a40:	39 0a                	cmp    DWORD PTR [edx],ecx
10003a42:	74 0b                	je     0x10003a4f
10003a44:	40                   	inc    eax
10003a45:	83 c2 04             	add    edx,0x4
10003a48:	83 f8 03             	cmp    eax,0x3
10003a4b:	7c f3                	jl     0x10003a40
10003a4d:	eb 11                	jmp    0x10003a60
10003a4f:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
10003a52:	89 71 04             	mov    DWORD PTR [ecx+0x4],esi
10003a55:	89 01                	mov    DWORD PTR [ecx],eax
10003a57:	8b c1                	mov    eax,ecx
10003a59:	5e                   	pop    esi
10003a5a:	8b e5                	mov    esp,ebp
10003a5c:	5d                   	pop    ebp
10003a5d:	c2 08 00             	ret    0x8
10003a60:	8d 45 f0             	lea    eax,[ebp-0x10]
10003a63:	c7 45 ec 14 72 01 10 	mov    DWORD PTR [ebp-0x14],0x10017214
10003a6a:	50                   	push   eax
10003a6b:	8d 45 f8             	lea    eax,[ebp-0x8]
10003a6e:	c7 45 f8 30 72 01 10 	mov    DWORD PTR [ebp-0x8],0x10017230
10003a75:	0f 57 c0             	xorps  xmm0,xmm0
10003a78:	c6 45 fc 01          	mov    BYTE PTR [ebp-0x4],0x1
10003a7c:	50                   	push   eax
10003a7d:	66 0f d6 45 f0       	movq   QWORD PTR [ebp-0x10],xmm0
10003a82:	ff 15 5c 70 01 10    	call   DWORD PTR ds:0x1001705c
10003a88:	83 c4 08             	add    esp,0x8
10003a8b:	8d 45 ec             	lea    eax,[ebp-0x14]
10003a8e:	68 4c 8e 01 10       	push   0x10018e4c
10003a93:	50                   	push   eax
10003a94:	e8 0f 20 01 00       	call   0x10015aa8
10003a99:	cc                   	int3
10003a9a:	cc                   	int3
10003a9b:	cc                   	int3
10003a9c:	cc                   	int3
10003a9d:	cc                   	int3
10003a9e:	cc                   	int3
10003a9f:	cc                   	int3
10003aa0:	8b 49 04             	mov    ecx,DWORD PTR [ecx+0x4]
10003aa3:	8b 41 14             	mov    eax,DWORD PTR [ecx+0x14]
10003aa6:	2b 41 10             	sub    eax,DWORD PTR [ecx+0x10]
10003aa9:	c1 f8 02             	sar    eax,0x2
10003aac:	c3                   	ret
10003aad:	cc                   	int3
10003aae:	cc                   	int3
10003aaf:	cc                   	int3


/mnt/data/work_stage117/original/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

10011390 <.text+0x10390>:
10011390:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
10011393:	8a 40 58             	mov    al,BYTE PTR [eax+0x58]
10011396:	c3                   	ret


/mnt/data/work_stage117/original/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

10011440 <.text+0x10440>:
10011440:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
10011443:	8b 40 38             	mov    eax,DWORD PTR [eax+0x38]
10011446:	c3                   	ret
10011447:	cc                   	int3
10011448:	cc                   	int3
10011449:	cc                   	int3
1001144a:	cc                   	int3
1001144b:	cc                   	int3
1001144c:	cc                   	int3
1001144d:	cc                   	int3
1001144e:	cc                   	int3
1001144f:	cc                   	int3
10011450:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
10011453:	8b 40 38             	mov    eax,DWORD PTR [eax+0x38]
10011456:	48                   	dec    eax
10011457:	83 f8 06             	cmp    eax,0x6
1001145a:	77 1c                	ja     0x10011478
1001145c:	ff 24 85 7c 14 01 10 	jmp    DWORD PTR [eax*4+0x1001147c]
10011463:	b0 53                	mov    al,0x53
10011465:	c3                   	ret
10011466:	b0 50                	mov    al,0x50
10011468:	c3                   	ret
10011469:	b0 5a                	mov    al,0x5a
1001146b:	c3                   	ret
1001146c:	b0 4b                	mov    al,0x4b
1001146e:	c3                   	ret
1001146f:	b0 4f                	mov    al,0x4f
10011471:	c3                   	ret
10011472:	b0 52                	mov    al,0x52
10011474:	c3                   	ret
10011475:	b0 43                	mov    al,0x43
10011477:	c3                   	ret
10011478:	b0 2d                	mov    al,0x2d
1001147a:	c3                   	ret
1001147b:	90                   	nop
1001147c:	63 14 01             	arpl   WORD PTR [ecx+eax*1],edx
1001147f:	10 66 14             	adc    BYTE PTR [esi+0x14],ah
10011482:	01 10                	add    DWORD PTR [eax],edx
10011484:	69 14 01 10 6c 14 01 	imul   edx,DWORD PTR [ecx+eax*1],0x1146c10
1001148b:	10 6f 14             	adc    BYTE PTR [edi+0x14],ch
1001148e:	01 10                	add    DWORD PTR [eax],edx
10011490:	72 14                	jb     0x100114a6
10011492:	01 10                	add    DWORD PTR [eax],edx
10011494:	75 14                	jne    0x100114aa
10011496:	01 10                	add    DWORD PTR [eax],edx
10011498:	cc                   	int3


/mnt/data/work_stage117/original/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

100116c0 <.text+0x106c0>:
100116c0:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
100116c3:	8b 40 4c             	mov    eax,DWORD PTR [eax+0x4c]
100116c6:	c3                   	ret
100116c7:	cc                   	int3
100116c8:	cc                   	int3
100116c9:	cc                   	int3
100116ca:	cc                   	int3
100116cb:	cc                   	int3
100116cc:	cc                   	int3
100116cd:	cc                   	int3
100116ce:	cc                   	int3
100116cf:	cc                   	int3
100116d0:	55                   	push   ebp
100116d1:	8b ec                	mov    ebp,esp
100116d3:	6a ff                	push   0xffffffff
100116d5:	68 28 61 01 10       	push   0x10016128
100116da:	64 a1 00 00 00 00    	mov    eax,fs:0x0
100116e0:	50                   	push   eax
100116e1:	83 ec 08             	sub    esp,0x8
100116e4:	56                   	push   esi
100116e5:	57                   	push   edi
100116e6:	a1 04 10 02 10       	mov    eax,ds:0x10021004
100116eb:	33 c5                	xor    eax,ebp
100116ed:	50                   	push   eax
100116ee:	8d 45 f4             	lea    eax,[ebp-0xc]
100116f1:	64 a3 00 00 00 00    	mov    fs:0x0,eax
100116f7:	8b f9                	mov    edi,ecx
100116f9:	8b 07                	mov    eax,DWORD PTR [edi]
100116fb:	8d 4d ec             	lea    ecx,[ebp-0x14]
100116fe:	51                   	push   ecx
100116ff:	8b cf                	mov    ecx,edi
10011701:	ff 50 0c             	call   DWORD PTR [eax+0xc]
10011704:	33 f6                	xor    esi,esi
10011706:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1001170d:	39 75 ec             	cmp    DWORD PTR [ebp-0x14],esi
10011710:	7e 38                	jle    0x1001174a
10011712:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
10011715:	8b 0c b0             	mov    ecx,DWORD PTR [eax+esi*4]
10011718:	e8 63 1a ff ff       	call   0x10003180
1001171d:	83 f8 03             	cmp    eax,0x3
10011720:	75 22                	jne    0x10011744
10011722:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
10011725:	6a 01                	push   0x1
10011727:	8b 0c b0             	mov    ecx,DWORD PTR [eax+esi*4]
1001172a:	e8 31 1a ff ff       	call   0x10003160
1001172f:	3b c7                	cmp    eax,edi
10011731:	75 11                	jne    0x10011744
10011733:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
10011736:	6a 02                	push   0x2
10011738:	8b 0c b0             	mov    ecx,DWORD PTR [eax+esi*4]
1001173b:	e8 20 1a ff ff       	call   0x10003160
10011740:	85 c0                	test   eax,eax
10011742:	75 28                	jne    0x1001176c
10011744:	46                   	inc    esi
10011745:	3b 75 ec             	cmp    esi,DWORD PTR [ebp-0x14]
10011748:	7c c8                	jl     0x10011712
1001174a:	33 f6                	xor    esi,esi
1001174c:	6a 04                	push   0x4
1001174e:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
10011751:	e8 d2 35 00 00       	call   0x10014d28
10011756:	83 c4 08             	add    esp,0x8
10011759:	8b c6                	mov    eax,esi
1001175b:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
1001175e:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10011765:	59                   	pop    ecx
10011766:	5f                   	pop    edi
10011767:	5e                   	pop    esi
10011768:	8b e5                	mov    esp,ebp
1001176a:	5d                   	pop    ebp
1001176b:	c3                   	ret
1001176c:	be 01 00 00 00       	mov    esi,0x1
10011771:	eb d9                	jmp    0x1001174c


/mnt/data/work_stage117/original/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

1000d360 <.text+0xc360>:
1000d360:	8b 41 04             	mov    eax,DWORD PTR [ecx+0x4]
1000d363:	8b 40 3c             	mov    eax,DWORD PTR [eax+0x3c]
1000d366:	c3                   	ret
1000d367:	cc                   	int3


/mnt/data/work_stage117/original/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

10011780 <.text+0x10780>:
10011780:	55                   	push   ebp
10011781:	8b ec                	mov    ebp,esp
10011783:	8b 49 04             	mov    ecx,DWORD PTR [ecx+0x4]
10011786:	8a 45 08             	mov    al,BYTE PTR [ebp+0x8]
10011789:	88 41 58             	mov    BYTE PTR [ecx+0x58],al
1001178c:	5d                   	pop    ebp
1001178d:	c2 04 00             	ret    0x4
10011790:	55                   	push   ebp
10011791:	8b ec                	mov    ebp,esp
10011793:	8b 49 04             	mov    ecx,DWORD PTR [ecx+0x4]
10011796:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10011799:	89 41 38             	mov    DWORD PTR [ecx+0x38],eax
1001179c:	5d                   	pop    ebp
1001179d:	c2 04 00             	ret    0x4
100117a0:	55                   	push   ebp
100117a1:	8b ec                	mov    ebp,esp
100117a3:	8b 49 04             	mov    ecx,DWORD PTR [ecx+0x4]
100117a6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
100117a9:	89 41 3c             	mov    DWORD PTR [ecx+0x3c],eax
100117ac:	5d                   	pop    ebp
100117ad:	c2 04 00             	ret    0x4


/mnt/data/work_stage117/original/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

10012fc0 <.text+0x11fc0>:
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
