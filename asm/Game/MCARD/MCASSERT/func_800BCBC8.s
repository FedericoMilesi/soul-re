.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BCBC8
/* AD3C8 800BCBC8 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* AD3CC 800BCBCC 1C00BFAF */  sw         $ra, 0x1C($sp)
/* AD3D0 800BCBD0 1800BEAF */  sw         $fp, 0x18($sp)
/* AD3D4 800BCBD4 21F0A003 */  addu       $fp, $sp, $zero
/* AD3D8 800BCBD8 1400C0AF */  sw         $zero, 0x14($fp)
/* AD3DC 800BCBDC 1A000424 */  addiu      $a0, $zero, 0x1A
/* AD3E0 800BCBE0 1000C527 */  addiu      $a1, $fp, 0x10
/* AD3E4 800BCBE4 1000C627 */  addiu      $a2, $fp, 0x10
/* AD3E8 800BCBE8 ECF8020C */  jal        func_800BE3B0
/* AD3EC 800BCBEC 00000000 */   nop
/* AD3F0 800BCBF0 1400C28F */  lw         $v0, 0x14($fp)
/* AD3F4 800BCBF4 4545033C */  lui        $v1, (0x45454353 >> 16)
/* AD3F8 800BCBF8 53436334 */  ori        $v1, $v1, (0x45454353 & 0xFFFF)
/* AD3FC 800BCBFC 26104300 */  xor        $v0, $v0, $v1
/* AD400 800BCC00 0100432C */  sltiu      $v1, $v0, 0x1
/* AD404 800BCC04 21106000 */  addu       $v0, $v1, $zero
/* AD408 800BCC08 04F30208 */  j          .L800BCC10
/* AD40C 800BCC0C 00000000 */   nop
.L800BCC10:
/* AD410 800BCC10 21E8C003 */  addu       $sp, $fp, $zero
/* AD414 800BCC14 1C00BF8F */  lw         $ra, 0x1C($sp)
/* AD418 800BCC18 1800BE8F */  lw         $fp, 0x18($sp)
/* AD41C 800BCC1C 2000BD27 */  addiu      $sp, $sp, 0x20
/* AD420 800BCC20 0800E003 */  jr         $ra
/* AD424 800BCC24 00000000 */   nop
.size func_800BCBC8, . - func_800BCBC8
