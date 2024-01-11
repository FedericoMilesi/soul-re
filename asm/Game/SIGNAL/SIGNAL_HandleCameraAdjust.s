.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SIGNAL_HandleCameraAdjust
/* E414 8001DC14 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* E418 8001DC18 1000BFAF */  sw         $ra, 0x10($sp)
/* E41C 8001DC1C 0400A58C */  lw         $a1, 0x4($a1)
/* E420 8001DC20 90AC8427 */  addiu      $a0, $gp, %gp_rel(theCamera)
/* E424 8001DC24 EE5B000C */  jal        CAMERA_Adjust
/* E428 8001DC28 00000000 */   nop
/* E42C 8001DC2C 1000BF8F */  lw         $ra, 0x10($sp)
/* E430 8001DC30 01000224 */  addiu      $v0, $zero, 0x1
/* E434 8001DC34 0800E003 */  jr         $ra
/* E438 8001DC38 1800BD27 */   addiu     $sp, $sp, 0x18
.size SIGNAL_HandleCameraAdjust, . - SIGNAL_HandleCameraAdjust
