.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel VRAM_EnableTerrainArea
/* 636F4 80072EF4 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 636F8 80072EF8 00020424 */  addiu      $a0, $zero, 0x200
/* 636FC 80072EFC 21280000 */  addu       $a1, $zero, $zero
/* 63700 80072F00 21308000 */  addu       $a2, $a0, $zero
/* 63704 80072F04 00010724 */  addiu      $a3, $zero, 0x100
/* 63708 80072F08 1800BFAF */  sw         $ra, 0x18($sp)
/* 6370C 80072F0C 18CD010C */  jal        VRAM_InsertFreeVram
/* 63710 80072F10 1000A0AF */   sw        $zero, 0x10($sp)
/* 63714 80072F14 1800BF8F */  lw         $ra, 0x18($sp)
/* 63718 80072F18 00000000 */  nop
/* 6371C 80072F1C 0800E003 */  jr         $ra
/* 63720 80072F20 2000BD27 */   addiu     $sp, $sp, 0x20
.size VRAM_EnableTerrainArea, . - VRAM_EnableTerrainArea
