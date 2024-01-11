.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_SetGlowFades
/* 3BE78 8004B678 40110500 */  sll        $v0, $a1, 5
/* 3BE7C 8004B67C 21104500 */  addu       $v0, $v0, $a1
/* 3BE80 8004B680 280082A4 */  sh         $v0, 0x28($a0)
/* 3BE84 8004B684 40110600 */  sll        $v0, $a2, 5
/* 3BE88 8004B688 21104600 */  addu       $v0, $v0, $a2
/* 3BE8C 8004B68C 0800E003 */  jr         $ra
/* 3BE90 8004B690 2A0082A4 */   sh        $v0, 0x2A($a0)
.size FX_SetGlowFades, . - FX_SetGlowFades
