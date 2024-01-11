.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WARPGATE_DrawWarpGateRim
/* 4FD44 8005F544 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 4FD48 8005F548 1000B0AF */  sw         $s0, 0x10($sp)
/* 4FD4C 8005F54C 2180A000 */  addu       $s0, $a1, $zero
/* 4FD50 8005F550 1400BFAF */  sw         $ra, 0x14($sp)
/* 4FD54 8005F554 1D7D010C */  jal        STREAM_GetBspTree
/* 4FD58 8005F558 03000524 */   addiu     $a1, $zero, 0x3
/* 4FD5C 8005F55C 21184000 */  addu       $v1, $v0, $zero
/* 4FD60 8005F560 0A006010 */  beqz       $v1, .L8005F58C
/* 4FD64 8005F564 00000000 */   nop
/* 4FD68 8005F568 12006294 */  lhu        $v0, 0x12($v1)
/* 4FD6C 8005F56C 00000000 */  nop
/* 4FD70 8005F570 FDFF4230 */  andi       $v0, $v0, 0xFFFD
/* 4FD74 8005F574 03000012 */  beqz       $s0, .L8005F584
/* 4FD78 8005F578 120062A4 */   sh        $v0, 0x12($v1)
/* 4FD7C 8005F57C 627D0108 */  j          .L8005F588
/* 4FD80 8005F580 FCFF4230 */   andi      $v0, $v0, 0xFFFC
.L8005F584:
/* 4FD84 8005F584 01004234 */  ori        $v0, $v0, 0x1
.L8005F588:
/* 4FD88 8005F588 120062A4 */  sh         $v0, 0x12($v1)
.L8005F58C:
/* 4FD8C 8005F58C 1400BF8F */  lw         $ra, 0x14($sp)
/* 4FD90 8005F590 1000B08F */  lw         $s0, 0x10($sp)
/* 4FD94 8005F594 0800E003 */  jr         $ra
/* 4FD98 8005F598 1800BD27 */   addiu     $sp, $sp, 0x18
.size WARPGATE_DrawWarpGateRim, . - WARPGATE_DrawWarpGateRim
