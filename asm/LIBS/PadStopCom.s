.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PadStopCom
/* AE2C8 800BDAC8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* AE2CC 800BDACC 1000BFAF */  sw         $ra, 0x10($sp)
/* AE2D0 800BDAD0 A109030C */  jal        _padStopCom
/* AE2D4 800BDAD4 00000000 */   nop
/* AE2D8 800BDAD8 1000BF8F */  lw         $ra, 0x10($sp)
/* AE2DC 800BDADC 1800BD27 */  addiu      $sp, $sp, 0x18
/* AE2E0 800BDAE0 0800E003 */  jr         $ra
/* AE2E4 800BDAE4 00000000 */   nop
.size PadStopCom, . - PadStopCom
