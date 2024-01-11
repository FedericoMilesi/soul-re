.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel COLLIDE_GetBSPTreeFlag
/* 15600 80024E00 2E008584 */  lh         $a1, 0x2E($a0)
/* 15604 80024E04 0000828C */  lw         $v0, 0x0($a0)
/* 15608 80024E08 C0180500 */  sll        $v1, $a1, 3
/* 1560C 80024E0C 0000428C */  lw         $v0, 0x0($v0)
/* 15610 80024E10 21186500 */  addu       $v1, $v1, $a1
/* 15614 80024E14 4800428C */  lw         $v0, 0x48($v0)
/* 15618 80024E18 80180300 */  sll        $v1, $v1, 2
/* 1561C 80024E1C 21104300 */  addu       $v0, $v0, $v1
/* 15620 80024E20 0800E003 */  jr         $ra
/* 15624 80024E24 12004224 */   addiu     $v0, $v0, 0x12
.size COLLIDE_GetBSPTreeFlag, . - COLLIDE_GetBSPTreeFlag
