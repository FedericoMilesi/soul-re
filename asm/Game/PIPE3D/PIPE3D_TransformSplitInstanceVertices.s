.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel PIPE3D_TransformSplitInstanceVertices
/* 2C8B4 8003C0B4 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 2C8B8 8003C0B8 1800B2AF */  sw         $s2, 0x18($sp)
/* 2C8BC 8003C0BC 2190A000 */  addu       $s2, $a1, $zero
/* 2C8C0 8003C0C0 1400B1AF */  sw         $s1, 0x14($sp)
/* 2C8C4 8003C0C4 801F113C */  lui        $s1, (0x1F800020 >> 16)
/* 2C8C8 8003C0C8 20003136 */  ori        $s1, $s1, (0x1F800020 & 0xFFFF)
/* 2C8CC 8003C0CC 2400B5AF */  sw         $s5, 0x24($sp)
/* 2C8D0 8003C0D0 21A80000 */  addu       $s5, $zero, $zero
/* 2C8D4 8003C0D4 3000BEAF */  sw         $fp, 0x30($sp)
/* 2C8D8 8003C0D8 3400BFAF */  sw         $ra, 0x34($sp)
/* 2C8DC 8003C0DC 2C00B7AF */  sw         $s7, 0x2C($sp)
/* 2C8E0 8003C0E0 2800B6AF */  sw         $s6, 0x28($sp)
/* 2C8E4 8003C0E4 2000B4AF */  sw         $s4, 0x20($sp)
/* 2C8E8 8003C0E8 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 2C8EC 8003C0EC 1000B0AF */  sw         $s0, 0x10($sp)
/* 2C8F0 8003C0F0 3800A4AF */  sw         $a0, 0x38($sp)
/* 2C8F4 8003C0F4 4000A6AF */  sw         $a2, 0x40($sp)
/* 2C8F8 8003C0F8 4400A7AF */  sw         $a3, 0x44($sp)
/* 2C8FC 8003C0FC 1800C28C */  lw         $v0, 0x18($a2)
/* 2C900 8003C100 1C00C38C */  lw         $v1, 0x1C($a2)
/* 2C904 8003C104 3C004018 */  blez       $v0, .L8003C1F8
/* 2C908 8003C108 801F1E3C */   lui       $fp, (0x1F800000 >> 16)
/* 2C90C 8003C10C 4800B78F */  lw         $s7, 0x48($sp)
/* 2C910 8003C110 21B0A002 */  addu       $s6, $s5, $zero
/* 2C914 8003C114 0A007324 */  addiu      $s3, $v1, 0xA
/* 2C918 8003C118 4000A88F */  lw         $t0, 0x40($sp)
.L8003C11C:
/* 2C91C 8003C11C 00000000 */  nop
/* 2C920 8003C120 1C00028D */  lw         $v0, 0x1C($t0)
/* 2C924 8003C124 00000000 */  nop
/* 2C928 8003C128 2110C202 */  addu       $v0, $s6, $v0
/* 2C92C 8003C12C 0A004384 */  lh         $v1, 0xA($v0)
/* 2C930 8003C130 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 2C934 8003C134 27006210 */  beq        $v1, $v0, .L8003C1D4
/* 2C938 8003C138 2128E002 */   addu      $a1, $s7, $zero
/* 2C93C 8003C13C 2130C003 */  addu       $a2, $fp, $zero
/* 2C940 8003C140 FEFF7086 */  lh         $s0, -0x2($s3)
/* 2C944 8003C144 4400A48F */  lw         $a0, 0x44($sp)
/* 2C948 8003C148 00006286 */  lh         $v0, 0x0($s3)
/* 2C94C 8003C14C 3800A88F */  lw         $t0, 0x38($sp)
/* 2C950 8003C150 C0801000 */  sll        $s0, $s0, 3
/* 2C954 8003C154 21801001 */  addu       $s0, $t0, $s0
/* 2C958 8003C158 C0100200 */  sll        $v0, $v0, 3
/* 2C95C 8003C15C 59FD020C */  jal        func_800BF564
/* 2C960 8003C160 21A00201 */   addu      $s4, $t0, $v0
/* 2C964 8003C164 52F2020C */  jal        func_800BC948
/* 2C968 8003C168 2120C003 */   addu      $a0, $fp, $zero
/* 2C96C 8003C16C 4AF2020C */  jal        func_800BC928
/* 2C970 8003C170 2120C003 */   addu      $a0, $fp, $zero
/* 2C974 8003C174 2B109002 */  sltu       $v0, $s4, $s0
/* 2C978 8003C178 16004014 */  bnez       $v0, .L8003C1D4
/* 2C97C 8003C17C 00000000 */   nop
/* 2C980 8003C180 04004326 */  addiu      $v1, $s2, 0x4
.L8003C184:
/* 2C984 8003C184 000000CA */  lwc2       $0, 0x0($s0)
/* 2C988 8003C188 040001CA */  lwc2       $1, 0x4($s0)
/* 2C98C 8003C18C 00000000 */  nop
/* 2C990 8003C190 00000000 */  nop
/* 2C994 8003C194 1200484A */  MVMVA      1, 0, 0, 0, 0
/* 2C998 8003C198 000039EA */  swc2       $25, 0x0($s1)
/* 2C99C 8003C19C 04003AEA */  swc2       $26, 0x4($s1) # handwritten instruction
/* 2C9A0 8003C1A0 08003BEA */  swc2       $27, 0x8($s1) # handwritten instruction
/* 2C9A4 8003C1A4 00002296 */  lhu        $v0, 0x0($s1)
/* 2C9A8 8003C1A8 00000000 */  nop
/* 2C9AC 8003C1AC 000042A6 */  sh         $v0, 0x0($s2)
/* 2C9B0 8003C1B0 04002296 */  lhu        $v0, 0x4($s1)
/* 2C9B4 8003C1B4 08001026 */  addiu      $s0, $s0, 0x8
/* 2C9B8 8003C1B8 FEFF62A4 */  sh         $v0, -0x2($v1)
/* 2C9BC 8003C1BC 08002296 */  lhu        $v0, 0x8($s1)
/* 2C9C0 8003C1C0 08005226 */  addiu      $s2, $s2, 0x8
/* 2C9C4 8003C1C4 000062A4 */  sh         $v0, 0x0($v1)
/* 2C9C8 8003C1C8 2B109002 */  sltu       $v0, $s4, $s0
/* 2C9CC 8003C1CC EDFF4010 */  beqz       $v0, .L8003C184
/* 2C9D0 8003C1D0 08006324 */   addiu     $v1, $v1, 0x8
.L8003C1D4:
/* 2C9D4 8003C1D4 18007326 */  addiu      $s3, $s3, 0x18
/* 2C9D8 8003C1D8 2000F726 */  addiu      $s7, $s7, 0x20
/* 2C9DC 8003C1DC 4000A88F */  lw         $t0, 0x40($sp)
/* 2C9E0 8003C1E0 00000000 */  nop
/* 2C9E4 8003C1E4 1800028D */  lw         $v0, 0x18($t0)
/* 2C9E8 8003C1E8 0100B526 */  addiu      $s5, $s5, 0x1
/* 2C9EC 8003C1EC 2A10A202 */  slt        $v0, $s5, $v0
/* 2C9F0 8003C1F0 CAFF4014 */  bnez       $v0, .L8003C11C
/* 2C9F4 8003C1F4 1800D626 */   addiu     $s6, $s6, 0x18
.L8003C1F8:
/* 2C9F8 8003C1F8 3400BF8F */  lw         $ra, 0x34($sp)
/* 2C9FC 8003C1FC 3000BE8F */  lw         $fp, 0x30($sp)
/* 2CA00 8003C200 2C00B78F */  lw         $s7, 0x2C($sp)
/* 2CA04 8003C204 2800B68F */  lw         $s6, 0x28($sp)
/* 2CA08 8003C208 2400B58F */  lw         $s5, 0x24($sp)
/* 2CA0C 8003C20C 2000B48F */  lw         $s4, 0x20($sp)
/* 2CA10 8003C210 1C00B38F */  lw         $s3, 0x1C($sp)
/* 2CA14 8003C214 1800B28F */  lw         $s2, 0x18($sp)
/* 2CA18 8003C218 1400B18F */  lw         $s1, 0x14($sp)
/* 2CA1C 8003C21C 1000B08F */  lw         $s0, 0x10($sp)
/* 2CA20 8003C220 0800E003 */  jr         $ra
/* 2CA24 8003C224 3800BD27 */   addiu     $sp, $sp, 0x38
.size PIPE3D_TransformSplitInstanceVertices, . - PIPE3D_TransformSplitInstanceVertices
