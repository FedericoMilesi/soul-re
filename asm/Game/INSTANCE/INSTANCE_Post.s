.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel INSTANCE_Post
/* 24E84 80034684 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 24E88 80034688 1000B0AF */  sw         $s0, 0x10($sp)
/* 24E8C 8003468C 21808000 */  addu       $s0, $a0, $zero
/* 24E90 80034690 1800B2AF */  sw         $s2, 0x18($sp)
/* 24E94 80034694 2190A000 */  addu       $s2, $a1, $zero
/* 24E98 80034698 2000BFAF */  sw         $ra, 0x20($sp)
/* 24E9C 8003469C 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 24EA0 800346A0 1400B1AF */  sw         $s1, 0x14($sp)
/* 24EA4 800346A4 1C01118E */  lw         $s1, 0x11C($s0)
/* 24EA8 800346A8 00000000 */  nop
/* 24EAC 800346AC 07002012 */  beqz       $s1, .L800346CC
/* 24EB0 800346B0 2198C000 */   addu      $s3, $a2, $zero
/* 24EB4 800346B4 C2C8000C */  jal        INSTANCE_ForceActive
/* 24EB8 800346B8 00000000 */   nop
/* 24EBC 800346BC 21200002 */  addu       $a0, $s0, $zero
/* 24EC0 800346C0 21284002 */  addu       $a1, $s2, $zero
/* 24EC4 800346C4 09F82002 */  jalr       $s1
/* 24EC8 800346C8 21306002 */   addu      $a2, $s3, $zero
.L800346CC:
/* 24ECC 800346CC 2000BF8F */  lw         $ra, 0x20($sp)
/* 24ED0 800346D0 1C00B38F */  lw         $s3, 0x1C($sp)
/* 24ED4 800346D4 1800B28F */  lw         $s2, 0x18($sp)
/* 24ED8 800346D8 1400B18F */  lw         $s1, 0x14($sp)
/* 24EDC 800346DC 1000B08F */  lw         $s0, 0x10($sp)
/* 24EE0 800346E0 0800E003 */  jr         $ra
/* 24EE4 800346E4 2800BD27 */   addiu     $sp, $sp, 0x28
.size INSTANCE_Post, . - INSTANCE_Post
