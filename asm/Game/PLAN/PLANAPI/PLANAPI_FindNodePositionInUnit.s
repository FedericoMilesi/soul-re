.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PLANAPI_FindNodePositionInUnit
/* 890B8 800988B8 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 890BC 800988BC 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 890C0 800988C0 2198A000 */  addu       $s3, $a1, $zero
/* 890C4 800988C4 1800B2AF */  sw         $s2, 0x18($sp)
/* 890C8 800988C8 2190C000 */  addu       $s2, $a2, $zero
/* 890CC 800988CC 2000BFAF */  sw         $ra, 0x20($sp)
/* 890D0 800988D0 1400B1AF */  sw         $s1, 0x14($sp)
/* 890D4 800988D4 19008010 */  beqz       $a0, .L8009893C
/* 890D8 800988D8 1000B0AF */   sw        $s0, 0x10($sp)
/* 890DC 800988DC 0800828C */  lw         $v0, 0x8($a0)
/* 890E0 800988E0 00000000 */  nop
/* 890E4 800988E4 E400518C */  lw         $s1, 0xE4($v0)
/* 890E8 800988E8 E000508C */  lw         $s0, 0xE0($v0)
/* 890EC 800988EC 1462020C */  jal        PLANAPI_GetFlags
/* 890F0 800988F0 2120E000 */   addu      $a0, $a3, $zero
/* 890F4 800988F4 11000012 */  beqz       $s0, .L8009893C
/* 890F8 800988F8 25904202 */   or        $s2, $s2, $v0
/* 890FC 800988FC 04002526 */  addiu      $a1, $s1, 0x4
.L80098900:
/* 89100 80098900 0200A284 */  lh         $v0, 0x2($a1)
/* 89104 80098904 00000000 */  nop
/* 89108 80098908 09005214 */  bne        $v0, $s2, .L80098930
/* 8910C 8009890C FFFF1026 */   addiu     $s0, $s0, -0x1
/* 89110 80098910 00002396 */  lhu        $v1, 0x0($s1)
/* 89114 80098914 FEFFA494 */  lhu        $a0, -0x2($a1)
/* 89118 80098918 0000A594 */  lhu        $a1, 0x0($a1)
/* 8911C 8009891C 01000224 */  addiu      $v0, $zero, 0x1
/* 89120 80098920 000063A6 */  sh         $v1, 0x0($s3)
/* 89124 80098924 020064A6 */  sh         $a0, 0x2($s3)
/* 89128 80098928 50620208 */  j          .L80098940
/* 8912C 8009892C 040065A6 */   sh        $a1, 0x4($s3)
.L80098930:
/* 89130 80098930 0800A524 */  addiu      $a1, $a1, 0x8
/* 89134 80098934 F2FF0016 */  bnez       $s0, .L80098900
/* 89138 80098938 08003126 */   addiu     $s1, $s1, 0x8
.L8009893C:
/* 8913C 8009893C 21100000 */  addu       $v0, $zero, $zero
.L80098940:
/* 89140 80098940 2000BF8F */  lw         $ra, 0x20($sp)
/* 89144 80098944 1C00B38F */  lw         $s3, 0x1C($sp)
/* 89148 80098948 1800B28F */  lw         $s2, 0x18($sp)
/* 8914C 8009894C 1400B18F */  lw         $s1, 0x14($sp)
/* 89150 80098950 1000B08F */  lw         $s0, 0x10($sp)
/* 89154 80098954 0800E003 */  jr         $ra
/* 89158 80098958 2800BD27 */   addiu     $sp, $sp, 0x28
.size PLANAPI_FindNodePositionInUnit, . - PLANAPI_FindNodePositionInUnit
