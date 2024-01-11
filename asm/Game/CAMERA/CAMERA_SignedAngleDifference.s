.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_SignedAngleDifference
/* 6F68 80016768 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 6F6C 8001676C 002C0500 */  sll        $a1, $a1, 16
/* 6F70 80016770 00140400 */  sll        $v0, $a0, 16
/* 6F74 80016774 03240500 */  sra        $a0, $a1, 16
/* 6F78 80016778 1000BFAF */  sw         $ra, 0x10($sp)
/* 6F7C 8001677C 7EE8000C */  jal        AngleDiff
/* 6F80 80016780 032C0200 */   sra       $a1, $v0, 16
/* 6F84 80016784 00140200 */  sll        $v0, $v0, 16
/* 6F88 80016788 1000BF8F */  lw         $ra, 0x10($sp)
/* 6F8C 8001678C 03140200 */  sra        $v0, $v0, 16
/* 6F90 80016790 0800E003 */  jr         $ra
/* 6F94 80016794 1800BD27 */   addiu     $sp, $sp, 0x18
.size CAMERA_SignedAngleDifference, . - CAMERA_SignedAngleDifference
