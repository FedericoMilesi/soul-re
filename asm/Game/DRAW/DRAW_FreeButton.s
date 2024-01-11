.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DRAW_FreeButton
/* 1B8A8 8002B0A8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 1B8AC 8002B0AC 1000BFAF */  sw         $ra, 0x10($sp)
/* 1B8B0 8002B0B0 0800848C */  lw         $a0, 0x8($a0)
/* 1B8B4 8002B0B4 8FCE010C */  jal        VRAM_ClearVramBlock
/* 1B8B8 8002B0B8 00000000 */   nop
/* 1B8BC 8002B0BC 1000BF8F */  lw         $ra, 0x10($sp)
/* 1B8C0 8002B0C0 00000000 */  nop
/* 1B8C4 8002B0C4 0800E003 */  jr         $ra
/* 1B8C8 8002B0C8 1800BD27 */   addiu     $sp, $sp, 0x18
.size DRAW_FreeButton, . - DRAW_FreeButton
