.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_RemoveInstancesWithIDInInstanceList
/* 4B5A4 8005ADA4 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 4B5A8 8005ADA8 2000B4AF */  sw         $s4, 0x20($sp)
/* 4B5AC 8005ADAC 21A08000 */  addu       $s4, $a0, $zero
/* 4B5B0 8005ADB0 1800B2AF */  sw         $s2, 0x18($sp)
/* 4B5B4 8005ADB4 2190A000 */  addu       $s2, $a1, $zero
/* 4B5B8 8005ADB8 2400BFAF */  sw         $ra, 0x24($sp)
/* 4B5BC 8005ADBC 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 4B5C0 8005ADC0 1400B1AF */  sw         $s1, 0x14($sp)
/* 4B5C4 8005ADC4 1000B0AF */  sw         $s0, 0x10($sp)
/* 4B5C8 8005ADC8 0400908E */  lw         $s0, 0x4($s4)
/* 4B5CC 8005ADCC 00000000 */  nop
/* 4B5D0 8005ADD0 17000012 */  beqz       $s0, .L8005AE30
/* 4B5D4 8005ADD4 2198C000 */   addu      $s3, $a2, $zero
.L8005ADD8:
/* 4B5D8 8005ADD8 3800028E */  lw         $v0, 0x38($s0)
/* 4B5DC 8005ADDC 0800118E */  lw         $s1, 0x8($s0)
/* 4B5E0 8005ADE0 09005214 */  bne        $v0, $s2, .L8005AE08
/* 4B5E4 8005ADE4 21200002 */   addu      $a0, $s0, $zero
/* 4B5E8 8005ADE8 2BD8020C */  jal        SAVE_Instance
/* 4B5EC 8005ADEC 21286002 */   addu      $a1, $s3, $zero
/* 4B5F0 8005ADF0 21208002 */  addu       $a0, $s4, $zero
/* 4B5F4 8005ADF4 21280002 */  addu       $a1, $s0, $zero
/* 4B5F8 8005ADF8 14CA000C */  jal        INSTANCE_ReallyRemoveInstance
/* 4B5FC 8005ADFC 21300000 */   addu      $a2, $zero, $zero
/* 4B600 8005AE00 8A6B0108 */  j          .L8005AE28
/* 4B604 8005AE04 21802002 */   addu      $s0, $s1, $zero
.L8005AE08:
/* 4B608 8005AE08 3400028E */  lw         $v0, 0x34($s0)
/* 4B60C 8005AE0C 00000000 */  nop
/* 4B610 8005AE10 04005214 */  bne        $v0, $s2, .L8005AE24
/* 4B614 8005AE14 00000000 */   nop
/* 4B618 8005AE18 2BD8020C */  jal        SAVE_Instance
/* 4B61C 8005AE1C 21286002 */   addu      $a1, $s3, $zero
/* 4B620 8005AE20 200000AE */  sw         $zero, 0x20($s0)
.L8005AE24:
/* 4B624 8005AE24 21802002 */  addu       $s0, $s1, $zero
.L8005AE28:
/* 4B628 8005AE28 EBFF0016 */  bnez       $s0, .L8005ADD8
/* 4B62C 8005AE2C 00000000 */   nop
.L8005AE30:
/* 4B630 8005AE30 2400BF8F */  lw         $ra, 0x24($sp)
/* 4B634 8005AE34 2000B48F */  lw         $s4, 0x20($sp)
/* 4B638 8005AE38 1C00B38F */  lw         $s3, 0x1C($sp)
/* 4B63C 8005AE3C 1800B28F */  lw         $s2, 0x18($sp)
/* 4B640 8005AE40 1400B18F */  lw         $s1, 0x14($sp)
/* 4B644 8005AE44 1000B08F */  lw         $s0, 0x10($sp)
/* 4B648 8005AE48 0800E003 */  jr         $ra
/* 4B64C 8005AE4C 2800BD27 */   addiu     $sp, $sp, 0x28
.size STREAM_RemoveInstancesWithIDInInstanceList, . - STREAM_RemoveInstancesWithIDInInstanceList
