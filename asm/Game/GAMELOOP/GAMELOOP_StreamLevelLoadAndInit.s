.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GAMELOOP_StreamLevelLoadAndInit
/* 1ED24 8002E524 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 1ED28 8002E528 1000BFAF */  sw         $ra, 0x10($sp)
/* 1ED2C 8002E52C F0B7000C */  jal        LoadLevels
/* 1ED30 8002E530 00000000 */   nop
/* 1ED34 8002E534 1000BF8F */  lw         $ra, 0x10($sp)
/* 1ED38 8002E538 00000000 */  nop
/* 1ED3C 8002E53C 0800E003 */  jr         $ra
/* 1ED40 8002E540 1800BD27 */   addiu     $sp, $sp, 0x18
.size GAMELOOP_StreamLevelLoadAndInit, . - GAMELOOP_StreamLevelLoadAndInit
