.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_TransformGameAttribute
/* 535A4 80062DA4 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 535A8 80062DA8 1400B1AF */  sw         $s1, 0x14($sp)
/* 535AC 80062DAC 21888000 */  addu       $s1, $a0, $zero
/* 535B0 80062DB0 1800B2AF */  sw         $s2, 0x18($sp)
/* 535B4 80062DB4 2190A000 */  addu       $s2, $a1, $zero
/* 535B8 80062DB8 1000B0AF */  sw         $s0, 0x10($sp)
/* 535BC 80062DBC 2180E000 */  addu       $s0, $a3, $zero
/* 535C0 80062DC0 21200000 */  addu       $a0, $zero, $zero
/* 535C4 80062DC4 FFFFC324 */  addiu      $v1, $a2, -0x1
/* 535C8 80062DC8 A800622C */  sltiu      $v0, $v1, 0xA8
/* 535CC 80062DCC 0E014010 */  beqz       $v0, .L80063208
/* 535D0 80062DD0 1C00BFAF */   sw        $ra, 0x1C($sp)
/* 535D4 80062DD4 0180023C */  lui        $v0, %hi(jtbl_80010738)
/* 535D8 80062DD8 38074224 */  addiu      $v0, $v0, %lo(jtbl_80010738)
/* 535DC 80062DDC 80180300 */  sll        $v1, $v1, 2
/* 535E0 80062DE0 21186200 */  addu       $v1, $v1, $v0
/* 535E4 80062DE4 0000628C */  lw         $v0, 0x0($v1)
/* 535E8 80062DE8 00000000 */  nop
/* 535EC 80062DEC 08004000 */  jr         $v0
/* 535F0 80062DF0 00000000 */   nop
jlabel .L80062DF4
/* 535F4 80062DF4 6210043C */  lui        $a0, (0x10624DD3 >> 16)
/* 535F8 80062DF8 F4BF838F */  lw         $v1, %gp_rel(gameTrackerX + 0x22C)($gp)
/* 535FC 80062DFC D34D8434 */  ori        $a0, $a0, (0x10624DD3 & 0xFFFF)
/* 53600 80062E00 00110300 */  sll        $v0, $v1, 4
/* 53604 80062E04 23104300 */  subu       $v0, $v0, $v1
/* 53608 80062E08 40100200 */  sll        $v0, $v0, 1
/* 5360C 80062E0C 19004400 */  multu      $v0, $a0
/* 53610 80062E10 21300000 */  addu       $a2, $zero, $zero
/* 53614 80062E14 21204002 */  addu       $a0, $s2, $zero
/* 53618 80062E18 10400000 */  mfhi       $t0
/* 5361C 80062E1C 9588010C */  jal        EVENT_ChangeOperandToNumber
/* 53620 80062E20 82290800 */   srl       $a1, $t0, 6
/* 53624 80062E24 828C0108 */  j          .L80063208
/* 53628 80062E28 01000424 */   addiu     $a0, $zero, 0x1
jlabel .L80062E2C
/* 5362C 80062E2C 21204002 */  addu       $a0, $s2, $zero
/* 53630 80062E30 E2BF8587 */  lh         $a1, %gp_rel(gameTrackerX + 0x21A)($gp)
/* 53634 80062E34 9588010C */  jal        EVENT_ChangeOperandToNumber
/* 53638 80062E38 21300000 */   addu      $a2, $zero, $zero
/* 5363C 80062E3C 828C0108 */  j          .L80063208
/* 53640 80062E40 01000424 */   addiu     $a0, $zero, 0x1
jlabel .L80062E44
/* 53644 80062E44 10BE908F */  lw         $s0, %gp_rel(gameTrackerX + 0x48)($gp)
/* 53648 80062E48 90000224 */  addiu      $v0, $zero, 0x90
/* 5364C 80062E4C 90000332 */  andi       $v1, $s0, 0x90
/* 53650 80062E50 03006214 */  bne        $v1, $v0, .L80062E60
/* 53654 80062E54 21204002 */   addu      $a0, $s2, $zero
/* 53658 80062E58 6FFF0224 */  addiu      $v0, $zero, -0x91
/* 5365C 80062E5C 24800202 */  and        $s0, $s0, $v0
.L80062E60:
/* 53660 80062E60 21280002 */  addu       $a1, $s0, $zero
/* 53664 80062E64 9588010C */  jal        EVENT_ChangeOperandToNumber
/* 53668 80062E68 01000624 */   addiu     $a2, $zero, 0x1
/* 5366C 80062E6C 828C0108 */  j          .L80063208
/* 53670 80062E70 01000424 */   addiu     $a0, $zero, 0x1
jlabel .L80062E74
/* 53674 80062E74 8D83010C */  jal        HINT_GetCurrentHint
/* 53678 80062E78 00000000 */   nop
/* 5367C 80062E7C 21204002 */  addu       $a0, $s2, $zero
/* 53680 80062E80 21284000 */  addu       $a1, $v0, $zero
/* 53684 80062E84 9588010C */  jal        EVENT_ChangeOperandToNumber
/* 53688 80062E88 21300000 */   addu      $a2, $zero, $zero
/* 5368C 80062E8C 828C0108 */  j          .L80063208
/* 53690 80062E90 01000424 */   addiu     $a0, $zero, 0x1
jlabel .L80062E94
/* 53694 80062E94 21204002 */  addu       $a0, $s2, $zero
/* 53698 80062E98 21300000 */  addu       $a2, $zero, $zero
/* 5369C 80062E9C 0CBF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x144)($gp)
/* 536A0 80062EA0 1000053C */  lui        $a1, (0x100000 >> 16)
/* 536A4 80062EA4 9588010C */  jal        EVENT_ChangeOperandToNumber
/* 536A8 80062EA8 24284500 */   and       $a1, $v0, $a1
/* 536AC 80062EAC 828C0108 */  j          .L80063208
/* 536B0 80062EB0 01000424 */   addiu     $a0, $zero, 0x1
jlabel .L80062EB4
/* 536B4 80062EB4 F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 536B8 80062EB8 92D1000C */  jal        INSTANCE_Query
/* 536BC 80062EBC 0B000524 */   addiu     $a1, $zero, 0xB
/* 536C0 80062EC0 42800200 */  srl        $s0, $v0, 1
/* 536C4 80062EC4 9266010C */  jal        STREAM_IsMorphInProgress
/* 536C8 80062EC8 01001032 */   andi      $s0, $s0, 0x1
/* 536CC 80062ECC 02004010 */  beqz       $v0, .L80062ED8
/* 536D0 80062ED0 21204002 */   addu      $a0, $s2, $zero
/* 536D4 80062ED4 21800000 */  addu       $s0, $zero, $zero
.L80062ED8:
/* 536D8 80062ED8 21280002 */  addu       $a1, $s0, $zero
/* 536DC 80062EDC 9588010C */  jal        EVENT_ChangeOperandToNumber
/* 536E0 80062EE0 21300000 */   addu      $a2, $zero, $zero
/* 536E4 80062EE4 828C0108 */  j          .L80063208
/* 536E8 80062EE8 01000424 */   addiu     $a0, $zero, 0x1
jlabel .L80062EEC
/* 536EC 80062EEC F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 536F0 80062EF0 92D1000C */  jal        INSTANCE_Query
/* 536F4 80062EF4 0B000524 */   addiu     $a1, $zero, 0xB
/* 536F8 80062EF8 9266010C */  jal        STREAM_IsMorphInProgress
/* 536FC 80062EFC 01005030 */   andi      $s0, $v0, 0x1
/* 53700 80062F00 02004010 */  beqz       $v0, .L80062F0C
/* 53704 80062F04 21204002 */   addu      $a0, $s2, $zero
/* 53708 80062F08 21800000 */  addu       $s0, $zero, $zero
.L80062F0C:
/* 5370C 80062F0C 21280002 */  addu       $a1, $s0, $zero
/* 53710 80062F10 9588010C */  jal        EVENT_ChangeOperandToNumber
/* 53714 80062F14 21300000 */   addu      $a2, $zero, $zero
/* 53718 80062F18 828C0108 */  j          .L80063208
/* 5371C 80062F1C 01000424 */   addiu     $a0, $zero, 0x1
jlabel .L80062F20
/* 53720 80062F20 4C84010C */  jal        EVENT_GetNextTimer
/* 53724 80062F24 00000000 */   nop
/* 53728 80062F28 21304000 */  addu       $a2, $v0, $zero
/* 5372C 80062F2C B600C010 */  beqz       $a2, .L80063208
/* 53730 80062F30 01000424 */   addiu     $a0, $zero, 0x1
/* 53734 80062F34 B4000012 */  beqz       $s0, .L80063208
/* 53738 80062F38 02001026 */   addiu     $s0, $s0, 0x2
/* 5373C 80062F3C 01000224 */  addiu      $v0, $zero, 0x1
/* 53740 80062F40 5CA482AF */  sw         $v0, %gp_rel(MoveCodeStreamExtra)($gp)
/* 53744 80062F44 00000396 */  lhu        $v1, 0x0($s0)
/* 53748 80062F48 0000C48C */  lw         $a0, 0x0($a2)
/* 5374C 80062F4C 54CB858F */  lw         $a1, %gp_rel(currentActionScript)($gp)
/* 53750 80062F50 58A482A7 */  sh         $v0, %gp_rel(EventAbortLine)($gp)
/* 53754 80062F54 5AA482A7 */  sh         $v0, %gp_rel(EventJustRecievedTimer)($gp)
/* 53758 80062F58 24208200 */  and        $a0, $a0, $v0
/* 5375C 80062F5C 001C0300 */  sll        $v1, $v1, 16
/* 53760 80062F60 C3180300 */  sra        $v1, $v1, 3
/* 53764 80062F64 25208300 */  or         $a0, $a0, $v1
/* 53768 80062F68 50CB828F */  lw         $v0, %gp_rel(currentEventInstance)($gp)
/* 5376C 80062F6C ECCB838F */  lw         $v1, %gp_rel(CurrentPuzzleLevel)($gp)
/* 53770 80062F70 02001026 */  addiu      $s0, $s0, 0x2
/* 53774 80062F74 0C00D0AC */  sw         $s0, 0xC($a2)
/* 53778 80062F78 0000C4AC */  sw         $a0, 0x0($a2)
/* 5377C 80062F7C 0800C5AC */  sw         $a1, 0x8($a2)
/* 53780 80062F80 0400C2AC */  sw         $v0, 0x4($a2)
/* 53784 80062F84 0200A294 */  lhu        $v0, 0x2($a1)
/* 53788 80062F88 64A4848F */  lw         $a0, %gp_rel(EventCurrentEventIndex)($gp)
/* 5378C 80062F8C 01004234 */  ori        $v0, $v0, 0x1
/* 53790 80062F90 0200A2A4 */  sh         $v0, 0x2($a1)
/* 53794 80062F94 1000C3AC */  sw         $v1, 0x10($a2)
/* 53798 80062F98 818C0108 */  j          .L80063204
/* 5379C 80062F9C 1400C4AC */   sw        $a0, 0x14($a2)
jlabel .L80062FA0
/* 537A0 80062FA0 01000424 */  addiu      $a0, $zero, 0x1
/* 537A4 80062FA4 19000224 */  addiu      $v0, $zero, 0x19
/* 537A8 80062FA8 000042AE */  sw         $v0, 0x0($s2)
/* 537AC 80062FAC 90AC8227 */  addiu      $v0, $gp, %gp_rel(theCamera)
/* 537B0 80062FB0 040042AE */  sw         $v0, 0x4($s2)
/* 537B4 80062FB4 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 537B8 80062FB8 828C0108 */  j          .L80063208
/* 537BC 80062FBC 0C0042AE */   sw        $v0, 0xC($s2)
jlabel .L80062FC0
/* 537C0 80062FC0 21202002 */  addu       $a0, $s1, $zero
/* 537C4 80062FC4 0000828C */  lw         $v0, 0x0($a0)
/* 537C8 80062FC8 56948527 */  addiu      $a1, $gp, %gp_rel(gEndGameNow)
/* 537CC 80062FCC FFFF4224 */  addiu      $v0, $v0, -0x1
/* 537D0 80062FD0 6F88010C */  jal        EVENT_AddShortPointerToStack
/* 537D4 80062FD4 000082AC */   sw        $v0, 0x0($a0)
/* 537D8 80062FD8 828C0108 */  j          .L80063208
/* 537DC 80062FDC 01000424 */   addiu     $a0, $zero, 0x1
jlabel .L80062FE0
/* 537E0 80062FE0 88000012 */  beqz       $s0, .L80063204
/* 537E4 80062FE4 02001026 */   addiu     $s0, $s0, 0x2
/* 537E8 80062FE8 02000224 */  addiu      $v0, $zero, 0x2
/* 537EC 80062FEC 5CA482AF */  sw         $v0, %gp_rel(MoveCodeStreamExtra)($gp)
/* 537F0 80062FF0 02000486 */  lh         $a0, 0x2($s0)
/* 537F4 80062FF4 00000386 */  lh         $v1, 0x0($s0)
/* 537F8 80062FF8 02008104 */  bgez       $a0, .L80063004
/* 537FC 80062FFC 21108000 */   addu      $v0, $a0, $zero
/* 53800 80063000 23100200 */  negu       $v0, $v0
.L80063004:
/* 53804 80063004 96BE82A7 */  sh         $v0, %gp_rel(gameTrackerX + 0xCE)($gp)
/* 53808 80063008 0B000224 */  addiu      $v0, $zero, 0xB
/* 5380C 8006300C 94BE84A7 */  sh         $a0, %gp_rel(gameTrackerX + 0xCC)($gp)
/* 53810 80063010 98BE83A7 */  sh         $v1, %gp_rel(gameTrackerX + 0xD0)($gp)
/* 53814 80063014 0B006214 */  bne        $v1, $v0, .L80063044
/* 53818 80063018 00000000 */   nop
/* 5381C 8006301C 05008104 */  bgez       $a0, .L80063034
/* 53820 80063020 FFFD033C */   lui       $v1, (0xFDFFFFFF >> 16)
/* 53824 80063024 0CBF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x144)($gp)
/* 53828 80063028 0002033C */  lui        $v1, (0x200FFFF >> 16)
/* 5382C 8006302C 108C0108 */  j          .L80063040
/* 53830 80063030 25104300 */   or        $v0, $v0, $v1
.L80063034:
/* 53834 80063034 0CBF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x144)($gp)
/* 53838 80063038 FFFF6334 */  ori        $v1, $v1, (0x200FFFF & 0xFFFF)
/* 5383C 8006303C 24104300 */  and        $v0, $v0, $v1
.L80063040:
/* 53840 80063040 0CBF82AF */  sw         $v0, %gp_rel(gameTrackerX + 0x144)($gp)
.L80063044:
/* 53844 80063044 0000228E */  lw         $v0, 0x0($s1)
/* 53848 80063048 00000000 */  nop
/* 5384C 8006304C FFFF4224 */  addiu      $v0, $v0, -0x1
/* 53850 80063050 818C0108 */  j          .L80063204
/* 53854 80063054 000022AE */   sw        $v0, 0x0($s1)
jlabel .L80063058
/* 53858 80063058 6A000012 */  beqz       $s0, .L80063204
/* 5385C 8006305C 02001026 */   addiu     $s0, $s0, 0x2
/* 53860 80063060 04000224 */  addiu      $v0, $zero, 0x4
/* 53864 80063064 5CA482AF */  sw         $v0, %gp_rel(MoveCodeStreamExtra)($gp)
/* 53868 80063068 00000486 */  lh         $a0, 0x0($s0)
/* 5386C 8006306C 02001026 */  addiu      $s0, $s0, 0x2
/* 53870 80063070 00000586 */  lh         $a1, 0x0($s0)
/* 53874 80063074 02001026 */  addiu      $s0, $s0, 0x2
/* 53878 80063078 02000786 */  lh         $a3, 0x2($s0)
/* 5387C 8006307C 00000686 */  lh         $a2, 0x0($s0)
/* 53880 80063080 0000228E */  lw         $v0, 0x0($s1)
/* 53884 80063084 002B0500 */  sll        $a1, $a1, 12
/* 53888 80063088 003B0700 */  sll        $a3, $a3, 12
/* 5388C 8006308C FFFF4224 */  addiu      $v0, $v0, -0x1
/* 53890 80063090 D9C5000C */  jal        GAMEPAD_Shock
/* 53894 80063094 000022AE */   sw        $v0, 0x0($s1)
/* 53898 80063098 828C0108 */  j          .L80063208
/* 5389C 8006309C 01000424 */   addiu     $a0, $zero, 0x1
jlabel .L800630A0
/* 538A0 800630A0 21200000 */  addu       $a0, $zero, $zero
/* 538A4 800630A4 2A000524 */  addiu      $a1, $zero, 0x2A
/* 538A8 800630A8 0400063C */  lui        $a2, (0x4000E >> 16)
/* 538AC 800630AC 0E00C634 */  ori        $a2, $a2, (0x4000E & 0xFFFF)
/* 538B0 800630B0 338C0108 */  j          .L800630CC
/* 538B4 800630B4 01000724 */   addiu     $a3, $zero, 0x1
jlabel .L800630B8
/* 538B8 800630B8 21200000 */  addu       $a0, $zero, $zero
/* 538BC 800630BC 0A000524 */  addiu      $a1, $zero, 0xA
/* 538C0 800630C0 0400063C */  lui        $a2, (0x4000E >> 16)
/* 538C4 800630C4 0E00C634 */  ori        $a2, $a2, (0x4000E & 0xFFFF)
/* 538C8 800630C8 21388000 */  addu       $a3, $a0, $zero
.L800630CC:
/* 538CC 800630CC BAD1000C */  jal        INSTANCE_Broadcast
/* 538D0 800630D0 00000000 */   nop
/* 538D4 800630D4 0000228E */  lw         $v0, 0x0($s1)
/* 538D8 800630D8 01000424 */  addiu      $a0, $zero, 0x1
/* 538DC 800630DC FFFF4224 */  addiu      $v0, $v0, -0x1
/* 538E0 800630E0 828C0108 */  j          .L80063208
/* 538E4 800630E4 000022AE */   sw        $v0, 0x0($s1)
jlabel .L800630E8
/* 538E8 800630E8 46000012 */  beqz       $s0, .L80063204
/* 538EC 800630EC 02001026 */   addiu     $s0, $s0, 0x2
/* 538F0 800630F0 02000224 */  addiu      $v0, $zero, 0x2
/* 538F4 800630F4 5CA482AF */  sw         $v0, %gp_rel(MoveCodeStreamExtra)($gp)
/* 538F8 800630F8 00001196 */  lhu        $s1, 0x0($s0)
/* 538FC 800630FC 02001096 */  lhu        $s0, 0x2($s0)
/* 53900 80063100 3AF2020C */  jal        rand
/* 53904 80063104 00841000 */   sll       $s0, $s0, 16
/* 53908 80063108 03841000 */  sra        $s0, $s0, 16
/* 5390C 8006310C 008C1100 */  sll        $s1, $s1, 16
/* 53910 80063110 038C1100 */  sra        $s1, $s1, 16
/* 53914 80063114 23801102 */  subu       $s0, $s0, $s1
/* 53918 80063118 1A005000 */  div        $zero, $v0, $s0
/* 5391C 8006311C 10280000 */  mfhi       $a1
/* 53920 80063120 21204002 */  addu       $a0, $s2, $zero
/* 53924 80063124 21300000 */  addu       $a2, $zero, $zero
/* 53928 80063128 9588010C */  jal        EVENT_ChangeOperandToNumber
/* 5392C 8006312C 2128B100 */   addu      $a1, $a1, $s1
/* 53930 80063130 828C0108 */  j          .L80063208
/* 53934 80063134 01000424 */   addiu     $a0, $zero, 0x1
jlabel .L80063138
/* 53938 80063138 1A82010C */  jal        LOAD_IsXAInQueue
/* 5393C 8006313C 00000000 */   nop
/* 53940 80063140 21204002 */  addu       $a0, $s2, $zero
/* 53944 80063144 0100452C */  sltiu      $a1, $v0, 0x1
/* 53948 80063148 9588010C */  jal        EVENT_ChangeOperandToNumber
/* 5394C 8006314C 21300000 */   addu      $a2, $zero, $zero
/* 53950 80063150 828C0108 */  j          .L80063208
/* 53954 80063154 01000424 */   addiu     $a0, $zero, 0x1
jlabel .L80063158
/* 53958 80063158 21204002 */  addu       $a0, $s2, $zero
/* 5395C 8006315C 0CBF858F */  lw         $a1, %gp_rel(gameTrackerX + 0x144)($gp)
/* 53960 80063160 21300000 */  addu       $a2, $zero, $zero
/* 53964 80063164 C22D0500 */  srl        $a1, $a1, 23
/* 53968 80063168 9588010C */  jal        EVENT_ChangeOperandToNumber
/* 5396C 8006316C 0100A530 */   andi      $a1, $a1, 0x1
/* 53970 80063170 828C0108 */  j          .L80063208
/* 53974 80063174 01000424 */   addiu     $a0, $zero, 0x1
jlabel .L80063178
/* 53978 80063178 F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 5397C 8006317C 92D1000C */  jal        INSTANCE_Query
/* 53980 80063180 29000524 */   addiu     $a1, $zero, 0x29
/* 53984 80063184 21204002 */  addu       $a0, $s2, $zero
/* 53988 80063188 21284000 */  addu       $a1, $v0, $zero
/* 5398C 8006318C 9588010C */  jal        EVENT_ChangeOperandToNumber
/* 53990 80063190 03000624 */   addiu     $a2, $zero, 0x3
/* 53994 80063194 828C0108 */  j          .L80063208
/* 53998 80063198 01000424 */   addiu     $a0, $zero, 0x1
jlabel .L8006319C
/* 5399C 8006319C F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 539A0 800631A0 92D1000C */  jal        INSTANCE_Query
/* 539A4 800631A4 2A000524 */   addiu     $a1, $zero, 0x2A
/* 539A8 800631A8 21204002 */  addu       $a0, $s2, $zero
/* 539AC 800631AC 21284000 */  addu       $a1, $v0, $zero
/* 539B0 800631B0 9588010C */  jal        EVENT_ChangeOperandToNumber
/* 539B4 800631B4 03000624 */   addiu     $a2, $zero, 0x3
/* 539B8 800631B8 828C0108 */  j          .L80063208
/* 539BC 800631BC 01000424 */   addiu     $a0, $zero, 0x1
jlabel .L800631C0
/* 539C0 800631C0 0000228E */  lw         $v0, 0x0($s1)
/* 539C4 800631C4 00000000 */  nop
/* 539C8 800631C8 FFFF4224 */  addiu      $v0, $v0, -0x1
/* 539CC 800631CC 000022AE */  sw         $v0, 0x0($s1)
/* 539D0 800631D0 88BE828F */  lw         $v0, %gp_rel(gameTrackerX + 0xC0)($gp)
/* 539D4 800631D4 0800033C */  lui        $v1, (0x80000 >> 16)
/* 539D8 800631D8 24104300 */  and        $v0, $v0, $v1
/* 539DC 800631DC 0A004010 */  beqz       $v0, .L80063208
/* 539E0 800631E0 01000424 */   addiu     $a0, $zero, 0x1
/* 539E4 800631E4 1A82010C */  jal        LOAD_IsXAInQueue
/* 539E8 800631E8 00000000 */   nop
/* 539EC 800631EC 05004010 */  beqz       $v0, .L80063204
/* 539F0 800631F0 01000224 */   addiu     $v0, $zero, 0x1
/* 539F4 800631F4 58A482A7 */  sh         $v0, %gp_rel(EventAbortLine)($gp)
/* 539F8 800631F8 828C0108 */  j          .L80063208
/* 539FC 800631FC 01000424 */   addiu     $a0, $zero, 0x1
jlabel .L80063200
/* 53A00 80063200 040046AE */  sw         $a2, 0x4($s2)
.L80063204:
/* 53A04 80063204 01000424 */  addiu      $a0, $zero, 0x1
jlabel .L80063208
/* 53A08 80063208 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 53A0C 8006320C 1800B28F */  lw         $s2, 0x18($sp)
/* 53A10 80063210 1400B18F */  lw         $s1, 0x14($sp)
/* 53A14 80063214 1000B08F */  lw         $s0, 0x10($sp)
/* 53A18 80063218 21108000 */  addu       $v0, $a0, $zero
/* 53A1C 8006321C 0800E003 */  jr         $ra
/* 53A20 80063220 2000BD27 */   addiu     $sp, $sp, 0x20
.size EVENT_TransformGameAttribute, . - EVENT_TransformGameAttribute
