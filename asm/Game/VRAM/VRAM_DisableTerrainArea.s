.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel VRAM_DisableTerrainArea
/* 63724 80072F24 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 63728 80072F28 00020424 */  addiu      $a0, $zero, 0x200
/* 6372C 80072F2C 21280000 */  addu       $a1, $zero, $zero
/* 63730 80072F30 21308000 */  addu       $a2, $a0, $zero
/* 63734 80072F34 1000BFAF */  sw         $ra, 0x10($sp)
/* 63738 80072F38 CCCC010C */  jal        VRAM_DeleteFreeVram
/* 6373C 80072F3C 00010724 */   addiu     $a3, $zero, 0x100
/* 63740 80072F40 1000BF8F */  lw         $ra, 0x10($sp)
/* 63744 80072F44 00000000 */  nop
/* 63748 80072F48 0800E003 */  jr         $ra
/* 6374C 80072F4C 1800BD27 */   addiu     $sp, $sp, 0x18
.size VRAM_DisableTerrainArea, . - VRAM_DisableTerrainArea
