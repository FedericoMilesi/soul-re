.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SCRIPTCountFramesInSpline
/* 2D78C 8003CF8C D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 2D790 8003CF90 2000B4AF */  sw         $s4, 0x20($sp)
/* 2D794 8003CF94 21A08000 */  addu       $s4, $a0, $zero
/* 2D798 8003CF98 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 2D79C 8003CF9C 21980000 */  addu       $s3, $zero, $zero
/* 2D7A0 8003CFA0 1800B2AF */  sw         $s2, 0x18($sp)
/* 2D7A4 8003CFA4 21906002 */  addu       $s2, $s3, $zero
/* 2D7A8 8003CFA8 2400BFAF */  sw         $ra, 0x24($sp)
/* 2D7AC 8003CFAC 1400B1AF */  sw         $s1, 0x14($sp)
/* 2D7B0 8003CFB0 37F4000C */  jal        ScriptGetPosSpline
/* 2D7B4 8003CFB4 1000B0AF */   sw        $s0, 0x10($sp)
/* 2D7B8 8003CFB8 21804000 */  addu       $s0, $v0, $zero
/* 2D7BC 8003CFBC 11000012 */  beqz       $s0, .L8003D004
/* 2D7C0 8003CFC0 00000000 */   nop
/* 2D7C4 8003CFC4 04000286 */  lh         $v0, 0x4($s0)
/* 2D7C8 8003CFC8 0000048E */  lw         $a0, 0x0($s0)
/* 2D7CC 8003CFCC 39004018 */  blez       $v0, .L8003D0B4
/* 2D7D0 8003CFD0 00000000 */   nop
/* 2D7D4 8003CFD4 21284000 */  addu       $a1, $v0, $zero
.L8003CFD8:
/* 2D7D8 8003CFD8 01006226 */  addiu      $v0, $s3, 0x1
/* 2D7DC 8003CFDC 21984000 */  addu       $s3, $v0, $zero
/* 2D7E0 8003CFE0 00008394 */  lhu        $v1, 0x0($a0)
/* 2D7E4 8003CFE4 20008424 */  addiu      $a0, $a0, 0x20
/* 2D7E8 8003CFE8 00140200 */  sll        $v0, $v0, 16
/* 2D7EC 8003CFEC 03140200 */  sra        $v0, $v0, 16
/* 2D7F0 8003CFF0 2A104500 */  slt        $v0, $v0, $a1
/* 2D7F4 8003CFF4 F8FF4014 */  bnez       $v0, .L8003CFD8
/* 2D7F8 8003CFF8 21904302 */   addu      $s2, $s2, $v1
/* 2D7FC 8003CFFC 2EF40008 */  j          .L8003D0B8
/* 2D800 8003D000 00141200 */   sll       $v0, $s2, 16
.L8003D004:
/* 2D804 8003D004 45F4000C */  jal        ScriptGetRotSpline
/* 2D808 8003D008 21208002 */   addu      $a0, $s4, $zero
/* 2D80C 8003D00C 21884000 */  addu       $s1, $v0, $zero
/* 2D810 8003D010 12002012 */  beqz       $s1, .L8003D05C
/* 2D814 8003D014 21208002 */   addu      $a0, $s4, $zero
/* 2D818 8003D018 04002386 */  lh         $v1, 0x4($s1)
/* 2D81C 8003D01C 0000248E */  lw         $a0, 0x0($s1)
/* 2D820 8003D020 2A100302 */  slt        $v0, $s0, $v1
/* 2D824 8003D024 24004010 */  beqz       $v0, .L8003D0B8
/* 2D828 8003D028 00141200 */   sll       $v0, $s2, 16
/* 2D82C 8003D02C 21286000 */  addu       $a1, $v1, $zero
.L8003D030:
/* 2D830 8003D030 01006226 */  addiu      $v0, $s3, 0x1
/* 2D834 8003D034 21984000 */  addu       $s3, $v0, $zero
/* 2D838 8003D038 00008394 */  lhu        $v1, 0x0($a0)
/* 2D83C 8003D03C 0A008424 */  addiu      $a0, $a0, 0xA
/* 2D840 8003D040 00140200 */  sll        $v0, $v0, 16
/* 2D844 8003D044 03140200 */  sra        $v0, $v0, 16
/* 2D848 8003D048 2A104500 */  slt        $v0, $v0, $a1
/* 2D84C 8003D04C F8FF4014 */  bnez       $v0, .L8003D030
/* 2D850 8003D050 21904302 */   addu      $s2, $s2, $v1
/* 2D854 8003D054 2EF40008 */  j          .L8003D0B8
/* 2D858 8003D058 00141200 */   sll       $v0, $s2, 16
.L8003D05C:
/* 2D85C 8003D05C 21280000 */  addu       $a1, $zero, $zero
/* 2D860 8003D060 6BF4000C */  jal        SCRIPT_GetMultiSpline
/* 2D864 8003D064 2130A000 */   addu      $a2, $a1, $zero
/* 2D868 8003D068 12004010 */  beqz       $v0, .L8003D0B4
/* 2D86C 8003D06C 00000000 */   nop
/* 2D870 8003D070 0800508C */  lw         $s0, 0x8($v0)
/* 2D874 8003D074 00000000 */  nop
/* 2D878 8003D078 04000386 */  lh         $v1, 0x4($s0)
/* 2D87C 8003D07C 0000048E */  lw         $a0, 0x0($s0)
/* 2D880 8003D080 2A102302 */  slt        $v0, $s1, $v1
/* 2D884 8003D084 0C004010 */  beqz       $v0, .L8003D0B8
/* 2D888 8003D088 00141200 */   sll       $v0, $s2, 16
/* 2D88C 8003D08C 21286000 */  addu       $a1, $v1, $zero
.L8003D090:
/* 2D890 8003D090 01006226 */  addiu      $v0, $s3, 0x1
/* 2D894 8003D094 21984000 */  addu       $s3, $v0, $zero
/* 2D898 8003D098 00008394 */  lhu        $v1, 0x0($a0)
/* 2D89C 8003D09C 20008424 */  addiu      $a0, $a0, 0x20
/* 2D8A0 8003D0A0 00140200 */  sll        $v0, $v0, 16
/* 2D8A4 8003D0A4 03140200 */  sra        $v0, $v0, 16
/* 2D8A8 8003D0A8 2A104500 */  slt        $v0, $v0, $a1
/* 2D8AC 8003D0AC F8FF4014 */  bnez       $v0, .L8003D090
/* 2D8B0 8003D0B0 21904302 */   addu      $s2, $s2, $v1
.L8003D0B4:
/* 2D8B4 8003D0B4 00141200 */  sll        $v0, $s2, 16
.L8003D0B8:
/* 2D8B8 8003D0B8 2400BF8F */  lw         $ra, 0x24($sp)
/* 2D8BC 8003D0BC 2000B48F */  lw         $s4, 0x20($sp)
/* 2D8C0 8003D0C0 1C00B38F */  lw         $s3, 0x1C($sp)
/* 2D8C4 8003D0C4 1800B28F */  lw         $s2, 0x18($sp)
/* 2D8C8 8003D0C8 1400B18F */  lw         $s1, 0x14($sp)
/* 2D8CC 8003D0CC 1000B08F */  lw         $s0, 0x10($sp)
/* 2D8D0 8003D0D0 03140200 */  sra        $v0, $v0, 16
/* 2D8D4 8003D0D4 0800E003 */  jr         $ra
/* 2D8D8 8003D0D8 2800BD27 */   addiu     $sp, $sp, 0x28
.size SCRIPTCountFramesInSpline, . - SCRIPTCountFramesInSpline
