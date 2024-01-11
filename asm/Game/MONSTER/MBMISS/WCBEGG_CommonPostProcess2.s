.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WCBEGG_CommonPostProcess2
/* 7FF44 8008F744 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 7FF48 8008F748 1400B1AF */  sw         $s1, 0x14($sp)
/* 7FF4C 8008F74C 21888000 */  addu       $s1, $a0, $zero
/* 7FF50 8008F750 1800B2AF */  sw         $s2, 0x18($sp)
/* 7FF54 8008F754 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 7FF58 8008F758 1000B0AF */  sw         $s0, 0x10($sp)
/* 7FF5C 8008F75C 6C01308E */  lw         $s0, 0x16C($s1)
/* 7FF60 8008F760 9006020C */  jal        MON_GetTime
/* 7FF64 8008F764 2190A000 */   addu      $s2, $a1, $zero
/* 7FF68 8008F768 2800038E */  lw         $v1, 0x28($s0)
/* 7FF6C 8008F76C 00000000 */  nop
/* 7FF70 8008F770 780F6324 */  addiu      $v1, $v1, 0xF78
/* 7FF74 8008F774 2A104300 */  slt        $v0, $v0, $v1
/* 7FF78 8008F778 07004014 */  bnez       $v0, .L8008F798
/* 7FF7C 8008F77C 21202002 */   addu      $a0, $s1, $zero
/* 7FF80 8008F780 76D5000C */  jal        INSTANCE_UnlinkFromParent
/* 7FF84 8008F784 21202002 */   addu      $a0, $s1, $zero
/* 7FF88 8008F788 85D1000C */  jal        INSTANCE_KillInstance
/* 7FF8C 8008F78C 21202002 */   addu      $a0, $s1, $zero
/* 7FF90 8008F790 E83D0208 */  j          .L8008F7A0
/* 7FF94 8008F794 00000000 */   nop
.L8008F798:
/* 7FF98 8008F798 09AE010C */  jal        ProcessPhysicalObject
/* 7FF9C 8008F79C 21284002 */   addu      $a1, $s2, $zero
.L8008F7A0:
/* 7FFA0 8008F7A0 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 7FFA4 8008F7A4 1800B28F */  lw         $s2, 0x18($sp)
/* 7FFA8 8008F7A8 1400B18F */  lw         $s1, 0x14($sp)
/* 7FFAC 8008F7AC 1000B08F */  lw         $s0, 0x10($sp)
/* 7FFB0 8008F7B0 0800E003 */  jr         $ra
/* 7FFB4 8008F7B4 2000BD27 */   addiu     $sp, $sp, 0x20
.size WCBEGG_CommonPostProcess2, . - WCBEGG_CommonPostProcess2
