.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C3E58
/* B4658 800C3E58 E9008290 */  lbu        $v0, 0xE9($a0)
/* B465C 800C3E5C 00000000 */  nop
/* B4660 800C3E60 2B004010 */  beqz       $v0, .L800C3F10
/* B4664 800C3E64 21400000 */   addu      $t0, $zero, $zero
/* B4668 800C3E68 FF000B24 */  addiu      $t3, $zero, 0xFF
/* B466C 800C3E6C 21500000 */  addu       $t2, $zero, $zero
.L800C3E70:
/* B4670 800C3E70 2000858C */  lw         $a1, 0x20($a0)
/* B4674 800C3E74 21380000 */  addu       $a3, $zero, $zero
/* B4678 800C3E78 05000324 */  addiu      $v1, $zero, 0x5
.L800C3E7C:
/* B467C 800C3E7C 0000A290 */  lbu        $v0, 0x0($a1)
/* B4680 800C3E80 00000000 */  nop
/* B4684 800C3E84 02004814 */  bne        $v0, $t0, .L800C3E90
/* B4688 800C3E88 0100A524 */   addiu     $a1, $a1, 0x1
/* B468C 800C3E8C 0100E724 */  addiu      $a3, $a3, 0x1
.L800C3E90:
/* B4690 800C3E90 FFFF6324 */  addiu      $v1, $v1, -0x1
/* B4694 800C3E94 F9FF6104 */  bgez       $v1, .L800C3E7C
/* B4698 800C3E98 00000000 */   nop
/* B469C 800C3E9C 0400828C */  lw         $v0, 0x4($a0)
/* B46A0 800C3EA0 00000000 */  nop
/* B46A4 800C3EA4 21104201 */  addu       $v0, $t2, $v0
/* B46A8 800C3EA8 02004990 */  lbu        $t1, 0x2($v0)
/* B46AC 800C3EAC 2000858C */  lw         $a1, 0x20($a0)
/* B46B0 800C3EB0 02002015 */  bnez       $t1, .L800C3EBC
/* B46B4 800C3EB4 21180000 */   addu      $v1, $zero, $zero
/* B46B8 800C3EB8 01000924 */  addiu      $t1, $zero, 0x1
.L800C3EBC:
/* B46BC 800C3EBC 21308000 */  addu       $a2, $a0, $zero
.L800C3EC0:
/* B46C0 800C3EC0 0000A290 */  lbu        $v0, 0x0($a1)
/* B46C4 800C3EC4 00000000 */  nop
/* B46C8 800C3EC8 08004814 */  bne        $v0, $t0, .L800C3EEC
/* B46CC 800C3ECC 0100A524 */   addiu     $a1, $a1, 0x1
/* B46D0 800C3ED0 2A10E900 */  slt        $v0, $a3, $t1
/* B46D4 800C3ED4 04004010 */  beqz       $v0, .L800C3EE8
/* B46D8 800C3ED8 00000000 */   nop
/* B46DC 800C3EDC 5D00CBA0 */  sb         $t3, 0x5D($a2)
/* B46E0 800C3EE0 BB0F0308 */  j          .L800C3EEC
/* B46E4 800C3EE4 FFFFE724 */   addiu     $a3, $a3, -0x1
.L800C3EE8:
/* B46E8 800C3EE8 5D00C8A0 */  sb         $t0, 0x5D($a2)
.L800C3EEC:
/* B46EC 800C3EEC 01006324 */  addiu      $v1, $v1, 0x1
/* B46F0 800C3EF0 06006228 */  slti       $v0, $v1, 0x6
/* B46F4 800C3EF4 F2FF4014 */  bnez       $v0, .L800C3EC0
/* B46F8 800C3EF8 0100C624 */   addiu     $a2, $a2, 0x1
/* B46FC 800C3EFC E9008290 */  lbu        $v0, 0xE9($a0)
/* B4700 800C3F00 01000825 */  addiu      $t0, $t0, 0x1
/* B4704 800C3F04 2A100201 */  slt        $v0, $t0, $v0
/* B4708 800C3F08 D9FF4014 */  bnez       $v0, .L800C3E70
/* B470C 800C3F0C 05004A25 */   addiu     $t2, $t2, 0x5
.L800C3F10:
/* B4710 800C3F10 FE000224 */  addiu      $v0, $zero, 0xFE
/* B4714 800C3F14 460082A0 */  sb         $v0, 0x46($a0)
/* B4718 800C3F18 0800E003 */  jr         $ra
/* B471C 800C3F1C 21100000 */   addu      $v0, $zero, $zero
.size func_800C3E58, . - func_800C3E58
