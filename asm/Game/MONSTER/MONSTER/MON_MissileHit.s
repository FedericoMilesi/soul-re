.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_MissileHit
/* 7898C 8008818C D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 78990 80088190 1400B1AF */  sw         $s1, 0x14($sp)
/* 78994 80088194 21888000 */  addu       $s1, $a0, $zero
/* 78998 80088198 2000BFAF */  sw         $ra, 0x20($sp)
/* 7899C 8008819C 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 789A0 800881A0 1800B2AF */  sw         $s2, 0x18($sp)
/* 789A4 800881A4 1000B0AF */  sw         $s0, 0x10($sp)
/* 789A8 800881A8 6C01338E */  lw         $s3, 0x16C($s1)
/* 789AC 800881AC 2400308E */  lw         $s0, 0x24($s1)
/* 789B0 800881B0 B2C9010C */  jal        G2EmulationInstanceQueryFrame
/* 789B4 800881B4 21280000 */   addu      $a1, $zero, $zero
/* 789B8 800881B8 21202002 */  addu       $a0, $s1, $zero
/* 789BC 800881BC 21280000 */  addu       $a1, $zero, $zero
/* 789C0 800881C0 BFC9010C */  jal        G2EmulationInstanceQueryLastFrame
/* 789C4 800881C4 21904000 */   addu      $s2, $v0, $zero
/* 789C8 800881C8 26000392 */  lbu        $v1, 0x26($s0)
/* 789CC 800881CC 21204000 */  addu       $a0, $v0, $zero
/* 789D0 800881D0 2A108300 */  slt        $v0, $a0, $v1
/* 789D4 800881D4 09004010 */  beqz       $v0, .L800881FC
/* 789D8 800881D8 2A104302 */   slt       $v0, $s2, $v1
/* 789DC 800881DC 07004014 */  bnez       $v0, .L800881FC
/* 789E0 800881E0 21302002 */   addu      $a2, $s1, $zero
/* 789E4 800881E4 21202002 */  addu       $a0, $s1, $zero
/* 789E8 800881E8 25000592 */  lbu        $a1, 0x25($s0)
/* 789EC 800881EC 4B23010C */  jal        FX_Blood_Impale
/* 789F0 800881F0 2138A000 */   addu      $a3, $a1, $zero
/* 789F4 800881F4 89200208 */  j          .L80088224
/* 789F8 800881F8 00000000 */   nop
.L800881FC:
/* 789FC 800881FC 27000392 */  lbu        $v1, 0x27($s0)
/* 78A00 80088200 00000000 */  nop
/* 78A04 80088204 2A108300 */  slt        $v0, $a0, $v1
/* 78A08 80088208 06004010 */  beqz       $v0, .L80088224
/* 78A0C 8008820C 2A104302 */   slt       $v0, $s2, $v1
/* 78A10 80088210 04004014 */  bnez       $v0, .L80088224
/* 78A14 80088214 21202002 */   addu      $a0, $s1, $zero
/* 78A18 80088218 25000592 */  lbu        $a1, 0x25($s0)
/* 78A1C 8008821C BE23010C */  jal        FX_BloodCone
/* 78A20 80088220 50000624 */   addiu     $a2, $zero, 0x50
.L80088224:
/* 78A24 80088224 1800228E */  lw         $v0, 0x18($s1)
/* 78A28 80088228 00000000 */  nop
/* 78A2C 8008822C 10004230 */  andi       $v0, $v0, 0x10
/* 78A30 80088230 03004010 */  beqz       $v0, .L80088240
/* 78A34 80088234 21202002 */   addu      $a0, $s1, $zero
/* 78A38 80088238 91FE010C */  jal        MON_SwitchState
/* 78A3C 8008823C 17000524 */   addiu     $a1, $zero, 0x17
.L80088240:
/* 78A40 80088240 27C3010C */  jal        DeMessageQueue
/* 78A44 80088244 08006426 */   addiu     $a0, $s3, 0x8
/* 78A48 80088248 FDFF4014 */  bnez       $v0, .L80088240
/* 78A4C 8008824C 00000000 */   nop
/* 78A50 80088250 2000BF8F */  lw         $ra, 0x20($sp)
/* 78A54 80088254 1C00B38F */  lw         $s3, 0x1C($sp)
/* 78A58 80088258 1800B28F */  lw         $s2, 0x18($sp)
/* 78A5C 8008825C 1400B18F */  lw         $s1, 0x14($sp)
/* 78A60 80088260 1000B08F */  lw         $s0, 0x10($sp)
/* 78A64 80088264 0800E003 */  jr         $ra
/* 78A68 80088268 2800BD27 */   addiu     $sp, $sp, 0x28
.size MON_MissileHit, . - MON_MissileHit
