.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel DRAW_GlowQuad
/* 1BE28 8002B628 21788000 */  addu       $t7, $a0, $zero
/* 1BE2C 8002B62C 21C8A000 */  addu       $t9, $a1, $zero
/* 1BE30 8002B630 0C00A7AF */  sw         $a3, 0xC($sp)
/* 1BE34 8002B634 0800E28D */  lw         $v0, 0x8($t7)
/* 1BE38 8002B638 0400E98D */  lw         $t1, 0x4($t7)
/* 1BE3C 8002B63C 1000A58F */  lw         $a1, 0x10($sp)
/* 1BE40 8002B640 1400AA8F */  lw         $t2, 0x14($sp)
/* 1BE44 8002B644 1800AB8F */  lw         $t3, 0x18($sp)
/* 1BE48 8002B648 1C00B88F */  lw         $t8, 0x1C($sp)
/* 1BE4C 8002B64C D0FF4224 */  addiu      $v0, $v0, -0x30
/* 1BE50 8002B650 2B104900 */  sltu       $v0, $v0, $t1
/* 1BE54 8002B654 8B004014 */  bnez       $v0, .L8002B884
/* 1BE58 8002B658 21402001 */   addu      $t0, $t1, $zero
/* 1BE5C 8002B65C 0000E28D */  lw         $v0, 0x0($t7)
/* 1BE60 8002B660 00000000 */  nop
/* 1BE64 8002B664 01004224 */  addiu      $v0, $v0, 0x1
/* 1BE68 8002B668 0000E2AD */  sw         $v0, 0x0($t7)
/* 1BE6C 8002B66C 0001023C */  lui        $v0, (0x1000000 >> 16)
/* 1BE70 8002B670 2410E200 */  and        $v0, $a3, $v0
/* 1BE74 8002B674 09004010 */  beqz       $v0, .L8002B69C
/* 1BE78 8002B678 28002925 */   addiu     $t1, $t1, 0x28
/* 1BE7C 8002B67C 00E1033C */  lui        $v1, (0xE1000640 >> 16)
/* 1BE80 8002B680 40066334 */  ori        $v1, $v1, (0xE1000640 & 0xFFFF)
/* 1BE84 8002B684 FF00023C */  lui        $v0, (0xFFFFFF >> 16)
/* 1BE88 8002B688 FFFF4234 */  ori        $v0, $v0, (0xFFFFFF & 0xFFFF)
/* 1BE8C 8002B68C 2410E200 */  and        $v0, $a3, $v0
/* 1BE90 8002B690 040003AD */  sw         $v1, 0x4($t0)
/* 1BE94 8002B694 AAAD0008 */  j          .L8002B6A8
/* 1BE98 8002B698 0C00A2AF */   sw        $v0, 0xC($sp)
.L8002B69C:
/* 1BE9C 8002B69C 00E1023C */  lui        $v0, (0xE1000620 >> 16)
/* 1BEA0 8002B6A0 20064234 */  ori        $v0, $v0, (0xE1000620 & 0xFFFF)
/* 1BEA4 8002B6A4 040002AD */  sw         $v0, 0x4($t0)
.L8002B6A8:
/* 1BEA8 8002B6A8 0800A284 */  lh         $v0, 0x8($a1)
/* 1BEAC 8002B6AC 00100324 */  addiu      $v1, $zero, 0x1000
/* 1BEB0 8002B6B0 23106200 */  subu       $v0, $v1, $v0
/* 1BEB4 8002B6B4 00408248 */  mtc2       $v0, $8 # handwritten instruction
/* 1BEB8 8002B6B8 0C00A427 */  addiu      $a0, $sp, 0xC
/* 1BEBC 8002B6BC 00008C90 */  lbu        $t4, 0x0($a0)
/* 1BEC0 8002B6C0 01008D90 */  lbu        $t5, 0x1($a0)
/* 1BEC4 8002B6C4 02008E90 */  lbu        $t6, 0x2($a0)
/* 1BEC8 8002B6C8 00488C48 */  mtc2       $t4, $9 # handwritten instruction
/* 1BECC 8002B6CC 00508D48 */  mtc2       $t5, $10 # handwritten instruction
/* 1BED0 8002B6D0 00588E48 */  mtc2       $t6, $11 # handwritten instruction
/* 1BED4 8002B6D4 00000000 */  nop
/* 1BED8 8002B6D8 00000000 */  nop
/* 1BEDC 8002B6DC 3D00984B */  GPF        1
/* 1BEE0 8002B6E0 0000A294 */  lhu        $v0, 0x0($a1)
/* 1BEE4 8002B6E4 00000000 */  nop
/* 1BEE8 8002B6E8 0C0002A5 */  sh         $v0, 0xC($t0)
/* 1BEEC 8002B6EC 0400A294 */  lhu        $v0, 0x4($a1)
/* 1BEF0 8002B6F0 00000000 */  nop
/* 1BEF4 8002B6F4 0E0002A5 */  sh         $v0, 0xE($t0)
/* 1BEF8 8002B6F8 08000225 */  addiu      $v0, $t0, 0x8
/* 1BEFC 8002B6FC 00480C48 */  mfc2       $t4, $9 # handwritten instruction
/* 1BF00 8002B700 00500D48 */  mfc2       $t5, $10 # handwritten instruction
/* 1BF04 8002B704 00580E48 */  mfc2       $t6, $11 # handwritten instruction
/* 1BF08 8002B708 00004CA0 */  sb         $t4, 0x0($v0)
/* 1BF0C 8002B70C 01004DA0 */  sb         $t5, 0x1($v0)
/* 1BF10 8002B710 02004EA0 */  sb         $t6, 0x2($v0)
/* 1BF14 8002B714 08004285 */  lh         $v0, 0x8($t2)
/* 1BF18 8002B718 00000000 */  nop
/* 1BF1C 8002B71C 23106200 */  subu       $v0, $v1, $v0
/* 1BF20 8002B720 00408248 */  mtc2       $v0, $8 # handwritten instruction
/* 1BF24 8002B724 00008C90 */  lbu        $t4, 0x0($a0)
/* 1BF28 8002B728 01008D90 */  lbu        $t5, 0x1($a0)
/* 1BF2C 8002B72C 02008E90 */  lbu        $t6, 0x2($a0)
/* 1BF30 8002B730 00488C48 */  mtc2       $t4, $9 # handwritten instruction
/* 1BF34 8002B734 00508D48 */  mtc2       $t5, $10 # handwritten instruction
/* 1BF38 8002B738 00588E48 */  mtc2       $t6, $11 # handwritten instruction
/* 1BF3C 8002B73C 00000000 */  nop
/* 1BF40 8002B740 00000000 */  nop
/* 1BF44 8002B744 3D00984B */  GPF        1
/* 1BF48 8002B748 00004295 */  lhu        $v0, 0x0($t2)
/* 1BF4C 8002B74C 00000000 */  nop
/* 1BF50 8002B750 140002A5 */  sh         $v0, 0x14($t0)
/* 1BF54 8002B754 04004295 */  lhu        $v0, 0x4($t2)
/* 1BF58 8002B758 00000000 */  nop
/* 1BF5C 8002B75C 160002A5 */  sh         $v0, 0x16($t0)
/* 1BF60 8002B760 10000225 */  addiu      $v0, $t0, 0x10
/* 1BF64 8002B764 00480C48 */  mfc2       $t4, $9 # handwritten instruction
/* 1BF68 8002B768 00500D48 */  mfc2       $t5, $10 # handwritten instruction
/* 1BF6C 8002B76C 00580E48 */  mfc2       $t6, $11 # handwritten instruction
/* 1BF70 8002B770 00004CA0 */  sb         $t4, 0x0($v0)
/* 1BF74 8002B774 01004DA0 */  sb         $t5, 0x1($v0)
/* 1BF78 8002B778 02004EA0 */  sb         $t6, 0x2($v0)
/* 1BF7C 8002B77C 08006285 */  lh         $v0, 0x8($t3)
/* 1BF80 8002B780 00000000 */  nop
/* 1BF84 8002B784 23106200 */  subu       $v0, $v1, $v0
/* 1BF88 8002B788 00408248 */  mtc2       $v0, $8 # handwritten instruction
/* 1BF8C 8002B78C 00008C90 */  lbu        $t4, 0x0($a0)
/* 1BF90 8002B790 01008D90 */  lbu        $t5, 0x1($a0)
/* 1BF94 8002B794 02008E90 */  lbu        $t6, 0x2($a0)
/* 1BF98 8002B798 00488C48 */  mtc2       $t4, $9 # handwritten instruction
/* 1BF9C 8002B79C 00508D48 */  mtc2       $t5, $10 # handwritten instruction
/* 1BFA0 8002B7A0 00588E48 */  mtc2       $t6, $11 # handwritten instruction
/* 1BFA4 8002B7A4 00000000 */  nop
/* 1BFA8 8002B7A8 00000000 */  nop
/* 1BFAC 8002B7AC 3D00984B */  GPF        1
/* 1BFB0 8002B7B0 00006295 */  lhu        $v0, 0x0($t3)
/* 1BFB4 8002B7B4 00000000 */  nop
/* 1BFB8 8002B7B8 1C0002A5 */  sh         $v0, 0x1C($t0)
/* 1BFBC 8002B7BC 04006295 */  lhu        $v0, 0x4($t3)
/* 1BFC0 8002B7C0 00000000 */  nop
/* 1BFC4 8002B7C4 1E0002A5 */  sh         $v0, 0x1E($t0)
/* 1BFC8 8002B7C8 18000225 */  addiu      $v0, $t0, 0x18
/* 1BFCC 8002B7CC 00480C48 */  mfc2       $t4, $9 # handwritten instruction
/* 1BFD0 8002B7D0 00500D48 */  mfc2       $t5, $10 # handwritten instruction
/* 1BFD4 8002B7D4 00580E48 */  mfc2       $t6, $11 # handwritten instruction
/* 1BFD8 8002B7D8 00004CA0 */  sb         $t4, 0x0($v0)
/* 1BFDC 8002B7DC 01004DA0 */  sb         $t5, 0x1($v0)
/* 1BFE0 8002B7E0 02004EA0 */  sb         $t6, 0x2($v0)
/* 1BFE4 8002B7E4 08000287 */  lh         $v0, 0x8($t8)
/* 1BFE8 8002B7E8 00000000 */  nop
/* 1BFEC 8002B7EC 23186200 */  subu       $v1, $v1, $v0
/* 1BFF0 8002B7F0 00408348 */  mtc2       $v1, $8 # handwritten instruction
/* 1BFF4 8002B7F4 00008C90 */  lbu        $t4, 0x0($a0)
/* 1BFF8 8002B7F8 01008D90 */  lbu        $t5, 0x1($a0)
/* 1BFFC 8002B7FC 02008E90 */  lbu        $t6, 0x2($a0)
/* 1C000 8002B800 00488C48 */  mtc2       $t4, $9 # handwritten instruction
/* 1C004 8002B804 00508D48 */  mtc2       $t5, $10 # handwritten instruction
/* 1C008 8002B808 00588E48 */  mtc2       $t6, $11 # handwritten instruction
/* 1C00C 8002B80C 00000000 */  nop
/* 1C010 8002B810 00000000 */  nop
/* 1C014 8002B814 3D00984B */  GPF        1
/* 1C018 8002B818 00000297 */  lhu        $v0, 0x0($t8)
/* 1C01C 8002B81C 00000000 */  nop
/* 1C020 8002B820 240002A5 */  sh         $v0, 0x24($t0)
/* 1C024 8002B824 04000297 */  lhu        $v0, 0x4($t8)
/* 1C028 8002B828 00000000 */  nop
/* 1C02C 8002B82C 260002A5 */  sh         $v0, 0x26($t0)
/* 1C030 8002B830 20000225 */  addiu      $v0, $t0, 0x20
/* 1C034 8002B834 00480C48 */  mfc2       $t4, $9 # handwritten instruction
/* 1C038 8002B838 00500D48 */  mfc2       $t5, $10 # handwritten instruction
/* 1C03C 8002B83C 00580E48 */  mfc2       $t6, $11 # handwritten instruction
/* 1C040 8002B840 00004CA0 */  sb         $t4, 0x0($v0)
/* 1C044 8002B844 01004DA0 */  sb         $t5, 0x1($v0)
/* 1C048 8002B848 02004EA0 */  sb         $t6, 0x2($v0)
/* 1C04C 8002B84C FF00053C */  lui        $a1, (0xFFFFFF >> 16)
/* 1C050 8002B850 80200600 */  sll        $a0, $a2, 2
/* 1C054 8002B854 21209900 */  addu       $a0, $a0, $t9
/* 1C058 8002B858 FFFFA534 */  ori        $a1, $a1, (0xFFFFFF & 0xFFFF)
/* 1C05C 8002B85C 0000828C */  lw         $v0, 0x0($a0)
/* 1C060 8002B860 0009033C */  lui        $v1, (0x9000000 >> 16)
/* 1C064 8002B864 24104500 */  and        $v0, $v0, $a1
/* 1C068 8002B868 25104300 */  or         $v0, $v0, $v1
/* 1C06C 8002B86C 24280501 */  and        $a1, $t0, $a1
/* 1C070 8002B870 000002AD */  sw         $v0, 0x0($t0)
/* 1C074 8002B874 3A000224 */  addiu      $v0, $zero, 0x3A
/* 1C078 8002B878 000085AC */  sw         $a1, 0x0($a0)
/* 1C07C 8002B87C 0B0002A1 */  sb         $v0, 0xB($t0)
/* 1C080 8002B880 0400E9AD */  sw         $t1, 0x4($t7)
.L8002B884:
/* 1C084 8002B884 0800E003 */  jr         $ra
/* 1C088 8002B888 00000000 */   nop
.size DRAW_GlowQuad, . - DRAW_GlowQuad
