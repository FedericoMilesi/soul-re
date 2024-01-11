.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_LandOnFeetEntry
/* 78B28 80088328 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 78B2C 8008832C 1000B0AF */  sw         $s0, 0x10($sp)
/* 78B30 80088330 21808000 */  addu       $s0, $a0, $zero
/* 78B34 80088334 1400BFAF */  sw         $ra, 0x14($sp)
/* 78B38 80088338 6C01028E */  lw         $v0, 0x16C($s0)
/* 78B3C 8008833C 00000000 */  nop
/* 78B40 80088340 59014380 */  lb         $v1, 0x159($v0)
/* 78B44 80088344 0B000224 */  addiu      $v0, $zero, 0xB
/* 78B48 80088348 09006214 */  bne        $v1, $v0, .L80088370
/* 78B4C 8008834C 12000524 */   addiu     $a1, $zero, 0x12
/* 78B50 80088350 15000524 */  addiu      $a1, $zero, 0x15
/* 78B54 80088354 B6FF010C */  jal        MON_PlayAnim
/* 78B58 80088358 01000624 */   addiu     $a2, $zero, 0x1
/* 78B5C 8008835C 800100AE */  sw         $zero, 0x180($s0)
/* 78B60 80088360 F0FF0224 */  addiu      $v0, $zero, -0x10
/* 78B64 80088364 840100AE */  sw         $zero, 0x184($s0)
/* 78B68 80088368 E2200208 */  j          .L80088388
/* 78B6C 8008836C 880102AE */   sw        $v0, 0x188($s0)
.L80088370:
/* 78B70 80088370 21200002 */  addu       $a0, $s0, $zero
/* 78B74 80088374 B6FF010C */  jal        MON_PlayAnim
/* 78B78 80088378 01000624 */   addiu     $a2, $zero, 0x1
/* 78B7C 8008837C 800100AE */  sw         $zero, 0x180($s0)
/* 78B80 80088380 840100AE */  sw         $zero, 0x184($s0)
/* 78B84 80088384 880100AE */  sw         $zero, 0x188($s0)
.L80088388:
/* 78B88 80088388 7C01038E */  lw         $v1, 0x17C($s0)
/* 78B8C 8008838C 00000000 */  nop
/* 78B90 80088390 9BFF6228 */  slti       $v0, $v1, -0x65
/* 78B94 80088394 0A004010 */  beqz       $v0, .L800883C0
/* 78B98 80088398 0AFF6228 */   slti      $v0, $v1, -0xF6
/* 78B9C 8008839C 05004010 */  beqz       $v0, .L800883B4
/* 78BA0 800883A0 00100524 */   addiu     $a1, $zero, 0x1000
/* 78BA4 800883A4 A3FE6228 */  slti       $v0, $v1, -0x15D
/* 78BA8 800883A8 02004014 */  bnez       $v0, .L800883B4
/* 78BAC 800883AC 00300524 */   addiu     $a1, $zero, 0x3000
/* 78BB0 800883B0 00200524 */  addiu      $a1, $zero, 0x2000
.L800883B4:
/* 78BB4 800883B4 21200002 */  addu       $a0, $s0, $zero
/* 78BB8 800883B8 BC0A020C */  jal        MON_TakeDamage
/* 78BBC 800883BC 0400063C */   lui       $a2, (0x40000 >> 16)
.L800883C0:
/* 78BC0 800883C0 5800028E */  lw         $v0, 0x58($s0)
/* 78BC4 800883C4 DFFF0324 */  addiu      $v1, $zero, -0x21
/* 78BC8 800883C8 740100AE */  sw         $zero, 0x174($s0)
/* 78BCC 800883CC 780100AE */  sw         $zero, 0x178($s0)
/* 78BD0 800883D0 7C0100AE */  sw         $zero, 0x17C($s0)
/* 78BD4 800883D4 24104300 */  and        $v0, $v0, $v1
/* 78BD8 800883D8 580002AE */  sw         $v0, 0x58($s0)
/* 78BDC 800883DC 1400BF8F */  lw         $ra, 0x14($sp)
/* 78BE0 800883E0 1000B08F */  lw         $s0, 0x10($sp)
/* 78BE4 800883E4 0800E003 */  jr         $ra
/* 78BE8 800883E8 1800BD27 */   addiu     $sp, $sp, 0x18
.size MON_LandOnFeetEntry, . - MON_LandOnFeetEntry
