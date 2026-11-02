
../original/is.exe:     file format pei-i386


disassembly of section .text:

0040c390 <.text+0xb390>:
  40c390:	55                   	push   ebp
  40c391:	8b ec                	mov    ebp,esp
  40c393:	51                   	push   ecx
  40c394:	ff 75 0c             	push   dword ptr [ebp+0xc]
  40c397:	c7 45 fc 00 00 00 00 	mov    dword ptr [ebp-0x4],0x0
  40c39e:	ff 75 08             	push   dword ptr [ebp+0x8]
  40c3a1:	e8 9a e0 ff ff       	call   0x40a440
  40c3a6:	8b 45 08             	mov    eax,dword ptr [ebp+0x8]
  40c3a9:	83 c4 08             	add    esp,0x8
  40c3ac:	8b e5                	mov    esp,ebp
  40c3ae:	5d                   	pop    ebp
  40c3af:	c3                   	ret
