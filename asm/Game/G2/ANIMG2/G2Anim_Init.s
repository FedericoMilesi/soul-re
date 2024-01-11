.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2Anim_Init
/* 833A4 80092BA4 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 833A8 80092BA8 1000B0AF */  sw         $s0, 0x10($sp)
/* 833AC 80092BAC 21808000 */  addu       $s0, $a0, $zero
/* 833B0 80092BB0 1400B1AF */  sw         $s1, 0x14($sp)
/* 833B4 80092BB4 2188A000 */  addu       $s1, $a1, $zero
/* 833B8 80092BB8 01000224 */  addiu      $v0, $zero, 0x1
/* 833BC 80092BBC 18000426 */  addiu      $a0, $s0, 0x18
/* 833C0 80092BC0 21280000 */  addu       $a1, $zero, $zero
/* 833C4 80092BC4 9C000624 */  addiu      $a2, $zero, 0x9C
/* 833C8 80092BC8 1800BFAF */  sw         $ra, 0x18($sp)
/* 833CC 80092BCC 000002A2 */  sb         $v0, 0x0($s0)
/* 833D0 80092BD0 010000A2 */  sb         $zero, 0x1($s0)
/* 833D4 80092BD4 020000A6 */  sh         $zero, 0x2($s0)
/* 833D8 80092BD8 040000A6 */  sh         $zero, 0x4($s0)
/* 833DC 80092BDC 140000AE */  sw         $zero, 0x14($s0)
/* 833E0 80092BE0 2EF2020C */  jal        memset
/* 833E4 80092BE4 100011AE */   sw        $s1, 0x10($s0)
/* 833E8 80092BE8 21200000 */  addu       $a0, $zero, $zero
/* 833EC 80092BEC FFFF0624 */  addiu      $a2, $zero, -0x1
/* 833F0 80092BF0 00100524 */  addiu      $a1, $zero, 0x1000
/* 833F4 80092BF4 24000324 */  addiu      $v1, $zero, 0x24
.L80092BF8:
/* 833F8 80092BF8 21100302 */  addu       $v0, $s0, $v1
/* 833FC 80092BFC 01008424 */  addiu      $a0, $a0, 0x1
/* 83400 80092C00 060046A4 */  sh         $a2, 0x6($v0)
/* 83404 80092C04 0C0040AC */  sw         $zero, 0xC($v0)
/* 83408 80092C08 100045AC */  sw         $a1, 0x10($v0)
/* 8340C 80092C0C 03008228 */  slti       $v0, $a0, 0x3
/* 83410 80092C10 F9FF4014 */  bnez       $v0, .L80092BF8
/* 83414 80092C14 30006324 */   addiu     $v1, $v1, 0x30
/* 83418 80092C18 18002292 */  lbu        $v0, 0x18($s1)
/* 8341C 80092C1C 00000000 */  nop
/* 83420 80092C20 270002A2 */  sb         $v0, 0x27($s0)
/* 83424 80092C24 1800BF8F */  lw         $ra, 0x18($sp)
/* 83428 80092C28 1400B18F */  lw         $s1, 0x14($sp)
/* 8342C 80092C2C 1000B08F */  lw         $s0, 0x10($sp)
/* 83430 80092C30 0800E003 */  jr         $ra
/* 83434 80092C34 2000BD27 */   addiu     $sp, $sp, 0x20
.size G2Anim_Init, . - G2Anim_Init
