.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel PIPE3D_TransformAnimatedSplitInstanceVertices
/* 2C2E8 8003BAE8 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 2C2EC 8003BAEC 4800B4AF */  sw         $s4, 0x48($sp)
/* 2C2F0 8003BAF0 21A0A000 */  addu       $s4, $a1, $zero
/* 2C2F4 8003BAF4 4400B3AF */  sw         $s3, 0x44($sp)
/* 2C2F8 8003BAF8 7C00B38F */  lw         $s3, 0x7C($sp)
/* 2C2FC 8003BAFC 0D80023C */  lui        $v0, %hi(D_800D0D10)
/* 2C300 8003BB00 5C00BFAF */  sw         $ra, 0x5C($sp)
/* 2C304 8003BB04 5800BEAF */  sw         $fp, 0x58($sp)
/* 2C308 8003BB08 5400B7AF */  sw         $s7, 0x54($sp)
/* 2C30C 8003BB0C 5000B6AF */  sw         $s6, 0x50($sp)
/* 2C310 8003BB10 4C00B5AF */  sw         $s5, 0x4C($sp)
/* 2C314 8003BB14 4000B2AF */  sw         $s2, 0x40($sp)
/* 2C318 8003BB18 3C00B1AF */  sw         $s1, 0x3C($sp)
/* 2C31C 8003BB1C 3800B0AF */  sw         $s0, 0x38($sp)
/* 2C320 8003BB20 6000A4AF */  sw         $a0, 0x60($sp)
/* 2C324 8003BB24 6800A6AF */  sw         $a2, 0x68($sp)
/* 2C328 8003BB28 6C00A7AF */  sw         $a3, 0x6C($sp)
/* 2C32C 8003BB2C 1C00CC8C */  lw         $t4, 0x1C($a2)
/* 2C330 8003BB30 801F173C */  lui        $s7, (0x1F800068 >> 16)
/* 2C334 8003BB34 2400ACAF */  sw         $t4, 0x24($sp)
/* 2C338 8003BB38 100D4C24 */  addiu      $t4, $v0, %lo(D_800D0D10)
/* 2C33C 8003BB3C 03008D89 */  lwl        $t5, 0x3($t4)
/* 2C340 8003BB40 00008D99 */  lwr        $t5, 0x0($t4)
/* 2C344 8003BB44 00000000 */  nop
/* 2C348 8003BB48 1300ADAB */  swl        $t5, 0x13($sp)
/* 2C34C 8003BB4C 1000ADBB */  swr        $t5, 0x10($sp)
/* 2C350 8003BB50 02006012 */  beqz       $s3, .L8003BB5C
/* 2C354 8003BB54 1000A227 */   addiu     $v0, $sp, 0x10
/* 2C358 8003BB58 000046C8 */  lwc2       $6, 0x0($v0)
.L8003BB5C:
/* 2C35C 8003BB5C 5C90828F */  lw         $v0, %gp_rel(modelFadeValue)($gp)
/* 2C360 8003BB60 00000000 */  nop
/* 2C364 8003BB64 04004010 */  beqz       $v0, .L8003BB78
/* 2C368 8003BB68 21680000 */   addu      $t5, $zero, $zero
/* 2C36C 8003BB6C 00408248 */  mtc2       $v0, $8 # handwritten instruction
/* 2C370 8003BB70 DFEE0008 */  j          .L8003BB7C
/* 2C374 8003BB74 00000000 */   nop
.L8003BB78:
/* 2C378 8003BB78 00408D48 */  mtc2       $t5, $8 # handwritten instruction
.L8003BB7C:
/* 2C37C 8003BB7C 6800AE8F */  lw         $t6, 0x68($sp)
/* 2C380 8003BB80 00000000 */  nop
/* 2C384 8003BB84 1800C28D */  lw         $v0, 0x18($t6)
/* 2C388 8003BB88 00000000 */  nop
/* 2C38C 8003BB8C 3A014018 */  blez       $v0, .L8003C078
/* 2C390 8003BB90 2000A0AF */   sw        $zero, 0x20($sp)
/* 2C394 8003BB94 6000EF26 */  addiu      $t7, $s7, %lo(D_1F800060)
/* 2C398 8003BB98 3000AFAF */  sw         $t7, 0x30($sp)
.L8003BB9C:
/* 2C39C 8003BB9C 2400AC8F */  lw         $t4, 0x24($sp)
/* 2C3A0 8003BBA0 00000000 */  nop
/* 2C3A4 8003BBA4 0A008385 */  lh         $v1, 0xA($t4)
/* 2C3A8 8003BBA8 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 2C3AC 8003BBAC 28016210 */  beq        $v1, $v0, .L8003C050
/* 2C3B0 8003BBB0 C0100300 */   sll       $v0, $v1, 3
/* 2C3B4 8003BBB4 1800B127 */  addiu      $s1, $sp, 0x18
/* 2C3B8 8003BBB8 21B02002 */  addu       $s6, $s1, $zero
/* 2C3BC 8003BBBC 6000AD8F */  lw         $t5, 0x60($sp)
/* 2C3C0 8003BBC0 21A82002 */  addu       $s5, $s1, $zero
/* 2C3C4 8003BBC4 2C00A0AF */  sw         $zero, 0x2C($sp)
/* 2C3C8 8003BBC8 08008385 */  lh         $v1, 0x8($t4)
/* 2C3CC 8003BBCC 21F0A201 */  addu       $fp, $t5, $v0
/* 2C3D0 8003BBD0 0D80023C */  lui        $v0, %hi(D_800D0D10)
/* 2C3D4 8003BBD4 C0180300 */  sll        $v1, $v1, 3
/* 2C3D8 8003BBD8 100D4D24 */  addiu      $t5, $v0, %lo(D_800D0D10)
/* 2C3DC 8003BBDC 0300AE89 */  lwl        $t6, 0x3($t5)
/* 2C3E0 8003BBE0 0000AE99 */  lwr        $t6, 0x0($t5)
/* 2C3E4 8003BBE4 00000000 */  nop
/* 2C3E8 8003BBE8 1B00AEAB */  swl        $t6, 0x1B($sp)
/* 2C3EC 8003BBEC 1800AEBB */  swr        $t6, 0x18($sp)
/* 2C3F0 8003BBF0 6000AE8F */  lw         $t6, 0x60($sp)
/* 2C3F4 8003BBF4 2000AF8F */  lw         $t7, 0x20($sp)
/* 2C3F8 8003BBF8 7000AC8F */  lw         $t4, 0x70($sp)
/* 2C3FC 8003BBFC 2118C301 */  addu       $v1, $t6, $v1
/* 2C400 8003BC00 40110F00 */  sll        $v0, $t7, 5
/* 2C404 8003BC04 21908201 */  addu       $s2, $t4, $v0
/* 2C408 8003BC08 08006012 */  beqz       $s3, .L8003BC2C
/* 2C40C 8003BC0C 2800A3AF */   sw        $v1, 0x28($sp)
/* 2C410 8003BC10 7800A48F */  lw         $a0, 0x78($sp)
/* 2C414 8003BC14 21284002 */  addu       $a1, $s2, $zero
/* 2C418 8003BC18 4000F026 */  addiu      $s0, $s7, %lo(D_1F800040)
/* 2C41C 8003BC1C BFF7020C */  jal        MulMatrix0
/* 2C420 8003BC20 21300002 */   addu      $a2, $s0, $zero
/* 2C424 8003BC24 9FF7020C */  jal        SetLightMatrix
/* 2C428 8003BC28 21200002 */   addu      $a0, $s0, $zero
.L8003BC2C:
/* 2C42C 8003BC2C 21284002 */  addu       $a1, $s2, $zero
/* 2C430 8003BC30 6C00A48F */  lw         $a0, 0x6C($sp)
/* 2C434 8003BC34 59FD020C */  jal        CompMatrix
/* 2C438 8003BC38 2130E002 */   addu      $a2, $s7, $zero
/* 2C43C 8003BC3C 52F2020C */  jal        SetRotMatrix
/* 2C440 8003BC40 2120E002 */   addu      $a0, $s7, $zero
/* 2C444 8003BC44 4AF2020C */  jal        SetTransMatrix
/* 2C448 8003BC48 2120E002 */   addu      $a0, $s7, $zero
/* 2C44C 8003BC4C 2800A68F */  lw         $a2, 0x28($sp)
/* 2C450 8003BC50 F0FFDE27 */  addiu      $fp, $fp, -0x10
/* 2C454 8003BC54 2B10C603 */  sltu       $v0, $fp, $a2
/* 2C458 8003BC58 C2004014 */  bnez       $v0, .L8003BF64
/* 2C45C 8003BC5C 00000000 */   nop
/* 2C460 8003BC60 1000C824 */  addiu      $t0, $a2, 0x10
/* 2C464 8003BC64 08006726 */  addiu      $a3, $s3, 0x8
/* 2C468 8003BC68 04008526 */  addiu      $a1, $s4, 0x4
.L8003BC6C:
/* 2C46C 8003BC6C 0000C0C8 */  lwc2       $0, 0x0($a2)
/* 2C470 8003BC70 0400C1C8 */  lwc2       $1, 0x4($a2)
/* 2C474 8003BC74 00000000 */  nop
/* 2C478 8003BC78 00000000 */  nop
/* 2C47C 8003BC7C 1200484A */  MVMVA      1, 0, 0, 0, 0
/* 2C480 8003BC80 0D800D3C */  lui        $t5, %hi(gNormalList)
/* 2C484 8003BC84 54A4AD25 */  addiu      $t5, $t5, %lo(gNormalList)
/* 2C488 8003BC88 0D800E3C */  lui        $t6, %hi(gNormalList)
/* 2C48C 8003BC8C 54A4CE25 */  addiu      $t6, $t6, %lo(gNormalList)
/* 2C490 8003BC90 0D800F3C */  lui        $t7, %hi(gNormalList)
/* 2C494 8003BC94 54A4EF25 */  addiu      $t7, $t7, %lo(gNormalList)
/* 2C498 8003BC98 F6FF0295 */  lhu        $v0, -0xA($t0)
/* 2C49C 8003BC9C FEFF0395 */  lhu        $v1, -0x2($t0)
/* 2C4A0 8003BCA0 3000AC8F */  lw         $t4, 0x30($sp)
/* 2C4A4 8003BCA4 C0100200 */  sll        $v0, $v0, 3
/* 2C4A8 8003BCA8 2148A201 */  addu       $t1, $t5, $v0
/* 2C4AC 8003BCAC C0180300 */  sll        $v1, $v1, 3
/* 2C4B0 8003BCB0 06000295 */  lhu        $v0, 0x6($t0)
/* 2C4B4 8003BCB4 2150C301 */  addu       $t2, $t6, $v1
/* 2C4B8 8003BCB8 C0100200 */  sll        $v0, $v0, 3
/* 2C4BC 8003BCBC 2158E201 */  addu       $t3, $t7, $v0
/* 2C4C0 8003BCC0 000099E9 */  swc2       $25, 0x0($t4)
/* 2C4C4 8003BCC4 04009AE9 */  swc2       $26, 0x4($t4) # handwritten instruction
/* 2C4C8 8003BCC8 08009BE9 */  swc2       $27, 0x8($t4) # handwritten instruction
/* 2C4CC 8003BCCC 6000E296 */  lhu        $v0, (0x1F800060 & 0xFFFF)($s7)
/* 2C4D0 8003BCD0 00000000 */  nop
/* 2C4D4 8003BCD4 000082A6 */  sh         $v0, 0x0($s4)
/* 2C4D8 8003BCD8 6400E296 */  lhu        $v0, (0x1F800064 & 0xFFFF)($s7)
/* 2C4DC 8003BCDC 00000000 */  nop
/* 2C4E0 8003BCE0 FEFFA2A4 */  sh         $v0, -0x2($a1)
/* 2C4E4 8003BCE4 6800E296 */  lhu        $v0, (0x1F800068 & 0xFFFF)($s7)
/* 2C4E8 8003BCE8 08009426 */  addiu      $s4, $s4, 0x8
/* 2C4EC 8003BCEC 0000A2A4 */  sh         $v0, 0x0($a1)
/* 2C4F0 8003BCF0 0800A524 */  addiu      $a1, $a1, 0x8
/* 2C4F4 8003BCF4 0800C224 */  addiu      $v0, $a2, 0x8
/* 2C4F8 8003BCF8 000040C8 */  lwc2       $0, 0x0($v0)
/* 2C4FC 8003BCFC 040041C8 */  lwc2       $1, 0x4($v0)
/* 2C500 8003BD00 00000000 */  nop
/* 2C504 8003BD04 00000000 */  nop
/* 2C508 8003BD08 1200484A */  MVMVA      1, 0, 0, 0, 0
/* 2C50C 8003BD0C 000099E9 */  swc2       $25, 0x0($t4)
/* 2C510 8003BD10 04009AE9 */  swc2       $26, 0x4($t4) # handwritten instruction
/* 2C514 8003BD14 08009BE9 */  swc2       $27, 0x8($t4) # handwritten instruction
/* 2C518 8003BD18 6000E296 */  lhu        $v0, (0x1F800060 & 0xFFFF)($s7)
/* 2C51C 8003BD1C 00000000 */  nop
/* 2C520 8003BD20 000082A6 */  sh         $v0, 0x0($s4)
/* 2C524 8003BD24 6400E296 */  lhu        $v0, (0x1F800064 & 0xFFFF)($s7)
/* 2C528 8003BD28 00000000 */  nop
/* 2C52C 8003BD2C FEFFA2A4 */  sh         $v0, -0x2($a1)
/* 2C530 8003BD30 6800E296 */  lhu        $v0, (0x1F800068 & 0xFFFF)($s7)
/* 2C534 8003BD34 08009426 */  addiu      $s4, $s4, 0x8
/* 2C538 8003BD38 0000A2A4 */  sh         $v0, 0x0($a1)
/* 2C53C 8003BD3C 0800A524 */  addiu      $a1, $a1, 0x8
/* 2C540 8003BD40 000000C9 */  lwc2       $0, 0x0($t0)
/* 2C544 8003BD44 040001C9 */  lwc2       $1, 0x4($t0)
/* 2C548 8003BD48 00000000 */  nop
/* 2C54C 8003BD4C 00000000 */  nop
/* 2C550 8003BD50 1200484A */  MVMVA      1, 0, 0, 0, 0
/* 2C554 8003BD54 000099E9 */  swc2       $25, 0x0($t4)
/* 2C558 8003BD58 04009AE9 */  swc2       $26, 0x4($t4) # handwritten instruction
/* 2C55C 8003BD5C 08009BE9 */  swc2       $27, 0x8($t4) # handwritten instruction
/* 2C560 8003BD60 6000E296 */  lhu        $v0, (0x1F800060 & 0xFFFF)($s7)
/* 2C564 8003BD64 00000000 */  nop
/* 2C568 8003BD68 000082A6 */  sh         $v0, 0x0($s4)
/* 2C56C 8003BD6C 6400E296 */  lhu        $v0, (0x1F800064 & 0xFFFF)($s7)
/* 2C570 8003BD70 00000000 */  nop
/* 2C574 8003BD74 FEFFA2A4 */  sh         $v0, -0x2($a1)
/* 2C578 8003BD78 6800E296 */  lhu        $v0, (0x1F800068 & 0xFFFF)($s7)
/* 2C57C 8003BD7C 08009426 */  addiu      $s4, $s4, 0x8
/* 2C580 8003BD80 0000A2A4 */  sh         $v0, 0x0($a1)
/* 2C584 8003BD84 73006012 */  beqz       $s3, .L8003BF54
/* 2C588 8003BD88 0800A524 */   addiu     $a1, $a1, 0x8
/* 2C58C 8003BD8C 8000AD8F */  lw         $t5, 0x80($sp)
/* 2C590 8003BD90 00000000 */  nop
/* 2C594 8003BD94 0C00A011 */  beqz       $t5, .L8003BDC8
/* 2C598 8003BD98 00000000 */   nop
/* 2C59C 8003BD9C 2188A001 */  addu       $s1, $t5, $zero
/* 2C5A0 8003BDA0 0400B625 */  addiu      $s6, $t5, 0x4
/* 2C5A4 8003BDA4 08003526 */  addiu      $s5, $s1, 0x8
/* 2C5A8 8003BDA8 0C002E26 */  addiu      $t6, $s1, 0xC
/* 2C5AC 8003BDAC 8000AEAF */  sw         $t6, 0x80($sp)
/* 2C5B0 8003BDB0 0000228E */  lw         $v0, 0x0($s1)
/* 2C5B4 8003BDB4 0400238E */  lw         $v1, 0x4($s1)
/* 2C5B8 8003BDB8 0800248E */  lw         $a0, 0x8($s1)
/* 2C5BC 8003BDBC 24104300 */  and        $v0, $v0, $v1
/* 2C5C0 8003BDC0 24104400 */  and        $v0, $v0, $a0
/* 2C5C4 8003BDC4 2C00A2AF */  sw         $v0, 0x2C($sp)
.L8003BDC8:
/* 2C5C8 8003BDC8 2C00AF8F */  lw         $t7, 0x2C($sp)
/* 2C5CC 8003BDCC 00400C3C */  lui        $t4, (0x40000000 >> 16)
/* 2C5D0 8003BDD0 2410EC01 */  and        $v0, $t7, $t4
/* 2C5D4 8003BDD4 11004010 */  beqz       $v0, .L8003BE1C
/* 2C5D8 8003BDD8 00000000 */   nop
/* 2C5DC 8003BDDC 03002D8A */  lwl        $t5, 0x3($s1)
/* 2C5E0 8003BDE0 00002D9A */  lwr        $t5, 0x0($s1)
/* 2C5E4 8003BDE4 00000000 */  nop
/* 2C5E8 8003BDE8 03006DAA */  swl        $t5, 0x3($s3)
/* 2C5EC 8003BDEC 00006DBA */  swr        $t5, 0x0($s3)
/* 2C5F0 8003BDF0 0300CD8A */  lwl        $t5, 0x3($s6)
/* 2C5F4 8003BDF4 0000CD9A */  lwr        $t5, 0x0($s6)
/* 2C5F8 8003BDF8 00000000 */  nop
/* 2C5FC 8003BDFC FFFFEDA8 */  swl        $t5, -0x1($a3)
/* 2C600 8003BE00 FCFFEDB8 */  swr        $t5, -0x4($a3)
/* 2C604 8003BE04 0300AD8A */  lwl        $t5, 0x3($s5)
/* 2C608 8003BE08 0000AD9A */  lwr        $t5, 0x0($s5)
/* 2C60C 8003BE0C 00000000 */  nop
/* 2C610 8003BE10 0300EDA8 */  swl        $t5, 0x3($a3)
/* 2C614 8003BE14 D3EF0008 */  j          .L8003BF4C
/* 2C618 8003BE18 0000EDB8 */   swr       $t5, 0x0($a3)
.L8003BE1C:
/* 2C61C 8003BE1C 5C90828F */  lw         $v0, %gp_rel(modelFadeValue)($gp)
/* 2C620 8003BE20 00000000 */  nop
/* 2C624 8003BE24 15004014 */  bnez       $v0, .L8003BE7C
/* 2C628 8003BE28 00000000 */   nop
/* 2C62C 8003BE2C 000020C9 */  lwc2       $0, 0x0($t1)
/* 2C630 8003BE30 040021C9 */  lwc2       $1, 0x4($t1)
/* 2C634 8003BE34 000026CA */  lwc2       $6, 0x0($s1)
/* 2C638 8003BE38 00000000 */  nop
/* 2C63C 8003BE3C 00000000 */  nop
/* 2C640 8003BE40 1B04084B */  NCCS
/* 2C644 8003BE44 000040C9 */  lwc2       $0, 0x0($t2)
/* 2C648 8003BE48 040041C9 */  lwc2       $1, 0x4($t2)
/* 2C64C 8003BE4C 0000C6CA */  lwc2       $6, 0x0($s6)
/* 2C650 8003BE50 00000000 */  nop
/* 2C654 8003BE54 00000000 */  nop
/* 2C658 8003BE58 1B04084B */  NCCS
/* 2C65C 8003BE5C 000060C9 */  lwc2       $0, 0x0($t3)
/* 2C660 8003BE60 040061C9 */  lwc2       $1, 0x4($t3)
/* 2C664 8003BE64 0000A6CA */  lwc2       $6, 0x0($s5)
/* 2C668 8003BE68 00000000 */  nop
/* 2C66C 8003BE6C 00000000 */  nop
/* 2C670 8003BE70 1B04084B */  NCCS
/* 2C674 8003BE74 B2EF0008 */  j          .L8003BEC8
/* 2C678 8003BE78 04006226 */   addiu     $v0, $s3, 0x4
.L8003BE7C:
/* 2C67C 8003BE7C 000020C9 */  lwc2       $0, 0x0($t1)
/* 2C680 8003BE80 040021C9 */  lwc2       $1, 0x4($t1)
/* 2C684 8003BE84 000026CA */  lwc2       $6, 0x0($s1)
/* 2C688 8003BE88 00000000 */  nop
/* 2C68C 8003BE8C 00000000 */  nop
/* 2C690 8003BE90 1304E84A */  NCDS
/* 2C694 8003BE94 000040C9 */  lwc2       $0, 0x0($t2)
/* 2C698 8003BE98 040041C9 */  lwc2       $1, 0x4($t2)
/* 2C69C 8003BE9C 0000C6CA */  lwc2       $6, 0x0($s6)
/* 2C6A0 8003BEA0 00000000 */  nop
/* 2C6A4 8003BEA4 00000000 */  nop
/* 2C6A8 8003BEA8 1304E84A */  NCDS
/* 2C6AC 8003BEAC 000060C9 */  lwc2       $0, 0x0($t3)
/* 2C6B0 8003BEB0 040061C9 */  lwc2       $1, 0x4($t3)
/* 2C6B4 8003BEB4 0000A6CA */  lwc2       $6, 0x0($s5)
/* 2C6B8 8003BEB8 00000000 */  nop
/* 2C6BC 8003BEBC 00000000 */  nop
/* 2C6C0 8003BEC0 1304E84A */  NCDS
/* 2C6C4 8003BEC4 04006226 */  addiu      $v0, $s3, 0x4
.L8003BEC8:
/* 2C6C8 8003BEC8 000074EA */  swc2       $20, 0x0($s3)
/* 2C6CC 8003BECC 000055E8 */  swc2       $21, 0x0($v0)
/* 2C6D0 8003BED0 0000F6E8 */  swc2       $22, 0x0($a3)
/* 2C6D4 8003BED4 0000228E */  lw         $v0, 0x0($s1)
/* 2C6D8 8003BED8 00400D3C */  lui        $t5, (0x40000000 >> 16)
/* 2C6DC 8003BEDC 24104D00 */  and        $v0, $v0, $t5
/* 2C6E0 8003BEE0 06004010 */  beqz       $v0, .L8003BEFC
/* 2C6E4 8003BEE4 00000000 */   nop
/* 2C6E8 8003BEE8 03002E8A */  lwl        $t6, 0x3($s1)
/* 2C6EC 8003BEEC 00002E9A */  lwr        $t6, 0x0($s1)
/* 2C6F0 8003BEF0 00000000 */  nop
/* 2C6F4 8003BEF4 03006EAA */  swl        $t6, 0x3($s3)
/* 2C6F8 8003BEF8 00006EBA */  swr        $t6, 0x0($s3)
.L8003BEFC:
/* 2C6FC 8003BEFC 0000C28E */  lw         $v0, 0x0($s6)
/* 2C700 8003BF00 00400E3C */  lui        $t6, (0x40000000 >> 16)
/* 2C704 8003BF04 24104E00 */  and        $v0, $v0, $t6
/* 2C708 8003BF08 06004010 */  beqz       $v0, .L8003BF24
/* 2C70C 8003BF0C 00000000 */   nop
/* 2C710 8003BF10 0300CF8A */  lwl        $t7, 0x3($s6)
/* 2C714 8003BF14 0000CF9A */  lwr        $t7, 0x0($s6)
/* 2C718 8003BF18 00000000 */  nop
/* 2C71C 8003BF1C FFFFEFA8 */  swl        $t7, -0x1($a3)
/* 2C720 8003BF20 FCFFEFB8 */  swr        $t7, -0x4($a3)
.L8003BF24:
/* 2C724 8003BF24 0000A28E */  lw         $v0, 0x0($s5)
/* 2C728 8003BF28 00400F3C */  lui        $t7, (0x40000000 >> 16)
/* 2C72C 8003BF2C 24104F00 */  and        $v0, $v0, $t7
/* 2C730 8003BF30 06004010 */  beqz       $v0, .L8003BF4C
/* 2C734 8003BF34 00000000 */   nop
/* 2C738 8003BF38 0300AC8A */  lwl        $t4, 0x3($s5)
/* 2C73C 8003BF3C 0000AC9A */  lwr        $t4, 0x0($s5)
/* 2C740 8003BF40 00000000 */  nop
/* 2C744 8003BF44 0300ECA8 */  swl        $t4, 0x3($a3)
/* 2C748 8003BF48 0000ECB8 */  swr        $t4, 0x0($a3)
.L8003BF4C:
/* 2C74C 8003BF4C 0C00E724 */  addiu      $a3, $a3, 0xC
/* 2C750 8003BF50 0C007326 */  addiu      $s3, $s3, 0xC
.L8003BF54:
/* 2C754 8003BF54 1800C624 */  addiu      $a2, $a2, 0x18
/* 2C758 8003BF58 2B10C603 */  sltu       $v0, $fp, $a2
/* 2C75C 8003BF5C 43FF4010 */  beqz       $v0, .L8003BC6C
/* 2C760 8003BF60 18000825 */   addiu     $t0, $t0, 0x18
.L8003BF64:
/* 2C764 8003BF64 1000DE27 */  addiu      $fp, $fp, 0x10
/* 2C768 8003BF68 2B10C603 */  sltu       $v0, $fp, $a2
/* 2C76C 8003BF6C 38004014 */  bnez       $v0, .L8003C050
/* 2C770 8003BF70 00000000 */   nop
/* 2C774 8003BF74 04008326 */  addiu      $v1, $s4, 0x4
.L8003BF78:
/* 2C778 8003BF78 0000C0C8 */  lwc2       $0, 0x0($a2)
/* 2C77C 8003BF7C 0400C1C8 */  lwc2       $1, 0x4($a2)
/* 2C780 8003BF80 00000000 */  nop
/* 2C784 8003BF84 00000000 */  nop
/* 2C788 8003BF88 1200484A */  MVMVA      1, 0, 0, 0, 0
/* 2C78C 8003BF8C 0D800C3C */  lui        $t4, %hi(gNormalList)
/* 2C790 8003BF90 54A48C25 */  addiu      $t4, $t4, %lo(gNormalList)
/* 2C794 8003BF94 0600C294 */  lhu        $v0, 0x6($a2)
/* 2C798 8003BF98 3000AD8F */  lw         $t5, 0x30($sp)
/* 2C79C 8003BF9C C0100200 */  sll        $v0, $v0, 3
/* 2C7A0 8003BFA0 21488201 */  addu       $t1, $t4, $v0
/* 2C7A4 8003BFA4 0000B9E9 */  swc2       $25, 0x0($t5)
/* 2C7A8 8003BFA8 0400BAE9 */  swc2       $26, 0x4($t5) # handwritten instruction
/* 2C7AC 8003BFAC 0800BBE9 */  swc2       $27, 0x8($t5) # handwritten instruction
/* 2C7B0 8003BFB0 6000E296 */  lhu        $v0, (0x1F800060 & 0xFFFF)($s7)
/* 2C7B4 8003BFB4 00000000 */  nop
/* 2C7B8 8003BFB8 000082A6 */  sh         $v0, 0x0($s4)
/* 2C7BC 8003BFBC 6400E296 */  lhu        $v0, (0x1F800064 & 0xFFFF)($s7)
/* 2C7C0 8003BFC0 00000000 */  nop
/* 2C7C4 8003BFC4 FEFF62A4 */  sh         $v0, -0x2($v1)
/* 2C7C8 8003BFC8 6800E296 */  lhu        $v0, (0x1F800068 & 0xFFFF)($s7)
/* 2C7CC 8003BFCC 08009426 */  addiu      $s4, $s4, 0x8
/* 2C7D0 8003BFD0 000062A4 */  sh         $v0, 0x0($v1)
/* 2C7D4 8003BFD4 1A006012 */  beqz       $s3, .L8003C040
/* 2C7D8 8003BFD8 08006324 */   addiu     $v1, $v1, 0x8
/* 2C7DC 8003BFDC 8000AE8F */  lw         $t6, 0x80($sp)
/* 2C7E0 8003BFE0 00000000 */  nop
/* 2C7E4 8003BFE4 0300C011 */  beqz       $t6, .L8003BFF4
/* 2C7E8 8003BFE8 0400CF25 */   addiu     $t7, $t6, 0x4
/* 2C7EC 8003BFEC 2188C001 */  addu       $s1, $t6, $zero
/* 2C7F0 8003BFF0 8000AFAF */  sw         $t7, 0x80($sp)
.L8003BFF4:
/* 2C7F4 8003BFF4 0000228E */  lw         $v0, 0x0($s1)
/* 2C7F8 8003BFF8 00400C3C */  lui        $t4, (0x40000000 >> 16)
/* 2C7FC 8003BFFC 24104C00 */  and        $v0, $v0, $t4
/* 2C800 8003C000 07004010 */  beqz       $v0, .L8003C020
/* 2C804 8003C004 00000000 */   nop
/* 2C808 8003C008 03002D8A */  lwl        $t5, 0x3($s1)
/* 2C80C 8003C00C 00002D9A */  lwr        $t5, 0x0($s1)
/* 2C810 8003C010 00000000 */  nop
/* 2C814 8003C014 03006DAA */  swl        $t5, 0x3($s3)
/* 2C818 8003C018 0FF00008 */  j          .L8003C03C
/* 2C81C 8003C01C 00006DBA */   swr       $t5, 0x0($s3)
.L8003C020:
/* 2C820 8003C020 000026CA */  lwc2       $6, 0x0($s1)
/* 2C824 8003C024 000020C9 */  lwc2       $0, 0x0($t1)
/* 2C828 8003C028 040021C9 */  lwc2       $1, 0x4($t1)
/* 2C82C 8003C02C 00000000 */  nop
/* 2C830 8003C030 00000000 */  nop
/* 2C834 8003C034 1304E84A */  NCDS
/* 2C838 8003C038 000076EA */  swc2       $22, 0x0($s3)
.L8003C03C:
/* 2C83C 8003C03C 04007326 */  addiu      $s3, $s3, 0x4
.L8003C040:
/* 2C840 8003C040 0800C624 */  addiu      $a2, $a2, 0x8
/* 2C844 8003C044 2B10C603 */  sltu       $v0, $fp, $a2
/* 2C848 8003C048 CBFF4010 */  beqz       $v0, .L8003BF78
/* 2C84C 8003C04C 00000000 */   nop
.L8003C050:
/* 2C850 8003C050 2400AD8F */  lw         $t5, 0x24($sp)
/* 2C854 8003C054 6800AE8F */  lw         $t6, 0x68($sp)
/* 2C858 8003C058 2000AF8F */  lw         $t7, 0x20($sp)
/* 2C85C 8003C05C 1800AD25 */  addiu      $t5, $t5, 0x18
/* 2C860 8003C060 2400ADAF */  sw         $t5, 0x24($sp)
/* 2C864 8003C064 1800C28D */  lw         $v0, 0x18($t6)
/* 2C868 8003C068 0100EF25 */  addiu      $t7, $t7, 0x1
/* 2C86C 8003C06C 2A10E201 */  slt        $v0, $t7, $v0
/* 2C870 8003C070 CAFE4014 */  bnez       $v0, .L8003BB9C
/* 2C874 8003C074 2000AFAF */   sw        $t7, 0x20($sp)
.L8003C078:
/* 2C878 8003C078 88B18C27 */  addiu      $t4, $gp, %gp_rel(modelDQP)
/* 2C87C 8003C07C 000088E9 */  swc2       $8, 0x0($t4)
/* 2C880 8003C080 5C00BF8F */  lw         $ra, 0x5C($sp)
/* 2C884 8003C084 5800BE8F */  lw         $fp, 0x58($sp)
/* 2C888 8003C088 5400B78F */  lw         $s7, 0x54($sp)
/* 2C88C 8003C08C 5000B68F */  lw         $s6, 0x50($sp)
/* 2C890 8003C090 4C00B58F */  lw         $s5, 0x4C($sp)
/* 2C894 8003C094 4800B48F */  lw         $s4, 0x48($sp)
/* 2C898 8003C098 4400B38F */  lw         $s3, 0x44($sp)
/* 2C89C 8003C09C 4000B28F */  lw         $s2, 0x40($sp)
/* 2C8A0 8003C0A0 3C00B18F */  lw         $s1, 0x3C($sp)
/* 2C8A4 8003C0A4 3800B08F */  lw         $s0, 0x38($sp)
/* 2C8A8 8003C0A8 21100000 */  addu       $v0, $zero, $zero
/* 2C8AC 8003C0AC 0800E003 */  jr         $ra
/* 2C8B0 8003C0B0 6000BD27 */   addiu     $sp, $sp, 0x60
.size PIPE3D_TransformAnimatedSplitInstanceVertices, . - PIPE3D_TransformAnimatedSplitInstanceVertices
