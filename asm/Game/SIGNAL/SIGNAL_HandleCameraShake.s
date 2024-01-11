.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SIGNAL_HandleCameraShake
/* E8D4 8001E0D4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* E8D8 8001E0D8 2110A000 */  addu       $v0, $a1, $zero
/* E8DC 8001E0DC 1000BFAF */  sw         $ra, 0x10($sp)
/* E8E0 8001E0E0 0400458C */  lw         $a1, 0x4($v0)
/* E8E4 8001E0E4 0800468C */  lw         $a2, 0x8($v0)
/* E8E8 8001E0E8 90AC8427 */  addiu      $a0, $gp, %gp_rel(theCamera)
/* E8EC 8001E0EC 205C000C */  jal        CAMERA_SetShake
/* E8F0 8001E0F0 00000000 */   nop
/* E8F4 8001E0F4 1000BF8F */  lw         $ra, 0x10($sp)
/* E8F8 8001E0F8 01000224 */  addiu      $v0, $zero, 0x1
/* E8FC 8001E0FC 0800E003 */  jr         $ra
/* E900 8001E100 1800BD27 */   addiu     $sp, $sp, 0x18
.size SIGNAL_HandleCameraShake, . - SIGNAL_HandleCameraShake
