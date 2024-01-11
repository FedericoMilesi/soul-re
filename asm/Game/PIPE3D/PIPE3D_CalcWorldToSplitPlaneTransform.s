.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel PIPE3D_CalcWorldToSplitPlaneTransform
/* 2C214 8003BA14 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 2C218 8003BA18 2C00B1AF */  sw         $s1, 0x2C($sp)
/* 2C21C 8003BA1C 21888000 */  addu       $s1, $a0, $zero
/* 2C220 8003BA20 2800B0AF */  sw         $s0, 0x28($sp)
/* 2C224 8003BA24 3000BFAF */  sw         $ra, 0x30($sp)
/* 2C228 8003BA28 09EE000C */  jal        PIPE3D_TransformFromZAxis
/* 2C22C 8003BA2C 2180C000 */   addu      $s0, $a2, $zero
/* 2C230 8003BA30 00000296 */  lhu        $v0, 0x0($s0)
/* 2C234 8003BA34 00000000 */  nop
/* 2C238 8003BA38 23100200 */  negu       $v0, $v0
/* 2C23C 8003BA3C 1000A2A7 */  sh         $v0, 0x10($sp)
/* 2C240 8003BA40 02000296 */  lhu        $v0, 0x2($s0)
/* 2C244 8003BA44 00000000 */  nop
/* 2C248 8003BA48 23100200 */  negu       $v0, $v0
/* 2C24C 8003BA4C 1200A2A7 */  sh         $v0, 0x12($sp)
/* 2C250 8003BA50 04000296 */  lhu        $v0, 0x4($s0)
/* 2C254 8003BA54 00000000 */  nop
/* 2C258 8003BA58 23100200 */  negu       $v0, $v0
/* 2C25C 8003BA5C 1400A2A7 */  sh         $v0, 0x14($sp)
/* 2C260 8003BA60 00002C8E */  lw         $t4, 0x0($s1)
/* 2C264 8003BA64 04002D8E */  lw         $t5, 0x4($s1)
/* 2C268 8003BA68 0000CC48 */  ctc2       $t4, $0 # handwritten instruction
/* 2C26C 8003BA6C 0008CD48 */  ctc2       $t5, $1 # handwritten instruction
/* 2C270 8003BA70 08002C8E */  lw         $t4, 0x8($s1)
/* 2C274 8003BA74 0C002D8E */  lw         $t5, 0xC($s1)
/* 2C278 8003BA78 10002E8E */  lw         $t6, 0x10($s1)
/* 2C27C 8003BA7C 0010CC48 */  ctc2       $t4, $2 # handwritten instruction
/* 2C280 8003BA80 0018CD48 */  ctc2       $t5, $3 # handwritten instruction
/* 2C284 8003BA84 0020CE48 */  ctc2       $t6, $4 # handwritten instruction
/* 2C288 8003BA88 1000A227 */  addiu      $v0, $sp, 0x10
/* 2C28C 8003BA8C 000040C8 */  lwc2       $0, 0x0($v0)
/* 2C290 8003BA90 040041C8 */  lwc2       $1, 0x4($v0)
/* 2C294 8003BA94 00000000 */  nop
/* 2C298 8003BA98 00000000 */  nop
/* 2C29C 8003BA9C 1260484A */  MVMVA      1, 0, 0, 3, 0
/* 2C2A0 8003BAA0 1800A227 */  addiu      $v0, $sp, 0x18
/* 2C2A4 8003BAA4 000059E8 */  swc2       $25, 0x0($v0)
/* 2C2A8 8003BAA8 04005AE8 */  swc2       $26, 0x4($v0) # handwritten instruction
/* 2C2AC 8003BAAC 08005BE8 */  swc2       $27, 0x8($v0) # handwritten instruction
/* 2C2B0 8003BAB0 1800A28F */  lw         $v0, 0x18($sp)
/* 2C2B4 8003BAB4 00000000 */  nop
/* 2C2B8 8003BAB8 140022AE */  sw         $v0, 0x14($s1)
/* 2C2BC 8003BABC 1C00A28F */  lw         $v0, 0x1C($sp)
/* 2C2C0 8003BAC0 00000000 */  nop
/* 2C2C4 8003BAC4 180022AE */  sw         $v0, 0x18($s1)
/* 2C2C8 8003BAC8 2000A28F */  lw         $v0, 0x20($sp)
/* 2C2CC 8003BACC 00000000 */  nop
/* 2C2D0 8003BAD0 1C0022AE */  sw         $v0, 0x1C($s1)
/* 2C2D4 8003BAD4 3000BF8F */  lw         $ra, 0x30($sp)
/* 2C2D8 8003BAD8 2C00B18F */  lw         $s1, 0x2C($sp)
/* 2C2DC 8003BADC 2800B08F */  lw         $s0, 0x28($sp)
/* 2C2E0 8003BAE0 0800E003 */  jr         $ra
/* 2C2E4 8003BAE4 3800BD27 */   addiu     $sp, $sp, 0x38
.size PIPE3D_CalcWorldToSplitPlaneTransform, . - PIPE3D_CalcWorldToSplitPlaneTransform
