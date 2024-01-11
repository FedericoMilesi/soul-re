.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WCBEGG_CommonPostProcess
/* 7FEB4 8008F6B4 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 7FEB8 8008F6B8 1800B0AF */  sw         $s0, 0x18($sp)
/* 7FEBC 8008F6BC 21808000 */  addu       $s0, $a0, $zero
/* 7FEC0 8008F6C0 2000B2AF */  sw         $s2, 0x20($sp)
/* 7FEC4 8008F6C4 2190A000 */  addu       $s2, $a1, $zero
/* 7FEC8 8008F6C8 21280002 */  addu       $a1, $s0, $zero
/* 7FECC 8008F6CC 06000624 */  addiu      $a2, $zero, 0x6
/* 7FED0 8008F6D0 F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 7FED4 8008F6D4 02000224 */  addiu      $v0, $zero, 0x2
/* 7FED8 8008F6D8 2400BFAF */  sw         $ra, 0x24($sp)
/* 7FEDC 8008F6DC 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 7FEE0 8008F6E0 6C01118E */  lw         $s1, 0x16C($s0)
/* 7FEE4 8008F6E4 21380000 */  addu       $a3, $zero, $zero
/* 7FEE8 8008F6E8 1000A0AF */  sw         $zero, 0x10($sp)
/* 7FEEC 8008F6EC AEC6010C */  jal        SetActionPlayHostAnimationData
/* 7FEF0 8008F6F0 1400A2AF */   sw        $v0, 0x14($sp)
/* 7FEF4 8008F6F4 0400053C */  lui        $a1, (0x40003 >> 16)
/* 7FEF8 8008F6F8 0300A534 */  ori        $a1, $a1, (0x40003 & 0xFFFF)
/* 7FEFC 8008F6FC F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 7FF00 8008F700 A1D1000C */  jal        INSTANCE_Post
/* 7FF04 8008F704 21304000 */   addu      $a2, $v0, $zero
/* 7FF08 8008F708 21200002 */  addu       $a0, $s0, $zero
/* 7FF0C 8008F70C 0980023C */  lui        $v0, %hi(WCBEGG_CommonPostProcess2)
/* 7FF10 8008F710 44F74224 */  addiu      $v0, $v0, %lo(WCBEGG_CommonPostProcess2)
/* 7FF14 8008F714 9006020C */  jal        MON_GetTime
/* 7FF18 8008F718 080102AE */   sw        $v0, 0x108($s0)
/* 7FF1C 8008F71C 21200002 */  addu       $a0, $s0, $zero
/* 7FF20 8008F720 21284002 */  addu       $a1, $s2, $zero
/* 7FF24 8008F724 09AE010C */  jal        ProcessPhysicalObject
/* 7FF28 8008F728 280022AE */   sw        $v0, 0x28($s1)
/* 7FF2C 8008F72C 2400BF8F */  lw         $ra, 0x24($sp)
/* 7FF30 8008F730 2000B28F */  lw         $s2, 0x20($sp)
/* 7FF34 8008F734 1C00B18F */  lw         $s1, 0x1C($sp)
/* 7FF38 8008F738 1800B08F */  lw         $s0, 0x18($sp)
/* 7FF3C 8008F73C 0800E003 */  jr         $ra
/* 7FF40 8008F740 2800BD27 */   addiu     $sp, $sp, 0x28
.size WCBEGG_CommonPostProcess, . - WCBEGG_CommonPostProcess
