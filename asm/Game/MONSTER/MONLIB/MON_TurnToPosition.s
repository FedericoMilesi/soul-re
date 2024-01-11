.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_TurnToPosition
/* 71998 80081198 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 7199C 8008119C 1400B1AF */  sw         $s1, 0x14($sp)
/* 719A0 800811A0 21888000 */  addu       $s1, $a0, $zero
/* 719A4 800811A4 5C002426 */  addiu      $a0, $s1, 0x5C
/* 719A8 800811A8 1000B0AF */  sw         $s0, 0x10($sp)
/* 719AC 800811AC 1800BFAF */  sw         $ra, 0x18($sp)
/* 719B0 800811B0 87E8000C */  jal        MATH3D_AngleFromPosToPos
/* 719B4 800811B4 2180C000 */   addu      $s0, $a2, $zero
/* 719B8 800811B8 00841000 */  sll        $s0, $s0, 16
/* 719BC 800811BC 08C0838F */  lw         $v1, %gp_rel(gameTrackerX + 0x240)($gp)
/* 719C0 800811C0 03841000 */  sra        $s0, $s0, 16
/* 719C4 800811C4 18000302 */  mult       $s0, $v1
/* 719C8 800811C8 78002426 */  addiu      $a0, $s1, 0x78
/* 719CC 800811CC 00840200 */  sll        $s0, $v0, 16
/* 719D0 800811D0 03841000 */  sra        $s0, $s0, 16
/* 719D4 800811D4 21280002 */  addu       $a1, $s0, $zero
/* 719D8 800811D8 12380000 */  mflo       $a3
/* 719DC 800811DC 00310700 */  sll        $a2, $a3, 4
/* 719E0 800811E0 53E8000C */  jal        AngleMoveToward
/* 719E4 800811E4 03340600 */   sra       $a2, $a2, 16
/* 719E8 800811E8 78002286 */  lh         $v0, 0x78($s1)
/* 719EC 800811EC 1800BF8F */  lw         $ra, 0x18($sp)
/* 719F0 800811F0 1400B18F */  lw         $s1, 0x14($sp)
/* 719F4 800811F4 26105000 */  xor        $v0, $v0, $s0
/* 719F8 800811F8 1000B08F */  lw         $s0, 0x10($sp)
/* 719FC 800811FC 0100422C */  sltiu      $v0, $v0, 0x1
/* 71A00 80081200 0800E003 */  jr         $ra
/* 71A04 80081204 2000BD27 */   addiu     $sp, $sp, 0x20
.size MON_TurnToPosition, . - MON_TurnToPosition
