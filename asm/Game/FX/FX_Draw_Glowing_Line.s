.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_Draw_Glowing_Line
/* 3F750 8004EF50 21708000 */  addu       $t6, $a0, $zero
/* 3F754 8004EF54 2120A000 */  addu       $a0, $a1, $zero
/* 3F758 8004EF58 FFFF8224 */  addiu      $v0, $a0, -0x1
/* 3F75C 8004EF5C FF0B422C */  sltiu      $v0, $v0, 0xBFF
/* 3F760 8004EF60 1800A58F */  lw         $a1, 0x18($sp)
/* 3F764 8004EF64 1000A98F */  lw         $t1, 0x10($sp)
/* 3F768 8004EF68 1400AB8F */  lw         $t3, 0x14($sp)
/* 3F76C 8004EF6C 1C00AC8F */  lw         $t4, 0x1C($sp)
/* 3F770 8004EF70 08BE8A8F */  lw         $t2, %gp_rel(gameTrackerX + 0x40)($gp)
/* 3F774 8004EF74 5B004010 */  beqz       $v0, .L8004F0E4
/* 3F778 8004EF78 21680000 */   addu      $t5, $zero, $zero
/* 3F77C 8004EF7C 0400488D */  lw         $t0, 0x4($t2)
/* 3F780 8004EF80 0800438D */  lw         $v1, 0x8($t2)
/* 3F784 8004EF84 48000225 */  addiu      $v0, $t0, 0x48
/* 3F788 8004EF88 2B104300 */  sltu       $v0, $v0, $v1
/* 3F78C 8004EF8C 55004010 */  beqz       $v0, .L8004F0E4
/* 3F790 8004EF90 0001023C */   lui       $v0, (0x1000000 >> 16)
/* 3F794 8004EF94 2410A200 */  and        $v0, $a1, $v0
/* 3F798 8004EF98 04004010 */  beqz       $v0, .L8004EFAC
/* 3F79C 8004EF9C FF00023C */   lui       $v0, (0xFFFFFF >> 16)
/* 3F7A0 8004EFA0 FFFF4234 */  ori        $v0, $v0, (0xFFFFFF & 0xFFFF)
/* 3F7A4 8004EFA4 2428A200 */  and        $a1, $a1, $v0
/* 3F7A8 8004EFA8 01000D24 */  addiu      $t5, $zero, 0x1
.L8004EFAC:
/* 3F7AC 8004EFAC 003A023C */  lui        $v0, (0x3A000000 >> 16)
/* 3F7B0 8004EFB0 2528A200 */  or         $a1, $a1, $v0
/* 3F7B4 8004EFB4 180005AD */  sw         $a1, 0x18($t0)
/* 3F7B8 8004EFB8 280005AD */  sw         $a1, 0x28($t0)
/* 3F7BC 8004EFBC 080002AD */  sw         $v0, 0x8($t0)
/* 3F7C0 8004EFC0 100000AD */  sw         $zero, 0x10($t0)
/* 3F7C4 8004EFC4 20000CAD */  sw         $t4, 0x20($t0)
/* 3F7C8 8004EFC8 30000CAD */  sw         $t4, 0x30($t0)
/* 3F7CC 8004EFCC 380000AD */  sw         $zero, 0x38($t0)
/* 3F7D0 8004EFD0 400000AD */  sw         $zero, 0x40($t0)
/* 3F7D4 8004EFD4 0000C28C */  lw         $v0, 0x0($a2)
/* 3F7D8 8004EFD8 00000000 */  nop
/* 3F7DC 8004EFDC 2C0002AD */  sw         $v0, 0x2C($t0)
/* 3F7E0 8004EFE0 1C0002AD */  sw         $v0, 0x1C($t0)
/* 3F7E4 8004EFE4 0000C294 */  lhu        $v0, 0x0($a2)
/* 3F7E8 8004EFE8 00002395 */  lhu        $v1, 0x0($t1)
/* 3F7EC 8004EFEC 00000000 */  nop
/* 3F7F0 8004EFF0 21104300 */  addu       $v0, $v0, $v1
/* 3F7F4 8004EFF4 0C0002A5 */  sh         $v0, 0xC($t0)
/* 3F7F8 8004EFF8 0200C294 */  lhu        $v0, 0x2($a2)
/* 3F7FC 8004EFFC 02002395 */  lhu        $v1, 0x2($t1)
/* 3F800 8004F000 00000000 */  nop
/* 3F804 8004F004 23104300 */  subu       $v0, $v0, $v1
/* 3F808 8004F008 0E0002A5 */  sh         $v0, 0xE($t0)
/* 3F80C 8004F00C 0000C294 */  lhu        $v0, 0x0($a2)
/* 3F810 8004F010 00002395 */  lhu        $v1, 0x0($t1)
/* 3F814 8004F014 00000000 */  nop
/* 3F818 8004F018 23104300 */  subu       $v0, $v0, $v1
/* 3F81C 8004F01C 3C0002A5 */  sh         $v0, 0x3C($t0)
/* 3F820 8004F020 0200C294 */  lhu        $v0, 0x2($a2)
/* 3F824 8004F024 02002395 */  lhu        $v1, 0x2($t1)
/* 3F828 8004F028 00000000 */  nop
/* 3F82C 8004F02C 21104300 */  addu       $v0, $v0, $v1
/* 3F830 8004F030 3E0002A5 */  sh         $v0, 0x3E($t0)
/* 3F834 8004F034 0000E28C */  lw         $v0, 0x0($a3)
/* 3F838 8004F038 00000000 */  nop
/* 3F83C 8004F03C 340002AD */  sw         $v0, 0x34($t0)
/* 3F840 8004F040 240002AD */  sw         $v0, 0x24($t0)
/* 3F844 8004F044 0000E294 */  lhu        $v0, 0x0($a3)
/* 3F848 8004F048 00006395 */  lhu        $v1, 0x0($t3)
/* 3F84C 8004F04C 00000000 */  nop
/* 3F850 8004F050 21104300 */  addu       $v0, $v0, $v1
/* 3F854 8004F054 140002A5 */  sh         $v0, 0x14($t0)
/* 3F858 8004F058 0200E294 */  lhu        $v0, 0x2($a3)
/* 3F85C 8004F05C 02006395 */  lhu        $v1, 0x2($t3)
/* 3F860 8004F060 00000000 */  nop
/* 3F864 8004F064 23104300 */  subu       $v0, $v0, $v1
/* 3F868 8004F068 160002A5 */  sh         $v0, 0x16($t0)
/* 3F86C 8004F06C 0000E294 */  lhu        $v0, 0x0($a3)
/* 3F870 8004F070 00006395 */  lhu        $v1, 0x0($t3)
/* 3F874 8004F074 00000000 */  nop
/* 3F878 8004F078 23104300 */  subu       $v0, $v0, $v1
/* 3F87C 8004F07C 440002A5 */  sh         $v0, 0x44($t0)
/* 3F880 8004F080 0200E294 */  lhu        $v0, 0x2($a3)
/* 3F884 8004F084 02006395 */  lhu        $v1, 0x2($t3)
/* 3F888 8004F088 00000000 */  nop
/* 3F88C 8004F08C 21104300 */  addu       $v0, $v0, $v1
/* 3F890 8004F090 0400A011 */  beqz       $t5, .L8004F0A4
/* 3F894 8004F094 460002A5 */   sh        $v0, 0x46($t0)
/* 3F898 8004F098 00E1023C */  lui        $v0, (0xE1000640 >> 16)
/* 3F89C 8004F09C 2B3C0108 */  j          .L8004F0AC
/* 3F8A0 8004F0A0 40064234 */   ori       $v0, $v0, (0xE1000640 & 0xFFFF)
.L8004F0A4:
/* 3F8A4 8004F0A4 00E1023C */  lui        $v0, (0xE1000620 >> 16)
/* 3F8A8 8004F0A8 20064234 */  ori        $v0, $v0, (0xE1000620 & 0xFFFF)
.L8004F0AC:
/* 3F8AC 8004F0AC 040002AD */  sw         $v0, 0x4($t0)
/* 3F8B0 8004F0B0 FF00053C */  lui        $a1, (0xFFFFFF >> 16)
/* 3F8B4 8004F0B4 80200400 */  sll        $a0, $a0, 2
/* 3F8B8 8004F0B8 21208E00 */  addu       $a0, $a0, $t6
/* 3F8BC 8004F0BC FFFFA534 */  ori        $a1, $a1, (0xFFFFFF & 0xFFFF)
/* 3F8C0 8004F0C0 0000828C */  lw         $v0, 0x0($a0)
/* 3F8C4 8004F0C4 0011033C */  lui        $v1, (0x11000000 >> 16)
/* 3F8C8 8004F0C8 24104500 */  and        $v0, $v0, $a1
/* 3F8CC 8004F0CC 25104300 */  or         $v0, $v0, $v1
/* 3F8D0 8004F0D0 24280501 */  and        $a1, $t0, $a1
/* 3F8D4 8004F0D4 000002AD */  sw         $v0, 0x0($t0)
/* 3F8D8 8004F0D8 48000225 */  addiu      $v0, $t0, 0x48
/* 3F8DC 8004F0DC 000085AC */  sw         $a1, 0x0($a0)
/* 3F8E0 8004F0E0 040042AD */  sw         $v0, 0x4($t2)
.L8004F0E4:
/* 3F8E4 8004F0E4 0800E003 */  jr         $ra
/* 3F8E8 8004F0E8 00000000 */   nop
.size FX_Draw_Glowing_Line, . - FX_Draw_Glowing_Line
