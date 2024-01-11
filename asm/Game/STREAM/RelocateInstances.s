.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RelocateInstances
/* 4CBE0 8005C3E0 FCBD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x34)($gp)
/* 4CBE4 8005C3E4 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 4CBE8 8005C3E8 1800BFAF */  sw         $ra, 0x18($sp)
/* 4CBEC 8005C3EC 1400B1AF */  sw         $s1, 0x14($sp)
/* 4CBF0 8005C3F0 1000B0AF */  sw         $s0, 0x10($sp)
/* 4CBF4 8005C3F4 0400508C */  lw         $s0, 0x4($v0)
/* 4CBF8 8005C3F8 00000000 */  nop
/* 4CBFC 8005C3FC 08000012 */  beqz       $s0, .L8005C420
/* 4CC00 8005C400 21888000 */   addu      $s1, $a0, $zero
/* 4CC04 8005C404 21200002 */  addu       $a0, $s0, $zero
.L8005C408:
/* 4CC08 8005C408 8A70010C */  jal        STREAM_RelocateInstance
/* 4CC0C 8005C40C 21282002 */   addu      $a1, $s1, $zero
/* 4CC10 8005C410 0800108E */  lw         $s0, 0x8($s0)
/* 4CC14 8005C414 00000000 */  nop
/* 4CC18 8005C418 FBFF0016 */  bnez       $s0, .L8005C408
/* 4CC1C 8005C41C 21200002 */   addu      $a0, $s0, $zero
.L8005C420:
/* 4CC20 8005C420 8F12010C */  jal        FX_Relocate
/* 4CC24 8005C424 21202002 */   addu      $a0, $s1, $zero
/* 4CC28 8005C428 1800BF8F */  lw         $ra, 0x18($sp)
/* 4CC2C 8005C42C 1400B18F */  lw         $s1, 0x14($sp)
/* 4CC30 8005C430 1000B08F */  lw         $s0, 0x10($sp)
/* 4CC34 8005C434 0800E003 */  jr         $ra
/* 4CC38 8005C438 2000BD27 */   addiu     $sp, $sp, 0x20
.size RelocateInstances, . - RelocateInstances
