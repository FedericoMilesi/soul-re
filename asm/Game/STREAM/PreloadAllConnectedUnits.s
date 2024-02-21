.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PreloadAllConnectedUnits
/* 4C130 8005B930 F0BE828F */  lw         $v0, %gp_rel(gameTrackerX + 0x128)($gp)
/* 4C134 8005B934 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 4C138 8005B938 3000B4AF */  sw         $s4, 0x30($sp)
/* 4C13C 8005B93C 21A08000 */  addu       $s4, $a0, $zero
/* 4C140 8005B940 3800BFAF */  sw         $ra, 0x38($sp)
/* 4C144 8005B944 3400B5AF */  sw         $s5, 0x34($sp)
/* 4C148 8005B948 2C00B3AF */  sw         $s3, 0x2C($sp)
/* 4C14C 8005B94C 2800B2AF */  sw         $s2, 0x28($sp)
/* 4C150 8005B950 2400B1AF */  sw         $s1, 0x24($sp)
/* 4C154 8005B954 2000B0AF */  sw         $s0, 0x20($sp)
/* 4C158 8005B958 01004224 */  addiu      $v0, $v0, 0x1
/* 4C15C 8005B95C F0BE82AF */  sw         $v0, %gp_rel(gameTrackerX + 0x128)($gp)
/* 4C160 8005B960 0800828E */  lw         $v0, 0x8($s4)
/* 4C164 8005B964 00000000 */  nop
/* 4C168 8005B968 0000428C */  lw         $v0, 0x0($v0)
/* 4C16C 8005B96C 21A8A000 */  addu       $s5, $a1, $zero
/* 4C170 8005B970 3000428C */  lw         $v0, 0x30($v0)
/* 4C174 8005B974 21880000 */  addu       $s1, $zero, $zero
/* 4C178 8005B978 0000538C */  lw         $s3, 0x0($v0)
/* 4C17C 8005B97C 00000000 */  nop
/* 4C180 8005B980 1A00601A */  blez       $s3, .L8005B9EC
/* 4C184 8005B984 04005024 */   addiu     $s0, $v0, 0x4
/* 4C188 8005B988 0D80123C */  lui        $s2, %hi(D_800D1940)
/* 4C18C 8005B98C 1000A427 */  addiu      $a0, $sp, 0x10
.L8005B990:
/* 4C190 8005B990 1CF4020C */  jal        strcpy
/* 4C194 8005B994 21280002 */   addu      $a1, $s0, $zero
/* 4C198 8005B998 1000A427 */  addiu      $a0, $sp, 0x10
/* 4C19C 8005B99C 0CF4020C */  jal        strchr
/* 4C1A0 8005B9A0 2C000524 */   addiu     $a1, $zero, 0x2C
/* 4C1A4 8005B9A4 02004010 */  beqz       $v0, .L8005B9B0
/* 4C1A8 8005B9A8 1000A427 */   addiu     $a0, $sp, 0x10
/* 4C1AC 8005B9AC 000040A0 */  sb         $zero, 0x0($v0)
.L8005B9B0:
/* 4C1B0 8005B9B0 1CD2010C */  jal        strcmpi
/* 4C1B4 8005B9B4 40194526 */   addiu     $a1, $s2, %lo(D_800D1940)
/* 4C1B8 8005B9B8 05004014 */  bnez       $v0, .L8005B9D0
/* 4C1BC 8005B9BC 00000000 */   nop
/* 4C1C0 8005B9C0 A46D010C */  jal        STREAM_MarkWarpUnitsNeeded
/* 4C1C4 8005B9C4 5C001026 */   addiu     $s0, $s0, 0x5C
/* 4C1C8 8005B9C8 786E0108 */  j          .L8005B9E0
/* 4C1CC 8005B9CC 01003126 */   addiu     $s1, $s1, 0x1
.L8005B9D0:
/* 4C1D0 8005B9D0 1400048E */  lw         $a0, 0x14($s0)
/* 4C1D4 8005B9D4 946B010C */  jal        STREAM_MarkUnitNeeded
/* 4C1D8 8005B9D8 5C001026 */   addiu     $s0, $s0, 0x5C
/* 4C1DC 8005B9DC 01003126 */  addiu      $s1, $s1, 0x1
.L8005B9E0:
/* 4C1E0 8005B9E0 2A103302 */  slt        $v0, $s1, $s3
/* 4C1E4 8005B9E4 EAFF4014 */  bnez       $v0, .L8005B990
/* 4C1E8 8005B9E8 1000A427 */   addiu     $a0, $sp, 0x10
.L8005B9EC:
/* 4C1EC 8005B9EC 0000848E */  lw         $a0, 0x0($s4)
/* 4C1F0 8005B9F0 946B010C */  jal        STREAM_MarkUnitNeeded
/* 4C1F4 8005B9F4 21880000 */   addu      $s1, $zero, $zero
/* 4C1F8 8005B9F8 206C010C */  jal        STREAM_DumpAllUnitsNotNeeded
/* 4C1FC 8005B9FC 00000000 */   nop
/* 4C200 8005BA00 0800848E */  lw         $a0, 0x8($s4)
/* 4C204 8005BA04 806F010C */  jal        RelocateLevelWithInstances
/* 4C208 8005BA08 2128A002 */   addu      $a1, $s5, $zero
/* 4C20C 8005BA0C 5842010C */  jal        MEMPACK_DoGarbageCollection
/* 4C210 8005BA10 00000000 */   nop
/* 4C214 8005BA14 0800828E */  lw         $v0, 0x8($s4)
/* 4C218 8005BA18 00000000 */  nop
/* 4C21C 8005BA1C 0000428C */  lw         $v0, 0x0($v0)
/* 4C220 8005BA20 00000000 */  nop
/* 4C224 8005BA24 3000428C */  lw         $v0, 0x30($v0)
/* 4C228 8005BA28 00000000 */  nop
/* 4C22C 8005BA2C 0000538C */  lw         $s3, 0x0($v0)
/* 4C230 8005BA30 00000000 */  nop
/* 4C234 8005BA34 2600601A */  blez       $s3, .L8005BAD0
/* 4C238 8005BA38 04001224 */   addiu     $s2, $zero, 0x4
.L8005BA3C:
/* 4C23C 8005BA3C 0800828E */  lw         $v0, 0x8($s4)
/* 4C240 8005BA40 00000000 */  nop
/* 4C244 8005BA44 0000428C */  lw         $v0, 0x0($v0)
/* 4C248 8005BA48 00000000 */  nop
/* 4C24C 8005BA4C 3000428C */  lw         $v0, 0x30($v0)
/* 4C250 8005BA50 1000A427 */  addiu      $a0, $sp, 0x10
/* 4C254 8005BA54 21805200 */  addu       $s0, $v0, $s2
/* 4C258 8005BA58 1CF4020C */  jal        strcpy
/* 4C25C 8005BA5C 21280002 */   addu      $a1, $s0, $zero
/* 4C260 8005BA60 1000A427 */  addiu      $a0, $sp, 0x10
/* 4C264 8005BA64 0CF4020C */  jal        strchr
/* 4C268 8005BA68 2C000524 */   addiu     $a1, $zero, 0x2C
/* 4C26C 8005BA6C 13004010 */  beqz       $v0, .L8005BABC
/* 4C270 8005BA70 1000A427 */   addiu     $a0, $sp, 0x10
/* 4C274 8005BA74 000040A0 */  sb         $zero, 0x0($v0)
/* 4C278 8005BA78 0D80053C */  lui        $a1, %hi(D_800D1940)
/* 4C27C 8005BA7C 1CD2010C */  jal        strcmpi
/* 4C280 8005BA80 4019A524 */   addiu     $a1, $a1, %lo(D_800D1940)
/* 4C284 8005BA84 0A004014 */  bnez       $v0, .L8005BAB0
/* 4C288 8005BA88 1000A427 */   addiu     $a0, $sp, 0x10
/* 4C28C 8005BA8C 21208002 */  addu       $a0, $s4, $zero
/* 4C290 8005BA90 1E000296 */  lhu        $v0, 0x1E($s0)
/* 4C294 8005BA94 21280002 */  addu       $a1, $s0, $zero
/* 4C298 8005BA98 2800A0AC */  sw         $zero, 0x28($a1)
/* 4C29C 8005BA9C 01004234 */  ori        $v0, $v0, 0x1
/* 4C2A0 8005BAA0 886C010C */  jal        WARPGATE_RelocateLoadedWarpRooms
/* 4C2A4 8005BAA4 1E00A2A4 */   sh        $v0, 0x1E($a1)
/* 4C2A8 8005BAA8 B06E0108 */  j          .L8005BAC0
/* 4C2AC 8005BAAC 5C005226 */   addiu     $s2, $s2, 0x5C
.L8005BAB0:
/* 4C2B0 8005BAB0 21280002 */  addu       $a1, $s0, $zero
/* 4C2B4 8005BAB4 A76A010C */  jal        STREAM_LoadLevel
/* 4C2B8 8005BAB8 01000624 */   addiu     $a2, $zero, 0x1
.L8005BABC:
/* 4C2BC 8005BABC 5C005226 */  addiu      $s2, $s2, 0x5C
.L8005BAC0:
/* 4C2C0 8005BAC0 01003126 */  addiu      $s1, $s1, 0x1
/* 4C2C4 8005BAC4 2A103302 */  slt        $v0, $s1, $s3
/* 4C2C8 8005BAC8 DCFF4014 */  bnez       $v0, .L8005BA3C
/* 4C2CC 8005BACC 00000000 */   nop
.L8005BAD0:
/* 4C2D0 8005BAD0 3800BF8F */  lw         $ra, 0x38($sp)
/* 4C2D4 8005BAD4 3400B58F */  lw         $s5, 0x34($sp)
/* 4C2D8 8005BAD8 3000B48F */  lw         $s4, 0x30($sp)
/* 4C2DC 8005BADC 2C00B38F */  lw         $s3, 0x2C($sp)
/* 4C2E0 8005BAE0 2800B28F */  lw         $s2, 0x28($sp)
/* 4C2E4 8005BAE4 2400B18F */  lw         $s1, 0x24($sp)
/* 4C2E8 8005BAE8 2000B08F */  lw         $s0, 0x20($sp)
/* 4C2EC 8005BAEC 0800E003 */  jr         $ra
/* 4C2F0 8005BAF0 4000BD27 */   addiu     $sp, $sp, 0x40
.size PreloadAllConnectedUnits, . - PreloadAllConnectedUnits
