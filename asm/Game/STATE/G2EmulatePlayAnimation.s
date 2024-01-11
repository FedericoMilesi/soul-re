.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2EmulatePlayAnimation
/* 62604 80071E04 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 62608 80071E08 1000BFAF */  sw         $ra, 0x10($sp)
/* 6260C 80071E0C 0000848C */  lw         $a0, 0x0($a0)
/* 62610 80071E10 67C7010C */  jal        G2EmulationInstancePlayAnimation
/* 62614 80071E14 00000000 */   nop
/* 62618 80071E18 1000BF8F */  lw         $ra, 0x10($sp)
/* 6261C 80071E1C 00000000 */  nop
/* 62620 80071E20 0800E003 */  jr         $ra
/* 62624 80071E24 1800BD27 */   addiu     $sp, $sp, 0x18
.size G2EmulatePlayAnimation, . - G2EmulatePlayAnimation
