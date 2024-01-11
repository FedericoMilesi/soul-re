.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2EmulationQueryAnimation
/* 62EA4 800726A4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 62EA8 800726A8 1000BFAF */  sw         $ra, 0x10($sp)
/* 62EAC 800726AC 0000848C */  lw         $a0, 0x0($a0)
/* 62EB0 800726B0 A1C9010C */  jal        G2EmulationInstanceQueryAnimation
/* 62EB4 800726B4 00000000 */   nop
/* 62EB8 800726B8 1000BF8F */  lw         $ra, 0x10($sp)
/* 62EBC 800726BC 00000000 */  nop
/* 62EC0 800726C0 0800E003 */  jr         $ra
/* 62EC4 800726C4 1800BD27 */   addiu     $sp, $sp, 0x18
.size G2EmulationQueryAnimation, . - G2EmulationQueryAnimation
