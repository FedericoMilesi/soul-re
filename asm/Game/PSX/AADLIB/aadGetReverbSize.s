.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadGetReverbSize
/* 44D88 80054588 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 44D8C 8005458C 1000BFAF */  sw         $ra, 0x10($sp)
/* 44D90 80054590 6051010C */  jal        aadGetReverbMode
/* 44D94 80054594 00000000 */   nop
/* 44D98 80054598 80100200 */  sll        $v0, $v0, 2
/* 44D9C 8005459C 5C9C8327 */  addiu      $v1, $gp, %gp_rel(aadReverbModeSize)
/* 44DA0 800545A0 21104300 */  addu       $v0, $v0, $v1
/* 44DA4 800545A4 0000428C */  lw         $v0, 0x0($v0)
/* 44DA8 800545A8 1000BF8F */  lw         $ra, 0x10($sp)
/* 44DAC 800545AC 40004224 */  addiu      $v0, $v0, 0x40
/* 44DB0 800545B0 0800E003 */  jr         $ra
/* 44DB4 800545B4 1800BD27 */   addiu     $sp, $sp, 0x18
.size aadGetReverbSize, . - aadGetReverbSize
