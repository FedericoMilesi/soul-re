.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdIgnoreChannelTranspose
/* 46D40 80056540 01000324 */  addiu      $v1, $zero, 0x1
/* 46D44 80056544 3805A68C */  lw         $a2, 0x538($a1)
/* 46D48 80056548 3D05A490 */  lbu        $a0, 0x53D($a1)
/* 46D4C 8005654C 4E05C294 */  lhu        $v0, 0x54E($a2)
/* 46D50 80056550 04188300 */  sllv       $v1, $v1, $a0
/* 46D54 80056554 25104300 */  or         $v0, $v0, $v1
/* 46D58 80056558 0800E003 */  jr         $ra
/* 46D5C 8005655C 4E05C2A4 */   sh        $v0, 0x54E($a2)
.size metaCmdIgnoreChannelTranspose, . - metaCmdIgnoreChannelTranspose
