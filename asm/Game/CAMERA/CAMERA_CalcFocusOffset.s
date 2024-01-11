.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel CAMERA_CalcFocusOffset
/* 9644 80018E44 21308000 */  addu       $a2, $a0, $zero
/* 9648 80018E48 3601A294 */  lhu        $v0, 0x136($a1)
/* 964C 80018E4C 0801A48C */  lw         $a0, 0x108($a1)
/* 9650 80018E50 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 9654 80018E54 1000A2A7 */  sh         $v0, 0x10($sp)
/* 9658 80018E58 3801A294 */  lhu        $v0, 0x138($a1)
/* 965C 80018E5C 00000000 */  nop
/* 9660 80018E60 1200A2A7 */  sh         $v0, 0x12($sp)
/* 9664 80018E64 3A01A394 */  lhu        $v1, 0x13A($a1)
/* 9668 80018E68 00000000 */  nop
/* 966C 80018E6C 1400A3A7 */  sh         $v1, 0x14($sp)
/* 9670 80018E70 9C04A28C */  lw         $v0, 0x49C($a1)
/* 9674 80018E74 00000000 */  nop
/* 9678 80018E78 02004104 */  bgez       $v0, .L80018E84
/* 967C 80018E7C 00016224 */   addiu     $v0, $v1, 0x100
/* 9680 80018E80 1400A2A7 */  sh         $v0, 0x14($sp)
.L80018E84:
/* 9684 80018E84 4000848C */  lw         $a0, 0x40($a0)
/* 9688 80018E88 00000000 */  nop
/* 968C 80018E8C 00008C8C */  lw         $t4, 0x0($a0)
/* 9690 80018E90 04008D8C */  lw         $t5, 0x4($a0)
/* 9694 80018E94 0000CC48 */  ctc2       $t4, $0 # handwritten instruction
/* 9698 80018E98 0008CD48 */  ctc2       $t5, $1 # handwritten instruction
/* 969C 80018E9C 08008C8C */  lw         $t4, 0x8($a0)
/* 96A0 80018EA0 0C008D8C */  lw         $t5, 0xC($a0)
/* 96A4 80018EA4 10008E8C */  lw         $t6, 0x10($a0)
/* 96A8 80018EA8 0010CC48 */  ctc2       $t4, $2 # handwritten instruction
/* 96AC 80018EAC 0018CD48 */  ctc2       $t5, $3 # handwritten instruction
/* 96B0 80018EB0 0020CE48 */  ctc2       $t6, $4 # handwritten instruction
/* 96B4 80018EB4 1000A227 */  addiu      $v0, $sp, 0x10
/* 96B8 80018EB8 000040C8 */  lwc2       $0, 0x0($v0)
/* 96BC 80018EBC 040041C8 */  lwc2       $1, 0x4($v0)
/* 96C0 80018EC0 00000000 */  nop
/* 96C4 80018EC4 00000000 */  nop
/* 96C8 80018EC8 1260484A */  MVMVA      1, 0, 0, 3, 0
/* 96CC 80018ECC 0000B9EB */  swc2       $25, 0x0($sp)
/* 96D0 80018ED0 0400BAEB */  swc2       $26, 0x4($sp) # handwritten instruction
/* 96D4 80018ED4 0800BBEB */  swc2       $27, 0x8($sp) # handwritten instruction
/* 96D8 80018ED8 0000A297 */  lhu        $v0, 0x0($sp)
/* 96DC 80018EDC 0400A397 */  lhu        $v1, 0x4($sp)
/* 96E0 80018EE0 0800A497 */  lhu        $a0, 0x8($sp)
/* 96E4 80018EE4 0000C2A4 */  sh         $v0, 0x0($a2)
/* 96E8 80018EE8 0200C3A4 */  sh         $v1, 0x2($a2)
/* 96EC 80018EEC 0400C4A4 */  sh         $a0, 0x4($a2)
/* 96F0 80018EF0 0800E003 */  jr         $ra
/* 96F4 80018EF4 1800BD27 */   addiu     $sp, $sp, 0x18
.size CAMERA_CalcFocusOffset, . - CAMERA_CalcFocusOffset
