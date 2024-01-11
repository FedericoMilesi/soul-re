.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StateHandlerDragObject
/* 9EDCC 800AE5CC 0CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3DC)($gp)
/* 9EDD0 800AE5D0 B8FFBD27 */  addiu      $sp, $sp, -0x48
/* 9EDD4 800AE5D4 2800B2AF */  sw         $s2, 0x28($sp)
/* 9EDD8 800AE5D8 21908000 */  addu       $s2, $a0, $zero
/* 9EDDC 800AE5DC 3000B4AF */  sw         $s4, 0x30($sp)
/* 9EDE0 800AE5E0 21A0A000 */  addu       $s4, $a1, $zero
/* 9EDE4 800AE5E4 4000BEAF */  sw         $fp, 0x40($sp)
/* 9EDE8 800AE5E8 21F0C000 */  addu       $fp, $a2, $zero
/* 9EDEC 800AE5EC 3C00B7AF */  sw         $s7, 0x3C($sp)
/* 9EDF0 800AE5F0 21B80000 */  addu       $s7, $zero, $zero
/* 9EDF4 800AE5F4 4400BFAF */  sw         $ra, 0x44($sp)
/* 9EDF8 800AE5F8 3800B6AF */  sw         $s6, 0x38($sp)
/* 9EDFC 800AE5FC 3400B5AF */  sw         $s5, 0x34($sp)
/* 9EE00 800AE600 2C00B3AF */  sw         $s3, 0x2C($sp)
/* 9EE04 800AE604 2400B1AF */  sw         $s1, 0x24($sp)
/* 9EE08 800AE608 02004230 */  andi       $v0, $v0, 0x2
/* 9EE0C 800AE60C 0B004010 */  beqz       $v0, .L800AE63C
/* 9EE10 800AE610 2000B0AF */   sw        $s0, 0x20($sp)
/* 9EE14 800AE614 08FA828F */  lw         $v0, %gp_rel(Raziel + 0x3D8)($gp)
/* 9EE18 800AE618 0000448E */  lw         $a0, 0x0($s2)
/* 9EE1C 800AE61C 0800538C */  lw         $s3, 0x8($v0)
/* 9EE20 800AE620 8C00828C */  lw         $v0, 0x8C($a0)
/* 9EE24 800AE624 3C00638E */  lw         $v1, 0x3C($s3)
/* 9EE28 800AE628 00000000 */  nop
/* 9EE2C 800AE62C 0F006214 */  bne        $v1, $v0, .L800AE66C
/* 9EE30 800AE630 C0101400 */   sll       $v0, $s4, 3
/* 9EE34 800AE634 9BB90208 */  j          .L800AE66C
/* 9EE38 800AE638 8C0080AC */   sw        $zero, 0x8C($a0)
.L800AE63C:
/* 9EE3C 800AE63C 21980000 */  addu       $s3, $zero, $zero
/* 9EE40 800AE640 C0201400 */  sll        $a0, $s4, 3
/* 9EE44 800AE644 21209400 */  addu       $a0, $a0, $s4
/* 9EE48 800AE648 C0200400 */  sll        $a0, $a0, 3
/* 9EE4C 800AE64C 23209400 */  subu       $a0, $a0, $s4
/* 9EE50 800AE650 80200400 */  sll        $a0, $a0, 2
/* 9EE54 800AE654 21209200 */  addu       $a0, $a0, $s2
/* 9EE58 800AE658 94008424 */  addiu      $a0, $a0, 0x94
/* 9EE5C 800AE65C 1000053C */  lui        $a1, (0x100000 >> 16)
/* 9EE60 800AE660 4EC3010C */  jal        EnMessageQueueData
/* 9EE64 800AE664 21306002 */   addu      $a2, $s3, $zero
/* 9EE68 800AE668 C0101400 */  sll        $v0, $s4, 3
.L800AE66C:
/* 9EE6C 800AE66C 21105400 */  addu       $v0, $v0, $s4
/* 9EE70 800AE670 C0100200 */  sll        $v0, $v0, 3
/* 9EE74 800AE674 23105400 */  subu       $v0, $v0, $s4
/* 9EE78 800AE678 80100200 */  sll        $v0, $v0, 2
/* 9EE7C 800AE67C 08004224 */  addiu      $v0, $v0, 0x8
/* 9EE80 800AE680 21B04202 */  addu       $s6, $s2, $v0
/* 9EE84 800AE684 01001524 */  addiu      $s5, $zero, 0x1
.L800AE688:
/* 9EE88 800AE688 39C3010C */  jal        PeekMessageQueue
/* 9EE8C 800AE68C 0400C426 */   addiu     $a0, $s6, 0x4
/* 9EE90 800AE690 21884000 */  addu       $s1, $v0, $zero
/* 9EE94 800AE694 8B012012 */  beqz       $s1, .L800AECC4
/* 9EE98 800AE698 21204002 */   addu      $a0, $s2, $zero
/* 9EE9C 800AE69C A9C9010C */  jal        G2EmulationQueryAnimation
/* 9EEA0 800AE6A0 21288002 */   addu      $a1, $s4, $zero
/* 9EEA4 800AE6A4 21804000 */  addu       $s0, $v0, $zero
/* 9EEA8 800AE6A8 0000238E */  lw         $v1, 0x0($s1)
/* 9EEAC 800AE6AC 1000023C */  lui        $v0, (0x100000 >> 16)
/* 9EEB0 800AE6B0 55016210 */  beq        $v1, $v0, .L800AEC08
/* 9EEB4 800AE6B4 2A104300 */   slt       $v0, $v0, $v1
/* 9EEB8 800AE6B8 15004014 */  bnez       $v0, .L800AE710
/* 9EEBC 800AE6BC 0008023C */   lui       $v0, (0x8000000 >> 16)
/* 9EEC0 800AE6C0 0080023C */  lui        $v0, (0x80000008 >> 16)
/* 9EEC4 800AE6C4 08004234 */  ori        $v0, $v0, (0x80000008 & 0xFFFF)
/* 9EEC8 800AE6C8 7A016210 */  beq        $v1, $v0, .L800AECB4
/* 9EECC 800AE6CC 2A104300 */   slt       $v0, $v0, $v1
/* 9EED0 800AE6D0 07004014 */  bnez       $v0, .L800AE6F0
/* 9EED4 800AE6D4 0080023C */   lui       $v0, (0x80000001 >> 16)
/* 9EED8 800AE6D8 01004234 */  ori        $v0, $v0, (0x80000001 & 0xFFFF)
/* 9EEDC 800AE6DC 2A104300 */  slt        $v0, $v0, $v1
/* 9EEE0 800AE6E0 71014014 */  bnez       $v0, .L800AECA8
/* 9EEE4 800AE6E4 21204002 */   addu      $a0, $s2, $zero
/* 9EEE8 800AE6E8 2DBB0208 */  j          .L800AECB4
/* 9EEEC 800AE6EC 00000000 */   nop
.L800AE6F0:
/* 9EEF0 800AE6F0 10004234 */  ori        $v0, $v0, (0x80000010 & 0xFFFF)
/* 9EEF4 800AE6F4 6F016210 */  beq        $v1, $v0, .L800AECB4
/* 9EEF8 800AE6F8 0080023C */   lui       $v0, (0x80000020 >> 16)
/* 9EEFC 800AE6FC 20004234 */  ori        $v0, $v0, (0x80000020 & 0xFFFF)
/* 9EF00 800AE700 6C016210 */  beq        $v1, $v0, .L800AECB4
/* 9EF04 800AE704 21204002 */   addu      $a0, $s2, $zero
/* 9EF08 800AE708 2BBB0208 */  j          .L800AECAC
/* 9EF0C 800AE70C 21288002 */   addu      $a1, $s4, $zero
.L800AE710:
/* 9EF10 800AE710 FE006210 */  beq        $v1, $v0, .L800AEB0C
/* 9EF14 800AE714 2A104300 */   slt       $v0, $v0, $v1
/* 9EF18 800AE718 09004014 */  bnez       $v0, .L800AE740
/* 9EF1C 800AE71C 0010023C */   lui       $v0, (0x10000000 >> 16)
/* 9EF20 800AE720 1000023C */  lui        $v0, (0x100001 >> 16)
/* 9EF24 800AE724 01004234 */  ori        $v0, $v0, (0x100001 & 0xFFFF)
/* 9EF28 800AE728 13006210 */  beq        $v1, $v0, .L800AE778
/* 9EF2C 800AE72C 0001023C */   lui       $v0, (0x1000000 >> 16)
/* 9EF30 800AE730 41016210 */  beq        $v1, $v0, .L800AEC38
/* 9EF34 800AE734 21204002 */   addu      $a0, $s2, $zero
/* 9EF38 800AE738 2BBB0208 */  j          .L800AECAC
/* 9EF3C 800AE73C 21288002 */   addu      $a1, $s4, $zero
.L800AE740:
/* 9EF40 800AE740 23006210 */  beq        $v1, $v0, .L800AE7D0
/* 9EF44 800AE744 2A104300 */   slt       $v0, $v0, $v1
/* 9EF48 800AE748 07004014 */  bnez       $v0, .L800AE768
/* 9EF4C 800AE74C 0020023C */   lui       $v0, (0x20000000 >> 16)
/* 9EF50 800AE750 0008023C */  lui        $v0, (0x8000001 >> 16)
/* 9EF54 800AE754 01004234 */  ori        $v0, $v0, (0x8000001 & 0xFFFF)
/* 9EF58 800AE758 E4006210 */  beq        $v1, $v0, .L800AEAEC
/* 9EF5C 800AE75C 21204002 */   addu      $a0, $s2, $zero
/* 9EF60 800AE760 2BBB0208 */  j          .L800AECAC
/* 9EF64 800AE764 21288002 */   addu      $a1, $s4, $zero
.L800AE768:
/* 9EF68 800AE768 52016210 */  beq        $v1, $v0, .L800AECB4
/* 9EF6C 800AE76C 21204002 */   addu      $a0, $s2, $zero
/* 9EF70 800AE770 2BBB0208 */  j          .L800AECAC
/* 9EF74 800AE774 21288002 */   addu      $a1, $s4, $zero
.L800AE778:
/* 9EF78 800AE778 0C008016 */  bnez       $s4, .L800AE7AC
/* 9EF7C 800AE77C 21204002 */   addu      $a0, $s2, $zero
/* 9EF80 800AE780 0009023C */  lui        $v0, (0x9001508 >> 16)
/* 9EF84 800AE784 08154234 */  ori        $v0, $v0, (0x9001508 & 0xFFFF)
/* 9EF88 800AE788 00040324 */  addiu      $v1, $zero, 0x400
/* 9EF8C 800AE78C 90F983AF */  sw         $v1, %gp_rel(Raziel + 0x360)($gp)
/* 9EF90 800AE790 0000448E */  lw         $a0, 0x0($s2)
/* 9EF94 800AE794 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 9EF98 800AE798 03000224 */  addiu      $v0, $zero, 0x3
/* 9EF9C 800AE79C 30FD82AF */  sw         $v0, %gp_rel(PhysicsMode)($gp)
/* 9EFA0 800AE7A0 938B020C */  jal        SteerSwitchMode
/* 9EFA4 800AE7A4 21280000 */   addu      $a1, $zero, $zero
/* 9EFA8 800AE7A8 21204002 */  addu       $a0, $s2, $zero
.L800AE7AC:
/* 9EFAC 800AE7AC 21288002 */  addu       $a1, $s4, $zero
/* 9EFB0 800AE7B0 14000624 */  addiu      $a2, $zero, 0x14
/* 9EFB4 800AE7B4 21380000 */  addu       $a3, $zero, $zero
/* 9EFB8 800AE7B8 03000224 */  addiu      $v0, $zero, 0x3
/* 9EFBC 800AE7BC 1000A2AF */  sw         $v0, 0x10($sp)
/* 9EFC0 800AE7C0 20C8010C */  jal        G2EmulationSwitchAnimation
/* 9EFC4 800AE7C4 1400B5AF */   sw        $s5, 0x14($sp)
/* 9EFC8 800AE7C8 2DBB0208 */  j          .L800AECB4
/* 9EFCC 800AE7CC 00000000 */   nop
.L800AE7D0:
/* 9EFD0 800AE7D0 38018016 */  bnez       $s4, .L800AECB4
/* 9EFD4 800AE7D4 00000000 */   nop
/* 9EFD8 800AE7D8 E1BF95A3 */  sb         $s5, %gp_rel(gameTrackerX + 0x219)($gp)
/* 9EFDC 800AE7DC 03000012 */  beqz       $s0, .L800AE7EC
/* 9EFE0 800AE7E0 16000224 */   addiu     $v0, $zero, 0x16
/* 9EFE4 800AE7E4 BE000216 */  bne        $s0, $v0, .L800AEAE0
/* 9EFE8 800AE7E8 00000000 */   nop
.L800AE7EC:
/* 9EFEC 800AE7EC BC006012 */  beqz       $s3, .L800AEAE0
/* 9EFF0 800AE7F0 0010023C */   lui       $v0, (0x10000002 >> 16)
/* 9EFF4 800AE7F4 0400238E */  lw         $v1, 0x4($s1)
/* 9EFF8 800AE7F8 02004234 */  ori        $v0, $v0, (0x10000002 & 0xFFFF)
/* 9EFFC 800AE7FC 7A006210 */  beq        $v1, $v0, .L800AE9E8
/* 9F000 800AE800 2A104300 */   slt       $v0, $v0, $v1
/* 9F004 800AE804 06004014 */  bnez       $v0, .L800AE820
/* 9F008 800AE808 0010023C */   lui       $v0, (0x10000001 >> 16)
/* 9F00C 800AE80C 01004234 */  ori        $v0, $v0, (0x10000001 & 0xFFFF)
/* 9F010 800AE810 0B006210 */  beq        $v1, $v0, .L800AE840
/* 9F014 800AE814 05000624 */   addiu     $a2, $zero, 0x5
/* 9F018 800AE818 B8BA0208 */  j          .L800AEAE0
/* 9F01C 800AE81C 00000000 */   nop
.L800AE820:
/* 9F020 800AE820 03004234 */  ori        $v0, $v0, (0x10000003 & 0xFFFF)
/* 9F024 800AE824 40006210 */  beq        $v1, $v0, .L800AE928
/* 9F028 800AE828 0010023C */   lui       $v0, (0x10000004 >> 16)
/* 9F02C 800AE82C 04004234 */  ori        $v0, $v0, (0x10000004 & 0xFFFF)
/* 9F030 800AE830 89006210 */  beq        $v1, $v0, .L800AEA58
/* 9F034 800AE834 1800A727 */   addiu     $a3, $sp, 0x18
/* 9F038 800AE838 B8BA0208 */  j          .L800AEAE0
/* 9F03C 800AE83C 00000000 */   nop
.L800AE840:
/* 9F040 800AE840 D0F98487 */  lh         $a0, %gp_rel(Raziel + 0x3A0)($gp)
/* 9F044 800AE844 D2F98587 */  lh         $a1, %gp_rel(Raziel + 0x3A2)($gp)
/* 9F048 800AE848 21380000 */  addu       $a3, $zero, $zero
/* 9F04C 800AE84C E1BF80A3 */  sb         $zero, %gp_rel(gameTrackerX + 0x219)($gp)
/* 9F050 800AE850 1000A0AF */  sw         $zero, 0x10($sp)
/* 9F054 800AE854 23200400 */  negu       $a0, $a0
/* 9F058 800AE858 21C4010C */  jal        SetObjectData
/* 9F05C 800AE85C 23280500 */   negu      $a1, $a1
/* 9F060 800AE860 21804000 */  addu       $s0, $v0, $zero
/* 9F064 800AE864 21206002 */  addu       $a0, $s3, $zero
/* 9F068 800AE868 8000053C */  lui        $a1, (0x800000 >> 16)
/* 9F06C 800AE86C A1D1000C */  jal        INSTANCE_Post
/* 9F070 800AE870 21300002 */   addu      $a2, $s0, $zero
/* 9F074 800AE874 0C00068E */  lw         $a2, 0xC($s0)
/* 9F078 800AE878 00000000 */  nop
/* 9F07C 800AE87C 0400C230 */  andi       $v0, $a2, 0x4
/* 9F080 800AE880 14004010 */  beqz       $v0, .L800AE8D4
/* 9F084 800AE884 21204002 */   addu      $a0, $s2, $zero
/* 9F088 800AE888 02000524 */  addiu      $a1, $zero, 0x2
/* 9F08C 800AE88C 21300000 */  addu       $a2, $zero, $zero
/* 9F090 800AE890 2138C000 */  addu       $a3, $a2, $zero
/* 9F094 800AE894 03000224 */  addiu      $v0, $zero, 0x3
/* 9F098 800AE898 1000A2AF */  sw         $v0, 0x10($sp)
/* 9F09C 800AE89C 2110A000 */  addu       $v0, $a1, $zero
/* 9F0A0 800AE8A0 20C8010C */  jal        G2EmulationSwitchAnimation
/* 9F0A4 800AE8A4 1400A2AF */   sw        $v0, 0x14($sp)
/* 9F0A8 800AE8A8 21204002 */  addu       $a0, $s2, $zero
/* 9F0AC 800AE8AC 21280000 */  addu       $a1, $zero, $zero
/* 9F0B0 800AE8B0 2E000624 */  addiu      $a2, $zero, 0x2E
/* 9F0B4 800AE8B4 2138A000 */  addu       $a3, $a1, $zero
/* 9F0B8 800AE8B8 1000A0AF */  sw         $zero, 0x10($sp)
/* 9F0BC 800AE8BC 20C8010C */  jal        G2EmulationSwitchAnimation
/* 9F0C0 800AE8C0 1400B5AF */   sw        $s5, 0x14($sp)
/* 9F0C4 800AE8C4 21204002 */  addu       $a0, $s2, $zero
/* 9F0C8 800AE8C8 01000524 */  addiu      $a1, $zero, 0x1
/* 9F0CC 800AE8CC 74BA0208 */  j          .L800AE9D0
/* 9F0D0 800AE8D0 2E000624 */   addiu     $a2, $zero, 0x2E
.L800AE8D4:
/* 9F0D4 800AE8D4 0200C230 */  andi       $v0, $a2, 0x2
/* 9F0D8 800AE8D8 81004010 */  beqz       $v0, .L800AEAE0
/* 9F0DC 800AE8DC 17000524 */   addiu     $a1, $zero, 0x17
/* 9F0E0 800AE8E0 21300000 */  addu       $a2, $zero, $zero
/* 9F0E4 800AE8E4 03000724 */  addiu      $a3, $zero, 0x3
/* 9F0E8 800AE8E8 FCC8010C */  jal        G2EmulationSwitchAnimationCharacter
/* 9F0EC 800AE8EC 1000B5AF */   sw        $s5, 0x10($sp)
/* 9F0F0 800AE8F0 06000624 */  addiu      $a2, $zero, 0x6
/* 9F0F4 800AE8F4 D0F98487 */  lh         $a0, %gp_rel(Raziel + 0x3A0)($gp)
/* 9F0F8 800AE8F8 D2F98587 */  lh         $a1, %gp_rel(Raziel + 0x3A2)($gp)
/* 9F0FC 800AE8FC 21380000 */  addu       $a3, $zero, $zero
/* 9F100 800AE900 1000A0AF */  sw         $zero, 0x10($sp)
/* 9F104 800AE904 23200400 */  negu       $a0, $a0
/* 9F108 800AE908 21C4010C */  jal        SetObjectData
/* 9F10C 800AE90C 23280500 */   negu      $a1, $a1
/* 9F110 800AE910 21206002 */  addu       $a0, $s3, $zero
/* 9F114 800AE914 8000053C */  lui        $a1, (0x800000 >> 16)
/* 9F118 800AE918 A1D1000C */  jal        INSTANCE_Post
/* 9F11C 800AE91C 21304000 */   addu      $a2, $v0, $zero
/* 9F120 800AE920 B8BA0208 */  j          .L800AEAE0
/* 9F124 800AE924 00000000 */   nop
.L800AE928:
/* 9F128 800AE928 0000448E */  lw         $a0, 0x0($s2)
/* 9F12C 800AE92C D0F98587 */  lh         $a1, %gp_rel(Raziel + 0x3A0)($gp)
/* 9F130 800AE930 D2F98687 */  lh         $a2, %gp_rel(Raziel + 0x3A2)($gp)
/* 9F134 800AE934 D4C2010C */  jal        PHYSOB_CheckSlideNormal
/* 9F138 800AE938 1800A727 */   addiu     $a3, $sp, 0x18
/* 9F13C 800AE93C 02404230 */  andi       $v0, $v0, 0x4002
/* 9F140 800AE940 00400324 */  addiu      $v1, $zero, 0x4000
/* 9F144 800AE944 66004314 */  bne        $v0, $v1, .L800AEAE0
/* 9F148 800AE948 04000624 */   addiu     $a2, $zero, 0x4
/* 9F14C 800AE94C D0F98487 */  lh         $a0, %gp_rel(Raziel + 0x3A0)($gp)
/* 9F150 800AE950 D2F98587 */  lh         $a1, %gp_rel(Raziel + 0x3A2)($gp)
/* 9F154 800AE954 21380000 */  addu       $a3, $zero, $zero
/* 9F158 800AE958 21C4010C */  jal        SetObjectData
/* 9F15C 800AE95C 1000A0AF */   sw        $zero, 0x10($sp)
/* 9F160 800AE960 21804000 */  addu       $s0, $v0, $zero
/* 9F164 800AE964 21206002 */  addu       $a0, $s3, $zero
/* 9F168 800AE968 8000053C */  lui        $a1, (0x800000 >> 16)
/* 9F16C 800AE96C A1D1000C */  jal        INSTANCE_Post
/* 9F170 800AE970 21300002 */   addu      $a2, $s0, $zero
/* 9F174 800AE974 0C00028E */  lw         $v0, 0xC($s0)
/* 9F178 800AE978 00000000 */  nop
/* 9F17C 800AE97C 04004230 */  andi       $v0, $v0, 0x4
/* 9F180 800AE980 57004010 */  beqz       $v0, .L800AEAE0
/* 9F184 800AE984 21204002 */   addu      $a0, $s2, $zero
/* 9F188 800AE988 02000524 */  addiu      $a1, $zero, 0x2
/* 9F18C 800AE98C 21300000 */  addu       $a2, $zero, $zero
/* 9F190 800AE990 2138C000 */  addu       $a3, $a2, $zero
/* 9F194 800AE994 03000224 */  addiu      $v0, $zero, 0x3
/* 9F198 800AE998 1000A2AF */  sw         $v0, 0x10($sp)
/* 9F19C 800AE99C 2110A000 */  addu       $v0, $a1, $zero
/* 9F1A0 800AE9A0 20C8010C */  jal        G2EmulationSwitchAnimation
/* 9F1A4 800AE9A4 1400A2AF */   sw        $v0, 0x14($sp)
/* 9F1A8 800AE9A8 21204002 */  addu       $a0, $s2, $zero
/* 9F1AC 800AE9AC 21280000 */  addu       $a1, $zero, $zero
/* 9F1B0 800AE9B0 1F000624 */  addiu      $a2, $zero, 0x1F
/* 9F1B4 800AE9B4 2138A000 */  addu       $a3, $a1, $zero
/* 9F1B8 800AE9B8 1000A0AF */  sw         $zero, 0x10($sp)
/* 9F1BC 800AE9BC 20C8010C */  jal        G2EmulationSwitchAnimation
/* 9F1C0 800AE9C0 1400B5AF */   sw        $s5, 0x14($sp)
/* 9F1C4 800AE9C4 21204002 */  addu       $a0, $s2, $zero
/* 9F1C8 800AE9C8 01000524 */  addiu      $a1, $zero, 0x1
/* 9F1CC 800AE9CC 1F000624 */  addiu      $a2, $zero, 0x1F
.L800AE9D0:
/* 9F1D0 800AE9D0 21380000 */  addu       $a3, $zero, $zero
/* 9F1D4 800AE9D4 1000A0AF */  sw         $zero, 0x10($sp)
/* 9F1D8 800AE9D8 20C8010C */  jal        G2EmulationSwitchAnimation
/* 9F1DC 800AE9DC 1400B5AF */   sw        $s5, 0x14($sp)
/* 9F1E0 800AE9E0 B8BA0208 */  j          .L800AEAE0
/* 9F1E4 800AE9E4 00000000 */   nop
.L800AE9E8:
/* 9F1E8 800AE9E8 1800A727 */  addiu      $a3, $sp, 0x18
/* 9F1EC 800AE9EC 0000448E */  lw         $a0, 0x0($s2)
/* 9F1F0 800AE9F0 D2F98587 */  lh         $a1, %gp_rel(Raziel + 0x3A2)($gp)
/* 9F1F4 800AE9F4 D0F98687 */  lh         $a2, %gp_rel(Raziel + 0x3A0)($gp)
/* 9F1F8 800AE9F8 D4C2010C */  jal        PHYSOB_CheckSlideNormal
/* 9F1FC 800AE9FC 23280500 */   negu      $a1, $a1
/* 9F200 800AEA00 02404230 */  andi       $v0, $v0, 0x4002
/* 9F204 800AEA04 00400324 */  addiu      $v1, $zero, 0x4000
/* 9F208 800AEA08 35004314 */  bne        $v0, $v1, .L800AEAE0
/* 9F20C 800AEA0C 02000624 */   addiu     $a2, $zero, 0x2
/* 9F210 800AEA10 D2F98487 */  lh         $a0, %gp_rel(Raziel + 0x3A2)($gp)
/* 9F214 800AEA14 D0F98587 */  lh         $a1, %gp_rel(Raziel + 0x3A0)($gp)
/* 9F218 800AEA18 21380000 */  addu       $a3, $zero, $zero
/* 9F21C 800AEA1C 1000A0AF */  sw         $zero, 0x10($sp)
/* 9F220 800AEA20 21C4010C */  jal        SetObjectData
/* 9F224 800AEA24 23200400 */   negu      $a0, $a0
/* 9F228 800AEA28 21804000 */  addu       $s0, $v0, $zero
/* 9F22C 800AEA2C 21206002 */  addu       $a0, $s3, $zero
/* 9F230 800AEA30 8000053C */  lui        $a1, (0x800000 >> 16)
/* 9F234 800AEA34 A1D1000C */  jal        INSTANCE_Post
/* 9F238 800AEA38 21300002 */   addu      $a2, $s0, $zero
/* 9F23C 800AEA3C 0C00028E */  lw         $v0, 0xC($s0)
/* 9F240 800AEA40 00000000 */  nop
/* 9F244 800AEA44 04004230 */  andi       $v0, $v0, 0x4
/* 9F248 800AEA48 25004010 */  beqz       $v0, .L800AEAE0
/* 9F24C 800AEA4C 21204002 */   addu      $a0, $s2, $zero
/* 9F250 800AEA50 B0BA0208 */  j          .L800AEAC0
/* 9F254 800AEA54 1E000524 */   addiu     $a1, $zero, 0x1E
.L800AEA58:
/* 9F258 800AEA58 0000448E */  lw         $a0, 0x0($s2)
/* 9F25C 800AEA5C D0F98687 */  lh         $a2, %gp_rel(Raziel + 0x3A0)($gp)
/* 9F260 800AEA60 D2F98587 */  lh         $a1, %gp_rel(Raziel + 0x3A2)($gp)
/* 9F264 800AEA64 D4C2010C */  jal        PHYSOB_CheckSlideNormal
/* 9F268 800AEA68 23300600 */   negu      $a2, $a2
/* 9F26C 800AEA6C 02404230 */  andi       $v0, $v0, 0x4002
/* 9F270 800AEA70 00400324 */  addiu      $v1, $zero, 0x4000
/* 9F274 800AEA74 1A004314 */  bne        $v0, $v1, .L800AEAE0
/* 9F278 800AEA78 03000624 */   addiu     $a2, $zero, 0x3
/* 9F27C 800AEA7C D2F98487 */  lh         $a0, %gp_rel(Raziel + 0x3A2)($gp)
/* 9F280 800AEA80 D0F98587 */  lh         $a1, %gp_rel(Raziel + 0x3A0)($gp)
/* 9F284 800AEA84 21380000 */  addu       $a3, $zero, $zero
/* 9F288 800AEA88 1000A0AF */  sw         $zero, 0x10($sp)
/* 9F28C 800AEA8C 21C4010C */  jal        SetObjectData
/* 9F290 800AEA90 23280500 */   negu      $a1, $a1
/* 9F294 800AEA94 21804000 */  addu       $s0, $v0, $zero
/* 9F298 800AEA98 21206002 */  addu       $a0, $s3, $zero
/* 9F29C 800AEA9C 8000053C */  lui        $a1, (0x800000 >> 16)
/* 9F2A0 800AEAA0 A1D1000C */  jal        INSTANCE_Post
/* 9F2A4 800AEAA4 21300002 */   addu      $a2, $s0, $zero
/* 9F2A8 800AEAA8 0C00028E */  lw         $v0, 0xC($s0)
/* 9F2AC 800AEAAC 00000000 */  nop
/* 9F2B0 800AEAB0 04004230 */  andi       $v0, $v0, 0x4
/* 9F2B4 800AEAB4 0A004010 */  beqz       $v0, .L800AEAE0
/* 9F2B8 800AEAB8 21204002 */   addu      $a0, $s2, $zero
/* 9F2BC 800AEABC 2D000524 */  addiu      $a1, $zero, 0x2D
.L800AEAC0:
/* 9F2C0 800AEAC0 21300000 */  addu       $a2, $zero, $zero
/* 9F2C4 800AEAC4 2138C000 */  addu       $a3, $a2, $zero
/* 9F2C8 800AEAC8 FCC8010C */  jal        G2EmulationSwitchAnimationCharacter
/* 9F2CC 800AEACC 1000B5AF */   sw        $s5, 0x10($sp)
/* 9F2D0 800AEAD0 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 9F2D4 800AEAD4 F7FF0324 */  addiu      $v1, $zero, -0x9
/* 9F2D8 800AEAD8 24104300 */  and        $v0, $v0, $v1
/* 9F2DC 800AEADC C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
.L800AEAE0:
/* 9F2E0 800AEAE0 E1BF80A3 */  sb         $zero, %gp_rel(gameTrackerX + 0x219)($gp)
/* 9F2E4 800AEAE4 2DBB0208 */  j          .L800AECB4
/* 9F2E8 800AEAE8 00000000 */   nop
.L800AEAEC:
/* 9F2EC 800AEAEC 3A000012 */  beqz       $s0, .L800AEBD8
/* 9F2F0 800AEAF0 16000224 */   addiu     $v0, $zero, 0x16
/* 9F2F4 800AEAF4 38000212 */  beq        $s0, $v0, .L800AEBD8
/* 9F2F8 800AEAF8 14000224 */   addiu     $v0, $zero, 0x14
/* 9F2FC 800AEAFC 36000212 */  beq        $s0, $v0, .L800AEBD8
/* 9F300 800AEB00 00000000 */   nop
/* 9F304 800AEB04 2DBB0208 */  j          .L800AECB4
/* 9F308 800AEB08 00000000 */   nop
.L800AEB0C:
/* 9F30C 800AEB0C 17000224 */  addiu      $v0, $zero, 0x17
/* 9F310 800AEB10 0A000216 */  bne        $s0, $v0, .L800AEB3C
/* 9F314 800AEB14 21200000 */   addu      $a0, $zero, $zero
/* 9F318 800AEB18 21288000 */  addu       $a1, $a0, $zero
/* 9F31C 800AEB1C 4FC6010C */  jal        SetControlInitIdleData
/* 9F320 800AEB20 03000624 */   addiu     $a2, $zero, 0x3
/* 9F324 800AEB24 21204002 */  addu       $a0, $s2, $zero
/* 9F328 800AEB28 21288002 */  addu       $a1, $s4, $zero
/* 9F32C 800AEB2C 0B80063C */  lui        $a2, %hi(StateHandlerIdle)
/* 9F330 800AEB30 E084C624 */  addiu      $a2, $a2, %lo(StateHandlerIdle)
/* 9F334 800AEB34 C1CA010C */  jal        StateSwitchStateData
/* 9F338 800AEB38 21384000 */   addu      $a3, $v0, $zero
.L800AEB3C:
/* 9F33C 800AEB3C 33006012 */  beqz       $s3, .L800AEC0C
/* 9F340 800AEB40 21200000 */   addu      $a0, $zero, $zero
/* 9F344 800AEB44 14008016 */  bnez       $s4, .L800AEB98
/* 9F348 800AEB48 02000224 */   addiu     $v0, $zero, 0x2
/* 9F34C 800AEB4C 21206002 */  addu       $a0, $s3, $zero
/* 9F350 800AEB50 8000053C */  lui        $a1, (0x800004 >> 16)
/* 9F354 800AEB54 0400A534 */  ori        $a1, $a1, (0x800004 & 0xFFFF)
/* 9F358 800AEB58 A1D1000C */  jal        INSTANCE_Post
/* 9F35C 800AEB5C 21300000 */   addu      $a2, $zero, $zero
/* 9F360 800AEB60 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 9F364 800AEB64 00000000 */  nop
/* 9F368 800AEB68 08004234 */  ori        $v0, $v0, 0x8
/* 9F36C 800AEB6C C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 9F370 800AEB70 08000012 */  beqz       $s0, .L800AEB94
/* 9F374 800AEB74 16000224 */   addiu     $v0, $zero, 0x16
/* 9F378 800AEB78 06000212 */  beq        $s0, $v0, .L800AEB94
/* 9F37C 800AEB7C 14000224 */   addiu     $v0, $zero, 0x14
/* 9F380 800AEB80 04000212 */  beq        $s0, $v0, .L800AEB94
/* 9F384 800AEB84 21286002 */   addu      $a1, $s3, $zero
/* 9F388 800AEB88 0000448E */  lw         $a0, 0x0($s2)
/* 9F38C 800AEB8C 6C98020C */  jal        razCenterWithBlock
/* 9F390 800AEB90 73FF0624 */   addiu     $a2, $zero, -0x8D
.L800AEB94:
/* 9F394 800AEB94 02000224 */  addiu      $v0, $zero, 0x2
.L800AEB98:
/* 9F398 800AEB98 08008216 */  bne        $s4, $v0, .L800AEBBC
/* 9F39C 800AEB9C 21204002 */   addu      $a0, $s2, $zero
/* 9F3A0 800AEBA0 21284000 */  addu       $a1, $v0, $zero
/* 9F3A4 800AEBA4 21300000 */  addu       $a2, $zero, $zero
/* 9F3A8 800AEBA8 2138C000 */  addu       $a3, $a2, $zero
/* 9F3AC 800AEBAC 03000224 */  addiu      $v0, $zero, 0x3
/* 9F3B0 800AEBB0 1000A2AF */  sw         $v0, 0x10($sp)
/* 9F3B4 800AEBB4 F4BA0208 */  j          .L800AEBD0
/* 9F3B8 800AEBB8 1400B4AF */   sw        $s4, 0x14($sp)
.L800AEBBC:
/* 9F3BC 800AEBBC 21288002 */  addu       $a1, $s4, $zero
/* 9F3C0 800AEBC0 16000624 */  addiu      $a2, $zero, 0x16
/* 9F3C4 800AEBC4 21380000 */  addu       $a3, $zero, $zero
/* 9F3C8 800AEBC8 1000A2AF */  sw         $v0, 0x10($sp)
/* 9F3CC 800AEBCC 1400A2AF */  sw         $v0, 0x14($sp)
.L800AEBD0:
/* 9F3D0 800AEBD0 20C8010C */  jal        G2EmulationSwitchAnimation
/* 9F3D4 800AEBD4 00000000 */   nop
.L800AEBD8:
/* 9F3D8 800AEBD8 C4FC828F */  lw         $v0, %gp_rel(PadData)($gp)
/* 9F3DC 800AEBDC 8CA4838F */  lw         $v1, %gp_rel(RazielCommands + 0x8)($gp)
/* 9F3E0 800AEBE0 0000428C */  lw         $v0, 0x0($v0)
/* 9F3E4 800AEBE4 00000000 */  nop
/* 9F3E8 800AEBE8 24104300 */  and        $v0, $v0, $v1
/* 9F3EC 800AEBEC 31004014 */  bnez       $v0, .L800AECB4
/* 9F3F0 800AEBF0 0400C426 */   addiu     $a0, $s6, 0x4
/* 9F3F4 800AEBF4 1000053C */  lui        $a1, (0x100000 >> 16)
/* 9F3F8 800AEBF8 4EC3010C */  jal        EnMessageQueueData
/* 9F3FC 800AEBFC 21300000 */   addu      $a2, $zero, $zero
/* 9F400 800AEC00 2DBB0208 */  j          .L800AECB4
/* 9F404 800AEC04 00000000 */   nop
.L800AEC08:
/* 9F408 800AEC08 21200000 */  addu       $a0, $zero, $zero
.L800AEC0C:
/* 9F40C 800AEC0C 21288000 */  addu       $a1, $a0, $zero
/* 9F410 800AEC10 4FC6010C */  jal        SetControlInitIdleData
/* 9F414 800AEC14 03000624 */   addiu     $a2, $zero, 0x3
/* 9F418 800AEC18 21204002 */  addu       $a0, $s2, $zero
/* 9F41C 800AEC1C 21288002 */  addu       $a1, $s4, $zero
/* 9F420 800AEC20 0B80063C */  lui        $a2, %hi(StateHandlerIdle)
/* 9F424 800AEC24 E084C624 */  addiu      $a2, $a2, %lo(StateHandlerIdle)
/* 9F428 800AEC28 C1CA010C */  jal        StateSwitchStateData
/* 9F42C 800AEC2C 21384000 */   addu      $a3, $v0, $zero
/* 9F430 800AEC30 2DBB0208 */  j          .L800AECB4
/* 9F434 800AEC34 00000000 */   nop
.L800AEC38:
/* 9F438 800AEC38 1E008016 */  bnez       $s4, .L800AECB4
/* 9F43C 800AEC3C 16000224 */   addiu     $v0, $zero, 0x16
/* 9F440 800AEC40 07000216 */  bne        $s0, $v0, .L800AEC60
/* 9F444 800AEC44 21204002 */   addu      $a0, $s2, $zero
/* 9F448 800AEC48 0400268E */  lw         $a2, 0x4($s1)
/* 9F44C 800AEC4C 0A80053C */  lui        $a1, %hi(StateHandlerHitReaction)
/* 9F450 800AEC50 F4CA010C */  jal        StateSwitchStateCharacterData
/* 9F454 800AEC54 68D5A524 */   addiu     $a1, $a1, %lo(StateHandlerHitReaction)
/* 9F458 800AEC58 2DBB0208 */  j          .L800AECB4
/* 9F45C 800AEC5C 00000000 */   nop
.L800AEC60:
/* 9F460 800AEC60 1400E016 */  bnez       $s7, .L800AECB4
/* 9F464 800AEC64 00000000 */   nop
/* 9F468 800AEC68 0400228E */  lw         $v0, 0x4($s1)
/* 9F46C 800AEC6C 00000000 */  nop
/* 9F470 800AEC70 0A004384 */  lh         $v1, 0xA($v0)
/* 9F474 800AEC74 08004784 */  lh         $a3, 0x8($v0)
/* 9F478 800AEC78 1000A3AF */  sw         $v1, 0x10($sp)
/* 9F47C 800AEC7C 0000448C */  lw         $a0, 0x0($v0)
/* 9F480 800AEC80 0400458C */  lw         $a1, 0x4($v0)
/* 9F484 800AEC84 0C00468C */  lw         $a2, 0xC($v0)
/* 9F488 800AEC88 95C3010C */  jal        SetMonsterHitData
/* 9F48C 800AEC8C 01001724 */   addiu     $s7, $zero, 0x1
/* 9F490 800AEC90 94004426 */  addiu      $a0, $s2, 0x94
/* 9F494 800AEC94 0001053C */  lui        $a1, (0x1000000 >> 16)
/* 9F498 800AEC98 4EC3010C */  jal        EnMessageQueueData
/* 9F49C 800AEC9C 21304000 */   addu      $a2, $v0, $zero
/* 9F4A0 800AECA0 2DBB0208 */  j          .L800AECB4
/* 9F4A4 800AECA4 00000000 */   nop
.L800AECA8:
/* 9F4A8 800AECA8 21288002 */  addu       $a1, $s4, $zero
.L800AECAC:
/* 9F4AC 800AECAC B9BF020C */  jal        DefaultStateHandler
/* 9F4B0 800AECB0 2130C003 */   addu      $a2, $fp, $zero
.L800AECB4:
/* 9F4B4 800AECB4 27C3010C */  jal        DeMessageQueue
/* 9F4B8 800AECB8 0400C426 */   addiu     $a0, $s6, 0x4
/* 9F4BC 800AECBC A2B90208 */  j          .L800AE688
/* 9F4C0 800AECC0 00000000 */   nop
.L800AECC4:
/* 9F4C4 800AECC4 4400BF8F */  lw         $ra, 0x44($sp)
/* 9F4C8 800AECC8 4000BE8F */  lw         $fp, 0x40($sp)
/* 9F4CC 800AECCC 3C00B78F */  lw         $s7, 0x3C($sp)
/* 9F4D0 800AECD0 3800B68F */  lw         $s6, 0x38($sp)
/* 9F4D4 800AECD4 3400B58F */  lw         $s5, 0x34($sp)
/* 9F4D8 800AECD8 3000B48F */  lw         $s4, 0x30($sp)
/* 9F4DC 800AECDC 2C00B38F */  lw         $s3, 0x2C($sp)
/* 9F4E0 800AECE0 2800B28F */  lw         $s2, 0x28($sp)
/* 9F4E4 800AECE4 2400B18F */  lw         $s1, 0x24($sp)
/* 9F4E8 800AECE8 2000B08F */  lw         $s0, 0x20($sp)
/* 9F4EC 800AECEC 0800E003 */  jr         $ra
/* 9F4F0 800AECF0 4800BD27 */   addiu     $sp, $sp, 0x48
.size StateHandlerDragObject, . - StateHandlerDragObject
