.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel INSTANCE_Linked
/* 26094 80035894 4801828C */  lw         $v0, 0x148($a0)
/* 26098 80035898 00000000 */  nop
/* 2609C 8003589C 0A004010 */  beqz       $v0, .L800358C8
/* 260A0 800358A0 00000000 */   nop
.L800358A4:
/* 260A4 800358A4 4801848C */  lw         $a0, 0x148($a0)
/* 260A8 800358A8 00000000 */  nop
/* 260AC 800358AC 4801828C */  lw         $v0, 0x148($a0)
/* 260B0 800358B0 00000000 */  nop
/* 260B4 800358B4 04004010 */  beqz       $v0, .L800358C8
/* 260B8 800358B8 00000000 */   nop
/* 260BC 800358BC 29D60008 */  j          .L800358A4
/* 260C0 800358C0 00000000 */   nop
.L800358C4:
/* 260C4 800358C4 4801A58C */  lw         $a1, 0x148($a1)
.L800358C8:
/* 260C8 800358C8 00000000 */  nop
/* 260CC 800358CC 4801A28C */  lw         $v0, 0x148($a1)
/* 260D0 800358D0 00000000 */  nop
/* 260D4 800358D4 FBFF4014 */  bnez       $v0, .L800358C4
/* 260D8 800358D8 26108500 */   xor       $v0, $a0, $a1
/* 260DC 800358DC 0800E003 */  jr         $ra
/* 260E0 800358E0 0100422C */   sltiu     $v0, $v0, 0x1
.size INSTANCE_Linked, . - INSTANCE_Linked
