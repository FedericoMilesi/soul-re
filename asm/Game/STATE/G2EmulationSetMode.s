.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2EmulationSetMode
/* 62E44 80072644 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 62E48 80072648 1000BFAF */  sw         $ra, 0x10($sp)
/* 62E4C 8007264C 0000848C */  lw         $a0, 0x0($a0)
/* 62E50 80072650 71C9010C */  jal        G2EmulationInstanceSetMode
/* 62E54 80072654 00000000 */   nop
/* 62E58 80072658 1000BF8F */  lw         $ra, 0x10($sp)
/* 62E5C 8007265C 00000000 */  nop
/* 62E60 80072660 0800E003 */  jr         $ra
/* 62E64 80072664 1800BD27 */   addiu     $sp, $sp, 0x18
.size G2EmulationSetMode, . - G2EmulationSetMode
