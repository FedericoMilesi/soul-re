.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PHYSOBS_IsAnythingAttached
/* 5964C 80068E4C FCBD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x34)($gp)
/* 59650 80068E50 00000000 */  nop
/* 59654 80068E54 0400438C */  lw         $v1, 0x4($v0)
/* 59658 80068E58 00000000 */  nop
/* 5965C 80068E5C 0B006010 */  beqz       $v1, .L80068E8C
/* 59660 80068E60 21300000 */   addu      $a2, $zero, $zero
/* 59664 80068E64 3C00848C */  lw         $a0, 0x3C($a0)
.L80068E68:
/* 59668 80068E68 8C00628C */  lw         $v0, 0x8C($v1)
/* 5966C 80068E6C 0800658C */  lw         $a1, 0x8($v1)
/* 59670 80068E70 03004414 */  bne        $v0, $a0, .L80068E80
/* 59674 80068E74 00000000 */   nop
/* 59678 80068E78 A3A30108 */  j          .L80068E8C
/* 5967C 80068E7C 21306000 */   addu      $a2, $v1, $zero
.L80068E80:
/* 59680 80068E80 2118A000 */  addu       $v1, $a1, $zero
/* 59684 80068E84 F8FF6014 */  bnez       $v1, .L80068E68
/* 59688 80068E88 00000000 */   nop
.L80068E8C:
/* 5968C 80068E8C 0800E003 */  jr         $ra
/* 59690 80068E90 2110C000 */   addu      $v0, $a2, $zero
.size PHYSOBS_IsAnythingAttached, . - PHYSOBS_IsAnythingAttached
