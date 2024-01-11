.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GAMELOOP_SystemInit
/* 1E518 8002DD18 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 1E51C 8002DD1C 1000BFAF */  sw         $ra, 0x10($sp)
/* 1E520 8002DD20 CAB6000C */  jal        GAMELOOP_AllocStaticMemory
/* 1E524 8002DD24 00000000 */   nop
/* 1E528 8002DD28 20BA848F */  lw         $a0, %gp_rel(instanceList)($gp)
/* 1E52C 8002DD2C 24BA858F */  lw         $a1, %gp_rel(instancePool)($gp)
/* 1E530 8002DD30 70C9000C */  jal        INSTANCE_InitInstanceList
/* 1E534 8002DD34 00000000 */   nop
/* 1E538 8002DD38 06B7000C */  jal        GAMELOOP_InitGameTracker
/* 1E53C 8002DD3C 00000000 */   nop
/* 1E540 8002DD40 1000BF8F */  lw         $ra, 0x10($sp)
/* 1E544 8002DD44 00000000 */  nop
/* 1E548 8002DD48 0800E003 */  jr         $ra
/* 1E54C 8002DD4C 1800BD27 */   addiu     $sp, $sp, 0x18
.size GAMELOOP_SystemInit, . - GAMELOOP_SystemInit
