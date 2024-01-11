.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel CAMERA_CalcPosition
/* 71BC 800169BC 90FFBD27 */  addiu      $sp, $sp, -0x70
/* 71C0 800169C0 6400B3AF */  sw         $s3, 0x64($sp)
/* 71C4 800169C4 21988000 */  addu       $s3, $a0, $zero
/* 71C8 800169C8 6000B2AF */  sw         $s2, 0x60($sp)
/* 71CC 800169CC 2190A000 */  addu       $s2, $a1, $zero
/* 71D0 800169D0 5C00B1AF */  sw         $s1, 0x5C($sp)
/* 71D4 800169D4 2188C000 */  addu       $s1, $a2, $zero
/* 71D8 800169D8 5800B0AF */  sw         $s0, 0x58($sp)
/* 71DC 800169DC 2800B027 */  addiu      $s0, $sp, 0x28
/* 71E0 800169E0 21200002 */  addu       $a0, $s0, $zero
/* 71E4 800169E4 23380700 */  negu       $a3, $a3
/* 71E8 800169E8 6800BFAF */  sw         $ra, 0x68($sp)
/* 71EC 800169EC 1000A0A7 */  sh         $zero, 0x10($sp)
/* 71F0 800169F0 1200A7A7 */  sh         $a3, 0x12($sp)
/* 71F4 800169F4 4CE8000C */  jal        MATH3D_SetUnityMatrix
/* 71F8 800169F8 1400A0A7 */   sh        $zero, 0x14($sp)
/* 71FC 800169FC 00002486 */  lh         $a0, 0x0($s1)
/* 7200 80016A00 98E3010C */  jal        RotMatrixX
/* 7204 80016A04 21280002 */   addu      $a1, $s0, $zero
/* 7208 80016A08 02002486 */  lh         $a0, 0x2($s1)
/* 720C 80016A0C E5E3010C */  jal        RotMatrixY
/* 7210 80016A10 21280002 */   addu      $a1, $s0, $zero
/* 7214 80016A14 04002486 */  lh         $a0, 0x4($s1)
/* 7218 80016A18 32E4010C */  jal        RotMatrixZ
/* 721C 80016A1C 21280002 */   addu      $a1, $s0, $zero
/* 7220 80016A20 00000C8E */  lw         $t4, 0x0($s0)
/* 7224 80016A24 04000D8E */  lw         $t5, 0x4($s0)
/* 7228 80016A28 0000CC48 */  ctc2       $t4, $0 # handwritten instruction
/* 722C 80016A2C 0008CD48 */  ctc2       $t5, $1 # handwritten instruction
/* 7230 80016A30 08000C8E */  lw         $t4, 0x8($s0)
/* 7234 80016A34 0C000D8E */  lw         $t5, 0xC($s0)
/* 7238 80016A38 10000E8E */  lw         $t6, 0x10($s0)
/* 723C 80016A3C 0010CC48 */  ctc2       $t4, $2 # handwritten instruction
/* 7240 80016A40 0018CD48 */  ctc2       $t5, $3 # handwritten instruction
/* 7244 80016A44 0020CE48 */  ctc2       $t6, $4 # handwritten instruction
/* 7248 80016A48 1000A227 */  addiu      $v0, $sp, 0x10
/* 724C 80016A4C 000040C8 */  lwc2       $0, 0x0($v0)
/* 7250 80016A50 040041C8 */  lwc2       $1, 0x4($v0)
/* 7254 80016A54 00000000 */  nop
/* 7258 80016A58 00000000 */  nop
/* 725C 80016A5C 1260484A */  MVMVA      1, 0, 0, 3, 0
/* 7260 80016A60 1800A227 */  addiu      $v0, $sp, 0x18
/* 7264 80016A64 000059E8 */  swc2       $25, 0x0($v0)
/* 7268 80016A68 04005AE8 */  swc2       $26, 0x4($v0) # handwritten instruction
/* 726C 80016A6C 08005BE8 */  swc2       $27, 0x8($v0) # handwritten instruction
/* 7270 80016A70 00004386 */  lh         $v1, 0x0($s2)
/* 7274 80016A74 1800A28F */  lw         $v0, 0x18($sp)
/* 7278 80016A78 00000000 */  nop
/* 727C 80016A7C 21104300 */  addu       $v0, $v0, $v1
/* 7280 80016A80 4800A2AF */  sw         $v0, 0x48($sp)
/* 7284 80016A84 02004386 */  lh         $v1, 0x2($s2)
/* 7288 80016A88 1C00A28F */  lw         $v0, 0x1C($sp)
/* 728C 80016A8C 00000000 */  nop
/* 7290 80016A90 21104300 */  addu       $v0, $v0, $v1
/* 7294 80016A94 4C00A2AF */  sw         $v0, 0x4C($sp)
/* 7298 80016A98 04004386 */  lh         $v1, 0x4($s2)
/* 729C 80016A9C 2000A28F */  lw         $v0, 0x20($sp)
/* 72A0 80016AA0 00000000 */  nop
/* 72A4 80016AA4 21104300 */  addu       $v0, $v0, $v1
/* 72A8 80016AA8 5000A2AF */  sw         $v0, 0x50($sp)
/* 72AC 80016AAC 4800A227 */  addiu      $v0, $sp, 0x48
/* 72B0 80016AB0 4800A397 */  lhu        $v1, 0x48($sp)
/* 72B4 80016AB4 04004494 */  lhu        $a0, 0x4($v0)
/* 72B8 80016AB8 08004294 */  lhu        $v0, 0x8($v0)
/* 72BC 80016ABC 000063A6 */  sh         $v1, 0x0($s3)
/* 72C0 80016AC0 020064A6 */  sh         $a0, 0x2($s3)
/* 72C4 80016AC4 040062A6 */  sh         $v0, 0x4($s3)
/* 72C8 80016AC8 6800BF8F */  lw         $ra, 0x68($sp)
/* 72CC 80016ACC 6400B38F */  lw         $s3, 0x64($sp)
/* 72D0 80016AD0 6000B28F */  lw         $s2, 0x60($sp)
/* 72D4 80016AD4 5C00B18F */  lw         $s1, 0x5C($sp)
/* 72D8 80016AD8 5800B08F */  lw         $s0, 0x58($sp)
/* 72DC 80016ADC 0800E003 */  jr         $ra
/* 72E0 80016AE0 7000BD27 */   addiu     $sp, $sp, 0x70
.size CAMERA_CalcPosition, . - CAMERA_CalcPosition
