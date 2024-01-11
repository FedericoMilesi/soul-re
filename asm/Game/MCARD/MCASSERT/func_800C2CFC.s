.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C2CFC
/* B34FC 800C2CFC D8FFBD27 */  addiu      $sp, $sp, -0x28
/* B3500 800C2D00 1000B0AF */  sw         $s0, 0x10($sp)
/* B3504 800C2D04 21808000 */  addu       $s0, $a0, $zero
/* B3508 800C2D08 1C00B3AF */  sw         $s3, 0x1C($sp)
/* B350C 800C2D0C 2198A000 */  addu       $s3, $a1, $zero
/* B3510 800C2D10 2000BFAF */  sw         $ra, 0x20($sp)
/* B3514 800C2D14 1800B2AF */  sw         $s2, 0x18($sp)
/* B3518 800C2D18 1400B1AF */  sw         $s1, 0x14($sp)
/* B351C 800C2D1C 3C00028E */  lw         $v0, 0x3C($s0)
/* B3520 800C2D20 00000000 */  nop
/* B3524 800C2D24 00004290 */  lbu        $v0, 0x0($v0)
/* B3528 800C2D28 08000324 */  addiu      $v1, $zero, 0x8
/* B352C 800C2D2C 03110200 */  sra        $v0, $v0, 4
/* B3530 800C2D30 07004314 */  bne        $v0, $v1, .L800C2D50
/* B3534 800C2D34 88001124 */   addiu     $s1, $zero, 0x88
/* B3538 800C2D38 44000292 */  lbu        $v0, 0x44($s0)
/* B353C 800C2D3C 00000000 */  nop
/* B3540 800C2D40 0900422C */  sltiu      $v0, $v0, 0x9
/* B3544 800C2D44 02004014 */  bnez       $v0, .L800C2D50
/* B3548 800C2D48 00000000 */   nop
/* B354C 800C2D4C 22001124 */  addiu      $s1, $zero, 0x22
.L800C2D50:
/* B3550 800C2D50 0D80033C */  lui        $v1, %hi(_padFixResult + 0xC)
/* B3554 800C2D54 68E9638C */  lw         $v1, %lo(_padFixResult + 0xC)($v1)
/* B3558 800C2D58 00000000 */  nop
.L800C2D5C:
/* B355C 800C2D5C 04006294 */  lhu        $v0, 0x4($v1)
/* B3560 800C2D60 00000000 */  nop
/* B3564 800C2D64 02004230 */  andi       $v0, $v0, 0x2
/* B3568 800C2D68 FCFF4010 */  beqz       $v0, .L800C2D5C
/* B356C 800C2D6C 00000000 */   nop
/* B3570 800C2D70 5C1E030C */  jal        func_800C7970
/* B3574 800C2D74 90010424 */   addiu     $a0, $zero, 0x190
/* B3578 800C2D78 0D80043C */  lui        $a0, %hi(_padFixResult + 0xC)
/* B357C 800C2D7C 68E9848C */  lw         $a0, %lo(_padFixResult + 0xC)($a0)
/* B3580 800C2D80 00000000 */  nop
/* B3584 800C2D84 00008290 */  lbu        $v0, 0x0($a0)
/* B3588 800C2D88 44000392 */  lbu        $v1, 0x44($s0)
/* B358C 800C2D8C 00000000 */  nop
/* B3590 800C2D90 05006014 */  bnez       $v1, .L800C2DA8
/* B3594 800C2D94 FF005230 */   andi      $s2, $v0, 0xFF
/* B3598 800C2D98 03191200 */  sra        $v1, $s2, 4
/* B359C 800C2D9C 08000224 */  addiu      $v0, $zero, 0x8
/* B35A0 800C2DA0 04006210 */  beq        $v1, $v0, .L800C2DB4
/* B35A4 800C2DA4 22000224 */   addiu     $v0, $zero, 0x22
.L800C2DA8:
/* B35A8 800C2DA8 0E0091A4 */  sh         $s1, 0xE($a0)
/* B35AC 800C2DAC 6E0B0308 */  j          .L800C2DB8
/* B35B0 800C2DB0 00000000 */   nop
.L800C2DB4:
/* B35B4 800C2DB4 0E0082A4 */  sh         $v0, 0xE($a0)
.L800C2DB8:
/* B35B8 800C2DB8 0D80033C */  lui        $v1, %hi(_padFixResult + 0x8)
/* B35BC 800C2DBC 64E9638C */  lw         $v1, %lo(_padFixResult + 0x8)($v1)
/* B35C0 800C2DC0 00000000 */  nop
/* B35C4 800C2DC4 0000628C */  lw         $v0, 0x0($v1)
/* B35C8 800C2DC8 00000000 */  nop
/* B35CC 800C2DCC 80004230 */  andi       $v0, $v0, 0x80
/* B35D0 800C2DD0 2E004014 */  bnez       $v0, .L800C2E8C
/* B35D4 800C2DD4 00000000 */   nop
/* B35D8 800C2DD8 801F093C */  lui        $t1, (0x1F801120 >> 16)
/* B35DC 800C2DDC 20112935 */  ori        $t1, $t1, (0x1F801120 & 0xFFFF)
/* B35E0 800C2DE0 801F063C */  lui        $a2, (0x1F801128 >> 16)
/* B35E4 800C2DE4 2811C634 */  ori        $a2, $a2, (0x1F801128 & 0xFFFF)
/* B35E8 800C2DE8 01000A3C */  lui        $t2, (0x10000 >> 16)
/* B35EC 800C2DEC 801F083C */  lui        $t0, (0x1F801124 >> 16)
/* B35F0 800C2DF0 24110835 */  ori        $t0, $t0, (0x1F801124 & 0xFFFF)
/* B35F4 800C2DF4 21386000 */  addu       $a3, $v1, $zero
/* B35F8 800C2DF8 0E80043C */  lui        $a0, %hi(D_800DFE40)
/* B35FC 800C2DFC 40FE848C */  lw         $a0, %lo(D_800DFE40)($a0)
/* B3600 800C2E00 0E80053C */  lui        $a1, %hi(_waitTime)
/* B3604 800C2E04 3CFEA58C */  lw         $a1, %lo(_waitTime)($a1)
.L800C2E08:
/* B3608 800C2E08 00002295 */  lhu        $v0, 0x0($t1)
/* B360C 800C2E0C 00000000 */  nop
/* B3610 800C2E10 FFFF4330 */  andi       $v1, $v0, 0xFFFF
/* B3614 800C2E14 2B106400 */  sltu       $v0, $v1, $a0
/* B3618 800C2E18 09004010 */  beqz       $v0, .L800C2E40
/* B361C 800C2E1C 00000000 */   nop
/* B3620 800C2E20 0000C294 */  lhu        $v0, 0x0($a2)
/* B3624 800C2E24 00000000 */  nop
/* B3628 800C2E28 04004010 */  beqz       $v0, .L800C2E3C
/* B362C 800C2E2C 00000000 */   nop
/* B3630 800C2E30 0000C294 */  lhu        $v0, 0x0($a2)
/* B3634 800C2E34 900B0308 */  j          .L800C2E40
/* B3638 800C2E38 21184300 */   addu      $v1, $v0, $v1
.L800C2E3C:
/* B363C 800C2E3C 21186A00 */  addu       $v1, $v1, $t2
.L800C2E40:
/* B3640 800C2E40 00000295 */  lhu        $v0, 0x0($t0)
/* B3644 800C2E44 00000000 */  nop
/* B3648 800C2E48 00024230 */  andi       $v0, $v0, 0x200
/* B364C 800C2E4C 06004010 */  beqz       $v0, .L800C2E68
/* B3650 800C2E50 23106400 */   subu      $v0, $v1, $a0
/* B3654 800C2E54 2B104500 */  sltu       $v0, $v0, $a1
/* B3658 800C2E58 07004014 */  bnez       $v0, .L800C2E78
/* B365C 800C2E5C FEFF0224 */   addiu     $v0, $zero, -0x2
/* B3660 800C2E60 D60B0308 */  j          .L800C2F58
/* B3664 800C2E64 00000000 */   nop
.L800C2E68:
/* B3668 800C2E68 C2100200 */  srl        $v0, $v0, 3
/* B366C 800C2E6C 2B104500 */  sltu       $v0, $v0, $a1
/* B3670 800C2E70 39004010 */  beqz       $v0, .L800C2F58
/* B3674 800C2E74 FEFF0224 */   addiu     $v0, $zero, -0x2
.L800C2E78:
/* B3678 800C2E78 0000E28C */  lw         $v0, 0x0($a3)
/* B367C 800C2E7C 00000000 */  nop
/* B3680 800C2E80 80004230 */  andi       $v0, $v0, 0x80
/* B3684 800C2E84 E0FF4010 */  beqz       $v0, .L800C2E08
/* B3688 800C2E88 00000000 */   nop
.L800C2E8C:
/* B368C 800C2E8C E8000392 */  lbu        $v1, 0xE8($s0)
/* B3690 800C2E90 08000224 */  addiu      $v0, $zero, 0x8
/* B3694 800C2E94 0C006210 */  beq        $v1, $v0, .L800C2EC8
/* B3698 800C2E98 02000224 */   addiu     $v0, $zero, 0x2
/* B369C 800C2E9C 0D80033C */  lui        $v1, %hi(_padSioState)
/* B36A0 800C2EA0 48E9638C */  lw         $v1, %lo(_padSioState)($v1)
/* B36A4 800C2EA4 00000000 */  nop
/* B36A8 800C2EA8 07006214 */  bne        $v1, $v0, .L800C2EC8
/* B36AC 800C2EAC 00000000 */   nop
/* B36B0 800C2EB0 5C1E030C */  jal        func_800C7970
/* B36B4 800C2EB4 3C000424 */   addiu     $a0, $zero, 0x3C
.L800C2EB8:
/* B36B8 800C2EB8 641E030C */  jal        func_800C7990
/* B36BC 800C2EBC 00000000 */   nop
/* B36C0 800C2EC0 FDFF4010 */  beqz       $v0, .L800C2EB8
/* B36C4 800C2EC4 00000000 */   nop
.L800C2EC8:
/* B36C8 800C2EC8 0D80023C */  lui        $v0, %hi(_padFixResult + 0xC)
/* B36CC 800C2ECC 68E9428C */  lw         $v0, %lo(_padFixResult + 0xC)($v0)
/* B36D0 800C2ED0 00000000 */  nop
/* B36D4 800C2ED4 000053A0 */  sb         $s3, 0x0($v0)
/* B36D8 800C2ED8 0D80033C */  lui        $v1, %hi(_padSioState)
/* B36DC 800C2EDC 48E9638C */  lw         $v1, %lo(_padSioState)($v1)
/* B36E0 800C2EE0 03000224 */  addiu      $v0, $zero, 0x3
/* B36E4 800C2EE4 0C006214 */  bne        $v1, $v0, .L800C2F18
/* B36E8 800C2EE8 80000224 */   addiu     $v0, $zero, 0x80
/* B36EC 800C2EEC 0A004216 */  bne        $s2, $v0, .L800C2F18
/* B36F0 800C2EF0 7FFF0224 */   addiu     $v0, $zero, -0x81
/* B36F4 800C2EF4 0D80033C */  lui        $v1, %hi(_padFixResult + 0x8)
/* B36F8 800C2EF8 64E9638C */  lw         $v1, %lo(_padFixResult + 0x8)($v1)
/* B36FC 800C2EFC 0D80043C */  lui        $a0, %hi(_padFixResult + 0xC)
/* B3700 800C2F00 68E9848C */  lw         $a0, %lo(_padFixResult + 0xC)($a0)
/* B3704 800C2F04 000062AC */  sw         $v0, 0x0($v1)
/* B3708 800C2F08 0A008294 */  lhu        $v0, 0xA($a0)
/* B370C 800C2F0C 00000000 */  nop
/* B3710 800C2F10 10004234 */  ori        $v0, $v0, 0x10
/* B3714 800C2F14 0A0082A4 */  sh         $v0, 0xA($a0)
.L800C2F18:
/* B3718 800C2F18 45000292 */  lbu        $v0, 0x45($s0)
/* B371C 800C2F1C 44000392 */  lbu        $v1, 0x44($s0)
/* B3720 800C2F20 01004224 */  addiu      $v0, $v0, 0x1
/* B3724 800C2F24 450002A2 */  sb         $v0, 0x45($s0)
/* B3728 800C2F28 FF000224 */  addiu      $v0, $zero, 0xFF
/* B372C 800C2F2C 06006210 */  beq        $v1, $v0, .L800C2F48
/* B3730 800C2F30 00000000 */   nop
/* B3734 800C2F34 44000392 */  lbu        $v1, 0x44($s0)
/* B3738 800C2F38 3C00028E */  lw         $v0, 0x3C($s0)
/* B373C 800C2F3C 00000000 */  nop
/* B3740 800C2F40 21104300 */  addu       $v0, $v0, $v1
/* B3744 800C2F44 000052A0 */  sb         $s2, 0x0($v0)
.L800C2F48:
/* B3748 800C2F48 44000392 */  lbu        $v1, 0x44($s0)
/* B374C 800C2F4C 21104002 */  addu       $v0, $s2, $zero
/* B3750 800C2F50 01006324 */  addiu      $v1, $v1, 0x1
/* B3754 800C2F54 440003A2 */  sb         $v1, 0x44($s0)
.L800C2F58:
/* B3758 800C2F58 2000BF8F */  lw         $ra, 0x20($sp)
/* B375C 800C2F5C 1C00B38F */  lw         $s3, 0x1C($sp)
/* B3760 800C2F60 1800B28F */  lw         $s2, 0x18($sp)
/* B3764 800C2F64 1400B18F */  lw         $s1, 0x14($sp)
/* B3768 800C2F68 1000B08F */  lw         $s0, 0x10($sp)
/* B376C 800C2F6C 0800E003 */  jr         $ra
/* B3770 800C2F70 2800BD27 */   addiu     $sp, $sp, 0x28
.size func_800C2CFC, . - func_800C2CFC
