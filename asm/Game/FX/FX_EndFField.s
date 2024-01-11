.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_EndFField
/* 3F6D0 8004EED0 649A838F */  lw         $v1, %gp_rel(FX_GeneralEffectTracker)($gp)
/* 3F6D4 8004EED4 00000000 */  nop
/* 3F6D8 8004EED8 1B006010 */  beqz       $v1, .L8004EF48
/* 3F6DC 8004EEDC 86000824 */   addiu     $t0, $zero, 0x86
/* 3F6E0 8004EEE0 00100624 */  addiu      $a2, $zero, 0x1000
/* 3F6E4 8004EEE4 01000724 */  addiu      $a3, $zero, 0x1
.L8004EEE8:
/* 3F6E8 8004EEE8 0800628C */  lw         $v0, 0x8($v1)
/* 3F6EC 8004EEEC 00000000 */  nop
/* 3F6F0 8004EEF0 11004414 */  bne        $v0, $a0, .L8004EF38
/* 3F6F4 8004EEF4 00000000 */   nop
/* 3F6F8 8004EEF8 0C006290 */  lbu        $v0, 0xC($v1)
/* 3F6FC 8004EEFC 00000000 */  nop
/* 3F700 8004EF00 0D004814 */  bne        $v0, $t0, .L8004EF38
/* 3F704 8004EF04 00000000 */   nop
/* 3F708 8004EF08 22006284 */  lh         $v0, 0x22($v1)
/* 3F70C 8004EF0C 22006594 */  lhu        $a1, 0x22($v1)
/* 3F710 8004EF10 08004010 */  beqz       $v0, .L8004EF34
/* 3F714 8004EF14 2310C500 */   subu      $v0, $a2, $a1
/* 3F718 8004EF18 240062A4 */  sh         $v0, 0x24($v1)
/* 3F71C 8004EF1C 24006284 */  lh         $v0, 0x24($v1)
/* 3F720 8004EF20 00000000 */  nop
/* 3F724 8004EF24 04004014 */  bnez       $v0, .L8004EF38
/* 3F728 8004EF28 220060A4 */   sh        $zero, 0x22($v1)
/* 3F72C 8004EF2C CE3B0108 */  j          .L8004EF38
/* 3F730 8004EF30 240067A4 */   sh        $a3, 0x24($v1)
.L8004EF34:
/* 3F734 8004EF34 240066A4 */  sh         $a2, 0x24($v1)
.L8004EF38:
/* 3F738 8004EF38 0000638C */  lw         $v1, 0x0($v1)
/* 3F73C 8004EF3C 00000000 */  nop
/* 3F740 8004EF40 E9FF6014 */  bnez       $v1, .L8004EEE8
/* 3F744 8004EF44 00000000 */   nop
.L8004EF48:
/* 3F748 8004EF48 0800E003 */  jr         $ra
/* 3F74C 8004EF4C 00000000 */   nop
.size FX_EndFField, . - FX_EndFField
