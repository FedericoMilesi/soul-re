.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel UNDERWORLD_DisplayFrame
/* A53DC 800B4BDC C0FFBD27 */  addiu      $sp, $sp, -0x40
/* A53E0 800B4BE0 3400B7AF */  sw         $s7, 0x34($sp)
/* A53E4 800B4BE4 21B8A000 */  addu       $s7, $a1, $zero
/* A53E8 800B4BE8 21288000 */  addu       $a1, $a0, $zero
/* A53EC 800B4BEC 3800BEAF */  sw         $fp, 0x38($sp)
/* A53F0 800B4BF0 2800BE24 */  addiu      $fp, $a1, 0x28
/* A53F4 800B4BF4 FF00023C */  lui        $v0, (0xFFFFFF >> 16)
/* A53F8 800B4BF8 FFFF4234 */  ori        $v0, $v0, (0xFFFFFF & 0xFFFF)
/* A53FC 800B4BFC 2C00B5AF */  sw         $s5, 0x2C($sp)
/* A5400 800B4C00 21A80000 */  addu       $s5, $zero, $zero
/* A5404 800B4C04 3000B6AF */  sw         $s6, 0x30($sp)
/* A5408 800B4C08 21B0A002 */  addu       $s6, $s5, $zero
/* A540C 800B4C0C 3C00BFAF */  sw         $ra, 0x3C($sp)
/* A5410 800B4C10 2800B4AF */  sw         $s4, 0x28($sp)
/* A5414 800B4C14 2400B3AF */  sw         $s3, 0x24($sp)
/* A5418 800B4C18 2000B2AF */  sw         $s2, 0x20($sp)
/* A541C 800B4C1C 1C00B1AF */  sw         $s1, 0x1C($sp)
/* A5420 800B4C20 1800B0AF */  sw         $s0, 0x18($sp)
/* A5424 800B4C24 0000A2AC */  sw         $v0, 0x0($a1)
.L800B4C28:
/* A5428 800B4C28 21800000 */  addu       $s0, $zero, $zero
/* A542C 800B4C2C 2110D002 */  addu       $v0, $s6, $s0
.L800B4C30:
/* A5430 800B4C30 2CA8848F */  lw         $a0, %gp_rel(ScreenMorphArray)($gp)
/* A5434 800B4C34 C0100200 */  sll        $v0, $v0, 3
/* A5438 800B4C38 08004324 */  addiu      $v1, $v0, 0x8
/* A543C 800B4C3C 21908200 */  addu       $s2, $a0, $v0
/* A5440 800B4C40 21888300 */  addu       $s1, $a0, $v1
/* A5444 800B4C44 20004324 */  addiu      $v1, $v0, 0x20
/* A5448 800B4C48 21988300 */  addu       $s3, $a0, $v1
/* A544C 800B4C4C 18004224 */  addiu      $v0, $v0, 0x18
/* A5450 800B4C50 0400A01E */  bgtz       $s5, .L800B4C64
/* A5454 800B4C54 21A08200 */   addu      $s4, $a0, $v0
/* A5458 800B4C58 0200022A */  slti       $v0, $s0, 0x2
/* A545C 800B4C5C 06004010 */  beqz       $v0, .L800B4C78
/* A5460 800B4C60 2120A000 */   addu      $a0, $a1, $zero
.L800B4C64:
/* A5464 800B4C64 0200A22A */  slti       $v0, $s5, 0x2
/* A5468 800B4C68 0B004014 */  bnez       $v0, .L800B4C98
/* A546C 800B4C6C 2120A000 */   addu      $a0, $a1, $zero
/* A5470 800B4C70 0900001E */  bgtz       $s0, .L800B4C98
/* A5474 800B4C74 00000000 */   nop
.L800B4C78:
/* A5478 800B4C78 21284002 */  addu       $a1, $s2, $zero
/* A547C 800B4C7C 21302002 */  addu       $a2, $s1, $zero
/* A5480 800B4C80 21388002 */  addu       $a3, $s4, $zero
/* A5484 800B4C84 99D2020C */  jal        UNDERWORLD_Poly
/* A5488 800B4C88 1000B7AF */   sw        $s7, 0x10($sp)
/* A548C 800B4C8C 21204000 */  addu       $a0, $v0, $zero
/* A5490 800B4C90 2DD30208 */  j          .L800B4CB4
/* A5494 800B4C94 21282002 */   addu      $a1, $s1, $zero
.L800B4C98:
/* A5498 800B4C98 21284002 */  addu       $a1, $s2, $zero
/* A549C 800B4C9C 21302002 */  addu       $a2, $s1, $zero
/* A54A0 800B4CA0 21386002 */  addu       $a3, $s3, $zero
/* A54A4 800B4CA4 99D2020C */  jal        UNDERWORLD_Poly
/* A54A8 800B4CA8 1000B7AF */   sw        $s7, 0x10($sp)
/* A54AC 800B4CAC 21204000 */  addu       $a0, $v0, $zero
/* A54B0 800B4CB0 21284002 */  addu       $a1, $s2, $zero
.L800B4CB4:
/* A54B4 800B4CB4 21306002 */  addu       $a2, $s3, $zero
/* A54B8 800B4CB8 21388002 */  addu       $a3, $s4, $zero
/* A54BC 800B4CBC 99D2020C */  jal        UNDERWORLD_Poly
/* A54C0 800B4CC0 1000B7AF */   sw        $s7, 0x10($sp)
/* A54C4 800B4CC4 21284000 */  addu       $a1, $v0, $zero
/* A54C8 800B4CC8 01001026 */  addiu      $s0, $s0, 0x1
/* A54CC 800B4CCC 0200022A */  slti       $v0, $s0, 0x2
/* A54D0 800B4CD0 D7FF4014 */  bnez       $v0, .L800B4C30
/* A54D4 800B4CD4 2110D002 */   addu      $v0, $s6, $s0
/* A54D8 800B4CD8 0100B526 */  addiu      $s5, $s5, 0x1
/* A54DC 800B4CDC 0200A22A */  slti       $v0, $s5, 0x2
/* A54E0 800B4CE0 D1FF4014 */  bnez       $v0, .L800B4C28
/* A54E4 800B4CE4 0300D626 */   addiu     $s6, $s6, 0x3
/* A54E8 800B4CE8 FF00033C */  lui        $v1, (0xFFFFFF >> 16)
/* A54EC 800B4CEC FFFF6334 */  ori        $v1, $v1, (0xFFFFFF & 0xFFFF)
/* A54F0 800B4CF0 0000C28F */  lw         $v0, 0x0($fp)
/* A54F4 800B4CF4 2120A000 */  addu       $a0, $a1, $zero
/* A54F8 800B4CF8 25104300 */  or         $v0, $v0, $v1
/* A54FC 800B4CFC 1CEA020C */  jal        func_800BA870
/* A5500 800B4D00 0000C2AF */   sw        $v0, 0x0($fp)
/* A5504 800B4D04 3C00BF8F */  lw         $ra, 0x3C($sp)
/* A5508 800B4D08 3800BE8F */  lw         $fp, 0x38($sp)
/* A550C 800B4D0C 3400B78F */  lw         $s7, 0x34($sp)
/* A5510 800B4D10 3000B68F */  lw         $s6, 0x30($sp)
/* A5514 800B4D14 2C00B58F */  lw         $s5, 0x2C($sp)
/* A5518 800B4D18 2800B48F */  lw         $s4, 0x28($sp)
/* A551C 800B4D1C 2400B38F */  lw         $s3, 0x24($sp)
/* A5520 800B4D20 2000B28F */  lw         $s2, 0x20($sp)
/* A5524 800B4D24 1C00B18F */  lw         $s1, 0x1C($sp)
/* A5528 800B4D28 1800B08F */  lw         $s0, 0x18($sp)
/* A552C 800B4D2C 0800E003 */  jr         $ra
/* A5530 800B4D30 4000BD27 */   addiu     $sp, $sp, 0x40
.size UNDERWORLD_DisplayFrame, . - UNDERWORLD_DisplayFrame
