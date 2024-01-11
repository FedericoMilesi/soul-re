.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ENMYPLAN_InitEnemyPlanPool
/* 86EE4 800966E4 09000224 */  addiu      $v0, $zero, 0x9
/* 86EE8 800966E8 4E038424 */  addiu      $a0, $a0, 0x34E
.L800966EC:
/* 86EEC 800966EC 000080A0 */  sb         $zero, 0x0($a0)
/* 86EF0 800966F0 FFFF4224 */  addiu      $v0, $v0, -0x1
/* 86EF4 800966F4 FDFF4104 */  bgez       $v0, .L800966EC
/* 86EF8 800966F8 A2FF8424 */   addiu     $a0, $a0, -0x5E
/* 86EFC 800966FC 0800E003 */  jr         $ra
/* 86F00 80096700 00000000 */   nop
.size ENMYPLAN_InitEnemyPlanPool, . - ENMYPLAN_InitEnemyPlanPool
