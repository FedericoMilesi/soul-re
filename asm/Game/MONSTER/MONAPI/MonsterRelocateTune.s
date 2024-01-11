.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MonsterRelocateTune
/* 6F710 8007EF10 1C00888C */  lw         $t0, 0x1C($a0)
/* 6F714 8007EF14 00000000 */  nop
/* 6F718 8007EF18 82000011 */  beqz       $t0, .L8007F124
/* 6F71C 8007EF1C E0AC033C */   lui       $v1, (0xACE00065 >> 16)
/* 6F720 8007EF20 0000028D */  lw         $v0, 0x0($t0)
/* 6F724 8007EF24 65006334 */  ori        $v1, $v1, (0xACE00065 & 0xFFFF)
/* 6F728 8007EF28 7E004314 */  bne        $v0, $v1, .L8007F124
/* 6F72C 8007EF2C 00000000 */   nop
/* 6F730 8007EF30 0400028D */  lw         $v0, 0x4($t0)
/* 6F734 8007EF34 00000000 */  nop
/* 6F738 8007EF38 02004010 */  beqz       $v0, .L8007EF44
/* 6F73C 8007EF3C 21180000 */   addu      $v1, $zero, $zero
/* 6F740 8007EF40 21184500 */  addu       $v1, $v0, $a1
.L8007EF44:
/* 6F744 8007EF44 0800028D */  lw         $v0, 0x8($t0)
/* 6F748 8007EF48 21200000 */  addu       $a0, $zero, $zero
/* 6F74C 8007EF4C 02004010 */  beqz       $v0, .L8007EF58
/* 6F750 8007EF50 040003AD */   sw        $v1, 0x4($t0)
/* 6F754 8007EF54 21204500 */  addu       $a0, $v0, $a1
.L8007EF58:
/* 6F758 8007EF58 0C00028D */  lw         $v0, 0xC($t0)
/* 6F75C 8007EF5C 21180000 */  addu       $v1, $zero, $zero
/* 6F760 8007EF60 02004010 */  beqz       $v0, .L8007EF6C
/* 6F764 8007EF64 080004AD */   sw        $a0, 0x8($t0)
/* 6F768 8007EF68 21184500 */  addu       $v1, $v0, $a1
.L8007EF6C:
/* 6F76C 8007EF6C 3000028D */  lw         $v0, 0x30($t0)
/* 6F770 8007EF70 21200000 */  addu       $a0, $zero, $zero
/* 6F774 8007EF74 02004010 */  beqz       $v0, .L8007EF80
/* 6F778 8007EF78 0C0003AD */   sw        $v1, 0xC($t0)
/* 6F77C 8007EF7C 21204500 */  addu       $a0, $v0, $a1
.L8007EF80:
/* 6F780 8007EF80 3400028D */  lw         $v0, 0x34($t0)
/* 6F784 8007EF84 21180000 */  addu       $v1, $zero, $zero
/* 6F788 8007EF88 02004010 */  beqz       $v0, .L8007EF94
/* 6F78C 8007EF8C 300004AD */   sw        $a0, 0x30($t0)
/* 6F790 8007EF90 21184500 */  addu       $v1, $v0, $a1
.L8007EF94:
/* 6F794 8007EF94 3800028D */  lw         $v0, 0x38($t0)
/* 6F798 8007EF98 21200000 */  addu       $a0, $zero, $zero
/* 6F79C 8007EF9C 02004010 */  beqz       $v0, .L8007EFA8
/* 6F7A0 8007EFA0 340003AD */   sw        $v1, 0x34($t0)
/* 6F7A4 8007EFA4 21204500 */  addu       $a0, $v0, $a1
.L8007EFA8:
/* 6F7A8 8007EFA8 3C00028D */  lw         $v0, 0x3C($t0)
/* 6F7AC 8007EFAC 21180000 */  addu       $v1, $zero, $zero
/* 6F7B0 8007EFB0 02004010 */  beqz       $v0, .L8007EFBC
/* 6F7B4 8007EFB4 380004AD */   sw        $a0, 0x38($t0)
/* 6F7B8 8007EFB8 21184500 */  addu       $v1, $v0, $a1
.L8007EFBC:
/* 6F7BC 8007EFBC 4000028D */  lw         $v0, 0x40($t0)
/* 6F7C0 8007EFC0 21200000 */  addu       $a0, $zero, $zero
/* 6F7C4 8007EFC4 02004010 */  beqz       $v0, .L8007EFD0
/* 6F7C8 8007EFC8 3C0003AD */   sw        $v1, 0x3C($t0)
/* 6F7CC 8007EFCC 21204500 */  addu       $a0, $v0, $a1
.L8007EFD0:
/* 6F7D0 8007EFD0 4400028D */  lw         $v0, 0x44($t0)
/* 6F7D4 8007EFD4 21180000 */  addu       $v1, $zero, $zero
/* 6F7D8 8007EFD8 02004010 */  beqz       $v0, .L8007EFE4
/* 6F7DC 8007EFDC 400004AD */   sw        $a0, 0x40($t0)
/* 6F7E0 8007EFE0 21184500 */  addu       $v1, $v0, $a1
.L8007EFE4:
/* 6F7E4 8007EFE4 4800028D */  lw         $v0, 0x48($t0)
/* 6F7E8 8007EFE8 21200000 */  addu       $a0, $zero, $zero
/* 6F7EC 8007EFEC 02004010 */  beqz       $v0, .L8007EFF8
/* 6F7F0 8007EFF0 440003AD */   sw        $v1, 0x44($t0)
/* 6F7F4 8007EFF4 21204500 */  addu       $a0, $v0, $a1
.L8007EFF8:
/* 6F7F8 8007EFF8 4C00028D */  lw         $v0, 0x4C($t0)
/* 6F7FC 8007EFFC 21180000 */  addu       $v1, $zero, $zero
/* 6F800 8007F000 02004010 */  beqz       $v0, .L8007F00C
/* 6F804 8007F004 480004AD */   sw        $a0, 0x48($t0)
/* 6F808 8007F008 21184500 */  addu       $v1, $v0, $a1
.L8007F00C:
/* 6F80C 8007F00C 3000098D */  lw         $t1, 0x30($t0)
/* 6F810 8007F010 28000281 */  lb         $v0, 0x28($t0)
/* 6F814 8007F014 21380000 */  addu       $a3, $zero, $zero
/* 6F818 8007F018 35004018 */  blez       $v0, .L8007F0F0
/* 6F81C 8007F01C 4C0003AD */   sw        $v1, 0x4C($t0)
.L8007F020:
/* 6F820 8007F020 0000238D */  lw         $v1, 0x0($t1)
/* 6F824 8007F024 00000000 */  nop
/* 6F828 8007F028 02006010 */  beqz       $v1, .L8007F034
/* 6F82C 8007F02C 21100000 */   addu      $v0, $zero, $zero
/* 6F830 8007F030 21106500 */  addu       $v0, $v1, $a1
.L8007F034:
/* 6F834 8007F034 21180000 */  addu       $v1, $zero, $zero
/* 6F838 8007F038 000022AD */  sw         $v0, 0x0($t1)
/* 6F83C 8007F03C 3000048D */  lw         $a0, 0x30($t0)
/* 6F840 8007F040 0900E018 */  blez       $a3, .L8007F068
/* 6F844 8007F044 21304000 */   addu      $a2, $v0, $zero
.L8007F048:
/* 6F848 8007F048 0000828C */  lw         $v0, 0x0($a0)
/* 6F84C 8007F04C 00000000 */  nop
/* 6F850 8007F050 05004610 */  beq        $v0, $a2, .L8007F068
/* 6F854 8007F054 00000000 */   nop
/* 6F858 8007F058 01006324 */  addiu      $v1, $v1, 0x1
/* 6F85C 8007F05C 2A106700 */  slt        $v0, $v1, $a3
/* 6F860 8007F060 F9FF4014 */  bnez       $v0, .L8007F048
/* 6F864 8007F064 04008424 */   addiu     $a0, $a0, 0x4
.L8007F068:
/* 6F868 8007F068 1B006714 */  bne        $v1, $a3, .L8007F0D8
/* 6F86C 8007F06C 00000000 */   nop
/* 6F870 8007F070 0000C28C */  lw         $v0, 0x0($a2)
/* 6F874 8007F074 00000000 */  nop
/* 6F878 8007F078 02004010 */  beqz       $v0, .L8007F084
/* 6F87C 8007F07C 21180000 */   addu      $v1, $zero, $zero
/* 6F880 8007F080 21184500 */  addu       $v1, $v0, $a1
.L8007F084:
/* 6F884 8007F084 0400C28C */  lw         $v0, 0x4($a2)
/* 6F888 8007F088 21200000 */  addu       $a0, $zero, $zero
/* 6F88C 8007F08C 02004010 */  beqz       $v0, .L8007F098
/* 6F890 8007F090 0000C3AC */   sw        $v1, 0x0($a2)
/* 6F894 8007F094 21204500 */  addu       $a0, $v0, $a1
.L8007F098:
/* 6F898 8007F098 0800C28C */  lw         $v0, 0x8($a2)
/* 6F89C 8007F09C 21180000 */  addu       $v1, $zero, $zero
/* 6F8A0 8007F0A0 02004010 */  beqz       $v0, .L8007F0AC
/* 6F8A4 8007F0A4 0400C4AC */   sw        $a0, 0x4($a2)
/* 6F8A8 8007F0A8 21184500 */  addu       $v1, $v0, $a1
.L8007F0AC:
/* 6F8AC 8007F0AC 0C00C28C */  lw         $v0, 0xC($a2)
/* 6F8B0 8007F0B0 21200000 */  addu       $a0, $zero, $zero
/* 6F8B4 8007F0B4 02004010 */  beqz       $v0, .L8007F0C0
/* 6F8B8 8007F0B8 0800C3AC */   sw        $v1, 0x8($a2)
/* 6F8BC 8007F0BC 21204500 */  addu       $a0, $v0, $a1
.L8007F0C0:
/* 6F8C0 8007F0C0 1000C38C */  lw         $v1, 0x10($a2)
/* 6F8C4 8007F0C4 21100000 */  addu       $v0, $zero, $zero
/* 6F8C8 8007F0C8 02006010 */  beqz       $v1, .L8007F0D4
/* 6F8CC 8007F0CC 0C00C4AC */   sw        $a0, 0xC($a2)
/* 6F8D0 8007F0D0 21106500 */  addu       $v0, $v1, $a1
.L8007F0D4:
/* 6F8D4 8007F0D4 1000C2AC */  sw         $v0, 0x10($a2)
.L8007F0D8:
/* 6F8D8 8007F0D8 0100E724 */  addiu      $a3, $a3, 0x1
/* 6F8DC 8007F0DC 28000281 */  lb         $v0, 0x28($t0)
/* 6F8E0 8007F0E0 00000000 */  nop
/* 6F8E4 8007F0E4 2A10E200 */  slt        $v0, $a3, $v0
/* 6F8E8 8007F0E8 CDFF4014 */  bnez       $v0, .L8007F020
/* 6F8EC 8007F0EC 04002925 */   addiu     $t1, $t1, 0x4
.L8007F0F0:
/* 6F8F0 8007F0F0 29000781 */  lb         $a3, 0x29($t0)
/* 6F8F4 8007F0F4 3400028D */  lw         $v0, 0x34($t0)
/* 6F8F8 8007F0F8 0A00E010 */  beqz       $a3, .L8007F124
/* 6F8FC 8007F0FC 00000000 */   nop
.L8007F100:
/* 6F900 8007F100 0000448C */  lw         $a0, 0x0($v0)
/* 6F904 8007F104 00000000 */  nop
/* 6F908 8007F108 02008010 */  beqz       $a0, .L8007F114
/* 6F90C 8007F10C 21180000 */   addu      $v1, $zero, $zero
/* 6F910 8007F110 21188500 */  addu       $v1, $a0, $a1
.L8007F114:
/* 6F914 8007F114 000043AC */  sw         $v1, 0x0($v0)
/* 6F918 8007F118 FFFFE724 */  addiu      $a3, $a3, -0x1
/* 6F91C 8007F11C F8FFE014 */  bnez       $a3, .L8007F100
/* 6F920 8007F120 04004224 */   addiu     $v0, $v0, 0x4
.L8007F124:
/* 6F924 8007F124 0800E003 */  jr         $ra
/* 6F928 8007F128 00000000 */   nop
.size MonsterRelocateTune, . - MonsterRelocateTune
