.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel musicFadeoutReturnFunc
/* 31128 80040928 30C3828F */  lw         $v0, %gp_rel(musicInfo + 0x4)($gp)
/* 3112C 8004092C 00000000 */  nop
/* 31130 80040930 2CC382AF */  sw         $v0, %gp_rel(musicInfo)($gp)
/* 31134 80040934 0800E003 */  jr         $ra
/* 31138 80040938 00000000 */   nop
.size musicFadeoutReturnFunc, . - musicFadeoutReturnFunc
