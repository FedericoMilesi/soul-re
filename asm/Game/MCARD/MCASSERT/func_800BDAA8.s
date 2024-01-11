.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BDAA8
/* AE2A8 800BDAA8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* AE2AC 800BDAAC 1000BFAF */  sw         $ra, 0x10($sp)
/* AE2B0 800BDAB0 6E09030C */  jal        func_800C25B8
/* AE2B4 800BDAB4 00000000 */   nop
/* AE2B8 800BDAB8 1000BF8F */  lw         $ra, 0x10($sp)
/* AE2BC 800BDABC 1800BD27 */  addiu      $sp, $sp, 0x18
/* AE2C0 800BDAC0 0800E003 */  jr         $ra
/* AE2C4 800BDAC4 00000000 */   nop
.size func_800BDAA8, . - func_800BDAA8
