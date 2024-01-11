.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_CenterCamera
/* C2B8 8001BAB8 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* C2BC 8001BABC 1400B1AF */  sw         $s1, 0x14($sp)
/* C2C0 8001BAC0 21888000 */  addu       $s1, $a0, $zero
/* C2C4 8001BAC4 1800BFAF */  sw         $ra, 0x18($sp)
/* C2C8 8001BAC8 1000B0AF */  sw         $s0, 0x10($sp)
/* C2CC 8001BACC 9C04228E */  lw         $v0, 0x49C($s1)
/* C2D0 8001BAD0 0002033C */  lui        $v1, (0x2000000 >> 16)
/* C2D4 8001BAD4 24104300 */  and        $v0, $v0, $v1
/* C2D8 8001BAD8 21004010 */  beqz       $v0, .L8001BB60
/* C2DC 8001BADC 00000000 */   nop
/* C2E0 8001BAE0 0801228E */  lw         $v0, 0x108($s1)
/* C2E4 8001BAE4 00000000 */  nop
/* C2E8 8001BAE8 78004594 */  lhu        $a1, 0x78($v0)
/* C2EC 8001BAEC 40012486 */  lh         $a0, 0x140($s1)
/* C2F0 8001BAF0 0004A524 */  addiu      $a1, $a1, 0x400
/* C2F4 8001BAF4 002C0500 */  sll        $a1, $a1, 16
/* C2F8 8001BAF8 BC59000C */  jal        CAMERA_AngleDifference
/* C2FC 8001BAFC 032C0500 */   sra       $a1, $a1, 16
/* C300 8001BB00 00840200 */  sll        $s0, $v0, 16
/* C304 8001BB04 0801238E */  lw         $v1, 0x108($s1)
/* C308 8001BB08 03841000 */  sra        $s0, $s0, 16
/* C30C 8001BB0C 78006594 */  lhu        $a1, 0x78($v1)
/* C310 8001BB10 40012486 */  lh         $a0, 0x140($s1)
/* C314 8001BB14 00FCA524 */  addiu      $a1, $a1, -0x400
/* C318 8001BB18 002C0500 */  sll        $a1, $a1, 16
/* C31C 8001BB1C BC59000C */  jal        CAMERA_AngleDifference
/* C320 8001BB20 032C0500 */   sra       $a1, $a1, 16
/* C324 8001BB24 00140200 */  sll        $v0, $v0, 16
/* C328 8001BB28 03140200 */  sra        $v0, $v0, 16
/* C32C 8001BB2C 2A800202 */  slt        $s0, $s0, $v0
/* C330 8001BB30 06000012 */  beqz       $s0, .L8001BB4C
/* C334 8001BB34 00000000 */   nop
/* C338 8001BB38 0801228E */  lw         $v0, 0x108($s1)
/* C33C 8001BB3C 00000000 */  nop
/* C340 8001BB40 78004294 */  lhu        $v0, 0x78($v0)
/* C344 8001BB44 DD6E0008 */  j          .L8001BB74
/* C348 8001BB48 00044224 */   addiu     $v0, $v0, 0x400
.L8001BB4C:
/* C34C 8001BB4C 0801228E */  lw         $v0, 0x108($s1)
/* C350 8001BB50 00000000 */  nop
/* C354 8001BB54 78004294 */  lhu        $v0, 0x78($v0)
/* C358 8001BB58 DD6E0008 */  j          .L8001BB74
/* C35C 8001BB5C 00FC4224 */   addiu     $v0, $v0, -0x400
.L8001BB60:
/* C360 8001BB60 0801228E */  lw         $v0, 0x108($s1)
/* C364 8001BB64 00000000 */  nop
/* C368 8001BB68 78004294 */  lhu        $v0, 0x78($v0)
/* C36C 8001BB6C 00000000 */  nop
/* C370 8001BB70 00084224 */  addiu      $v0, $v0, 0x800
.L8001BB74:
/* C374 8001BB74 DCAB82A7 */  sh         $v0, %gp_rel(CenterFlag)($gp)
/* C378 8001BB78 DCAB8297 */  lhu        $v0, %gp_rel(CenterFlag)($gp)
/* C37C 8001BB7C 780120A6 */  sh         $zero, 0x178($s1)
/* C380 8001BB80 700120A6 */  sh         $zero, 0x170($s1)
/* C384 8001BB84 1800BF8F */  lw         $ra, 0x18($sp)
/* C388 8001BB88 1400B18F */  lw         $s1, 0x14($sp)
/* C38C 8001BB8C 1000B08F */  lw         $s0, 0x10($sp)
/* C390 8001BB90 FF0F4230 */  andi       $v0, $v0, 0xFFF
/* C394 8001BB94 DCAB82A7 */  sh         $v0, %gp_rel(CenterFlag)($gp)
/* C398 8001BB98 0800E003 */  jr         $ra
/* C39C 8001BB9C 2000BD27 */   addiu     $sp, $sp, 0x20
.size CAMERA_CenterCamera, . - CAMERA_CenterCamera
