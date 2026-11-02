
/mnt/data/IS2_RE_Stage2_MVP_2026-11-01/original/IS.exe:     file format pei-i386


Disassembly of section .text:

0040a120 <.text+0x9120>:
  40a120:	55                   	push   ebp
  40a121:	8b ec                	mov    ebp,esp
  40a123:	6a ff                	push   0xffffffff
  40a125:	68 ae 6e 41 00       	push   0x416eae
  40a12a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  40a130:	50                   	push   eax
  40a131:	83 ec 0c             	sub    esp,0xc
  40a134:	53                   	push   ebx
  40a135:	56                   	push   esi
  40a136:	57                   	push   edi
  40a137:	a1 cc 90 46 00       	mov    eax,ds:0x4690cc
  40a13c:	33 c5                	xor    eax,ebp
  40a13e:	50                   	push   eax
  40a13f:	8d 45 f4             	lea    eax,[ebp-0xc]
  40a142:	64 a3 00 00 00 00    	mov    fs:0x0,eax
  40a148:	6a 08                	push   0x8
  40a14a:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
  40a151:	8b 3d a8 93 41 00    	mov    edi,DWORD PTR ds:0x4193a8
  40a157:	68 b8 7b 45 00       	push   0x457bb8
  40a15c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
  40a163:	ff d7                	call   edi
  40a165:	83 c4 08             	add    esp,0x8
  40a168:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
  40a16b:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
  40a16e:	8d 45 f0             	lea    eax,[ebp-0x10]
  40a171:	8b 0d b0 96 46 00    	mov    ecx,DWORD PTR ds:0x4696b0
  40a177:	50                   	push   eax
  40a178:	53                   	push   ebx
  40a179:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [ebp-0x4],0x1
  40a180:	ff 15 74 9b 41 00    	call   DWORD PTR ds:0x419b74
  40a186:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40a189:	c7 45 e8 01 00 00 00 	mov    DWORD PTR [ebp-0x18],0x1
  40a190:	c6 45 fc 00          	mov    BYTE PTR [ebp-0x4],0x0
  40a194:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40a19a:	6a 02                	push   0x2
  40a19c:	68 c8 7a 45 00       	push   0x457ac8
  40a1a1:	ff d7                	call   edi
  40a1a3:	83 c4 08             	add    esp,0x8
  40a1a6:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
  40a1a9:	8b 75 0c             	mov    esi,DWORD PTR [ebp+0xc]
  40a1ac:	8b cb                	mov    ecx,ebx
  40a1ae:	6a 00                	push   0x0
  40a1b0:	c7 45 fc 02 00 00 00 	mov    DWORD PTR [ebp-0x4],0x2
  40a1b7:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
  40a1ba:	ff 70 04             	push   DWORD PTR [eax+0x4]
  40a1bd:	8d 45 ec             	lea    eax,[ebp-0x14]
  40a1c0:	50                   	push   eax
  40a1c1:	ff 15 bc 9b 41 00    	call   DWORD PTR ds:0x419bbc
  40a1c7:	8d 4d ec             	lea    ecx,[ebp-0x14]
  40a1ca:	c6 45 fc 00          	mov    BYTE PTR [ebp-0x4],0x0
  40a1ce:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40a1d4:	6a 04                	push   0x4
  40a1d6:	68 0c 7a 45 00       	push   0x457a0c
  40a1db:	ff d7                	call   edi
  40a1dd:	83 c4 08             	add    esp,0x8
  40a1e0:	89 45 0c             	mov    DWORD PTR [ebp+0xc],eax
  40a1e3:	8b 4e 04             	mov    ecx,DWORD PTR [esi+0x4]
  40a1e6:	6a ff                	push   0xffffffff
  40a1e8:	83 c1 08             	add    ecx,0x8
  40a1eb:	c7 45 fc 03 00 00 00 	mov    DWORD PTR [ebp-0x4],0x3
  40a1f2:	ff 15 84 90 41 00    	call   DWORD PTR ds:0x419084
  40a1f8:	50                   	push   eax
  40a1f9:	8d 45 ec             	lea    eax,[ebp-0x14]
  40a1fc:	50                   	push   eax
  40a1fd:	ff 15 d4 92 41 00    	call   DWORD PTR ds:0x4192d4
  40a203:	83 c4 0c             	add    esp,0xc
  40a206:	50                   	push   eax
  40a207:	8d 45 0c             	lea    eax,[ebp+0xc]
  40a20a:	c6 45 fc 04          	mov    BYTE PTR [ebp-0x4],0x4
  40a20e:	50                   	push   eax
  40a20f:	8b cb                	mov    ecx,ebx
  40a211:	ff 15 80 9b 41 00    	call   DWORD PTR ds:0x419b80
  40a217:	8d 4d ec             	lea    ecx,[ebp-0x14]
  40a21a:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40a220:	8d 4d 0c             	lea    ecx,[ebp+0xc]
  40a223:	ff 15 d0 93 41 00    	call   DWORD PTR ds:0x4193d0
  40a229:	8b c3                	mov    eax,ebx
  40a22b:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
  40a22e:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  40a235:	59                   	pop    ecx
  40a236:	5f                   	pop    edi
  40a237:	5e                   	pop    esi
  40a238:	5b                   	pop    ebx
  40a239:	8b e5                	mov    esp,ebp
  40a23b:	5d                   	pop    ebp
  40a23c:	c3                   	ret
  40a23d:	cc                   	int3
  40a23e:	cc                   	int3
  40a23f:	cc                   	int3
