.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WCBEGG_ShouldIgniteEgg
/* 7F98C 8008F18C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 7F990 8008F190 1400B1AF */  sw         $s1, 0x14($sp)
/* 7F994 8008F194 21888000 */  addu       $s1, $a0, $zero
/* 7F998 8008F198 1800B2AF */  sw         $s2, 0x18($sp)
/* 7F99C 8008F19C 2190A000 */  addu       $s2, $a1, $zero
/* 7F9A0 8008F1A0 1000B0AF */  sw         $s0, 0x10($sp)
/* 7F9A4 8008F1A4 FCBD908F */  lw         $s0, %gp_rel(gameTrackerX + 0x34)($gp)
/* 7F9A8 8008F1A8 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 7F9AC 8008F1AC 92D1000C */  jal        INSTANCE_Query
/* 7F9B0 8008F1B0 03000524 */   addiu     $a1, $zero, 0x3
/* 7F9B4 8008F1B4 0100033C */  lui        $v1, (0x10000 >> 16)
/* 7F9B8 8008F1B8 24104300 */  and        $v0, $v0, $v1
/* 7F9BC 8008F1BC 2B004014 */  bnez       $v0, .L8008F26C
/* 7F9C0 8008F1C0 21100000 */   addu      $v0, $zero, $zero
/* 7F9C4 8008F1C4 0400108E */  lw         $s0, 0x4($s0)
/* 7F9C8 8008F1C8 00000000 */  nop
/* 7F9CC 8008F1CC 27000012 */  beqz       $s0, .L8008F26C
/* 7F9D0 8008F1D0 21200002 */   addu      $a0, $s0, $zero
.L8008F1D4:
/* 7F9D4 8008F1D4 92D1000C */  jal        INSTANCE_Query
/* 7F9D8 8008F1D8 01000524 */   addiu     $a1, $zero, 0x1
/* 7F9DC 8008F1DC 20004230 */  andi       $v0, $v0, 0x20
/* 7F9E0 8008F1E0 1D004010 */  beqz       $v0, .L8008F258
/* 7F9E4 8008F1E4 00000000 */   nop
/* 7F9E8 8008F1E8 5C000286 */  lh         $v0, 0x5C($s0)
/* 7F9EC 8008F1EC 5C002486 */  lh         $a0, 0x5C($s1)
/* 7F9F0 8008F1F0 5E000386 */  lh         $v1, 0x5E($s0)
/* 7F9F4 8008F1F4 5E002586 */  lh         $a1, 0x5E($s1)
/* 7F9F8 8008F1F8 60002686 */  lh         $a2, 0x60($s1)
/* 7F9FC 8008F1FC 23204400 */  subu       $a0, $v0, $a0
/* 7FA00 8008F200 60000286 */  lh         $v0, 0x60($s0)
/* 7FA04 8008F204 23286500 */  subu       $a1, $v1, $a1
/* 7FA08 8008F208 B7E6000C */  jal        MATH3D_LengthXYZ
/* 7FA0C 8008F20C 23304600 */   subu      $a2, $v0, $a2
/* 7FA10 8008F210 14004386 */  lh         $v1, 0x14($s2)
/* 7FA14 8008F214 00000000 */  nop
/* 7FA18 8008F218 2A104300 */  slt        $v0, $v0, $v1
/* 7FA1C 8008F21C 0E004010 */  beqz       $v0, .L8008F258
/* 7FA20 8008F220 21200002 */   addu      $a0, $s0, $zero
/* 7FA24 8008F224 92D1000C */  jal        INSTANCE_Query
/* 7FA28 8008F228 03000524 */   addiu     $a1, $zero, 0x3
/* 7FA2C 8008F22C 0100033C */  lui        $v1, (0x10000 >> 16)
/* 7FA30 8008F230 24104300 */  and        $v0, $v0, $v1
/* 7FA34 8008F234 0D004014 */  bnez       $v0, .L8008F26C
/* 7FA38 8008F238 01000224 */   addiu     $v0, $zero, 0x1
/* 7FA3C 8008F23C 1C00028E */  lw         $v0, 0x1C($s0)
/* 7FA40 8008F240 0D80053C */  lui        $a1, %hi(WORSHIP_FunctionTable + 0x20)
/* 7FA44 8008F244 2400448C */  lw         $a0, 0x24($v0)
/* 7FA48 8008F248 1CD2010C */  jal        strcmpi
/* 7FA4C 8008F24C F01BA524 */   addiu     $a1, $a1, %lo(WORSHIP_FunctionTable + 0x20)
/* 7FA50 8008F250 06004010 */  beqz       $v0, .L8008F26C
/* 7FA54 8008F254 01000224 */   addiu     $v0, $zero, 0x1
.L8008F258:
/* 7FA58 8008F258 0800108E */  lw         $s0, 0x8($s0)
/* 7FA5C 8008F25C 00000000 */  nop
/* 7FA60 8008F260 DCFF0016 */  bnez       $s0, .L8008F1D4
/* 7FA64 8008F264 21200002 */   addu      $a0, $s0, $zero
/* 7FA68 8008F268 21100000 */  addu       $v0, $zero, $zero
.L8008F26C:
/* 7FA6C 8008F26C 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 7FA70 8008F270 1800B28F */  lw         $s2, 0x18($sp)
/* 7FA74 8008F274 1400B18F */  lw         $s1, 0x14($sp)
/* 7FA78 8008F278 1000B08F */  lw         $s0, 0x10($sp)
/* 7FA7C 8008F27C 0800E003 */  jr         $ra
/* 7FA80 8008F280 2000BD27 */   addiu     $sp, $sp, 0x20
.size WCBEGG_ShouldIgniteEgg, . - WCBEGG_ShouldIgniteEgg
