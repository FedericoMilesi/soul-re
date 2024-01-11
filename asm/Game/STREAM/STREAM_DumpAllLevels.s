.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_DumpAllLevels
/* 4B8E8 8005B0E8 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 4B8EC 8005B0EC 1800B2AF */  sw         $s2, 0x18($sp)
/* 4B8F0 8005B0F0 21908000 */  addu       $s2, $a0, $zero
/* 4B8F4 8005B0F4 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 4B8F8 8005B0F8 2198A000 */  addu       $s3, $a1, $zero
/* 4B8FC 8005B0FC 1400B1AF */  sw         $s1, 0x14($sp)
/* 4B900 8005B100 21880000 */  addu       $s1, $zero, $zero
/* 4B904 8005B104 1000B0AF */  sw         $s0, 0x10($sp)
/* 4B908 8005B108 3CC79027 */  addiu      $s0, $gp, %gp_rel(StreamTracker)
/* 4B90C 8005B10C 2000BFAF */  sw         $ra, 0x20($sp)
.L8005B110:
/* 4B910 8005B110 04000286 */  lh         $v0, 0x4($s0)
/* 4B914 8005B114 00000000 */  nop
/* 4B918 8005B118 07004010 */  beqz       $v0, .L8005B138
/* 4B91C 8005B11C 00000000 */   nop
/* 4B920 8005B120 0000028E */  lw         $v0, 0x0($s0)
/* 4B924 8005B124 00000000 */  nop
/* 4B928 8005B128 03005210 */  beq        $v0, $s2, .L8005B138
/* 4B92C 8005B12C 21200002 */   addu      $a0, $s0, $zero
/* 4B930 8005B130 A76B010C */  jal        STREAM_DumpUnit
/* 4B934 8005B134 21286002 */   addu      $a1, $s3, $zero
.L8005B138:
/* 4B938 8005B138 01003126 */  addiu      $s1, $s1, 0x1
/* 4B93C 8005B13C 1000222A */  slti       $v0, $s1, 0x10
/* 4B940 8005B140 F3FF4014 */  bnez       $v0, .L8005B110
/* 4B944 8005B144 40001026 */   addiu     $s0, $s0, 0x40
/* 4B948 8005B148 2000BF8F */  lw         $ra, 0x20($sp)
/* 4B94C 8005B14C 1C00B38F */  lw         $s3, 0x1C($sp)
/* 4B950 8005B150 1800B28F */  lw         $s2, 0x18($sp)
/* 4B954 8005B154 1400B18F */  lw         $s1, 0x14($sp)
/* 4B958 8005B158 1000B08F */  lw         $s0, 0x10($sp)
/* 4B95C 8005B15C 0800E003 */  jr         $ra
/* 4B960 8005B160 2800BD27 */   addiu     $sp, $sp, 0x28
.size STREAM_DumpAllLevels, . - STREAM_DumpAllLevels
