.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GAMELOOP_DoTimeProcess
/* 20BC4 800303C4 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 20BC8 800303C8 1800BFAF */  sw         $ra, 0x18($sp)
/* 20BCC 800303CC 1400B1AF */  sw         $s1, 0x14($sp)
/* 20BD0 800303D0 6FF7000C */  jal        TIMER_GetTimeMS
/* 20BD4 800303D4 1000B0AF */   sw        $s0, 0x10($sp)
/* 20BD8 800303D8 21884000 */  addu       $s1, $v0, $zero
/* 20BDC 800303DC 08BF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x140)($gp)
/* 20BE0 800303E0 0010103C */  lui        $s0, (0x10000000 >> 16)
/* 20BE4 800303E4 24105000 */  and        $v0, $v0, $s0
/* 20BE8 800303E8 70004014 */  bnez       $v0, .L800305AC
/* 20BEC 800303EC FFFF0224 */   addiu     $v0, $zero, -0x1
/* 20BF0 800303F0 18C0848F */  lw         $a0, %gp_rel(gameTrackerX + 0x250)($gp)
/* 20BF4 800303F4 93F7000C */  jal        TIMER_TimeDiff
/* 20BF8 800303F8 00000000 */   nop
/* 20BFC 800303FC 1CC082AF */  sw         $v0, %gp_rel(gameTrackerX + 0x254)($gp)
/* 20C00 80030400 EBF4020C */  jal        func_800BD3AC
/* 20C04 80030404 00F2043C */   lui       $a0, (0xF2000000 >> 16)
/* 20C08 80030408 FFFF4230 */  andi       $v0, $v0, 0xFFFF
/* 20C0C 8003040C 5890838F */  lw         $v1, %gp_rel(gameTimer)($gp)
/* 20C10 80030410 30C0848F */  lw         $a0, %gp_rel(gameTrackerX + 0x268)($gp)
/* 20C14 80030414 001C0300 */  sll        $v1, $v1, 16
/* 20C18 80030418 25104300 */  or         $v0, $v0, $v1
/* 20C1C 8003041C 18C082AF */  sw         $v0, %gp_rel(gameTrackerX + 0x250)($gp)
/* 20C20 80030420 0200801C */  bgtz       $a0, .L8003042C
/* 20C24 80030424 01000224 */   addiu     $v0, $zero, 0x1
/* 20C28 80030428 30C082AF */  sw         $v0, %gp_rel(gameTrackerX + 0x268)($gp)
.L8003042C:
/* 20C2C 8003042C 30C0828F */  lw         $v0, %gp_rel(gameTrackerX + 0x268)($gp)
/* 20C30 80030430 00000000 */  nop
/* 20C34 80030434 03004228 */  slti       $v0, $v0, 0x3
/* 20C38 80030438 02004014 */  bnez       $v0, .L80030444
/* 20C3C 8003043C 02000224 */   addiu     $v0, $zero, 0x2
/* 20C40 80030440 30C082AF */  sw         $v0, %gp_rel(gameTrackerX + 0x268)($gp)
.L80030444:
/* 20C44 80030444 E4BF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x21C)($gp)
/* 20C48 80030448 00000000 */  nop
/* 20C4C 8003044C 06004010 */  beqz       $v0, .L80030468
/* 20C50 80030450 00000000 */   nop
/* 20C54 80030454 08BF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x140)($gp)
/* 20C58 80030458 00000000 */  nop
/* 20C5C 8003045C 24105000 */  and        $v0, $v0, $s0
/* 20C60 80030460 11004010 */  beqz       $v0, .L800304A8
/* 20C64 80030464 01000224 */   addiu     $v0, $zero, 0x1
.L80030468:
/* 20C68 80030468 30C0838F */  lw         $v1, %gp_rel(gameTrackerX + 0x268)($gp)
/* 20C6C 8003046C 01000224 */  addiu      $v0, $zero, 0x1
/* 20C70 80030470 03006214 */  bne        $v1, $v0, .L80030480
/* 20C74 80030474 02000224 */   addiu     $v0, $zero, 0x2
/* 20C78 80030478 23C10008 */  j          .L8003048C
/* 20C7C 8003047C 21000224 */   addiu     $v0, $zero, 0x21
.L80030480:
/* 20C80 80030480 04006214 */  bne        $v1, $v0, .L80030494
/* 20C84 80030484 0F3E033C */   lui       $v1, (0x3E0F83E1 >> 16)
/* 20C88 80030488 32000224 */  addiu      $v0, $zero, 0x32
.L8003048C:
/* 20C8C 8003048C 04C082AF */  sw         $v0, %gp_rel(gameTrackerX + 0x23C)($gp)
/* 20C90 80030490 0F3E033C */  lui        $v1, (0x3E0F83E1 >> 16)
.L80030494:
/* 20C94 80030494 04C0828F */  lw         $v0, %gp_rel(gameTrackerX + 0x23C)($gp)
/* 20C98 80030498 E1836334 */  ori        $v1, $v1, (0x3E0F83E1 & 0xFFFF)
/* 20C9C 8003049C 00130200 */  sll        $v0, $v0, 12
/* 20CA0 800304A0 53C10008 */  j          .L8003054C
/* 20CA4 800304A4 19004300 */   multu     $v0, $v1
.L800304A8:
/* 20CA8 800304A8 30C0838F */  lw         $v1, %gp_rel(gameTrackerX + 0x268)($gp)
/* 20CAC 800304AC 00000000 */  nop
/* 20CB0 800304B0 05006210 */  beq        $v1, $v0, .L800304C8
/* 20CB4 800304B4 21000524 */   addiu     $a1, $zero, 0x21
/* 20CB8 800304B8 02000224 */  addiu      $v0, $zero, 0x2
/* 20CBC 800304BC 02006214 */  bne        $v1, $v0, .L800304C8
/* 20CC0 800304C0 00000000 */   nop
/* 20CC4 800304C4 32000524 */  addiu      $a1, $zero, 0x32
.L800304C8:
/* 20CC8 800304C8 04C0838F */  lw         $v1, %gp_rel(gameTrackerX + 0x23C)($gp)
/* 20CCC 800304CC FFFF0224 */  addiu      $v0, $zero, -0x1
/* 20CD0 800304D0 04006210 */  beq        $v1, $v0, .L800304E4
/* 20CD4 800304D4 2120A000 */   addu      $a0, $a1, $zero
/* 20CD8 800304D8 F4BF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x22C)($gp)
/* 20CDC 800304DC 00000000 */  nop
/* 20CE0 800304E0 23202202 */  subu       $a0, $s1, $v0
.L800304E4:
/* 20CE4 800304E4 30C0838F */  lw         $v1, %gp_rel(gameTrackerX + 0x268)($gp)
/* 20CE8 800304E8 01000224 */  addiu      $v0, $zero, 0x1
/* 20CEC 800304EC 07006214 */  bne        $v1, $v0, .L8003050C
/* 20CF0 800304F0 2B108500 */   sltu      $v0, $a0, $a1
/* 20CF4 800304F4 34C08287 */  lh         $v0, %gp_rel(gameTrackerX + 0x26C)($gp)
/* 20CF8 800304F8 00000000 */  nop
/* 20CFC 800304FC 03004010 */  beqz       $v0, .L8003050C
/* 20D00 80030500 2B108500 */   sltu      $v0, $a0, $a1
/* 20D04 80030504 F7FF8424 */  addiu      $a0, $a0, -0x9
/* 20D08 80030508 2B108500 */  sltu       $v0, $a0, $a1
.L8003050C:
/* 20D0C 8003050C 05004014 */  bnez       $v0, .L80030524
/* 20D10 80030510 E8030224 */   addiu     $v0, $zero, 0x3E8
/* 20D14 80030514 D0BD8387 */  lh         $v1, %gp_rel(gameTrackerX + 0x8)($gp)
/* 20D18 80030518 00000000 */  nop
/* 20D1C 8003051C 03006210 */  beq        $v1, $v0, .L8003052C
/* 20D20 80030520 4300822C */   sltiu     $v0, $a0, 0x43
.L80030524:
/* 20D24 80030524 4EC10008 */  j          .L80030538
/* 20D28 80030528 2120A000 */   addu      $a0, $a1, $zero
.L8003052C:
/* 20D2C 8003052C 03004014 */  bnez       $v0, .L8003053C
/* 20D30 80030530 0F3E033C */   lui       $v1, (0x3E0F83E1 >> 16)
/* 20D34 80030534 42000424 */  addiu      $a0, $zero, 0x42
.L80030538:
/* 20D38 80030538 0F3E033C */  lui        $v1, (0x3E0F83E1 >> 16)
.L8003053C:
/* 20D3C 8003053C E1836334 */  ori        $v1, $v1, (0x3E0F83E1 & 0xFFFF)
/* 20D40 80030540 00130400 */  sll        $v0, $a0, 12
/* 20D44 80030544 19004300 */  multu      $v0, $v1
/* 20D48 80030548 04C084AF */  sw         $a0, %gp_rel(gameTrackerX + 0x23C)($gp)
.L8003054C:
/* 20D4C 8003054C 10300000 */  mfhi       $a2
/* 20D50 80030550 C2100600 */  srl        $v0, $a2, 3
/* 20D54 80030554 08C082AF */  sw         $v0, %gp_rel(gameTrackerX + 0x240)($gp)
/* 20D58 80030558 08C0838F */  lw         $v1, %gp_rel(gameTrackerX + 0x240)($gp)
/* 20D5C 8003055C 2CC0828F */  lw         $v0, %gp_rel(gameTrackerX + 0x264)($gp)
/* 20D60 80030560 28C080AF */  sw         $zero, %gp_rel(gameTrackerX + 0x260)($gp)
/* 20D64 80030564 21104300 */  addu       $v0, $v0, $v1
/* 20D68 80030568 2CC082AF */  sw         $v0, %gp_rel(gameTrackerX + 0x264)($gp)
/* 20D6C 8003056C 0110422C */  sltiu      $v0, $v0, 0x1001
/* 20D70 80030570 0CC083AF */  sw         $v1, %gp_rel(gameTrackerX + 0x244)($gp)
/* 20D74 80030574 0E004014 */  bnez       $v0, .L800305B0
/* 20D78 80030578 01000424 */   addiu     $a0, $zero, 0x1
.L8003057C:
/* 20D7C 8003057C 2CC0828F */  lw         $v0, %gp_rel(gameTrackerX + 0x264)($gp)
/* 20D80 80030580 F8BE838F */  lw         $v1, %gp_rel(gameTrackerX + 0x130)($gp)
/* 20D84 80030584 28C084AF */  sw         $a0, %gp_rel(gameTrackerX + 0x260)($gp)
/* 20D88 80030588 00F04224 */  addiu      $v0, $v0, -0x1000
/* 20D8C 8003058C 01006324 */  addiu      $v1, $v1, 0x1
/* 20D90 80030590 2CC082AF */  sw         $v0, %gp_rel(gameTrackerX + 0x264)($gp)
/* 20D94 80030594 0110422C */  sltiu      $v0, $v0, 0x1001
/* 20D98 80030598 F8BE83AF */  sw         $v1, %gp_rel(gameTrackerX + 0x130)($gp)
/* 20D9C 8003059C F7FF4010 */  beqz       $v0, .L8003057C
/* 20DA0 800305A0 00000000 */   nop
/* 20DA4 800305A4 6CC10008 */  j          .L800305B0
/* 20DA8 800305A8 00000000 */   nop
.L800305AC:
/* 20DAC 800305AC 04C082AF */  sw         $v0, %gp_rel(gameTrackerX + 0x23C)($gp)
.L800305B0:
/* 20DB0 800305B0 1800BF8F */  lw         $ra, 0x18($sp)
/* 20DB4 800305B4 F4BF91AF */  sw         $s1, %gp_rel(gameTrackerX + 0x22C)($gp)
/* 20DB8 800305B8 1400B18F */  lw         $s1, 0x14($sp)
/* 20DBC 800305BC 1000B08F */  lw         $s0, 0x10($sp)
/* 20DC0 800305C0 0800E003 */  jr         $ra
/* 20DC4 800305C4 2000BD27 */   addiu     $sp, $sp, 0x20
.size GAMELOOP_DoTimeProcess, . - GAMELOOP_DoTimeProcess
