.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CollideReaverProjectile
/* 6AA4C 8007A24C D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 6AA50 8007A250 2000B2AF */  sw         $s2, 0x20($sp)
/* 6AA54 8007A254 21908000 */  addu       $s2, $a0, $zero
/* 6AA58 8007A258 2800B4AF */  sw         $s4, 0x28($sp)
/* 6AA5C 8007A25C 21A0A000 */  addu       $s4, $a1, $zero
/* 6AA60 8007A260 1800B0AF */  sw         $s0, 0x18($sp)
/* 6AA64 8007A264 2C00BFAF */  sw         $ra, 0x2C($sp)
/* 6AA68 8007A268 2400B3AF */  sw         $s3, 0x24($sp)
/* 6AA6C 8007A26C 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 6AA70 8007A270 6C01428E */  lw         $v0, 0x16C($s2)
/* 6AA74 8007A274 C000518E */  lw         $s1, 0xC0($s2)
/* 6AA78 8007A278 0400428C */  lw         $v0, 0x4($v0)
/* 6AA7C 8007A27C 0400238E */  lw         $v1, 0x4($s1)
/* 6AA80 8007A280 1400338E */  lw         $s3, 0x14($s1)
/* 6AA84 8007A284 FEFF4424 */  addiu      $a0, $v0, -0x2
/* 6AA88 8007A288 FFFF023C */  lui        $v0, (0xFFFF0000 >> 16)
/* 6AA8C 8007A28C 24186200 */  and        $v1, $v1, $v0
/* 6AA90 8007A290 0101023C */  lui        $v0, (0x1010000 >> 16)
/* 6AA94 8007A294 2C006214 */  bne        $v1, $v0, .L8007A348
/* 6AA98 8007A298 21800000 */   addu      $s0, $zero, $zero
/* 6AA9C 8007A29C 15008018 */  blez       $a0, .L8007A2F4
/* 6AAA0 8007A2A0 03008228 */   slti      $v0, $a0, 0x3
/* 6AAA4 8007A2A4 05004014 */  bnez       $v0, .L8007A2BC
/* 6AAA8 8007A2A8 06000224 */   addiu     $v0, $zero, 0x6
/* 6AAAC 8007A2AC 05008210 */  beq        $a0, $v0, .L8007A2C4
/* 6AAB0 8007A2B0 00000000 */   nop
/* 6AAB4 8007A2B4 BDE80108 */  j          .L8007A2F4
/* 6AAB8 8007A2B8 00000000 */   nop
.L8007A2BC:
/* 6AABC 8007A2BC BDE80108 */  j          .L8007A2F4
/* 6AAC0 8007A2C0 00101024 */   addiu     $s0, $zero, 0x1000
.L8007A2C4:
/* 6AAC4 8007A2C4 3800448E */  lw         $a0, 0x38($s2)
/* 6AAC8 8007A2C8 1C66010C */  jal        STREAM_GetLevelWithID
/* 6AACC 8007A2CC 20001024 */   addiu     $s0, $zero, 0x20
/* 6AAD0 8007A2D0 21184000 */  addu       $v1, $v0, $zero
/* 6AAD4 8007A2D4 07006010 */  beqz       $v1, .L8007A2F4
/* 6AAD8 8007A2D8 00000000 */   nop
/* 6AADC 8007A2DC 60004286 */  lh         $v0, 0x60($s2)
/* 6AAE0 8007A2E0 3800638C */  lw         $v1, 0x38($v1)
/* 6AAE4 8007A2E4 00000000 */  nop
/* 6AAE8 8007A2E8 2A104300 */  slt        $v0, $v0, $v1
/* 6AAEC 8007A2EC 26004014 */  bnez       $v0, .L8007A388
/* 6AAF0 8007A2F0 00000000 */   nop
.L8007A2F4:
/* 6AAF4 8007A2F4 14000012 */  beqz       $s0, .L8007A348
/* 6AAF8 8007A2F8 21204002 */   addu      $a0, $s2, $zero
/* 6AAFC 8007A2FC 1000A0AF */  sw         $zero, 0x10($sp)
/* 6AB00 8007A300 21280000 */  addu       $a1, $zero, $zero
/* 6AB04 8007A304 21300002 */  addu       $a2, $s0, $zero
/* 6AB08 8007A308 95C3010C */  jal        SetMonsterHitData
/* 6AB0C 8007A30C 2138A000 */   addu      $a3, $a1, $zero
/* 6AB10 8007A310 21206002 */  addu       $a0, $s3, $zero
/* 6AB14 8007A314 0001053C */  lui        $a1, (0x1000021 >> 16)
/* 6AB18 8007A318 2100A534 */  ori        $a1, $a1, (0x1000021 & 0xFFFF)
/* 6AB1C 8007A31C A1D1000C */  jal        INSTANCE_Post
/* 6AB20 8007A320 21304000 */   addu      $a2, $v0, $zero
/* 6AB24 8007A324 21204002 */  addu       $a0, $s2, $zero
/* 6AB28 8007A328 01000524 */  addiu      $a1, $zero, 0x1
/* 6AB2C 8007A32C 32000624 */  addiu      $a2, $zero, 0x32
/* 6AB30 8007A330 7FC5010C */  jal        SetFXHitData
/* 6AB34 8007A334 21380002 */   addu      $a3, $s0, $zero
/* 6AB38 8007A338 21206002 */  addu       $a0, $s3, $zero
/* 6AB3C 8007A33C 4000053C */  lui        $a1, (0x400000 >> 16)
/* 6AB40 8007A340 A1D1000C */  jal        INSTANCE_Post
/* 6AB44 8007A344 21304000 */   addu      $a2, $v0, $zero
.L8007A348:
/* 6AB48 8007A348 07002392 */  lbu        $v1, 0x7($s1)
/* 6AB4C 8007A34C 03000224 */  addiu      $v0, $zero, 0x3
/* 6AB50 8007A350 08006210 */  beq        $v1, $v0, .L8007A374
/* 6AB54 8007A354 21202002 */   addu      $a0, $s1, $zero
/* 6AB58 8007A358 1400238E */  lw         $v1, 0x14($s1)
/* 6AB5C 8007A35C 00000000 */  nop
/* 6AB60 8007A360 1400628C */  lw         $v0, 0x14($v1)
/* 6AB64 8007A364 00000000 */  nop
/* 6AB68 8007A368 04004234 */  ori        $v0, $v0, 0x4
/* 6AB6C 8007A36C DFE80108 */  j          .L8007A37C
/* 6AB70 8007A370 140062AC */   sw        $v0, 0x14($v1)
.L8007A374:
/* 6AB74 8007A374 8A93000C */  jal        COLLIDE_SetBSPTreeFlag
/* 6AB78 8007A378 00080524 */   addiu     $a1, $zero, 0x800
.L8007A37C:
/* 6AB7C 8007A37C 21204002 */  addu       $a0, $s2, $zero
/* 6AB80 8007A380 89B5010C */  jal        CollidePhysicalObject
/* 6AB84 8007A384 21288002 */   addu      $a1, $s4, $zero
.L8007A388:
/* 6AB88 8007A388 2C00BF8F */  lw         $ra, 0x2C($sp)
/* 6AB8C 8007A38C 2800B48F */  lw         $s4, 0x28($sp)
/* 6AB90 8007A390 2400B38F */  lw         $s3, 0x24($sp)
/* 6AB94 8007A394 2000B28F */  lw         $s2, 0x20($sp)
/* 6AB98 8007A398 1C00B18F */  lw         $s1, 0x1C($sp)
/* 6AB9C 8007A39C 1800B08F */  lw         $s0, 0x18($sp)
/* 6ABA0 8007A3A0 0800E003 */  jr         $ra
/* 6ABA4 8007A3A4 3000BD27 */   addiu     $sp, $sp, 0x30
.size CollideReaverProjectile, . - CollideReaverProjectile
