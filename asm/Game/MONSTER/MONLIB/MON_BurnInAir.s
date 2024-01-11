.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_BurnInAir
/* 74AE8 800842E8 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 74AEC 800842EC 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 74AF0 800842F0 21888000 */  addu       $s1, $a0, $zero
/* 74AF4 800842F4 2400BFAF */  sw         $ra, 0x24($sp)
/* 74AF8 800842F8 2000B2AF */  sw         $s2, 0x20($sp)
/* 74AFC 800842FC 1800B0AF */  sw         $s0, 0x18($sp)
/* 74B00 80084300 6C01308E */  lw         $s0, 0x16C($s1)
/* 74B04 80084304 2190A000 */  addu       $s2, $a1, $zero
/* 74B08 80084308 0000038E */  lw         $v1, 0x0($s0)
/* 74B0C 8008430C 4000053C */  lui        $a1, (0x400000 >> 16)
/* 74B10 80084310 24106500 */  and        $v0, $v1, $a1
/* 74B14 80084314 14004014 */  bnez       $v0, .L80084368
/* 74B18 80084318 25106500 */   or        $v0, $v1, $a1
/* 74B1C 8008431C 9006020C */  jal        MON_GetTime
/* 74B20 80084320 000002AE */   sw        $v0, 0x0($s0)
/* 74B24 80084324 21202002 */  addu       $a0, $s1, $zero
/* 74B28 80084328 60490524 */  addiu      $a1, $zero, 0x4960
/* 74B2C 8008432C FFFF0624 */  addiu      $a2, $zero, -0x1
/* 74B30 80084330 21380000 */  addu       $a3, $zero, $zero
/* 74B34 80084334 10274224 */  addiu      $v0, $v0, 0x2710
/* 74B38 80084338 1C0102AE */  sw         $v0, 0x11C($s0)
/* 74B3C 8008433C 642C020C */  jal        MON_MonsterGlow
/* 74B40 80084340 1000A0AF */   sw        $zero, 0x10($sp)
/* 74B44 80084344 21200000 */  addu       $a0, $zero, $zero
/* 74B48 80084348 21288000 */  addu       $a1, $a0, $zero
/* 74B4C 8008434C 21308000 */  addu       $a2, $a0, $zero
/* 74B50 80084350 7FC5010C */  jal        SetFXHitData
/* 74B54 80084354 20000724 */   addiu     $a3, $zero, 0x20
/* 74B58 80084358 21202002 */  addu       $a0, $s1, $zero
/* 74B5C 8008435C 4000053C */  lui        $a1, (0x400000 >> 16)
/* 74B60 80084360 A1D1000C */  jal        INSTANCE_Post
/* 74B64 80084364 21304000 */   addu      $a2, $v0, $zero
.L80084368:
/* 74B68 80084368 980132AE */  sw         $s2, 0x198($s1)
/* 74B6C 8008436C 0000028E */  lw         $v0, 0x0($s0)
/* 74B70 80084370 FEFF0324 */  addiu      $v1, $zero, -0x2
/* 74B74 80084374 24104300 */  and        $v0, $v0, $v1
/* 74B78 80084378 000002AE */  sw         $v0, 0x0($s0)
/* 74B7C 8008437C 5800228E */  lw         $v0, 0x58($s1)
/* 74B80 80084380 DFFF0324 */  addiu      $v1, $zero, -0x21
/* 74B84 80084384 24104300 */  and        $v0, $v0, $v1
/* 74B88 80084388 580022AE */  sw         $v0, 0x58($s1)
/* 74B8C 8008438C 2400BF8F */  lw         $ra, 0x24($sp)
/* 74B90 80084390 2000B28F */  lw         $s2, 0x20($sp)
/* 74B94 80084394 1C00B18F */  lw         $s1, 0x1C($sp)
/* 74B98 80084398 1800B08F */  lw         $s0, 0x18($sp)
/* 74B9C 8008439C 0800E003 */  jr         $ra
/* 74BA0 800843A0 2800BD27 */   addiu     $sp, $sp, 0x28
.size MON_BurnInAir, . - MON_BurnInAir
