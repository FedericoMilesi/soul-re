.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2AnimSection_SetNotRewinding
/* 809D8 800901D8 00008290 */  lbu        $v0, 0x0($a0)
/* 809DC 800901DC 00000000 */  nop
/* 809E0 800901E0 FB004230 */  andi       $v0, $v0, 0xFB
/* 809E4 800901E4 0800E003 */  jr         $ra
/* 809E8 800901E8 000082A0 */   sb        $v0, 0x0($a0)
.size G2AnimSection_SetNotRewinding, . - G2AnimSection_SetNotRewinding
