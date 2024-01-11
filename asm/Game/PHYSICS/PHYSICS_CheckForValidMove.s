.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PHYSICS_CheckForValidMove
/* 68688 80077E88 B8FFBD27 */  addiu      $sp, $sp, -0x48
/* 6868C 80077E8C 4000BFAF */  sw         $ra, 0x40($sp)
/* 68690 80077E90 2800A5AF */  sw         $a1, 0x28($sp)
/* 68694 80077E94 2400A6AF */  sw         $a2, 0x24($sp)
/* 68698 80077E98 4000858C */  lw         $a1, 0x40($a0)
/* 6869C 80077E9C 40390700 */  sll        $a3, $a3, 5
/* 686A0 80077EA0 2128A700 */  addu       $a1, $a1, $a3
/* 686A4 80077EA4 2130A000 */  addu       $a2, $a1, $zero
/* 686A8 80077EA8 24E0010C */  jal        PHYSICS_GenericLineCheck
/* 686AC 80077EAC 1000A727 */   addiu     $a3, $sp, 0x10
/* 686B0 80077EB0 BDDF010C */  jal        PHYSICS_CheckFaceStick
/* 686B4 80077EB4 1000A427 */   addiu     $a0, $sp, 0x10
/* 686B8 80077EB8 1000A397 */  lhu        $v1, 0x10($sp)
/* 686BC 80077EBC 2B200200 */  sltu       $a0, $zero, $v0
/* 686C0 80077EC0 FEFF6224 */  addiu      $v0, $v1, -0x2
/* 686C4 80077EC4 0200422C */  sltiu      $v0, $v0, 0x2
/* 686C8 80077EC8 05004014 */  bnez       $v0, .L80077EE0
/* 686CC 80077ECC 00140300 */   sll       $v0, $v1, 16
/* 686D0 80077ED0 03140200 */  sra        $v0, $v0, 16
/* 686D4 80077ED4 05000324 */  addiu      $v1, $zero, 0x5
/* 686D8 80077ED8 02004314 */  bne        $v0, $v1, .L80077EE4
/* 686DC 80077EDC 00000000 */   nop
.L80077EE0:
/* 686E0 80077EE0 02008424 */  addiu      $a0, $a0, 0x2
.L80077EE4:
/* 686E4 80077EE4 4000BF8F */  lw         $ra, 0x40($sp)
/* 686E8 80077EE8 21108000 */  addu       $v0, $a0, $zero
/* 686EC 80077EEC 0800E003 */  jr         $ra
/* 686F0 80077EF0 4800BD27 */   addiu     $sp, $sp, 0x48
.size PHYSICS_CheckForValidMove, . - PHYSICS_CheckForValidMove
