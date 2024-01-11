.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_MoveToPosition
/* 71A08 80081208 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 71A0C 8008120C 1000B0AF */  sw         $s0, 0x10($sp)
/* 71A10 80081210 21808000 */  addu       $s0, $a0, $zero
/* 71A14 80081214 00340600 */  sll        $a2, $a2, 16
/* 71A18 80081218 1400BFAF */  sw         $ra, 0x14($sp)
/* 71A1C 8008121C 6604020C */  jal        MON_TurnToPosition
/* 71A20 80081220 03340600 */   sra       $a2, $a2, 16
/* 71A24 80081224 EAFE010C */  jal        MON_TransNodeAnimation
/* 71A28 80081228 21200002 */   addu      $a0, $s0, $zero
/* 71A2C 8008122C 03004014 */  bnez       $v0, .L8008123C
/* 71A30 80081230 00000000 */   nop
/* 71A34 80081234 5204020C */  jal        MON_MoveForward
/* 71A38 80081238 21200002 */   addu      $a0, $s0, $zero
.L8008123C:
/* 71A3C 8008123C 1400BF8F */  lw         $ra, 0x14($sp)
/* 71A40 80081240 1000B08F */  lw         $s0, 0x10($sp)
/* 71A44 80081244 0800E003 */  jr         $ra
/* 71A48 80081248 1800BD27 */   addiu     $sp, $sp, 0x18
.size MON_MoveToPosition, . - MON_MoveToPosition
