.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_IsCdBusy
/* 509B4 800601B4 04008010 */  beqz       $a0, .L800601C8
/* 509B8 800601B8 00000000 */   nop
/* 509BC 800601BC 4CCB828F */  lw         $v0, %gp_rel(numLoads)($gp)
/* 509C0 800601C0 00000000 */  nop
/* 509C4 800601C4 000082AC */  sw         $v0, 0x0($a0)
.L800601C8:
/* 509C8 800601C8 4CCB828F */  lw         $v0, %gp_rel(numLoads)($gp)
/* 509CC 800601CC 0800E003 */  jr         $ra
/* 509D0 800601D0 00000000 */   nop
.size STREAM_IsCdBusy, . - STREAM_IsCdBusy
