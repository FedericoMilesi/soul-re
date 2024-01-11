.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SIGNAL_HandleCameraSmooth
/* E4F8 8001DCF8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* E4FC 8001DCFC 1000BFAF */  sw         $ra, 0x10($sp)
/* E500 8001DD00 0400A58C */  lw         $a1, 0x4($a1)
/* E504 8001DD04 90AC8427 */  addiu      $a0, $gp, %gp_rel(theCamera)
/* E508 8001DD08 625B000C */  jal        CAMERA_SetSmoothValue
/* E50C 8001DD0C 00000000 */   nop
/* E510 8001DD10 1000BF8F */  lw         $ra, 0x10($sp)
/* E514 8001DD14 01000224 */  addiu      $v0, $zero, 0x1
/* E518 8001DD18 0800E003 */  jr         $ra
/* E51C 8001DD1C 1800BD27 */   addiu     $sp, $sp, 0x18
.size SIGNAL_HandleCameraSmooth, . - SIGNAL_HandleCameraSmooth
