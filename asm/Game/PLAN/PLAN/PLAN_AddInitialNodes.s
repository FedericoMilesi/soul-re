.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PLAN_AddInitialNodes
/* 8826C 80097A6C C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 88270 80097A70 3400B3AF */  sw         $s3, 0x34($sp)
/* 88274 80097A74 21988000 */  addu       $s3, $a0, $zero
/* 88278 80097A78 3000B2AF */  sw         $s2, 0x30($sp)
/* 8827C 80097A7C 2190A000 */  addu       $s2, $a1, $zero
/* 88280 80097A80 1800A427 */  addiu      $a0, $sp, 0x18
/* 88284 80097A84 21280000 */  addu       $a1, $zero, $zero
/* 88288 80097A88 00010624 */  addiu      $a2, $zero, 0x100
/* 8828C 80097A8C 2C00B1AF */  sw         $s1, 0x2C($sp)
/* 88290 80097A90 5C005126 */  addiu      $s1, $s2, 0x5C
/* 88294 80097A94 00FC0724 */  addiu      $a3, $zero, -0x400
/* 88298 80097A98 3800BFAF */  sw         $ra, 0x38($sp)
/* 8829C 80097A9C 2800B0AF */  sw         $s0, 0x28($sp)
/* 882A0 80097AA0 5C004296 */  lhu        $v0, 0x5C($s2)
/* 882A4 80097AA4 02002396 */  lhu        $v1, 0x2($s1)
/* 882A8 80097AA8 04002896 */  lhu        $t0, 0x4($s1)
/* 882AC 80097AAC 2000B027 */  addiu      $s0, $sp, 0x20
/* 882B0 80097AB0 2000A2A7 */  sh         $v0, 0x20($sp)
/* 882B4 80097AB4 020003A6 */  sh         $v1, 0x2($s0)
/* 882B8 80097AB8 040008A6 */  sh         $t0, 0x4($s0)
/* 882BC 80097ABC 1000A0AF */  sw         $zero, 0x10($sp)
/* 882C0 80097AC0 5463020C */  jal        PLANCOLL_FindTerrainHitFinal
/* 882C4 80097AC4 1400A0AF */   sw        $zero, 0x14($sp)
/* 882C8 80097AC8 21200002 */  addu       $a0, $s0, $zero
/* 882CC 80097ACC 21286002 */  addu       $a1, $s3, $zero
/* 882D0 80097AD0 01000624 */  addiu      $a2, $zero, 0x1
/* 882D4 80097AD4 3800428E */  lw         $v0, 0x38($s2)
/* 882D8 80097AD8 21380000 */  addu       $a3, $zero, $zero
/* 882DC 80097ADC AE66020C */  jal        PLANPOOL_AddNodeToPool
/* 882E0 80097AE0 1000A2AF */   sw        $v0, 0x10($sp)
/* 882E4 80097AE4 21206002 */  addu       $a0, $s3, $zero
/* 882E8 80097AE8 D95C020C */  jal        PLAN_UpdatePlanMkrNodes
/* 882EC 80097AEC 21282002 */   addu      $a1, $s1, $zero
/* 882F0 80097AF0 ECF5828F */  lw         $v0, %gp_rel(poolManagementData)($gp)
/* 882F4 80097AF4 5F00498A */  lwl        $t1, 0x5F($s2)
/* 882F8 80097AF8 5C00499A */  lwr        $t1, 0x5C($s2)
/* 882FC 80097AFC 60004A86 */  lh         $t2, 0x60($s2)
/* 88300 80097B00 050049A8 */  swl        $t1, 0x5($v0)
/* 88304 80097B04 020049B8 */  swr        $t1, 0x2($v0)
/* 88308 80097B08 06004AA4 */  sh         $t2, 0x6($v0)
/* 8830C 80097B0C 3800BF8F */  lw         $ra, 0x38($sp)
/* 88310 80097B10 3400B38F */  lw         $s3, 0x34($sp)
/* 88314 80097B14 3000B28F */  lw         $s2, 0x30($sp)
/* 88318 80097B18 2C00B18F */  lw         $s1, 0x2C($sp)
/* 8831C 80097B1C 2800B08F */  lw         $s0, 0x28($sp)
/* 88320 80097B20 0800E003 */  jr         $ra
/* 88324 80097B24 4000BD27 */   addiu     $sp, $sp, 0x40
.size PLAN_AddInitialNodes, . - PLAN_AddInitialNodes
