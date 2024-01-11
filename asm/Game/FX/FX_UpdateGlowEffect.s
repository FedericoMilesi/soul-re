.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_UpdateGlowEffect
/* 3BC3C 8004B43C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 3BC40 8004B440 1000BFAF */  sw         $ra, 0x10($sp)
/* 3BC44 8004B444 0E008284 */  lh         $v0, 0xE($a0)
/* 3BC48 8004B448 00000000 */  nop
/* 3BC4C 8004B44C 03004014 */  bnez       $v0, .L8004B45C
/* 3BC50 8004B450 00000000 */   nop
/* 3BC54 8004B454 1F2D010C */  jal        FX_DeleteGeneralEffect
/* 3BC58 8004B458 00000000 */   nop
.L8004B45C:
/* 3BC5C 8004B45C 1000BF8F */  lw         $ra, 0x10($sp)
/* 3BC60 8004B460 00000000 */  nop
/* 3BC64 8004B464 0800E003 */  jr         $ra
/* 3BC68 8004B468 1800BD27 */   addiu     $sp, $sp, 0x18
.size FX_UpdateGlowEffect, . - FX_UpdateGlowEffect
