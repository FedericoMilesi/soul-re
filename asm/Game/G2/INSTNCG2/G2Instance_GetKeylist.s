.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2Instance_GetKeylist
/* 85904 80095104 1C00828C */  lw         $v0, 0x1C($a0)
/* 85908 80095108 00000000 */  nop
/* 8590C 8009510C 1000428C */  lw         $v0, 0x10($v0)
/* 85910 80095110 80280500 */  sll        $a1, $a1, 2
/* 85914 80095114 2128A200 */  addu       $a1, $a1, $v0
/* 85918 80095118 0000A28C */  lw         $v0, 0x0($a1)
/* 8591C 8009511C 0800E003 */  jr         $ra
/* 85920 80095120 00000000 */   nop
.size G2Instance_GetKeylist, . - G2Instance_GetKeylist
