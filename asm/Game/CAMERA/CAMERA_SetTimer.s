.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_SetTimer
/* 75D8 80016DD8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 75DC 80016DDC 1000BFAF */  sw         $ra, 0x10($sp)
/* 75E0 80016DE0 1556000C */  jal        CAMERA_Save
/* 75E4 80016DE4 FFFF0524 */   addiu     $a1, $zero, -0x1
/* 75E8 80016DE8 1000BF8F */  lw         $ra, 0x10($sp)
/* 75EC 80016DEC 00000000 */  nop
/* 75F0 80016DF0 0800E003 */  jr         $ra
/* 75F4 80016DF4 1800BD27 */   addiu     $sp, $sp, 0x18
.size CAMERA_SetTimer, . - CAMERA_SetTimer
