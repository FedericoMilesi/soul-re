.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_LoadLevelReturn
/* 4A998 8005A198 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 4A99C 8005A19C 1000B0AF */  sw         $s0, 0x10($sp)
/* 4A9A0 8005A1A0 21808000 */  addu       $s0, $a0, $zero
/* 4A9A4 8005A1A4 1400B1AF */  sw         $s1, 0x14($sp)
/* 4A9A8 8005A1A8 2188C000 */  addu       $s1, $a2, $zero
/* 4A9AC 8005A1AC 1800BFAF */  sw         $ra, 0x18($sp)
/* 4A9B0 8005A1B0 EBF4020C */  jal        func_800BD3AC
/* 4A9B4 8005A1B4 00F2043C */   lui       $a0, (0xF2000000 >> 16)
/* 4A9B8 8005A1B8 5890828F */  lw         $v0, %gp_rel(gameTimer)($gp)
/* 4A9BC 8005A1BC F800028E */  lw         $v0, 0xF8($s0)
/* 4A9C0 8005A1C0 00000000 */  nop
/* 4A9C4 8005A1C4 000022AE */  sw         $v0, 0x0($s1)
/* 4A9C8 8005A1C8 F800028E */  lw         $v0, 0xF8($s0)
/* 4A9CC 8005A1CC F0BD90AF */  sw         $s0, %gp_rel(gameTrackerX + 0x28)($gp)
/* 4A9D0 8005A1D0 40BF82AF */  sw         $v0, %gp_rel(gameTrackerX + 0x178)($gp)
/* 4A9D4 8005A1D4 B766010C */  jal        STREAM_SetMainFog
/* 4A9D8 8005A1D8 21202002 */   addu      $a0, $s1, $zero
/* 4A9DC 8005A1DC 1368010C */  jal        STREAM_FinishLoad
/* 4A9E0 8005A1E0 21202002 */   addu      $a0, $s1, $zero
/* 4A9E4 8005A1E4 1800BF8F */  lw         $ra, 0x18($sp)
/* 4A9E8 8005A1E8 1400B18F */  lw         $s1, 0x14($sp)
/* 4A9EC 8005A1EC 1000B08F */  lw         $s0, 0x10($sp)
/* 4A9F0 8005A1F0 0800E003 */  jr         $ra
/* 4A9F4 8005A1F4 2000BD27 */   addiu     $sp, $sp, 0x20
.size STREAM_LoadLevelReturn, . - STREAM_LoadLevelReturn
