.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StateHandlerLookAround
/* 995A0 800A8DA0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 995A4 800A8DA4 2000B2AF */  sw         $s2, 0x20($sp)
/* 995A8 800A8DA8 21908000 */  addu       $s2, $a0, $zero
/* 995AC 800A8DAC 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 995B0 800A8DB0 2188A000 */  addu       $s1, $a1, $zero
/* 995B4 800A8DB4 C0101100 */  sll        $v0, $s1, 3
/* 995B8 800A8DB8 21105100 */  addu       $v0, $v0, $s1
/* 995BC 800A8DBC C0100200 */  sll        $v0, $v0, 3
/* 995C0 800A8DC0 23105100 */  subu       $v0, $v0, $s1
/* 995C4 800A8DC4 80100200 */  sll        $v0, $v0, 2
/* 995C8 800A8DC8 08004224 */  addiu      $v0, $v0, 0x8
/* 995CC 800A8DCC 2400B3AF */  sw         $s3, 0x24($sp)
/* 995D0 800A8DD0 21984202 */  addu       $s3, $s2, $v0
/* 995D4 800A8DD4 2800BFAF */  sw         $ra, 0x28($sp)
/* 995D8 800A8DD8 1800B0AF */  sw         $s0, 0x18($sp)
.L800A8DDC:
/* 995DC 800A8DDC 39C3010C */  jal        PeekMessageQueue
/* 995E0 800A8DE0 04006426 */   addiu     $a0, $s3, 0x4
/* 995E4 800A8DE4 21804000 */  addu       $s0, $v0, $zero
/* 995E8 800A8DE8 A2000012 */  beqz       $s0, .L800A9074
/* 995EC 800A8DEC 1000023C */   lui       $v0, (0x100000 >> 16)
/* 995F0 800A8DF0 0000038E */  lw         $v1, 0x0($s0)
/* 995F4 800A8DF4 00000000 */  nop
/* 995F8 800A8DF8 83006210 */  beq        $v1, $v0, .L800A9008
/* 995FC 800A8DFC 2A104300 */   slt       $v0, $v0, $v1
/* 99600 800A8E00 12004014 */  bnez       $v0, .L800A8E4C
/* 99604 800A8E04 1000023C */   lui       $v0, (0x100004 >> 16)
/* 99608 800A8E08 0400023C */  lui        $v0, (0x40005 >> 16)
/* 9960C 800A8E0C 05004234 */  ori        $v0, $v0, (0x40005 & 0xFFFF)
/* 99610 800A8E10 8D006210 */  beq        $v1, $v0, .L800A9048
/* 99614 800A8E14 2A104300 */   slt       $v0, $v0, $v1
/* 99618 800A8E18 07004014 */  bnez       $v0, .L800A8E38
/* 9961C 800A8E1C 0400023C */   lui       $v0, (0x40025 >> 16)
/* 99620 800A8E20 0080023C */  lui        $v0, (0x80000020 >> 16)
/* 99624 800A8E24 20004234 */  ori        $v0, $v0, (0x80000020 & 0xFFFF)
/* 99628 800A8E28 4A006210 */  beq        $v1, $v0, .L800A8F54
/* 9962C 800A8E2C 1000A427 */   addiu     $a0, $sp, 0x10
/* 99630 800A8E30 19A40208 */  j          .L800A9064
/* 99634 800A8E34 00000000 */   nop
.L800A8E38:
/* 99638 800A8E38 25004234 */  ori        $v0, $v0, (0x40025 & 0xFFFF)
/* 9963C 800A8E3C 83006210 */  beq        $v1, $v0, .L800A904C
/* 99640 800A8E40 21204002 */   addu      $a0, $s2, $zero
/* 99644 800A8E44 19A40208 */  j          .L800A9064
/* 99648 800A8E48 00000000 */   nop
.L800A8E4C:
/* 9964C 800A8E4C 04004234 */  ori        $v0, $v0, (0x100004 & 0xFFFF)
/* 99650 800A8E50 2B006210 */  beq        $v1, $v0, .L800A8F00
/* 99654 800A8E54 2A104300 */   slt       $v0, $v0, $v1
/* 99658 800A8E58 07004014 */  bnez       $v0, .L800A8E78
/* 9965C 800A8E5C 0001023C */   lui       $v0, (0x1000000 >> 16)
/* 99660 800A8E60 1000023C */  lui        $v0, (0x100001 >> 16)
/* 99664 800A8E64 01004234 */  ori        $v0, $v0, (0x100001 & 0xFFFF)
/* 99668 800A8E68 07006210 */  beq        $v1, $v0, .L800A8E88
/* 9966C 800A8E6C 01000224 */   addiu     $v0, $zero, 0x1
/* 99670 800A8E70 19A40208 */  j          .L800A9064
/* 99674 800A8E74 00000000 */   nop
.L800A8E78:
/* 99678 800A8E78 68006210 */  beq        $v1, $v0, .L800A901C
/* 9967C 800A8E7C 00000000 */   nop
/* 99680 800A8E80 19A40208 */  j          .L800A9064
/* 99684 800A8E84 00000000 */   nop
.L800A8E88:
/* 99688 800A8E88 13002216 */  bne        $s1, $v0, .L800A8ED8
/* 9968C 800A8E8C 21204002 */   addu      $a0, $s2, $zero
/* 99690 800A8E90 11000524 */  addiu      $a1, $zero, 0x11
/* 99694 800A8E94 0000508E */  lw         $s0, 0x0($s2)
/* 99698 800A8E98 0E000624 */  addiu      $a2, $zero, 0xE
/* 9969C 800A8E9C C8011026 */  addiu      $s0, $s0, 0x1C8
/* 996A0 800A8EA0 5641020C */  jal        G2Anim_EnableController
/* 996A4 800A8EA4 21200002 */   addu      $a0, $s0, $zero
/* 996A8 800A8EA8 21200002 */  addu       $a0, $s0, $zero
/* 996AC 800A8EAC 10000524 */  addiu      $a1, $zero, 0x10
/* 996B0 800A8EB0 5641020C */  jal        G2Anim_EnableController
/* 996B4 800A8EB4 0E000624 */   addiu     $a2, $zero, 0xE
/* 996B8 800A8EB8 21200002 */  addu       $a0, $s0, $zero
/* 996BC 800A8EBC 0E000524 */  addiu      $a1, $zero, 0xE
/* 996C0 800A8EC0 5641020C */  jal        G2Anim_EnableController
/* 996C4 800A8EC4 2130A000 */   addu      $a2, $a1, $zero
/* 996C8 800A8EC8 0008023C */  lui        $v0, (0x8001008 >> 16)
/* 996CC 800A8ECC 08104234 */  ori        $v0, $v0, (0x8001008 & 0xFFFF)
/* 996D0 800A8ED0 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 996D4 800A8ED4 21204002 */  addu       $a0, $s2, $zero
.L800A8ED8:
/* 996D8 800A8ED8 A9C9010C */  jal        G2EmulationQueryAnimation
/* 996DC 800A8EDC 21282002 */   addu      $a1, $s1, $zero
/* 996E0 800A8EE0 18000324 */  addiu      $v1, $zero, 0x18
/* 996E4 800A8EE4 5F004314 */  bne        $v0, $v1, .L800A9064
/* 996E8 800A8EE8 21204002 */   addu      $a0, $s2, $zero
/* 996EC 800A8EEC 21282002 */  addu       $a1, $s1, $zero
/* 996F0 800A8EF0 8FA0020C */  jal        StateInitIdle
/* 996F4 800A8EF4 21300000 */   addu      $a2, $zero, $zero
/* 996F8 800A8EF8 19A40208 */  j          .L800A9064
/* 996FC 800A8EFC 00000000 */   nop
.L800A8F00:
/* 99700 800A8F00 01000224 */  addiu      $v0, $zero, 0x1
/* 99704 800A8F04 57002216 */  bne        $s1, $v0, .L800A9064
/* 99708 800A8F08 11000524 */   addiu     $a1, $zero, 0x11
/* 9970C 800A8F0C 0E000624 */  addiu      $a2, $zero, 0xE
/* 99710 800A8F10 0000508E */  lw         $s0, 0x0($s2)
/* 99714 800A8F14 2C010724 */  addiu      $a3, $zero, 0x12C
/* 99718 800A8F18 C8011026 */  addiu      $s0, $s0, 0x1C8
/* 9971C 800A8F1C 9D41020C */  jal        G2Anim_InterpDisableController
/* 99720 800A8F20 21200002 */   addu      $a0, $s0, $zero
/* 99724 800A8F24 21200002 */  addu       $a0, $s0, $zero
/* 99728 800A8F28 10000524 */  addiu      $a1, $zero, 0x10
/* 9972C 800A8F2C 0E000624 */  addiu      $a2, $zero, 0xE
/* 99730 800A8F30 9D41020C */  jal        G2Anim_InterpDisableController
/* 99734 800A8F34 2C010724 */   addiu     $a3, $zero, 0x12C
/* 99738 800A8F38 21200002 */  addu       $a0, $s0, $zero
/* 9973C 800A8F3C 0E000524 */  addiu      $a1, $zero, 0xE
/* 99740 800A8F40 2130A000 */  addu       $a2, $a1, $zero
/* 99744 800A8F44 9D41020C */  jal        G2Anim_InterpDisableController
/* 99748 800A8F48 2C010724 */   addiu     $a3, $zero, 0x12C
/* 9974C 800A8F4C 19A40208 */  j          .L800A9064
/* 99750 800A8F50 00000000 */   nop
.L800A8F54:
/* 99754 800A8F54 9F6E020C */  jal        StateHandlerDecodeHold
/* 99758 800A8F58 1400A527 */   addiu     $a1, $sp, 0x14
/* 9975C 800A8F5C 41004010 */  beqz       $v0, .L800A9064
/* 99760 800A8F60 0800023C */   lui       $v0, (0x80000 >> 16)
/* 99764 800A8F64 1000A38F */  lw         $v1, 0x10($sp)
/* 99768 800A8F68 00000000 */  nop
/* 9976C 800A8F6C 0D006214 */  bne        $v1, $v0, .L800A8FA4
/* 99770 800A8F70 21204002 */   addu      $a0, $s2, $zero
/* 99774 800A8F74 0C002016 */  bnez       $s1, .L800A8FA8
/* 99778 800A8F78 21282002 */   addu      $a1, $s1, $zero
/* 9977C 800A8F7C 0000448E */  lw         $a0, 0x0($s2)
/* 99780 800A8F80 FD96020C */  jal        razLaunchForce
/* 99784 800A8F84 00000000 */   nop
/* 99788 800A8F88 21204002 */  addu       $a0, $s2, $zero
/* 9978C 800A8F8C 21280000 */  addu       $a1, $zero, $zero
/* 99790 800A8F90 0A80063C */  lui        $a2, %hi(StateHandlerThrow2)
/* 99794 800A8F94 E4D7C624 */  addiu      $a2, $a2, %lo(StateHandlerThrow2)
/* 99798 800A8F98 C1CA010C */  jal        StateSwitchStateData
/* 9979C 800A8F9C 2138A000 */   addu      $a3, $a1, $zero
/* 997A0 800A8FA0 21204002 */  addu       $a0, $s2, $zero
.L800A8FA4:
/* 997A4 800A8FA4 21282002 */  addu       $a1, $s1, $zero
.L800A8FA8:
/* 997A8 800A8FA8 0A80063C */  lui        $a2, %hi(StateHandlerThrow2)
/* 997AC 800A8FAC E4D7C624 */  addiu      $a2, $a2, %lo(StateHandlerThrow2)
/* 997B0 800A8FB0 C1CA010C */  jal        StateSwitchStateData
/* 997B4 800A8FB4 21380000 */   addu      $a3, $zero, $zero
/* 997B8 800A8FB8 1CFA838F */  lw         $v1, %gp_rel(Raziel + 0x3EC)($gp)
/* 997BC 800A8FBC 00100224 */  addiu      $v0, $zero, 0x1000
/* 997C0 800A8FC0 0A006210 */  beq        $v1, $v0, .L800A8FEC
/* 997C4 800A8FC4 08000224 */   addiu     $v0, $zero, 0x8
/* 997C8 800A8FC8 09006210 */  beq        $v1, $v0, .L800A8FF0
/* 997CC 800A8FCC 0B80023C */   lui       $v0, %hi(StateHandlerIdle)
/* 997D0 800A8FD0 0000428E */  lw         $v0, 0x0($s2)
/* 997D4 800A8FD4 E8FB838F */  lw         $v1, %gp_rel(PlayerData)($gp)
/* 997D8 800A8FD8 04014484 */  lh         $a0, 0x104($v0)
/* 997DC 800A8FDC 24006584 */  lh         $a1, 0x24($v1)
/* 997E0 800A8FE0 26006684 */  lh         $a2, 0x26($v1)
/* 997E4 800A8FE4 7F95020C */  jal        razSetFadeEffect
/* 997E8 800A8FE8 00000000 */   nop
.L800A8FEC:
/* 997EC 800A8FEC 0B80023C */  lui        $v0, %hi(StateHandlerIdle)
.L800A8FF0:
/* 997F0 800A8FF0 E0844224 */  addiu      $v0, $v0, %lo(StateHandlerIdle)
/* 997F4 800A8FF4 38FB82AF */  sw         $v0, %gp_rel(Raziel + 0x508)($gp)
/* 997F8 800A8FF8 02000224 */  addiu      $v0, $zero, 0x2
/* 997FC 800A8FFC 98FA82AF */  sw         $v0, %gp_rel(Raziel + 0x468)($gp)
/* 99800 800A9000 19A40208 */  j          .L800A9064
/* 99804 800A9004 00000000 */   nop
.L800A9008:
/* 99808 800A9008 21204002 */  addu       $a0, $s2, $zero
/* 9980C 800A900C 21282002 */  addu       $a1, $s1, $zero
/* 99810 800A9010 38FB868F */  lw         $a2, %gp_rel(Raziel + 0x508)($gp)
/* 99814 800A9014 17A40208 */  j          .L800A905C
/* 99818 800A9018 21380000 */   addu      $a3, $zero, $zero
.L800A901C:
/* 9981C 800A901C 04002016 */  bnez       $s1, .L800A9030
/* 99820 800A9020 00000000 */   nop
/* 99824 800A9024 90AC8427 */  addiu      $a0, $gp, %gp_rel(theCamera)
/* 99828 800A9028 286F000C */  jal        CAMERA_ForceEndLookaroundMode
/* 9982C 800A902C 00000000 */   nop
.L800A9030:
/* 99830 800A9030 21204002 */  addu       $a0, $s2, $zero
/* 99834 800A9034 21282002 */  addu       $a1, $s1, $zero
/* 99838 800A9038 0400078E */  lw         $a3, 0x4($s0)
/* 9983C 800A903C 0A80063C */  lui        $a2, %hi(StateHandlerHitReaction)
/* 99840 800A9040 17A40208 */  j          .L800A905C
/* 99844 800A9044 68D5C624 */   addiu     $a2, $a2, %lo(StateHandlerHitReaction)
.L800A9048:
/* 99848 800A9048 21204002 */  addu       $a0, $s2, $zero
.L800A904C:
/* 9984C 800A904C 21282002 */  addu       $a1, $s1, $zero
/* 99850 800A9050 0400078E */  lw         $a3, 0x4($s0)
/* 99854 800A9054 0A80063C */  lui        $a2, %hi(StateHandlerStumble)
/* 99858 800A9058 44D1C624 */  addiu      $a2, $a2, %lo(StateHandlerStumble)
.L800A905C:
/* 9985C 800A905C C1CA010C */  jal        StateSwitchStateData
/* 99860 800A9060 00000000 */   nop
.L800A9064:
/* 99864 800A9064 27C3010C */  jal        DeMessageQueue
/* 99868 800A9068 04006426 */   addiu     $a0, $s3, 0x4
/* 9986C 800A906C 77A30208 */  j          .L800A8DDC
/* 99870 800A9070 00000000 */   nop
.L800A9074:
/* 99874 800A9074 C4FC828F */  lw         $v0, %gp_rel(PadData)($gp)
/* 99878 800A9078 00000000 */  nop
/* 9987C 800A907C 0000438C */  lw         $v1, 0x0($v0)
/* 99880 800A9080 98A4828F */  lw         $v0, %gp_rel(RazielCommands + 0x14)($gp)
/* 99884 800A9084 00000000 */  nop
/* 99888 800A9088 24106200 */  and        $v0, $v1, $v0
/* 9988C 800A908C 06004010 */  beqz       $v0, .L800A90A8
/* 99890 800A9090 C0201100 */   sll       $a0, $s1, 3
/* 99894 800A9094 94A4828F */  lw         $v0, %gp_rel(RazielCommands + 0x10)($gp)
/* 99898 800A9098 00000000 */  nop
/* 9989C 800A909C 24106200 */  and        $v0, $v1, $v0
/* 998A0 800A90A0 0A004014 */  bnez       $v0, .L800A90CC
/* 998A4 800A90A4 00000000 */   nop
.L800A90A8:
/* 998A8 800A90A8 21209100 */  addu       $a0, $a0, $s1
/* 998AC 800A90AC C0200400 */  sll        $a0, $a0, 3
/* 998B0 800A90B0 23209100 */  subu       $a0, $a0, $s1
/* 998B4 800A90B4 80200400 */  sll        $a0, $a0, 2
/* 998B8 800A90B8 21209200 */  addu       $a0, $a0, $s2
/* 998BC 800A90BC 94008424 */  addiu      $a0, $a0, 0x94
/* 998C0 800A90C0 1000053C */  lui        $a1, (0x100000 >> 16)
/* 998C4 800A90C4 4EC3010C */  jal        EnMessageQueueData
/* 998C8 800A90C8 21300000 */   addu      $a2, $zero, $zero
.L800A90CC:
/* 998CC 800A90CC 2800BF8F */  lw         $ra, 0x28($sp)
/* 998D0 800A90D0 2400B38F */  lw         $s3, 0x24($sp)
/* 998D4 800A90D4 2000B28F */  lw         $s2, 0x20($sp)
/* 998D8 800A90D8 1C00B18F */  lw         $s1, 0x1C($sp)
/* 998DC 800A90DC 1800B08F */  lw         $s0, 0x18($sp)
/* 998E0 800A90E0 0800E003 */  jr         $ra
/* 998E4 800A90E4 3000BD27 */   addiu     $sp, $sp, 0x30
.size StateHandlerLookAround, . - StateHandlerLookAround
