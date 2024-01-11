.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GAMELOOP_ModeStartPause
/* 214D4 80030CD4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 214D8 80030CD8 1000053C */  lui        $a1, (0x10000A >> 16)
/* 214DC 80030CDC 0A00A534 */  ori        $a1, $a1, (0x10000A & 0xFFFF)
/* 214E0 80030CE0 06000224 */  addiu      $v0, $zero, 0x6
/* 214E4 80030CE4 F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 214E8 80030CE8 1000BFAF */  sw         $ra, 0x10($sp)
/* 214EC 80030CEC 3ABF82A7 */  sh         $v0, %gp_rel(gameTrackerX + 0x172)($gp)
/* 214F0 80030CF0 A1D1000C */  jal        INSTANCE_Post
/* 214F4 80030CF4 01000624 */   addiu     $a2, $zero, 0x1
/* 214F8 80030CF8 0C80053C */  lui        $a1, %hi(menudefs_pause_menu)
/* 214FC 80030CFC 0D80023C */  lui        $v0, %hi(pauseMenu)
/* 21500 80030D00 E8BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x20)($gp)
/* 21504 80030D04 F09E4224 */  addiu      $v0, $v0, %lo(pauseMenu)
/* 21508 80030D08 0C8A82AF */  sw         $v0, %gp_rel(currentMenu)($gp)
/* 2150C 80030D0C E5DD020C */  jal        menu_set
/* 21510 80030D10 6C90A524 */   addiu     $a1, $a1, %lo(menudefs_pause_menu)
/* 21514 80030D14 9101010C */  jal        SOUND_PauseAllSound
/* 21518 80030D18 00000000 */   nop
/* 2151C 80030D1C 6FDC020C */  jal        VOICEXA_Pause
/* 21520 80030D20 00000000 */   nop
/* 21524 80030D24 0E02010C */  jal        SndPlay
/* 21528 80030D28 05000424 */   addiu     $a0, $zero, 0x5
/* 2152C 80030D2C 08BF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x140)($gp)
/* 21530 80030D30 0010033C */  lui        $v1, (0x10000000 >> 16)
/* 21534 80030D34 25104300 */  or         $v0, $v0, $v1
/* 21538 80030D38 08BF82AF */  sw         $v0, %gp_rel(gameTrackerX + 0x140)($gp)
/* 2153C 80030D3C 17C8000C */  jal        GAMEPAD_SaveControllers
/* 21540 80030D40 00000000 */   nop
/* 21544 80030D44 0008033C */  lui        $v1, (0x8000000 >> 16)
/* 21548 80030D48 08BF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x140)($gp)
/* 2154C 80030D4C 08BE848F */  lw         $a0, %gp_rel(gameTrackerX + 0x40)($gp)
/* 21550 80030D50 14BA858F */  lw         $a1, %gp_rel(primPool)($gp)
/* 21554 80030D54 25104300 */  or         $v0, $v0, $v1
/* 21558 80030D58 08BF82AF */  sw         $v0, %gp_rel(gameTrackerX + 0x140)($gp)
/* 2155C 80030D5C 06008514 */  bne        $a0, $a1, .L80030D78
/* 21560 80030D60 00000000 */   nop
/* 21564 80030D64 18BA828F */  lw         $v0, %gp_rel(primPool + 0x4)($gp)
/* 21568 80030D68 00000000 */  nop
/* 2156C 80030D6C 08BE82AF */  sw         $v0, %gp_rel(gameTrackerX + 0x40)($gp)
/* 21570 80030D70 5FC30008 */  j          .L80030D7C
/* 21574 80030D74 00000000 */   nop
.L80030D78:
/* 21578 80030D78 08BE85AF */  sw         $a1, %gp_rel(gameTrackerX + 0x40)($gp)
.L80030D7C:
/* 2157C 80030D7C 08BE838F */  lw         $v1, %gp_rel(gameTrackerX + 0x40)($gp)
/* 21580 80030D80 00000000 */  nop
/* 21584 80030D84 0C006224 */  addiu      $v0, $v1, 0xC
/* 21588 80030D88 040062AC */  sw         $v0, 0x4($v1)
/* 2158C 80030D8C 08BE828F */  lw         $v0, %gp_rel(gameTrackerX + 0x40)($gp)
/* 21590 80030D90 72C0000C */  jal        SaveOT
/* 21594 80030D94 000040AC */   sw        $zero, 0x0($v0)
/* 21598 80030D98 1000BF8F */  lw         $ra, 0x10($sp)
/* 2159C 80030D9C 01000224 */  addiu      $v0, $zero, 0x1
/* 215A0 80030DA0 3CBA82A7 */  sh         $v0, %gp_rel(pause_redraw_flag)($gp)
/* 215A4 80030DA4 0800E003 */  jr         $ra
/* 215A8 80030DA8 1800BD27 */   addiu     $sp, $sp, 0x18
.size GAMELOOP_ModeStartPause, . - GAMELOOP_ModeStartPause
