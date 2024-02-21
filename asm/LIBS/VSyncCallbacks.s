.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel VSyncCallbacks
/* AA340 800B9B40 0D80023C */  lui        $v0, %hi(D_800CD99C)
/* AA344 800B9B44 9CD9428C */  lw         $v0, %lo(D_800CD99C)($v0)
/* AA348 800B9B48 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* AA34C 800B9B4C 1000BFAF */  sw         $ra, 0x10($sp)
/* AA350 800B9B50 1400428C */  lw         $v0, 0x14($v0)
/* AA354 800B9B54 00000000 */  nop
/* AA358 800B9B58 09F84000 */  jalr       $v0
/* AA35C 800B9B5C 00000000 */   nop
/* AA360 800B9B60 1000BF8F */  lw         $ra, 0x10($sp)
/* AA364 800B9B64 1800BD27 */  addiu      $sp, $sp, 0x18
/* AA368 800B9B68 0800E003 */  jr         $ra
/* AA36C 800B9B6C 00000000 */   nop
.size VSyncCallbacks, . - VSyncCallbacks
