.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel createSfxHandle
/* 47A60 80057260 D89B858F */  lw         $a1, %gp_rel(aadMem)($gp)
/* 47A64 80057264 00000000 */  nop
/* 47A68 80057268 D801A694 */  lhu        $a2, 0x1D8($a1)
/* 47A6C 8005726C 00000000 */  nop
/* 47A70 80057270 0100C224 */  addiu      $v0, $a2, 0x1
/* 47A74 80057274 D801A2A4 */  sh         $v0, 0x1D8($a1)
/* 47A78 80057278 FFFF4230 */  andi       $v0, $v0, 0xFFFF
/* 47A7C 8005727C 03004014 */  bnez       $v0, .L8005728C
/* 47A80 80057280 00000000 */   nop
/* 47A84 80057284 0200C224 */  addiu      $v0, $a2, 0x2
/* 47A88 80057288 D801A2A4 */  sh         $v0, 0x1D8($a1)
.L8005728C:
/* 47A8C 8005728C D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 47A90 80057290 00000000 */  nop
/* 47A94 80057294 D8014294 */  lhu        $v0, 0x1D8($v0)
/* 47A98 80057298 FFFF8330 */  andi       $v1, $a0, 0xFFFF
/* 47A9C 8005729C 00140200 */  sll        $v0, $v0, 16
/* 47AA0 800572A0 0800E003 */  jr         $ra
/* 47AA4 800572A4 25104300 */   or        $v0, $v0, $v1
.size createSfxHandle, . - createSfxHandle
