.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DEBUG_SetGameTime
/* 36B8 80012EB8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 36BC 80012EBC 1000BFAF */  sw         $ra, 0x10($sp)
/* 36C0 80012EC0 0000848C */  lw         $a0, 0x0($a0)
/* 36C4 80012EC4 99B7000C */  jal        GAMELOOP_SetGameTime
/* 36C8 80012EC8 00000000 */   nop
/* 36CC 80012ECC 1000BF8F */  lw         $ra, 0x10($sp)
/* 36D0 80012ED0 00000000 */  nop
/* 36D4 80012ED4 0800E003 */  jr         $ra
/* 36D8 80012ED8 1800BD27 */   addiu     $sp, $sp, 0x18
.size DEBUG_SetGameTime, . - DEBUG_SetGameTime
