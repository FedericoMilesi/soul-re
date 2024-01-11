.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2Anim_GetElapsedTime
/* 80350 8008FB50 01008390 */  lbu        $v1, 0x1($a0)
/* 80354 8008FB54 00000000 */  nop
/* 80358 8008FB58 40100300 */  sll        $v0, $v1, 1
/* 8035C 8008FB5C 21104300 */  addu       $v0, $v0, $v1
/* 80360 8008FB60 00110200 */  sll        $v0, $v0, 4
/* 80364 8008FB64 21104400 */  addu       $v0, $v0, $a0
/* 80368 8008FB68 28004284 */  lh         $v0, 0x28($v0)
/* 8036C 8008FB6C 0800E003 */  jr         $ra
/* 80370 8008FB70 00000000 */   nop
.size G2Anim_GetElapsedTime, . - G2Anim_GetElapsedTime
