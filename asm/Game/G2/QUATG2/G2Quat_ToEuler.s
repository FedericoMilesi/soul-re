.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2Quat_ToEuler
/* 86818 80096018 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 8681C 8009601C 3000B0AF */  sw         $s0, 0x30($sp)
/* 86820 80096020 2180A000 */  addu       $s0, $a1, $zero
/* 86824 80096024 3400B1AF */  sw         $s1, 0x34($sp)
/* 86828 80096028 2188C000 */  addu       $s1, $a2, $zero
/* 8682C 8009602C 3800BFAF */  sw         $ra, 0x38($sp)
/* 86830 80096030 27E7010C */  jal        G2Quat_ToMatrix_S
/* 86834 80096034 1000A527 */   addiu     $a1, $sp, 0x10
/* 86838 80096038 21200002 */  addu       $a0, $s0, $zero
/* 8683C 8009603C 1000A527 */  addiu      $a1, $sp, 0x10
/* 86840 80096040 1758020C */  jal        G2EulerAngles_FromMatrix
/* 86844 80096044 21302002 */   addu      $a2, $s1, $zero
/* 86848 80096048 3800BF8F */  lw         $ra, 0x38($sp)
/* 8684C 8009604C 3400B18F */  lw         $s1, 0x34($sp)
/* 86850 80096050 3000B08F */  lw         $s0, 0x30($sp)
/* 86854 80096054 0800E003 */  jr         $ra
/* 86858 80096058 4000BD27 */   addiu     $sp, $sp, 0x40
.size G2Quat_ToEuler, . - G2Quat_ToEuler
