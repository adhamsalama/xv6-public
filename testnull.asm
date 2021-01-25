
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

00001303 <settickets>:
SYSCALL(settickets)
    1303:	b8 1b 00 00 00       	mov    $0x1b,%eax
    1308:	cd 40                	int    $0x40
    130a:	c3                   	ret    

0000130b <getpinfo>:
SYSCALL(getpinfo)
    130b:	b8 1c 00 00 00       	mov    $0x1c,%eax
    1310:	cd 40                	int    $0x40
    1312:	c3                   	ret    

00001313 <getreadcount>:
SYSCALL(getreadcount)
    1313:	b8 16 00 00 00       	mov    $0x16,%eax
    1318:	cd 40                	int    $0x40
    131a:	c3                   	ret    

0000131b <clone>:
SYSCALL(clone)
    131b:	b8 17 00 00 00       	mov    $0x17,%eax
    1320:	cd 40                	int    $0x40
    1322:	c3                   	ret    

00001323 <join>:
SYSCALL(join)
    1323:	b8 18 00 00 00       	mov    $0x18,%eax
    1328:	cd 40                	int    $0x40
    132a:	c3                   	ret    

0000132b <mprotect>:
SYSCALL(mprotect)
    132b:	b8 19 00 00 00       	mov    $0x19,%eax
    1330:	cd 40                	int    $0x40
    1332:	c3                   	ret    

00001333 <munprotect>:
SYSCALL(munprotect)
    1333:	b8 1a 00 00 00       	mov    $0x1a,%eax
    1338:	cd 40                	int    $0x40
    133a:	c3                   	ret    
    133b:	66 90                	xchg   %ax,%ax
    133d:	66 90                	xchg   %ax,%ax
    133f:	90                   	nop

00001340 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1340:	55                   	push   %ebp
    1341:	89 e5                	mov    %esp,%ebp
    1343:	57                   	push   %edi
    1344:	56                   	push   %esi
    1345:	53                   	push   %ebx
    1346:	83 ec 3c             	sub    $0x3c,%esp
    1349:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    134c:	89 d1                	mov    %edx,%ecx
{
    134e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    1351:	85 d2                	test   %edx,%edx
    1353:	0f 89 7f 00 00 00    	jns    13d8 <printint+0x98>
    1359:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    135d:	74 79                	je     13d8 <printint+0x98>
    neg = 1;
    135f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    1366:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    1368:	31 db                	xor    %ebx,%ebx
    136a:	8d 75 d7             	lea    -0x29(%ebp),%esi
    136d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1370:	89 c8                	mov    %ecx,%eax
    1372:	31 d2                	xor    %edx,%edx
    1374:	89 cf                	mov    %ecx,%edi
    1376:	f7 75 c4             	divl   -0x3c(%ebp)
    1379:	0f b6 92 60 17 00 00 	movzbl 0x1760(%edx),%edx
    1380:	89 45 c0             	mov    %eax,-0x40(%ebp)
    1383:	89 d8                	mov    %ebx,%eax
    1385:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    1388:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    138b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    138e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    1391:	76 dd                	jbe    1370 <printint+0x30>
  if(neg)
    1393:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    1396:	85 c9                	test   %ecx,%ecx
    1398:	74 0c                	je     13a6 <printint+0x66>
    buf[i++] = '-';
    139a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    139f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    13a1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    13a6:	8b 7d b8             	mov    -0x48(%ebp),%edi
    13a9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    13ad:	eb 07                	jmp    13b6 <printint+0x76>
    13af:	90                   	nop
    putc(fd, buf[i]);
    13b0:	0f b6 13             	movzbl (%ebx),%edx
    13b3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    13b6:	83 ec 04             	sub    $0x4,%esp
    13b9:	88 55 d7             	mov    %dl,-0x29(%ebp)
    13bc:	6a 01                	push   $0x1
    13be:	56                   	push   %esi
    13bf:	57                   	push   %edi
    13c0:	e8 be fe ff ff       	call   1283 <write>
  while(--i >= 0)
    13c5:	83 c4 10             	add    $0x10,%esp
    13c8:	39 de                	cmp    %ebx,%esi
    13ca:	75 e4                	jne    13b0 <printint+0x70>
}
    13cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
    13cf:	5b                   	pop    %ebx
    13d0:	5e                   	pop    %esi
    13d1:	5f                   	pop    %edi
    13d2:	5d                   	pop    %ebp
    13d3:	c3                   	ret    
    13d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    13d8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    13df:	eb 87                	jmp    1368 <printint+0x28>
    13e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    13e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    13ef:	90                   	nop

000013f0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    13f0:	55                   	push   %ebp
    13f1:	89 e5                	mov    %esp,%ebp
    13f3:	57                   	push   %edi
    13f4:	56                   	push   %esi
    13f5:	53                   	push   %ebx
    13f6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    13f9:	8b 75 0c             	mov    0xc(%ebp),%esi
    13fc:	0f b6 1e             	movzbl (%esi),%ebx
    13ff:	84 db                	test   %bl,%bl
    1401:	0f 84 b8 00 00 00    	je     14bf <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
    1407:	8d 45 10             	lea    0x10(%ebp),%eax
    140a:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    140d:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    1410:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
    1412:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1415:	eb 37                	jmp    144e <printf+0x5e>
    1417:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    141e:	66 90                	xchg   %ax,%ax
    1420:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    1423:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    1428:	83 f8 25             	cmp    $0x25,%eax
    142b:	74 17                	je     1444 <printf+0x54>
  write(fd, &c, 1);
    142d:	83 ec 04             	sub    $0x4,%esp
    1430:	88 5d e7             	mov    %bl,-0x19(%ebp)
    1433:	6a 01                	push   $0x1
    1435:	57                   	push   %edi
    1436:	ff 75 08             	pushl  0x8(%ebp)
    1439:	e8 45 fe ff ff       	call   1283 <write>
    143e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
    1441:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    1444:	0f b6 1e             	movzbl (%esi),%ebx
    1447:	83 c6 01             	add    $0x1,%esi
    144a:	84 db                	test   %bl,%bl
    144c:	74 71                	je     14bf <printf+0xcf>
    c = fmt[i] & 0xff;
    144e:	0f be cb             	movsbl %bl,%ecx
    1451:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1454:	85 d2                	test   %edx,%edx
    1456:	74 c8                	je     1420 <printf+0x30>
      }
    } else if(state == '%'){
    1458:	83 fa 25             	cmp    $0x25,%edx
    145b:	75 e7                	jne    1444 <printf+0x54>
      if(c == 'd'){
    145d:	83 f8 64             	cmp    $0x64,%eax
    1460:	0f 84 9a 00 00 00    	je     1500 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    1466:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    146c:	83 f9 70             	cmp    $0x70,%ecx
    146f:	74 5f                	je     14d0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1471:	83 f8 73             	cmp    $0x73,%eax
    1474:	0f 84 d6 00 00 00    	je     1550 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    147a:	83 f8 63             	cmp    $0x63,%eax
    147d:	0f 84 8d 00 00 00    	je     1510 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1483:	83 f8 25             	cmp    $0x25,%eax
    1486:	0f 84 b4 00 00 00    	je     1540 <printf+0x150>
  write(fd, &c, 1);
    148c:	83 ec 04             	sub    $0x4,%esp
    148f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    1493:	6a 01                	push   $0x1
    1495:	57                   	push   %edi
    1496:	ff 75 08             	pushl  0x8(%ebp)
    1499:	e8 e5 fd ff ff       	call   1283 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
    149e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
    14a1:	83 c4 0c             	add    $0xc,%esp
    14a4:	6a 01                	push   $0x1
  for(i = 0; fmt[i]; i++){
    14a6:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    14a9:	57                   	push   %edi
    14aa:	ff 75 08             	pushl  0x8(%ebp)
    14ad:	e8 d1 fd ff ff       	call   1283 <write>
  for(i = 0; fmt[i]; i++){
    14b2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
    14b6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
    14b9:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    14bb:	84 db                	test   %bl,%bl
    14bd:	75 8f                	jne    144e <printf+0x5e>
    }
  }
}
    14bf:	8d 65 f4             	lea    -0xc(%ebp),%esp
    14c2:	5b                   	pop    %ebx
    14c3:	5e                   	pop    %esi
    14c4:	5f                   	pop    %edi
    14c5:	5d                   	pop    %ebp
    14c6:	c3                   	ret    
    14c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14ce:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    14d0:	83 ec 0c             	sub    $0xc,%esp
    14d3:	b9 10 00 00 00       	mov    $0x10,%ecx
    14d8:	6a 00                	push   $0x0
    14da:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    14dd:	8b 45 08             	mov    0x8(%ebp),%eax
    14e0:	8b 13                	mov    (%ebx),%edx
    14e2:	e8 59 fe ff ff       	call   1340 <printint>
        ap++;
    14e7:	89 d8                	mov    %ebx,%eax
    14e9:	83 c4 10             	add    $0x10,%esp
      state = 0;
    14ec:	31 d2                	xor    %edx,%edx
        ap++;
    14ee:	83 c0 04             	add    $0x4,%eax
    14f1:	89 45 d0             	mov    %eax,-0x30(%ebp)
    14f4:	e9 4b ff ff ff       	jmp    1444 <printf+0x54>
    14f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
    1500:	83 ec 0c             	sub    $0xc,%esp
    1503:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1508:	6a 01                	push   $0x1
    150a:	eb ce                	jmp    14da <printf+0xea>
    150c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    1510:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
    1513:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    1516:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
    1518:	6a 01                	push   $0x1
        ap++;
    151a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
    151d:	57                   	push   %edi
    151e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
    1521:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1524:	e8 5a fd ff ff       	call   1283 <write>
        ap++;
    1529:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    152c:	83 c4 10             	add    $0x10,%esp
      state = 0;
    152f:	31 d2                	xor    %edx,%edx
    1531:	e9 0e ff ff ff       	jmp    1444 <printf+0x54>
    1536:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    153d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
    1540:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
    1543:	83 ec 04             	sub    $0x4,%esp
    1546:	e9 59 ff ff ff       	jmp    14a4 <printf+0xb4>
    154b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    154f:	90                   	nop
        s = (char*)*ap;
    1550:	8b 45 d0             	mov    -0x30(%ebp),%eax
    1553:	8b 18                	mov    (%eax),%ebx
        ap++;
    1555:	83 c0 04             	add    $0x4,%eax
    1558:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    155b:	85 db                	test   %ebx,%ebx
    155d:	74 17                	je     1576 <printf+0x186>
        while(*s != 0){
    155f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
    1562:	31 d2                	xor    %edx,%edx
        while(*s != 0){
    1564:	84 c0                	test   %al,%al
    1566:	0f 84 d8 fe ff ff    	je     1444 <printf+0x54>
    156c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    156f:	89 de                	mov    %ebx,%esi
    1571:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1574:	eb 1a                	jmp    1590 <printf+0x1a0>
          s = "(null)";
    1576:	bb 58 17 00 00       	mov    $0x1758,%ebx
        while(*s != 0){
    157b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    157e:	b8 28 00 00 00       	mov    $0x28,%eax
    1583:	89 de                	mov    %ebx,%esi
    1585:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1588:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    158f:	90                   	nop
  write(fd, &c, 1);
    1590:	83 ec 04             	sub    $0x4,%esp
          s++;
    1593:	83 c6 01             	add    $0x1,%esi
    1596:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1599:	6a 01                	push   $0x1
    159b:	57                   	push   %edi
    159c:	53                   	push   %ebx
    159d:	e8 e1 fc ff ff       	call   1283 <write>
        while(*s != 0){
    15a2:	0f b6 06             	movzbl (%esi),%eax
    15a5:	83 c4 10             	add    $0x10,%esp
    15a8:	84 c0                	test   %al,%al
    15aa:	75 e4                	jne    1590 <printf+0x1a0>
      state = 0;
    15ac:	8b 75 d4             	mov    -0x2c(%ebp),%esi
    15af:	31 d2                	xor    %edx,%edx
    15b1:	e9 8e fe ff ff       	jmp    1444 <printf+0x54>
    15b6:	66 90                	xchg   %ax,%ax
    15b8:	66 90                	xchg   %ax,%ax
    15ba:	66 90                	xchg   %ax,%ax
    15bc:	66 90                	xchg   %ax,%ax
    15be:	66 90                	xchg   %ax,%ax

000015c0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    15c0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15c1:	a1 f4 19 00 00       	mov    0x19f4,%eax
{
    15c6:	89 e5                	mov    %esp,%ebp
    15c8:	57                   	push   %edi
    15c9:	56                   	push   %esi
    15ca:	53                   	push   %ebx
    15cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    15ce:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    15d8:	89 c2                	mov    %eax,%edx
    15da:	8b 00                	mov    (%eax),%eax
    15dc:	39 ca                	cmp    %ecx,%edx
    15de:	73 30                	jae    1610 <free+0x50>
    15e0:	39 c1                	cmp    %eax,%ecx
    15e2:	72 04                	jb     15e8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    15e4:	39 c2                	cmp    %eax,%edx
    15e6:	72 f0                	jb     15d8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
    15e8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    15eb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    15ee:	39 f8                	cmp    %edi,%eax
    15f0:	74 30                	je     1622 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    15f2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    15f5:	8b 42 04             	mov    0x4(%edx),%eax
    15f8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    15fb:	39 f1                	cmp    %esi,%ecx
    15fd:	74 3a                	je     1639 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    15ff:	89 0a                	mov    %ecx,(%edx)
  freep = p;
}
    1601:	5b                   	pop    %ebx
  freep = p;
    1602:	89 15 f4 19 00 00    	mov    %edx,0x19f4
}
    1608:	5e                   	pop    %esi
    1609:	5f                   	pop    %edi
    160a:	5d                   	pop    %ebp
    160b:	c3                   	ret    
    160c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1610:	39 c2                	cmp    %eax,%edx
    1612:	72 c4                	jb     15d8 <free+0x18>
    1614:	39 c1                	cmp    %eax,%ecx
    1616:	73 c0                	jae    15d8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
    1618:	8b 73 fc             	mov    -0x4(%ebx),%esi
    161b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    161e:	39 f8                	cmp    %edi,%eax
    1620:	75 d0                	jne    15f2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
    1622:	03 70 04             	add    0x4(%eax),%esi
    1625:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1628:	8b 02                	mov    (%edx),%eax
    162a:	8b 00                	mov    (%eax),%eax
    162c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    162f:	8b 42 04             	mov    0x4(%edx),%eax
    1632:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    1635:	39 f1                	cmp    %esi,%ecx
    1637:	75 c6                	jne    15ff <free+0x3f>
    p->s.size += bp->s.size;
    1639:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
    163c:	89 15 f4 19 00 00    	mov    %edx,0x19f4
    p->s.size += bp->s.size;
    1642:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    1645:	8b 43 f8             	mov    -0x8(%ebx),%eax
    1648:	89 02                	mov    %eax,(%edx)
}
    164a:	5b                   	pop    %ebx
    164b:	5e                   	pop    %esi
    164c:	5f                   	pop    %edi
    164d:	5d                   	pop    %ebp
    164e:	c3                   	ret    
    164f:	90                   	nop

00001650 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1650:	55                   	push   %ebp
    1651:	89 e5                	mov    %esp,%ebp
    1653:	57                   	push   %edi
    1654:	56                   	push   %esi
    1655:	53                   	push   %ebx
    1656:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1659:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    165c:	8b 3d f4 19 00 00    	mov    0x19f4,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1662:	8d 70 07             	lea    0x7(%eax),%esi
    1665:	c1 ee 03             	shr    $0x3,%esi
    1668:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    166b:	85 ff                	test   %edi,%edi
    166d:	0f 84 ad 00 00 00    	je     1720 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1673:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
    1675:	8b 48 04             	mov    0x4(%eax),%ecx
    1678:	39 f1                	cmp    %esi,%ecx
    167a:	73 71                	jae    16ed <malloc+0x9d>
    167c:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
    1682:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1687:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    168a:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
    1691:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
    1694:	eb 1b                	jmp    16b1 <malloc+0x61>
    1696:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    169d:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    16a0:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
    16a2:	8b 4a 04             	mov    0x4(%edx),%ecx
    16a5:	39 f1                	cmp    %esi,%ecx
    16a7:	73 4f                	jae    16f8 <malloc+0xa8>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    16a9:	8b 3d f4 19 00 00    	mov    0x19f4,%edi
    16af:	89 d0                	mov    %edx,%eax
    16b1:	39 c7                	cmp    %eax,%edi
    16b3:	75 eb                	jne    16a0 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
    16b5:	83 ec 0c             	sub    $0xc,%esp
    16b8:	ff 75 e4             	pushl  -0x1c(%ebp)
    16bb:	e8 2b fc ff ff       	call   12eb <sbrk>
  if(p == (char*)-1)
    16c0:	83 c4 10             	add    $0x10,%esp
    16c3:	83 f8 ff             	cmp    $0xffffffff,%eax
    16c6:	74 1b                	je     16e3 <malloc+0x93>
  hp->s.size = nu;
    16c8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    16cb:	83 ec 0c             	sub    $0xc,%esp
    16ce:	83 c0 08             	add    $0x8,%eax
    16d1:	50                   	push   %eax
    16d2:	e8 e9 fe ff ff       	call   15c0 <free>
  return freep;
    16d7:	a1 f4 19 00 00       	mov    0x19f4,%eax
      if((p = morecore(nunits)) == 0)
    16dc:	83 c4 10             	add    $0x10,%esp
    16df:	85 c0                	test   %eax,%eax
    16e1:	75 bd                	jne    16a0 <malloc+0x50>
        return 0;
  }
}
    16e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    16e6:	31 c0                	xor    %eax,%eax
}
    16e8:	5b                   	pop    %ebx
    16e9:	5e                   	pop    %esi
    16ea:	5f                   	pop    %edi
    16eb:	5d                   	pop    %ebp
    16ec:	c3                   	ret    
    if(p->s.size >= nunits){
    16ed:	89 c2                	mov    %eax,%edx
    16ef:	89 f8                	mov    %edi,%eax
    16f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
    16f8:	39 ce                	cmp    %ecx,%esi
    16fa:	74 54                	je     1750 <malloc+0x100>
        p->s.size -= nunits;
    16fc:	29 f1                	sub    %esi,%ecx
    16fe:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
    1701:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
    1704:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
    1707:	a3 f4 19 00 00       	mov    %eax,0x19f4
}
    170c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    170f:	8d 42 08             	lea    0x8(%edx),%eax
}
    1712:	5b                   	pop    %ebx
    1713:	5e                   	pop    %esi
    1714:	5f                   	pop    %edi
    1715:	5d                   	pop    %ebp
    1716:	c3                   	ret    
    1717:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    171e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
    1720:	c7 05 f4 19 00 00 f8 	movl   $0x19f8,0x19f4
    1727:	19 00 00 
    base.s.size = 0;
    172a:	bf f8 19 00 00       	mov    $0x19f8,%edi
    base.s.ptr = freep = prevp = &base;
    172f:	c7 05 f8 19 00 00 f8 	movl   $0x19f8,0x19f8
    1736:	19 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1739:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
    173b:	c7 05 fc 19 00 00 00 	movl   $0x0,0x19fc
    1742:	00 00 00 
    if(p->s.size >= nunits){
    1745:	e9 32 ff ff ff       	jmp    167c <malloc+0x2c>
    174a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    1750:	8b 0a                	mov    (%edx),%ecx
    1752:	89 08                	mov    %ecx,(%eax)
    1754:	eb b1                	jmp    1707 <malloc+0xb7>
