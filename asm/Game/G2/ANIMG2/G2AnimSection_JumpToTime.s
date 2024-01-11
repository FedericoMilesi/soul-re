.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2AnimSection_JumpToTime
/* 83F40 80093740 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 83F44 80093744 1000B0AF */  sw         $s0, 0x10($sp)
/* 83F48 80093748 21808000 */  addu       $s0, $a0, $zero
/* 83F4C 8009374C 1800B2AF */  sw         $s2, 0x18($sp)
/* 83F50 80093750 2190A000 */  addu       $s2, $a1, $zero
/* 83F54 80093754 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 83F58 80093758 3853020C */  jal        _G2AnimSection_GetAnim
/* 83F5C 8009375C 1400B1AF */   sw        $s1, 0x14($sp)
/* 83F60 80093760 21884000 */  addu       $s1, $v0, $zero
/* 83F64 80093764 00141200 */  sll        $v0, $s2, 16
/* 83F68 80093768 04000386 */  lh         $v1, 0x4($s0)
/* 83F6C 8009376C 03140200 */  sra        $v0, $v0, 16
/* 83F70 80093770 2A104300 */  slt        $v0, $v0, $v1
/* 83F74 80093774 07004010 */  beqz       $v0, .L80093794
/* 83F78 80093778 21200002 */   addu      $a0, $s0, $zero
/* 83F7C 8009377C 2400028E */  lw         $v0, 0x24($s0)
/* 83F80 80093780 00000000 */  nop
/* 83F84 80093784 06004294 */  lhu        $v0, 0x6($v0)
/* 83F88 80093788 00000000 */  nop
/* 83F8C 8009378C 23100200 */  negu       $v0, $v0
/* 83F90 80093790 060002A6 */  sh         $v0, 0x6($s0)
.L80093794:
/* 83F94 80093794 21282002 */  addu       $a1, $s1, $zero
/* 83F98 80093798 0453020C */  jal        _G2AnimSection_UpdateStoredFrameFromData
/* 83F9C 8009379C 040012A6 */   sh        $s2, 0x4($s0)
/* 83FA0 800937A0 21200002 */  addu       $a0, $s0, $zero
/* 83FA4 800937A4 EB3F020C */  jal        G2AnimSection_ClearAlarm
/* 83FA8 800937A8 03000524 */   addiu     $a1, $zero, 0x3
/* 83FAC 800937AC 00000292 */  lbu        $v0, 0x0($s0)
/* 83FB0 800937B0 02000392 */  lbu        $v1, 0x2($s0)
/* 83FB4 800937B4 7F004230 */  andi       $v0, $v0, 0x7F
/* 83FB8 800937B8 03006014 */  bnez       $v1, .L800937C8
/* 83FBC 800937BC 000002A2 */   sb        $v0, 0x0($s0)
/* 83FC0 800937C0 080020AE */  sw         $zero, 0x8($s1)
/* 83FC4 800937C4 0C0020A6 */  sh         $zero, 0xC($s1)
.L800937C8:
/* 83FC8 800937C8 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 83FCC 800937CC 1800B28F */  lw         $s2, 0x18($sp)
/* 83FD0 800937D0 1400B18F */  lw         $s1, 0x14($sp)
/* 83FD4 800937D4 1000B08F */  lw         $s0, 0x10($sp)
/* 83FD8 800937D8 0800E003 */  jr         $ra
/* 83FDC 800937DC 2000BD27 */   addiu     $sp, $sp, 0x20
.size G2AnimSection_JumpToTime, . - G2AnimSection_JumpToTime
