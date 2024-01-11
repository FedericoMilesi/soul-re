.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel INSTANCE_ReallyRemoveAllChildren
/* 26000 80035800 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 26004 80035804 1800BFAF */  sw         $ra, 0x18($sp)
/* 26008 80035808 1400B1AF */  sw         $s1, 0x14($sp)
/* 2600C 8003580C 1000B0AF */  sw         $s0, 0x10($sp)
/* 26010 80035810 4C01918C */  lw         $s1, 0x14C($a0)
/* 26014 80035814 00000000 */  nop
/* 26018 80035818 0B002012 */  beqz       $s1, .L80035848
/* 2601C 8003581C 00000000 */   nop
.L80035820:
/* 26020 80035820 5001308E */  lw         $s0, 0x150($s1)
/* 26024 80035824 00D6000C */  jal        INSTANCE_ReallyRemoveAllChildren
/* 26028 80035828 21202002 */   addu      $a0, $s1, $zero
/* 2602C 8003582C 21282002 */  addu       $a1, $s1, $zero
/* 26030 80035830 FCBD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x34)($gp)
/* 26034 80035834 14CA000C */  jal        INSTANCE_ReallyRemoveInstance
/* 26038 80035838 21300000 */   addu      $a2, $zero, $zero
/* 2603C 8003583C 21880002 */  addu       $s1, $s0, $zero
/* 26040 80035840 F7FF2016 */  bnez       $s1, .L80035820
/* 26044 80035844 00000000 */   nop
.L80035848:
/* 26048 80035848 1800BF8F */  lw         $ra, 0x18($sp)
/* 2604C 8003584C 1400B18F */  lw         $s1, 0x14($sp)
/* 26050 80035850 1000B08F */  lw         $s0, 0x10($sp)
/* 26054 80035854 0800E003 */  jr         $ra
/* 26058 80035858 2000BD27 */   addiu     $sp, $sp, 0x20
.size INSTANCE_ReallyRemoveAllChildren, . - INSTANCE_ReallyRemoveAllChildren
