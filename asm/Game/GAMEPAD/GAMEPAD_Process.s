.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GAMEPAD_Process
/* 22804 80032004 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 22808 80032008 1000B0AF */  sw         $s0, 0x10($sp)
/* 2280C 8003200C 21808000 */  addu       $s0, $a0, $zero
/* 22810 80032010 1400B1AF */  sw         $s1, 0x14($sp)
/* 22814 80032014 70001126 */  addiu      $s1, $s0, 0x70
/* 22818 80032018 1800BFAF */  sw         $ra, 0x18($sp)
/* 2281C 8003201C DAC6000C */  jal        GAMEPAD_GetData
/* 22820 80032020 21202002 */   addu      $a0, $s1, $zero
/* 22824 80032024 48001026 */  addiu      $s0, $s0, 0x48
/* 22828 80032028 21200002 */  addu       $a0, $s0, $zero
/* 2282C 8003202C 21282002 */  addu       $a1, $s1, $zero
/* 22830 80032030 91C4000C */  jal        GAMEPAD_Commands
/* 22834 80032034 21300000 */   addu      $a2, $zero, $zero
/* 22838 80032038 21200002 */  addu       $a0, $s0, $zero
/* 2283C 8003203C 21282002 */  addu       $a1, $s1, $zero
/* 22840 80032040 91C4000C */  jal        GAMEPAD_Commands
/* 22844 80032044 01000624 */   addiu     $a2, $zero, 0x1
/* 22848 80032048 1800BF8F */  lw         $ra, 0x18($sp)
/* 2284C 8003204C 1400B18F */  lw         $s1, 0x14($sp)
/* 22850 80032050 1000B08F */  lw         $s0, 0x10($sp)
/* 22854 80032054 0800E003 */  jr         $ra
/* 22858 80032058 2000BD27 */   addiu     $sp, $sp, 0x20
.size GAMEPAD_Process, . - GAMEPAD_Process
