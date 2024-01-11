.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PIPE3D_TransformFromZAxis
/* 2C024 8003B824 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 2C028 8003B828 2C00B1AF */  sw         $s1, 0x2C($sp)
/* 2C02C 8003B82C 2188A000 */  addu       $s1, $a1, $zero
/* 2C030 8003B830 3000BFAF */  sw         $ra, 0x30($sp)
/* 2C034 8003B834 2800B0AF */  sw         $s0, 0x28($sp)
/* 2C038 8003B838 00002286 */  lh         $v0, 0x0($s1)
/* 2C03C 8003B83C 00000000 */  nop
/* 2C040 8003B840 02004104 */  bgez       $v0, .L8003B84C
/* 2C044 8003B844 00000000 */   nop
/* 2C048 8003B848 23100200 */  negu       $v0, $v0
.L8003B84C:
/* 2C04C 8003B84C 05004228 */  slti       $v0, $v0, 0x5
/* 2C050 8003B850 1C004010 */  beqz       $v0, .L8003B8C4
/* 2C054 8003B854 21808000 */   addu      $s0, $a0, $zero
/* 2C058 8003B858 02002286 */  lh         $v0, 0x2($s1)
/* 2C05C 8003B85C 00000000 */  nop
/* 2C060 8003B860 02004104 */  bgez       $v0, .L8003B86C
/* 2C064 8003B864 00000000 */   nop
/* 2C068 8003B868 23100200 */  negu       $v0, $v0
.L8003B86C:
/* 2C06C 8003B86C 05004228 */  slti       $v0, $v0, 0x5
/* 2C070 8003B870 14004010 */  beqz       $v0, .L8003B8C4
/* 2C074 8003B874 00000000 */   nop
/* 2C078 8003B878 04002286 */  lh         $v0, 0x4($s1)
/* 2C07C 8003B87C 00000000 */  nop
/* 2C080 8003B880 05004004 */  bltz       $v0, .L8003B898
/* 2C084 8003B884 00100224 */   addiu     $v0, $zero, 0x1000
/* 2C088 8003B888 4CE8000C */  jal        MATH3D_SetUnityMatrix
/* 2C08C 8003B88C 00000000 */   nop
/* 2C090 8003B890 80EE0008 */  j          .L8003BA00
/* 2C094 8003B894 00000000 */   nop
.L8003B898:
/* 2C098 8003B898 000002A6 */  sh         $v0, 0x0($s0)
/* 2C09C 8003B89C 00F00224 */  addiu      $v0, $zero, -0x1000
/* 2C0A0 8003B8A0 020000A6 */  sh         $zero, 0x2($s0)
/* 2C0A4 8003B8A4 040000A6 */  sh         $zero, 0x4($s0)
/* 2C0A8 8003B8A8 060000A6 */  sh         $zero, 0x6($s0)
/* 2C0AC 8003B8AC 080002A6 */  sh         $v0, 0x8($s0)
/* 2C0B0 8003B8B0 0A0000A6 */  sh         $zero, 0xA($s0)
/* 2C0B4 8003B8B4 0C0000A6 */  sh         $zero, 0xC($s0)
/* 2C0B8 8003B8B8 0E0000A6 */  sh         $zero, 0xE($s0)
/* 2C0BC 8003B8BC 80EE0008 */  j          .L8003BA00
/* 2C0C0 8003B8C0 100002A6 */   sh        $v0, 0x10($s0)
.L8003B8C4:
/* 2C0C4 8003B8C4 02002286 */  lh         $v0, 0x2($s1)
/* 2C0C8 8003B8C8 00000000 */  nop
/* 2C0CC 8003B8CC 23100200 */  negu       $v0, $v0
/* 2C0D0 8003B8D0 1800A2A7 */  sh         $v0, 0x18($sp)
/* 2C0D4 8003B8D4 00002286 */  lh         $v0, 0x0($s1)
/* 2C0D8 8003B8D8 1800A427 */  addiu      $a0, $sp, 0x18
/* 2C0DC 8003B8DC 1C00A0A7 */  sh         $zero, 0x1C($sp)
/* 2C0E0 8003B8E0 03E7000C */  jal        MATH3D_Normalize
/* 2C0E4 8003B8E4 1A00A2A7 */   sh        $v0, 0x1A($sp)
/* 2C0E8 8003B8E8 02002286 */  lh         $v0, 0x2($s1)
/* 2C0EC 8003B8EC 1C00A387 */  lh         $v1, 0x1C($sp)
/* 2C0F0 8003B8F0 00000000 */  nop
/* 2C0F4 8003B8F4 18004300 */  mult       $v0, $v1
/* 2C0F8 8003B8F8 1A00A487 */  lh         $a0, 0x1A($sp)
/* 2C0FC 8003B8FC 12280000 */  mflo       $a1
/* 2C100 8003B900 04002286 */  lh         $v0, 0x4($s1)
/* 2C104 8003B904 00000000 */  nop
/* 2C108 8003B908 18004400 */  mult       $v0, $a0
/* 2C10C 8003B90C 12400000 */  mflo       $t0
/* 2C110 8003B910 2310A800 */  subu       $v0, $a1, $t0
/* 2C114 8003B914 03130200 */  sra        $v0, $v0, 12
/* 2C118 8003B918 2000A2A7 */  sh         $v0, 0x20($sp)
/* 2C11C 8003B91C 00002286 */  lh         $v0, 0x0($s1)
/* 2C120 8003B920 00000000 */  nop
/* 2C124 8003B924 18004300 */  mult       $v0, $v1
/* 2C128 8003B928 04002286 */  lh         $v0, 0x4($s1)
/* 2C12C 8003B92C 12280000 */  mflo       $a1
/* 2C130 8003B930 1800A387 */  lh         $v1, 0x18($sp)
/* 2C134 8003B934 00000000 */  nop
/* 2C138 8003B938 18004300 */  mult       $v0, $v1
/* 2C13C 8003B93C 12400000 */  mflo       $t0
/* 2C140 8003B940 2310A800 */  subu       $v0, $a1, $t0
/* 2C144 8003B944 03130200 */  sra        $v0, $v0, 12
/* 2C148 8003B948 23100200 */  negu       $v0, $v0
/* 2C14C 8003B94C 2200A2A7 */  sh         $v0, 0x22($sp)
/* 2C150 8003B950 00002286 */  lh         $v0, 0x0($s1)
/* 2C154 8003B954 00000000 */  nop
/* 2C158 8003B958 18004400 */  mult       $v0, $a0
/* 2C15C 8003B95C 12280000 */  mflo       $a1
/* 2C160 8003B960 02002286 */  lh         $v0, 0x2($s1)
/* 2C164 8003B964 00000000 */  nop
/* 2C168 8003B968 18004300 */  mult       $v0, $v1
/* 2C16C 8003B96C 2000A427 */  addiu      $a0, $sp, 0x20
/* 2C170 8003B970 12180000 */  mflo       $v1
/* 2C174 8003B974 2310A300 */  subu       $v0, $a1, $v1
/* 2C178 8003B978 03130200 */  sra        $v0, $v0, 12
/* 2C17C 8003B97C 03E7000C */  jal        MATH3D_Normalize
/* 2C180 8003B980 2400A2A7 */   sh        $v0, 0x24($sp)
/* 2C184 8003B984 1800A297 */  lhu        $v0, 0x18($sp)
/* 2C188 8003B988 00000000 */  nop
/* 2C18C 8003B98C 000002A6 */  sh         $v0, 0x0($s0)
/* 2C190 8003B990 1A00A297 */  lhu        $v0, 0x1A($sp)
/* 2C194 8003B994 00000000 */  nop
/* 2C198 8003B998 020002A6 */  sh         $v0, 0x2($s0)
/* 2C19C 8003B99C 1C00A297 */  lhu        $v0, 0x1C($sp)
/* 2C1A0 8003B9A0 00000000 */  nop
/* 2C1A4 8003B9A4 040002A6 */  sh         $v0, 0x4($s0)
/* 2C1A8 8003B9A8 2000A297 */  lhu        $v0, 0x20($sp)
/* 2C1AC 8003B9AC 00000000 */  nop
/* 2C1B0 8003B9B0 060002A6 */  sh         $v0, 0x6($s0)
/* 2C1B4 8003B9B4 2200A297 */  lhu        $v0, 0x22($sp)
/* 2C1B8 8003B9B8 00000000 */  nop
/* 2C1BC 8003B9BC 080002A6 */  sh         $v0, 0x8($s0)
/* 2C1C0 8003B9C0 2400A297 */  lhu        $v0, 0x24($sp)
/* 2C1C4 8003B9C4 00000000 */  nop
/* 2C1C8 8003B9C8 0A0002A6 */  sh         $v0, 0xA($s0)
/* 2C1CC 8003B9CC 00002296 */  lhu        $v0, 0x0($s1)
/* 2C1D0 8003B9D0 1000A427 */  addiu      $a0, $sp, 0x10
/* 2C1D4 8003B9D4 0C0002A6 */  sh         $v0, 0xC($s0)
/* 2C1D8 8003B9D8 02002296 */  lhu        $v0, 0x2($s1)
/* 2C1DC 8003B9DC 21280002 */  addu       $a1, $s0, $zero
/* 2C1E0 8003B9E0 0E0002A6 */  sh         $v0, 0xE($s0)
/* 2C1E4 8003B9E4 04002296 */  lhu        $v0, 0x4($s1)
/* 2C1E8 8003B9E8 15000624 */  addiu      $a2, $zero, 0x15
/* 2C1EC 8003B9EC 1758020C */  jal        G2EulerAngles_FromMatrix
/* 2C1F0 8003B9F0 100002A6 */   sh        $v0, 0x10($s0)
/* 2C1F4 8003B9F4 1000A427 */  addiu      $a0, $sp, 0x10
/* 2C1F8 8003B9F8 3DE3010C */  jal        func_80078CF4
/* 2C1FC 8003B9FC 21280002 */   addu      $a1, $s0, $zero
.L8003BA00:
/* 2C200 8003BA00 3000BF8F */  lw         $ra, 0x30($sp)
/* 2C204 8003BA04 2C00B18F */  lw         $s1, 0x2C($sp)
/* 2C208 8003BA08 2800B08F */  lw         $s0, 0x28($sp)
/* 2C20C 8003BA0C 0800E003 */  jr         $ra
/* 2C210 8003BA10 3800BD27 */   addiu     $sp, $sp, 0x38
.size PIPE3D_TransformFromZAxis, . - PIPE3D_TransformFromZAxis
