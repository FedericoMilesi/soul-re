.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StateHandlerDropAction
/* 9A060 800A9860 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 9A064 800A9864 2400B1AF */  sw         $s1, 0x24($sp)
/* 9A068 800A9868 21888000 */  addu       $s1, $a0, $zero
/* 9A06C 800A986C 2000B0AF */  sw         $s0, 0x20($sp)
/* 9A070 800A9870 2180A000 */  addu       $s0, $a1, $zero
/* 9A074 800A9874 3000B4AF */  sw         $s4, 0x30($sp)
/* 9A078 800A9878 21A0C000 */  addu       $s4, $a2, $zero
/* 9A07C 800A987C C0101000 */  sll        $v0, $s0, 3
/* 9A080 800A9880 21105000 */  addu       $v0, $v0, $s0
/* 9A084 800A9884 C0100200 */  sll        $v0, $v0, 3
/* 9A088 800A9888 23105000 */  subu       $v0, $v0, $s0
/* 9A08C 800A988C 80100200 */  sll        $v0, $v0, 2
/* 9A090 800A9890 08004224 */  addiu      $v0, $v0, 0x8
/* 9A094 800A9894 2C00B3AF */  sw         $s3, 0x2C($sp)
/* 9A098 800A9898 21982202 */  addu       $s3, $s1, $v0
/* 9A09C 800A989C 2800B2AF */  sw         $s2, 0x28($sp)
/* 9A0A0 800A98A0 01001224 */  addiu      $s2, $zero, 0x1
/* 9A0A4 800A98A4 3400BFAF */  sw         $ra, 0x34($sp)
.L800A98A8:
/* 9A0A8 800A98A8 39C3010C */  jal        PeekMessageQueue
/* 9A0AC 800A98AC 04006426 */   addiu     $a0, $s3, 0x4
/* 9A0B0 800A98B0 83004010 */  beqz       $v0, .L800A9AC0
/* 9A0B4 800A98B4 00000000 */   nop
/* 9A0B8 800A98B8 0000438C */  lw         $v1, 0x0($v0)
/* 9A0BC 800A98BC 0008023C */  lui        $v0, (0x8000000 >> 16)
/* 9A0C0 800A98C0 5F006210 */  beq        $v1, $v0, .L800A9A40
/* 9A0C4 800A98C4 2A104300 */   slt       $v0, $v0, $v1
/* 9A0C8 800A98C8 0A004014 */  bnez       $v0, .L800A98F4
/* 9A0CC 800A98CC 0010023C */   lui       $v0, (0x10000000 >> 16)
/* 9A0D0 800A98D0 0080023C */  lui        $v0, (0x80000001 >> 16)
/* 9A0D4 800A98D4 01004234 */  ori        $v0, $v0, (0x80000001 & 0xFFFF)
/* 9A0D8 800A98D8 75006210 */  beq        $v1, $v0, .L800A9AB0
/* 9A0DC 800A98DC 1000023C */   lui       $v0, (0x100001 >> 16)
/* 9A0E0 800A98E0 01004234 */  ori        $v0, $v0, (0x100001 & 0xFFFF)
/* 9A0E4 800A98E4 0A006210 */  beq        $v1, $v0, .L800A9910
/* 9A0E8 800A98E8 21202002 */   addu      $a0, $s1, $zero
/* 9A0EC 800A98EC AAA60208 */  j          .L800A9AA8
/* 9A0F0 800A98F0 21280002 */   addu      $a1, $s0, $zero
.L800A98F4:
/* 9A0F4 800A98F4 6E006210 */  beq        $v1, $v0, .L800A9AB0
/* 9A0F8 800A98F8 0020023C */   lui       $v0, (0x20000008 >> 16)
/* 9A0FC 800A98FC 08004234 */  ori        $v0, $v0, (0x20000008 & 0xFFFF)
/* 9A100 800A9900 6B006210 */  beq        $v1, $v0, .L800A9AB0
/* 9A104 800A9904 21202002 */   addu      $a0, $s1, $zero
/* 9A108 800A9908 AAA60208 */  j          .L800A9AA8
/* 9A10C 800A990C 21280002 */   addu      $a1, $s0, $zero
.L800A9910:
/* 9A110 800A9910 2197020C */  jal        razGetHeldItem
/* 9A114 800A9914 00000000 */   nop
/* 9A118 800A9918 30004010 */  beqz       $v0, .L800A99DC
/* 9A11C 800A991C 02000224 */   addiu     $v0, $zero, 0x2
/* 9A120 800A9920 2E001216 */  bne        $s0, $s2, .L800A99DC
/* 9A124 800A9924 00000000 */   nop
/* 9A128 800A9928 1CFA838F */  lw         $v1, %gp_rel(Raziel + 0x3EC)($gp)
/* 9A12C 800A992C 00000000 */  nop
/* 9A130 800A9930 14006210 */  beq        $v1, $v0, .L800A9984
/* 9A134 800A9934 0300622C */   sltiu     $v0, $v1, 0x3
/* 9A138 800A9938 07004010 */  beqz       $v0, .L800A9958
/* 9A13C 800A993C 00000000 */   nop
/* 9A140 800A9940 1D006010 */  beqz       $v1, .L800A99B8
/* 9A144 800A9944 00000000 */   nop
/* 9A148 800A9948 08007010 */  beq        $v1, $s0, .L800A996C
/* 9A14C 800A994C 21202002 */   addu      $a0, $s1, $zero
/* 9A150 800A9950 6EA60208 */  j          .L800A99B8
/* 9A154 800A9954 00000000 */   nop
.L800A9958:
/* 9A158 800A9958 03000224 */  addiu      $v0, $zero, 0x3
/* 9A15C 800A995C 10006210 */  beq        $v1, $v0, .L800A99A0
/* 9A160 800A9960 21202002 */   addu      $a0, $s1, $zero
/* 9A164 800A9964 6EA60208 */  j          .L800A99B8
/* 9A168 800A9968 00000000 */   nop
.L800A996C:
/* 9A16C 800A996C 01000524 */  addiu      $a1, $zero, 0x1
/* 9A170 800A9970 53000624 */  addiu      $a2, $zero, 0x53
/* 9A174 800A9974 21380000 */  addu       $a3, $zero, $zero
/* 9A178 800A9978 03000224 */  addiu      $v0, $zero, 0x3
/* 9A17C 800A997C 6CA60208 */  j          .L800A99B0
/* 9A180 800A9980 1000A2AF */   sw        $v0, 0x10($sp)
.L800A9984:
/* 9A184 800A9984 21202002 */  addu       $a0, $s1, $zero
/* 9A188 800A9988 01000524 */  addiu      $a1, $zero, 0x1
/* 9A18C 800A998C 69000624 */  addiu      $a2, $zero, 0x69
/* 9A190 800A9990 21380000 */  addu       $a3, $zero, $zero
/* 9A194 800A9994 03000224 */  addiu      $v0, $zero, 0x3
/* 9A198 800A9998 6CA60208 */  j          .L800A99B0
/* 9A19C 800A999C 1000A2AF */   sw        $v0, 0x10($sp)
.L800A99A0:
/* 9A1A0 800A99A0 01000524 */  addiu      $a1, $zero, 0x1
/* 9A1A4 800A99A4 63000624 */  addiu      $a2, $zero, 0x63
/* 9A1A8 800A99A8 21380000 */  addu       $a3, $zero, $zero
/* 9A1AC 800A99AC 1000A3AF */  sw         $v1, 0x10($sp)
.L800A99B0:
/* 9A1B0 800A99B0 20C8010C */  jal        G2EmulationSwitchAnimation
/* 9A1B4 800A99B4 1400B0AF */   sw        $s0, 0x14($sp)
.L800A99B8:
/* 9A1B8 800A99B8 2197020C */  jal        razGetHeldItem
/* 9A1BC 800A99BC 00000000 */   nop
/* 9A1C0 800A99C0 21204000 */  addu       $a0, $v0, $zero
/* 9A1C4 800A99C4 8000053C */  lui        $a1, (0x80002C >> 16)
/* 9A1C8 800A99C8 2C00A534 */  ori        $a1, $a1, (0x80002C & 0xFFFF)
/* 9A1CC 800A99CC A1D1000C */  jal        INSTANCE_Post
/* 9A1D0 800A99D0 21300000 */   addu      $a2, $zero, $zero
/* 9A1D4 800A99D4 ACA60208 */  j          .L800A9AB0
/* 9A1D8 800A99D8 00000000 */   nop
.L800A99DC:
/* 9A1DC 800A99DC 0B000216 */  bne        $s0, $v0, .L800A9A0C
/* 9A1E0 800A99E0 21202002 */   addu      $a0, $s1, $zero
/* 9A1E4 800A99E4 21284000 */  addu       $a1, $v0, $zero
/* 9A1E8 800A99E8 45000624 */  addiu      $a2, $zero, 0x45
/* 9A1EC 800A99EC 21380000 */  addu       $a3, $zero, $zero
/* 9A1F0 800A99F0 03000224 */  addiu      $v0, $zero, 0x3
/* 9A1F4 800A99F4 1000A2AF */  sw         $v0, 0x10($sp)
/* 9A1F8 800A99F8 1400B2AF */  sw         $s2, 0x14($sp)
/* 9A1FC 800A99FC 31C8010C */  jal        G2EmulationSwitchAnimationAlpha
/* 9A200 800A9A00 1800B2AF */   sw        $s2, 0x18($sp)
/* 9A204 800A9A04 ACA60208 */  j          .L800A9AB0
/* 9A208 800A9A08 00000000 */   nop
.L800A9A0C:
/* 9A20C 800A9A0C 28000016 */  bnez       $s0, .L800A9AB0
/* 9A210 800A9A10 21280000 */   addu      $a1, $zero, $zero
/* 9A214 800A9A14 03000624 */  addiu      $a2, $zero, 0x3
/* 9A218 800A9A18 2138A000 */  addu       $a3, $a1, $zero
/* 9A21C 800A9A1C 2110C000 */  addu       $v0, $a2, $zero
/* 9A220 800A9A20 1000A2AF */  sw         $v0, 0x10($sp)
/* 9A224 800A9A24 1400B2AF */  sw         $s2, 0x14($sp)
/* 9A228 800A9A28 31C8010C */  jal        G2EmulationSwitchAnimationAlpha
/* 9A22C 800A9A2C 1800B2AF */   sw        $s2, 0x18($sp)
/* 9A230 800A9A30 40000224 */  addiu      $v0, $zero, 0x40
/* 9A234 800A9A34 90F982AF */  sw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 9A238 800A9A38 ACA60208 */  j          .L800A9AB0
/* 9A23C 800A9A3C 00000000 */   nop
.L800A9A40:
/* 9A240 800A9A40 1B001216 */  bne        $s0, $s2, .L800A9AB0
/* 9A244 800A9A44 00000000 */   nop
/* 9A248 800A9A48 2197020C */  jal        razGetHeldItem
/* 9A24C 800A9A4C 00000000 */   nop
/* 9A250 800A9A50 0B004010 */  beqz       $v0, .L800A9A80
/* 9A254 800A9A54 21200000 */   addu      $a0, $zero, $zero
/* 9A258 800A9A58 2197020C */  jal        razGetHeldItem
/* 9A25C 800A9A5C 00000000 */   nop
/* 9A260 800A9A60 21204000 */  addu       $a0, $v0, $zero
/* 9A264 800A9A64 8000053C */  lui        $a1, (0x800008 >> 16)
/* 9A268 800A9A68 0800A534 */  ori        $a1, $a1, (0x800008 & 0xFFFF)
/* 9A26C 800A9A6C A1D1000C */  jal        INSTANCE_Post
/* 9A270 800A9A70 21300000 */   addu      $a2, $zero, $zero
/* 9A274 800A9A74 8597020C */  jal        razReaverOn
/* 9A278 800A9A78 00000000 */   nop
/* 9A27C 800A9A7C 21200000 */  addu       $a0, $zero, $zero
.L800A9A80:
/* 9A280 800A9A80 21288000 */  addu       $a1, $a0, $zero
/* 9A284 800A9A84 4FC6010C */  jal        SetControlInitIdleData
/* 9A288 800A9A88 03000624 */   addiu     $a2, $zero, 0x3
/* 9A28C 800A9A8C 21202002 */  addu       $a0, $s1, $zero
/* 9A290 800A9A90 0B80053C */  lui        $a1, %hi(StateHandlerIdle)
/* 9A294 800A9A94 E084A524 */  addiu      $a1, $a1, %lo(StateHandlerIdle)
/* 9A298 800A9A98 F4CA010C */  jal        StateSwitchStateCharacterData
/* 9A29C 800A9A9C 21304000 */   addu      $a2, $v0, $zero
/* 9A2A0 800A9AA0 ACA60208 */  j          .L800A9AB0
/* 9A2A4 800A9AA4 00000000 */   nop
.L800A9AA8:
/* 9A2A8 800A9AA8 B9BF020C */  jal        DefaultStateHandler
/* 9A2AC 800A9AAC 21308002 */   addu      $a2, $s4, $zero
.L800A9AB0:
/* 9A2B0 800A9AB0 27C3010C */  jal        DeMessageQueue
/* 9A2B4 800A9AB4 04006426 */   addiu     $a0, $s3, 0x4
/* 9A2B8 800A9AB8 2AA60208 */  j          .L800A98A8
/* 9A2BC 800A9ABC 00000000 */   nop
.L800A9AC0:
/* 9A2C0 800A9AC0 3400BF8F */  lw         $ra, 0x34($sp)
/* 9A2C4 800A9AC4 3000B48F */  lw         $s4, 0x30($sp)
/* 9A2C8 800A9AC8 2C00B38F */  lw         $s3, 0x2C($sp)
/* 9A2CC 800A9ACC 2800B28F */  lw         $s2, 0x28($sp)
/* 9A2D0 800A9AD0 2400B18F */  lw         $s1, 0x24($sp)
/* 9A2D4 800A9AD4 2000B08F */  lw         $s0, 0x20($sp)
/* 9A2D8 800A9AD8 0800E003 */  jr         $ra
/* 9A2DC 800A9ADC 3800BD27 */   addiu     $sp, $sp, 0x38
.size StateHandlerDropAction, . - StateHandlerDropAction
