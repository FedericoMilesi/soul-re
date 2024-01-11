.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PHYSICS_CheckLineInWorld
/* 65164 80074964 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 65168 80074968 3F000224 */  addiu      $v0, $zero, 0x3F
/* 6516C 8007496C 1000BFAF */  sw         $ra, 0x10($sp)
/* 65170 80074970 62D2010C */  jal        PHYSICS_CheckLineInWorldMask
/* 65174 80074974 2400A2AC */   sw        $v0, 0x24($a1)
/* 65178 80074978 1000BF8F */  lw         $ra, 0x10($sp)
/* 6517C 8007497C 00000000 */  nop
/* 65180 80074980 0800E003 */  jr         $ra
/* 65184 80074984 1800BD27 */   addiu     $sp, $sp, 0x18
.size PHYSICS_CheckLineInWorld, . - PHYSICS_CheckLineInWorld
