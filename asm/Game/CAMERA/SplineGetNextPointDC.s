.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SplineGetNextPointDC
/* 61E0 800159E0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 61E4 800159E4 1000B0AF */  sw         $s0, 0x10($sp)
/* 61E8 800159E8 21808000 */  addu       $s0, $a0, $zero
/* 61EC 800159EC 1400B1AF */  sw         $s1, 0x14($sp)
/* 61F0 800159F0 08C0868F */  lw         $a2, %gp_rel(gameTrackerX + 0x240)($gp)
/* 61F4 800159F4 1800BFAF */  sw         $ra, 0x18($sp)
/* 61F8 800159F8 5608010C */  jal        SplineGetOffsetNext
/* 61FC 800159FC 2188A000 */   addu      $s1, $a1, $zero
/* 6200 80015A00 08004010 */  beqz       $v0, .L80015A24
/* 6204 80015A04 21200002 */   addu      $a0, $s0, $zero
/* 6208 80015A08 64AB8627 */  addiu      $a2, $gp, %gp_rel(point.42)
/* 620C 80015A0C F306010C */  jal        SplineGetData
/* 6210 80015A10 21282002 */   addu      $a1, $s1, $zero
/* 6214 80015A14 21184000 */  addu       $v1, $v0, $zero
/* 6218 80015A18 64AB8227 */  addiu      $v0, $gp, %gp_rel(point.42)
/* 621C 80015A1C 02006014 */  bnez       $v1, .L80015A28
/* 6220 80015A20 00000000 */   nop
.L80015A24:
/* 6224 80015A24 21100000 */  addu       $v0, $zero, $zero
.L80015A28:
/* 6228 80015A28 1800BF8F */  lw         $ra, 0x18($sp)
/* 622C 80015A2C 1400B18F */  lw         $s1, 0x14($sp)
/* 6230 80015A30 1000B08F */  lw         $s0, 0x10($sp)
/* 6234 80015A34 0800E003 */  jr         $ra
/* 6238 80015A38 2000BD27 */   addiu     $sp, $sp, 0x20
.size SplineGetNextPointDC, . - SplineGetNextPointDC
