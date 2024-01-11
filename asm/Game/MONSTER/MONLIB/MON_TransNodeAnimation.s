.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_TransNodeAnimation
/* 703A8 8007FBA8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 703AC 8007FBAC C8018424 */  addiu      $a0, $a0, 0x1C8
/* 703B0 8007FBB0 21280000 */  addu       $a1, $zero, $zero
/* 703B4 8007FBB4 1000BFAF */  sw         $ra, 0x10($sp)
/* 703B8 8007FBB8 314C020C */  jal        G2Anim_SegmentHasActiveChannels
/* 703BC 8007FBBC 00070624 */   addiu     $a2, $zero, 0x700
/* 703C0 8007FBC0 1000BF8F */  lw         $ra, 0x10($sp)
/* 703C4 8007FBC4 00000000 */  nop
/* 703C8 8007FBC8 0800E003 */  jr         $ra
/* 703CC 8007FBCC 1800BD27 */   addiu     $sp, $sp, 0x18
.size MON_TransNodeAnimation, . - MON_TransNodeAnimation
