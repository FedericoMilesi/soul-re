.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_80027170
/* 17970 80027170 1800CA8C */  lw         $t2, 0x18($a2)
/* 17974 80027174 2140A000 */  addu       $t0, $a1, $zero
/* 17978 80027178 82034019 */  blez       $t2, .L80027F84
/* 1797C 8002717C 801F0B3C */   lui       $t3, (0x1F80005C >> 16)
/* 17980 80027180 740076AD */  sw         $s6, (0x1F800074 & 0xFFFF)($t3)
/* 17984 80027184 700075AD */  sw         $s5, (0x1F800070 & 0xFFFF)($t3)
/* 17988 80027188 6C0074AD */  sw         $s4, (0x1F80006C & 0xFFFF)($t3)
/* 1798C 8002718C 680073AD */  sw         $s3, (0x1F800068 & 0xFFFF)($t3)
/* 17990 80027190 640072AD */  sw         $s2, (0x1F800064 & 0xFFFF)($t3)
/* 17994 80027194 600071AD */  sw         $s1, (0x1F800060 & 0xFFFF)($t3)
/* 17998 80027198 5C0070AD */  sw         $s0, (0x1F80005C & 0xFFFF)($t3)
/* 1799C 8002719C 1000A98F */  lw         $t1, 0x10($sp)
/* 179A0 800271A0 1C00D88C */  lw         $t8, 0x1C($a2)
/* 179A4 800271A4 21C88000 */  addu       $t9, $a0, $zero
/* 179A8 800271A8 1800B18F */  lw         $s1, 0x18($sp)
/* 179AC 800271AC 0C80123C */  lui        $s2, (0x800CA454 >> 16)
/* 179B0 800271B0 54A45236 */  ori        $s2, $s2, (0x800CA454 & 0xFFFF)
/* 179B4 800271B4 1C00B68F */  lw         $s6, 0x1C($sp)
/* 179B8 800271B8 0000EC8C */  lw         $t4, 0x0($a3)
/* 179BC 800271BC 0400ED8C */  lw         $t5, 0x4($a3)
/* 179C0 800271C0 00006CAD */  sw         $t4, (0x1F800000 & 0xFFFF)($t3)
/* 179C4 800271C4 04006DAD */  sw         $t5, (0x1F800004 & 0xFFFF)($t3)
/* 179C8 800271C8 0800EC8C */  lw         $t4, 0x8($a3)
/* 179CC 800271CC 0C00ED8C */  lw         $t5, 0xC($a3)
/* 179D0 800271D0 1000EE8C */  lw         $t6, 0x10($a3)
/* 179D4 800271D4 08006CAD */  sw         $t4, (0x1F800008 & 0xFFFF)($t3)
/* 179D8 800271D8 0C006DAD */  sw         $t5, (0x1F80000C & 0xFFFF)($t3)
/* 179DC 800271DC 10006EAD */  sw         $t6, (0x1F800010 & 0xFFFF)($t3)
/* 179E0 800271E0 1400EC8C */  lw         $t4, 0x14($a3)
/* 179E4 800271E4 1800ED8C */  lw         $t5, 0x18($a3)
/* 179E8 800271E8 1C00EE8C */  lw         $t6, 0x1C($a3)
/* 179EC 800271EC 14006CAD */  sw         $t4, (0x1F800014 & 0xFFFF)($t3)
/* 179F0 800271F0 18006DAD */  sw         $t5, (0x1F800018 & 0xFFFF)($t3)
/* 179F4 800271F4 1C006EAD */  sw         $t6, (0x1F80001C & 0xFFFF)($t3)
/* 179F8 800271F8 FFFF0124 */  addiu      $at, $zero, -0x1
/* 179FC 800271FC 2530C100 */  or         $a2, $a2, $at
/* 17A00 80027200 49012012 */  beqz       $s1, .L80027728
/* 17A04 80027204 1400B08F */   lw        $s0, 0x14($sp)
/* 17A08 80027208 00000000 */  nop
/* 17A0C 8002720C 00000C8E */  lw         $t4, 0x0($s0)
/* 17A10 80027210 04000D8E */  lw         $t5, 0x4($s0)
/* 17A14 80027214 34006CAD */  sw         $t4, (0x1F800034 & 0xFFFF)($t3)
/* 17A18 80027218 38006DAD */  sw         $t5, (0x1F800038 & 0xFFFF)($t3)
/* 17A1C 8002721C 08000C8E */  lw         $t4, 0x8($s0)
/* 17A20 80027220 0C000D8E */  lw         $t5, 0xC($s0)
/* 17A24 80027224 10000E8E */  lw         $t6, 0x10($s0)
/* 17A28 80027228 3C006CAD */  sw         $t4, (0x1F80003C & 0xFFFF)($t3)
/* 17A2C 8002722C 40006DAD */  sw         $t5, (0x1F800040 & 0xFFFF)($t3)
/* 17A30 80027230 44006EAD */  sw         $t6, (0x1F800044 & 0xFFFF)($t3)
/* 17A34 80027234 E501C016 */  bnez       $s6, .L800279CC
/* 17A38 80027238 FF34023C */   lui       $v0, (0x34FFFFFF >> 16)
/* 17A3C 8002723C FFFF4234 */  ori        $v0, $v0, (0x34FFFFFF & 0xFFFF)
/* 17A40 80027240 00308248 */  mtc2       $v0, $6 # handwritten instruction
.L80027244:
/* 17A44 80027244 0800048F */  lw         $a0, 0x8($t8)
/* 17A48 80027248 00000000 */  nop
/* 17A4C 8002724C 03140400 */  sra        $v0, $a0, 16
/* 17A50 80027250 01004324 */  addiu      $v1, $v0, 0x1
/* 17A54 80027254 2E016010 */  beqz       $v1, .L80027710
/* 17A58 80027258 C0780200 */   sll       $t7, $v0, 3
/* 17A5C 8002725C 21782F03 */  addu       $t7, $t9, $t7
/* 17A60 80027260 FFFF8C30 */  andi       $t4, $a0, 0xFFFF
/* 17A64 80027264 C0280C00 */  sll        $a1, $t4, 3
/* 17A68 80027268 21282503 */  addu       $a1, $t9, $a1
/* 17A6C 8002726C 34006225 */  addiu      $v0, $t3, %lo(D_1F800034)
/* 17A70 80027270 48006325 */  addiu      $v1, $t3, %lo(D_1F800048)
/* 17A74 80027274 00004C8C */  lw         $t4, 0x0($v0)
/* 17A78 80027278 04004D8C */  lw         $t5, 0x4($v0)
/* 17A7C 8002727C 0000CC48 */  ctc2       $t4, $0 # handwritten instruction
/* 17A80 80027280 0008CD48 */  ctc2       $t5, $1 # handwritten instruction
/* 17A84 80027284 08004C8C */  lw         $t4, 0x8($v0)
/* 17A88 80027288 0C004D8C */  lw         $t5, 0xC($v0)
/* 17A8C 8002728C 10004E8C */  lw         $t6, 0x10($v0)
/* 17A90 80027290 0010CC48 */  ctc2       $t4, $2 # handwritten instruction
/* 17A94 80027294 0018CD48 */  ctc2       $t5, $3 # handwritten instruction
/* 17A98 80027298 0020CE48 */  ctc2       $t6, $4 # handwritten instruction
/* 17A9C 8002729C 00002C95 */  lhu        $t4, 0x0($t1)
/* 17AA0 800272A0 06002D95 */  lhu        $t5, 0x6($t1)
/* 17AA4 800272A4 0C002E95 */  lhu        $t6, 0xC($t1)
/* 17AA8 800272A8 00488C48 */  mtc2       $t4, $9 # handwritten instruction
/* 17AAC 800272AC 00508D48 */  mtc2       $t5, $10 # handwritten instruction
/* 17AB0 800272B0 00588E48 */  mtc2       $t6, $11 # handwritten instruction
/* 17AB4 800272B4 00000000 */  nop
/* 17AB8 800272B8 00000000 */  nop
/* 17ABC 800272BC 12E0494A */  MVMVA      1, 0, 3, 3, 0
/* 17AC0 800272C0 00480C48 */  mfc2       $t4, $9 # handwritten instruction
/* 17AC4 800272C4 00500D48 */  mfc2       $t5, $10 # handwritten instruction
/* 17AC8 800272C8 00580E48 */  mfc2       $t6, $11 # handwritten instruction
/* 17ACC 800272CC 00006CA4 */  sh         $t4, 0x0($v1)
/* 17AD0 800272D0 06006DA4 */  sh         $t5, 0x6($v1)
/* 17AD4 800272D4 0C006EA4 */  sh         $t6, 0xC($v1)
/* 17AD8 800272D8 02002C95 */  lhu        $t4, 0x2($t1)
/* 17ADC 800272DC 08002D95 */  lhu        $t5, 0x8($t1)
/* 17AE0 800272E0 0E002E95 */  lhu        $t6, 0xE($t1)
/* 17AE4 800272E4 00488C48 */  mtc2       $t4, $9 # handwritten instruction
/* 17AE8 800272E8 00508D48 */  mtc2       $t5, $10 # handwritten instruction
/* 17AEC 800272EC 00588E48 */  mtc2       $t6, $11 # handwritten instruction
/* 17AF0 800272F0 00000000 */  nop
/* 17AF4 800272F4 00000000 */  nop
/* 17AF8 800272F8 12E0494A */  MVMVA      1, 0, 3, 3, 0
/* 17AFC 800272FC 00480C48 */  mfc2       $t4, $9 # handwritten instruction
/* 17B00 80027300 00500D48 */  mfc2       $t5, $10 # handwritten instruction
/* 17B04 80027304 00580E48 */  mfc2       $t6, $11 # handwritten instruction
/* 17B08 80027308 02006CA4 */  sh         $t4, 0x2($v1)
/* 17B0C 8002730C 08006DA4 */  sh         $t5, 0x8($v1)
/* 17B10 80027310 0E006EA4 */  sh         $t6, 0xE($v1)
/* 17B14 80027314 04002C95 */  lhu        $t4, 0x4($t1)
/* 17B18 80027318 0A002D95 */  lhu        $t5, 0xA($t1)
/* 17B1C 8002731C 10002E95 */  lhu        $t6, 0x10($t1)
/* 17B20 80027320 00488C48 */  mtc2       $t4, $9 # handwritten instruction
/* 17B24 80027324 00508D48 */  mtc2       $t5, $10 # handwritten instruction
/* 17B28 80027328 00588E48 */  mtc2       $t6, $11 # handwritten instruction
/* 17B2C 8002732C 00000000 */  nop
/* 17B30 80027330 00000000 */  nop
/* 17B34 80027334 12E0494A */  MVMVA      1, 0, 3, 3, 0
/* 17B38 80027338 00480C48 */  mfc2       $t4, $9 # handwritten instruction
/* 17B3C 8002733C 00500D48 */  mfc2       $t5, $10 # handwritten instruction
/* 17B40 80027340 00580E48 */  mfc2       $t6, $11 # handwritten instruction
/* 17B44 80027344 04006CA4 */  sh         $t4, 0x4($v1)
/* 17B48 80027348 0A006DA4 */  sh         $t5, 0xA($v1)
/* 17B4C 8002734C 10006EA4 */  sh         $t6, 0x10($v1)
/* 17B50 80027350 00006C8C */  lw         $t4, 0x0($v1)
/* 17B54 80027354 04006D8C */  lw         $t5, 0x4($v1)
/* 17B58 80027358 0040CC48 */  ctc2       $t4, $8 # handwritten instruction
/* 17B5C 8002735C 0048CD48 */  ctc2       $t5, $9 # handwritten instruction
/* 17B60 80027360 08006C8C */  lw         $t4, 0x8($v1)
/* 17B64 80027364 0C006D8C */  lw         $t5, 0xC($v1)
/* 17B68 80027368 10006E8C */  lw         $t6, 0x10($v1)
/* 17B6C 8002736C 0050CC48 */  ctc2       $t4, $10 # handwritten instruction
/* 17B70 80027370 0058CD48 */  ctc2       $t5, $11 # handwritten instruction
/* 17B74 80027374 0060CE48 */  ctc2       $t6, $12 # handwritten instruction
/* 17B78 80027378 00006225 */  addiu      $v0, $t3, %lo(D_1F800000)
/* 17B7C 8002737C 20006325 */  addiu      $v1, $t3, %lo(D_1F800020)
/* 17B80 80027380 00004C8C */  lw         $t4, 0x0($v0)
/* 17B84 80027384 04004D8C */  lw         $t5, 0x4($v0)
/* 17B88 80027388 0000CC48 */  ctc2       $t4, $0 # handwritten instruction
/* 17B8C 8002738C 0008CD48 */  ctc2       $t5, $1 # handwritten instruction
/* 17B90 80027390 08004C8C */  lw         $t4, 0x8($v0)
/* 17B94 80027394 0C004D8C */  lw         $t5, 0xC($v0)
/* 17B98 80027398 10004E8C */  lw         $t6, 0x10($v0)
/* 17B9C 8002739C 0010CC48 */  ctc2       $t4, $2 # handwritten instruction
/* 17BA0 800273A0 0018CD48 */  ctc2       $t5, $3 # handwritten instruction
/* 17BA4 800273A4 0020CE48 */  ctc2       $t6, $4 # handwritten instruction
/* 17BA8 800273A8 00002C95 */  lhu        $t4, 0x0($t1)
/* 17BAC 800273AC 06002D95 */  lhu        $t5, 0x6($t1)
/* 17BB0 800273B0 0C002E95 */  lhu        $t6, 0xC($t1)
/* 17BB4 800273B4 00488C48 */  mtc2       $t4, $9 # handwritten instruction
/* 17BB8 800273B8 00508D48 */  mtc2       $t5, $10 # handwritten instruction
/* 17BBC 800273BC 00588E48 */  mtc2       $t6, $11 # handwritten instruction
/* 17BC0 800273C0 00000000 */  nop
/* 17BC4 800273C4 00000000 */  nop
/* 17BC8 800273C8 12E0494A */  MVMVA      1, 0, 3, 3, 0
/* 17BCC 800273CC 00480C48 */  mfc2       $t4, $9 # handwritten instruction
/* 17BD0 800273D0 00500D48 */  mfc2       $t5, $10 # handwritten instruction
/* 17BD4 800273D4 00580E48 */  mfc2       $t6, $11 # handwritten instruction
/* 17BD8 800273D8 00006CA4 */  sh         $t4, 0x0($v1)
/* 17BDC 800273DC 06006DA4 */  sh         $t5, 0x6($v1)
/* 17BE0 800273E0 0C006EA4 */  sh         $t6, 0xC($v1)
/* 17BE4 800273E4 02002C95 */  lhu        $t4, 0x2($t1)
/* 17BE8 800273E8 08002D95 */  lhu        $t5, 0x8($t1)
/* 17BEC 800273EC 0E002E95 */  lhu        $t6, 0xE($t1)
/* 17BF0 800273F0 00488C48 */  mtc2       $t4, $9 # handwritten instruction
/* 17BF4 800273F4 00508D48 */  mtc2       $t5, $10 # handwritten instruction
/* 17BF8 800273F8 00588E48 */  mtc2       $t6, $11 # handwritten instruction
/* 17BFC 800273FC 00000000 */  nop
/* 17C00 80027400 00000000 */  nop
/* 17C04 80027404 12E0494A */  MVMVA      1, 0, 3, 3, 0
/* 17C08 80027408 00480C48 */  mfc2       $t4, $9 # handwritten instruction
/* 17C0C 8002740C 00500D48 */  mfc2       $t5, $10 # handwritten instruction
/* 17C10 80027410 00580E48 */  mfc2       $t6, $11 # handwritten instruction
/* 17C14 80027414 02006CA4 */  sh         $t4, 0x2($v1)
/* 17C18 80027418 08006DA4 */  sh         $t5, 0x8($v1)
/* 17C1C 8002741C 0E006EA4 */  sh         $t6, 0xE($v1)
/* 17C20 80027420 04002C95 */  lhu        $t4, 0x4($t1)
/* 17C24 80027424 0A002D95 */  lhu        $t5, 0xA($t1)
/* 17C28 80027428 10002E95 */  lhu        $t6, 0x10($t1)
/* 17C2C 8002742C 00488C48 */  mtc2       $t4, $9 # handwritten instruction
/* 17C30 80027430 00508D48 */  mtc2       $t5, $10 # handwritten instruction
/* 17C34 80027434 00588E48 */  mtc2       $t6, $11 # handwritten instruction
/* 17C38 80027438 00000000 */  nop
/* 17C3C 8002743C 00000000 */  nop
/* 17C40 80027440 12E0494A */  MVMVA      1, 0, 3, 3, 0
/* 17C44 80027444 00480C48 */  mfc2       $t4, $9 # handwritten instruction
/* 17C48 80027448 00500D48 */  mfc2       $t5, $10 # handwritten instruction
/* 17C4C 8002744C 00580E48 */  mfc2       $t6, $11 # handwritten instruction
/* 17C50 80027450 04006CA4 */  sh         $t4, 0x4($v1)
/* 17C54 80027454 0A006DA4 */  sh         $t5, 0xA($v1)
/* 17C58 80027458 10006EA4 */  sh         $t6, 0x10($v1)
/* 17C5C 8002745C 14004C8C */  lw         $t4, 0x14($v0)
/* 17C60 80027460 18004D8C */  lw         $t5, 0x18($v0)
/* 17C64 80027464 1C004E8C */  lw         $t6, 0x1C($v0)
/* 17C68 80027468 0028CC48 */  ctc2       $t4, $5 # handwritten instruction
/* 17C6C 8002746C 0030CD48 */  ctc2       $t5, $6 # handwritten instruction
/* 17C70 80027470 0038CE48 */  ctc2       $t6, $7 # handwritten instruction
/* 17C74 80027474 18002D95 */  lhu        $t5, 0x18($t1)
/* 17C78 80027478 14002C95 */  lhu        $t4, 0x14($t1)
/* 17C7C 8002747C 006C0D00 */  sll        $t5, $t5, 16
/* 17C80 80027480 25608D01 */  or         $t4, $t4, $t5
/* 17C84 80027484 00008C48 */  mtc2       $t4, $0 # handwritten instruction
/* 17C88 80027488 1C0021C9 */  lwc2       $1, 0x1C($t1)
/* 17C8C 8002748C 00000000 */  nop
/* 17C90 80027490 00000000 */  nop
/* 17C94 80027494 1200484A */  MVMVA      1, 0, 0, 0, 0
/* 17C98 80027498 00480C48 */  mfc2       $t4, $9 # handwritten instruction
/* 17C9C 8002749C 00500D48 */  mfc2       $t5, $10 # handwritten instruction
/* 17CA0 800274A0 00580E48 */  mfc2       $t6, $11 # handwritten instruction
/* 17CA4 800274A4 0028CC48 */  ctc2       $t4, $5 # handwritten instruction
/* 17CA8 800274A8 0030CD48 */  ctc2       $t5, $6 # handwritten instruction
/* 17CAC 800274AC 0038CE48 */  ctc2       $t6, $7 # handwritten instruction
/* 17CB0 800274B0 00006C8C */  lw         $t4, 0x0($v1)
/* 17CB4 800274B4 04006D8C */  lw         $t5, 0x4($v1)
/* 17CB8 800274B8 0000CC48 */  ctc2       $t4, $0 # handwritten instruction
/* 17CBC 800274BC 0008CD48 */  ctc2       $t5, $1 # handwritten instruction
/* 17CC0 800274C0 08006C8C */  lw         $t4, 0x8($v1)
/* 17CC4 800274C4 0C006D8C */  lw         $t5, 0xC($v1)
/* 17CC8 800274C8 10006E8C */  lw         $t6, 0x10($v1)
/* 17CCC 800274CC 0010CC48 */  ctc2       $t4, $2 # handwritten instruction
/* 17CD0 800274D0 0018CD48 */  ctc2       $t5, $3 # handwritten instruction
/* 17CD4 800274D4 0020CE48 */  ctc2       $t6, $4 # handwritten instruction
/* 17CD8 800274D8 0000A28C */  lw         $v0, 0x0($a1)
/* 17CDC 800274DC 0400A38C */  lw         $v1, 0x4($a1)
/* 17CE0 800274E0 0800AD8C */  lw         $t5, 0x8($a1)
/* 17CE4 800274E4 0C00AE8C */  lw         $t6, 0xC($a1)
/* 17CE8 800274E8 1000A48C */  lw         $a0, 0x10($a1)
/* 17CEC 800274EC 1400B08C */  lw         $s0, 0x14($a1)
/* 17CF0 800274F0 1000AC24 */  addiu      $t4, $a1, 0x10
/* 17CF4 800274F4 2B60EC01 */  sltu       $t4, $t7, $t4
/* 17CF8 800274F8 41008015 */  bnez       $t4, .L80027600
/* 17CFC 800274FC 00000000 */   nop
.L80027500:
/* 17D00 80027500 00008248 */  mtc2       $v0, $0 # handwritten instruction
/* 17D04 80027504 00088348 */  mtc2       $v1, $1 # handwritten instruction
/* 17D08 80027508 00108D48 */  mtc2       $t5, $2 # handwritten instruction
/* 17D0C 8002750C 00188E48 */  mtc2       $t6, $3 # handwritten instruction
/* 17D10 80027510 00208448 */  mtc2       $a0, $4 # handwritten instruction
/* 17D14 80027514 00289048 */  mtc2       $s0, $5 # handwritten instruction
/* 17D18 80027518 029C0300 */  srl        $s3, $v1, 16
/* 17D1C 8002751C 02A40E00 */  srl        $s4, $t6, 16
/* 17D20 80027520 3000284A */  RTPT
/* 17D24 80027524 02AC1000 */  srl        $s5, $s0, 16
/* 17D28 80027528 C0981300 */  sll        $s3, $s3, 3
/* 17D2C 8002752C C0A01400 */  sll        $s4, $s4, 3
/* 17D30 80027530 C0A81500 */  sll        $s5, $s5, 3
/* 17D34 80027534 21985302 */  addu       $s3, $s2, $s3
/* 17D38 80027538 21A05402 */  addu       $s4, $s2, $s4
/* 17D3C 8002753C 21A85502 */  addu       $s5, $s2, $s5
/* 17D40 80027540 0000628E */  lw         $v0, 0x0($s3)
/* 17D44 80027544 0400638E */  lw         $v1, 0x4($s3)
/* 17D48 80027548 00008D8E */  lw         $t5, 0x0($s4)
/* 17D4C 8002754C 04008E8E */  lw         $t6, 0x4($s4)
/* 17D50 80027550 0000A48E */  lw         $a0, 0x0($s5)
/* 17D54 80027554 0400B08E */  lw         $s0, 0x4($s5)
/* 17D58 80027558 00000CE9 */  swc2       $12, 0x0($t0)
/* 17D5C 8002755C 040011E9 */  swc2       $17, 0x4($t0)
/* 17D60 80027560 08000DE9 */  swc2       $13, 0x8($t0)
/* 17D64 80027564 00F84C48 */  cfc2       $t4, $31 # handwritten instruction
/* 17D68 80027568 0C0012E9 */  swc2       $18, 0xC($t0)
/* 17D6C 8002756C 2430CC00 */  and        $a2, $a2, $t4
/* 17D70 80027570 10000EE9 */  swc2       $14, 0x10($t0)
/* 17D74 80027574 140013E9 */  swc2       $19, 0x14($t0)
/* 17D78 80027578 00400C48 */  mfc2       $t4, $8 # handwritten instruction
/* 17D7C 8002757C 0D80143C */  lui        $s4, %hi(modelFadeValue)
/* 17D80 80027580 F405948E */  lw         $s4, %lo(modelFadeValue)($s4)
/* 17D84 80027584 00000000 */  nop
/* 17D88 80027588 03008012 */  beqz       $s4, .L80027598
/* 17D8C 8002758C 00000000 */   nop
/* 17D90 80027590 00409448 */  mtc2       $s4, $8 # handwritten instruction
/* 17D94 80027594 21608002 */  addu       $t4, $s4, $zero
.L80027598:
/* 17D98 80027598 00008248 */  mtc2       $v0, $0 # handwritten instruction
/* 17D9C 8002759C 00088348 */  mtc2       $v1, $1 # handwritten instruction
/* 17DA0 800275A0 00108D48 */  mtc2       $t5, $2 # handwritten instruction
/* 17DA4 800275A4 00188E48 */  mtc2       $t6, $3 # handwritten instruction
/* 17DA8 800275A8 00208448 */  mtc2       $a0, $4 # handwritten instruction
/* 17DAC 800275AC 00289048 */  mtc2       $s0, $5 # handwritten instruction
/* 17DB0 800275B0 04008011 */  beqz       $t4, .L800275C4
/* 17DB4 800275B4 1800A524 */   addiu     $a1, $a1, 0x18
/* 17DB8 800275B8 1604F84A */  NCDT
/* 17DBC 800275BC 03000104 */  bgez       $zero, .L800275CC
/* 17DC0 800275C0 1000AC24 */   addiu     $t4, $a1, 0x10
.L800275C4:
/* 17DC4 800275C4 2004D84A */  NCT
/* 17DC8 800275C8 1000AC24 */  addiu      $t4, $a1, 0x10
.L800275CC:
/* 17DCC 800275CC 0000A28C */  lw         $v0, 0x0($a1)
/* 17DD0 800275D0 0400A38C */  lw         $v1, 0x4($a1)
/* 17DD4 800275D4 0800AD8C */  lw         $t5, 0x8($a1)
/* 17DD8 800275D8 0C00AE8C */  lw         $t6, 0xC($a1)
/* 17DDC 800275DC 1000A48C */  lw         $a0, 0x10($a1)
/* 17DE0 800275E0 1400B08C */  lw         $s0, 0x14($a1)
/* 17DE4 800275E4 000034EA */  swc2       $20, 0x0($s1)
/* 17DE8 800275E8 040035EA */  swc2       $21, 0x4($s1)
/* 17DEC 800275EC 080036EA */  swc2       $22, 0x8($s1)
/* 17DF0 800275F0 0C003126 */  addiu      $s1, $s1, 0xC
/* 17DF4 800275F4 2B60EC01 */  sltu       $t4, $t7, $t4
/* 17DF8 800275F8 C1FF8011 */  beqz       $t4, .L80027500
/* 17DFC 800275FC 18000825 */   addiu     $t0, $t0, 0x18
.L80027600:
/* 17E00 80027600 2A08E501 */  slt        $at, $t7, $a1
/* 17E04 80027604 42002014 */  bnez       $at, .L80027710
/* 17E08 80027608 00000000 */   nop
/* 17E0C 8002760C 00008248 */  mtc2       $v0, $0 # handwritten instruction
/* 17E10 80027610 00088348 */  mtc2       $v1, $1 # handwritten instruction
/* 17E14 80027614 0800A524 */  addiu      $a1, $a1, 0x8
/* 17E18 80027618 029C0300 */  srl        $s3, $v1, 16
/* 17E1C 8002761C 0100184A */  RTPS
/* 17E20 80027620 C0981300 */  sll        $s3, $s3, 3
/* 17E24 80027624 21985302 */  addu       $s3, $s2, $s3
/* 17E28 80027628 0000628E */  lw         $v0, 0x0($s3)
/* 17E2C 8002762C 0400638E */  lw         $v1, 0x4($s3)
/* 17E30 80027630 00000EE9 */  swc2       $14, 0x0($t0)
/* 17E34 80027634 040013E9 */  swc2       $19, 0x4($t0)
/* 17E38 80027638 00F84448 */  cfc2       $a0, $31 # handwritten instruction
/* 17E3C 8002763C 00401348 */  mfc2       $s3, $8 # handwritten instruction
/* 17E40 80027640 0D80143C */  lui        $s4, %hi(modelFadeValue)
/* 17E44 80027644 F405948E */  lw         $s4, %lo(modelFadeValue)($s4)
/* 17E48 80027648 00000000 */  nop
/* 17E4C 8002764C 03008012 */  beqz       $s4, .L8002765C
/* 17E50 80027650 00000000 */   nop
/* 17E54 80027654 00409448 */  mtc2       $s4, $8 # handwritten instruction
/* 17E58 80027658 21988002 */  addu       $s3, $s4, $zero
.L8002765C:
/* 17E5C 8002765C 00008248 */  mtc2       $v0, $0 # handwritten instruction
/* 17E60 80027660 00088348 */  mtc2       $v1, $1 # handwritten instruction
/* 17E64 80027664 04006012 */  beqz       $s3, .L80027678
/* 17E68 80027668 00000000 */   nop
/* 17E6C 8002766C 1304E84A */  NCDS
/* 17E70 80027670 02000104 */  bgez       $zero, .L8002767C
/* 17E74 80027674 00000000 */   nop
.L80027678:
/* 17E78 80027678 1E04C84A */  NCS
.L8002767C:
/* 17E7C 8002767C 08000825 */  addiu      $t0, $t0, 0x8
/* 17E80 80027680 000036EA */  swc2       $22, 0x0($s1)
/* 17E84 80027684 04003126 */  addiu      $s1, $s1, 0x4
/* 17E88 80027688 2A08E501 */  slt        $at, $t7, $a1
/* 17E8C 8002768C 20002014 */  bnez       $at, .L80027710
/* 17E90 80027690 2430C400 */   and       $a2, $a2, $a0
/* 17E94 80027694 00008D48 */  mtc2       $t5, $0 # handwritten instruction
/* 17E98 80027698 00088E48 */  mtc2       $t6, $1 # handwritten instruction
/* 17E9C 8002769C 029C0E00 */  srl        $s3, $t6, 16
/* 17EA0 800276A0 C0981300 */  sll        $s3, $s3, 3
/* 17EA4 800276A4 0100184A */  RTPS
/* 17EA8 800276A8 21985302 */  addu       $s3, $s2, $s3
/* 17EAC 800276AC 0000628E */  lw         $v0, 0x0($s3)
/* 17EB0 800276B0 0400638E */  lw         $v1, 0x4($s3)
/* 17EB4 800276B4 00000EE9 */  swc2       $14, 0x0($t0)
/* 17EB8 800276B8 040013E9 */  swc2       $19, 0x4($t0)
/* 17EBC 800276BC 00F84448 */  cfc2       $a0, $31 # handwritten instruction
/* 17EC0 800276C0 00401348 */  mfc2       $s3, $8 # handwritten instruction
/* 17EC4 800276C4 0D80143C */  lui        $s4, %hi(modelFadeValue)
/* 17EC8 800276C8 F405948E */  lw         $s4, %lo(modelFadeValue)($s4)
/* 17ECC 800276CC 00000000 */  nop
/* 17ED0 800276D0 03008012 */  beqz       $s4, .L800276E0
/* 17ED4 800276D4 00000000 */   nop
/* 17ED8 800276D8 00409448 */  mtc2       $s4, $8 # handwritten instruction
/* 17EDC 800276DC 21988002 */  addu       $s3, $s4, $zero
.L800276E0:
/* 17EE0 800276E0 00008248 */  mtc2       $v0, $0 # handwritten instruction
/* 17EE4 800276E4 00088348 */  mtc2       $v1, $1 # handwritten instruction
/* 17EE8 800276E8 04006012 */  beqz       $s3, .L800276FC
/* 17EEC 800276EC 00000000 */   nop
/* 17EF0 800276F0 1304E84A */  NCDS
/* 17EF4 800276F4 02000104 */  bgez       $zero, .L80027700
/* 17EF8 800276F8 00000000 */   nop
.L800276FC:
/* 17EFC 800276FC 1E04C84A */  NCS
.L80027700:
/* 17F00 80027700 08000825 */  addiu      $t0, $t0, 0x8
/* 17F04 80027704 2430C400 */  and        $a2, $a2, $a0
/* 17F08 80027708 000036EA */  swc2       $22, 0x0($s1)
/* 17F0C 8002770C 04003126 */  addiu      $s1, $s1, 0x4
.L80027710:
/* 17F10 80027710 20002925 */  addiu      $t1, $t1, 0x20
/* 17F14 80027714 FFFF4A25 */  addiu      $t2, $t2, -0x1
/* 17F18 80027718 CAFE4015 */  bnez       $t2, .L80027244
/* 17F1C 8002771C 18001827 */   addiu     $t8, $t8, 0x18
/* 17F20 80027720 18020104 */  bgez       $zero, .L80027F84
/* 17F24 80027724 00000000 */   nop
.L80027728:
/* 17F28 80027728 0800048F */  lw         $a0, 0x8($t8)
/* 17F2C 8002772C 00000000 */  nop
/* 17F30 80027730 03140400 */  sra        $v0, $a0, 16
/* 17F34 80027734 01004324 */  addiu      $v1, $v0, 0x1
/* 17F38 80027738 9E006010 */  beqz       $v1, .L800279B4
/* 17F3C 8002773C C0780200 */   sll       $t7, $v0, 3
/* 17F40 80027740 21782F03 */  addu       $t7, $t9, $t7
/* 17F44 80027744 FFFF8C30 */  andi       $t4, $a0, 0xFFFF
/* 17F48 80027748 C0280C00 */  sll        $a1, $t4, 3
/* 17F4C 8002774C 21282503 */  addu       $a1, $t9, $a1
/* 17F50 80027750 00006225 */  addiu      $v0, $t3, %lo(D_1F800000)
/* 17F54 80027754 20006325 */  addiu      $v1, $t3, %lo(D_1F800020)
/* 17F58 80027758 00004C8C */  lw         $t4, 0x0($v0)
/* 17F5C 8002775C 04004D8C */  lw         $t5, 0x4($v0)
/* 17F60 80027760 0000CC48 */  ctc2       $t4, $0 # handwritten instruction
/* 17F64 80027764 0008CD48 */  ctc2       $t5, $1 # handwritten instruction
/* 17F68 80027768 08004C8C */  lw         $t4, 0x8($v0)
/* 17F6C 8002776C 0C004D8C */  lw         $t5, 0xC($v0)
/* 17F70 80027770 10004E8C */  lw         $t6, 0x10($v0)
/* 17F74 80027774 0010CC48 */  ctc2       $t4, $2 # handwritten instruction
/* 17F78 80027778 0018CD48 */  ctc2       $t5, $3 # handwritten instruction
/* 17F7C 8002777C 0020CE48 */  ctc2       $t6, $4 # handwritten instruction
/* 17F80 80027780 00002C95 */  lhu        $t4, 0x0($t1)
/* 17F84 80027784 06002D95 */  lhu        $t5, 0x6($t1)
/* 17F88 80027788 0C002E95 */  lhu        $t6, 0xC($t1)
/* 17F8C 8002778C 00488C48 */  mtc2       $t4, $9 # handwritten instruction
/* 17F90 80027790 00508D48 */  mtc2       $t5, $10 # handwritten instruction
/* 17F94 80027794 00588E48 */  mtc2       $t6, $11 # handwritten instruction
/* 17F98 80027798 00000000 */  nop
/* 17F9C 8002779C 00000000 */  nop
/* 17FA0 800277A0 12E0494A */  MVMVA      1, 0, 3, 3, 0
/* 17FA4 800277A4 00480C48 */  mfc2       $t4, $9 # handwritten instruction
/* 17FA8 800277A8 00500D48 */  mfc2       $t5, $10 # handwritten instruction
/* 17FAC 800277AC 00580E48 */  mfc2       $t6, $11 # handwritten instruction
/* 17FB0 800277B0 00006CA4 */  sh         $t4, 0x0($v1)
/* 17FB4 800277B4 06006DA4 */  sh         $t5, 0x6($v1)
/* 17FB8 800277B8 0C006EA4 */  sh         $t6, 0xC($v1)
/* 17FBC 800277BC 02002C95 */  lhu        $t4, 0x2($t1)
/* 17FC0 800277C0 08002D95 */  lhu        $t5, 0x8($t1)
/* 17FC4 800277C4 0E002E95 */  lhu        $t6, 0xE($t1)
/* 17FC8 800277C8 00488C48 */  mtc2       $t4, $9 # handwritten instruction
/* 17FCC 800277CC 00508D48 */  mtc2       $t5, $10 # handwritten instruction
/* 17FD0 800277D0 00588E48 */  mtc2       $t6, $11 # handwritten instruction
/* 17FD4 800277D4 00000000 */  nop
/* 17FD8 800277D8 00000000 */  nop
/* 17FDC 800277DC 12E0494A */  MVMVA      1, 0, 3, 3, 0
/* 17FE0 800277E0 00480C48 */  mfc2       $t4, $9 # handwritten instruction
/* 17FE4 800277E4 00500D48 */  mfc2       $t5, $10 # handwritten instruction
/* 17FE8 800277E8 00580E48 */  mfc2       $t6, $11 # handwritten instruction
/* 17FEC 800277EC 02006CA4 */  sh         $t4, 0x2($v1)
/* 17FF0 800277F0 08006DA4 */  sh         $t5, 0x8($v1)
/* 17FF4 800277F4 0E006EA4 */  sh         $t6, 0xE($v1)
/* 17FF8 800277F8 04002C95 */  lhu        $t4, 0x4($t1)
/* 17FFC 800277FC 0A002D95 */  lhu        $t5, 0xA($t1)
/* 18000 80027800 10002E95 */  lhu        $t6, 0x10($t1)
/* 18004 80027804 00488C48 */  mtc2       $t4, $9 # handwritten instruction
/* 18008 80027808 00508D48 */  mtc2       $t5, $10 # handwritten instruction
/* 1800C 8002780C 00588E48 */  mtc2       $t6, $11 # handwritten instruction
/* 18010 80027810 00000000 */  nop
/* 18014 80027814 00000000 */  nop
/* 18018 80027818 12E0494A */  MVMVA      1, 0, 3, 3, 0
/* 1801C 8002781C 00480C48 */  mfc2       $t4, $9 # handwritten instruction
/* 18020 80027820 00500D48 */  mfc2       $t5, $10 # handwritten instruction
/* 18024 80027824 00580E48 */  mfc2       $t6, $11 # handwritten instruction
/* 18028 80027828 04006CA4 */  sh         $t4, 0x4($v1)
/* 1802C 8002782C 0A006DA4 */  sh         $t5, 0xA($v1)
/* 18030 80027830 10006EA4 */  sh         $t6, 0x10($v1)
/* 18034 80027834 14004C8C */  lw         $t4, 0x14($v0)
/* 18038 80027838 18004D8C */  lw         $t5, 0x18($v0)
/* 1803C 8002783C 1C004E8C */  lw         $t6, 0x1C($v0)
/* 18040 80027840 0028CC48 */  ctc2       $t4, $5 # handwritten instruction
/* 18044 80027844 0030CD48 */  ctc2       $t5, $6 # handwritten instruction
/* 18048 80027848 0038CE48 */  ctc2       $t6, $7 # handwritten instruction
/* 1804C 8002784C 18002D95 */  lhu        $t5, 0x18($t1)
/* 18050 80027850 14002C95 */  lhu        $t4, 0x14($t1)
/* 18054 80027854 006C0D00 */  sll        $t5, $t5, 16
/* 18058 80027858 25608D01 */  or         $t4, $t4, $t5
/* 1805C 8002785C 00008C48 */  mtc2       $t4, $0 # handwritten instruction
/* 18060 80027860 1C0021C9 */  lwc2       $1, 0x1C($t1)
/* 18064 80027864 00000000 */  nop
/* 18068 80027868 00000000 */  nop
/* 1806C 8002786C 1200484A */  MVMVA      1, 0, 0, 0, 0
/* 18070 80027870 00480C48 */  mfc2       $t4, $9 # handwritten instruction
/* 18074 80027874 00500D48 */  mfc2       $t5, $10 # handwritten instruction
/* 18078 80027878 00580E48 */  mfc2       $t6, $11 # handwritten instruction
/* 1807C 8002787C 0028CC48 */  ctc2       $t4, $5 # handwritten instruction
/* 18080 80027880 0030CD48 */  ctc2       $t5, $6 # handwritten instruction
/* 18084 80027884 0038CE48 */  ctc2       $t6, $7 # handwritten instruction
/* 18088 80027888 00006C8C */  lw         $t4, 0x0($v1)
/* 1808C 8002788C 04006D8C */  lw         $t5, 0x4($v1)
/* 18090 80027890 0000CC48 */  ctc2       $t4, $0 # handwritten instruction
/* 18094 80027894 0008CD48 */  ctc2       $t5, $1 # handwritten instruction
/* 18098 80027898 08006C8C */  lw         $t4, 0x8($v1)
/* 1809C 8002789C 0C006D8C */  lw         $t5, 0xC($v1)
/* 180A0 800278A0 10006E8C */  lw         $t6, 0x10($v1)
/* 180A4 800278A4 0010CC48 */  ctc2       $t4, $2 # handwritten instruction
/* 180A8 800278A8 0018CD48 */  ctc2       $t5, $3 # handwritten instruction
/* 180AC 800278AC 0020CE48 */  ctc2       $t6, $4 # handwritten instruction
/* 180B0 800278B0 0000A28C */  lw         $v0, 0x0($a1)
/* 180B4 800278B4 0400A38C */  lw         $v1, 0x4($a1)
/* 180B8 800278B8 0800AD8C */  lw         $t5, 0x8($a1)
/* 180BC 800278BC 0C00AE8C */  lw         $t6, 0xC($a1)
/* 180C0 800278C0 1000A48C */  lw         $a0, 0x10($a1)
/* 180C4 800278C4 1400B08C */  lw         $s0, 0x14($a1)
/* 180C8 800278C8 1000AC24 */  addiu      $t4, $a1, 0x10
/* 180CC 800278CC 2B60EC01 */  sltu       $t4, $t7, $t4
/* 180D0 800278D0 1D008015 */  bnez       $t4, .L80027948
/* 180D4 800278D4 00000000 */   nop
.L800278D8:
/* 180D8 800278D8 00008248 */  mtc2       $v0, $0 # handwritten instruction
/* 180DC 800278DC 00088348 */  mtc2       $v1, $1 # handwritten instruction
/* 180E0 800278E0 00108D48 */  mtc2       $t5, $2 # handwritten instruction
/* 180E4 800278E4 00188E48 */  mtc2       $t6, $3 # handwritten instruction
/* 180E8 800278E8 00208448 */  mtc2       $a0, $4 # handwritten instruction
/* 180EC 800278EC 00289048 */  mtc2       $s0, $5 # handwritten instruction
/* 180F0 800278F0 00000000 */  nop
/* 180F4 800278F4 00000000 */  nop
/* 180F8 800278F8 3000284A */  RTPT
/* 180FC 800278FC 00000CE9 */  swc2       $12, 0x0($t0)
/* 18100 80027900 1800A524 */  addiu      $a1, $a1, 0x18
/* 18104 80027904 040011E9 */  swc2       $17, 0x4($t0)
/* 18108 80027908 08000DE9 */  swc2       $13, 0x8($t0)
/* 1810C 8002790C 00F84C48 */  cfc2       $t4, $31 # handwritten instruction
/* 18110 80027910 0C0012E9 */  swc2       $18, 0xC($t0)
/* 18114 80027914 2430CC00 */  and        $a2, $a2, $t4
/* 18118 80027918 10000EE9 */  swc2       $14, 0x10($t0)
/* 1811C 8002791C 1000AC24 */  addiu      $t4, $a1, 0x10
/* 18120 80027920 140013E9 */  swc2       $19, 0x14($t0)
/* 18124 80027924 0000A28C */  lw         $v0, 0x0($a1)
/* 18128 80027928 0400A38C */  lw         $v1, 0x4($a1)
/* 1812C 8002792C 0800AD8C */  lw         $t5, 0x8($a1)
/* 18130 80027930 0C00AE8C */  lw         $t6, 0xC($a1)
/* 18134 80027934 1000A48C */  lw         $a0, 0x10($a1)
/* 18138 80027938 1400B08C */  lw         $s0, 0x14($a1)
/* 1813C 8002793C 2B60EC01 */  sltu       $t4, $t7, $t4
/* 18140 80027940 E5FF8011 */  beqz       $t4, .L800278D8
/* 18144 80027944 18000825 */   addiu     $t0, $t0, 0x18
.L80027948:
/* 18148 80027948 2A08E501 */  slt        $at, $t7, $a1
/* 1814C 8002794C 19002014 */  bnez       $at, .L800279B4
/* 18150 80027950 00000000 */   nop
/* 18154 80027954 00008248 */  mtc2       $v0, $0 # handwritten instruction
/* 18158 80027958 00088348 */  mtc2       $v1, $1 # handwritten instruction
/* 1815C 8002795C 0800A524 */  addiu      $a1, $a1, 0x8
/* 18160 80027960 00000000 */  nop
/* 18164 80027964 0100184A */  RTPS
/* 18168 80027968 00000EE9 */  swc2       $14, 0x0($t0)
/* 1816C 8002796C 040013E9 */  swc2       $19, 0x4($t0)
/* 18170 80027970 00F84448 */  cfc2       $a0, $31 # handwritten instruction
/* 18174 80027974 00401348 */  mfc2       $s3, $8 # handwritten instruction
/* 18178 80027978 08000825 */  addiu      $t0, $t0, 0x8
/* 1817C 8002797C 2A08E501 */  slt        $at, $t7, $a1
/* 18180 80027980 0C002014 */  bnez       $at, .L800279B4
/* 18184 80027984 2430C400 */   and       $a2, $a2, $a0
/* 18188 80027988 00008D48 */  mtc2       $t5, $0 # handwritten instruction
/* 1818C 8002798C 00088E48 */  mtc2       $t6, $1 # handwritten instruction
/* 18190 80027990 00000000 */  nop
/* 18194 80027994 00000000 */  nop
/* 18198 80027998 0100184A */  RTPS
/* 1819C 8002799C 00000EE9 */  swc2       $14, 0x0($t0)
/* 181A0 800279A0 040013E9 */  swc2       $19, 0x4($t0)
/* 181A4 800279A4 00F84448 */  cfc2       $a0, $31 # handwritten instruction
/* 181A8 800279A8 00401348 */  mfc2       $s3, $8 # handwritten instruction
/* 181AC 800279AC 08000825 */  addiu      $t0, $t0, 0x8
/* 181B0 800279B0 2430C400 */  and        $a2, $a2, $a0
.L800279B4:
/* 181B4 800279B4 20002925 */  addiu      $t1, $t1, 0x20
/* 181B8 800279B8 FFFF4A25 */  addiu      $t2, $t2, -0x1
/* 181BC 800279BC 5AFF4015 */  bnez       $t2, .L80027728
/* 181C0 800279C0 18001827 */   addiu     $t8, $t8, 0x18
/* 181C4 800279C4 6F010104 */  bgez       $zero, .L80027F84
/* 181C8 800279C8 00000000 */   nop
.L800279CC:
/* 181CC 800279CC FF34023C */  lui        $v0, (0x34FFFFFF >> 16)
/* 181D0 800279D0 FFFF4234 */  ori        $v0, $v0, (0x34FFFFFF & 0xFFFF)
/* 181D4 800279D4 00308248 */  mtc2       $v0, $6 # handwritten instruction
.L800279D8:
/* 181D8 800279D8 0800048F */  lw         $a0, 0x8($t8)
/* 181DC 800279DC 00000000 */  nop
/* 181E0 800279E0 03140400 */  sra        $v0, $a0, 16
/* 181E4 800279E4 01004324 */  addiu      $v1, $v0, 0x1
/* 181E8 800279E8 62016010 */  beqz       $v1, .L80027F74
/* 181EC 800279EC C0780200 */   sll       $t7, $v0, 3
/* 181F0 800279F0 21782F03 */  addu       $t7, $t9, $t7
/* 181F4 800279F4 FFFF8C30 */  andi       $t4, $a0, 0xFFFF
/* 181F8 800279F8 C0280C00 */  sll        $a1, $t4, 3
/* 181FC 800279FC 21282503 */  addu       $a1, $t9, $a1
/* 18200 80027A00 34006225 */  addiu      $v0, $t3, %lo(D_1F800034)
/* 18204 80027A04 48006325 */  addiu      $v1, $t3, %lo(D_1F800048)
/* 18208 80027A08 00004C8C */  lw         $t4, 0x0($v0)
/* 1820C 80027A0C 04004D8C */  lw         $t5, 0x4($v0)
/* 18210 80027A10 0000CC48 */  ctc2       $t4, $0 # handwritten instruction
/* 18214 80027A14 0008CD48 */  ctc2       $t5, $1 # handwritten instruction
/* 18218 80027A18 08004C8C */  lw         $t4, 0x8($v0)
/* 1821C 80027A1C 0C004D8C */  lw         $t5, 0xC($v0)
/* 18220 80027A20 10004E8C */  lw         $t6, 0x10($v0)
/* 18224 80027A24 0010CC48 */  ctc2       $t4, $2 # handwritten instruction
/* 18228 80027A28 0018CD48 */  ctc2       $t5, $3 # handwritten instruction
/* 1822C 80027A2C 0020CE48 */  ctc2       $t6, $4 # handwritten instruction
/* 18230 80027A30 00002C95 */  lhu        $t4, 0x0($t1)
/* 18234 80027A34 06002D95 */  lhu        $t5, 0x6($t1)
/* 18238 80027A38 0C002E95 */  lhu        $t6, 0xC($t1)
/* 1823C 80027A3C 00488C48 */  mtc2       $t4, $9 # handwritten instruction
/* 18240 80027A40 00508D48 */  mtc2       $t5, $10 # handwritten instruction
/* 18244 80027A44 00588E48 */  mtc2       $t6, $11 # handwritten instruction
/* 18248 80027A48 00000000 */  nop
/* 1824C 80027A4C 00000000 */  nop
/* 18250 80027A50 12E0494A */  MVMVA      1, 0, 3, 3, 0
/* 18254 80027A54 00480C48 */  mfc2       $t4, $9 # handwritten instruction
/* 18258 80027A58 00500D48 */  mfc2       $t5, $10 # handwritten instruction
/* 1825C 80027A5C 00580E48 */  mfc2       $t6, $11 # handwritten instruction
/* 18260 80027A60 00006CA4 */  sh         $t4, 0x0($v1)
/* 18264 80027A64 06006DA4 */  sh         $t5, 0x6($v1)
/* 18268 80027A68 0C006EA4 */  sh         $t6, 0xC($v1)
/* 1826C 80027A6C 02002C95 */  lhu        $t4, 0x2($t1)
/* 18270 80027A70 08002D95 */  lhu        $t5, 0x8($t1)
/* 18274 80027A74 0E002E95 */  lhu        $t6, 0xE($t1)
/* 18278 80027A78 00488C48 */  mtc2       $t4, $9 # handwritten instruction
/* 1827C 80027A7C 00508D48 */  mtc2       $t5, $10 # handwritten instruction
/* 18280 80027A80 00588E48 */  mtc2       $t6, $11 # handwritten instruction
/* 18284 80027A84 00000000 */  nop
/* 18288 80027A88 00000000 */  nop
/* 1828C 80027A8C 12E0494A */  MVMVA      1, 0, 3, 3, 0
/* 18290 80027A90 00480C48 */  mfc2       $t4, $9 # handwritten instruction
/* 18294 80027A94 00500D48 */  mfc2       $t5, $10 # handwritten instruction
/* 18298 80027A98 00580E48 */  mfc2       $t6, $11 # handwritten instruction
/* 1829C 80027A9C 02006CA4 */  sh         $t4, 0x2($v1)
/* 182A0 80027AA0 08006DA4 */  sh         $t5, 0x8($v1)
/* 182A4 80027AA4 0E006EA4 */  sh         $t6, 0xE($v1)
/* 182A8 80027AA8 04002C95 */  lhu        $t4, 0x4($t1)
/* 182AC 80027AAC 0A002D95 */  lhu        $t5, 0xA($t1)
/* 182B0 80027AB0 10002E95 */  lhu        $t6, 0x10($t1)
/* 182B4 80027AB4 00488C48 */  mtc2       $t4, $9 # handwritten instruction
/* 182B8 80027AB8 00508D48 */  mtc2       $t5, $10 # handwritten instruction
/* 182BC 80027ABC 00588E48 */  mtc2       $t6, $11 # handwritten instruction
/* 182C0 80027AC0 00000000 */  nop
/* 182C4 80027AC4 00000000 */  nop
/* 182C8 80027AC8 12E0494A */  MVMVA      1, 0, 3, 3, 0
/* 182CC 80027ACC 00480C48 */  mfc2       $t4, $9 # handwritten instruction
/* 182D0 80027AD0 00500D48 */  mfc2       $t5, $10 # handwritten instruction
/* 182D4 80027AD4 00580E48 */  mfc2       $t6, $11 # handwritten instruction
/* 182D8 80027AD8 04006CA4 */  sh         $t4, 0x4($v1)
/* 182DC 80027ADC 0A006DA4 */  sh         $t5, 0xA($v1)
/* 182E0 80027AE0 10006EA4 */  sh         $t6, 0x10($v1)
/* 182E4 80027AE4 00006C8C */  lw         $t4, 0x0($v1)
/* 182E8 80027AE8 04006D8C */  lw         $t5, 0x4($v1)
/* 182EC 80027AEC 0040CC48 */  ctc2       $t4, $8 # handwritten instruction
/* 182F0 80027AF0 0048CD48 */  ctc2       $t5, $9 # handwritten instruction
/* 182F4 80027AF4 08006C8C */  lw         $t4, 0x8($v1)
/* 182F8 80027AF8 0C006D8C */  lw         $t5, 0xC($v1)
/* 182FC 80027AFC 10006E8C */  lw         $t6, 0x10($v1)
/* 18300 80027B00 0050CC48 */  ctc2       $t4, $10 # handwritten instruction
/* 18304 80027B04 0058CD48 */  ctc2       $t5, $11 # handwritten instruction
/* 18308 80027B08 0060CE48 */  ctc2       $t6, $12 # handwritten instruction
/* 1830C 80027B0C 00006225 */  addiu      $v0, $t3, %lo(D_1F800000)
/* 18310 80027B10 20006325 */  addiu      $v1, $t3, %lo(D_1F800020)
/* 18314 80027B14 00004C8C */  lw         $t4, 0x0($v0)
/* 18318 80027B18 04004D8C */  lw         $t5, 0x4($v0)
/* 1831C 80027B1C 0000CC48 */  ctc2       $t4, $0 # handwritten instruction
/* 18320 80027B20 0008CD48 */  ctc2       $t5, $1 # handwritten instruction
/* 18324 80027B24 08004C8C */  lw         $t4, 0x8($v0)
/* 18328 80027B28 0C004D8C */  lw         $t5, 0xC($v0)
/* 1832C 80027B2C 10004E8C */  lw         $t6, 0x10($v0)
/* 18330 80027B30 0010CC48 */  ctc2       $t4, $2 # handwritten instruction
/* 18334 80027B34 0018CD48 */  ctc2       $t5, $3 # handwritten instruction
/* 18338 80027B38 0020CE48 */  ctc2       $t6, $4 # handwritten instruction
/* 1833C 80027B3C 00002C95 */  lhu        $t4, 0x0($t1)
/* 18340 80027B40 06002D95 */  lhu        $t5, 0x6($t1)
/* 18344 80027B44 0C002E95 */  lhu        $t6, 0xC($t1)
/* 18348 80027B48 00488C48 */  mtc2       $t4, $9 # handwritten instruction
/* 1834C 80027B4C 00508D48 */  mtc2       $t5, $10 # handwritten instruction
/* 18350 80027B50 00588E48 */  mtc2       $t6, $11 # handwritten instruction
/* 18354 80027B54 00000000 */  nop
/* 18358 80027B58 00000000 */  nop
/* 1835C 80027B5C 12E0494A */  MVMVA      1, 0, 3, 3, 0
/* 18360 80027B60 00480C48 */  mfc2       $t4, $9 # handwritten instruction
/* 18364 80027B64 00500D48 */  mfc2       $t5, $10 # handwritten instruction
/* 18368 80027B68 00580E48 */  mfc2       $t6, $11 # handwritten instruction
/* 1836C 80027B6C 00006CA4 */  sh         $t4, 0x0($v1)
/* 18370 80027B70 06006DA4 */  sh         $t5, 0x6($v1)
/* 18374 80027B74 0C006EA4 */  sh         $t6, 0xC($v1)
/* 18378 80027B78 02002C95 */  lhu        $t4, 0x2($t1)
/* 1837C 80027B7C 08002D95 */  lhu        $t5, 0x8($t1)
/* 18380 80027B80 0E002E95 */  lhu        $t6, 0xE($t1)
/* 18384 80027B84 00488C48 */  mtc2       $t4, $9 # handwritten instruction
/* 18388 80027B88 00508D48 */  mtc2       $t5, $10 # handwritten instruction
/* 1838C 80027B8C 00588E48 */  mtc2       $t6, $11 # handwritten instruction
/* 18390 80027B90 00000000 */  nop
/* 18394 80027B94 00000000 */  nop
/* 18398 80027B98 12E0494A */  MVMVA      1, 0, 3, 3, 0
/* 1839C 80027B9C 00480C48 */  mfc2       $t4, $9 # handwritten instruction
/* 183A0 80027BA0 00500D48 */  mfc2       $t5, $10 # handwritten instruction
/* 183A4 80027BA4 00580E48 */  mfc2       $t6, $11 # handwritten instruction
/* 183A8 80027BA8 02006CA4 */  sh         $t4, 0x2($v1)
/* 183AC 80027BAC 08006DA4 */  sh         $t5, 0x8($v1)
/* 183B0 80027BB0 0E006EA4 */  sh         $t6, 0xE($v1)
/* 183B4 80027BB4 04002C95 */  lhu        $t4, 0x4($t1)
/* 183B8 80027BB8 0A002D95 */  lhu        $t5, 0xA($t1)
/* 183BC 80027BBC 10002E95 */  lhu        $t6, 0x10($t1)
/* 183C0 80027BC0 00488C48 */  mtc2       $t4, $9 # handwritten instruction
/* 183C4 80027BC4 00508D48 */  mtc2       $t5, $10 # handwritten instruction
/* 183C8 80027BC8 00588E48 */  mtc2       $t6, $11 # handwritten instruction
/* 183CC 80027BCC 00000000 */  nop
/* 183D0 80027BD0 00000000 */  nop
/* 183D4 80027BD4 12E0494A */  MVMVA      1, 0, 3, 3, 0
/* 183D8 80027BD8 00480C48 */  mfc2       $t4, $9 # handwritten instruction
/* 183DC 80027BDC 00500D48 */  mfc2       $t5, $10 # handwritten instruction
/* 183E0 80027BE0 00580E48 */  mfc2       $t6, $11 # handwritten instruction
/* 183E4 80027BE4 04006CA4 */  sh         $t4, 0x4($v1)
/* 183E8 80027BE8 0A006DA4 */  sh         $t5, 0xA($v1)
/* 183EC 80027BEC 10006EA4 */  sh         $t6, 0x10($v1)
/* 183F0 80027BF0 14004C8C */  lw         $t4, 0x14($v0)
/* 183F4 80027BF4 18004D8C */  lw         $t5, 0x18($v0)
/* 183F8 80027BF8 1C004E8C */  lw         $t6, 0x1C($v0)
/* 183FC 80027BFC 0028CC48 */  ctc2       $t4, $5 # handwritten instruction
/* 18400 80027C00 0030CD48 */  ctc2       $t5, $6 # handwritten instruction
/* 18404 80027C04 0038CE48 */  ctc2       $t6, $7 # handwritten instruction
/* 18408 80027C08 18002D95 */  lhu        $t5, 0x18($t1)
/* 1840C 80027C0C 14002C95 */  lhu        $t4, 0x14($t1)
/* 18410 80027C10 006C0D00 */  sll        $t5, $t5, 16
/* 18414 80027C14 25608D01 */  or         $t4, $t4, $t5
/* 18418 80027C18 00008C48 */  mtc2       $t4, $0 # handwritten instruction
/* 1841C 80027C1C 1C0021C9 */  lwc2       $1, 0x1C($t1)
/* 18420 80027C20 00000000 */  nop
/* 18424 80027C24 00000000 */  nop
/* 18428 80027C28 1200484A */  MVMVA      1, 0, 0, 0, 0
/* 1842C 80027C2C 00480C48 */  mfc2       $t4, $9 # handwritten instruction
/* 18430 80027C30 00500D48 */  mfc2       $t5, $10 # handwritten instruction
/* 18434 80027C34 00580E48 */  mfc2       $t6, $11 # handwritten instruction
/* 18438 80027C38 0028CC48 */  ctc2       $t4, $5 # handwritten instruction
/* 1843C 80027C3C 0030CD48 */  ctc2       $t5, $6 # handwritten instruction
/* 18440 80027C40 0038CE48 */  ctc2       $t6, $7 # handwritten instruction
/* 18444 80027C44 00006C8C */  lw         $t4, 0x0($v1)
/* 18448 80027C48 04006D8C */  lw         $t5, 0x4($v1)
/* 1844C 80027C4C 0000CC48 */  ctc2       $t4, $0 # handwritten instruction
/* 18450 80027C50 0008CD48 */  ctc2       $t5, $1 # handwritten instruction
/* 18454 80027C54 08006C8C */  lw         $t4, 0x8($v1)
/* 18458 80027C58 0C006D8C */  lw         $t5, 0xC($v1)
/* 1845C 80027C5C 10006E8C */  lw         $t6, 0x10($v1)
/* 18460 80027C60 0010CC48 */  ctc2       $t4, $2 # handwritten instruction
/* 18464 80027C64 0018CD48 */  ctc2       $t5, $3 # handwritten instruction
/* 18468 80027C68 0020CE48 */  ctc2       $t6, $4 # handwritten instruction
/* 1846C 80027C6C 0000A28C */  lw         $v0, 0x0($a1)
/* 18470 80027C70 0400A38C */  lw         $v1, 0x4($a1)
/* 18474 80027C74 0800AD8C */  lw         $t5, 0x8($a1)
/* 18478 80027C78 0C00AE8C */  lw         $t6, 0xC($a1)
/* 1847C 80027C7C 1000A48C */  lw         $a0, 0x10($a1)
/* 18480 80027C80 1400B08C */  lw         $s0, 0x14($a1)
/* 18484 80027C84 1000AC24 */  addiu      $t4, $a1, 0x10
/* 18488 80027C88 2B60EC01 */  sltu       $t4, $t7, $t4
/* 1848C 80027C8C 69008015 */  bnez       $t4, .L80027E34
/* 18490 80027C90 00000000 */   nop
.L80027C94:
/* 18494 80027C94 00008248 */  mtc2       $v0, $0 # handwritten instruction
/* 18498 80027C98 00088348 */  mtc2       $v1, $1 # handwritten instruction
/* 1849C 80027C9C 00108D48 */  mtc2       $t5, $2 # handwritten instruction
/* 184A0 80027CA0 00188E48 */  mtc2       $t6, $3 # handwritten instruction
/* 184A4 80027CA4 00208448 */  mtc2       $a0, $4 # handwritten instruction
/* 184A8 80027CA8 00289048 */  mtc2       $s0, $5 # handwritten instruction
/* 184AC 80027CAC 029C0300 */  srl        $s3, $v1, 16
/* 184B0 80027CB0 02A40E00 */  srl        $s4, $t6, 16
/* 184B4 80027CB4 3000284A */  RTPT
/* 184B8 80027CB8 02AC1000 */  srl        $s5, $s0, 16
/* 184BC 80027CBC C0981300 */  sll        $s3, $s3, 3
/* 184C0 80027CC0 C0A01400 */  sll        $s4, $s4, 3
/* 184C4 80027CC4 C0A81500 */  sll        $s5, $s5, 3
/* 184C8 80027CC8 21985302 */  addu       $s3, $s2, $s3
/* 184CC 80027CCC 21A05402 */  addu       $s4, $s2, $s4
/* 184D0 80027CD0 21A85502 */  addu       $s5, $s2, $s5
/* 184D4 80027CD4 0000628E */  lw         $v0, 0x0($s3)
/* 184D8 80027CD8 0400638E */  lw         $v1, 0x4($s3)
/* 184DC 80027CDC 0000CD8E */  lw         $t5, 0x0($s6)
/* 184E0 80027CE0 00000CE9 */  swc2       $12, 0x0($t0)
/* 184E4 80027CE4 040011E9 */  swc2       $17, 0x4($t0)
/* 184E8 80027CE8 08000DE9 */  swc2       $13, 0x8($t0)
/* 184EC 80027CEC 00F84C48 */  cfc2       $t4, $31 # handwritten instruction
/* 184F0 80027CF0 0C0012E9 */  swc2       $18, 0xC($t0)
/* 184F4 80027CF4 2430CC00 */  and        $a2, $a2, $t4
/* 184F8 80027CF8 10000EE9 */  swc2       $14, 0x10($t0)
/* 184FC 80027CFC 140013E9 */  swc2       $19, 0x14($t0)
/* 18500 80027D00 00400C48 */  mfc2       $t4, $8 # handwritten instruction
/* 18504 80027D04 0D80133C */  lui        $s3, %hi(modelFadeValue)
/* 18508 80027D08 F405738E */  lw         $s3, %lo(modelFadeValue)($s3)
/* 1850C 80027D0C 00000000 */  nop
/* 18510 80027D10 03006012 */  beqz       $s3, .L80027D20
/* 18514 80027D14 00000000 */   nop
/* 18518 80027D18 00409348 */  mtc2       $s3, $8 # handwritten instruction
/* 1851C 80027D1C 21606002 */  addu       $t4, $s3, $zero
.L80027D20:
/* 18520 80027D20 0040013C */  lui        $at, (0x40000000 >> 16)
/* 18524 80027D24 2498A101 */  and        $s3, $t5, $at
/* 18528 80027D28 0B006016 */  bnez       $s3, .L80027D58
/* 1852C 80027D2C 2198A001 */   addu      $s3, $t5, $zero
/* 18530 80027D30 00008248 */  mtc2       $v0, $0 # handwritten instruction
/* 18534 80027D34 00088348 */  mtc2       $v1, $1 # handwritten instruction
/* 18538 80027D38 00308D48 */  mtc2       $t5, $6 # handwritten instruction
/* 1853C 80027D3C 04008011 */  beqz       $t4, .L80027D50
/* 18540 80027D40 00000000 */   nop
/* 18544 80027D44 1304E84A */  NCDS
/* 18548 80027D48 02000104 */  bgez       $zero, .L80027D54
/* 1854C 80027D4C 00000000 */   nop
.L80027D50:
/* 18550 80027D50 1B04084B */  NCCS
.L80027D54:
/* 18554 80027D54 00B01348 */  mfc2       $s3, $22 # handwritten instruction
.L80027D58:
/* 18558 80027D58 00000000 */  nop
/* 1855C 80027D5C 000033AE */  sw         $s3, 0x0($s1)
/* 18560 80027D60 0000828E */  lw         $v0, 0x0($s4)
/* 18564 80027D64 0400838E */  lw         $v1, 0x4($s4)
/* 18568 80027D68 0400CD8E */  lw         $t5, 0x4($s6)
/* 1856C 80027D6C 00000000 */  nop
/* 18570 80027D70 0040013C */  lui        $at, (0x40000000 >> 16)
/* 18574 80027D74 2498A101 */  and        $s3, $t5, $at
/* 18578 80027D78 0B006016 */  bnez       $s3, .L80027DA8
/* 1857C 80027D7C 2198A001 */   addu      $s3, $t5, $zero
/* 18580 80027D80 00008248 */  mtc2       $v0, $0 # handwritten instruction
/* 18584 80027D84 00088348 */  mtc2       $v1, $1 # handwritten instruction
/* 18588 80027D88 00308D48 */  mtc2       $t5, $6 # handwritten instruction
/* 1858C 80027D8C 04008011 */  beqz       $t4, .L80027DA0
/* 18590 80027D90 00000000 */   nop
/* 18594 80027D94 1304E84A */  NCDS
/* 18598 80027D98 02000104 */  bgez       $zero, .L80027DA4
/* 1859C 80027D9C 00000000 */   nop
.L80027DA0:
/* 185A0 80027DA0 1B04084B */  NCCS
.L80027DA4:
/* 185A4 80027DA4 00B01348 */  mfc2       $s3, $22 # handwritten instruction
.L80027DA8:
/* 185A8 80027DA8 00000000 */  nop
/* 185AC 80027DAC 040033AE */  sw         $s3, 0x4($s1)
/* 185B0 80027DB0 0000A28E */  lw         $v0, 0x0($s5)
/* 185B4 80027DB4 0400A38E */  lw         $v1, 0x4($s5)
/* 185B8 80027DB8 0800CD8E */  lw         $t5, 0x8($s6)
/* 185BC 80027DBC 00000000 */  nop
/* 185C0 80027DC0 0040013C */  lui        $at, (0x40000000 >> 16)
/* 185C4 80027DC4 2498A101 */  and        $s3, $t5, $at
/* 185C8 80027DC8 0B006016 */  bnez       $s3, .L80027DF8
/* 185CC 80027DCC 2198A001 */   addu      $s3, $t5, $zero
/* 185D0 80027DD0 00008248 */  mtc2       $v0, $0 # handwritten instruction
/* 185D4 80027DD4 00088348 */  mtc2       $v1, $1 # handwritten instruction
/* 185D8 80027DD8 00308D48 */  mtc2       $t5, $6 # handwritten instruction
/* 185DC 80027DDC 04008011 */  beqz       $t4, .L80027DF0
/* 185E0 80027DE0 00000000 */   nop
/* 185E4 80027DE4 1304E84A */  NCDS
/* 185E8 80027DE8 02000104 */  bgez       $zero, .L80027DF4
/* 185EC 80027DEC 00000000 */   nop
.L80027DF0:
/* 185F0 80027DF0 1B04084B */  NCCS
.L80027DF4:
/* 185F4 80027DF4 00B01348 */  mfc2       $s3, $22 # handwritten instruction
.L80027DF8:
/* 185F8 80027DF8 00000000 */  nop
/* 185FC 80027DFC 080033AE */  sw         $s3, 0x8($s1)
/* 18600 80027E00 1800A524 */  addiu      $a1, $a1, 0x18
/* 18604 80027E04 1000AC24 */  addiu      $t4, $a1, 0x10
/* 18608 80027E08 0000A28C */  lw         $v0, 0x0($a1)
/* 1860C 80027E0C 0400A38C */  lw         $v1, 0x4($a1)
/* 18610 80027E10 0800AD8C */  lw         $t5, 0x8($a1)
/* 18614 80027E14 0C00AE8C */  lw         $t6, 0xC($a1)
/* 18618 80027E18 1000A48C */  lw         $a0, 0x10($a1)
/* 1861C 80027E1C 1400B08C */  lw         $s0, 0x14($a1)
/* 18620 80027E20 0C003126 */  addiu      $s1, $s1, 0xC
/* 18624 80027E24 0C00D626 */  addiu      $s6, $s6, 0xC
/* 18628 80027E28 2B60EC01 */  sltu       $t4, $t7, $t4
/* 1862C 80027E2C 99FF8011 */  beqz       $t4, .L80027C94
/* 18630 80027E30 18000825 */   addiu     $t0, $t0, 0x18
.L80027E34:
/* 18634 80027E34 2A08E501 */  slt        $at, $t7, $a1
/* 18638 80027E38 4E002014 */  bnez       $at, .L80027F74
/* 1863C 80027E3C 00000000 */   nop
/* 18640 80027E40 00008248 */  mtc2       $v0, $0 # handwritten instruction
/* 18644 80027E44 00088348 */  mtc2       $v1, $1 # handwritten instruction
/* 18648 80027E48 029C0300 */  srl        $s3, $v1, 16
/* 1864C 80027E4C C0981300 */  sll        $s3, $s3, 3
/* 18650 80027E50 0100184A */  RTPS
/* 18654 80027E54 21985302 */  addu       $s3, $s2, $s3
/* 18658 80027E58 0000628E */  lw         $v0, 0x0($s3)
/* 1865C 80027E5C 0400638E */  lw         $v1, 0x4($s3)
/* 18660 80027E60 0000D38E */  lw         $s3, 0x0($s6)
/* 18664 80027E64 0800A524 */  addiu      $a1, $a1, 0x8
/* 18668 80027E68 00000EE9 */  swc2       $14, 0x0($t0)
/* 1866C 80027E6C 040013E9 */  swc2       $19, 0x4($t0)
/* 18670 80027E70 00F84448 */  cfc2       $a0, $31 # handwritten instruction
/* 18674 80027E74 00400C48 */  mfc2       $t4, $8 # handwritten instruction
/* 18678 80027E78 0D80143C */  lui        $s4, %hi(modelFadeValue)
/* 1867C 80027E7C F405948E */  lw         $s4, %lo(modelFadeValue)($s4)
/* 18680 80027E80 00000000 */  nop
/* 18684 80027E84 03008012 */  beqz       $s4, .L80027E94
/* 18688 80027E88 00000000 */   nop
/* 1868C 80027E8C 00409448 */  mtc2       $s4, $8 # handwritten instruction
/* 18690 80027E90 21608002 */  addu       $t4, $s4, $zero
.L80027E94:
/* 18694 80027E94 0040013C */  lui        $at, (0x40000000 >> 16)
/* 18698 80027E98 24A06102 */  and        $s4, $s3, $at
/* 1869C 80027E9C 0B008016 */  bnez       $s4, .L80027ECC
/* 186A0 80027EA0 21A06002 */   addu      $s4, $s3, $zero
/* 186A4 80027EA4 00008248 */  mtc2       $v0, $0 # handwritten instruction
/* 186A8 80027EA8 00088348 */  mtc2       $v1, $1 # handwritten instruction
/* 186AC 80027EAC 00309448 */  mtc2       $s4, $6 # handwritten instruction
/* 186B0 80027EB0 04008011 */  beqz       $t4, .L80027EC4
/* 186B4 80027EB4 00000000 */   nop
/* 186B8 80027EB8 1304E84A */  NCDS
/* 186BC 80027EBC 02000104 */  bgez       $zero, .L80027EC8
/* 186C0 80027EC0 00000000 */   nop
.L80027EC4:
/* 186C4 80027EC4 1B04084B */  NCCS
.L80027EC8:
/* 186C8 80027EC8 00B01448 */  mfc2       $s4, $22 # handwritten instruction
.L80027ECC:
/* 186CC 80027ECC 00000000 */  nop
/* 186D0 80027ED0 000034AE */  sw         $s4, 0x0($s1)
/* 186D4 80027ED4 08000825 */  addiu      $t0, $t0, 0x8
/* 186D8 80027ED8 0400D626 */  addiu      $s6, $s6, 0x4
/* 186DC 80027EDC 04003126 */  addiu      $s1, $s1, 0x4
/* 186E0 80027EE0 2A08E501 */  slt        $at, $t7, $a1
/* 186E4 80027EE4 23002014 */  bnez       $at, .L80027F74
/* 186E8 80027EE8 2430C400 */   and       $a2, $a2, $a0
/* 186EC 80027EEC 00008D48 */  mtc2       $t5, $0 # handwritten instruction
/* 186F0 80027EF0 00088E48 */  mtc2       $t6, $1 # handwritten instruction
/* 186F4 80027EF4 00000000 */  nop
/* 186F8 80027EF8 00000000 */  nop
/* 186FC 80027EFC 0100184A */  RTPS
/* 18700 80027F00 029C0E00 */  srl        $s3, $t6, 16
/* 18704 80027F04 C0981300 */  sll        $s3, $s3, 3
/* 18708 80027F08 21985302 */  addu       $s3, $s2, $s3
/* 1870C 80027F0C 0000628E */  lw         $v0, 0x0($s3)
/* 18710 80027F10 0400638E */  lw         $v1, 0x4($s3)
/* 18714 80027F14 0000D38E */  lw         $s3, 0x0($s6)
/* 18718 80027F18 00000EE9 */  swc2       $14, 0x0($t0)
/* 1871C 80027F1C 040013E9 */  swc2       $19, 0x4($t0)
/* 18720 80027F20 00F84448 */  cfc2       $a0, $31 # handwritten instruction
/* 18724 80027F24 0040013C */  lui        $at, (0x40000000 >> 16)
/* 18728 80027F28 24A06102 */  and        $s4, $s3, $at
/* 1872C 80027F2C 0B008016 */  bnez       $s4, .L80027F5C
/* 18730 80027F30 21A06002 */   addu      $s4, $s3, $zero
/* 18734 80027F34 00008248 */  mtc2       $v0, $0 # handwritten instruction
/* 18738 80027F38 00088348 */  mtc2       $v1, $1 # handwritten instruction
/* 1873C 80027F3C 00309448 */  mtc2       $s4, $6 # handwritten instruction
/* 18740 80027F40 04008011 */  beqz       $t4, .L80027F54
/* 18744 80027F44 00000000 */   nop
/* 18748 80027F48 1304E84A */  NCDS
/* 1874C 80027F4C 02000104 */  bgez       $zero, .L80027F58
/* 18750 80027F50 00000000 */   nop
.L80027F54:
/* 18754 80027F54 1B04084B */  NCCS
.L80027F58:
/* 18758 80027F58 00B01448 */  mfc2       $s4, $22 # handwritten instruction
.L80027F5C:
/* 1875C 80027F5C 00000000 */  nop
/* 18760 80027F60 000034AE */  sw         $s4, 0x0($s1)
/* 18764 80027F64 08000825 */  addiu      $t0, $t0, 0x8
/* 18768 80027F68 0400D626 */  addiu      $s6, $s6, 0x4
/* 1876C 80027F6C 2430C400 */  and        $a2, $a2, $a0
/* 18770 80027F70 04003126 */  addiu      $s1, $s1, 0x4
.L80027F74:
/* 18774 80027F74 20002925 */  addiu      $t1, $t1, 0x20
/* 18778 80027F78 FFFF4A25 */  addiu      $t2, $t2, -0x1
/* 1877C 80027F7C 96FE4015 */  bnez       $t2, .L800279D8
/* 18780 80027F80 18001827 */   addiu     $t8, $t8, 0x18
.L80027F84:
/* 18784 80027F84 7400768D */  lw         $s6, (0x1F800074 & 0xFFFF)($t3)
/* 18788 80027F88 7000758D */  lw         $s5, (0x1F800070 & 0xFFFF)($t3)
/* 1878C 80027F8C 6C00748D */  lw         $s4, (0x1F80006C & 0xFFFF)($t3)
/* 18790 80027F90 6800738D */  lw         $s3, (0x1F800068 & 0xFFFF)($t3)
/* 18794 80027F94 6400728D */  lw         $s2, (0x1F800064 & 0xFFFF)($t3)
/* 18798 80027F98 6000718D */  lw         $s1, (0x1F800060 & 0xFFFF)($t3)
/* 1879C 80027F9C 5C00708D */  lw         $s0, (0x1F80005C & 0xFFFF)($t3)
/* 187A0 80027FA0 0800E003 */  jr         $ra
/* 187A4 80027FA4 2110C000 */   addu      $v0, $a2, $zero
.size func_80027170, . - func_80027170
