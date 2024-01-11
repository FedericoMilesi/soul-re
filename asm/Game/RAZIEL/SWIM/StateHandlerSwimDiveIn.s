.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StateHandlerSwimDiveIn
/* 90680 8009FE80 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 90684 8009FE84 1400B1AF */  sw         $s1, 0x14($sp)
/* 90688 8009FE88 21888000 */  addu       $s1, $a0, $zero
/* 9068C 8009FE8C 1000B0AF */  sw         $s0, 0x10($sp)
/* 90690 8009FE90 2180A000 */  addu       $s0, $a1, $zero
/* 90694 8009FE94 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 90698 8009FE98 21980000 */  addu       $s3, $zero, $zero
/* 9069C 8009FE9C C0101000 */  sll        $v0, $s0, 3
/* 906A0 8009FEA0 21105000 */  addu       $v0, $v0, $s0
/* 906A4 8009FEA4 C0100200 */  sll        $v0, $v0, 3
/* 906A8 8009FEA8 23105000 */  subu       $v0, $v0, $s0
/* 906AC 8009FEAC 80100200 */  sll        $v0, $v0, 2
/* 906B0 8009FEB0 08004324 */  addiu      $v1, $v0, 0x8
/* 906B4 8009FEB4 1800B2AF */  sw         $s2, 0x18($sp)
/* 906B8 8009FEB8 21902302 */  addu       $s2, $s1, $v1
/* 906BC 8009FEBC 2400B5AF */  sw         $s5, 0x24($sp)
/* 906C0 8009FEC0 0400153C */  lui        $s5, (0x40000 >> 16)
/* 906C4 8009FEC4 2000B4AF */  sw         $s4, 0x20($sp)
/* 906C8 8009FEC8 21A02202 */  addu       $s4, $s1, $v0
/* 906CC 8009FECC 2800BFAF */  sw         $ra, 0x28($sp)
.L8009FED0:
/* 906D0 8009FED0 39C3010C */  jal        PeekMessageQueue
/* 906D4 8009FED4 04004426 */   addiu     $a0, $s2, 0x4
/* 906D8 8009FED8 21204000 */  addu       $a0, $v0, $zero
/* 906DC 8009FEDC 9A008010 */  beqz       $a0, .L800A0148
/* 906E0 8009FEE0 1000023C */   lui       $v0, (0x100014 >> 16)
/* 906E4 8009FEE4 0000838C */  lw         $v1, 0x0($a0)
/* 906E8 8009FEE8 14004234 */  ori        $v0, $v0, (0x100014 & 0xFFFF)
/* 906EC 8009FEEC 76006210 */  beq        $v1, $v0, .L800A00C8
/* 906F0 8009FEF0 2A104300 */   slt       $v0, $v0, $v1
/* 906F4 8009FEF4 0E004014 */  bnez       $v0, .L8009FF30
/* 906F8 8009FEF8 0104023C */   lui       $v0, (0x4010200 >> 16)
/* 906FC 8009FEFC 1000023C */  lui        $v0, (0x100000 >> 16)
/* 90700 8009FF00 8D006210 */  beq        $v1, $v0, .L800A0138
/* 90704 8009FF04 2A104300 */   slt       $v0, $v0, $v1
/* 90708 8009FF08 8B004010 */  beqz       $v0, .L800A0138
/* 9070C 8009FF0C 1000023C */   lui       $v0, (0x100001 >> 16)
/* 90710 8009FF10 01004234 */  ori        $v0, $v0, (0x100001 & 0xFFFF)
/* 90714 8009FF14 16006210 */  beq        $v1, $v0, .L8009FF70
/* 90718 8009FF18 1000023C */   lui       $v0, (0x100004 >> 16)
/* 9071C 8009FF1C 04004234 */  ori        $v0, $v0, (0x100004 & 0xFFFF)
/* 90720 8009FF20 28006210 */  beq        $v1, $v0, .L8009FFC4
/* 90724 8009FF24 00000000 */   nop
/* 90728 8009FF28 4E800208 */  j          .L800A0138
/* 9072C 8009FF2C 00000000 */   nop
.L8009FF30:
/* 90730 8009FF30 00024234 */  ori        $v0, $v0, (0x4010200 & 0xFFFF)
/* 90734 8009FF34 80006210 */  beq        $v1, $v0, .L800A0138
/* 90738 8009FF38 2A104300 */   slt       $v0, $v0, $v1
/* 9073C 8009FF3C 06004014 */  bnez       $v0, .L8009FF58
/* 90740 8009FF40 0204023C */   lui       $v0, (0x4020000 >> 16)
/* 90744 8009FF44 0001023C */  lui        $v0, (0x1000000 >> 16)
/* 90748 8009FF48 71006210 */  beq        $v1, $v0, .L800A0110
/* 9074C 8009FF4C 00000000 */   nop
/* 90750 8009FF50 4E800208 */  j          .L800A0138
/* 90754 8009FF54 00000000 */   nop
.L8009FF58:
/* 90758 8009FF58 49006210 */  beq        $v1, $v0, .L800A0080
/* 9075C 8009FF5C 0008023C */   lui       $v0, (0x8000000 >> 16)
/* 90760 8009FF60 26006210 */  beq        $v1, $v0, .L8009FFFC
/* 90764 8009FF64 00000000 */   nop
/* 90768 8009FF68 4E800208 */  j          .L800A0138
/* 9076C 8009FF6C 00000000 */   nop
.L8009FF70:
/* 90770 8009FF70 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 90774 8009FF74 00000000 */  nop
/* 90778 8009FF78 07005510 */  beq        $v0, $s5, .L8009FF98
/* 9077C 8009FF7C 00000000 */   nop
/* 90780 8009FF80 6D000016 */  bnez       $s0, .L800A0138
/* 90784 8009FF84 00000000 */   nop
/* 90788 8009FF88 0000258E */  lw         $a1, 0x0($s1)
/* 9078C 8009FF8C 90AC8427 */  addiu      $a0, $gp, %gp_rel(theCamera)
/* 90790 8009FF90 C670000C */  jal        CAMERA_ChangeToUnderWater
/* 90794 8009FF94 00000000 */   nop
.L8009FF98:
/* 90798 8009FF98 67000016 */  bnez       $s0, .L800A0138
/* 9079C 8009FF9C 91010224 */   addiu     $v0, $zero, 0x191
/* 907A0 8009FFA0 90F995AF */  sw         $s5, %gp_rel(Raziel + 0x360)($gp)
/* 907A4 8009FFA4 0000248E */  lw         $a0, 0x0($s1)
/* 907A8 8009FFA8 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 907AC 8009FFAC 06000224 */  addiu      $v0, $zero, 0x6
/* 907B0 8009FFB0 30FD82AF */  sw         $v0, %gp_rel(PhysicsMode)($gp)
/* 907B4 8009FFB4 938B020C */  jal        SteerSwitchMode
/* 907B8 8009FFB8 11000524 */   addiu     $a1, $zero, 0x11
/* 907BC 8009FFBC 4E800208 */  j          .L800A0138
/* 907C0 8009FFC0 00000000 */   nop
.L8009FFC4:
/* 907C4 8009FFC4 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 907C8 8009FFC8 00000000 */  nop
/* 907CC 8009FFCC 24105500 */  and        $v0, $v0, $s5
/* 907D0 8009FFD0 59004014 */  bnez       $v0, .L800A0138
/* 907D4 8009FFD4 00000000 */   nop
/* 907D8 8009FFD8 57000016 */  bnez       $s0, .L800A0138
/* 907DC 8009FFDC 00000000 */   nop
/* 907E0 8009FFE0 0000258E */  lw         $a1, 0x0($s1)
/* 907E4 8009FFE4 90AC8427 */  addiu      $a0, $gp, %gp_rel(theCamera)
/* 907E8 8009FFE8 F170000C */  jal        CAMERA_ChangeToOutOfWater
/* 907EC 8009FFEC 00000000 */   nop
/* 907F0 8009FFF0 3CFB80AF */  sw         $zero, %gp_rel(Raziel + 0x50C)($gp)
/* 907F4 8009FFF4 4E800208 */  j          .L800A0138
/* 907F8 8009FFF8 00000000 */   nop
.L8009FFFC:
/* 907FC 8009FFFC C4FC828F */  lw         $v0, %gp_rel(PadData)($gp)
/* 90800 800A0000 90A4838F */  lw         $v1, %gp_rel(RazielCommands + 0xC)($gp)
/* 90804 800A0004 0000428C */  lw         $v0, 0x0($v0)
/* 90808 800A0008 00000000 */  nop
/* 9080C 800A000C 24104300 */  and        $v0, $v0, $v1
/* 90810 800A0010 05004010 */  beqz       $v0, .L800A0028
/* 90814 800A0014 8C004426 */   addiu     $a0, $s2, 0x8C
/* 90818 800A0018 0080053C */  lui        $a1, (0x80000001 >> 16)
/* 9081C 800A001C 0100A534 */  ori        $a1, $a1, (0x80000001 & 0xFFFF)
/* 90820 800A0020 4EC3010C */  jal        EnMessageQueueData
/* 90824 800A0024 21300000 */   addu      $a2, $zero, $zero
.L800A0028:
/* 90828 800A0028 10006296 */  lhu        $v0, 0x10($s3)
/* 9082C 800A002C 00000000 */  nop
/* 90830 800A0030 40004230 */  andi       $v0, $v0, 0x40
/* 90834 800A0034 08004010 */  beqz       $v0, .L800A0058
/* 90838 800A0038 21202002 */   addu      $a0, $s1, $zero
/* 9083C 800A003C 21280002 */  addu       $a1, $s0, $zero
/* 90840 800A0040 0A80063C */  lui        $a2, %hi(StateHandlerSwimTread)
/* 90844 800A0044 B8F6C624 */  addiu      $a2, $a2, %lo(StateHandlerSwimTread)
/* 90848 800A0048 C1CA010C */  jal        StateSwitchStateData
/* 9084C 800A004C 21380000 */   addu      $a3, $zero, $zero
/* 90850 800A0050 4E800208 */  j          .L800A0138
/* 90854 800A0054 00000000 */   nop
.L800A0058:
/* 90858 800A0058 21280002 */  addu       $a1, $s0, $zero
/* 9085C 800A005C 0A80063C */  lui        $a2, %hi(StateHandlerSwim)
/* 90860 800A0060 0C02C624 */  addiu      $a2, $a2, %lo(StateHandlerSwim)
/* 90864 800A0064 C1CA010C */  jal        StateSwitchStateData
/* 90868 800A0068 21380000 */   addu      $a3, $zero, $zero
/* 9086C 800A006C 2001828E */  lw         $v0, 0x120($s4)
/* 90870 800A0070 00000000 */  nop
/* 90874 800A0074 02004234 */  ori        $v0, $v0, 0x2
/* 90878 800A0078 4E800208 */  j          .L800A0138
/* 9087C 800A007C 200182AE */   sw        $v0, 0x120($s4)
.L800A0080:
/* 90880 800A0080 0400938C */  lw         $s3, 0x4($a0)
/* 90884 800A0084 00000000 */  nop
/* 90888 800A0088 10006296 */  lhu        $v0, 0x10($s3)
/* 9088C 800A008C 00000000 */  nop
/* 90890 800A0090 80004230 */  andi       $v0, $v0, 0x80
/* 90894 800A0094 28004010 */  beqz       $v0, .L800A0138
/* 90898 800A0098 21200000 */   addu      $a0, $zero, $zero
/* 9089C 800A009C 21288000 */  addu       $a1, $a0, $zero
/* 908A0 800A00A0 4FC6010C */  jal        SetControlInitIdleData
/* 908A4 800A00A4 09000624 */   addiu     $a2, $zero, 0x9
/* 908A8 800A00A8 21202002 */  addu       $a0, $s1, $zero
/* 908AC 800A00AC 21280002 */  addu       $a1, $s0, $zero
/* 908B0 800A00B0 0B80063C */  lui        $a2, %hi(StateHandlerIdle)
/* 908B4 800A00B4 E084C624 */  addiu      $a2, $a2, %lo(StateHandlerIdle)
/* 908B8 800A00B8 C1CA010C */  jal        StateSwitchStateData
/* 908BC 800A00BC 21384000 */   addu      $a3, $v0, $zero
/* 908C0 800A00C0 4E800208 */  j          .L800A0138
/* 908C4 800A00C4 00000000 */   nop
.L800A00C8:
/* 908C8 800A00C8 21200000 */  addu       $a0, $zero, $zero
/* 908CC 800A00CC 21288000 */  addu       $a1, $a0, $zero
/* 908D0 800A00D0 4FC6010C */  jal        SetControlInitIdleData
/* 908D4 800A00D4 09000624 */   addiu     $a2, $zero, 0x9
/* 908D8 800A00D8 21202002 */  addu       $a0, $s1, $zero
/* 908DC 800A00DC 21280002 */  addu       $a1, $s0, $zero
/* 908E0 800A00E0 0B80063C */  lui        $a2, %hi(StateHandlerIdle)
/* 908E4 800A00E4 E084C624 */  addiu      $a2, $a2, %lo(StateHandlerIdle)
/* 908E8 800A00E8 C1CA010C */  jal        StateSwitchStateData
/* 908EC 800A00EC 21384000 */   addu      $a3, $v0, $zero
/* 908F0 800A00F0 11000016 */  bnez       $s0, .L800A0138
/* 908F4 800A00F4 00000000 */   nop
/* 908F8 800A00F8 0000258E */  lw         $a1, 0x0($s1)
/* 908FC 800A00FC 90AC8427 */  addiu      $a0, $gp, %gp_rel(theCamera)
/* 90900 800A0100 F170000C */  jal        CAMERA_ChangeToOutOfWater
/* 90904 800A0104 00000000 */   nop
/* 90908 800A0108 4E800208 */  j          .L800A0138
/* 9090C 800A010C 00000000 */   nop
.L800A0110:
/* 90910 800A0110 09000016 */  bnez       $s0, .L800A0138
/* 90914 800A0114 00000000 */   nop
/* 90918 800A0118 8CBE828F */  lw         $v0, %gp_rel(gameTrackerX + 0xC4)($gp)
/* 9091C 800A011C 0400838C */  lw         $v1, 0x4($a0)
/* 90920 800A0120 00084230 */  andi       $v0, $v0, 0x800
/* 90924 800A0124 04004010 */  beqz       $v0, .L800A0138
/* 90928 800A0128 00000000 */   nop
/* 9092C 800A012C 0C00648C */  lw         $a0, 0xC($v1)
/* 90930 800A0130 7391020C */  jal        LoseHealth
/* 90934 800A0134 00000000 */   nop
.L800A0138:
/* 90938 800A0138 27C3010C */  jal        DeMessageQueue
/* 9093C 800A013C 04004426 */   addiu     $a0, $s2, 0x4
/* 90940 800A0140 B47F0208 */  j          .L8009FED0
/* 90944 800A0144 00000000 */   nop
.L800A0148:
/* 90948 800A0148 27000016 */  bnez       $s0, .L800A01E8
/* 9094C 800A014C 00000000 */   nop
/* 90950 800A0150 0000228E */  lw         $v0, 0x0($s1)
/* 90954 800A0154 00000000 */  nop
/* 90958 800A0158 60004394 */  lhu        $v1, 0x60($v0)
/* 9095C 800A015C 00000000 */  nop
/* 90960 800A0160 F0FF6324 */  addiu      $v1, $v1, -0x10
/* 90964 800A0164 600043A4 */  sh         $v1, 0x60($v0)
/* 90968 800A0168 3CFB838F */  lw         $v1, %gp_rel(Raziel + 0x50C)($gp)
/* 9096C 800A016C 00000000 */  nop
/* 90970 800A0170 01006230 */  andi       $v0, $v1, 0x1
/* 90974 800A0174 1C004010 */  beqz       $v0, .L800A01E8
/* 90978 800A0178 02006230 */   andi      $v0, $v1, 0x2
/* 9097C 800A017C 08004014 */  bnez       $v0, .L800A01A0
/* 90980 800A0180 00000000 */   nop
/* 90984 800A0184 C4FC828F */  lw         $v0, %gp_rel(PadData)($gp)
/* 90988 800A0188 00000000 */  nop
/* 9098C 800A018C 0000428C */  lw         $v0, 0x0($v0)
/* 90990 800A0190 00000000 */  nop
/* 90994 800A0194 01004230 */  andi       $v0, $v0, 0x1
/* 90998 800A0198 05004010 */  beqz       $v0, .L800A01B0
/* 9099C 800A019C 00000000 */   nop
.L800A01A0:
/* 909A0 800A01A0 40FB8297 */  lhu        $v0, %gp_rel(Raziel + 0x510)($gp)
/* 909A4 800A01A4 00000000 */  nop
/* 909A8 800A01A8 30004224 */  addiu      $v0, $v0, 0x30
/* 909AC 800A01AC 40FB82A7 */  sh         $v0, %gp_rel(Raziel + 0x510)($gp)
.L800A01B0:
/* 909B0 800A01B0 40FB8287 */  lh         $v0, %gp_rel(Raziel + 0x510)($gp)
/* 909B4 800A01B4 00000000 */  nop
/* 909B8 800A01B8 01044228 */  slti       $v0, $v0, 0x401
/* 909BC 800A01BC 02004014 */  bnez       $v0, .L800A01C8
/* 909C0 800A01C0 05000224 */   addiu     $v0, $zero, 0x5
/* 909C4 800A01C4 30FD82AF */  sw         $v0, %gp_rel(PhysicsMode)($gp)
.L800A01C8:
/* 909C8 800A01C8 3CFB828F */  lw         $v0, %gp_rel(Raziel + 0x50C)($gp)
/* 909CC 800A01CC 00000000 */  nop
/* 909D0 800A01D0 04004230 */  andi       $v0, $v0, 0x4
/* 909D4 800A01D4 04004010 */  beqz       $v0, .L800A01E8
/* 909D8 800A01D8 03000424 */   addiu     $a0, $zero, 0x3
/* 909DC 800A01DC 01000524 */  addiu      $a1, $zero, 0x1
/* 909E0 800A01E0 8B9D020C */  jal        razLaunchBubbles
/* 909E4 800A01E4 21300000 */   addu      $a2, $zero, $zero
.L800A01E8:
/* 909E8 800A01E8 2800BF8F */  lw         $ra, 0x28($sp)
/* 909EC 800A01EC 2400B58F */  lw         $s5, 0x24($sp)
/* 909F0 800A01F0 2000B48F */  lw         $s4, 0x20($sp)
/* 909F4 800A01F4 1C00B38F */  lw         $s3, 0x1C($sp)
/* 909F8 800A01F8 1800B28F */  lw         $s2, 0x18($sp)
/* 909FC 800A01FC 1400B18F */  lw         $s1, 0x14($sp)
/* 90A00 800A0200 1000B08F */  lw         $s0, 0x10($sp)
/* 90A04 800A0204 0800E003 */  jr         $ra
/* 90A08 800A0208 3000BD27 */   addiu     $sp, $sp, 0x30
.size StateHandlerSwimDiveIn, . - StateHandlerSwimDiveIn
