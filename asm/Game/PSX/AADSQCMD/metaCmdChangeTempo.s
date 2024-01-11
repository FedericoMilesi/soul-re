.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdChangeTempo
/* 46870 80056070 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 46874 80056074 1800BFAF */  sw         $ra, 0x18($sp)
/* 46878 80056078 3805A68C */  lw         $a2, 0x538($a1)
/* 4687C 8005607C 00000000 */  nop
/* 46880 80056080 1400C38C */  lw         $v1, 0x14($a2)
/* 46884 80056084 00000000 */  nop
/* 46888 80056088 40100300 */  sll        $v0, $v1, 1
/* 4688C 8005608C 21104300 */  addu       $v0, $v0, $v1
/* 46890 80056090 C0100200 */  sll        $v0, $v0, 3
/* 46894 80056094 21104300 */  addu       $v0, $v0, $v1
/* 46898 80056098 80100200 */  sll        $v0, $v0, 2
/* 4689C 8005609C 1000A2AF */  sw         $v0, 0x10($sp)
/* 468A0 800560A0 06008390 */  lbu        $v1, 0x6($a0)
/* 468A4 800560A4 00000000 */  nop
/* 468A8 800560A8 1B004300 */  divu       $zero, $v0, $v1
/* 468AC 800560AC 12100000 */  mflo       $v0
/* 468B0 800560B0 00000000 */  nop
/* 468B4 800560B4 1000A2AF */  sw         $v0, 0x10($sp)
/* 468B8 800560B8 1200C294 */  lhu        $v0, 0x12($a2)
/* 468BC 800560BC 00000000 */  nop
/* 468C0 800560C0 1400A2AF */  sw         $v0, 0x14($sp)
/* 468C4 800560C4 3C05A490 */  lbu        $a0, 0x53C($a1)
/* 468C8 800560C8 C751010C */  jal        aadSetSlotTempo
/* 468CC 800560CC 1000A527 */   addiu     $a1, $sp, 0x10
/* 468D0 800560D0 1800BF8F */  lw         $ra, 0x18($sp)
/* 468D4 800560D4 00000000 */  nop
/* 468D8 800560D8 0800E003 */  jr         $ra
/* 468DC 800560DC 2000BD27 */   addiu     $sp, $sp, 0x20
.size metaCmdChangeTempo, . - metaCmdChangeTempo
