.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_Health_Spiral
/* 3E7D4 8004DFD4 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 3E7D8 8004DFD8 1000B0AF */  sw         $s0, 0x10($sp)
/* 3E7DC 8004DFDC 2180A000 */  addu       $s0, $a1, $zero
/* 3E7E0 8004DFE0 1400B1AF */  sw         $s1, 0x14($sp)
/* 3E7E4 8004DFE4 2188C000 */  addu       $s1, $a2, $zero
/* 3E7E8 8004DFE8 0C008010 */  beqz       $a0, .L8004E01C
/* 3E7EC 8004DFEC 1800BFAF */   sw        $ra, 0x18($sp)
/* 3E7F0 8004DFF0 ECC6838F */  lw         $v1, %gp_rel(Spiral_Mod)($gp)
/* 3E7F4 8004DFF4 00000000 */  nop
/* 3E7F8 8004DFF8 02006228 */  slti       $v0, $v1, 0x2
/* 3E7FC 8004DFFC 13004014 */  bnez       $v0, .L8004E04C
/* 3E800 8004E000 0500822C */   sltiu     $v0, $a0, 0x5
/* 3E804 8004E004 FFFF6224 */  addiu      $v0, $v1, -0x1
/* 3E808 8004E008 ECC682AF */  sw         $v0, %gp_rel(Spiral_Mod)($gp)
/* 3E80C 8004E00C 2F36010C */  jal        FX_CalcSpiral
/* 3E810 8004E010 80000424 */   addiu     $a0, $zero, 0x80
/* 3E814 8004E014 43380108 */  j          .L8004E10C
/* 3E818 8004E018 00000000 */   nop
.L8004E01C:
/* 3E81C 8004E01C ECC6838F */  lw         $v1, %gp_rel(Spiral_Mod)($gp)
/* 3E820 8004E020 00000000 */  nop
/* 3E824 8004E024 06006228 */  slti       $v0, $v1, 0x6
/* 3E828 8004E028 07004010 */  beqz       $v0, .L8004E048
/* 3E82C 8004E02C 01006224 */   addiu     $v0, $v1, 0x1
/* 3E830 8004E030 ECC682AF */  sw         $v0, %gp_rel(Spiral_Mod)($gp)
/* 3E834 8004E034 C49A80A7 */  sh         $zero, %gp_rel(Spiral_Number)($gp)
/* 3E838 8004E038 2F36010C */  jal        FX_CalcSpiral
/* 3E83C 8004E03C 80000424 */   addiu     $a0, $zero, 0x80
/* 3E840 8004E040 43380108 */  j          .L8004E10C
/* 3E844 8004E044 00000000 */   nop
.L8004E048:
/* 3E848 8004E048 0500822C */  sltiu      $v0, $a0, 0x5
.L8004E04C:
/* 3E84C 8004E04C 08004010 */  beqz       $v0, .L8004E070
/* 3E850 8004E050 0180023C */   lui       $v0, %hi(jtbl_80010370)
/* 3E854 8004E054 70034224 */  addiu      $v0, $v0, %lo(jtbl_80010370)
/* 3E858 8004E058 80180400 */  sll        $v1, $a0, 2
/* 3E85C 8004E05C 21186200 */  addu       $v1, $v1, $v0
/* 3E860 8004E060 0000628C */  lw         $v0, 0x0($v1)
/* 3E864 8004E064 00000000 */  nop
/* 3E868 8004E068 08004000 */  jr         $v0
/* 3E86C 8004E06C 00000000 */   nop
jlabel .L8004E070
/* 3E870 8004E070 23380108 */  j          .L8004E08C
/* 3E874 8004E074 80000324 */   addiu     $v1, $zero, 0x80
jlabel .L8004E078
/* 3E878 8004E078 23380108 */  j          .L8004E08C
/* 3E87C 8004E07C A0000324 */   addiu     $v1, $zero, 0xA0
jlabel .L8004E080
/* 3E880 8004E080 23380108 */  j          .L8004E08C
/* 3E884 8004E084 C0000324 */   addiu     $v1, $zero, 0xC0
jlabel .L8004E088
/* 3E888 8004E088 E0000324 */  addiu      $v1, $zero, 0xE0
.L8004E08C:
/* 3E88C 8004E08C C69A8587 */  lh         $a1, %gp_rel(Spiral_Degrees)($gp)
/* 3E890 8004E090 C69A8697 */  lhu        $a2, %gp_rel(Spiral_Degrees)($gp)
/* 3E894 8004E094 05006514 */  bne        $v1, $a1, .L8004E0AC
/* 3E898 8004E098 00000000 */   nop
/* 3E89C 8004E09C C49A8287 */  lh         $v0, %gp_rel(Spiral_Number)($gp)
/* 3E8A0 8004E0A0 00000000 */  nop
/* 3E8A4 8004E0A4 17004410 */  beq        $v0, $a0, .L8004E104
/* 3E8A8 8004E0A8 00000000 */   nop
.L8004E0AC:
/* 3E8AC 8004E0AC C49A84A7 */  sh         $a0, %gp_rel(Spiral_Number)($gp)
/* 3E8B0 8004E0B0 2A10A300 */  slt        $v0, $a1, $v1
/* 3E8B4 8004E0B4 06004010 */  beqz       $v0, .L8004E0D0
/* 3E8B8 8004E0B8 0400C224 */   addiu     $v0, $a2, 0x4
/* 3E8BC 8004E0BC C69A82A7 */  sh         $v0, %gp_rel(Spiral_Degrees)($gp)
/* 3E8C0 8004E0C0 00140200 */  sll        $v0, $v0, 16
/* 3E8C4 8004E0C4 03140200 */  sra        $v0, $v0, 16
/* 3E8C8 8004E0C8 3B380108 */  j          .L8004E0EC
/* 3E8CC 8004E0CC 2A106200 */   slt       $v0, $v1, $v0
.L8004E0D0:
/* 3E8D0 8004E0D0 2A106500 */  slt        $v0, $v1, $a1
/* 3E8D4 8004E0D4 08004010 */  beqz       $v0, .L8004E0F8
/* 3E8D8 8004E0D8 FCFFC224 */   addiu     $v0, $a2, -0x4
/* 3E8DC 8004E0DC C69A82A7 */  sh         $v0, %gp_rel(Spiral_Degrees)($gp)
/* 3E8E0 8004E0E0 00140200 */  sll        $v0, $v0, 16
/* 3E8E4 8004E0E4 03140200 */  sra        $v0, $v0, 16
/* 3E8E8 8004E0E8 2A104300 */  slt        $v0, $v0, $v1
.L8004E0EC:
/* 3E8EC 8004E0EC 02004010 */  beqz       $v0, .L8004E0F8
/* 3E8F0 8004E0F0 00000000 */   nop
/* 3E8F4 8004E0F4 C69A83A7 */  sh         $v1, %gp_rel(Spiral_Degrees)($gp)
.L8004E0F8:
/* 3E8F8 8004E0F8 C69A8487 */  lh         $a0, %gp_rel(Spiral_Degrees)($gp)
/* 3E8FC 8004E0FC 2F36010C */  jal        FX_CalcSpiral
/* 3E900 8004E100 00000000 */   nop
.L8004E104:
/* 3E904 8004E104 C89A90AF */  sw         $s0, %gp_rel(Spiral_Current)($gp)
/* 3E908 8004E108 CC9A91AF */  sw         $s1, %gp_rel(Spiral_Max)($gp)
.L8004E10C:
/* 3E90C 8004E10C 1800BF8F */  lw         $ra, 0x18($sp)
/* 3E910 8004E110 1400B18F */  lw         $s1, 0x14($sp)
/* 3E914 8004E114 1000B08F */  lw         $s0, 0x10($sp)
/* 3E918 8004E118 0800E003 */  jr         $ra
/* 3E91C 8004E11C 2000BD27 */   addiu     $sp, $sp, 0x20
.size FX_Health_Spiral, . - FX_Health_Spiral
