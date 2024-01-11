.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel HUMAN_DeadEntry
/* 6D8BC 8007D0BC E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 6D8C0 8007D0C0 1400B1AF */  sw         $s1, 0x14($sp)
/* 6D8C4 8007D0C4 21888000 */  addu       $s1, $a0, $zero
/* 6D8C8 8007D0C8 1800BFAF */  sw         $ra, 0x18($sp)
/* 6D8CC 8007D0CC 1000B0AF */  sw         $s0, 0x10($sp)
/* 6D8D0 8007D0D0 6C01308E */  lw         $s0, 0x16C($s1)
/* 6D8D4 8007D0D4 00000000 */  nop
/* 6D8D8 8007D0D8 48010286 */  lh         $v0, 0x148($s0)
/* 6D8DC 8007D0DC 00000000 */  nop
/* 6D8E0 8007D0E0 02004104 */  bgez       $v0, .L8007D0EC
/* 6D8E4 8007D0E4 00000000 */   nop
/* 6D8E8 8007D0E8 03004224 */  addiu      $v0, $v0, 0x3
.L8007D0EC:
/* 6D8EC 8007D0EC 83100200 */  sra        $v0, $v0, 2
/* 6D8F0 8007D0F0 480102A6 */  sh         $v0, 0x148($s0)
/* 6D8F4 8007D0F4 01104228 */  slti       $v0, $v0, 0x1001
/* 6D8F8 8007D0F8 02004014 */  bnez       $v0, .L8007D104
/* 6D8FC 8007D0FC 00100224 */   addiu     $v0, $zero, 0x1000
/* 6D900 8007D100 480102A6 */  sh         $v0, 0x148($s0)
.L8007D104:
/* 6D904 8007D104 271E020C */  jal        MON_DeadEntry
/* 6D908 8007D108 21202002 */   addu      $a0, $s1, $zero
/* 6D90C 8007D10C 9006020C */  jal        MON_GetTime
/* 6D910 8007D110 21202002 */   addu      $a0, $s1, $zero
/* 6D914 8007D114 21202002 */  addu       $a0, $s1, $zero
/* 6D918 8007D118 E910020C */  jal        MON_BirthMana
/* 6D91C 8007D11C 0C0102AE */   sw        $v0, 0x10C($s0)
/* 6D920 8007D120 1800BF8F */  lw         $ra, 0x18($sp)
/* 6D924 8007D124 1400B18F */  lw         $s1, 0x14($sp)
/* 6D928 8007D128 1000B08F */  lw         $s0, 0x10($sp)
/* 6D92C 8007D12C 0800E003 */  jr         $ra
/* 6D930 8007D130 2000BD27 */   addiu     $sp, $sp, 0x20
.size HUMAN_DeadEntry, . - HUMAN_DeadEntry
