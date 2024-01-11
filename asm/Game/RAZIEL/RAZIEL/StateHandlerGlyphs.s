.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StateHandlerGlyphs
/* 9FE50 800AF650 B8FFBD27 */  addiu      $sp, $sp, -0x48
/* 9FE54 800AF654 2C00B1AF */  sw         $s1, 0x2C($sp)
/* 9FE58 800AF658 21888000 */  addu       $s1, $a0, $zero
/* 9FE5C 800AF65C 3000B2AF */  sw         $s2, 0x30($sp)
/* 9FE60 800AF660 2190A000 */  addu       $s2, $a1, $zero
/* 9FE64 800AF664 4000B6AF */  sw         $s6, 0x40($sp)
/* 9FE68 800AF668 21B0C000 */  addu       $s6, $a2, $zero
/* 9FE6C 800AF66C 3C00B5AF */  sw         $s5, 0x3C($sp)
/* 9FE70 800AF670 21A80000 */  addu       $s5, $zero, $zero
/* 9FE74 800AF674 4400BFAF */  sw         $ra, 0x44($sp)
/* 9FE78 800AF678 3800B4AF */  sw         $s4, 0x38($sp)
/* 9FE7C 800AF67C 3400B3AF */  sw         $s3, 0x34($sp)
/* 9FE80 800AF680 A9C9010C */  jal        G2EmulationQueryAnimation
/* 9FE84 800AF684 2800B0AF */   sw        $s0, 0x28($sp)
/* 9FE88 800AF688 00300224 */  addiu      $v0, $zero, 0x3000
/* 9FE8C 800AF68C 34FA82AF */  sw         $v0, %gp_rel(Raziel + 0x404)($gp)
/* 9FE90 800AF690 C0101200 */  sll        $v0, $s2, 3
/* 9FE94 800AF694 21105200 */  addu       $v0, $v0, $s2
/* 9FE98 800AF698 C0100200 */  sll        $v0, $v0, 3
/* 9FE9C 800AF69C 23105200 */  subu       $v0, $v0, $s2
/* 9FEA0 800AF6A0 80100200 */  sll        $v0, $v0, 2
/* 9FEA4 800AF6A4 08004324 */  addiu      $v1, $v0, 0x8
/* 9FEA8 800AF6A8 21A02302 */  addu       $s4, $s1, $v1
/* 9FEAC 800AF6AC 21982202 */  addu       $s3, $s1, $v0
.L800AF6B0:
/* 9FEB0 800AF6B0 39C3010C */  jal        PeekMessageQueue
/* 9FEB4 800AF6B4 04008426 */   addiu     $a0, $s4, 0x4
/* 9FEB8 800AF6B8 21804000 */  addu       $s0, $v0, $zero
/* 9FEBC 800AF6BC FC010012 */  beqz       $s0, .L800AFEB0
/* 9FEC0 800AF6C0 0800023C */   lui       $v0, (0x80007 >> 16)
/* 9FEC4 800AF6C4 0000038E */  lw         $v1, 0x0($s0)
/* 9FEC8 800AF6C8 07004234 */  ori        $v0, $v0, (0x80007 & 0xFFFF)
/* 9FECC 800AF6CC 65016210 */  beq        $v1, $v0, .L800AFC64
/* 9FED0 800AF6D0 2A104300 */   slt       $v0, $v0, $v1
/* 9FED4 800AF6D4 38004014 */  bnez       $v0, .L800AF7B8
/* 9FED8 800AF6D8 0002023C */   lui       $v0, (0x2000000 >> 16)
/* 9FEDC 800AF6DC 0400023C */  lui        $v0, (0x40025 >> 16)
/* 9FEE0 800AF6E0 25004234 */  ori        $v0, $v0, (0x40025 & 0xFFFF)
/* 9FEE4 800AF6E4 E6016210 */  beq        $v1, $v0, .L800AFE80
/* 9FEE8 800AF6E8 2A104300 */   slt       $v0, $v0, $v1
/* 9FEEC 800AF6EC 1E004014 */  bnez       $v0, .L800AF768
/* 9FEF0 800AF6F0 0800023C */   lui       $v0, (0x80003 >> 16)
/* 9FEF4 800AF6F4 0080023C */  lui        $v0, (0x80000010 >> 16)
/* 9FEF8 800AF6F8 10004234 */  ori        $v0, $v0, (0x80000010 & 0xFFFF)
/* 9FEFC 800AF6FC DA006210 */  beq        $v1, $v0, .L800AFA68
/* 9FF00 800AF700 2A104300 */   slt       $v0, $v0, $v1
/* 9FF04 800AF704 08004014 */  bnez       $v0, .L800AF728
/* 9FF08 800AF708 0400023C */   lui       $v0, (0x40003 >> 16)
/* 9FF0C 800AF70C 0080023C */  lui        $v0, (0x80000008 >> 16)
/* 9FF10 800AF710 81016210 */  beq        $v1, $v0, .L800AFD18
/* 9FF14 800AF714 08004234 */   ori       $v0, $v0, (0x80000008 & 0xFFFF)
/* 9FF18 800AF718 E1016210 */  beq        $v1, $v0, .L800AFEA0
/* 9FF1C 800AF71C 21202002 */   addu      $a0, $s1, $zero
/* 9FF20 800AF720 A6BF0208 */  j          .L800AFE98
/* 9FF24 800AF724 21284002 */   addu      $a1, $s2, $zero
.L800AF728:
/* 9FF28 800AF728 03004234 */  ori        $v0, $v0, (0x40003 & 0xFFFF)
/* 9FF2C 800AF72C AE016210 */  beq        $v1, $v0, .L800AFDE8
/* 9FF30 800AF730 2A104300 */   slt       $v0, $v0, $v1
/* 9FF34 800AF734 07004014 */  bnez       $v0, .L800AF754
/* 9FF38 800AF738 0400023C */   lui       $v0, (0x40005 >> 16)
/* 9FF3C 800AF73C 0080023C */  lui        $v0, (0x80000020 >> 16)
/* 9FF40 800AF740 20004234 */  ori        $v0, $v0, (0x80000020 & 0xFFFF)
/* 9FF44 800AF744 D6016210 */  beq        $v1, $v0, .L800AFEA0
/* 9FF48 800AF748 21202002 */   addu      $a0, $s1, $zero
/* 9FF4C 800AF74C A6BF0208 */  j          .L800AFE98
/* 9FF50 800AF750 21284002 */   addu      $a1, $s2, $zero
.L800AF754:
/* 9FF54 800AF754 05004234 */  ori        $v0, $v0, (0x40005 & 0xFFFF)
/* 9FF58 800AF758 C9016210 */  beq        $v1, $v0, .L800AFE80
/* 9FF5C 800AF75C 21202002 */   addu      $a0, $s1, $zero
/* 9FF60 800AF760 A6BF0208 */  j          .L800AFE98
/* 9FF64 800AF764 21284002 */   addu      $a1, $s2, $zero
.L800AF768:
/* 9FF68 800AF768 03004234 */  ori        $v0, $v0, (0x80003 & 0xFFFF)
/* 9FF6C 800AF76C F3006210 */  beq        $v1, $v0, .L800AFB3C
/* 9FF70 800AF770 2A104300 */   slt       $v0, $v0, $v1
/* 9FF74 800AF774 09004014 */  bnez       $v0, .L800AF79C
/* 9FF78 800AF778 0800023C */   lui       $v0, (0x80001 >> 16)
/* 9FF7C 800AF77C 01004234 */  ori        $v0, $v0, (0x80001 & 0xFFFF)
/* 9FF80 800AF780 1B016210 */  beq        $v1, $v0, .L800AFBF0
/* 9FF84 800AF784 0800023C */   lui       $v0, (0x80002 >> 16)
/* 9FF88 800AF788 02004234 */  ori        $v0, $v0, (0x80002 & 0xFFFF)
/* 9FF8C 800AF78C 0F016210 */  beq        $v1, $v0, .L800AFBCC
/* 9FF90 800AF790 21202002 */   addu      $a0, $s1, $zero
/* 9FF94 800AF794 A6BF0208 */  j          .L800AFE98
/* 9FF98 800AF798 21284002 */   addu      $a1, $s2, $zero
.L800AF79C:
/* 9FF9C 800AF79C 05004234 */  ori        $v0, $v0, (0x80005 & 0xFFFF)
/* 9FFA0 800AF7A0 01016210 */  beq        $v1, $v0, .L800AFBA8
/* 9FFA4 800AF7A4 2A104300 */   slt       $v0, $v0, $v1
/* 9FFA8 800AF7A8 DB004010 */  beqz       $v0, .L800AFB18
/* 9FFAC 800AF7AC 00000000 */   nop
/* 9FFB0 800AF7B0 BDBE0208 */  j          .L800AFAF4
/* 9FFB4 800AF7B4 00000000 */   nop
.L800AF7B8:
/* 9FFB8 800AF7B8 57016210 */  beq        $v1, $v0, .L800AFD18
/* 9FFBC 800AF7BC 2A104300 */   slt       $v0, $v0, $v1
/* 9FFC0 800AF7C0 1D004014 */  bnez       $v0, .L800AF838
/* 9FFC4 800AF7C4 0204023C */   lui       $v0, (0x4020000 >> 16)
/* 9FFC8 800AF7C8 1000023C */  lui        $v0, (0x100004 >> 16)
/* 9FFCC 800AF7CC 04004234 */  ori        $v0, $v0, (0x100004 & 0xFFFF)
/* 9FFD0 800AF7D0 58006210 */  beq        $v1, $v0, .L800AF934
/* 9FFD4 800AF7D4 2A104300 */   slt       $v0, $v0, $v1
/* 9FFD8 800AF7D8 08004014 */  bnez       $v0, .L800AF7FC
/* 9FFDC 800AF7DC 0001023C */   lui       $v0, (0x1000000 >> 16)
/* 9FFE0 800AF7E0 1000023C */  lui        $v0, (0x100001 >> 16)
/* 9FFE4 800AF7E4 6B006210 */  beq        $v1, $v0, .L800AF994
/* 9FFE8 800AF7E8 01004234 */   ori       $v0, $v0, (0x100001 & 0xFFFF)
/* 9FFEC 800AF7EC 2D006210 */  beq        $v1, $v0, .L800AF8A4
/* 9FFF0 800AF7F0 21202002 */   addu      $a0, $s1, $zero
/* 9FFF4 800AF7F4 A6BF0208 */  j          .L800AFE98
/* 9FFF8 800AF7F8 21284002 */   addu      $a1, $s2, $zero
.L800AF7FC:
/* 9FFFC 800AF7FC 8B016210 */  beq        $v1, $v0, .L800AFE2C
/* A0000 800AF800 2A104300 */   slt       $v0, $v0, $v1
/* A0004 800AF804 07004014 */  bnez       $v0, .L800AF824
/* A0008 800AF808 0001023C */   lui       $v0, (0x1000001 >> 16)
/* A000C 800AF80C 1000023C */  lui        $v0, (0x100015 >> 16)
/* A0010 800AF810 15004234 */  ori        $v0, $v0, (0x100015 & 0xFFFF)
/* A0014 800AF814 57006210 */  beq        $v1, $v0, .L800AF974
/* A0018 800AF818 21202002 */   addu      $a0, $s1, $zero
/* A001C 800AF81C A6BF0208 */  j          .L800AFE98
/* A0020 800AF820 21284002 */   addu      $a1, $s2, $zero
.L800AF824:
/* A0024 800AF824 01004234 */  ori        $v0, $v0, (0x1000001 & 0xFFFF)
/* A0028 800AF828 9D016210 */  beq        $v1, $v0, .L800AFEA0
/* A002C 800AF82C 21202002 */   addu      $a0, $s1, $zero
/* A0030 800AF830 A6BF0208 */  j          .L800AFE98
/* A0034 800AF834 21284002 */   addu      $a1, $s2, $zero
.L800AF838:
/* A0038 800AF838 99016210 */  beq        $v1, $v0, .L800AFEA0
/* A003C 800AF83C 2A104300 */   slt       $v0, $v0, $v1
/* A0040 800AF840 0A004014 */  bnez       $v0, .L800AF86C
/* A0044 800AF844 0008023C */   lui       $v0, (0x8000003 >> 16)
/* A0048 800AF848 0004023C */  lui        $v0, (0x4000001 >> 16)
/* A004C 800AF84C 01004234 */  ori        $v0, $v0, (0x4000001 & 0xFFFF)
/* A0050 800AF850 59016210 */  beq        $v1, $v0, .L800AFDB8
/* A0054 800AF854 0104023C */   lui       $v0, (0x4010200 >> 16)
/* A0058 800AF858 00024234 */  ori        $v0, $v0, (0x4010200 & 0xFFFF)
/* A005C 800AF85C 90016210 */  beq        $v1, $v0, .L800AFEA0
/* A0060 800AF860 21202002 */   addu      $a0, $s1, $zero
/* A0064 800AF864 A6BF0208 */  j          .L800AFE98
/* A0068 800AF868 21284002 */   addu      $a1, $s2, $zero
.L800AF86C:
/* A006C 800AF86C 03004234 */  ori        $v0, $v0, (0x8000003 & 0xFFFF)
/* A0070 800AF870 40006210 */  beq        $v1, $v0, .L800AF974
/* A0074 800AF874 2A104300 */   slt       $v0, $v0, $v1
/* A0078 800AF878 06004014 */  bnez       $v0, .L800AF894
/* A007C 800AF87C 0010023C */   lui       $v0, (0x10000000 >> 16)
/* A0080 800AF880 0008023C */  lui        $v0, (0x8000000 >> 16)
/* A0084 800AF884 3B006210 */  beq        $v1, $v0, .L800AF974
/* A0088 800AF888 21202002 */   addu      $a0, $s1, $zero
/* A008C 800AF88C A6BF0208 */  j          .L800AFE98
/* A0090 800AF890 21284002 */   addu      $a1, $s2, $zero
.L800AF894:
/* A0094 800AF894 2D016210 */  beq        $v1, $v0, .L800AFD4C
/* A0098 800AF898 21202002 */   addu      $a0, $s1, $zero
/* A009C 800AF89C A6BF0208 */  j          .L800AFE98
/* A00A0 800AF8A0 21284002 */   addu      $a1, $s2, $zero
.L800AF8A4:
/* A00A4 800AF8A4 17004016 */  bnez       $s2, .L800AF904
/* A00A8 800AF8A8 01000224 */   addiu     $v0, $zero, 0x1
/* A00AC 800AF8AC 0400028E */  lw         $v0, 0x4($s0)
/* A00B0 800AF8B0 00000000 */  nop
/* A00B4 800AF8B4 07004014 */  bnez       $v0, .L800AF8D4
/* A00B8 800AF8B8 1001033C */   lui       $v1, (0x1100008 >> 16)
/* A00BC 800AF8BC 0080053C */  lui        $a1, (0x80000010 >> 16)
/* A00C0 800AF8C0 3CFA848F */  lw         $a0, %gp_rel(Raziel + 0x40C)($gp)
/* A00C4 800AF8C4 0000268E */  lw         $a2, 0x0($s1)
/* A00C8 800AF8C8 A1D1000C */  jal        INSTANCE_Post
/* A00CC 800AF8CC 1000A534 */   ori       $a1, $a1, (0x80000010 & 0xFFFF)
/* A00D0 800AF8D0 1001033C */  lui        $v1, (0x1100008 >> 16)
.L800AF8D4:
/* A00D4 800AF8D4 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* A00D8 800AF8D8 08006334 */  ori        $v1, $v1, (0x1100008 & 0xFFFF)
/* A00DC 800AF8DC 01004234 */  ori        $v0, $v0, 0x1
/* A00E0 800AF8E0 90F982AF */  sw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* A00E4 800AF8E4 0000248E */  lw         $a0, 0x0($s1)
/* A00E8 800AF8E8 C8FD83AF */  sw         $v1, %gp_rel(ControlFlag)($gp)
/* A00EC 800AF8EC 938B020C */  jal        SteerSwitchMode
/* A00F0 800AF8F0 10000524 */   addiu     $a1, $zero, 0x10
/* A00F4 800AF8F4 0000248E */  lw         $a0, 0x0($s1)
/* A00F8 800AF8F8 139B020C */  jal        razResetMotion
/* A00FC 800AF8FC 00000000 */   nop
/* A0100 800AF900 01000224 */  addiu      $v0, $zero, 0x1
.L800AF904:
/* A0104 800AF904 1C0162AE */  sw         $v0, 0x11C($s3)
/* A0108 800AF908 0400038E */  lw         $v1, 0x4($s0)
/* A010C 800AF90C 03000224 */  addiu      $v0, $zero, 0x3
/* A0110 800AF910 30FD82AF */  sw         $v0, %gp_rel(PhysicsMode)($gp)
/* A0114 800AF914 62016010 */  beqz       $v1, .L800AFEA0
/* A0118 800AF918 8C008426 */   addiu     $a0, $s4, 0x8C
/* A011C 800AF91C 0800053C */  lui        $a1, (0x80007 >> 16)
/* A0120 800AF920 0700A534 */  ori        $a1, $a1, (0x80007 & 0xFFFF)
/* A0124 800AF924 4EC3010C */  jal        EnMessageQueueData
/* A0128 800AF928 21300000 */   addu      $a2, $zero, $zero
/* A012C 800AF92C A8BF0208 */  j          .L800AFEA0
/* A0130 800AF930 00000000 */   nop
.L800AF934:
/* A0134 800AF934 0C004016 */  bnez       $s2, .L800AF968
/* A0138 800AF938 00000000 */   nop
/* A013C 800AF93C 8597020C */  jal        razReaverOn
/* A0140 800AF940 00000000 */   nop
/* A0144 800AF944 3CFA848F */  lw         $a0, %gp_rel(Raziel + 0x40C)($gp)
/* A0148 800AF948 81EB010C */  jal        GlyphIsGlyphOpen
/* A014C 800AF94C 00000000 */   nop
/* A0150 800AF950 05004010 */  beqz       $v0, .L800AF968
/* A0154 800AF954 0080053C */   lui       $a1, (0x80000010 >> 16)
/* A0158 800AF958 3CFA848F */  lw         $a0, %gp_rel(Raziel + 0x40C)($gp)
/* A015C 800AF95C 0000268E */  lw         $a2, 0x0($s1)
/* A0160 800AF960 A1D1000C */  jal        INSTANCE_Post
/* A0164 800AF964 1000A534 */   ori       $a1, $a1, (0x80000010 & 0xFFFF)
.L800AF968:
/* A0168 800AF968 34FA80AF */  sw         $zero, %gp_rel(Raziel + 0x404)($gp)
/* A016C 800AF96C A8BF0208 */  j          .L800AFEA0
/* A0170 800AF970 00000000 */   nop
.L800AF974:
/* A0174 800AF974 4A014016 */  bnez       $s2, .L800AFEA0
/* A0178 800AF978 00000000 */   nop
/* A017C 800AF97C 0000248E */  lw         $a0, 0x0($s1)
/* A0180 800AF980 0000058E */  lw         $a1, 0x0($s0)
/* A0184 800AF984 739D020C */  jal        CheckStringAnimation
/* A0188 800AF988 00000000 */   nop
/* A018C 800AF98C A8BF0208 */  j          .L800AFEA0
/* A0190 800AF990 00000000 */   nop
.L800AF994:
/* A0194 800AF994 1C01648E */  lw         $a0, 0x11C($s3)
/* A0198 800AF998 00000000 */  nop
/* A019C 800AF99C 22008014 */  bnez       $a0, .L800AFA28
/* A01A0 800AF9A0 0400033C */   lui       $v1, (0x40000 >> 16)
/* A01A4 800AF9A4 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* A01A8 800AF9A8 00000000 */  nop
/* A01AC 800AF9AC 24104300 */  and        $v0, $v0, $v1
/* A01B0 800AF9B0 0B004010 */  beqz       $v0, .L800AF9E0
/* A01B4 800AF9B4 01000224 */   addiu     $v0, $zero, 0x1
/* A01B8 800AF9B8 68FA838F */  lw         $v1, %gp_rel(Raziel + 0x438)($gp)
/* A01BC 800AF9BC 00000000 */  nop
/* A01C0 800AF9C0 08006214 */  bne        $v1, $v0, .L800AF9E4
/* A01C4 800AF9C4 21200000 */   addu      $a0, $zero, $zero
/* A01C8 800AF9C8 21202002 */  addu       $a0, $s1, $zero
/* A01CC 800AF9CC 21284002 */  addu       $a1, $s2, $zero
/* A01D0 800AF9D0 0A80063C */  lui        $a2, %hi(StateHandlerSwim)
/* A01D4 800AF9D4 0C02C624 */  addiu      $a2, $a2, %lo(StateHandlerSwim)
/* A01D8 800AF9D8 81BE0208 */  j          .L800AFA04
/* A01DC 800AF9DC 21380000 */   addu      $a3, $zero, $zero
.L800AF9E0:
/* A01E0 800AF9E0 21200000 */  addu       $a0, $zero, $zero
.L800AF9E4:
/* A01E4 800AF9E4 21288000 */  addu       $a1, $a0, $zero
/* A01E8 800AF9E8 4FC6010C */  jal        SetControlInitIdleData
/* A01EC 800AF9EC 03000624 */   addiu     $a2, $zero, 0x3
/* A01F0 800AF9F0 21202002 */  addu       $a0, $s1, $zero
/* A01F4 800AF9F4 21284002 */  addu       $a1, $s2, $zero
/* A01F8 800AF9F8 0B80063C */  lui        $a2, %hi(StateHandlerIdle)
/* A01FC 800AF9FC E084C624 */  addiu      $a2, $a2, %lo(StateHandlerIdle)
/* A0200 800AFA00 21384000 */  addu       $a3, $v0, $zero
.L800AFA04:
/* A0204 800AFA04 C1CA010C */  jal        StateSwitchStateData
/* A0208 800AFA08 00000000 */   nop
/* A020C 800AFA0C 24014016 */  bnez       $s2, .L800AFEA0
/* A0210 800AFA10 00100424 */   addiu     $a0, $zero, 0x1000
/* A0214 800AFA14 21280000 */  addu       $a1, $zero, $zero
/* A0218 800AFA18 7F95020C */  jal        razSetFadeEffect
/* A021C 800AFA1C 00010624 */   addiu     $a2, $zero, 0x100
/* A0220 800AFA20 A8BF0208 */  j          .L800AFEA0
/* A0224 800AFA24 00000000 */   nop
.L800AFA28:
/* A0228 800AFA28 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* A022C 800AFA2C 00000000 */  nop
/* A0230 800AFA30 24104300 */  and        $v0, $v0, $v1
/* A0234 800AFA34 1A014014 */  bnez       $v0, .L800AFEA0
/* A0238 800AFA38 02001024 */   addiu     $s0, $zero, 0x2
/* A023C 800AFA3C 18019010 */  beq        $a0, $s0, .L800AFEA0
/* A0240 800AFA40 21200000 */   addu      $a0, $zero, $zero
/* A0244 800AFA44 21288000 */  addu       $a1, $a0, $zero
/* A0248 800AFA48 4FC6010C */  jal        SetControlInitIdleData
/* A024C 800AFA4C 03000624 */   addiu     $a2, $zero, 0x3
/* A0250 800AFA50 21202002 */  addu       $a0, $s1, $zero
/* A0254 800AFA54 21284002 */  addu       $a1, $s2, $zero
/* A0258 800AFA58 8FA0020C */  jal        StateInitIdle
/* A025C 800AFA5C 21304000 */   addu      $a2, $v0, $zero
/* A0260 800AFA60 A8BF0208 */  j          .L800AFEA0
/* A0264 800AFA64 1C0170AE */   sw        $s0, 0x11C($s3)
.L800AFA68:
/* A0268 800AFA68 1C01628E */  lw         $v0, 0x11C($s3)
/* A026C 800AFA6C 00000000 */  nop
/* A0270 800AFA70 0B014010 */  beqz       $v0, .L800AFEA0
/* A0274 800AFA74 00000000 */   nop
/* A0278 800AFA78 06004016 */  bnez       $s2, .L800AFA94
/* A027C 800AFA7C 0080053C */   lui       $a1, (0x80000010 >> 16)
/* A0280 800AFA80 1C0120AE */  sw         $zero, 0x11C($s1)
/* A0284 800AFA84 3CFA848F */  lw         $a0, %gp_rel(Raziel + 0x40C)($gp)
/* A0288 800AFA88 0000268E */  lw         $a2, 0x0($s1)
/* A028C 800AFA8C A1D1000C */  jal        INSTANCE_Post
/* A0290 800AFA90 1000A534 */   ori       $a1, $a1, (0x80000010 & 0xFFFF)
.L800AFA94:
/* A0294 800AFA94 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* A0298 800AFA98 0400033C */  lui        $v1, (0x40000 >> 16)
/* A029C 800AFA9C 24104300 */  and        $v0, $v0, $v1
/* A02A0 800AFAA0 08004010 */  beqz       $v0, .L800AFAC4
/* A02A4 800AFAA4 21202002 */   addu      $a0, $s1, $zero
/* A02A8 800AFAA8 21284002 */  addu       $a1, $s2, $zero
/* A02AC 800AFAAC 0A80063C */  lui        $a2, %hi(StateHandlerSwim)
/* A02B0 800AFAB0 0C02C624 */  addiu      $a2, $a2, %lo(StateHandlerSwim)
/* A02B4 800AFAB4 C1CA010C */  jal        StateSwitchStateData
/* A02B8 800AFAB8 21380000 */   addu      $a3, $zero, $zero
/* A02BC 800AFABC A8BF0208 */  j          .L800AFEA0
/* A02C0 800AFAC0 00000000 */   nop
.L800AFAC4:
/* A02C4 800AFAC4 21200000 */  addu       $a0, $zero, $zero
/* A02C8 800AFAC8 21288000 */  addu       $a1, $a0, $zero
/* A02CC 800AFACC 4FC6010C */  jal        SetControlInitIdleData
/* A02D0 800AFAD0 03000624 */   addiu     $a2, $zero, 0x3
/* A02D4 800AFAD4 21202002 */  addu       $a0, $s1, $zero
/* A02D8 800AFAD8 21284002 */  addu       $a1, $s2, $zero
/* A02DC 800AFADC 0B80063C */  lui        $a2, %hi(StateHandlerIdle)
/* A02E0 800AFAE0 E084C624 */  addiu      $a2, $a2, %lo(StateHandlerIdle)
/* A02E4 800AFAE4 C1CA010C */  jal        StateSwitchStateData
/* A02E8 800AFAE8 21384000 */   addu      $a3, $v0, $zero
/* A02EC 800AFAEC A8BF0208 */  j          .L800AFEA0
/* A02F0 800AFAF0 00000000 */   nop
.L800AFAF4:
/* A02F4 800AFAF4 59004016 */  bnez       $s2, .L800AFC5C
/* A02F8 800AFAF8 00000000 */   nop
/* A02FC 800AFAFC C19F020C */  jal        razPrepGlyph
/* A0300 800AFB00 00000000 */   nop
/* A0304 800AFB04 0000248E */  lw         $a0, 0x0($s1)
/* A0308 800AFB08 419D020C */  jal        razSwitchStringAnimation
/* A030C 800AFB0C 06000524 */   addiu     $a1, $zero, 0x6
/* A0310 800AFB10 A8BF0208 */  j          .L800AFEA0
/* A0314 800AFB14 1C0160AE */   sw        $zero, 0x11C($s3)
.L800AFB18:
/* A0318 800AFB18 50004016 */  bnez       $s2, .L800AFC5C
/* A031C 800AFB1C 00000000 */   nop
/* A0320 800AFB20 C19F020C */  jal        razPrepGlyph
/* A0324 800AFB24 00000000 */   nop
/* A0328 800AFB28 0000248E */  lw         $a0, 0x0($s1)
/* A032C 800AFB2C 419D020C */  jal        razSwitchStringAnimation
/* A0330 800AFB30 05000524 */   addiu     $a1, $zero, 0x5
/* A0334 800AFB34 A8BF0208 */  j          .L800AFEA0
/* A0338 800AFB38 1C0160AE */   sw        $zero, 0x11C($s3)
.L800AFB3C:
/* A033C 800AFB3C 47004016 */  bnez       $s2, .L800AFC5C
/* A0340 800AFB40 00000000 */   nop
/* A0344 800AFB44 C19F020C */  jal        razPrepGlyph
/* A0348 800AFB48 0300103C */   lui       $s0, (0x32000 >> 16)
/* A034C 800AFB4C 04000524 */  addiu      $a1, $zero, 0x4
/* A0350 800AFB50 0000248E */  lw         $a0, 0x0($s1)
/* A0354 800AFB54 419D020C */  jal        razSwitchStringAnimation
/* A0358 800AFB58 00201036 */   ori       $s0, $s0, (0x32000 & 0xFFFF)
/* A035C 800AFB5C 94FB8527 */  addiu      $a1, $gp, %gp_rel(Raziel + 0x564)
/* A0360 800AFB60 13000624 */  addiu      $a2, $zero, 0x13
/* A0364 800AFB64 4CFB838F */  lw         $v1, %gp_rel(Raziel + 0x51C)($gp)
/* A0368 800AFB68 EE020224 */  addiu      $v0, $zero, 0x2EE
/* A036C 800AFB6C 1000A2AF */  sw         $v0, 0x10($sp)
/* A0370 800AFB70 3C000224 */  addiu      $v0, $zero, 0x3C
/* A0374 800AFB74 1400A2AF */  sw         $v0, 0x14($sp)
/* A0378 800AFB78 78000224 */  addiu      $v0, $zero, 0x78
/* A037C 800AFB7C 1800A2AF */  sw         $v0, 0x18($sp)
/* A0380 800AFB80 AC0D0224 */  addiu      $v0, $zero, 0xDAC
/* A0384 800AFB84 1C00B0AF */  sw         $s0, 0x1C($sp)
/* A0388 800AFB88 2000A2AF */  sw         $v0, 0x20($sp)
/* A038C 800AFB8C 04006334 */  ori        $v1, $v1, 0x4
/* A0390 800AFB90 4CFB83AF */  sw         $v1, %gp_rel(Raziel + 0x51C)($gp)
/* A0394 800AFB94 0000248E */  lw         $a0, 0x0($s1)
/* A0398 800AFB98 509F020C */  jal        razSetupSoundRamp
/* A039C 800AFB9C 58020724 */   addiu     $a3, $zero, 0x258
/* A03A0 800AFBA0 15BF0208 */  j          .L800AFC54
/* A03A4 800AFBA4 01000224 */   addiu     $v0, $zero, 0x1
.L800AFBA8:
/* A03A8 800AFBA8 2C004016 */  bnez       $s2, .L800AFC5C
/* A03AC 800AFBAC 00000000 */   nop
/* A03B0 800AFBB0 C19F020C */  jal        razPrepGlyph
/* A03B4 800AFBB4 00000000 */   nop
/* A03B8 800AFBB8 0000248E */  lw         $a0, 0x0($s1)
/* A03BC 800AFBBC 419D020C */  jal        razSwitchStringAnimation
/* A03C0 800AFBC0 03000524 */   addiu     $a1, $zero, 0x3
/* A03C4 800AFBC4 A8BF0208 */  j          .L800AFEA0
/* A03C8 800AFBC8 1C0160AE */   sw        $zero, 0x11C($s3)
.L800AFBCC:
/* A03CC 800AFBCC 23004016 */  bnez       $s2, .L800AFC5C
/* A03D0 800AFBD0 00000000 */   nop
/* A03D4 800AFBD4 C19F020C */  jal        razPrepGlyph
/* A03D8 800AFBD8 00000000 */   nop
/* A03DC 800AFBDC 0000248E */  lw         $a0, 0x0($s1)
/* A03E0 800AFBE0 419D020C */  jal        razSwitchStringAnimation
/* A03E4 800AFBE4 02000524 */   addiu     $a1, $zero, 0x2
/* A03E8 800AFBE8 A8BF0208 */  j          .L800AFEA0
/* A03EC 800AFBEC 1C0160AE */   sw        $zero, 0x11C($s3)
.L800AFBF0:
/* A03F0 800AFBF0 1A004016 */  bnez       $s2, .L800AFC5C
/* A03F4 800AFBF4 00000000 */   nop
/* A03F8 800AFBF8 C19F020C */  jal        razPrepGlyph
/* A03FC 800AFBFC 0400103C */   lui       $s0, (0x4D000 >> 16)
/* A0400 800AFC00 01000524 */  addiu      $a1, $zero, 0x1
/* A0404 800AFC04 0000248E */  lw         $a0, 0x0($s1)
/* A0408 800AFC08 419D020C */  jal        razSwitchStringAnimation
/* A040C 800AFC0C 00D01036 */   ori       $s0, $s0, (0x4D000 & 0xFFFF)
/* A0410 800AFC10 94FB8527 */  addiu      $a1, $gp, %gp_rel(Raziel + 0x564)
/* A0414 800AFC14 0C000624 */  addiu      $a2, $zero, 0xC
/* A0418 800AFC18 4CFB838F */  lw         $v1, %gp_rel(Raziel + 0x51C)($gp)
/* A041C 800AFC1C 7D000224 */  addiu      $v0, $zero, 0x7D
/* A0420 800AFC20 1000A2AF */  sw         $v0, 0x10($sp)
/* A0424 800AFC24 50000224 */  addiu      $v0, $zero, 0x50
/* A0428 800AFC28 1400A2AF */  sw         $v0, 0x14($sp)
/* A042C 800AFC2C 1800A2AF */  sw         $v0, 0x18($sp)
/* A0430 800AFC30 AC0D0224 */  addiu      $v0, $zero, 0xDAC
/* A0434 800AFC34 1C00B0AF */  sw         $s0, 0x1C($sp)
/* A0438 800AFC38 2000A2AF */  sw         $v0, 0x20($sp)
/* A043C 800AFC3C 04006334 */  ori        $v1, $v1, 0x4
/* A0440 800AFC40 4CFB83AF */  sw         $v1, %gp_rel(Raziel + 0x51C)($gp)
/* A0444 800AFC44 0000248E */  lw         $a0, 0x0($s1)
/* A0448 800AFC48 509F020C */  jal        razSetupSoundRamp
/* A044C 800AFC4C 21380000 */   addu      $a3, $zero, $zero
/* A0450 800AFC50 03000224 */  addiu      $v0, $zero, 0x3
.L800AFC54:
/* A0454 800AFC54 C4FB90AF */  sw         $s0, %gp_rel(Raziel + 0x594)($gp)
/* A0458 800AFC58 C8FB82AF */  sw         $v0, %gp_rel(Raziel + 0x598)($gp)
.L800AFC5C:
/* A045C 800AFC5C A8BF0208 */  j          .L800AFEA0
/* A0460 800AFC60 1C0160AE */   sw        $zero, 0x11C($s3)
.L800AFC64:
/* A0464 800AFC64 1C01628E */  lw         $v0, 0x11C($s3)
/* A0468 800AFC68 00000000 */  nop
/* A046C 800AFC6C 8C004010 */  beqz       $v0, .L800AFEA0
/* A0470 800AFC70 00000000 */   nop
/* A0474 800AFC74 06004016 */  bnez       $s2, .L800AFC90
/* A0478 800AFC78 00000000 */   nop
/* A047C 800AFC7C C19F020C */  jal        razPrepGlyph
/* A0480 800AFC80 00000000 */   nop
/* A0484 800AFC84 0000248E */  lw         $a0, 0x0($s1)
/* A0488 800AFC88 419D020C */  jal        razSwitchStringAnimation
/* A048C 800AFC8C 21280000 */   addu      $a1, $zero, $zero
.L800AFC90:
/* A0490 800AFC90 1C004016 */  bnez       $s2, .L800AFD04
/* A0494 800AFC94 1C0160AE */   sw        $zero, 0x11C($s3)
/* A0498 800AFC98 0000248E */  lw         $a0, 0x0($s1)
/* A049C 800AFC9C 8895020C */  jal        razPlaneShift
/* A04A0 800AFCA0 00000000 */   nop
/* A04A4 800AFCA4 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* A04A8 800AFCA8 0400033C */  lui        $v1, (0x40000 >> 16)
/* A04AC 800AFCAC 24104300 */  and        $v0, $v0, $v1
/* A04B0 800AFCB0 08004010 */  beqz       $v0, .L800AFCD4
/* A04B4 800AFCB4 00000000 */   nop
/* A04B8 800AFCB8 0000258E */  lw         $a1, 0x0($s1)
/* A04BC 800AFCBC 90AC8427 */  addiu      $a0, $gp, %gp_rel(theCamera)
/* A04C0 800AFCC0 F170000C */  jal        CAMERA_ChangeToOutOfWater
/* A04C4 800AFCC4 00000000 */   nop
/* A04C8 800AFCC8 0000248E */  lw         $a0, 0x0($s1)
/* A04CC 800AFCCC 938B020C */  jal        SteerSwitchMode
/* A04D0 800AFCD0 06000524 */   addiu     $a1, $zero, 0x6
.L800AFCD4:
/* A04D4 800AFCD4 0000248E */  lw         $a0, 0x0($s1)
/* A04D8 800AFCD8 938B020C */  jal        SteerSwitchMode
/* A04DC 800AFCDC 21280000 */   addu      $a1, $zero, $zero
/* A04E0 800AFCE0 DCFB828F */  lw         $v0, %gp_rel(Raziel + 0x5AC)($gp)
/* A04E4 800AFCE4 00000000 */  nop
/* A04E8 800AFCE8 00204230 */  andi       $v0, $v0, 0x2000
/* A04EC 800AFCEC 06004010 */  beqz       $v0, .L800AFD08
/* A04F0 800AFCF0 0100023C */   lui       $v0, (0x1E000 >> 16)
/* A04F4 800AFCF4 C89E020C */  jal        razSetPlayerEventHistory
/* A04F8 800AFCF8 00200424 */   addiu     $a0, $zero, 0x2000
/* A04FC 800AFCFC 8183010C */  jal        HINT_KillSpecificHint
/* A0500 800AFD00 28000424 */   addiu     $a0, $zero, 0x28
.L800AFD04:
/* A0504 800AFD04 0100023C */  lui        $v0, (0x1E000 >> 16)
.L800AFD08:
/* A0508 800AFD08 00E04234 */  ori        $v0, $v0, (0x1E000 & 0xFFFF)
/* A050C 800AFD0C 34FA82AF */  sw         $v0, %gp_rel(Raziel + 0x404)($gp)
/* A0510 800AFD10 A8BF0208 */  j          .L800AFEA0
/* A0514 800AFD14 00000000 */   nop
.L800AFD18:
/* A0518 800AFD18 1C01628E */  lw         $v0, 0x11C($s3)
/* A051C 800AFD1C 00000000 */  nop
/* A0520 800AFD20 5F004010 */  beqz       $v0, .L800AFEA0
/* A0524 800AFD24 00000000 */   nop
/* A0528 800AFD28 5D004016 */  bnez       $s2, .L800AFEA0
/* A052C 800AFD2C 0080053C */   lui       $a1, (0x80000000 >> 16)
/* A0530 800AFD30 3CFA848F */  lw         $a0, %gp_rel(Raziel + 0x40C)($gp)
/* A0534 800AFD34 A1D1000C */  jal        INSTANCE_Post
/* A0538 800AFD38 21300000 */   addu      $a2, $zero, $zero
/* A053C 800AFD3C 36C3010C */  jal        PurgeMessageQueue
/* A0540 800AFD40 0C002426 */   addiu     $a0, $s1, 0xC
/* A0544 800AFD44 A8BF0208 */  j          .L800AFEA0
/* A0548 800AFD48 00000000 */   nop
.L800AFD4C:
/* A054C 800AFD4C 54004016 */  bnez       $s2, .L800AFEA0
/* A0550 800AFD50 00000000 */   nop
/* A0554 800AFD54 C4FC828F */  lw         $v0, %gp_rel(PadData)($gp)
/* A0558 800AFD58 00000000 */  nop
/* A055C 800AFD5C 0000428C */  lw         $v0, 0x0($v0)
/* A0560 800AFD60 00000000 */  nop
/* A0564 800AFD64 04004230 */  andi       $v0, $v0, 0x4
/* A0568 800AFD68 06004010 */  beqz       $v0, .L800AFD84
/* A056C 800AFD6C 00000000 */   nop
/* A0570 800AFD70 0010053C */  lui        $a1, (0x10000004 >> 16)
/* A0574 800AFD74 3CFA848F */  lw         $a0, %gp_rel(Raziel + 0x40C)($gp)
/* A0578 800AFD78 0400068E */  lw         $a2, 0x4($s0)
/* A057C 800AFD7C A1D1000C */  jal        INSTANCE_Post
/* A0580 800AFD80 0400A534 */   ori       $a1, $a1, (0x10000004 & 0xFFFF)
.L800AFD84:
/* A0584 800AFD84 C4FC828F */  lw         $v0, %gp_rel(PadData)($gp)
/* A0588 800AFD88 00000000 */  nop
/* A058C 800AFD8C 0000428C */  lw         $v0, 0x0($v0)
/* A0590 800AFD90 00000000 */  nop
/* A0594 800AFD94 08004230 */  andi       $v0, $v0, 0x8
/* A0598 800AFD98 41004010 */  beqz       $v0, .L800AFEA0
/* A059C 800AFD9C 0010053C */   lui       $a1, (0x10000002 >> 16)
/* A05A0 800AFDA0 3CFA848F */  lw         $a0, %gp_rel(Raziel + 0x40C)($gp)
/* A05A4 800AFDA4 0400068E */  lw         $a2, 0x4($s0)
/* A05A8 800AFDA8 A1D1000C */  jal        INSTANCE_Post
/* A05AC 800AFDAC 0200A534 */   ori       $a1, $a1, (0x10000002 & 0xFFFF)
/* A05B0 800AFDB0 A8BF0208 */  j          .L800AFEA0
/* A05B4 800AFDB4 00000000 */   nop
.L800AFDB8:
/* A05B8 800AFDB8 90F98527 */  addiu      $a1, $gp, %gp_rel(Raziel + 0x360)
/* A05BC 800AFDBC 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* A05C0 800AFDC0 0400033C */  lui        $v1, (0x40000 >> 16)
/* A05C4 800AFDC4 24104300 */  and        $v0, $v0, $v1
/* A05C8 800AFDC8 35004014 */  bnez       $v0, .L800AFEA0
/* A05CC 800AFDCC 00000000 */   nop
/* A05D0 800AFDD0 0000248E */  lw         $a0, 0x0($s1)
/* A05D4 800AFDD4 30FD80AF */  sw         $zero, %gp_rel(PhysicsMode)($gp)
/* A05D8 800AFDD8 1069020C */  jal        SetDropPhysics
/* A05DC 800AFDDC A0FCA524 */   addiu     $a1, $a1, -0x360
/* A05E0 800AFDE0 A8BF0208 */  j          .L800AFEA0
/* A05E4 800AFDE4 00000000 */   nop
.L800AFDE8:
/* A05E8 800AFDE8 0400028E */  lw         $v0, 0x4($s0)
/* A05EC 800AFDEC 00000000 */  nop
/* A05F0 800AFDF0 1000438C */  lw         $v1, 0x10($v0)
/* A05F4 800AFDF4 00000000 */  nop
/* A05F8 800AFDF8 1000A3AF */  sw         $v1, 0x10($sp)
/* A05FC 800AFDFC 1400438C */  lw         $v1, 0x14($v0)
/* A0600 800AFE00 00000000 */  nop
/* A0604 800AFE04 1400A3AF */  sw         $v1, 0x14($sp)
/* A0608 800AFE08 0000448C */  lw         $a0, 0x0($v0)
/* A060C 800AFE0C 0400458C */  lw         $a1, 0x4($v0)
/* A0610 800AFE10 0800468C */  lw         $a2, 0x8($v0)
/* A0614 800AFE14 0C00478C */  lw         $a3, 0xC($v0)
/* A0618 800AFE18 AEC6010C */  jal        SetActionPlayHostAnimationData
/* A061C 800AFE1C 00000000 */   nop
/* A0620 800AFE20 0000058E */  lw         $a1, 0x0($s0)
/* A0624 800AFE24 9CBF0208 */  j          .L800AFE70
/* A0628 800AFE28 8C008426 */   addiu     $a0, $s4, 0x8C
.L800AFE2C:
/* A062C 800AFE2C 0400038E */  lw         $v1, 0x4($s0)
/* A0630 800AFE30 1B00A016 */  bnez       $s5, .L800AFEA0
/* A0634 800AFE34 00000000 */   nop
/* A0638 800AFE38 34FA828F */  lw         $v0, %gp_rel(Raziel + 0x404)($gp)
/* A063C 800AFE3C 00000000 */  nop
/* A0640 800AFE40 17004014 */  bnez       $v0, .L800AFEA0
/* A0644 800AFE44 00000000 */   nop
/* A0648 800AFE48 0A006284 */  lh         $v0, 0xA($v1)
/* A064C 800AFE4C 08006784 */  lh         $a3, 0x8($v1)
/* A0650 800AFE50 1000A2AF */  sw         $v0, 0x10($sp)
/* A0654 800AFE54 0000648C */  lw         $a0, 0x0($v1)
/* A0658 800AFE58 0400658C */  lw         $a1, 0x4($v1)
/* A065C 800AFE5C 0C00668C */  lw         $a2, 0xC($v1)
/* A0660 800AFE60 95C3010C */  jal        SetMonsterHitData
/* A0664 800AFE64 01001524 */   addiu     $s5, $zero, 0x1
/* A0668 800AFE68 8C008426 */  addiu      $a0, $s4, 0x8C
/* A066C 800AFE6C 0001053C */  lui        $a1, (0x1000000 >> 16)
.L800AFE70:
/* A0670 800AFE70 4EC3010C */  jal        EnMessageQueueData
/* A0674 800AFE74 21304000 */   addu      $a2, $v0, $zero
/* A0678 800AFE78 A8BF0208 */  j          .L800AFEA0
/* A067C 800AFE7C 00000000 */   nop
.L800AFE80:
/* A0680 800AFE80 0000058E */  lw         $a1, 0x0($s0)
/* A0684 800AFE84 0400068E */  lw         $a2, 0x4($s0)
/* A0688 800AFE88 4EC3010C */  jal        EnMessageQueueData
/* A068C 800AFE8C 8C008426 */   addiu     $a0, $s4, 0x8C
/* A0690 800AFE90 A8BF0208 */  j          .L800AFEA0
/* A0694 800AFE94 00000000 */   nop
.L800AFE98:
/* A0698 800AFE98 B9BF020C */  jal        DefaultStateHandler
/* A069C 800AFE9C 2130C002 */   addu      $a2, $s6, $zero
.L800AFEA0:
/* A06A0 800AFEA0 27C3010C */  jal        DeMessageQueue
/* A06A4 800AFEA4 04008426 */   addiu     $a0, $s4, 0x4
/* A06A8 800AFEA8 ACBD0208 */  j          .L800AF6B0
/* A06AC 800AFEAC 00000000 */   nop
.L800AFEB0:
/* A06B0 800AFEB0 0000238E */  lw         $v1, 0x0($s1)
/* A06B4 800AFEB4 FFFF0224 */  addiu      $v0, $zero, -0x1
/* A06B8 800AFEB8 C80062A4 */  sh         $v0, 0xC8($v1)
/* A06BC 800AFEBC 4400BF8F */  lw         $ra, 0x44($sp)
/* A06C0 800AFEC0 4000B68F */  lw         $s6, 0x40($sp)
/* A06C4 800AFEC4 3C00B58F */  lw         $s5, 0x3C($sp)
/* A06C8 800AFEC8 3800B48F */  lw         $s4, 0x38($sp)
/* A06CC 800AFECC 3400B38F */  lw         $s3, 0x34($sp)
/* A06D0 800AFED0 3000B28F */  lw         $s2, 0x30($sp)
/* A06D4 800AFED4 2C00B18F */  lw         $s1, 0x2C($sp)
/* A06D8 800AFED8 2800B08F */  lw         $s0, 0x28($sp)
/* A06DC 800AFEDC 0800E003 */  jr         $ra
/* A06E0 800AFEE0 4800BD27 */   addiu     $sp, $sp, 0x48
.size StateHandlerGlyphs, . - StateHandlerGlyphs
