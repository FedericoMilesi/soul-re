.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DEBUG_KeepGameTime
/* 36DC 80012EDC E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 36E0 80012EE0 E2BF8287 */  lh         $v0, %gp_rel(gameTrackerX + 0x21A)($gp)
/* 36E4 80012EE4 1000A427 */  addiu      $a0, $sp, 0x10
/* 36E8 80012EE8 1800BFAF */  sw         $ra, 0x18($sp)
/* 36EC 80012EEC AE4B000C */  jal        DEBUG_SetGameTime
/* 36F0 80012EF0 1000A2AF */   sw        $v0, 0x10($sp)
/* 36F4 80012EF4 1800BF8F */  lw         $ra, 0x18($sp)
/* 36F8 80012EF8 00000000 */  nop
/* 36FC 80012EFC 0800E003 */  jr         $ra
/* 3700 80012F00 2000BD27 */   addiu     $sp, $sp, 0x20
.size DEBUG_KeepGameTime, . - DEBUG_KeepGameTime
