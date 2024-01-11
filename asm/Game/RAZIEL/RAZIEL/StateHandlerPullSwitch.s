.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StateHandlerPullSwitch
/* 9E7BC 800ADFBC B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 9E7C0 800ADFC0 3800B4AF */  sw         $s4, 0x38($sp)
/* 9E7C4 800ADFC4 21A08000 */  addu       $s4, $a0, $zero
/* 9E7C8 800ADFC8 3C00B5AF */  sw         $s5, 0x3C($sp)
/* 9E7CC 800ADFCC 21A8A000 */  addu       $s5, $a1, $zero
/* 9E7D0 800ADFD0 4C00BFAF */  sw         $ra, 0x4C($sp)
/* 9E7D4 800ADFD4 4800BEAF */  sw         $fp, 0x48($sp)
/* 9E7D8 800ADFD8 4400B7AF */  sw         $s7, 0x44($sp)
/* 9E7DC 800ADFDC 4000B6AF */  sw         $s6, 0x40($sp)
/* 9E7E0 800ADFE0 3400B3AF */  sw         $s3, 0x34($sp)
/* 9E7E4 800ADFE4 3000B2AF */  sw         $s2, 0x30($sp)
/* 9E7E8 800ADFE8 2C00B1AF */  sw         $s1, 0x2C($sp)
/* 9E7EC 800ADFEC 2800B0AF */  sw         $s0, 0x28($sp)
/* 9E7F0 800ADFF0 5800A6AF */  sw         $a2, 0x58($sp)
/* 9E7F4 800ADFF4 1800A0AF */  sw         $zero, 0x18($sp)
/* 9E7F8 800ADFF8 A9C9010C */  jal        G2EmulationQueryAnimation
/* 9E7FC 800ADFFC 1C00A0AF */   sw        $zero, 0x1C($sp)
/* 9E800 800AE000 C0101500 */  sll        $v0, $s5, 3
/* 9E804 800AE004 21105500 */  addu       $v0, $v0, $s5
/* 9E808 800AE008 C0100200 */  sll        $v0, $v0, 3
/* 9E80C 800AE00C 23105500 */  subu       $v0, $v0, $s5
/* 9E810 800AE010 80100200 */  sll        $v0, $v0, 2
/* 9E814 800AE014 08004224 */  addiu      $v0, $v0, 0x8
/* 9E818 800AE018 21B88202 */  addu       $s7, $s4, $v0
/* 9E81C 800AE01C 0400E826 */  addiu      $t0, $s7, 0x4
/* 9E820 800AE020 2000A8AF */  sw         $t0, 0x20($sp)
.L800AE024:
/* 9E824 800AE024 2000A48F */  lw         $a0, 0x20($sp)
/* 9E828 800AE028 39C3010C */  jal        PeekMessageQueue
/* 9E82C 800AE02C 00000000 */   nop
/* 9E830 800AE030 21904000 */  addu       $s2, $v0, $zero
/* 9E834 800AE034 55014012 */  beqz       $s2, .L800AE58C
/* 9E838 800AE038 1000023C */   lui       $v0, (0x100000 >> 16)
/* 9E83C 800AE03C 0000438E */  lw         $v1, 0x0($s2)
/* 9E840 800AE040 00000000 */  nop
/* 9E844 800AE044 B1006210 */  beq        $v1, $v0, .L800AE30C
/* 9E848 800AE048 2A104300 */   slt       $v0, $v0, $v1
/* 9E84C 800AE04C 13004014 */  bnez       $v0, .L800AE09C
/* 9E850 800AE050 0001023C */   lui       $v0, (0x1000000 >> 16)
/* 9E854 800AE054 0080023C */  lui        $v0, (0x80000008 >> 16)
/* 9E858 800AE058 08004234 */  ori        $v0, $v0, (0x80000008 & 0xFFFF)
/* 9E85C 800AE05C 47016210 */  beq        $v1, $v0, .L800AE57C
/* 9E860 800AE060 2A104300 */   slt       $v0, $v0, $v1
/* 9E864 800AE064 05004014 */  bnez       $v0, .L800AE07C
/* 9E868 800AE068 0080023C */   lui       $v0, (0x80000010 >> 16)
/* 9E86C 800AE06C 43016210 */  beq        $v1, $v0, .L800AE57C
/* 9E870 800AE070 21208002 */   addu      $a0, $s4, $zero
/* 9E874 800AE074 5CB90208 */  j          .L800AE570
/* 9E878 800AE078 00000000 */   nop
.L800AE07C:
/* 9E87C 800AE07C 10004234 */  ori        $v0, $v0, (0x80000010 & 0xFFFF)
/* 9E880 800AE080 3E016210 */  beq        $v1, $v0, .L800AE57C
/* 9E884 800AE084 0080023C */   lui       $v0, (0x80000020 >> 16)
/* 9E888 800AE088 20004234 */  ori        $v0, $v0, (0x80000020 & 0xFFFF)
/* 9E88C 800AE08C 3B016210 */  beq        $v1, $v0, .L800AE57C
/* 9E890 800AE090 21208002 */   addu      $a0, $s4, $zero
/* 9E894 800AE094 5CB90208 */  j          .L800AE570
/* 9E898 800AE098 00000000 */   nop
.L800AE09C:
/* 9E89C 800AE09C 1A016210 */  beq        $v1, $v0, .L800AE508
/* 9E8A0 800AE0A0 2A104300 */   slt       $v0, $v0, $v1
/* 9E8A4 800AE0A4 0A004014 */  bnez       $v0, .L800AE0D0
/* 9E8A8 800AE0A8 0001023C */   lui       $v0, (0x1000001 >> 16)
/* 9E8AC 800AE0AC 1000023C */  lui        $v0, (0x100001 >> 16)
/* 9E8B0 800AE0B0 01004234 */  ori        $v0, $v0, (0x100001 & 0xFFFF)
/* 9E8B4 800AE0B4 0D006210 */  beq        $v1, $v0, .L800AE0EC
/* 9E8B8 800AE0B8 1000023C */   lui       $v0, (0x100015 >> 16)
/* 9E8BC 800AE0BC 15004234 */  ori        $v0, $v0, (0x100015 & 0xFFFF)
/* 9E8C0 800AE0C0 F3006210 */  beq        $v1, $v0, .L800AE490
/* 9E8C4 800AE0C4 21208002 */   addu      $a0, $s4, $zero
/* 9E8C8 800AE0C8 5CB90208 */  j          .L800AE570
/* 9E8CC 800AE0CC 00000000 */   nop
.L800AE0D0:
/* 9E8D0 800AE0D0 01004234 */  ori        $v0, $v0, (0x1000001 & 0xFFFF)
/* 9E8D4 800AE0D4 29016210 */  beq        $v1, $v0, .L800AE57C
/* 9E8D8 800AE0D8 0008023C */   lui       $v0, (0x8000000 >> 16)
/* 9E8DC 800AE0DC F8006210 */  beq        $v1, $v0, .L800AE4C0
/* 9E8E0 800AE0E0 21208002 */   addu      $a0, $s4, $zero
/* 9E8E4 800AE0E4 5CB90208 */  j          .L800AE570
/* 9E8E8 800AE0E8 00000000 */   nop
.L800AE0EC:
/* 9E8EC 800AE0EC 2301A016 */  bnez       $s5, .L800AE57C
/* 9E8F0 800AE0F0 0409023C */   lui       $v0, (0x9041108 >> 16)
/* 9E8F4 800AE0F4 08114234 */  ori        $v0, $v0, (0x9041108 & 0xFFFF)
/* 9E8F8 800AE0F8 0000848E */  lw         $a0, 0x0($s4)
/* 9E8FC 800AE0FC C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 9E900 800AE100 03000224 */  addiu      $v0, $zero, 0x3
/* 9E904 800AE104 30FD82AF */  sw         $v0, %gp_rel(PhysicsMode)($gp)
/* 9E908 800AE108 938B020C */  jal        SteerSwitchMode
/* 9E90C 800AE10C 21280000 */   addu      $a1, $zero, $zero
/* 9E910 800AE110 0CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3DC)($gp)
/* 9E914 800AE114 00000000 */  nop
/* 9E918 800AE118 08004230 */  andi       $v0, $v0, 0x8
/* 9E91C 800AE11C 17014010 */  beqz       $v0, .L800AE57C
/* 9E920 800AE120 01001324 */   addiu     $s3, $zero, 0x1
/* 9E924 800AE124 08FA828F */  lw         $v0, %gp_rel(Raziel + 0x3D8)($gp)
/* 9E928 800AE128 21B00000 */  addu       $s6, $zero, $zero
/* 9E92C 800AE12C 1800528C */  lw         $s2, 0x18($v0)
/* 9E930 800AE130 17000524 */  addiu      $a1, $zero, 0x17
/* 9E934 800AE134 92D1000C */  jal        INSTANCE_Query
/* 9E938 800AE138 21204002 */   addu      $a0, $s2, $zero
/* 9E93C 800AE13C 21204002 */  addu       $a0, $s2, $zero
/* 9E940 800AE140 05000524 */  addiu      $a1, $zero, 0x5
/* 9E944 800AE144 92D1000C */  jal        INSTANCE_Query
/* 9E948 800AE148 21804000 */   addu      $s0, $v0, $zero
/* 9E94C 800AE14C 21884000 */  addu       $s1, $v0, $zero
/* 9E950 800AE150 21204002 */  addu       $a0, $s2, $zero
/* 9E954 800AE154 92D1000C */  jal        INSTANCE_Query
/* 9E958 800AE158 1C000524 */   addiu     $a1, $zero, 0x1C
/* 9E95C 800AE15C 21204002 */  addu       $a0, $s2, $zero
/* 9E960 800AE160 04000524 */  addiu      $a1, $zero, 0x4
/* 9E964 800AE164 92D1000C */  jal        INSTANCE_Query
/* 9E968 800AE168 21F04000 */   addu      $fp, $v0, $zero
/* 9E96C 800AE16C 09000324 */  addiu      $v1, $zero, 0x9
/* 9E970 800AE170 18004314 */  bne        $v0, $v1, .L800AE1D4
/* 9E974 800AE174 01002232 */   andi      $v0, $s1, 0x1
/* 9E978 800AE178 0000848E */  lw         $a0, 0x0($s4)
/* 9E97C 800AE17C 6700020C */  jal        MON_FacingOffset
/* 9E980 800AE180 21284002 */   addu      $a1, $s2, $zero
/* 9E984 800AE184 FF0F4330 */  andi       $v1, $v0, 0xFFF
/* 9E988 800AE188 01086228 */  slti       $v0, $v1, 0x801
/* 9E98C 800AE18C 02004014 */  bnez       $v0, .L800AE198
/* 9E990 800AE190 21206000 */   addu      $a0, $v1, $zero
/* 9E994 800AE194 00F06434 */  ori        $a0, $v1, 0xF000
.L800AE198:
/* 9E998 800AE198 00048224 */  addiu      $v0, $a0, 0x400
/* 9E99C 800AE19C FFFF4230 */  andi       $v0, $v0, 0xFFFF
/* 9E9A0 800AE1A0 0108422C */  sltiu      $v0, $v0, 0x801
/* 9E9A4 800AE1A4 04004014 */  bnez       $v0, .L800AE1B8
/* 9E9A8 800AE1A8 FEFF0224 */   addiu     $v0, $zero, -0x2
/* 9E9AC 800AE1AC 01003136 */  ori        $s1, $s1, 0x1
/* 9E9B0 800AE1B0 6FB80208 */  j          .L800AE1BC
/* 9E9B4 800AE1B4 00081624 */   addiu     $s6, $zero, 0x800
.L800AE1B8:
/* 9E9B8 800AE1B8 24882202 */  and        $s1, $s1, $v0
.L800AE1BC:
/* 9E9BC 800AE1BC 21204002 */  addu       $a0, $s2, $zero
/* 9E9C0 800AE1C0 8000053C */  lui        $a1, (0x80002A >> 16)
/* 9E9C4 800AE1C4 2A00A534 */  ori        $a1, $a1, (0x80002A & 0xFFFF)
/* 9E9C8 800AE1C8 A1D1000C */  jal        INSTANCE_Post
/* 9E9CC 800AE1CC 21302002 */   addu      $a2, $s1, $zero
/* 9E9D0 800AE1D0 01002232 */  andi       $v0, $s1, 0x1
.L800AE1D4:
/* 9E9D4 800AE1D4 11004014 */  bnez       $v0, .L800AE21C
/* 9E9D8 800AE1D8 02002232 */   andi      $v0, $s1, 0x2
/* 9E9DC 800AE1DC 08004010 */  beqz       $v0, .L800AE200
/* 9E9E0 800AE1E0 FF000224 */   addiu     $v0, $zero, 0xFF
/* 9E9E4 800AE1E4 14000392 */  lbu        $v1, 0x14($s0)
/* 9E9E8 800AE1E8 00000000 */  nop
/* 9E9EC 800AE1EC 18006210 */  beq        $v1, $v0, .L800AE250
/* 9E9F0 800AE1F0 01000224 */   addiu     $v0, $zero, 0x1
/* 9E9F4 800AE1F4 14000692 */  lbu        $a2, 0x14($s0)
/* 9E9F8 800AE1F8 98B80208 */  j          .L800AE260
/* 9E9FC 800AE1FC 1400A2AF */   sw        $v0, 0x14($sp)
.L800AE200:
/* 9EA00 800AE200 16000392 */  lbu        $v1, 0x16($s0)
/* 9EA04 800AE204 00000000 */  nop
/* 9EA08 800AE208 11006210 */  beq        $v1, $v0, .L800AE250
/* 9EA0C 800AE20C 01000224 */   addiu     $v0, $zero, 0x1
/* 9EA10 800AE210 16000692 */  lbu        $a2, 0x16($s0)
/* 9EA14 800AE214 98B80208 */  j          .L800AE260
/* 9EA18 800AE218 1400A2AF */   sw        $v0, 0x14($sp)
.L800AE21C:
/* 9EA1C 800AE21C 08004010 */  beqz       $v0, .L800AE240
/* 9EA20 800AE220 FF000224 */   addiu     $v0, $zero, 0xFF
/* 9EA24 800AE224 15000392 */  lbu        $v1, 0x15($s0)
/* 9EA28 800AE228 00000000 */  nop
/* 9EA2C 800AE22C 08006210 */  beq        $v1, $v0, .L800AE250
/* 9EA30 800AE230 01000224 */   addiu     $v0, $zero, 0x1
/* 9EA34 800AE234 15000692 */  lbu        $a2, 0x15($s0)
/* 9EA38 800AE238 98B80208 */  j          .L800AE260
/* 9EA3C 800AE23C 1400A2AF */   sw        $v0, 0x14($sp)
.L800AE240:
/* 9EA40 800AE240 17000392 */  lbu        $v1, 0x17($s0)
/* 9EA44 800AE244 00000000 */  nop
/* 9EA48 800AE248 03006214 */  bne        $v1, $v0, .L800AE258
/* 9EA4C 800AE24C 01000224 */   addiu     $v0, $zero, 0x1
.L800AE250:
/* 9EA50 800AE250 9EB80208 */  j          .L800AE278
/* 9EA54 800AE254 21980000 */   addu      $s3, $zero, $zero
.L800AE258:
/* 9EA58 800AE258 17000692 */  lbu        $a2, 0x17($s0)
/* 9EA5C 800AE25C 1400A2AF */  sw         $v0, 0x14($sp)
.L800AE260:
/* 9EA60 800AE260 08FA828F */  lw         $v0, %gp_rel(Raziel + 0x3D8)($gp)
/* 9EA64 800AE264 1000A0AF */  sw         $zero, 0x10($sp)
/* 9EA68 800AE268 0000848E */  lw         $a0, 0x0($s4)
/* 9EA6C 800AE26C 1800458C */  lw         $a1, 0x18($v0)
/* 9EA70 800AE270 C1C8010C */  jal        G2EmulationInstanceToInstanceSwitchAnimationCharacter
/* 9EA74 800AE274 21380000 */   addu      $a3, $zero, $zero
.L800AE278:
/* 9EA78 800AE278 07006016 */  bnez       $s3, .L800AE298
/* 9EA7C 800AE27C 00141600 */   sll       $v0, $s6, 16
/* 9EA80 800AE280 0000848E */  lw         $a0, 0x0($s4)
/* 9EA84 800AE284 1000053C */  lui        $a1, (0x100000 >> 16)
/* 9EA88 800AE288 A1D1000C */  jal        INSTANCE_Post
/* 9EA8C 800AE28C 21302002 */   addu      $a2, $s1, $zero
/* 9EA90 800AE290 5FB90208 */  j          .L800AE57C
/* 9EA94 800AE294 00000000 */   nop
.L800AE298:
/* 9EA98 800AE298 0800C587 */  lh         $a1, 0x8($fp)
/* 9EA9C 800AE29C 0000878E */  lw         $a3, 0x0($s4)
/* 9EAA0 800AE2A0 03140200 */  sra        $v0, $v0, 16
/* 9EAA4 800AE2A4 1000A2AF */  sw         $v0, 0x10($sp)
/* 9EAA8 800AE2A8 08FA828F */  lw         $v0, %gp_rel(Raziel + 0x3D8)($gp)
/* 9EAAC 800AE2AC 5C00E624 */  addiu      $a2, $a3, 0x5C
/* 9EAB0 800AE2B0 1800448C */  lw         $a0, 0x18($v0)
/* 9EAB4 800AE2B4 1794020C */  jal        razAlignYMoveRot
/* 9EAB8 800AE2B8 7400E724 */   addiu     $a3, $a3, 0x74
/* 9EABC 800AE2BC 8000053C */  lui        $a1, (0x800020 >> 16)
/* 9EAC0 800AE2C0 08FA828F */  lw         $v0, %gp_rel(Raziel + 0x3D8)($gp)
/* 9EAC4 800AE2C4 2000A534 */  ori        $a1, $a1, (0x800020 & 0xFFFF)
/* 9EAC8 800AE2C8 1800448C */  lw         $a0, 0x18($v0)
/* 9EACC 800AE2CC A1D1000C */  jal        INSTANCE_Post
/* 9EAD0 800AE2D0 21300000 */   addu      $a2, $zero, $zero
/* 9EAD4 800AE2D4 21204002 */  addu       $a0, $s2, $zero
/* 9EAD8 800AE2D8 92D1000C */  jal        INSTANCE_Query
/* 9EADC 800AE2DC 04000524 */   addiu     $a1, $zero, 0x4
/* 9EAE0 800AE2E0 09000324 */  addiu      $v1, $zero, 0x9
/* 9EAE4 800AE2E4 05004314 */  bne        $v0, $v1, .L800AE2FC
/* 9EAE8 800AE2E8 00000000 */   nop
/* 9EAEC 800AE2EC C89E020C */  jal        razSetPlayerEventHistory
/* 9EAF0 800AE2F0 08000424 */   addiu     $a0, $zero, 0x8
/* 9EAF4 800AE2F4 5FB90208 */  j          .L800AE57C
/* 9EAF8 800AE2F8 00000000 */   nop
.L800AE2FC:
/* 9EAFC 800AE2FC C89E020C */  jal        razSetPlayerEventHistory
/* 9EB00 800AE300 04000424 */   addiu     $a0, $zero, 0x4
/* 9EB04 800AE304 5FB90208 */  j          .L800AE57C
/* 9EB08 800AE308 00000000 */   nop
.L800AE30C:
/* 9EB0C 800AE30C 08FA828F */  lw         $v0, %gp_rel(Raziel + 0x3D8)($gp)
/* 9EB10 800AE310 00000000 */  nop
/* 9EB14 800AE314 1800508C */  lw         $s0, 0x18($v0)
/* 9EB18 800AE318 04000524 */  addiu      $a1, $zero, 0x4
/* 9EB1C 800AE31C 92D1000C */  jal        INSTANCE_Query
/* 9EB20 800AE320 21200002 */   addu      $a0, $s0, $zero
/* 9EB24 800AE324 08FA838F */  lw         $v1, %gp_rel(Raziel + 0x3D8)($gp)
/* 9EB28 800AE328 17000524 */  addiu      $a1, $zero, 0x17
/* 9EB2C 800AE32C 1800648C */  lw         $a0, 0x18($v1)
/* 9EB30 800AE330 92D1000C */  jal        INSTANCE_Query
/* 9EB34 800AE334 21884000 */   addu      $s1, $v0, $zero
/* 9EB38 800AE338 21200002 */  addu       $a0, $s0, $zero
/* 9EB3C 800AE33C 05000524 */  addiu      $a1, $zero, 0x5
/* 9EB40 800AE340 92D1000C */  jal        INSTANCE_Query
/* 9EB44 800AE344 21804000 */   addu      $s0, $v0, $zero
/* 9EB48 800AE348 21184000 */  addu       $v1, $v0, $zero
/* 9EB4C 800AE34C 06000224 */  addiu      $v0, $zero, 0x6
/* 9EB50 800AE350 23002216 */  bne        $s1, $v0, .L800AE3E0
/* 9EB54 800AE354 09000224 */   addiu     $v0, $zero, 0x9
/* 9EB58 800AE358 C4FC828F */  lw         $v0, %gp_rel(PadData)($gp)
/* 9EB5C 800AE35C 8CA4838F */  lw         $v1, %gp_rel(RazielCommands + 0x8)($gp)
/* 9EB60 800AE360 0000428C */  lw         $v0, 0x0($v0)
/* 9EB64 800AE364 01000824 */  addiu      $t0, $zero, 0x1
/* 9EB68 800AE368 24104300 */  and        $v0, $v0, $v1
/* 9EB6C 800AE36C 05004010 */  beqz       $v0, .L800AE384
/* 9EB70 800AE370 1800A8AF */   sw        $t0, 0x18($sp)
/* 9EB74 800AE374 0400428E */  lw         $v0, 0x4($s2)
/* 9EB78 800AE378 00000000 */  nop
/* 9EB7C 800AE37C 5D004010 */  beqz       $v0, .L800AE4F4
/* 9EB80 800AE380 8C00E426 */   addiu     $a0, $s7, 0x8C
.L800AE384:
/* 9EB84 800AE384 21200000 */  addu       $a0, $zero, $zero
/* 9EB88 800AE388 21288000 */  addu       $a1, $a0, $zero
/* 9EB8C 800AE38C 4FC6010C */  jal        SetControlInitIdleData
/* 9EB90 800AE390 03000624 */   addiu     $a2, $zero, 0x3
/* 9EB94 800AE394 21208002 */  addu       $a0, $s4, $zero
/* 9EB98 800AE398 2128A002 */  addu       $a1, $s5, $zero
/* 9EB9C 800AE39C 0B80063C */  lui        $a2, %hi(StateHandlerIdle)
/* 9EBA0 800AE3A0 E084C624 */  addiu      $a2, $a2, %lo(StateHandlerIdle)
/* 9EBA4 800AE3A4 C1CA010C */  jal        StateSwitchStateData
/* 9EBA8 800AE3A8 21384000 */   addu      $a3, $v0, $zero
/* 9EBAC 800AE3AC C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 9EBB0 800AE3B0 00000000 */  nop
/* 9EBB4 800AE3B4 01004234 */  ori        $v0, $v0, 0x1
/* 9EBB8 800AE3B8 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 9EBBC 800AE3BC 6F00A016 */  bnez       $s5, .L800AE57C
/* 9EBC0 800AE3C0 8000053C */   lui       $a1, (0x800020 >> 16)
/* 9EBC4 800AE3C4 08FA828F */  lw         $v0, %gp_rel(Raziel + 0x3D8)($gp)
/* 9EBC8 800AE3C8 2000A534 */  ori        $a1, $a1, (0x800020 & 0xFFFF)
/* 9EBCC 800AE3CC 1800448C */  lw         $a0, 0x18($v0)
/* 9EBD0 800AE3D0 A1D1000C */  jal        INSTANCE_Post
/* 9EBD4 800AE3D4 21300000 */   addu      $a2, $zero, $zero
/* 9EBD8 800AE3D8 5FB90208 */  j          .L800AE57C
/* 9EBDC 800AE3DC 00000000 */   nop
.L800AE3E0:
/* 9EBE0 800AE3E0 1C002216 */  bne        $s1, $v0, .L800AE454
/* 9EBE4 800AE3E4 21200000 */   addu      $a0, $zero, $zero
/* 9EBE8 800AE3E8 01006230 */  andi       $v0, $v1, 0x1
/* 9EBEC 800AE3EC 04004010 */  beqz       $v0, .L800AE400
/* 9EBF0 800AE3F0 00000000 */   nop
/* 9EBF4 800AE3F4 11000492 */  lbu        $a0, 0x11($s0)
/* 9EBF8 800AE3F8 01B90208 */  j          .L800AE404
/* 9EBFC 800AE3FC 00000000 */   nop
.L800AE400:
/* 9EC00 800AE400 12000492 */  lbu        $a0, 0x12($s0)
.L800AE404:
/* 9EC04 800AE404 31CC020C */  jal        SetTimer
/* 9EC08 800AE408 06008424 */   addiu     $a0, $a0, 0x6
/* 9EC0C 800AE40C 21208002 */  addu       $a0, $s4, $zero
/* 9EC10 800AE410 2128A002 */  addu       $a1, $s5, $zero
/* 9EC14 800AE414 7B000624 */  addiu      $a2, $zero, 0x7B
/* 9EC18 800AE418 21380000 */  addu       $a3, $zero, $zero
/* 9EC1C 800AE41C 06000224 */  addiu      $v0, $zero, 0x6
/* 9EC20 800AE420 1000A2AF */  sw         $v0, 0x10($sp)
/* 9EC24 800AE424 02000224 */  addiu      $v0, $zero, 0x2
/* 9EC28 800AE428 20C8010C */  jal        G2EmulationSwitchAnimation
/* 9EC2C 800AE42C 1400A2AF */   sw        $v0, 0x14($sp)
/* 9EC30 800AE430 5200A016 */  bnez       $s5, .L800AE57C
/* 9EC34 800AE434 8000053C */   lui       $a1, (0x80002D >> 16)
/* 9EC38 800AE438 08FA828F */  lw         $v0, %gp_rel(Raziel + 0x3D8)($gp)
/* 9EC3C 800AE43C 2D00A534 */  ori        $a1, $a1, (0x80002D & 0xFFFF)
/* 9EC40 800AE440 1800448C */  lw         $a0, 0x18($v0)
/* 9EC44 800AE444 A1D1000C */  jal        INSTANCE_Post
/* 9EC48 800AE448 14000624 */   addiu     $a2, $zero, 0x14
/* 9EC4C 800AE44C 5FB90208 */  j          .L800AE57C
/* 9EC50 800AE450 00000000 */   nop
.L800AE454:
/* 9EC54 800AE454 21288000 */  addu       $a1, $a0, $zero
/* 9EC58 800AE458 4FC6010C */  jal        SetControlInitIdleData
/* 9EC5C 800AE45C 03000624 */   addiu     $a2, $zero, 0x3
/* 9EC60 800AE460 21208002 */  addu       $a0, $s4, $zero
/* 9EC64 800AE464 2128A002 */  addu       $a1, $s5, $zero
/* 9EC68 800AE468 0B80063C */  lui        $a2, %hi(StateHandlerIdle)
/* 9EC6C 800AE46C E084C624 */  addiu      $a2, $a2, %lo(StateHandlerIdle)
/* 9EC70 800AE470 C1CA010C */  jal        StateSwitchStateData
/* 9EC74 800AE474 21384000 */   addu      $a3, $v0, $zero
/* 9EC78 800AE478 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 9EC7C 800AE47C 00000000 */  nop
/* 9EC80 800AE480 01004234 */  ori        $v0, $v0, 0x1
/* 9EC84 800AE484 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 9EC88 800AE488 5FB90208 */  j          .L800AE57C
/* 9EC8C 800AE48C 00000000 */   nop
.L800AE490:
/* 9EC90 800AE490 21200000 */  addu       $a0, $zero, $zero
/* 9EC94 800AE494 21288000 */  addu       $a1, $a0, $zero
/* 9EC98 800AE498 4FC6010C */  jal        SetControlInitIdleData
/* 9EC9C 800AE49C 03000624 */   addiu     $a2, $zero, 0x3
/* 9ECA0 800AE4A0 21208002 */  addu       $a0, $s4, $zero
/* 9ECA4 800AE4A4 2128A002 */  addu       $a1, $s5, $zero
/* 9ECA8 800AE4A8 0B80063C */  lui        $a2, %hi(StateHandlerIdle)
/* 9ECAC 800AE4AC E084C624 */  addiu      $a2, $a2, %lo(StateHandlerIdle)
/* 9ECB0 800AE4B0 C1CA010C */  jal        StateSwitchStateData
/* 9ECB4 800AE4B4 21384000 */   addu      $a3, $v0, $zero
/* 9ECB8 800AE4B8 5FB90208 */  j          .L800AE57C
/* 9ECBC 800AE4BC 00000000 */   nop
.L800AE4C0:
/* 9ECC0 800AE4C0 02000224 */  addiu      $v0, $zero, 0x2
/* 9ECC4 800AE4C4 0B00A216 */  bne        $s5, $v0, .L800AE4F4
/* 9ECC8 800AE4C8 8C00E426 */   addiu     $a0, $s7, 0x8C
/* 9ECCC 800AE4CC 21208002 */  addu       $a0, $s4, $zero
/* 9ECD0 800AE4D0 21284000 */  addu       $a1, $v0, $zero
/* 9ECD4 800AE4D4 21300000 */  addu       $a2, $zero, $zero
/* 9ECD8 800AE4D8 2138C000 */  addu       $a3, $a2, $zero
/* 9ECDC 800AE4DC 03000224 */  addiu      $v0, $zero, 0x3
/* 9ECE0 800AE4E0 1000A2AF */  sw         $v0, 0x10($sp)
/* 9ECE4 800AE4E4 20C8010C */  jal        G2EmulationSwitchAnimation
/* 9ECE8 800AE4E8 1400B5AF */   sw        $s5, 0x14($sp)
/* 9ECEC 800AE4EC 5FB90208 */  j          .L800AE57C
/* 9ECF0 800AE4F0 00000000 */   nop
.L800AE4F4:
/* 9ECF4 800AE4F4 1000053C */  lui        $a1, (0x100000 >> 16)
/* 9ECF8 800AE4F8 4EC3010C */  jal        EnMessageQueueData
/* 9ECFC 800AE4FC 21300000 */   addu      $a2, $zero, $zero
/* 9ED00 800AE500 5FB90208 */  j          .L800AE57C
/* 9ED04 800AE504 00000000 */   nop
.L800AE508:
/* 9ED08 800AE508 1800A88F */  lw         $t0, 0x18($sp)
/* 9ED0C 800AE50C 0400508E */  lw         $s0, 0x4($s2)
/* 9ED10 800AE510 04000011 */  beqz       $t0, .L800AE524
/* 9ED14 800AE514 1000053C */   lui       $a1, (0x100000 >> 16)
/* 9ED18 800AE518 2000A48F */  lw         $a0, 0x20($sp)
/* 9ED1C 800AE51C 4EC3010C */  jal        EnMessageQueueData
/* 9ED20 800AE520 01000624 */   addiu     $a2, $zero, 0x1
.L800AE524:
/* 9ED24 800AE524 1C00A88F */  lw         $t0, 0x1C($sp)
/* 9ED28 800AE528 00000000 */  nop
/* 9ED2C 800AE52C 13000015 */  bnez       $t0, .L800AE57C
/* 9ED30 800AE530 01000824 */   addiu     $t0, $zero, 0x1
/* 9ED34 800AE534 08000786 */  lh         $a3, 0x8($s0)
/* 9ED38 800AE538 0A000286 */  lh         $v0, 0xA($s0)
/* 9ED3C 800AE53C 1C00A8AF */  sw         $t0, 0x1C($sp)
/* 9ED40 800AE540 1000A2AF */  sw         $v0, 0x10($sp)
/* 9ED44 800AE544 0000048E */  lw         $a0, 0x0($s0)
/* 9ED48 800AE548 0400058E */  lw         $a1, 0x4($s0)
/* 9ED4C 800AE54C 0C00068E */  lw         $a2, 0xC($s0)
/* 9ED50 800AE550 95C3010C */  jal        SetMonsterHitData
/* 9ED54 800AE554 00000000 */   nop
/* 9ED58 800AE558 8C00E426 */  addiu      $a0, $s7, 0x8C
/* 9ED5C 800AE55C 0001053C */  lui        $a1, (0x1000000 >> 16)
/* 9ED60 800AE560 4EC3010C */  jal        EnMessageQueueData
/* 9ED64 800AE564 21304000 */   addu      $a2, $v0, $zero
/* 9ED68 800AE568 5FB90208 */  j          .L800AE57C
/* 9ED6C 800AE56C 00000000 */   nop
.L800AE570:
/* 9ED70 800AE570 5800A68F */  lw         $a2, 0x58($sp)
/* 9ED74 800AE574 B9BF020C */  jal        DefaultStateHandler
/* 9ED78 800AE578 2128A002 */   addu      $a1, $s5, $zero
.L800AE57C:
/* 9ED7C 800AE57C 27C3010C */  jal        DeMessageQueue
/* 9ED80 800AE580 0400E426 */   addiu     $a0, $s7, 0x4
/* 9ED84 800AE584 09B80208 */  j          .L800AE024
/* 9ED88 800AE588 00000000 */   nop
.L800AE58C:
/* 9ED8C 800AE58C 0300A016 */  bnez       $s5, .L800AE59C
/* 9ED90 800AE590 21208002 */   addu      $a0, $s4, $zero
/* 9ED94 800AE594 AF9A020C */  jal        razApplyMotion
/* 9ED98 800AE598 21280000 */   addu      $a1, $zero, $zero
.L800AE59C:
/* 9ED9C 800AE59C 4C00BF8F */  lw         $ra, 0x4C($sp)
/* 9EDA0 800AE5A0 4800BE8F */  lw         $fp, 0x48($sp)
/* 9EDA4 800AE5A4 4400B78F */  lw         $s7, 0x44($sp)
/* 9EDA8 800AE5A8 4000B68F */  lw         $s6, 0x40($sp)
/* 9EDAC 800AE5AC 3C00B58F */  lw         $s5, 0x3C($sp)
/* 9EDB0 800AE5B0 3800B48F */  lw         $s4, 0x38($sp)
/* 9EDB4 800AE5B4 3400B38F */  lw         $s3, 0x34($sp)
/* 9EDB8 800AE5B8 3000B28F */  lw         $s2, 0x30($sp)
/* 9EDBC 800AE5BC 2C00B18F */  lw         $s1, 0x2C($sp)
/* 9EDC0 800AE5C0 2800B08F */  lw         $s0, 0x28($sp)
/* 9EDC4 800AE5C4 0800E003 */  jr         $ra
/* 9EDC8 800AE5C8 5000BD27 */   addiu     $sp, $sp, 0x50
.size StateHandlerPullSwitch, . - StateHandlerPullSwitch
