.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800B9AAC
/* AA2AC 800B9AAC 0D80023C */  lui        $v0, %hi(the_attract_movies + 0x10F0)
/* AA2B0 800B9AB0 9CD9428C */  lw         $v0, %lo(the_attract_movies + 0x10F0)($v0)
/* AA2B4 800B9AB4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* AA2B8 800B9AB8 1000BFAF */  sw         $ra, 0x10($sp)
/* AA2BC 800B9ABC 0800428C */  lw         $v0, 0x8($v0)
/* AA2C0 800B9AC0 00000000 */  nop
/* AA2C4 800B9AC4 09F84000 */  jalr       $v0
/* AA2C8 800B9AC8 00000000 */   nop
/* AA2CC 800B9ACC 1000BF8F */  lw         $ra, 0x10($sp)
/* AA2D0 800B9AD0 1800BD27 */  addiu      $sp, $sp, 0x18
/* AA2D4 800B9AD4 0800E003 */  jr         $ra
/* AA2D8 800B9AD8 00000000 */   nop
.size func_800B9AAC, . - func_800B9AAC
