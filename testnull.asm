
_testnull:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
#include "user.h"
#define NULL ((void *)0)
int main (int argc , char *argv[]){
    int *pi;
    pi = NULL;
    printf(1, "Null pointer value: %p\n",*pi);
    1000:	a1 00 00 00 00       	mov    0x0,%eax
    1005:	0f 0b                	ud2    
    1007:	66 90                	xchg   %ax,%ax
    1009:	66 90                	xchg   %ax,%ax
    100b:	66 90                	xchg   %ax,%ax
    100d:	66 90                	xchg   %ax,%ax
    100f:	90                   	nop

00001010 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    1010:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    1011:	31 c0                	xor    %eax,%eax
{
    1013:	89 e5                	mov    %esp,%ebp
    1015:	53                   	push   %ebx
    1016:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1019:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    101c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
    1020:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    1024:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    1027:	83 c0 01             	add    $0x1,%eax
    102a:	84 d2                	test   %dl,%dl
    102c:	75 f2                	jne    1020 <strcpy+0x10>
    ;
  return os;
}
    102e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1031:	89 c8                	mov    %ecx,%eax
    1033:	c9                   	leave  
    1034:	c3                   	ret    
    1035:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    103c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001040 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1040:	55                   	push   %ebp
    1041:	89 e5                	mov    %esp,%ebp
    1043:	53                   	push   %ebx
    1044:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1047:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
    104a:	0f b6 01             	movzbl (%ecx),%eax
    104d:	0f b6 1a             	movzbl (%edx),%ebx
    1050:	84 c0                	test   %al,%al
    1052:	75 1d                	jne    1071 <strcmp+0x31>
    1054:	eb 2a                	jmp    1080 <strcmp+0x40>
    1056:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    105d:	8d 76 00             	lea    0x0(%esi),%esi
    1060:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
    1064:	83 c1 01             	add    $0x1,%ecx
    1067:	83 c2 01             	add    $0x1,%edx
  return (uchar)*p - (uchar)*q;
    106a:	0f b6 1a             	movzbl (%edx),%ebx
  while(*p && *p == *q)
    106d:	84 c0                	test   %al,%al
    106f:	74 0f                	je     1080 <strcmp+0x40>
    1071:	38 d8                	cmp    %bl,%al
    1073:	74 eb                	je     1060 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    1075:	29 d8                	sub    %ebx,%eax
}
    1077:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    107a:	c9                   	leave  
    107b:	c3                   	ret    
    107c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1080:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    1082:	29 d8                	sub    %ebx,%eax
}
    1084:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1087:	c9                   	leave  
    1088:	c3                   	ret    
    1089:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001090 <strlen>:

uint
strlen(const char *s)
{
    1090:	55                   	push   %ebp
    1091:	89 e5                	mov    %esp,%ebp
    1093:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    1096:	80 3a 00             	cmpb   $0x0,(%edx)
    1099:	74 15                	je     10b0 <strlen+0x20>
    109b:	31 c0                	xor    %eax,%eax
    109d:	8d 76 00             	lea    0x0(%esi),%esi
    10a0:	83 c0 01             	add    $0x1,%eax
    10a3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    10a7:	89 c1                	mov    %eax,%ecx
    10a9:	75 f5                	jne    10a0 <strlen+0x10>
    ;
  return n;
}
    10ab:	89 c8                	mov    %ecx,%eax
    10ad:	5d                   	pop    %ebp
    10ae:	c3                   	ret    
    10af:	90                   	nop
  for(n = 0; s[n]; n++)
    10b0:	31 c9                	xor    %ecx,%ecx
}
    10b2:	5d                   	pop    %ebp
    10b3:	89 c8                	mov    %ecx,%eax
    10b5:	c3                   	ret    
    10b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10bd:	8d 76 00             	lea    0x0(%esi),%esi

000010c0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    10c0:	55                   	push   %ebp
    10c1:	89 e5                	mov    %esp,%ebp
    10c3:	57                   	push   %edi
    10c4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    10c7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    10ca:	8b 45 0c             	mov    0xc(%ebp),%eax
    10cd:	89 d7                	mov    %edx,%edi
    10cf:	fc                   	cld    
    10d0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    10d2:	8b 7d fc             	mov    -0x4(%ebp),%edi
    10d5:	89 d0                	mov    %edx,%eax
    10d7:	c9                   	leave  
    10d8:	c3                   	ret    
    10d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000010e0 <strchr>:

char*
strchr(const char *s, char c)
{
    10e0:	55                   	push   %ebp
    10e1:	89 e5                	mov    %esp,%ebp
    10e3:	8b 45 08             	mov    0x8(%ebp),%eax
    10e6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    10ea:	0f b6 10             	movzbl (%eax),%edx
    10ed:	84 d2                	test   %dl,%dl
    10ef:	75 12                	jne    1103 <strchr+0x23>
    10f1:	eb 1d                	jmp    1110 <strchr+0x30>
    10f3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    10f7:	90                   	nop
    10f8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    10fc:	83 c0 01             	add    $0x1,%eax
    10ff:	84 d2                	test   %dl,%dl
    1101:	74 0d                	je     1110 <strchr+0x30>
    if(*s == c)
    1103:	38 d1                	cmp    %dl,%cl
    1105:	75 f1                	jne    10f8 <strchr+0x18>
      return (char*)s;
  return 0;
}
    1107:	5d                   	pop    %ebp
    1108:	c3                   	ret    
    1109:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    1110:	31 c0                	xor    %eax,%eax
}
    1112:	5d                   	pop    %ebp
    1113:	c3                   	ret    
    1114:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    111b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    111f:	90                   	nop

00001120 <gets>:

char*
gets(char *buf, int max)
{
    1120:	55                   	push   %ebp
    1121:	89 e5                	mov    %esp,%ebp
    1123:	57                   	push   %edi
    1124:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1125:	31 f6                	xor    %esi,%esi
{
    1127:	53                   	push   %ebx
    1128:	89 f3                	mov    %esi,%ebx
    112a:	83 ec 1c             	sub    $0x1c,%esp
    112d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    1130:	eb 2f                	jmp    1161 <gets+0x41>
    1132:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
    1138:	83 ec 04             	sub    $0x4,%esp
    113b:	8d 45 e7             	lea    -0x19(%ebp),%eax
    113e:	6a 01                	push   $0x1
    1140:	50                   	push   %eax
    1141:	6a 00                	push   $0x0
    1143:	e8 33 01 00 00       	call   127b <read>
    if(cc < 1)
    1148:	83 c4 10             	add    $0x10,%esp
    114b:	85 c0                	test   %eax,%eax
    114d:	7e 1c                	jle    116b <gets+0x4b>
      break;
    buf[i++] = c;
    114f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    if(c == '\n' || c == '\r')
    1153:	83 c7 01             	add    $0x1,%edi
    buf[i++] = c;
    1156:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
    1159:	3c 0a                	cmp    $0xa,%al
    115b:	74 23                	je     1180 <gets+0x60>
    115d:	3c 0d                	cmp    $0xd,%al
    115f:	74 1f                	je     1180 <gets+0x60>
  for(i=0; i+1 < max; ){
    1161:	83 c3 01             	add    $0x1,%ebx
    buf[i++] = c;
    1164:	89 fe                	mov    %edi,%esi
  for(i=0; i+1 < max; ){
    1166:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    1169:	7c cd                	jl     1138 <gets+0x18>
    116b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
    116d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    1170:	c6 03 00             	movb   $0x0,(%ebx)
}
    1173:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1176:	5b                   	pop    %ebx
    1177:	5e                   	pop    %esi
    1178:	5f                   	pop    %edi
    1179:	5d                   	pop    %ebp
    117a:	c3                   	ret    
    117b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    117f:	90                   	nop
  buf[i] = '\0';
    1180:	8b 75 08             	mov    0x8(%ebp),%esi
}
    1183:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    1186:	01 de                	add    %ebx,%esi
    1188:	89 f3                	mov    %esi,%ebx
    118a:	c6 03 00             	movb   $0x0,(%ebx)
}
    118d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1190:	5b                   	pop    %ebx
    1191:	5e                   	pop    %esi
    1192:	5f                   	pop    %edi
    1193:	5d                   	pop    %ebp
    1194:	c3                   	ret    
    1195:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    119c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000011a0 <stat>:

int
stat(const char *n, struct stat *st)
{
    11a0:	55                   	push   %ebp
    11a1:	89 e5                	mov    %esp,%ebp
    11a3:	56                   	push   %esi
    11a4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    11a5:	83 ec 08             	sub    $0x8,%esp
    11a8:	6a 00                	push   $0x0
    11aa:	ff 75 08             	pushl  0x8(%ebp)
    11ad:	e8 f1 00 00 00       	call   12a3 <open>
  if(fd < 0)
    11b2:	83 c4 10             	add    $0x10,%esp
    11b5:	85 c0                	test   %eax,%eax
    11b7:	78 27                	js     11e0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    11b9:	83 ec 08             	sub    $0x8,%esp
    11bc:	ff 75 0c             	pushl  0xc(%ebp)
    11bf:	89 c3                	mov    %eax,%ebx
    11c1:	50                   	push   %eax
    11c2:	e8 f4 00 00 00       	call   12bb <fstat>
  close(fd);
    11c7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    11ca:	89 c6                	mov    %eax,%esi
  close(fd);
    11cc:	e8 ba 00 00 00       	call   128b <close>
  return r;
    11d1:	83 c4 10             	add    $0x10,%esp
}
    11d4:	8d 65 f8             	lea    -0x8(%ebp),%esp
    11d7:	89 f0                	mov    %esi,%eax
    11d9:	5b                   	pop    %ebx
    11da:	5e                   	pop    %esi
    11db:	5d                   	pop    %ebp
    11dc:	c3                   	ret    
    11dd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    11e0:	be ff ff ff ff       	mov    $0xffffffff,%esi
    11e5:	eb ed                	jmp    11d4 <stat+0x34>
    11e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11ee:	66 90                	xchg   %ax,%ax

000011f0 <atoi>:

int
atoi(const char *s)
{
    11f0:	55                   	push   %ebp
    11f1:	89 e5                	mov    %esp,%ebp
    11f3:	53                   	push   %ebx
    11f4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    11f7:	0f be 02             	movsbl (%edx),%eax
    11fa:	8d 48 d0             	lea    -0x30(%eax),%ecx
    11fd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    1200:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    1205:	77 1e                	ja     1225 <atoi+0x35>
    1207:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    120e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    1210:	83 c2 01             	add    $0x1,%edx
    1213:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    1216:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    121a:	0f be 02             	movsbl (%edx),%eax
    121d:	8d 58 d0             	lea    -0x30(%eax),%ebx
    1220:	80 fb 09             	cmp    $0x9,%bl
    1223:	76 eb                	jbe    1210 <atoi+0x20>
  return n;
}
    1225:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1228:	89 c8                	mov    %ecx,%eax
    122a:	c9                   	leave  
    122b:	c3                   	ret    
    122c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001230 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    1230:	55                   	push   %ebp
    1231:	89 e5                	mov    %esp,%ebp
    1233:	57                   	push   %edi
    1234:	8b 45 10             	mov    0x10(%ebp),%eax
    1237:	8b 55 08             	mov    0x8(%ebp),%edx
    123a:	56                   	push   %esi
    123b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    123e:	85 c0                	test   %eax,%eax
    1240:	7e 13                	jle    1255 <memmove+0x25>
    1242:	01 d0                	add    %edx,%eax
  dst = vdst;
    1244:	89 d7                	mov    %edx,%edi
    1246:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    124d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
    1250:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    1251:	39 f8                	cmp    %edi,%eax
    1253:	75 fb                	jne    1250 <memmove+0x20>
  return vdst;
}
    1255:	5e                   	pop    %esi
    1256:	89 d0                	mov    %edx,%eax
    1258:	5f                   	pop    %edi
    1259:	5d                   	pop    %ebp
    125a:	c3                   	ret    

0000125b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    125b:	b8 01 00 00 00       	mov    $0x1,%eax
    1260:	cd 40                	int    $0x40
    1262:	c3                   	ret    

00001263 <exit>:
SYSCALL(exit)
    1263:	b8 02 00 00 00       	mov    $0x2,%eax
    1268:	cd 40                	int    $0x40
    126a:	c3                   	ret    

0000126b <wait>:
SYSCALL(wait)
    126b:	b8 03 00 00 00       	mov    $0x3,%eax
    1270:	cd 40                	int    $0x40
    1272:	c3                   	ret    

00001273 <pipe>:
SYSCALL(pipe)
    1273:	b8 04 00 00 00       	mov    $0x4,%eax
    1278:	cd 40                	int    $0x40
    127a:	c3                   	ret    

0000127b <read>:
SYSCALL(read)
    127b:	b8 05 00 00 00       	mov    $0x5,%eax
    1280:	cd 40                	int    $0x40
    1282:	c3                   	ret    

00001283 <write>:
SYSCALL(write)
    1283:	b8 10 00 00 00       	mov    $0x10,%eax
    1288:	cd 40                	int    $0x40
    128a:	c3                   	ret    

0000128b <close>:
SYSCALL(close)
    128b:	b8 15 00 00 00       	mov    $0x15,%eax
    1290:	cd 40                	int    $0x40
    1292:	c3                   	ret    

00001293 <kill>:
SYSCALL(kill)
    1293:	b8 06 00 00 00       	mov    $0x6,%eax
    1298:	cd 40                	int    $0x40
    129a:	c3                   	ret    

0000129b <exec>:
SYSCALL(exec)
    129b:	b8 07 00 00 00       	mov    $0x7,%eax
    12a0:	cd 40                	int    $0x40
    12a2:	c3                   	ret    

000012a3 <open>:
SYSCALL(open)
    12a3:	b8 0f 00 00 00       	mov    $0xf,%eax
    12a8:	cd 40                	int    $0x40
    12aa:	c3                   	ret    

000012ab <mknod>:
SYSCALL(mknod)
    12ab:	b8 11 00 00 00       	mov    $0x11,%eax
    12b0:	cd 40                	int    $0x40
    12b2:	c3                   	ret    

000012b3 <unlink>:
SYSCALL(unlink)
    12b3:	b8 12 00 00 00       	mov    $0x12,%eax
    12b8:	cd 40                	int    $0x40
    12ba:	c3                   	ret    

000012bb <fstat>:
SYSCALL(fstat)
    12bb:	b8 08 00 00 00       	mov    $0x8,%eax
    12c0:	cd 40                	int    $0x40
    12c2:	c3                   	ret    

000012c3 <link>:
SYSCALL(link)
    12c3:	b8 13 00 00 00       	mov    $0x13,%eax
    12c8:	cd 40                	int    $0x40
    12ca:	c3                   	ret    

000012cb <mkdir>:
SYSCALL(mkdir)
    12cb:	b8 14 00 00 00       	mov    $0x14,%eax
    12d0:	cd 40                	int    $0x40
    12d2:	c3                   	ret    

000012d3 <chdir>:
SYSCALL(chdir)
    12d3:	b8 09 00 00 00       	mov    $0x9,%eax
    12d8:	cd 40                	int    $0x40
    12da:	c3                   	ret    

000012db <dup>:
SYSCALL(dup)
    12db:	b8 0a 00 00 00       	mov    $0xa,%eax
    12e0:	cd 40                	int    $0x40
    12e2:	c3                   	ret    

000012e3 <getpid>:
SYSCALL(getpid)
    12e3:	b8 0b 00 00 00       	mov    $0xb,%eax
    12e8:	cd 40                	int    $0x40
    12ea:	c3                   	ret    

000012eb <sbrk>:
SYSCALL(sbrk)
    12eb:	b8 0c 00 00 00       	mov    $0xc,%eax
    12f0:	cd 40                	int    $0x40
    12f2:	c3                   	ret    

000012f3 <sleep>:
SYSCALL(sleep)
    12f3:	b8 0d 00 00 00       	mov    $0xd,%eax
    12f8:	cd 40                	int    $0x40
    12fa:	c3                   	ret    

000012fb <uptime>:
SYSCALL(uptime)
    12fb:	b8 0e 00 00 00       	mov    $0xe,%eax
    1300:	cd 40                	int    $0x40
    1302:	c3                   	ret    

00001303 <getreadcount>:
SYSCALL(getreadcount)
    1303:	b8 16 00 00 00       	mov    $0x16,%eax
    1308:	cd 40                	int    $0x40
    130a:	c3                   	ret    

0000130b <clone>:
SYSCALL(clone)
    130b:	b8 17 00 00 00       	mov    $0x17,%eax
    1310:	cd 40                	int    $0x40
    1312:	c3                   	ret    

00001313 <join>:
SYSCALL(join)
    1313:	b8 18 00 00 00       	mov    $0x18,%eax
    1318:	cd 40                	int    $0x40
    131a:	c3                   	ret    

0000131b <mprotect>:
SYSCALL(mprotect)
    131b:	b8 19 00 00 00       	mov    $0x19,%eax
    1320:	cd 40                	int    $0x40
    1322:	c3                   	ret    

00001323 <munprotect>:
SYSCALL(munprotect)
    1323:	b8 1a 00 00 00       	mov    $0x1a,%eax
    1328:	cd 40                	int    $0x40
    132a:	c3                   	ret    
    132b:	66 90                	xchg   %ax,%ax
    132d:	66 90                	xchg   %ax,%ax
    132f:	90                   	nop

00001330 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1330:	55                   	push   %ebp
    1331:	89 e5                	mov    %esp,%ebp
    1333:	57                   	push   %edi
    1334:	56                   	push   %esi
    1335:	53                   	push   %ebx
    1336:	83 ec 3c             	sub    $0x3c,%esp
    1339:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    133c:	89 d1                	mov    %edx,%ecx
{
    133e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    1341:	85 d2                	test   %edx,%edx
    1343:	0f 89 7f 00 00 00    	jns    13c8 <printint+0x98>
    1349:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    134d:	74 79                	je     13c8 <printint+0x98>
    neg = 1;
    134f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    1356:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    1358:	31 db                	xor    %ebx,%ebx
    135a:	8d 75 d7             	lea    -0x29(%ebp),%esi
    135d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1360:	89 c8                	mov    %ecx,%eax
    1362:	31 d2                	xor    %edx,%edx
    1364:	89 cf                	mov    %ecx,%edi
    1366:	f7 75 c4             	divl   -0x3c(%ebp)
    1369:	0f b6 92 50 17 00 00 	movzbl 0x1750(%edx),%edx
    1370:	89 45 c0             	mov    %eax,-0x40(%ebp)
    1373:	89 d8                	mov    %ebx,%eax
    1375:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    1378:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    137b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    137e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    1381:	76 dd                	jbe    1360 <printint+0x30>
  if(neg)
    1383:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    1386:	85 c9                	test   %ecx,%ecx
    1388:	74 0c                	je     1396 <printint+0x66>
    buf[i++] = '-';
    138a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    138f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    1391:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    1396:	8b 7d b8             	mov    -0x48(%ebp),%edi
    1399:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    139d:	eb 07                	jmp    13a6 <printint+0x76>
    139f:	90                   	nop
    putc(fd, buf[i]);
    13a0:	0f b6 13             	movzbl (%ebx),%edx
    13a3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    13a6:	83 ec 04             	sub    $0x4,%esp
    13a9:	88 55 d7             	mov    %dl,-0x29(%ebp)
    13ac:	6a 01                	push   $0x1
    13ae:	56                   	push   %esi
    13af:	57                   	push   %edi
    13b0:	e8 ce fe ff ff       	call   1283 <write>
  while(--i >= 0)
    13b5:	83 c4 10             	add    $0x10,%esp
    13b8:	39 de                	cmp    %ebx,%esi
    13ba:	75 e4                	jne    13a0 <printint+0x70>
}
    13bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
    13bf:	5b                   	pop    %ebx
    13c0:	5e                   	pop    %esi
    13c1:	5f                   	pop    %edi
    13c2:	5d                   	pop    %ebp
    13c3:	c3                   	ret    
    13c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    13c8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    13cf:	eb 87                	jmp    1358 <printint+0x28>
    13d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    13d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    13df:	90                   	nop

000013e0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    13e0:	55                   	push   %ebp
    13e1:	89 e5                	mov    %esp,%ebp
    13e3:	57                   	push   %edi
    13e4:	56                   	push   %esi
    13e5:	53                   	push   %ebx
    13e6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    13e9:	8b 75 0c             	mov    0xc(%ebp),%esi
    13ec:	0f b6 1e             	movzbl (%esi),%ebx
    13ef:	84 db                	test   %bl,%bl
    13f1:	0f 84 b8 00 00 00    	je     14af <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
    13f7:	8d 45 10             	lea    0x10(%ebp),%eax
    13fa:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    13fd:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    1400:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
    1402:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1405:	eb 37                	jmp    143e <printf+0x5e>
    1407:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    140e:	66 90                	xchg   %ax,%ax
    1410:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    1413:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    1418:	83 f8 25             	cmp    $0x25,%eax
    141b:	74 17                	je     1434 <printf+0x54>
  write(fd, &c, 1);
    141d:	83 ec 04             	sub    $0x4,%esp
    1420:	88 5d e7             	mov    %bl,-0x19(%ebp)
    1423:	6a 01                	push   $0x1
    1425:	57                   	push   %edi
    1426:	ff 75 08             	pushl  0x8(%ebp)
    1429:	e8 55 fe ff ff       	call   1283 <write>
    142e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
    1431:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    1434:	0f b6 1e             	movzbl (%esi),%ebx
    1437:	83 c6 01             	add    $0x1,%esi
    143a:	84 db                	test   %bl,%bl
    143c:	74 71                	je     14af <printf+0xcf>
    c = fmt[i] & 0xff;
    143e:	0f be cb             	movsbl %bl,%ecx
    1441:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1444:	85 d2                	test   %edx,%edx
    1446:	74 c8                	je     1410 <printf+0x30>
      }
    } else if(state == '%'){
    1448:	83 fa 25             	cmp    $0x25,%edx
    144b:	75 e7                	jne    1434 <printf+0x54>
      if(c == 'd'){
    144d:	83 f8 64             	cmp    $0x64,%eax
    1450:	0f 84 9a 00 00 00    	je     14f0 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    1456:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    145c:	83 f9 70             	cmp    $0x70,%ecx
    145f:	74 5f                	je     14c0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1461:	83 f8 73             	cmp    $0x73,%eax
    1464:	0f 84 d6 00 00 00    	je     1540 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    146a:	83 f8 63             	cmp    $0x63,%eax
    146d:	0f 84 8d 00 00 00    	je     1500 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1473:	83 f8 25             	cmp    $0x25,%eax
    1476:	0f 84 b4 00 00 00    	je     1530 <printf+0x150>
  write(fd, &c, 1);
    147c:	83 ec 04             	sub    $0x4,%esp
    147f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    1483:	6a 01                	push   $0x1
    1485:	57                   	push   %edi
    1486:	ff 75 08             	pushl  0x8(%ebp)
    1489:	e8 f5 fd ff ff       	call   1283 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
    148e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
    1491:	83 c4 0c             	add    $0xc,%esp
    1494:	6a 01                	push   $0x1
  for(i = 0; fmt[i]; i++){
    1496:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    1499:	57                   	push   %edi
    149a:	ff 75 08             	pushl  0x8(%ebp)
    149d:	e8 e1 fd ff ff       	call   1283 <write>
  for(i = 0; fmt[i]; i++){
    14a2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
    14a6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
    14a9:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    14ab:	84 db                	test   %bl,%bl
    14ad:	75 8f                	jne    143e <printf+0x5e>
    }
  }
}
    14af:	8d 65 f4             	lea    -0xc(%ebp),%esp
    14b2:	5b                   	pop    %ebx
    14b3:	5e                   	pop    %esi
    14b4:	5f                   	pop    %edi
    14b5:	5d                   	pop    %ebp
    14b6:	c3                   	ret    
    14b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14be:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    14c0:	83 ec 0c             	sub    $0xc,%esp
    14c3:	b9 10 00 00 00       	mov    $0x10,%ecx
    14c8:	6a 00                	push   $0x0
    14ca:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    14cd:	8b 45 08             	mov    0x8(%ebp),%eax
    14d0:	8b 13                	mov    (%ebx),%edx
    14d2:	e8 59 fe ff ff       	call   1330 <printint>
        ap++;
    14d7:	89 d8                	mov    %ebx,%eax
    14d9:	83 c4 10             	add    $0x10,%esp
      state = 0;
    14dc:	31 d2                	xor    %edx,%edx
        ap++;
    14de:	83 c0 04             	add    $0x4,%eax
    14e1:	89 45 d0             	mov    %eax,-0x30(%ebp)
    14e4:	e9 4b ff ff ff       	jmp    1434 <printf+0x54>
    14e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
    14f0:	83 ec 0c             	sub    $0xc,%esp
    14f3:	b9 0a 00 00 00       	mov    $0xa,%ecx
    14f8:	6a 01                	push   $0x1
    14fa:	eb ce                	jmp    14ca <printf+0xea>
    14fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    1500:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
    1503:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    1506:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
    1508:	6a 01                	push   $0x1
        ap++;
    150a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
    150d:	57                   	push   %edi
    150e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
    1511:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1514:	e8 6a fd ff ff       	call   1283 <write>
        ap++;
    1519:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    151c:	83 c4 10             	add    $0x10,%esp
      state = 0;
    151f:	31 d2                	xor    %edx,%edx
    1521:	e9 0e ff ff ff       	jmp    1434 <printf+0x54>
    1526:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    152d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
    1530:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
    1533:	83 ec 04             	sub    $0x4,%esp
    1536:	e9 59 ff ff ff       	jmp    1494 <printf+0xb4>
    153b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    153f:	90                   	nop
        s = (char*)*ap;
    1540:	8b 45 d0             	mov    -0x30(%ebp),%eax
    1543:	8b 18                	mov    (%eax),%ebx
        ap++;
    1545:	83 c0 04             	add    $0x4,%eax
    1548:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    154b:	85 db                	test   %ebx,%ebx
    154d:	74 17                	je     1566 <printf+0x186>
        while(*s != 0){
    154f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
    1552:	31 d2                	xor    %edx,%edx
        while(*s != 0){
    1554:	84 c0                	test   %al,%al
    1556:	0f 84 d8 fe ff ff    	je     1434 <printf+0x54>
    155c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    155f:	89 de                	mov    %ebx,%esi
    1561:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1564:	eb 1a                	jmp    1580 <printf+0x1a0>
          s = "(null)";
    1566:	bb 48 17 00 00       	mov    $0x1748,%ebx
        while(*s != 0){
    156b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    156e:	b8 28 00 00 00       	mov    $0x28,%eax
    1573:	89 de                	mov    %ebx,%esi
    1575:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1578:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    157f:	90                   	nop
  write(fd, &c, 1);
    1580:	83 ec 04             	sub    $0x4,%esp
          s++;
    1583:	83 c6 01             	add    $0x1,%esi
    1586:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1589:	6a 01                	push   $0x1
    158b:	57                   	push   %edi
    158c:	53                   	push   %ebx
    158d:	e8 f1 fc ff ff       	call   1283 <write>
        while(*s != 0){
    1592:	0f b6 06             	movzbl (%esi),%eax
    1595:	83 c4 10             	add    $0x10,%esp
    1598:	84 c0                	test   %al,%al
    159a:	75 e4                	jne    1580 <printf+0x1a0>
      state = 0;
    159c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
    159f:	31 d2                	xor    %edx,%edx
    15a1:	e9 8e fe ff ff       	jmp    1434 <printf+0x54>
    15a6:	66 90                	xchg   %ax,%ax
    15a8:	66 90                	xchg   %ax,%ax
    15aa:	66 90                	xchg   %ax,%ax
    15ac:	66 90                	xchg   %ax,%ax
    15ae:	66 90                	xchg   %ax,%ax

000015b0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    15b0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15b1:	a1 e4 19 00 00       	mov    0x19e4,%eax
{
    15b6:	89 e5                	mov    %esp,%ebp
    15b8:	57                   	push   %edi
    15b9:	56                   	push   %esi
    15ba:	53                   	push   %ebx
    15bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    15be:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    15c8:	89 c2                	mov    %eax,%edx
    15ca:	8b 00                	mov    (%eax),%eax
    15cc:	39 ca                	cmp    %ecx,%edx
    15ce:	73 30                	jae    1600 <free+0x50>
    15d0:	39 c1                	cmp    %eax,%ecx
    15d2:	72 04                	jb     15d8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    15d4:	39 c2                	cmp    %eax,%edx
    15d6:	72 f0                	jb     15c8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
    15d8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    15db:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    15de:	39 f8                	cmp    %edi,%eax
    15e0:	74 30                	je     1612 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    15e2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    15e5:	8b 42 04             	mov    0x4(%edx),%eax
    15e8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    15eb:	39 f1                	cmp    %esi,%ecx
    15ed:	74 3a                	je     1629 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    15ef:	89 0a                	mov    %ecx,(%edx)
  freep = p;
}
    15f1:	5b                   	pop    %ebx
  freep = p;
    15f2:	89 15 e4 19 00 00    	mov    %edx,0x19e4
}
    15f8:	5e                   	pop    %esi
    15f9:	5f                   	pop    %edi
    15fa:	5d                   	pop    %ebp
    15fb:	c3                   	ret    
    15fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1600:	39 c2                	cmp    %eax,%edx
    1602:	72 c4                	jb     15c8 <free+0x18>
    1604:	39 c1                	cmp    %eax,%ecx
    1606:	73 c0                	jae    15c8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
    1608:	8b 73 fc             	mov    -0x4(%ebx),%esi
    160b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    160e:	39 f8                	cmp    %edi,%eax
    1610:	75 d0                	jne    15e2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
    1612:	03 70 04             	add    0x4(%eax),%esi
    1615:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1618:	8b 02                	mov    (%edx),%eax
    161a:	8b 00                	mov    (%eax),%eax
    161c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    161f:	8b 42 04             	mov    0x4(%edx),%eax
    1622:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    1625:	39 f1                	cmp    %esi,%ecx
    1627:	75 c6                	jne    15ef <free+0x3f>
    p->s.size += bp->s.size;
    1629:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
    162c:	89 15 e4 19 00 00    	mov    %edx,0x19e4
    p->s.size += bp->s.size;
    1632:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    1635:	8b 43 f8             	mov    -0x8(%ebx),%eax
    1638:	89 02                	mov    %eax,(%edx)
}
    163a:	5b                   	pop    %ebx
    163b:	5e                   	pop    %esi
    163c:	5f                   	pop    %edi
    163d:	5d                   	pop    %ebp
    163e:	c3                   	ret    
    163f:	90                   	nop

00001640 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1640:	55                   	push   %ebp
    1641:	89 e5                	mov    %esp,%ebp
    1643:	57                   	push   %edi
    1644:	56                   	push   %esi
    1645:	53                   	push   %ebx
    1646:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1649:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    164c:	8b 3d e4 19 00 00    	mov    0x19e4,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1652:	8d 70 07             	lea    0x7(%eax),%esi
    1655:	c1 ee 03             	shr    $0x3,%esi
    1658:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    165b:	85 ff                	test   %edi,%edi
    165d:	0f 84 ad 00 00 00    	je     1710 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1663:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
    1665:	8b 48 04             	mov    0x4(%eax),%ecx
    1668:	39 f1                	cmp    %esi,%ecx
    166a:	73 71                	jae    16dd <malloc+0x9d>
    166c:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
    1672:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1677:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    167a:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
    1681:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
    1684:	eb 1b                	jmp    16a1 <malloc+0x61>
    1686:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    168d:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1690:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
    1692:	8b 4a 04             	mov    0x4(%edx),%ecx
    1695:	39 f1                	cmp    %esi,%ecx
    1697:	73 4f                	jae    16e8 <malloc+0xa8>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1699:	8b 3d e4 19 00 00    	mov    0x19e4,%edi
    169f:	89 d0                	mov    %edx,%eax
    16a1:	39 c7                	cmp    %eax,%edi
    16a3:	75 eb                	jne    1690 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
    16a5:	83 ec 0c             	sub    $0xc,%esp
    16a8:	ff 75 e4             	pushl  -0x1c(%ebp)
    16ab:	e8 3b fc ff ff       	call   12eb <sbrk>
  if(p == (char*)-1)
    16b0:	83 c4 10             	add    $0x10,%esp
    16b3:	83 f8 ff             	cmp    $0xffffffff,%eax
    16b6:	74 1b                	je     16d3 <malloc+0x93>
  hp->s.size = nu;
    16b8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    16bb:	83 ec 0c             	sub    $0xc,%esp
    16be:	83 c0 08             	add    $0x8,%eax
    16c1:	50                   	push   %eax
    16c2:	e8 e9 fe ff ff       	call   15b0 <free>
  return freep;
    16c7:	a1 e4 19 00 00       	mov    0x19e4,%eax
      if((p = morecore(nunits)) == 0)
    16cc:	83 c4 10             	add    $0x10,%esp
    16cf:	85 c0                	test   %eax,%eax
    16d1:	75 bd                	jne    1690 <malloc+0x50>
        return 0;
  }
}
    16d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    16d6:	31 c0                	xor    %eax,%eax
}
    16d8:	5b                   	pop    %ebx
    16d9:	5e                   	pop    %esi
    16da:	5f                   	pop    %edi
    16db:	5d                   	pop    %ebp
    16dc:	c3                   	ret    
    if(p->s.size >= nunits){
    16dd:	89 c2                	mov    %eax,%edx
    16df:	89 f8                	mov    %edi,%eax
    16e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
    16e8:	39 ce                	cmp    %ecx,%esi
    16ea:	74 54                	je     1740 <malloc+0x100>
        p->s.size -= nunits;
    16ec:	29 f1                	sub    %esi,%ecx
    16ee:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
    16f1:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
    16f4:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
    16f7:	a3 e4 19 00 00       	mov    %eax,0x19e4
}
    16fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    16ff:	8d 42 08             	lea    0x8(%edx),%eax
}
    1702:	5b                   	pop    %ebx
    1703:	5e                   	pop    %esi
    1704:	5f                   	pop    %edi
    1705:	5d                   	pop    %ebp
    1706:	c3                   	ret    
    1707:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    170e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
    1710:	c7 05 e4 19 00 00 e8 	movl   $0x19e8,0x19e4
    1717:	19 00 00 
    base.s.size = 0;
    171a:	bf e8 19 00 00       	mov    $0x19e8,%edi
    base.s.ptr = freep = prevp = &base;
    171f:	c7 05 e8 19 00 00 e8 	movl   $0x19e8,0x19e8
    1726:	19 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1729:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
    172b:	c7 05 ec 19 00 00 00 	movl   $0x0,0x19ec
    1732:	00 00 00 
    if(p->s.size >= nunits){
    1735:	e9 32 ff ff ff       	jmp    166c <malloc+0x2c>
    173a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    1740:	8b 0a                	mov    (%edx),%ecx
    1742:	89 08                	mov    %ecx,(%eax)
    1744:	eb b1                	jmp    16f7 <malloc+0xb7>
