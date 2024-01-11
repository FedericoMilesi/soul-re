.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SIGNAL_IsStreamSignal
/* ECF0 8001E4F0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* ECF4 8001E4F4 1400B1AF */  sw         $s1, 0x14($sp)
/* ECF8 8001E4F8 21888000 */  addu       $s1, $a0, $zero
/* ECFC 8001E4FC 2000B4AF */  sw         $s4, 0x20($sp)
/* ED00 8001E500 21A0A000 */  addu       $s4, $a1, $zero
/* ED04 8001E504 1C00B3AF */  sw         $s3, 0x1C($sp)
/* ED08 8001E508 21980000 */  addu       $s3, $zero, $zero
/* ED0C 8001E50C 1800B2AF */  sw         $s2, 0x18($sp)
/* ED10 8001E510 21906002 */  addu       $s2, $s3, $zero
/* ED14 8001E514 2400B5AF */  sw         $s5, 0x24($sp)
/* ED18 8001E518 FF7F153C */  lui        $s5, (0x7FFFFFFF >> 16)
/* ED1C 8001E51C FFFFB536 */  ori        $s5, $s5, (0x7FFFFFFF & 0xFFFF)
/* ED20 8001E520 2800BFAF */  sw         $ra, 0x28($sp)
/* ED24 8001E524 1000B0AF */  sw         $s0, 0x10($sp)
/* ED28 8001E528 000080AE */  sw         $zero, 0x0($s4)
.L8001E52C:
/* ED2C 8001E52C 0000228E */  lw         $v0, 0x0($s1)
/* ED30 8001E530 00000000 */  nop
/* ED34 8001E534 24805500 */  and        $s0, $v0, $s5
/* ED38 8001E538 0F000224 */  addiu      $v0, $zero, 0xF
/* ED3C 8001E53C 03000216 */  bne        $s0, $v0, .L8001E54C
/* ED40 8001E540 12000224 */   addiu     $v0, $zero, 0x12
/* ED44 8001E544 5C790008 */  j          .L8001E570
/* ED48 8001E548 01001224 */   addiu     $s2, $zero, 0x1
.L8001E54C:
/* ED4C 8001E54C 08000216 */  bne        $s0, $v0, .L8001E570
/* ED50 8001E550 00000000 */   nop
/* ED54 8001E554 01001224 */  addiu      $s2, $zero, 0x1
/* ED58 8001E558 21984002 */  addu       $s3, $s2, $zero
/* ED5C 8001E55C 2479000C */  jal        SIGNAL_IsThisStreamAWarpGate
/* ED60 8001E560 21202002 */   addu      $a0, $s1, $zero
/* ED64 8001E564 02004010 */  beqz       $v0, .L8001E570
/* ED68 8001E568 00000000 */   nop
/* ED6C 8001E56C 000093AE */  sw         $s3, 0x0($s4)
.L8001E570:
/* ED70 8001E570 0C004016 */  bnez       $s2, .L8001E5A4
/* ED74 8001E574 21106002 */   addu      $v0, $s3, $zero
/* ED78 8001E578 40101000 */  sll        $v0, $s0, 1
/* ED7C 8001E57C 21105000 */  addu       $v0, $v0, $s0
/* ED80 8001E580 80100200 */  sll        $v0, $v0, 2
/* ED84 8001E584 908E8327 */  addiu      $v1, $gp, %gp_rel(signalInfoList)
/* ED88 8001E588 21104300 */  addu       $v0, $v0, $v1
/* ED8C 8001E58C 04004284 */  lh         $v0, 0x4($v0)
/* ED90 8001E590 00000000 */  nop
/* ED94 8001E594 01004224 */  addiu      $v0, $v0, 0x1
/* ED98 8001E598 80100200 */  sll        $v0, $v0, 2
/* ED9C 8001E59C 4B790008 */  j          .L8001E52C
/* EDA0 8001E5A0 21882202 */   addu      $s1, $s1, $v0
.L8001E5A4:
/* EDA4 8001E5A4 2800BF8F */  lw         $ra, 0x28($sp)
/* EDA8 8001E5A8 2400B58F */  lw         $s5, 0x24($sp)
/* EDAC 8001E5AC 2000B48F */  lw         $s4, 0x20($sp)
/* EDB0 8001E5B0 1C00B38F */  lw         $s3, 0x1C($sp)
/* EDB4 8001E5B4 1800B28F */  lw         $s2, 0x18($sp)
/* EDB8 8001E5B8 1400B18F */  lw         $s1, 0x14($sp)
/* EDBC 8001E5BC 1000B08F */  lw         $s0, 0x10($sp)
/* EDC0 8001E5C0 0800E003 */  jr         $ra
/* EDC4 8001E5C4 3000BD27 */   addiu     $sp, $sp, 0x30
.size SIGNAL_IsStreamSignal, . - SIGNAL_IsStreamSignal
