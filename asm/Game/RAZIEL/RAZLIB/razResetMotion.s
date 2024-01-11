.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razResetMotion
/* 9744C 800A6C4C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 97450 800A6C50 1000B0AF */  sw         $s0, 0x10($sp)
/* 97454 800A6C54 C8019024 */  addiu      $s0, $a0, 0x1C8
/* 97458 800A6C58 21200002 */  addu       $a0, $s0, $zero
/* 9745C 800A6C5C 21280000 */  addu       $a1, $zero, $zero
/* 97460 800A6C60 1400BFAF */  sw         $ra, 0x14($sp)
/* 97464 800A6C64 E541020C */  jal        G2Anim_IsControllerActive
/* 97468 800A6C68 22000624 */   addiu     $a2, $zero, 0x22
/* 9746C 800A6C6C 04004010 */  beqz       $v0, .L800A6C80
/* 97470 800A6C70 21200002 */   addu      $a0, $s0, $zero
/* 97474 800A6C74 21280000 */  addu       $a1, $zero, $zero
/* 97478 800A6C78 8D41020C */  jal        G2Anim_DisableController
/* 9747C 800A6C7C 22000624 */   addiu     $a2, $zero, 0x22
.L800A6C80:
/* 97480 800A6C80 21200002 */  addu       $a0, $s0, $zero
/* 97484 800A6C84 3CFB80AF */  sw         $zero, %gp_rel(Raziel + 0x50C)($gp)
/* 97488 800A6C88 8E3F020C */  jal        G2Anim_SetSpeedAdjustment
/* 9748C 800A6C8C 00100524 */   addiu     $a1, $zero, 0x1000
/* 97490 800A6C90 1400BF8F */  lw         $ra, 0x14($sp)
/* 97494 800A6C94 1000B08F */  lw         $s0, 0x10($sp)
/* 97498 800A6C98 0800E003 */  jr         $ra
/* 9749C 800A6C9C 1800BD27 */   addiu     $sp, $sp, 0x18
.size razResetMotion, . - razResetMotion
