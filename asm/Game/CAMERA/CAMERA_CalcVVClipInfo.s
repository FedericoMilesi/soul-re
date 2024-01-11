.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel CAMERA_CalcVVClipInfo
/* 55E0 80014DE0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 55E4 80014DE4 1000B0AF */  sw         $s0, 0x10($sp)
/* 55E8 80014DE8 21808000 */  addu       $s0, $a0, $zero
/* 55EC 80014DEC 78000526 */  addiu      $a1, $s0, 0x78
/* 55F0 80014DF0 1800B2AF */  sw         $s2, 0x18($sp)
/* 55F4 80014DF4 08001226 */  addiu      $s2, $s0, 0x8
/* 55F8 80014DF8 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 55FC 80014DFC 1400B1AF */  sw         $s1, 0x14($sp)
/* 5600 80014E00 7400048E */  lw         $a0, 0x74($s0)
/* 5604 80014E04 0EF3020C */  jal        func_800BCC38
/* 5608 80014E08 21304002 */   addu      $a2, $s2, $zero
/* 560C 80014E0C 80000526 */  addiu      $a1, $s0, 0x80
/* 5610 80014E10 7400048E */  lw         $a0, 0x74($s0)
/* 5614 80014E14 0EF3020C */  jal        func_800BCC38
/* 5618 80014E18 0E000626 */   addiu     $a2, $s0, 0xE
/* 561C 80014E1C 88000526 */  addiu      $a1, $s0, 0x88
/* 5620 80014E20 7400048E */  lw         $a0, 0x74($s0)
/* 5624 80014E24 0EF3020C */  jal        func_800BCC38
/* 5628 80014E28 14000626 */   addiu     $a2, $s0, 0x14
/* 562C 80014E2C 90000526 */  addiu      $a1, $s0, 0x90
/* 5630 80014E30 28001126 */  addiu      $s1, $s0, 0x28
/* 5634 80014E34 7400048E */  lw         $a0, 0x74($s0)
/* 5638 80014E38 0EF3020C */  jal        func_800BCC38
/* 563C 80014E3C 21302002 */   addu      $a2, $s1, $zero
/* 5640 80014E40 98000526 */  addiu      $a1, $s0, 0x98
/* 5644 80014E44 7400048E */  lw         $a0, 0x74($s0)
/* 5648 80014E48 0EF3020C */  jal        func_800BCC38
/* 564C 80014E4C 2E000626 */   addiu     $a2, $s0, 0x2E
/* 5650 80014E50 00004C8E */  lw         $t4, 0x0($s2)
/* 5654 80014E54 04004D8E */  lw         $t5, 0x4($s2)
/* 5658 80014E58 0000CC48 */  ctc2       $t4, $0 # handwritten instruction
/* 565C 80014E5C 0008CD48 */  ctc2       $t5, $1 # handwritten instruction
/* 5660 80014E60 08004C8E */  lw         $t4, 0x8($s2)
/* 5664 80014E64 0C004D8E */  lw         $t5, 0xC($s2)
/* 5668 80014E68 10004E8E */  lw         $t6, 0x10($s2)
/* 566C 80014E6C 0010CC48 */  ctc2       $t4, $2 # handwritten instruction
/* 5670 80014E70 0018CD48 */  ctc2       $t5, $3 # handwritten instruction
/* 5674 80014E74 0020CE48 */  ctc2       $t6, $4 # handwritten instruction
/* 5678 80014E78 000000CA */  lwc2       $0, 0x0($s0)
/* 567C 80014E7C 040001CA */  lwc2       $1, 0x4($s0)
/* 5680 80014E80 00000000 */  nop
/* 5684 80014E84 00000000 */  nop
/* 5688 80014E88 1260484A */  MVMVA      1, 0, 0, 3, 0
/* 568C 80014E8C 48000226 */  addiu      $v0, $s0, 0x48
/* 5690 80014E90 000059E8 */  swc2       $25, 0x0($v0)
/* 5694 80014E94 04005AE8 */  swc2       $26, 0x4($v0) # handwritten instruction
/* 5698 80014E98 08005BE8 */  swc2       $27, 0x8($v0) # handwritten instruction
/* 569C 80014E9C 00002C8E */  lw         $t4, 0x0($s1)
/* 56A0 80014EA0 04002D8E */  lw         $t5, 0x4($s1)
/* 56A4 80014EA4 0000CC48 */  ctc2       $t4, $0 # handwritten instruction
/* 56A8 80014EA8 0008CD48 */  ctc2       $t5, $1 # handwritten instruction
/* 56AC 80014EAC 08002C8E */  lw         $t4, 0x8($s1)
/* 56B0 80014EB0 0C002D8E */  lw         $t5, 0xC($s1)
/* 56B4 80014EB4 10002E8E */  lw         $t6, 0x10($s1)
/* 56B8 80014EB8 0010CC48 */  ctc2       $t4, $2 # handwritten instruction
/* 56BC 80014EBC 0018CD48 */  ctc2       $t5, $3 # handwritten instruction
/* 56C0 80014EC0 0020CE48 */  ctc2       $t6, $4 # handwritten instruction
/* 56C4 80014EC4 000000CA */  lwc2       $0, 0x0($s0)
/* 56C8 80014EC8 040001CA */  lwc2       $1, 0x4($s0)
/* 56CC 80014ECC 00000000 */  nop
/* 56D0 80014ED0 00000000 */  nop
/* 56D4 80014ED4 1260484A */  MVMVA      1, 0, 0, 3, 0
/* 56D8 80014ED8 54001026 */  addiu      $s0, $s0, 0x54
/* 56DC 80014EDC 000019EA */  swc2       $25, 0x0($s0)
/* 56E0 80014EE0 04001AEA */  swc2       $26, 0x4($s0) # handwritten instruction
/* 56E4 80014EE4 08001BEA */  swc2       $27, 0x8($s0) # handwritten instruction
/* 56E8 80014EE8 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 56EC 80014EEC 1800B28F */  lw         $s2, 0x18($sp)
/* 56F0 80014EF0 1400B18F */  lw         $s1, 0x14($sp)
/* 56F4 80014EF4 1000B08F */  lw         $s0, 0x10($sp)
/* 56F8 80014EF8 0800E003 */  jr         $ra
/* 56FC 80014EFC 2000BD27 */   addiu     $sp, $sp, 0x20
.size CAMERA_CalcVVClipInfo, . - CAMERA_CalcVVClipInfo
