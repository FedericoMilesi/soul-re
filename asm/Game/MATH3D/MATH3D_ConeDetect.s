.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MATH3D_ConeDetect
/* 2AE40 8003A640 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 2AE44 8003A644 1800B2AF */  sw         $s2, 0x18($sp)
/* 2AE48 8003A648 21908000 */  addu       $s2, $a0, $zero
/* 2AE4C 8003A64C 1000B0AF */  sw         $s0, 0x10($sp)
/* 2AE50 8003A650 2180A000 */  addu       $s0, $a1, $zero
/* 2AE54 8003A654 2000B4AF */  sw         $s4, 0x20($sp)
/* 2AE58 8003A658 21A0C000 */  addu       $s4, $a2, $zero
/* 2AE5C 8003A65C 2400BFAF */  sw         $ra, 0x24($sp)
/* 2AE60 8003A660 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 2AE64 8003A664 1400B1AF */  sw         $s1, 0x14($sp)
/* 2AE68 8003A668 00005386 */  lh         $s3, 0x0($s2)
/* 2AE6C 8003A66C 02004286 */  lh         $v0, 0x2($s2)
/* 2AE70 8003A670 02006106 */  bgez       $s3, .L8003A67C
/* 2AE74 8003A674 21206002 */   addu      $a0, $s3, $zero
/* 2AE78 8003A678 23200400 */  negu       $a0, $a0
.L8003A67C:
/* 2AE7C 8003A67C 23880200 */  negu       $s1, $v0
/* 2AE80 8003A680 27E7000C */  jal        MATH3D_FastAtan2
/* 2AE84 8003A684 21282002 */   addu      $a1, $s1, $zero
/* 2AE88 8003A688 00140200 */  sll        $v0, $v0, 16
/* 2AE8C 8003A68C 03140200 */  sra        $v0, $v0, 16
/* 2AE90 8003A690 2A105000 */  slt        $v0, $v0, $s0
/* 2AE94 8003A694 0F004010 */  beqz       $v0, .L8003A6D4
/* 2AE98 8003A698 21206002 */   addu      $a0, $s3, $zero
/* 2AE9C 8003A69C EBE6000C */  jal        MATH3D_LengthXY
/* 2AEA0 8003A6A0 21282002 */   addu      $a1, $s1, $zero
/* 2AEA4 8003A6A4 04004486 */  lh         $a0, 0x4($s2)
/* 2AEA8 8003A6A8 00000000 */  nop
/* 2AEAC 8003A6AC 02008104 */  bgez       $a0, .L8003A6B8
/* 2AEB0 8003A6B0 00000000 */   nop
/* 2AEB4 8003A6B4 23200400 */  negu       $a0, $a0
.L8003A6B8:
/* 2AEB8 8003A6B8 27E7000C */  jal        MATH3D_FastAtan2
/* 2AEBC 8003A6BC 21284000 */   addu      $a1, $v0, $zero
/* 2AEC0 8003A6C0 001C0200 */  sll        $v1, $v0, 16
/* 2AEC4 8003A6C4 031C0300 */  sra        $v1, $v1, 16
/* 2AEC8 8003A6C8 2A187400 */  slt        $v1, $v1, $s4
/* 2AECC 8003A6CC 02006014 */  bnez       $v1, .L8003A6D8
/* 2AED0 8003A6D0 01000224 */   addiu     $v0, $zero, 0x1
.L8003A6D4:
/* 2AED4 8003A6D4 21100000 */  addu       $v0, $zero, $zero
.L8003A6D8:
/* 2AED8 8003A6D8 2400BF8F */  lw         $ra, 0x24($sp)
/* 2AEDC 8003A6DC 2000B48F */  lw         $s4, 0x20($sp)
/* 2AEE0 8003A6E0 1C00B38F */  lw         $s3, 0x1C($sp)
/* 2AEE4 8003A6E4 1800B28F */  lw         $s2, 0x18($sp)
/* 2AEE8 8003A6E8 1400B18F */  lw         $s1, 0x14($sp)
/* 2AEEC 8003A6EC 1000B08F */  lw         $s0, 0x10($sp)
/* 2AEF0 8003A6F0 0800E003 */  jr         $ra
/* 2AEF4 8003A6F4 2800BD27 */   addiu     $sp, $sp, 0x28
.size MATH3D_ConeDetect, . - MATH3D_ConeDetect
