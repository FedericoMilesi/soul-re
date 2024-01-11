.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DRAW_DrawButton
/* 1B5A0 8002ADA0 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 1B5A4 8002ADA4 3000BEAF */  sw         $fp, 0x30($sp)
/* 1B5A8 8002ADA8 08BE9E8F */  lw         $fp, %gp_rel(gameTrackerX + 0x40)($gp)
/* 1B5AC 8002ADAC 2400B5AF */  sw         $s5, 0x24($sp)
/* 1B5B0 8002ADB0 21A88000 */  addu       $s5, $a0, $zero
/* 1B5B4 8002ADB4 2800B6AF */  sw         $s6, 0x28($sp)
/* 1B5B8 8002ADB8 21B0A000 */  addu       $s6, $a1, $zero
/* 1B5BC 8002ADBC 2C00B7AF */  sw         $s7, 0x2C($sp)
/* 1B5C0 8002ADC0 3400BFAF */  sw         $ra, 0x34($sp)
/* 1B5C4 8002ADC4 2000B4AF */  sw         $s4, 0x20($sp)
/* 1B5C8 8002ADC8 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 1B5CC 8002ADCC 1800B2AF */  sw         $s2, 0x18($sp)
/* 1B5D0 8002ADD0 1400B1AF */  sw         $s1, 0x14($sp)
/* 1B5D4 8002ADD4 1000B0AF */  sw         $s0, 0x10($sp)
/* 1B5D8 8002ADD8 4400A7AF */  sw         $a3, 0x44($sp)
/* 1B5DC 8002ADDC 0800C28F */  lw         $v0, 0x8($fp)
/* 1B5E0 8002ADE0 0400D48F */  lw         $s4, 0x4($fp)
/* 1B5E4 8002ADE4 D0FF4224 */  addiu      $v0, $v0, -0x30
/* 1B5E8 8002ADE8 2B105400 */  sltu       $v0, $v0, $s4
/* 1B5EC 8002ADEC 3A004014 */  bnez       $v0, .L8002AED8
/* 1B5F0 8002ADF0 21B8C000 */   addu      $s7, $a2, $zero
/* 1B5F4 8002ADF4 21208002 */  addu       $a0, $s4, $zero
/* 1B5F8 8002ADF8 0800A38E */  lw         $v1, 0x8($s5)
/* 1B5FC 8002ADFC 0C00A28E */  lw         $v0, 0xC($s5)
/* 1B600 8002AE00 0400B086 */  lh         $s0, 0x4($s5)
/* 1B604 8002AE04 0600B396 */  lhu        $s3, 0x6($s5)
/* 1B608 8002AE08 04805000 */  sllv       $s0, $s0, $v0
/* 1B60C 8002AE0C 0C007294 */  lhu        $s2, 0xC($v1)
/* 1B610 8002AE10 0E007190 */  lbu        $s1, 0xE($v1)
/* 1B614 8002AE14 3F005232 */  andi       $s2, $s2, 0x3F
/* 1B618 8002AE18 A4F4020C */  jal        func_800BD290
/* 1B61C 8002AE1C 04905200 */   sllv      $s2, $s2, $v0
/* 1B620 8002AE20 FF00043C */  lui        $a0, (0xFFFFFF >> 16)
/* 1B624 8002AE24 2118D002 */  addu       $v1, $s6, $s0
/* 1B628 8002AE28 FFFF6324 */  addiu      $v1, $v1, -0x1
/* 1B62C 8002AE2C 07008292 */  lbu        $v0, 0x7($s4)
/* 1B630 8002AE30 21805002 */  addu       $s0, $s2, $s0
/* 1B634 8002AE34 01004234 */  ori        $v0, $v0, 0x1
/* 1B638 8002AE38 070082A2 */  sb         $v0, 0x7($s4)
/* 1B63C 8002AE3C 0000A296 */  lhu        $v0, 0x0($s5)
/* 1B640 8002AE40 FFFF1026 */  addiu      $s0, $s0, -0x1
/* 1B644 8002AE44 160082A6 */  sh         $v0, 0x16($s4)
/* 1B648 8002AE48 2110F302 */  addu       $v0, $s7, $s3
/* 1B64C 8002AE4C 0200A596 */  lhu        $a1, 0x2($s5)
/* 1B650 8002AE50 FFFF4224 */  addiu      $v0, $v0, -0x1
/* 1B654 8002AE54 0D0091A2 */  sb         $s1, 0xD($s4)
/* 1B658 8002AE58 150091A2 */  sb         $s1, 0x15($s4)
/* 1B65C 8002AE5C 21883302 */  addu       $s1, $s1, $s3
/* 1B660 8002AE60 FFFF3126 */  addiu      $s1, $s1, -0x1
/* 1B664 8002AE64 080096A6 */  sh         $s6, 0x8($s4)
/* 1B668 8002AE68 0A0097A6 */  sh         $s7, 0xA($s4)
/* 1B66C 8002AE6C 0C0092A2 */  sb         $s2, 0xC($s4)
/* 1B670 8002AE70 100083A6 */  sh         $v1, 0x10($s4)
/* 1B674 8002AE74 120097A6 */  sh         $s7, 0x12($s4)
/* 1B678 8002AE78 140090A2 */  sb         $s0, 0x14($s4)
/* 1B67C 8002AE7C 180096A6 */  sh         $s6, 0x18($s4)
/* 1B680 8002AE80 1A0082A6 */  sh         $v0, 0x1A($s4)
/* 1B684 8002AE84 1C0092A2 */  sb         $s2, 0x1C($s4)
/* 1B688 8002AE88 1D0091A2 */  sb         $s1, 0x1D($s4)
/* 1B68C 8002AE8C 200083A6 */  sh         $v1, 0x20($s4)
/* 1B690 8002AE90 220082A6 */  sh         $v0, 0x22($s4)
/* 1B694 8002AE94 240090A2 */  sb         $s0, 0x24($s4)
/* 1B698 8002AE98 250091A2 */  sb         $s1, 0x25($s4)
/* 1B69C 8002AE9C 0E0085A6 */  sh         $a1, 0xE($s4)
/* 1B6A0 8002AEA0 4400A88F */  lw         $t0, 0x44($sp)
/* 1B6A4 8002AEA4 FFFF8434 */  ori        $a0, $a0, (0xFFFFFF & 0xFFFF)
/* 1B6A8 8002AEA8 0000028D */  lw         $v0, 0x0($t0)
/* 1B6AC 8002AEAC 0009033C */  lui        $v1, (0x9000000 >> 16)
/* 1B6B0 8002AEB0 24104400 */  and        $v0, $v0, $a0
/* 1B6B4 8002AEB4 25104300 */  or         $v0, $v0, $v1
/* 1B6B8 8002AEB8 24208402 */  and        $a0, $s4, $a0
/* 1B6BC 8002AEBC 000082AE */  sw         $v0, 0x0($s4)
/* 1B6C0 8002AEC0 000004AD */  sw         $a0, 0x0($t0)
/* 1B6C4 8002AEC4 0000C28F */  lw         $v0, 0x0($fp)
/* 1B6C8 8002AEC8 28009426 */  addiu      $s4, $s4, 0x28
/* 1B6CC 8002AECC 0400D4AF */  sw         $s4, 0x4($fp)
/* 1B6D0 8002AED0 01004224 */  addiu      $v0, $v0, 0x1
/* 1B6D4 8002AED4 0000C2AF */  sw         $v0, 0x0($fp)
.L8002AED8:
/* 1B6D8 8002AED8 3400BF8F */  lw         $ra, 0x34($sp)
/* 1B6DC 8002AEDC 3000BE8F */  lw         $fp, 0x30($sp)
/* 1B6E0 8002AEE0 2C00B78F */  lw         $s7, 0x2C($sp)
/* 1B6E4 8002AEE4 2800B68F */  lw         $s6, 0x28($sp)
/* 1B6E8 8002AEE8 2400B58F */  lw         $s5, 0x24($sp)
/* 1B6EC 8002AEEC 2000B48F */  lw         $s4, 0x20($sp)
/* 1B6F0 8002AEF0 1C00B38F */  lw         $s3, 0x1C($sp)
/* 1B6F4 8002AEF4 1800B28F */  lw         $s2, 0x18($sp)
/* 1B6F8 8002AEF8 1400B18F */  lw         $s1, 0x14($sp)
/* 1B6FC 8002AEFC 1000B08F */  lw         $s0, 0x10($sp)
/* 1B700 8002AF00 0800E003 */  jr         $ra
/* 1B704 8002AF04 3800BD27 */   addiu     $sp, $sp, 0x38
.size DRAW_DrawButton, . - DRAW_DrawButton
