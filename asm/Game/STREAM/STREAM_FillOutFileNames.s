.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_FillOutFileNames
/* 49200 80058A00 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 49204 80058A04 2000B0AF */  sw         $s0, 0x20($sp)
/* 49208 80058A08 21808000 */  addu       $s0, $a0, $zero
/* 4920C 80058A0C 2400B1AF */  sw         $s1, 0x24($sp)
/* 49210 80058A10 2188A000 */  addu       $s1, $a1, $zero
/* 49214 80058A14 2800B2AF */  sw         $s2, 0x28($sp)
/* 49218 80058A18 2190C000 */  addu       $s2, $a2, $zero
/* 4921C 80058A1C 2C00B3AF */  sw         $s3, 0x2C($sp)
/* 49220 80058A20 2198E000 */  addu       $s3, $a3, $zero
/* 49224 80058A24 1000A427 */  addiu      $a0, $sp, 0x10
/* 49228 80058A28 3000BFAF */  sw         $ra, 0x30($sp)
/* 4922C 80058A2C 1CF4020C */  jal        strcpy
/* 49230 80058A30 21280002 */   addu      $a1, $s0, $zero
/* 49234 80058A34 1000A427 */  addiu      $a0, $sp, 0x10
/* 49238 80058A38 0D80053C */  lui        $a1, %hi(D_800D17B0)
/* 4923C 80058A3C 21FE020C */  jal        strpbrk
/* 49240 80058A40 B017A524 */   addiu     $a1, $a1, %lo(D_800D17B0)
/* 49244 80058A44 02004010 */  beqz       $v0, .L80058A50
/* 49248 80058A48 00000000 */   nop
/* 4924C 80058A4C 000040A0 */  sb         $zero, 0x0($v0)
.L80058A50:
/* 49250 80058A50 06002012 */  beqz       $s1, .L80058A6C
/* 49254 80058A54 21202002 */   addu      $a0, $s1, $zero
/* 49258 80058A58 0D80053C */  lui        $a1, %hi(D_800D17BC)
/* 4925C 80058A5C BC17A524 */  addiu      $a1, $a1, %lo(D_800D17BC)
/* 49260 80058A60 1000A627 */  addiu      $a2, $sp, 0x10
/* 49264 80058A64 1AD1010C */  jal        sprintf
/* 49268 80058A68 21380002 */   addu      $a3, $s0, $zero
.L80058A6C:
/* 4926C 80058A6C 06004012 */  beqz       $s2, .L80058A88
/* 49270 80058A70 21204002 */   addu      $a0, $s2, $zero
/* 49274 80058A74 0D80053C */  lui        $a1, %hi(D_800D17D8)
/* 49278 80058A78 D817A524 */  addiu      $a1, $a1, %lo(D_800D17D8)
/* 4927C 80058A7C 1000A627 */  addiu      $a2, $sp, 0x10
/* 49280 80058A80 1AD1010C */  jal        sprintf
/* 49284 80058A84 21380002 */   addu      $a3, $s0, $zero
.L80058A88:
/* 49288 80058A88 06006012 */  beqz       $s3, .L80058AA4
/* 4928C 80058A8C 21206002 */   addu      $a0, $s3, $zero
/* 49290 80058A90 0D80053C */  lui        $a1, %hi(D_800D17F4)
/* 49294 80058A94 F417A524 */  addiu      $a1, $a1, %lo(D_800D17F4)
/* 49298 80058A98 1000A627 */  addiu      $a2, $sp, 0x10
/* 4929C 80058A9C 1AD1010C */  jal        sprintf
/* 492A0 80058AA0 21380002 */   addu      $a3, $s0, $zero
.L80058AA4:
/* 492A4 80058AA4 3000BF8F */  lw         $ra, 0x30($sp)
/* 492A8 80058AA8 2C00B38F */  lw         $s3, 0x2C($sp)
/* 492AC 80058AAC 2800B28F */  lw         $s2, 0x28($sp)
/* 492B0 80058AB0 2400B18F */  lw         $s1, 0x24($sp)
/* 492B4 80058AB4 2000B08F */  lw         $s0, 0x20($sp)
/* 492B8 80058AB8 0800E003 */  jr         $ra
/* 492BC 80058ABC 3800BD27 */   addiu     $sp, $sp, 0x38
.size STREAM_FillOutFileNames, . - STREAM_FillOutFileNames
