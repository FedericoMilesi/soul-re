.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadWaitForSramTransferComplete
/* 44C84 80054484 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 44C88 80054488 1000B0AF */  sw         $s0, 0x10($sp)
/* 44C8C 8005448C 0100103C */  lui        $s0, (0x186A0 >> 16)
/* 44C90 80054490 A0861036 */  ori        $s0, $s0, (0x186A0 & 0xFFFF)
/* 44C94 80054494 1400BFAF */  sw         $ra, 0x14($sp)
.L80054498:
/* 44C98 80054498 79FC020C */  jal        SpuIsTransferCompleted
/* 44C9C 8005449C 21200000 */   addu      $a0, $zero, $zero
/* 44CA0 800544A0 04004014 */  bnez       $v0, .L800544B4
/* 44CA4 800544A4 01000224 */   addiu     $v0, $zero, 0x1
/* 44CA8 800544A8 FFFF1026 */  addiu      $s0, $s0, -0x1
/* 44CAC 800544AC FAFF0016 */  bnez       $s0, .L80054498
/* 44CB0 800544B0 21100000 */   addu      $v0, $zero, $zero
.L800544B4:
/* 44CB4 800544B4 1400BF8F */  lw         $ra, 0x14($sp)
/* 44CB8 800544B8 1000B08F */  lw         $s0, 0x10($sp)
/* 44CBC 800544BC 0800E003 */  jr         $ra
/* 44CC0 800544C0 1800BD27 */   addiu     $sp, $sp, 0x18
.size aadWaitForSramTransferComplete, . - aadWaitForSramTransferComplete
