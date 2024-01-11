.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel INSTANCE_GetSplineFrameNumber
/* 23DF0 800335F0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 23DF4 800335F4 1000B0AF */  sw         $s0, 0x10($sp)
/* 23DF8 800335F8 21808000 */  addu       $s0, $a0, $zero
/* 23DFC 800335FC 21300000 */  addu       $a2, $zero, $zero
/* 23E00 80033600 1400BFAF */  sw         $ra, 0x14($sp)
/* 23E04 80033604 96F4000C */  jal        SCRIPT_GetPosSplineDef
/* 23E08 80033608 2138C000 */   addu      $a3, $a2, $zero
/* 23E0C 8003360C 21200002 */  addu       $a0, $s0, $zero
/* 23E10 80033610 53F4000C */  jal        SCRIPT_GetSplineFrameNumber
/* 23E14 80033614 21284000 */   addu      $a1, $v0, $zero
/* 23E18 80033618 1400BF8F */  lw         $ra, 0x14($sp)
/* 23E1C 8003361C 1000B08F */  lw         $s0, 0x10($sp)
/* 23E20 80033620 0800E003 */  jr         $ra
/* 23E24 80033624 1800BD27 */   addiu     $sp, $sp, 0x18
.size INSTANCE_GetSplineFrameNumber, . - INSTANCE_GetSplineFrameNumber
