.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_DeleteGeneralEffect
/* 3BC7C 8004B47C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 3BC80 8004B480 1000B0AF */  sw         $s0, 0x10($sp)
/* 3BC84 8004B484 21808000 */  addu       $s0, $a0, $zero
/* 3BC88 8004B488 1F000012 */  beqz       $s0, .L8004B508
/* 3BC8C 8004B48C 1400BFAF */   sw        $ra, 0x14($sp)
/* 3BC90 8004B490 649A828F */  lw         $v0, %gp_rel(FX_GeneralEffectTracker)($gp)
/* 3BC94 8004B494 00000000 */  nop
/* 3BC98 8004B498 12004010 */  beqz       $v0, .L8004B4E4
/* 3BC9C 8004B49C 21180000 */   addu      $v1, $zero, $zero
.L8004B4A0:
/* 3BCA0 8004B4A0 0B005014 */  bne        $v0, $s0, .L8004B4D0
/* 3BCA4 8004B4A4 00000000 */   nop
/* 3BCA8 8004B4A8 04006010 */  beqz       $v1, .L8004B4BC
/* 3BCAC 8004B4AC 00000000 */   nop
/* 3BCB0 8004B4B0 0000028E */  lw         $v0, 0x0($s0)
/* 3BCB4 8004B4B4 392D0108 */  j          .L8004B4E4
/* 3BCB8 8004B4B8 000062AC */   sw        $v0, 0x0($v1)
.L8004B4BC:
/* 3BCBC 8004B4BC 0000028E */  lw         $v0, 0x0($s0)
/* 3BCC0 8004B4C0 00000000 */  nop
/* 3BCC4 8004B4C4 649A82AF */  sw         $v0, %gp_rel(FX_GeneralEffectTracker)($gp)
/* 3BCC8 8004B4C8 392D0108 */  j          .L8004B4E4
/* 3BCCC 8004B4CC 00000000 */   nop
.L8004B4D0:
/* 3BCD0 8004B4D0 21184000 */  addu       $v1, $v0, $zero
/* 3BCD4 8004B4D4 0000428C */  lw         $v0, 0x0($v0)
/* 3BCD8 8004B4D8 00000000 */  nop
/* 3BCDC 8004B4DC F0FF4014 */  bnez       $v0, .L8004B4A0
/* 3BCE0 8004B4E0 00000000 */   nop
.L8004B4E4:
/* 3BCE4 8004B4E4 0C000292 */  lbu        $v0, 0xC($s0)
/* 3BCE8 8004B4E8 00000000 */  nop
/* 3BCEC 8004B4EC 04004014 */  bnez       $v0, .L8004B500
/* 3BCF0 8004B4F0 00000000 */   nop
/* 3BCF4 8004B4F4 1400048E */  lw         $a0, 0x14($s0)
/* 3BCF8 8004B4F8 2641010C */  jal        MEMPACK_Free
/* 3BCFC 8004B4FC 00000000 */   nop
.L8004B500:
/* 3BD00 8004B500 2641010C */  jal        MEMPACK_Free
/* 3BD04 8004B504 21200002 */   addu      $a0, $s0, $zero
.L8004B508:
/* 3BD08 8004B508 1400BF8F */  lw         $ra, 0x14($sp)
/* 3BD0C 8004B50C 1000B08F */  lw         $s0, 0x10($sp)
/* 3BD10 8004B510 0800E003 */  jr         $ra
/* 3BD14 8004B514 1800BD27 */   addiu     $sp, $sp, 0x18
.size FX_DeleteGeneralEffect, . - FX_DeleteGeneralEffect
