.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_EndSwimThrowMode
/* C47C 8001BC7C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* C480 8001BC80 1000BFAF */  sw         $ra, 0x10($sp)
/* C484 8001BC84 668E80A7 */  sh         $zero, %gp_rel(CameraLookStickyFlag)($gp)
/* C488 8001BC88 8970000C */  jal        CAMERA_EndLook
/* C48C 8001BC8C 00000000 */   nop
/* C490 8001BC90 1000BF8F */  lw         $ra, 0x10($sp)
/* C494 8001BC94 00000000 */  nop
/* C498 8001BC98 0800E003 */  jr         $ra
/* C49C 8001BC9C 1800BD27 */   addiu     $sp, $sp, 0x18
.size CAMERA_EndSwimThrowMode, . - CAMERA_EndSwimThrowMode
