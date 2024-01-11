.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BE9AC
/* AF1AC 800BE9AC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* AF1B0 800BE9B0 1000BFAF */  sw         $ra, 0x10($sp)
/* AF1B4 800BE9B4 3DE8020C */  jal        func_800BA0F4
/* AF1B8 800BE9B8 0C000624 */   addiu     $a2, $zero, 0xC
/* AF1BC 800BE9BC 1000BF8F */  lw         $ra, 0x10($sp)
/* AF1C0 800BE9C0 0100422C */  sltiu      $v0, $v0, 0x1
/* AF1C4 800BE9C4 0800E003 */  jr         $ra
/* AF1C8 800BE9C8 1800BD27 */   addiu     $sp, $sp, 0x18
.size func_800BE9AC, . - func_800BE9AC
