.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MAIN_DoMainMenu
/* 29B28 80039328 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 29B2C 8003932C 1000B0AF */  sw         $s0, 0x10($sp)
/* 29B30 80039330 21808000 */  addu       $s0, $a0, $zero
/* 29B34 80039334 00100224 */  addiu      $v0, $zero, 0x1000
/* 29B38 80039338 08C082AF */  sw         $v0, %gp_rel(gameTrackerX + 0x240)($gp)
/* 29B3C 8003933C A4BD8227 */  addiu      $v0, $gp, %gp_rel(clearRect)
/* 29B40 80039340 1800BFAF */  sw         $ra, 0x18($sp)
/* 29B44 80039344 1400B1AF */  sw         $s1, 0x14($sp)
/* 29B48 80039348 3000048E */  lw         $a0, 0x30($s0)
/* 29B4C 8003934C D401118E */  lw         $s1, 0x1D4($s0)
/* 29B50 80039350 00210400 */  sll        $a0, $a0, 4
/* 29B54 80039354 05EA020C */  jal        DrawPrim
/* 29B58 80039358 21208200 */   addu      $a0, $a0, $v0
/* 29B5C 8003935C 01C8000C */  jal        GAMEPAD_Process
/* 29B60 80039360 21200002 */   addu      $a0, $s0, $zero
/* 29B64 80039364 114D000C */  jal        DEBUG_Process
/* 29B68 80039368 21200002 */   addu      $a0, $s0, $zero
/* 29B6C 8003936C BC95848F */  lw         $a0, %gp_rel(mainMenuScreen)($gp)
/* 29B70 80039370 00000000 */  nop
/* 29B74 80039374 04008010 */  beqz       $a0, .L80039388
/* 29B78 80039378 00000000 */   nop
/* 29B7C 8003937C 3000058E */  lw         $a1, 0x30($s0)
/* 29B80 80039380 6DE1000C */  jal        screen_to_vram
/* 29B84 80039384 00000000 */   nop
.L80039388:
/* 29B88 80039388 56B9000C */  jal        GAMELOOP_HandleScreenWipes
/* 29B8C 8003938C 21202002 */   addu      $a0, $s1, $zero
/* 29B90 80039390 3DE5020C */  jal        MENUFACE_RefreshFaces
/* 29B94 80039394 00000000 */   nop
/* 29B98 80039398 18B6000C */  jal        FONT_Flush
/* 29B9C 8003939C 00000000 */   nop
/* 29BA0 800393A0 21200002 */  addu       $a0, $s0, $zero
/* 29BA4 800393A4 C4BD8297 */  lhu        $v0, %gp_rel(mainMenuTimeOut)($gp)
/* 29BA8 800393A8 00000000 */  nop
/* 29BAC 800393AC 01004224 */  addiu      $v0, $v0, 0x1
/* 29BB0 800393B0 C4BD82A7 */  sh         $v0, %gp_rel(mainMenuTimeOut)($gp)
/* 29BB4 800393B4 29BD000C */  jal        GAMELOOP_FlipScreenAndDraw
/* 29BB8 800393B8 21282002 */   addu      $a1, $s1, $zero
/* 29BBC 800393BC C6958287 */  lh         $v0, %gp_rel(mainMenuFading)($gp)
/* 29BC0 800393C0 00000000 */  nop
/* 29BC4 800393C4 07004010 */  beqz       $v0, .L800393E4
/* 29BC8 800393C8 FFFF0224 */   addiu     $v0, $zero, -0x1
/* 29BCC 800393CC CC000386 */  lh         $v1, 0xCC($s0)
/* 29BD0 800393D0 00000000 */  nop
/* 29BD4 800393D4 03006214 */  bne        $v1, $v0, .L800393E4
/* 29BD8 800393D8 00000000 */   nop
/* 29BDC 800393DC AFE4000C */  jal        MAIN_StartGame
/* 29BE0 800393E0 00000000 */   nop
.L800393E4:
/* 29BE4 800393E4 1800BF8F */  lw         $ra, 0x18($sp)
/* 29BE8 800393E8 1400B18F */  lw         $s1, 0x14($sp)
/* 29BEC 800393EC 1000B08F */  lw         $s0, 0x10($sp)
/* 29BF0 800393F0 21100000 */  addu       $v0, $zero, $zero
/* 29BF4 800393F4 0800E003 */  jr         $ra
/* 29BF8 800393F8 2000BD27 */   addiu     $sp, $sp, 0x20
.size MAIN_DoMainMenu, . - MAIN_DoMainMenu
