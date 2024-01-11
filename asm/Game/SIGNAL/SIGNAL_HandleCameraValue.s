.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SIGNAL_HandleCameraValue
/* E598 8001DD98 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* E59C 8001DD9C 2110A000 */  addu       $v0, $a1, $zero
/* E5A0 8001DDA0 1000BFAF */  sw         $ra, 0x10($sp)
/* E5A4 8001DDA4 0400458C */  lw         $a1, 0x4($v0)
/* E5A8 8001DDA8 0800468C */  lw         $a2, 0x8($v0)
/* E5AC 8001DDAC 90AC8427 */  addiu      $a0, $gp, %gp_rel(theCamera)
/* E5B0 8001DDB0 B158000C */  jal        CAMERA_SetValue
/* E5B4 8001DDB4 00000000 */   nop
/* E5B8 8001DDB8 1000BF8F */  lw         $ra, 0x10($sp)
/* E5BC 8001DDBC 01000224 */  addiu      $v0, $zero, 0x1
/* E5C0 8001DDC0 0800E003 */  jr         $ra
/* E5C4 8001DDC4 1800BD27 */   addiu     $sp, $sp, 0x18
.size SIGNAL_HandleCameraValue, . - SIGNAL_HandleCameraValue
