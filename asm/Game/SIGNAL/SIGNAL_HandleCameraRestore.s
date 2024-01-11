.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SIGNAL_HandleCameraRestore
/* E570 8001DD70 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* E574 8001DD74 1000BFAF */  sw         $ra, 0x10($sp)
/* E578 8001DD78 0400A58C */  lw         $a1, 0x4($a1)
/* E57C 8001DD7C 90AC8427 */  addiu      $a0, $gp, %gp_rel(theCamera)
/* E580 8001DD80 4956000C */  jal        CAMERA_Restore
/* E584 8001DD84 00000000 */   nop
/* E588 8001DD88 1000BF8F */  lw         $ra, 0x10($sp)
/* E58C 8001DD8C 01000224 */  addiu      $v0, $zero, 0x1
/* E590 8001DD90 0800E003 */  jr         $ra
/* E594 8001DD94 1800BD27 */   addiu     $sp, $sp, 0x18
.size SIGNAL_HandleCameraRestore, . - SIGNAL_HandleCameraRestore
