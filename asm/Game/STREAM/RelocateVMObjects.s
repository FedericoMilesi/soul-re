.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RelocateVMObjects
/* 4C728 8005BF28 1300A018 */  blez       $a1, .L8005BF78
/* 4C72C 8005BF2C 21380000 */   addu      $a3, $zero, $zero
.L8005BF30:
/* 4C730 8005BF30 10008294 */  lhu        $v0, 0x10($a0)
/* 4C734 8005BF34 0000C394 */  lhu        $v1, 0x0($a2)
/* 4C738 8005BF38 00000000 */  nop
/* 4C73C 8005BF3C 21104300 */  addu       $v0, $v0, $v1
/* 4C740 8005BF40 100082A4 */  sh         $v0, 0x10($a0)
/* 4C744 8005BF44 12008294 */  lhu        $v0, 0x12($a0)
/* 4C748 8005BF48 0200C394 */  lhu        $v1, 0x2($a2)
/* 4C74C 8005BF4C 00000000 */  nop
/* 4C750 8005BF50 21104300 */  addu       $v0, $v0, $v1
/* 4C754 8005BF54 120082A4 */  sh         $v0, 0x12($a0)
/* 4C758 8005BF58 14008294 */  lhu        $v0, 0x14($a0)
/* 4C75C 8005BF5C 0400C394 */  lhu        $v1, 0x4($a2)
/* 4C760 8005BF60 0100E724 */  addiu      $a3, $a3, 0x1
/* 4C764 8005BF64 21104300 */  addu       $v0, $v0, $v1
/* 4C768 8005BF68 140082A4 */  sh         $v0, 0x14($a0)
/* 4C76C 8005BF6C 2A10E500 */  slt        $v0, $a3, $a1
/* 4C770 8005BF70 EFFF4014 */  bnez       $v0, .L8005BF30
/* 4C774 8005BF74 3C008424 */   addiu     $a0, $a0, 0x3C
.L8005BF78:
/* 4C778 8005BF78 0800E003 */  jr         $ra
/* 4C77C 8005BF7C 00000000 */   nop
.size RelocateVMObjects, . - RelocateVMObjects
