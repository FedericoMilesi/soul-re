.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800794C0
/* 69CC0 800794C0 6400A28C */  lw         $v0, 0x64($a1)
/* 69CC4 800794C4 801F083C */  lui        $t0, (0x1F8000B8 >> 16)
/* 69CC8 800794C8 980010AD */  sw         $s0, (0x1F800098 & 0xFFFF)($t0)
/* 69CCC 800794CC 9C0011AD */  sw         $s1, (0x1F80009C & 0xFFFF)($t0)
/* 69CD0 800794D0 A00012AD */  sw         $s2, (0x1F8000A0 & 0xFFFF)($t0)
/* 69CD4 800794D4 A40013AD */  sw         $s3, (0x1F8000A4 & 0xFFFF)($t0)
/* 69CD8 800794D8 A80014AD */  sw         $s4, (0x1F8000A8 & 0xFFFF)($t0)
/* 69CDC 800794DC AC0015AD */  sw         $s5, (0x1F8000AC & 0xFFFF)($t0)
/* 69CE0 800794E0 B00016AD */  sw         $s6, (0x1F8000B0 & 0xFFFF)($t0)
/* 69CE4 800794E4 B40017AD */  sw         $s7, (0x1F8000B4 & 0xFFFF)($t0)
/* 69CE8 800794E8 B8001EAD */  sw         $fp, (0x1F8000B8 & 0xFFFF)($t0)
/* 69CEC 800794EC BC001FAD */  sw         $ra, (0x1F8000BC & 0xFFFF)($t0)
/* 69CF0 800794F0 0D80123C */  lui        $s2, %hi(depthQFogFar)
/* 69CF4 800794F4 E805528E */  lw         $s2, %lo(depthQFogFar)($s2)
/* 69CF8 800794F8 21A00001 */  addu       $s4, $t0, $zero
/* 69CFC 800794FC 21A88000 */  addu       $s5, $a0, $zero
/* 69D00 80079500 21B0A000 */  addu       $s6, $a1, $zero
/* 69D04 80079504 21F0C000 */  addu       $fp, $a2, $zero
/* 69D08 80079508 C0009022 */  addi       $s0, $s4, (0x1F8000C0 & 0xFFFF) # handwritten instruction
/* 69D0C 8007950C 000010AE */  sw         $s0, 0x0($s0)
/* 69D10 80079510 2A084202 */  slt        $at, $s2, $v0
/* 69D14 80079514 02002014 */  bnez       $at, .L80079520
/* 69D18 80079518 0400D723 */   addi      $s7, $fp, 0x4 # handwritten instruction
/* 69D1C 8007951C 21904000 */  addu       $s2, $v0, $zero
.L80079520:
/* 69D20 80079520 0800C222 */  addi       $v0, $s6, 0x8 # handwritten instruction
/* 69D24 80079524 00008322 */  addi       $v1, $s4, (0x1F800000 & 0xFFFF) # handwritten instruction
/* 69D28 80079528 40000820 */  addi       $t0, $zero, 0x40 # handwritten instruction
.L8007952C:
/* 69D2C 8007952C 00004E8C */  lw         $t6, 0x0($v0)
/* 69D30 80079530 04004F8C */  lw         $t7, 0x4($v0)
/* 69D34 80079534 0800588C */  lw         $t8, 0x8($v0)
/* 69D38 80079538 0C00598C */  lw         $t9, 0xC($v0)
/* 69D3C 8007953C 00006EAC */  sw         $t6, 0x0($v1)
/* 69D40 80079540 04006FAC */  sw         $t7, 0x4($v1)
/* 69D44 80079544 080078AC */  sw         $t8, 0x8($v1)
/* 69D48 80079548 0C0079AC */  sw         $t9, 0xC($v1)
/* 69D4C 8007954C 10004220 */  addi       $v0, $v0, 0x10 # handwritten instruction
/* 69D50 80079550 F0FF0821 */  addi       $t0, $t0, -0x10 # handwritten instruction
/* 69D54 80079554 F5FF0015 */  bnez       $t0, .L8007952C
/* 69D58 80079558 10006320 */   addi      $v1, $v1, 0x10 # handwritten instruction
/* 69D5C 8007955C 0000888E */  lw         $t0, (0x1F800000 & 0xFFFF)($s4)
/* 69D60 80079560 0400898E */  lw         $t1, (0x1F800004 & 0xFFFF)($s4)
/* 69D64 80079564 08008A8E */  lw         $t2, (0x1F800008 & 0xFFFF)($s4)
/* 69D68 80079568 0C008B8E */  lw         $t3, (0x1F80000C & 0xFFFF)($s4)
/* 69D6C 8007956C 10008C96 */  lhu        $t4, (0x1F800010 & 0xFFFF)($s4)
/* 69D70 80079570 0000CD8E */  lw         $t5, 0x0($s6)
/* 69D74 80079574 0400CE86 */  lh         $t6, 0x4($s6)
/* 69D78 80079578 0000C848 */  ctc2       $t0, $0 # handwritten instruction
/* 69D7C 8007957C 0008C948 */  ctc2       $t1, $1 # handwritten instruction
/* 69D80 80079580 0010CA48 */  ctc2       $t2, $2 # handwritten instruction
/* 69D84 80079584 0018CB48 */  ctc2       $t3, $3 # handwritten instruction
/* 69D88 80079588 0020CC48 */  ctc2       $t4, $4 # handwritten instruction
/* 69D8C 8007958C 00008D48 */  mtc2       $t5, $0 # handwritten instruction
/* 69D90 80079590 00088E48 */  mtc2       $t6, $1 # handwritten instruction
/* 69D94 80079594 00000000 */  nop
/* 69D98 80079598 00000000 */  nop
/* 69D9C 8007959C 1260484A */  MVMVA      1, 0, 0, 3, 0
/* 69DA0 800795A0 2000888E */  lw         $t0, (0x1F800020 & 0xFFFF)($s4)
/* 69DA4 800795A4 2400898E */  lw         $t1, (0x1F800024 & 0xFFFF)($s4)
/* 69DA8 800795A8 28008A8E */  lw         $t2, (0x1F800028 & 0xFFFF)($s4)
/* 69DAC 800795AC 600099EA */  swc2       $25, (0x1F800060 & 0xFFFF)($s4)
/* 69DB0 800795B0 64009AEA */  swc2       $26, (0x1F800064 & 0xFFFF)($s4) # handwritten instruction
/* 69DB4 800795B4 68009BEA */  swc2       $27, (0x1F800068 & 0xFFFF)($s4) # handwritten instruction
/* 69DB8 800795B8 0000C848 */  ctc2       $t0, $0 # handwritten instruction
/* 69DBC 800795BC 0008C948 */  ctc2       $t1, $1 # handwritten instruction
/* 69DC0 800795C0 0010CA48 */  ctc2       $t2, $2 # handwritten instruction
/* 69DC4 800795C4 00000000 */  nop
/* 69DC8 800795C8 00000000 */  nop
/* 69DCC 800795CC 1260484A */  MVMVA      1, 0, 0, 3, 0
/* 69DD0 800795D0 40008DAE */  sw         $t5, (0x1F800040 & 0xFFFF)($s4)
/* 69DD4 800795D4 44008EA6 */  sh         $t6, (0x1F800044 & 0xFFFF)($s4)
/* 69DD8 800795D8 6800C98E */  lw         $t1, 0x68($s6)
/* 69DDC 800795DC 7400CA8E */  lw         $t2, 0x74($s6)
/* 69DE0 800795E0 6C0099EA */  swc2       $25, (0x1F80006C & 0xFFFF)($s4)
/* 69DE4 800795E4 70009AEA */  swc2       $26, (0x1F800070 & 0xFFFF)($s4) # handwritten instruction
/* 69DE8 800795E8 C0431200 */  sll        $t0, $s2, 15
/* 69DEC 800795EC 1A000901 */  div        $zero, $t0, $t1
/* 69DF0 800795F0 00089248 */  mtc2       $s2, $1 # handwritten instruction
/* 69DF4 800795F4 00004C8D */  lw         $t4, 0x0($t2)
/* 69DF8 800795F8 04004D8D */  lw         $t5, 0x4($t2)
/* 69DFC 800795FC 08004E8D */  lw         $t6, 0x8($t2)
/* 69E00 80079600 0C004F8D */  lw         $t7, 0xC($t2)
/* 69E04 80079604 10005895 */  lhu        $t8, 0x10($t2)
/* 69E08 80079608 12100000 */  mflo       $v0
/* 69E0C 8007960C 0000CC48 */  ctc2       $t4, $0 # handwritten instruction
/* 69E10 80079610 0008CD48 */  ctc2       $t5, $1 # handwritten instruction
/* 69E14 80079614 0010CE48 */  ctc2       $t6, $2 # handwritten instruction
/* 69E18 80079618 0018CF48 */  ctc2       $t7, $3 # handwritten instruction
/* 69E1C 8007961C 0020D848 */  ctc2       $t8, $4 # handwritten instruction
/* 69E20 80079620 A000C88E */  lw         $t0, 0xA0($s6)
/* 69E24 80079624 A800C98E */  lw         $t1, 0xA8($s6)
/* 69E28 80079628 A400CA8E */  lw         $t2, 0xA4($s6)
/* 69E2C 8007962C AC00CB8E */  lw         $t3, 0xAC($s6)
/* 69E30 80079630 60FF0821 */  addi       $t0, $t0, -0xA0 # handwritten instruction
/* 69E34 80079634 18000201 */  mult       $t0, $v0
/* 69E38 80079638 FFFF033C */  lui        $v1, (0xFFFF0000 >> 16)
/* 69E3C 8007963C 88FF2921 */  addi       $t1, $t1, -0x78 # handwritten instruction
/* 69E40 80079640 12400000 */  mflo       $t0
/* 69E44 80079644 00000000 */  nop
/* 69E48 80079648 00000000 */  nop
/* 69E4C 8007964C 18002201 */  mult       $t1, $v0
/* 69E50 80079650 60FF4A21 */  addi       $t2, $t2, -0xA0 # handwritten instruction
/* 69E54 80079654 C3430800 */  sra        $t0, $t0, 15
/* 69E58 80079658 FFFF0831 */  andi       $t0, $t0, 0xFFFF
/* 69E5C 8007965C 12480000 */  mflo       $t1
/* 69E60 80079660 00000000 */  nop
/* 69E64 80079664 00000000 */  nop
/* 69E68 80079668 18004201 */  mult       $t2, $v0
/* 69E6C 8007966C 88FF6B21 */  addi       $t3, $t3, -0x78 # handwritten instruction
/* 69E70 80079670 40480900 */  sll        $t1, $t1, 1
/* 69E74 80079674 24482301 */  and        $t1, $t1, $v1
/* 69E78 80079678 12500000 */  mflo       $t2
/* 69E7C 8007967C 00000000 */  nop
/* 69E80 80079680 00000000 */  nop
/* 69E84 80079684 18006201 */  mult       $t3, $v0
/* 69E88 80079688 C3530A00 */  sra        $t2, $t2, 15
/* 69E8C 8007968C FFFF4A31 */  andi       $t2, $t2, 0xFFFF
/* 69E90 80079690 12580000 */  mflo       $t3
/* 69E94 80079694 40580B00 */  sll        $t3, $t3, 1
/* 69E98 80079698 24586301 */  and        $t3, $t3, $v1
/* 69E9C 8007969C 25780901 */  or         $t7, $t0, $t1
/* 69EA0 800796A0 00008F48 */  mtc2       $t7, $0 # handwritten instruction
/* 69EA4 800796A4 00000000 */  nop
/* 69EA8 800796A8 00000000 */  nop
/* 69EAC 800796AC 1260484A */  MVMVA      1, 0, 0, 3, 0
/* 69EB0 800796B0 25784901 */  or         $t7, $t2, $t1
/* 69EB4 800796B4 00480C48 */  mfc2       $t4, $9 # handwritten instruction
/* 69EB8 800796B8 00500D48 */  mfc2       $t5, $10 # handwritten instruction
/* 69EBC 800796BC 00580E48 */  mfc2       $t6, $11 # handwritten instruction
/* 69EC0 800796C0 00008F48 */  mtc2       $t7, $0 # handwritten instruction
/* 69EC4 800796C4 46008CA6 */  sh         $t4, (0x1F800046 & 0xFFFF)($s4)
/* 69EC8 800796C8 48008DA6 */  sh         $t5, (0x1F800048 & 0xFFFF)($s4)
/* 69ECC 800796CC 4A008EA6 */  sh         $t6, (0x1F80004A & 0xFFFF)($s4)
/* 69ED0 800796D0 1260484A */  MVMVA      1, 0, 0, 3, 0
/* 69ED4 800796D4 25784B01 */  or         $t7, $t2, $t3
/* 69ED8 800796D8 00480C48 */  mfc2       $t4, $9 # handwritten instruction
/* 69EDC 800796DC 00500D48 */  mfc2       $t5, $10 # handwritten instruction
/* 69EE0 800796E0 00580E48 */  mfc2       $t6, $11 # handwritten instruction
/* 69EE4 800796E4 00008F48 */  mtc2       $t7, $0 # handwritten instruction
/* 69EE8 800796E8 4C008CA6 */  sh         $t4, (0x1F80004C & 0xFFFF)($s4)
/* 69EEC 800796EC 4E008DA6 */  sh         $t5, (0x1F80004E & 0xFFFF)($s4)
/* 69EF0 800796F0 50008EA6 */  sh         $t6, (0x1F800050 & 0xFFFF)($s4)
/* 69EF4 800796F4 1260484A */  MVMVA      1, 0, 0, 3, 0
/* 69EF8 800796F8 25780B01 */  or         $t7, $t0, $t3
/* 69EFC 800796FC 00480C48 */  mfc2       $t4, $9 # handwritten instruction
/* 69F00 80079700 00500D48 */  mfc2       $t5, $10 # handwritten instruction
/* 69F04 80079704 00580E48 */  mfc2       $t6, $11 # handwritten instruction
/* 69F08 80079708 00008F48 */  mtc2       $t7, $0 # handwritten instruction
/* 69F0C 8007970C 74008CA6 */  sh         $t4, (0x1F800074 & 0xFFFF)($s4)
/* 69F10 80079710 76008DA6 */  sh         $t5, (0x1F800076 & 0xFFFF)($s4)
/* 69F14 80079714 78008EA6 */  sh         $t6, (0x1F800078 & 0xFFFF)($s4)
/* 69F18 80079718 1260484A */  MVMVA      1, 0, 0, 3, 0
/* 69F1C 8007971C 00480C48 */  mfc2       $t4, $9 # handwritten instruction
/* 69F20 80079720 00500D48 */  mfc2       $t5, $10 # handwritten instruction
/* 69F24 80079724 00580E48 */  mfc2       $t6, $11 # handwritten instruction
/* 69F28 80079728 0D800F3C */  lui        $t7, (0x800D3360 >> 16)
/* 69F2C 8007972C 6033EF35 */  ori        $t7, $t7, (0x800D3360 & 0xFFFF)
/* 69F30 80079730 7A008CA6 */  sh         $t4, (0x1F80007A & 0xFFFF)($s4)
/* 69F34 80079734 7C008DA6 */  sh         $t5, (0x1F80007C & 0xFFFF)($s4)
/* 69F38 80079738 7E008EA6 */  sh         $t6, (0x1F80007E & 0xFFFF)($s4)
/* 69F3C 8007973C 0800E385 */  lh         $v1, 0x8($t7)
/* 69F40 80079740 0A00E285 */  lh         $v0, 0xA($t7)
/* 69F44 80079744 E8030124 */  addiu      $at, $zero, 0x3E8
/* 69F48 80079748 03006110 */  beq        $v1, $at, .L80079758
/* 69F4C 8007974C 02000620 */   addi      $a2, $zero, 0x2 # handwritten instruction
/* 69F50 80079750 04000104 */  bgez       $zero, .L80079764
/* 69F54 80079754 00000000 */   nop
.L80079758:
/* 69F58 80079758 02004010 */  beqz       $v0, .L80079764
/* 69F5C 8007975C 21300000 */   addu      $a2, $zero, $zero
/* 69F60 80079760 0100C620 */  addi       $a2, $a2, 0x1 # handwritten instruction
.L80079764:
/* 69F64 80079764 0000828E */  lw         $v0, (0x1F800000 & 0xFFFF)($s4)
/* 69F68 80079768 0400838E */  lw         $v1, (0x1F800004 & 0xFFFF)($s4)
/* 69F6C 8007976C 08008E8E */  lw         $t6, (0x1F800008 & 0xFFFF)($s4)
/* 69F70 80079770 0C008F8E */  lw         $t7, (0x1F80000C & 0xFFFF)($s4)
/* 69F74 80079774 10009896 */  lhu        $t8, (0x1F800010 & 0xFFFF)($s4)
/* 69F78 80079778 0000C248 */  ctc2       $v0, $0 # handwritten instruction
/* 69F7C 8007977C 0008C348 */  ctc2       $v1, $1 # handwritten instruction
/* 69F80 80079780 0010CE48 */  ctc2       $t6, $2 # handwritten instruction
/* 69F84 80079784 0018CF48 */  ctc2       $t7, $3 # handwritten instruction
/* 69F88 80079788 0020D848 */  ctc2       $t8, $4 # handwritten instruction
/* 69F8C 8007978C 0000B18E */  lw         $s1, 0x0($s5)
/* 69F90 80079790 04001022 */  addi       $s0, $s0, 0x4 # handwritten instruction
.L80079794:
/* 69F94 80079794 FCFF1022 */  addi       $s0, $s0, -0x4 # handwritten instruction
/* 69F98 80079798 0000288E */  lw         $t0, 0x0($s1)
/* 69F9C 8007979C 0400298E */  lw         $t1, 0x4($s1)
/* 69FA0 800797A0 00008848 */  mtc2       $t0, $0 # handwritten instruction
/* 69FA4 800797A4 00088948 */  mtc2       $t1, $1 # handwritten instruction
/* 69FA8 800797A8 03440900 */  sra        $t0, $t1, 16
/* 69FAC 800797AC 00000000 */  nop
/* 69FB0 800797B0 1260484A */  MVMVA      1, 0, 0, 3, 0
/* 69FB4 800797B4 22400800 */  sub        $t0, $zero, $t0 # handwritten instruction
/* 69FB8 800797B8 6000828E */  lw         $v0, (0x1F800060 & 0xFFFF)($s4)
/* 69FBC 800797BC 64008C8E */  lw         $t4, (0x1F800064 & 0xFFFF)($s4)
/* 69FC0 800797C0 68008D8E */  lw         $t5, (0x1F800068 & 0xFFFF)($s4)
/* 69FC4 800797C4 02000124 */  addiu      $at, $zero, 0x2
/* 69FC8 800797C8 0200C114 */  bne        $a2, $at, .L800797D4
/* 69FCC 800797CC 00000000 */   nop
/* 69FD0 800797D0 00F80821 */  addi       $t0, $t0, -0x800 # handwritten instruction
.L800797D4:
/* 69FD4 800797D4 00C80948 */  mfc2       $t1, $25 # handwritten instruction
/* 69FD8 800797D8 00D00A48 */  mfc2       $t2, $26 # handwritten instruction
/* 69FDC 800797DC 00D80B48 */  mfc2       $t3, $27 # handwritten instruction
/* 69FE0 800797E0 22482201 */  sub        $t1, $t1, $v0 # handwritten instruction
/* 69FE4 800797E4 2A080901 */  slt        $at, $t0, $t1
/* 69FE8 800797E8 94002010 */  beqz       $at, .L80079A3C
/* 69FEC 800797EC 22104C01 */   sub       $v0, $t2, $t4 # handwritten instruction
/* 69FF0 800797F0 2A080201 */  slt        $at, $t0, $v0
/* 69FF4 800797F4 91002010 */  beqz       $at, .L80079A3C
/* 69FF8 800797F8 22186D01 */   sub       $v1, $t3, $t5 # handwritten instruction
/* 69FFC 800797FC 2A080301 */  slt        $at, $t0, $v1
/* 6A000 80079800 8E002010 */  beqz       $at, .L80079A3C
/* 6A004 80079804 00000000 */   nop
/* 6A008 80079808 2000828E */  lw         $v0, (0x1F800020 & 0xFFFF)($s4)
/* 6A00C 8007980C 2400838E */  lw         $v1, (0x1F800024 & 0xFFFF)($s4)
/* 6A010 80079810 28008E8E */  lw         $t6, (0x1F800028 & 0xFFFF)($s4)
/* 6A014 80079814 0000C248 */  ctc2       $v0, $0 # handwritten instruction
/* 6A018 80079818 0008C348 */  ctc2       $v1, $1 # handwritten instruction
/* 6A01C 8007981C 0010CE48 */  ctc2       $t6, $2 # handwritten instruction
/* 6A020 80079820 00000000 */  nop
/* 6A024 80079824 00000000 */  nop
/* 6A028 80079828 1260484A */  MVMVA      1, 0, 0, 3, 0
/* 6A02C 8007982C 6C008C8E */  lw         $t4, (0x1F80006C & 0xFFFF)($s4)
/* 6A030 80079830 70008D8E */  lw         $t5, (0x1F800070 & 0xFFFF)($s4)
/* 6A034 80079834 00C80948 */  mfc2       $t1, $25 # handwritten instruction
/* 6A038 80079838 00D00A48 */  mfc2       $t2, $26 # handwritten instruction
/* 6A03C 8007983C 22102C01 */  sub        $v0, $t1, $t4 # handwritten instruction
/* 6A040 80079840 2A080201 */  slt        $at, $t0, $v0
/* 6A044 80079844 73002010 */  beqz       $at, .L80079A14
/* 6A048 80079848 22184D01 */   sub       $v1, $t2, $t5 # handwritten instruction
/* 6A04C 8007984C 2A080301 */  slt        $at, $t0, $v1
/* 6A050 80079850 70002010 */  beqz       $at, .L80079A14
/* 6A054 80079854 00000000 */   nop
/* 6A058 80079858 0E002286 */  lh         $v0, 0xE($s1)
/* 6A05C 8007985C 00000000 */  nop
/* 6A060 80079860 01004230 */  andi       $v0, $v0, 0x1
/* 6A064 80079864 69004010 */  beqz       $v0, .L80079A0C
/* 6A068 80079868 00000000 */   nop
/* 6A06C 8007986C 0200C010 */  beqz       $a2, .L80079878
/* 6A070 80079870 28002C22 */   addi      $t4, $s1, 0x28 # handwritten instruction
/* 6A074 80079874 24002C22 */  addi       $t4, $s1, 0x24 # handwritten instruction
.L80079878:
/* 6A078 80079878 00008C8D */  lw         $t4, 0x0($t4)
/* 6A07C 8007987C 4000828E */  lw         $v0, (0x1F800040 & 0xFFFF)($s4)
/* 6A080 80079880 4400838E */  lw         $v1, (0x1F800044 & 0xFFFF)($s4)
/* 6A084 80079884 48008E8E */  lw         $t6, (0x1F800048 & 0xFFFF)($s4)
/* 6A088 80079888 4C008F8E */  lw         $t7, (0x1F80004C & 0xFFFF)($s4)
/* 6A08C 8007988C 50009896 */  lhu        $t8, (0x1F800050 & 0xFFFF)($s4)
/* 6A090 80079890 0800298E */  lw         $t1, 0x8($s1)
/* 6A094 80079894 0C002A8E */  lw         $t2, 0xC($s1)
/* 6A098 80079898 0000C248 */  ctc2       $v0, $0 # handwritten instruction
/* 6A09C 8007989C 0008C348 */  ctc2       $v1, $1 # handwritten instruction
/* 6A0A0 800798A0 0010CE48 */  ctc2       $t6, $2 # handwritten instruction
/* 6A0A4 800798A4 0018CF48 */  ctc2       $t7, $3 # handwritten instruction
/* 6A0A8 800798A8 0020D848 */  ctc2       $t8, $4 # handwritten instruction
/* 6A0AC 800798AC 00008948 */  mtc2       $t1, $0 # handwritten instruction
/* 6A0B0 800798B0 00088A48 */  mtc2       $t2, $1 # handwritten instruction
/* 6A0B4 800798B4 1000228E */  lw         $v0, 0x10($s1)
/* 6A0B8 800798B8 00000000 */  nop
/* 6A0BC 800798BC 1260484A */  MVMVA      1, 0, 0, 3, 0
/* 6A0C0 800798C0 036C0C00 */  sra        $t5, $t4, 16
/* 6A0C4 800798C4 00640C00 */  sll        $t4, $t4, 16
/* 6A0C8 800798C8 03640C00 */  sra        $t4, $t4, 16
/* 6A0CC 800798CC 1400278E */  lw         $a3, 0x14($s1)
/* 6A0D0 800798D0 1800398E */  lw         $t9, 0x18($s1)
/* 6A0D4 800798D4 00C80948 */  mfc2       $t1, $25 # handwritten instruction
/* 6A0D8 800798D8 00D00A48 */  mfc2       $t2, $26 # handwritten instruction
/* 6A0DC 800798DC 00D80B48 */  mfc2       $t3, $27 # handwritten instruction
/* 6A0E0 800798E0 22482201 */  sub        $t1, $t1, $v0 # handwritten instruction
/* 6A0E4 800798E4 25002005 */  bltz       $t1, .L8007997C
/* 6A0E8 800798E8 00000000 */   nop
/* 6A0EC 800798EC 1E002013 */  beqz       $t9, .L80079968
/* 6A0F0 800798F0 22400900 */   sub       $t0, $zero, $t1 # handwritten instruction
/* 6A0F4 800798F4 2A088901 */  slt        $at, $t4, $t1
/* 6A0F8 800798F8 19002010 */  beqz       $at, .L80079960
/* 6A0FC 800798FC 22104801 */   sub       $v0, $t2, $t0 # handwritten instruction
/* 6A100 80079900 2A088201 */  slt        $at, $t4, $v0
/* 6A104 80079904 16002010 */  beqz       $at, .L80079960
/* 6A108 80079908 22186801 */   sub       $v1, $t3, $t0 # handwritten instruction
/* 6A10C 8007990C 2A088301 */  slt        $at, $t4, $v1
/* 6A110 80079910 13002010 */  beqz       $at, .L80079960
/* 6A114 80079914 00000000 */   nop
/* 6A118 80079918 7400828E */  lw         $v0, (0x1F800074 & 0xFFFF)($s4)
/* 6A11C 8007991C 7800838E */  lw         $v1, (0x1F800078 & 0xFFFF)($s4)
/* 6A120 80079920 7C008E8E */  lw         $t6, (0x1F80007C & 0xFFFF)($s4)
/* 6A124 80079924 0000C248 */  ctc2       $v0, $0 # handwritten instruction
/* 6A128 80079928 0008C348 */  ctc2       $v1, $1 # handwritten instruction
/* 6A12C 8007992C 0010CE48 */  ctc2       $t6, $2 # handwritten instruction
/* 6A130 80079930 00000000 */  nop
/* 6A134 80079934 00000000 */  nop
/* 6A138 80079938 1260484A */  MVMVA      1, 0, 0, 3, 0
/* 6A13C 8007993C 00C80948 */  mfc2       $t1, $25 # handwritten instruction
/* 6A140 80079940 00D00A48 */  mfc2       $t2, $26 # handwritten instruction
/* 6A144 80079944 22102801 */  sub        $v0, $t1, $t0 # handwritten instruction
/* 6A148 80079948 2A088201 */  slt        $at, $t4, $v0
/* 6A14C 8007994C 04002010 */  beqz       $at, .L80079960
/* 6A150 80079950 22184801 */   sub       $v1, $t2, $t0 # handwritten instruction
/* 6A154 80079954 2A088301 */  slt        $at, $t4, $v1
/* 6A158 80079958 03002014 */  bnez       $at, .L80079968
/* 6A15C 8007995C 00000000 */   nop
.L80079960:
/* 6A160 80079960 040019AE */  sw         $t9, 0x4($s0)
/* 6A164 80079964 04001022 */  addi       $s0, $s0, 0x4 # handwritten instruction
.L80079968:
/* 6A168 80079968 2A00E010 */  beqz       $a3, .L80079A14
/* 6A16C 8007996C 00000000 */   nop
/* 6A170 80079970 040007AE */  sw         $a3, 0x4($s0)
/* 6A174 80079974 27000104 */  bgez       $zero, .L80079A14
/* 6A178 80079978 04001022 */   addi      $s0, $s0, 0x4 # handwritten instruction
.L8007997C:
/* 6A17C 8007997C 1E00E010 */  beqz       $a3, .L800799F8
/* 6A180 80079980 22400900 */   sub       $t0, $zero, $t1 # handwritten instruction
/* 6A184 80079984 2A082D01 */  slt        $at, $t1, $t5
/* 6A188 80079988 19002010 */  beqz       $at, .L800799F0
/* 6A18C 8007998C 22104801 */   sub       $v0, $t2, $t0 # handwritten instruction
/* 6A190 80079990 2A084D00 */  slt        $at, $v0, $t5
/* 6A194 80079994 16002010 */  beqz       $at, .L800799F0
/* 6A198 80079998 22186801 */   sub       $v1, $t3, $t0 # handwritten instruction
/* 6A19C 8007999C 2A086D00 */  slt        $at, $v1, $t5
/* 6A1A0 800799A0 13002010 */  beqz       $at, .L800799F0
/* 6A1A4 800799A4 00000000 */   nop
/* 6A1A8 800799A8 7400828E */  lw         $v0, (0x1F800074 & 0xFFFF)($s4)
/* 6A1AC 800799AC 7800838E */  lw         $v1, (0x1F800078 & 0xFFFF)($s4)
/* 6A1B0 800799B0 7C008E8E */  lw         $t6, (0x1F80007C & 0xFFFF)($s4)
/* 6A1B4 800799B4 0000C248 */  ctc2       $v0, $0 # handwritten instruction
/* 6A1B8 800799B8 0008C348 */  ctc2       $v1, $1 # handwritten instruction
/* 6A1BC 800799BC 0010CE48 */  ctc2       $t6, $2 # handwritten instruction
/* 6A1C0 800799C0 00000000 */  nop
/* 6A1C4 800799C4 00000000 */  nop
/* 6A1C8 800799C8 1260484A */  MVMVA      1, 0, 0, 3, 0
/* 6A1CC 800799CC 00C80948 */  mfc2       $t1, $25 # handwritten instruction
/* 6A1D0 800799D0 00D00A48 */  mfc2       $t2, $26 # handwritten instruction
/* 6A1D4 800799D4 22102801 */  sub        $v0, $t1, $t0 # handwritten instruction
/* 6A1D8 800799D8 2A084D00 */  slt        $at, $v0, $t5
/* 6A1DC 800799DC 04002010 */  beqz       $at, .L800799F0
/* 6A1E0 800799E0 22184801 */   sub       $v1, $t2, $t0 # handwritten instruction
/* 6A1E4 800799E4 2A086D00 */  slt        $at, $v1, $t5
/* 6A1E8 800799E8 03002014 */  bnez       $at, .L800799F8
/* 6A1EC 800799EC 00000000 */   nop
.L800799F0:
/* 6A1F0 800799F0 040007AE */  sw         $a3, 0x4($s0)
/* 6A1F4 800799F4 04001022 */  addi       $s0, $s0, 0x4 # handwritten instruction
.L800799F8:
/* 6A1F8 800799F8 06002013 */  beqz       $t9, .L80079A14
/* 6A1FC 800799FC 00000000 */   nop
/* 6A200 80079A00 040019AE */  sw         $t9, 0x4($s0)
/* 6A204 80079A04 03000104 */  bgez       $zero, .L80079A14
/* 6A208 80079A08 04001022 */   addi      $s0, $s0, 0x4 # handwritten instruction
.L80079A0C:
/* 6A20C 80079A0C 0000F1AE */  sw         $s1, 0x0($s7)
/* 6A210 80079A10 0400F722 */  addi       $s7, $s7, 0x4 # handwritten instruction
.L80079A14:
/* 6A214 80079A14 0000828E */  lw         $v0, (0x1F800000 & 0xFFFF)($s4)
/* 6A218 80079A18 0400838E */  lw         $v1, (0x1F800004 & 0xFFFF)($s4)
/* 6A21C 80079A1C 08008E8E */  lw         $t6, (0x1F800008 & 0xFFFF)($s4)
/* 6A220 80079A20 0C008F8E */  lw         $t7, (0x1F80000C & 0xFFFF)($s4)
/* 6A224 80079A24 10009896 */  lhu        $t8, (0x1F800010 & 0xFFFF)($s4)
/* 6A228 80079A28 0000C248 */  ctc2       $v0, $0 # handwritten instruction
/* 6A22C 80079A2C 0008C348 */  ctc2       $v1, $1 # handwritten instruction
/* 6A230 80079A30 0010CE48 */  ctc2       $t6, $2 # handwritten instruction
/* 6A234 80079A34 0018CF48 */  ctc2       $t7, $3 # handwritten instruction
/* 6A238 80079A38 0020D848 */  ctc2       $t8, $4 # handwritten instruction
.L80079A3C:
/* 6A23C 80079A3C 0000118E */  lw         $s1, 0x0($s0)
/* 6A240 80079A40 00000000 */  nop
/* 6A244 80079A44 53FF3016 */  bne        $s1, $s0, .L80079794
/* 6A248 80079A48 00000000 */   nop
/* 6A24C 80079A4C 2210FE02 */  sub        $v0, $s7, $fp # handwritten instruction
/* 6A250 80079A50 FCFF4220 */  addi       $v0, $v0, -0x4 # handwritten instruction
/* 6A254 80079A54 83100200 */  sra        $v0, $v0, 2
/* 6A258 80079A58 0000C2AF */  sw         $v0, 0x0($fp)
/* 6A25C 80079A5C 21408002 */  addu       $t0, $s4, $zero
/* 6A260 80079A60 BC001F8D */  lw         $ra, (0x1F8000BC & 0xFFFF)($t0)
/* 6A264 80079A64 9800108D */  lw         $s0, (0x1F800098 & 0xFFFF)($t0)
/* 6A268 80079A68 9C00118D */  lw         $s1, (0x1F80009C & 0xFFFF)($t0)
/* 6A26C 80079A6C A000128D */  lw         $s2, (0x1F8000A0 & 0xFFFF)($t0)
/* 6A270 80079A70 A400138D */  lw         $s3, (0x1F8000A4 & 0xFFFF)($t0)
/* 6A274 80079A74 A800148D */  lw         $s4, (0x1F8000A8 & 0xFFFF)($t0)
/* 6A278 80079A78 AC00158D */  lw         $s5, (0x1F8000AC & 0xFFFF)($t0)
/* 6A27C 80079A7C B000168D */  lw         $s6, (0x1F8000B0 & 0xFFFF)($t0)
/* 6A280 80079A80 B400178D */  lw         $s7, (0x1F8000B4 & 0xFFFF)($t0)
/* 6A284 80079A84 B8001E8D */  lw         $fp, (0x1F8000B8 & 0xFFFF)($t0)
/* 6A288 80079A88 0800E003 */  jr         $ra
/* 6A28C 80079A8C 00000000 */   nop
.size func_800794C0, . - func_800794C0
