.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SIGNAL_HandleCameraMode
/* E480 8001DC80 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* E484 8001DC84 1000BFAF */  sw         $ra, 0x10($sp)
/* E488 8001DC88 0400A58C */  lw         $a1, 0x4($a1)
/* E48C 8001DC8C 90AC8427 */  addiu      $a0, $gp, %gp_rel(theCamera)
/* E490 8001DC90 8F56000C */  jal        CAMERA_SetMode
/* E494 8001DC94 00000000 */   nop
/* E498 8001DC98 1000BF8F */  lw         $ra, 0x10($sp)
/* E49C 8001DC9C 01000224 */  addiu      $v0, $zero, 0x1
/* E4A0 8001DCA0 0800E003 */  jr         $ra
/* E4A4 8001DCA4 1800BD27 */   addiu     $sp, $sp, 0x18
.size SIGNAL_HandleCameraMode, . - SIGNAL_HandleCameraMode
