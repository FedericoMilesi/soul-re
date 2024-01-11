.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FONT_Print
/* 1DF0C 8002D70C 0000A4AF */  sw         $a0, 0x0($sp)
/* 1DF10 8002D710 0400A5AF */  sw         $a1, 0x4($sp)
/* 1DF14 8002D714 0800A6AF */  sw         $a2, 0x8($sp)
/* 1DF18 8002D718 0C00A7AF */  sw         $a3, 0xC($sp)
/* 1DF1C 8002D71C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 1DF20 8002D720 21288000 */  addu       $a1, $a0, $zero
/* 1DF24 8002D724 1800A4AF */  sw         $a0, 0x18($sp)
/* 1DF28 8002D728 E4B18427 */  addiu      $a0, $gp, %gp_rel(fp_str)
/* 1DF2C 8002D72C 1000B0AF */  sw         $s0, 0x10($sp)
/* 1DF30 8002D730 1C00B027 */  addiu      $s0, $sp, 0x1C
/* 1DF34 8002D734 1400BFAF */  sw         $ra, 0x14($sp)
/* 1DF38 8002D738 26D1010C */  jal        vsprintf
/* 1DF3C 8002D73C 21300002 */   addu      $a2, $s0, $zero
/* 1DF40 8002D740 E4B18293 */  lbu        $v0, %gp_rel(fp_str)($gp)
/* 1DF44 8002D744 E4B18327 */  addiu      $v1, $gp, %gp_rel(fp_str)
/* 1DF48 8002D748 0D004010 */  beqz       $v0, .L8002D780
/* 1DF4C 8002D74C 00000000 */   nop
.L8002D750:
/* 1DF50 8002D750 00006490 */  lbu        $a0, 0x0($v1)
/* 1DF54 8002D754 00000000 */  nop
/* 1DF58 8002D758 BFFF8224 */  addiu      $v0, $a0, -0x41
/* 1DF5C 8002D75C 1A00422C */  sltiu      $v0, $v0, 0x1A
/* 1DF60 8002D760 02004010 */  beqz       $v0, .L8002D76C
/* 1DF64 8002D764 20008224 */   addiu     $v0, $a0, 0x20
/* 1DF68 8002D768 000062A0 */  sb         $v0, 0x0($v1)
.L8002D76C:
/* 1DF6C 8002D76C 01006324 */  addiu      $v1, $v1, 0x1
/* 1DF70 8002D770 00006290 */  lbu        $v0, 0x0($v1)
/* 1DF74 8002D774 00000000 */  nop
/* 1DF78 8002D778 F5FF4014 */  bnez       $v0, .L8002D750
/* 1DF7C 8002D77C 00000000 */   nop
.L8002D780:
/* 1DF80 8002D780 E4B18427 */  addiu      $a0, $gp, %gp_rel(fp_str)
/* 1DF84 8002D784 44B6000C */  jal        FONT_VaReallyPrint
/* 1DF88 8002D788 21280002 */   addu      $a1, $s0, $zero
/* 1DF8C 8002D78C 1400BF8F */  lw         $ra, 0x14($sp)
/* 1DF90 8002D790 1000B08F */  lw         $s0, 0x10($sp)
/* 1DF94 8002D794 0800E003 */  jr         $ra
/* 1DF98 8002D798 1800BD27 */   addiu     $sp, $sp, 0x18
.size FONT_Print, . - FONT_Print
