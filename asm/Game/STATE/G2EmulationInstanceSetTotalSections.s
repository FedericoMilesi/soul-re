.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2EmulationInstanceSetTotalSections
/* 630C4 800728C4 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 630C8 800728C8 1800B2AF */  sw         $s2, 0x18($sp)
/* 630CC 800728CC 21908000 */  addu       $s2, $a0, $zero
/* 630D0 800728D0 1000B0AF */  sw         $s0, 0x10($sp)
/* 630D4 800728D4 002C0500 */  sll        $a1, $a1, 16
/* 630D8 800728D8 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 630DC 800728DC 1400B1AF */  sw         $s1, 0x14($sp)
/* 630E0 800728E0 C8014292 */  lbu        $v0, 0x1C8($s2)
/* 630E4 800728E4 032C0500 */  sra        $a1, $a1, 16
/* 630E8 800728E8 2A104500 */  slt        $v0, $v0, $a1
/* 630EC 800728EC 0B004010 */  beqz       $v0, .L8007291C
/* 630F0 800728F0 C8015026 */   addiu     $s0, $s2, 0x1C8
/* 630F4 800728F4 2188A000 */  addu       $s1, $a1, $zero
/* 630F8 800728F8 21200002 */  addu       $a0, $s0, $zero
.L800728FC:
/* 630FC 800728FC 21280000 */  addu       $a1, $zero, $zero
/* 63100 80072900 0E4B020C */  jal        G2Anim_AddSection
/* 63104 80072904 2130A000 */   addu      $a2, $a1, $zero
/* 63108 80072908 00000292 */  lbu        $v0, 0x0($s0)
/* 6310C 8007290C 00000000 */  nop
/* 63110 80072910 2A105100 */  slt        $v0, $v0, $s1
/* 63114 80072914 F9FF4014 */  bnez       $v0, .L800728FC
/* 63118 80072918 21200002 */   addu      $a0, $s0, $zero
.L8007291C:
/* 6311C 8007291C 21200002 */  addu       $a0, $s0, $zero
/* 63120 80072920 0380053C */  lui        $a1, %hi(INSTANCE_DefaultAnimCallback)
/* 63124 80072924 C859A524 */  addiu      $a1, $a1, %lo(INSTANCE_DefaultAnimCallback)
/* 63128 80072928 373F020C */  jal        G2Anim_SetCallback
/* 6312C 8007292C 21304002 */   addu      $a2, $s2, $zero
/* 63130 80072930 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 63134 80072934 1800B28F */  lw         $s2, 0x18($sp)
/* 63138 80072938 1400B18F */  lw         $s1, 0x14($sp)
/* 6313C 8007293C 1000B08F */  lw         $s0, 0x10($sp)
/* 63140 80072940 0800E003 */  jr         $ra
/* 63144 80072944 2000BD27 */   addiu     $sp, $sp, 0x20
.size G2EmulationInstanceSetTotalSections, . - G2EmulationInstanceSetTotalSections
