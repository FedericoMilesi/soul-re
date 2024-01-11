.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GPU_ResetCallback
/* AD018 800BC818 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* AD01C 800BC81C 1000BFAF */  sw         $ra, 0x10($sp)
/* AD020 800BC820 0C80053C */  lui        $a1, %hi(func_800BC114)
/* AD024 800BC824 14C1A524 */  addiu      $a1, $a1, %lo(func_800BC114)
/* AD028 800BC828 B7E6020C */  jal        DMACallback
/* AD02C 800BC82C 02000424 */   addiu     $a0, $zero, 0x2
/* AD030 800BC830 1000BF8F */  lw         $ra, 0x10($sp)
/* AD034 800BC834 1800BD27 */  addiu      $sp, $sp, 0x18
/* AD038 800BC838 0800E003 */  jr         $ra
/* AD03C 800BC83C 00000000 */   nop
.size _GPU_ResetCallback, . - _GPU_ResetCallback
