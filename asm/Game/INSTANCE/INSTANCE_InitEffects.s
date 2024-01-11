.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel INSTANCE_InitEffects
/* 23520 80032D20 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 23524 80032D24 1400B1AF */  sw         $s1, 0x14($sp)
/* 23528 80032D28 2188A000 */  addu       $s1, $a1, $zero
/* 2352C 80032D2C 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 23530 80032D30 1800B2AF */  sw         $s2, 0x18($sp)
/* 23534 80032D34 1000B0AF */  sw         $s0, 0x10($sp)
/* 23538 80032D38 2C00228E */  lw         $v0, 0x2C($s1)
/* 2353C 80032D3C 00000000 */  nop
/* 23540 80032D40 00014230 */  andi       $v0, $v0, 0x100
/* 23544 80032D44 12004014 */  bnez       $v0, .L80032D90
/* 23548 80032D48 21908000 */   addu      $s2, $a0, $zero
/* 2354C 80032D4C 36002286 */  lh         $v0, 0x36($s1)
/* 23550 80032D50 00000000 */  nop
/* 23554 80032D54 0E004010 */  beqz       $v0, .L80032D90
/* 23558 80032D58 00000000 */   nop
/* 2355C 80032D5C 0C004018 */  blez       $v0, .L80032D90
/* 23560 80032D60 21800000 */   addu      $s0, $zero, $zero
/* 23564 80032D64 80101000 */  sll        $v0, $s0, 2
.L80032D68:
/* 23568 80032D68 21204002 */  addu       $a0, $s2, $zero
/* 2356C 80032D6C 3800258E */  lw         $a1, 0x38($s1)
/* 23570 80032D70 01000624 */  addiu      $a2, $zero, 0x1
/* 23574 80032D74 8E34010C */  jal        FX_StartInstanceEffect
/* 23578 80032D78 2128A200 */   addu      $a1, $a1, $v0
/* 2357C 80032D7C 36002286 */  lh         $v0, 0x36($s1)
/* 23580 80032D80 01001026 */  addiu      $s0, $s0, 0x1
/* 23584 80032D84 2A100202 */  slt        $v0, $s0, $v0
/* 23588 80032D88 F7FF4014 */  bnez       $v0, .L80032D68
/* 2358C 80032D8C 80101000 */   sll       $v0, $s0, 2
.L80032D90:
/* 23590 80032D90 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 23594 80032D94 1800B28F */  lw         $s2, 0x18($sp)
/* 23598 80032D98 1400B18F */  lw         $s1, 0x14($sp)
/* 2359C 80032D9C 1000B08F */  lw         $s0, 0x10($sp)
/* 235A0 80032DA0 0800E003 */  jr         $ra
/* 235A4 80032DA4 2000BD27 */   addiu     $sp, $sp, 0x20
.size INSTANCE_InitEffects, . - INSTANCE_InitEffects
