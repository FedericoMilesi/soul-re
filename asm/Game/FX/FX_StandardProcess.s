.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_StandardProcess
/* 33088 80042888 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 3308C 8004288C 1000BFAF */  sw         $ra, 0x10($sp)
/* 33090 80042890 E620010C */  jal        FX_StandardFXPrimProcess
/* 33094 80042894 00000000 */   nop
/* 33098 80042898 1000BF8F */  lw         $ra, 0x10($sp)
/* 3309C 8004289C 00000000 */  nop
/* 330A0 800428A0 0800E003 */  jr         $ra
/* 330A4 800428A4 1800BD27 */   addiu     $sp, $sp, 0x18
.size FX_StandardProcess, . - FX_StandardProcess
