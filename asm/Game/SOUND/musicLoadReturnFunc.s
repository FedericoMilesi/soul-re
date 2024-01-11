.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel musicLoadReturnFunc
/* 31114 80040914 30C3828F */  lw         $v0, %gp_rel(musicInfo + 0x4)($gp)
/* 31118 80040918 34C385AF */  sw         $a1, %gp_rel(musicInfo + 0x8)($gp)
/* 3111C 8004091C 2CC382AF */  sw         $v0, %gp_rel(musicInfo)($gp)
/* 31120 80040920 0800E003 */  jr         $ra
/* 31124 80040924 00000000 */   nop
.size musicLoadReturnFunc, . - musicLoadReturnFunc
