.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SBSP_IntroduceInstancesAndLights
/* 2E798 8003DF98 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 2E79C 8003DF9C 1000BFAF */  sw         $ra, 0x10($sp)
/* 2E7A0 8003DFA0 CDF7000C */  jal        SBSP_IntroduceInstances
/* 2E7A4 8003DFA4 2128E000 */   addu      $a1, $a3, $zero
/* 2E7A8 8003DFA8 1000BF8F */  lw         $ra, 0x10($sp)
/* 2E7AC 8003DFAC 00000000 */  nop
/* 2E7B0 8003DFB0 0800E003 */  jr         $ra
/* 2E7B4 8003DFB4 1800BD27 */   addiu     $sp, $sp, 0x18
.size SBSP_IntroduceInstancesAndLights, . - SBSP_IntroduceInstancesAndLights
