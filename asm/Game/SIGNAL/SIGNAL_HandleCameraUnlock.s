.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SIGNAL_HandleCameraUnlock
/* E4D0 8001DCD0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* E4D4 8001DCD4 1000BFAF */  sw         $ra, 0x10($sp)
/* E4D8 8001DCD8 0400A58C */  lw         $a1, 0x4($a1)
/* E4DC 8001DCDC 90AC8427 */  addiu      $a0, $gp, %gp_rel(theCamera)
/* E4E0 8001DCE0 5D5B000C */  jal        CAMERA_Unlock
/* E4E4 8001DCE4 00000000 */   nop
/* E4E8 8001DCE8 1000BF8F */  lw         $ra, 0x10($sp)
/* E4EC 8001DCEC 01000224 */  addiu      $v0, $zero, 0x1
/* E4F0 8001DCF0 0800E003 */  jr         $ra
/* E4F4 8001DCF4 1800BD27 */   addiu     $sp, $sp, 0x18
.size SIGNAL_HandleCameraUnlock, . - SIGNAL_HandleCameraUnlock
