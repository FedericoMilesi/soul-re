.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel _G2Anim_BuildSegTransformWithControllers
/* 8165C 80090E5C C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 81660 80090E60 2800B2AF */  sw         $s2, 0x28($sp)
/* 81664 80090E64 21908000 */  addu       $s2, $a0, $zero
/* 81668 80090E68 3000B4AF */  sw         $s4, 0x30($sp)
/* 8166C 80090E6C 21A0A000 */  addu       $s4, $a1, $zero
/* 81670 80090E70 2000B0AF */  sw         $s0, 0x20($sp)
/* 81674 80090E74 2180C000 */  addu       $s0, $a2, $zero
/* 81678 80090E78 3800B6AF */  sw         $s6, 0x38($sp)
/* 8167C 80090E7C 21B0E000 */  addu       $s6, $a3, $zero
/* 81680 80090E80 21284002 */  addu       $a1, $s2, $zero
/* 81684 80090E84 3400B5AF */  sw         $s5, 0x34($sp)
/* 81688 80090E88 5000B58F */  lw         $s5, 0x50($sp)
/* 8168C 80090E8C F8ED8327 */  addiu      $v1, $gp, %gp_rel(_segValues)
/* 81690 80090E90 3C00BFAF */  sw         $ra, 0x3C($sp)
/* 81694 80090E94 2C00B3AF */  sw         $s3, 0x2C($sp)
/* 81698 80090E98 2400B1AF */  sw         $s1, 0x24($sp)
/* 8169C 80090E9C 40101500 */  sll        $v0, $s5, 1
/* 816A0 80090EA0 21105500 */  addu       $v0, $v0, $s5
/* 816A4 80090EA4 C0100200 */  sll        $v0, $v0, 3
/* 816A8 80090EA8 21884300 */  addu       $s1, $v0, $v1
/* 816AC 80090EAC DA50020C */  jal        _G2Anim_BuildSegLocalRotMatrix
/* 816B0 80090EB0 21202002 */   addu      $a0, $s1, $zero
/* 816B4 80090EB4 03000292 */  lbu        $v0, 0x3($s0)
/* 816B8 80090EB8 00000000 */  nop
/* 816BC 80090EBC 11005514 */  bne        $v0, $s5, .L80090F04
/* 816C0 80090EC0 07001324 */   addiu     $s3, $zero, 0x7
.L80090EC4:
/* 816C4 80090EC4 21200002 */  addu       $a0, $s0, $zero
/* 816C8 80090EC8 21282002 */  addu       $a1, $s1, $zero
/* 816CC 80090ECC 21304002 */  addu       $a2, $s2, $zero
/* 816D0 80090ED0 5A44020C */  jal        _G2AnimController_ApplyToSegValue
/* 816D4 80090ED4 21388002 */   addu      $a3, $s4, $zero
/* 816D8 80090ED8 00000496 */  lhu        $a0, 0x0($s0)
/* 816DC 80090EDC 00000000 */  nop
/* 816E0 80090EE0 C0180400 */  sll        $v1, $a0, 3
/* 816E4 80090EE4 21186400 */  addu       $v1, $v1, $a0
/* 816E8 80090EE8 84F5848F */  lw         $a0, %gp_rel(_controllerPool + 0xC)($gp)
/* 816EC 80090EEC 80180300 */  sll        $v1, $v1, 2
/* 816F0 80090EF0 21808300 */  addu       $s0, $a0, $v1
/* 816F4 80090EF4 03000392 */  lbu        $v1, 0x3($s0)
/* 816F8 80090EF8 00000000 */  nop
/* 816FC 80090EFC F1FF7510 */  beq        $v1, $s5, .L80090EC4
/* 81700 80090F00 24986202 */   and       $s3, $s3, $v0
.L80090F04:
/* 81704 80090F04 00008C8E */  lw         $t4, 0x0($s4)
/* 81708 80090F08 04008D8E */  lw         $t5, 0x4($s4)
/* 8170C 80090F0C 0000CC48 */  ctc2       $t4, $0 # handwritten instruction
/* 81710 80090F10 0008CD48 */  ctc2       $t5, $1 # handwritten instruction
/* 81714 80090F14 08008C8E */  lw         $t4, 0x8($s4)
/* 81718 80090F18 0C008D8E */  lw         $t5, 0xC($s4)
/* 8171C 80090F1C 10008E8E */  lw         $t6, 0x10($s4)
/* 81720 80090F20 0010CC48 */  ctc2       $t4, $2 # handwritten instruction
/* 81724 80090F24 0018CD48 */  ctc2       $t5, $3 # handwritten instruction
/* 81728 80090F28 0020CE48 */  ctc2       $t6, $4 # handwritten instruction
/* 8172C 80090F2C 08002386 */  lh         $v1, 0x8($s1)
/* 81730 80090F30 00000000 */  nop
/* 81734 80090F34 1000A3AF */  sw         $v1, 0x10($sp)
/* 81738 80090F38 0A002486 */  lh         $a0, 0xA($s1)
/* 8173C 80090F3C 00000000 */  nop
/* 81740 80090F40 1400A4AF */  sw         $a0, 0x14($sp)
/* 81744 80090F44 0C002286 */  lh         $v0, 0xC($s1)
/* 81748 80090F48 25186400 */  or         $v1, $v1, $a0
/* 8174C 80090F4C 25186200 */  or         $v1, $v1, $v0
/* 81750 80090F50 1800A2AF */  sw         $v0, 0x18($sp)
/* 81754 80090F54 00100224 */  addiu      $v0, $zero, 0x1000
/* 81758 80090F58 05006210 */  beq        $v1, $v0, .L80090F70
/* 8175C 80090F5C 21204002 */   addu      $a0, $s2, $zero
/* 81760 80090F60 96E4010C */  jal        func_80079258
/* 81764 80090F64 1000A527 */   addiu     $a1, $sp, 0x10
/* 81768 80090F68 01000224 */  addiu      $v0, $zero, 0x1
/* 8176C 80090F6C 120042A6 */  sh         $v0, 0x12($s2)
.L80090F70:
/* 81770 80090F70 01006232 */  andi       $v0, $s3, 0x1
/* 81774 80090F74 2C004010 */  beqz       $v0, .L80091028
/* 81778 80090F78 04006232 */   andi      $v0, $s3, 0x4
/* 8177C 80090F7C 00004C96 */  lhu        $t4, 0x0($s2)
/* 81780 80090F80 06004D96 */  lhu        $t5, 0x6($s2)
/* 81784 80090F84 0C004E96 */  lhu        $t6, 0xC($s2)
/* 81788 80090F88 00488C48 */  mtc2       $t4, $9 # handwritten instruction
/* 8178C 80090F8C 00508D48 */  mtc2       $t5, $10 # handwritten instruction
/* 81790 80090F90 00588E48 */  mtc2       $t6, $11 # handwritten instruction
/* 81794 80090F94 02004896 */  lhu        $t0, 0x2($s2)
/* 81798 80090F98 08004996 */  lhu        $t1, 0x8($s2)
/* 8179C 80090F9C 00000000 */  nop
/* 817A0 80090FA0 12E0494A */  MVMVA      1, 0, 3, 3, 0
/* 817A4 80090FA4 0E004A96 */  lhu        $t2, 0xE($s2)
/* 817A8 80090FA8 04004B96 */  lhu        $t3, 0x4($s2)
/* 817AC 80090FAC 00480D48 */  mfc2       $t5, $9 # handwritten instruction
/* 817B0 80090FB0 00500E48 */  mfc2       $t6, $10 # handwritten instruction
/* 817B4 80090FB4 00580F48 */  mfc2       $t7, $11 # handwritten instruction
/* 817B8 80090FB8 00488848 */  mtc2       $t0, $9 # handwritten instruction
/* 817BC 80090FBC 00508948 */  mtc2       $t1, $10 # handwritten instruction
/* 817C0 80090FC0 00588A48 */  mtc2       $t2, $11 # handwritten instruction
/* 817C4 80090FC4 00004DA6 */  sh         $t5, 0x0($s2)
/* 817C8 80090FC8 06004EA6 */  sh         $t6, 0x6($s2)
/* 817CC 80090FCC 00000000 */  nop
/* 817D0 80090FD0 12E0494A */  MVMVA      1, 0, 3, 3, 0
/* 817D4 80090FD4 0A004C96 */  lhu        $t4, 0xA($s2)
/* 817D8 80090FD8 10004D96 */  lhu        $t5, 0x10($s2)
/* 817DC 80090FDC 00480848 */  mfc2       $t0, $9 # handwritten instruction
/* 817E0 80090FE0 00500948 */  mfc2       $t1, $10 # handwritten instruction
/* 817E4 80090FE4 00580A48 */  mfc2       $t2, $11 # handwritten instruction
/* 817E8 80090FE8 00488B48 */  mtc2       $t3, $9 # handwritten instruction
/* 817EC 80090FEC 00508C48 */  mtc2       $t4, $10 # handwritten instruction
/* 817F0 80090FF0 00588D48 */  mtc2       $t5, $11 # handwritten instruction
/* 817F4 80090FF4 0C004FA6 */  sh         $t7, 0xC($s2)
/* 817F8 80090FF8 020048A6 */  sh         $t0, 0x2($s2)
/* 817FC 80090FFC 00000000 */  nop
/* 81800 80091000 12E0494A */  MVMVA      1, 0, 3, 3, 0
/* 81804 80091004 080049A6 */  sh         $t1, 0x8($s2)
/* 81808 80091008 0E004AA6 */  sh         $t2, 0xE($s2)
/* 8180C 8009100C 00480848 */  mfc2       $t0, $9 # handwritten instruction
/* 81810 80091010 00500948 */  mfc2       $t1, $10 # handwritten instruction
/* 81814 80091014 00580A48 */  mfc2       $t2, $11 # handwritten instruction
/* 81818 80091018 040048A6 */  sh         $t0, 0x4($s2)
/* 8181C 8009101C 0A0049A6 */  sh         $t1, 0xA($s2)
/* 81820 80091020 10004AA6 */  sh         $t2, 0x10($s2)
/* 81824 80091024 04006232 */  andi       $v0, $s3, 0x4
.L80091028:
/* 81828 80091028 19004010 */  beqz       $v0, .L80091090
/* 8182C 8009102C 00000000 */   nop
/* 81830 80091030 0C00A016 */  bnez       $s5, .L80091064
/* 81834 80091034 10002226 */   addiu     $v0, $s1, 0x10
/* 81838 80091038 00004C8E */  lw         $t4, 0x0($s2)
/* 8183C 8009103C 04004D8E */  lw         $t5, 0x4($s2)
/* 81840 80091040 0000CC48 */  ctc2       $t4, $0 # handwritten instruction
/* 81844 80091044 0008CD48 */  ctc2       $t5, $1 # handwritten instruction
/* 81848 80091048 08004C8E */  lw         $t4, 0x8($s2)
/* 8184C 8009104C 0C004D8E */  lw         $t5, 0xC($s2)
/* 81850 80091050 10004E8E */  lw         $t6, 0x10($s2)
/* 81854 80091054 0010CC48 */  ctc2       $t4, $2 # handwritten instruction
/* 81858 80091058 0018CD48 */  ctc2       $t5, $3 # handwritten instruction
/* 8185C 8009105C 0020CE48 */  ctc2       $t6, $4 # handwritten instruction
/* 81860 80091060 10002226 */  addiu      $v0, $s1, 0x10
.L80091064:
/* 81864 80091064 14004326 */  addiu      $v1, $s2, 0x14
/* 81868 80091068 000040C8 */  lwc2       $0, 0x0($v0)
/* 8186C 8009106C 040041C8 */  lwc2       $1, 0x4($v0)
/* 81870 80091070 00000000 */  nop
/* 81874 80091074 00000000 */  nop
/* 81878 80091078 1260484A */  MVMVA      1, 0, 0, 3, 0
/* 8187C 8009107C 000079E8 */  swc2       $25, 0x0($v1)
/* 81880 80091080 04007AE8 */  swc2       $26, 0x4($v1) # handwritten instruction
/* 81884 80091084 08007BE8 */  swc2       $27, 0x8($v1) # handwritten instruction
/* 81888 80091088 2D440208 */  j          .L800910B4
/* 8188C 8009108C 00000000 */   nop
.L80091090:
/* 81890 80091090 10002286 */  lh         $v0, 0x10($s1)
/* 81894 80091094 00000000 */  nop
/* 81898 80091098 140042AE */  sw         $v0, 0x14($s2)
/* 8189C 8009109C 12002286 */  lh         $v0, 0x12($s1)
/* 818A0 800910A0 00000000 */  nop
/* 818A4 800910A4 180042AE */  sw         $v0, 0x18($s2)
/* 818A8 800910A8 14002286 */  lh         $v0, 0x14($s1)
/* 818AC 800910AC 00000000 */  nop
/* 818B0 800910B0 1C0042AE */  sw         $v0, 0x1C($s2)
.L800910B4:
/* 818B4 800910B4 1300C012 */  beqz       $s6, .L80091104
/* 818B8 800910B8 00000000 */   nop
/* 818BC 800910BC 1400828E */  lw         $v0, 0x14($s4)
/* 818C0 800910C0 1400438E */  lw         $v1, 0x14($s2)
/* 818C4 800910C4 00000000 */  nop
/* 818C8 800910C8 21104300 */  addu       $v0, $v0, $v1
/* 818CC 800910CC 140082AE */  sw         $v0, 0x14($s4)
/* 818D0 800910D0 1800828E */  lw         $v0, 0x18($s4)
/* 818D4 800910D4 1800438E */  lw         $v1, 0x18($s2)
/* 818D8 800910D8 00000000 */  nop
/* 818DC 800910DC 21104300 */  addu       $v0, $v0, $v1
/* 818E0 800910E0 180082AE */  sw         $v0, 0x18($s4)
/* 818E4 800910E4 1C00828E */  lw         $v0, 0x1C($s4)
/* 818E8 800910E8 1C00438E */  lw         $v1, 0x1C($s2)
/* 818EC 800910EC 00000000 */  nop
/* 818F0 800910F0 21104300 */  addu       $v0, $v0, $v1
/* 818F4 800910F4 1C0082AE */  sw         $v0, 0x1C($s4)
/* 818F8 800910F8 140040AE */  sw         $zero, 0x14($s2)
/* 818FC 800910FC 180040AE */  sw         $zero, 0x18($s2)
/* 81900 80091100 1C0040AE */  sw         $zero, 0x1C($s2)
.L80091104:
/* 81904 80091104 1400428E */  lw         $v0, 0x14($s2)
/* 81908 80091108 1400838E */  lw         $v1, 0x14($s4)
/* 8190C 8009110C 00000000 */  nop
/* 81910 80091110 21104300 */  addu       $v0, $v0, $v1
/* 81914 80091114 140042AE */  sw         $v0, 0x14($s2)
/* 81918 80091118 1800428E */  lw         $v0, 0x18($s2)
/* 8191C 8009111C 1800838E */  lw         $v1, 0x18($s4)
/* 81920 80091120 00000000 */  nop
/* 81924 80091124 21104300 */  addu       $v0, $v0, $v1
/* 81928 80091128 180042AE */  sw         $v0, 0x18($s2)
/* 8192C 8009112C 1C00428E */  lw         $v0, 0x1C($s2)
/* 81930 80091130 1C00838E */  lw         $v1, 0x1C($s4)
/* 81934 80091134 00000000 */  nop
/* 81938 80091138 21104300 */  addu       $v0, $v0, $v1
/* 8193C 8009113C 1C0042AE */  sw         $v0, 0x1C($s2)
/* 81940 80091140 3C00BF8F */  lw         $ra, 0x3C($sp)
/* 81944 80091144 3800B68F */  lw         $s6, 0x38($sp)
/* 81948 80091148 3400B58F */  lw         $s5, 0x34($sp)
/* 8194C 8009114C 3000B48F */  lw         $s4, 0x30($sp)
/* 81950 80091150 2C00B38F */  lw         $s3, 0x2C($sp)
/* 81954 80091154 2800B28F */  lw         $s2, 0x28($sp)
/* 81958 80091158 2400B18F */  lw         $s1, 0x24($sp)
/* 8195C 8009115C 2000B08F */  lw         $s0, 0x20($sp)
/* 81960 80091160 0800E003 */  jr         $ra
/* 81964 80091164 4000BD27 */   addiu     $sp, $sp, 0x40
.size _G2Anim_BuildSegTransformWithControllers, . - _G2Anim_BuildSegTransformWithControllers
