.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razPrepGlyph
/* 98704 800A7F04 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 98708 800A7F08 1400BFAF */  sw         $ra, 0x14($sp)
/* 9870C 800A7F0C 6397020C */  jal        razReaverOff
/* 98710 800A7F10 1000B0AF */   sw        $s0, 0x10($sp)
/* 98714 800A7F14 2197020C */  jal        razGetHeldItem
/* 98718 800A7F18 00000000 */   nop
/* 9871C 800A7F1C 21804000 */  addu       $s0, $v0, $zero
/* 98720 800A7F20 05000012 */  beqz       $s0, .L800A7F38
/* 98724 800A7F24 21200000 */   addu      $a0, $zero, $zero
/* 98728 800A7F28 00100524 */  addiu      $a1, $zero, 0x1000
/* 9872C 800A7F2C 7F95020C */  jal        razSetFadeEffect
/* 98730 800A7F30 00010624 */   addiu     $a2, $zero, 0x100
/* 98734 800A7F34 A4FA90AF */  sw         $s0, %gp_rel(Raziel + 0x474)($gp)
.L800A7F38:
/* 98738 800A7F38 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 9873C 800A7F3C 1400BF8F */  lw         $ra, 0x14($sp)
/* 98740 800A7F40 1000B08F */  lw         $s0, 0x10($sp)
/* 98744 800A7F44 00404234 */  ori        $v0, $v0, 0x4000
/* 98748 800A7F48 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 9874C 800A7F4C 0800E003 */  jr         $ra
/* 98750 800A7F50 1800BD27 */   addiu     $sp, $sp, 0x18
.size razPrepGlyph, . - razPrepGlyph
