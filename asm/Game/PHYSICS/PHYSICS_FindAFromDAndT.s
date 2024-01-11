.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PHYSICS_FindAFromDAndT
/* 684A8 80077CA8 0C00A010 */  beqz       $a1, .L80077CDC
/* 684AC 80077CAC 1800A500 */   mult      $a1, $a1
/* 684B0 80077CB0 12300000 */  mflo       $a2
/* 684B4 80077CB4 40130400 */  sll        $v0, $a0, 13
/* 684B8 80077CB8 00000000 */  nop
/* 684BC 80077CBC 1A004600 */  div        $zero, $v0, $a2
/* 684C0 80077CC0 12280000 */  mflo       $a1
/* 684C4 80077CC4 00000000 */  nop
/* 684C8 80077CC8 0200A104 */  bgez       $a1, .L80077CD4
/* 684CC 80077CCC 00000000 */   nop
/* 684D0 80077CD0 FF0FA524 */  addiu      $a1, $a1, 0xFFF
.L80077CD4:
/* 684D4 80077CD4 0800E003 */  jr         $ra
/* 684D8 80077CD8 03130500 */   sra       $v0, $a1, 12
.L80077CDC:
/* 684DC 80077CDC 0800E003 */  jr         $ra
/* 684E0 80077CE0 21100000 */   addu      $v0, $zero, $zero
.size PHYSICS_FindAFromDAndT, . - PHYSICS_FindAFromDAndT
