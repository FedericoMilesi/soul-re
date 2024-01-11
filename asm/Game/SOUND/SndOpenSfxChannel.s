.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SndOpenSfxChannel
/* 2F458 8003EC58 21280000 */  addu       $a1, $zero, $zero
/* 2F45C 8003EC5C FF000624 */  addiu      $a2, $zero, 0xFF
/* 2F460 8003EC60 DCC08327 */  addiu      $v1, $gp, %gp_rel(soundEffectChannelTbl)
.L8003EC64:
/* 2F464 8003EC64 00006290 */  lbu        $v0, 0x0($v1)
/* 2F468 8003EC68 00000000 */  nop
/* 2F46C 8003EC6C 06004014 */  bnez       $v0, .L8003EC88
/* 2F470 8003EC70 21106000 */   addu      $v0, $v1, $zero
/* 2F474 8003EC74 000046A0 */  sb         $a2, 0x0($v0)
/* 2F478 8003EC78 180040A4 */  sh         $zero, 0x18($v0)
/* 2F47C 8003EC7C 0A0040A4 */  sh         $zero, 0xA($v0)
/* 2F480 8003EC80 0800E003 */  jr         $ra
/* 2F484 8003EC84 000085A0 */   sb        $a1, 0x0($a0)
.L8003EC88:
/* 2F488 8003EC88 0100A524 */  addiu      $a1, $a1, 0x1
/* 2F48C 8003EC8C 1000A228 */  slti       $v0, $a1, 0x10
/* 2F490 8003EC90 F4FF4014 */  bnez       $v0, .L8003EC64
/* 2F494 8003EC94 24006324 */   addiu     $v1, $v1, 0x24
/* 2F498 8003EC98 0800E003 */  jr         $ra
/* 2F49C 8003EC9C 21100000 */   addu      $v0, $zero, $zero
.size SndOpenSfxChannel, . - SndOpenSfxChannel
