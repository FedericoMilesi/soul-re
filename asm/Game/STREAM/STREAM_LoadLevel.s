.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_LoadLevel
/* 4B29C 8005AA9C 78FFBD27 */  addiu      $sp, $sp, -0x88
/* 4B2A0 8005AAA0 7400B3AF */  sw         $s3, 0x74($sp)
/* 4B2A4 8005AAA4 21988000 */  addu       $s3, $a0, $zero
/* 4B2A8 8005AAA8 7800B4AF */  sw         $s4, 0x78($sp)
/* 4B2AC 8005AAAC 21A0A000 */  addu       $s4, $a1, $zero
/* 4B2B0 8005AAB0 7C00B5AF */  sw         $s5, 0x7C($sp)
/* 4B2B4 8005AAB4 FFFF1524 */  addiu      $s5, $zero, -0x1
/* 4B2B8 8005AAB8 8000BFAF */  sw         $ra, 0x80($sp)
/* 4B2BC 8005AABC 7000B2AF */  sw         $s2, 0x70($sp)
/* 4B2C0 8005AAC0 6C00B1AF */  sw         $s1, 0x6C($sp)
/* 4B2C4 8005AAC4 02008012 */  beqz       $s4, .L8005AAD0
/* 4B2C8 8005AAC8 6800B0AF */   sw        $s0, 0x68($sp)
/* 4B2CC 8005AACC 1400958E */  lw         $s5, 0x14($s4)
.L8005AAD0:
/* 4B2D0 8005AAD0 21900000 */  addu       $s2, $zero, $zero
/* 4B2D4 8005AAD4 80111200 */  sll        $v0, $s2, 6
.L8005AAD8:
/* 4B2D8 8005AAD8 3CC78327 */  addiu      $v1, $gp, %gp_rel(StreamTracker)
/* 4B2DC 8005AADC 21884300 */  addu       $s1, $v0, $v1
/* 4B2E0 8005AAE0 04002286 */  lh         $v0, 0x4($s1)
/* 4B2E4 8005AAE4 00000000 */  nop
/* 4B2E8 8005AAE8 2E004010 */  beqz       $v0, .L8005ABA4
/* 4B2EC 8005AAEC 0C002426 */   addiu     $a0, $s1, 0xC
/* 4B2F0 8005AAF0 1CD2010C */  jal        strcmpi
/* 4B2F4 8005AAF4 21286002 */   addu      $a1, $s3, $zero
/* 4B2F8 8005AAF8 2A004014 */  bnez       $v0, .L8005ABA4
/* 4B2FC 8005AAFC 03000224 */   addiu     $v0, $zero, 0x3
/* 4B300 8005AB00 04002386 */  lh         $v1, 0x4($s1)
/* 4B304 8005AB04 00000000 */  nop
/* 4B308 8005AB08 04006214 */  bne        $v1, $v0, .L8005AB1C
/* 4B30C 8005AB0C 01000224 */   addiu     $v0, $zero, 0x1
/* 4B310 8005AB10 01000224 */  addiu      $v0, $zero, 0x1
/* 4B314 8005AB14 ED6A0108 */  j          .L8005ABB4
/* 4B318 8005AB18 040022A6 */   sh        $v0, 0x4($s1)
.L8005AB1C:
/* 4B31C 8005AB1C 26006210 */  beq        $v1, $v0, .L8005ABB8
/* 4B320 8005AB20 10000224 */   addiu     $v0, $zero, 0x10
/* 4B324 8005AB24 0E008016 */  bnez       $s4, .L8005AB60
/* 4B328 8005AB28 200020AE */   sw        $zero, 0x20($s1)
/* 4B32C 8005AB2C 24BF8427 */  addiu      $a0, $gp, %gp_rel(gameTrackerX + 0x15C)
/* 4B330 8005AB30 1CF4020C */  jal        func_800BD070
/* 4B334 8005AB34 21286002 */   addu      $a1, $s3, $zero
/* 4B338 8005AB38 B766010C */  jal        STREAM_SetMainFog
/* 4B33C 8005AB3C 21202002 */   addu      $a0, $s1, $zero
/* 4B340 8005AB40 0000228E */  lw         $v0, 0x0($s1)
/* 4B344 8005AB44 00000000 */  nop
/* 4B348 8005AB48 40BF82AF */  sw         $v0, %gp_rel(gameTrackerX + 0x178)($gp)
/* 4B34C 8005AB4C 0800228E */  lw         $v0, 0x8($s1)
/* 4B350 8005AB50 00000000 */  nop
/* 4B354 8005AB54 F0BD82AF */  sw         $v0, %gp_rel(gameTrackerX + 0x28)($gp)
/* 4B358 8005AB58 EE6A0108 */  j          .L8005ABB8
/* 4B35C 8005AB5C 10000224 */   addiu     $v0, $zero, 0x10
.L8005AB60:
/* 4B360 8005AB60 0800308E */  lw         $s0, 0x8($s1)
/* 4B364 8005AB64 F066010C */  jal        STREAM_ConnectStream
/* 4B368 8005AB68 21202002 */   addu      $a0, $s1, $zero
/* 4B36C 8005AB6C D2BD8287 */  lh         $v0, %gp_rel(gameTrackerX + 0xA)($gp)
/* 4B370 8005AB70 00000000 */  nop
/* 4B374 8005AB74 05004010 */  beqz       $v0, .L8005AB8C
/* 4B378 8005AB78 00000000 */   nop
/* 4B37C 8005AB7C 4A000586 */  lh         $a1, 0x4A($s0)
/* 4B380 8005AB80 48000686 */  lh         $a2, 0x48($s0)
/* 4B384 8005AB84 E56A0108 */  j          .L8005AB94
/* 4B388 8005AB88 00000000 */   nop
.L8005AB8C:
/* 4B38C 8005AB8C A6000586 */  lh         $a1, 0xA6($s0)
/* 4B390 8005AB90 A4000686 */  lh         $a2, 0xA4($s0)
.L8005AB94:
/* 4B394 8005AB94 CC66010C */  jal        STREAM_SetStreamFog
/* 4B398 8005AB98 21202002 */   addu      $a0, $s1, $zero
/* 4B39C 8005AB9C EE6A0108 */  j          .L8005ABB8
/* 4B3A0 8005ABA0 10000224 */   addiu     $v0, $zero, 0x10
.L8005ABA4:
/* 4B3A4 8005ABA4 01005226 */  addiu      $s2, $s2, 0x1
/* 4B3A8 8005ABA8 1000422A */  slti       $v0, $s2, 0x10
/* 4B3AC 8005ABAC CAFF4014 */  bnez       $v0, .L8005AAD8
/* 4B3B0 8005ABB0 80111200 */   sll       $v0, $s2, 6
.L8005ABB4:
/* 4B3B4 8005ABB4 10000224 */  addiu      $v0, $zero, 0x10
.L8005ABB8:
/* 4B3B8 8005ABB8 38004216 */  bne        $s2, $v0, .L8005AC9C
/* 4B3BC 8005ABBC 21102002 */   addu      $v0, $s1, $zero
/* 4B3C0 8005ABC0 21900000 */  addu       $s2, $zero, $zero
/* 4B3C4 8005ABC4 02001024 */  addiu      $s0, $zero, 0x2
/* 4B3C8 8005ABC8 80111200 */  sll        $v0, $s2, 6
.L8005ABCC:
/* 4B3CC 8005ABCC 3CC78327 */  addiu      $v1, $gp, %gp_rel(StreamTracker)
/* 4B3D0 8005ABD0 21884300 */  addu       $s1, $v0, $v1
/* 4B3D4 8005ABD4 04002286 */  lh         $v0, 0x4($s1)
/* 4B3D8 8005ABD8 00000000 */  nop
/* 4B3DC 8005ABDC 2B004014 */  bnez       $v0, .L8005AC8C
/* 4B3E0 8005ABE0 01005226 */   addiu     $s2, $s2, 0x1
/* 4B3E4 8005ABE4 21206002 */  addu       $a0, $s3, $zero
/* 4B3E8 8005ABE8 1800A527 */  addiu      $a1, $sp, 0x18
/* 4B3EC 8005ABEC 21300000 */  addu       $a2, $zero, $zero
/* 4B3F0 8005ABF0 8062010C */  jal        STREAM_FillOutFileNames
/* 4B3F4 8005ABF4 2138C000 */   addu      $a3, $a2, $zero
/* 4B3F8 8005ABF8 0C002426 */  addiu      $a0, $s1, 0xC
/* 4B3FC 8005ABFC 21286002 */  addu       $a1, $s3, $zero
/* 4B400 8005AC00 01000224 */  addiu      $v0, $zero, 0x1
/* 4B404 8005AC04 1CF4020C */  jal        func_800BD070
/* 4B408 8005AC08 040022A6 */   sh        $v0, 0x4($s1)
/* 4B40C 8005AC0C 000035AE */  sw         $s5, 0x0($s1)
/* 4B410 8005AC10 200020AE */  sw         $zero, 0x20($s1)
/* 4B414 8005AC14 11008016 */  bnez       $s4, .L8005AC5C
/* 4B418 8005AC18 060020A6 */   sh        $zero, 0x6($s1)
/* 4B41C 8005AC1C 24BF8427 */  addiu      $a0, $gp, %gp_rel(gameTrackerX + 0x15C)
/* 4B420 8005AC20 1CF4020C */  jal        func_800BD070
/* 4B424 8005AC24 21286002 */   addu      $a1, $s3, $zero
/* 4B428 8005AC28 1800A427 */  addiu      $a0, $sp, 0x18
/* 4B42C 8005AC2C 0680053C */  lui        $a1, %hi(STREAM_LoadLevelReturn)
/* 4B430 8005AC30 98A1A524 */  addiu      $a1, $a1, %lo(STREAM_LoadLevelReturn)
/* 4B434 8005AC34 21300000 */  addu       $a2, $zero, $zero
/* 4B438 8005AC38 0000238E */  lw         $v1, 0x0($s1)
/* 4B43C 8005AC3C 08002226 */  addiu      $v0, $s1, 0x8
/* 4B440 8005AC40 1000A2AF */  sw         $v0, 0x10($sp)
/* 4B444 8005AC44 1400B0AF */  sw         $s0, 0x14($sp)
/* 4B448 8005AC48 40BF83AF */  sw         $v1, %gp_rel(gameTrackerX + 0x178)($gp)
/* 4B44C 8005AC4C EA81010C */  jal        LOAD_NonBlockingBinaryLoad
/* 4B450 8005AC50 21382002 */   addu      $a3, $s1, $zero
/* 4B454 8005AC54 276B0108 */  j          .L8005AC9C
/* 4B458 8005AC58 21102002 */   addu      $v0, $s1, $zero
.L8005AC5C:
/* 4B45C 8005AC5C 1800A427 */  addiu      $a0, $sp, 0x18
/* 4B460 8005AC60 0680053C */  lui        $a1, %hi(STREAM_StreamLoadLevelReturn)
/* 4B464 8005AC64 F8A1A524 */  addiu      $a1, $a1, %lo(STREAM_StreamLoadLevelReturn)
/* 4B468 8005AC68 21300000 */  addu       $a2, $zero, $zero
/* 4B46C 8005AC6C 21382002 */  addu       $a3, $s1, $zero
/* 4B470 8005AC70 08002226 */  addiu      $v0, $s1, 0x8
/* 4B474 8005AC74 280080AE */  sw         $zero, 0x28($s4)
/* 4B478 8005AC78 1000A2AF */  sw         $v0, 0x10($sp)
/* 4B47C 8005AC7C EA81010C */  jal        LOAD_NonBlockingBinaryLoad
/* 4B480 8005AC80 1400B0AF */   sw        $s0, 0x14($sp)
/* 4B484 8005AC84 276B0108 */  j          .L8005AC9C
/* 4B488 8005AC88 21102002 */   addu      $v0, $s1, $zero
.L8005AC8C:
/* 4B48C 8005AC8C 1000422A */  slti       $v0, $s2, 0x10
/* 4B490 8005AC90 CEFF4014 */  bnez       $v0, .L8005ABCC
/* 4B494 8005AC94 80111200 */   sll       $v0, $s2, 6
/* 4B498 8005AC98 21102002 */  addu       $v0, $s1, $zero
.L8005AC9C:
/* 4B49C 8005AC9C 8000BF8F */  lw         $ra, 0x80($sp)
/* 4B4A0 8005ACA0 7C00B58F */  lw         $s5, 0x7C($sp)
/* 4B4A4 8005ACA4 7800B48F */  lw         $s4, 0x78($sp)
/* 4B4A8 8005ACA8 7400B38F */  lw         $s3, 0x74($sp)
/* 4B4AC 8005ACAC 7000B28F */  lw         $s2, 0x70($sp)
/* 4B4B0 8005ACB0 6C00B18F */  lw         $s1, 0x6C($sp)
/* 4B4B4 8005ACB4 6800B08F */  lw         $s0, 0x68($sp)
/* 4B4B8 8005ACB8 0800E003 */  jr         $ra
/* 4B4BC 8005ACBC 8800BD27 */   addiu     $sp, $sp, 0x88
.size STREAM_LoadLevel, . - STREAM_LoadLevel
