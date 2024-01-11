.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_UpdraftPrimModify
/* 3ACF0 8004A4F0 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 3ACF4 8004A4F4 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 3ACF8 8004A4F8 21988000 */  addu       $s3, $a0, $zero
/* 3ACFC 8004A4FC 1400B1AF */  sw         $s1, 0x14($sp)
/* 3AD00 8004A500 2188C000 */  addu       $s1, $a2, $zero
/* 3AD04 8004A504 2000BFAF */  sw         $ra, 0x20($sp)
/* 3AD08 8004A508 1800B2AF */  sw         $s2, 0x18($sp)
/* 3AD0C 8004A50C 3AF2020C */  jal        func_800BC8E8
/* 3AD10 8004A510 1000B0AF */   sw        $s0, 0x10($sp)
/* 3AD14 8004A514 FF0F5230 */  andi       $s2, $v0, 0xFFF
/* 3AD18 8004A518 DCE4010C */  jal        func_80079370
/* 3AD1C 8004A51C 21204002 */   addu      $a0, $s2, $zero
/* 3AD20 8004A520 3AF2020C */  jal        func_800BC8E8
/* 3AD24 8004A524 21804000 */   addu      $s0, $v0, $zero
/* 3AD28 8004A528 24002386 */  lh         $v1, 0x24($s1)
/* 3AD2C 8004A52C 00000000 */  nop
/* 3AD30 8004A530 18000302 */  mult       $s0, $v1
/* 3AD34 8004A534 12180000 */  mflo       $v1
/* 3AD38 8004A538 02006104 */  bgez       $v1, .L8004A544
/* 3AD3C 8004A53C 00000000 */   nop
/* 3AD40 8004A540 FF0F6324 */  addiu      $v1, $v1, 0xFFF
.L8004A544:
/* 3AD44 8004A544 031B0300 */  sra        $v1, $v1, 12
/* 3AD48 8004A548 FF0F4230 */  andi       $v0, $v0, 0xFFF
/* 3AD4C 8004A54C 18006200 */  mult       $v1, $v0
/* 3AD50 8004A550 12180000 */  mflo       $v1
/* 3AD54 8004A554 1E002286 */  lh         $v0, 0x1E($s1)
/* 3AD58 8004A558 00000000 */  nop
/* 3AD5C 8004A55C 1A006200 */  div        $zero, $v1, $v0
/* 3AD60 8004A560 12180000 */  mflo       $v1
/* 3AD64 8004A564 00000000 */  nop
/* 3AD68 8004A568 02006104 */  bgez       $v1, .L8004A574
/* 3AD6C 8004A56C 21204002 */   addu      $a0, $s2, $zero
/* 3AD70 8004A570 FF0F6324 */  addiu      $v1, $v1, 0xFFF
.L8004A574:
/* 3AD74 8004A574 03130300 */  sra        $v0, $v1, 12
/* 3AD78 8004A578 D0E4010C */  jal        func_80079340
/* 3AD7C 8004A57C 5C0062A6 */   sh        $v0, 0x5C($s3)
/* 3AD80 8004A580 3AF2020C */  jal        func_800BC8E8
/* 3AD84 8004A584 21804000 */   addu      $s0, $v0, $zero
/* 3AD88 8004A588 24002386 */  lh         $v1, 0x24($s1)
/* 3AD8C 8004A58C 00000000 */  nop
/* 3AD90 8004A590 18000302 */  mult       $s0, $v1
/* 3AD94 8004A594 12180000 */  mflo       $v1
/* 3AD98 8004A598 02006104 */  bgez       $v1, .L8004A5A4
/* 3AD9C 8004A59C 00000000 */   nop
/* 3ADA0 8004A5A0 FF0F6324 */  addiu      $v1, $v1, 0xFFF
.L8004A5A4:
/* 3ADA4 8004A5A4 031B0300 */  sra        $v1, $v1, 12
/* 3ADA8 8004A5A8 FF0F4230 */  andi       $v0, $v0, 0xFFF
/* 3ADAC 8004A5AC 18006200 */  mult       $v1, $v0
/* 3ADB0 8004A5B0 12180000 */  mflo       $v1
/* 3ADB4 8004A5B4 1E002286 */  lh         $v0, 0x1E($s1)
/* 3ADB8 8004A5B8 00000000 */  nop
/* 3ADBC 8004A5BC 1A006200 */  div        $zero, $v1, $v0
/* 3ADC0 8004A5C0 12180000 */  mflo       $v1
/* 3ADC4 8004A5C4 00000000 */  nop
/* 3ADC8 8004A5C8 03006104 */  bgez       $v1, .L8004A5D8
/* 3ADCC 8004A5CC 03130300 */   sra       $v0, $v1, 12
/* 3ADD0 8004A5D0 FF0F6324 */  addiu      $v1, $v1, 0xFFF
/* 3ADD4 8004A5D4 03130300 */  sra        $v0, $v1, 12
.L8004A5D8:
/* 3ADD8 8004A5D8 3AF2020C */  jal        func_800BC8E8
/* 3ADDC 8004A5DC 5E0062A6 */   sh        $v0, 0x5E($s3)
/* 3ADE0 8004A5E0 21204000 */  addu       $a0, $v0, $zero
/* 3ADE4 8004A5E4 28002386 */  lh         $v1, 0x28($s1)
/* 3ADE8 8004A5E8 1E002286 */  lh         $v0, 0x1E($s1)
/* 3ADEC 8004A5EC 00000000 */  nop
/* 3ADF0 8004A5F0 1A006200 */  div        $zero, $v1, $v0
/* 3ADF4 8004A5F4 12180000 */  mflo       $v1
/* 3ADF8 8004A5F8 02008104 */  bgez       $a0, .L8004A604
/* 3ADFC 8004A5FC 21288000 */   addu      $a1, $a0, $zero
/* 3AE00 8004A600 07008524 */  addiu      $a1, $a0, 0x7
.L8004A604:
/* 3AE04 8004A604 C3100500 */  sra        $v0, $a1, 3
/* 3AE08 8004A608 C0100200 */  sll        $v0, $v0, 3
/* 3AE0C 8004A60C 23108200 */  subu       $v0, $a0, $v0
/* 3AE10 8004A610 21106200 */  addu       $v0, $v1, $v0
/* 3AE14 8004A614 600062A6 */  sh         $v0, 0x60($s3)
/* 3AE18 8004A618 2000BF8F */  lw         $ra, 0x20($sp)
/* 3AE1C 8004A61C 1C00B38F */  lw         $s3, 0x1C($sp)
/* 3AE20 8004A620 1800B28F */  lw         $s2, 0x18($sp)
/* 3AE24 8004A624 1400B18F */  lw         $s1, 0x14($sp)
/* 3AE28 8004A628 1000B08F */  lw         $s0, 0x10($sp)
/* 3AE2C 8004A62C 0800E003 */  jr         $ra
/* 3AE30 8004A630 2800BD27 */   addiu     $sp, $sp, 0x28
.size FX_UpdraftPrimModify, . - FX_UpdraftPrimModify
