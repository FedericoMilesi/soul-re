.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ExecuteFollow
/* 60548 8006FD48 6C01858C */  lw         $a1, 0x16C($a0)
/* 6054C 8006FD4C 00000000 */  nop
/* 60550 8006FD50 0800A68C */  lw         $a2, 0x8($a1)
/* 60554 8006FD54 1A00A284 */  lh         $v0, 0x1A($a1)
/* 60558 8006FD58 4000C38C */  lw         $v1, 0x40($a2)
/* 6055C 8006FD5C 40110200 */  sll        $v0, $v0, 5
/* 60560 8006FD60 21104300 */  addu       $v0, $v0, $v1
/* 60564 8006FD64 14004294 */  lhu        $v0, 0x14($v0)
/* 60568 8006FD68 0E00A394 */  lhu        $v1, 0xE($a1)
/* 6056C 8006FD6C 00000000 */  nop
/* 60570 8006FD70 21104300 */  addu       $v0, $v0, $v1
/* 60574 8006FD74 5C0082A4 */  sh         $v0, 0x5C($a0)
/* 60578 8006FD78 1A00A284 */  lh         $v0, 0x1A($a1)
/* 6057C 8006FD7C 4000C38C */  lw         $v1, 0x40($a2)
/* 60580 8006FD80 40110200 */  sll        $v0, $v0, 5
/* 60584 8006FD84 21104300 */  addu       $v0, $v0, $v1
/* 60588 8006FD88 18004294 */  lhu        $v0, 0x18($v0)
/* 6058C 8006FD8C 1000A394 */  lhu        $v1, 0x10($a1)
/* 60590 8006FD90 00000000 */  nop
/* 60594 8006FD94 21104300 */  addu       $v0, $v0, $v1
/* 60598 8006FD98 0800E003 */  jr         $ra
/* 6059C 8006FD9C 5E0082A4 */   sh        $v0, 0x5E($a0)
.size ExecuteFollow, . - ExecuteFollow
