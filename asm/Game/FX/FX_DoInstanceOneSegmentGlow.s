.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_DoInstanceOneSegmentGlow
/* 3BD18 8004B518 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 3BD1C 8004B51C 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 3BD20 8004B520 21988000 */  addu       $s3, $a0, $zero
/* 3BD24 8004B524 2000B4AF */  sw         $s4, 0x20($sp)
/* 3BD28 8004B528 21A0A000 */  addu       $s4, $a1, $zero
/* 3BD2C 8004B52C 1800B2AF */  sw         $s2, 0x18($sp)
/* 3BD30 8004B530 2190C000 */  addu       $s2, $a2, $zero
/* 3BD34 8004B534 1400B1AF */  sw         $s1, 0x14($sp)
/* 3BD38 8004B538 2188E000 */  addu       $s1, $a3, $zero
/* 3BD3C 8004B53C 80201100 */  sll        $a0, $s1, 2
/* 3BD40 8004B540 2C008424 */  addiu      $a0, $a0, 0x2C
/* 3BD44 8004B544 1000B0AF */  sw         $s0, 0x10($sp)
/* 3BD48 8004B548 3800B08F */  lw         $s0, 0x38($sp)
/* 3BD4C 8004B54C 0D000524 */  addiu      $a1, $zero, 0xD
/* 3BD50 8004B550 2400BFAF */  sw         $ra, 0x24($sp)
/* 3BD54 8004B554 40111000 */  sll        $v0, $s0, 5
/* 3BD58 8004B558 8140010C */  jal        MEMPACK_Malloc
/* 3BD5C 8004B55C 21800202 */   addu      $s0, $s0, $v0
/* 3BD60 8004B560 21304000 */  addu       $a2, $v0, $zero
/* 3BD64 8004B564 3700C010 */  beqz       $a2, .L8004B644
/* 3BD68 8004B568 83000224 */   addiu     $v0, $zero, 0x83
/* 3BD6C 8004B56C 0C00C2A0 */  sb         $v0, 0xC($a2)
/* 3BD70 8004B570 0580023C */  lui        $v0, %hi(FX_UpdateGlowEffect)
/* 3BD74 8004B574 3CB44224 */  addiu      $v0, $v0, %lo(FX_UpdateGlowEffect)
/* 3BD78 8004B578 0400C2AC */  sw         $v0, 0x4($a2)
/* 3BD7C 8004B57C 1400C0AC */  sw         $zero, 0x14($a2)
/* 3BD80 8004B580 1C00D1A4 */  sh         $s1, 0x1C($a2)
/* 3BD84 8004B584 1E00D0A4 */  sh         $s0, 0x1E($a2)
/* 3BD88 8004B588 3C00A28F */  lw         $v0, 0x3C($sp)
/* 3BD8C 8004B58C 00000000 */  nop
/* 3BD90 8004B590 2000C2A4 */  sh         $v0, 0x20($a2)
/* 3BD94 8004B594 4000A28F */  lw         $v0, 0x40($sp)
/* 3BD98 8004B598 0800D3AC */  sw         $s3, 0x8($a2)
/* 3BD9C 8004B59C 2600D4A4 */  sh         $s4, 0x26($a2)
/* 3BDA0 8004B5A0 1000C0AC */  sw         $zero, 0x10($a2)
/* 3BDA4 8004B5A4 2800C0A4 */  sh         $zero, 0x28($a2)
/* 3BDA8 8004B5A8 2A00C0A4 */  sh         $zero, 0x2A($a2)
/* 3BDAC 8004B5AC 2200C2A4 */  sh         $v0, 0x22($a2)
/* 3BDB0 8004B5B0 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 3BDB4 8004B5B4 0E00C2A4 */  sh         $v0, 0xE($a2)
/* 3BDB8 8004B5B8 01000224 */  addiu      $v0, $zero, 0x1
/* 3BDBC 8004B5BC 2500C2A0 */  sb         $v0, 0x25($a2)
/* 3BDC0 8004B5C0 2400C2A0 */  sb         $v0, 0x24($a2)
/* 3BDC4 8004B5C4 0200222A */  slti       $v0, $s1, 0x2
/* 3BDC8 8004B5C8 05004010 */  beqz       $v0, .L8004B5E0
/* 3BDCC 8004B5CC 00000000 */   nop
/* 3BDD0 8004B5D0 16004016 */  bnez       $s2, .L8004B62C
/* 3BDD4 8004B5D4 FF00023C */   lui       $v0, (0xFF8010 >> 16)
/* 3BDD8 8004B5D8 8C2D0108 */  j          .L8004B630
/* 3BDDC 8004B5DC 10804234 */   ori       $v0, $v0, (0xFF8010 & 0xFFFF)
.L8004B5E0:
/* 3BDE0 8004B5E0 2C00C224 */  addiu      $v0, $a2, 0x2C
/* 3BDE4 8004B5E4 1400C2AC */  sw         $v0, 0x14($a2)
/* 3BDE8 8004B5E8 0B00201A */  blez       $s1, .L8004B618
/* 3BDEC 8004B5EC 21280000 */   addu      $a1, $zero, $zero
/* 3BDF0 8004B5F0 21384002 */  addu       $a3, $s2, $zero
.L8004B5F4:
/* 3BDF4 8004B5F4 0000E48C */  lw         $a0, 0x0($a3)
/* 3BDF8 8004B5F8 80100500 */  sll        $v0, $a1, 2
/* 3BDFC 8004B5FC 1400C38C */  lw         $v1, 0x14($a2)
/* 3BE00 8004B600 0100A524 */  addiu      $a1, $a1, 0x1
/* 3BE04 8004B604 21104300 */  addu       $v0, $v0, $v1
/* 3BE08 8004B608 000044AC */  sw         $a0, 0x0($v0)
/* 3BE0C 8004B60C 2A10B100 */  slt        $v0, $a1, $s1
/* 3BE10 8004B610 F8FF4014 */  bnez       $v0, .L8004B5F4
/* 3BE14 8004B614 0400E724 */   addiu     $a3, $a3, 0x4
.L8004B618:
/* 3BE18 8004B618 FFFF2226 */  addiu      $v0, $s1, -0x1
/* 3BE1C 8004B61C 1A000202 */  div        $zero, $s0, $v0
/* 3BE20 8004B620 12100000 */  mflo       $v0
/* 3BE24 8004B624 00000000 */  nop
/* 3BE28 8004B628 1E00C2A4 */  sh         $v0, 0x1E($a2)
.L8004B62C:
/* 3BE2C 8004B62C 0000428E */  lw         $v0, 0x0($s2)
.L8004B630:
/* 3BE30 8004B630 00000000 */  nop
/* 3BE34 8004B634 1800C2AC */  sw         $v0, 0x18($a2)
/* 3BE38 8004B638 649A828F */  lw         $v0, %gp_rel(FX_GeneralEffectTracker)($gp)
/* 3BE3C 8004B63C 649A86AF */  sw         $a2, %gp_rel(FX_GeneralEffectTracker)($gp)
/* 3BE40 8004B640 0000C2AC */  sw         $v0, 0x0($a2)
.L8004B644:
/* 3BE44 8004B644 1800638E */  lw         $v1, 0x18($s3)
/* 3BE48 8004B648 00000000 */  nop
/* 3BE4C 8004B64C 00026334 */  ori        $v1, $v1, 0x200
/* 3BE50 8004B650 180063AE */  sw         $v1, 0x18($s3)
/* 3BE54 8004B654 2400BF8F */  lw         $ra, 0x24($sp)
/* 3BE58 8004B658 2000B48F */  lw         $s4, 0x20($sp)
/* 3BE5C 8004B65C 1C00B38F */  lw         $s3, 0x1C($sp)
/* 3BE60 8004B660 1800B28F */  lw         $s2, 0x18($sp)
/* 3BE64 8004B664 1400B18F */  lw         $s1, 0x14($sp)
/* 3BE68 8004B668 1000B08F */  lw         $s0, 0x10($sp)
/* 3BE6C 8004B66C 2110C000 */  addu       $v0, $a2, $zero
/* 3BE70 8004B670 0800E003 */  jr         $ra
/* 3BE74 8004B674 2800BD27 */   addiu     $sp, $sp, 0x28
.size FX_DoInstanceOneSegmentGlow, . - FX_DoInstanceOneSegmentGlow
