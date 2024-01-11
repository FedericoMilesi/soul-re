.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel midiControlPan
/* 465BC 80055DBC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 465C0 80055DC0 2130A000 */  addu       $a2, $a1, $zero
/* 465C4 80055DC4 1000BFAF */  sw         $ra, 0x10($sp)
/* 465C8 80055DC8 05008290 */  lbu        $v0, 0x5($a0)
/* 465CC 80055DCC 07008390 */  lbu        $v1, 0x7($a0)
/* 465D0 80055DD0 0F004530 */  andi       $a1, $v0, 0xF
/* 465D4 80055DD4 2110C500 */  addu       $v0, $a2, $a1
/* 465D8 80055DD8 B00543A0 */  sb         $v1, 0x5B0($v0)
/* 465DC 80055DDC 4C05C294 */  lhu        $v0, 0x54C($a2)
/* 465E0 80055DE0 00000000 */  nop
/* 465E4 80055DE4 0710A200 */  srav       $v0, $v0, $a1
/* 465E8 80055DE8 01004230 */  andi       $v0, $v0, 0x1
/* 465EC 80055DEC 03004010 */  beqz       $v0, .L80055DFC
/* 465F0 80055DF0 00000000 */   nop
/* 465F4 80055DF4 0855010C */  jal        aadUpdateChannelVolPan
/* 465F8 80055DF8 2120C000 */   addu      $a0, $a2, $zero
.L80055DFC:
/* 465FC 80055DFC 1000BF8F */  lw         $ra, 0x10($sp)
/* 46600 80055E00 00000000 */  nop
/* 46604 80055E04 0800E003 */  jr         $ra
/* 46608 80055E08 1800BD27 */   addiu     $sp, $sp, 0x18
.size midiControlPan, . - midiControlPan
