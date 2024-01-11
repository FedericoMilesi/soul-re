.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C35B8
/* B3DB8 800C35B8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B3DBC 800C35BC 1000B0AF */  sw         $s0, 0x10($sp)
/* B3DC0 800C35C0 21808000 */  addu       $s0, $a0, $zero
/* B3DC4 800C35C4 1400BFAF */  sw         $ra, 0x14($sp)
/* B3DC8 800C35C8 46000392 */  lbu        $v1, 0x46($s0)
/* B3DCC 800C35CC 03000224 */  addiu      $v0, $zero, 0x3
/* B3DD0 800C35D0 3C006210 */  beq        $v1, $v0, .L800C36C4
/* B3DD4 800C35D4 04006228 */   slti      $v0, $v1, 0x4
/* B3DD8 800C35D8 05004010 */  beqz       $v0, .L800C35F0
/* B3DDC 800C35DC 02000224 */   addiu     $v0, $zero, 0x2
/* B3DE0 800C35E0 08006210 */  beq        $v1, $v0, .L800C3604
/* B3DE4 800C35E4 01000224 */   addiu     $v0, $zero, 0x1
/* B3DE8 800C35E8 060E0308 */  j          .L800C3818
/* B3DEC 800C35EC 00000000 */   nop
.L800C35F0:
/* B3DF0 800C35F0 04000224 */  addiu      $v0, $zero, 0x4
/* B3DF4 800C35F4 4D006210 */  beq        $v1, $v0, .L800C372C
/* B3DF8 800C35F8 01000224 */   addiu     $v0, $zero, 0x1
/* B3DFC 800C35FC 060E0308 */  j          .L800C3818
/* B3E00 800C3600 00000000 */   nop
.L800C3604:
/* B3E04 800C3604 3C00048E */  lw         $a0, 0x3C($s0)
/* B3E08 800C3608 00000000 */  nop
/* B3E0C 800C360C 07008290 */  lbu        $v0, 0x7($a0)
/* B3E10 800C3610 00000000 */  nop
/* B3E14 800C3614 80004014 */  bnez       $v0, .L800C3818
/* B3E18 800C3618 21100000 */   addu      $v0, $zero, $zero
/* B3E1C 800C361C E3000392 */  lbu        $v1, 0xE3($s0)
/* B3E20 800C3620 03008290 */  lbu        $v0, 0x3($a0)
/* B3E24 800C3624 00000000 */  nop
/* B3E28 800C3628 12006214 */  bne        $v1, $v0, .L800C3674
/* B3E2C 800C362C FFFF0234 */   ori       $v0, $zero, 0xFFFF
/* B3E30 800C3630 E4000392 */  lbu        $v1, 0xE4($s0)
/* B3E34 800C3634 04008290 */  lbu        $v0, 0x4($a0)
/* B3E38 800C3638 00000000 */  nop
/* B3E3C 800C363C 0D006214 */  bne        $v1, $v0, .L800C3674
/* B3E40 800C3640 FFFF0234 */   ori       $v0, $zero, 0xFFFF
/* B3E44 800C3644 E9000392 */  lbu        $v1, 0xE9($s0)
/* B3E48 800C3648 05008290 */  lbu        $v0, 0x5($a0)
/* B3E4C 800C364C 00000000 */  nop
/* B3E50 800C3650 08006214 */  bne        $v1, $v0, .L800C3674
/* B3E54 800C3654 FFFF0234 */   ori       $v0, $zero, 0xFFFF
/* B3E58 800C3658 EA000392 */  lbu        $v1, 0xEA($s0)
/* B3E5C 800C365C 06008290 */  lbu        $v0, 0x6($a0)
/* B3E60 800C3660 00000000 */  nop
/* B3E64 800C3664 03006214 */  bne        $v1, $v0, .L800C3674
/* B3E68 800C3668 FFFF0234 */   ori       $v0, $zero, 0xFFFF
/* B3E6C 800C366C 9E0D0308 */  j          .L800C3678
/* B3E70 800C3670 EE0000A6 */   sh        $zero, 0xEE($s0)
.L800C3674:
/* B3E74 800C3674 EE0002A6 */  sh         $v0, 0xEE($s0)
.L800C3678:
/* B3E78 800C3678 3C00028E */  lw         $v0, 0x3C($s0)
/* B3E7C 800C367C 3C00038E */  lw         $v1, 0x3C($s0)
/* B3E80 800C3680 03004290 */  lbu        $v0, 0x3($v0)
/* B3E84 800C3684 00000000 */  nop
/* B3E88 800C3688 E30002A2 */  sb         $v0, 0xE3($s0)
/* B3E8C 800C368C 04006290 */  lbu        $v0, 0x4($v1)
/* B3E90 800C3690 3C00038E */  lw         $v1, 0x3C($s0)
/* B3E94 800C3694 E60000A6 */  sh         $zero, 0xE6($s0)
/* B3E98 800C3698 E40002A2 */  sb         $v0, 0xE4($s0)
/* B3E9C 800C369C 05006290 */  lbu        $v0, 0x5($v1)
/* B3EA0 800C36A0 3C00038E */  lw         $v1, 0x3C($s0)
/* B3EA4 800C36A4 E90002A2 */  sb         $v0, 0xE9($s0)
/* B3EA8 800C36A8 06006290 */  lbu        $v0, 0x6($v1)
/* B3EAC 800C36AC EE000396 */  lhu        $v1, 0xEE($s0)
/* B3EB0 800C36B0 EC0000A6 */  sh         $zero, 0xEC($s0)
/* B3EB4 800C36B4 16006014 */  bnez       $v1, .L800C3710
/* B3EB8 800C36B8 EA0002A2 */   sb        $v0, 0xEA($s0)
/* B3EBC 800C36BC 050E0308 */  j          .L800C3814
/* B3EC0 800C36C0 EB0000A2 */   sb        $zero, 0xEB($s0)
.L800C36C4:
/* B3EC4 800C36C4 3C00038E */  lw         $v1, 0x3C($s0)
/* B3EC8 800C36C8 00000000 */  nop
/* B3ECC 800C36CC 02006290 */  lbu        $v0, 0x2($v1)
/* B3ED0 800C36D0 00000000 */  nop
/* B3ED4 800C36D4 50004014 */  bnez       $v0, .L800C3818
/* B3ED8 800C36D8 21100000 */   addu      $v0, $zero, $zero
/* B3EDC 800C36DC 03006290 */  lbu        $v0, 0x3($v1)
/* B3EE0 800C36E0 00000000 */  nop
/* B3EE4 800C36E4 4C004014 */  bnez       $v0, .L800C3818
/* B3EE8 800C36E8 21100000 */   addu      $v0, $zero, $zero
/* B3EEC 800C36EC 04006290 */  lbu        $v0, 0x4($v1)
/* B3EF0 800C36F0 05006390 */  lbu        $v1, 0x5($v1)
/* B3EF4 800C36F4 00120200 */  sll        $v0, $v0, 8
/* B3EF8 800C36F8 21206200 */  addu       $a0, $v1, $v0
/* B3EFC 800C36FC EE000396 */  lhu        $v1, 0xEE($s0)
/* B3F00 800C3700 FFFF8230 */  andi       $v0, $a0, 0xFFFF
/* B3F04 800C3704 04006210 */  beq        $v1, $v0, .L800C3718
/* B3F08 800C3708 E60004A6 */   sh        $a0, 0xE6($s0)
/* B3F0C 800C370C EE0004A6 */  sh         $a0, 0xEE($s0)
.L800C3710:
/* B3F10 800C3710 060E0308 */  j          .L800C3818
/* B3F14 800C3714 21100000 */   addu      $v0, $zero, $zero
.L800C3718:
/* B3F18 800C3718 FFFF0234 */  ori        $v0, $zero, 0xFFFF
/* B3F1C 800C371C EE0002A6 */  sh         $v0, 0xEE($s0)
/* B3F20 800C3720 EB0000A2 */  sb         $zero, 0xEB($s0)
/* B3F24 800C3724 050E0308 */  j          .L800C3814
/* B3F28 800C3728 470000A2 */   sb        $zero, 0x47($s0)
.L800C372C:
/* B3F2C 800C372C 3C00038E */  lw         $v1, 0x3C($s0)
/* B3F30 800C3730 00000000 */  nop
/* B3F34 800C3734 02006290 */  lbu        $v0, 0x2($v1)
/* B3F38 800C3738 00000000 */  nop
/* B3F3C 800C373C 36004014 */  bnez       $v0, .L800C3818
/* B3F40 800C3740 21100000 */   addu      $v0, $zero, $zero
/* B3F44 800C3744 03006290 */  lbu        $v0, 0x3($v1)
/* B3F48 800C3748 00000000 */  nop
/* B3F4C 800C374C 32004014 */  bnez       $v0, .L800C3818
/* B3F50 800C3750 21100000 */   addu      $v0, $zero, $zero
/* B3F54 800C3754 EC000496 */  lhu        $a0, 0xEC($s0)
/* B3F58 800C3758 04006390 */  lbu        $v1, 0x4($v1)
/* B3F5C 800C375C 47000292 */  lbu        $v0, 0x47($s0)
/* B3F60 800C3760 08008424 */  addiu      $a0, $a0, 0x8
/* B3F64 800C3764 03006324 */  addiu      $v1, $v1, 0x3
/* B3F68 800C3768 FC016330 */  andi       $v1, $v1, 0x1FC
/* B3F6C 800C376C 21208300 */  addu       $a0, $a0, $v1
/* B3F70 800C3770 EA000392 */  lbu        $v1, 0xEA($s0)
/* B3F74 800C3774 01004224 */  addiu      $v0, $v0, 0x1
/* B3F78 800C3778 470002A2 */  sb         $v0, 0x47($s0)
/* B3F7C 800C377C FF004230 */  andi       $v0, $v0, 0xFF
/* B3F80 800C3780 2B104300 */  sltu       $v0, $v0, $v1
/* B3F84 800C3784 E2FF4014 */  bnez       $v0, .L800C3710
/* B3F88 800C3788 EC0004A6 */   sh        $a0, 0xEC($s0)
/* B3F8C 800C378C 0A0E030C */  jal        func_800C3828
/* B3F90 800C3790 21200002 */   addu      $a0, $s0, $zero
/* B3F94 800C3794 81004228 */  slti       $v0, $v0, 0x81
/* B3F98 800C3798 0B004014 */  bnez       $v0, .L800C37C8
/* B3F9C 800C379C 00000000 */   nop
/* B3FA0 800C37A0 0D80023C */  lui        $v0, %hi(_padFuncClrInfo)
/* B3FA4 800C37A4 08E9428C */  lw         $v0, %lo(_padFuncClrInfo)($v0)
/* B3FA8 800C37A8 00000000 */  nop
/* B3FAC 800C37AC 09F84000 */  jalr       $v0
/* B3FB0 800C37B0 21200002 */   addu      $a0, $s0, $zero
/* B3FB4 800C37B4 FE000224 */  addiu      $v0, $zero, 0xFE
/* B3FB8 800C37B8 460002A2 */  sb         $v0, 0x46($s0)
/* B3FBC 800C37BC 02000224 */  addiu      $v0, $zero, 0x2
/* B3FC0 800C37C0 C40D0308 */  j          .L800C3710
/* B3FC4 800C37C4 490002A2 */   sb        $v0, 0x49($s0)
.L800C37C8:
/* B3FC8 800C37C8 EC000396 */  lhu        $v1, 0xEC($s0)
/* B3FCC 800C37CC EE000296 */  lhu        $v0, 0xEE($s0)
/* B3FD0 800C37D0 00000000 */  nop
/* B3FD4 800C37D4 05004310 */  beq        $v0, $v1, .L800C37EC
/* B3FD8 800C37D8 21100000 */   addu      $v0, $zero, $zero
/* B3FDC 800C37DC EE0003A6 */  sh         $v1, 0xEE($s0)
/* B3FE0 800C37E0 470000A2 */  sb         $zero, 0x47($s0)
/* B3FE4 800C37E4 060E0308 */  j          .L800C3818
/* B3FE8 800C37E8 EC0000A6 */   sh        $zero, 0xEC($s0)
.L800C37EC:
/* B3FEC 800C37EC 21200002 */  addu       $a0, $s0, $zero
/* B3FF0 800C37F0 FF000224 */  addiu      $v0, $zero, 0xFF
/* B3FF4 800C37F4 63000526 */  addiu      $a1, $s0, 0x63
/* B3FF8 800C37F8 EE0000A6 */  sh         $zero, 0xEE($s0)
/* B3FFC 800C37FC EB0000A2 */  sb         $zero, 0xEB($s0)
/* B4000 800C3800 180E030C */  jal        func_800C3860
/* B4004 800C3804 460002A2 */   sb        $v0, 0x46($s0)
/* B4008 800C3808 02000224 */  addiu      $v0, $zero, 0x2
/* B400C 800C380C C40D0308 */  j          .L800C3710
/* B4010 800C3810 460002A2 */   sb        $v0, 0x46($s0)
.L800C3814:
/* B4014 800C3814 01000224 */  addiu      $v0, $zero, 0x1
.L800C3818:
/* B4018 800C3818 1400BF8F */  lw         $ra, 0x14($sp)
/* B401C 800C381C 1000B08F */  lw         $s0, 0x10($sp)
/* B4020 800C3820 0800E003 */  jr         $ra
/* B4024 800C3824 1800BD27 */   addiu     $sp, $sp, 0x18
.size func_800C35B8, . - func_800C35B8
