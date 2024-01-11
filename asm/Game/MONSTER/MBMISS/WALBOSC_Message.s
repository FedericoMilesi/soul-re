.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WALBOSC_Message
/* 80304 8008FB04 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 80308 8008FB08 1000B0AF */  sw         $s0, 0x10($sp)
/* 8030C 8008FB0C 21808000 */  addu       $s0, $a0, $zero
/* 80310 8008FB10 0001023C */  lui        $v0, (0x1000017 >> 16)
/* 80314 8008FB14 17004234 */  ori        $v0, $v0, (0x1000017 & 0xFFFF)
/* 80318 8008FB18 0900A214 */  bne        $a1, $v0, .L8008FB40
/* 8031C 8008FB1C 1400BFAF */   sw        $ra, 0x14($sp)
/* 80320 8008FB20 0700C014 */  bnez       $a2, .L8008FB40
/* 80324 8008FB24 00000000 */   nop
/* 80328 8008FB28 0A93000C */  jal        COLLIDE_SegmentCollisionOff
/* 8032C 8008FB2C 01000524 */   addiu     $a1, $zero, 0x1
/* 80330 8008FB30 1800028E */  lw         $v0, 0x18($s0)
/* 80334 8008FB34 0020033C */  lui        $v1, (0x20000000 >> 16)
/* 80338 8008FB38 25104300 */  or         $v0, $v0, $v1
/* 8033C 8008FB3C 180002AE */  sw         $v0, 0x18($s0)
.L8008FB40:
/* 80340 8008FB40 1400BF8F */  lw         $ra, 0x14($sp)
/* 80344 8008FB44 1000B08F */  lw         $s0, 0x10($sp)
/* 80348 8008FB48 0800E003 */  jr         $ra
/* 8034C 8008FB4C 1800BD27 */   addiu     $sp, $sp, 0x18
.size WALBOSC_Message, . - WALBOSC_Message
