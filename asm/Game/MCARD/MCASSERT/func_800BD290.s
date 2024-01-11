.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BD290
/* ADA90 800BD290 09000224 */  addiu      $v0, $zero, 0x9
/* ADA94 800BD294 030082A0 */  sb         $v0, 0x3($a0)
/* ADA98 800BD298 2C000224 */  addiu      $v0, $zero, 0x2C
/* ADA9C 800BD29C 0800E003 */  jr         $ra
/* ADAA0 800BD2A0 070082A0 */   sb        $v0, 0x7($a0)
/* ADAA4 800BD2A4 00000000 */  nop
/* ADAA8 800BD2A8 00000000 */  nop
/* ADAAC 800BD2AC 00000000 */  nop
.size func_800BD290, . - func_800BD290
