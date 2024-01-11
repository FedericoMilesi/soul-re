.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_WhichUnitPointerIsIn
/* 4ADD0 8005A5D0 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 4ADD4 8005A5D4 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 4ADD8 8005A5D8 21988000 */  addu       $s3, $a0, $zero
/* 4ADDC 8005A5DC 1800B2AF */  sw         $s2, 0x18($sp)
/* 4ADE0 8005A5E0 21900000 */  addu       $s2, $zero, $zero
/* 4ADE4 8005A5E4 2000B4AF */  sw         $s4, 0x20($sp)
/* 4ADE8 8005A5E8 02001424 */  addiu      $s4, $zero, 0x2
/* 4ADEC 8005A5EC 1400B1AF */  sw         $s1, 0x14($sp)
/* 4ADF0 8005A5F0 3CC79127 */  addiu      $s1, $gp, %gp_rel(StreamTracker)
/* 4ADF4 8005A5F4 2400BFAF */  sw         $ra, 0x24($sp)
/* 4ADF8 8005A5F8 1000B0AF */  sw         $s0, 0x10($sp)
.L8005A5FC:
/* 4ADFC 8005A5FC 04002286 */  lh         $v0, 0x4($s1)
/* 4AE00 8005A600 00000000 */  nop
/* 4AE04 8005A604 10005414 */  bne        $v0, $s4, .L8005A648
/* 4AE08 8005A608 00000000 */   nop
/* 4AE0C 8005A60C 0800308E */  lw         $s0, 0x8($s1)
/* 4AE10 8005A610 00000000 */  nop
/* 4AE14 8005A614 0C000012 */  beqz       $s0, .L8005A648
/* 4AE18 8005A618 00000000 */   nop
/* 4AE1C 8005A61C 7841010C */  jal        MEMPACK_Size
/* 4AE20 8005A620 21200002 */   addu      $a0, $s0, $zero
/* 4AE24 8005A624 21184000 */  addu       $v1, $v0, $zero
/* 4AE28 8005A628 2B107002 */  sltu       $v0, $s3, $s0
/* 4AE2C 8005A62C 06004014 */  bnez       $v0, .L8005A648
/* 4AE30 8005A630 21100302 */   addu      $v0, $s0, $v1
/* 4AE34 8005A634 2B105300 */  sltu       $v0, $v0, $s3
/* 4AE38 8005A638 04004014 */  bnez       $v0, .L8005A64C
/* 4AE3C 8005A63C 01005226 */   addiu     $s2, $s2, 0x1
/* 4AE40 8005A640 97690108 */  j          .L8005A65C
/* 4AE44 8005A644 21102002 */   addu      $v0, $s1, $zero
.L8005A648:
/* 4AE48 8005A648 01005226 */  addiu      $s2, $s2, 0x1
.L8005A64C:
/* 4AE4C 8005A64C 1000422A */  slti       $v0, $s2, 0x10
/* 4AE50 8005A650 EAFF4014 */  bnez       $v0, .L8005A5FC
/* 4AE54 8005A654 40003126 */   addiu     $s1, $s1, 0x40
/* 4AE58 8005A658 21100000 */  addu       $v0, $zero, $zero
.L8005A65C:
/* 4AE5C 8005A65C 2400BF8F */  lw         $ra, 0x24($sp)
/* 4AE60 8005A660 2000B48F */  lw         $s4, 0x20($sp)
/* 4AE64 8005A664 1C00B38F */  lw         $s3, 0x1C($sp)
/* 4AE68 8005A668 1800B28F */  lw         $s2, 0x18($sp)
/* 4AE6C 8005A66C 1400B18F */  lw         $s1, 0x14($sp)
/* 4AE70 8005A670 1000B08F */  lw         $s0, 0x10($sp)
/* 4AE74 8005A674 0800E003 */  jr         $ra
/* 4AE78 8005A678 2800BD27 */   addiu     $sp, $sp, 0x28
.size STREAM_WhichUnitPointerIsIn, . - STREAM_WhichUnitPointerIsIn
