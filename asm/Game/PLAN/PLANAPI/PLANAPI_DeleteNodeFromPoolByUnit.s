.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PLANAPI_DeleteNodeFromPoolByUnit
/* 888A0 800980A0 ECF5828F */  lw         $v0, %gp_rel(poolManagementData)($gp)
/* 888A4 800980A4 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 888A8 800980A8 1000B0AF */  sw         $s0, 0x10($sp)
/* 888AC 800980AC D8BF908F */  lw         $s0, %gp_rel(gameTrackerX + 0x210)($gp)
/* 888B0 800980B0 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 888B4 800980B4 21988000 */  addu       $s3, $a0, $zero
/* 888B8 800980B8 1400B1AF */  sw         $s1, 0x14($sp)
/* 888BC 800980BC 21880000 */  addu       $s1, $zero, $zero
/* 888C0 800980C0 2000BFAF */  sw         $ra, 0x20($sp)
/* 888C4 800980C4 1800B2AF */  sw         $s2, 0x18($sp)
/* 888C8 800980C8 01004290 */  lbu        $v0, 0x1($v0)
/* 888CC 800980CC 00000000 */  nop
/* 888D0 800980D0 12004010 */  beqz       $v0, .L8009811C
/* 888D4 800980D4 21900002 */   addu      $s2, $s0, $zero
.L800980D8:
/* 888D8 800980D8 1800028E */  lw         $v0, 0x18($s0)
/* 888DC 800980DC 00000000 */  nop
/* 888E0 800980E0 05005314 */  bne        $v0, $s3, .L800980F8
/* 888E4 800980E4 21200002 */   addu      $a0, $s0, $zero
/* 888E8 800980E8 EB66020C */  jal        PLANPOOL_DeleteNodeFromPool
/* 888EC 800980EC 21284002 */   addu      $a1, $s2, $zero
/* 888F0 800980F0 40600208 */  j          .L80098100
/* 888F4 800980F4 00000000 */   nop
.L800980F8:
/* 888F8 800980F8 01003126 */  addiu      $s1, $s1, 0x1
/* 888FC 800980FC 1C001026 */  addiu      $s0, $s0, 0x1C
.L80098100:
/* 88900 80098100 ECF5828F */  lw         $v0, %gp_rel(poolManagementData)($gp)
/* 88904 80098104 00000000 */  nop
/* 88908 80098108 01004290 */  lbu        $v0, 0x1($v0)
/* 8890C 8009810C 00000000 */  nop
/* 88910 80098110 2A102202 */  slt        $v0, $s1, $v0
/* 88914 80098114 F0FF4014 */  bnez       $v0, .L800980D8
/* 88918 80098118 00000000 */   nop
.L8009811C:
/* 8891C 8009811C 2000BF8F */  lw         $ra, 0x20($sp)
/* 88920 80098120 1C00B38F */  lw         $s3, 0x1C($sp)
/* 88924 80098124 1800B28F */  lw         $s2, 0x18($sp)
/* 88928 80098128 1400B18F */  lw         $s1, 0x14($sp)
/* 8892C 8009812C 1000B08F */  lw         $s0, 0x10($sp)
/* 88930 80098130 0800E003 */  jr         $ra
/* 88934 80098134 2800BD27 */   addiu     $sp, $sp, 0x28
.size PLANAPI_DeleteNodeFromPoolByUnit, . - PLANAPI_DeleteNodeFromPoolByUnit
