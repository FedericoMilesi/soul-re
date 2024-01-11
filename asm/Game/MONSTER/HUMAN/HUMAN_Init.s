.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel HUMAN_Init
/* 6D6B4 8007CEB4 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 6D6B8 8007CEB8 1400B1AF */  sw         $s1, 0x14($sp)
/* 6D6BC 8007CEBC 21888000 */  addu       $s1, $a0, $zero
/* 6D6C0 8007CEC0 1800BFAF */  sw         $ra, 0x18($sp)
/* 6D6C4 8007CEC4 1000B0AF */  sw         $s0, 0x10($sp)
/* 6D6C8 8007CEC8 2400228E */  lw         $v0, 0x24($s1)
/* 6D6CC 8007CECC 00000000 */  nop
/* 6D6D0 8007CED0 1000428C */  lw         $v0, 0x10($v0)
/* 6D6D4 8007CED4 6C01308E */  lw         $s0, 0x16C($s1)
/* 6D6D8 8007CED8 00204230 */  andi       $v0, $v0, 0x2000
/* 6D6DC 8007CEDC 1C004014 */  bnez       $v0, .L8007CF50
/* 6D6E0 8007CEE0 00000000 */   nop
/* 6D6E4 8007CEE4 40A8828F */  lw         $v0, %gp_rel(GlobalSave)($gp)
/* 6D6E8 8007CEE8 6801038E */  lw         $v1, 0x168($s0)
/* 6D6EC 8007CEEC 0C004284 */  lh         $v0, 0xC($v0)
/* 6D6F0 8007CEF0 0C00658C */  lw         $a1, 0xC($v1)
/* 6D6F4 8007CEF4 0C004018 */  blez       $v0, .L8007CF28
/* 6D6F8 8007CEF8 FEFF0324 */   addiu     $v1, $zero, -0x2
/* 6D6FC 8007CEFC 0000A28C */  lw         $v0, 0x0($a1)
/* 6D700 8007CF00 00000000 */  nop
/* 6D704 8007CF04 24104300 */  and        $v0, $v0, $v1
/* 6D708 8007CF08 0000A2AC */  sw         $v0, 0x0($a1)
/* 6D70C 8007CF0C 0C00A28C */  lw         $v0, 0xC($a1)
/* 6D710 8007CF10 0400A38C */  lw         $v1, 0x4($a1)
/* 6D714 8007CF14 01004234 */  ori        $v0, $v0, 0x1
/* 6D718 8007CF18 01006334 */  ori        $v1, $v1, 0x1
/* 6D71C 8007CF1C 0C00A2AC */  sw         $v0, 0xC($a1)
/* 6D720 8007CF20 D4F30108 */  j          .L8007CF50
/* 6D724 8007CF24 0400A3AC */   sw        $v1, 0x4($a1)
.L8007CF28:
/* 6D728 8007CF28 FEFF0424 */  addiu      $a0, $zero, -0x2
/* 6D72C 8007CF2C 0C00A28C */  lw         $v0, 0xC($a1)
/* 6D730 8007CF30 0000A38C */  lw         $v1, 0x0($a1)
/* 6D734 8007CF34 24104400 */  and        $v0, $v0, $a0
/* 6D738 8007CF38 0C00A2AC */  sw         $v0, 0xC($a1)
/* 6D73C 8007CF3C 0400A28C */  lw         $v0, 0x4($a1)
/* 6D740 8007CF40 01006334 */  ori        $v1, $v1, 0x1
/* 6D744 8007CF44 0000A3AC */  sw         $v1, 0x0($a1)
/* 6D748 8007CF48 24104400 */  and        $v0, $v0, $a0
/* 6D74C 8007CF4C 0400A2AC */  sw         $v0, 0x4($a1)
.L8007CF50:
/* 6D750 8007CF50 1C00228E */  lw         $v0, 0x1C($s1)
/* 6D754 8007CF54 0D80053C */  lui        $a1, %hi(HUMAN_FunctionTable + 0x20)
/* 6D758 8007CF58 2400448C */  lw         $a0, 0x24($v0)
/* 6D75C 8007CF5C 1CD2010C */  jal        strcmpi
/* 6D760 8007CF60 BC1AA524 */   addiu     $a1, $a1, %lo(HUMAN_FunctionTable + 0x20)
/* 6D764 8007CF64 05004014 */  bnez       $v0, .L8007CF7C
/* 6D768 8007CF68 00000000 */   nop
/* 6D76C 8007CF6C 0400028E */  lw         $v0, 0x4($s0)
/* 6D770 8007CF70 00000000 */  nop
/* 6D774 8007CF74 20004234 */  ori        $v0, $v0, 0x20
/* 6D778 8007CF78 040002AE */  sw         $v0, 0x4($s0)
.L8007CF7C:
/* 6D77C 8007CF7C 3933020C */  jal        MON_DefaultInit
/* 6D780 8007CF80 21202002 */   addu      $a0, $s1, $zero
/* 6D784 8007CF84 0000028E */  lw         $v0, 0x0($s0)
/* 6D788 8007CF88 00400324 */  addiu      $v1, $zero, 0x4000
/* 6D78C 8007CF8C 480103A6 */  sh         $v1, 0x148($s0)
/* 6D790 8007CF90 00204234 */  ori        $v0, $v0, 0x2000
/* 6D794 8007CF94 000002AE */  sw         $v0, 0x0($s0)
/* 6D798 8007CF98 1800BF8F */  lw         $ra, 0x18($sp)
/* 6D79C 8007CF9C 1400B18F */  lw         $s1, 0x14($sp)
/* 6D7A0 8007CFA0 1000B08F */  lw         $s0, 0x10($sp)
/* 6D7A4 8007CFA4 0800E003 */  jr         $ra
/* 6D7A8 8007CFA8 2000BD27 */   addiu     $sp, $sp, 0x20
.size HUMAN_Init, . - HUMAN_Init
