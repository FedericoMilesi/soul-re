.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_DoSubListAction
/* 578E8 800670E8 A8FFBD27 */  addiu      $sp, $sp, -0x58
/* 578EC 800670EC 4400B3AF */  sw         $s3, 0x44($sp)
/* 578F0 800670F0 21988000 */  addu       $s3, $a0, $zero
/* 578F4 800670F4 4C00B5AF */  sw         $s5, 0x4C($sp)
/* 578F8 800670F8 21A8A000 */  addu       $s5, $a1, $zero
/* 578FC 800670FC 4800B4AF */  sw         $s4, 0x48($sp)
/* 57900 80067100 21A0C000 */  addu       $s4, $a2, $zero
/* 57904 80067104 5000B6AF */  sw         $s6, 0x50($sp)
/* 57908 80067108 21B0E000 */  addu       $s6, $a3, $zero
/* 5790C 8006710C 5400BFAF */  sw         $ra, 0x54($sp)
/* 57910 80067110 4000B2AF */  sw         $s2, 0x40($sp)
/* 57914 80067114 3C00B1AF */  sw         $s1, 0x3C($sp)
/* 57918 80067118 3800B0AF */  sw         $s0, 0x38($sp)
/* 5791C 8006711C 0400628E */  lw         $v0, 0x4($s3)
/* 57920 80067120 00000000 */  nop
/* 57924 80067124 24004018 */  blez       $v0, .L800671B8
/* 57928 80067128 21900000 */   addu      $s2, $zero, $zero
/* 5792C 8006712C 02000224 */  addiu      $v0, $zero, 0x2
.L80067130:
/* 57930 80067130 1000A2AF */  sw         $v0, 0x10($sp)
/* 57934 80067134 0000638E */  lw         $v1, 0x0($s3)
/* 57938 80067138 04105200 */  sllv       $v0, $s2, $v0
/* 5793C 8006713C 21104300 */  addu       $v0, $v0, $v1
/* 57940 80067140 0000438C */  lw         $v1, 0x0($v0)
/* 57944 80067144 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 57948 80067148 1800A2AF */  sw         $v0, 0x18($sp)
/* 5794C 8006714C 1400A3AF */  sw         $v1, 0x14($sp)
/* 57950 80067150 0800628E */  lw         $v0, 0x8($s3)
/* 57954 80067154 00000000 */  nop
/* 57958 80067158 0D004018 */  blez       $v0, .L80067190
/* 5795C 8006715C 21800000 */   addu      $s0, $zero, $zero
/* 57960 80067160 21886002 */  addu       $s1, $s3, $zero
/* 57964 80067164 1000A427 */  addiu      $a0, $sp, 0x10
.L80067168:
/* 57968 80067168 21288002 */  addu       $a1, $s4, $zero
/* 5796C 8006716C 21380000 */  addu       $a3, $zero, $zero
/* 57970 80067170 0C00268E */  lw         $a2, 0xC($s1)
/* 57974 80067174 BFA2010C */  jal        EVENT_TransformOperand
/* 57978 80067178 04003126 */   addiu     $s1, $s1, 0x4
/* 5797C 8006717C 0800628E */  lw         $v0, 0x8($s3)
/* 57980 80067180 01001026 */  addiu      $s0, $s0, 0x1
/* 57984 80067184 2A100202 */  slt        $v0, $s0, $v0
/* 57988 80067188 F7FF4014 */  bnez       $v0, .L80067168
/* 5798C 8006718C 1000A427 */   addiu     $a0, $sp, 0x10
.L80067190:
/* 57990 80067190 1000A427 */  addiu      $a0, $sp, 0x10
/* 57994 80067194 2128A002 */  addu       $a1, $s5, $zero
/* 57998 80067198 21308002 */  addu       $a2, $s4, $zero
/* 5799C 8006719C F1A1010C */  jal        EVENT_ExecuteActionCommand
/* 579A0 800671A0 2138C002 */   addu      $a3, $s6, $zero
/* 579A4 800671A4 0400628E */  lw         $v0, 0x4($s3)
/* 579A8 800671A8 01005226 */  addiu      $s2, $s2, 0x1
/* 579AC 800671AC 2A104202 */  slt        $v0, $s2, $v0
/* 579B0 800671B0 DFFF4014 */  bnez       $v0, .L80067130
/* 579B4 800671B4 02000224 */   addiu     $v0, $zero, 0x2
.L800671B8:
/* 579B8 800671B8 5400BF8F */  lw         $ra, 0x54($sp)
/* 579BC 800671BC 5000B68F */  lw         $s6, 0x50($sp)
/* 579C0 800671C0 4C00B58F */  lw         $s5, 0x4C($sp)
/* 579C4 800671C4 4800B48F */  lw         $s4, 0x48($sp)
/* 579C8 800671C8 4400B38F */  lw         $s3, 0x44($sp)
/* 579CC 800671CC 4000B28F */  lw         $s2, 0x40($sp)
/* 579D0 800671D0 3C00B18F */  lw         $s1, 0x3C($sp)
/* 579D4 800671D4 3800B08F */  lw         $s0, 0x38($sp)
/* 579D8 800671D8 0800E003 */  jr         $ra
/* 579DC 800671DC 5800BD27 */   addiu     $sp, $sp, 0x58
.size EVENT_DoSubListAction, . - EVENT_DoSubListAction
