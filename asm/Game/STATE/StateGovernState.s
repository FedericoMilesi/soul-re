.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StateGovernState
/* 634C4 80072CC4 B8FFBD27 */  addiu      $sp, $sp, -0x48
/* 634C8 80072CC8 3C00B7AF */  sw         $s7, 0x3C($sp)
/* 634CC 80072CCC 21B88000 */  addu       $s7, $a0, $zero
/* 634D0 80072CD0 4000BEAF */  sw         $fp, 0x40($sp)
/* 634D4 80072CD4 21F0A000 */  addu       $fp, $a1, $zero
/* 634D8 80072CD8 3000B4AF */  sw         $s4, 0x30($sp)
/* 634DC 80072CDC 01001424 */  addiu      $s4, $zero, 0x1
/* 634E0 80072CE0 04109E02 */  sllv       $v0, $fp, $s4
/* 634E4 80072CE4 21105E00 */  addu       $v0, $v0, $fp
/* 634E8 80072CE8 C0100200 */  sll        $v0, $v0, 3
/* 634EC 80072CEC 21105E00 */  addu       $v0, $v0, $fp
/* 634F0 80072CF0 80140200 */  sll        $v0, $v0, 18
/* 634F4 80072CF4 03140200 */  sra        $v0, $v0, 16
/* 634F8 80072CF8 3800B6AF */  sw         $s6, 0x38($sp)
/* 634FC 80072CFC 24011624 */  addiu      $s6, $zero, 0x124
/* 63500 80072D00 3400B5AF */  sw         $s5, 0x34($sp)
/* 63504 80072D04 08001524 */  addiu      $s5, $zero, 0x8
/* 63508 80072D08 4400BFAF */  sw         $ra, 0x44($sp)
/* 6350C 80072D0C 2C00B3AF */  sw         $s3, 0x2C($sp)
/* 63510 80072D10 2800B2AF */  sw         $s2, 0x28($sp)
/* 63514 80072D14 2400B1AF */  sw         $s1, 0x24($sp)
/* 63518 80072D18 2000B0AF */  sw         $s0, 0x20($sp)
/* 6351C 80072D1C 1800A2AF */  sw         $v0, 0x18($sp)
.L80072D20:
/* 63520 80072D20 2110F502 */  addu       $v0, $s7, $s5
/* 63524 80072D24 2118F602 */  addu       $v1, $s7, $s6
/* 63528 80072D28 0000448C */  lw         $a0, 0x0($v0)
/* 6352C 80072D2C 0000628C */  lw         $v0, 0x0($v1)
/* 63530 80072D30 00000000 */  nop
/* 63534 80072D34 32008214 */  bne        $a0, $v0, .L80072E00
/* 63538 80072D38 FFFF8326 */   addiu     $v1, $s4, -0x1
/* 6353C 80072D3C FF006330 */  andi       $v1, $v1, 0xFF
/* 63540 80072D40 40100300 */  sll        $v0, $v1, 1
/* 63544 80072D44 21104300 */  addu       $v0, $v0, $v1
/* 63548 80072D48 00110200 */  sll        $v0, $v0, 4
/* 6354C 80072D4C EC014224 */  addiu      $v0, $v0, 0x1EC
/* 63550 80072D50 0000E48E */  lw         $a0, 0x0($s7)
/* 63554 80072D54 FF008332 */  andi       $v1, $s4, 0xFF
/* 63558 80072D58 21888200 */  addu       $s1, $a0, $v0
/* 6355C 80072D5C 40100300 */  sll        $v0, $v1, 1
/* 63560 80072D60 21104300 */  addu       $v0, $v0, $v1
/* 63564 80072D64 00110200 */  sll        $v0, $v0, 4
/* 63568 80072D68 EC014224 */  addiu      $v0, $v0, 0x1EC
/* 6356C 80072D6C 21988200 */  addu       $s3, $a0, $v0
/* 63570 80072D70 14002396 */  lhu        $v1, 0x14($s1)
/* 63574 80072D74 14006296 */  lhu        $v0, 0x14($s3)
/* 63578 80072D78 00000000 */  nop
/* 6357C 80072D7C 20006214 */  bne        $v1, $v0, .L80072E00
/* 63580 80072D80 00000000 */   nop
/* 63584 80072D84 1F40020C */  jal        G2AnimSection_IsInInterpolation
/* 63588 80072D88 21202002 */   addu      $a0, $s1, $zero
/* 6358C 80072D8C 1C004014 */  bnez       $v0, .L80072E00
/* 63590 80072D90 00000000 */   nop
/* 63594 80072D94 1F40020C */  jal        G2AnimSection_IsInInterpolation
/* 63598 80072D98 21206002 */   addu      $a0, $s3, $zero
/* 6359C 80072D9C 18004014 */  bnez       $v0, .L80072E00
/* 635A0 80072DA0 00000000 */   nop
/* 635A4 80072DA4 F03F020C */  jal        G2AnimSection_GetKeyframeNumber
/* 635A8 80072DA8 21202002 */   addu      $a0, $s1, $zero
/* 635AC 80072DAC 21206002 */  addu       $a0, $s3, $zero
/* 635B0 80072DB0 F03F020C */  jal        G2AnimSection_GetKeyframeNumber
/* 635B4 80072DB4 21804000 */   addu      $s0, $v0, $zero
/* 635B8 80072DB8 11000212 */  beq        $s0, $v0, .L80072E00
/* 635BC 80072DBC 21202002 */   addu      $a0, $s1, $zero
/* 635C0 80072DC0 2400918C */  lw         $s1, 0x24($a0)
/* 635C4 80072DC4 14009294 */  lhu        $s2, 0x14($a0)
/* 635C8 80072DC8 F03F020C */  jal        G2AnimSection_GetKeyframeNumber
/* 635CC 80072DCC 00000000 */   nop
/* 635D0 80072DD0 21804000 */  addu       $s0, $v0, $zero
/* 635D4 80072DD4 DD3F020C */  jal        G2AnimKeylist_GetKeyframeCount
/* 635D8 80072DD8 21202002 */   addu      $a0, $s1, $zero
/* 635DC 80072DDC 21801E02 */  addu       $s0, $s0, $fp
/* 635E0 80072DE0 1A000202 */  div        $zero, $s0, $v0
/* 635E4 80072DE4 10380000 */  mfhi       $a3
/* 635E8 80072DE8 21206002 */  addu       $a0, $s3, $zero
/* 635EC 80072DEC 21282002 */  addu       $a1, $s1, $zero
/* 635F0 80072DF0 1800A88F */  lw         $t0, 0x18($sp)
/* 635F4 80072DF4 21304002 */  addu       $a2, $s2, $zero
/* 635F8 80072DF8 0F40020C */  jal        G2AnimSection_InterpToKeylistFrame
/* 635FC 80072DFC 1000A8AF */   sw        $t0, 0x10($sp)
.L80072E00:
/* 63600 80072E00 1C01D626 */  addiu      $s6, $s6, 0x11C
/* 63604 80072E04 01009426 */  addiu      $s4, $s4, 0x1
/* 63608 80072E08 0300822A */  slti       $v0, $s4, 0x3
/* 6360C 80072E0C C4FF4014 */  bnez       $v0, .L80072D20
/* 63610 80072E10 1C01B526 */   addiu     $s5, $s5, 0x11C
/* 63614 80072E14 4400BF8F */  lw         $ra, 0x44($sp)
/* 63618 80072E18 4000BE8F */  lw         $fp, 0x40($sp)
/* 6361C 80072E1C 3C00B78F */  lw         $s7, 0x3C($sp)
/* 63620 80072E20 3800B68F */  lw         $s6, 0x38($sp)
/* 63624 80072E24 3400B58F */  lw         $s5, 0x34($sp)
/* 63628 80072E28 3000B48F */  lw         $s4, 0x30($sp)
/* 6362C 80072E2C 2C00B38F */  lw         $s3, 0x2C($sp)
/* 63630 80072E30 2800B28F */  lw         $s2, 0x28($sp)
/* 63634 80072E34 2400B18F */  lw         $s1, 0x24($sp)
/* 63638 80072E38 2000B08F */  lw         $s0, 0x20($sp)
/* 6363C 80072E3C 0800E003 */  jr         $ra
/* 63640 80072E40 4800BD27 */   addiu     $sp, $sp, 0x48
.size StateGovernState, . - StateGovernState
