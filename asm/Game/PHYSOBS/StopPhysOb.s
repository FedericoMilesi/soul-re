.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StopPhysOb
/* 5B76C 8006AF6C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 5B770 8006AF70 1400BFAF */  sw         $ra, 0x14($sp)
/* 5B774 8006AF74 1000B0AF */  sw         $s0, 0x10($sp)
/* 5B778 8006AF78 6C01908C */  lw         $s0, 0x16C($a0)
/* 5B77C 8006AF7C 01000224 */  addiu      $v0, $zero, 0x1
/* 5B780 8006AF80 240000A6 */  sh         $zero, 0x24($s0)
/* 5B784 8006AF84 260000A6 */  sh         $zero, 0x26($s0)
/* 5B788 8006AF88 A9A7010C */  jal        ResetOrientation
/* 5B78C 8006AF8C 1A0002A6 */   sh        $v0, 0x1A($s0)
/* 5B790 8006AF90 01000224 */  addiu      $v0, $zero, 0x1
/* 5B794 8006AF94 000002AE */  sw         $v0, 0x0($s0)
/* 5B798 8006AF98 1400BF8F */  lw         $ra, 0x14($sp)
/* 5B79C 8006AF9C 1000B08F */  lw         $s0, 0x10($sp)
/* 5B7A0 8006AFA0 0800E003 */  jr         $ra
/* 5B7A4 8006AFA4 1800BD27 */   addiu     $sp, $sp, 0x18
.size StopPhysOb, . - StopPhysOb
