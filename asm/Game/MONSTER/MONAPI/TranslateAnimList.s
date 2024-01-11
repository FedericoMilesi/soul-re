.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel TranslateAnimList
/* 6F45C 8007EC5C D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 6F460 8007EC60 2400B5AF */  sw         $s5, 0x24($sp)
/* 6F464 8007EC64 21A88000 */  addu       $s5, $a0, $zero
/* 6F468 8007EC68 2800B6AF */  sw         $s6, 0x28($sp)
/* 6F46C 8007EC6C 21B0C000 */  addu       $s6, $a2, $zero
/* 6F470 8007EC70 2C00BFAF */  sw         $ra, 0x2C($sp)
/* 6F474 8007EC74 2000B4AF */  sw         $s4, 0x20($sp)
/* 6F478 8007EC78 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 6F47C 8007EC7C 1800B2AF */  sw         $s2, 0x18($sp)
/* 6F480 8007EC80 1400B1AF */  sw         $s1, 0x14($sp)
/* 6F484 8007EC84 2A00A010 */  beqz       $a1, .L8007ED30
/* 6F488 8007EC88 1000B0AF */   sw        $s0, 0x10($sp)
/* 6F48C 8007EC8C 2198A000 */  addu       $s3, $a1, $zero
/* 6F490 8007EC90 2700C01A */  blez       $s6, .L8007ED30
/* 6F494 8007EC94 21900000 */   addu      $s2, $zero, $zero
/* 6F498 8007EC98 07007126 */  addiu      $s1, $s3, 0x7
.L8007EC9C:
/* 6F49C 8007EC9C 05002482 */  lb         $a0, 0x5($s1)
/* 6F4A0 8007ECA0 1000A38E */  lw         $v1, 0x10($s5)
/* 6F4A4 8007ECA4 80100400 */  sll        $v0, $a0, 2
/* 6F4A8 8007ECA8 21104300 */  addu       $v0, $v0, $v1
/* 6F4AC 8007ECAC FFFF0324 */  addiu      $v1, $zero, -0x1
/* 6F4B0 8007ECB0 0000548C */  lw         $s4, 0x0($v0)
/* 6F4B4 8007ECB4 19008310 */  beq        $a0, $v1, .L8007ED1C
/* 6F4B8 8007ECB8 00000000 */   nop
/* 6F4BC 8007ECBC 2120A002 */  addu       $a0, $s5, $zero
/* 6F4C0 8007ECC0 BDFA010C */  jal        AnimDistanceAndVel
/* 6F4C4 8007ECC4 21286002 */   addu      $a1, $s3, $zero
/* 6F4C8 8007ECC8 00003092 */  lbu        $s0, 0x0($s1)
/* 6F4CC 8007ECCC D33F020C */  jal        G2AnimKeylist_GetDuration
/* 6F4D0 8007ECD0 21208002 */   addu      $a0, $s4, $zero
/* 6F4D4 8007ECD4 EB51043C */  lui        $a0, (0x51EB851F >> 16)
/* 6F4D8 8007ECD8 1F858434 */  ori        $a0, $a0, (0x51EB851F & 0xFFFF)
/* 6F4DC 8007ECDC 00140200 */  sll        $v0, $v0, 16
/* 6F4E0 8007ECE0 031C0200 */  sra        $v1, $v0, 16
/* 6F4E4 8007ECE4 18006400 */  mult       $v1, $a0
/* 6F4E8 8007ECE8 C3170200 */  sra        $v0, $v0, 31
/* 6F4EC 8007ECEC 10380000 */  mfhi       $a3
/* 6F4F0 8007ECF0 43190700 */  sra        $v1, $a3, 5
/* 6F4F4 8007ECF4 23186200 */  subu       $v1, $v1, $v0
/* 6F4F8 8007ECF8 001C0300 */  sll        $v1, $v1, 16
/* 6F4FC 8007ECFC 031C0300 */  sra        $v1, $v1, 16
/* 6F500 8007ED00 2A800302 */  slt        $s0, $s0, $v1
/* 6F504 8007ED04 05000016 */  bnez       $s0, .L8007ED1C
/* 6F508 8007ED08 00000000 */   nop
/* 6F50C 8007ED0C DD3F020C */  jal        G2AnimKeylist_GetKeyframeCount
/* 6F510 8007ED10 21208002 */   addu      $a0, $s4, $zero
/* 6F514 8007ED14 FFFF4224 */  addiu      $v0, $v0, -0x1
/* 6F518 8007ED18 000022A2 */  sb         $v0, 0x0($s1)
.L8007ED1C:
/* 6F51C 8007ED1C 01005226 */  addiu      $s2, $s2, 0x1
/* 6F520 8007ED20 10003126 */  addiu      $s1, $s1, 0x10
/* 6F524 8007ED24 2A105602 */  slt        $v0, $s2, $s6
/* 6F528 8007ED28 DCFF4014 */  bnez       $v0, .L8007EC9C
/* 6F52C 8007ED2C 10007326 */   addiu     $s3, $s3, 0x10
.L8007ED30:
/* 6F530 8007ED30 2C00BF8F */  lw         $ra, 0x2C($sp)
/* 6F534 8007ED34 2800B68F */  lw         $s6, 0x28($sp)
/* 6F538 8007ED38 2400B58F */  lw         $s5, 0x24($sp)
/* 6F53C 8007ED3C 2000B48F */  lw         $s4, 0x20($sp)
/* 6F540 8007ED40 1C00B38F */  lw         $s3, 0x1C($sp)
/* 6F544 8007ED44 1800B28F */  lw         $s2, 0x18($sp)
/* 6F548 8007ED48 1400B18F */  lw         $s1, 0x14($sp)
/* 6F54C 8007ED4C 1000B08F */  lw         $s0, 0x10($sp)
/* 6F550 8007ED50 0800E003 */  jr         $ra
/* 6F554 8007ED54 3000BD27 */   addiu     $sp, $sp, 0x30
.size TranslateAnimList, . - TranslateAnimList
