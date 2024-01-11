.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SIGNAL_HandleSetCameraDistance
/* EB54 8001E354 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* EB58 8001E358 1000BFAF */  sw         $ra, 0x10($sp)
/* EB5C 8001E35C 0400A58C */  lw         $a1, 0x4($a1)
/* EB60 8001E360 04008010 */  beqz       $a0, .L8001E374
/* EB64 8001E364 00000000 */   nop
/* EB68 8001E368 90AC8427 */  addiu      $a0, $gp, %gp_rel(theCamera)
/* EB6C 8001E36C 8D5B000C */  jal        CAMERA_Adjust_distance
/* EB70 8001E370 00000000 */   nop
.L8001E374:
/* EB74 8001E374 1000BF8F */  lw         $ra, 0x10($sp)
/* EB78 8001E378 01000224 */  addiu      $v0, $zero, 0x1
/* EB7C 8001E37C 0800E003 */  jr         $ra
/* EB80 8001E380 1800BD27 */   addiu     $sp, $sp, 0x18
.size SIGNAL_HandleSetCameraDistance, . - SIGNAL_HandleSetCameraDistance
