.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_80025E2C
/* 1662C 80025E2C 00F85848 */  cfc2       $t8, $31 # handwritten instruction
/* 16630 80025E30 00000000 */  nop
/* 16634 80025E34 0600404B */  NCLIP
/* 16638 80025E38 0080033C */  lui        $v1, (0x80008000 >> 16)
/* 1663C 80025E3C F0000F3C */  lui        $t7, (0xF00200 >> 16)
/* 16640 80025E40 00806334 */  ori        $v1, $v1, (0x80008000 & 0xFFFF)
/* 16644 80025E44 0002EF35 */  ori        $t7, $t7, (0xF00200 & 0xFFFF)
/* 16648 80025E48 00600448 */  mfc2       $a0, $12 # handwritten instruction
/* 1664C 80025E4C 00680D48 */  mfc2       $t5, $13 # handwritten instruction
/* 16650 80025E50 24108300 */  and        $v0, $a0, $v1
/* 16654 80025E54 00701948 */  mfc2       $t9, $14 # handwritten instruction
/* 16658 80025E58 2410A201 */  and        $v0, $t5, $v0
/* 1665C 80025E5C 24102203 */  and        $v0, $t9, $v0
/* 16660 80025E60 65004014 */  bnez       $v0, .L80025FF8
/* 16664 80025E64 2320E401 */   subu      $a0, $t7, $a0
/* 16668 80025E68 24108300 */  and        $v0, $a0, $v1
/* 1666C 80025E6C 2368ED01 */  subu       $t5, $t7, $t5
/* 16670 80025E70 2410A201 */  and        $v0, $t5, $v0
/* 16674 80025E74 23C8F901 */  subu       $t9, $t7, $t9
/* 16678 80025E78 24102203 */  and        $v0, $t9, $v0
/* 1667C 80025E7C 5E004014 */  bnez       $v0, .L80025FF8
/* 16680 80025E80 00000000 */   nop
/* 16684 80025E84 24101203 */  and        $v0, $t8, $s2
/* 16688 80025E88 CBFF4014 */  bnez       $v0, func_80025DB8
/* 1668C 80025E8C 00000000 */   nop
/* 16690 80025E90 00C00248 */  mfc2       $v0, $24 # handwritten instruction
/* 16694 80025E94 00000000 */  nop
/* 16698 80025E98 59004104 */  bgez       $v0, .L80026000
/* 1669C 80025E9C 00000000 */   nop
/* 166A0 80025EA0 00880448 */  mfc2       $a0, $17 # handwritten instruction
/* 166A4 80025EA4 00900348 */  mfc2       $v1, $18 # handwritten instruction
/* 166A8 80025EA8 00980D48 */  mfc2       $t5, $19 # handwritten instruction
/* 166AC 80025EAC 2A106400 */  slt        $v0, $v1, $a0
/* 166B0 80025EB0 02004014 */  bnez       $v0, .L80025EBC
/* 166B4 80025EB4 00000000 */   nop
/* 166B8 80025EB8 21206000 */  addu       $a0, $v1, $zero
.L80025EBC:
/* 166BC 80025EBC 2A108D00 */  slt        $v0, $a0, $t5
/* 166C0 80025EC0 02004014 */  bnez       $v0, .L80025ECC
/* 166C4 80025EC4 00000000 */   nop
/* 166C8 80025EC8 21688000 */  addu       $t5, $a0, $zero
.L80025ECC:
/* 166CC 80025ECC C8008281 */  lb         $v0, 0xC8($t4)
/* 166D0 80025ED0 FCFFA631 */  andi       $a2, $t5, 0xFFFC
/* 166D4 80025ED4 00110200 */  sll        $v0, $v0, 4
/* 166D8 80025ED8 2130C200 */  addu       $a2, $a2, $v0
/* 166DC 80025EDC 0030C228 */  slti       $v0, $a2, 0x3000
/* 166E0 80025EE0 45004010 */  beqz       $v0, .L80025FF8
/* 166E4 80025EE4 A000C228 */   slti      $v0, $a2, 0xA0
/* 166E8 80025EE8 43004014 */  bnez       $v0, .L80025FF8
/* 166EC 80025EEC 00000000 */   nop
/* 166F0 80025EF0 00600D48 */  mfc2       $t5, $12 # handwritten instruction
/* 166F4 80025EF4 00680F48 */  mfc2       $t7, $13 # handwritten instruction
/* 166F8 80025EF8 00701948 */  mfc2       $t9, $14 # handwritten instruction
/* 166FC 80025EFC 2A00F84A */  DPCT
/* 16700 80025F00 2120D400 */  addu       $a0, $a2, $s4
/* 16704 80025F04 03140D00 */  sra        $v0, $t5, 16
/* 16708 80025F08 031C0F00 */  sra        $v1, $t7, 16
/* 1670C 80025F0C 033C1900 */  sra        $a3, $t9, 16
/* 16710 80025F10 22C04300 */  sub        $t8, $v0, $v1 # handwritten instruction
/* 16714 80025F14 2270E300 */  sub        $t6, $a3, $v1 # handwritten instruction
/* 16718 80025F18 22184700 */  sub        $v1, $v0, $a3 # handwritten instruction
/* 1671C 80025F1C 01FE0124 */  addiu      $at, $zero, -0x1FF
/* 16720 80025F20 2A080103 */  slt        $at, $t8, $at
/* 16724 80025F24 A4FF2014 */  bnez       $at, func_80025DB8
/* 16728 80025F28 006C0D00 */   sll       $t5, $t5, 16
/* 1672C 80025F2C 0002012B */  slti       $at, $t8, 0x200
/* 16730 80025F30 A1FF2010 */  beqz       $at, func_80025DB8
/* 16734 80025F34 007C0F00 */   sll       $t7, $t7, 16
/* 16738 80025F38 01FE0124 */  addiu      $at, $zero, -0x1FF
/* 1673C 80025F3C 2A086100 */  slt        $at, $v1, $at
/* 16740 80025F40 9DFF2014 */  bnez       $at, func_80025DB8
/* 16744 80025F44 00CC1900 */   sll       $t9, $t9, 16
/* 16748 80025F48 00026128 */  slti       $at, $v1, 0x200
/* 1674C 80025F4C 9AFF2010 */  beqz       $at, func_80025DB8
/* 16750 80025F50 036C0D00 */   sra       $t5, $t5, 16
/* 16754 80025F54 01FE0124 */  addiu      $at, $zero, -0x1FF
/* 16758 80025F58 2A08C101 */  slt        $at, $t6, $at
/* 1675C 80025F5C 96FF2014 */  bnez       $at, func_80025DB8
/* 16760 80025F60 037C0F00 */   sra       $t7, $t7, 16
/* 16764 80025F64 0002C129 */  slti       $at, $t6, 0x200
/* 16768 80025F68 93FF2010 */  beqz       $at, func_80025DB8
/* 1676C 80025F6C 03CC1900 */   sra       $t9, $t9, 16
/* 16770 80025F70 22C0AF01 */  sub        $t8, $t5, $t7 # handwritten instruction
/* 16774 80025F74 01FC0124 */  addiu      $at, $zero, -0x3FF
/* 16778 80025F78 2A080103 */  slt        $at, $t8, $at
/* 1677C 80025F7C 8EFF2014 */  bnez       $at, func_80025DB8
/* 16780 80025F80 2218B901 */   sub       $v1, $t5, $t9 # handwritten instruction
/* 16784 80025F84 0004012B */  slti       $at, $t8, 0x400
/* 16788 80025F88 8BFF2010 */  beqz       $at, func_80025DB8
/* 1678C 80025F8C 22702F03 */   sub       $t6, $t9, $t7 # handwritten instruction
/* 16790 80025F90 01FC0124 */  addiu      $at, $zero, -0x3FF
/* 16794 80025F94 2A086100 */  slt        $at, $v1, $at
/* 16798 80025F98 87FF2014 */  bnez       $at, func_80025DB8
/* 1679C 80025F9C 00000000 */   nop
/* 167A0 80025FA0 00046128 */  slti       $at, $v1, 0x400
/* 167A4 80025FA4 84FF2010 */  beqz       $at, func_80025DB8
/* 167A8 80025FA8 00000000 */   nop
/* 167AC 80025FAC 01FC0124 */  addiu      $at, $zero, -0x3FF
/* 167B0 80025FB0 2A08C101 */  slt        $at, $t6, $at
/* 167B4 80025FB4 80FF2014 */  bnez       $at, func_80025DB8
/* 167B8 80025FB8 00000000 */   nop
/* 167BC 80025FBC 0004C129 */  slti       $at, $t6, 0x400
/* 167C0 80025FC0 7DFF2010 */  beqz       $at, func_80025DB8
/* 167C4 80025FC4 00000000 */   nop
/* 167C8 80025FC8 0000828C */  lw         $v0, 0x0($a0)
/* 167CC 80025FCC 24180501 */  and        $v1, $t0, $a1
/* 167D0 80025FD0 000083AC */  sw         $v1, 0x0($a0)
/* 167D4 80025FD4 25105300 */  or         $v0, $v0, $s3
/* 167D8 80025FD8 000002AD */  sw         $v0, 0x0($t0)
/* 167DC 80025FDC 08000CE9 */  swc2       $12, 0x8($t0)
/* 167E0 80025FE0 14000DE9 */  swc2       $13, 0x14($t0)
/* 167E4 80025FE4 20000EE9 */  swc2       $14, 0x20($t0)
/* 167E8 80025FE8 040014E9 */  swc2       $20, 0x4($t0)
/* 167EC 80025FEC 100015E9 */  swc2       $21, 0x10($t0)
/* 167F0 80025FF0 1C0016E9 */  swc2       $22, 0x1C($t0)
/* 167F4 80025FF4 28000825 */  addiu      $t0, $t0, 0x28
.L80025FF8:
/* 167F8 80025FF8 0800E003 */  jr         $ra
/* 167FC 80025FFC 24104000 */   and       $v0, $v0, $zero
.L80026000:
/* 16800 80026000 0800E003 */  jr         $ra
/* 16804 80026004 01000238 */   xori      $v0, $zero, 0x1
.size func_80025E2C, . - func_80025E2C
