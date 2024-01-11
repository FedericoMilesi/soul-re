.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_SubDividePrim
/* 38504 80047D04 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 38508 80047D08 2800B0AF */  sw         $s0, 0x28($sp)
/* 3850C 80047D0C 21808000 */  addu       $s0, $a0, $zero
/* 38510 80047D10 2C00B1AF */  sw         $s1, 0x2C($sp)
/* 38514 80047D14 2188A000 */  addu       $s1, $a1, $zero
/* 38518 80047D18 3C000426 */  addiu      $a0, $s0, 0x3C
/* 3851C 80047D1C 4C002526 */  addiu      $a1, $s1, 0x4C
/* 38520 80047D20 00080624 */  addiu      $a2, $zero, 0x800
/* 38524 80047D24 2138C000 */  addu       $a3, $a2, $zero
/* 38528 80047D28 1800A227 */  addiu      $v0, $sp, 0x18
/* 3852C 80047D2C 3000BFAF */  sw         $ra, 0x30($sp)
/* 38530 80047D30 86F3020C */  jal        LoadAverageShort12
/* 38534 80047D34 1000A2AF */   sw        $v0, 0x10($sp)
/* 38538 80047D38 44000426 */  addiu      $a0, $s0, 0x44
/* 3853C 80047D3C 54002526 */  addiu      $a1, $s1, 0x54
/* 38540 80047D40 00080624 */  addiu      $a2, $zero, 0x800
/* 38544 80047D44 2138C000 */  addu       $a3, $a2, $zero
/* 38548 80047D48 2000A227 */  addiu      $v0, $sp, 0x20
/* 3854C 80047D4C 86F3020C */  jal        LoadAverageShort12
/* 38550 80047D50 1000A2AF */   sw        $v0, 0x10($sp)
/* 38554 80047D54 1B00A38B */  lwl        $v1, 0x1B($sp)
/* 38558 80047D58 1800A39B */  lwr        $v1, 0x18($sp)
/* 3855C 80047D5C 1C00A887 */  lh         $t0, 0x1C($sp)
/* 38560 80047D60 4F0003AA */  swl        $v1, 0x4F($s0)
/* 38564 80047D64 4C0003BA */  swr        $v1, 0x4C($s0)
/* 38568 80047D68 500008A6 */  sh         $t0, 0x50($s0)
/* 3856C 80047D6C 2300A38B */  lwl        $v1, 0x23($sp)
/* 38570 80047D70 2000A39B */  lwr        $v1, 0x20($sp)
/* 38574 80047D74 2400A887 */  lh         $t0, 0x24($sp)
/* 38578 80047D78 570003AA */  swl        $v1, 0x57($s0)
/* 3857C 80047D7C 540003BA */  swr        $v1, 0x54($s0)
/* 38580 80047D80 580008A6 */  sh         $t0, 0x58($s0)
/* 38584 80047D84 1B00A38B */  lwl        $v1, 0x1B($sp)
/* 38588 80047D88 1800A39B */  lwr        $v1, 0x18($sp)
/* 3858C 80047D8C 1C00A887 */  lh         $t0, 0x1C($sp)
/* 38590 80047D90 3F0023AA */  swl        $v1, 0x3F($s1)
/* 38594 80047D94 3C0023BA */  swr        $v1, 0x3C($s1)
/* 38598 80047D98 400028A6 */  sh         $t0, 0x40($s1)
/* 3859C 80047D9C 2300A38B */  lwl        $v1, 0x23($sp)
/* 385A0 80047DA0 2000A39B */  lwr        $v1, 0x20($sp)
/* 385A4 80047DA4 2400A887 */  lh         $t0, 0x24($sp)
/* 385A8 80047DA8 470023AA */  swl        $v1, 0x47($s1)
/* 385AC 80047DAC 440023BA */  swr        $v1, 0x44($s1)
/* 385B0 80047DB0 480028A6 */  sh         $t0, 0x48($s1)
/* 385B4 80047DB4 3000BF8F */  lw         $ra, 0x30($sp)
/* 385B8 80047DB8 2C00B18F */  lw         $s1, 0x2C($sp)
/* 385BC 80047DBC 2800B08F */  lw         $s0, 0x28($sp)
/* 385C0 80047DC0 0800E003 */  jr         $ra
/* 385C4 80047DC4 3800BD27 */   addiu     $sp, $sp, 0x38
.size FX_SubDividePrim, . - FX_SubDividePrim
