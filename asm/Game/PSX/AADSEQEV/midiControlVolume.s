.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel midiControlVolume
/* 4656C 80055D6C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 46570 80055D70 2130A000 */  addu       $a2, $a1, $zero
/* 46574 80055D74 1000BFAF */  sw         $ra, 0x10($sp)
/* 46578 80055D78 05008290 */  lbu        $v0, 0x5($a0)
/* 4657C 80055D7C 07008390 */  lbu        $v1, 0x7($a0)
/* 46580 80055D80 0F004530 */  andi       $a1, $v0, 0xF
/* 46584 80055D84 2110C500 */  addu       $v0, $a2, $a1
/* 46588 80055D88 A00543A0 */  sb         $v1, 0x5A0($v0)
/* 4658C 80055D8C 4C05C294 */  lhu        $v0, 0x54C($a2)
/* 46590 80055D90 00000000 */  nop
/* 46594 80055D94 0710A200 */  srav       $v0, $v0, $a1
/* 46598 80055D98 01004230 */  andi       $v0, $v0, 0x1
/* 4659C 80055D9C 03004010 */  beqz       $v0, .L80055DAC
/* 465A0 80055DA0 00000000 */   nop
/* 465A4 80055DA4 0855010C */  jal        aadUpdateChannelVolPan
/* 465A8 80055DA8 2120C000 */   addu      $a0, $a2, $zero
.L80055DAC:
/* 465AC 80055DAC 1000BF8F */  lw         $ra, 0x10($sp)
/* 465B0 80055DB0 00000000 */  nop
/* 465B4 80055DB4 0800E003 */  jr         $ra
/* 465B8 80055DB8 1800BD27 */   addiu     $sp, $sp, 0x18
.size midiControlVolume, . - midiControlVolume
