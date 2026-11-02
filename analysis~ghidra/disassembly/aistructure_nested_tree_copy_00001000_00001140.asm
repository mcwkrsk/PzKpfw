; MAIWmodels.dll (PE32 / x86)
; Image base: 0x10000000
; SHA-256: 80ccc6678bdf057152f473369a56eb3b76a1ce643edca2832345f7b53e09c525
; Create fresh nested tree header and recursively clone its node topology.
; Range: 0x10001000..0x10001140


/mnt/data/work_stage117/original/MAIWmodels.dll:     file format pei-i386


Disassembly of section .text:

10001000 <.text>:
10001000:	55                   	push   ebp
10001001:	8b ec                	mov    ebp,esp
10001003:	6a ff                	push   0xffffffff
10001005:	68 48 5b 01 10       	push   0x10015b48
1000100a:	64 a1 00 00 00 00    	mov    eax,fs:0x0
10001010:	50                   	push   eax
10001011:	83 ec 08             	sub    esp,0x8
10001014:	53                   	push   ebx
10001015:	56                   	push   esi
10001016:	57                   	push   edi
10001017:	a1 04 10 02 10       	mov    eax,ds:0x10021004
1000101c:	33 c5                	xor    eax,ebp
1000101e:	50                   	push   eax
1000101f:	8d 45 f4             	lea    eax,[ebp-0xc]
10001022:	64 a3 00 00 00 00    	mov    fs:0x0,eax
10001028:	89 65 f0             	mov    DWORD PTR [ebp-0x10],esp
1000102b:	8b f1                	mov    esi,ecx
1000102d:	89 75 ec             	mov    DWORD PTR [ebp-0x14],esi
10001030:	c7 06 00 00 00 00    	mov    DWORD PTR [esi],0x0
10001036:	c7 46 04 00 00 00 00 	mov    DWORD PTR [esi+0x4],0x0
1000103d:	e8 ce 0b 00 00       	call   0x10001c10
10001042:	89 06                	mov    DWORD PTR [esi],eax
10001044:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10001047:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
1000104e:	8b ce                	mov    ecx,esi
10001050:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10001053:	c6 45 fc 01          	mov    BYTE PTR [ebp-0x4],0x1
10001057:	e8 64 00 00 00       	call   0x100010c0
1000105c:	8b c6                	mov    eax,esi
1000105e:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10001061:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
10001068:	59                   	pop    ecx
10001069:	5f                   	pop    edi
1000106a:	5e                   	pop    esi
1000106b:	5b                   	pop    ebx
1000106c:	8b e5                	mov    esp,ebp
1000106e:	5d                   	pop    ebp
1000106f:	c2 08 00             	ret    0x8
10001072:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
10001075:	8b 01                	mov    eax,DWORD PTR [ecx]
10001077:	50                   	push   eax
10001078:	ff 30                	push   DWORD PTR [eax]
1000107a:	8d 45 08             	lea    eax,[ebp+0x8]
1000107d:	50                   	push   eax
1000107e:	e8 4d 2b 01 00       	call   0x10013bd0
10001083:	6a 00                	push   0x0
10001085:	6a 00                	push   0x0
10001087:	e8 1c 4a 01 00       	call   0x10015aa8
1000108c:	cc                   	int3
1000108d:	cc                   	int3
1000108e:	cc                   	int3
1000108f:	cc                   	int3
10001090:	55                   	push   ebp
10001091:	8b ec                	mov    ebp,esp
10001093:	56                   	push   esi
10001094:	e8 a7 0b 00 00       	call   0x10001c40
10001099:	8b d0                	mov    edx,eax
1000109b:	8d 72 10             	lea    esi,[edx+0x10]
1000109e:	66 c7 42 0c 00 00    	mov    WORD PTR [edx+0xc],0x0
100010a4:	85 f6                	test   esi,esi
100010a6:	74 0f                	je     0x100010b7
100010a8:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
100010ab:	8b 08                	mov    ecx,DWORD PTR [eax]
100010ad:	89 0e                	mov    DWORD PTR [esi],ecx
100010af:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
100010b2:	89 46 04             	mov    DWORD PTR [esi+0x4],eax
100010b5:	8b c2                	mov    eax,edx
100010b7:	5e                   	pop    esi
100010b8:	5d                   	pop    ebp
100010b9:	c2 04 00             	ret    0x4
100010bc:	cc                   	int3
100010bd:	cc                   	int3
100010be:	cc                   	int3
100010bf:	cc                   	int3
100010c0:	55                   	push   ebp
100010c1:	8b ec                	mov    ebp,esp
100010c3:	53                   	push   ebx
100010c4:	56                   	push   esi
100010c5:	57                   	push   edi
100010c6:	8b 7d 08             	mov    edi,DWORD PTR [ebp+0x8]
100010c9:	8b d9                	mov    ebx,ecx
100010cb:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
100010ce:	8b 07                	mov    eax,DWORD PTR [edi]
100010d0:	8b 33                	mov    esi,DWORD PTR [ebx]
100010d2:	56                   	push   esi
100010d3:	ff 70 04             	push   DWORD PTR [eax+0x4]
100010d6:	e8 65 00 00 00       	call   0x10001140
100010db:	89 46 04             	mov    DWORD PTR [esi+0x4],eax
100010de:	8b 47 04             	mov    eax,DWORD PTR [edi+0x4]
100010e1:	89 43 04             	mov    DWORD PTR [ebx+0x4],eax
100010e4:	8b 13                	mov    edx,DWORD PTR [ebx]
100010e6:	8b 4a 04             	mov    ecx,DWORD PTR [edx+0x4]
100010e9:	80 79 0d 00          	cmp    BYTE PTR [ecx+0xd],0x0
100010ed:	75 37                	jne    0x10001126
100010ef:	8b 01                	mov    eax,DWORD PTR [ecx]
100010f1:	80 78 0d 00          	cmp    BYTE PTR [eax+0xd],0x0
100010f5:	75 0a                	jne    0x10001101
100010f7:	8b c8                	mov    ecx,eax
100010f9:	8b 01                	mov    eax,DWORD PTR [ecx]
100010fb:	80 78 0d 00          	cmp    BYTE PTR [eax+0xd],0x0
100010ff:	74 f6                	je     0x100010f7
10001101:	89 0a                	mov    DWORD PTR [edx],ecx
10001103:	8b 13                	mov    edx,DWORD PTR [ebx]
10001105:	8b 4a 04             	mov    ecx,DWORD PTR [edx+0x4]
10001108:	8b 41 08             	mov    eax,DWORD PTR [ecx+0x8]
1000110b:	80 78 0d 00          	cmp    BYTE PTR [eax+0xd],0x0
1000110f:	75 0b                	jne    0x1000111c
10001111:	8b c8                	mov    ecx,eax
10001113:	8b 41 08             	mov    eax,DWORD PTR [ecx+0x8]
10001116:	80 78 0d 00          	cmp    BYTE PTR [eax+0xd],0x0
1000111a:	74 f5                	je     0x10001111
1000111c:	5f                   	pop    edi
1000111d:	5e                   	pop    esi
1000111e:	89 4a 08             	mov    DWORD PTR [edx+0x8],ecx
10001121:	5b                   	pop    ebx
10001122:	5d                   	pop    ebp
10001123:	c2 08 00             	ret    0x8
10001126:	89 12                	mov    DWORD PTR [edx],edx
10001128:	8b 03                	mov    eax,DWORD PTR [ebx]
1000112a:	5f                   	pop    edi
1000112b:	5e                   	pop    esi
1000112c:	5b                   	pop    ebx
1000112d:	89 40 08             	mov    DWORD PTR [eax+0x8],eax
10001130:	5d                   	pop    ebp
10001131:	c2 08 00             	ret    0x8
10001134:	cc                   	int3
10001135:	cc                   	int3
10001136:	cc                   	int3
10001137:	cc                   	int3
10001138:	cc                   	int3
10001139:	cc                   	int3
1000113a:	cc                   	int3
1000113b:	cc                   	int3
1000113c:	cc                   	int3
1000113d:	cc                   	int3
1000113e:	cc                   	int3
1000113f:	cc                   	int3
