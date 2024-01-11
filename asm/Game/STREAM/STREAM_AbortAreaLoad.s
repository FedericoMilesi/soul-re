.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_AbortAreaLoad
/* 492C0 80058AC0 98FFBD27 */  addiu      $sp, $sp, -0x68
/* 492C4 80058AC4 6000B0AF */  sw         $s0, 0x60($sp)
/* 492C8 80058AC8 21808000 */  addu       $s0, $a0, $zero
/* 492CC 80058ACC 21280000 */  addu       $a1, $zero, $zero
/* 492D0 80058AD0 1000A627 */  addiu      $a2, $sp, 0x10
/* 492D4 80058AD4 6400BFAF */  sw         $ra, 0x64($sp)
/* 492D8 80058AD8 8062010C */  jal        STREAM_FillOutFileNames
/* 492DC 80058ADC 2138A000 */   addu      $a3, $a1, $zero
/* 492E0 80058AE0 6982010C */  jal        LOAD_AbortDirectoryChange
/* 492E4 80058AE4 21200002 */   addu      $a0, $s0, $zero
/* 492E8 80058AE8 1000A427 */  addiu      $a0, $sp, 0x10
/* 492EC 80058AEC 0780053C */  lui        $a1, %hi(VRAM_LoadReturn)
/* 492F0 80058AF0 8B82010C */  jal        LOAD_AbortFileLoad
/* 492F4 80058AF4 E842A524 */   addiu     $a1, $a1, %lo(VRAM_LoadReturn)
/* 492F8 80058AF8 6400BF8F */  lw         $ra, 0x64($sp)
/* 492FC 80058AFC 6000B08F */  lw         $s0, 0x60($sp)
/* 49300 80058B00 0800E003 */  jr         $ra
/* 49304 80058B04 6800BD27 */   addiu     $sp, $sp, 0x68
.size STREAM_AbortAreaLoad, . - STREAM_AbortAreaLoad
