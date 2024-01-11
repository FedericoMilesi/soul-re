.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_ResolveObjectSignal
/* 52578 80061D78 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 5257C 80061D7C 1000BFAF */  sw         $ra, 0x10($sp)
/* 52580 80061D80 0800848C */  lw         $a0, 0x8($a0)
/* 52584 80061D84 1B00A104 */  bgez       $a1, .L80061DF4
/* 52588 80061D88 21300000 */   addu      $a2, $zero, $zero
/* 5258C 80061D8C 0500A324 */  addiu      $v1, $a1, 0x5
/* 52590 80061D90 0500622C */  sltiu      $v0, $v1, 0x5
/* 52594 80061D94 1A004010 */  beqz       $v0, .L80061E00
/* 52598 80061D98 0180023C */   lui       $v0, %hi(jtbl_800103B0)
/* 5259C 80061D9C B0034224 */  addiu      $v0, $v0, %lo(jtbl_800103B0)
/* 525A0 80061DA0 80180300 */  sll        $v1, $v1, 2
/* 525A4 80061DA4 21186200 */  addu       $v1, $v1, $v0
/* 525A8 80061DA8 0000628C */  lw         $v0, 0x0($v1)
/* 525AC 80061DAC 00000000 */  nop
/* 525B0 80061DB0 08004000 */  jr         $v0
/* 525B4 80061DB4 00000000 */   nop
jlabel .L80061DB8
/* 525B8 80061DB8 7400868C */  lw         $a2, 0x74($a0)
/* 525BC 80061DBC 80870108 */  j          .L80061E00
/* 525C0 80061DC0 00000000 */   nop
jlabel .L80061DC4
/* 525C4 80061DC4 B400868C */  lw         $a2, 0xB4($a0)
/* 525C8 80061DC8 80870108 */  j          .L80061E00
/* 525CC 80061DCC 00000000 */   nop
jlabel .L80061DD0
/* 525D0 80061DD0 B800868C */  lw         $a2, 0xB8($a0)
/* 525D4 80061DD4 80870108 */  j          .L80061E00
/* 525D8 80061DD8 00000000 */   nop
jlabel .L80061DDC
/* 525DC 80061DDC BC00868C */  lw         $a2, 0xBC($a0)
/* 525E0 80061DE0 80870108 */  j          .L80061E00
/* 525E4 80061DE4 00000000 */   nop
jlabel .L80061DE8
/* 525E8 80061DE8 C000868C */  lw         $a2, 0xC0($a0)
/* 525EC 80061DEC 80870108 */  j          .L80061E00
/* 525F0 80061DF0 00000000 */   nop
.L80061DF4:
/* 525F4 80061DF4 B279000C */  jal        SIGNAL_FindSignal
/* 525F8 80061DF8 00000000 */   nop
/* 525FC 80061DFC 21304000 */  addu       $a2, $v0, $zero
.L80061E00:
/* 52600 80061E00 1000BF8F */  lw         $ra, 0x10($sp)
/* 52604 80061E04 2110C000 */  addu       $v0, $a2, $zero
/* 52608 80061E08 0800E003 */  jr         $ra
/* 5260C 80061E0C 1800BD27 */   addiu     $sp, $sp, 0x18
.size EVENT_ResolveObjectSignal, . - EVENT_ResolveObjectSignal
