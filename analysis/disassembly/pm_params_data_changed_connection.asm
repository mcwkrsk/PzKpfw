
/mnt/data/work_stage117/original/PM_params.dll:     file format pei-i386


Disassembly of section .text:

10003720 <.text+0x2720>:
10003720:	ff d7                	call   edi
10003722:	8d 4d dc             	lea    ecx,[ebp-0x24]
10003725:	ff d6                	call   esi
10003727:	8d 4d 08             	lea    ecx,[ebp+0x8]
1000372a:	ff 15 40 a2 00 10    	call   DWORD PTR ds:0x1000a240
10003730:	8d 45 08             	lea    eax,[ebp+0x8]
10003733:	50                   	push   eax
10003734:	8d 4d 0b             	lea    ecx,[ebp+0xb]
10003737:	e8 04 0a 00 00       	call   0x10004140
1000373c:	50                   	push   eax
1000373d:	8d 4d dc             	lea    ecx,[ebp-0x24]
10003740:	c6 45 fc 0f          	mov    BYTE PTR [ebp-0x4],0xf
10003744:	ff d3                	call   ebx
10003746:	6a 02                	push   0x2
10003748:	8d 45 dc             	lea    eax,[ebp-0x24]
1000374b:	c6 45 fc 10          	mov    BYTE PTR [ebp-0x4],0x10
1000374f:	50                   	push   eax
10003750:	6a 01                	push   0x1
10003752:	6a 05                	push   0x5
10003754:	b9 fc 34 02 10       	mov    ecx,0x100234fc
10003759:	ff d7                	call   edi
1000375b:	8d 4d dc             	lea    ecx,[ebp-0x24]
1000375e:	ff d6                	call   esi
10003760:	8d 4d 08             	lea    ecx,[ebp+0x8]
10003763:	c6 45 fc 00          	mov    BYTE PTR [ebp-0x4],0x0
10003767:	ff 15 40 a2 00 10    	call   DWORD PTR ds:0x1000a240
1000376d:	8b 75 ec             	mov    esi,DWORD PTR [ebp-0x14]
10003770:	8d 45 08             	lea    eax,[ebp+0x8]
10003773:	56                   	push   esi
10003774:	ff 35 30 a1 00 10    	push   DWORD PTR ds:0x1000a130
1000377a:	68 fc 34 02 10       	push   0x100234fc
1000377f:	50                   	push   eax
10003780:	e8 cb f8 ff ff       	call   0x10003050
10003785:	83 c4 10             	add    esp,0x10
10003788:	8d 4d 08             	lea    ecx,[ebp+0x8]
1000378b:	ff 15 58 a1 00 10    	call   DWORD PTR ds:0x1000a158
10003791:	8b c6                	mov    eax,esi
10003793:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10003796:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
1000379d:	59                   	pop    ecx
1000379e:	5f                   	pop    edi
1000379f:	5e                   	pop    esi
