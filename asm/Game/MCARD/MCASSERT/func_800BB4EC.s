.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BB4EC
/* ABCEC 800BB4EC 03008014 */  bnez       $a0, .L800BB4FC
/* ABCF0 800BB4F0 F0FFBD27 */   addiu     $sp, $sp, -0x10
/* ABCF4 800BB4F4 59ED0208 */  j          .L800BB564
/* ABCF8 800BB4F8 21100000 */   addu      $v0, $zero, $zero
.L800BB4FC:
/* ABCFC 800BB4FC 00008590 */  lbu        $a1, 0x0($a0)
/* ABD00 800BB500 00000000 */  nop
/* ABD04 800BB504 C2280500 */  srl        $a1, $a1, 3
/* ABD08 800BB508 0000A5AF */  sw         $a1, 0x0($sp)
/* ABD0C 800BB50C 04008684 */  lh         $a2, 0x4($a0)
/* ABD10 800BB510 00000000 */  nop
/* ABD14 800BB514 23300600 */  negu       $a2, $a2
/* ABD18 800BB518 FF00C630 */  andi       $a2, $a2, 0xFF
/* ABD1C 800BB51C C3300600 */  sra        $a2, $a2, 3
/* ABD20 800BB520 0800A6AF */  sw         $a2, 0x8($sp)
/* ABD24 800BB524 02008290 */  lbu        $v0, 0x2($a0)
/* ABD28 800BB528 802A0500 */  sll        $a1, $a1, 10
/* ABD2C 800BB52C C2100200 */  srl        $v0, $v0, 3
/* ABD30 800BB530 0400A2AF */  sw         $v0, 0x4($sp)
/* ABD34 800BB534 C0130200 */  sll        $v0, $v0, 15
/* ABD38 800BB538 06008384 */  lh         $v1, 0x6($a0)
/* ABD3C 800BB53C 00E2043C */  lui        $a0, (0xE2000000 >> 16)
/* ABD40 800BB540 2528A400 */  or         $a1, $a1, $a0
/* ABD44 800BB544 25104500 */  or         $v0, $v0, $a1
/* ABD48 800BB548 23180300 */  negu       $v1, $v1
/* ABD4C 800BB54C FF006330 */  andi       $v1, $v1, 0xFF
/* ABD50 800BB550 C3180300 */  sra        $v1, $v1, 3
/* ABD54 800BB554 40210300 */  sll        $a0, $v1, 5
/* ABD58 800BB558 25104400 */  or         $v0, $v0, $a0
/* ABD5C 800BB55C 25104600 */  or         $v0, $v0, $a2
/* ABD60 800BB560 0C00A3AF */  sw         $v1, 0xC($sp)
.L800BB564:
/* ABD64 800BB564 0800E003 */  jr         $ra
/* ABD68 800BB568 1000BD27 */   addiu     $sp, $sp, 0x10
.size func_800BB4EC, . - func_800BB4EC
