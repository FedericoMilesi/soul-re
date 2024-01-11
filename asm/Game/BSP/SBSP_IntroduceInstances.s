.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SBSP_IntroduceInstances
/* 2E734 8003DF34 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 2E738 8003DF38 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 2E73C 8003DF3C 1800B2AF */  sw         $s2, 0x18($sp)
/* 2E740 8003DF40 1400B1AF */  sw         $s1, 0x14($sp)
/* 2E744 8003DF44 1000B0AF */  sw         $s0, 0x10($sp)
/* 2E748 8003DF48 0800918C */  lw         $s1, 0x8($a0)
/* 2E74C 8003DF4C 0C00908C */  lw         $s0, 0xC($a0)
/* 2E750 8003DF50 0B002012 */  beqz       $s1, .L8003DF80
/* 2E754 8003DF54 00940500 */   sll       $s2, $a1, 16
.L8003DF58:
/* 2E758 8003DF58 2C00028E */  lw         $v0, 0x2C($s0)
/* 2E75C 8003DF5C 00000000 */  nop
/* 2E760 8003DF60 08404230 */  andi       $v0, $v0, 0x4008
/* 2E764 8003DF64 03004014 */  bnez       $v0, .L8003DF74
/* 2E768 8003DF68 21200002 */   addu      $a0, $s0, $zero
/* 2E76C 8003DF6C 6ACB000C */  jal        INSTANCE_IntroduceInstance
/* 2E770 8003DF70 032C1200 */   sra       $a1, $s2, 16
.L8003DF74:
/* 2E774 8003DF74 FFFF3126 */  addiu      $s1, $s1, -0x1
/* 2E778 8003DF78 F7FF2016 */  bnez       $s1, .L8003DF58
/* 2E77C 8003DF7C 4C001026 */   addiu     $s0, $s0, 0x4C
.L8003DF80:
/* 2E780 8003DF80 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 2E784 8003DF84 1800B28F */  lw         $s2, 0x18($sp)
/* 2E788 8003DF88 1400B18F */  lw         $s1, 0x14($sp)
/* 2E78C 8003DF8C 1000B08F */  lw         $s0, 0x10($sp)
/* 2E790 8003DF90 0800E003 */  jr         $ra
/* 2E794 8003DF94 2000BD27 */   addiu     $sp, $sp, 0x20
.size SBSP_IntroduceInstances, . - SBSP_IntroduceInstances
