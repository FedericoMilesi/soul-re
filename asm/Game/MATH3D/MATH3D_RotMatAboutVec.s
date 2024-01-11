.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MATH3D_RotMatAboutVec
/* 2A860 8003A060 90FFBD27 */  addiu      $sp, $sp, -0x70
/* 2A864 8003A064 5C00B1AF */  sw         $s1, 0x5C($sp)
/* 2A868 8003A068 21888000 */  addu       $s1, $a0, $zero
/* 2A86C 8003A06C 6000B2AF */  sw         $s2, 0x60($sp)
/* 2A870 8003A070 2190A000 */  addu       $s2, $a1, $zero
/* 2A874 8003A074 00340600 */  sll        $a2, $a2, 16
/* 2A878 8003A078 6400B3AF */  sw         $s3, 0x64($sp)
/* 2A87C 8003A07C 039C0600 */  sra        $s3, $a2, 16
/* 2A880 8003A080 6800BFAF */  sw         $ra, 0x68($sp)
/* 2A884 8003A084 23006012 */  beqz       $s3, .L8003A114
/* 2A888 8003A088 5800B0AF */   sw        $s0, 0x58($sp)
/* 2A88C 8003A08C 02002586 */  lh         $a1, 0x2($s1)
/* 2A890 8003A090 04002686 */  lh         $a2, 0x4($s1)
/* 2A894 8003A094 E7E9000C */  jal        MATH3D_SquareLength
/* 2A898 8003A098 21200000 */   addu      $a0, $zero, $zero
/* 2A89C 8003A09C A6E7000C */  jal        MATH3D_FastSqrt0
/* 2A8A0 8003A0A0 00084424 */   addiu     $a0, $v0, 0x800
/* 2A8A4 8003A0A4 02002486 */  lh         $a0, 0x2($s1)
/* 2A8A8 8003A0A8 04002586 */  lh         $a1, 0x4($s1)
/* 2A8AC 8003A0AC 26F3020C */  jal        ratan2
/* 2A8B0 8003A0B0 21804000 */   addu      $s0, $v0, $zero
/* 2A8B4 8003A0B4 23100200 */  negu       $v0, $v0
/* 2A8B8 8003A0B8 1000A2A7 */  sh         $v0, 0x10($sp)
/* 2A8BC 8003A0BC 00002486 */  lh         $a0, 0x0($s1)
/* 2A8C0 8003A0C0 26F3020C */  jal        ratan2
/* 2A8C4 8003A0C4 21280002 */   addu      $a1, $s0, $zero
/* 2A8C8 8003A0C8 1000A427 */  addiu      $a0, $sp, 0x10
/* 2A8CC 8003A0CC 1800B127 */  addiu      $s1, $sp, 0x18
/* 2A8D0 8003A0D0 21282002 */  addu       $a1, $s1, $zero
/* 2A8D4 8003A0D4 1200A2A7 */  sh         $v0, 0x12($sp)
/* 2A8D8 8003A0D8 3DE3010C */  jal        RotMatrix
/* 2A8DC 8003A0DC 1400A0A7 */   sh        $zero, 0x14($sp)
/* 2A8E0 8003A0E0 21202002 */  addu       $a0, $s1, $zero
/* 2A8E4 8003A0E4 3800B027 */  addiu      $s0, $sp, 0x38
/* 2A8E8 8003A0E8 88F4020C */  jal        TransposeMatrix
/* 2A8EC 8003A0EC 21280002 */   addu      $a1, $s0, $zero
/* 2A8F0 8003A0F0 21200002 */  addu       $a0, $s0, $zero
/* 2A8F4 8003A0F4 15FD020C */  jal        MulMatrix2
/* 2A8F8 8003A0F8 21284002 */   addu      $a1, $s2, $zero
/* 2A8FC 8003A0FC 21206002 */  addu       $a0, $s3, $zero
/* 2A900 8003A100 32E4010C */  jal        RotMatrixZ
/* 2A904 8003A104 21284002 */   addu      $a1, $s2, $zero
/* 2A908 8003A108 21202002 */  addu       $a0, $s1, $zero
/* 2A90C 8003A10C 15FD020C */  jal        MulMatrix2
/* 2A910 8003A110 21284002 */   addu      $a1, $s2, $zero
.L8003A114:
/* 2A914 8003A114 6800BF8F */  lw         $ra, 0x68($sp)
/* 2A918 8003A118 6400B38F */  lw         $s3, 0x64($sp)
/* 2A91C 8003A11C 6000B28F */  lw         $s2, 0x60($sp)
/* 2A920 8003A120 5C00B18F */  lw         $s1, 0x5C($sp)
/* 2A924 8003A124 5800B08F */  lw         $s0, 0x58($sp)
/* 2A928 8003A128 0800E003 */  jr         $ra
/* 2A92C 8003A12C 7000BD27 */   addiu     $sp, $sp, 0x70
.size MATH3D_RotMatAboutVec, . - MATH3D_RotMatAboutVec
