.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2Anim_GetRootMotionOverInterval
/* 80398 8008FB98 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 8039C 8008FB9C 2330C500 */  subu       $a2, $a2, $a1
/* 803A0 8008FBA0 002C0500 */  sll        $a1, $a1, 16
/* 803A4 8008FBA4 00340600 */  sll        $a2, $a2, 16
/* 803A8 8008FBA8 032C0500 */  sra        $a1, $a1, 16
/* 803AC 8008FBAC 1000BFAF */  sw         $ra, 0x10($sp)
/* 803B0 8008FBB0 AC4C020C */  jal        G2Anim_GetRootMotionFromTimeForDuration
/* 803B4 8008FBB4 03340600 */   sra       $a2, $a2, 16
/* 803B8 8008FBB8 1000BF8F */  lw         $ra, 0x10($sp)
/* 803BC 8008FBBC 00000000 */  nop
/* 803C0 8008FBC0 0800E003 */  jr         $ra
/* 803C4 8008FBC4 1800BD27 */   addiu     $sp, $sp, 0x18
.size G2Anim_GetRootMotionOverInterval, . - G2Anim_GetRootMotionOverInterval
