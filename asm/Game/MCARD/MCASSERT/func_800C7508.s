.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C7508
/* B7D08 800C7508 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* B7D0C 800C750C 1400B1AF */  sw         $s1, 0x14($sp)
/* B7D10 800C7510 21888000 */  addu       $s1, $a0, $zero
/* B7D14 800C7514 1800B2AF */  sw         $s2, 0x18($sp)
/* B7D18 800C7518 2190A000 */  addu       $s2, $a1, $zero
/* B7D1C 800C751C 1C00BFAF */  sw         $ra, 0x1C($sp)
/* B7D20 800C7520 1B002012 */  beqz       $s1, .L800C7590
/* B7D24 800C7524 1000B0AF */   sw        $s0, 0x10($sp)
/* B7D28 800C7528 1A004012 */  beqz       $s2, .L800C7594
/* B7D2C 800C752C 21100000 */   addu      $v0, $zero, $zero
/* B7D30 800C7530 ACF4020C */  jal        func_800BD2B0
/* B7D34 800C7534 21202002 */   addu      $a0, $s1, $zero
/* B7D38 800C7538 21204002 */  addu       $a0, $s2, $zero
/* B7D3C 800C753C ACF4020C */  jal        func_800BD2B0
/* B7D40 800C7540 21802202 */   addu      $s0, $s1, $v0
/* B7D44 800C7544 21104202 */  addu       $v0, $s2, $v0
/* B7D48 800C7548 11000212 */  beq        $s0, $v0, .L800C7590
/* B7D4C 800C754C 21182002 */   addu      $v1, $s1, $zero
/* B7D50 800C7550 00006280 */  lb         $v0, 0x0($v1)
/* B7D54 800C7554 00000000 */  nop
/* B7D58 800C7558 05004010 */  beqz       $v0, .L800C7570
/* B7D5C 800C755C 01007124 */   addiu     $s1, $v1, 0x1
.L800C7560:
/* B7D60 800C7560 00002282 */  lb         $v0, 0x0($s1)
/* B7D64 800C7564 00000000 */  nop
/* B7D68 800C7568 FDFF4014 */  bnez       $v0, .L800C7560
/* B7D6C 800C756C 01003126 */   addiu     $s1, $s1, 0x1
.L800C7570:
/* B7D70 800C7570 FFFF3126 */  addiu      $s1, $s1, -0x1
.L800C7574:
/* B7D74 800C7574 00004292 */  lbu        $v0, 0x0($s2)
/* B7D78 800C7578 01005226 */  addiu      $s2, $s2, 0x1
/* B7D7C 800C757C 000022A2 */  sb         $v0, 0x0($s1)
/* B7D80 800C7580 FCFF4014 */  bnez       $v0, .L800C7574
/* B7D84 800C7584 01003126 */   addiu     $s1, $s1, 0x1
/* B7D88 800C7588 651D0308 */  j          .L800C7594
/* B7D8C 800C758C 21106000 */   addu      $v0, $v1, $zero
.L800C7590:
/* B7D90 800C7590 21100000 */  addu       $v0, $zero, $zero
.L800C7594:
/* B7D94 800C7594 1C00BF8F */  lw         $ra, 0x1C($sp)
/* B7D98 800C7598 1800B28F */  lw         $s2, 0x18($sp)
/* B7D9C 800C759C 1400B18F */  lw         $s1, 0x14($sp)
/* B7DA0 800C75A0 1000B08F */  lw         $s0, 0x10($sp)
/* B7DA4 800C75A4 0800E003 */  jr         $ra
/* B7DA8 800C75A8 2000BD27 */   addiu     $sp, $sp, 0x20
/* B7DAC 800C75AC 00000000 */  nop
/* B7DB0 800C75B0 00000000 */  nop
/* B7DB4 800C75B4 00000000 */  nop
.size func_800C7508, . - func_800C7508
