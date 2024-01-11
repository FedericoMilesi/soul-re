.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BD714
/* ADF14 800BD714 45008290 */  lbu        $v0, 0x45($a0)
/* ADF18 800BD718 37008590 */  lbu        $a1, 0x37($a0)
/* ADF1C 800BD71C 00000000 */  nop
/* ADF20 800BD720 0600A010 */  beqz       $a1, .L800BD73C
/* ADF24 800BD724 FDFF4324 */   addiu     $v1, $v0, -0x3
/* ADF28 800BD728 4D000224 */  addiu      $v0, $zero, 0x4D
/* ADF2C 800BD72C 1500A210 */  beq        $a1, $v0, .L800BD784
/* ADF30 800BD730 00000000 */   nop
/* ADF34 800BD734 E9F50208 */  j          .L800BD7A4
/* ADF38 800BD738 00000000 */   nop
.L800BD73C:
/* ADF3C 800BD73C 06006228 */  slti       $v0, $v1, 0x6
/* ADF40 800BD740 05004010 */  beqz       $v0, .L800BD758
/* ADF44 800BD744 21108300 */   addu      $v0, $a0, $v1
/* ADF48 800BD748 57004290 */  lbu        $v0, 0x57($v0)
/* ADF4C 800BD74C 00000000 */  nop
/* ADF50 800BD750 1D004010 */  beqz       $v0, .L800BD7C8
/* ADF54 800BD754 21100000 */   addu      $v0, $zero, $zero
.L800BD758:
/* ADF58 800BD758 34008290 */  lbu        $v0, 0x34($a0)
/* ADF5C 800BD75C 00000000 */  nop
/* ADF60 800BD760 2A106200 */  slt        $v0, $v1, $v0
/* ADF64 800BD764 18004010 */  beqz       $v0, .L800BD7C8
/* ADF68 800BD768 21100000 */   addu      $v0, $zero, $zero
/* ADF6C 800BD76C 2800828C */  lw         $v0, 0x28($a0)
/* ADF70 800BD770 00000000 */  nop
/* ADF74 800BD774 21104300 */  addu       $v0, $v0, $v1
.L800BD778:
/* ADF78 800BD778 00004290 */  lbu        $v0, 0x0($v0)
/* ADF7C 800BD77C F2F50208 */  j          .L800BD7C8
/* ADF80 800BD780 00000000 */   nop
.L800BD784:
/* ADF84 800BD784 36008290 */  lbu        $v0, 0x36($a0)
/* ADF88 800BD788 00000000 */  nop
/* ADF8C 800BD78C 2A106200 */  slt        $v0, $v1, $v0
/* ADF90 800BD790 0D004010 */  beqz       $v0, .L800BD7C8
/* ADF94 800BD794 FF000224 */   addiu     $v0, $zero, 0xFF
/* ADF98 800BD798 2C00828C */  lw         $v0, 0x2C($a0)
/* ADF9C 800BD79C DEF50208 */  j          .L800BD778
/* ADFA0 800BD7A0 21104300 */   addu      $v0, $v0, $v1
.L800BD7A4:
/* ADFA4 800BD7A4 36008290 */  lbu        $v0, 0x36($a0)
/* ADFA8 800BD7A8 00000000 */  nop
/* ADFAC 800BD7AC 2A106200 */  slt        $v0, $v1, $v0
/* ADFB0 800BD7B0 05004010 */  beqz       $v0, .L800BD7C8
/* ADFB4 800BD7B4 21100000 */   addu      $v0, $zero, $zero
/* ADFB8 800BD7B8 2C00828C */  lw         $v0, 0x2C($a0)
/* ADFBC 800BD7BC 00000000 */  nop
/* ADFC0 800BD7C0 21104300 */  addu       $v0, $v0, $v1
/* ADFC4 800BD7C4 00004290 */  lbu        $v0, 0x0($v0)
.L800BD7C8:
/* ADFC8 800BD7C8 0800E003 */  jr         $ra
/* ADFCC 800BD7CC 00000000 */   nop
.size func_800BD714, . - func_800BD714
