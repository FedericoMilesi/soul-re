.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel InitGeom
/* AFACC 800BF2CC 0D80013C */  lui        $at, %hi(CD_read_dma_mode + 0x1C)
/* AFAD0 800BF2D0 5CE43FAC */  sw         $ra, %lo(CD_read_dma_mode + 0x1C)($at)
/* AFAD4 800BF2D4 A41A030C */  jal        _patch_gte
/* AFAD8 800BF2D8 00000000 */   nop
/* AFADC 800BF2DC 0D801F3C */  lui        $ra, %hi(CD_read_dma_mode + 0x1C)
/* AFAE0 800BF2E0 5CE4FF8F */  lw         $ra, %lo(CD_read_dma_mode + 0x1C)($ra)
/* AFAE4 800BF2E4 00000000 */  nop
/* AFAE8 800BF2E8 00600240 */  mfc0       $v0, $12 # handwritten instruction
/* AFAEC 800BF2EC 0040033C */  lui        $v1, (0x40000000 >> 16)
/* AFAF0 800BF2F0 25104300 */  or         $v0, $v0, $v1
/* AFAF4 800BF2F4 00608240 */  mtc0       $v0, $12 # handwritten instruction
/* AFAF8 800BF2F8 00000000 */  nop
/* AFAFC 800BF2FC 55010824 */  addiu      $t0, $zero, 0x155
/* AFB00 800BF300 00E8C848 */  ctc2       $t0, $29 # handwritten instruction
/* AFB04 800BF304 00000000 */  nop
/* AFB08 800BF308 00010824 */  addiu      $t0, $zero, 0x100
/* AFB0C 800BF30C 00F0C848 */  ctc2       $t0, $30 # handwritten instruction
/* AFB10 800BF310 00000000 */  nop
/* AFB14 800BF314 E8030824 */  addiu      $t0, $zero, 0x3E8
/* AFB18 800BF318 00D0C848 */  ctc2       $t0, $26 # handwritten instruction
/* AFB1C 800BF31C 00000000 */  nop
/* AFB20 800BF320 9EEF0824 */  addiu      $t0, $zero, -0x1062
/* AFB24 800BF324 00D8C848 */  ctc2       $t0, $27 # handwritten instruction
/* AFB28 800BF328 00000000 */  nop
/* AFB2C 800BF32C 4001083C */  lui        $t0, (0x1400000 >> 16)
/* AFB30 800BF330 00E0C848 */  ctc2       $t0, $28 # handwritten instruction
/* AFB34 800BF334 00000000 */  nop
/* AFB38 800BF338 00C0C048 */  ctc2       $zero, $24 # handwritten instruction
/* AFB3C 800BF33C 00C8C048 */  ctc2       $zero, $25 # handwritten instruction
/* AFB40 800BF340 00000000 */  nop
/* AFB44 800BF344 0800E003 */  jr         $ra
/* AFB48 800BF348 00000000 */   nop
/* AFB4C 800BF34C 00000000 */  nop
/* AFB50 800BF350 00000000 */  nop
.size InitGeom, . - InitGeom
