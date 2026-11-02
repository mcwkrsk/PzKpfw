
../original/is.exe:     file format pei-i386


disassembly of section .text:

0040ac20 <.text+0x9c20>:
  40ac20:	55                   	push   ebp
  40ac21:	8b ec                	mov    ebp,esp
  40ac23:	6a ff                	push   0xffffffff
  40ac25:	68 23 71 41 00       	push   0x417123
  40ac2a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  40ac30:	50                   	push   eax
  40ac31:	83 ec 08             	sub    esp,0x8
  40ac34:	56                   	push   esi
  40ac35:	a1 cc 90 46 00       	mov    eax,ds:0x4690cc
  40ac3a:	33 c5                	xor    eax,ebp
  40ac3c:	50                   	push   eax
  40ac3d:	8d 45 f4             	lea    eax,[ebp-0xc]
  40ac40:	64 a3 00 00 00 00    	mov    fs:0x0,eax
  40ac46:	ff 75 0c             	push   dword ptr [ebp+0xc]
  40ac49:	c7 45 ec 00 00 00 00 	mov    dword ptr [ebp-0x14],0x0
  40ac50:	8b 75 08             	mov    esi,dword ptr [ebp+0x8]
  40ac53:	56                   	push   esi
  40ac54:	c7 45 fc 00 00 00 00 	mov    dword ptr [ebp-0x4],0x0
  40ac5b:	e8 70 f9 ff ff       	call   0x40a5d0
  40ac60:	6a 02                	push   0x2
  40ac62:	68 ac 7b 45 00       	push   0x457bac
  40ac67:	c7 45 fc 00 00 00 00 	mov    dword ptr [ebp-0x4],0x0
  40ac6e:	c7 45 ec 01 00 00 00 	mov    dword ptr [ebp-0x14],0x1
  40ac75:	ff 15 a8 93 41 00    	call   dword ptr ds:0x4193a8
  40ac7b:	83 c4 10             	add    esp,0x10
  40ac7e:	89 45 f0             	mov    dword ptr [ebp-0x10],eax
  40ac81:	8d 45 f0             	lea    eax,[ebp-0x10]
  40ac84:	c7 45 fc 01 00 00 00 	mov    dword ptr [ebp-0x4],0x1
  40ac8b:	50                   	push   eax
  40ac8c:	8b ce                	mov    ecx,esi
  40ac8e:	ff 15 b4 9b 41 00    	call   dword ptr ds:0x419bb4
  40ac94:	8d 4d f0             	lea    ecx,[ebp-0x10]
  40ac97:	ff 15 d0 93 41 00    	call   dword ptr ds:0x4193d0
  40ac9d:	8b c6                	mov    eax,esi
  40ac9f:	8b 4d f4             	mov    ecx,dword ptr [ebp-0xc]
  40aca2:	64 89 0d 00 00 00 00 	mov    dword ptr fs:0x0,ecx
  40aca9:	59                   	pop    ecx
  40acaa:	5e                   	pop    esi
  40acab:	8b e5                	mov    esp,ebp
  40acad:	5d                   	pop    ebp
  40acae:	c3                   	ret
  40acaf:	cc                   	int3
