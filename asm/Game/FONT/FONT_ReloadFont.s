.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FONT_ReloadFont
/* 1D878 8002D078 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 1D87C 8002D07C 0D80043C */  lui        $a0, %hi(D_800D0674)
/* 1D880 8002D080 74068424 */  addiu      $a0, $a0, %lo(D_800D0674)
/* 1D884 8002D084 05000524 */  addiu      $a1, $zero, 0x5
/* 1D888 8002D088 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 1D88C 8002D08C 3E82010C */  jal        LOAD_ReadFile
/* 1D890 8002D090 1800B0AF */   sw        $s0, 0x18($sp)
/* 1D894 8002D094 21804000 */  addu       $s0, $v0, $zero
/* 1D898 8002D098 21200002 */  addu       $a0, $s0, $zero
/* 1D89C 8002D09C 06BA8687 */  lh         $a2, %gp_rel(fontTracker + 0x61A)($gp)
/* 1D8A0 8002D0A0 04BA8587 */  lh         $a1, %gp_rel(fontTracker + 0x618)($gp)
/* 1D8A4 8002D0A4 7E00C224 */  addiu      $v0, $a2, 0x7E
/* 1D8A8 8002D0A8 2138A000 */  addu       $a3, $a1, $zero
/* 1D8AC 8002D0AC 2CE0000C */  jal        LOAD_LoadTIM
/* 1D8B0 8002D0B0 1000A2AF */   sw        $v0, 0x10($sp)
/* 1D8B4 8002D0B4 2641010C */  jal        MEMPACK_Free
/* 1D8B8 8002D0B8 21200002 */   addu      $a0, $s0, $zero
/* 1D8BC 8002D0BC 06BA8587 */  lh         $a1, %gp_rel(fontTracker + 0x61A)($gp)
/* 1D8C0 8002D0C0 04BA8487 */  lh         $a0, %gp_rel(fontTracker + 0x618)($gp)
/* 1D8C4 8002D0C4 B5B3000C */  jal        FONT_MakeSpecialFogClut
/* 1D8C8 8002D0C8 7F00A524 */   addiu     $a1, $a1, 0x7F
/* 1D8CC 8002D0CC 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 1D8D0 8002D0D0 1800B08F */  lw         $s0, 0x18($sp)
/* 1D8D4 8002D0D4 0800E003 */  jr         $ra
/* 1D8D8 8002D0D8 2000BD27 */   addiu     $sp, $sp, 0x20
.size FONT_ReloadFont, . - FONT_ReloadFont
