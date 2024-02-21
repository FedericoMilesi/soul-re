.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DMACallback
/* AA2DC 800B9ADC 0D80023C */  lui        $v0, %hi(D_800CD99C)
/* AA2E0 800B9AE0 9CD9428C */  lw         $v0, %lo(D_800CD99C)($v0)
/* AA2E4 800B9AE4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* AA2E8 800B9AE8 1000BFAF */  sw         $ra, 0x10($sp)
/* AA2EC 800B9AEC 0400428C */  lw         $v0, 0x4($v0)
/* AA2F0 800B9AF0 00000000 */  nop
/* AA2F4 800B9AF4 09F84000 */  jalr       $v0
/* AA2F8 800B9AF8 00000000 */   nop
/* AA2FC 800B9AFC 1000BF8F */  lw         $ra, 0x10($sp)
/* AA300 800B9B00 1800BD27 */  addiu      $sp, $sp, 0x18
/* AA304 800B9B04 0800E003 */  jr         $ra
/* AA308 800B9B08 00000000 */   nop
.size DMACallback, . - DMACallback
