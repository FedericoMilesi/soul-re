.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel CAMERA_GetDistSq
/* B100 8001A900 00008284 */  lh         $v0, 0x0($a0)
/* B104 8001A904 0000A384 */  lh         $v1, 0x0($a1)
/* B108 8001A908 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* B10C 8001A90C 23104300 */  subu       $v0, $v0, $v1
/* B110 8001A910 0000A2AF */  sw         $v0, 0x0($sp)
/* B114 8001A914 02008284 */  lh         $v0, 0x2($a0)
/* B118 8001A918 0200A384 */  lh         $v1, 0x2($a1)
/* B11C 8001A91C 00000000 */  nop
/* B120 8001A920 23104300 */  subu       $v0, $v0, $v1
/* B124 8001A924 0400A2AF */  sw         $v0, 0x4($sp)
/* B128 8001A928 04008284 */  lh         $v0, 0x4($a0)
/* B12C 8001A92C 0400A384 */  lh         $v1, 0x4($a1)
/* B130 8001A930 00000000 */  nop
/* B134 8001A934 23104300 */  subu       $v0, $v0, $v1
/* B138 8001A938 0800A2AF */  sw         $v0, 0x8($sp)
/* B13C 8001A93C 0000A9CB */  lwc2       $9, 0x0($sp)
/* B140 8001A940 0400AACB */  lwc2       $10, 0x4($sp)
/* B144 8001A944 0800ABCB */  lwc2       $11, 0x8($sp)
/* B148 8001A948 00000000 */  nop
/* B14C 8001A94C 00000000 */  nop
/* B150 8001A950 2804A04A */  SQR        0
/* B154 8001A954 0000B9EB */  swc2       $25, 0x0($sp)
/* B158 8001A958 0400BAEB */  swc2       $26, 0x4($sp) # handwritten instruction
/* B15C 8001A95C 0800BBEB */  swc2       $27, 0x8($sp) # handwritten instruction
/* B160 8001A960 0000A28F */  lw         $v0, 0x0($sp)
/* B164 8001A964 0400A38F */  lw         $v1, 0x4($sp)
/* B168 8001A968 0800A48F */  lw         $a0, 0x8($sp)
/* B16C 8001A96C 21104300 */  addu       $v0, $v0, $v1
/* B170 8001A970 21104400 */  addu       $v0, $v0, $a0
/* B174 8001A974 0800E003 */  jr         $ra
/* B178 8001A978 1000BD27 */   addiu     $sp, $sp, 0x10
.size CAMERA_GetDistSq, . - CAMERA_GetDistSq
