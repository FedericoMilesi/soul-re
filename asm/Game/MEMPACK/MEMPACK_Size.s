.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MEMPACK_Size
/* 40DE0 800505E0 FCFF828C */  lw         $v0, -0x4($a0)
/* 40DE4 800505E4 0800E003 */  jr         $ra
/* 40DE8 800505E8 F8FF4224 */   addiu     $v0, $v0, -0x8
.size MEMPACK_Size, . - MEMPACK_Size
