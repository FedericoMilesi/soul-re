.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PHYSICS_GenericLineCheck
/* 68890 80078090 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 68894 80078094 3F000224 */  addiu      $v0, $zero, 0x3F
/* 68898 80078098 1000BFAF */  sw         $ra, 0x10($sp)
/* 6889C 8007809C 2DE0010C */  jal        PHYSICS_GenericLineCheckMask
/* 688A0 800780A0 2400E2AC */   sw        $v0, 0x24($a3)
/* 688A4 800780A4 1000BF8F */  lw         $ra, 0x10($sp)
/* 688A8 800780A8 00000000 */  nop
/* 688AC 800780AC 0800E003 */  jr         $ra
/* 688B0 800780B0 1800BD27 */   addiu     $sp, $sp, 0x18
.size PHYSICS_GenericLineCheck, . - PHYSICS_GenericLineCheck
