.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ResetCallback
/* AA27C 800B9A7C 0D80023C */  lui        $v0, %hi(the_attract_movies + 0x10F0)
/* AA280 800B9A80 9CD9428C */  lw         $v0, %lo(the_attract_movies + 0x10F0)($v0)
/* AA284 800B9A84 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* AA288 800B9A88 1000BFAF */  sw         $ra, 0x10($sp)
/* AA28C 800B9A8C 0C00428C */  lw         $v0, 0xC($v0)
/* AA290 800B9A90 00000000 */  nop
/* AA294 800B9A94 09F84000 */  jalr       $v0
/* AA298 800B9A98 00000000 */   nop
/* AA29C 800B9A9C 1000BF8F */  lw         $ra, 0x10($sp)
/* AA2A0 800B9AA0 1800BD27 */  addiu      $sp, $sp, 0x18
/* AA2A4 800B9AA4 0800E003 */  jr         $ra
/* AA2A8 800B9AA8 00000000 */   nop
.size ResetCallback, . - ResetCallback
