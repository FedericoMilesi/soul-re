.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel TransMatrix
/* AFEC4 800BF6C4 0000A88C */  lw         $t0, 0x0($a1)
/* AFEC8 800BF6C8 0400A98C */  lw         $t1, 0x4($a1)
/* AFECC 800BF6CC 0800AA8C */  lw         $t2, 0x8($a1)
/* AFED0 800BF6D0 140088AC */  sw         $t0, 0x14($a0)
/* AFED4 800BF6D4 180089AC */  sw         $t1, 0x18($a0)
/* AFED8 800BF6D8 1C008AAC */  sw         $t2, 0x1C($a0)
/* AFEDC 800BF6DC 21108000 */  addu       $v0, $a0, $zero
/* AFEE0 800BF6E0 0800E003 */  jr         $ra
/* AFEE4 800BF6E4 00000000 */   nop
/* AFEE8 800BF6E8 00000000 */  nop
/* AFEEC 800BF6EC 00000000 */  nop
/* AFEF0 800BF6F0 00000000 */  nop
.size TransMatrix, . - TransMatrix
