.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PIPE3D_InstanceListTransformAndDraw
/* 2BF2C 8003B72C D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 2BF30 8003B730 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 2BF34 8003B734 21988000 */  addu       $s3, $a0, $zero
/* 2BF38 8003B738 2000B4AF */  sw         $s4, 0x20($sp)
/* 2BF3C 8003B73C 21A0C000 */  addu       $s4, $a2, $zero
/* 2BF40 8003B740 2400B5AF */  sw         $s5, 0x24($sp)
/* 2BF44 8003B744 2C00BFAF */  sw         $ra, 0x2C($sp)
/* 2BF48 8003B748 2800B6AF */  sw         $s6, 0x28($sp)
/* 2BF4C 8003B74C 1800B2AF */  sw         $s2, 0x18($sp)
/* 2BF50 8003B750 1400B1AF */  sw         $s1, 0x14($sp)
/* 2BF54 8003B754 1000B0AF */  sw         $s0, 0x10($sp)
/* 2BF58 8003B758 3400A38C */  lw         $v1, 0x34($a1)
/* 2BF5C 8003B75C 2C00B18C */  lw         $s1, 0x2C($a1)
/* 2BF60 8003B760 0000728E */  lw         $s2, 0x0($s3)
/* 2BF64 8003B764 3800228E */  lw         $v0, 0x38($s1)
/* 2BF68 8003B768 0400708C */  lw         $s0, 0x4($v1)
/* 2BF6C 8003B76C 09005214 */  bne        $v0, $s2, .L8003B794
/* 2BF70 8003B770 21A8E000 */   addu      $s5, $a3, $zero
/* 2BF74 8003B774 1400228E */  lw         $v0, 0x14($s1)
/* 2BF78 8003B778 00000000 */  nop
/* 2BF7C 8003B77C 00084230 */  andi       $v0, $v0, 0x800
/* 2BF80 8003B780 04004014 */  bnez       $v0, .L8003B794
/* 2BF84 8003B784 21288002 */   addu      $a1, $s4, $zero
/* 2BF88 8003B788 2130A002 */  addu       $a2, $s5, $zero
/* 2BF8C 8003B78C ECEC000C */  jal        PIPE3D_InstanceListTransformAndDrawFunc
/* 2BF90 8003B790 21382002 */   addu      $a3, $s1, $zero
.L8003B794:
/* 2BF94 8003B794 19000012 */  beqz       $s0, .L8003B7FC
/* 2BF98 8003B798 0004163C */   lui       $s6, (0x4000000 >> 16)
.L8003B79C:
/* 2BF9C 8003B79C 1400028E */  lw         $v0, 0x14($s0)
/* 2BFA0 8003B7A0 00000000 */  nop
/* 2BFA4 8003B7A4 00084230 */  andi       $v0, $v0, 0x800
/* 2BFA8 8003B7A8 10004014 */  bnez       $v0, .L8003B7EC
/* 2BFAC 8003B7AC 00000000 */   nop
/* 2BFB0 8003B7B0 1800028E */  lw         $v0, 0x18($s0)
/* 2BFB4 8003B7B4 00000000 */  nop
/* 2BFB8 8003B7B8 24105600 */  and        $v0, $v0, $s6
/* 2BFBC 8003B7BC 0B004014 */  bnez       $v0, .L8003B7EC
/* 2BFC0 8003B7C0 00000000 */   nop
/* 2BFC4 8003B7C4 3800028E */  lw         $v0, 0x38($s0)
/* 2BFC8 8003B7C8 00000000 */  nop
/* 2BFCC 8003B7CC 07005214 */  bne        $v0, $s2, .L8003B7EC
/* 2BFD0 8003B7D0 00000000 */   nop
/* 2BFD4 8003B7D4 05001112 */  beq        $s0, $s1, .L8003B7EC
/* 2BFD8 8003B7D8 21206002 */   addu      $a0, $s3, $zero
/* 2BFDC 8003B7DC 21288002 */  addu       $a1, $s4, $zero
/* 2BFE0 8003B7E0 2130A002 */  addu       $a2, $s5, $zero
/* 2BFE4 8003B7E4 ECEC000C */  jal        PIPE3D_InstanceListTransformAndDrawFunc
/* 2BFE8 8003B7E8 21380002 */   addu      $a3, $s0, $zero
.L8003B7EC:
/* 2BFEC 8003B7EC 0800108E */  lw         $s0, 0x8($s0)
/* 2BFF0 8003B7F0 00000000 */  nop
/* 2BFF4 8003B7F4 E9FF0016 */  bnez       $s0, .L8003B79C
/* 2BFF8 8003B7F8 00000000 */   nop
.L8003B7FC:
/* 2BFFC 8003B7FC 2C00BF8F */  lw         $ra, 0x2C($sp)
/* 2C000 8003B800 2800B68F */  lw         $s6, 0x28($sp)
/* 2C004 8003B804 2400B58F */  lw         $s5, 0x24($sp)
/* 2C008 8003B808 2000B48F */  lw         $s4, 0x20($sp)
/* 2C00C 8003B80C 1C00B38F */  lw         $s3, 0x1C($sp)
/* 2C010 8003B810 1800B28F */  lw         $s2, 0x18($sp)
/* 2C014 8003B814 1400B18F */  lw         $s1, 0x14($sp)
/* 2C018 8003B818 1000B08F */  lw         $s0, 0x10($sp)
/* 2C01C 8003B81C 0800E003 */  jr         $ra
/* 2C020 8003B820 3000BD27 */   addiu     $sp, $sp, 0x30
.size PIPE3D_InstanceListTransformAndDraw, . - PIPE3D_InstanceListTransformAndDraw
