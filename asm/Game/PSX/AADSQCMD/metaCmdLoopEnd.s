.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdLoopEnd
/* 472AC 80056AAC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 472B0 80056AB0 2138A000 */  addu       $a3, $a1, $zero
/* 472B4 80056AB4 1000BFAF */  sw         $ra, 0x10($sp)
/* 472B8 80056AB8 04008590 */  lbu        $a1, 0x4($a0)
/* 472BC 80056ABC 00000000 */  nop
/* 472C0 80056AC0 2130E500 */  addu       $a2, $a3, $a1
/* 472C4 80056AC4 E804C290 */  lbu        $v0, 0x4E8($a2)
/* 472C8 80056AC8 00000000 */  nop
/* 472CC 80056ACC 17004010 */  beqz       $v0, .L80056B2C
/* 472D0 80056AD0 FFFF4324 */   addiu     $v1, $v0, -0x1
/* 472D4 80056AD4 00110300 */  sll        $v0, $v1, 4
/* 472D8 80056AD8 2110A200 */  addu       $v0, $a1, $v0
/* 472DC 80056ADC 2120E200 */  addu       $a0, $a3, $v0
/* 472E0 80056AE0 F8048290 */  lbu        $v0, 0x4F8($a0)
/* 472E4 80056AE4 00000000 */  nop
/* 472E8 80056AE8 05004010 */  beqz       $v0, .L80056B00
/* 472EC 80056AEC FFFF4224 */   addiu     $v0, $v0, -0x1
/* 472F0 80056AF0 F80482A0 */  sb         $v0, 0x4F8($a0)
/* 472F4 80056AF4 FF004230 */  andi       $v0, $v0, 0xFF
/* 472F8 80056AF8 0B004010 */  beqz       $v0, .L80056B28
/* 472FC 80056AFC 00000000 */   nop
.L80056B00:
/* 47300 80056B00 2120E000 */  addu       $a0, $a3, $zero
/* 47304 80056B04 80100500 */  sll        $v0, $a1, 2
/* 47308 80056B08 80190300 */  sll        $v1, $v1, 6
/* 4730C 80056B0C 21104300 */  addu       $v0, $v0, $v1
/* 47310 80056B10 21108200 */  addu       $v0, $a0, $v0
/* 47314 80056B14 E803468C */  lw         $a2, 0x3E8($v0)
/* 47318 80056B18 465A010C */  jal        aadGotoSequencePosition
/* 4731C 80056B1C 00000000 */   nop
/* 47320 80056B20 CB5A0108 */  j          .L80056B2C
/* 47324 80056B24 00000000 */   nop
.L80056B28:
/* 47328 80056B28 E804C3A0 */  sb         $v1, 0x4E8($a2)
.L80056B2C:
/* 4732C 80056B2C 1000BF8F */  lw         $ra, 0x10($sp)
/* 47330 80056B30 00000000 */  nop
/* 47334 80056B34 0800E003 */  jr         $ra
/* 47338 80056B38 1800BD27 */   addiu     $sp, $sp, 0x18
.size metaCmdLoopEnd, . - metaCmdLoopEnd
