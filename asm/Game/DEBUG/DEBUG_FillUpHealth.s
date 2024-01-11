.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DEBUG_FillUpHealth
/* 37D4 80012FD4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 37D8 80012FD8 1000BFAF */  sw         $ra, 0x10($sp)
/* 37DC 80012FDC B493020C */  jal        RAZIEL_DebugHealthFillUp
/* 37E0 80012FE0 00000000 */   nop
/* 37E4 80012FE4 CC93020C */  jal        RAZIEL_DebugManaFillUp
/* 37E8 80012FE8 00000000 */   nop
/* 37EC 80012FEC 1000BF8F */  lw         $ra, 0x10($sp)
/* 37F0 80012FF0 00000000 */  nop
/* 37F4 80012FF4 0800E003 */  jr         $ra
/* 37F8 80012FF8 1800BD27 */   addiu     $sp, $sp, 0x18
.size DEBUG_FillUpHealth, . - DEBUG_FillUpHealth
