.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_Flee
/* 7AE04 8008A604 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 7AE08 8008A608 1400B1AF */  sw         $s1, 0x14($sp)
/* 7AE0C 8008A60C 21888000 */  addu       $s1, $a0, $zero
/* 7AE10 8008A610 1800BFAF */  sw         $ra, 0x18($sp)
/* 7AE14 8008A614 1000B0AF */  sw         $s0, 0x10($sp)
/* 7AE18 8008A618 6C01308E */  lw         $s0, 0x16C($s1)
/* 7AE1C 8008A61C 00000000 */  nop
/* 7AE20 8008A620 C400048E */  lw         $a0, 0xC4($s0)
/* 7AE24 8008A624 00000000 */  nop
/* 7AE28 8008A628 07008014 */  bnez       $a0, .L8008A648
/* 7AE2C 8008A62C 0002033C */   lui       $v1, (0x2000000 >> 16)
/* 7AE30 8008A630 21202002 */  addu       $a0, $s1, $zero
/* 7AE34 8008A634 91FE010C */  jal        MON_SwitchState
/* 7AE38 8008A638 02000524 */   addiu     $a1, $zero, 0x2
/* 7AE3C 8008A63C 5B010292 */  lbu        $v0, 0x15B($s0)
/* 7AE40 8008A640 CD290208 */  j          .L8008A734
/* 7AE44 8008A644 5A0102A2 */   sb        $v0, 0x15A($s0)
.L8008A648:
/* 7AE48 8008A648 0000028E */  lw         $v0, 0x0($s0)
/* 7AE4C 8008A64C 00000000 */  nop
/* 7AE50 8008A650 24104300 */  and        $v0, $v0, $v1
/* 7AE54 8008A654 10004010 */  beqz       $v0, .L8008A698
/* 7AE58 8008A658 00000000 */   nop
/* 7AE5C 8008A65C CC00028E */  lw         $v0, 0xCC($s0)
/* 7AE60 8008A660 00000000 */  nop
/* 7AE64 8008A664 0C004010 */  beqz       $v0, .L8008A698
/* 7AE68 8008A668 00000000 */   nop
/* 7AE6C 8008A66C 14004284 */  lh         $v0, 0x14($v0)
/* 7AE70 8008A670 14008384 */  lh         $v1, 0x14($a0)
/* 7AE74 8008A674 00000000 */  nop
/* 7AE78 8008A678 2A104300 */  slt        $v0, $v0, $v1
/* 7AE7C 8008A67C 06004010 */  beqz       $v0, .L8008A698
/* 7AE80 8008A680 21202002 */   addu      $a0, $s1, $zero
/* 7AE84 8008A684 92D1000C */  jal        INSTANCE_Query
/* 7AE88 8008A688 01000524 */   addiu     $a1, $zero, 0x1
/* 7AE8C 8008A68C 04004230 */  andi       $v0, $v0, 0x4
/* 7AE90 8008A690 12004010 */  beqz       $v0, .L8008A6DC
/* 7AE94 8008A694 21202002 */   addu      $a0, $s1, $zero
.L8008A698:
/* 7AE98 8008A698 C400028E */  lw         $v0, 0xC4($s0)
/* 7AE9C 8008A69C 6801038E */  lw         $v1, 0x168($s0)
/* 7AEA0 8008A6A0 14004484 */  lh         $a0, 0x14($v0)
/* 7AEA4 8008A6A4 1A006284 */  lh         $v0, 0x1A($v1)
/* 7AEA8 8008A6A8 00000000 */  nop
/* 7AEAC 8008A6AC 2A104400 */  slt        $v0, $v0, $a0
/* 7AEB0 8008A6B0 05004010 */  beqz       $v0, .L8008A6C8
/* 7AEB4 8008A6B4 21202002 */   addu      $a0, $s1, $zero
/* 7AEB8 8008A6B8 91FE010C */  jal        MON_SwitchState
/* 7AEBC 8008A6BC 05000524 */   addiu     $a1, $zero, 0x5
/* 7AEC0 8008A6C0 CD290208 */  j          .L8008A734
/* 7AEC4 8008A6C4 00000000 */   nop
.L8008A6C8:
/* 7AEC8 8008A6C8 530D020C */  jal        MON_ValidPosition
/* 7AECC 8008A6CC 21202002 */   addu      $a0, $s1, $zero
/* 7AED0 8008A6D0 06004014 */  bnez       $v0, .L8008A6EC
/* 7AED4 8008A6D4 5C002526 */   addiu     $a1, $s1, 0x5C
/* 7AED8 8008A6D8 21202002 */  addu       $a0, $s1, $zero
.L8008A6DC:
/* 7AEDC 8008A6DC 91FE010C */  jal        MON_SwitchState
/* 7AEE0 8008A6E0 01000524 */   addiu     $a1, $zero, 0x1
/* 7AEE4 8008A6E4 CD290208 */  j          .L8008A734
/* 7AEE8 8008A6E8 00000000 */   nop
.L8008A6EC:
/* 7AEEC 8008A6EC C400028E */  lw         $v0, 0xC4($s0)
/* 7AEF0 8008A6F0 00000000 */  nop
/* 7AEF4 8008A6F4 0400448C */  lw         $a0, 0x4($v0)
/* 7AEF8 8008A6F8 87E8000C */  jal        MATH3D_AngleFromPosToPos
/* 7AEFC 8008A6FC 5C008424 */   addiu     $a0, $a0, 0x5C
/* 7AF00 8008A700 21202002 */  addu       $a0, $s1, $zero
/* 7AF04 8008A704 00140200 */  sll        $v0, $v0, 16
/* 7AF08 8008A708 032C0200 */  sra        $a1, $v0, 16
/* 7AF0C 8008A70C E81B020C */  jal        MONSENSE_GetClosestFreeDirection
/* 7AF10 8008A710 E8030624 */   addiu     $a2, $zero, 0x3E8
/* 7AF14 8008A714 78002426 */  addiu      $a0, $s1, 0x78
/* 7AF18 8008A718 6801038E */  lw         $v1, 0x168($s0)
/* 7AF1C 8008A71C 00140200 */  sll        $v0, $v0, 16
/* 7AF20 8008A720 22006684 */  lh         $a2, 0x22($v1)
/* 7AF24 8008A724 53E8000C */  jal        AngleMoveToward
/* 7AF28 8008A728 032C0200 */   sra       $a1, $v0, 16
/* 7AF2C 8008A72C 0917020C */  jal        MON_DefaultQueueHandler
/* 7AF30 8008A730 21202002 */   addu      $a0, $s1, $zero
.L8008A734:
/* 7AF34 8008A734 1800BF8F */  lw         $ra, 0x18($sp)
/* 7AF38 8008A738 1400B18F */  lw         $s1, 0x14($sp)
/* 7AF3C 8008A73C 1000B08F */  lw         $s0, 0x10($sp)
/* 7AF40 8008A740 0800E003 */  jr         $ra
/* 7AF44 8008A744 2000BD27 */   addiu     $sp, $sp, 0x20
.size MON_Flee, . - MON_Flee
