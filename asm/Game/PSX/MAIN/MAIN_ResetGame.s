.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MAIN_ResetGame
/* 29884 80039084 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 29888 80039088 21200000 */  addu       $a0, $zero, $zero
/* 2988C 8003908C 21288000 */  addu       $a1, $a0, $zero
/* 29890 80039090 1000BFAF */  sw         $ra, 0x10($sp)
/* 29894 80039094 51B9000C */  jal        GAMELOOP_SetScreenWipe
/* 29898 80039098 FFFF0624 */   addiu     $a2, $zero, -0x1
/* 2989C 8003909C 08BF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x140)($gp)
/* 298A0 800390A0 7FFF0324 */  addiu      $v1, $zero, -0x81
/* 298A4 800390A4 24104300 */  and        $v0, $v0, $v1
/* 298A8 800390A8 EFFF0324 */  addiu      $v1, $zero, -0x11
/* 298AC 800390AC 24104300 */  and        $v0, $v0, $v1
/* 298B0 800390B0 FEFF0324 */  addiu      $v1, $zero, -0x2
/* 298B4 800390B4 24104300 */  and        $v0, $v0, $v1
/* 298B8 800390B8 08BF82AF */  sw         $v0, %gp_rel(gameTrackerX + 0x140)($gp)
/* 298BC 800390BC A09F020C */  jal        RAZIEL_StartNewGame
/* 298C0 800390C0 00000000 */   nop
/* 298C4 800390C4 1000BF8F */  lw         $ra, 0x10($sp)
/* 298C8 800390C8 00000000 */  nop
/* 298CC 800390CC 0800E003 */  jr         $ra
/* 298D0 800390D0 1800BD27 */   addiu     $sp, $sp, 0x18
.size MAIN_ResetGame, . - MAIN_ResetGame
