.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_NextLoadAsNormal
/* 50790 8005FF90 E0A380AF */  sw         $zero, %gp_rel(loadFromHead)($gp)
/* 50794 8005FF94 0800E003 */  jr         $ra
/* 50798 8005FF98 00000000 */   nop
.size STREAM_NextLoadAsNormal, . - STREAM_NextLoadAsNormal
