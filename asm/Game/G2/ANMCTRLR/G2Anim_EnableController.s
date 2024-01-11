.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2Anim_EnableController
/* 80D58 80090558 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 80D5C 8009055C 1800B2AF */  sw         $s2, 0x18($sp)
/* 80D60 80090560 21908000 */  addu       $s2, $a0, $zero
/* 80D64 80090564 1400B1AF */  sw         $s1, 0x14($sp)
/* 80D68 80090568 2188A000 */  addu       $s1, $a1, $zero
/* 80D6C 8009056C 21202002 */  addu       $a0, $s1, $zero
/* 80D70 80090570 2128C000 */  addu       $a1, $a2, $zero
/* 80D74 80090574 04004626 */  addiu      $a2, $s2, 0x4
/* 80D78 80090578 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 80D7C 8009057C 5348020C */  jal        _G2AnimControllerST_RemoveFromList
/* 80D80 80090580 1000B0AF */   sw        $s0, 0x10($sp)
/* 80D84 80090584 21804000 */  addu       $s0, $v0, $zero
/* 80D88 80090588 24000012 */  beqz       $s0, .L8009061C
/* 80D8C 8009058C 00000000 */   nop
/* 80D90 80090590 08000292 */  lbu        $v0, 0x8($s0)
/* 80D94 80090594 02000392 */  lbu        $v1, 0x2($s0)
/* 80D98 80090598 0A0000A6 */  sh         $zero, 0xA($s0)
/* 80D9C 8009059C 0C0000A6 */  sh         $zero, 0xC($s0)
/* 80DA0 800905A0 080002A6 */  sh         $v0, 0x8($s0)
/* 80DA4 800905A4 08000224 */  addiu      $v0, $zero, 0x8
/* 80DA8 800905A8 08006214 */  bne        $v1, $v0, .L800905CC
/* 80DAC 800905AC 20000224 */   addiu     $v0, $zero, 0x20
/* 80DB0 800905B0 1C000426 */  addiu      $a0, $s0, 0x1C
/* 80DB4 800905B4 1400428E */  lw         $v0, 0x14($s2)
/* 80DB8 800905B8 40291100 */  sll        $a1, $s1, 5
/* 80DBC 800905BC A4E6010C */  jal        G2Quat_FromMatrix_S
/* 80DC0 800905C0 21284500 */   addu      $a1, $v0, $a1
/* 80DC4 800905C4 85410208 */  j          .L80090614
/* 80DC8 800905C8 21200002 */   addu      $a0, $s0, $zero
.L800905CC:
/* 80DCC 800905CC 0D006214 */  bne        $v1, $v0, .L80090604
/* 80DD0 800905D0 14000426 */   addiu     $a0, $s0, 0x14
/* 80DD4 800905D4 1400438E */  lw         $v1, 0x14($s2)
/* 80DD8 800905D8 40111100 */  sll        $v0, $s1, 5
/* 80DDC 800905DC 21186200 */  addu       $v1, $v1, $v0
/* 80DE0 800905E0 14006294 */  lhu        $v0, 0x14($v1)
/* 80DE4 800905E4 00000000 */  nop
/* 80DE8 800905E8 140002A6 */  sh         $v0, 0x14($s0)
/* 80DEC 800905EC 18006294 */  lhu        $v0, 0x18($v1)
/* 80DF0 800905F0 00000000 */  nop
/* 80DF4 800905F4 160002A6 */  sh         $v0, 0x16($s0)
/* 80DF8 800905F8 1C006294 */  lhu        $v0, 0x1C($v1)
/* 80DFC 800905FC 84410208 */  j          .L80090610
/* 80E00 80090600 180002A6 */   sh        $v0, 0x18($s0)
.L80090604:
/* 80E04 80090604 21280000 */  addu       $a1, $zero, $zero
/* 80E08 80090608 2EF2020C */  jal        memset
/* 80E0C 8009060C 10000624 */   addiu     $a2, $zero, 0x10
.L80090610:
/* 80E10 80090610 21200002 */  addu       $a0, $s0, $zero
.L80090614:
/* 80E14 80090614 5447020C */  jal        _G2AnimController_InsertIntoList
/* 80E18 80090618 02004526 */   addiu     $a1, $s2, 0x2
.L8009061C:
/* 80E1C 8009061C 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 80E20 80090620 1800B28F */  lw         $s2, 0x18($sp)
/* 80E24 80090624 1400B18F */  lw         $s1, 0x14($sp)
/* 80E28 80090628 1000B08F */  lw         $s0, 0x10($sp)
/* 80E2C 8009062C 0800E003 */  jr         $ra
/* 80E30 80090630 2000BD27 */   addiu     $sp, $sp, 0x20
.size G2Anim_EnableController, . - G2Anim_EnableController
