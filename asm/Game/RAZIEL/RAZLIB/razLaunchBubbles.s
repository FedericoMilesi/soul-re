.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razLaunchBubbles
/* 97E2C 800A762C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 97E30 800A7630 1800B2AF */  sw         $s2, 0x18($sp)
/* 97E34 800A7634 21908000 */  addu       $s2, $a0, $zero
/* 97E38 800A7638 1000B0AF */  sw         $s0, 0x10($sp)
/* 97E3C 800A763C 2180A000 */  addu       $s0, $a1, $zero
/* 97E40 800A7640 1400B1AF */  sw         $s1, 0x14($sp)
/* 97E44 800A7644 2188C000 */  addu       $s1, $a2, $zero
/* 97E48 800A7648 01004232 */  andi       $v0, $s2, 0x1
/* 97E4C 800A764C 0B004010 */  beqz       $v0, .L800A767C
/* 97E50 800A7650 1C00BFAF */   sw        $ra, 0x1C($sp)
/* 97E54 800A7654 20000524 */  addiu      $a1, $zero, 0x20
/* 97E58 800A7658 21300002 */  addu       $a2, $s0, $zero
/* 97E5C 800A765C F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 97E60 800A7660 2ED1020C */  jal        TrailWaterFX
/* 97E64 800A7664 21382002 */   addu      $a3, $s1, $zero
/* 97E68 800A7668 2A000524 */  addiu      $a1, $zero, 0x2A
/* 97E6C 800A766C 21300002 */  addu       $a2, $s0, $zero
/* 97E70 800A7670 F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 97E74 800A7674 2ED1020C */  jal        TrailWaterFX
/* 97E78 800A7678 21382002 */   addu      $a3, $s1, $zero
.L800A767C:
/* 97E7C 800A767C 02004232 */  andi       $v0, $s2, 0x2
/* 97E80 800A7680 0A004010 */  beqz       $v0, .L800A76AC
/* 97E84 800A7684 08000524 */   addiu     $a1, $zero, 0x8
/* 97E88 800A7688 21300002 */  addu       $a2, $s0, $zero
/* 97E8C 800A768C F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 97E90 800A7690 2ED1020C */  jal        TrailWaterFX
/* 97E94 800A7694 21382002 */   addu      $a3, $s1, $zero
/* 97E98 800A7698 0C000524 */  addiu      $a1, $zero, 0xC
/* 97E9C 800A769C 21300002 */  addu       $a2, $s0, $zero
/* 97EA0 800A76A0 F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 97EA4 800A76A4 2ED1020C */  jal        TrailWaterFX
/* 97EA8 800A76A8 21382002 */   addu      $a3, $s1, $zero
.L800A76AC:
/* 97EAC 800A76AC 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 97EB0 800A76B0 1800B28F */  lw         $s2, 0x18($sp)
/* 97EB4 800A76B4 1400B18F */  lw         $s1, 0x14($sp)
/* 97EB8 800A76B8 1000B08F */  lw         $s0, 0x10($sp)
/* 97EBC 800A76BC 0800E003 */  jr         $ra
/* 97EC0 800A76C0 2000BD27 */   addiu     $sp, $sp, 0x20
.size razLaunchBubbles, . - razLaunchBubbles
