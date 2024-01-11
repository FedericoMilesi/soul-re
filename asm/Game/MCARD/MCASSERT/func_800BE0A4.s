.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BE0A4
/* AE8A4 800BE0A4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* AE8A8 800BE0A8 1000BFAF */  sw         $ra, 0x10($sp)
/* AE8AC 800BE0AC A113030C */  jal        func_800C4E84
/* AE8B0 800BE0B0 00000000 */   nop
/* AE8B4 800BE0B4 1000BF8F */  lw         $ra, 0x10($sp)
/* AE8B8 800BE0B8 1800BD27 */  addiu      $sp, $sp, 0x18
/* AE8BC 800BE0BC 0800E003 */  jr         $ra
/* AE8C0 800BE0C0 00000000 */   nop
.size func_800BE0A4, . - func_800BE0A4
