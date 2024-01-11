.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PHYSOB_Normalize
/* 605A0 8006FDA0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 605A4 8006FDA4 1000B0AF */  sw         $s0, 0x10($sp)
/* 605A8 8006FDA8 21808000 */  addu       $s0, $a0, $zero
/* 605AC 8006FDAC 1400BFAF */  sw         $ra, 0x14($sp)
/* 605B0 8006FDB0 00000486 */  lh         $a0, 0x0($s0)
/* 605B4 8006FDB4 02000586 */  lh         $a1, 0x2($s0)
/* 605B8 8006FDB8 04000686 */  lh         $a2, 0x4($s0)
/* 605BC 8006FDBC E7E9000C */  jal        MATH3D_SquareLength
/* 605C0 8006FDC0 00000000 */   nop
/* 605C4 8006FDC4 21284000 */  addu       $a1, $v0, $zero
/* 605C8 8006FDC8 0500A010 */  beqz       $a1, .L8006FDE0
/* 605CC 8006FDCC 00000000 */   nop
/* 605D0 8006FDD0 A6E7000C */  jal        MATH3D_FastSqrt0
/* 605D4 8006FDD4 2120A000 */   addu      $a0, $a1, $zero
/* 605D8 8006FDD8 79BF0108 */  j          .L8006FDE4
/* 605DC 8006FDDC 21284000 */   addu      $a1, $v0, $zero
.L8006FDE0:
/* 605E0 8006FDE0 01000524 */  addiu      $a1, $zero, 0x1
.L8006FDE4:
/* 605E4 8006FDE4 00000486 */  lh         $a0, 0x0($s0)
/* 605E8 8006FDE8 00000000 */  nop
/* 605EC 8006FDEC 00230400 */  sll        $a0, $a0, 12
/* 605F0 8006FDF0 1A008500 */  div        $zero, $a0, $a1
/* 605F4 8006FDF4 12200000 */  mflo       $a0
/* 605F8 8006FDF8 02000386 */  lh         $v1, 0x2($s0)
/* 605FC 8006FDFC 00000000 */  nop
/* 60600 8006FE00 001B0300 */  sll        $v1, $v1, 12
/* 60604 8006FE04 1A006500 */  div        $zero, $v1, $a1
/* 60608 8006FE08 12180000 */  mflo       $v1
/* 6060C 8006FE0C 04000286 */  lh         $v0, 0x4($s0)
/* 60610 8006FE10 00000000 */  nop
/* 60614 8006FE14 00130200 */  sll        $v0, $v0, 12
/* 60618 8006FE18 1A004500 */  div        $zero, $v0, $a1
/* 6061C 8006FE1C 12100000 */  mflo       $v0
/* 60620 8006FE20 000004A6 */  sh         $a0, 0x0($s0)
/* 60624 8006FE24 020003A6 */  sh         $v1, 0x2($s0)
/* 60628 8006FE28 040002A6 */  sh         $v0, 0x4($s0)
/* 6062C 8006FE2C 1400BF8F */  lw         $ra, 0x14($sp)
/* 60630 8006FE30 1000B08F */  lw         $s0, 0x10($sp)
/* 60634 8006FE34 0800E003 */  jr         $ra
/* 60638 8006FE38 1800BD27 */   addiu     $sp, $sp, 0x18
.size PHYSOB_Normalize, . - PHYSOB_Normalize
