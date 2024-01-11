.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2AnimSection_SetPaused
/* 809EC 800901EC 00008290 */  lbu        $v0, 0x0($a0)
/* 809F0 800901F0 00000000 */  nop
/* 809F4 800901F4 01004234 */  ori        $v0, $v0, 0x1
/* 809F8 800901F8 0800E003 */  jr         $ra
/* 809FC 800901FC 000082A0 */   sb        $v0, 0x0($a0)
.size G2AnimSection_SetPaused, . - G2AnimSection_SetPaused
