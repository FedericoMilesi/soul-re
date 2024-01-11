.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LIGHT_SetAmbientInstance
/* 26FD0 800367D0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 26FD4 800367D4 21108000 */  addu       $v0, $a0, $zero
/* 26FD8 800367D8 1000BFAF */  sw         $ra, 0x10($sp)
/* 26FDC 800367DC 94024490 */  lbu        $a0, 0x294($v0)
/* 26FE0 800367E0 95024590 */  lbu        $a1, 0x295($v0)
/* 26FE4 800367E4 96024690 */  lbu        $a2, 0x296($v0)
/* 26FE8 800367E8 ABF7020C */  jal        SetBackColor
/* 26FEC 800367EC 00000000 */   nop
/* 26FF0 800367F0 1000BF8F */  lw         $ra, 0x10($sp)
/* 26FF4 800367F4 00000000 */  nop
/* 26FF8 800367F8 0800E003 */  jr         $ra
/* 26FFC 800367FC 1800BD27 */   addiu     $sp, $sp, 0x18
.size LIGHT_SetAmbientInstance, . - LIGHT_SetAmbientInstance
