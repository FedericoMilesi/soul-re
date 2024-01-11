.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetStates
/* A2410 800B1C10 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* A2414 800B1C14 2800B4AF */  sw         $s4, 0x28($sp)
/* A2418 800B1C18 21A08000 */  addu       $s4, $a0, $zero
/* A241C 800B1C1C 3400B7AF */  sw         $s7, 0x34($sp)
/* A2420 800B1C20 21B8A000 */  addu       $s7, $a1, $zero
/* A2424 800B1C24 3000B6AF */  sw         $s6, 0x30($sp)
/* A2428 800B1C28 21B0C000 */  addu       $s6, $a2, $zero
/* A242C 800B1C2C 2400B3AF */  sw         $s3, 0x24($sp)
/* A2430 800B1C30 21980000 */  addu       $s3, $zero, $zero
/* A2434 800B1C34 00F2043C */  lui        $a0, (0xF2000000 >> 16)
/* A2438 800B1C38 3800BFAF */  sw         $ra, 0x38($sp)
/* A243C 800B1C3C 2C00B5AF */  sw         $s5, 0x2C($sp)
/* A2440 800B1C40 2000B2AF */  sw         $s2, 0x20($sp)
/* A2444 800B1C44 1C00B1AF */  sw         $s1, 0x1C($sp)
/* A2448 800B1C48 EBF4020C */  jal        func_800BD3AC
/* A244C 800B1C4C 1800B0AF */   sw        $s0, 0x18($sp)
/* A2450 800B1C50 21886002 */  addu       $s1, $s3, $zero
/* A2454 800B1C54 C8F69527 */  addiu      $s5, $gp, %gp_rel(Raziel + 0x98)
/* A2458 800B1C58 40F69227 */  addiu      $s2, $gp, %gp_rel(Raziel + 0x10)
/* A245C 800B1C5C 21806002 */  addu       $s0, $s3, $zero
/* A2460 800B1C60 5890838F */  lw         $v1, %gp_rel(gameTimer)($gp)
/* A2464 800B1C64 98A6848F */  lw         $a0, %gp_rel(LoopCounter)($gp)
/* A2468 800B1C68 FFFF4230 */  andi       $v0, $v0, 0xFFFF
/* A246C 800B1C6C C4FC96AF */  sw         $s6, %gp_rel(PadData)($gp)
/* A2470 800B1C70 C0FC97AF */  sw         $s7, %gp_rel(gameTracker)($gp)
/* A2474 800B1C74 001C0300 */  sll        $v1, $v1, 16
/* A2478 800B1C78 25104300 */  or         $v0, $v0, $v1
/* A247C 800B1C7C 01008424 */  addiu      $a0, $a0, 0x1
/* A2480 800B1C80 20F682AF */  sw         $v0, %gp_rel(LastTime.366)($gp)
/* A2484 800B1C84 98A684AF */  sw         $a0, %gp_rel(LoopCounter)($gp)
.L800B1C88:
/* A2488 800B1C88 27C3010C */  jal        DeMessageQueue
/* A248C 800B1C8C 21201502 */   addu      $a0, $s0, $s5
/* A2490 800B1C90 05004010 */  beqz       $v0, .L800B1CA8
/* A2494 800B1C94 21201202 */   addu      $a0, $s0, $s2
/* A2498 800B1C98 43C3010C */  jal        EnMessageQueue
/* A249C 800B1C9C 21284000 */   addu      $a1, $v0, $zero
/* A24A0 800B1CA0 22C70208 */  j          .L800B1C88
/* A24A4 800B1CA4 00000000 */   nop
.L800B1CA8:
/* A24A8 800B1CA8 01003126 */  addiu      $s1, $s1, 0x1
/* A24AC 800B1CAC 0300222A */  slti       $v0, $s1, 0x3
/* A24B0 800B1CB0 F5FF4014 */  bnez       $v0, .L800B1C88
/* A24B4 800B1CB4 1C011026 */   addiu     $s0, $s0, 0x11C
/* A24B8 800B1CB8 E000828E */  lw         $v0, 0xE0($s4)
/* A24BC 800B1CBC 00000000 */  nop
/* A24C0 800B1CC0 05004014 */  bnez       $v0, .L800B1CD8
/* A24C4 800B1CC4 21208002 */   addu      $a0, $s4, $zero
/* A24C8 800B1CC8 E4008286 */  lh         $v0, 0xE4($s4)
/* A24CC 800B1CCC 00000000 */  nop
/* A24D0 800B1CD0 08004010 */  beqz       $v0, .L800B1CF4
/* A24D4 800B1CD4 00000000 */   nop
.L800B1CD8:
/* A24D8 800B1CD8 0004053C */  lui        $a1, (0x4000004 >> 16)
/* A24DC 800B1CDC 98A6868F */  lw         $a2, %gp_rel(LoopCounter)($gp)
/* A24E0 800B1CE0 A1D1000C */  jal        INSTANCE_Post
/* A24E4 800B1CE4 0400A534 */   ori       $a1, $a1, (0x4000004 & 0xFFFF)
/* A24E8 800B1CE8 30F68527 */  addiu      $a1, $gp, %gp_rel(Raziel)
/* A24EC 800B1CEC C468020C */  jal        SetImpulsePhysics
/* A24F0 800B1CF0 21208002 */   addu      $a0, $s4, $zero
.L800B1CF4:
/* A24F4 800B1CF4 F8F9828F */  lw         $v0, %gp_rel(Raziel + 0x3C8)($gp)
/* A24F8 800B1CF8 00000000 */  nop
/* A24FC 800B1CFC 13004010 */  beqz       $v0, .L800B1D4C
/* A2500 800B1D00 00100624 */   addiu     $a2, $zero, 0x1000
/* A2504 800B1D04 21280000 */  addu       $a1, $zero, $zero
/* A2508 800B1D08 78FA828F */  lw         $v0, %gp_rel(Raziel + 0x448)($gp)
/* A250C 800B1D0C F8F9848F */  lw         $a0, %gp_rel(Raziel + 0x3C8)($gp)
/* A2510 800B1D10 20004794 */  lhu        $a3, 0x20($v0)
/* A2514 800B1D14 0F004290 */  lbu        $v0, 0xF($v0)
/* A2518 800B1D18 95C3010C */  jal        SetMonsterHitData
/* A251C 800B1D1C 1000A2AF */   sw        $v0, 0x10($sp)
/* A2520 800B1D20 21208002 */  addu       $a0, $s4, $zero
/* A2524 800B1D24 0002053C */  lui        $a1, (0x2000002 >> 16)
/* A2528 800B1D28 0200A534 */  ori        $a1, $a1, (0x2000002 & 0xFFFF)
/* A252C 800B1D2C A1D1000C */  jal        INSTANCE_Post
/* A2530 800B1D30 21304000 */   addu      $a2, $v0, $zero
/* A2534 800B1D34 21208002 */  addu       $a0, $s4, $zero
/* A2538 800B1D38 A6CE020C */  jal        DisableWristCollision
/* A253C 800B1D3C 01000524 */   addiu     $a1, $zero, 0x1
/* A2540 800B1D40 21208002 */  addu       $a0, $s4, $zero
/* A2544 800B1D44 A6CE020C */  jal        DisableWristCollision
/* A2548 800B1D48 02000524 */   addiu     $a1, $zero, 0x2
.L800B1D4C:
/* A254C 800B1D4C F4BD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* A2550 800B1D50 00000000 */  nop
/* A2554 800B1D54 1400428C */  lw         $v0, 0x14($v0)
/* A2558 800B1D58 00000000 */  nop
/* A255C 800B1D5C 00014230 */  andi       $v0, $v0, 0x100
/* A2560 800B1D60 4F004014 */  bnez       $v0, .L800B1EA0
/* A2564 800B1D64 8000033C */   lui       $v1, (0x800000 >> 16)
/* A2568 800B1D68 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* A256C 800B1D6C 00000000 */  nop
/* A2570 800B1D70 24104300 */  and        $v0, $v0, $v1
/* A2574 800B1D74 0F004010 */  beqz       $v0, .L800B1DB4
/* A2578 800B1D78 21900000 */   addu      $s2, $zero, $zero
/* A257C 800B1D7C 48FB8227 */  addiu      $v0, $gp, %gp_rel(Raziel + 0x518)
/* A2580 800B1D80 C4FC82AF */  sw         $v0, %gp_rel(PadData)($gp)
/* A2584 800B1D84 21884002 */  addu       $s1, $s2, $zero
/* A2588 800B1D88 40F69027 */  addiu      $s0, $gp, %gp_rel(Raziel + 0x10)
.L800B1D8C:
/* A258C 800B1D8C 21200002 */  addu       $a0, $s0, $zero
/* A2590 800B1D90 21284002 */  addu       $a1, $s2, $zero
/* A2594 800B1D94 4EC3010C */  jal        EnMessageQueueData
/* A2598 800B1D98 21306002 */   addu      $a2, $s3, $zero
/* A259C 800B1D9C 01003126 */  addiu      $s1, $s1, 0x1
/* A25A0 800B1DA0 0300222A */  slti       $v0, $s1, 0x3
/* A25A4 800B1DA4 F9FF4014 */  bnez       $v0, .L800B1D8C
/* A25A8 800B1DA8 1C011026 */   addiu     $s0, $s0, 0x11C
/* A25AC 800B1DAC A8C70208 */  j          .L800B1EA0
/* A25B0 800B1DB0 00000000 */   nop
.L800B1DB4:
/* A25B4 800B1DB4 A3CC020C */  jal        GetControllerMessages
/* A25B8 800B1DB8 2120C002 */   addu      $a0, $s6, $zero
/* A25BC 800B1DBC 40F69527 */  addiu      $s5, $gp, %gp_rel(Raziel + 0x10)
.L800B1DC0:
/* A25C0 800B1DC0 B0FA8427 */  addiu      $a0, $gp, %gp_rel(Raziel + 0x480)
/* A25C4 800B1DC4 27C3010C */  jal        DeMessageQueue
/* A25C8 800B1DC8 00000000 */   nop
/* A25CC 800B1DCC 1E004010 */  beqz       $v0, .L800B1E48
/* A25D0 800B1DD0 21208002 */   addu      $a0, $s4, $zero
/* A25D4 800B1DD4 0000528C */  lw         $s2, 0x0($v0)
/* A25D8 800B1DD8 0080023C */  lui        $v0, (0x80000000 >> 16)
/* A25DC 800B1DDC 0D004216 */  bne        $s2, $v0, .L800B1E14
/* A25E0 800B1DE0 00000000 */   nop
/* A25E4 800B1DE4 0CFA838F */  lw         $v1, %gp_rel(Raziel + 0x3DC)($gp)
/* A25E8 800B1DE8 00000000 */  nop
/* A25EC 800B1DEC 1F686230 */  andi       $v0, $v1, 0x681F
/* A25F0 800B1DF0 07004014 */  bnez       $v0, .L800B1E10
/* A25F4 800B1DF4 20006230 */   andi      $v0, $v1, 0x20
/* A25F8 800B1DF8 06004010 */  beqz       $v0, .L800B1E14
/* A25FC 800B1DFC 00000000 */   nop
/* A2600 800B1E00 2197020C */  jal        razGetHeldItem
/* A2604 800B1E04 00000000 */   nop
/* A2608 800B1E08 02004014 */  bnez       $v0, .L800B1E14
/* A260C 800B1E0C 00000000 */   nop
.L800B1E10:
/* A2610 800B1E10 0002123C */  lui        $s2, (0x2000000 >> 16)
.L800B1E14:
/* A2614 800B1E14 EAFF4012 */  beqz       $s2, .L800B1DC0
/* A2618 800B1E18 21880000 */   addu      $s1, $zero, $zero
/* A261C 800B1E1C 2180A002 */  addu       $s0, $s5, $zero
.L800B1E20:
/* A2620 800B1E20 21200002 */  addu       $a0, $s0, $zero
/* A2624 800B1E24 21284002 */  addu       $a1, $s2, $zero
/* A2628 800B1E28 4EC3010C */  jal        EnMessageQueueData
/* A262C 800B1E2C 21306002 */   addu      $a2, $s3, $zero
/* A2630 800B1E30 01003126 */  addiu      $s1, $s1, 0x1
/* A2634 800B1E34 0300222A */  slti       $v0, $s1, 0x3
/* A2638 800B1E38 F9FF4014 */  bnez       $v0, .L800B1E20
/* A263C 800B1E3C 1C011026 */   addiu     $s0, $s0, 0x11C
/* A2640 800B1E40 70C70208 */  j          .L800B1DC0
/* A2644 800B1E44 00000000 */   nop
.L800B1E48:
/* A2648 800B1E48 2128C002 */  addu       $a1, $s6, $zero
/* A264C 800B1E4C DE88020C */  jal        ProcessMovement
/* A2650 800B1E50 2130E002 */   addu      $a2, $s7, $zero
/* A2654 800B1E54 21984000 */  addu       $s3, $v0, $zero
/* A2658 800B1E58 06006012 */  beqz       $s3, .L800B1E74
/* A265C 800B1E5C 00106232 */   andi      $v0, $s3, 0x1000
/* A2660 800B1E60 05004010 */  beqz       $v0, .L800B1E78
/* A2664 800B1E64 0010123C */   lui       $s2, (0x10000000 >> 16)
/* A2668 800B1E68 0001123C */  lui        $s2, (0x1000001 >> 16)
/* A266C 800B1E6C 9EC70208 */  j          .L800B1E78
/* A2670 800B1E70 01005236 */   ori       $s2, $s2, (0x1000001 & 0xFFFF)
.L800B1E74:
/* A2674 800B1E74 21900000 */  addu       $s2, $zero, $zero
.L800B1E78:
/* A2678 800B1E78 21880000 */  addu       $s1, $zero, $zero
/* A267C 800B1E7C 40F69027 */  addiu      $s0, $gp, %gp_rel(Raziel + 0x10)
.L800B1E80:
/* A2680 800B1E80 21200002 */  addu       $a0, $s0, $zero
/* A2684 800B1E84 21284002 */  addu       $a1, $s2, $zero
/* A2688 800B1E88 4EC3010C */  jal        EnMessageQueueData
/* A268C 800B1E8C 21306002 */   addu      $a2, $s3, $zero
/* A2690 800B1E90 01003126 */  addiu      $s1, $s1, 0x1
/* A2694 800B1E94 0300222A */  slti       $v0, $s1, 0x3
/* A2698 800B1E98 F9FF4014 */  bnez       $v0, .L800B1E80
/* A269C 800B1E9C 1C011026 */   addiu     $s0, $s0, 0x11C
.L800B1EA0:
/* A26A0 800B1EA0 F79D020C */  jal        razSetPlayerEvent
/* A26A4 800B1EA4 21880000 */   addu      $s1, $zero, $zero
/* A26A8 800B1EA8 34F68427 */  addiu      $a0, $gp, %gp_rel(Raziel + 0x4)
/* A26AC 800B1EAC 81C7010C */  jal        G2EmulatePlayAnimation
/* A26B0 800B1EB0 00000000 */   nop
/* A26B4 800B1EB4 30F69027 */  addiu      $s0, $gp, %gp_rel(Raziel)
.L800B1EB8:
/* A26B8 800B1EB8 34F68427 */  addiu      $a0, $gp, %gp_rel(Raziel + 0x4)
/* A26BC 800B1EBC 21282002 */  addu       $a1, $s1, $zero
/* A26C0 800B1EC0 01000624 */  addiu      $a2, $zero, 0x1
/* A26C4 800B1EC4 0C00028E */  lw         $v0, 0xC($s0)
/* A26C8 800B1EC8 1C011026 */  addiu      $s0, $s0, 0x11C
/* A26CC 800B1ECC 09F84000 */  jalr       $v0
/* A26D0 800B1ED0 21882602 */   addu      $s1, $s1, $a2
/* A26D4 800B1ED4 0300222A */  slti       $v0, $s1, 0x3
/* A26D8 800B1ED8 F7FF4014 */  bnez       $v0, .L800B1EB8
/* A26DC 800B1EDC 00000000 */   nop
/* A26E0 800B1EE0 C0FC828F */  lw         $v0, %gp_rel(gameTracker)($gp)
/* A26E4 800B1EE4 00000000 */  nop
/* A26E8 800B1EE8 C7014390 */  lbu        $v1, 0x1C7($v0)
/* A26EC 800B1EEC 01000224 */  addiu      $v0, $zero, 0x1
/* A26F0 800B1EF0 02006214 */  bne        $v1, $v0, .L800B1EFC
/* A26F4 800B1EF4 03000224 */   addiu     $v0, $zero, 0x3
/* A26F8 800B1EF8 30FD82AF */  sw         $v0, %gp_rel(PhysicsMode)($gp)
.L800B1EFC:
/* A26FC 800B1EFC 30F68427 */  addiu      $a0, $gp, %gp_rel(Raziel)
/* A2700 800B1F00 34F68527 */  addiu      $a1, $gp, %gp_rel(Raziel + 0x4)
/* A2704 800B1F04 30FD878F */  lw         $a3, %gp_rel(PhysicsMode)($gp)
/* A2708 800B1F08 5869020C */  jal        ProcessPhysics
/* A270C 800B1F0C 21300000 */   addu      $a2, $zero, $zero
/* A2710 800B1F10 C4FC828F */  lw         $v0, %gp_rel(PadData)($gp)
/* A2714 800B1F14 A0A4838F */  lw         $v1, %gp_rel(RazielCommands + 0x1C)($gp)
/* A2718 800B1F18 0000428C */  lw         $v0, 0x0($v0)
/* A271C 800B1F1C 00000000 */  nop
/* A2720 800B1F20 24104300 */  and        $v0, $v0, $v1
/* A2724 800B1F24 27004010 */  beqz       $v0, .L800B1FC4
/* A2728 800B1F28 00000000 */   nop
/* A272C 800B1F2C 0CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3DC)($gp)
/* A2730 800B1F30 74FB80AF */  sw         $zero, %gp_rel(Raziel + 0x544)($gp)
/* A2734 800B1F34 40004230 */  andi       $v0, $v0, 0x40
/* A2738 800B1F38 11004010 */  beqz       $v0, .L800B1F80
/* A273C 800B1F3C 0002033C */   lui       $v1, (0x2000000 >> 16)
/* A2740 800B1F40 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* A2744 800B1F44 00000000 */  nop
/* A2748 800B1F48 24104300 */  and        $v0, $v0, $v1
/* A274C 800B1F4C 0C004014 */  bnez       $v0, .L800B1F80
/* A2750 800B1F50 00000000 */   nop
/* A2754 800B1F54 21880000 */  addu       $s1, $zero, $zero
/* A2758 800B1F58 40F69027 */  addiu      $s0, $gp, %gp_rel(Raziel + 0x10)
.L800B1F5C:
/* A275C 800B1F5C 21200002 */  addu       $a0, $s0, $zero
/* A2760 800B1F60 0001053C */  lui        $a1, (0x1000001 >> 16)
/* A2764 800B1F64 0100A534 */  ori        $a1, $a1, (0x1000001 & 0xFFFF)
/* A2768 800B1F68 4EC3010C */  jal        EnMessageQueueData
/* A276C 800B1F6C 21300000 */   addu      $a2, $zero, $zero
/* A2770 800B1F70 01003126 */  addiu      $s1, $s1, 0x1
/* A2774 800B1F74 0300222A */  slti       $v0, $s1, 0x3
/* A2778 800B1F78 F8FF4014 */  bnez       $v0, .L800B1F5C
/* A277C 800B1F7C 1C011026 */   addiu     $s0, $s0, 0x11C
.L800B1F80:
/* A2780 800B1F80 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* A2784 800B1F84 0CFA838F */  lw         $v1, %gp_rel(Raziel + 0x3DC)($gp)
/* A2788 800B1F88 04004234 */  ori        $v0, $v0, 0x4
/* A278C 800B1F8C 40006330 */  andi       $v1, $v1, 0x40
/* A2790 800B1F90 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* A2794 800B1F94 08006010 */  beqz       $v1, .L800B1FB8
/* A2798 800B1F98 00000000 */   nop
/* A279C 800B1F9C 08FA828F */  lw         $v0, %gp_rel(Raziel + 0x3D8)($gp)
/* A27A0 800B1FA0 00000000 */  nop
/* A27A4 800B1FA4 3000428C */  lw         $v0, 0x30($v0)
/* A27A8 800B1FA8 00000000 */  nop
/* A27AC 800B1FAC FCF982AF */  sw         $v0, %gp_rel(Raziel + 0x3CC)($gp)
/* A27B0 800B1FB0 16C80208 */  j          .L800B2058
/* A27B4 800B1FB4 00000000 */   nop
.L800B1FB8:
/* A27B8 800B1FB8 FCF980AF */  sw         $zero, %gp_rel(Raziel + 0x3CC)($gp)
/* A27BC 800B1FBC 16C80208 */  j          .L800B2058
/* A27C0 800B1FC0 00000000 */   nop
.L800B1FC4:
/* A27C4 800B1FC4 74FB828F */  lw         $v0, %gp_rel(Raziel + 0x544)($gp)
/* A27C8 800B1FC8 00000000 */  nop
/* A27CC 800B1FCC 01004324 */  addiu      $v1, $v0, 0x1
/* A27D0 800B1FD0 06006228 */  slti       $v0, $v1, 0x6
/* A27D4 800B1FD4 74FB83AF */  sw         $v1, %gp_rel(Raziel + 0x544)($gp)
/* A27D8 800B1FD8 17004010 */  beqz       $v0, .L800B2038
/* A27DC 800B1FDC 06000224 */   addiu     $v0, $zero, 0x6
/* A27E0 800B1FE0 0CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3DC)($gp)
/* A27E4 800B1FE4 00000000 */  nop
/* A27E8 800B1FE8 40004230 */  andi       $v0, $v0, 0x40
/* A27EC 800B1FEC 16004010 */  beqz       $v0, .L800B2048
/* A27F0 800B1FF0 0002033C */   lui       $v1, (0x2000000 >> 16)
/* A27F4 800B1FF4 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* A27F8 800B1FF8 00000000 */  nop
/* A27FC 800B1FFC 24104300 */  and        $v0, $v0, $v1
/* A2800 800B2000 11004014 */  bnez       $v0, .L800B2048
/* A2804 800B2004 21880000 */   addu      $s1, $zero, $zero
/* A2808 800B2008 40F69027 */  addiu      $s0, $gp, %gp_rel(Raziel + 0x10)
.L800B200C:
/* A280C 800B200C 21200002 */  addu       $a0, $s0, $zero
/* A2810 800B2010 0001053C */  lui        $a1, (0x1000001 >> 16)
/* A2814 800B2014 0100A534 */  ori        $a1, $a1, (0x1000001 & 0xFFFF)
/* A2818 800B2018 4EC3010C */  jal        EnMessageQueueData
/* A281C 800B201C 21300000 */   addu      $a2, $zero, $zero
/* A2820 800B2020 01003126 */  addiu      $s1, $s1, 0x1
/* A2824 800B2024 0300222A */  slti       $v0, $s1, 0x3
/* A2828 800B2028 F8FF4014 */  bnez       $v0, .L800B200C
/* A282C 800B202C 1C011026 */   addiu     $s0, $s0, 0x11C
/* A2830 800B2030 12C80208 */  j          .L800B2048
/* A2834 800B2034 00000000 */   nop
.L800B2038:
/* A2838 800B2038 03006214 */  bne        $v1, $v0, .L800B2048
/* A283C 800B203C 00000000 */   nop
/* A2840 800B2040 00FA80AF */  sw         $zero, %gp_rel(Raziel + 0x3D0)($gp)
/* A2844 800B2044 FCF980AF */  sw         $zero, %gp_rel(Raziel + 0x3CC)($gp)
.L800B2048:
/* A2848 800B2048 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* A284C 800B204C FBFF0324 */  addiu      $v1, $zero, -0x5
/* A2850 800B2050 24104300 */  and        $v0, $v0, $v1
/* A2854 800B2054 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
.L800B2058:
/* A2858 800B2058 34F68427 */  addiu      $a0, $gp, %gp_rel(Raziel + 0x4)
/* A285C 800B205C FFFF0224 */  addiu      $v0, $zero, -0x1
/* A2860 800B2060 C4FD82AF */  sw         $v0, %gp_rel(AutoFaceAngle)($gp)
/* A2864 800B2064 5C008296 */  lhu        $v0, 0x5C($s4)
/* A2868 800B2068 64008396 */  lhu        $v1, 0x64($s4)
/* A286C 800B206C E0008696 */  lhu        $a2, 0xE0($s4)
/* A2870 800B2070 23104300 */  subu       $v0, $v0, $v1
/* A2874 800B2074 23104600 */  subu       $v0, $v0, $a2
/* A2878 800B2078 9CF982A7 */  sh         $v0, %gp_rel(Raziel + 0x36C)($gp)
/* A287C 800B207C 5E008296 */  lhu        $v0, 0x5E($s4)
/* A2880 800B2080 66008396 */  lhu        $v1, 0x66($s4)
/* A2884 800B2084 E2008696 */  lhu        $a2, 0xE2($s4)
/* A2888 800B2088 23104300 */  subu       $v0, $v0, $v1
/* A288C 800B208C 23104600 */  subu       $v0, $v0, $a2
/* A2890 800B2090 9EF982A7 */  sh         $v0, %gp_rel(Raziel + 0x36E)($gp)
/* A2894 800B2094 60008296 */  lhu        $v0, 0x60($s4)
/* A2898 800B2098 68008396 */  lhu        $v1, 0x68($s4)
/* A289C 800B209C E4008696 */  lhu        $a2, 0xE4($s4)
/* A28A0 800B20A0 23104300 */  subu       $v0, $v0, $v1
/* A28A4 800B20A4 23104600 */  subu       $v0, $v0, $a2
/* A28A8 800B20A8 A0F982A7 */  sh         $v0, %gp_rel(Raziel + 0x370)($gp)
/* A28AC 800B20AC 31CB010C */  jal        StateGovernState
/* A28B0 800B20B0 03000524 */   addiu     $a1, $zero, 0x3
/* A28B4 800B20B4 8CBE828F */  lw         $v0, %gp_rel(gameTrackerX + 0xC4)($gp)
/* A28B8 800B20B8 00000000 */  nop
/* A28BC 800B20BC 00084230 */  andi       $v0, $v0, 0x800
/* A28C0 800B20C0 08004010 */  beqz       $v0, .L800B20E4
/* A28C4 800B20C4 0001033C */   lui       $v1, (0x1000000 >> 16)
/* A28C8 800B20C8 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* A28CC 800B20CC 00000000 */  nop
/* A28D0 800B20D0 24104300 */  and        $v0, $v0, $v1
/* A28D4 800B20D4 03004014 */  bnez       $v0, .L800B20E4
/* A28D8 800B20D8 00000000 */   nop
/* A28DC 800B20DC 1892020C */  jal        ProcessHealth
/* A28E0 800B20E0 21208002 */   addu      $a0, $s4, $zero
.L800B20E4:
/* A28E4 800B20E4 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* A28E8 800B20E8 0200033C */  lui        $v1, (0x20000 >> 16)
/* A28EC 800B20EC 24104300 */  and        $v0, $v0, $v1
/* A28F0 800B20F0 12004010 */  beqz       $v0, .L800B213C
/* A28F4 800B20F4 00000000 */   nop
/* A28F8 800B20F8 0CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3DC)($gp)
/* A28FC 800B20FC 00000000 */  nop
/* A2900 800B2100 00044230 */  andi       $v0, $v0, 0x400
/* A2904 800B2104 06004010 */  beqz       $v0, .L800B2120
/* A2908 800B2108 21208002 */   addu      $a0, $s4, $zero
/* A290C 800B210C 08FA828F */  lw         $v0, %gp_rel(Raziel + 0x3D8)($gp)
/* A2910 800B2110 00000000 */  nop
/* A2914 800B2114 5000458C */  lw         $a1, 0x50($v0)
/* A2918 800B2118 4DC80208 */  j          .L800B2134
/* A291C 800B211C 00000000 */   nop
.L800B2120:
/* A2920 800B2120 CCF9828F */  lw         $v0, %gp_rel(Raziel + 0x39C)($gp)
/* A2924 800B2124 00000000 */  nop
/* A2928 800B2128 10004230 */  andi       $v0, $v0, 0x10
/* A292C 800B212C 03004010 */  beqz       $v0, .L800B213C
/* A2930 800B2130 21280000 */   addu      $a1, $zero, $zero
.L800B2134:
/* A2934 800B2134 7B87020C */  jal        AlgorithmicNeck
/* A2938 800B2138 00000000 */   nop
.L800B213C:
/* A293C 800B213C C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* A2940 800B2140 2000033C */  lui        $v1, (0x200000 >> 16)
/* A2944 800B2144 24104300 */  and        $v0, $v0, $v1
/* A2948 800B2148 07004010 */  beqz       $v0, .L800B2168
/* A294C 800B214C 00000000 */   nop
/* A2950 800B2150 28C0828F */  lw         $v0, %gp_rel(gameTrackerX + 0x260)($gp)
/* A2954 800B2154 00000000 */  nop
/* A2958 800B2158 03004010 */  beqz       $v0, .L800B2168
/* A295C 800B215C 00000000 */   nop
/* A2960 800B2160 A8C8020C */  jal        ProcessConstrict
/* A2964 800B2164 00000000 */   nop
.L800B2168:
/* A2968 800B2168 4CFB828F */  lw         $v0, %gp_rel(Raziel + 0x51C)($gp)
/* A296C 800B216C 00000000 */  nop
/* A2970 800B2170 03004010 */  beqz       $v0, .L800B2180
/* A2974 800B2174 00000000 */   nop
/* A2978 800B2178 B5C9020C */  jal        ProcessEffects
/* A297C 800B217C 21208002 */   addu      $a0, $s4, $zero
.L800B2180:
/* A2980 800B2180 88CA020C */  jal        ProcessInteractiveMusic
/* A2984 800B2184 21208002 */   addu      $a0, $s4, $zero
/* A2988 800B2188 35CC020C */  jal        ProcessSpecialAbilities
/* A298C 800B218C 21208002 */   addu      $a0, $s4, $zero
/* A2990 800B2190 CCF9828F */  lw         $v0, %gp_rel(Raziel + 0x39C)($gp)
/* A2994 800B2194 00000000 */  nop
/* A2998 800B2198 40004230 */  andi       $v0, $v0, 0x40
/* A299C 800B219C 1C004010 */  beqz       $v0, .L800B2210
/* A29A0 800B21A0 00000000 */   nop
/* A29A4 800B21A4 1596020C */  jal        RAZIEL_OkToShift
/* A29A8 800B21A8 00000000 */   nop
/* A29AC 800B21AC 18004010 */  beqz       $v0, .L800B2210
/* A29B0 800B21B0 00000000 */   nop
/* A29B4 800B21B4 04FA848F */  lw         $a0, %gp_rel(Raziel + 0x3D4)($gp)
/* A29B8 800B21B8 92D1000C */  jal        INSTANCE_Query
/* A29BC 800B21BC 11000524 */   addiu     $a1, $zero, 0x11
/* A29C0 800B21C0 01000324 */  addiu      $v1, $zero, 0x1
/* A29C4 800B21C4 2A004310 */  beq        $v0, $v1, .L800B2270
/* A29C8 800B21C8 00000000 */   nop
/* A29CC 800B21CC 04FA848F */  lw         $a0, %gp_rel(Raziel + 0x3D4)($gp)
/* A29D0 800B21D0 AB35010C */  jal        FX_EndInstanceParticleEffects
/* A29D4 800B21D4 00000000 */   nop
/* A29D8 800B21D8 01000524 */  addiu      $a1, $zero, 0x1
/* A29DC 800B21DC 21300000 */  addu       $a2, $zero, $zero
/* A29E0 800B21E0 2138C000 */  addu       $a3, $a2, $zero
/* A29E4 800B21E4 04FA848F */  lw         $a0, %gp_rel(Raziel + 0x3D4)($gp)
/* A29E8 800B21E8 02000224 */  addiu      $v0, $zero, 0x2
/* A29EC 800B21EC 64C5010C */  jal        SetAnimationInstanceSwitchData
/* A29F0 800B21F0 1000A2AF */   sw        $v0, 0x10($sp)
/* A29F4 800B21F4 0008053C */  lui        $a1, (0x8000008 >> 16)
/* A29F8 800B21F8 0800A534 */  ori        $a1, $a1, (0x8000008 & 0xFFFF)
/* A29FC 800B21FC 04FA848F */  lw         $a0, %gp_rel(Raziel + 0x3D4)($gp)
/* A2A00 800B2200 A1D1000C */  jal        INSTANCE_Post
/* A2A04 800B2204 21304000 */   addu      $a2, $v0, $zero
/* A2A08 800B2208 9CC80208 */  j          .L800B2270
/* A2A0C 800B220C 00000000 */   nop
.L800B2210:
/* A2A10 800B2210 04FA848F */  lw         $a0, %gp_rel(Raziel + 0x3D4)($gp)
/* A2A14 800B2214 00000000 */  nop
/* A2A18 800B2218 14008010 */  beqz       $a0, .L800B226C
/* A2A1C 800B221C 00000000 */   nop
/* A2A20 800B2220 92D1000C */  jal        INSTANCE_Query
/* A2A24 800B2224 11000524 */   addiu     $a1, $zero, 0x11
/* A2A28 800B2228 10004010 */  beqz       $v0, .L800B226C
/* A2A2C 800B222C 00000000 */   nop
/* A2A30 800B2230 04FA848F */  lw         $a0, %gp_rel(Raziel + 0x3D4)($gp)
/* A2A34 800B2234 AB35010C */  jal        FX_EndInstanceParticleEffects
/* A2A38 800B2238 00000000 */   nop
/* A2A3C 800B223C 21280000 */  addu       $a1, $zero, $zero
/* A2A40 800B2240 2130A000 */  addu       $a2, $a1, $zero
/* A2A44 800B2244 2138A000 */  addu       $a3, $a1, $zero
/* A2A48 800B2248 04FA848F */  lw         $a0, %gp_rel(Raziel + 0x3D4)($gp)
/* A2A4C 800B224C 02000224 */  addiu      $v0, $zero, 0x2
/* A2A50 800B2250 64C5010C */  jal        SetAnimationInstanceSwitchData
/* A2A54 800B2254 1000A2AF */   sw        $v0, 0x10($sp)
/* A2A58 800B2258 0008053C */  lui        $a1, (0x8000008 >> 16)
/* A2A5C 800B225C 0800A534 */  ori        $a1, $a1, (0x8000008 & 0xFFFF)
/* A2A60 800B2260 04FA848F */  lw         $a0, %gp_rel(Raziel + 0x3D4)($gp)
/* A2A64 800B2264 A1D1000C */  jal        INSTANCE_Post
/* A2A68 800B2268 21304000 */   addu      $a2, $v0, $zero
.L800B226C:
/* A2A6C 800B226C 04FA80AF */  sw         $zero, %gp_rel(Raziel + 0x3D4)($gp)
.L800B2270:
/* A2A70 800B2270 3800BF8F */  lw         $ra, 0x38($sp)
/* A2A74 800B2274 3400B78F */  lw         $s7, 0x34($sp)
/* A2A78 800B2278 3000B68F */  lw         $s6, 0x30($sp)
/* A2A7C 800B227C 2C00B58F */  lw         $s5, 0x2C($sp)
/* A2A80 800B2280 2800B48F */  lw         $s4, 0x28($sp)
/* A2A84 800B2284 2400B38F */  lw         $s3, 0x24($sp)
/* A2A88 800B2288 2000B28F */  lw         $s2, 0x20($sp)
/* A2A8C 800B228C 1C00B18F */  lw         $s1, 0x1C($sp)
/* A2A90 800B2290 1800B08F */  lw         $s0, 0x18($sp)
/* A2A94 800B2294 01000224 */  addiu      $v0, $zero, 0x1
/* A2A98 800B2298 0800E003 */  jr         $ra
/* A2A9C 800B229C 4000BD27 */   addiu     $sp, $sp, 0x40
.size SetStates, . - SetStates
