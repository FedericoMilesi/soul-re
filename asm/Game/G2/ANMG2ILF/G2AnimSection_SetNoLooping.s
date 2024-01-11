.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2AnimSection_SetNoLooping
/* 809C4 800901C4 00008290 */  lbu        $v0, 0x0($a0)
/* 809C8 800901C8 00000000 */  nop
/* 809CC 800901CC FD004230 */  andi       $v0, $v0, 0xFD
/* 809D0 800901D0 0800E003 */  jr         $ra
/* 809D4 800901D4 000082A0 */   sb        $v0, 0x0($a0)
.size G2AnimSection_SetNoLooping, . - G2AnimSection_SetNoLooping
