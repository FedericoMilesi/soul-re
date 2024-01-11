.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SIGNAL_HandleCameraSave
/* E548 8001DD48 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* E54C 8001DD4C 1000BFAF */  sw         $ra, 0x10($sp)
/* E550 8001DD50 0400A58C */  lw         $a1, 0x4($a1)
/* E554 8001DD54 90AC8427 */  addiu      $a0, $gp, %gp_rel(theCamera)
/* E558 8001DD58 1556000C */  jal        CAMERA_Save
/* E55C 8001DD5C 00000000 */   nop
/* E560 8001DD60 1000BF8F */  lw         $ra, 0x10($sp)
/* E564 8001DD64 01000224 */  addiu      $v0, $zero, 0x1
/* E568 8001DD68 0800E003 */  jr         $ra
/* E56C 8001DD6C 1800BD27 */   addiu     $sp, $sp, 0x18
.size SIGNAL_HandleCameraSave, . - SIGNAL_HandleCameraSave
