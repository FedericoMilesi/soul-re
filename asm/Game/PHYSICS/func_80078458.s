.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_80078458
/* 68C58 80078458 2400048E */  lw         $a0, 0x24($s0)
/* 68C5C 8007845C 10004232 */  andi       $v0, $s2, 0x10
/* 68C60 80078460 0B004010 */  beqz       $v0, .L80078490
/* 68C64 80078464 0000F68E */   lw        $s6, 0x0($s7)
/* 68C68 80078468 00000000 */  nop
/* 68C6C 8007846C 4800D68E */  lw         $s6, 0x48($s6)
/* 68C70 80078470 02000286 */  lh         $v0, 0x2($s0)
/* 68C74 80078474 00000000 */  nop
/* 68C78 80078478 80100200 */  sll        $v0, $v0, 2
/* 68C7C 8007847C 20B0C202 */  add        $s6, $s6, $v0 # handwritten instruction
/* 68C80 80078480 1000D686 */  lh         $s6, 0x10($s6)
/* 68C84 80078484 3800E28E */  lw         $v0, 0x38($s7)
/* 68C88 80078488 00000000 */  nop
/* 68C8C 8007848C 22B05600 */  sub        $s6, $v0, $s6 # handwritten instruction
.L80078490:
/* 68C90 80078490 04004232 */  andi       $v0, $s2, 0x4
/* 68C94 80078494 04009424 */  addiu      $s4, $a0, 0x4
/* 68C98 80078498 0000958C */  lw         $s5, 0x0($a0)
/* 68C9C 8007849C 2800098E */  lw         $t1, 0x28($s0)
/* 68CA0 800784A0 0000FE8E */  lw         $fp, 0x0($s7)
/* 68CA4 800784A4 00000000 */  nop
/* 68CA8 800784A8 4000C38F */  lw         $v1, 0x40($fp)
/* 68CAC 800784AC 1C00DE8F */  lw         $fp, 0x1C($fp)
/* 68CB0 800784B0 D0004010 */  beqz       $v0, .L800787F4
/* 68CB4 800784B4 2C00088E */   lw        $t0, 0x2C($s0)
/* 68CB8 800784B8 94002011 */  beqz       $t1, .L8007870C
/* 68CBC 800784BC 0D80023C */   lui       $v0, (0x800D3360 >> 16)
/* 68CC0 800784C0 60334234 */  ori        $v0, $v0, (0x800D3360 & 0xFFFF)
/* 68CC4 800784C4 0800478C */  lw         $a3, 0x8($v0)
/* 68CC8 800784C8 00000000 */  nop
/* 68CCC 800784CC 02340700 */  srl        $a2, $a3, 16
/* 68CD0 800784D0 FFFFE730 */  andi       $a3, $a3, 0xFFFF
/* 68CD4 800784D4 E8030224 */  addiu      $v0, $zero, 0x3E8
/* 68CD8 800784D8 1200E210 */  beq        $a3, $v0, .L80078524
/* 68CDC 800784DC 00000000 */   nop
/* 68CE0 800784E0 003B0700 */  sll        $a3, $a3, 12
/* 68CE4 800784E4 1B00E200 */  divu       $zero, $a3, $v0
/* 68CE8 800784E8 02004014 */  bnez       $v0, .L800784F4
/* 68CEC 800784EC 00000000 */   nop
/* 68CF0 800784F0 0D000700 */  break      7
.L800784F4:
/* 68CF4 800784F4 12380000 */  mflo       $a3
/* 68CF8 800784F8 00000000 */  nop
/* 68CFC 800784FC 0200E014 */  bnez       $a3, .L80078508
/* 68D00 80078500 00000000 */   nop
/* 68D04 80078504 01000724 */  addiu      $a3, $zero, 0x1
.L80078508:
/* 68D08 80078508 0300C010 */  beqz       $a2, .L80078518
/* 68D0C 8007850C 00000000 */   nop
/* 68D10 80078510 00100224 */  addiu      $v0, $zero, 0x1000
/* 68D14 80078514 22384700 */  sub        $a3, $v0, $a3 # handwritten instruction
.L80078518:
/* 68D18 80078518 21306000 */  addu       $a2, $v1, $zero
/* 68D1C 8007851C 05000104 */  bgez       $zero, .L80078534
/* 68D20 80078520 00000000 */   nop
.L80078524:
/* 68D24 80078524 21380000 */  addu       $a3, $zero, $zero
/* 68D28 80078528 0200C010 */  beqz       $a2, .L80078534
/* 68D2C 8007852C 00000000 */   nop
/* 68D30 80078530 21306000 */  addu       $a2, $v1, $zero
.L80078534:
/* 68D34 80078534 02000A85 */  lh         $t2, 0x2($t0)
/* 68D38 80078538 00000285 */  lh         $v0, 0x0($t0)
/* 68D3C 8007853C 20505301 */  add        $t2, $t2, $s3 # handwritten instruction
/* 68D40 80078540 2A085501 */  slt        $at, $t2, $s5
/* 68D44 80078544 02002014 */  bnez       $at, .L80078550
/* 68D48 80078548 40580200 */   sll       $t3, $v0, 1
/* 68D4C 8007854C 22505501 */  sub        $t2, $t2, $s5 # handwritten instruction
.L80078550:
/* 68D50 80078550 20586201 */  add        $t3, $t3, $v0 # handwritten instruction
/* 68D54 80078554 80580B00 */  sll        $t3, $t3, 2
/* 68D58 80078558 20587E01 */  add        $t3, $t3, $fp # handwritten instruction
/* 68D5C 8007855C 2E00E010 */  beqz       $a3, .L80078618
/* 68D60 80078560 00000000 */   nop
/* 68D64 80078564 40100200 */  sll        $v0, $v0, 1
/* 68D68 80078568 20104600 */  add        $v0, $v0, $a2 # handwritten instruction
/* 68D6C 8007856C 00004E84 */  lh         $t6, 0x0($v0)
/* 68D70 80078570 00000000 */  nop
/* 68D74 80078574 1F00CC31 */  andi       $t4, $t6, 0x1F
/* 68D78 80078578 C0600C00 */  sll        $t4, $t4, 3
/* 68D7C 8007857C E003CD31 */  andi       $t5, $t6, 0x3E0
/* 68D80 80078580 82680D00 */  srl        $t5, $t5, 2
/* 68D84 80078584 007CCE31 */  andi       $t6, $t6, 0x7C00
/* 68D88 80078588 C2710E00 */  srl        $t6, $t6, 7
/* 68D8C 8007858C 06007985 */  lh         $t9, 0x6($t3)
/* 68D90 80078590 00408748 */  mtc2       $a3, $8 # handwritten instruction
/* 68D94 80078594 1F002F33 */  andi       $t7, $t9, 0x1F
/* 68D98 80078598 C0780F00 */  sll        $t7, $t7, 3
/* 68D9C 8007859C E0033833 */  andi       $t8, $t9, 0x3E0
/* 68DA0 800785A0 82C01800 */  srl        $t8, $t8, 2
/* 68DA4 800785A4 007C3933 */  andi       $t9, $t9, 0x7C00
/* 68DA8 800785A8 C2C91900 */  srl        $t9, $t9, 7
/* 68DAC 800785AC 22608F01 */  sub        $t4, $t4, $t7 # handwritten instruction
/* 68DB0 800785B0 00610C00 */  sll        $t4, $t4, 4
/* 68DB4 800785B4 00488C48 */  mtc2       $t4, $9 # handwritten instruction
/* 68DB8 800785B8 2268B801 */  sub        $t5, $t5, $t8 # handwritten instruction
/* 68DBC 800785BC 00690D00 */  sll        $t5, $t5, 4
/* 68DC0 800785C0 00508D48 */  mtc2       $t5, $10 # handwritten instruction
/* 68DC4 800785C4 2270D901 */  sub        $t6, $t6, $t9 # handwritten instruction
/* 68DC8 800785C8 00710E00 */  sll        $t6, $t6, 4
/* 68DCC 800785CC 00588E48 */  mtc2       $t6, $11 # handwritten instruction
/* 68DD0 800785D0 00790F00 */  sll        $t7, $t7, 4
/* 68DD4 800785D4 00C88F48 */  mtc2       $t7, $25 # handwritten instruction
/* 68DD8 800785D8 00C11800 */  sll        $t8, $t8, 4
/* 68DDC 800785DC 00D09848 */  mtc2       $t8, $26 # handwritten instruction
/* 68DE0 800785E0 00C91900 */  sll        $t9, $t9, 4
/* 68DE4 800785E4 00D89948 */  mtc2       $t9, $27 # handwritten instruction
/* 68DE8 800785E8 00000000 */  nop
/* 68DEC 800785EC 00000000 */  nop
/* 68DF0 800785F0 3E00A84B */  GPL        1
/* 68DF4 800785F4 00B00C48 */  mfc2       $t4, $22 # handwritten instruction
/* 68DF8 800785F8 00000000 */  nop
/* 68DFC 800785FC 026A0C00 */  srl        $t5, $t4, 8
/* 68E00 80078600 FF00AD31 */  andi       $t5, $t5, 0xFF
/* 68E04 80078604 02740C00 */  srl        $t6, $t4, 16
/* 68E08 80078608 FF00CE31 */  andi       $t6, $t6, 0xFF
/* 68E0C 8007860C FF008C31 */  andi       $t4, $t4, 0xFF
/* 68E10 80078610 0E000104 */  bgez       $zero, .L8007864C
/* 68E14 80078614 00000000 */   nop
.L80078618:
/* 68E18 80078618 0400C010 */  beqz       $a2, .L8007862C
/* 68E1C 8007861C 40100200 */   sll       $v0, $v0, 1
/* 68E20 80078620 20104600 */  add        $v0, $v0, $a2 # handwritten instruction
/* 68E24 80078624 02000104 */  bgez       $zero, .L80078630
/* 68E28 80078628 00004E84 */   lh        $t6, 0x0($v0)
.L8007862C:
/* 68E2C 8007862C 06006E85 */  lh         $t6, 0x6($t3)
.L80078630:
/* 68E30 80078630 00000000 */  nop
/* 68E34 80078634 1F00CC31 */  andi       $t4, $t6, 0x1F
/* 68E38 80078638 C0600C00 */  sll        $t4, $t4, 3
/* 68E3C 8007863C E003CD31 */  andi       $t5, $t6, 0x3E0
/* 68E40 80078640 82680D00 */  srl        $t5, $t5, 2
/* 68E44 80078644 007CCE31 */  andi       $t6, $t6, 0x7C00
/* 68E48 80078648 C2710E00 */  srl        $t6, $t6, 7
.L8007864C:
/* 68E4C 8007864C 40100A00 */  sll        $v0, $t2, 1
/* 68E50 80078650 20104A00 */  add        $v0, $v0, $t2 # handwritten instruction
/* 68E54 80078654 20508202 */  add        $t2, $s4, $v0 # handwritten instruction
/* 68E58 80078658 00004F81 */  lb         $t7, 0x0($t2)
/* 68E5C 8007865C 01005881 */  lb         $t8, 0x1($t2)
/* 68E60 80078660 02005981 */  lb         $t9, 0x2($t2)
/* 68E64 80078664 10004232 */  andi       $v0, $s2, 0x10
/* 68E68 80078668 08004010 */  beqz       $v0, .L8007868C
/* 68E6C 8007866C 04006385 */   lh        $v1, 0x4($t3)
/* 68E70 80078670 00000000 */  nop
/* 68E74 80078674 2A08C302 */  slt        $at, $s6, $v1
/* 68E78 80078678 04002010 */  beqz       $at, .L8007868C
/* 68E7C 8007867C 00000000 */   nop
/* 68E80 80078680 21780000 */  addu       $t7, $zero, $zero
/* 68E84 80078684 21C00000 */  addu       $t8, $zero, $zero
/* 68E88 80078688 21C80000 */  addu       $t9, $zero, $zero
.L8007868C:
/* 68E8C 8007868C 0700C010 */  beqz       $a2, .L800786AC
/* 68E90 80078690 00010224 */   addiu     $v0, $zero, 0x100
/* 68E94 80078694 0500E014 */  bnez       $a3, .L800786AC
/* 68E98 80078698 24104202 */   and       $v0, $s2, $v0
/* 68E9C 8007869C 03004010 */  beqz       $v0, .L800786AC
/* 68EA0 800786A0 2110E001 */   addu      $v0, $t7, $zero
/* 68EA4 800786A4 21782003 */  addu       $t7, $t9, $zero
/* 68EA8 800786A8 21C84000 */  addu       $t9, $v0, $zero
.L800786AC:
/* 68EAC 800786AC 20608F01 */  add        $t4, $t4, $t7 # handwritten instruction
/* 68EB0 800786B0 00FF8F31 */  andi       $t7, $t4, 0xFF00
/* 68EB4 800786B4 0400E011 */  beqz       $t7, .L800786C8
/* 68EB8 800786B8 2068B801 */   add       $t5, $t5, $t8 # handwritten instruction
/* 68EBC 800786BC 02008105 */  bgez       $t4, .L800786C8
/* 68EC0 800786C0 FF000C20 */   addi      $t4, $zero, 0xFF # handwritten instruction
/* 68EC4 800786C4 21600000 */  addu       $t4, $zero, $zero
.L800786C8:
/* 68EC8 800786C8 00FFB831 */  andi       $t8, $t5, 0xFF00
/* 68ECC 800786CC 04000013 */  beqz       $t8, .L800786E0
/* 68ED0 800786D0 2070D901 */   add       $t6, $t6, $t9 # handwritten instruction
/* 68ED4 800786D4 0200A105 */  bgez       $t5, .L800786E0
/* 68ED8 800786D8 FF000D20 */   addi      $t5, $zero, 0xFF # handwritten instruction
/* 68EDC 800786DC 21680000 */  addu       $t5, $zero, $zero
.L800786E0:
/* 68EE0 800786E0 00FFD931 */  andi       $t9, $t6, 0xFF00
/* 68EE4 800786E4 04002013 */  beqz       $t9, .L800786F8
/* 68EE8 800786E8 08006CA1 */   sb        $t4, 0x8($t3)
/* 68EEC 800786EC 0200C105 */  bgez       $t6, .L800786F8
/* 68EF0 800786F0 FF000E20 */   addi      $t6, $zero, 0xFF # handwritten instruction
/* 68EF4 800786F4 21700000 */  addu       $t6, $zero, $zero
.L800786F8:
/* 68EF8 800786F8 09006DA1 */  sb         $t5, 0x9($t3)
/* 68EFC 800786FC 0A006EA1 */  sb         $t6, 0xA($t3)
/* 68F00 80078700 FFFF2921 */  addi       $t1, $t1, -0x1 # handwritten instruction
/* 68F04 80078704 8BFF2015 */  bnez       $t1, .L80078534
/* 68F08 80078708 04000821 */   addi      $t0, $t0, 0x4 # handwritten instruction
.L8007870C:
/* 68F0C 8007870C 3000098E */  lw         $t1, 0x30($s0)
/* 68F10 80078710 00000000 */  nop
/* 68F14 80078714 8C002011 */  beqz       $t1, .L80078948
/* 68F18 80078718 3400088E */   lw        $t0, 0x34($s0)
.L8007871C:
/* 68F1C 8007871C 00000000 */  nop
/* 68F20 80078720 02001485 */  lh         $s4, 0x2($t0)
/* 68F24 80078724 04001585 */  lh         $s5, 0x4($t0)
/* 68F28 80078728 40101400 */  sll        $v0, $s4, 1
/* 68F2C 8007872C 20A08202 */  add        $s4, $s4, $v0 # handwritten instruction
/* 68F30 80078730 80A01400 */  sll        $s4, $s4, 2
/* 68F34 80078734 20A09E02 */  add        $s4, $s4, $fp # handwritten instruction
/* 68F38 80078738 40101500 */  sll        $v0, $s5, 1
/* 68F3C 8007873C 20A8A202 */  add        $s5, $s5, $v0 # handwritten instruction
/* 68F40 80078740 80A81500 */  sll        $s5, $s5, 2
/* 68F44 80078744 20A8BE02 */  add        $s5, $s5, $fp # handwritten instruction
/* 68F48 80078748 08008C8E */  lw         $t4, 0x8($s4)
/* 68F4C 8007874C 0800AF8E */  lw         $t7, 0x8($s5)
/* 68F50 80078750 00720C00 */  sll        $t6, $t4, 8
/* 68F54 80078754 02760E00 */  srl        $t6, $t6, 24
/* 68F58 80078758 006C0C00 */  sll        $t5, $t4, 16
/* 68F5C 8007875C 026E0D00 */  srl        $t5, $t5, 24
/* 68F60 80078760 FF008C31 */  andi       $t4, $t4, 0xFF
/* 68F64 80078764 06000285 */  lh         $v0, 0x6($t0)
/* 68F68 80078768 00CA0F00 */  sll        $t9, $t7, 8
/* 68F6C 8007876C 02CE1900 */  srl        $t9, $t9, 24
/* 68F70 80078770 00C40F00 */  sll        $t8, $t7, 16
/* 68F74 80078774 02C61800 */  srl        $t8, $t8, 24
/* 68F78 80078778 FF00EF31 */  andi       $t7, $t7, 0xFF
/* 68F7C 8007877C 2278EC01 */  sub        $t7, $t7, $t4 # handwritten instruction
/* 68F80 80078780 22C00D03 */  sub        $t8, $t8, $t5 # handwritten instruction
/* 68F84 80078784 22C82E03 */  sub        $t9, $t9, $t6 # handwritten instruction
/* 68F88 80078788 00408248 */  mtc2       $v0, $8 # handwritten instruction
/* 68F8C 8007878C 00488F48 */  mtc2       $t7, $9 # handwritten instruction
/* 68F90 80078790 00509848 */  mtc2       $t8, $10 # handwritten instruction
/* 68F94 80078794 00589948 */  mtc2       $t9, $11 # handwritten instruction
/* 68F98 80078798 00000000 */  nop
/* 68F9C 8007879C 00000000 */  nop
/* 68FA0 800787A0 3D00984B */  GPF        1
/* 68FA4 800787A4 00000B85 */  lh         $t3, 0x0($t0)
/* 68FA8 800787A8 00000000 */  nop
/* 68FAC 800787AC 40100B00 */  sll        $v0, $t3, 1
/* 68FB0 800787B0 20586201 */  add        $t3, $t3, $v0 # handwritten instruction
/* 68FB4 800787B4 80580B00 */  sll        $t3, $t3, 2
/* 68FB8 800787B8 20587E01 */  add        $t3, $t3, $fp # handwritten instruction
/* 68FBC 800787BC 00480F48 */  mfc2       $t7, $9 # handwritten instruction
/* 68FC0 800787C0 00501848 */  mfc2       $t8, $10 # handwritten instruction
/* 68FC4 800787C4 00581948 */  mfc2       $t9, $11 # handwritten instruction
/* 68FC8 800787C8 20608F01 */  add        $t4, $t4, $t7 # handwritten instruction
/* 68FCC 800787CC 2068B801 */  add        $t5, $t5, $t8 # handwritten instruction
/* 68FD0 800787D0 2070D901 */  add        $t6, $t6, $t9 # handwritten instruction
/* 68FD4 800787D4 08006CA1 */  sb         $t4, 0x8($t3)
/* 68FD8 800787D8 09006DA1 */  sb         $t5, 0x9($t3)
/* 68FDC 800787DC 0A006EA1 */  sb         $t6, 0xA($t3)
/* 68FE0 800787E0 FFFF2921 */  addi       $t1, $t1, -0x1 # handwritten instruction
/* 68FE4 800787E4 CDFF2015 */  bnez       $t1, .L8007871C
/* 68FE8 800787E8 08000821 */   addi      $t0, $t0, 0x8 # handwritten instruction
/* 68FEC 800787EC 56000104 */  bgez       $zero, .L80078948
/* 68FF0 800787F0 00000000 */   nop
.L800787F4:
/* 68FF4 800787F4 08004232 */  andi       $v0, $s2, 0x8
/* 68FF8 800787F8 53004010 */  beqz       $v0, .L80078948
/* 68FFC 800787FC 00000000 */   nop
/* 69000 80078800 1D002011 */  beqz       $t1, .L80078878
.L80078804:
/* 69004 80078804 08000A85 */   lh        $t2, 0x8($t0)
/* 69008 80078808 00000B85 */  lh         $t3, 0x0($t0)
/* 6900C 8007880C 20505301 */  add        $t2, $t2, $s3 # handwritten instruction
/* 69010 80078810 2A085501 */  slt        $at, $t2, $s5
/* 69014 80078814 02002014 */  bnez       $at, .L80078820
/* 69018 80078818 40100B00 */   sll       $v0, $t3, 1
/* 6901C 8007881C 22505501 */  sub        $t2, $t2, $s5 # handwritten instruction
.L80078820:
/* 69020 80078820 02000C85 */  lh         $t4, 0x2($t0)
/* 69024 80078824 04000D85 */  lh         $t5, 0x4($t0)
/* 69028 80078828 06000E85 */  lh         $t6, 0x6($t0)
/* 6902C 8007882C 20586201 */  add        $t3, $t3, $v0 # handwritten instruction
/* 69030 80078830 80580B00 */  sll        $t3, $t3, 2
/* 69034 80078834 20587E01 */  add        $t3, $t3, $fp # handwritten instruction
/* 69038 80078838 80100A00 */  sll        $v0, $t2, 2
/* 6903C 8007883C 40500A00 */  sll        $t2, $t2, 1
/* 69040 80078840 20104A00 */  add        $v0, $v0, $t2 # handwritten instruction
/* 69044 80078844 20508202 */  add        $t2, $s4, $v0 # handwritten instruction
/* 69048 80078848 00004F85 */  lh         $t7, 0x0($t2)
/* 6904C 8007884C 02005885 */  lh         $t8, 0x2($t2)
/* 69050 80078850 04005985 */  lh         $t9, 0x4($t2)
/* 69054 80078854 20608F01 */  add        $t4, $t4, $t7 # handwritten instruction
/* 69058 80078858 2068B801 */  add        $t5, $t5, $t8 # handwritten instruction
/* 6905C 8007885C 2070D901 */  add        $t6, $t6, $t9 # handwritten instruction
/* 69060 80078860 00006CA5 */  sh         $t4, 0x0($t3)
/* 69064 80078864 02006DA5 */  sh         $t5, 0x2($t3)
/* 69068 80078868 04006EA5 */  sh         $t6, 0x4($t3)
/* 6906C 8007886C FFFF2921 */  addi       $t1, $t1, -0x1 # handwritten instruction
/* 69070 80078870 E4FF2015 */  bnez       $t1, .L80078804
/* 69074 80078874 0A000821 */   addi      $t0, $t0, 0xA # handwritten instruction
.L80078878:
/* 69078 80078878 3000098E */  lw         $t1, 0x30($s0)
/* 6907C 8007887C 00000000 */  nop
/* 69080 80078880 31002011 */  beqz       $t1, .L80078948
/* 69084 80078884 3400088E */   lw        $t0, 0x34($s0)
.L80078888:
/* 69088 80078888 00000000 */  nop
/* 6908C 8007888C 02001485 */  lh         $s4, 0x2($t0)
/* 69090 80078890 04001585 */  lh         $s5, 0x4($t0)
/* 69094 80078894 40101400 */  sll        $v0, $s4, 1
/* 69098 80078898 20A08202 */  add        $s4, $s4, $v0 # handwritten instruction
/* 6909C 8007889C 80A01400 */  sll        $s4, $s4, 2
/* 690A0 800788A0 20A09E02 */  add        $s4, $s4, $fp # handwritten instruction
/* 690A4 800788A4 40101500 */  sll        $v0, $s5, 1
/* 690A8 800788A8 20A8A202 */  add        $s5, $s5, $v0 # handwritten instruction
/* 690AC 800788AC 80A81500 */  sll        $s5, $s5, 2
/* 690B0 800788B0 20A8BE02 */  add        $s5, $s5, $fp # handwritten instruction
/* 690B4 800788B4 00008C8E */  lw         $t4, 0x0($s4)
/* 690B8 800788B8 0000AF8E */  lw         $t7, 0x0($s5)
/* 690BC 800788BC 04008E86 */  lh         $t6, 0x4($s4)
/* 690C0 800788C0 0400B986 */  lh         $t9, 0x4($s5)
/* 690C4 800788C4 026C0C00 */  srl        $t5, $t4, 16
/* 690C8 800788C8 FFFF8C31 */  andi       $t4, $t4, 0xFFFF
/* 690CC 800788CC 02C40F00 */  srl        $t8, $t7, 16
/* 690D0 800788D0 FFFF3933 */  andi       $t9, $t9, 0xFFFF
/* 690D4 800788D4 06000285 */  lh         $v0, 0x6($t0)
/* 690D8 800788D8 2278EC01 */  sub        $t7, $t7, $t4 # handwritten instruction
/* 690DC 800788DC 22C00D03 */  sub        $t8, $t8, $t5 # handwritten instruction
/* 690E0 800788E0 22C82E03 */  sub        $t9, $t9, $t6 # handwritten instruction
/* 690E4 800788E4 00408248 */  mtc2       $v0, $8 # handwritten instruction
/* 690E8 800788E8 00488F48 */  mtc2       $t7, $9 # handwritten instruction
/* 690EC 800788EC 00509848 */  mtc2       $t8, $10 # handwritten instruction
/* 690F0 800788F0 00589948 */  mtc2       $t9, $11 # handwritten instruction
/* 690F4 800788F4 00000000 */  nop
/* 690F8 800788F8 00000000 */  nop
/* 690FC 800788FC 3D00984B */  GPF        1
/* 69100 80078900 00000B85 */  lh         $t3, 0x0($t0)
/* 69104 80078904 00000000 */  nop
/* 69108 80078908 40100B00 */  sll        $v0, $t3, 1
/* 6910C 8007890C 20586201 */  add        $t3, $t3, $v0 # handwritten instruction
/* 69110 80078910 80580B00 */  sll        $t3, $t3, 2
/* 69114 80078914 20587E01 */  add        $t3, $t3, $fp # handwritten instruction
/* 69118 80078918 00480F48 */  mfc2       $t7, $9 # handwritten instruction
/* 6911C 8007891C 00501848 */  mfc2       $t8, $10 # handwritten instruction
/* 69120 80078920 00581948 */  mfc2       $t9, $11 # handwritten instruction
/* 69124 80078924 20608F01 */  add        $t4, $t4, $t7 # handwritten instruction
/* 69128 80078928 2068B801 */  add        $t5, $t5, $t8 # handwritten instruction
/* 6912C 8007892C 2070D901 */  add        $t6, $t6, $t9 # handwritten instruction
/* 69130 80078930 00006CA5 */  sh         $t4, 0x0($t3)
/* 69134 80078934 02006DA5 */  sh         $t5, 0x2($t3)
/* 69138 80078938 04006EA5 */  sh         $t6, 0x4($t3)
/* 6913C 8007893C FFFF2921 */  addi       $t1, $t1, -0x1 # handwritten instruction
/* 69140 80078940 D1FF2015 */  bnez       $t1, .L80078888
/* 69144 80078944 08000821 */   addi      $t0, $t0, 0x8 # handwritten instruction
.L80078948:
/* 69148 80078948 0800E003 */  jr         $ra
/* 6914C 8007894C 00000000 */   nop
.size func_80078458, . - func_80078458
