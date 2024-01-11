.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetPhysObCollisionType
/* 5E834 8006E034 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 5E838 8006E038 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 5E83C 8006E03C 21888000 */  addu       $s1, $a0, $zero
/* 5E840 8006E040 6001033C */  lui        $v1, (0x1600001 >> 16)
/* 5E844 8006E044 3000BFAF */  sw         $ra, 0x30($sp)
/* 5E848 8006E048 2C00B5AF */  sw         $s5, 0x2C($sp)
/* 5E84C 8006E04C 2800B4AF */  sw         $s4, 0x28($sp)
/* 5E850 8006E050 2400B3AF */  sw         $s3, 0x24($sp)
/* 5E854 8006E054 2000B2AF */  sw         $s2, 0x20($sp)
/* 5E858 8006E058 1800B0AF */  sw         $s0, 0x18($sp)
/* 5E85C 8006E05C 6C01358E */  lw         $s5, 0x16C($s1)
/* 5E860 8006E060 01006334 */  ori        $v1, $v1, (0x1600001 & 0xFFFF)
/* 5E864 8006E064 0000A28E */  lw         $v0, 0x0($s5)
/* 5E868 8006E068 C000348E */  lw         $s4, 0xC0($s1)
/* 5E86C 8006E06C 24104300 */  and        $v0, $v0, $v1
/* 5E870 8006E070 B6004014 */  bnez       $v0, .L8006E34C
/* 5E874 8006E074 21100000 */   addu      $v0, $zero, $zero
/* 5E878 8006E078 4801238E */  lw         $v1, 0x148($s1)
/* 5E87C 8006E07C F4BD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 5E880 8006E080 0800908E */  lw         $s0, 0x8($s4)
/* 5E884 8006E084 21006214 */  bne        $v1, $v0, .L8006E10C
/* 5E888 8006E088 09000224 */   addiu     $v0, $zero, 0x9
/* 5E88C 8006E08C 04000392 */  lbu        $v1, 0x4($s0)
/* 5E890 8006E090 00000000 */  nop
/* 5E894 8006E094 1D006214 */  bne        $v1, $v0, .L8006E10C
/* 5E898 8006E098 03000224 */   addiu     $v0, $zero, 0x3
/* 5E89C 8006E09C 07008392 */  lbu        $v1, 0x7($s4)
/* 5E8A0 8006E0A0 00000000 */  nop
/* 5E8A4 8006E0A4 08006210 */  beq        $v1, $v0, .L8006E0C8
/* 5E8A8 8006E0A8 21208002 */   addu      $a0, $s4, $zero
/* 5E8AC 8006E0AC 1400838E */  lw         $v1, 0x14($s4)
/* 5E8B0 8006E0B0 00000000 */  nop
/* 5E8B4 8006E0B4 1400628C */  lw         $v0, 0x14($v1)
/* 5E8B8 8006E0B8 00000000 */  nop
/* 5E8BC 8006E0BC 04004234 */  ori        $v0, $v0, 0x4
/* 5E8C0 8006E0C0 34B80108 */  j          .L8006E0D0
/* 5E8C4 8006E0C4 140062AC */   sw        $v0, 0x14($v1)
.L8006E0C8:
/* 5E8C8 8006E0C8 8A93000C */  jal        COLLIDE_SetBSPTreeFlag
/* 5E8CC 8006E0CC 00080524 */   addiu     $a1, $zero, 0x800
.L8006E0D0:
/* 5E8D0 8006E0D0 07008392 */  lbu        $v1, 0x7($s4)
/* 5E8D4 8006E0D4 01000224 */  addiu      $v0, $zero, 0x1
/* 5E8D8 8006E0D8 0C006210 */  beq        $v1, $v0, .L8006E10C
/* 5E8DC 8006E0DC 00000000 */   nop
/* 5E8E0 8006E0E0 05008592 */  lbu        $a1, 0x5($s4)
/* 5E8E4 8006E0E4 0A93000C */  jal        COLLIDE_SegmentCollisionOff
/* 5E8E8 8006E0E8 21202002 */   addu      $a0, $s1, $zero
/* 5E8EC 8006E0EC 4801248E */  lw         $a0, 0x148($s1)
/* 5E8F0 8006E0F0 F4BD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 5E8F4 8006E0F4 00000000 */  nop
/* 5E8F8 8006E0F8 04008214 */  bne        $a0, $v0, .L8006E10C
/* 5E8FC 8006E0FC 0001053C */   lui       $a1, (0x1000024 >> 16)
/* 5E900 8006E100 2400A534 */  ori        $a1, $a1, (0x1000024 & 0xFFFF)
/* 5E904 8006E104 A1D1000C */  jal        INSTANCE_Post
/* 5E908 8006E108 21300000 */   addu      $a2, $zero, $zero
.L8006E10C:
/* 5E90C 8006E10C 0400828E */  lw         $v0, 0x4($s4)
/* 5E910 8006E110 FFFF033C */  lui        $v1, (0xFFFF0000 >> 16)
/* 5E914 8006E114 24104300 */  and        $v0, $v0, $v1
/* 5E918 8006E118 0101033C */  lui        $v1, (0x1010000 >> 16)
/* 5E91C 8006E11C 8B004314 */  bne        $v0, $v1, .L8006E34C
/* 5E920 8006E120 21100000 */   addu      $v0, $zero, $zero
/* 5E924 8006E124 04000392 */  lbu        $v1, 0x4($s0)
/* 5E928 8006E128 09000224 */  addiu      $v0, $zero, 0x9
/* 5E92C 8006E12C 87006214 */  bne        $v1, $v0, .L8006E34C
/* 5E930 8006E130 21100000 */   addu      $v0, $zero, $zero
/* 5E934 8006E134 0C00908E */  lw         $s0, 0xC($s4)
/* 5E938 8006E138 00000000 */  nop
/* 5E93C 8006E13C 04000392 */  lbu        $v1, 0x4($s0)
/* 5E940 8006E140 08000224 */  addiu      $v0, $zero, 0x8
/* 5E944 8006E144 81006214 */  bne        $v1, $v0, .L8006E34C
/* 5E948 8006E148 21100000 */   addu      $v0, $zero, $zero
/* 5E94C 8006E14C 1400928E */  lw         $s2, 0x14($s4)
/* 5E950 8006E150 7EB7010C */  jal        PhysObGetWeapon
/* 5E954 8006E154 21202002 */   addu      $a0, $s1, $zero
/* 5E958 8006E158 21804000 */  addu       $s0, $v0, $zero
/* 5E95C 8006E15C 7A000012 */  beqz       $s0, .L8006E348
/* 5E960 8006E160 21202002 */   addu      $a0, $s1, $zero
/* 5E964 8006E164 EBB7010C */  jal        TurnOffCollisionPhysOb
/* 5E968 8006E168 07000524 */   addiu     $a1, $zero, 0x7
/* 5E96C 8006E16C 4801228E */  lw         $v0, 0x148($s1)
/* 5E970 8006E170 00000000 */  nop
/* 5E974 8006E174 45004014 */  bnez       $v0, .L8006E28C
/* 5E978 8006E178 21202002 */   addu      $a0, $s1, $zero
/* 5E97C 8006E17C 21204002 */  addu       $a0, $s2, $zero
/* 5E980 8006E180 92D1000C */  jal        INSTANCE_Query
/* 5E984 8006E184 21280000 */   addu      $a1, $zero, $zero
/* 5E988 8006E188 0010033C */  lui        $v1, (0x10000000 >> 16)
/* 5E98C 8006E18C 24104300 */  and        $v0, $v0, $v1
/* 5E990 8006E190 21004010 */  beqz       $v0, .L8006E218
/* 5E994 8006E194 01000224 */   addiu     $v0, $zero, 0x1
/* 5E998 8006E198 0C000382 */  lb         $v1, 0xC($s0)
/* 5E99C 8006E19C 00000000 */  nop
/* 5E9A0 8006E1A0 0B006214 */  bne        $v1, $v0, .L8006E1D0
/* 5E9A4 8006E1A4 21202002 */   addu      $a0, $s1, $zero
/* 5E9A8 8006E1A8 21204002 */  addu       $a0, $s2, $zero
/* 5E9AC 8006E1AC 0001053C */  lui        $a1, (0x1000019 >> 16)
/* 5E9B0 8006E1B0 1900A534 */  ori        $a1, $a1, (0x1000019 & 0xFFFF)
/* 5E9B4 8006E1B4 A1D1000C */  jal        INSTANCE_Post
/* 5E9B8 8006E1B8 21302002 */   addu      $a2, $s1, $zero
/* 5E9BC 8006E1BC 0000A28E */  lw         $v0, 0x0($s5)
/* 5E9C0 8006E1C0 EFFF0324 */  addiu      $v1, $zero, -0x11
/* 5E9C4 8006E1C4 24104300 */  and        $v0, $v0, $v1
/* 5E9C8 8006E1C8 92B80108 */  j          .L8006E248
/* 5E9CC 8006E1CC 0000A2AE */   sw        $v0, 0x0($s5)
.L8006E1D0:
/* 5E9D0 8006E1D0 B0A3010C */  jal        CheckPhysObAbility
/* 5E9D4 8006E1D4 20000524 */   addiu     $a1, $zero, 0x20
/* 5E9D8 8006E1D8 0F004010 */  beqz       $v0, .L8006E218
/* 5E9DC 8006E1DC 0100033C */   lui       $v1, (0x10000 >> 16)
/* 5E9E0 8006E1E0 0000A28E */  lw         $v0, 0x0($s5)
/* 5E9E4 8006E1E4 00000000 */  nop
/* 5E9E8 8006E1E8 24104300 */  and        $v0, $v0, $v1
/* 5E9EC 8006E1EC 0A004010 */  beqz       $v0, .L8006E218
/* 5E9F0 8006E1F0 21204002 */   addu      $a0, $s2, $zero
/* 5E9F4 8006E1F4 0001053C */  lui        $a1, (0x100000C >> 16)
/* 5E9F8 8006E1F8 0C00A534 */  ori        $a1, $a1, (0x100000C & 0xFFFF)
/* 5E9FC 8006E1FC A1D1000C */  jal        INSTANCE_Post
/* 5EA00 8006E200 20000624 */   addiu     $a2, $zero, 0x20
/* 5EA04 8006E204 21202002 */  addu       $a0, $s1, $zero
/* 5EA08 8006E208 8000053C */  lui        $a1, (0x800029 >> 16)
/* 5EA0C 8006E20C 2900A534 */  ori        $a1, $a1, (0x800029 & 0xFFFF)
/* 5EA10 8006E210 90B80108 */  j          .L8006E240
/* 5EA14 8006E214 21300000 */   addu      $a2, $zero, $zero
.L8006E218:
/* 5EA18 8006E218 08000786 */  lh         $a3, 0x8($s0)
/* 5EA1C 8006E21C 0A000282 */  lb         $v0, 0xA($s0)
/* 5EA20 8006E220 21202002 */  addu       $a0, $s1, $zero
/* 5EA24 8006E224 1000A2AF */  sw         $v0, 0x10($sp)
/* 5EA28 8006E228 0000068E */  lw         $a2, 0x0($s0)
/* 5EA2C 8006E22C 95C3010C */  jal        SetMonsterHitData
/* 5EA30 8006E230 21280000 */   addu      $a1, $zero, $zero
/* 5EA34 8006E234 21204002 */  addu       $a0, $s2, $zero
/* 5EA38 8006E238 0001053C */  lui        $a1, (0x1000000 >> 16)
/* 5EA3C 8006E23C 21304000 */  addu       $a2, $v0, $zero
.L8006E240:
/* 5EA40 8006E240 A1D1000C */  jal        INSTANCE_Post
/* 5EA44 8006E244 00000000 */   nop
.L8006E248:
/* 5EA48 8006E248 D2BD8287 */  lh         $v0, %gp_rel(gameTrackerX + 0xA)($gp)
/* 5EA4C 8006E24C 00000000 */  nop
/* 5EA50 8006E250 26004014 */  bnez       $v0, .L8006E2EC
/* 5EA54 8006E254 21202002 */   addu      $a0, $s1, $zero
/* 5EA58 8006E258 CFA3010C */  jal        CheckPhysObFamily
/* 5EA5C 8006E25C 07000524 */   addiu     $a1, $zero, 0x7
/* 5EA60 8006E260 22004010 */  beqz       $v0, .L8006E2EC
/* 5EA64 8006E264 21202002 */   addu      $a0, $s1, $zero
/* 5EA68 8006E268 2C00238E */  lw         $v1, 0x2C($s1)
/* 5EA6C 8006E26C F4BD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 5EA70 8006E270 00000000 */  nop
/* 5EA74 8006E274 1D006214 */  bne        $v1, $v0, .L8006E2EC
/* 5EA78 8006E278 0800053C */   lui       $a1, (0x80001 >> 16)
/* 5EA7C 8006E27C 21204002 */  addu       $a0, $s2, $zero
/* 5EA80 8006E280 0100A534 */  ori        $a1, $a1, (0x80001 & 0xFFFF)
/* 5EA84 8006E284 B8B80108 */  j          .L8006E2E0
/* 5EA88 8006E288 21300000 */   addu      $a2, $zero, $zero
.L8006E28C:
/* 5EA8C 8006E28C 0000138E */  lw         $s3, 0x0($s0)
/* 5EA90 8006E290 B0A3010C */  jal        CheckPhysObAbility
/* 5EA94 8006E294 20000524 */   addiu     $a1, $zero, 0x20
/* 5EA98 8006E298 07004010 */  beqz       $v0, .L8006E2B8
/* 5EA9C 8006E29C 0100033C */   lui       $v1, (0x10000 >> 16)
/* 5EAA0 8006E2A0 0000A28E */  lw         $v0, 0x0($s5)
/* 5EAA4 8006E2A4 00000000 */  nop
/* 5EAA8 8006E2A8 24104300 */  and        $v0, $v0, $v1
/* 5EAAC 8006E2AC 03004014 */  bnez       $v0, .L8006E2BC
/* 5EAB0 8006E2B0 21204002 */   addu      $a0, $s2, $zero
/* 5EAB4 8006E2B4 0400138E */  lw         $s3, 0x4($s0)
.L8006E2B8:
/* 5EAB8 8006E2B8 21204002 */  addu       $a0, $s2, $zero
.L8006E2BC:
/* 5EABC 8006E2BC 21280000 */  addu       $a1, $zero, $zero
/* 5EAC0 8006E2C0 21306002 */  addu       $a2, $s3, $zero
/* 5EAC4 8006E2C4 2138A000 */  addu       $a3, $a1, $zero
/* 5EAC8 8006E2C8 95C3010C */  jal        SetMonsterHitData
/* 5EACC 8006E2CC 1000A0AF */   sw        $zero, 0x10($sp)
/* 5EAD0 8006E2D0 0002053C */  lui        $a1, (0x2000002 >> 16)
/* 5EAD4 8006E2D4 0200A534 */  ori        $a1, $a1, (0x2000002 & 0xFFFF)
/* 5EAD8 8006E2D8 4801248E */  lw         $a0, 0x148($s1)
/* 5EADC 8006E2DC 21304000 */  addu       $a2, $v0, $zero
.L8006E2E0:
/* 5EAE0 8006E2E0 A1D1000C */  jal        INSTANCE_Post
/* 5EAE4 8006E2E4 00000000 */   nop
/* 5EAE8 8006E2E8 21202002 */  addu       $a0, $s1, $zero
.L8006E2EC:
/* 5EAEC 8006E2EC B0A3010C */  jal        CheckPhysObAbility
/* 5EAF0 8006E2F0 20000524 */   addiu     $a1, $zero, 0x20
/* 5EAF4 8006E2F4 08004010 */  beqz       $v0, .L8006E318
/* 5EAF8 8006E2F8 0100033C */   lui       $v1, (0x10000 >> 16)
/* 5EAFC 8006E2FC 0000A28E */  lw         $v0, 0x0($s5)
/* 5EB00 8006E300 00000000 */  nop
/* 5EB04 8006E304 24104300 */  and        $v0, $v0, $v1
/* 5EB08 8006E308 03004010 */  beqz       $v0, .L8006E318
/* 5EB0C 8006E30C 21202002 */   addu      $a0, $s1, $zero
/* 5EB10 8006E310 C8B80108 */  j          .L8006E320
/* 5EB14 8006E314 20000724 */   addiu     $a3, $zero, 0x20
.L8006E318:
/* 5EB18 8006E318 21202002 */  addu       $a0, $s1, $zero
/* 5EB1C 8006E31C 00010724 */  addiu      $a3, $zero, 0x100
.L8006E320:
/* 5EB20 8006E320 0000068E */  lw         $a2, 0x0($s0)
/* 5EB24 8006E324 05008592 */  lbu        $a1, 0x5($s4)
/* 5EB28 8006E328 7FC5010C */  jal        SetFXHitData
/* 5EB2C 8006E32C C3310600 */   sra       $a2, $a2, 7
/* 5EB30 8006E330 21204002 */  addu       $a0, $s2, $zero
/* 5EB34 8006E334 4000053C */  lui        $a1, (0x400000 >> 16)
/* 5EB38 8006E338 A1D1000C */  jal        INSTANCE_Post
/* 5EB3C 8006E33C 21304000 */   addu      $a2, $v0, $zero
/* 5EB40 8006E340 D3B80108 */  j          .L8006E34C
/* 5EB44 8006E344 01000224 */   addiu     $v0, $zero, 0x1
.L8006E348:
/* 5EB48 8006E348 21100000 */  addu       $v0, $zero, $zero
.L8006E34C:
/* 5EB4C 8006E34C 3000BF8F */  lw         $ra, 0x30($sp)
/* 5EB50 8006E350 2C00B58F */  lw         $s5, 0x2C($sp)
/* 5EB54 8006E354 2800B48F */  lw         $s4, 0x28($sp)
/* 5EB58 8006E358 2400B38F */  lw         $s3, 0x24($sp)
/* 5EB5C 8006E35C 2000B28F */  lw         $s2, 0x20($sp)
/* 5EB60 8006E360 1C00B18F */  lw         $s1, 0x1C($sp)
/* 5EB64 8006E364 1800B08F */  lw         $s0, 0x18($sp)
/* 5EB68 8006E368 0800E003 */  jr         $ra
/* 5EB6C 8006E36C 3800BD27 */   addiu     $sp, $sp, 0x38
.size GetPhysObCollisionType, . - GetPhysObCollisionType
