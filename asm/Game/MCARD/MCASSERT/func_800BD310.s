.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BD310
/* ADB10 800BD310 FFFF8830 */  andi       $t0, $a0, 0xFFFF
/* ADB14 800BD314 03000229 */  slti       $v0, $t0, 0x3
/* ADB18 800BD318 03004014 */  bnez       $v0, .L800BD328
/* ADB1C 800BD31C 48000724 */   addiu     $a3, $zero, 0x48
/* ADB20 800BD320 E9F40208 */  j          .L800BD3A4
/* ADB24 800BD324 21100000 */   addu      $v0, $zero, $zero
.L800BD328:
/* ADB28 800BD328 0D80023C */  lui        $v0, %hi(ratan_tbl + 0x814)
/* ADB2C 800BD32C 90E3428C */  lw         $v0, %lo(ratan_tbl + 0x814)($v0)
/* ADB30 800BD330 00190800 */  sll        $v1, $t0, 4
/* ADB34 800BD334 21186200 */  addu       $v1, $v1, $v0
/* ADB38 800BD338 0200022D */  sltiu      $v0, $t0, 0x2
/* ADB3C 800BD33C 040060A4 */  sh         $zero, 0x4($v1)
/* ADB40 800BD340 080065A4 */  sh         $a1, 0x8($v1)
/* ADB44 800BD344 08004010 */  beqz       $v0, .L800BD368
/* ADB48 800BD348 1000C230 */   andi      $v0, $a2, 0x10
/* ADB4C 800BD34C 02004010 */  beqz       $v0, .L800BD358
/* ADB50 800BD350 0100C230 */   andi      $v0, $a2, 0x1
/* ADB54 800BD354 49000724 */  addiu      $a3, $zero, 0x49
.L800BD358:
/* ADB58 800BD358 0A004014 */  bnez       $v0, .L800BD384
/* ADB5C 800BD35C 0010C230 */   andi      $v0, $a2, 0x1000
/* ADB60 800BD360 E1F40208 */  j          .L800BD384
/* ADB64 800BD364 0001E734 */   ori       $a3, $a3, 0x100
.L800BD368:
/* ADB68 800BD368 02000224 */  addiu      $v0, $zero, 0x2
/* ADB6C 800BD36C 05000215 */  bne        $t0, $v0, .L800BD384
/* ADB70 800BD370 0010C230 */   andi      $v0, $a2, 0x1000
/* ADB74 800BD374 0100C230 */  andi       $v0, $a2, 0x1
/* ADB78 800BD378 02004014 */  bnez       $v0, .L800BD384
/* ADB7C 800BD37C 0010C230 */   andi      $v0, $a2, 0x1000
/* ADB80 800BD380 48020724 */  addiu      $a3, $zero, 0x248
.L800BD384:
/* ADB84 800BD384 02004010 */  beqz       $v0, .L800BD390
/* ADB88 800BD388 01000224 */   addiu     $v0, $zero, 0x1
/* ADB8C 800BD38C 1000E734 */  ori        $a3, $a3, 0x10
.L800BD390:
/* ADB90 800BD390 0D80043C */  lui        $a0, %hi(ratan_tbl + 0x814)
/* ADB94 800BD394 90E3848C */  lw         $a0, %lo(ratan_tbl + 0x814)($a0)
/* ADB98 800BD398 00190800 */  sll        $v1, $t0, 4
/* ADB9C 800BD39C 21186400 */  addu       $v1, $v1, $a0
/* ADBA0 800BD3A0 040067A4 */  sh         $a3, 0x4($v1)
.L800BD3A4:
/* ADBA4 800BD3A4 0800E003 */  jr         $ra
/* ADBA8 800BD3A8 00000000 */   nop
.size func_800BD310, . - func_800BD310
