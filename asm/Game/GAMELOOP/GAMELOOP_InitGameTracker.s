.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GAMELOOP_InitGameTracker
/* 1E418 8002DC18 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 1E41C 8002DC1C 0100033C */  lui        $v1, (0x176DC >> 16)
/* 1E420 8002DC20 14BA848F */  lw         $a0, %gp_rel(primPool)($gp)
/* 1E424 8002DC24 28BA858F */  lw         $a1, %gp_rel(gVertexPool)($gp)
/* 1E428 8002DC28 34BA868F */  lw         $a2, %gp_rel(planningPool)($gp)
/* 1E42C 8002DC2C 30BA878F */  lw         $a3, %gp_rel(enemyPlanPool)($gp)
/* 1E430 8002DC30 38BA888F */  lw         $t0, %gp_rel(GlobalObjects)($gp)
/* 1E434 8002DC34 DC766334 */  ori        $v1, $v1, (0x176DC & 0xFFFF)
/* 1E438 8002DC38 1000BFAF */  sw         $ra, 0x10($sp)
/* 1E43C 8002DC3C 21108300 */  addu       $v0, $a0, $v1
/* 1E440 8002DC40 080082AC */  sw         $v0, 0x8($a0)
/* 1E444 8002DC44 18BA828F */  lw         $v0, %gp_rel(primPool + 0x4)($gp)
/* 1E448 8002DC48 20BA898F */  lw         $t1, %gp_rel(instanceList)($gp)
/* 1E44C 8002DC4C 21184300 */  addu       $v1, $v0, $v1
/* 1E450 8002DC50 080043AC */  sw         $v1, 0x8($v0)
/* 1E454 8002DC54 14BA838F */  lw         $v1, %gp_rel(primPool)($gp)
/* 1E458 8002DC58 2CBA8A8F */  lw         $t2, %gp_rel(gLightInfo)($gp)
/* 1E45C 8002DC5C 0C006224 */  addiu      $v0, $v1, 0xC
/* 1E460 8002DC60 040062AC */  sw         $v0, 0x4($v1)
/* 1E464 8002DC64 18BA838F */  lw         $v1, %gp_rel(primPool + 0x4)($gp)
/* 1E468 8002DC68 24BA848F */  lw         $a0, %gp_rel(instancePool)($gp)
/* 1E46C 8002DC6C 0C006224 */  addiu      $v0, $v1, 0xC
/* 1E470 8002DC70 040062AC */  sw         $v0, 0x4($v1)
/* 1E474 8002DC74 14BA838F */  lw         $v1, %gp_rel(primPool)($gp)
/* 1E478 8002DC78 21600000 */  addu       $t4, $zero, $zero
/* 1E47C 8002DC7C 00BE84AF */  sw         $a0, %gp_rel(gameTrackerX + 0x38)($gp)
/* 1E480 8002DC80 0CBA848F */  lw         $a0, %gp_rel(gOt)($gp)
/* 1E484 8002DC84 21588001 */  addu       $t3, $t4, $zero
/* 1E488 8002DC88 04BE85AF */  sw         $a1, %gp_rel(gameTrackerX + 0x3C)($gp)
/* 1E48C 8002DC8C 10BA858F */  lw         $a1, %gp_rel(gOt + 0x4)($gp)
/* 1E490 8002DC90 0A000224 */  addiu      $v0, $zero, 0xA
/* 1E494 8002DC94 E8BF82AF */  sw         $v0, %gp_rel(gameTrackerX + 0x220)($gp)
/* 1E498 8002DC98 00100224 */  addiu      $v0, $zero, 0x1000
/* 1E49C 8002DC9C EEBF82A7 */  sh         $v0, %gp_rel(gameTrackerX + 0x226)($gp)
/* 1E4A0 8002DCA0 01000224 */  addiu      $v0, $zero, 0x1
/* 1E4A4 8002DCA4 D8BF86AF */  sw         $a2, %gp_rel(gameTrackerX + 0x210)($gp)
/* 1E4A8 8002DCA8 DCBF87AF */  sw         $a3, %gp_rel(gameTrackerX + 0x214)($gp)
/* 1E4AC 8002DCAC 0CBE88AF */  sw         $t0, %gp_rel(gameTrackerX + 0x44)($gp)
/* 1E4B0 8002DCB0 FCBD89AF */  sw         $t1, %gp_rel(gameTrackerX + 0x34)($gp)
/* 1E4B4 8002DCB4 DCBE8AAF */  sw         $t2, %gp_rel(gameTrackerX + 0x114)($gp)
/* 1E4B8 8002DCB8 ECBF80A7 */  sh         $zero, %gp_rel(gameTrackerX + 0x224)($gp)
/* 1E4BC 8002DCBC E4BF82AF */  sw         $v0, %gp_rel(gameTrackerX + 0x21C)($gp)
/* 1E4C0 8002DCC0 30C082AF */  sw         $v0, %gp_rel(gameTrackerX + 0x268)($gp)
/* 1E4C4 8002DCC4 08BE83AF */  sw         $v1, %gp_rel(gameTrackerX + 0x40)($gp)
/* 1E4C8 8002DCC8 9CBF84AF */  sw         $a0, %gp_rel(gameTrackerX + 0x1D4)($gp)
/* 1E4CC 8002DCCC A0BF85AF */  sw         $a1, %gp_rel(gameTrackerX + 0x1D8)($gp)
/* 1E4D0 8002DCD0 34C082A7 */  sh         $v0, %gp_rel(gameTrackerX + 0x26C)($gp)
.L8002DCD4:
/* 1E4D4 8002DCD4 0CBE828F */  lw         $v0, %gp_rel(gameTrackerX + 0x44)($gp)
/* 1E4D8 8002DCD8 01008C25 */  addiu      $t4, $t4, 0x1
/* 1E4DC 8002DCDC 21106201 */  addu       $v0, $t3, $v0
/* 1E4E0 8002DCE0 140040A4 */  sh         $zero, 0x14($v0)
/* 1E4E4 8002DCE4 30008229 */  slti       $v0, $t4, 0x30
/* 1E4E8 8002DCE8 FAFF4014 */  bnez       $v0, .L8002DCD4
/* 1E4EC 8002DCEC 24006B25 */   addiu     $t3, $t3, 0x24
/* 1E4F0 8002DCF0 E8030224 */  addiu      $v0, $zero, 0x3E8
/* 1E4F4 8002DCF4 D0BD82A7 */  sh         $v0, %gp_rel(gameTrackerX + 0x8)($gp)
/* 1E4F8 8002DCF8 F5F8000C */  jal        OBTABLE_ClearObjectReferences
/* 1E4FC 8002DCFC 00000000 */   nop
/* 1E500 8002DD00 9284010C */  jal        EVENT_Init
/* 1E504 8002DD04 00000000 */   nop
/* 1E508 8002DD08 1000BF8F */  lw         $ra, 0x10($sp)
/* 1E50C 8002DD0C 00000000 */  nop
/* 1E510 8002DD10 0800E003 */  jr         $ra
/* 1E514 8002DD14 1800BD27 */   addiu     $sp, $sp, 0x18
.size GAMELOOP_InitGameTracker, . - GAMELOOP_InitGameTracker
