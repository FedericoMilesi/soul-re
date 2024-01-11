.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RelocateTerrain
/* 4C638 8005BE38 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 4C63C 8005BE3C 1800B2AF */  sw         $s2, 0x18($sp)
/* 4C640 8005BE40 21908000 */  addu       $s2, $a0, $zero
/* 4C644 8005BE44 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 4C648 8005BE48 2198A000 */  addu       $s3, $a1, $zero
/* 4C64C 8005BE4C 2000BFAF */  sw         $ra, 0x20($sp)
/* 4C650 8005BE50 1400B1AF */  sw         $s1, 0x14($sp)
/* 4C654 8005BE54 1000B0AF */  sw         $s0, 0x10($sp)
/* 4C658 8005BE58 0800428E */  lw         $v0, 0x8($s2)
/* 4C65C 8005BE5C 00000000 */  nop
/* 4C660 8005BE60 25004018 */  blez       $v0, .L8005BEF8
/* 4C664 8005BE64 21880000 */   addu      $s1, $zero, $zero
/* 4C668 8005BE68 21802002 */  addu       $s0, $s1, $zero
.L8005BE6C:
/* 4C66C 8005BE6C 0C00448E */  lw         $a0, 0xC($s2)
/* 4C670 8005BE70 00006396 */  lhu        $v1, 0x0($s3)
/* 4C674 8005BE74 21200402 */  addu       $a0, $s0, $a0
/* 4C678 8005BE78 20008294 */  lhu        $v0, 0x20($a0)
/* 4C67C 8005BE7C 00000000 */  nop
/* 4C680 8005BE80 21104300 */  addu       $v0, $v0, $v1
/* 4C684 8005BE84 200082A4 */  sh         $v0, 0x20($a0)
/* 4C688 8005BE88 0C00448E */  lw         $a0, 0xC($s2)
/* 4C68C 8005BE8C 02006396 */  lhu        $v1, 0x2($s3)
/* 4C690 8005BE90 21200402 */  addu       $a0, $s0, $a0
/* 4C694 8005BE94 22008294 */  lhu        $v0, 0x22($a0)
/* 4C698 8005BE98 00000000 */  nop
/* 4C69C 8005BE9C 21104300 */  addu       $v0, $v0, $v1
/* 4C6A0 8005BEA0 220082A4 */  sh         $v0, 0x22($a0)
/* 4C6A4 8005BEA4 0C00448E */  lw         $a0, 0xC($s2)
/* 4C6A8 8005BEA8 04006396 */  lhu        $v1, 0x4($s3)
/* 4C6AC 8005BEAC 21200402 */  addu       $a0, $s0, $a0
/* 4C6B0 8005BEB0 24008294 */  lhu        $v0, 0x24($a0)
/* 4C6B4 8005BEB4 00000000 */  nop
/* 4C6B8 8005BEB8 21104300 */  addu       $v0, $v0, $v1
/* 4C6BC 8005BEBC 240082A4 */  sh         $v0, 0x24($a0)
/* 4C6C0 8005BEC0 0C00428E */  lw         $v0, 0xC($s2)
/* 4C6C4 8005BEC4 00000000 */  nop
/* 4C6C8 8005BEC8 21100202 */  addu       $v0, $s0, $v0
/* 4C6CC 8005BECC 3800448C */  lw         $a0, 0x38($v0)
/* 4C6D0 8005BED0 00000000 */  nop
/* 4C6D4 8005BED4 03008010 */  beqz       $a0, .L8005BEE4
/* 4C6D8 8005BED8 00000000 */   nop
/* 4C6DC 8005BEDC 5E70010C */  jal        STREAM_AdjustMultiSpline
/* 4C6E0 8005BEE0 21286002 */   addu      $a1, $s3, $zero
.L8005BEE4:
/* 4C6E4 8005BEE4 0800428E */  lw         $v0, 0x8($s2)
/* 4C6E8 8005BEE8 01003126 */  addiu      $s1, $s1, 0x1
/* 4C6EC 8005BEEC 2A102202 */  slt        $v0, $s1, $v0
/* 4C6F0 8005BEF0 DEFF4014 */  bnez       $v0, .L8005BE6C
/* 4C6F4 8005BEF4 4C001026 */   addiu     $s0, $s0, 0x4C
.L8005BEF8:
/* 4C6F8 8005BEF8 3000428E */  lw         $v0, 0x30($s2)
/* 4C6FC 8005BEFC 21306002 */  addu       $a2, $s3, $zero
/* 4C700 8005BF00 0000458C */  lw         $a1, 0x0($v0)
/* 4C704 8005BF04 0F71010C */  jal        RelocateStreamPortals
/* 4C708 8005BF08 04004424 */   addiu     $a0, $v0, 0x4
/* 4C70C 8005BF0C 2000BF8F */  lw         $ra, 0x20($sp)
/* 4C710 8005BF10 1C00B38F */  lw         $s3, 0x1C($sp)
/* 4C714 8005BF14 1800B28F */  lw         $s2, 0x18($sp)
/* 4C718 8005BF18 1400B18F */  lw         $s1, 0x14($sp)
/* 4C71C 8005BF1C 1000B08F */  lw         $s0, 0x10($sp)
/* 4C720 8005BF20 0800E003 */  jr         $ra
/* 4C724 8005BF24 2800BD27 */   addiu     $sp, $sp, 0x28
.size RelocateTerrain, . - RelocateTerrain
