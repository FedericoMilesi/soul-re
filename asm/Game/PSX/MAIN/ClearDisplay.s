.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ClearDisplay
/* 28CF8 800384F8 CCBD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x4)($gp)
/* 28CFC 800384FC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 28D00 80038500 1000BFAF */  sw         $ra, 0x10($sp)
/* 28D04 80038504 40200200 */  sll        $a0, $v0, 1
/* 28D08 80038508 21208200 */  addu       $a0, $a0, $v0
/* 28D0C 8003850C C0200400 */  sll        $a0, $a0, 3
/* 28D10 80038510 23208200 */  subu       $a0, $a0, $v0
/* 28D14 80038514 80200400 */  sll        $a0, $a0, 2
/* 28D18 80038518 88BC8227 */  addiu      $v0, $gp, %gp_rel(draw)
/* 28D1C 8003851C 38EA020C */  jal        PutDrawEnv
/* 28D20 80038520 21208200 */   addu      $a0, $a0, $v0
/* 28D24 80038524 CCBD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x4)($gp)
/* 28D28 80038528 A4BD8327 */  addiu      $v1, $gp, %gp_rel(clearRect)
/* 28D2C 8003852C 00110200 */  sll        $v0, $v0, 4
/* 28D30 80038530 21104300 */  addu       $v0, $v0, $v1
/* 28D34 80038534 040040A0 */  sb         $zero, 0x4($v0)
/* 28D38 80038538 CCBD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x4)($gp)
/* 28D3C 8003853C 00000000 */  nop
/* 28D40 80038540 00110200 */  sll        $v0, $v0, 4
/* 28D44 80038544 21104300 */  addu       $v0, $v0, $v1
/* 28D48 80038548 050040A0 */  sb         $zero, 0x5($v0)
/* 28D4C 8003854C CCBD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x4)($gp)
/* 28D50 80038550 00000000 */  nop
/* 28D54 80038554 00110200 */  sll        $v0, $v0, 4
/* 28D58 80038558 21104300 */  addu       $v0, $v0, $v1
/* 28D5C 8003855C 060040A0 */  sb         $zero, 0x6($v0)
/* 28D60 80038560 CCBD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x4)($gp)
/* 28D64 80038564 00000000 */  nop
/* 28D68 80038568 00210400 */  sll        $a0, $a0, 4
/* 28D6C 8003856C 05EA020C */  jal        DrawPrim
/* 28D70 80038570 21208300 */   addu      $a0, $a0, $v1
/* 28D74 80038574 0FE9020C */  jal        DrawSync
/* 28D78 80038578 21200000 */   addu      $a0, $zero, $zero
/* 28D7C 8003857C CCBD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x4)($gp)
/* 28D80 80038580 00000000 */  nop
/* 28D84 80038584 80200200 */  sll        $a0, $v0, 2
/* 28D88 80038588 21208200 */  addu       $a0, $a0, $v0
/* 28D8C 8003858C 80200400 */  sll        $a0, $a0, 2
/* 28D90 80038590 5CBC8227 */  addiu      $v0, $gp, %gp_rel(disp)
/* 28D94 80038594 68EA020C */  jal        PutDispEnv
/* 28D98 80038598 21208200 */   addu      $a0, $a0, $v0
/* 28D9C 8003859C E9E8020C */  jal        SetDispMask
/* 28DA0 800385A0 01000424 */   addiu     $a0, $zero, 0x1
/* 28DA4 800385A4 1000BF8F */  lw         $ra, 0x10($sp)
/* 28DA8 800385A8 00000000 */  nop
/* 28DAC 800385AC 0800E003 */  jr         $ra
/* 28DB0 800385B0 1800BD27 */   addiu     $sp, $sp, 0x18
.size ClearDisplay, . - ClearDisplay
