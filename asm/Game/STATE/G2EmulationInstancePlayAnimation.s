.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2EmulationInstancePlayAnimation
/* 6259C 80071D9C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 625A0 80071DA0 1000B0AF */  sw         $s0, 0x10($sp)
/* 625A4 80071DA4 21800000 */  addu       $s0, $zero, $zero
/* 625A8 80071DA8 1800BFAF */  sw         $ra, 0x18($sp)
/* 625AC 80071DAC 1400B1AF */  sw         $s1, 0x14($sp)
/* 625B0 80071DB0 C8018290 */  lbu        $v0, 0x1C8($a0)
/* 625B4 80071DB4 00000000 */  nop
/* 625B8 80071DB8 0D004010 */  beqz       $v0, .L80071DF0
/* 625BC 80071DBC C8019124 */   addiu     $s1, $a0, 0x1C8
/* 625C0 80071DC0 FF000232 */  andi       $v0, $s0, 0xFF
.L80071DC4:
/* 625C4 80071DC4 40200200 */  sll        $a0, $v0, 1
/* 625C8 80071DC8 21208200 */  addu       $a0, $a0, $v0
/* 625CC 80071DCC 00210400 */  sll        $a0, $a0, 4
/* 625D0 80071DD0 24008424 */  addiu      $a0, $a0, 0x24
/* 625D4 80071DD4 2B40020C */  jal        G2AnimSection_NextKeyframe
/* 625D8 80071DD8 21202402 */   addu      $a0, $s1, $a0
/* 625DC 80071DDC 00002292 */  lbu        $v0, 0x0($s1)
/* 625E0 80071DE0 01001026 */  addiu      $s0, $s0, 0x1
/* 625E4 80071DE4 2A100202 */  slt        $v0, $s0, $v0
/* 625E8 80071DE8 F6FF4014 */  bnez       $v0, .L80071DC4
/* 625EC 80071DEC FF000232 */   andi      $v0, $s0, 0xFF
.L80071DF0:
/* 625F0 80071DF0 1800BF8F */  lw         $ra, 0x18($sp)
/* 625F4 80071DF4 1400B18F */  lw         $s1, 0x14($sp)
/* 625F8 80071DF8 1000B08F */  lw         $s0, 0x10($sp)
/* 625FC 80071DFC 0800E003 */  jr         $ra
/* 62600 80071E00 2000BD27 */   addiu     $sp, $sp, 0x20
.size G2EmulationInstancePlayAnimation, . - G2EmulationInstancePlayAnimation
