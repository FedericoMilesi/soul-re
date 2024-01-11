.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2EmulationQueryMode
/* 63044 80072844 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 63048 80072848 1000BFAF */  sw         $ra, 0x10($sp)
/* 6304C 8007284C 0000848C */  lw         $a0, 0x0($a0)
/* 63050 80072850 FFC9010C */  jal        G2EmulationInstanceQueryMode
/* 63054 80072854 00000000 */   nop
/* 63058 80072858 1000BF8F */  lw         $ra, 0x10($sp)
/* 6305C 8007285C 00000000 */  nop
/* 63060 80072860 0800E003 */  jr         $ra
/* 63064 80072864 1800BD27 */   addiu     $sp, $sp, 0x18
.size G2EmulationQueryMode, . - G2EmulationQueryMode
