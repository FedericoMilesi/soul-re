.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StateHandlerPushObject
/* 9E098 800AD898 0CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3DC)($gp)
/* 9E09C 800AD89C C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 9E0A0 800AD8A0 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 9E0A4 800AD8A4 21888000 */  addu       $s1, $a0, $zero
/* 9E0A8 800AD8A8 2000B2AF */  sw         $s2, 0x20($sp)
/* 9E0AC 800AD8AC 2190A000 */  addu       $s2, $a1, $zero
/* 9E0B0 800AD8B0 2C00B5AF */  sw         $s5, 0x2C($sp)
/* 9E0B4 800AD8B4 21A8C000 */  addu       $s5, $a2, $zero
/* 9E0B8 800AD8B8 3000BFAF */  sw         $ra, 0x30($sp)
/* 9E0BC 800AD8BC 2800B4AF */  sw         $s4, 0x28($sp)
/* 9E0C0 800AD8C0 2400B3AF */  sw         $s3, 0x24($sp)
/* 9E0C4 800AD8C4 03004230 */  andi       $v0, $v0, 0x3
/* 9E0C8 800AD8C8 0B004014 */  bnez       $v0, .L800AD8F8
/* 9E0CC 800AD8CC 1800B0AF */   sw        $s0, 0x18($sp)
/* 9E0D0 800AD8D0 C0201200 */  sll        $a0, $s2, 3
/* 9E0D4 800AD8D4 21209200 */  addu       $a0, $a0, $s2
/* 9E0D8 800AD8D8 C0200400 */  sll        $a0, $a0, 3
/* 9E0DC 800AD8DC 23209200 */  subu       $a0, $a0, $s2
/* 9E0E0 800AD8E0 80200400 */  sll        $a0, $a0, 2
/* 9E0E4 800AD8E4 21209100 */  addu       $a0, $a0, $s1
/* 9E0E8 800AD8E8 94008424 */  addiu      $a0, $a0, 0x94
/* 9E0EC 800AD8EC 1000053C */  lui        $a1, (0x100000 >> 16)
/* 9E0F0 800AD8F0 4EC3010C */  jal        EnMessageQueueData
/* 9E0F4 800AD8F4 21300000 */   addu      $a2, $zero, $zero
.L800AD8F8:
/* 9E0F8 800AD8F8 C0101200 */  sll        $v0, $s2, 3
/* 9E0FC 800AD8FC 21105200 */  addu       $v0, $v0, $s2
/* 9E100 800AD900 C0100200 */  sll        $v0, $v0, 3
/* 9E104 800AD904 23105200 */  subu       $v0, $v0, $s2
/* 9E108 800AD908 80980200 */  sll        $s3, $v0, 2
/* 9E10C 800AD90C 08006226 */  addiu      $v0, $s3, 0x8
/* 9E110 800AD910 21A02202 */  addu       $s4, $s1, $v0
.L800AD914:
/* 9E114 800AD914 39C3010C */  jal        PeekMessageQueue
/* 9E118 800AD918 04008426 */   addiu     $a0, $s4, 0x4
/* 9E11C 800AD91C A0004010 */  beqz       $v0, .L800ADBA0
/* 9E120 800AD920 1000043C */   lui       $a0, (0x100001 >> 16)
/* 9E124 800AD924 0000438C */  lw         $v1, 0x0($v0)
/* 9E128 800AD928 01008434 */  ori        $a0, $a0, (0x100001 & 0xFFFF)
/* 9E12C 800AD92C 18006410 */  beq        $v1, $a0, .L800AD990
/* 9E130 800AD930 2A108300 */   slt       $v0, $a0, $v1
/* 9E134 800AD934 09004014 */  bnez       $v0, .L800AD95C
/* 9E138 800AD938 0008023C */   lui       $v0, (0x8000000 >> 16)
/* 9E13C 800AD93C 0080023C */  lui        $v0, (0x80000008 >> 16)
/* 9E140 800AD940 08004234 */  ori        $v0, $v0, (0x80000008 & 0xFFFF)
/* 9E144 800AD944 92006210 */  beq        $v1, $v0, .L800ADB90
/* 9E148 800AD948 1000023C */   lui       $v0, (0x100000 >> 16)
/* 9E14C 800AD94C 27006210 */  beq        $v1, $v0, .L800AD9EC
/* 9E150 800AD950 21202002 */   addu      $a0, $s1, $zero
/* 9E154 800AD954 E2B60208 */  j          .L800ADB88
/* 9E158 800AD958 21284002 */   addu      $a1, $s2, $zero
.L800AD95C:
/* 9E15C 800AD95C 2A106200 */  slt        $v0, $v1, $v0
/* 9E160 800AD960 88004014 */  bnez       $v0, .L800ADB84
/* 9E164 800AD964 21202002 */   addu      $a0, $s1, $zero
/* 9E168 800AD968 0008023C */  lui        $v0, (0x8000001 >> 16)
/* 9E16C 800AD96C 01004234 */  ori        $v0, $v0, (0x8000001 & 0xFFFF)
/* 9E170 800AD970 2A104300 */  slt        $v0, $v0, $v1
/* 9E174 800AD974 29004010 */  beqz       $v0, .L800ADA1C
/* 9E178 800AD978 0008023C */   lui       $v0, (0x8000004 >> 16)
/* 9E17C 800AD97C 04004234 */  ori        $v0, $v0, (0x8000004 & 0xFFFF)
/* 9E180 800AD980 6A006210 */  beq        $v1, $v0, .L800ADB2C
/* 9E184 800AD984 06000624 */   addiu     $a2, $zero, 0x6
/* 9E188 800AD988 E2B60208 */  j          .L800ADB88
/* 9E18C 800AD98C 21284002 */   addu      $a1, $s2, $zero
.L800AD990:
/* 9E190 800AD990 11004016 */  bnez       $s2, .L800AD9D8
/* 9E194 800AD994 21103302 */   addu      $v0, $s1, $s3
/* 9E198 800AD998 0008033C */  lui        $v1, (0x8001108 >> 16)
/* 9E19C 800AD99C 08116334 */  ori        $v1, $v1, (0x8001108 & 0xFFFF)
/* 9E1A0 800AD9A0 00040224 */  addiu      $v0, $zero, 0x400
/* 9E1A4 800AD9A4 90F982AF */  sw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 9E1A8 800AD9A8 0000248E */  lw         $a0, 0x0($s1)
/* 9E1AC 800AD9AC 03000224 */  addiu      $v0, $zero, 0x3
/* 9E1B0 800AD9B0 C8FD83AF */  sw         $v1, %gp_rel(ControlFlag)($gp)
/* 9E1B4 800AD9B4 30FD82AF */  sw         $v0, %gp_rel(PhysicsMode)($gp)
/* 9E1B8 800AD9B8 938B020C */  jal        SteerSwitchMode
/* 9E1BC 800AD9BC 21280000 */   addu      $a1, $zero, $zero
/* 9E1C0 800AD9C0 08FA828F */  lw         $v0, %gp_rel(Raziel + 0x3D8)($gp)
/* 9E1C4 800AD9C4 0000248E */  lw         $a0, 0x0($s1)
/* 9E1C8 800AD9C8 0000458C */  lw         $a1, 0x0($v0)
/* 9E1CC 800AD9CC 6C98020C */  jal        razCenterWithBlock
/* 9E1D0 800AD9D0 73FF0624 */   addiu     $a2, $zero, -0x8D
/* 9E1D4 800AD9D4 21103302 */  addu       $v0, $s1, $s3
.L800AD9D8:
/* 9E1D8 800AD9D8 1C0140AC */  sw         $zero, 0x11C($v0)
/* 9E1DC 800AD9DC C89E020C */  jal        razSetPlayerEventHistory
/* 9E1E0 800AD9E0 01000424 */   addiu     $a0, $zero, 0x1
/* 9E1E4 800AD9E4 E4B60208 */  j          .L800ADB90
/* 9E1E8 800AD9E8 00000000 */   nop
.L800AD9EC:
/* 9E1EC 800AD9EC 21200000 */  addu       $a0, $zero, $zero
/* 9E1F0 800AD9F0 21288000 */  addu       $a1, $a0, $zero
/* 9E1F4 800AD9F4 4FC6010C */  jal        SetControlInitIdleData
/* 9E1F8 800AD9F8 06000624 */   addiu     $a2, $zero, 0x6
/* 9E1FC 800AD9FC 21202002 */  addu       $a0, $s1, $zero
/* 9E200 800ADA00 21284002 */  addu       $a1, $s2, $zero
/* 9E204 800ADA04 0B80063C */  lui        $a2, %hi(StateHandlerIdle)
/* 9E208 800ADA08 E084C624 */  addiu      $a2, $a2, %lo(StateHandlerIdle)
/* 9E20C 800ADA0C C1CA010C */  jal        StateSwitchStateData
/* 9E210 800ADA10 21384000 */   addu      $a3, $v0, $zero
/* 9E214 800ADA14 E4B60208 */  j          .L800ADB90
/* 9E218 800ADA18 00000000 */   nop
.L800ADA1C:
/* 9E21C 800ADA1C C4FC828F */  lw         $v0, %gp_rel(PadData)($gp)
/* 9E220 800ADA20 8CA4838F */  lw         $v1, %gp_rel(RazielCommands + 0x8)($gp)
/* 9E224 800ADA24 0000428C */  lw         $v0, 0x0($v0)
/* 9E228 800ADA28 00000000 */  nop
/* 9E22C 800ADA2C 24104300 */  and        $v0, $v0, $v1
/* 9E230 800ADA30 07004010 */  beqz       $v0, .L800ADA50
/* 9E234 800ADA34 21103302 */   addu      $v0, $s1, $s3
/* 9E238 800ADA38 0CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3DC)($gp)
/* 9E23C 800ADA3C 00000000 */  nop
/* 9E240 800ADA40 02004230 */  andi       $v0, $v0, 0x2
/* 9E244 800ADA44 32004014 */  bnez       $v0, .L800ADB10
/* 9E248 800ADA48 21202002 */   addu      $a0, $s1, $zero
/* 9E24C 800ADA4C 21103302 */  addu       $v0, $s1, $s3
.L800ADA50:
/* 9E250 800ADA50 1C01428C */  lw         $v0, 0x11C($v0)
/* 9E254 800ADA54 00000000 */  nop
/* 9E258 800ADA58 10004010 */  beqz       $v0, .L800ADA9C
/* 9E25C 800ADA5C 21200000 */   addu      $a0, $zero, $zero
/* 9E260 800ADA60 21288000 */  addu       $a1, $a0, $zero
/* 9E264 800ADA64 4FC6010C */  jal        SetControlInitIdleData
/* 9E268 800ADA68 03000624 */   addiu     $a2, $zero, 0x3
/* 9E26C 800ADA6C 21202002 */  addu       $a0, $s1, $zero
/* 9E270 800ADA70 21284002 */  addu       $a1, $s2, $zero
/* 9E274 800ADA74 0B80063C */  lui        $a2, %hi(StateHandlerIdle)
/* 9E278 800ADA78 E084C624 */  addiu      $a2, $a2, %lo(StateHandlerIdle)
/* 9E27C 800ADA7C C1CA010C */  jal        StateSwitchStateData
/* 9E280 800ADA80 21384000 */   addu      $a3, $v0, $zero
/* 9E284 800ADA84 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 9E288 800ADA88 00000000 */  nop
/* 9E28C 800ADA8C 01004234 */  ori        $v0, $v0, 0x1
/* 9E290 800ADA90 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 9E294 800ADA94 E4B60208 */  j          .L800ADB90
/* 9E298 800ADA98 00000000 */   nop
.L800ADA9C:
/* 9E29C 800ADA9C 02000224 */  addiu      $v0, $zero, 0x2
/* 9E2A0 800ADAA0 08004216 */  bne        $s2, $v0, .L800ADAC4
/* 9E2A4 800ADAA4 21202002 */   addu      $a0, $s1, $zero
/* 9E2A8 800ADAA8 21284000 */  addu       $a1, $v0, $zero
/* 9E2AC 800ADAAC 21300000 */  addu       $a2, $zero, $zero
/* 9E2B0 800ADAB0 2138C000 */  addu       $a3, $a2, $zero
/* 9E2B4 800ADAB4 03000224 */  addiu      $v0, $zero, 0x3
/* 9E2B8 800ADAB8 1000A2AF */  sw         $v0, 0x10($sp)
/* 9E2BC 800ADABC B8B60208 */  j          .L800ADAE0
/* 9E2C0 800ADAC0 1400B2AF */   sw        $s2, 0x14($sp)
.L800ADAC4:
/* 9E2C4 800ADAC4 21284002 */  addu       $a1, $s2, $zero
/* 9E2C8 800ADAC8 17000624 */  addiu      $a2, $zero, 0x17
/* 9E2CC 800ADACC 21380000 */  addu       $a3, $zero, $zero
/* 9E2D0 800ADAD0 03000224 */  addiu      $v0, $zero, 0x3
/* 9E2D4 800ADAD4 1000A2AF */  sw         $v0, 0x10($sp)
/* 9E2D8 800ADAD8 01000224 */  addiu      $v0, $zero, 0x1
/* 9E2DC 800ADADC 1400A2AF */  sw         $v0, 0x14($sp)
.L800ADAE0:
/* 9E2E0 800ADAE0 20C8010C */  jal        G2EmulationSwitchAnimation
/* 9E2E4 800ADAE4 00000000 */   nop
/* 9E2E8 800ADAE8 21183302 */  addu       $v1, $s1, $s3
/* 9E2EC 800ADAEC 01000224 */  addiu      $v0, $zero, 0x1
/* 9E2F0 800ADAF0 27004016 */  bnez       $s2, .L800ADB90
/* 9E2F4 800ADAF4 1C0162AC */   sw        $v0, 0x11C($v1)
/* 9E2F8 800ADAF8 90010224 */  addiu      $v0, $zero, 0x190
/* 9E2FC 800ADAFC 8CFB82A7 */  sh         $v0, %gp_rel(Raziel + 0x55C)($gp)
/* 9E300 800ADB00 0000238E */  lw         $v1, 0x0($s1)
/* 9E304 800ADB04 8CFB8227 */  addiu      $v0, $gp, %gp_rel(Raziel + 0x55C)
/* 9E308 800ADB08 E4B60208 */  j          .L800ADB90
/* 9E30C 800ADB0C F80162AC */   sw        $v0, 0x1F8($v1)
.L800ADB10:
/* 9E310 800ADB10 21284002 */  addu       $a1, $s2, $zero
/* 9E314 800ADB14 0B80063C */  lui        $a2, %hi(StateHandlerDragObject)
/* 9E318 800ADB18 CCE5C624 */  addiu      $a2, $a2, %lo(StateHandlerDragObject)
/* 9E31C 800ADB1C C1CA010C */  jal        StateSwitchStateData
/* 9E320 800ADB20 21380000 */   addu      $a3, $zero, $zero
/* 9E324 800ADB24 E4B60208 */  j          .L800ADB90
/* 9E328 800ADB28 00000000 */   nop
.L800ADB2C:
/* 9E32C 800ADB2C D0F98487 */  lh         $a0, %gp_rel(Raziel + 0x3A0)($gp)
/* 9E330 800ADB30 D2F98587 */  lh         $a1, %gp_rel(Raziel + 0x3A2)($gp)
/* 9E334 800ADB34 21380000 */  addu       $a3, $zero, $zero
/* 9E338 800ADB38 1000A0AF */  sw         $zero, 0x10($sp)
/* 9E33C 800ADB3C 23200400 */  negu       $a0, $a0
/* 9E340 800ADB40 21C4010C */  jal        SetObjectData
/* 9E344 800ADB44 23280500 */   negu      $a1, $a1
/* 9E348 800ADB48 8000053C */  lui        $a1, (0x800000 >> 16)
/* 9E34C 800ADB4C 08FA838F */  lw         $v1, %gp_rel(Raziel + 0x3D8)($gp)
/* 9E350 800ADB50 21804000 */  addu       $s0, $v0, $zero
/* 9E354 800ADB54 0000648C */  lw         $a0, 0x0($v1)
/* 9E358 800ADB58 A1D1000C */  jal        INSTANCE_Post
/* 9E35C 800ADB5C 21300002 */   addu      $a2, $s0, $zero
/* 9E360 800ADB60 0C00028E */  lw         $v0, 0xC($s0)
/* 9E364 800ADB64 00000000 */  nop
/* 9E368 800ADB68 09004014 */  bnez       $v0, .L800ADB90
/* 9E36C 800ADB6C 1000053C */   lui       $a1, (0x100000 >> 16)
/* 9E370 800ADB70 0000248E */  lw         $a0, 0x0($s1)
/* 9E374 800ADB74 A1D1000C */  jal        INSTANCE_Post
/* 9E378 800ADB78 21300000 */   addu      $a2, $zero, $zero
/* 9E37C 800ADB7C E4B60208 */  j          .L800ADB90
/* 9E380 800ADB80 00000000 */   nop
.L800ADB84:
/* 9E384 800ADB84 21284002 */  addu       $a1, $s2, $zero
.L800ADB88:
/* 9E388 800ADB88 B9BF020C */  jal        DefaultStateHandler
/* 9E38C 800ADB8C 2130A002 */   addu      $a2, $s5, $zero
.L800ADB90:
/* 9E390 800ADB90 27C3010C */  jal        DeMessageQueue
/* 9E394 800ADB94 04008426 */   addiu     $a0, $s4, 0x4
/* 9E398 800ADB98 45B60208 */  j          .L800AD914
/* 9E39C 800ADB9C 00000000 */   nop
.L800ADBA0:
/* 9E3A0 800ADBA0 3000BF8F */  lw         $ra, 0x30($sp)
/* 9E3A4 800ADBA4 2C00B58F */  lw         $s5, 0x2C($sp)
/* 9E3A8 800ADBA8 2800B48F */  lw         $s4, 0x28($sp)
/* 9E3AC 800ADBAC 2400B38F */  lw         $s3, 0x24($sp)
/* 9E3B0 800ADBB0 2000B28F */  lw         $s2, 0x20($sp)
/* 9E3B4 800ADBB4 1C00B18F */  lw         $s1, 0x1C($sp)
/* 9E3B8 800ADBB8 1800B08F */  lw         $s0, 0x18($sp)
/* 9E3BC 800ADBBC 0800E003 */  jr         $ra
/* 9E3C0 800ADBC0 3800BD27 */   addiu     $sp, $sp, 0x38
.size StateHandlerPushObject, . - StateHandlerPushObject
