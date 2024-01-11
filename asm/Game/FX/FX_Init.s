.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_Init
/* 32D60 80042560 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 32D64 80042564 1400B1AF */  sw         $s1, 0x14($sp)
/* 32D68 80042568 21888000 */  addu       $s1, $a0, $zero
/* 32D6C 8004256C 1000B0AF */  sw         $s0, 0x10($sp)
/* 32D70 80042570 21802002 */  addu       $s0, $s1, $zero
/* 32D74 80042574 1800B2AF */  sw         $s2, 0x18($sp)
/* 32D78 80042578 80053226 */  addiu      $s2, $s1, 0x580
/* 32D7C 8004257C 2B103202 */  sltu       $v0, $s1, $s2
/* 32D80 80042580 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 32D84 80042584 840520AE */  sw         $zero, 0x584($s1)
/* 32D88 80042588 800520AE */  sw         $zero, 0x580($s1)
/* 32D8C 8004258C 8C0520AE */  sw         $zero, 0x58C($s1)
/* 32D90 80042590 880520AE */  sw         $zero, 0x588($s1)
/* 32D94 80042594 946D20AE */  sw         $zero, 0x6D94($s1)
/* 32D98 80042598 906D20AE */  sw         $zero, 0x6D90($s1)
/* 32D9C 8004259C 9C6D20AE */  sw         $zero, 0x6D9C($s1)
/* 32DA0 800425A0 986D20AE */  sw         $zero, 0x6D98($s1)
/* 32DA4 800425A4 A46D20AE */  sw         $zero, 0x6DA4($s1)
/* 32DA8 800425A8 08004010 */  beqz       $v0, .L800425CC
/* 32DAC 800425AC A06D20AE */   sw        $zero, 0x6DA0($s1)
/* 32DB0 800425B0 88052426 */  addiu      $a0, $s1, 0x588
.L800425B4:
/* 32DB4 800425B4 D53E010C */  jal        LIST_InsertFunc
/* 32DB8 800425B8 21280002 */   addu      $a1, $s0, $zero
/* 32DBC 800425BC 2C001026 */  addiu      $s0, $s0, 0x2C
/* 32DC0 800425C0 2B101202 */  sltu       $v0, $s0, $s2
/* 32DC4 800425C4 FBFF4014 */  bnez       $v0, .L800425B4
/* 32DC8 800425C8 88052426 */   addiu     $a0, $s1, 0x588
.L800425CC:
/* 32DCC 800425CC 90053026 */  addiu      $s0, $s1, 0x590
/* 32DD0 800425D0 906D3226 */  addiu      $s2, $s1, 0x6D90
/* 32DD4 800425D4 2B101202 */  sltu       $v0, $s0, $s2
/* 32DD8 800425D8 07004010 */  beqz       $v0, .L800425F8
/* 32DDC 800425DC A06D2426 */   addiu     $a0, $s1, 0x6DA0
.L800425E0:
/* 32DE0 800425E0 D53E010C */  jal        LIST_InsertFunc
/* 32DE4 800425E4 21280002 */   addu      $a1, $s0, $zero
/* 32DE8 800425E8 68001026 */  addiu      $s0, $s0, 0x68
/* 32DEC 800425EC 2B101202 */  sltu       $v0, $s0, $s2
/* 32DF0 800425F0 FBFF4014 */  bnez       $v0, .L800425E0
/* 32DF4 800425F4 A06D2426 */   addiu     $a0, $s1, 0x6DA0
.L800425F8:
/* 32DF8 800425F8 B0C38227 */  addiu      $v0, $gp, %gp_rel(FX_ConstrictPosition)
/* 32DFC 800425FC BCC380AF */  sw         $zero, %gp_rel(FX_LastUsedPrim)($gp)
/* 32E00 80042600 B8C382AF */  sw         $v0, %gp_rel(FX_ConstrictPositionPtr)($gp)
/* 32E04 80042604 4838010C */  jal        FX_Spiral_Init
/* 32E08 80042608 00000000 */   nop
/* 32E0C 8004260C 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 32E10 80042610 1800B28F */  lw         $s2, 0x18($sp)
/* 32E14 80042614 1400B18F */  lw         $s1, 0x14($sp)
/* 32E18 80042618 1000B08F */  lw         $s0, 0x10($sp)
/* 32E1C 8004261C 01000224 */  addiu      $v0, $zero, 0x1
/* 32E20 80042620 749A80A7 */  sh         $zero, %gp_rel(snow_amount)($gp)
/* 32E24 80042624 769A80A7 */  sh         $zero, %gp_rel(rain_amount)($gp)
/* 32E28 80042628 789A80A7 */  sh         $zero, %gp_rel(current_rain_fade)($gp)
/* 32E2C 8004262C 7C9A80AF */  sw         $zero, %gp_rel(FX_reaver_instance)($gp)
/* 32E30 80042630 C0C382A7 */  sh         $v0, %gp_rel(FX_Frames)($gp)
/* 32E34 80042634 C2C380A7 */  sh         $zero, %gp_rel(FX_TimeCount)($gp)
/* 32E38 80042638 0800E003 */  jr         $ra
/* 32E3C 8004263C 2000BD27 */   addiu     $sp, $sp, 0x20
.size FX_Init, . - FX_Init
