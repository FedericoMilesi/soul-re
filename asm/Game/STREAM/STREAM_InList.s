.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_InList
/* 495F8 80058DF8 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 495FC 80058DFC 1000B0AF */  sw         $s0, 0x10($sp)
/* 49600 80058E00 2180A000 */  addu       $s0, $a1, $zero
/* 49604 80058E04 1800BFAF */  sw         $ra, 0x18($sp)
/* 49608 80058E08 1400B1AF */  sw         $s1, 0x14($sp)
/* 4960C 80058E0C 0000028E */  lw         $v0, 0x0($s0)
/* 49610 80058E10 00000000 */  nop
/* 49614 80058E14 0C004010 */  beqz       $v0, .L80058E48
/* 49618 80058E18 21888000 */   addu      $s1, $a0, $zero
.L80058E1C:
/* 4961C 80058E1C 0000058E */  lw         $a1, 0x0($s0)
/* 49620 80058E20 1CD2010C */  jal        strcmpi
/* 49624 80058E24 21202002 */   addu      $a0, $s1, $zero
/* 49628 80058E28 03004014 */  bnez       $v0, .L80058E38
/* 4962C 80058E2C 04001026 */   addiu     $s0, $s0, 0x4
/* 49630 80058E30 93630108 */  j          .L80058E4C
/* 49634 80058E34 01000224 */   addiu     $v0, $zero, 0x1
.L80058E38:
/* 49638 80058E38 0000028E */  lw         $v0, 0x0($s0)
/* 4963C 80058E3C 00000000 */  nop
/* 49640 80058E40 F6FF4014 */  bnez       $v0, .L80058E1C
/* 49644 80058E44 00000000 */   nop
.L80058E48:
/* 49648 80058E48 21100000 */  addu       $v0, $zero, $zero
.L80058E4C:
/* 4964C 80058E4C 1800BF8F */  lw         $ra, 0x18($sp)
/* 49650 80058E50 1400B18F */  lw         $s1, 0x14($sp)
/* 49654 80058E54 1000B08F */  lw         $s0, 0x10($sp)
/* 49658 80058E58 0800E003 */  jr         $ra
/* 4965C 80058E5C 2000BD27 */   addiu     $sp, $sp, 0x20
.size STREAM_InList, . - STREAM_InList
