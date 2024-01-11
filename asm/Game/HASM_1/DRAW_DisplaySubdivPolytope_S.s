.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel DRAW_DisplaySubdivPolytope_S
/* 16DFC 800265FC 801F0C3C */  lui        $t4, (0x1F800088 >> 16)
/* 16E00 80026600 A8009FAD */  sw         $ra, (0x1F8000A8 & 0xFFFF)($t4)
/* 16E04 80026604 14009EAD */  sw         $fp, (0x1F800014 & 0xFFFF)($t4)
/* 16E08 80026608 A40097AD */  sw         $s7, (0x1F8000A4 & 0xFFFF)($t4)
/* 16E0C 8002660C A00096AD */  sw         $s6, (0x1F8000A0 & 0xFFFF)($t4)
/* 16E10 80026610 9C0095AD */  sw         $s5, (0x1F80009C & 0xFFFF)($t4)
/* 16E14 80026614 980094AD */  sw         $s4, (0x1F800098 & 0xFFFF)($t4)
/* 16E18 80026618 940093AD */  sw         $s3, (0x1F800094 & 0xFFFF)($t4)
/* 16E1C 8002661C 900092AD */  sw         $s2, (0x1F800090 & 0xFFFF)($t4)
/* 16E20 80026620 8C0091AD */  sw         $s1, (0x1F80008C & 0xFFFF)($t4)
/* 16E24 80026624 880090AD */  sw         $s0, (0x1F800088 & 0xFFFF)($t4)
/* 16E28 80026628 AC0080AD */  sw         $zero, (0x1F8000AC & 0xFFFF)($t4)
/* 16E2C 8002662C 0000828C */  lw         $v0, 0x0($a0)
/* 16E30 80026630 1C00B58C */  lw         $s5, 0x1C($a1)
/* 16E34 80026634 0C004384 */  lh         $v1, 0xC($v0)
/* 16E38 80026638 0800518C */  lw         $s1, 0x8($v0)
/* 16E3C 8002663C F0016010 */  beqz       $v1, .L80026E00
/* 16E40 80026640 80100300 */   sll       $v0, $v1, 2
/* 16E44 80026644 C0B00300 */  sll        $s6, $v1, 3
/* 16E48 80026648 21B05600 */  addu       $s6, $v0, $s6
/* 16E4C 8002664C 21B0D102 */  addu       $s6, $s6, $s1
/* 16E50 80026650 3400BE8C */  lw         $fp, 0x34($a1)
/* 16E54 80026654 0009133C */  lui        $s3, (0x9000000 >> 16)
/* 16E58 80026658 FF00053C */  lui        $a1, (0xFFFFFF >> 16)
/* 16E5C 8002665C FFFFA534 */  ori        $a1, $a1, (0xFFFFFF & 0xFFFF)
.L80026660:
/* 16E60 80026660 0400228E */  lw         $v0, 0x4($s1)
/* 16E64 80026664 0000388E */  lw         $t8, 0x0($s1)
/* 16E68 80026668 03740200 */  sra        $t6, $v0, 16
/* 16E6C 8002666C 0400C731 */  andi       $a3, $t6, 0x4
/* 16E70 80026670 D601E014 */  bnez       $a3, .L80026DCC
/* 16E74 80026674 FFFF4630 */   andi      $a2, $v0, 0xFFFF
/* 16E78 80026678 FFFF0733 */  andi       $a3, $t8, 0xFFFF
/* 16E7C 8002667C 80780700 */  sll        $t7, $a3, 2
/* 16E80 80026680 C0380700 */  sll        $a3, $a3, 3
/* 16E84 80026684 2138EF00 */  addu       $a3, $a3, $t7
/* 16E88 80026688 2138A702 */  addu       $a3, $s5, $a3
/* 16E8C 8002668C 0000E0C8 */  lwc2       $0, 0x0($a3)
/* 16E90 80026690 0400E1C8 */  lwc2       $1, 0x4($a3)
/* 16E94 80026694 02241800 */  srl        $a0, $t8, 16
/* 16E98 80026698 00000000 */  nop
/* 16E9C 8002669C 0100184A */  RTPS
/* 16EA0 800266A0 80780400 */  sll        $t7, $a0, 2
/* 16EA4 800266A4 C0200400 */  sll        $a0, $a0, 3
/* 16EA8 800266A8 21208F00 */  addu       $a0, $a0, $t7
/* 16EAC 800266AC 2120A402 */  addu       $a0, $s5, $a0
/* 16EB0 800266B0 00008F8C */  lw         $t7, 0x0($a0)
/* 16EB4 800266B4 0400988C */  lw         $t8, 0x4($a0)
/* 16EB8 800266B8 BC0088E9 */  swc2       $8, (0x1F8000BC & 0xFFFF)($t4)
/* 16EBC 800266BC 00008F48 */  mtc2       $t7, $0 # handwritten instruction
/* 16EC0 800266C0 00089848 */  mtc2       $t8, $1 # handwritten instruction
/* 16EC4 800266C4 80780600 */  sll        $t7, $a2, 2
/* 16EC8 800266C8 00F85248 */  cfc2       $s2, $31 # handwritten instruction
/* 16ECC 800266CC 0100184A */  RTPS
/* 16ED0 800266D0 C0300600 */  sll        $a2, $a2, 3
/* 16ED4 800266D4 2130CF00 */  addu       $a2, $a2, $t7
/* 16ED8 800266D8 2130A602 */  addu       $a2, $s5, $a2
/* 16EDC 800266DC 0000CF8C */  lw         $t7, 0x0($a2)
/* 16EE0 800266E0 0400D88C */  lw         $t8, 0x4($a2)
/* 16EE4 800266E4 C00088E9 */  swc2       $8, (0x1F8000C0 & 0xFFFF)($t4)
/* 16EE8 800266E8 00008F48 */  mtc2       $t7, $0 # handwritten instruction
/* 16EEC 800266EC 00089848 */  mtc2       $t8, $1 # handwritten instruction
/* 16EF0 800266F0 00F84248 */  cfc2       $v0, $31 # handwritten instruction
/* 16EF4 800266F4 00000000 */  nop
/* 16EF8 800266F8 0100184A */  RTPS
/* 16EFC 800266FC 25904202 */  or         $s2, $s2, $v0
/* 16F00 80026700 0A003086 */  lh         $s0, 0xA($s1)
/* 16F04 80026704 00000000 */  nop
/* 16F08 80026708 20801E02 */  add        $s0, $s0, $fp # handwritten instruction
/* 16F0C 8002670C 00000F8E */  lw         $t7, 0x0($s0)
/* 16F10 80026710 0400178E */  lw         $s7, 0x4($s0)
/* 16F14 80026714 0800038E */  lw         $v1, 0x8($s0)
/* 16F18 80026718 00F84248 */  cfc2       $v0, $31 # handwritten instruction
/* 16F1C 8002671C C40088E9 */  swc2       $8, (0x1F8000C4 & 0xFFFF)($t4)
/* 16F20 80026720 25904202 */  or         $s2, $s2, $v0
/* 16F24 80026724 0600404B */  NCLIP
/* 16F28 80026728 0C000FAD */  sw         $t7, 0xC($t0)
/* 16F2C 8002672C 180017AD */  sw         $s7, 0x18($t0)
/* 16F30 80026730 240003AD */  sw         $v1, 0x24($t0)
/* 16F34 80026734 D80083AD */  sw         $v1, (0x1F8000D8 & 0xFFFF)($t4)
/* 16F38 80026738 00C00248 */  mfc2       $v0, $24 # handwritten instruction
/* 16F3C 8002673C 00000000 */  nop
/* 16F40 80026740 13004004 */  bltz       $v0, .L80026790
/* 16F44 80026744 00000000 */   nop
/* 16F48 80026748 0200013C */  lui        $at, (0x26000 >> 16)
/* 16F4C 8002674C 00602134 */  ori        $at, $at, (0x26000 & 0xFFFF)
/* 16F50 80026750 24784102 */  and        $t7, $s2, $at
/* 16F54 80026754 9D01E011 */  beqz       $t7, .L80026DCC
/* 16F58 80026758 00601224 */   addiu     $s2, $zero, 0x6000
/* 16F5C 8002675C 00880D48 */  mfc2       $t5, $17 # handwritten instruction
/* 16F60 80026760 00901848 */  mfc2       $t8, $18 # handwritten instruction
/* 16F64 80026764 00981948 */  mfc2       $t9, $19 # handwritten instruction
/* 16F68 80026768 0108A129 */  slti       $at, $t5, 0x801
/* 16F6C 8002676C 97012010 */  beqz       $at, .L80026DCC
/* 16F70 80026770 A000A229 */   slti      $v0, $t5, 0xA0
/* 16F74 80026774 06004010 */  beqz       $v0, .L80026790
/* 16F78 80026778 A000022B */   slti      $v0, $t8, 0xA0
/* 16F7C 8002677C 04004010 */  beqz       $v0, .L80026790
/* 16F80 80026780 A000222B */   slti      $v0, $t9, 0xA0
/* 16F84 80026784 02004010 */  beqz       $v0, .L80026790
/* 16F88 80026788 00000000 */   nop
/* 16F8C 8002678C 8F010104 */  bgez       $zero, .L80026DCC
.L80026790:
/* 16F90 80026790 0080193C */   lui       $t9, (0x80008000 >> 16)
/* 16F94 80026794 00600948 */  mfc2       $t1, $12 # handwritten instruction
/* 16F98 80026798 00803937 */  ori        $t9, $t9, (0x80008000 & 0xFFFF)
/* 16F9C 8002679C 00680A48 */  mfc2       $t2, $13 # handwritten instruction
/* 16FA0 800267A0 00700B48 */  mfc2       $t3, $14 # handwritten instruction
/* 16FA4 800267A4 24103901 */  and        $v0, $t1, $t9
/* 16FA8 800267A8 24104201 */  and        $v0, $t2, $v0
/* 16FAC 800267AC 24106201 */  and        $v0, $t3, $v0
/* 16FB0 800267B0 86014014 */  bnez       $v0, .L80026DCC
/* 16FB4 800267B4 F0000F3C */   lui       $t7, (0xF00200 >> 16)
/* 16FB8 800267B8 0002EF35 */  ori        $t7, $t7, (0xF00200 & 0xFFFF)
/* 16FBC 800267BC 23C0E901 */  subu       $t8, $t7, $t1
/* 16FC0 800267C0 24101903 */  and        $v0, $t8, $t9
/* 16FC4 800267C4 2368EA01 */  subu       $t5, $t7, $t2
/* 16FC8 800267C8 2410A201 */  and        $v0, $t5, $v0
/* 16FCC 800267CC 23C8EB01 */  subu       $t9, $t7, $t3
/* 16FD0 800267D0 24102203 */  and        $v0, $t9, $v0
/* 16FD4 800267D4 7D014014 */  bnez       $v0, .L80026DCC
/* 16FD8 800267D8 0800CD8C */   lw        $t5, 0x8($a2)
/* 16FDC 800267DC 0800998C */  lw         $t9, 0x8($a0)
/* 16FE0 800267E0 0800F88C */  lw         $t8, 0x8($a3)
/* 16FE4 800267E4 84008DAD */  sw         $t5, (0x1F800084 & 0xFFFF)($t4)
/* 16FE8 800267E8 800099AD */  sw         $t9, (0x1F800080 & 0xFFFF)($t4)
/* 16FEC 800267EC 7C0098AD */  sw         $t8, (0x1F80007C & 0xFFFF)($t4)
/* 16FF0 800267F0 18008F8D */  lw         $t7, (0x1F800018 & 0xFFFF)($t4)
/* 16FF4 800267F4 00000000 */  nop
/* 16FF8 800267F8 9A00E011 */  beqz       $t7, .L80026A64
/* 16FFC 800267FC 0000EF8C */   lw        $t7, 0x0($a3)
/* 17000 80026800 1C00828D */  lw         $v0, (0x1F80001C & 0xFFFF)($t4)
/* 17004 80026804 C40088E9 */  swc2       $8, (0x1F8000C4 & 0xFFFF)($t4)
/* 17008 80026808 006C0F00 */  sll        $t5, $t7, 16
/* 1700C 8002680C 036C0D00 */  sra        $t5, $t5, 16
/* 17010 80026810 2268A201 */  sub        $t5, $t5, $v0 # handwritten instruction
/* 17014 80026814 2000998D */  lw         $t9, (0x1F800020 & 0xFFFF)($t4)
/* 17018 80026818 037C0F00 */  sra        $t7, $t7, 16
/* 1701C 8002681C 0200A105 */  bgez       $t5, .L80026828
/* 17020 80026820 2278F901 */   sub       $t7, $t7, $t9 # handwritten instruction
/* 17024 80026824 22680D00 */  sub        $t5, $zero, $t5 # handwritten instruction
.L80026828:
/* 17028 80026828 0200E105 */  bgez       $t7, .L80026834
/* 1702C 8002682C 2400998D */   lw        $t9, (0x1F800024 & 0xFFFF)($t4)
/* 17030 80026830 22780F00 */  sub        $t7, $zero, $t7 # handwritten instruction
.L80026834:
/* 17034 80026834 2A08AF01 */  slt        $at, $t5, $t7
/* 17038 80026838 02002014 */  bnez       $at, .L80026844
/* 1703C 8002683C 1800828D */   lw        $v0, (0x1F800018 & 0xFFFF)($t4)
/* 17040 80026840 2178A001 */  addu       $t7, $t5, $zero
.L80026844:
/* 17044 80026844 0400ED84 */  lh         $t5, 0x4($a3)
/* 17048 80026848 00000000 */  nop
/* 1704C 8002684C 22C8B901 */  sub        $t9, $t5, $t9 # handwritten instruction
/* 17050 80026850 02002107 */  bgez       $t9, .L8002685C
/* 17054 80026854 10004D84 */   lh        $t5, 0x10($v0)
/* 17058 80026858 22C81900 */  sub        $t9, $zero, $t9 # handwritten instruction
.L8002685C:
/* 1705C 8002685C 2A082F03 */  slt        $at, $t9, $t7
/* 17060 80026860 02002014 */  bnez       $at, .L8002686C
/* 17064 80026864 00000000 */   nop
/* 17068 80026868 21782003 */  addu       $t7, $t9, $zero
.L8002686C:
/* 1706C 8002686C 2A08ED01 */  slt        $at, $t7, $t5
/* 17070 80026870 15002010 */  beqz       $at, .L800268C8
/* 17074 80026874 2278AF01 */   sub       $t7, $t5, $t7 # handwritten instruction
/* 17078 80026878 040049C8 */  lwc2       $9, 0x4($v0)
/* 1707C 8002687C 08004AC8 */  lwc2       $10, 0x8($v0)
/* 17080 80026880 0C004BC8 */  lwc2       $11, 0xC($v0)
/* 17084 80026884 00790F00 */  sll        $t7, $t7, 4
/* 17088 80026888 00408F48 */  mtc2       $t7, $8 # handwritten instruction
/* 1708C 8002688C 00309848 */  mtc2       $t8, $6 # handwritten instruction
/* 17090 80026890 24780503 */  and        $t7, $t8, $a1
/* 17094 80026894 FF00ED31 */  andi       $t5, $t7, 0xFF
/* 17098 80026898 00690D00 */  sll        $t5, $t5, 4
/* 1709C 8002689C 00C88D48 */  mtc2       $t5, $25 # handwritten instruction
/* 170A0 800268A0 00FFED31 */  andi       $t5, $t7, 0xFF00
/* 170A4 800268A4 02690D00 */  srl        $t5, $t5, 4
/* 170A8 800268A8 00D08D48 */  mtc2       $t5, $26 # handwritten instruction
/* 170AC 800268AC 026C0F00 */  srl        $t5, $t7, 16
/* 170B0 800268B0 00690D00 */  sll        $t5, $t5, 4
/* 170B4 800268B4 00D88D48 */  mtc2       $t5, $27 # handwritten instruction
/* 170B8 800268B8 00000000 */  nop
/* 170BC 800268BC 00000000 */  nop
/* 170C0 800268C0 3E00A84B */  GPL        1
/* 170C4 800268C4 7C0096E9 */  swc2       $22, (0x1F80007C & 0xFFFF)($t4)
.L800268C8:
/* 170C8 800268C8 8000988D */  lw         $t8, (0x1F800080 & 0xFFFF)($t4)
/* 170CC 800268CC 00008F8C */  lw         $t7, 0x0($a0)
/* 170D0 800268D0 1C00828D */  lw         $v0, (0x1F80001C & 0xFFFF)($t4)
/* 170D4 800268D4 006C0F00 */  sll        $t5, $t7, 16
/* 170D8 800268D8 036C0D00 */  sra        $t5, $t5, 16
/* 170DC 800268DC 2268A201 */  sub        $t5, $t5, $v0 # handwritten instruction
/* 170E0 800268E0 2000998D */  lw         $t9, (0x1F800020 & 0xFFFF)($t4)
/* 170E4 800268E4 037C0F00 */  sra        $t7, $t7, 16
/* 170E8 800268E8 0200A105 */  bgez       $t5, .L800268F4
/* 170EC 800268EC 2278F901 */   sub       $t7, $t7, $t9 # handwritten instruction
/* 170F0 800268F0 22680D00 */  sub        $t5, $zero, $t5 # handwritten instruction
.L800268F4:
/* 170F4 800268F4 0200E105 */  bgez       $t7, .L80026900
/* 170F8 800268F8 2400998D */   lw        $t9, (0x1F800024 & 0xFFFF)($t4)
/* 170FC 800268FC 22780F00 */  sub        $t7, $zero, $t7 # handwritten instruction
.L80026900:
/* 17100 80026900 2A08AF01 */  slt        $at, $t5, $t7
/* 17104 80026904 02002014 */  bnez       $at, .L80026910
/* 17108 80026908 1800828D */   lw        $v0, (0x1F800018 & 0xFFFF)($t4)
/* 1710C 8002690C 2178A001 */  addu       $t7, $t5, $zero
.L80026910:
/* 17110 80026910 04008D84 */  lh         $t5, 0x4($a0)
/* 17114 80026914 00000000 */  nop
/* 17118 80026918 22C8B901 */  sub        $t9, $t5, $t9 # handwritten instruction
/* 1711C 8002691C 02002107 */  bgez       $t9, .L80026928
/* 17120 80026920 10004D84 */   lh        $t5, 0x10($v0)
/* 17124 80026924 22C81900 */  sub        $t9, $zero, $t9 # handwritten instruction
.L80026928:
/* 17128 80026928 2A082F03 */  slt        $at, $t9, $t7
/* 1712C 8002692C 02002014 */  bnez       $at, .L80026938
/* 17130 80026930 00000000 */   nop
/* 17134 80026934 21782003 */  addu       $t7, $t9, $zero
.L80026938:
/* 17138 80026938 2A08ED01 */  slt        $at, $t7, $t5
/* 1713C 8002693C 15002010 */  beqz       $at, .L80026994
/* 17140 80026940 2278AF01 */   sub       $t7, $t5, $t7 # handwritten instruction
/* 17144 80026944 040049C8 */  lwc2       $9, 0x4($v0)
/* 17148 80026948 08004AC8 */  lwc2       $10, 0x8($v0)
/* 1714C 8002694C 0C004BC8 */  lwc2       $11, 0xC($v0)
/* 17150 80026950 00790F00 */  sll        $t7, $t7, 4
/* 17154 80026954 00408F48 */  mtc2       $t7, $8 # handwritten instruction
/* 17158 80026958 00309848 */  mtc2       $t8, $6 # handwritten instruction
/* 1715C 8002695C 24780503 */  and        $t7, $t8, $a1
/* 17160 80026960 FF00ED31 */  andi       $t5, $t7, 0xFF
/* 17164 80026964 00690D00 */  sll        $t5, $t5, 4
/* 17168 80026968 00C88D48 */  mtc2       $t5, $25 # handwritten instruction
/* 1716C 8002696C 00FFED31 */  andi       $t5, $t7, 0xFF00
/* 17170 80026970 02690D00 */  srl        $t5, $t5, 4
/* 17174 80026974 00D08D48 */  mtc2       $t5, $26 # handwritten instruction
/* 17178 80026978 026C0F00 */  srl        $t5, $t7, 16
/* 1717C 8002697C 00690D00 */  sll        $t5, $t5, 4
/* 17180 80026980 00D88D48 */  mtc2       $t5, $27 # handwritten instruction
/* 17184 80026984 00000000 */  nop
/* 17188 80026988 00000000 */  nop
/* 1718C 8002698C 3E00A84B */  GPL        1
/* 17190 80026990 800096E9 */  swc2       $22, (0x1F800080 & 0xFFFF)($t4)
.L80026994:
/* 17194 80026994 8400988D */  lw         $t8, (0x1F800084 & 0xFFFF)($t4)
/* 17198 80026998 0000CF8C */  lw         $t7, 0x0($a2)
/* 1719C 8002699C 1C00828D */  lw         $v0, (0x1F80001C & 0xFFFF)($t4)
/* 171A0 800269A0 006C0F00 */  sll        $t5, $t7, 16
/* 171A4 800269A4 036C0D00 */  sra        $t5, $t5, 16
/* 171A8 800269A8 2268A201 */  sub        $t5, $t5, $v0 # handwritten instruction
/* 171AC 800269AC 2000998D */  lw         $t9, (0x1F800020 & 0xFFFF)($t4)
/* 171B0 800269B0 037C0F00 */  sra        $t7, $t7, 16
/* 171B4 800269B4 0200A105 */  bgez       $t5, .L800269C0
/* 171B8 800269B8 2278F901 */   sub       $t7, $t7, $t9 # handwritten instruction
/* 171BC 800269BC 22680D00 */  sub        $t5, $zero, $t5 # handwritten instruction
.L800269C0:
/* 171C0 800269C0 0200E105 */  bgez       $t7, .L800269CC
/* 171C4 800269C4 2400998D */   lw        $t9, (0x1F800024 & 0xFFFF)($t4)
/* 171C8 800269C8 22780F00 */  sub        $t7, $zero, $t7 # handwritten instruction
.L800269CC:
/* 171CC 800269CC 2A08AF01 */  slt        $at, $t5, $t7
/* 171D0 800269D0 02002014 */  bnez       $at, .L800269DC
/* 171D4 800269D4 1800828D */   lw        $v0, (0x1F800018 & 0xFFFF)($t4)
/* 171D8 800269D8 2178A001 */  addu       $t7, $t5, $zero
.L800269DC:
/* 171DC 800269DC 0400CD84 */  lh         $t5, 0x4($a2)
/* 171E0 800269E0 00000000 */  nop
/* 171E4 800269E4 22C8B901 */  sub        $t9, $t5, $t9 # handwritten instruction
/* 171E8 800269E8 02002107 */  bgez       $t9, .L800269F4
/* 171EC 800269EC 10004D84 */   lh        $t5, 0x10($v0)
/* 171F0 800269F0 22C81900 */  sub        $t9, $zero, $t9 # handwritten instruction
.L800269F4:
/* 171F4 800269F4 2A082F03 */  slt        $at, $t9, $t7
/* 171F8 800269F8 02002014 */  bnez       $at, .L80026A04
/* 171FC 800269FC 00000000 */   nop
/* 17200 80026A00 21782003 */  addu       $t7, $t9, $zero
.L80026A04:
/* 17204 80026A04 2A08ED01 */  slt        $at, $t7, $t5
/* 17208 80026A08 15002010 */  beqz       $at, .L80026A60
/* 1720C 80026A0C 2278AF01 */   sub       $t7, $t5, $t7 # handwritten instruction
/* 17210 80026A10 040049C8 */  lwc2       $9, 0x4($v0)
/* 17214 80026A14 08004AC8 */  lwc2       $10, 0x8($v0)
/* 17218 80026A18 0C004BC8 */  lwc2       $11, 0xC($v0)
/* 1721C 80026A1C 00790F00 */  sll        $t7, $t7, 4
/* 17220 80026A20 00408F48 */  mtc2       $t7, $8 # handwritten instruction
/* 17224 80026A24 00309848 */  mtc2       $t8, $6 # handwritten instruction
/* 17228 80026A28 24780503 */  and        $t7, $t8, $a1
/* 1722C 80026A2C FF00ED31 */  andi       $t5, $t7, 0xFF
/* 17230 80026A30 00690D00 */  sll        $t5, $t5, 4
/* 17234 80026A34 00C88D48 */  mtc2       $t5, $25 # handwritten instruction
/* 17238 80026A38 00FFED31 */  andi       $t5, $t7, 0xFF00
/* 1723C 80026A3C 02690D00 */  srl        $t5, $t5, 4
/* 17240 80026A40 00D08D48 */  mtc2       $t5, $26 # handwritten instruction
/* 17244 80026A44 026C0F00 */  srl        $t5, $t7, 16
/* 17248 80026A48 00690D00 */  sll        $t5, $t5, 4
/* 1724C 80026A4C 00D88D48 */  mtc2       $t5, $27 # handwritten instruction
/* 17250 80026A50 00000000 */  nop
/* 17254 80026A54 00000000 */  nop
/* 17258 80026A58 3E00A84B */  GPL        1
/* 1725C 80026A5C 840096E9 */  swc2       $22, (0x1F800084 & 0xFFFF)($t4)
.L80026A60:
/* 17260 80026A60 C40088C9 */  lwc2       $8, (0x1F8000C4 & 0xFFFF)($t4)
.L80026A64:
/* 17264 80026A64 0800C231 */  andi       $v0, $t6, 0x8
/* 17268 80026A68 0A004014 */  bnez       $v0, .L80026A94
/* 1726C 80026A6C 0200C231 */   andi      $v0, $t6, 0x2
/* 17270 80026A70 AC008F8D */  lw         $t7, (0x1F8000AC & 0xFFFF)($t4)
/* 17274 80026A74 02004010 */  beqz       $v0, .L80026A80
/* 17278 80026A78 00000000 */   nop
/* 1727C 80026A7C 62FDE015 */  bnez       $t7, .L80026008
.L80026A80:
/* 17280 80026A80 00C01948 */   mfc2      $t9, $24 # handwritten instruction
/* 17284 80026A84 00000000 */  nop
/* 17288 80026A88 204E3923 */  addi       $t9, $t9, 0x4E20 # handwritten instruction
/* 1728C 80026A8C 5EFD2007 */  bltz       $t9, .L80026008
/* 17290 80026A90 AC0099AD */   sw        $t9, (0x1F8000AC & 0xFFFF)($t4)
.L80026A94:
/* 17294 80026A94 0600183C */  lui        $t8, (0x66000 >> 16)
/* 17298 80026A98 AC0080AD */  sw         $zero, (0x1F8000AC & 0xFFFF)($t4)
/* 1729C 80026A9C 00601837 */  ori        $t8, $t8, (0x66000 & 0xFFFF)
/* 172A0 80026AA0 24905802 */  and        $s2, $s2, $t8
/* 172A4 80026AA4 58FD4016 */  bnez       $s2, .L80026008
/* 172A8 80026AA8 00000000 */   nop
/* 172AC 80026AAC AC0080AD */  sw         $zero, (0x1F8000AC & 0xFFFF)($t4)
/* 172B0 80026AB0 00881848 */  mfc2       $t8, $17 # handwritten instruction
/* 172B4 80026AB4 00901948 */  mfc2       $t9, $18 # handwritten instruction
/* 172B8 80026AB8 00980D48 */  mfc2       $t5, $19 # handwritten instruction
/* 172BC 80026ABC 2A083803 */  slt        $at, $t9, $t8
/* 172C0 80026AC0 03002014 */  bnez       $at, .L80026AD0
/* 172C4 80026AC4 21782003 */   addu      $t7, $t9, $zero
/* 172C8 80026AC8 21780003 */  addu       $t7, $t8, $zero
/* 172CC 80026ACC 21C02003 */  addu       $t8, $t9, $zero
.L80026AD0:
/* 172D0 80026AD0 2A080D03 */  slt        $at, $t8, $t5
/* 172D4 80026AD4 03002014 */  bnez       $at, .L80026AE4
/* 172D8 80026AD8 2110A001 */   addu      $v0, $t5, $zero
/* 172DC 80026ADC 21680003 */  addu       $t5, $t8, $zero
/* 172E0 80026AE0 21C04000 */  addu       $t8, $v0, $zero
.L80026AE4:
/* 172E4 80026AE4 2A08F801 */  slt        $at, $t7, $t8
/* 172E8 80026AE8 02002014 */  bnez       $at, .L80026AF4
/* 172EC 80026AEC 03120E00 */   sra       $v0, $t6, 8
/* 172F0 80026AF0 21780003 */  addu       $t7, $t8, $zero
.L80026AF4:
/* 172F4 80026AF4 FCFFB931 */  andi       $t9, $t5, 0xFFFC
/* 172F8 80026AF8 00110200 */  sll        $v0, $v0, 4
/* 172FC 80026AFC 21C02203 */  addu       $t8, $t9, $v0
/* 17300 80026B00 B200001B */  blez       $t8, .L80026DCC
/* 17304 80026B04 A000232B */   slti      $v1, $t9, 0xA0
/* 17308 80026B08 B0006014 */  bnez       $v1, .L80026DCC
/* 1730C 80026B0C 0030032B */   slti      $v1, $t8, 0x3000
/* 17310 80026B10 AE006010 */  beqz       $v1, .L80026DCC
/* 17314 80026B14 D000838D */   lw        $v1, (0x1F8000D0 & 0xFFFF)($t4)
/* 17318 80026B18 00000000 */  nop
/* 1731C 80026B1C 2A08E301 */  slt        $at, $t7, $v1
/* 17320 80026B20 AA002010 */  beqz       $at, .L80026DCC
/* 17324 80026B24 00000000 */   nop
/* 17328 80026B28 8002E129 */  slti       $at, $t7, 0x280
/* 1732C 80026B2C 36FD2014 */  bnez       $at, .L80026008
/* 17330 80026B30 B000838D */   lw        $v1, (0x1F8000B0 & 0xFFFF)($t4)
/* 17334 80026B34 00000000 */  nop
/* 17338 80026B38 2A102303 */  slt        $v0, $t9, $v1
/* 1733C 80026B3C 01004238 */  xori       $v0, $v0, 0x1
/* 17340 80026B40 4B004014 */  bnez       $v0, .L80026C70
/* 17344 80026B44 00000000 */   nop
/* 17348 80026B48 0800C231 */  andi       $v0, $t6, 0x8
/* 1734C 80026B4C 37004010 */  beqz       $v0, .L80026C2C
/* 17350 80026B50 00A81948 */   mfc2      $t9, $21 # handwritten instruction
/* 17354 80026B54 00B00E48 */  mfc2       $t6, $22 # handwritten instruction
/* 17358 80026B58 00B80348 */  mfc2       $v1, $23 # handwritten instruction
/* 1735C 80026B5C 00A88048 */  mtc2       $zero, $21 # handwritten instruction
/* 17360 80026B60 00B08048 */  mtc2       $zero, $22 # handwritten instruction
/* 17364 80026B64 00B88048 */  mtc2       $zero, $23 # handwritten instruction
/* 17368 80026B68 00100D24 */  addiu      $t5, $zero, 0x1000
/* 1736C 80026B6C 00880248 */  mfc2       $v0, $17 # handwritten instruction
/* 17370 80026B70 00000000 */  nop
/* 17374 80026B74 2210A201 */  sub        $v0, $t5, $v0 # handwritten instruction
/* 17378 80026B78 2A08A201 */  slt        $at, $t5, $v0
/* 1737C 80026B7C 0A002014 */  bnez       $at, .L80026BA8
/* 17380 80026B80 00000000 */   nop
/* 17384 80026B84 0200401C */  bgtz       $v0, .L80026B90
/* 17388 80026B88 00000000 */   nop
/* 1738C 80026B8C 21100000 */  addu       $v0, $zero, $zero
.L80026B90:
/* 17390 80026B90 7C0086C9 */  lwc2       $6, (0x1F80007C & 0xFFFF)($t4)
/* 17394 80026B94 00408248 */  mtc2       $v0, $8 # handwritten instruction
/* 17398 80026B98 00000000 */  nop
/* 1739C 80026B9C 00000000 */  nop
/* 173A0 80026BA0 1000784A */  DPCS
/* 173A4 80026BA4 7C0096E9 */  swc2       $22, (0x1F80007C & 0xFFFF)($t4)
.L80026BA8:
/* 173A8 80026BA8 00900248 */  mfc2       $v0, $18 # handwritten instruction
/* 173AC 80026BAC 00000000 */  nop
/* 173B0 80026BB0 2210A201 */  sub        $v0, $t5, $v0 # handwritten instruction
/* 173B4 80026BB4 2A08A201 */  slt        $at, $t5, $v0
/* 173B8 80026BB8 0A002014 */  bnez       $at, .L80026BE4
/* 173BC 80026BBC 00000000 */   nop
/* 173C0 80026BC0 0200401C */  bgtz       $v0, .L80026BCC
/* 173C4 80026BC4 00000000 */   nop
/* 173C8 80026BC8 21100000 */  addu       $v0, $zero, $zero
.L80026BCC:
/* 173CC 80026BCC 800086C9 */  lwc2       $6, (0x1F800080 & 0xFFFF)($t4)
/* 173D0 80026BD0 00408248 */  mtc2       $v0, $8 # handwritten instruction
/* 173D4 80026BD4 00000000 */  nop
/* 173D8 80026BD8 00000000 */  nop
/* 173DC 80026BDC 1000784A */  DPCS
/* 173E0 80026BE0 800096E9 */  swc2       $22, (0x1F800080 & 0xFFFF)($t4)
.L80026BE4:
/* 173E4 80026BE4 00980248 */  mfc2       $v0, $19 # handwritten instruction
/* 173E8 80026BE8 00000000 */  nop
/* 173EC 80026BEC 2210A201 */  sub        $v0, $t5, $v0 # handwritten instruction
/* 173F0 80026BF0 2A08A201 */  slt        $at, $t5, $v0
/* 173F4 80026BF4 0A002014 */  bnez       $at, .L80026C20
/* 173F8 80026BF8 00000000 */   nop
/* 173FC 80026BFC 0200401C */  bgtz       $v0, .L80026C08
/* 17400 80026C00 00000000 */   nop
/* 17404 80026C04 21100000 */  addu       $v0, $zero, $zero
.L80026C08:
/* 17408 80026C08 840086C9 */  lwc2       $6, (0x1F800084 & 0xFFFF)($t4)
/* 1740C 80026C0C 00408248 */  mtc2       $v0, $8 # handwritten instruction
/* 17410 80026C10 00000000 */  nop
/* 17414 80026C14 00000000 */  nop
/* 17418 80026C18 1000784A */  DPCS
/* 1741C 80026C1C 840096E9 */  swc2       $22, (0x1F800084 & 0xFFFF)($t4)
.L80026C20:
/* 17420 80026C20 00A89948 */  mtc2       $t9, $21 # handwritten instruction
/* 17424 80026C24 00B08E48 */  mtc2       $t6, $22 # handwritten instruction
/* 17428 80026C28 00B88348 */  mtc2       $v1, $23 # handwritten instruction
.L80026C2C:
/* 1742C 80026C2C 84008D8D */  lw         $t5, (0x1F800084 & 0xFFFF)($t4)
/* 17430 80026C30 8000838D */  lw         $v1, (0x1F800080 & 0xFFFF)($t4)
/* 17434 80026C34 7C00828D */  lw         $v0, (0x1F80007C & 0xFFFF)($t4)
/* 17438 80026C38 1C000DAD */  sw         $t5, 0x1C($t0)
/* 1743C 80026C3C 100003AD */  sw         $v1, 0x10($t0)
/* 17440 80026C40 040002AD */  sw         $v0, 0x4($t0)
/* 17444 80026C44 20000BAD */  sw         $t3, 0x20($t0)
/* 17448 80026C48 21301403 */  addu       $a2, $t8, $s4
/* 1744C 80026C4C 0000C28C */  lw         $v0, 0x0($a2)
/* 17450 80026C50 24180501 */  and        $v1, $t0, $a1
/* 17454 80026C54 0000C3AC */  sw         $v1, 0x0($a2)
/* 17458 80026C58 25105300 */  or         $v0, $v0, $s3
/* 1745C 80026C5C 000002AD */  sw         $v0, 0x0($t0)
/* 17460 80026C60 080009AD */  sw         $t1, 0x8($t0)
/* 17464 80026C64 14000AAD */  sw         $t2, 0x14($t0)
/* 17468 80026C68 52000104 */  bgez       $zero, .L80026DB4
/* 1746C 80026C6C 28000825 */   addiu     $t0, $t0, 0x28
.L80026C70:
/* 17470 80026C70 840086C9 */  lwc2       $6, (0x1F800084 & 0xFFFF)($t4)
/* 17474 80026C74 C40088C9 */  lwc2       $8, (0x1F8000C4 & 0xFFFF)($t4)
/* 17478 80026C78 21301403 */  addu       $a2, $t8, $s4
/* 1747C 80026C7C 0000C28C */  lw         $v0, 0x0($a2)
/* 17480 80026C80 1000784A */  DPCS
/* 17484 80026C84 24180501 */  and        $v1, $t0, $a1
/* 17488 80026C88 0000C3AC */  sw         $v1, 0x0($a2)
/* 1748C 80026C8C 25105300 */  or         $v0, $v0, $s3
/* 17490 80026C90 000002AD */  sw         $v0, 0x0($t0)
/* 17494 80026C94 1C0016E9 */  swc2       $22, 0x1C($t0)
/* 17498 80026C98 800086C9 */  lwc2       $6, (0x1F800080 & 0xFFFF)($t4)
/* 1749C 80026C9C C00088C9 */  lwc2       $8, (0x1F8000C0 & 0xFFFF)($t4)
/* 174A0 80026CA0 00000000 */  nop
/* 174A4 80026CA4 00000000 */  nop
/* 174A8 80026CA8 1000784A */  DPCS
/* 174AC 80026CAC 20000BAD */  sw         $t3, 0x20($t0)
/* 174B0 80026CB0 14000AAD */  sw         $t2, 0x14($t0)
/* 174B4 80026CB4 7F008D81 */  lb         $t5, (0x1F80007F & 0xFFFF)($t4)
/* 174B8 80026CB8 100016E9 */  swc2       $22, 0x10($t0)
/* 174BC 80026CBC 7C0086C9 */  lwc2       $6, (0x1F80007C & 0xFFFF)($t4)
/* 174C0 80026CC0 BC0088C9 */  lwc2       $8, (0x1F8000BC & 0xFFFF)($t4)
/* 174C4 80026CC4 00000000 */  nop
/* 174C8 80026CC8 CC00868D */  lw         $a2, (0x1F8000CC & 0xFFFF)($t4)
/* 174CC 80026CCC 080009AD */  sw         $t1, 0x8($t0)
/* 174D0 80026CD0 1000784A */  DPCS
/* 174D4 80026CD4 B800838D */  lw         $v1, (0x1F8000B8 & 0xFFFF)($t4)
/* 174D8 80026CD8 0100C231 */  andi       $v0, $t6, 0x1
/* 174DC 80026CDC 0200AD31 */  andi       $t5, $t5, 0x2
/* 174E0 80026CE0 25104D00 */  or         $v0, $v0, $t5
/* 174E4 80026CE4 2A087900 */  slt        $at, $v1, $t9
/* 174E8 80026CE8 3E002010 */  beqz       $at, .L80026DE4
/* 174EC 80026CEC 28000825 */   addiu     $t0, $t0, 0x28
/* 174F0 80026CF0 3C004014 */  bnez       $v0, .L80026DE4
/* 174F4 80026CF4 DA008281 */   lb        $v0, (0x1F8000DA & 0xFFFF)($t4)
/* 174F8 80026CF8 00000000 */  nop
/* 174FC 80026CFC 4C004014 */  bnez       $v0, .L80026E30
/* 17500 80026D00 0002023C */   lui       $v0, (0x2000000 >> 16)
/* 17504 80026D04 00308648 */  mtc2       $a2, $6 # handwritten instruction
/* 17508 80026D08 00B00648 */  mfc2       $a2, $22 # handwritten instruction
/* 1750C 80026D0C 00000000 */  nop
/* 17510 80026D10 2530C200 */  or         $a2, $a2, $v0
/* 17514 80026D14 DCFF06AD */  sw         $a2, -0x24($t0)
/* 17518 80026D18 CC008D8D */  lw         $t5, (0x1F8000CC & 0xFFFF)($t4)
/* 1751C 80026D1C 1000784A */  DPCS
/* 17520 80026D20 021C1700 */  srl        $v1, $s7, 16
/* 17524 80026D24 9FFF6330 */  andi       $v1, $v1, 0xFF9F
/* 17528 80026D28 20006334 */  ori        $v1, $v1, 0x20
/* 1752C 80026D2C F2FF03A5 */  sh         $v1, -0xE($t0)
/* 17530 80026D30 C000868D */  lw         $a2, (0x1F8000C0 & 0xFFFF)($t4)
/* 17534 80026D34 0C0009AD */  sw         $t1, 0xC($t0)
/* 17538 80026D38 00B00948 */  mfc2       $t1, $22 # handwritten instruction
/* 1753C 80026D3C 0030033C */  lui        $v1, (0x30000000 >> 16)
/* 17540 80026D40 2248A901 */  sub        $t1, $t5, $t1 # handwritten instruction
/* 17544 80026D44 25482301 */  or         $t1, $t1, $v1
/* 17548 80026D48 080009AD */  sw         $t1, 0x8($t0)
/* 1754C 80026D4C 00408648 */  mtc2       $a2, $8 # handwritten instruction
/* 17550 80026D50 00E1023C */  lui        $v0, (0xE1000640 >> 16)
/* 17554 80026D54 40064234 */  ori        $v0, $v0, (0xE1000640 & 0xFFFF)
/* 17558 80026D58 1000784A */  DPCS
/* 1755C 80026D5C C400868D */  lw         $a2, (0x1F8000C4 & 0xFFFF)($t4)
/* 17560 80026D60 14000AAD */  sw         $t2, 0x14($t0)
/* 17564 80026D64 040002AD */  sw         $v0, 0x4($t0)
/* 17568 80026D68 00B00948 */  mfc2       $t1, $22 # handwritten instruction
/* 1756C 80026D6C 00000000 */  nop
/* 17570 80026D70 2248A901 */  sub        $t1, $t5, $t1 # handwritten instruction
/* 17574 80026D74 100009AD */  sw         $t1, 0x10($t0)
/* 17578 80026D78 00408648 */  mtc2       $a2, $8 # handwritten instruction
/* 1757C 80026D7C 24180501 */  and        $v1, $t0, $a1
/* 17580 80026D80 21C01403 */  addu       $t8, $t8, $s4
/* 17584 80026D84 1000784A */  DPCS
/* 17588 80026D88 0000028F */  lw         $v0, 0x0($t8)
/* 1758C 80026D8C 000003AF */  sw         $v1, 0x0($t8)
/* 17590 80026D90 0007013C */  lui        $at, (0x7000000 >> 16)
/* 17594 80026D94 25104100 */  or         $v0, $v0, $at
/* 17598 80026D98 000002AD */  sw         $v0, 0x0($t0)
/* 1759C 80026D9C 1C000BAD */  sw         $t3, 0x1C($t0)
/* 175A0 80026DA0 00B00948 */  mfc2       $t1, $22 # handwritten instruction
/* 175A4 80026DA4 00000000 */  nop
/* 175A8 80026DA8 2248A901 */  sub        $t1, $t5, $t1 # handwritten instruction
/* 175AC 80026DAC 180009AD */  sw         $t1, 0x18($t0)
/* 175B0 80026DB0 20000825 */  addiu      $t0, $t0, 0x20
.L80026DB4:
/* 175B4 80026DB4 0C003126 */  addiu      $s1, $s1, 0xC
/* 175B8 80026DB8 2B103602 */  sltu       $v0, $s1, $s6
/* 175BC 80026DBC 28FE4014 */  bnez       $v0, .L80026660
/* 175C0 80026DC0 00000000 */   nop
/* 175C4 80026DC4 809B0008 */  j          .L80026E00
/* 175C8 80026DC8 00000000 */   nop
.L80026DCC:
/* 175CC 80026DCC 0C003126 */  addiu      $s1, $s1, 0xC
/* 175D0 80026DD0 2B103602 */  sltu       $v0, $s1, $s6
/* 175D4 80026DD4 22FE4014 */  bnez       $v0, .L80026660
/* 175D8 80026DD8 AC0080AD */   sw        $zero, (0x1F8000AC & 0xFFFF)($t4)
/* 175DC 80026DDC 809B0008 */  j          .L80026E00
/* 175E0 80026DE0 00000000 */   nop
.L80026DE4:
/* 175E4 80026DE4 DCFF16E9 */  swc2       $22, -0x24($t0)
/* 175E8 80026DE8 0C003126 */  addiu      $s1, $s1, 0xC
/* 175EC 80026DEC 2B103602 */  sltu       $v0, $s1, $s6
/* 175F0 80026DF0 1BFE4014 */  bnez       $v0, .L80026660
/* 175F4 80026DF4 00000000 */   nop
/* 175F8 80026DF8 809B0008 */  j          .L80026E00
/* 175FC 80026DFC 00000000 */   nop
.L80026E00:
/* 17600 80026E00 A8009F8D */  lw         $ra, (0x1F8000A8 & 0xFFFF)($t4)
/* 17604 80026E04 14009E8D */  lw         $fp, (0x1F800014 & 0xFFFF)($t4)
/* 17608 80026E08 A400978D */  lw         $s7, (0x1F8000A4 & 0xFFFF)($t4)
/* 1760C 80026E0C A000968D */  lw         $s6, (0x1F8000A0 & 0xFFFF)($t4)
/* 17610 80026E10 9C00958D */  lw         $s5, (0x1F80009C & 0xFFFF)($t4)
/* 17614 80026E14 9800948D */  lw         $s4, (0x1F800098 & 0xFFFF)($t4)
/* 17618 80026E18 9400938D */  lw         $s3, (0x1F800094 & 0xFFFF)($t4)
/* 1761C 80026E1C 9000928D */  lw         $s2, (0x1F800090 & 0xFFFF)($t4)
/* 17620 80026E20 8C00918D */  lw         $s1, (0x1F80008C & 0xFFFF)($t4)
/* 17624 80026E24 8800908D */  lw         $s0, (0x1F800088 & 0xFFFF)($t4)
/* 17628 80026E28 0800E003 */  jr         $ra
/* 1762C 80026E2C 00000000 */   nop
.L80026E30:
/* 17630 80026E30 0002023C */  lui        $v0, (0x2000000 >> 16)
/* 17634 80026E34 00308648 */  mtc2       $a2, $6 # handwritten instruction
/* 17638 80026E38 00B00648 */  mfc2       $a2, $22 # handwritten instruction
/* 1763C 80026E3C 00000000 */  nop
/* 17640 80026E40 2530C200 */  or         $a2, $a2, $v0
/* 17644 80026E44 DCFF06AD */  sw         $a2, -0x24($t0)
/* 17648 80026E48 CC008D8D */  lw         $t5, (0x1F8000CC & 0xFFFF)($t4)
/* 1764C 80026E4C 00FF013C */  lui        $at, (0xFF000000 >> 16)
/* 17650 80026E50 2410C100 */  and        $v0, $a2, $at
/* 17654 80026E54 0036013C */  lui        $at, (0x36000000 >> 16)
/* 17658 80026E58 02004110 */  beq        $v0, $at, .L80026E64
/* 1765C 80026E5C 00000000 */   nop
/* 17660 80026E60 00B00248 */  mfc2       $v0, $22 # handwritten instruction
.L80026E64:
/* 17664 80026E64 1000784A */  DPCS
/* 17668 80026E68 021C1700 */  srl        $v1, $s7, 16
/* 1766C 80026E6C 9FFF6330 */  andi       $v1, $v1, 0xFF9F
/* 17670 80026E70 20006334 */  ori        $v1, $v1, 0x20
/* 17674 80026E74 F2FF03A5 */  sh         $v1, -0xE($t0)
/* 17678 80026E78 C000868D */  lw         $a2, (0x1F8000C0 & 0xFFFF)($t4)
/* 1767C 80026E7C 080009AD */  sw         $t1, 0x8($t0)
/* 17680 80026E80 00B00948 */  mfc2       $t1, $22 # handwritten instruction
/* 17684 80026E84 0034033C */  lui        $v1, (0x34000000 >> 16)
/* 17688 80026E88 2248A901 */  sub        $t1, $t5, $t1 # handwritten instruction
/* 1768C 80026E8C 25482301 */  or         $t1, $t1, $v1
/* 17690 80026E90 040009AD */  sw         $t1, 0x4($t0)
/* 17694 80026E94 00408648 */  mtc2       $a2, $8 # handwritten instruction
/* 17698 80026E98 9FFF013C */  lui        $at, (0xFF9FFFFF >> 16)
/* 1769C 80026E9C FFFF2134 */  ori        $at, $at, (0xFF9FFFFF & 0xFFFF)
/* 176A0 80026EA0 2418E102 */  and        $v1, $s7, $at
/* 176A4 80026EA4 180003AD */  sw         $v1, 0x18($t0)
/* 176A8 80026EA8 1000784A */  DPCS
/* 176AC 80026EAC E4FF028D */  lw         $v0, -0x1C($t0)
/* 176B0 80026EB0 FCFF038D */  lw         $v1, -0x4($t0)
/* 176B4 80026EB4 0C0002AD */  sw         $v0, 0xC($t0)
/* 176B8 80026EB8 240003AD */  sw         $v1, 0x24($t0)
/* 176BC 80026EBC D4008685 */  lh         $a2, (0x1F8000D4 & 0xFFFF)($t4)
/* 176C0 80026EC0 00000000 */  nop
/* 176C4 80026EC4 0E0006A5 */  sh         $a2, 0xE($t0)
/* 176C8 80026EC8 C400868D */  lw         $a2, (0x1F8000C4 & 0xFFFF)($t4)
/* 176CC 80026ECC 14000AAD */  sw         $t2, 0x14($t0)
/* 176D0 80026ED0 00B00948 */  mfc2       $t1, $22 # handwritten instruction
/* 176D4 80026ED4 00000000 */  nop
/* 176D8 80026ED8 2248A901 */  sub        $t1, $t5, $t1 # handwritten instruction
/* 176DC 80026EDC 100009AD */  sw         $t1, 0x10($t0)
/* 176E0 80026EE0 00408648 */  mtc2       $a2, $8 # handwritten instruction
/* 176E4 80026EE4 24180501 */  and        $v1, $t0, $a1
/* 176E8 80026EE8 21C01403 */  addu       $t8, $t8, $s4
/* 176EC 80026EEC 1000784A */  DPCS
/* 176F0 80026EF0 0000028F */  lw         $v0, 0x0($t8)
/* 176F4 80026EF4 000003AF */  sw         $v1, 0x0($t8)
/* 176F8 80026EF8 0009013C */  lui        $at, (0x9000000 >> 16)
/* 176FC 80026EFC 25104100 */  or         $v0, $v0, $at
/* 17700 80026F00 000002AD */  sw         $v0, 0x0($t0)
/* 17704 80026F04 20000BAD */  sw         $t3, 0x20($t0)
/* 17708 80026F08 00B00948 */  mfc2       $t1, $22 # handwritten instruction
/* 1770C 80026F0C 00000000 */  nop
/* 17710 80026F10 2248A901 */  sub        $t1, $t5, $t1 # handwritten instruction
/* 17714 80026F14 1C0009AD */  sw         $t1, 0x1C($t0)
/* 17718 80026F18 28000825 */  addiu      $t0, $t0, 0x28
/* 1771C 80026F1C 0C003126 */  addiu      $s1, $s1, 0xC
/* 17720 80026F20 2B103602 */  sltu       $v0, $s1, $s6
/* 17724 80026F24 CEFD4014 */  bnez       $v0, .L80026660
/* 17728 80026F28 00000000 */   nop
/* 1772C 80026F2C 809B0008 */  j          .L80026E00
/* 17730 80026F30 00000000 */   nop
.size DRAW_DisplaySubdivPolytope_S, . - DRAW_DisplaySubdivPolytope_S
