.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FindTextInLine
/* 28E80 80038680 0000A390 */  lbu        $v1, 0x0($a1)
/* 28E84 80038684 00000000 */  nop
/* 28E88 80038688 FF006730 */  andi       $a3, $v1, 0xFF
/* 28E8C 8003868C 1A00E010 */  beqz       $a3, .L800386F8
/* 28E90 80038690 21308000 */   addu      $a2, $a0, $zero
/* 28E94 80038694 0A000224 */  addiu      $v0, $zero, 0xA
/* 28E98 80038698 1700E210 */  beq        $a3, $v0, .L800386F8
/* 28E9C 8003869C 0D000824 */   addiu     $t0, $zero, 0xD
/* 28EA0 800386A0 21384000 */  addu       $a3, $v0, $zero
.L800386A4:
/* 28EA4 800386A4 14006810 */  beq        $v1, $t0, .L800386F8
/* 28EA8 800386A8 20006334 */   ori       $v1, $v1, 0x20
/* 28EAC 800386AC 0000C290 */  lbu        $v0, 0x0($a2)
/* 28EB0 800386B0 00000000 */  nop
/* 28EB4 800386B4 20004234 */  ori        $v0, $v0, 0x20
/* 28EB8 800386B8 03006214 */  bne        $v1, $v0, .L800386C8
/* 28EBC 800386BC 0100A524 */   addiu     $a1, $a1, 0x1
/* 28EC0 800386C0 B3E10008 */  j          .L800386CC
/* 28EC4 800386C4 0100C624 */   addiu     $a2, $a2, 0x1
.L800386C8:
/* 28EC8 800386C8 21308000 */  addu       $a2, $a0, $zero
.L800386CC:
/* 28ECC 800386CC 0000C290 */  lbu        $v0, 0x0($a2)
/* 28ED0 800386D0 00000000 */  nop
/* 28ED4 800386D4 0A004010 */  beqz       $v0, .L80038700
/* 28ED8 800386D8 2110A000 */   addu      $v0, $a1, $zero
/* 28EDC 800386DC 0000A390 */  lbu        $v1, 0x0($a1)
/* 28EE0 800386E0 00000000 */  nop
/* 28EE4 800386E4 FF006230 */  andi       $v0, $v1, 0xFF
/* 28EE8 800386E8 03004010 */  beqz       $v0, .L800386F8
/* 28EEC 800386EC 00000000 */   nop
/* 28EF0 800386F0 ECFF4714 */  bne        $v0, $a3, .L800386A4
/* 28EF4 800386F4 00000000 */   nop
.L800386F8:
/* 28EF8 800386F8 0800E003 */  jr         $ra
/* 28EFC 800386FC 21100000 */   addu      $v0, $zero, $zero
.L80038700:
/* 28F00 80038700 0800E003 */  jr         $ra
/* 28F04 80038704 00000000 */   nop
.size FindTextInLine, . - FindTextInLine
