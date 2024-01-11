.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PLANAPI_FindPathBetweenNodes
/* 88580 80097D80 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 88584 80097D84 21108000 */  addu       $v0, $a0, $zero
/* 88588 80097D88 1400B1AF */  sw         $s1, 0x14($sp)
/* 8858C 80097D8C D8BF918F */  lw         $s1, %gp_rel(gameTrackerX + 0x210)($gp)
/* 88590 80097D90 2118A000 */  addu       $v1, $a1, $zero
/* 88594 80097D94 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 88598 80097D98 2198C000 */  addu       $s3, $a2, $zero
/* 8859C 80097D9C 1800B2AF */  sw         $s2, 0x18($sp)
/* 885A0 80097DA0 21900000 */  addu       $s2, $zero, $zero
/* 885A4 80097DA4 2000BFAF */  sw         $ra, 0x20($sp)
/* 885A8 80097DA8 0F004010 */  beqz       $v0, .L80097DE8
/* 885AC 80097DAC 1000B0AF */   sw        $s0, 0x10($sp)
/* 885B0 80097DB0 0D006010 */  beqz       $v1, .L80097DE8
/* 885B4 80097DB4 21202002 */   addu      $a0, $s1, $zero
/* 885B8 80097DB8 21284000 */  addu       $a1, $v0, $zero
/* 885BC 80097DBC 0068020C */  jal        PLANSRCH_FindPathInGraph
/* 885C0 80097DC0 21306000 */   addu      $a2, $v1, $zero
/* 885C4 80097DC4 21804000 */  addu       $s0, $v0, $zero
/* 885C8 80097DC8 07000012 */  beqz       $s0, .L80097DE8
/* 885CC 80097DCC 21200002 */   addu      $a0, $s0, $zero
/* 885D0 80097DD0 21286002 */  addu       $a1, $s3, $zero
/* 885D4 80097DD4 335F020C */  jal        PLANAPI_ConvertPlanIntoEnmyPlanDataFormat
/* 885D8 80097DD8 21302002 */   addu      $a2, $s1, $zero
/* 885DC 80097DDC 18000296 */  lhu        $v0, 0x18($s0)
/* 885E0 80097DE0 01001224 */  addiu      $s2, $zero, 0x1
/* 885E4 80097DE4 400062A6 */  sh         $v0, 0x40($s3)
.L80097DE8:
/* 885E8 80097DE8 21104002 */  addu       $v0, $s2, $zero
/* 885EC 80097DEC 2000BF8F */  lw         $ra, 0x20($sp)
/* 885F0 80097DF0 1C00B38F */  lw         $s3, 0x1C($sp)
/* 885F4 80097DF4 1800B28F */  lw         $s2, 0x18($sp)
/* 885F8 80097DF8 1400B18F */  lw         $s1, 0x14($sp)
/* 885FC 80097DFC 1000B08F */  lw         $s0, 0x10($sp)
/* 88600 80097E00 0800E003 */  jr         $ra
/* 88604 80097E04 2800BD27 */   addiu     $sp, $sp, 0x28
.size PLANAPI_FindPathBetweenNodes, . - PLANAPI_FindPathBetweenNodes
