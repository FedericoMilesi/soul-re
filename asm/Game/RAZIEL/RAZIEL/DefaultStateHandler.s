.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DefaultStateHandler
/* A06E4 800AFEE4 B8FFBD27 */  addiu      $sp, $sp, -0x48
/* A06E8 800AFEE8 3800B2AF */  sw         $s2, 0x38($sp)
/* A06EC 800AFEEC 21908000 */  addu       $s2, $a0, $zero
/* A06F0 800AFEF0 3400B1AF */  sw         $s1, 0x34($sp)
/* A06F4 800AFEF4 2188A000 */  addu       $s1, $a1, $zero
/* A06F8 800AFEF8 C0101100 */  sll        $v0, $s1, 3
/* A06FC 800AFEFC 21105100 */  addu       $v0, $v0, $s1
/* A0700 800AFF00 C0100200 */  sll        $v0, $v0, 3
/* A0704 800AFF04 23105100 */  subu       $v0, $v0, $s1
/* A0708 800AFF08 3C00B3AF */  sw         $s3, 0x3C($sp)
/* A070C 800AFF0C 80980200 */  sll        $s3, $v0, 2
/* A0710 800AFF10 21207202 */  addu       $a0, $s3, $s2
/* A0714 800AFF14 0C008424 */  addiu      $a0, $a0, 0xC
/* A0718 800AFF18 4000BFAF */  sw         $ra, 0x40($sp)
/* A071C 800AFF1C 39C3010C */  jal        PeekMessageQueue
/* A0720 800AFF20 3000B0AF */   sw        $s0, 0x30($sp)
/* A0724 800AFF24 21804000 */  addu       $s0, $v0, $zero
/* A0728 800AFF28 4D020012 */  beqz       $s0, .L800B0860
/* A072C 800AFF2C 0001023C */   lui       $v0, (0x1000000 >> 16)
/* A0730 800AFF30 0000038E */  lw         $v1, 0x0($s0)
/* A0734 800AFF34 00000000 */  nop
/* A0738 800AFF38 1E016210 */  beq        $v1, $v0, .L800B03B4
/* A073C 800AFF3C 2A104300 */   slt       $v0, $v0, $v1
/* A0740 800AFF40 36004014 */  bnez       $v0, .L800B001C
/* A0744 800AFF44 0104023C */   lui       $v0, (0x4010200 >> 16)
/* A0748 800AFF48 0400023C */  lui        $v0, (0x40005 >> 16)
/* A074C 800AFF4C 05004234 */  ori        $v0, $v0, (0x40005 & 0xFFFF)
/* A0750 800AFF50 2A026210 */  beq        $v1, $v0, .L800B07FC
/* A0754 800AFF54 2A104300 */   slt       $v0, $v0, $v1
/* A0758 800AFF58 14004014 */  bnez       $v0, .L800AFFAC
/* A075C 800AFF5C 1000023C */   lui       $v0, (0x100005 >> 16)
/* A0760 800AFF60 0080023C */  lui        $v0, (0x80000008 >> 16)
/* A0764 800AFF64 08004234 */  ori        $v0, $v0, (0x80000008 & 0xFFFF)
/* A0768 800AFF68 D6006210 */  beq        $v1, $v0, .L800B02C4
/* A076C 800AFF6C 2A104300 */   slt       $v0, $v0, $v1
/* A0770 800AFF70 07004014 */  bnez       $v0, .L800AFF90
/* A0774 800AFF74 0080023C */   lui       $v0, (0x80000004 >> 16)
/* A0778 800AFF78 71006210 */  beq        $v1, $v0, .L800B0140
/* A077C 800AFF7C 04004234 */   ori       $v0, $v0, (0x80000004 & 0xFFFF)
/* A0780 800AFF80 C3006210 */  beq        $v1, $v0, .L800B0290
/* A0784 800AFF84 00000000 */   nop
/* A0788 800AFF88 18C20208 */  j          .L800B0860
/* A078C 800AFF8C 00000000 */   nop
.L800AFF90:
/* A0790 800AFF90 20004234 */  ori        $v0, $v0, (0x80000020 & 0xFFFF)
/* A0794 800AFF94 79006210 */  beq        $v1, $v0, .L800B017C
/* A0798 800AFF98 0400023C */   lui       $v0, (0x40000 >> 16)
/* A079C 800AFF9C A6016210 */  beq        $v1, $v0, .L800B0638
/* A07A0 800AFFA0 02000224 */   addiu     $v0, $zero, 0x2
/* A07A4 800AFFA4 18C20208 */  j          .L800B0860
/* A07A8 800AFFA8 00000000 */   nop
.L800AFFAC:
/* A07AC 800AFFAC 05004234 */  ori        $v0, $v0, (0x100005 & 0xFFFF)
/* A07B0 800AFFB0 B6016210 */  beq        $v1, $v0, .L800B068C
/* A07B4 800AFFB4 2A104300 */   slt       $v0, $v0, $v1
/* A07B8 800AFFB8 09004014 */  bnez       $v0, .L800AFFE0
/* A07BC 800AFFBC 1000023C */   lui       $v0, (0x100009 >> 16)
/* A07C0 800AFFC0 0400023C */  lui        $v0, (0x40025 >> 16)
/* A07C4 800AFFC4 25004234 */  ori        $v0, $v0, (0x40025 & 0xFFFF)
/* A07C8 800AFFC8 0C026210 */  beq        $v1, $v0, .L800B07FC
/* A07CC 800AFFCC 1000023C */   lui       $v0, (0x100009 >> 16)
/* A07D0 800AFFD0 CB016210 */  beq        $v1, $v0, .L800B0700
/* A07D4 800AFFD4 00000000 */   nop
/* A07D8 800AFFD8 18C20208 */  j          .L800B0860
/* A07DC 800AFFDC 00000000 */   nop
.L800AFFE0:
/* A07E0 800AFFE0 09004234 */  ori        $v0, $v0, (0x100009 & 0xFFFF)
/* A07E4 800AFFE4 E1016210 */  beq        $v1, $v0, .L800B076C
/* A07E8 800AFFE8 2A104300 */   slt       $v0, $v0, $v1
/* A07EC 800AFFEC 07004014 */  bnez       $v0, .L800B000C
/* A07F0 800AFFF0 4000023C */   lui       $v0, (0x400000 >> 16)
/* A07F4 800AFFF4 1000023C */  lui        $v0, (0x100006 >> 16)
/* A07F8 800AFFF8 06004234 */  ori        $v0, $v0, (0x100006 & 0xFFFF)
/* A07FC 800AFFFC C7016210 */  beq        $v1, $v0, .L800B071C
/* A0800 800B0000 00000000 */   nop
/* A0804 800B0004 18C20208 */  j          .L800B0860
/* A0808 800B0008 00000000 */   nop
.L800B000C:
/* A080C 800B000C 5B016210 */  beq        $v1, $v0, .L800B057C
/* A0810 800B0010 00000000 */   nop
/* A0814 800B0014 18C20208 */  j          .L800B0860
/* A0818 800B0018 00000000 */   nop
.L800B001C:
/* A081C 800B001C 00024234 */  ori        $v0, $v0, (0x4010200 & 0xFFFF)
/* A0820 800B0020 F8006210 */  beq        $v1, $v0, .L800B0404
/* A0824 800B0024 2A104300 */   slt       $v0, $v0, $v1
/* A0828 800B0028 20004014 */  bnez       $v0, .L800B00AC
/* A082C 800B002C 0008023C */   lui       $v0, (0x8000000 >> 16)
/* A0830 800B0030 0004023C */  lui        $v0, (0x4000004 >> 16)
/* A0834 800B0034 04004234 */  ori        $v0, $v0, (0x4000004 & 0xFFFF)
/* A0838 800B0038 09026210 */  beq        $v1, $v0, .L800B0860
/* A083C 800B003C 2A104300 */   slt       $v0, $v0, $v1
/* A0840 800B0040 0A004014 */  bnez       $v0, .L800B006C
/* A0844 800B0044 0104023C */   lui       $v0, (0x4010008 >> 16)
/* A0848 800B0048 0001023C */  lui        $v0, (0x1000001 >> 16)
/* A084C 800B004C 01004234 */  ori        $v0, $v0, (0x1000001 & 0xFFFF)
/* A0850 800B0050 D2006210 */  beq        $v1, $v0, .L800B039C
/* A0854 800B0054 0004023C */   lui       $v0, (0x4000001 >> 16)
/* A0858 800B0058 01004234 */  ori        $v0, $v0, (0x4000001 & 0xFFFF)
/* A085C 800B005C A1006210 */  beq        $v1, $v0, .L800B02E4
/* A0860 800B0060 00000000 */   nop
/* A0864 800B0064 18C20208 */  j          .L800B0860
/* A0868 800B0068 00000000 */   nop
.L800B006C:
/* A086C 800B006C 08004234 */  ori        $v0, $v0, (0x4010008 & 0xFFFF)
/* A0870 800B0070 B9006210 */  beq        $v1, $v0, .L800B0358
/* A0874 800B0074 2A104300 */   slt       $v0, $v0, $v1
/* A0878 800B0078 07004014 */  bnez       $v0, .L800B0098
/* A087C 800B007C 0104023C */   lui       $v0, (0x4010010 >> 16)
/* A0880 800B0080 0004023C */  lui        $v0, (0x4000011 >> 16)
/* A0884 800B0084 11004234 */  ori        $v0, $v0, (0x4000011 & 0xFFFF)
/* A0888 800B0088 4C016210 */  beq        $v1, $v0, .L800B05BC
/* A088C 800B008C 00000000 */   nop
/* A0890 800B0090 18C20208 */  j          .L800B0860
/* A0894 800B0094 00000000 */   nop
.L800B0098:
/* A0898 800B0098 10004234 */  ori        $v0, $v0, (0x4010010 & 0xFFFF)
/* A089C 800B009C A4016210 */  beq        $v1, $v0, .L800B0730
/* A08A0 800B00A0 21280000 */   addu      $a1, $zero, $zero
/* A08A4 800B00A4 18C20208 */  j          .L800B0860
/* A08A8 800B00A8 00000000 */   nop
.L800B00AC:
/* A08AC 800B00AC 18006210 */  beq        $v1, $v0, .L800B0110
/* A08B0 800B00B0 2A104300 */   slt       $v0, $v0, $v1
/* A08B4 800B00B4 09004014 */  bnez       $v0, .L800B00DC
/* A08B8 800B00B8 0010023C */   lui       $v0, (0x10002001 >> 16)
/* A08BC 800B00BC 0104023C */  lui        $v0, (0x4010400 >> 16)
/* A08C0 800B00C0 00044234 */  ori        $v0, $v0, (0x4010400 & 0xFFFF)
/* A08C4 800B00C4 16016210 */  beq        $v1, $v0, .L800B0520
/* A08C8 800B00C8 0204023C */   lui       $v0, (0x4022001 >> 16)
/* A08CC 800B00CC AE006210 */  beq        $v1, $v0, .L800B0388
/* A08D0 800B00D0 21204002 */   addu      $a0, $s2, $zero
/* A08D4 800B00D4 18C20208 */  j          .L800B0860
/* A08D8 800B00D8 00000000 */   nop
.L800B00DC:
/* A08DC 800B00DC 01204234 */  ori        $v0, $v0, (0x4022001 & 0xFFFF)
/* A08E0 800B00E0 2A106200 */  slt        $v0, $v1, $v0
/* A08E4 800B00E4 DE014014 */  bnez       $v0, .L800B0860
/* A08E8 800B00E8 0010023C */   lui       $v0, (0x10002002 >> 16)
/* A08EC 800B00EC 02204234 */  ori        $v0, $v0, (0x10002002 & 0xFFFF)
/* A08F0 800B00F0 2A104300 */  slt        $v0, $v0, $v1
/* A08F4 800B00F4 D3014010 */  beqz       $v0, .L800B0844
/* A08F8 800B00F8 0020023C */   lui       $v0, (0x20000004 >> 16)
/* A08FC 800B00FC 04004234 */  ori        $v0, $v0, (0x20000004 & 0xFFFF)
/* A0900 800B0100 69006210 */  beq        $v1, $v0, .L800B02A8
/* A0904 800B0104 FDFF0324 */   addiu     $v1, $zero, -0x3
/* A0908 800B0108 18C20208 */  j          .L800B0860
/* A090C 800B010C 00000000 */   nop
.L800B0110:
/* A0910 800B0110 21200000 */  addu       $a0, $zero, $zero
/* A0914 800B0114 21288000 */  addu       $a1, $a0, $zero
/* A0918 800B0118 4FC6010C */  jal        SetControlInitIdleData
/* A091C 800B011C 03000624 */   addiu     $a2, $zero, 0x3
/* A0920 800B0120 21204002 */  addu       $a0, $s2, $zero
/* A0924 800B0124 21282002 */  addu       $a1, $s1, $zero
/* A0928 800B0128 0B80063C */  lui        $a2, %hi(StateHandlerIdle)
/* A092C 800B012C E084C624 */  addiu      $a2, $a2, %lo(StateHandlerIdle)
/* A0930 800B0130 C1CA010C */  jal        StateSwitchStateData
/* A0934 800B0134 21384000 */   addu      $a3, $v0, $zero
/* A0938 800B0138 18C20208 */  j          .L800B0860
/* A093C 800B013C 00000000 */   nop
.L800B0140:
/* A0940 800B0140 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* A0944 800B0144 0400033C */  lui        $v1, (0x40000 >> 16)
/* A0948 800B0148 24104300 */  and        $v0, $v0, $v1
/* A094C 800B014C C4014014 */  bnez       $v0, .L800B0860
/* A0950 800B0150 00000000 */   nop
/* A0954 800B0154 CCF9828F */  lw         $v0, %gp_rel(Raziel + 0x39C)($gp)
/* A0958 800B0158 00000000 */  nop
/* A095C 800B015C 80004230 */  andi       $v0, $v0, 0x80
/* A0960 800B0160 BF014014 */  bnez       $v0, .L800B0860
/* A0964 800B0164 21204002 */   addu      $a0, $s2, $zero
/* A0968 800B0168 21282002 */  addu       $a1, $s1, $zero
/* A096C 800B016C 0A80063C */  lui        $a2, %hi(StateHandlerAttack2)
/* A0970 800B0170 E4BDC624 */  addiu      $a2, $a2, %lo(StateHandlerAttack2)
/* A0974 800B0174 16C20208 */  j          .L800B0858
/* A0978 800B0178 21380000 */   addu      $a3, $zero, $zero
.L800B017C:
/* A097C 800B017C B8012016 */  bnez       $s1, .L800B0860
/* A0980 800B0180 00000000 */   nop
/* A0984 800B0184 CCF9828F */  lw         $v0, %gp_rel(Raziel + 0x39C)($gp)
/* A0988 800B0188 00000000 */  nop
/* A098C 800B018C 80004230 */  andi       $v0, $v0, 0x80
/* A0990 800B0190 B3014014 */  bnez       $v0, .L800B0860
/* A0994 800B0194 00000000 */   nop
/* A0998 800B0198 C4FC828F */  lw         $v0, %gp_rel(PadData)($gp)
/* A099C 800B019C 8CA4838F */  lw         $v1, %gp_rel(RazielCommands + 0x8)($gp)
/* A09A0 800B01A0 0400428C */  lw         $v0, 0x4($v0)
/* A09A4 800B01A4 00000000 */  nop
/* A09A8 800B01A8 24104300 */  and        $v0, $v0, $v1
/* A09AC 800B01AC AC014014 */  bnez       $v0, .L800B0860
/* A09B0 800B01B0 2800A427 */   addiu     $a0, $sp, 0x28
/* A09B4 800B01B4 9F6E020C */  jal        StateHandlerDecodeHold
/* A09B8 800B01B8 2C00A527 */   addiu     $a1, $sp, 0x2C
/* A09BC 800B01BC A8014010 */  beqz       $v0, .L800B0860
/* A09C0 800B01C0 8000023C */   lui       $v0, (0x800010 >> 16)
/* A09C4 800B01C4 2800A38F */  lw         $v1, 0x28($sp)
/* A09C8 800B01C8 10004234 */  ori        $v0, $v0, (0x800010 & 0xFFFF)
/* A09CC 800B01CC 05006214 */  bne        $v1, $v0, .L800B01E4
/* A09D0 800B01D0 0001023C */   lui       $v0, (0x1000002 >> 16)
/* A09D4 800B01D4 21204002 */  addu       $a0, $s2, $zero
/* A09D8 800B01D8 0A80053C */  lui        $a1, %hi(StateHandlerThrow2)
/* A09DC 800B01DC 8AC10208 */  j          .L800B0628
/* A09E0 800B01E0 E4D7A524 */   addiu     $a1, $a1, %lo(StateHandlerThrow2)
.L800B01E4:
/* A09E4 800B01E4 02004234 */  ori        $v0, $v0, (0x1000002 & 0xFFFF)
/* A09E8 800B01E8 08006214 */  bne        $v1, $v0, .L800B020C
/* A09EC 800B01EC 0800023C */   lui       $v0, (0x80000 >> 16)
/* A09F0 800B01F0 21204002 */  addu       $a0, $s2, $zero
/* A09F4 800B01F4 2C00A68F */  lw         $a2, 0x2C($sp)
/* A09F8 800B01F8 0A80053C */  lui        $a1, %hi(StateHandlerGrab)
/* A09FC 800B01FC A3CA010C */  jal        StateSwitchStateCharacterDataDefault
/* A0A00 800B0200 C4E6A524 */   addiu     $a1, $a1, %lo(StateHandlerGrab)
/* A0A04 800B0204 18C20208 */  j          .L800B0860
/* A0A08 800B0208 00000000 */   nop
.L800B020C:
/* A0A0C 800B020C 0E006214 */  bne        $v1, $v0, .L800B0248
/* A0A10 800B0210 21204002 */   addu      $a0, $s2, $zero
/* A0A14 800B0214 DCFB828F */  lw         $v0, %gp_rel(Raziel + 0x5AC)($gp)
/* A0A18 800B0218 00040424 */  addiu      $a0, $zero, 0x400
/* A0A1C 800B021C 25104400 */  or         $v0, $v0, $a0
/* A0A20 800B0220 DCFB82AF */  sw         $v0, %gp_rel(Raziel + 0x5AC)($gp)
/* A0A24 800B0224 C89E020C */  jal        razSetPlayerEventHistory
/* A0A28 800B0228 00000000 */   nop
/* A0A2C 800B022C 0000448E */  lw         $a0, 0x0($s2)
/* A0A30 800B0230 FD96020C */  jal        razLaunchForce
/* A0A34 800B0234 00000000 */   nop
/* A0A38 800B0238 21204002 */  addu       $a0, $s2, $zero
/* A0A3C 800B023C 0A80053C */  lui        $a1, %hi(StateHandlerThrow2)
/* A0A40 800B0240 8AC10208 */  j          .L800B0628
/* A0A44 800B0244 E4D7A524 */   addiu     $a1, $a1, %lo(StateHandlerThrow2)
.L800B0248:
/* A0A48 800B0248 0A80053C */  lui        $a1, %hi(StateHandlerAttack2)
/* A0A4C 800B024C E4BDA524 */  addiu      $a1, $a1, %lo(StateHandlerAttack2)
/* A0A50 800B0250 A3CA010C */  jal        StateSwitchStateCharacterDataDefault
/* A0A54 800B0254 21300000 */   addu      $a2, $zero, $zero
/* A0A58 800B0258 21880000 */  addu       $s1, $zero, $zero
/* A0A5C 800B025C 08001024 */  addiu      $s0, $zero, 0x8
.L800B0260:
/* A0A60 800B0260 21205002 */  addu       $a0, $s2, $s0
/* A0A64 800B0264 8C008424 */  addiu      $a0, $a0, 0x8C
/* A0A68 800B0268 0080053C */  lui        $a1, (0x80000020 >> 16)
/* A0A6C 800B026C 2000A534 */  ori        $a1, $a1, (0x80000020 & 0xFFFF)
/* A0A70 800B0270 4EC3010C */  jal        EnMessageQueueData
/* A0A74 800B0274 21300000 */   addu      $a2, $zero, $zero
/* A0A78 800B0278 01003126 */  addiu      $s1, $s1, 0x1
/* A0A7C 800B027C 0300222A */  slti       $v0, $s1, 0x3
/* A0A80 800B0280 F7FF4014 */  bnez       $v0, .L800B0260
/* A0A84 800B0284 1C011026 */   addiu     $s0, $s0, 0x11C
/* A0A88 800B0288 18C20208 */  j          .L800B0860
/* A0A8C 800B028C 00000000 */   nop
.L800B0290:
/* A0A90 800B0290 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* A0A94 800B0294 00000000 */  nop
/* A0A98 800B0298 02004234 */  ori        $v0, $v0, 0x2
/* A0A9C 800B029C 90F982AF */  sw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* A0AA0 800B02A0 18C20208 */  j          .L800B0860
/* A0AA4 800B02A4 00000000 */   nop
.L800B02A8:
/* A0AA8 800B02A8 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* A0AAC 800B02AC 00000000 */  nop
/* A0AB0 800B02B0 01004234 */  ori        $v0, $v0, 0x1
/* A0AB4 800B02B4 24104300 */  and        $v0, $v0, $v1
/* A0AB8 800B02B8 90F982AF */  sw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* A0ABC 800B02BC 18C20208 */  j          .L800B0860
/* A0AC0 800B02C0 00000000 */   nop
.L800B02C4:
/* A0AC4 800B02C4 66012016 */  bnez       $s1, .L800B0860
/* A0AC8 800B02C8 21204002 */   addu      $a0, $s2, $zero
/* A0ACC 800B02CC 0B80053C */  lui        $a1, %hi(StateHandlerCrouch)
/* A0AD0 800B02D0 E890A524 */  addiu      $a1, $a1, %lo(StateHandlerCrouch)
/* A0AD4 800B02D4 A3CA010C */  jal        StateSwitchStateCharacterDataDefault
/* A0AD8 800B02D8 01000624 */   addiu     $a2, $zero, 0x1
/* A0ADC 800B02DC 18C20208 */  j          .L800B0860
/* A0AE0 800B02E0 00000000 */   nop
.L800B02E4:
/* A0AE4 800B02E4 0000448E */  lw         $a0, 0x0($s2)
/* A0AE8 800B02E8 30F68527 */  addiu      $a1, $gp, %gp_rel(Raziel)
/* A0AEC 800B02EC 30FD80AF */  sw         $zero, %gp_rel(PhysicsMode)($gp)
/* A0AF0 800B02F0 1069020C */  jal        SetDropPhysics
/* A0AF4 800B02F4 00000000 */   nop
/* A0AF8 800B02F8 0000448E */  lw         $a0, 0x0($s2)
/* A0AFC 800B02FC 26FA8387 */  lh         $v1, %gp_rel(Raziel + 0x3F6)($gp)
/* A0B00 800B0300 7C01828C */  lw         $v0, 0x17C($a0)
/* A0B04 800B0304 00000000 */  nop
/* A0B08 800B0308 2A104300 */  slt        $v0, $v0, $v1
/* A0B0C 800B030C 54014010 */  beqz       $v0, .L800B0860
/* A0B10 800B0310 00000000 */   nop
/* A0B14 800B0314 52012016 */  bnez       $s1, .L800B0860
/* A0B18 800B0318 18000524 */   addiu     $a1, $zero, 0x18
/* A0B1C 800B031C 21300000 */  addu       $a2, $zero, $zero
/* A0B20 800B0320 2F9C020C */  jal        razSwitchVAnimCharacterGroup
/* A0B24 800B0324 2138C000 */   addu      $a3, $a2, $zero
/* A0B28 800B0328 07004010 */  beqz       $v0, .L800B0348
/* A0B2C 800B032C 01000224 */   addiu     $v0, $zero, 0x1
/* A0B30 800B0330 1000A2AF */  sw         $v0, 0x10($sp)
/* A0B34 800B0334 21204002 */  addu       $a0, $s2, $zero
/* A0B38 800B0338 24000524 */  addiu      $a1, $zero, 0x24
/* A0B3C 800B033C 21300000 */  addu       $a2, $zero, $zero
/* A0B40 800B0340 FCC8010C */  jal        G2EmulationSwitchAnimationCharacter
/* A0B44 800B0344 04000724 */   addiu     $a3, $zero, 0x4
.L800B0348:
/* A0B48 800B0348 21204002 */  addu       $a0, $s2, $zero
/* A0B4C 800B034C 0B80053C */  lui        $a1, %hi(StateHandlerFall)
/* A0B50 800B0350 8AC10208 */  j          .L800B0628
/* A0B54 800B0354 A8BDA524 */   addiu     $a1, $a1, %lo(StateHandlerFall)
.L800B0358:
/* A0B58 800B0358 30FD828F */  lw         $v0, %gp_rel(PhysicsMode)($gp)
/* A0B5C 800B035C 03000324 */  addiu      $v1, $zero, 0x3
/* A0B60 800B0360 3F014310 */  beq        $v0, $v1, .L800B0860
/* A0B64 800B0364 F0FF0524 */   addiu     $a1, $zero, -0x10
/* A0B68 800B0368 21300000 */  addu       $a2, $zero, $zero
/* A0B6C 800B036C 1000A0AF */  sw         $zero, 0x10($sp)
/* A0B70 800B0370 0000448E */  lw         $a0, 0x0($s2)
/* A0B74 800B0374 30FD83AF */  sw         $v1, %gp_rel(PhysicsMode)($gp)
/* A0B78 800B0378 4E68020C */  jal        SetPhysics
/* A0B7C 800B037C 2138C000 */   addu      $a3, $a2, $zero
/* A0B80 800B0380 18C20208 */  j          .L800B0860
/* A0B84 800B0384 00000000 */   nop
.L800B0388:
/* A0B88 800B0388 0400068E */  lw         $a2, 0x4($s0)
/* A0B8C 800B038C 369B020C */  jal        razEnterWater
/* A0B90 800B0390 21282002 */   addu      $a1, $s1, $zero
/* A0B94 800B0394 18C20208 */  j          .L800B0860
/* A0B98 800B0398 00000000 */   nop
.L800B039C:
/* A0B9C 800B039C 21204002 */  addu       $a0, $s2, $zero
/* A0BA0 800B03A0 21282002 */  addu       $a1, $s1, $zero
/* A0BA4 800B03A4 0B80063C */  lui        $a2, %hi(StateHandlerAutoFace)
/* A0BA8 800B03A8 10EFC624 */  addiu      $a2, $a2, %lo(StateHandlerAutoFace)
/* A0BAC 800B03AC 16C20208 */  j          .L800B0858
/* A0BB0 800B03B0 21380000 */   addu      $a3, $zero, $zero
.L800B03B4:
/* A0BB4 800B03B4 2A012016 */  bnez       $s1, .L800B0860
/* A0BB8 800B03B8 00000000 */   nop
/* A0BBC 800B03BC C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* A0BC0 800B03C0 00000000 */  nop
/* A0BC4 800B03C4 00404230 */  andi       $v0, $v0, 0x4000
/* A0BC8 800B03C8 25014014 */  bnez       $v0, .L800B0860
/* A0BCC 800B03CC 00000000 */   nop
/* A0BD0 800B03D0 34FA828F */  lw         $v0, %gp_rel(Raziel + 0x404)($gp)
/* A0BD4 800B03D4 00000000 */  nop
/* A0BD8 800B03D8 21014014 */  bnez       $v0, .L800B0860
/* A0BDC 800B03DC 21204002 */   addu      $a0, $s2, $zero
/* A0BE0 800B03E0 0400068E */  lw         $a2, 0x4($s0)
/* A0BE4 800B03E4 0A80053C */  lui        $a1, %hi(StateHandlerHitReaction)
/* A0BE8 800B03E8 A3CA010C */  jal        StateSwitchStateCharacterDataDefault
/* A0BEC 800B03EC 68D5A524 */   addiu     $a1, $a1, %lo(StateHandlerHitReaction)
/* A0BF0 800B03F0 90AC8427 */  addiu      $a0, $gp, %gp_rel(theCamera)
/* A0BF4 800B03F4 286F000C */  jal        CAMERA_ForceEndLookaroundMode
/* A0BF8 800B03F8 00000000 */   nop
/* A0BFC 800B03FC 18C20208 */  j          .L800B0860
/* A0C00 800B0400 00000000 */   nop
.L800B0404:
/* A0C04 800B0404 0400038E */  lw         $v1, 0x4($s0)
/* A0C08 800B0408 15012016 */  bnez       $s1, .L800B0860
/* A0C0C 800B040C 1800A427 */   addiu     $a0, $sp, 0x18
/* A0C10 800B0410 1800A0A7 */  sh         $zero, 0x18($sp)
/* A0C14 800B0414 1A00A0A7 */  sh         $zero, 0x1A($sp)
/* A0C18 800B0418 2400A0A7 */  sh         $zero, 0x24($sp)
/* A0C1C 800B041C 04006294 */  lhu        $v0, 0x4($v1)
/* A0C20 800B0420 00000000 */  nop
/* A0C24 800B0424 2000A2A7 */  sh         $v0, 0x20($sp)
/* A0C28 800B0428 06006294 */  lhu        $v0, 0x6($v1)
/* A0C2C 800B042C 00000000 */  nop
/* A0C30 800B0430 2200A2A7 */  sh         $v0, 0x22($sp)
/* A0C34 800B0434 08006294 */  lhu        $v0, 0x8($v1)
/* A0C38 800B0438 2000A527 */  addiu      $a1, $sp, 0x20
/* A0C3C 800B043C 87E8000C */  jal        MATH3D_AngleFromPosToPos
/* A0C40 800B0440 2400A2A7 */   sh        $v0, 0x24($sp)
/* A0C44 800B0444 01000524 */  addiu      $a1, $zero, 0x1
/* A0C48 800B0448 0E000624 */  addiu      $a2, $zero, 0xE
/* A0C4C 800B044C 0000448E */  lw         $a0, 0x0($s2)
/* A0C50 800B0450 21804000 */  addu       $s0, $v0, $zero
/* A0C54 800B0454 E541020C */  jal        G2Anim_IsControllerActive
/* A0C58 800B0458 C8018424 */   addiu     $a0, $a0, 0x1C8
/* A0C5C 800B045C 10004010 */  beqz       $v0, .L800B04A0
/* A0C60 800B0460 01000524 */   addiu     $a1, $zero, 0x1
/* A0C64 800B0464 0000448E */  lw         $a0, 0x0($s2)
/* A0C68 800B0468 0E000624 */  addiu      $a2, $zero, 0xE
/* A0C6C 800B046C 8D41020C */  jal        G2Anim_DisableController
/* A0C70 800B0470 C8018424 */   addiu     $a0, $a0, 0x1C8
/* A0C74 800B0474 D0FC848F */  lw         $a0, %gp_rel(ExtraRot)($gp)
/* A0C78 800B0478 00000000 */  nop
/* A0C7C 800B047C 07008010 */  beqz       $a0, .L800B049C
/* A0C80 800B0480 00000000 */   nop
/* A0C84 800B0484 0000428E */  lw         $v0, 0x0($s2)
/* A0C88 800B0488 04008494 */  lhu        $a0, 0x4($a0)
/* A0C8C 800B048C 78004394 */  lhu        $v1, 0x78($v0)
/* A0C90 800B0490 00000000 */  nop
/* A0C94 800B0494 21186400 */  addu       $v1, $v1, $a0
/* A0C98 800B0498 780043A4 */  sh         $v1, 0x78($v0)
.L800B049C:
/* A0C9C 800B049C D0FC80AF */  sw         $zero, %gp_rel(ExtraRot)($gp)
.L800B04A0:
/* A0CA0 800B04A0 0000488E */  lw         $t0, 0x0($s2)
/* A0CA4 800B04A4 001C1000 */  sll        $v1, $s0, 16
/* A0CA8 800B04A8 78000285 */  lh         $v0, 0x78($t0)
/* A0CAC 800B04AC 031C0300 */  sra        $v1, $v1, 16
/* A0CB0 800B04B0 23104300 */  subu       $v0, $v0, $v1
/* A0CB4 800B04B4 FF034224 */  addiu      $v0, $v0, 0x3FF
/* A0CB8 800B04B8 FF07422C */  sltiu      $v0, $v0, 0x7FF
/* A0CBC 800B04BC 0C004010 */  beqz       $v0, .L800B04F0
/* A0CC0 800B04C0 21300000 */   addu      $a2, $zero, $zero
/* A0CC4 800B04C4 34F68427 */  addiu      $a0, $gp, %gp_rel(Raziel + 0x4)
/* A0CC8 800B04C8 49000524 */  addiu      $a1, $zero, 0x49
/* A0CCC 800B04CC 06000724 */  addiu      $a3, $zero, 0x6
/* A0CD0 800B04D0 02000224 */  addiu      $v0, $zero, 0x2
/* A0CD4 800B04D4 780010A5 */  sh         $s0, 0x78($t0)
/* A0CD8 800B04D8 FCC8010C */  jal        G2EmulationSwitchAnimationCharacter
/* A0CDC 800B04DC 1000A2AF */   sw        $v0, 0x10($sp)
/* A0CE0 800B04E0 34F68427 */  addiu      $a0, $gp, %gp_rel(Raziel + 0x4)
/* A0CE4 800B04E4 0B80053C */  lui        $a1, %hi(StateHandlerSlide)
/* A0CE8 800B04E8 8AC10208 */  j          .L800B0628
/* A0CEC 800B04EC 1CC2A524 */   addiu     $a1, $a1, %lo(StateHandlerSlide)
.L800B04F0:
/* A0CF0 800B04F0 34F68427 */  addiu      $a0, $gp, %gp_rel(Raziel + 0x4)
/* A0CF4 800B04F4 4D000524 */  addiu      $a1, $zero, 0x4D
/* A0CF8 800B04F8 06000724 */  addiu      $a3, $zero, 0x6
/* A0CFC 800B04FC 00080226 */  addiu      $v0, $s0, 0x800
/* A0D00 800B0500 780002A5 */  sh         $v0, 0x78($t0)
/* A0D04 800B0504 02000224 */  addiu      $v0, $zero, 0x2
/* A0D08 800B0508 FCC8010C */  jal        G2EmulationSwitchAnimationCharacter
/* A0D0C 800B050C 1000A2AF */   sw        $v0, 0x10($sp)
/* A0D10 800B0510 34F68427 */  addiu      $a0, $gp, %gp_rel(Raziel + 0x4)
/* A0D14 800B0514 0B80053C */  lui        $a1, %hi(StateHandlerSlide)
/* A0D18 800B0518 8AC10208 */  j          .L800B0628
/* A0D1C 800B051C 1CC2A524 */   addiu     $a1, $a1, %lo(StateHandlerSlide)
.L800B0520:
/* A0D20 800B0520 0C002016 */  bnez       $s1, .L800B0554
/* A0D24 800B0524 00000000 */   nop
/* A0D28 800B0528 1CA8828F */  lw         $v0, %gp_rel(LastBlock)($gp)
/* A0D2C 800B052C 98A6838F */  lw         $v1, %gp_rel(LoopCounter)($gp)
/* A0D30 800B0530 02004224 */  addiu      $v0, $v0, 0x2
/* A0D34 800B0534 2A104300 */  slt        $v0, $v0, $v1
/* A0D38 800B0538 02004010 */  beqz       $v0, .L800B0544
/* A0D3C 800B053C 00000000 */   nop
/* A0D40 800B0540 18A880AF */  sw         $zero, %gp_rel(BlockCount)($gp)
.L800B0544:
/* A0D44 800B0544 18A8828F */  lw         $v0, %gp_rel(BlockCount)($gp)
/* A0D48 800B0548 1CA883AF */  sw         $v1, %gp_rel(LastBlock)($gp)
/* A0D4C 800B054C 01004224 */  addiu      $v0, $v0, 0x1
/* A0D50 800B0550 18A882AF */  sw         $v0, %gp_rel(BlockCount)($gp)
.L800B0554:
/* A0D54 800B0554 18A8828F */  lw         $v0, %gp_rel(BlockCount)($gp)
/* A0D58 800B0558 00000000 */  nop
/* A0D5C 800B055C 10004228 */  slti       $v0, $v0, 0x10
/* A0D60 800B0560 BF004014 */  bnez       $v0, .L800B0860
/* A0D64 800B0564 21204002 */   addu      $a0, $s2, $zero
/* A0D68 800B0568 21282002 */  addu       $a1, $s1, $zero
/* A0D6C 800B056C 0B80063C */  lui        $a2, %hi(StateHandlerBlock)
/* A0D70 800B0570 FCC3C624 */  addiu      $a2, $a2, %lo(StateHandlerBlock)
/* A0D74 800B0574 16C20208 */  j          .L800B0858
/* A0D78 800B0578 21380000 */   addu      $a3, $zero, $zero
.L800B057C:
/* A0D7C 800B057C B8002016 */  bnez       $s1, .L800B0860
/* A0D80 800B0580 1800A427 */   addiu     $a0, $sp, 0x18
/* A0D84 800B0584 21280000 */  addu       $a1, $zero, $zero
/* A0D88 800B0588 2EF2020C */  jal        memset
/* A0D8C 800B058C 08000624 */   addiu     $a2, $zero, 0x8
/* A0D90 800B0590 FF00023C */  lui        $v0, (0xFF8010 >> 16)
/* A0D94 800B0594 10804234 */  ori        $v0, $v0, (0xFF8010 & 0xFFFF)
/* A0D98 800B0598 1800A627 */  addiu      $a2, $sp, 0x18
/* A0D9C 800B059C 0400048E */  lw         $a0, 0x4($s0)
/* A0DA0 800B05A0 40000724 */  addiu      $a3, $zero, 0x40
/* A0DA4 800B05A4 1000A2AF */  sw         $v0, 0x10($sp)
/* A0DA8 800B05A8 1400A2AF */  sw         $v0, 0x14($sp)
/* A0DAC 800B05AC 4023010C */  jal        FX_Blood2
/* A0DB0 800B05B0 08008524 */   addiu     $a1, $a0, 0x8
/* A0DB4 800B05B4 18C20208 */  j          .L800B0860
/* A0DB8 800B05B8 00000000 */   nop
.L800B05BC:
/* A0DBC 800B05BC 38FA828F */  lw         $v0, %gp_rel(Raziel + 0x408)($gp)
/* A0DC0 800B05C0 00000000 */  nop
/* A0DC4 800B05C4 02004230 */  andi       $v0, $v0, 0x2
/* A0DC8 800B05C8 A5004010 */  beqz       $v0, .L800B0860
/* A0DCC 800B05CC 03000224 */   addiu     $v0, $zero, 0x3
/* A0DD0 800B05D0 1CFA838F */  lw         $v1, %gp_rel(Raziel + 0x3EC)($gp)
/* A0DD4 800B05D4 00000000 */  nop
/* A0DD8 800B05D8 A1006210 */  beq        $v1, $v0, .L800B0860
/* A0DDC 800B05DC 01000224 */   addiu     $v0, $zero, 0x1
/* A0DE0 800B05E0 68FA838F */  lw         $v1, %gp_rel(Raziel + 0x438)($gp)
/* A0DE4 800B05E4 00000000 */  nop
/* A0DE8 800B05E8 9D006214 */  bne        $v1, $v0, .L800B0860
/* A0DEC 800B05EC 00000000 */   nop
/* A0DF0 800B05F0 9B002016 */  bnez       $s1, .L800B0860
/* A0DF4 800B05F4 00000000 */   nop
/* A0DF8 800B05F8 0000448E */  lw         $a0, 0x0($s2)
/* A0DFC 800B05FC CE9E020C */  jal        razSideMoveSpiderCheck
/* A0E00 800B0600 80FF0524 */   addiu     $a1, $zero, -0x80
/* A0E04 800B0604 96004014 */  bnez       $v0, .L800B0860
/* A0E08 800B0608 00000000 */   nop
/* A0E0C 800B060C 0000448E */  lw         $a0, 0x0($s2)
/* A0E10 800B0610 CE9E020C */  jal        razSideMoveSpiderCheck
/* A0E14 800B0614 80000524 */   addiu     $a1, $zero, 0x80
/* A0E18 800B0618 91004014 */  bnez       $v0, .L800B0860
/* A0E1C 800B061C 21204002 */   addu      $a0, $s2, $zero
/* A0E20 800B0620 0A80053C */  lui        $a1, %hi(StateHandlerWallGrab)
/* A0E24 800B0624 880DA524 */  addiu      $a1, $a1, %lo(StateHandlerWallGrab)
.L800B0628:
/* A0E28 800B0628 A3CA010C */  jal        StateSwitchStateCharacterDataDefault
/* A0E2C 800B062C 21300000 */   addu      $a2, $zero, $zero
/* A0E30 800B0630 18C20208 */  j          .L800B0860
/* A0E34 800B0634 00000000 */   nop
.L800B0638:
/* A0E38 800B0638 0A002216 */  bne        $s1, $v0, .L800B0664
/* A0E3C 800B063C 21204002 */   addu      $a0, $s2, $zero
/* A0E40 800B0640 21284000 */  addu       $a1, $v0, $zero
/* A0E44 800B0644 21300000 */  addu       $a2, $zero, $zero
/* A0E48 800B0648 2138C000 */  addu       $a3, $a2, $zero
/* A0E4C 800B064C 03000224 */  addiu      $v0, $zero, 0x3
/* A0E50 800B0650 1000A2AF */  sw         $v0, 0x10($sp)
/* A0E54 800B0654 20C8010C */  jal        G2EmulationSwitchAnimation
/* A0E58 800B0658 1400B1AF */   sw        $s1, 0x14($sp)
/* A0E5C 800B065C 18C20208 */  j          .L800B0860
/* A0E60 800B0660 00000000 */   nop
.L800B0664:
/* A0E64 800B0664 21282002 */  addu       $a1, $s1, $zero
/* A0E68 800B0668 17000624 */  addiu      $a2, $zero, 0x17
/* A0E6C 800B066C 21380000 */  addu       $a3, $zero, $zero
/* A0E70 800B0670 03000224 */  addiu      $v0, $zero, 0x3
/* A0E74 800B0674 1000A2AF */  sw         $v0, 0x10($sp)
/* A0E78 800B0678 01000224 */  addiu      $v0, $zero, 0x1
/* A0E7C 800B067C 20C8010C */  jal        G2EmulationSwitchAnimation
/* A0E80 800B0680 1400A2AF */   sw        $v0, 0x14($sp)
/* A0E84 800B0684 18C20208 */  j          .L800B0860
/* A0E88 800B0688 00000000 */   nop
.L800B068C:
/* A0E8C 800B068C 0400058E */  lw         $a1, 0x4($s0)
/* A0E90 800B0690 01000224 */  addiu      $v0, $zero, 0x1
/* A0E94 800B0694 1500A214 */  bne        $a1, $v0, .L800B06EC
/* A0E98 800B0698 21204002 */   addu      $a0, $s2, $zero
/* A0E9C 800B069C 0000428E */  lw         $v0, 0x0($s2)
/* A0EA0 800B06A0 00000000 */  nop
/* A0EA4 800B06A4 4C01428C */  lw         $v0, 0x14C($v0)
/* A0EA8 800B06A8 00000000 */  nop
/* A0EAC 800B06AC 0E004010 */  beqz       $v0, .L800B06E8
/* A0EB0 800B06B0 32000624 */   addiu     $a2, $zero, 0x32
/* A0EB4 800B06B4 03000224 */  addiu      $v0, $zero, 0x3
/* A0EB8 800B06B8 1000A2AF */  sw         $v0, 0x10($sp)
/* A0EBC 800B06BC 02000224 */  addiu      $v0, $zero, 0x2
/* A0EC0 800B06C0 1400A2AF */  sw         $v0, 0x14($sp)
/* A0EC4 800B06C4 0400058E */  lw         $a1, 0x4($s0)
/* A0EC8 800B06C8 20C8010C */  jal        G2EmulationSwitchAnimation
/* A0ECC 800B06CC 21380000 */   addu      $a3, $zero, $zero
/* A0ED0 800B06D0 21204002 */  addu       $a0, $s2, $zero
/* A0ED4 800B06D4 21109300 */  addu       $v0, $a0, $s3
/* A0ED8 800B06D8 0400058E */  lw         $a1, 0x4($s0)
/* A0EDC 800B06DC 0800468C */  lw         $a2, 0x8($v0)
/* A0EE0 800B06E0 16C20208 */  j          .L800B0858
/* A0EE4 800B06E4 21380000 */   addu      $a3, $zero, $zero
.L800B06E8:
/* A0EE8 800B06E8 01000524 */  addiu      $a1, $zero, 0x1
.L800B06EC:
/* A0EEC 800B06EC 21300000 */  addu       $a2, $zero, $zero
/* A0EF0 800B06F0 4EC8010C */  jal        G2EmulationSwitchAnimationSync
/* A0EF4 800B06F4 03000724 */   addiu     $a3, $zero, 0x3
/* A0EF8 800B06F8 18C20208 */  j          .L800B0860
/* A0EFC 800B06FC 00000000 */   nop
.L800B0700:
/* A0F00 800B0700 0400068E */  lw         $a2, 0x4($s0)
/* A0F04 800B0704 00000000 */  nop
/* A0F08 800B0708 5500C010 */  beqz       $a2, .L800B0860
/* A0F0C 800B070C 21204002 */   addu      $a0, $s2, $zero
/* A0F10 800B0710 21282002 */  addu       $a1, $s1, $zero
/* A0F14 800B0714 16C20208 */  j          .L800B0858
/* A0F18 800B0718 21380000 */   addu      $a3, $zero, $zero
.L800B071C:
/* A0F1C 800B071C 0000448E */  lw         $a0, 0x0($s2)
/* A0F20 800B0720 D586020C */  jal        InitAlgorithmicWings
/* A0F24 800B0724 00000000 */   nop
/* A0F28 800B0728 18C20208 */  j          .L800B0860
/* A0F2C 800B072C 00000000 */   nop
.L800B0730:
/* A0F30 800B0730 0400108E */  lw         $s0, 0x4($s0)
/* A0F34 800B0734 00000000 */  nop
/* A0F38 800B0738 1800048E */  lw         $a0, 0x18($s0)
/* A0F3C 800B073C 3CC6010C */  jal        SetControlInitHangData
/* A0F40 800B0740 03000624 */   addiu     $a2, $zero, 0x3
/* A0F44 800B0744 21204002 */  addu       $a0, $s2, $zero
/* A0F48 800B0748 21282002 */  addu       $a1, $s1, $zero
/* A0F4C 800B074C 0B80063C */  lui        $a2, %hi(StateHandlerHang)
/* A0F50 800B0750 F4D2C624 */  addiu      $a2, $a2, %lo(StateHandlerHang)
/* A0F54 800B0754 89CA010C */  jal        StateSwitchStateDataDefault
/* A0F58 800B0758 21384000 */   addu      $a3, $v0, $zero
/* A0F5C 800B075C 0000438E */  lw         $v1, 0x0($s2)
/* A0F60 800B0760 1C000296 */  lhu        $v0, 0x1C($s0)
/* A0F64 800B0764 18C20208 */  j          .L800B0860
/* A0F68 800B0768 780062A4 */   sh        $v0, 0x78($v1)
.L800B076C:
/* A0F6C 800B076C 0400028E */  lw         $v0, 0x4($s0)
/* A0F70 800B0770 00000000 */  nop
/* A0F74 800B0774 16004010 */  beqz       $v0, .L800B07D0
/* A0F78 800B0778 00000000 */   nop
/* A0F7C 800B077C 0F002016 */  bnez       $s1, .L800B07BC
/* A0F80 800B0780 21204002 */   addu      $a0, $s2, $zero
/* A0F84 800B0784 0B80023C */  lui        $v0, %hi(StateHandlerSoulSuck)
/* A0F88 800B0788 0800438E */  lw         $v1, 0x8($s2)
/* A0F8C 800B078C E09A4224 */  addiu      $v0, $v0, %lo(StateHandlerSoulSuck)
/* A0F90 800B0790 38FB83AF */  sw         $v1, %gp_rel(Raziel + 0x508)($gp)
/* A0F94 800B0794 03006214 */  bne        $v1, $v0, .L800B07A4
/* A0F98 800B0798 0B80023C */   lui       $v0, %hi(StateHandlerIdle)
/* A0F9C 800B079C E0844224 */  addiu      $v0, $v0, %lo(StateHandlerIdle)
/* A0FA0 800B07A0 38FB82AF */  sw         $v0, %gp_rel(Raziel + 0x508)($gp)
.L800B07A4:
/* A0FA4 800B07A4 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* A0FA8 800B07A8 00000000 */  nop
/* A0FAC 800B07AC 1C0142AE */  sw         $v0, 0x11C($s2)
/* A0FB0 800B07B0 0800023C */  lui        $v0, (0x80000 >> 16)
/* A0FB4 800B07B4 90F982AF */  sw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* A0FB8 800B07B8 21204002 */  addu       $a0, $s2, $zero
.L800B07BC:
/* A0FBC 800B07BC 21282002 */  addu       $a1, $s1, $zero
/* A0FC0 800B07C0 0B80063C */  lui        $a2, %hi(StateHandlerLookAround)
/* A0FC4 800B07C4 A08DC624 */  addiu      $a2, $a2, %lo(StateHandlerLookAround)
/* A0FC8 800B07C8 16C20208 */  j          .L800B0858
/* A0FCC 800B07CC 21380000 */   addu      $a3, $zero, $zero
.L800B07D0:
/* A0FD0 800B07D0 38FB828F */  lw         $v0, %gp_rel(Raziel + 0x508)($gp)
/* A0FD4 800B07D4 00000000 */  nop
/* A0FD8 800B07D8 04004014 */  bnez       $v0, .L800B07EC
/* A0FDC 800B07DC 21204002 */   addu      $a0, $s2, $zero
/* A0FE0 800B07E0 0B80023C */  lui        $v0, %hi(StateHandlerIdle)
/* A0FE4 800B07E4 E0844224 */  addiu      $v0, $v0, %lo(StateHandlerIdle)
/* A0FE8 800B07E8 38FB82AF */  sw         $v0, %gp_rel(Raziel + 0x508)($gp)
.L800B07EC:
/* A0FEC 800B07EC 21282002 */  addu       $a1, $s1, $zero
/* A0FF0 800B07F0 38FB868F */  lw         $a2, %gp_rel(Raziel + 0x508)($gp)
/* A0FF4 800B07F4 16C20208 */  j          .L800B0858
/* A0FF8 800B07F8 21380000 */   addu      $a3, $zero, $zero
.L800B07FC:
/* A0FFC 800B07FC 21204002 */  addu       $a0, $s2, $zero
/* A1000 800B0800 21282002 */  addu       $a1, $s1, $zero
/* A1004 800B0804 0A80063C */  lui        $a2, %hi(StateHandlerStumble)
/* A1008 800B0808 0400078E */  lw         $a3, 0x4($s0)
/* A100C 800B080C 89CA010C */  jal        StateSwitchStateDataDefault
/* A1010 800B0810 44D1C624 */   addiu     $a2, $a2, %lo(StateHandlerStumble)
/* A1014 800B0814 C0181100 */  sll        $v1, $s1, 3
/* A1018 800B0818 21187100 */  addu       $v1, $v1, $s1
/* A101C 800B081C C0180300 */  sll        $v1, $v1, 3
/* A1020 800B0820 23187100 */  subu       $v1, $v1, $s1
/* A1024 800B0824 80180300 */  sll        $v1, $v1, 2
/* A1028 800B0828 0400048E */  lw         $a0, 0x4($s0)
/* A102C 800B082C 21184302 */  addu       $v1, $s2, $v1
/* A1030 800B0830 00110400 */  sll        $v0, $a0, 4
/* A1034 800B0834 23104400 */  subu       $v0, $v0, $a0
/* A1038 800B0838 40100200 */  sll        $v0, $v0, 1
/* A103C 800B083C 18C20208 */  j          .L800B0860
/* A1040 800B0840 1C0162AC */   sw        $v0, 0x11C($v1)
.L800B0844:
/* A1044 800B0844 21204002 */  addu       $a0, $s2, $zero
/* A1048 800B0848 21282002 */  addu       $a1, $s1, $zero
/* A104C 800B084C 0B80063C */  lui        $a2, %hi(StateHandlerGlyphs)
/* A1050 800B0850 50F6C624 */  addiu      $a2, $a2, %lo(StateHandlerGlyphs)
/* A1054 800B0854 01000724 */  addiu      $a3, $zero, 0x1
.L800B0858:
/* A1058 800B0858 89CA010C */  jal        StateSwitchStateDataDefault
/* A105C 800B085C 00000000 */   nop
.L800B0860:
/* A1060 800B0860 4000BF8F */  lw         $ra, 0x40($sp)
/* A1064 800B0864 3C00B38F */  lw         $s3, 0x3C($sp)
/* A1068 800B0868 3800B28F */  lw         $s2, 0x38($sp)
/* A106C 800B086C 3400B18F */  lw         $s1, 0x34($sp)
/* A1070 800B0870 3000B08F */  lw         $s0, 0x30($sp)
/* A1074 800B0874 0800E003 */  jr         $ra
/* A1078 800B0878 4800BD27 */   addiu     $sp, $sp, 0x48
.size DefaultStateHandler, . - DefaultStateHandler
