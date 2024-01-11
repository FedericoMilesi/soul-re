.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StopCallback
/* AA370 800B9B70 0D80023C */  lui        $v0, %hi(the_attract_movies + 0x10F0)
/* AA374 800B9B74 9CD9428C */  lw         $v0, %lo(the_attract_movies + 0x10F0)($v0)
/* AA378 800B9B78 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* AA37C 800B9B7C 1000BFAF */  sw         $ra, 0x10($sp)
/* AA380 800B9B80 1000428C */  lw         $v0, 0x10($v0)
/* AA384 800B9B84 00000000 */  nop
/* AA388 800B9B88 09F84000 */  jalr       $v0
/* AA38C 800B9B8C 00000000 */   nop
/* AA390 800B9B90 1000BF8F */  lw         $ra, 0x10($sp)
/* AA394 800B9B94 1800BD27 */  addiu      $sp, $sp, 0x18
/* AA398 800B9B98 0800E003 */  jr         $ra
/* AA39C 800B9B9C 00000000 */   nop
.size StopCallback, . - StopCallback
