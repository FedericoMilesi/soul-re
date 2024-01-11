.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_MORPH_Relocate
/* 4EC98 8005E498 3CCB80AF */  sw         $zero, %gp_rel(MORPH_SavedFace)($gp)
/* 4EC9C 8005E49C 2CC780AF */  sw         $zero, %gp_rel(MORPH_SavedLevel)($gp)
/* 4ECA0 8005E4A0 0800E003 */  jr         $ra
/* 4ECA4 8005E4A4 00000000 */   nop
.size STREAM_MORPH_Relocate, . - STREAM_MORPH_Relocate
