.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C2428
/* B2C28 800C2428 0D80033C */  lui        $v1, %hi(_padFixResult + 0xC)
/* B2C2C 800C242C 68E9638C */  lw         $v1, %lo(_padFixResult + 0xC)($v1)
/* B2C30 800C2430 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B2C34 800C2434 1000BFAF */  sw         $ra, 0x10($sp)
/* B2C38 800C2438 0A006294 */  lhu        $v0, 0xA($v1)
/* B2C3C 800C243C 00000000 */  nop
/* B2C40 800C2440 02004230 */  andi       $v0, $v0, 0x2
/* B2C44 800C2444 03004010 */  beqz       $v0, .L800C2454
/* B2C48 800C2448 00000000 */   nop
/* B2C4C 800C244C 6A090308 */  j          .L800C25A8
/* B2C50 800C2450 0A0060A4 */   sh        $zero, 0xA($v1)
.L800C2454:
/* B2C54 800C2454 0D80033C */  lui        $v1, %hi(_padChanStart)
/* B2C58 800C2458 54E9638C */  lw         $v1, %lo(_padChanStart)($v1)
/* B2C5C 800C245C 01000224 */  addiu      $v0, $zero, 0x1
/* B2C60 800C2460 0D80013C */  lui        $at, %hi(_padFixResult + 0x10)
/* B2C64 800C2464 09006010 */  beqz       $v1, .L800C248C
/* B2C68 800C2468 6CE922AC */   sw        $v0, %lo(_padFixResult + 0x10)($at)
/* B2C6C 800C246C 0E80043C */  lui        $a0, %hi(StStartFrame + 0x24)
/* B2C70 800C2470 68FD8424 */  addiu      $a0, $a0, %lo(StStartFrame + 0x24)
/* B2C74 800C2474 0000838C */  lw         $v1, 0x0($a0)
/* B2C78 800C2478 00000000 */  nop
/* B2C7C 800C247C 96006228 */  slti       $v0, $v1, 0x96
/* B2C80 800C2480 02004010 */  beqz       $v0, .L800C248C
/* B2C84 800C2484 01006224 */   addiu     $v0, $v1, 0x1
/* B2C88 800C2488 000082AC */  sw         $v0, 0x0($a0)
.L800C248C:
/* B2C8C 800C248C 0D80023C */  lui        $v0, %hi(_padChanStop)
/* B2C90 800C2490 58E9428C */  lw         $v0, %lo(_padChanStop)($v0)
/* B2C94 800C2494 00000000 */  nop
/* B2C98 800C2498 09004014 */  bnez       $v0, .L800C24C0
/* B2C9C 800C249C 00000000 */   nop
/* B2CA0 800C24A0 0E80043C */  lui        $a0, %hi(StStartFrame + 0x28)
/* B2CA4 800C24A4 6CFD8424 */  addiu      $a0, $a0, %lo(StStartFrame + 0x28)
/* B2CA8 800C24A8 0000838C */  lw         $v1, 0x0($a0)
/* B2CAC 800C24AC 00000000 */  nop
/* B2CB0 800C24B0 96006228 */  slti       $v0, $v1, 0x96
/* B2CB4 800C24B4 02004010 */  beqz       $v0, .L800C24C0
/* B2CB8 800C24B8 01006224 */   addiu     $v0, $v1, 0x1
/* B2CBC 800C24BC 000082AC */  sw         $v0, 0x0($a0)
.L800C24C0:
/* B2CC0 800C24C0 0D80023C */  lui        $v0, %hi(_padIntExec)
/* B2CC4 800C24C4 3CE9428C */  lw         $v0, %lo(_padIntExec)($v0)
/* B2CC8 800C24C8 00000000 */  nop
/* B2CCC 800C24CC 36004010 */  beqz       $v0, .L800C25A8
/* B2CD0 800C24D0 00000000 */   nop
/* B2CD4 800C24D4 0D80033C */  lui        $v1, %hi(_padChanStart)
/* B2CD8 800C24D8 54E9638C */  lw         $v1, %lo(_padChanStart)($v1)
/* B2CDC 800C24DC 0D80023C */  lui        $v0, %hi(_padChanStop)
/* B2CE0 800C24E0 58E9428C */  lw         $v0, %lo(_padChanStop)($v0)
/* B2CE4 800C24E4 00000000 */  nop
/* B2CE8 800C24E8 2A104300 */  slt        $v0, $v0, $v1
/* B2CEC 800C24EC 2E004014 */  bnez       $v0, .L800C25A8
/* B2CF0 800C24F0 00210300 */   sll       $a0, $v1, 4
/* B2CF4 800C24F4 23208300 */  subu       $a0, $a0, $v1
/* B2CF8 800C24F8 0D80023C */  lui        $v0, %hi(_padInfoDir)
/* B2CFC 800C24FC 38E9428C */  lw         $v0, %lo(_padInfoDir)($v0)
/* B2D00 800C2500 00210400 */  sll        $a0, $a0, 4
/* B2D04 800C2504 0D80013C */  lui        $at, %hi(_padSioState)
/* B2D08 800C2508 48E920AC */  sw         $zero, %lo(_padSioState)($at)
/* B2D0C 800C250C 0D80013C */  lui        $at, %hi(_padSioChan)
/* B2D10 800C2510 44E923AC */  sw         $v1, %lo(_padSioChan)($at)
/* B2D14 800C2514 B209030C */  jal        _padInitSioMode
/* B2D18 800C2518 21204400 */   addu      $a0, $v0, $a0
/* B2D1C 800C251C 06004014 */  bnez       $v0, .L800C2538
/* B2D20 800C2520 00000000 */   nop
/* B2D24 800C2524 0D80023C */  lui        $v0, %hi(_padFuncNextPort)
/* B2D28 800C2528 04E9428C */  lw         $v0, %lo(_padFuncNextPort)($v0)
/* B2D2C 800C252C 00000000 */  nop
/* B2D30 800C2530 09F84000 */  jalr       $v0
/* B2D34 800C2534 FFFF0434 */   ori       $a0, $zero, 0xFFFF
.L800C2538:
/* B2D38 800C2538 0D80033C */  lui        $v1, %hi(_padSioChan)
/* B2D3C 800C253C 44E9638C */  lw         $v1, %lo(_padSioChan)($v1)
/* B2D40 800C2540 0D80023C */  lui        $v0, %hi(_padChanStop)
/* B2D44 800C2544 58E9428C */  lw         $v0, %lo(_padChanStop)($v0)
/* B2D48 800C2548 0D80013C */  lui        $at, %hi(_padTotalCurr)
/* B2D4C 800C254C 4CE920AC */  sw         $zero, %lo(_padTotalCurr)($at)
/* B2D50 800C2550 2A104300 */  slt        $v0, $v0, $v1
/* B2D54 800C2554 10004014 */  bnez       $v0, .L800C2598
/* B2D58 800C2558 00000000 */   nop
.L800C255C:
/* B2D5C 800C255C 00210300 */  sll        $a0, $v1, 4
/* B2D60 800C2560 23208300 */  subu       $a0, $a0, $v1
/* B2D64 800C2564 0D80023C */  lui        $v0, %hi(_padInfoDir)
/* B2D68 800C2568 38E9428C */  lw         $v0, %lo(_padInfoDir)($v0)
/* B2D6C 800C256C 00210400 */  sll        $a0, $a0, 4
/* B2D70 800C2570 7F0A030C */  jal        func_800C29FC
/* B2D74 800C2574 21204400 */   addu      $a0, $v0, $a0
/* B2D78 800C2578 0D80033C */  lui        $v1, %hi(_padSioChan)
/* B2D7C 800C257C 44E9638C */  lw         $v1, %lo(_padSioChan)($v1)
/* B2D80 800C2580 0D80023C */  lui        $v0, %hi(_padChanStop)
/* B2D84 800C2584 58E9428C */  lw         $v0, %lo(_padChanStop)($v0)
/* B2D88 800C2588 00000000 */  nop
/* B2D8C 800C258C 2A104300 */  slt        $v0, $v0, $v1
/* B2D90 800C2590 F2FF4010 */  beqz       $v0, .L800C255C
/* B2D94 800C2594 00000000 */   nop
.L800C2598:
/* B2D98 800C2598 0D80033C */  lui        $v1, %hi(_padFixResult + 0xC)
/* B2D9C 800C259C 68E9638C */  lw         $v1, %lo(_padFixResult + 0xC)($v1)
/* B2DA0 800C25A0 88000224 */  addiu      $v0, $zero, 0x88
/* B2DA4 800C25A4 0E0062A4 */  sh         $v0, 0xE($v1)
.L800C25A8:
/* B2DA8 800C25A8 1000BF8F */  lw         $ra, 0x10($sp)
/* B2DAC 800C25AC 21100000 */  addu       $v0, $zero, $zero
/* B2DB0 800C25B0 0800E003 */  jr         $ra
/* B2DB4 800C25B4 1800BD27 */   addiu     $sp, $sp, 0x18
.size func_800C2428, . - func_800C2428
