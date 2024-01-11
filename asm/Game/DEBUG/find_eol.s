.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel find_eol
/* 45A0 80013DA0 21108000 */  addu       $v0, $a0, $zero
/* 45A4 80013DA4 00004390 */  lbu        $v1, 0x0($v0)
/* 45A8 80013DA8 00000000 */  nop
/* 45AC 80013DAC 08006010 */  beqz       $v1, .L80013DD0
/* 45B0 80013DB0 0A000424 */   addiu     $a0, $zero, 0xA
.L80013DB4:
/* 45B4 80013DB4 06006410 */  beq        $v1, $a0, .L80013DD0
/* 45B8 80013DB8 00000000 */   nop
/* 45BC 80013DBC 01004224 */  addiu      $v0, $v0, 0x1
/* 45C0 80013DC0 00004390 */  lbu        $v1, 0x0($v0)
/* 45C4 80013DC4 00000000 */  nop
/* 45C8 80013DC8 FAFF6014 */  bnez       $v1, .L80013DB4
/* 45CC 80013DCC 00000000 */   nop
.L80013DD0:
/* 45D0 80013DD0 0800E003 */  jr         $ra
/* 45D4 80013DD4 00000000 */   nop
.size find_eol, . - find_eol
