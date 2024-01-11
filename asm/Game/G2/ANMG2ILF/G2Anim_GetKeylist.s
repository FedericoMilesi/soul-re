.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2Anim_GetKeylist
/* 80374 8008FB74 01008390 */  lbu        $v1, 0x1($a0)
/* 80378 8008FB78 00000000 */  nop
/* 8037C 8008FB7C 40100300 */  sll        $v0, $v1, 1
/* 80380 8008FB80 21104300 */  addu       $v0, $v0, $v1
/* 80384 8008FB84 00110200 */  sll        $v0, $v0, 4
/* 80388 8008FB88 21104400 */  addu       $v0, $v0, $a0
/* 8038C 8008FB8C 4800428C */  lw         $v0, 0x48($v0)
/* 80390 8008FB90 0800E003 */  jr         $ra
/* 80394 8008FB94 00000000 */   nop
.size G2Anim_GetKeylist, . - G2Anim_GetKeylist
