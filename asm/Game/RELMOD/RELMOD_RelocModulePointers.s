.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RELMOD_RelocModulePointers
/* 6D488 8007CC88 0000C38C */  lw         $v1, 0x0($a2)
/* 6D48C 8007CC8C FFFF0224 */  addiu      $v0, $zero, -0x1
/* 6D490 8007CC90 35006210 */  beq        $v1, $v0, .L8007CD68
/* 6D494 8007CC94 FCFF0E24 */   addiu     $t6, $zero, -0x4
/* 6D498 8007CC98 01000D24 */  addiu      $t5, $zero, 0x1
/* 6D49C 8007CC9C 02000C24 */  addiu      $t4, $zero, 0x2
/* 6D4A0 8007CCA0 03000B24 */  addiu      $t3, $zero, 0x3
/* 6D4A4 8007CCA4 00800A34 */  ori        $t2, $zero, 0x8000
/* 6D4A8 8007CCA8 23108500 */  subu       $v0, $a0, $a1
/* 6D4AC 8007CCAC 00110200 */  sll        $v0, $v0, 4
/* 6D4B0 8007CCB0 82490200 */  srl        $t1, $v0, 6
/* 6D4B4 8007CCB4 00110400 */  sll        $v0, $a0, 4
/* 6D4B8 8007CCB8 82410200 */  srl        $t0, $v0, 6
/* 6D4BC 8007CCBC 0000C38C */  lw         $v1, 0x0($a2)
/* 6D4C0 8007CCC0 0400C624 */  addiu      $a2, $a2, 0x4
.L8007CCC4:
/* 6D4C4 8007CCC4 24106E00 */  and        $v0, $v1, $t6
/* 6D4C8 8007CCC8 03006330 */  andi       $v1, $v1, 0x3
/* 6D4CC 8007CCCC 11006D10 */  beq        $v1, $t5, .L8007CD14
/* 6D4D0 8007CCD0 21388200 */   addu      $a3, $a0, $v0
/* 6D4D4 8007CCD4 02006228 */  slti       $v0, $v1, 0x2
/* 6D4D8 8007CCD8 05004010 */  beqz       $v0, .L8007CCF0
/* 6D4DC 8007CCDC 00000000 */   nop
/* 6D4E0 8007CCE0 09006010 */  beqz       $v1, .L8007CD08
/* 6D4E4 8007CCE4 00000000 */   nop
/* 6D4E8 8007CCE8 56F30108 */  j          .L8007CD58
/* 6D4EC 8007CCEC 00000000 */   nop
.L8007CCF0:
/* 6D4F0 8007CCF0 0F006C10 */  beq        $v1, $t4, .L8007CD30
/* 6D4F4 8007CCF4 00000000 */   nop
/* 6D4F8 8007CCF8 12006B10 */  beq        $v1, $t3, .L8007CD44
/* 6D4FC 8007CCFC 00000000 */   nop
/* 6D500 8007CD00 56F30108 */  j          .L8007CD58
/* 6D504 8007CD04 00000000 */   nop
.L8007CD08:
/* 6D508 8007CD08 0000E28C */  lw         $v0, 0x0($a3)
/* 6D50C 8007CD0C 55F30108 */  j          .L8007CD54
/* 6D510 8007CD10 21104500 */   addu      $v0, $v0, $a1
.L8007CD14:
/* 6D514 8007CD14 0000C28C */  lw         $v0, 0x0($a2)
/* 6D518 8007CD18 0400C624 */  addiu      $a2, $a2, 0x4
/* 6D51C 8007CD1C 21108200 */  addu       $v0, $a0, $v0
/* 6D520 8007CD20 21104A00 */  addu       $v0, $v0, $t2
/* 6D524 8007CD24 03140200 */  sra        $v0, $v0, 16
/* 6D528 8007CD28 56F30108 */  j          .L8007CD58
/* 6D52C 8007CD2C 0000E2A4 */   sh        $v0, 0x0($a3)
.L8007CD30:
/* 6D530 8007CD30 0000E294 */  lhu        $v0, 0x0($a3)
/* 6D534 8007CD34 00000000 */  nop
/* 6D538 8007CD38 21104500 */  addu       $v0, $v0, $a1
/* 6D53C 8007CD3C 56F30108 */  j          .L8007CD58
/* 6D540 8007CD40 0000E2A4 */   sh        $v0, 0x0($a3)
.L8007CD44:
/* 6D544 8007CD44 0000E28C */  lw         $v0, 0x0($a3)
/* 6D548 8007CD48 00000000 */  nop
/* 6D54C 8007CD4C 23104900 */  subu       $v0, $v0, $t1
/* 6D550 8007CD50 21104800 */  addu       $v0, $v0, $t0
.L8007CD54:
/* 6D554 8007CD54 0000E2AC */  sw         $v0, 0x0($a3)
.L8007CD58:
/* 6D558 8007CD58 0000C38C */  lw         $v1, 0x0($a2)
/* 6D55C 8007CD5C FFFF0224 */  addiu      $v0, $zero, -0x1
/* 6D560 8007CD60 D8FF6214 */  bne        $v1, $v0, .L8007CCC4
/* 6D564 8007CD64 0400C624 */   addiu     $a2, $a2, 0x4
.L8007CD68:
/* 6D568 8007CD68 0800E003 */  jr         $ra
/* 6D56C 8007CD6C 00000000 */   nop
.size RELMOD_RelocModulePointers, . - RELMOD_RelocModulePointers
