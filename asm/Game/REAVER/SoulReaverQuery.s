.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SoulReaverQuery
/* 6ABA8 8007A3A8 04000224 */  addiu      $v0, $zero, 0x4
/* 6ABAC 8007A3AC 0E00A210 */  beq        $a1, $v0, .L8007A3E8
/* 6ABB0 8007A3B0 0500A22C */   sltiu     $v0, $a1, 0x5
/* 6ABB4 8007A3B4 05004010 */  beqz       $v0, .L8007A3CC
/* 6ABB8 8007A3B8 01000224 */   addiu     $v0, $zero, 0x1
/* 6ABBC 8007A3BC 0800A210 */  beq        $a1, $v0, .L8007A3E0
/* 6ABC0 8007A3C0 21100000 */   addu      $v0, $zero, $zero
/* 6ABC4 8007A3C4 09E90108 */  j          .L8007A424
/* 6ABC8 8007A3C8 00000000 */   nop
.L8007A3CC:
/* 6ABCC 8007A3CC 28000224 */  addiu      $v0, $zero, 0x28
/* 6ABD0 8007A3D0 0700A210 */  beq        $a1, $v0, .L8007A3F0
/* 6ABD4 8007A3D4 21100000 */   addu      $v0, $zero, $zero
/* 6ABD8 8007A3D8 09E90108 */  j          .L8007A424
/* 6ABDC 8007A3DC 00000000 */   nop
.L8007A3E0:
/* 6ABE0 8007A3E0 0800E003 */  jr         $ra
/* 6ABE4 8007A3E4 0200023C */   lui       $v0, (0x20000 >> 16)
.L8007A3E8:
/* 6ABE8 8007A3E8 0800E003 */  jr         $ra
/* 6ABEC 8007A3EC 00100224 */   addiu     $v0, $zero, 0x1000
.L8007A3F0:
/* 6ABF0 8007A3F0 6C01848C */  lw         $a0, 0x16C($a0)
/* 6ABF4 8007A3F4 00000000 */  nop
/* 6ABF8 8007A3F8 01008290 */  lbu        $v0, 0x1($a0)
/* 6ABFC 8007A3FC 00000000 */  nop
/* 6AC00 8007A400 08004010 */  beqz       $v0, .L8007A424
/* 6AC04 8007A404 21100000 */   addu      $v0, $zero, $zero
/* 6AC08 8007A408 1E008284 */  lh         $v0, 0x1E($a0)
/* 6AC0C 8007A40C 00000000 */  nop
/* 6AC10 8007A410 02004010 */  beqz       $v0, .L8007A41C
/* 6AC14 8007A414 01000324 */   addiu     $v1, $zero, 0x1
/* 6AC18 8007A418 03000324 */  addiu      $v1, $zero, 0x3
.L8007A41C:
/* 6AC1C 8007A41C 0800E003 */  jr         $ra
/* 6AC20 8007A420 21106000 */   addu      $v0, $v1, $zero
.L8007A424:
/* 6AC24 8007A424 0800E003 */  jr         $ra
/* 6AC28 8007A428 00000000 */   nop
.size SoulReaverQuery, . - SoulReaverQuery
