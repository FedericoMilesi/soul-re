.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel VSyncCallback
/* AA30C 800B9B0C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* AA310 800B9B10 0D80023C */  lui        $v0, %hi(the_attract_movies + 0x10F0)
/* AA314 800B9B14 9CD9428C */  lw         $v0, %lo(the_attract_movies + 0x10F0)($v0)
/* AA318 800B9B18 21288000 */  addu       $a1, $a0, $zero
/* AA31C 800B9B1C 1000BFAF */  sw         $ra, 0x10($sp)
/* AA320 800B9B20 1400428C */  lw         $v0, 0x14($v0)
/* AA324 800B9B24 00000000 */  nop
/* AA328 800B9B28 09F84000 */  jalr       $v0
/* AA32C 800B9B2C 04000424 */   addiu     $a0, $zero, 0x4
/* AA330 800B9B30 1000BF8F */  lw         $ra, 0x10($sp)
/* AA334 800B9B34 1800BD27 */  addiu      $sp, $sp, 0x18
/* AA338 800B9B38 0800E003 */  jr         $ra
/* AA33C 800B9B3C 00000000 */   nop
.size VSyncCallback, . - VSyncCallback
