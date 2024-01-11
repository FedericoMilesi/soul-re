.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel HUMAN_Idle
/* 6DDA8 8007D5A8 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 6DDAC 8007D5AC 1400B1AF */  sw         $s1, 0x14($sp)
/* 6DDB0 8007D5B0 21888000 */  addu       $s1, $a0, $zero
/* 6DDB4 8007D5B4 1800BFAF */  sw         $ra, 0x18($sp)
/* 6DDB8 8007D5B8 1000B0AF */  sw         $s0, 0x10($sp)
/* 6DDBC 8007D5BC 6C01308E */  lw         $s0, 0x16C($s1)
/* 6DDC0 8007D5C0 2400278E */  lw         $a3, 0x24($s1)
/* 6DDC4 8007D5C4 0000028E */  lw         $v0, 0x0($s0)
/* 6DDC8 8007D5C8 CC00038E */  lw         $v1, 0xCC($s0)
/* 6DDCC 8007D5CC C400048E */  lw         $a0, 0xC4($s0)
/* 6DDD0 8007D5D0 04004230 */  andi       $v0, $v0, 0x4
/* 6DDD4 8007D5D4 5B004014 */  bnez       $v0, .L8007D744
/* 6DDD8 8007D5D8 00000000 */   nop
/* 6DDDC 8007D5DC 59006010 */  beqz       $v1, .L8007D744
/* 6DDE0 8007D5E0 00000000 */   nop
/* 6DDE4 8007D5E4 16006294 */  lhu        $v0, 0x16($v1)
/* 6DDE8 8007D5E8 00000000 */  nop
/* 6DDEC 8007D5EC 04004230 */  andi       $v0, $v0, 0x4
/* 6DDF0 8007D5F0 54004010 */  beqz       $v0, .L8007D744
/* 6DDF4 8007D5F4 00000000 */   nop
/* 6DDF8 8007D5F8 0400058E */  lw         $a1, 0x4($s0)
/* 6DDFC 8007D5FC 00000000 */  nop
/* 6DE00 8007D600 0200A230 */  andi       $v0, $a1, 0x2
/* 6DE04 8007D604 12004010 */  beqz       $v0, .L8007D650
/* 6DE08 8007D608 0100A230 */   andi      $v0, $a1, 0x1
/* 6DE0C 8007D60C 21202002 */  addu       $a0, $s1, $zero
/* 6DE10 8007D610 6801028E */  lw         $v0, 0x168($s0)
/* 6DE14 8007D614 0400658C */  lw         $a1, 0x4($v1)
/* 6DE18 8007D618 1C004684 */  lh         $a2, 0x1C($v0)
/* 6DE1C 8007D61C 6604020C */  jal        MON_TurnToPosition
/* 6DE20 8007D620 5C00A524 */   addiu     $a1, $a1, 0x5C
/* 6DE24 8007D624 1800228E */  lw         $v0, 0x18($s1)
/* 6DE28 8007D628 00000000 */  nop
/* 6DE2C 8007D62C 02004230 */  andi       $v0, $v0, 0x2
/* 6DE30 8007D630 40004010 */  beqz       $v0, .L8007D734
/* 6DE34 8007D634 FDFF0324 */   addiu     $v1, $zero, -0x3
/* 6DE38 8007D638 0400028E */  lw         $v0, 0x4($s0)
/* 6DE3C 8007D63C 00000000 */  nop
/* 6DE40 8007D640 24104300 */  and        $v0, $v0, $v1
/* 6DE44 8007D644 01004234 */  ori        $v0, $v0, 0x1
/* 6DE48 8007D648 CDF50108 */  j          .L8007D734
/* 6DE4C 8007D64C 040002AE */   sw        $v0, 0x4($s0)
.L8007D650:
/* 6DE50 8007D650 16004010 */  beqz       $v0, .L8007D6AC
/* 6DE54 8007D654 0400A230 */   andi      $v0, $a1, 0x4
/* 6DE58 8007D658 14006284 */  lh         $v0, 0x14($v1)
/* 6DE5C 8007D65C 00000000 */  nop
/* 6DE60 8007D660 D0074228 */  slti       $v0, $v0, 0x7D0
/* 6DE64 8007D664 08004010 */  beqz       $v0, .L8007D688
/* 6DE68 8007D668 00000000 */   nop
/* 6DE6C 8007D66C 31008010 */  beqz       $a0, .L8007D734
/* 6DE70 8007D670 00000000 */   nop
/* 6DE74 8007D674 14008284 */  lh         $v0, 0x14($a0)
/* 6DE78 8007D678 00000000 */  nop
/* 6DE7C 8007D67C D0074228 */  slti       $v0, $v0, 0x7D0
/* 6DE80 8007D680 2C004010 */  beqz       $v0, .L8007D734
/* 6DE84 8007D684 00000000 */   nop
.L8007D688:
/* 6DE88 8007D688 21202002 */  addu       $a0, $s1, $zero
/* 6DE8C 8007D68C 01000624 */  addiu      $a2, $zero, 0x1
/* 6DE90 8007D690 FEFF0224 */  addiu      $v0, $zero, -0x2
/* 6DE94 8007D694 2410A200 */  and        $v0, $a1, $v0
/* 6DE98 8007D698 04004234 */  ori        $v0, $v0, 0x4
/* 6DE9C 8007D69C 040002AE */  sw         $v0, 0x4($s0)
/* 6DEA0 8007D6A0 0800E58C */  lw         $a1, 0x8($a3)
/* 6DEA4 8007D6A4 CBF50108 */  j          .L8007D72C
/* 6DEA8 8007D6A8 2138C000 */   addu      $a3, $a2, $zero
.L8007D6AC:
/* 6DEAC 8007D6AC 0D004010 */  beqz       $v0, .L8007D6E4
/* 6DEB0 8007D6B0 00000000 */   nop
/* 6DEB4 8007D6B4 1800228E */  lw         $v0, 0x18($s1)
/* 6DEB8 8007D6B8 00000000 */  nop
/* 6DEBC 8007D6BC 10004230 */  andi       $v0, $v0, 0x10
/* 6DEC0 8007D6C0 1C004010 */  beqz       $v0, .L8007D734
/* 6DEC4 8007D6C4 FBFF0224 */   addiu     $v0, $zero, -0x5
/* 6DEC8 8007D6C8 2410A200 */  and        $v0, $a1, $v0
/* 6DECC 8007D6CC 040002AE */  sw         $v0, 0x4($s0)
/* 6DED0 8007D6D0 21202002 */  addu       $a0, $s1, $zero
/* 6DED4 8007D6D4 3403020C */  jal        MON_PlayRandomIdle
/* 6DED8 8007D6D8 02000524 */   addiu     $a1, $zero, 0x2
/* 6DEDC 8007D6DC CDF50108 */  j          .L8007D734
/* 6DEE0 8007D6E0 00000000 */   nop
.L8007D6E4:
/* 6DEE4 8007D6E4 14006284 */  lh         $v0, 0x14($v1)
/* 6DEE8 8007D6E8 00000000 */  nop
/* 6DEEC 8007D6EC D0074228 */  slti       $v0, $v0, 0x7D0
/* 6DEF0 8007D6F0 14004010 */  beqz       $v0, .L8007D744
/* 6DEF4 8007D6F4 00000000 */   nop
/* 6DEF8 8007D6F8 06008010 */  beqz       $a0, .L8007D714
/* 6DEFC 8007D6FC 00000000 */   nop
/* 6DF00 8007D700 14008284 */  lh         $v0, 0x14($a0)
/* 6DF04 8007D704 00000000 */  nop
/* 6DF08 8007D708 D0074228 */  slti       $v0, $v0, 0x7D0
/* 6DF0C 8007D70C 0D004014 */  bnez       $v0, .L8007D744
/* 6DF10 8007D710 00000000 */   nop
.L8007D714:
/* 6DF14 8007D714 21202002 */  addu       $a0, $s1, $zero
/* 6DF18 8007D718 21300000 */  addu       $a2, $zero, $zero
/* 6DF1C 8007D71C 0200A234 */  ori        $v0, $a1, 0x2
/* 6DF20 8007D720 040002AE */  sw         $v0, 0x4($s0)
/* 6DF24 8007D724 0800E58C */  lw         $a1, 0x8($a3)
/* 6DF28 8007D728 02000724 */  addiu      $a3, $zero, 0x2
.L8007D72C:
/* 6DF2C 8007D72C 6FFF010C */  jal        MON_PlayAnimFromList
/* 6DF30 8007D730 00000000 */   nop
.L8007D734:
/* 6DF34 8007D734 0917020C */  jal        MON_DefaultQueueHandler
/* 6DF38 8007D738 21202002 */   addu      $a0, $s1, $zero
/* 6DF3C 8007D73C D3F50108 */  j          .L8007D74C
/* 6DF40 8007D740 00000000 */   nop
.L8007D744:
/* 6DF44 8007D744 DD28020C */  jal        MON_Idle
/* 6DF48 8007D748 21202002 */   addu      $a0, $s1, $zero
.L8007D74C:
/* 6DF4C 8007D74C 1800BF8F */  lw         $ra, 0x18($sp)
/* 6DF50 8007D750 1400B18F */  lw         $s1, 0x14($sp)
/* 6DF54 8007D754 1000B08F */  lw         $s0, 0x10($sp)
/* 6DF58 8007D758 0800E003 */  jr         $ra
/* 6DF5C 8007D75C 2000BD27 */   addiu     $sp, $sp, 0x20
.size HUMAN_Idle, . - HUMAN_Idle
