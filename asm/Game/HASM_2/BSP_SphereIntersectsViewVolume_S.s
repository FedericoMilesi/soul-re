.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel BSP_SphereIntersectsViewVolume_S
/* 69288 80078A88 0800AC8C */  lw         $t4, 0x8($a1)
/* 6928C 80078A8C 0C00AD8C */  lw         $t5, 0xC($a1)
/* 69290 80078A90 0000CC48 */  ctc2       $t4, $0 # handwritten instruction
/* 69294 80078A94 0008CD48 */  ctc2       $t5, $1 # handwritten instruction
/* 69298 80078A98 1000AC8C */  lw         $t4, 0x10($a1)
/* 6929C 80078A9C 1400AD8C */  lw         $t5, 0x14($a1)
/* 692A0 80078AA0 1800AE8C */  lw         $t6, 0x18($a1)
/* 692A4 80078AA4 0010CC48 */  ctc2       $t4, $2 # handwritten instruction
/* 692A8 80078AA8 0018CD48 */  ctc2       $t5, $3 # handwritten instruction
/* 692AC 80078AAC 0020CE48 */  ctc2       $t6, $4 # handwritten instruction
/* 692B0 80078AB0 000080C8 */  lwc2       $0, 0x0($a0)
/* 692B4 80078AB4 040081C8 */  lwc2       $1, 0x4($a0)
/* 692B8 80078AB8 06008694 */  lhu        $a2, 0x6($a0)
/* 692BC 80078ABC 4800A28C */  lw         $v0, 0x48($a1)
/* 692C0 80078AC0 1260484A */  MVMVA      1, 0, 0, 3, 0
/* 692C4 80078AC4 6400AF8C */  lw         $t7, 0x64($a1)
/* 692C8 80078AC8 23380600 */  negu       $a3, $a2
/* 692CC 80078ACC 00C80848 */  mfc2       $t0, $25 # handwritten instruction
/* 692D0 80078AD0 00D00948 */  mfc2       $t1, $26 # handwritten instruction
/* 692D4 80078AD4 00D80A48 */  mfc2       $t2, $27 # handwritten instruction
/* 692D8 80078AD8 23400201 */  subu       $t0, $t0, $v0
/* 692DC 80078ADC 2A10E800 */  slt        $v0, $a3, $t0
/* 692E0 80078AE0 1D004010 */  beqz       $v0, .L80078B58
/* 692E4 80078AE4 2118E601 */   addu      $v1, $t7, $a2
/* 692E8 80078AE8 4C00B88C */  lw         $t8, 0x4C($a1)
/* 692EC 80078AEC 2A100301 */  slt        $v0, $t0, $v1
/* 692F0 80078AF0 19004010 */  beqz       $v0, .L80078B58
/* 692F4 80078AF4 23183801 */   subu      $v1, $t1, $t8
/* 692F8 80078AF8 5000B98C */  lw         $t9, 0x50($a1)
/* 692FC 80078AFC 2A10E300 */  slt        $v0, $a3, $v1
/* 69300 80078B00 15004010 */  beqz       $v0, .L80078B58
/* 69304 80078B04 23185901 */   subu      $v1, $t2, $t9
/* 69308 80078B08 2A10E300 */  slt        $v0, $a3, $v1
/* 6930C 80078B0C 12004010 */  beqz       $v0, .L80078B58
/* 69310 80078B10 00000000 */   nop
/* 69314 80078B14 2800AC8C */  lw         $t4, 0x28($a1)
/* 69318 80078B18 2C00AD8C */  lw         $t5, 0x2C($a1)
/* 6931C 80078B1C 3000AE8C */  lw         $t6, 0x30($a1)
/* 69320 80078B20 0000CC48 */  ctc2       $t4, $0 # handwritten instruction
/* 69324 80078B24 0008CD48 */  ctc2       $t5, $1 # handwritten instruction
/* 69328 80078B28 0010CE48 */  ctc2       $t6, $2 # handwritten instruction
/* 6932C 80078B2C 5400A38C */  lw         $v1, 0x54($a1)
/* 69330 80078B30 00000000 */  nop
/* 69334 80078B34 1260484A */  MVMVA      1, 0, 0, 3, 0
/* 69338 80078B38 5800A48C */  lw         $a0, 0x58($a1)
/* 6933C 80078B3C 00C80848 */  mfc2       $t0, $25 # handwritten instruction
/* 69340 80078B40 00D00948 */  mfc2       $t1, $26 # handwritten instruction
/* 69344 80078B44 23100301 */  subu       $v0, $t0, $v1
/* 69348 80078B48 2A10E200 */  slt        $v0, $a3, $v0
/* 6934C 80078B4C 02004010 */  beqz       $v0, .L80078B58
/* 69350 80078B50 23182401 */   subu      $v1, $t1, $a0
/* 69354 80078B54 2A10E300 */  slt        $v0, $a3, $v1
.L80078B58:
/* 69358 80078B58 0800E003 */  jr         $ra
/* 6935C 80078B5C 00000000 */   nop
.size BSP_SphereIntersectsViewVolume_S, . - BSP_SphereIntersectsViewVolume_S
