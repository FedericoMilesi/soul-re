.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel midiPitchWheelControl
/* 46514 80055D14 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 46518 80055D18 2138A000 */  addu       $a3, $a1, $zero
/* 4651C 80055D1C 1000BFAF */  sw         $ra, 0x10($sp)
/* 46520 80055D20 05008590 */  lbu        $a1, 0x5($a0)
/* 46524 80055D24 07008290 */  lbu        $v0, 0x7($a0)
/* 46528 80055D28 06008390 */  lbu        $v1, 0x6($a0)
/* 4652C 80055D2C 2120E000 */  addu       $a0, $a3, $zero
/* 46530 80055D30 0F00A530 */  andi       $a1, $a1, 0xF
/* 46534 80055D34 40300500 */  sll        $a2, $a1, 1
/* 46538 80055D38 2130E600 */  addu       $a2, $a3, $a2
/* 4653C 80055D3C C0110200 */  sll        $v0, $v0, 7
/* 46540 80055D40 25186200 */  or         $v1, $v1, $v0
/* 46544 80055D44 C056010C */  jal        aadUpdateChannelPitchBend
/* 46548 80055D48 7005C3A4 */   sh        $v1, 0x570($a2)
/* 4654C 80055D4C 1000BF8F */  lw         $ra, 0x10($sp)
/* 46550 80055D50 00000000 */  nop
/* 46554 80055D54 0800E003 */  jr         $ra
/* 46558 80055D58 1800BD27 */   addiu     $sp, $sp, 0x18
.size midiPitchWheelControl, . - midiPitchWheelControl
