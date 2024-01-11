.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_CalcFocusOffsetForSwim
/* 96F8 80018EF8 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 96FC 80018EFC 2C00BFAF */  sw         $ra, 0x2C($sp)
/* 9700 80018F00 2800B0AF */  sw         $s0, 0x28($sp)
/* 9704 80018F04 3601A294 */  lhu        $v0, 0x136($a1)
/* 9708 80018F08 0801A38C */  lw         $v1, 0x108($a1)
/* 970C 80018F0C 2000A2A7 */  sh         $v0, 0x20($sp)
/* 9710 80018F10 3801A294 */  lhu        $v0, 0x138($a1)
/* 9714 80018F14 21808000 */  addu       $s0, $a0, $zero
/* 9718 80018F18 2200A2A7 */  sh         $v0, 0x22($sp)
/* 971C 80018F1C 3A01A294 */  lhu        $v0, 0x13A($a1)
/* 9720 80018F20 1000A627 */  addiu      $a2, $sp, 0x10
/* 9724 80018F24 2400A2A7 */  sh         $v0, 0x24($sp)
/* 9728 80018F28 4000648C */  lw         $a0, 0x40($v1)
/* 972C 80018F2C 2000A527 */  addiu      $a1, $sp, 0x20
/* 9730 80018F30 1AF2020C */  jal        ApplyMatrix
/* 9734 80018F34 20008424 */   addiu     $a0, $a0, 0x20
/* 9738 80018F38 1000A227 */  addiu      $v0, $sp, 0x10
/* 973C 80018F3C 1000A397 */  lhu        $v1, 0x10($sp)
/* 9740 80018F40 04004494 */  lhu        $a0, 0x4($v0)
/* 9744 80018F44 08004294 */  lhu        $v0, 0x8($v0)
/* 9748 80018F48 000003A6 */  sh         $v1, 0x0($s0)
/* 974C 80018F4C 020004A6 */  sh         $a0, 0x2($s0)
/* 9750 80018F50 040002A6 */  sh         $v0, 0x4($s0)
/* 9754 80018F54 2C00BF8F */  lw         $ra, 0x2C($sp)
/* 9758 80018F58 2800B08F */  lw         $s0, 0x28($sp)
/* 975C 80018F5C 0800E003 */  jr         $ra
/* 9760 80018F60 3000BD27 */   addiu     $sp, $sp, 0x30
.size CAMERA_CalcFocusOffsetForSwim, . - CAMERA_CalcFocusOffsetForSwim
