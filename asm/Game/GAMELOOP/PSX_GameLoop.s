.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PSX_GameLoop
/* 219D8 800311D8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 219DC 800311DC 1000B0AF */  sw         $s0, 0x10($sp)
/* 219E0 800311E0 1400BFAF */  sw         $ra, 0x14($sp)
/* 219E4 800311E4 01C8000C */  jal        GAMEPAD_Process
/* 219E8 800311E8 21808000 */   addu      $s0, $a0, $zero
/* 219EC 800311EC 72C1000C */  jal        GAMELOOP_Process
/* 219F0 800311F0 21200002 */   addu      $a0, $s0, $zero
/* 219F4 800311F4 1400BF8F */  lw         $ra, 0x14($sp)
/* 219F8 800311F8 1000B08F */  lw         $s0, 0x10($sp)
/* 219FC 800311FC 0800E003 */  jr         $ra
/* 21A00 80031200 1800BD27 */   addiu     $sp, $sp, 0x18
.size PSX_GameLoop, . - PSX_GameLoop
