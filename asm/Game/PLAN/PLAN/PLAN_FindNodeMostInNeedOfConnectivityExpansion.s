.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PLAN_FindNodeMostInNeedOfConnectivityExpansion
/* 88410 80097C10 ECF5828F */  lw         $v0, %gp_rel(poolManagementData)($gp)
/* 88414 80097C14 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 88418 80097C18 2000B4AF */  sw         $s4, 0x20($sp)
/* 8841C 80097C1C FFFF1434 */  ori        $s4, $zero, 0xFFFF
/* 88420 80097C20 1800B2AF */  sw         $s2, 0x18($sp)
/* 88424 80097C24 21900000 */  addu       $s2, $zero, $zero
/* 88428 80097C28 2400BFAF */  sw         $ra, 0x24($sp)
/* 8842C 80097C2C 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 88430 80097C30 1400B1AF */  sw         $s1, 0x14($sp)
/* 88434 80097C34 1000B0AF */  sw         $s0, 0x10($sp)
/* 88438 80097C38 01004290 */  lbu        $v0, 0x1($v0)
/* 8843C 80097C3C 00000000 */  nop
/* 88440 80097C40 19004010 */  beqz       $v0, .L80097CA8
/* 88444 80097C44 21984002 */   addu      $s3, $s2, $zero
/* 88448 80097C48 21808000 */  addu       $s0, $a0, $zero
.L80097C4C:
/* 8844C 80097C4C 9964020C */  jal        PLANPOOL_NumConnectionsForNode
/* 88450 80097C50 21200002 */   addu      $a0, $s0, $zero
/* 88454 80097C54 21884000 */  addu       $s1, $v0, $zero
/* 88458 80097C58 2A103402 */  slt        $v0, $s1, $s4
/* 8845C 80097C5C 0B004010 */  beqz       $v0, .L80097C8C
/* 88460 80097C60 00000000 */   nop
/* 88464 80097C64 9064020C */  jal        PLANPOOL_NumConnectionsExaminedForNode
/* 88468 80097C68 21200002 */   addu      $a0, $s0, $zero
/* 8846C 80097C6C ECF5838F */  lw         $v1, %gp_rel(poolManagementData)($gp)
/* 88470 80097C70 00000000 */  nop
/* 88474 80097C74 01006390 */  lbu        $v1, 0x1($v1)
/* 88478 80097C78 00000000 */  nop
/* 8847C 80097C7C 03004310 */  beq        $v0, $v1, .L80097C8C
/* 88480 80097C80 00000000 */   nop
/* 88484 80097C84 21A02002 */  addu       $s4, $s1, $zero
/* 88488 80097C88 21980002 */  addu       $s3, $s0, $zero
.L80097C8C:
/* 8848C 80097C8C ECF5828F */  lw         $v0, %gp_rel(poolManagementData)($gp)
/* 88490 80097C90 00000000 */  nop
/* 88494 80097C94 01004290 */  lbu        $v0, 0x1($v0)
/* 88498 80097C98 01005226 */  addiu      $s2, $s2, 0x1
/* 8849C 80097C9C 2A104202 */  slt        $v0, $s2, $v0
/* 884A0 80097CA0 EAFF4014 */  bnez       $v0, .L80097C4C
/* 884A4 80097CA4 1C001026 */   addiu     $s0, $s0, 0x1C
.L80097CA8:
/* 884A8 80097CA8 21106002 */  addu       $v0, $s3, $zero
/* 884AC 80097CAC 2400BF8F */  lw         $ra, 0x24($sp)
/* 884B0 80097CB0 2000B48F */  lw         $s4, 0x20($sp)
/* 884B4 80097CB4 1C00B38F */  lw         $s3, 0x1C($sp)
/* 884B8 80097CB8 1800B28F */  lw         $s2, 0x18($sp)
/* 884BC 80097CBC 1400B18F */  lw         $s1, 0x14($sp)
/* 884C0 80097CC0 1000B08F */  lw         $s0, 0x10($sp)
/* 884C4 80097CC4 0800E003 */  jr         $ra
/* 884C8 80097CC8 2800BD27 */   addiu     $sp, $sp, 0x28
.size PLAN_FindNodeMostInNeedOfConnectivityExpansion, . - PLAN_FindNodeMostInNeedOfConnectivityExpansion
