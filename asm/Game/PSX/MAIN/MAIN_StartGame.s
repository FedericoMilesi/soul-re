.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MAIN_StartGame
/* 29ABC 800392BC C6958287 */  lh         $v0, %gp_rel(mainMenuFading)($gp)
/* 29AC0 800392C0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 29AC4 800392C4 0C004010 */  beqz       $v0, .L800392F8
/* 29AC8 800392C8 1000BFAF */   sw        $ra, 0x10($sp)
/* 29ACC 800392CC 02000224 */  addiu      $v0, $zero, 0x2
/* 29AD0 800392D0 38C082AF */  sw         $v0, %gp_rel(mainTrackerX)($gp)
/* 29AD4 800392D4 93E4000C */  jal        MAIN_FreeMainMenuStuff
/* 29AD8 800392D8 00000000 */   nop
/* 29ADC 800392DC 0D80023C */  lui        $v0, %hi(standardMenu)
/* 29AE0 800392E0 90804224 */  addiu      $v0, $v0, %lo(standardMenu)
/* 29AE4 800392E4 569480A7 */  sh         $zero, %gp_rel(gEndGameNow)($gp)
/* 29AE8 800392E8 C69580A7 */  sh         $zero, %gp_rel(mainMenuFading)($gp)
/* 29AEC 800392EC 0C8A82AF */  sw         $v0, %gp_rel(currentMenu)($gp)
/* 29AF0 800392F0 C6E40008 */  j          .L80039318
/* 29AF4 800392F4 00000000 */   nop
.L800392F8:
/* 29AF8 800392F8 01000224 */  addiu      $v0, $zero, 0x1
/* 29AFC 800392FC E2FF0424 */  addiu      $a0, $zero, -0x1E
/* 29B00 80039300 1E000524 */  addiu      $a1, $zero, 0x1E
/* 29B04 80039304 3ABF80A7 */  sh         $zero, %gp_rel(gameTrackerX + 0x172)($gp)
/* 29B08 80039308 0C8A80AF */  sw         $zero, %gp_rel(currentMenu)($gp)
/* 29B0C 8003930C C69582A7 */  sh         $v0, %gp_rel(mainMenuFading)($gp)
/* 29B10 80039310 51B9000C */  jal        GAMELOOP_SetScreenWipe
/* 29B14 80039314 0A000624 */   addiu     $a2, $zero, 0xA
.L80039318:
/* 29B18 80039318 1000BF8F */  lw         $ra, 0x10($sp)
/* 29B1C 8003931C 00000000 */  nop
/* 29B20 80039320 0800E003 */  jr         $ra
/* 29B24 80039324 1800BD27 */   addiu     $sp, $sp, 0x18
.size MAIN_StartGame, . - MAIN_StartGame
