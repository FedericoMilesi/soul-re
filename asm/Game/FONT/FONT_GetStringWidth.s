.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FONT_GetStringWidth
/* 1DFEC 8002D7EC D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 1DFF0 8002D7F0 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 1DFF4 8002D7F4 21988000 */  addu       $s3, $a0, $zero
/* 1DFF8 8002D7F8 2000BFAF */  sw         $ra, 0x20($sp)
/* 1DFFC 8002D7FC 1800B2AF */  sw         $s2, 0x18($sp)
/* 1E000 8002D800 1400B1AF */  sw         $s1, 0x14($sp)
/* 1E004 8002D804 ACF4020C */  jal        strlen
/* 1E008 8002D808 1000B0AF */   sw        $s0, 0x10($sp)
/* 1E00C 8002D80C 21800000 */  addu       $s0, $zero, $zero
/* 1E010 8002D810 21904000 */  addu       $s2, $v0, $zero
/* 1E014 8002D814 0A00401A */  blez       $s2, .L8002D840
/* 1E018 8002D818 21880002 */   addu      $s1, $s0, $zero
/* 1E01C 8002D81C 21107002 */  addu       $v0, $s3, $s0
.L8002D820:
/* 1E020 8002D820 00004490 */  lbu        $a0, 0x0($v0)
/* 1E024 8002D824 01001026 */  addiu      $s0, $s0, 0x1
/* 1E028 8002D828 57B5000C */  jal        FONT_CharSpacing
/* 1E02C 8002D82C 08000524 */   addiu     $a1, $zero, 0x8
/* 1E030 8002D830 21882202 */  addu       $s1, $s1, $v0
/* 1E034 8002D834 2A101202 */  slt        $v0, $s0, $s2
/* 1E038 8002D838 F9FF4014 */  bnez       $v0, .L8002D820
/* 1E03C 8002D83C 21107002 */   addu      $v0, $s3, $s0
.L8002D840:
/* 1E040 8002D840 21102002 */  addu       $v0, $s1, $zero
/* 1E044 8002D844 2000BF8F */  lw         $ra, 0x20($sp)
/* 1E048 8002D848 1C00B38F */  lw         $s3, 0x1C($sp)
/* 1E04C 8002D84C 1800B28F */  lw         $s2, 0x18($sp)
/* 1E050 8002D850 1400B18F */  lw         $s1, 0x14($sp)
/* 1E054 8002D854 1000B08F */  lw         $s0, 0x10($sp)
/* 1E058 8002D858 0800E003 */  jr         $ra
/* 1E05C 8002D85C 2800BD27 */   addiu     $sp, $sp, 0x28
.size FONT_GetStringWidth, . - FONT_GetStringWidth
