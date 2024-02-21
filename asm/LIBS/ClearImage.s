.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ClearImage
/* AADC0 800BA5C0 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* AADC4 800BA5C4 1C00B3AF */  sw         $s3, 0x1C($sp)
/* AADC8 800BA5C8 21988000 */  addu       $s3, $a0, $zero
/* AADCC 800BA5CC 0180043C */  lui        $a0, %hi(D_80012658)
/* AADD0 800BA5D0 58268424 */  addiu      $a0, $a0, %lo(D_80012658)
/* AADD4 800BA5D4 1800B2AF */  sw         $s2, 0x18($sp)
/* AADD8 800BA5D8 2190A000 */  addu       $s2, $a1, $zero
/* AADDC 800BA5DC 21286002 */  addu       $a1, $s3, $zero
/* AADE0 800BA5E0 1400B1AF */  sw         $s1, 0x14($sp)
/* AADE4 800BA5E4 2188C000 */  addu       $s1, $a2, $zero
/* AADE8 800BA5E8 1000B0AF */  sw         $s0, 0x10($sp)
/* AADEC 800BA5EC 2000BFAF */  sw         $ra, 0x20($sp)
/* AADF0 800BA5F0 29E9020C */  jal        func_800BA4A4
/* AADF4 800BA5F4 2180E000 */   addu      $s0, $a3, $zero
/* AADF8 800BA5F8 21286002 */  addu       $a1, $s3, $zero
/* AADFC 800BA5FC FF001032 */  andi       $s0, $s0, 0xFF
/* AAE00 800BA600 00841000 */  sll        $s0, $s0, 16
/* AAE04 800BA604 FF003132 */  andi       $s1, $s1, 0xFF
/* AAE08 800BA608 008A1100 */  sll        $s1, $s1, 8
/* AAE0C 800BA60C 25801102 */  or         $s0, $s0, $s1
/* AAE10 800BA610 FF005232 */  andi       $s2, $s2, 0xFF
/* AAE14 800BA614 0D80023C */  lui        $v0, %hi(D_800CDA04)
/* AAE18 800BA618 04DA428C */  lw         $v0, %lo(D_800CDA04)($v0)
/* AAE1C 800BA61C 08000624 */  addiu      $a2, $zero, 0x8
/* AAE20 800BA620 0C00448C */  lw         $a0, 0xC($v0)
/* AAE24 800BA624 0800428C */  lw         $v0, 0x8($v0)
/* AAE28 800BA628 00000000 */  nop
/* AAE2C 800BA62C 09F84000 */  jalr       $v0
/* AAE30 800BA630 25381202 */   or        $a3, $s0, $s2
/* AAE34 800BA634 2000BF8F */  lw         $ra, 0x20($sp)
/* AAE38 800BA638 1C00B38F */  lw         $s3, 0x1C($sp)
/* AAE3C 800BA63C 1800B28F */  lw         $s2, 0x18($sp)
/* AAE40 800BA640 1400B18F */  lw         $s1, 0x14($sp)
/* AAE44 800BA644 1000B08F */  lw         $s0, 0x10($sp)
/* AAE48 800BA648 0800E003 */  jr         $ra
/* AAE4C 800BA64C 2800BD27 */   addiu     $sp, $sp, 0x28
.size ClearImage, . - ClearImage
