.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel INSTANCE_SpatialRelationships
/* 25AA8 800352A8 98FFBD27 */  addiu      $sp, $sp, -0x68
/* 25AAC 800352AC 6000B4AF */  sw         $s4, 0x60($sp)
/* 25AB0 800352B0 21A08000 */  addu       $s4, $a0, $zero
/* 25AB4 800352B4 6400BFAF */  sw         $ra, 0x64($sp)
/* 25AB8 800352B8 5C00B3AF */  sw         $s3, 0x5C($sp)
/* 25ABC 800352BC 5800B2AF */  sw         $s2, 0x58($sp)
/* 25AC0 800352C0 5400B1AF */  sw         $s1, 0x54($sp)
/* 25AC4 800352C4 5000B0AF */  sw         $s0, 0x50($sp)
/* 25AC8 800352C8 0400918E */  lw         $s1, 0x4($s4)
/* 25ACC 800352CC 00000000 */  nop
/* 25AD0 800352D0 46002012 */  beqz       $s1, .L800353EC
/* 25AD4 800352D4 3800B227 */   addiu     $s2, $sp, 0x38
/* 25AD8 800352D8 0010023C */  lui        $v0, (0x10000401 >> 16)
.L800352DC:
/* 25ADC 800352DC 1800238E */  lw         $v1, 0x18($s1)
/* 25AE0 800352E0 01044234 */  ori        $v0, $v0, (0x10000401 & 0xFFFF)
/* 25AE4 800352E4 24186200 */  and        $v1, $v1, $v0
/* 25AE8 800352E8 00040224 */  addiu      $v0, $zero, 0x400
/* 25AEC 800352EC 3B006214 */  bne        $v1, $v0, .L800353DC
/* 25AF0 800352F0 21202002 */   addu      $a0, $s1, $zero
/* 25AF4 800352F4 5800338E */  lw         $s3, 0x58($s1)
/* 25AF8 800352F8 92D1000C */  jal        INSTANCE_Query
/* 25AFC 800352FC 0D000524 */   addiu     $a1, $zero, 0xD
/* 25B00 80035300 21202002 */  addu       $a0, $s1, $zero
/* 25B04 80035304 2000053C */  lui        $a1, (0x200000 >> 16)
/* 25B08 80035308 21300000 */  addu       $a2, $zero, $zero
/* 25B0C 8003530C A1D1000C */  jal        INSTANCE_Post
/* 25B10 80035310 21804000 */   addu      $s0, $v0, $zero
/* 25B14 80035314 31000012 */  beqz       $s0, .L800353DC
/* 25B18 80035318 21200002 */   addu      $a0, $s0, $zero
/* 25B1C 8003531C 88F4020C */  jal        func_800BD220
/* 25B20 80035320 1800A527 */   addiu     $a1, $sp, 0x18
/* 25B24 80035324 0400908E */  lw         $s0, 0x4($s4)
/* 25B28 80035328 00000000 */  nop
/* 25B2C 8003532C 2B000012 */  beqz       $s0, .L800353DC
/* 25B30 80035330 00000000 */   nop
.L80035334:
/* 25B34 80035334 25001112 */  beq        $s0, $s1, .L800353CC
/* 25B38 80035338 0010033C */   lui       $v1, (0x10000000 >> 16)
/* 25B3C 8003533C 1800028E */  lw         $v0, 0x18($s0)
/* 25B40 80035340 00000000 */  nop
/* 25B44 80035344 24104300 */  and        $v0, $v0, $v1
/* 25B48 80035348 20004014 */  bnez       $v0, .L800353CC
/* 25B4C 8003534C 00000000 */   nop
/* 25B50 80035350 1400028E */  lw         $v0, 0x14($s0)
/* 25B54 80035354 00000000 */  nop
/* 25B58 80035358 20004230 */  andi       $v0, $v0, 0x20
/* 25B5C 8003535C 1B004014 */  bnez       $v0, .L800353CC
/* 25B60 80035360 21200002 */   addu      $a0, $s0, $zero
/* 25B64 80035364 92D1000C */  jal        INSTANCE_Query
/* 25B68 80035368 01000524 */   addiu     $a1, $zero, 0x1
/* 25B6C 8003536C 24105300 */  and        $v0, $v0, $s3
/* 25B70 80035370 16004010 */  beqz       $v0, .L800353CC
/* 25B74 80035374 21200002 */   addu      $a0, $s0, $zero
/* 25B78 80035378 92D1000C */  jal        INSTANCE_Query
/* 25B7C 8003537C 0E000524 */   addiu     $a1, $zero, 0xE
/* 25B80 80035380 21304000 */  addu       $a2, $v0, $zero
/* 25B84 80035384 0500C014 */  bnez       $a2, .L8003539C
/* 25B88 80035388 1800A227 */   addiu     $v0, $sp, 0x18
/* 25B8C 8003538C 4000068E */  lw         $a2, 0x40($s0)
/* 25B90 80035390 00000000 */  nop
/* 25B94 80035394 0D00C010 */  beqz       $a2, .L800353CC
/* 25B98 80035398 00000000 */   nop
.L8003539C:
/* 25B9C 8003539C 1000A2AF */  sw         $v0, 0x10($sp)
/* 25BA0 800353A0 21202002 */  addu       $a0, $s1, $zero
/* 25BA4 800353A4 21280002 */  addu       $a1, $s0, $zero
/* 25BA8 800353A8 1400C624 */  addiu      $a2, $a2, 0x14
/* 25BAC 800353AC 03D5000C */  jal        INSTANCE_SetStatsData
/* 25BB0 800353B0 21384002 */   addu      $a3, $s2, $zero
/* 25BB4 800353B4 05004010 */  beqz       $v0, .L800353CC
/* 25BB8 800353B8 21202002 */   addu      $a0, $s1, $zero
/* 25BBC 800353BC 2000053C */  lui        $a1, (0x200001 >> 16)
/* 25BC0 800353C0 0100A534 */  ori        $a1, $a1, (0x200001 & 0xFFFF)
/* 25BC4 800353C4 A1D1000C */  jal        INSTANCE_Post
/* 25BC8 800353C8 21304002 */   addu      $a2, $s2, $zero
.L800353CC:
/* 25BCC 800353CC 0800108E */  lw         $s0, 0x8($s0)
/* 25BD0 800353D0 00000000 */  nop
/* 25BD4 800353D4 D7FF0016 */  bnez       $s0, .L80035334
/* 25BD8 800353D8 00000000 */   nop
.L800353DC:
/* 25BDC 800353DC 0800318E */  lw         $s1, 0x8($s1)
/* 25BE0 800353E0 00000000 */  nop
/* 25BE4 800353E4 BDFF2016 */  bnez       $s1, .L800352DC
/* 25BE8 800353E8 0010023C */   lui       $v0, (0x10000401 >> 16)
.L800353EC:
/* 25BEC 800353EC 6400BF8F */  lw         $ra, 0x64($sp)
/* 25BF0 800353F0 6000B48F */  lw         $s4, 0x60($sp)
/* 25BF4 800353F4 5C00B38F */  lw         $s3, 0x5C($sp)
/* 25BF8 800353F8 5800B28F */  lw         $s2, 0x58($sp)
/* 25BFC 800353FC 5400B18F */  lw         $s1, 0x54($sp)
/* 25C00 80035400 5000B08F */  lw         $s0, 0x50($sp)
/* 25C04 80035404 0800E003 */  jr         $ra
/* 25C08 80035408 6800BD27 */   addiu     $sp, $sp, 0x68
.size INSTANCE_SpatialRelationships, . - INSTANCE_SpatialRelationships
