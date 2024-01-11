.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SIGNAL_HandleCameraLock
/* E4A8 8001DCA8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* E4AC 8001DCAC 1000BFAF */  sw         $ra, 0x10($sp)
/* E4B0 8001DCB0 0400A58C */  lw         $a1, 0x4($a1)
/* E4B4 8001DCB4 90AC8427 */  addiu      $a0, $gp, %gp_rel(theCamera)
/* E4B8 8001DCB8 585B000C */  jal        CAMERA_Lock
/* E4BC 8001DCBC 00000000 */   nop
/* E4C0 8001DCC0 1000BF8F */  lw         $ra, 0x10($sp)
/* E4C4 8001DCC4 01000224 */  addiu      $v0, $zero, 0x1
/* E4C8 8001DCC8 0800E003 */  jr         $ra
/* E4CC 8001DCCC 1800BD27 */   addiu     $sp, $sp, 0x18
.size SIGNAL_HandleCameraLock, . - SIGNAL_HandleCameraLock
