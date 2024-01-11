.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SIGNAL_HandleCameraTimer
/* E520 8001DD20 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* E524 8001DD24 1000BFAF */  sw         $ra, 0x10($sp)
/* E528 8001DD28 0400A58C */  lw         $a1, 0x4($a1)
/* E52C 8001DD2C 90AC8427 */  addiu      $a0, $gp, %gp_rel(theCamera)
/* E530 8001DD30 765B000C */  jal        CAMERA_SetTimer
/* E534 8001DD34 00000000 */   nop
/* E538 8001DD38 1000BF8F */  lw         $ra, 0x10($sp)
/* E53C 8001DD3C 01000224 */  addiu      $v0, $zero, 0x1
/* E540 8001DD40 0800E003 */  jr         $ra
/* E544 8001DD44 1800BD27 */   addiu     $sp, $sp, 0x18
.size SIGNAL_HandleCameraTimer, . - SIGNAL_HandleCameraTimer
