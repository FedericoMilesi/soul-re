.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GAMELOOP_FlipScreenAndDraw
/* 1FCA4 8002F4A4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 1FCA8 8002F4A8 1000B0AF */  sw         $s0, 0x10($sp)
/* 1FCAC 8002F4AC 21808000 */  addu       $s0, $a0, $zero
/* 1FCB0 8002F4B0 1400BFAF */  sw         $ra, 0x14($sp)
/* 1FCB4 8002F4B4 1CEA020C */  jal        DrawOTag
/* 1FCB8 8002F4B8 FC2FA424 */   addiu     $a0, $a1, 0x2FFC
.L8002F4BC:
/* 1FCBC 8002F4BC 1C01048E */  lw         $a0, 0x11C($s0)
/* 1FCC0 8002F4C0 8494000C */  jal        CheckVolatile
/* 1FCC4 8002F4C4 00000000 */   nop
/* 1FCC8 8002F4C8 FCFF4014 */  bnez       $v0, .L8002F4BC
/* 1FCCC 8002F4CC 00000000 */   nop
/* 1FCD0 8002F4D0 24C0000C */  jal        ResetPrimPool
/* 1FCD4 8002F4D4 00000000 */   nop
/* 1FCD8 8002F4D8 3000028E */  lw         $v0, 0x30($s0)
/* 1FCDC 8002F4DC 00000000 */  nop
/* 1FCE0 8002F4E0 40200200 */  sll        $a0, $v0, 1
/* 1FCE4 8002F4E4 21208200 */  addu       $a0, $a0, $v0
/* 1FCE8 8002F4E8 C0200400 */  sll        $a0, $a0, 3
/* 1FCEC 8002F4EC 23208200 */  subu       $a0, $a0, $v0
/* 1FCF0 8002F4F0 80200400 */  sll        $a0, $a0, 2
/* 1FCF4 8002F4F4 88BC8227 */  addiu      $v0, $gp, %gp_rel(draw)
/* 1FCF8 8002F4F8 38EA020C */  jal        PutDrawEnv
/* 1FCFC 8002F4FC 21208200 */   addu      $a0, $a0, $v0
.L8002F500:
/* 1FD00 8002F500 1801048E */  lw         $a0, 0x118($s0)
/* 1FD04 8002F504 8494000C */  jal        CheckVolatile
/* 1FD08 8002F508 00000000 */   nop
/* 1FD0C 8002F50C FCFF4014 */  bnez       $v0, .L8002F500
/* 1FD10 8002F510 00000000 */   nop
/* 1FD14 8002F514 EBF4020C */  jal        GetRCnt
/* 1FD18 8002F518 00F2043C */   lui       $a0, (0xF2000000 >> 16)
/* 1FD1C 8002F51C 28020326 */  addiu      $v1, $s0, 0x228
/* 1FD20 8002F520 1C0103AE */  sw         $v1, 0x11C($s0)
/* 1FD24 8002F524 5890838F */  lw         $v1, %gp_rel(gameTimer)($gp)
/* 1FD28 8002F528 FFFF4230 */  andi       $v0, $v0, 0xFFFF
/* 1FD2C 8002F52C 001C0300 */  sll        $v1, $v1, 16
/* 1FD30 8002F530 25104300 */  or         $v0, $v0, $v1
/* 1FD34 8002F534 0400038E */  lw         $v1, 0x4($s0)
/* 1FD38 8002F538 200102AE */  sw         $v0, 0x120($s0)
/* 1FD3C 8002F53C 01000224 */  addiu      $v0, $zero, 0x1
/* 1FD40 8002F540 23104300 */  subu       $v0, $v0, $v1
/* 1FD44 8002F544 040002AE */  sw         $v0, 0x4($s0)
/* 1FD48 8002F548 1400BF8F */  lw         $ra, 0x14($sp)
/* 1FD4C 8002F54C 1000B08F */  lw         $s0, 0x10($sp)
/* 1FD50 8002F550 0800E003 */  jr         $ra
/* 1FD54 8002F554 1800BD27 */   addiu     $sp, $sp, 0x18
.size GAMELOOP_FlipScreenAndDraw, . - GAMELOOP_FlipScreenAndDraw
