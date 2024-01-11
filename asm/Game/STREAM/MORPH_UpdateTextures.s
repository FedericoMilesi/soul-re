.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MORPH_UpdateTextures
/* 4EACC 8005E2CC 6210033C */  lui        $v1, (0x10624DD3 >> 16)
/* 4EAD0 8005E2D0 D0BD8287 */  lh         $v0, %gp_rel(gameTrackerX + 0x8)($gp)
/* 4EAD4 8005E2D4 D34D6334 */  ori        $v1, $v1, (0x10624DD3 & 0xFFFF)
/* 4EAD8 8005E2D8 00130200 */  sll        $v0, $v0, 12
/* 4EADC 8005E2DC 18004300 */  mult       $v0, $v1
/* 4EAE0 8005E2E0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 4EAE4 8005E2E4 1000BFAF */  sw         $ra, 0x10($sp)
/* 4EAE8 8005E2E8 C3170200 */  sra        $v0, $v0, 31
/* 4EAEC 8005E2EC 10280000 */  mfhi       $a1
/* 4EAF0 8005E2F0 83190500 */  sra        $v1, $a1, 6
/* 4EAF4 8005E2F4 23206200 */  subu       $a0, $v1, $v0
/* 4EAF8 8005E2F8 D2BD8387 */  lh         $v1, %gp_rel(gameTrackerX + 0xA)($gp)
/* 4EAFC 8005E2FC 01000224 */  addiu      $v0, $zero, 0x1
/* 4EB00 8005E300 02006214 */  bne        $v1, $v0, .L8005E30C
/* 4EB04 8005E304 00100224 */   addiu     $v0, $zero, 0x1000
/* 4EB08 8005E308 23204400 */  subu       $a0, $v0, $a0
.L8005E30C:
/* 4EB0C 8005E30C 04D1010C */  jal        MORPH_ChangeAreaPalettes
/* 4EB10 8005E310 00000000 */   nop
/* 4EB14 8005E314 1000BF8F */  lw         $ra, 0x10($sp)
/* 4EB18 8005E318 00000000 */  nop
/* 4EB1C 8005E31C 0800E003 */  jr         $ra
/* 4EB20 8005E320 1800BD27 */   addiu     $sp, $sp, 0x18
.size MORPH_UpdateTextures, . - MORPH_UpdateTextures
