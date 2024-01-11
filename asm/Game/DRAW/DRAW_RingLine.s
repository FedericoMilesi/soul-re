.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel DRAW_RingLine
/* 1B8CC 8002B0CC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 1B8D0 8002B0D0 21408000 */  addu       $t0, $a0, $zero
/* 1B8D4 8002B0D4 0800028D */  lw         $v0, 0x8($t0)
/* 1B8D8 8002B0D8 0400078D */  lw         $a3, 0x4($t0)
/* 1B8DC 8002B0DC D0FF4224 */  addiu      $v0, $v0, -0x30
/* 1B8E0 8002B0E0 2B104700 */  sltu       $v0, $v0, $a3
/* 1B8E4 8002B0E4 43004014 */  bnez       $v0, .L8002B1F4
/* 1B8E8 8002B0E8 2148A000 */   addu      $t1, $a1, $zero
/* 1B8EC 8002B0EC 00F84C48 */  cfc2       $t4, $31 # handwritten instruction
/* 1B8F0 8002B0F0 00000000 */  nop
/* 1B8F4 8002B0F4 0000ACAF */  sw         $t4, 0x0($sp)
/* 1B8F8 8002B0F8 0000A28F */  lw         $v0, 0x0($sp)
/* 1B8FC 8002B0FC 0600033C */  lui        $v1, (0x60000 >> 16)
/* 1B900 8002B100 24104300 */  and        $v0, $v0, $v1
/* 1B904 8002B104 3A004014 */  bnez       $v0, .L8002B1F0
/* 1B908 8002B108 00000000 */   nop
/* 1B90C 8002B10C 00000000 */  nop
/* 1B910 8002B110 00000000 */  nop
/* 1B914 8002B114 0600404B */  NCLIP
/* 1B918 8002B118 0400A227 */  addiu      $v0, $sp, 0x4
/* 1B91C 8002B11C 000058E8 */  swc2       $24, 0x0($v0)
/* 1B920 8002B120 0800A427 */  addiu      $a0, $sp, 0x8
/* 1B924 8002B124 0C00A327 */  addiu      $v1, $sp, 0xC
/* 1B928 8002B128 1000A227 */  addiu      $v0, $sp, 0x10
/* 1B92C 8002B12C 000091E8 */  swc2       $17, 0x0($a0)
/* 1B930 8002B130 000072E8 */  swc2       $18, 0x0($v1)
/* 1B934 8002B134 000053E8 */  swc2       $19, 0x0($v0)
/* 1B938 8002B138 0800A58F */  lw         $a1, 0x8($sp)
/* 1B93C 8002B13C 0C00A38F */  lw         $v1, 0xC($sp)
/* 1B940 8002B140 00000000 */  nop
/* 1B944 8002B144 2A10A300 */  slt        $v0, $a1, $v1
/* 1B948 8002B148 08004010 */  beqz       $v0, .L8002B16C
/* 1B94C 8002B14C 00000000 */   nop
/* 1B950 8002B150 1000A48F */  lw         $a0, 0x10($sp)
/* 1B954 8002B154 00000000 */  nop
/* 1B958 8002B158 2A10A400 */  slt        $v0, $a1, $a0
/* 1B95C 8002B15C 0A004010 */  beqz       $v0, .L8002B188
/* 1B960 8002B160 83200400 */   sra       $a0, $a0, 2
/* 1B964 8002B164 61AC0008 */  j          .L8002B184
/* 1B968 8002B168 2120A000 */   addu      $a0, $a1, $zero
.L8002B16C:
/* 1B96C 8002B16C 1000A48F */  lw         $a0, 0x10($sp)
/* 1B970 8002B170 00000000 */  nop
/* 1B974 8002B174 2A106400 */  slt        $v0, $v1, $a0
/* 1B978 8002B178 03004010 */  beqz       $v0, .L8002B188
/* 1B97C 8002B17C 83200400 */   sra       $a0, $a0, 2
/* 1B980 8002B180 21206000 */  addu       $a0, $v1, $zero
.L8002B184:
/* 1B984 8002B184 83200400 */  sra        $a0, $a0, 2
.L8002B188:
/* 1B988 8002B188 000C822C */  sltiu      $v0, $a0, 0xC00
/* 1B98C 8002B18C 18004010 */  beqz       $v0, .L8002B1F0
/* 1B990 8002B190 03008228 */   slti      $v0, $a0, 0x3
/* 1B994 8002B194 02004014 */  bnez       $v0, .L8002B1A0
/* 1B998 8002B198 1400A227 */   addiu     $v0, $sp, 0x14
/* 1B99C 8002B19C FEFF8424 */  addiu      $a0, $a0, -0x2
.L8002B1A0:
/* 1B9A0 8002B1A0 000048E8 */  swc2       $8, 0x0($v0)
/* 1B9A4 8002B1A4 0040023C */  lui        $v0, (0x40000000 >> 16)
/* 1B9A8 8002B1A8 2510C200 */  or         $v0, $a2, $v0
/* 1B9AC 8002B1AC 0800E324 */  addiu      $v1, $a3, 0x8
/* 1B9B0 8002B1B0 0400E2AC */  sw         $v0, 0x4($a3)
/* 1B9B4 8002B1B4 0C00E224 */  addiu      $v0, $a3, 0xC
/* 1B9B8 8002B1B8 00006CE8 */  swc2       $12, 0x0($v1)
/* 1B9BC 8002B1BC 00004DE8 */  swc2       $13, 0x0($v0)
/* 1B9C0 8002B1C0 FF00053C */  lui        $a1, (0xFFFFFF >> 16)
/* 1B9C4 8002B1C4 80200400 */  sll        $a0, $a0, 2
/* 1B9C8 8002B1C8 21208900 */  addu       $a0, $a0, $t1
/* 1B9CC 8002B1CC FFFFA534 */  ori        $a1, $a1, (0xFFFFFF & 0xFFFF)
/* 1B9D0 8002B1D0 0000828C */  lw         $v0, 0x0($a0)
/* 1B9D4 8002B1D4 0003033C */  lui        $v1, (0x3000000 >> 16)
/* 1B9D8 8002B1D8 24104500 */  and        $v0, $v0, $a1
/* 1B9DC 8002B1DC 25104300 */  or         $v0, $v0, $v1
/* 1B9E0 8002B1E0 2428E500 */  and        $a1, $a3, $a1
/* 1B9E4 8002B1E4 0000E2AC */  sw         $v0, 0x0($a3)
/* 1B9E8 8002B1E8 1000E724 */  addiu      $a3, $a3, 0x10
/* 1B9EC 8002B1EC 000085AC */  sw         $a1, 0x0($a0)
.L8002B1F0:
/* 1B9F0 8002B1F0 040007AD */  sw         $a3, 0x4($t0)
.L8002B1F4:
/* 1B9F4 8002B1F4 0800E003 */  jr         $ra
/* 1B9F8 8002B1F8 1800BD27 */   addiu     $sp, $sp, 0x18
.size DRAW_RingLine, . - DRAW_RingLine
