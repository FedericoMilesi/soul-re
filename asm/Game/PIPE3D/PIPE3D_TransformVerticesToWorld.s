.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel PIPE3D_TransformVerticesToWorld
/* 2B590 8003AD90 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 2B594 8003AD94 3000B2AF */  sw         $s2, 0x30($sp)
/* 2B598 8003AD98 2190A000 */  addu       $s2, $a1, $zero
/* 2B59C 8003AD9C 4C00BFAF */  sw         $ra, 0x4C($sp)
/* 2B5A0 8003ADA0 4800BEAF */  sw         $fp, 0x48($sp)
/* 2B5A4 8003ADA4 4400B7AF */  sw         $s7, 0x44($sp)
/* 2B5A8 8003ADA8 4000B6AF */  sw         $s6, 0x40($sp)
/* 2B5AC 8003ADAC 3C00B5AF */  sw         $s5, 0x3C($sp)
/* 2B5B0 8003ADB0 3800B4AF */  sw         $s4, 0x38($sp)
/* 2B5B4 8003ADB4 3400B3AF */  sw         $s3, 0x34($sp)
/* 2B5B8 8003ADB8 2C00B1AF */  sw         $s1, 0x2C($sp)
/* 2B5BC 8003ADBC 2800B0AF */  sw         $s0, 0x28($sp)
/* 2B5C0 8003ADC0 5000A4AF */  sw         $a0, 0x50($sp)
/* 2B5C4 8003ADC4 1C00838C */  lw         $v1, 0x1C($a0)
/* 2B5C8 8003ADC8 26018284 */  lh         $v0, 0x126($a0)
/* 2B5CC 8003ADCC 0C00638C */  lw         $v1, 0xC($v1)
/* 2B5D0 8003ADD0 80100200 */  sll        $v0, $v0, 2
/* 2B5D4 8003ADD4 21104300 */  addu       $v0, $v0, $v1
/* 2B5D8 8003ADD8 0000578C */  lw         $s7, 0x0($v0)
/* 2B5DC 8003ADDC 21A8C000 */  addu       $s5, $a2, $zero
/* 2B5E0 8003ADE0 0400E88E */  lw         $t0, 0x4($s7)
/* 2B5E4 8003ADE4 21F0E000 */  addu       $fp, $a3, $zero
/* 2B5E8 8003ADE8 2000A8AF */  sw         $t0, 0x20($sp)
/* 2B5EC 8003ADEC 1C00E38E */  lw         $v1, 0x1C($s7)
/* 2B5F0 8003ADF0 0D80023C */  lui        $v0, %hi(identityMatrix + 0x18)
/* 2B5F4 8003ADF4 140D4824 */  addiu      $t0, $v0, %lo(identityMatrix + 0x18)
/* 2B5F8 8003ADF8 03000989 */  lwl        $t1, 0x3($t0)
/* 2B5FC 8003ADFC 00000999 */  lwr        $t1, 0x0($t0)
/* 2B600 8003AE00 07000A89 */  lwl        $t2, 0x7($t0)
/* 2B604 8003AE04 04000A99 */  lwr        $t2, 0x4($t0)
/* 2B608 8003AE08 1300A9AB */  swl        $t1, 0x13($sp)
/* 2B60C 8003AE0C 1000A9BB */  swr        $t1, 0x10($sp)
/* 2B610 8003AE10 1700AAAB */  swl        $t2, 0x17($sp)
/* 2B614 8003AE14 1400AABB */  swr        $t2, 0x14($sp)
/* 2B618 8003AE18 0D80023C */  lui        $v0, %hi(identityMatrix + 0x20)
/* 2B61C 8003AE1C 1C0D4824 */  addiu      $t0, $v0, %lo(identityMatrix + 0x20)
/* 2B620 8003AE20 03000989 */  lwl        $t1, 0x3($t0)
/* 2B624 8003AE24 00000999 */  lwr        $t1, 0x0($t0)
/* 2B628 8003AE28 07000A89 */  lwl        $t2, 0x7($t0)
/* 2B62C 8003AE2C 04000A99 */  lwr        $t2, 0x4($t0)
/* 2B630 8003AE30 1B00A9AB */  swl        $t1, 0x1B($sp)
/* 2B634 8003AE34 1800A9BB */  swr        $t1, 0x18($sp)
/* 2B638 8003AE38 1F00AAAB */  swl        $t2, 0x1F($sp)
/* 2B63C 8003AE3C 1C00AABB */  swr        $t2, 0x1C($sp)
/* 2B640 8003AE40 0000C0AF */  sw         $zero, 0x0($fp)
/* 2B644 8003AE44 0400C0AF */  sw         $zero, 0x4($fp)
/* 2B648 8003AE48 0800C0AF */  sw         $zero, 0x8($fp)
/* 2B64C 8003AE4C 1800E28E */  lw         $v0, 0x18($s7)
/* 2B650 8003AE50 21980000 */  addu       $s3, $zero, $zero
/* 2B654 8003AE54 5E004018 */  blez       $v0, .L8003AFD0
/* 2B658 8003AE58 2400B2AF */   sw        $s2, 0x24($sp)
/* 2B65C 8003AE5C 08007424 */  addiu      $s4, $v1, 0x8
.L8003AE60:
/* 2B660 8003AE60 02008386 */  lh         $v1, 0x2($s4)
/* 2B664 8003AE64 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 2B668 8003AE68 54006210 */  beq        $v1, $v0, .L8003AFBC
/* 2B66C 8003AE6C 40111300 */   sll       $v0, $s3, 5
/* 2B670 8003AE70 5000A98F */  lw         $t1, 0x50($sp)
/* 2B674 8003AE74 00009086 */  lh         $s0, 0x0($s4)
/* 2B678 8003AE78 2000AA8F */  lw         $t2, 0x20($sp)
/* 2B67C 8003AE7C C0801000 */  sll        $s0, $s0, 3
/* 2B680 8003AE80 4000318D */  lw         $s1, 0x40($t1)
/* 2B684 8003AE84 21805001 */  addu       $s0, $t2, $s0
/* 2B688 8003AE88 21882202 */  addu       $s1, $s1, $v0
/* 2B68C 8003AE8C 21202002 */  addu       $a0, $s1, $zero
/* 2B690 8003AE90 C0100300 */  sll        $v0, $v1, 3
/* 2B694 8003AE94 52F2020C */  jal        func_800BC948
/* 2B698 8003AE98 21B04201 */   addu      $s6, $t2, $v0
/* 2B69C 8003AE9C 4AF2020C */  jal        func_800BC928
/* 2B6A0 8003AEA0 21202002 */   addu      $a0, $s1, $zero
/* 2B6A4 8003AEA4 2B10D002 */  sltu       $v0, $s6, $s0
/* 2B6A8 8003AEA8 44004014 */  bnez       $v0, .L8003AFBC
/* 2B6AC 8003AEAC 00000000 */   nop
/* 2B6B0 8003AEB0 04004426 */  addiu      $a0, $s2, 0x4
.L8003AEB4:
/* 2B6B4 8003AEB4 000000CA */  lwc2       $0, 0x0($s0)
/* 2B6B8 8003AEB8 040001CA */  lwc2       $1, 0x4($s0)
/* 2B6BC 8003AEBC 00000000 */  nop
/* 2B6C0 8003AEC0 00000000 */  nop
/* 2B6C4 8003AEC4 1200484A */  MVMVA      1, 0, 0, 0, 0
/* 2B6C8 8003AEC8 0000B3AE */  sw         $s3, 0x0($s5)
/* 2B6CC 8003AECC 0400B526 */  addiu      $s5, $s5, 0x4
/* 2B6D0 8003AED0 08001026 */  addiu      $s0, $s0, 0x8
/* 2B6D4 8003AED4 00480C48 */  mfc2       $t4, $9 # handwritten instruction
/* 2B6D8 8003AED8 00500D48 */  mfc2       $t5, $10 # handwritten instruction
/* 2B6DC 8003AEDC 00580E48 */  mfc2       $t6, $11 # handwritten instruction
/* 2B6E0 8003AEE0 00004CA6 */  sh         $t4, 0x0($s2)
/* 2B6E4 8003AEE4 02004DA6 */  sh         $t5, 0x2($s2)
/* 2B6E8 8003AEE8 04004EA6 */  sh         $t6, 0x4($s2)
/* 2B6EC 8003AEEC 1800A387 */  lh         $v1, 0x18($sp)
/* 2B6F0 8003AEF0 00004286 */  lh         $v0, 0x0($s2)
/* 2B6F4 8003AEF4 00000000 */  nop
/* 2B6F8 8003AEF8 2A186200 */  slt        $v1, $v1, $v0
/* 2B6FC 8003AEFC 00004296 */  lhu        $v0, 0x0($s2)
/* 2B700 8003AF00 02006010 */  beqz       $v1, .L8003AF0C
/* 2B704 8003AF04 00000000 */   nop
/* 2B708 8003AF08 1800A2A7 */  sh         $v0, 0x18($sp)
.L8003AF0C:
/* 2B70C 8003AF0C 1000A387 */  lh         $v1, 0x10($sp)
/* 2B710 8003AF10 00004286 */  lh         $v0, 0x0($s2)
/* 2B714 8003AF14 00000000 */  nop
/* 2B718 8003AF18 2A104300 */  slt        $v0, $v0, $v1
/* 2B71C 8003AF1C 00004396 */  lhu        $v1, 0x0($s2)
/* 2B720 8003AF20 02004010 */  beqz       $v0, .L8003AF2C
/* 2B724 8003AF24 00000000 */   nop
/* 2B728 8003AF28 1000A3A7 */  sh         $v1, 0x10($sp)
.L8003AF2C:
/* 2B72C 8003AF2C 1A00A287 */  lh         $v0, 0x1A($sp)
/* 2B730 8003AF30 FEFF8384 */  lh         $v1, -0x2($a0)
/* 2B734 8003AF34 00000000 */  nop
/* 2B738 8003AF38 2A104300 */  slt        $v0, $v0, $v1
/* 2B73C 8003AF3C FEFF8394 */  lhu        $v1, -0x2($a0)
/* 2B740 8003AF40 02004010 */  beqz       $v0, .L8003AF4C
/* 2B744 8003AF44 00000000 */   nop
/* 2B748 8003AF48 1A00A3A7 */  sh         $v1, 0x1A($sp)
.L8003AF4C:
/* 2B74C 8003AF4C 1200A387 */  lh         $v1, 0x12($sp)
/* 2B750 8003AF50 FEFF8284 */  lh         $v0, -0x2($a0)
/* 2B754 8003AF54 00000000 */  nop
/* 2B758 8003AF58 2A104300 */  slt        $v0, $v0, $v1
/* 2B75C 8003AF5C FEFF8394 */  lhu        $v1, -0x2($a0)
/* 2B760 8003AF60 02004010 */  beqz       $v0, .L8003AF6C
/* 2B764 8003AF64 00000000 */   nop
/* 2B768 8003AF68 1200A3A7 */  sh         $v1, 0x12($sp)
.L8003AF6C:
/* 2B76C 8003AF6C 1C00A287 */  lh         $v0, 0x1C($sp)
/* 2B770 8003AF70 00008384 */  lh         $v1, 0x0($a0)
/* 2B774 8003AF74 00000000 */  nop
/* 2B778 8003AF78 2A104300 */  slt        $v0, $v0, $v1
/* 2B77C 8003AF7C 00008394 */  lhu        $v1, 0x0($a0)
/* 2B780 8003AF80 02004010 */  beqz       $v0, .L8003AF8C
/* 2B784 8003AF84 00000000 */   nop
/* 2B788 8003AF88 1C00A3A7 */  sh         $v1, 0x1C($sp)
.L8003AF8C:
/* 2B78C 8003AF8C 1400A387 */  lh         $v1, 0x14($sp)
/* 2B790 8003AF90 00008284 */  lh         $v0, 0x0($a0)
/* 2B794 8003AF94 00000000 */  nop
/* 2B798 8003AF98 2A104300 */  slt        $v0, $v0, $v1
/* 2B79C 8003AF9C 00008394 */  lhu        $v1, 0x0($a0)
/* 2B7A0 8003AFA0 02004010 */  beqz       $v0, .L8003AFAC
/* 2B7A4 8003AFA4 00000000 */   nop
/* 2B7A8 8003AFA8 1400A3A7 */  sh         $v1, 0x14($sp)
.L8003AFAC:
/* 2B7AC 8003AFAC 08008424 */  addiu      $a0, $a0, 0x8
/* 2B7B0 8003AFB0 2B10D002 */  sltu       $v0, $s6, $s0
/* 2B7B4 8003AFB4 BFFF4010 */  beqz       $v0, .L8003AEB4
/* 2B7B8 8003AFB8 08005226 */   addiu     $s2, $s2, 0x8
.L8003AFBC:
/* 2B7BC 8003AFBC 1800E28E */  lw         $v0, 0x18($s7)
/* 2B7C0 8003AFC0 01007326 */  addiu      $s3, $s3, 0x1
/* 2B7C4 8003AFC4 2A106202 */  slt        $v0, $s3, $v0
/* 2B7C8 8003AFC8 A5FF4014 */  bnez       $v0, .L8003AE60
/* 2B7CC 8003AFCC 18009426 */   addiu     $s4, $s4, 0x18
.L8003AFD0:
/* 2B7D0 8003AFD0 0000E28E */  lw         $v0, 0x0($s7)
/* 2B7D4 8003AFD4 00000000 */  nop
/* 2B7D8 8003AFD8 2C004010 */  beqz       $v0, .L8003B08C
/* 2B7DC 8003AFDC 00000000 */   nop
/* 2B7E0 8003AFE0 1800A287 */  lh         $v0, 0x18($sp)
/* 2B7E4 8003AFE4 1000A387 */  lh         $v1, 0x10($sp)
/* 2B7E8 8003AFE8 00000000 */  nop
/* 2B7EC 8003AFEC 21104300 */  addu       $v0, $v0, $v1
/* 2B7F0 8003AFF0 43100200 */  sra        $v0, $v0, 1
/* 2B7F4 8003AFF4 0000C2AF */  sw         $v0, 0x0($fp)
/* 2B7F8 8003AFF8 1A00A287 */  lh         $v0, 0x1A($sp)
/* 2B7FC 8003AFFC 1200A387 */  lh         $v1, 0x12($sp)
/* 2B800 8003B000 00000000 */  nop
/* 2B804 8003B004 21104300 */  addu       $v0, $v0, $v1
/* 2B808 8003B008 43100200 */  sra        $v0, $v0, 1
/* 2B80C 8003B00C 0400C2AF */  sw         $v0, 0x4($fp)
/* 2B810 8003B010 1C00A287 */  lh         $v0, 0x1C($sp)
/* 2B814 8003B014 1400A387 */  lh         $v1, 0x14($sp)
/* 2B818 8003B018 2400B28F */  lw         $s2, 0x24($sp)
/* 2B81C 8003B01C 21104300 */  addu       $v0, $v0, $v1
/* 2B820 8003B020 43100200 */  sra        $v0, $v0, 1
/* 2B824 8003B024 0800C2AF */  sw         $v0, 0x8($fp)
/* 2B828 8003B028 0000E28E */  lw         $v0, 0x0($s7)
/* 2B82C 8003B02C 00000000 */  nop
/* 2B830 8003B030 16004018 */  blez       $v0, .L8003B08C
/* 2B834 8003B034 21980000 */   addu      $s3, $zero, $zero
/* 2B838 8003B038 04004426 */  addiu      $a0, $s2, 0x4
.L8003B03C:
/* 2B83C 8003B03C 00004296 */  lhu        $v0, 0x0($s2)
/* 2B840 8003B040 0000C397 */  lhu        $v1, 0x0($fp)
/* 2B844 8003B044 00000000 */  nop
/* 2B848 8003B048 23104300 */  subu       $v0, $v0, $v1
/* 2B84C 8003B04C 000042A6 */  sh         $v0, 0x0($s2)
/* 2B850 8003B050 FEFF8294 */  lhu        $v0, -0x2($a0)
/* 2B854 8003B054 0400C397 */  lhu        $v1, 0x4($fp)
/* 2B858 8003B058 01007326 */  addiu      $s3, $s3, 0x1
/* 2B85C 8003B05C 23104300 */  subu       $v0, $v0, $v1
/* 2B860 8003B060 FEFF82A4 */  sh         $v0, -0x2($a0)
/* 2B864 8003B064 00008294 */  lhu        $v0, 0x0($a0)
/* 2B868 8003B068 0800C397 */  lhu        $v1, 0x8($fp)
/* 2B86C 8003B06C 08005226 */  addiu      $s2, $s2, 0x8
/* 2B870 8003B070 23104300 */  subu       $v0, $v0, $v1
/* 2B874 8003B074 000082A4 */  sh         $v0, 0x0($a0)
/* 2B878 8003B078 0000E28E */  lw         $v0, 0x0($s7)
/* 2B87C 8003B07C 00000000 */  nop
/* 2B880 8003B080 2A106202 */  slt        $v0, $s3, $v0
/* 2B884 8003B084 EDFF4014 */  bnez       $v0, .L8003B03C
/* 2B888 8003B088 08008424 */   addiu     $a0, $a0, 0x8
.L8003B08C:
/* 2B88C 8003B08C 4C00BF8F */  lw         $ra, 0x4C($sp)
/* 2B890 8003B090 4800BE8F */  lw         $fp, 0x48($sp)
/* 2B894 8003B094 4400B78F */  lw         $s7, 0x44($sp)
/* 2B898 8003B098 4000B68F */  lw         $s6, 0x40($sp)
/* 2B89C 8003B09C 3C00B58F */  lw         $s5, 0x3C($sp)
/* 2B8A0 8003B0A0 3800B48F */  lw         $s4, 0x38($sp)
/* 2B8A4 8003B0A4 3400B38F */  lw         $s3, 0x34($sp)
/* 2B8A8 8003B0A8 3000B28F */  lw         $s2, 0x30($sp)
/* 2B8AC 8003B0AC 2C00B18F */  lw         $s1, 0x2C($sp)
/* 2B8B0 8003B0B0 2800B08F */  lw         $s0, 0x28($sp)
/* 2B8B4 8003B0B4 0800E003 */  jr         $ra
/* 2B8B8 8003B0B8 5000BD27 */   addiu     $sp, $sp, 0x50
.size PIPE3D_TransformVerticesToWorld, . - PIPE3D_TransformVerticesToWorld
