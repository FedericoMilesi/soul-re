.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PHYSICS_CheckFaceStick
/* 686F4 80077EF4 F8FFBD27 */  addiu      $sp, $sp, -0x8
/* 686F8 80077EF8 00008384 */  lh         $v1, 0x0($a0)
/* 686FC 80077EFC 03000224 */  addiu      $v0, $zero, 0x3
/* 68700 80077F00 12006214 */  bne        $v1, $v0, .L80077F4C
/* 68704 80077F04 21280000 */   addu      $a1, $zero, $zero
/* 68708 80077F08 0400868C */  lw         $a2, 0x4($a0)
/* 6870C 80077F0C 00000000 */  nop
/* 68710 80077F10 0A00C394 */  lhu        $v1, 0xA($a2)
/* 68714 80077F14 FFFF0234 */  ori        $v0, $zero, 0xFFFF
/* 68718 80077F18 0D006210 */  beq        $v1, $v0, .L80077F50
/* 6871C 80077F1C 2110A000 */   addu      $v0, $a1, $zero
/* 68720 80077F20 0800828C */  lw         $v0, 0x8($a0)
/* 68724 80077F24 00000000 */  nop
/* 68728 80077F28 0000428C */  lw         $v0, 0x0($v0)
/* 6872C 80077F2C 00000000 */  nop
/* 68730 80077F30 3400428C */  lw         $v0, 0x34($v0)
/* 68734 80077F34 00000000 */  nop
/* 68738 80077F38 21104300 */  addu       $v0, $v0, $v1
/* 6873C 80077F3C 0A004294 */  lhu        $v0, 0xA($v0)
/* 68740 80077F40 00000000 */  nop
/* 68744 80077F44 00024230 */  andi       $v0, $v0, 0x200
/* 68748 80077F48 2B28A200 */  sltu       $a1, $a1, $v0
.L80077F4C:
/* 6874C 80077F4C 2110A000 */  addu       $v0, $a1, $zero
.L80077F50:
/* 68750 80077F50 0800E003 */  jr         $ra
/* 68754 80077F54 0800BD27 */   addiu     $sp, $sp, 0x8
.size PHYSICS_CheckFaceStick, . - PHYSICS_CheckFaceStick
