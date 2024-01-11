.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_Combat
/* 7A638 80089E38 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 7A63C 80089E3C 1400B1AF */  sw         $s1, 0x14($sp)
/* 7A640 80089E40 21888000 */  addu       $s1, $a0, $zero
/* 7A644 80089E44 2000BFAF */  sw         $ra, 0x20($sp)
/* 7A648 80089E48 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 7A64C 80089E4C 1800B2AF */  sw         $s2, 0x18($sp)
/* 7A650 80089E50 1000B0AF */  sw         $s0, 0x10($sp)
/* 7A654 80089E54 6C01308E */  lw         $s0, 0x16C($s1)
/* 7A658 80089E58 00000000 */  nop
/* 7A65C 80089E5C C400138E */  lw         $s3, 0xC4($s0)
/* 7A660 80089E60 00000000 */  nop
/* 7A664 80089E64 06006012 */  beqz       $s3, .L80089E80
/* 7A668 80089E68 00000000 */   nop
/* 7A66C 80089E6C 0000038E */  lw         $v1, 0x0($s0)
/* 7A670 80089E70 00000000 */  nop
/* 7A674 80089E74 04006230 */  andi       $v0, $v1, 0x4
/* 7A678 80089E78 04004010 */  beqz       $v0, .L80089E8C
/* 7A67C 80089E7C 0010023C */   lui       $v0, (0x10000000 >> 16)
.L80089E80:
/* 7A680 80089E80 21202002 */  addu       $a0, $s1, $zero
/* 7A684 80089E84 3D280208 */  j          .L8008A0F4
/* 7A688 80089E88 02000524 */   addiu     $a1, $zero, 0x2
.L80089E8C:
/* 7A68C 80089E8C 24106200 */  and        $v0, $v1, $v0
/* 7A690 80089E90 08004010 */  beqz       $v0, .L80089EB4
/* 7A694 80089E94 00000000 */   nop
/* 7A698 80089E98 16006296 */  lhu        $v0, 0x16($s3)
/* 7A69C 80089E9C 00000000 */  nop
/* 7A6A0 80089EA0 00104230 */  andi       $v0, $v0, 0x1000
/* 7A6A4 80089EA4 03004010 */  beqz       $v0, .L80089EB4
/* 7A6A8 80089EA8 21202002 */   addu      $a0, $s1, $zero
/* 7A6AC 80089EAC 3D280208 */  j          .L8008A0F4
/* 7A6B0 80089EB0 1B000524 */   addiu     $a1, $zero, 0x1B
.L80089EB4:
/* 7A6B4 80089EB4 530D020C */  jal        MON_ValidPosition
/* 7A6B8 80089EB8 21202002 */   addu      $a0, $s1, $zero
/* 7A6BC 80089EBC 0A004014 */  bnez       $v0, .L80089EE8
/* 7A6C0 80089EC0 21202002 */   addu      $a0, $s1, $zero
/* 7A6C4 80089EC4 9006020C */  jal        MON_GetTime
/* 7A6C8 80089EC8 21202002 */   addu      $a0, $s1, $zero
/* 7A6CC 80089ECC 1801038E */  lw         $v1, 0x118($s0)
/* 7A6D0 80089ED0 00000000 */  nop
/* 7A6D4 80089ED4 2B104300 */  sltu       $v0, $v0, $v1
/* 7A6D8 80089ED8 03004014 */  bnez       $v0, .L80089EE8
/* 7A6DC 80089EDC 21202002 */   addu      $a0, $s1, $zero
/* 7A6E0 80089EE0 3D280208 */  j          .L8008A0F4
/* 7A6E4 80089EE4 01000524 */   addiu     $a1, $zero, 0x1
.L80089EE8:
/* 7A6E8 80089EE8 6801038E */  lw         $v1, 0x168($s0)
/* 7A6EC 80089EEC 0400628E */  lw         $v0, 0x4($s3)
/* 7A6F0 80089EF0 0800728C */  lw         $s2, 0x8($v1)
/* 7A6F4 80089EF4 5C004224 */  addiu      $v0, $v0, 0x5C
/* 7A6F8 80089EF8 DD0C020C */  jal        MON_ShouldIFlee
/* 7A6FC 80089EFC 200102AE */   sw        $v0, 0x120($s0)
/* 7A700 80089F00 03004010 */  beqz       $v0, .L80089F10
/* 7A704 80089F04 21202002 */   addu      $a0, $s1, $zero
/* 7A708 80089F08 3D280208 */  j          .L8008A0F4
/* 7A70C 80089F0C 13000524 */   addiu     $a1, $zero, 0x13
.L80089F10:
/* 7A710 80089F10 14006286 */  lh         $v0, 0x14($s3)
/* 7A714 80089F14 0A004386 */  lh         $v1, 0xA($s2)
/* 7A718 80089F18 00000000 */  nop
/* 7A71C 80089F1C 2A104300 */  slt        $v0, $v0, $v1
/* 7A720 80089F20 05004014 */  bnez       $v0, .L80089F38
/* 7A724 80089F24 0A000224 */   addiu     $v0, $zero, 0xA
/* 7A728 80089F28 5A010392 */  lbu        $v1, 0x15A($s0)
/* 7A72C 80089F2C 00000000 */  nop
/* 7A730 80089F30 61006214 */  bne        $v1, $v0, .L8008A0B8
/* 7A734 80089F34 09000224 */   addiu     $v0, $zero, 0x9
.L80089F38:
/* 7A738 80089F38 0000048E */  lw         $a0, 0x0($s0)
/* 7A73C 80089F3C 0200023C */  lui        $v0, (0x20000 >> 16)
/* 7A740 80089F40 24108200 */  and        $v0, $a0, $v0
/* 7A744 80089F44 0C004010 */  beqz       $v0, .L80089F78
/* 7A748 80089F48 00000000 */   nop
/* 7A74C 80089F4C 1800228E */  lw         $v0, 0x18($s1)
/* 7A750 80089F50 00000000 */  nop
/* 7A754 80089F54 12004230 */  andi       $v0, $v0, 0x12
/* 7A758 80089F58 07004010 */  beqz       $v0, .L80089F78
/* 7A75C 80089F5C FDFF023C */   lui       $v0, (0xFFFDFFFF >> 16)
/* 7A760 80089F60 FFFF4234 */  ori        $v0, $v0, (0xFFFDFFFF & 0xFFFF)
/* 7A764 80089F64 FFBF033C */  lui        $v1, (0xBFFFFFFF >> 16)
/* 7A768 80089F68 FFFF6334 */  ori        $v1, $v1, (0xBFFFFFFF & 0xFFFF)
/* 7A76C 80089F6C 24108200 */  and        $v0, $a0, $v0
/* 7A770 80089F70 24104300 */  and        $v0, $v0, $v1
/* 7A774 80089F74 000002AE */  sw         $v0, 0x0($s0)
.L80089F78:
/* 7A778 80089F78 B701020C */  jal        MON_ShouldIEvade
/* 7A77C 80089F7C 21202002 */   addu      $a0, $s1, $zero
/* 7A780 80089F80 0F004010 */  beqz       $v0, .L80089FC0
/* 7A784 80089F84 0040033C */   lui       $v1, (0x40000000 >> 16)
/* 7A788 80089F88 0B02020C */  jal        MON_ChooseEvadeMove
/* 7A78C 80089F8C 21202002 */   addu      $a0, $s1, $zero
/* 7A790 80089F90 41004010 */  beqz       $v0, .L8008A098
/* 7A794 80089F94 21202002 */   addu      $a0, $s1, $zero
/* 7A798 80089F98 21284000 */  addu       $a1, $v0, $zero
/* 7A79C 80089F9C B6FF010C */  jal        MON_PlayAnim
/* 7A7A0 80089FA0 01000624 */   addiu     $a2, $zero, 0x1
/* 7A7A4 80089FA4 0000028E */  lw         $v0, 0x0($s0)
/* 7A7A8 80089FA8 0200033C */  lui        $v1, (0x20000 >> 16)
/* 7A7AC 80089FAC 25104300 */  or         $v0, $v0, $v1
/* 7A7B0 80089FB0 0040033C */  lui        $v1, (0x40000000 >> 16)
/* 7A7B4 80089FB4 25104300 */  or         $v0, $v0, $v1
/* 7A7B8 80089FB8 26280208 */  j          .L8008A098
/* 7A7BC 80089FBC 000002AE */   sw        $v0, 0x0($s0)
.L80089FC0:
/* 7A7C0 80089FC0 0000028E */  lw         $v0, 0x0($s0)
/* 7A7C4 80089FC4 00000000 */  nop
/* 7A7C8 80089FC8 24104300 */  and        $v0, $v0, $v1
/* 7A7CC 80089FCC 33004014 */  bnez       $v0, .L8008A09C
/* 7A7D0 80089FD0 21202002 */   addu      $a0, $s1, $zero
/* 7A7D4 80089FD4 5A010392 */  lbu        $v1, 0x15A($s0)
/* 7A7D8 80089FD8 0A000224 */  addiu      $v0, $zero, 0xA
/* 7A7DC 80089FDC 05006214 */  bne        $v1, $v0, .L80089FF4
/* 7A7E0 80089FE0 00000000 */   nop
/* 7A7E4 80089FE4 A10C020C */  jal        MON_ShouldIFireAtTarget
/* 7A7E8 80089FE8 21286002 */   addu      $a1, $s3, $zero
/* 7A7EC 80089FEC 04280208 */  j          .L8008A010
/* 7A7F0 80089FF0 21284000 */   addu      $a1, $v0, $zero
.L80089FF4:
/* 7A7F4 80089FF4 5F01020C */  jal        MON_ChooseAttack
/* 7A7F8 80089FF8 21286002 */   addu      $a1, $s3, $zero
/* 7A7FC 80089FFC 21202002 */  addu       $a0, $s1, $zero
/* 7A800 8008A000 21286002 */  addu       $a1, $s3, $zero
/* 7A804 8008A004 F500020C */  jal        MON_ShouldIAttack
/* 7A808 8008A008 21304000 */   addu      $a2, $v0, $zero
/* 7A80C 8008A00C 21284000 */  addu       $a1, $v0, $zero
.L8008A010:
/* 7A810 8008A010 01000224 */  addiu      $v0, $zero, 0x1
/* 7A814 8008A014 0600A214 */  bne        $a1, $v0, .L8008A030
/* 7A818 8008A018 02000224 */   addiu     $v0, $zero, 0x2
/* 7A81C 8008A01C 21202002 */  addu       $a0, $s1, $zero
/* 7A820 8008A020 91FE010C */  jal        MON_SwitchState
/* 7A824 8008A024 06000524 */   addiu     $a1, $zero, 0x6
/* 7A828 8008A028 27280208 */  j          .L8008A09C
/* 7A82C 8008A02C 21202002 */   addu      $a0, $s1, $zero
.L8008A030:
/* 7A830 8008A030 0600A214 */  bne        $a1, $v0, .L8008A04C
/* 7A834 8008A034 0200123C */   lui       $s2, (0x20000 >> 16)
/* 7A838 8008A038 21202002 */  addu       $a0, $s1, $zero
/* 7A83C 8008A03C 91FE010C */  jal        MON_SwitchState
/* 7A840 8008A040 1C000524 */   addiu     $a1, $zero, 0x1C
/* 7A844 8008A044 27280208 */  j          .L8008A09C
/* 7A848 8008A048 21202002 */   addu      $a0, $s1, $zero
.L8008A04C:
/* 7A84C 8008A04C 0000028E */  lw         $v0, 0x0($s0)
/* 7A850 8008A050 00000000 */  nop
/* 7A854 8008A054 24105200 */  and        $v0, $v0, $s2
/* 7A858 8008A058 10004014 */  bnez       $v0, .L8008A09C
/* 7A85C 8008A05C 21202002 */   addu      $a0, $s1, $zero
/* 7A860 8008A060 2202020C */  jal        MON_ChooseCombatMove
/* 7A864 8008A064 21202002 */   addu      $a0, $s1, $zero
/* 7A868 8008A068 09004010 */  beqz       $v0, .L8008A090
/* 7A86C 8008A06C 21202002 */   addu      $a0, $s1, $zero
/* 7A870 8008A070 21284000 */  addu       $a1, $v0, $zero
/* 7A874 8008A074 B6FF010C */  jal        MON_PlayAnim
/* 7A878 8008A078 01000624 */   addiu     $a2, $zero, 0x1
/* 7A87C 8008A07C 0000028E */  lw         $v0, 0x0($s0)
/* 7A880 8008A080 00000000 */  nop
/* 7A884 8008A084 25105200 */  or         $v0, $v0, $s2
/* 7A888 8008A088 26280208 */  j          .L8008A098
/* 7A88C 8008A08C 000002AE */   sw        $v0, 0x0($s0)
.L8008A090:
/* 7A890 8008A090 9D03020C */  jal        MON_PlayCombatIdle
/* 7A894 8008A094 02000524 */   addiu     $a1, $zero, 0x2
.L8008A098:
/* 7A898 8008A098 21202002 */  addu       $a0, $s1, $zero
.L8008A09C:
/* 7A89C 8008A09C 6801028E */  lw         $v0, 0x168($s0)
/* 7A8A0 8008A0A0 0400658E */  lw         $a1, 0x4($s3)
/* 7A8A4 8008A0A4 1C004684 */  lh         $a2, 0x1C($v0)
/* 7A8A8 8008A0A8 6604020C */  jal        MON_TurnToPosition
/* 7A8AC 8008A0AC 5C00A524 */   addiu     $a1, $a1, 0x5C
/* 7A8B0 8008A0B0 3F280208 */  j          .L8008A0FC
/* 7A8B4 8008A0B4 00000000 */   nop
.L8008A0B8:
/* 7A8B8 8008A0B8 03006214 */  bne        $v1, $v0, .L8008A0C8
/* 7A8BC 8008A0BC 01000524 */   addiu     $a1, $zero, 0x1
/* 7A8C0 8008A0C0 3C280208 */  j          .L8008A0F0
/* 7A8C4 8008A0C4 05000524 */   addiu     $a1, $zero, 0x5
.L8008A0C8:
/* 7A8C8 8008A0C8 0000028E */  lw         $v0, 0x0($s0)
/* 7A8CC 8008A0CC 0002033C */  lui        $v1, (0x2000000 >> 16)
/* 7A8D0 8008A0D0 24104300 */  and        $v0, $v0, $v1
/* 7A8D4 8008A0D4 07004010 */  beqz       $v0, .L8008A0F4
/* 7A8D8 8008A0D8 21202002 */   addu      $a0, $s1, $zero
/* 7A8DC 8008A0DC CC00028E */  lw         $v0, 0xCC($s0)
/* 7A8E0 8008A0E0 00000000 */  nop
/* 7A8E4 8008A0E4 03004014 */  bnez       $v0, .L8008A0F4
/* 7A8E8 8008A0E8 00000000 */   nop
/* 7A8EC 8008A0EC 13000524 */  addiu      $a1, $zero, 0x13
.L8008A0F0:
/* 7A8F0 8008A0F0 21202002 */  addu       $a0, $s1, $zero
.L8008A0F4:
/* 7A8F4 8008A0F4 91FE010C */  jal        MON_SwitchState
/* 7A8F8 8008A0F8 00000000 */   nop
.L8008A0FC:
/* 7A8FC 8008A0FC F616020C */  jal        MON_IdleQueueHandler
/* 7A900 8008A100 21202002 */   addu      $a0, $s1, $zero
/* 7A904 8008A104 2000BF8F */  lw         $ra, 0x20($sp)
/* 7A908 8008A108 1C00B38F */  lw         $s3, 0x1C($sp)
/* 7A90C 8008A10C 1800B28F */  lw         $s2, 0x18($sp)
/* 7A910 8008A110 1400B18F */  lw         $s1, 0x14($sp)
/* 7A914 8008A114 1000B08F */  lw         $s0, 0x10($sp)
/* 7A918 8008A118 0800E003 */  jr         $ra
/* 7A91C 8008A11C 2800BD27 */   addiu     $sp, $sp, 0x28
.size MON_Combat, . - MON_Combat
