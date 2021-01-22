
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
    1303:	66 90                	xchg   %ax,%ax
    1305:	66 90                	xchg   %ax,%ax
    1307:	66 90                	xchg   %ax,%ax
    1309:	66 90                	xchg   %ax,%ax
    130b:	66 90                	xchg   %ax,%ax
    130d:	66 90                	xchg   %ax,%ax
    130f:	90                   	nop

00001310 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1310:	55                   	push   %ebp
    1311:	89 e5                	mov    %esp,%ebp
    1313:	57                   	push   %edi
    1314:	56                   	push   %esi
    1315:	53                   	push   %ebx
    1316:	83 ec 3c             	sub    $0x3c,%esp
    1319:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    131c:	89 d1                	mov    %edx,%ecx
{
    131e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    1321:	85 d2                	test   %edx,%edx
    1323:	0f 89 7f 00 00 00    	jns    13a8 <printint+0x98>
    1329:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    132d:	74 79                	je     13a8 <printint+0x98>
    neg = 1;
    132f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    1336:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    1338:	31 db                	xor    %ebx,%ebx
    133a:	8d 75 d7             	lea    -0x29(%ebp),%esi
    133d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1340:	89 c8                	mov    %ecx,%eax
    1342:	31 d2                	xor    %edx,%edx
    1344:	89 cf                	mov    %ecx,%edi
    1346:	f7 75 c4             	divl   -0x3c(%ebp)
    1349:	0f b6 92 30 17 00 00 	movzbl 0x1730(%edx),%edx
    1350:	89 45 c0             	mov    %eax,-0x40(%ebp)
    1353:	89 d8                	mov    %ebx,%eax
    1355:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    1358:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    135b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    135e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    1361:	76 dd                	jbe    1340 <printint+0x30>
  if(neg)
    1363:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    1366:	85 c9                	test   %ecx,%ecx
    1368:	74 0c                	je     1376 <printint+0x66>
    buf[i++] = '-';
    136a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    136f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    1371:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    1376:	8b 7d b8             	mov    -0x48(%ebp),%edi
    1379:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    137d:	eb 07                	jmp    1386 <printint+0x76>
    137f:	90                   	nop
    putc(fd, buf[i]);
    1380:	0f b6 13             	movzbl (%ebx),%edx
    1383:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    1386:	83 ec 04             	sub    $0x4,%esp
    1389:	88 55 d7             	mov    %dl,-0x29(%ebp)
    138c:	6a 01                	push   $0x1
    138e:	56                   	push   %esi
    138f:	57                   	push   %edi
    1390:	e8 ee fe ff ff       	call   1283 <write>
  while(--i >= 0)
    1395:	83 c4 10             	add    $0x10,%esp
    1398:	39 de                	cmp    %ebx,%esi
    139a:	75 e4                	jne    1380 <printint+0x70>
}
    139c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    139f:	5b                   	pop    %ebx
    13a0:	5e                   	pop    %esi
    13a1:	5f                   	pop    %edi
    13a2:	5d                   	pop    %ebp
    13a3:	c3                   	ret    
    13a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    13a8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    13af:	eb 87                	jmp    1338 <printint+0x28>
    13b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    13b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    13bf:	90                   	nop

000013c0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    13c0:	55                   	push   %ebp
    13c1:	89 e5                	mov    %esp,%ebp
    13c3:	57                   	push   %edi
    13c4:	56                   	push   %esi
    13c5:	53                   	push   %ebx
    13c6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    13c9:	8b 75 0c             	mov    0xc(%ebp),%esi
    13cc:	0f b6 1e             	movzbl (%esi),%ebx
    13cf:	84 db                	test   %bl,%bl
    13d1:	0f 84 b8 00 00 00    	je     148f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
    13d7:	8d 45 10             	lea    0x10(%ebp),%eax
    13da:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    13dd:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    13e0:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
    13e2:	89 45 d0             	mov    %eax,-0x30(%ebp)
    13e5:	eb 37                	jmp    141e <printf+0x5e>
    13e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    13ee:	66 90                	xchg   %ax,%ax
    13f0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    13f3:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    13f8:	83 f8 25             	cmp    $0x25,%eax
    13fb:	74 17                	je     1414 <printf+0x54>
  write(fd, &c, 1);
    13fd:	83 ec 04             	sub    $0x4,%esp
    1400:	88 5d e7             	mov    %bl,-0x19(%ebp)
    1403:	6a 01                	push   $0x1
    1405:	57                   	push   %edi
    1406:	ff 75 08             	pushl  0x8(%ebp)
    1409:	e8 75 fe ff ff       	call   1283 <write>
    140e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
    1411:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    1414:	0f b6 1e             	movzbl (%esi),%ebx
    1417:	83 c6 01             	add    $0x1,%esi
    141a:	84 db                	test   %bl,%bl
    141c:	74 71                	je     148f <printf+0xcf>
    c = fmt[i] & 0xff;
    141e:	0f be cb             	movsbl %bl,%ecx
    1421:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1424:	85 d2                	test   %edx,%edx
    1426:	74 c8                	je     13f0 <printf+0x30>
      }
    } else if(state == '%'){
    1428:	83 fa 25             	cmp    $0x25,%edx
    142b:	75 e7                	jne    1414 <printf+0x54>
      if(c == 'd'){
    142d:	83 f8 64             	cmp    $0x64,%eax
    1430:	0f 84 9a 00 00 00    	je     14d0 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    1436:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    143c:	83 f9 70             	cmp    $0x70,%ecx
    143f:	74 5f                	je     14a0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1441:	83 f8 73             	cmp    $0x73,%eax
    1444:	0f 84 d6 00 00 00    	je     1520 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    144a:	83 f8 63             	cmp    $0x63,%eax
    144d:	0f 84 8d 00 00 00    	je     14e0 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1453:	83 f8 25             	cmp    $0x25,%eax
    1456:	0f 84 b4 00 00 00    	je     1510 <printf+0x150>
  write(fd, &c, 1);
    145c:	83 ec 04             	sub    $0x4,%esp
    145f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    1463:	6a 01                	push   $0x1
    1465:	57                   	push   %edi
    1466:	ff 75 08             	pushl  0x8(%ebp)
    1469:	e8 15 fe ff ff       	call   1283 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
    146e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
    1471:	83 c4 0c             	add    $0xc,%esp
    1474:	6a 01                	push   $0x1
  for(i = 0; fmt[i]; i++){
    1476:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    1479:	57                   	push   %edi
    147a:	ff 75 08             	pushl  0x8(%ebp)
    147d:	e8 01 fe ff ff       	call   1283 <write>
  for(i = 0; fmt[i]; i++){
    1482:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
    1486:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
    1489:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    148b:	84 db                	test   %bl,%bl
    148d:	75 8f                	jne    141e <printf+0x5e>
    }
  }
}
    148f:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1492:	5b                   	pop    %ebx
    1493:	5e                   	pop    %esi
    1494:	5f                   	pop    %edi
    1495:	5d                   	pop    %ebp
    1496:	c3                   	ret    
    1497:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    149e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    14a0:	83 ec 0c             	sub    $0xc,%esp
    14a3:	b9 10 00 00 00       	mov    $0x10,%ecx
    14a8:	6a 00                	push   $0x0
    14aa:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    14ad:	8b 45 08             	mov    0x8(%ebp),%eax
    14b0:	8b 13                	mov    (%ebx),%edx
    14b2:	e8 59 fe ff ff       	call   1310 <printint>
        ap++;
    14b7:	89 d8                	mov    %ebx,%eax
    14b9:	83 c4 10             	add    $0x10,%esp
      state = 0;
    14bc:	31 d2                	xor    %edx,%edx
        ap++;
    14be:	83 c0 04             	add    $0x4,%eax
    14c1:	89 45 d0             	mov    %eax,-0x30(%ebp)
    14c4:	e9 4b ff ff ff       	jmp    1414 <printf+0x54>
    14c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
    14d0:	83 ec 0c             	sub    $0xc,%esp
    14d3:	b9 0a 00 00 00       	mov    $0xa,%ecx
    14d8:	6a 01                	push   $0x1
    14da:	eb ce                	jmp    14aa <printf+0xea>
    14dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    14e0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
    14e3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    14e6:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
    14e8:	6a 01                	push   $0x1
        ap++;
    14ea:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
    14ed:	57                   	push   %edi
    14ee:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
    14f1:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    14f4:	e8 8a fd ff ff       	call   1283 <write>
        ap++;
    14f9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    14fc:	83 c4 10             	add    $0x10,%esp
      state = 0;
    14ff:	31 d2                	xor    %edx,%edx
    1501:	e9 0e ff ff ff       	jmp    1414 <printf+0x54>
    1506:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    150d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
    1510:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
    1513:	83 ec 04             	sub    $0x4,%esp
    1516:	e9 59 ff ff ff       	jmp    1474 <printf+0xb4>
    151b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    151f:	90                   	nop
        s = (char*)*ap;
    1520:	8b 45 d0             	mov    -0x30(%ebp),%eax
    1523:	8b 18                	mov    (%eax),%ebx
        ap++;
    1525:	83 c0 04             	add    $0x4,%eax
    1528:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    152b:	85 db                	test   %ebx,%ebx
    152d:	74 17                	je     1546 <printf+0x186>
        while(*s != 0){
    152f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
    1532:	31 d2                	xor    %edx,%edx
        while(*s != 0){
    1534:	84 c0                	test   %al,%al
    1536:	0f 84 d8 fe ff ff    	je     1414 <printf+0x54>
    153c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    153f:	89 de                	mov    %ebx,%esi
    1541:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1544:	eb 1a                	jmp    1560 <printf+0x1a0>
          s = "(null)";
    1546:	bb 28 17 00 00       	mov    $0x1728,%ebx
        while(*s != 0){
    154b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    154e:	b8 28 00 00 00       	mov    $0x28,%eax
    1553:	89 de                	mov    %ebx,%esi
    1555:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1558:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    155f:	90                   	nop
  write(fd, &c, 1);
    1560:	83 ec 04             	sub    $0x4,%esp
          s++;
    1563:	83 c6 01             	add    $0x1,%esi
    1566:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1569:	6a 01                	push   $0x1
    156b:	57                   	push   %edi
    156c:	53                   	push   %ebx
    156d:	e8 11 fd ff ff       	call   1283 <write>
        while(*s != 0){
    1572:	0f b6 06             	movzbl (%esi),%eax
    1575:	83 c4 10             	add    $0x10,%esp
    1578:	84 c0                	test   %al,%al
    157a:	75 e4                	jne    1560 <printf+0x1a0>
      state = 0;
    157c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
    157f:	31 d2                	xor    %edx,%edx
    1581:	e9 8e fe ff ff       	jmp    1414 <printf+0x54>
    1586:	66 90                	xchg   %ax,%ax
    1588:	66 90                	xchg   %ax,%ax
    158a:	66 90                	xchg   %ax,%ax
    158c:	66 90                	xchg   %ax,%ax
    158e:	66 90                	xchg   %ax,%ax

00001590 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1590:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1591:	a1 c4 19 00 00       	mov    0x19c4,%eax
{
    1596:	89 e5                	mov    %esp,%ebp
    1598:	57                   	push   %edi
    1599:	56                   	push   %esi
    159a:	53                   	push   %ebx
    159b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    159e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    15a8:	89 c2                	mov    %eax,%edx
    15aa:	8b 00                	mov    (%eax),%eax
    15ac:	39 ca                	cmp    %ecx,%edx
    15ae:	73 30                	jae    15e0 <free+0x50>
    15b0:	39 c1                	cmp    %eax,%ecx
    15b2:	72 04                	jb     15b8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    15b4:	39 c2                	cmp    %eax,%edx
    15b6:	72 f0                	jb     15a8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
    15b8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    15bb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    15be:	39 f8                	cmp    %edi,%eax
    15c0:	74 30                	je     15f2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    15c2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    15c5:	8b 42 04             	mov    0x4(%edx),%eax
    15c8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    15cb:	39 f1                	cmp    %esi,%ecx
    15cd:	74 3a                	je     1609 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    15cf:	89 0a                	mov    %ecx,(%edx)
  freep = p;
}
    15d1:	5b                   	pop    %ebx
  freep = p;
    15d2:	89 15 c4 19 00 00    	mov    %edx,0x19c4
}
    15d8:	5e                   	pop    %esi
    15d9:	5f                   	pop    %edi
    15da:	5d                   	pop    %ebp
    15db:	c3                   	ret    
    15dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    15e0:	39 c2                	cmp    %eax,%edx
    15e2:	72 c4                	jb     15a8 <free+0x18>
    15e4:	39 c1                	cmp    %eax,%ecx
    15e6:	73 c0                	jae    15a8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
    15e8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    15eb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    15ee:	39 f8                	cmp    %edi,%eax
    15f0:	75 d0                	jne    15c2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
    15f2:	03 70 04             	add    0x4(%eax),%esi
    15f5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    15f8:	8b 02                	mov    (%edx),%eax
    15fa:	8b 00                	mov    (%eax),%eax
    15fc:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    15ff:	8b 42 04             	mov    0x4(%edx),%eax
    1602:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    1605:	39 f1                	cmp    %esi,%ecx
    1607:	75 c6                	jne    15cf <free+0x3f>
    p->s.size += bp->s.size;
    1609:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
    160c:	89 15 c4 19 00 00    	mov    %edx,0x19c4
    p->s.size += bp->s.size;
    1612:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    1615:	8b 43 f8             	mov    -0x8(%ebx),%eax
    1618:	89 02                	mov    %eax,(%edx)
}
    161a:	5b                   	pop    %ebx
    161b:	5e                   	pop    %esi
    161c:	5f                   	pop    %edi
    161d:	5d                   	pop    %ebp
    161e:	c3                   	ret    
    161f:	90                   	nop

00001620 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1620:	55                   	push   %ebp
    1621:	89 e5                	mov    %esp,%ebp
    1623:	57                   	push   %edi
    1624:	56                   	push   %esi
    1625:	53                   	push   %ebx
    1626:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1629:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    162c:	8b 3d c4 19 00 00    	mov    0x19c4,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1632:	8d 70 07             	lea    0x7(%eax),%esi
    1635:	c1 ee 03             	shr    $0x3,%esi
    1638:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    163b:	85 ff                	test   %edi,%edi
    163d:	0f 84 ad 00 00 00    	je     16f0 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1643:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
    1645:	8b 48 04             	mov    0x4(%eax),%ecx
    1648:	39 f1                	cmp    %esi,%ecx
    164a:	73 71                	jae    16bd <malloc+0x9d>
    164c:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
    1652:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1657:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    165a:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
    1661:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
    1664:	eb 1b                	jmp    1681 <malloc+0x61>
    1666:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    166d:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1670:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
    1672:	8b 4a 04             	mov    0x4(%edx),%ecx
    1675:	39 f1                	cmp    %esi,%ecx
    1677:	73 4f                	jae    16c8 <malloc+0xa8>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1679:	8b 3d c4 19 00 00    	mov    0x19c4,%edi
    167f:	89 d0                	mov    %edx,%eax
    1681:	39 c7                	cmp    %eax,%edi
    1683:	75 eb                	jne    1670 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
    1685:	83 ec 0c             	sub    $0xc,%esp
    1688:	ff 75 e4             	pushl  -0x1c(%ebp)
    168b:	e8 5b fc ff ff       	call   12eb <sbrk>
  if(p == (char*)-1)
    1690:	83 c4 10             	add    $0x10,%esp
    1693:	83 f8 ff             	cmp    $0xffffffff,%eax
    1696:	74 1b                	je     16b3 <malloc+0x93>
  hp->s.size = nu;
    1698:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    169b:	83 ec 0c             	sub    $0xc,%esp
    169e:	83 c0 08             	add    $0x8,%eax
    16a1:	50                   	push   %eax
    16a2:	e8 e9 fe ff ff       	call   1590 <free>
  return freep;
    16a7:	a1 c4 19 00 00       	mov    0x19c4,%eax
      if((p = morecore(nunits)) == 0)
    16ac:	83 c4 10             	add    $0x10,%esp
    16af:	85 c0                	test   %eax,%eax
    16b1:	75 bd                	jne    1670 <malloc+0x50>
        return 0;
  }
}
    16b3:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    16b6:	31 c0                	xor    %eax,%eax
}
    16b8:	5b                   	pop    %ebx
    16b9:	5e                   	pop    %esi
    16ba:	5f                   	pop    %edi
    16bb:	5d                   	pop    %ebp
    16bc:	c3                   	ret    
    if(p->s.size >= nunits){
    16bd:	89 c2                	mov    %eax,%edx
    16bf:	89 f8                	mov    %edi,%eax
    16c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
    16c8:	39 ce                	cmp    %ecx,%esi
    16ca:	74 54                	je     1720 <malloc+0x100>
        p->s.size -= nunits;
    16cc:	29 f1                	sub    %esi,%ecx
    16ce:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
    16d1:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
    16d4:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
    16d7:	a3 c4 19 00 00       	mov    %eax,0x19c4
}
    16dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    16df:	8d 42 08             	lea    0x8(%edx),%eax
}
    16e2:	5b                   	pop    %ebx
    16e3:	5e                   	pop    %esi
    16e4:	5f                   	pop    %edi
    16e5:	5d                   	pop    %ebp
    16e6:	c3                   	ret    
    16e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    16ee:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
    16f0:	c7 05 c4 19 00 00 c8 	movl   $0x19c8,0x19c4
    16f7:	19 00 00 
    base.s.size = 0;
    16fa:	bf c8 19 00 00       	mov    $0x19c8,%edi
    base.s.ptr = freep = prevp = &base;
    16ff:	c7 05 c8 19 00 00 c8 	movl   $0x19c8,0x19c8
    1706:	19 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1709:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
    170b:	c7 05 cc 19 00 00 00 	movl   $0x0,0x19cc
    1712:	00 00 00 
    if(p->s.size >= nunits){
    1715:	e9 32 ff ff ff       	jmp    164c <malloc+0x2c>
    171a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    1720:	8b 0a                	mov    (%edx),%ecx
    1722:	89 08                	mov    %ecx,(%eax)
    1724:	eb b1                	jmp    16d7 <malloc+0xb7>
