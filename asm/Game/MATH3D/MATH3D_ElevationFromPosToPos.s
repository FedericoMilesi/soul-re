.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MATH3D_ElevationFromPosToPos
/* 2AAB0 8003A2B0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 2AAB4 8003A2B4 1400B1AF */  sw         $s1, 0x14($sp)
/* 2AAB8 8003A2B8 21888000 */  addu       $s1, $a0, $zero
/* 2AABC 8003A2BC 1000B0AF */  sw         $s0, 0x10($sp)
/* 2AAC0 8003A2C0 2180A000 */  addu       $s0, $a1, $zero
/* 2AAC4 8003A2C4 1800BFAF */  sw         $ra, 0x18($sp)
/* 2AAC8 8003A2C8 00002286 */  lh         $v0, 0x0($s1)
/* 2AACC 8003A2CC 00000386 */  lh         $v1, 0x0($s0)
/* 2AAD0 8003A2D0 00000000 */  nop
/* 2AAD4 8003A2D4 23104300 */  subu       $v0, $v0, $v1
/* 2AAD8 8003A2D8 18004200 */  mult       $v0, $v0
/* 2AADC 8003A2DC 02002286 */  lh         $v0, 0x2($s1)
/* 2AAE0 8003A2E0 02000386 */  lh         $v1, 0x2($s0)
/* 2AAE4 8003A2E4 12200000 */  mflo       $a0
/* 2AAE8 8003A2E8 23104300 */  subu       $v0, $v0, $v1
/* 2AAEC 8003A2EC 00000000 */  nop
/* 2AAF0 8003A2F0 18004200 */  mult       $v0, $v0
/* 2AAF4 8003A2F4 12180000 */  mflo       $v1
/* 2AAF8 8003A2F8 A6E7000C */  jal        MATH3D_FastSqrt0
/* 2AAFC 8003A2FC 21208300 */   addu      $a0, $a0, $v1
/* 2AB00 8003A300 00140200 */  sll        $v0, $v0, 16
/* 2AB04 8003A304 04000386 */  lh         $v1, 0x4($s0)
/* 2AB08 8003A308 04002486 */  lh         $a0, 0x4($s1)
/* 2AB0C 8003A30C 032C0200 */  sra        $a1, $v0, 16
/* 2AB10 8003A310 26F3020C */  jal        func_800BCC98
/* 2AB14 8003A314 23206400 */   subu      $a0, $v1, $a0
/* 2AB18 8003A318 23100200 */  negu       $v0, $v0
/* 2AB1C 8003A31C 1800BF8F */  lw         $ra, 0x18($sp)
/* 2AB20 8003A320 1400B18F */  lw         $s1, 0x14($sp)
/* 2AB24 8003A324 1000B08F */  lw         $s0, 0x10($sp)
/* 2AB28 8003A328 FF0F4230 */  andi       $v0, $v0, 0xFFF
/* 2AB2C 8003A32C 0800E003 */  jr         $ra
/* 2AB30 8003A330 2000BD27 */   addiu     $sp, $sp, 0x20
.size MATH3D_ElevationFromPosToPos, . - MATH3D_ElevationFromPosToPos
