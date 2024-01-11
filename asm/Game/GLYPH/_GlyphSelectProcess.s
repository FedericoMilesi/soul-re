.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GlyphSelectProcess
/* 6BED8 8007B6D8 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 6BEDC 8007B6DC 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 6BEE0 8007B6E0 21988000 */  addu       $s3, $a0, $zero
/* 6BEE4 8007B6E4 2800B6AF */  sw         $s6, 0x28($sp)
/* 6BEE8 8007B6E8 21B0A000 */  addu       $s6, $a1, $zero
/* 6BEEC 8007B6EC 2C00B7AF */  sw         $s7, 0x2C($sp)
/* 6BEF0 8007B6F0 21B8C000 */  addu       $s7, $a2, $zero
/* 6BEF4 8007B6F4 1800B2AF */  sw         $s2, 0x18($sp)
/* 6BEF8 8007B6F8 21900000 */  addu       $s2, $zero, $zero
/* 6BEFC 8007B6FC 2400B5AF */  sw         $s5, 0x24($sp)
/* 6BF00 8007B700 FFFF1524 */  addiu      $s5, $zero, -0x1
/* 6BF04 8007B704 3000BFAF */  sw         $ra, 0x30($sp)
/* 6BF08 8007B708 2000B4AF */  sw         $s4, 0x20($sp)
/* 6BF0C 8007B70C 1400B1AF */  sw         $s1, 0x14($sp)
/* 6BF10 8007B710 1000B0AF */  sw         $s0, 0x10($sp)
/* 6BF14 8007B714 1C00628E */  lw         $v0, 0x1C($s3)
/* 6BF18 8007B718 6C01718E */  lw         $s1, 0x16C($s3)
/* 6BF1C 8007B71C 1C00548C */  lw         $s4, 0x1C($v0)
.L8007B720:
/* 6BF20 8007B720 39C3010C */  jal        PeekMessageQueue
/* 6BF24 8007B724 04002426 */   addiu     $a0, $s1, 0x4
/* 6BF28 8007B728 08014010 */  beqz       $v0, .L8007BB4C
/* 6BF2C 8007B72C 1000043C */   lui       $a0, (0x100001 >> 16)
/* 6BF30 8007B730 0000438C */  lw         $v1, 0x0($v0)
/* 6BF34 8007B734 01008434 */  ori        $a0, $a0, (0x100001 & 0xFFFF)
/* 6BF38 8007B738 1A006410 */  beq        $v1, $a0, .L8007B7A4
/* 6BF3C 8007B73C 2A108300 */   slt       $v0, $a0, $v1
/* 6BF40 8007B740 08004014 */  bnez       $v0, .L8007B764
/* 6BF44 8007B744 0010023C */   lui       $v0, (0x10000002 >> 16)
/* 6BF48 8007B748 0080023C */  lui        $v0, (0x80000010 >> 16)
/* 6BF4C 8007B74C D3006210 */  beq        $v1, $v0, .L8007BA9C
/* 6BF50 8007B750 10004234 */   ori       $v0, $v0, (0x80000010 & 0xFFFF)
/* 6BF54 8007B754 24006210 */  beq        $v1, $v0, .L8007B7E8
/* 6BF58 8007B758 0880053C */   lui       $a1, %hi(_GlyphOffProcess)
/* 6BF5C 8007B75C CCEE0108 */  j          .L8007BB30
/* 6BF60 8007B760 21206002 */   addu      $a0, $s3, $zero
.L8007B764:
/* 6BF64 8007B764 02004234 */  ori        $v0, $v0, (0x10000002 & 0xFFFF)
/* 6BF68 8007B768 78006210 */  beq        $v1, $v0, .L8007B94C
/* 6BF6C 8007B76C 2A104300 */   slt       $v0, $v0, $v1
/* 6BF70 8007B770 07004014 */  bnez       $v0, .L8007B790
/* 6BF74 8007B774 0010023C */   lui       $v0, (0x10000004 >> 16)
/* 6BF78 8007B778 1000023C */  lui        $v0, (0x100004 >> 16)
/* 6BF7C 8007B77C 04004234 */  ori        $v0, $v0, (0x100004 & 0xFFFF)
/* 6BF80 8007B780 17006210 */  beq        $v1, $v0, .L8007B7E0
/* 6BF84 8007B784 21206002 */   addu      $a0, $s3, $zero
/* 6BF88 8007B788 CDEE0108 */  j          .L8007BB34
/* 6BF8C 8007B78C 2128C002 */   addu      $a1, $s6, $zero
.L8007B790:
/* 6BF90 8007B790 04004234 */  ori        $v0, $v0, (0x10000004 & 0xFFFF)
/* 6BF94 8007B794 1B006210 */  beq        $v1, $v0, .L8007B804
/* 6BF98 8007B798 21206002 */   addu      $a0, $s3, $zero
/* 6BF9C 8007B79C CDEE0108 */  j          .L8007BB34
/* 6BFA0 8007B7A0 2128C002 */   addu      $a1, $s6, $zero
.L8007B7A4:
/* 6BFA4 8007B7A4 01001224 */  addiu      $s2, $zero, 0x1
/* 6BFA8 8007B7A8 07000224 */  addiu      $v0, $zero, 0x7
/* 6BFAC 8007B7AC 8C0022A6 */  sh         $v0, 0x8C($s1)
/* 6BFB0 8007B7B0 8C002386 */  lh         $v1, 0x8C($s1)
/* 6BFB4 8007B7B4 B60D0224 */  addiu      $v0, $zero, 0xDB6
/* 6BFB8 8007B7B8 980022A6 */  sh         $v0, 0x98($s1)
/* 6BFBC 8007B7BC 98002496 */  lhu        $a0, 0x98($s1)
/* 6BFC0 8007B7C0 FFFF6324 */  addiu      $v1, $v1, -0x1
/* 6BFC4 8007B7C4 C0100300 */  sll        $v0, $v1, 3
/* 6BFC8 8007B7C8 21104300 */  addu       $v0, $v0, $v1
/* 6BFCC 8007B7CC 80190200 */  sll        $v1, $v0, 6
/* 6BFD0 8007B7D0 21104300 */  addu       $v0, $v0, $v1
/* 6BFD4 8007B7D4 960022A6 */  sh         $v0, 0x96($s1)
/* 6BFD8 8007B7D8 CFEE0108 */  j          .L8007BB3C
/* 6BFDC 8007B7DC 960024A6 */   sh        $a0, 0x96($s1)
.L8007B7E0:
/* 6BFE0 8007B7E0 CFEE0108 */  j          .L8007BB3C
/* 6BFE4 8007B7E4 01001224 */   addiu     $s2, $zero, 0x1
.L8007B7E8:
/* 6BFE8 8007B7E8 01001224 */  addiu      $s2, $zero, 0x1
/* 6BFEC 8007B7EC 21206002 */  addu       $a0, $s3, $zero
/* 6BFF0 8007B7F0 59EB010C */  jal        _GlyphSwitchProcess
/* 6BFF4 8007B7F4 A0B5A524 */   addiu     $a1, $a1, %lo(_GlyphOffProcess)
/* 6BFF8 8007B7F8 0F000424 */  addiu      $a0, $zero, 0xF
/* 6BFFC 8007B7FC C7EE0108 */  j          .L8007BB1C
/* 6C000 8007B800 7F000524 */   addiu     $a1, $zero, 0x7F
.L8007B804:
/* 6C004 8007B804 A6EB010C */  jal        _GlyphIsAnyGlyphSet
/* 6C008 8007B808 00000000 */   nop
/* 6C00C 8007B80C CB004010 */  beqz       $v0, .L8007BB3C
/* 6C010 8007B810 00000000 */   nop
/* 6C014 8007B814 96002486 */  lh         $a0, 0x96($s1)
/* 6C018 8007B818 98002586 */  lh         $a1, 0x98($s1)
/* 6C01C 8007B81C 7EE8000C */  jal        AngleDiff
/* 6C020 8007B820 00000000 */   nop
/* 6C024 8007B824 00140200 */  sll        $v0, $v0, 16
/* 6C028 8007B828 0C004004 */  bltz       $v0, .L8007B85C
/* 6C02C 8007B82C 00000000 */   nop
/* 6C030 8007B830 96002486 */  lh         $a0, 0x96($s1)
/* 6C034 8007B834 98002586 */  lh         $a1, 0x98($s1)
/* 6C038 8007B838 7EE8000C */  jal        AngleDiff
/* 6C03C 8007B83C 00000000 */   nop
/* 6C040 8007B840 00140200 */  sll        $v0, $v0, 16
/* 6C044 8007B844 03140200 */  sra        $v0, $v0, 16
/* 6C048 8007B848 40004228 */  slti       $v0, $v0, 0x40
/* 6C04C 8007B84C BB004010 */  beqz       $v0, .L8007BB3C
/* 6C050 8007B850 00000000 */   nop
/* 6C054 8007B854 21EE0108 */  j          .L8007B884
/* 6C058 8007B858 00000000 */   nop
.L8007B85C:
/* 6C05C 8007B85C 96002486 */  lh         $a0, 0x96($s1)
/* 6C060 8007B860 98002586 */  lh         $a1, 0x98($s1)
/* 6C064 8007B864 7EE8000C */  jal        AngleDiff
/* 6C068 8007B868 00000000 */   nop
/* 6C06C 8007B86C 00140200 */  sll        $v0, $v0, 16
/* 6C070 8007B870 03140200 */  sra        $v0, $v0, 16
/* 6C074 8007B874 23100200 */  negu       $v0, $v0
/* 6C078 8007B878 40004228 */  slti       $v0, $v0, 0x40
/* 6C07C 8007B87C AF004010 */  beqz       $v0, .L8007BB3C
/* 6C080 8007B880 00000000 */   nop
.L8007B884:
/* 6C084 8007B884 8C002296 */  lhu        $v0, 0x8C($s1)
/* 6C088 8007B888 9A0035A6 */  sh         $s5, 0x9A($s1)
/* 6C08C 8007B88C FFFF4224 */  addiu      $v0, $v0, -0x1
/* 6C090 8007B890 8C0022A6 */  sh         $v0, 0x8C($s1)
/* 6C094 8007B894 00140200 */  sll        $v0, $v0, 16
/* 6C098 8007B898 0200401C */  bgtz       $v0, .L8007B8A4
/* 6C09C 8007B89C 07000224 */   addiu     $v0, $zero, 0x7
/* 6C0A0 8007B8A0 8C0022A6 */  sh         $v0, 0x8C($s1)
.L8007B8A4:
/* 6C0A4 8007B8A4 8C002286 */  lh         $v0, 0x8C($s1)
/* 6C0A8 8007B8A8 00000000 */  nop
/* 6C0AC 8007B8AC 21204000 */  addu       $a0, $v0, $zero
/* 6C0B0 8007B8B0 FFFF4224 */  addiu      $v0, $v0, -0x1
/* 6C0B4 8007B8B4 C0180200 */  sll        $v1, $v0, 3
/* 6C0B8 8007B8B8 21186200 */  addu       $v1, $v1, $v0
/* 6C0BC 8007B8BC 80110300 */  sll        $v0, $v1, 6
/* 6C0C0 8007B8C0 21186200 */  addu       $v1, $v1, $v0
/* 6C0C4 8007B8C4 86EB010C */  jal        _GlyphIsGlyphSet
/* 6C0C8 8007B8C8 980023A6 */   sh        $v1, 0x98($s1)
/* 6C0CC 8007B8CC EDFF4010 */  beqz       $v0, .L8007B884
/* 6C0D0 8007B8D0 00000000 */   nop
/* 6C0D4 8007B8D4 96002486 */  lh         $a0, 0x96($s1)
/* 6C0D8 8007B8D8 98002586 */  lh         $a1, 0x98($s1)
/* 6C0DC 8007B8DC 7EE8000C */  jal        AngleDiff
/* 6C0E0 8007B8E0 00000000 */   nop
/* 6C0E4 8007B8E4 00140200 */  sll        $v0, $v0, 16
/* 6C0E8 8007B8E8 0C004004 */  bltz       $v0, .L8007B91C
/* 6C0EC 8007B8EC 00000000 */   nop
/* 6C0F0 8007B8F0 96002486 */  lh         $a0, 0x96($s1)
/* 6C0F4 8007B8F4 98002586 */  lh         $a1, 0x98($s1)
/* 6C0F8 8007B8F8 7EE8000C */  jal        AngleDiff
/* 6C0FC 8007B8FC 00000000 */   nop
/* 6C100 8007B900 00140200 */  sll        $v0, $v0, 16
/* 6C104 8007B904 03140200 */  sra        $v0, $v0, 16
/* 6C108 8007B908 40004228 */  slti       $v0, $v0, 0x40
/* 6C10C 8007B90C 82004010 */  beqz       $v0, .L8007BB18
/* 6C110 8007B910 12000424 */   addiu     $a0, $zero, 0x12
/* 6C114 8007B914 CFEE0108 */  j          .L8007BB3C
/* 6C118 8007B918 00000000 */   nop
.L8007B91C:
/* 6C11C 8007B91C 96002486 */  lh         $a0, 0x96($s1)
/* 6C120 8007B920 98002586 */  lh         $a1, 0x98($s1)
/* 6C124 8007B924 7EE8000C */  jal        AngleDiff
/* 6C128 8007B928 00000000 */   nop
/* 6C12C 8007B92C 00140200 */  sll        $v0, $v0, 16
/* 6C130 8007B930 03140200 */  sra        $v0, $v0, 16
/* 6C134 8007B934 23100200 */  negu       $v0, $v0
/* 6C138 8007B938 40004228 */  slti       $v0, $v0, 0x40
/* 6C13C 8007B93C 7F004014 */  bnez       $v0, .L8007BB3C
/* 6C140 8007B940 12000424 */   addiu     $a0, $zero, 0x12
/* 6C144 8007B944 C7EE0108 */  j          .L8007BB1C
/* 6C148 8007B948 64000524 */   addiu     $a1, $zero, 0x64
.L8007B94C:
/* 6C14C 8007B94C A6EB010C */  jal        _GlyphIsAnyGlyphSet
/* 6C150 8007B950 00000000 */   nop
/* 6C154 8007B954 79004010 */  beqz       $v0, .L8007BB3C
/* 6C158 8007B958 00000000 */   nop
/* 6C15C 8007B95C 96002486 */  lh         $a0, 0x96($s1)
/* 6C160 8007B960 98002586 */  lh         $a1, 0x98($s1)
/* 6C164 8007B964 7EE8000C */  jal        AngleDiff
/* 6C168 8007B968 00000000 */   nop
/* 6C16C 8007B96C 00140200 */  sll        $v0, $v0, 16
/* 6C170 8007B970 0C004004 */  bltz       $v0, .L8007B9A4
/* 6C174 8007B974 00000000 */   nop
/* 6C178 8007B978 96002486 */  lh         $a0, 0x96($s1)
/* 6C17C 8007B97C 98002586 */  lh         $a1, 0x98($s1)
/* 6C180 8007B980 7EE8000C */  jal        AngleDiff
/* 6C184 8007B984 00000000 */   nop
/* 6C188 8007B988 00140200 */  sll        $v0, $v0, 16
/* 6C18C 8007B98C 03140200 */  sra        $v0, $v0, 16
/* 6C190 8007B990 40004228 */  slti       $v0, $v0, 0x40
/* 6C194 8007B994 0D004014 */  bnez       $v0, .L8007B9CC
/* 6C198 8007B998 01001024 */   addiu     $s0, $zero, 0x1
/* 6C19C 8007B99C CFEE0108 */  j          .L8007BB3C
/* 6C1A0 8007B9A0 00000000 */   nop
.L8007B9A4:
/* 6C1A4 8007B9A4 96002486 */  lh         $a0, 0x96($s1)
/* 6C1A8 8007B9A8 98002586 */  lh         $a1, 0x98($s1)
/* 6C1AC 8007B9AC 7EE8000C */  jal        AngleDiff
/* 6C1B0 8007B9B0 00000000 */   nop
/* 6C1B4 8007B9B4 00140200 */  sll        $v0, $v0, 16
/* 6C1B8 8007B9B8 03140200 */  sra        $v0, $v0, 16
/* 6C1BC 8007B9BC 23100200 */  negu       $v0, $v0
/* 6C1C0 8007B9C0 40004228 */  slti       $v0, $v0, 0x40
/* 6C1C4 8007B9C4 5D004010 */  beqz       $v0, .L8007BB3C
/* 6C1C8 8007B9C8 01001024 */   addiu     $s0, $zero, 0x1
.L8007B9CC:
/* 6C1CC 8007B9CC 8C002296 */  lhu        $v0, 0x8C($s1)
/* 6C1D0 8007B9D0 00000000 */  nop
/* 6C1D4 8007B9D4 01004224 */  addiu      $v0, $v0, 0x1
/* 6C1D8 8007B9D8 8C0022A6 */  sh         $v0, 0x8C($s1)
/* 6C1DC 8007B9DC 8C002286 */  lh         $v0, 0x8C($s1)
/* 6C1E0 8007B9E0 00000000 */  nop
/* 6C1E4 8007B9E4 08004228 */  slti       $v0, $v0, 0x8
/* 6C1E8 8007B9E8 02004014 */  bnez       $v0, .L8007B9F4
/* 6C1EC 8007B9EC 9A0030A6 */   sh        $s0, 0x9A($s1)
/* 6C1F0 8007B9F0 8C0030A6 */  sh         $s0, 0x8C($s1)
.L8007B9F4:
/* 6C1F4 8007B9F4 8C002286 */  lh         $v0, 0x8C($s1)
/* 6C1F8 8007B9F8 00000000 */  nop
/* 6C1FC 8007B9FC 21204000 */  addu       $a0, $v0, $zero
/* 6C200 8007BA00 FFFF4224 */  addiu      $v0, $v0, -0x1
/* 6C204 8007BA04 C0180200 */  sll        $v1, $v0, 3
/* 6C208 8007BA08 21186200 */  addu       $v1, $v1, $v0
/* 6C20C 8007BA0C 80110300 */  sll        $v0, $v1, 6
/* 6C210 8007BA10 21186200 */  addu       $v1, $v1, $v0
/* 6C214 8007BA14 86EB010C */  jal        _GlyphIsGlyphSet
/* 6C218 8007BA18 980023A6 */   sh        $v1, 0x98($s1)
/* 6C21C 8007BA1C EBFF4010 */  beqz       $v0, .L8007B9CC
/* 6C220 8007BA20 00000000 */   nop
/* 6C224 8007BA24 96002486 */  lh         $a0, 0x96($s1)
/* 6C228 8007BA28 98002586 */  lh         $a1, 0x98($s1)
/* 6C22C 8007BA2C 7EE8000C */  jal        AngleDiff
/* 6C230 8007BA30 00000000 */   nop
/* 6C234 8007BA34 00140200 */  sll        $v0, $v0, 16
/* 6C238 8007BA38 0C004004 */  bltz       $v0, .L8007BA6C
/* 6C23C 8007BA3C 00000000 */   nop
/* 6C240 8007BA40 96002486 */  lh         $a0, 0x96($s1)
/* 6C244 8007BA44 98002586 */  lh         $a1, 0x98($s1)
/* 6C248 8007BA48 7EE8000C */  jal        AngleDiff
/* 6C24C 8007BA4C 00000000 */   nop
/* 6C250 8007BA50 00140200 */  sll        $v0, $v0, 16
/* 6C254 8007BA54 03140200 */  sra        $v0, $v0, 16
/* 6C258 8007BA58 40004228 */  slti       $v0, $v0, 0x40
/* 6C25C 8007BA5C 2E004010 */  beqz       $v0, .L8007BB18
/* 6C260 8007BA60 12000424 */   addiu     $a0, $zero, 0x12
/* 6C264 8007BA64 CFEE0108 */  j          .L8007BB3C
/* 6C268 8007BA68 00000000 */   nop
.L8007BA6C:
/* 6C26C 8007BA6C 96002486 */  lh         $a0, 0x96($s1)
/* 6C270 8007BA70 98002586 */  lh         $a1, 0x98($s1)
/* 6C274 8007BA74 7EE8000C */  jal        AngleDiff
/* 6C278 8007BA78 00000000 */   nop
/* 6C27C 8007BA7C 00140200 */  sll        $v0, $v0, 16
/* 6C280 8007BA80 03140200 */  sra        $v0, $v0, 16
/* 6C284 8007BA84 23100200 */  negu       $v0, $v0
/* 6C288 8007BA88 40004228 */  slti       $v0, $v0, 0x40
/* 6C28C 8007BA8C 2B004014 */  bnez       $v0, .L8007BB3C
/* 6C290 8007BA90 12000424 */   addiu     $a0, $zero, 0x12
/* 6C294 8007BA94 C7EE0108 */  j          .L8007BB1C
/* 6C298 8007BA98 64000524 */   addiu     $a1, $zero, 0x64
.L8007BA9C:
/* 6C29C 8007BA9C F0A48287 */  lh         $v0, %gp_rel(fx_going)($gp)
/* 6C2A0 8007BAA0 00000000 */  nop
/* 6C2A4 8007BAA4 1C004014 */  bnez       $v0, .L8007BB18
/* 6C2A8 8007BAA8 10000424 */   addiu     $a0, $zero, 0x10
/* 6C2AC 8007BAAC 8C002486 */  lh         $a0, 0x8C($s1)
/* 6C2B0 8007BAB0 86EB010C */  jal        _GlyphIsGlyphSet
/* 6C2B4 8007BAB4 00000000 */   nop
/* 6C2B8 8007BAB8 17004010 */  beqz       $v0, .L8007BB18
/* 6C2BC 8007BABC 10000424 */   addiu     $a0, $zero, 0x10
/* 6C2C0 8007BAC0 F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 6C2C4 8007BAC4 92D1000C */  jal        INSTANCE_Query
/* 6C2C8 8007BAC8 20000524 */   addiu     $a1, $zero, 0x20
/* 6C2CC 8007BACC 21208002 */  addu       $a0, $s4, $zero
/* 6C2D0 8007BAD0 8C002586 */  lh         $a1, 0x8C($s1)
/* 6C2D4 8007BAD4 B2EB010C */  jal        _GlyphCost
/* 6C2D8 8007BAD8 21804000 */   addu      $s0, $v0, $zero
/* 6C2DC 8007BADC 2A800202 */  slt        $s0, $s0, $v0
/* 6C2E0 8007BAE0 0D000016 */  bnez       $s0, .L8007BB18
/* 6C2E4 8007BAE4 10000424 */   addiu     $a0, $zero, 0x10
/* 6C2E8 8007BAE8 8C002486 */  lh         $a0, 0x8C($s1)
/* 6C2EC 8007BAEC 97EB010C */  jal        _GlyphIsGlyphUsable
/* 6C2F0 8007BAF0 00000000 */   nop
/* 6C2F4 8007BAF4 07004010 */  beqz       $v0, .L8007BB14
/* 6C2F8 8007BAF8 21206002 */   addu      $a0, $s3, $zero
/* 6C2FC 8007BAFC 01001224 */  addiu      $s2, $zero, 0x1
/* 6C300 8007BB00 0880053C */  lui        $a1, %hi(_GlyphGenericProcess)
/* 6C304 8007BB04 59EB010C */  jal        _GlyphSwitchProcess
/* 6C308 8007BB08 08C2A524 */   addiu     $a1, $a1, %lo(_GlyphGenericProcess)
/* 6C30C 8007BB0C CFEE0108 */  j          .L8007BB3C
/* 6C310 8007BB10 00000000 */   nop
.L8007BB14:
/* 6C314 8007BB14 10000424 */  addiu      $a0, $zero, 0x10
.L8007BB18:
/* 6C318 8007BB18 64000524 */  addiu      $a1, $zero, 0x64
.L8007BB1C:
/* 6C31C 8007BB1C 40000624 */  addiu      $a2, $zero, 0x40
/* 6C320 8007BB20 2402010C */  jal        SndPlayVolPan
/* 6C324 8007BB24 21380000 */   addu      $a3, $zero, $zero
/* 6C328 8007BB28 CFEE0108 */  j          .L8007BB3C
/* 6C32C 8007BB2C 00000000 */   nop
.L8007BB30:
/* 6C330 8007BB30 2128C002 */  addu       $a1, $s6, $zero
.L8007BB34:
/* 6C334 8007BB34 B6EB010C */  jal        _GlyphDefaultProcess
/* 6C338 8007BB38 2130E002 */   addu      $a2, $s7, $zero
.L8007BB3C:
/* 6C33C 8007BB3C 27C3010C */  jal        DeMessageQueue
/* 6C340 8007BB40 04002426 */   addiu     $a0, $s1, 0x4
/* 6C344 8007BB44 C8ED0108 */  j          .L8007B720
/* 6C348 8007BB48 00000000 */   nop
.L8007BB4C:
/* 6C34C 8007BB4C 07004016 */  bnez       $s2, .L8007BB6C
/* 6C350 8007BB50 00000000 */   nop
/* 6C354 8007BB54 8C002586 */  lh         $a1, 0x8C($s1)
/* 6C358 8007BB58 B2EB010C */  jal        _GlyphCost
/* 6C35C 8007BB5C 21208002 */   addu      $a0, $s4, $zero
/* 6C360 8007BB60 E0EC82A7 */  sh         $v0, %gp_rel(glyph_cost)($gp)
/* 6C364 8007BB64 29ED010C */  jal        EnlargeGlyphMenu
/* 6C368 8007BB68 21206002 */   addu      $a0, $s3, $zero
.L8007BB6C:
/* 6C36C 8007BB6C 56F0010C */  jal        Glyph_DoFX
/* 6C370 8007BB70 21206002 */   addu      $a0, $s3, $zero
/* 6C374 8007BB74 3000BF8F */  lw         $ra, 0x30($sp)
/* 6C378 8007BB78 2C00B78F */  lw         $s7, 0x2C($sp)
/* 6C37C 8007BB7C 2800B68F */  lw         $s6, 0x28($sp)
/* 6C380 8007BB80 2400B58F */  lw         $s5, 0x24($sp)
/* 6C384 8007BB84 2000B48F */  lw         $s4, 0x20($sp)
/* 6C388 8007BB88 1C00B38F */  lw         $s3, 0x1C($sp)
/* 6C38C 8007BB8C 1800B28F */  lw         $s2, 0x18($sp)
/* 6C390 8007BB90 1400B18F */  lw         $s1, 0x14($sp)
/* 6C394 8007BB94 1000B08F */  lw         $s0, 0x10($sp)
/* 6C398 8007BB98 0800E003 */  jr         $ra
/* 6C39C 8007BB9C 3800BD27 */   addiu     $sp, $sp, 0x38
.size _GlyphSelectProcess, . - _GlyphSelectProcess
