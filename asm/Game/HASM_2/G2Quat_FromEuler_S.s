.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel G2Quat_FromEuler_S
/* 6A58C 80079D8C 0000A884 */  lh         $t0, 0x0($a1)
/* 6A590 80079D90 0200AA84 */  lh         $t2, 0x2($a1)
/* 6A594 80079D94 0400AC84 */  lh         $t4, 0x4($a1)
/* 6A598 80079D98 0600A584 */  lh         $a1, 0x6($a1)
/* 6A59C 80079D9C 0C80183C */  lui        $t8, (0x800CABF4 >> 16)
/* 6A5A0 80079DA0 F4AB1837 */  ori        $t8, $t8, (0x800CABF4 & 0xFFFF)
/* 6A5A4 80079DA4 0100A230 */  andi       $v0, $a1, 0x1
/* 6A5A8 80079DA8 03004010 */  beqz       $v0, .L80079DB8
/* 6A5AC 80079DAC 21180001 */   addu      $v1, $t0, $zero
/* 6A5B0 80079DB0 21408001 */  addu       $t0, $t4, $zero
/* 6A5B4 80079DB4 21606000 */  addu       $t4, $v1, $zero
.L80079DB8:
/* 6A5B8 80079DB8 0400A230 */  andi       $v0, $a1, 0x4
/* 6A5BC 80079DBC 02004010 */  beqz       $v0, .L80079DC8
/* 6A5C0 80079DC0 43400800 */   sra       $t0, $t0, 1
/* 6A5C4 80079DC4 22500A00 */  neg        $t2, $t2 # handwritten instruction
.L80079DC8:
/* 6A5C8 80079DC8 43500A00 */  sra        $t2, $t2, 1
/* 6A5CC 80079DCC 43600C00 */  sra        $t4, $t4, 1
/* 6A5D0 80079DD0 FF070931 */  andi       $t1, $t0, 0x7FF
/* 6A5D4 80079DD4 40480900 */  sll        $t1, $t1, 1
/* 6A5D8 80079DD8 21483801 */  addu       $t1, $t1, $t8
/* 6A5DC 80079DDC 00080B31 */  andi       $t3, $t0, 0x800
/* 6A5E0 80079DE0 00002885 */  lh         $t0, 0x0($t1)
/* 6A5E4 80079DE4 00082985 */  lh         $t1, 0x800($t1)
/* 6A5E8 80079DE8 03006011 */  beqz       $t3, .L80079DF8
/* 6A5EC 80079DEC 00000000 */   nop
/* 6A5F0 80079DF0 22400800 */  neg        $t0, $t0 # handwritten instruction
/* 6A5F4 80079DF4 22480900 */  neg        $t1, $t1 # handwritten instruction
.L80079DF8:
/* 6A5F8 80079DF8 FF074B31 */  andi       $t3, $t2, 0x7FF
/* 6A5FC 80079DFC 40580B00 */  sll        $t3, $t3, 1
/* 6A600 80079E00 21587801 */  addu       $t3, $t3, $t8
/* 6A604 80079E04 00084D31 */  andi       $t5, $t2, 0x800
/* 6A608 80079E08 00006A85 */  lh         $t2, 0x0($t3)
/* 6A60C 80079E0C 00086B85 */  lh         $t3, 0x800($t3)
/* 6A610 80079E10 0300A011 */  beqz       $t5, .L80079E20
/* 6A614 80079E14 00000000 */   nop
/* 6A618 80079E18 22500A00 */  neg        $t2, $t2 # handwritten instruction
/* 6A61C 80079E1C 22580B00 */  neg        $t3, $t3 # handwritten instruction
.L80079E20:
/* 6A620 80079E20 FF078D31 */  andi       $t5, $t4, 0x7FF
/* 6A624 80079E24 40680D00 */  sll        $t5, $t5, 1
/* 6A628 80079E28 2168B801 */  addu       $t5, $t5, $t8
/* 6A62C 80079E2C 00089831 */  andi       $t8, $t4, 0x800
/* 6A630 80079E30 0000AC85 */  lh         $t4, 0x0($t5)
/* 6A634 80079E34 0008AD85 */  lh         $t5, 0x800($t5)
/* 6A638 80079E38 03000013 */  beqz       $t8, .L80079E48
/* 6A63C 80079E3C 00000000 */   nop
/* 6A640 80079E40 22600C00 */  neg        $t4, $t4 # handwritten instruction
/* 6A644 80079E44 22680D00 */  neg        $t5, $t5 # handwritten instruction
.L80079E48:
/* 6A648 80079E48 00408948 */  mtc2       $t1, $8 # handwritten instruction
/* 6A64C 80079E4C 00488D48 */  mtc2       $t5, $9 # handwritten instruction
/* 6A650 80079E50 00508C48 */  mtc2       $t4, $10 # handwritten instruction
/* 6A654 80079E54 00000000 */  nop
/* 6A658 80079E58 00000000 */  nop
/* 6A65C 80079E5C 3D00984B */  GPF        1
/* 6A660 80079E60 00480E48 */  mfc2       $t6, $9 # handwritten instruction
/* 6A664 80079E64 00500F48 */  mfc2       $t7, $10 # handwritten instruction
/* 6A668 80079E68 00408848 */  mtc2       $t0, $8 # handwritten instruction
/* 6A66C 80079E6C 00488D48 */  mtc2       $t5, $9 # handwritten instruction
/* 6A670 80079E70 00508C48 */  mtc2       $t4, $10 # handwritten instruction
/* 6A674 80079E74 00000000 */  nop
/* 6A678 80079E78 00000000 */  nop
/* 6A67C 80079E7C 3D00984B */  GPF        1
/* 6A680 80079E80 1800A330 */  andi       $v1, $a1, 0x18
/* 6A684 80079E84 83180300 */  sra        $v1, $v1, 2
/* 6A688 80079E88 0200A230 */  andi       $v0, $a1, 0x2
/* 6A68C 80079E8C 00481848 */  mfc2       $t8, $9 # handwritten instruction
/* 6A690 80079E90 00501948 */  mfc2       $t9, $10 # handwritten instruction
/* 6A694 80079E94 22004010 */  beqz       $v0, .L80079F20
/* 6A698 80079E98 2040F801 */   add       $t0, $t7, $t8 # handwritten instruction
/* 6A69C 80079E9C 2268D901 */  sub        $t5, $t6, $t9 # handwritten instruction
/* 6A6A0 80079EA0 00408B48 */  mtc2       $t3, $8 # handwritten instruction
/* 6A6A4 80079EA4 00488848 */  mtc2       $t0, $9 # handwritten instruction
/* 6A6A8 80079EA8 00508D48 */  mtc2       $t5, $10 # handwritten instruction
/* 6A6AC 80079EAC 00000000 */  nop
/* 6A6B0 80079EB0 00000000 */  nop
/* 6A6B4 80079EB4 3D00984B */  GPF        1
/* 6A6B8 80079EB8 0400A530 */  andi       $a1, $a1, 0x4
/* 6A6BC 80079EBC 43280500 */  sra        $a1, $a1, 1
/* 6A6C0 80079EC0 2048D901 */  add        $t1, $t6, $t9 # handwritten instruction
/* 6A6C4 80079EC4 2260F801 */  sub        $t4, $t7, $t8 # handwritten instruction
/* 6A6C8 80079EC8 00480848 */  mfc2       $t0, $9 # handwritten instruction
/* 6A6CC 80079ECC 00500D48 */  mfc2       $t5, $10 # handwritten instruction
/* 6A6D0 80079ED0 00408A48 */  mtc2       $t2, $8 # handwritten instruction
/* 6A6D4 80079ED4 00488948 */  mtc2       $t1, $9 # handwritten instruction
/* 6A6D8 80079ED8 00508C48 */  mtc2       $t4, $10 # handwritten instruction
/* 6A6DC 80079EDC 00000000 */  nop
/* 6A6E0 80079EE0 00000000 */  nop
/* 6A6E4 80079EE4 3D00984B */  GPF        1
/* 6A6E8 80079EE8 20C06500 */  add        $t8, $v1, $a1 # handwritten instruction
/* 6A6EC 80079EEC 02001823 */  addi       $t8, $t8, 0x2 # handwritten instruction
/* 6A6F0 80079EF0 0500012B */  slti       $at, $t8, 0x5
/* 6A6F4 80079EF4 02002014 */  bnez       $at, .L80079F00
/* 6A6F8 80079EF8 22C86500 */   sub       $t9, $v1, $a1 # handwritten instruction
/* 6A6FC 80079EFC FAFF1823 */  addi       $t8, $t8, -0x6 # handwritten instruction
.L80079F00:
/* 6A700 80079F00 04003923 */  addi       $t9, $t9, 0x4 # handwritten instruction
/* 6A704 80079F04 0500212B */  slti       $at, $t9, 0x5
/* 6A708 80079F08 02002014 */  bnez       $at, .L80079F14
/* 6A70C 80079F0C 00480948 */   mfc2      $t1, $9 # handwritten instruction
/* 6A710 80079F10 FAFF3923 */  addi       $t9, $t9, -0x6 # handwritten instruction
.L80079F14:
/* 6A714 80079F14 00500C48 */  mfc2       $t4, $10 # handwritten instruction
/* 6A718 80079F18 2B000104 */  bgez       $zero, .L80079FC8
/* 6A71C 80079F1C 00000000 */   nop
.L80079F20:
/* 6A720 80079F20 00408B48 */  mtc2       $t3, $8 # handwritten instruction
/* 6A724 80079F24 00489848 */  mtc2       $t8, $9 # handwritten instruction
/* 6A728 80079F28 00509948 */  mtc2       $t9, $10 # handwritten instruction
/* 6A72C 80079F2C 00588F48 */  mtc2       $t7, $11 # handwritten instruction
/* 6A730 80079F30 18006E01 */  mult       $t3, $t6
/* 6A734 80079F34 00000000 */  nop
/* 6A738 80079F38 3D00904B */  GPF        0
/* 6A73C 80079F3C 0400A530 */  andi       $a1, $a1, 0x4
/* 6A740 80079F40 43280500 */  sra        $a1, $a1, 1
/* 6A744 80079F44 00C80848 */  mfc2       $t0, $25 # handwritten instruction
/* 6A748 80079F48 00D00948 */  mfc2       $t1, $26 # handwritten instruction
/* 6A74C 80079F4C 00D80C48 */  mfc2       $t4, $27 # handwritten instruction
/* 6A750 80079F50 12680000 */  mflo       $t5
/* 6A754 80079F54 00408A48 */  mtc2       $t2, $8 # handwritten instruction
/* 6A758 80079F58 00488F48 */  mtc2       $t7, $9 # handwritten instruction
/* 6A75C 80079F5C 00508E48 */  mtc2       $t6, $10 # handwritten instruction
/* 6A760 80079F60 00589848 */  mtc2       $t8, $11 # handwritten instruction
/* 6A764 80079F64 18005901 */  mult       $t2, $t9
/* 6A768 80079F68 00000000 */  nop
/* 6A76C 80079F6C 3D00904B */  GPF        0
/* 6A770 80079F70 20C06500 */  add        $t8, $v1, $a1 # handwritten instruction
/* 6A774 80079F74 02001823 */  addi       $t8, $t8, 0x2 # handwritten instruction
/* 6A778 80079F78 0500012B */  slti       $at, $t8, 0x5
/* 6A77C 80079F7C 02002014 */  bnez       $at, .L80079F88
/* 6A780 80079F80 22C86500 */   sub       $t9, $v1, $a1 # handwritten instruction
/* 6A784 80079F84 FAFF1823 */  addi       $t8, $t8, -0x6 # handwritten instruction
.L80079F88:
/* 6A788 80079F88 04003923 */  addi       $t9, $t9, 0x4 # handwritten instruction
/* 6A78C 80079F8C 0500212B */  slti       $at, $t9, 0x5
/* 6A790 80079F90 02002014 */  bnez       $at, .L80079F9C
/* 6A794 80079F94 00C80A48 */   mfc2      $t2, $25 # handwritten instruction
/* 6A798 80079F98 FAFF3923 */  addi       $t9, $t9, -0x6 # handwritten instruction
.L80079F9C:
/* 6A79C 80079F9C 00D00B48 */  mfc2       $t3, $26 # handwritten instruction
/* 6A7A0 80079FA0 00D80E48 */  mfc2       $t6, $27 # handwritten instruction
/* 6A7A4 80079FA4 12780000 */  mflo       $t7
/* 6A7A8 80079FA8 22400A01 */  sub        $t0, $t0, $t2 # handwritten instruction
/* 6A7AC 80079FAC 20482B01 */  add        $t1, $t1, $t3 # handwritten instruction
/* 6A7B0 80079FB0 22608E01 */  sub        $t4, $t4, $t6 # handwritten instruction
/* 6A7B4 80079FB4 2068AF01 */  add        $t5, $t5, $t7 # handwritten instruction
/* 6A7B8 80079FB8 03430800 */  sra        $t0, $t0, 12
/* 6A7BC 80079FBC 034B0900 */  sra        $t1, $t1, 12
/* 6A7C0 80079FC0 03630C00 */  sra        $t4, $t4, 12
/* 6A7C4 80079FC4 036B0D00 */  sra        $t5, $t5, 12
.L80079FC8:
/* 6A7C8 80079FC8 20186400 */  add        $v1, $v1, $a0 # handwritten instruction
/* 6A7CC 80079FCC 20C00403 */  add        $t8, $t8, $a0 # handwritten instruction
/* 6A7D0 80079FD0 0200A010 */  beqz       $a1, .L80079FDC
/* 6A7D4 80079FD4 20C82403 */   add       $t9, $t9, $a0 # handwritten instruction
/* 6A7D8 80079FD8 22480900 */  neg        $t1, $t1 # handwritten instruction
.L80079FDC:
/* 6A7DC 80079FDC 000068A4 */  sh         $t0, 0x0($v1)
/* 6A7E0 80079FE0 000009A7 */  sh         $t1, 0x0($t8)
/* 6A7E4 80079FE4 00002CA7 */  sh         $t4, 0x0($t9)
/* 6A7E8 80079FE8 0800E003 */  jr         $ra
/* 6A7EC 80079FEC 06008DA4 */   sh        $t5, 0x6($a0)
.size G2Quat_FromEuler_S, . - G2Quat_FromEuler_S
