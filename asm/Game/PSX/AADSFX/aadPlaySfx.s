.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadPlaySfx
/* 476F8 80056EF8 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 476FC 80056EFC 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 47700 80056F00 2188A000 */  addu       $s1, $a1, $zero
/* 47704 80056F04 2000B2AF */  sw         $s2, 0x20($sp)
/* 47708 80056F08 2190C000 */  addu       $s2, $a2, $zero
/* 4770C 80056F0C 1800B0AF */  sw         $s0, 0x18($sp)
/* 47710 80056F10 2400BFAF */  sw         $ra, 0x24($sp)
/* 47714 80056F14 985C010C */  jal        createSfxHandle
/* 47718 80056F18 2180E000 */   addu      $s0, $a3, $zero
/* 4771C 80056F1C 00841000 */  sll        $s0, $s0, 16
/* 47720 80056F20 03841000 */  sra        $s0, $s0, 16
/* 47724 80056F24 21200000 */  addu       $a0, $zero, $zero
/* 47728 80056F28 1000B0AF */  sw         $s0, 0x10($sp)
/* 4772C 80056F2C 21804000 */  addu       $s0, $v0, $zero
/* 47730 80056F30 21282002 */  addu       $a1, $s1, $zero
/* 47734 80056F34 21304002 */  addu       $a2, $s2, $zero
/* 47738 80056F38 AA5C010C */  jal        aadPutSfxCommand
/* 4773C 80056F3C 21380002 */   addu      $a3, $s0, $zero
/* 47740 80056F40 21100002 */  addu       $v0, $s0, $zero
/* 47744 80056F44 2400BF8F */  lw         $ra, 0x24($sp)
/* 47748 80056F48 2000B28F */  lw         $s2, 0x20($sp)
/* 4774C 80056F4C 1C00B18F */  lw         $s1, 0x1C($sp)
/* 47750 80056F50 1800B08F */  lw         $s0, 0x18($sp)
/* 47754 80056F54 0800E003 */  jr         $ra
/* 47758 80056F58 2800BD27 */   addiu     $sp, $sp, 0x28
.size aadPlaySfx, . - aadPlaySfx
