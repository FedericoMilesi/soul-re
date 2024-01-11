.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StateHandlerWallGrab
/* 91588 800A0D88 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 9158C 800A0D8C 1800B0AF */  sw         $s0, 0x18($sp)
/* 91590 800A0D90 21808000 */  addu       $s0, $a0, $zero
/* 91594 800A0D94 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 91598 800A0D98 2188A000 */  addu       $s1, $a1, $zero
/* 9159C 800A0D9C 2800B4AF */  sw         $s4, 0x28($sp)
/* 915A0 800A0DA0 21A0C000 */  addu       $s4, $a2, $zero
/* 915A4 800A0DA4 C0101100 */  sll        $v0, $s1, 3
/* 915A8 800A0DA8 21105100 */  addu       $v0, $v0, $s1
/* 915AC 800A0DAC C0100200 */  sll        $v0, $v0, 3
/* 915B0 800A0DB0 23105100 */  subu       $v0, $v0, $s1
/* 915B4 800A0DB4 80100200 */  sll        $v0, $v0, 2
/* 915B8 800A0DB8 08004224 */  addiu      $v0, $v0, 0x8
/* 915BC 800A0DBC 2400B3AF */  sw         $s3, 0x24($sp)
/* 915C0 800A0DC0 21980202 */  addu       $s3, $s0, $v0
/* 915C4 800A0DC4 2000B2AF */  sw         $s2, 0x20($sp)
/* 915C8 800A0DC8 04007226 */  addiu      $s2, $s3, 0x4
/* 915CC 800A0DCC 2C00BFAF */  sw         $ra, 0x2C($sp)
.L800A0DD0:
/* 915D0 800A0DD0 39C3010C */  jal        PeekMessageQueue
/* 915D4 800A0DD4 21204002 */   addu      $a0, $s2, $zero
/* 915D8 800A0DD8 21284000 */  addu       $a1, $v0, $zero
/* 915DC 800A0DDC 7E00A010 */  beqz       $a1, .L800A0FD8
/* 915E0 800A0DE0 1000023C */   lui       $v0, (0x100001 >> 16)
/* 915E4 800A0DE4 0000A38C */  lw         $v1, 0x0($a1)
/* 915E8 800A0DE8 01004234 */  ori        $v0, $v0, (0x100001 & 0xFFFF)
/* 915EC 800A0DEC 24006210 */  beq        $v1, $v0, .L800A0E80
/* 915F0 800A0DF0 2A104300 */   slt       $v0, $v0, $v1
/* 915F4 800A0DF4 10004014 */  bnez       $v0, .L800A0E38
/* 915F8 800A0DF8 0001023C */   lui       $v0, (0x1000001 >> 16)
/* 915FC 800A0DFC 0080023C */  lui        $v0, (0x80000008 >> 16)
/* 91600 800A0E00 08004234 */  ori        $v0, $v0, (0x80000008 & 0xFFFF)
/* 91604 800A0E04 70006210 */  beq        $v1, $v0, .L800A0FC8
/* 91608 800A0E08 2A104300 */   slt       $v0, $v0, $v1
/* 9160C 800A0E0C 05004014 */  bnez       $v0, .L800A0E24
/* 91610 800A0E10 0080023C */   lui       $v0, (0x80000020 >> 16)
/* 91614 800A0E14 6C006210 */  beq        $v1, $v0, .L800A0FC8
/* 91618 800A0E18 21200002 */   addu      $a0, $s0, $zero
/* 9161C 800A0E1C F0830208 */  j          .L800A0FC0
/* 91620 800A0E20 21282002 */   addu      $a1, $s1, $zero
.L800A0E24:
/* 91624 800A0E24 20004234 */  ori        $v0, $v0, (0x80000020 & 0xFFFF)
/* 91628 800A0E28 67006210 */  beq        $v1, $v0, .L800A0FC8
/* 9162C 800A0E2C 21200002 */   addu      $a0, $s0, $zero
/* 91630 800A0E30 F0830208 */  j          .L800A0FC0
/* 91634 800A0E34 21282002 */   addu      $a1, $s1, $zero
.L800A0E38:
/* 91638 800A0E38 01004234 */  ori        $v0, $v0, (0x1000001 & 0xFFFF)
/* 9163C 800A0E3C 62006210 */  beq        $v1, $v0, .L800A0FC8
/* 91640 800A0E40 2A104300 */   slt       $v0, $v0, $v1
/* 91644 800A0E44 07004014 */  bnez       $v0, .L800A0E64
/* 91648 800A0E48 0104023C */   lui       $v0, (0x4010011 >> 16)
/* 9164C 800A0E4C 1000023C */  lui        $v0, (0x100004 >> 16)
/* 91650 800A0E50 04004234 */  ori        $v0, $v0, (0x100004 & 0xFFFF)
/* 91654 800A0E54 5C006210 */  beq        $v1, $v0, .L800A0FC8
/* 91658 800A0E58 21200002 */   addu      $a0, $s0, $zero
/* 9165C 800A0E5C F0830208 */  j          .L800A0FC0
/* 91660 800A0E60 21282002 */   addu      $a1, $s1, $zero
.L800A0E64:
/* 91664 800A0E64 11004234 */  ori        $v0, $v0, (0x4010011 & 0xFFFF)
/* 91668 800A0E68 31006210 */  beq        $v1, $v0, .L800A0F30
/* 9166C 800A0E6C 0008023C */   lui       $v0, (0x8000000 >> 16)
/* 91670 800A0E70 28006210 */  beq        $v1, $v0, .L800A0F14
/* 91674 800A0E74 21200002 */   addu      $a0, $s0, $zero
/* 91678 800A0E78 F0830208 */  j          .L800A0FC0
/* 9167C 800A0E7C 21282002 */   addu      $a1, $s1, $zero
.L800A0E80:
/* 91680 800A0E80 13002016 */  bnez       $s1, .L800A0ED0
/* 91684 800A0E84 21200002 */   addu      $a0, $s0, $zero
/* 91688 800A0E88 0004023C */  lui        $v0, (0x4000000 >> 16)
/* 9168C 800A0E8C 90F982AF */  sw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 91690 800A0E90 0000048E */  lw         $a0, 0x0($s0)
/* 91694 800A0E94 938B020C */  jal        SteerSwitchMode
/* 91698 800A0E98 07000524 */   addiu     $a1, $zero, 0x7
/* 9169C 800A0E9C 0A08033C */  lui        $v1, (0x80A1101 >> 16)
/* 916A0 800A0EA0 01116334 */  ori        $v1, $v1, (0x80A1101 & 0xFFFF)
/* 916A4 800A0EA4 0000028E */  lw         $v0, 0x0($s0)
/* 916A8 800A0EA8 C8FD83AF */  sw         $v1, %gp_rel(ControlFlag)($gp)
/* 916AC 800A0EAC B40040AC */  sw         $zero, 0xB4($v0)
/* 916B0 800A0EB0 0000048E */  lw         $a0, 0x0($s0)
/* 916B4 800A0EB4 03000224 */  addiu      $v0, $zero, 0x3
/* 916B8 800A0EB8 30FD82AF */  sw         $v0, %gp_rel(PhysicsMode)($gp)
/* 916BC 800A0EBC 6B68020C */  jal        ResetPhysics
/* 916C0 800A0EC0 F0FF0524 */   addiu     $a1, $zero, -0x10
/* 916C4 800A0EC4 4797020C */  jal        razReaverBladeOff
/* 916C8 800A0EC8 00000000 */   nop
/* 916CC 800A0ECC 21200002 */  addu       $a0, $s0, $zero
.L800A0ED0:
/* 916D0 800A0ED0 21282002 */  addu       $a1, $s1, $zero
/* 916D4 800A0ED4 4B000624 */  addiu      $a2, $zero, 0x4B
/* 916D8 800A0ED8 21380000 */  addu       $a3, $zero, $zero
/* 916DC 800A0EDC 03000224 */  addiu      $v0, $zero, 0x3
/* 916E0 800A0EE0 1000A2AF */  sw         $v0, 0x10($sp)
/* 916E4 800A0EE4 01000224 */  addiu      $v0, $zero, 0x1
/* 916E8 800A0EE8 20C8010C */  jal        G2EmulationSwitchAnimation
/* 916EC 800A0EEC 1400A2AF */   sw        $v0, 0x14($sp)
/* 916F0 800A0EF0 36C3010C */  jal        PurgeMessageQueue
/* 916F4 800A0EF4 21204002 */   addu      $a0, $s2, $zero
/* 916F8 800A0EF8 0000048E */  lw         $a0, 0x0($s0)
/* 916FC 800A0EFC 00000000 */  nop
/* 91700 800A0F00 1800828C */  lw         $v0, 0x18($a0)
/* 91704 800A0F04 BFFF0324 */  addiu      $v1, $zero, -0x41
/* 91708 800A0F08 24104300 */  and        $v0, $v0, $v1
/* 9170C 800A0F0C F2830208 */  j          .L800A0FC8
/* 91710 800A0F10 180082AC */   sw        $v0, 0x18($a0)
.L800A0F14:
/* 91714 800A0F14 2C002016 */  bnez       $s1, .L800A0FC8
/* 91718 800A0F18 0A80053C */   lui       $a1, %hi(StateHandlerWallIdle)
/* 9171C 800A0F1C F80FA524 */  addiu      $a1, $a1, %lo(StateHandlerWallIdle)
/* 91720 800A0F20 F4CA010C */  jal        StateSwitchStateCharacterData
/* 91724 800A0F24 21300000 */   addu      $a2, $zero, $zero
/* 91728 800A0F28 F2830208 */  j          .L800A0FC8
/* 9172C 800A0F2C 00000000 */   nop
.L800A0F30:
/* 91730 800A0F30 0400A58C */  lw         $a1, 0x4($a1)
/* 91734 800A0F34 00000000 */  nop
/* 91738 800A0F38 2800A28C */  lw         $v0, 0x28($a1)
/* 9173C 800A0F3C 00000000 */  nop
/* 91740 800A0F40 18004014 */  bnez       $v0, .L800A0FA4
/* 91744 800A0F44 21200000 */   addu      $a0, $zero, $zero
/* 91748 800A0F48 0000028E */  lw         $v0, 0x0($s0)
/* 9174C 800A0F4C 00000000 */  nop
/* 91750 800A0F50 740040A4 */  sh         $zero, 0x74($v0)
/* 91754 800A0F54 0000028E */  lw         $v0, 0x0($s0)
/* 91758 800A0F58 21288000 */  addu       $a1, $a0, $zero
/* 9175C 800A0F5C 760040A4 */  sh         $zero, 0x76($v0)
/* 91760 800A0F60 0000028E */  lw         $v0, 0x0($s0)
/* 91764 800A0F64 03000624 */  addiu      $a2, $zero, 0x3
/* 91768 800A0F68 4FC6010C */  jal        SetControlInitIdleData
/* 9176C 800A0F6C 780040A4 */   sh        $zero, 0x78($v0)
/* 91770 800A0F70 21200002 */  addu       $a0, $s0, $zero
/* 91774 800A0F74 21282002 */  addu       $a1, $s1, $zero
/* 91778 800A0F78 0B80063C */  lui        $a2, %hi(StateHandlerIdle)
/* 9177C 800A0F7C E084C624 */  addiu      $a2, $a2, %lo(StateHandlerIdle)
/* 91780 800A0F80 C1CA010C */  jal        StateSwitchStateData
/* 91784 800A0F84 21384000 */   addu      $a3, $v0, $zero
/* 91788 800A0F88 0000038E */  lw         $v1, 0x0($s0)
/* 9178C 800A0F8C 00000000 */  nop
/* 91790 800A0F90 1800628C */  lw         $v0, 0x18($v1)
/* 91794 800A0F94 00000000 */  nop
/* 91798 800A0F98 40004234 */  ori        $v0, $v0, 0x40
/* 9179C 800A0F9C F2830208 */  j          .L800A0FC8
/* 917A0 800A0FA0 180062AC */   sw        $v0, 0x18($v1)
.L800A0FA4:
/* 917A4 800A0FA4 08002016 */  bnez       $s1, .L800A0FC8
/* 917A8 800A0FA8 00000000 */   nop
/* 917AC 800A0FAC 0000048E */  lw         $a0, 0x0($s0)
/* 917B0 800A0FB0 F49B020C */  jal        razSetWallCrawlNodes
/* 917B4 800A0FB4 00000000 */   nop
/* 917B8 800A0FB8 F2830208 */  j          .L800A0FC8
/* 917BC 800A0FBC 00000000 */   nop
.L800A0FC0:
/* 917C0 800A0FC0 B9BF020C */  jal        DefaultStateHandler
/* 917C4 800A0FC4 21308002 */   addu      $a2, $s4, $zero
.L800A0FC8:
/* 917C8 800A0FC8 27C3010C */  jal        DeMessageQueue
/* 917CC 800A0FCC 04006426 */   addiu     $a0, $s3, 0x4
/* 917D0 800A0FD0 74830208 */  j          .L800A0DD0
/* 917D4 800A0FD4 00000000 */   nop
.L800A0FD8:
/* 917D8 800A0FD8 2C00BF8F */  lw         $ra, 0x2C($sp)
/* 917DC 800A0FDC 2800B48F */  lw         $s4, 0x28($sp)
/* 917E0 800A0FE0 2400B38F */  lw         $s3, 0x24($sp)
/* 917E4 800A0FE4 2000B28F */  lw         $s2, 0x20($sp)
/* 917E8 800A0FE8 1C00B18F */  lw         $s1, 0x1C($sp)
/* 917EC 800A0FEC 1800B08F */  lw         $s0, 0x18($sp)
/* 917F0 800A0FF0 0800E003 */  jr         $ra
/* 917F4 800A0FF4 3000BD27 */   addiu     $sp, $sp, 0x30
.size StateHandlerWallGrab, . - StateHandlerWallGrab
