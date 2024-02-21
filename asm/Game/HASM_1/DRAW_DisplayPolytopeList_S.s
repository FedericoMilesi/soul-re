.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel DRAW_DisplayPolytopeList_S
/* 17734 80026F34 A8FFBD27 */  addiu      $sp, $sp, -0x58
/* 17738 80026F38 4800B6AF */  sw         $s6, 0x48($sp)
/* 1773C 80026F3C 5000BFAF */  sw         $ra, 0x50($sp)
/* 17740 80026F40 4C00B7AF */  sw         $s7, 0x4C($sp)
/* 17744 80026F44 4400B5AF */  sw         $s5, 0x44($sp)
/* 17748 80026F48 4000B4AF */  sw         $s4, 0x40($sp)
/* 1774C 80026F4C 3C00B3AF */  sw         $s3, 0x3C($sp)
/* 17750 80026F50 3800B2AF */  sw         $s2, 0x38($sp)
/* 17754 80026F54 3400B1AF */  sw         $s1, 0x34($sp)
/* 17758 80026F58 3000B0AF */  sw         $s0, 0x30($sp)
/* 1775C 80026F5C 21B0A000 */  addu       $s6, $a1, $zero
/* 17760 80026F60 6800B48F */  lw         $s4, 0x68($sp)
/* 17764 80026F64 6C00B28F */  lw         $s2, 0x6C($sp)
/* 17768 80026F68 0400E88C */  lw         $t0, 0x4($a3)
/* 1776C 80026F6C 6000CB8C */  lw         $t3, 0x60($a2)
/* 17770 80026F70 0800F38C */  lw         $s3, 0x8($a3)
/* 17774 80026F74 00006C8D */  lw         $t4, 0x0($t3)
/* 17778 80026F78 04006D8D */  lw         $t5, 0x4($t3)
/* 1777C 80026F7C 08006E8D */  lw         $t6, 0x8($t3)
/* 17780 80026F80 0C006F8D */  lw         $t7, 0xC($t3)
/* 17784 80026F84 0000CC48 */  ctc2       $t4, $0 # handwritten instruction
/* 17788 80026F88 0008CD48 */  ctc2       $t5, $1 # handwritten instruction
/* 1778C 80026F8C 0010CE48 */  ctc2       $t6, $2 # handwritten instruction
/* 17790 80026F90 0018CF48 */  ctc2       $t7, $3 # handwritten instruction
/* 17794 80026F94 10006C8D */  lw         $t4, 0x10($t3)
/* 17798 80026F98 14006D8D */  lw         $t5, 0x14($t3)
/* 1779C 80026F9C 18006E8D */  lw         $t6, 0x18($t3)
/* 177A0 80026FA0 1C006F8D */  lw         $t7, 0x1C($t3)
/* 177A4 80026FA4 0020CC48 */  ctc2       $t4, $4 # handwritten instruction
/* 177A8 80026FA8 0028CD48 */  ctc2       $t5, $5 # handwritten instruction
/* 177AC 80026FAC 0030CE48 */  ctc2       $t6, $6 # handwritten instruction
/* 177B0 80026FB0 0038CF48 */  ctc2       $t7, $7 # handwritten instruction
/* 177B4 80026FB4 801F153C */  lui        $s5, (0x1F800018 >> 16)
/* 177B8 80026FB8 0D800C3C */  lui        $t4, %hi(depthQFogStart)
/* 177BC 80026FBC E4058C8D */  lw         $t4, %lo(depthQFogStart)($t4)
/* 177C0 80026FC0 0D800D3C */  lui        $t5, %hi(depthQPTable)
/* 177C4 80026FC4 DC05AD8D */  lw         $t5, %lo(depthQPTable)($t5)
/* 177C8 80026FC8 0D800E3C */  lui        $t6, %hi(depthQBlendStart)
/* 177CC 80026FCC E005CE8D */  lw         $t6, %lo(depthQBlendStart)($t6)
/* 177D0 80026FD0 0D800F3C */  lui        $t7, %hi(depthQBackColor)
/* 177D4 80026FD4 EC05EF8D */  lw         $t7, %lo(depthQBackColor)($t7)
/* 177D8 80026FD8 0D80183C */  lui        $t8, %hi(depthQFogFar)
/* 177DC 80026FDC E805188F */  lw         $t8, %lo(depthQFogFar)($t8)
/* 177E0 80026FE0 0D80023C */  lui        $v0, %hi(SpecialFogClut)
/* 177E4 80026FE4 80294284 */  lh         $v0, %lo(SpecialFogClut)($v0)
/* 177E8 80026FE8 B000ACAE */  sw         $t4, (0x1F8000B0 & 0xFFFF)($s5)
/* 177EC 80026FEC B400ADAE */  sw         $t5, (0x1F8000B4 & 0xFFFF)($s5)
/* 177F0 80026FF0 B800AEAE */  sw         $t6, (0x1F8000B8 & 0xFFFF)($s5)
/* 177F4 80026FF4 CC00AFAE */  sw         $t7, (0x1F8000CC & 0xFFFF)($s5)
/* 177F8 80026FF8 D000B8AE */  sw         $t8, (0x1F8000D0 & 0xFFFF)($s5)
/* 177FC 80026FFC D400A2A6 */  sh         $v0, (0x1F8000D4 & 0xFFFF)($s5)
/* 17800 80027000 0000828C */  lw         $v0, 0x0($a0)
/* 17804 80027004 04009024 */  addiu      $s0, $a0, 0x4
/* 17808 80027008 80100200 */  sll        $v0, $v0, 2
/* 1780C 8002700C 04004224 */  addiu      $v0, $v0, 0x4
/* 17810 80027010 21B88200 */  addu       $s7, $a0, $v0
/* 17814 80027014 2B101702 */  sltu       $v0, $s0, $s7
/* 17818 80027018 48004010 */  beqz       $v0, .L8002713C
/* 1781C 8002701C FF00113C */   lui       $s1, (0xFFFFFF >> 16)
/* 17820 80027020 FFFF3136 */  ori        $s1, $s1, (0xFFFFFF & 0xFFFF)
.L80027024:
/* 17824 80027024 0000038E */  lw         $v1, 0x0($s0)
/* 17828 80027028 00000000 */  nop
/* 1782C 8002702C 0E006284 */  lh         $v0, 0xE($v1)
/* 17830 80027030 00000000 */  nop
/* 17834 80027034 02004230 */  andi       $v0, $v0, 0x2
/* 17838 80027038 3C004010 */  beqz       $v0, .L8002712C
/* 1783C 8002703C 000C0C21 */   addi      $t4, $t0, 0xC00 # handwritten instruction
/* 17840 80027040 2A089301 */  slt        $at, $t4, $s3
/* 17844 80027044 39002010 */  beqz       $at, .L8002712C
/* 17848 80027048 00000000 */   nop
/* 1784C 8002704C 0D80023C */  lui        $v0, (0x800D3360 >> 16)
/* 17850 80027050 60334234 */  ori        $v0, $v0, (0x800D3360 & 0xFFFF)
/* 17854 80027054 0C004224 */  addiu      $v0, $v0, 0xC
/* 17858 80027058 0000428C */  lw         $v0, 0x0($v0)
/* 1785C 8002705C 00000000 */  nop
/* 17860 80027060 2E000210 */  beq        $zero, $v0, .L8002711C
/* 17864 80027064 1800A0AE */   sw        $zero, (0x1F800018 & 0xFFFF)($s5)
/* 17868 80027068 4000428C */  lw         $v0, 0x40($v0)
/* 1786C 8002706C 00000000 */  nop
/* 17870 80027070 14004D8C */  lw         $t5, 0x14($v0)
/* 17874 80027074 1800448C */  lw         $a0, 0x18($v0)
/* 17878 80027078 1C00428C */  lw         $v0, 0x1C($v0)
/* 1787C 8002707C 00004586 */  lh         $a1, 0x0($s2)
/* 17880 80027080 02004686 */  lh         $a2, 0x2($s2)
/* 17884 80027084 04004786 */  lh         $a3, 0x4($s2)
/* 17888 80027088 2268A501 */  sub        $t5, $t5, $a1 # handwritten instruction
/* 1788C 8002708C 22208600 */  sub        $a0, $a0, $a2 # handwritten instruction
/* 17890 80027090 22104700 */  sub        $v0, $v0, $a3 # handwritten instruction
/* 17894 80027094 1C00ADAE */  sw         $t5, (0x1F80001C & 0xFFFF)($s5)
/* 17898 80027098 2000A4AE */  sw         $a0, (0x1F800020 & 0xFFFF)($s5)
/* 1789C 8002709C 2400A2AE */  sw         $v0, (0x1F800024 & 0xFFFF)($s5)
/* 178A0 800270A0 00006584 */  lh         $a1, 0x0($v1)
/* 178A4 800270A4 02006684 */  lh         $a2, 0x2($v1)
/* 178A8 800270A8 04006784 */  lh         $a3, 0x4($v1)
/* 178AC 800270AC 2228A501 */  sub        $a1, $t5, $a1 # handwritten instruction
/* 178B0 800270B0 0200A104 */  bgez       $a1, .L800270BC
/* 178B4 800270B4 22308600 */   sub       $a2, $a0, $a2 # handwritten instruction
/* 178B8 800270B8 22280500 */  neg        $a1, $a1 # handwritten instruction
.L800270BC:
/* 178BC 800270BC 0200C104 */  bgez       $a2, .L800270C8
/* 178C0 800270C0 22384700 */   sub       $a3, $v0, $a3 # handwritten instruction
/* 178C4 800270C4 22300600 */  neg        $a2, $a2 # handwritten instruction
.L800270C8:
/* 178C8 800270C8 0200E104 */  bgez       $a3, .L800270D4
/* 178CC 800270CC 06006284 */   lh        $v0, 0x6($v1)
/* 178D0 800270D0 22380700 */  neg        $a3, $a3 # handwritten instruction
.L800270D4:
/* 178D4 800270D4 2A08C500 */  slt        $at, $a2, $a1
/* 178D8 800270D8 02002014 */  bnez       $at, .L800270E4
/* 178DC 800270DC 00000000 */   nop
/* 178E0 800270E0 2128C000 */  addu       $a1, $a2, $zero
.L800270E4:
/* 178E4 800270E4 2A08E500 */  slt        $at, $a3, $a1
/* 178E8 800270E8 02002014 */  bnez       $at, .L800270F4
/* 178EC 800270EC 00000000 */   nop
/* 178F0 800270F0 2128E000 */  addu       $a1, $a3, $zero
.L800270F4:
/* 178F4 800270F4 0D80063C */  lui        $a2, (0x800D3360 >> 16)
/* 178F8 800270F8 6033C634 */  ori        $a2, $a2, (0x800D3360 & 0xFFFF)
/* 178FC 800270FC 0C00C624 */  addiu      $a2, $a2, 0xC
/* 17900 80027100 1000C784 */  lh         $a3, 0x10($a2)
/* 17904 80027104 00000000 */  nop
/* 17908 80027108 2038E200 */  add        $a3, $a3, $v0 # handwritten instruction
/* 1790C 8002710C 2A08A700 */  slt        $at, $a1, $a3
/* 17910 80027110 02002010 */  beqz       $at, .L8002711C
/* 17914 80027114 00000000 */   nop
/* 17918 80027118 1800A6AE */  sw         $a2, (0x1F800018 & 0xFFFF)($s5)
.L8002711C:
/* 1791C 8002711C 21200002 */  addu       $a0, $s0, $zero
/* 17920 80027120 2128C002 */  addu       $a1, $s6, $zero
/* 17924 80027124 7F99000C */  jal        DRAW_DisplaySubdivPolytope_S
/* 17928 80027128 00000000 */   nop
.L8002712C:
/* 1792C 8002712C 04001026 */  addiu      $s0, $s0, 0x4
/* 17930 80027130 2B101702 */  sltu       $v0, $s0, $s7
/* 17934 80027134 BBFF4014 */  bnez       $v0, .L80027024
/* 17938 80027138 00000000 */   nop
.L8002713C:
/* 1793C 8002713C 21100001 */  addu       $v0, $t0, $zero
/* 17940 80027140 5000BF8F */  lw         $ra, 0x50($sp)
/* 17944 80027144 4C00B78F */  lw         $s7, 0x4C($sp)
/* 17948 80027148 4800B68F */  lw         $s6, 0x48($sp)
/* 1794C 8002714C 4400B58F */  lw         $s5, 0x44($sp)
/* 17950 80027150 4000B48F */  lw         $s4, 0x40($sp)
/* 17954 80027154 3C00B38F */  lw         $s3, 0x3C($sp)
/* 17958 80027158 3800B28F */  lw         $s2, 0x38($sp)
/* 1795C 8002715C 3400B18F */  lw         $s1, 0x34($sp)
/* 17960 80027160 3000B08F */  lw         $s0, 0x30($sp)
/* 17964 80027164 5800BD27 */  addiu      $sp, $sp, 0x58
/* 17968 80027168 0800E003 */  jr         $ra
/* 1796C 8002716C 00000000 */   nop
.size DRAW_DisplayPolytopeList_S, . - DRAW_DisplayPolytopeList_S
