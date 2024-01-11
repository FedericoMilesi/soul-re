.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FONT_Print2
/* 1DF9C 8002D79C 0000A4AF */  sw         $a0, 0x0($sp)
/* 1DFA0 8002D7A0 0400A5AF */  sw         $a1, 0x4($sp)
/* 1DFA4 8002D7A4 0800A6AF */  sw         $a2, 0x8($sp)
/* 1DFA8 8002D7A8 0C00A7AF */  sw         $a3, 0xC($sp)
/* 1DFAC 8002D7AC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 1DFB0 8002D7B0 21288000 */  addu       $a1, $a0, $zero
/* 1DFB4 8002D7B4 1800A4AF */  sw         $a0, 0x18($sp)
/* 1DFB8 8002D7B8 E4B18427 */  addiu      $a0, $gp, %gp_rel(fp_str)
/* 1DFBC 8002D7BC 1000B0AF */  sw         $s0, 0x10($sp)
/* 1DFC0 8002D7C0 1C00B027 */  addiu      $s0, $sp, 0x1C
/* 1DFC4 8002D7C4 1400BFAF */  sw         $ra, 0x14($sp)
/* 1DFC8 8002D7C8 26D1010C */  jal        vsprintf
/* 1DFCC 8002D7CC 21300002 */   addu      $a2, $s0, $zero
/* 1DFD0 8002D7D0 E4B18427 */  addiu      $a0, $gp, %gp_rel(fp_str)
/* 1DFD4 8002D7D4 44B6000C */  jal        FONT_VaReallyPrint
/* 1DFD8 8002D7D8 21280002 */   addu      $a1, $s0, $zero
/* 1DFDC 8002D7DC 1400BF8F */  lw         $ra, 0x14($sp)
/* 1DFE0 8002D7E0 1000B08F */  lw         $s0, 0x10($sp)
/* 1DFE4 8002D7E4 0800E003 */  jr         $ra
/* 1DFE8 8002D7E8 1800BD27 */   addiu     $sp, $sp, 0x18
.size FONT_Print2, . - FONT_Print2
