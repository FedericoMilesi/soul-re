.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel COLLIDE_InstanceListTerrain
/* 15300 80024B00 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 15304 80024B04 1800B2AF */  sw         $s2, 0x18($sp)
/* 15308 80024B08 01001224 */  addiu      $s2, $zero, 0x1
/* 1530C 80024B0C 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 15310 80024B10 0424133C */  lui        $s3, (0x24040000 >> 16)
/* 15314 80024B14 1400B1AF */  sw         $s1, 0x14($sp)
/* 15318 80024B18 08009124 */  addiu      $s1, $a0, 0x8
/* 1531C 80024B1C 2000BFAF */  sw         $ra, 0x20($sp)
/* 15320 80024B20 1000B0AF */  sw         $s0, 0x10($sp)
.L80024B24:
/* 15324 80024B24 1000308E */  lw         $s0, 0x10($s1)
/* 15328 80024B28 00000000 */  nop
/* 1532C 80024B2C 15000012 */  beqz       $s0, .L80024B84
/* 15330 80024B30 00000000 */   nop
.L80024B34:
/* 15334 80024B34 0001028E */  lw         $v0, 0x100($s0)
/* 15338 80024B38 00000000 */  nop
/* 1533C 80024B3C 0D004010 */  beqz       $v0, .L80024B74
/* 15340 80024B40 00000000 */   nop
/* 15344 80024B44 1800028E */  lw         $v0, 0x18($s0)
/* 15348 80024B48 00000000 */  nop
/* 1534C 80024B4C 24105300 */  and        $v0, $v0, $s3
/* 15350 80024B50 08004014 */  bnez       $v0, .L80024B74
/* 15354 80024B54 00000000 */   nop
/* 15358 80024B58 3800048E */  lw         $a0, 0x38($s0)
/* 1535C 80024B5C 1C66010C */  jal        STREAM_GetLevelWithID
/* 15360 80024B60 00000000 */   nop
/* 15364 80024B64 03004010 */  beqz       $v0, .L80024B74
/* 15368 80024B68 21200002 */   addu      $a0, $s0, $zero
/* 1536C 80024B6C E18E000C */  jal        COLLIDE_InstanceTerrain
/* 15370 80024B70 21284000 */   addu      $a1, $v0, $zero
.L80024B74:
/* 15374 80024B74 0400108E */  lw         $s0, 0x4($s0)
/* 15378 80024B78 00000000 */  nop
/* 1537C 80024B7C EDFF0016 */  bnez       $s0, .L80024B34
/* 15380 80024B80 00000000 */   nop
.L80024B84:
/* 15384 80024B84 02005226 */  addiu      $s2, $s2, 0x2
/* 15388 80024B88 2000422A */  slti       $v0, $s2, 0x20
/* 1538C 80024B8C E5FF4014 */  bnez       $v0, .L80024B24
/* 15390 80024B90 10003126 */   addiu     $s1, $s1, 0x10
/* 15394 80024B94 2000BF8F */  lw         $ra, 0x20($sp)
/* 15398 80024B98 1C00B38F */  lw         $s3, 0x1C($sp)
/* 1539C 80024B9C 1800B28F */  lw         $s2, 0x18($sp)
/* 153A0 80024BA0 1400B18F */  lw         $s1, 0x14($sp)
/* 153A4 80024BA4 1000B08F */  lw         $s0, 0x10($sp)
/* 153A8 80024BA8 0800E003 */  jr         $ra
/* 153AC 80024BAC 2800BD27 */   addiu     $sp, $sp, 0x28
.size COLLIDE_InstanceListTerrain, . - COLLIDE_InstanceListTerrain
