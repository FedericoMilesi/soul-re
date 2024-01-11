.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel AlgorithmicWings
/* 9257C 800A1D7C D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 92580 800A1D80 2400B1AF */  sw         $s1, 0x24($sp)
/* 92584 800A1D84 2188A000 */  addu       $s1, $a1, $zero
/* 92588 800A1D88 2800BFAF */  sw         $ra, 0x28($sp)
/* 9258C 800A1D8C 2000B0AF */  sw         $s0, 0x20($sp)
/* 92590 800A1D90 0400258E */  lw         $a1, 0x4($s1)
/* 92594 800A1D94 21808000 */  addu       $s0, $a0, $zero
/* 92598 800A1D98 1800A427 */  addiu      $a0, $sp, 0x18
/* 9259C 800A1D9C 15000624 */  addiu      $a2, $zero, 0x15
/* 925A0 800A1DA0 40290500 */  sll        $a1, $a1, 5
/* 925A4 800A1DA4 DC01028E */  lw         $v0, 0x1DC($s0)
/* 925A8 800A1DA8 E0FFA524 */  addiu      $a1, $a1, -0x20
/* 925AC 800A1DAC 1758020C */  jal        G2EulerAngles_FromMatrix
/* 925B0 800A1DB0 21284500 */   addu      $a1, $v0, $a1
/* 925B4 800A1DB4 21200002 */  addu       $a0, $s0, $zero
/* 925B8 800A1DB8 05000224 */  addiu      $v0, $zero, 0x5
/* 925BC 800A1DBC 1000A2AF */  sw         $v0, 0x10($sp)
/* 925C0 800A1DC0 02000224 */  addiu      $v0, $zero, 0x2
/* 925C4 800A1DC4 1400A2AF */  sw         $v0, 0x14($sp)
/* 925C8 800A1DC8 0400258E */  lw         $a1, 0x4($s1)
/* 925CC 800A1DCC 0800268E */  lw         $a2, 0x8($s1)
/* 925D0 800A1DD0 67CA010C */  jal        G2EmulationSetInterpController_Vector
/* 925D4 800A1DD4 1800A727 */   addiu     $a3, $sp, 0x18
/* 925D8 800A1DD8 2800BF8F */  lw         $ra, 0x28($sp)
/* 925DC 800A1DDC 2400B18F */  lw         $s1, 0x24($sp)
/* 925E0 800A1DE0 2000B08F */  lw         $s0, 0x20($sp)
/* 925E4 800A1DE4 0800E003 */  jr         $ra
/* 925E8 800A1DE8 3000BD27 */   addiu     $sp, $sp, 0x30
.size AlgorithmicWings, . - AlgorithmicWings
