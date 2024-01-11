.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razPlaneShift
/* 95E20 800A5620 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 95E24 800A5624 0CBF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x144)($gp)
/* 95E28 800A5628 0400033C */  lui        $v1, (0x40000 >> 16)
/* 95E2C 800A562C 24104300 */  and        $v0, $v0, $v1
/* 95E30 800A5630 0D004014 */  bnez       $v0, .L800A5668
/* 95E34 800A5634 1000BFAF */   sw        $ra, 0x10($sp)
/* 95E38 800A5638 68FA838F */  lw         $v1, %gp_rel(Raziel + 0x438)($gp)
/* 95E3C 800A563C 01000224 */  addiu      $v0, $zero, 0x1
/* 95E40 800A5640 05006214 */  bne        $v1, $v0, .L800A5658
/* 95E44 800A5644 00000000 */   nop
/* 95E48 800A5648 9F95020C */  jal        razSpectralShift
/* 95E4C 800A564C 00000000 */   nop
/* 95E50 800A5650 9B950208 */  j          .L800A566C
/* 95E54 800A5654 01000224 */   addiu     $v0, $zero, 0x1
.L800A5658:
/* 95E58 800A5658 E395020C */  jal        razMaterialShift
/* 95E5C 800A565C 00000000 */   nop
/* 95E60 800A5660 9B950208 */  j          .L800A566C
/* 95E64 800A5664 01000224 */   addiu     $v0, $zero, 0x1
.L800A5668:
/* 95E68 800A5668 21100000 */  addu       $v0, $zero, $zero
.L800A566C:
/* 95E6C 800A566C 1000BF8F */  lw         $ra, 0x10($sp)
/* 95E70 800A5670 00000000 */  nop
/* 95E74 800A5674 0800E003 */  jr         $ra
/* 95E78 800A5678 1800BD27 */   addiu     $sp, $sp, 0x18
.size razPlaneShift, . - razPlaneShift
