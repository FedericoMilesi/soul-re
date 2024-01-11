.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SCRIPT_GetMultiSpline
/* 2D9AC 8003D1AC 0200A010 */  beqz       $a1, .L8003D1B8
/* 2D9B0 8003D1B0 21380000 */   addu      $a3, $zero, $zero
/* 2D9B4 8003D1B4 0000A0AC */  sw         $zero, 0x0($a1)
.L8003D1B8:
/* 2D9B8 8003D1B8 0200C010 */  beqz       $a2, .L8003D1C4
/* 2D9BC 8003D1BC 00000000 */   nop
/* 2D9C0 8003D1C0 0000C0AC */  sw         $zero, 0x0($a2)
.L8003D1C4:
/* 2D9C4 8003D1C4 14008010 */  beqz       $a0, .L8003D218
/* 2D9C8 8003D1C8 00000000 */   nop
/* 2D9CC 8003D1CC 2000828C */  lw         $v0, 0x20($a0)
/* 2D9D0 8003D1D0 00000000 */  nop
/* 2D9D4 8003D1D4 10004010 */  beqz       $v0, .L8003D218
/* 2D9D8 8003D1D8 00000000 */   nop
/* 2D9DC 8003D1DC 3800428C */  lw         $v0, 0x38($v0)
/* 2D9E0 8003D1E0 00000000 */  nop
/* 2D9E4 8003D1E4 0C004010 */  beqz       $v0, .L8003D218
/* 2D9E8 8003D1E8 00000000 */   nop
/* 2D9EC 8003D1EC 21384000 */  addu       $a3, $v0, $zero
/* 2D9F0 8003D1F0 1000023C */  lui        $v0, (0x100002 >> 16)
/* 2D9F4 8003D1F4 1400838C */  lw         $v1, 0x14($a0)
/* 2D9F8 8003D1F8 02004234 */  ori        $v0, $v0, (0x100002 & 0xFFFF)
/* 2D9FC 8003D1FC 24186200 */  and        $v1, $v1, $v0
/* 2DA00 8003D200 02000224 */  addiu      $v0, $zero, 0x2
/* 2DA04 8003D204 04006214 */  bne        $v1, $v0, .L8003D218
/* 2DA08 8003D208 00000000 */   nop
/* 2DA0C 8003D20C 0200A010 */  beqz       $a1, .L8003D218
/* 2DA10 8003D210 01000224 */   addiu     $v0, $zero, 0x1
/* 2DA14 8003D214 0000A2AC */  sw         $v0, 0x0($a1)
.L8003D218:
/* 2DA18 8003D218 0D00E014 */  bnez       $a3, .L8003D250
/* 2DA1C 8003D21C 00000000 */   nop
/* 2DA20 8003D220 1C00828C */  lw         $v0, 0x1C($a0)
/* 2DA24 8003D224 00000000 */  nop
/* 2DA28 8003D228 0C00428C */  lw         $v0, 0xC($v0)
/* 2DA2C 8003D22C 00000000 */  nop
/* 2DA30 8003D230 0000428C */  lw         $v0, 0x0($v0)
/* 2DA34 8003D234 00000000 */  nop
/* 2DA38 8003D238 05004010 */  beqz       $v0, .L8003D250
/* 2DA3C 8003D23C 00000000 */   nop
/* 2DA40 8003D240 2C00478C */  lw         $a3, 0x2C($v0)
/* 2DA44 8003D244 0200C010 */  beqz       $a2, .L8003D250
/* 2DA48 8003D248 01000224 */   addiu     $v0, $zero, 0x1
/* 2DA4C 8003D24C 0000C2AC */  sw         $v0, 0x0($a2)
.L8003D250:
/* 2DA50 8003D250 0800E003 */  jr         $ra
/* 2DA54 8003D254 2110E000 */   addu      $v0, $a3, $zero
.size SCRIPT_GetMultiSpline, . - SCRIPT_GetMultiSpline
