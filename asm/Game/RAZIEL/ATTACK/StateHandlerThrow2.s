.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StateHandlerThrow2
/* 8DFE4 8009D7E4 98FFBD27 */  addiu      $sp, $sp, -0x68
/* 8DFE8 8009D7E8 4400B1AF */  sw         $s1, 0x44($sp)
/* 8DFEC 8009D7EC 21888000 */  addu       $s1, $a0, $zero
/* 8DFF0 8009D7F0 4800B2AF */  sw         $s2, 0x48($sp)
/* 8DFF4 8009D7F4 2190A000 */  addu       $s2, $a1, $zero
/* 8DFF8 8009D7F8 5C00B7AF */  sw         $s7, 0x5C($sp)
/* 8DFFC 8009D7FC 21B8C000 */  addu       $s7, $a2, $zero
/* 8E000 8009D800 6000BFAF */  sw         $ra, 0x60($sp)
/* 8E004 8009D804 5800B6AF */  sw         $s6, 0x58($sp)
/* 8E008 8009D808 5400B5AF */  sw         $s5, 0x54($sp)
/* 8E00C 8009D80C 5000B4AF */  sw         $s4, 0x50($sp)
/* 8E010 8009D810 4C00B3AF */  sw         $s3, 0x4C($sp)
/* 8E014 8009D814 A9C9010C */  jal        G2EmulationQueryAnimation
/* 8E018 8009D818 4000B0AF */   sw        $s0, 0x40($sp)
/* 8E01C 8009D81C 21A04000 */  addu       $s4, $v0, $zero
/* 8E020 8009D820 C0101200 */  sll        $v0, $s2, 3
/* 8E024 8009D824 21105200 */  addu       $v0, $v0, $s2
/* 8E028 8009D828 C0100200 */  sll        $v0, $v0, 3
/* 8E02C 8009D82C 23105200 */  subu       $v0, $v0, $s2
/* 8E030 8009D830 80100200 */  sll        $v0, $v0, 2
/* 8E034 8009D834 08004324 */  addiu      $v1, $v0, 0x8
/* 8E038 8009D838 21A82302 */  addu       $s5, $s1, $v1
/* 8E03C 8009D83C 0400B626 */  addiu      $s6, $s5, 0x4
/* 8E040 8009D840 21982202 */  addu       $s3, $s1, $v0
.L8009D844:
/* 8E044 8009D844 39C3010C */  jal        PeekMessageQueue
/* 8E048 8009D848 2120C002 */   addu      $a0, $s6, $zero
/* 8E04C 8009D84C 21284000 */  addu       $a1, $v0, $zero
/* 8E050 8009D850 8302A010 */  beqz       $a1, .L8009E260
/* 8E054 8009D854 0001023C */   lui       $v0, (0x1000000 >> 16)
/* 8E058 8009D858 0000A38C */  lw         $v1, 0x0($a1)
/* 8E05C 8009D85C 00000000 */  nop
/* 8E060 8009D860 5A016210 */  beq        $v1, $v0, .L8009DDCC
/* 8E064 8009D864 2A104300 */   slt       $v0, $v0, $v1
/* 8E068 8009D868 24004014 */  bnez       $v0, .L8009D8FC
/* 8E06C 8009D86C 0008023C */   lui       $v0, (0x8000000 >> 16)
/* 8E070 8009D870 1000023C */  lui        $v0, (0x100000 >> 16)
/* 8E074 8009D874 2E016210 */  beq        $v1, $v0, .L8009DD30
/* 8E078 8009D878 2A104300 */   slt       $v0, $v0, $v1
/* 8E07C 8009D87C 10004014 */  bnez       $v0, .L8009D8C0
/* 8E080 8009D880 1000023C */   lui       $v0, (0x100004 >> 16)
/* 8E084 8009D884 0080023C */  lui        $v0, (0x80000008 >> 16)
/* 8E088 8009D888 08004234 */  ori        $v0, $v0, (0x80000008 & 0xFFFF)
/* 8E08C 8009D88C 22016210 */  beq        $v1, $v0, .L8009DD18
/* 8E090 8009D890 2A104300 */   slt       $v0, $v0, $v1
/* 8E094 8009D894 05004014 */  bnez       $v0, .L8009D8AC
/* 8E098 8009D898 0080023C */   lui       $v0, (0x80000020 >> 16)
/* 8E09C 8009D89C 6C026210 */  beq        $v1, $v0, .L8009E250
/* 8E0A0 8009D8A0 21202002 */   addu      $a0, $s1, $zero
/* 8E0A4 8009D8A4 92780208 */  j          .L8009E248
/* 8E0A8 8009D8A8 21284002 */   addu      $a1, $s2, $zero
.L8009D8AC:
/* 8E0AC 8009D8AC 20004234 */  ori        $v0, $v0, (0x80000020 & 0xFFFF)
/* 8E0B0 8009D8B0 67026210 */  beq        $v1, $v0, .L8009E250
/* 8E0B4 8009D8B4 21202002 */   addu      $a0, $s1, $zero
/* 8E0B8 8009D8B8 92780208 */  j          .L8009E248
/* 8E0BC 8009D8BC 21284002 */   addu      $a1, $s2, $zero
.L8009D8C0:
/* 8E0C0 8009D8C0 04004234 */  ori        $v0, $v0, (0x100004 & 0xFFFF)
/* 8E0C4 8009D8C4 EB006210 */  beq        $v1, $v0, .L8009DC74
/* 8E0C8 8009D8C8 2A104300 */   slt       $v0, $v0, $v1
/* 8E0CC 8009D8CC 06004014 */  bnez       $v0, .L8009D8E8
/* 8E0D0 8009D8D0 1000023C */   lui       $v0, (0x100001 >> 16)
/* 8E0D4 8009D8D4 01004234 */  ori        $v0, $v0, (0x100001 & 0xFFFF)
/* 8E0D8 8009D8D8 2C006210 */  beq        $v1, $v0, .L8009D98C
/* 8E0DC 8009D8DC 21202002 */   addu      $a0, $s1, $zero
/* 8E0E0 8009D8E0 92780208 */  j          .L8009E248
/* 8E0E4 8009D8E4 21284002 */   addu      $a1, $s2, $zero
.L8009D8E8:
/* 8E0E8 8009D8E8 09004234 */  ori        $v0, $v0, (0x100009 & 0xFFFF)
/* 8E0EC 8009D8EC 2B026210 */  beq        $v1, $v0, .L8009E19C
/* 8E0F0 8009D8F0 21202002 */   addu      $a0, $s1, $zero
/* 8E0F4 8009D8F4 92780208 */  j          .L8009E248
/* 8E0F8 8009D8F8 21284002 */   addu      $a1, $s2, $zero
.L8009D8FC:
/* 8E0FC 8009D8FC 56016210 */  beq        $v1, $v0, .L8009DE58
/* 8E100 8009D900 2A104300 */   slt       $v0, $v0, $v1
/* 8E104 8009D904 11004014 */  bnez       $v0, .L8009D94C
/* 8E108 8009D908 0020023C */   lui       $v0, (0x20000002 >> 16)
/* 8E10C 8009D90C 0004023C */  lui        $v0, (0x4000001 >> 16)
/* 8E110 8009D910 01004234 */  ori        $v0, $v0, (0x4000001 & 0xFFFF)
/* 8E114 8009D914 0A026210 */  beq        $v1, $v0, .L8009E140
/* 8E118 8009D918 2A104300 */   slt       $v0, $v0, $v1
/* 8E11C 8009D91C 07004014 */  bnez       $v0, .L8009D93C
/* 8E120 8009D920 0204023C */   lui       $v0, (0x4020000 >> 16)
/* 8E124 8009D924 0001023C */  lui        $v0, (0x1000001 >> 16)
/* 8E128 8009D928 01004234 */  ori        $v0, $v0, (0x1000001 & 0xFFFF)
/* 8E12C 8009D92C 48026210 */  beq        $v1, $v0, .L8009E250
/* 8E130 8009D930 21202002 */   addu      $a0, $s1, $zero
/* 8E134 8009D934 92780208 */  j          .L8009E248
/* 8E138 8009D938 21284002 */   addu      $a1, $s2, $zero
.L8009D93C:
/* 8E13C 8009D93C 44026210 */  beq        $v1, $v0, .L8009E250
/* 8E140 8009D940 21202002 */   addu      $a0, $s1, $zero
/* 8E144 8009D944 92780208 */  j          .L8009E248
/* 8E148 8009D948 21284002 */   addu      $a1, $s2, $zero
.L8009D94C:
/* 8E14C 8009D94C 02004234 */  ori        $v0, $v0, (0x20000002 & 0xFFFF)
/* 8E150 8009D950 3F026210 */  beq        $v1, $v0, .L8009E250
/* 8E154 8009D954 2A104300 */   slt       $v0, $v0, $v1
/* 8E158 8009D958 07004014 */  bnez       $v0, .L8009D978
/* 8E15C 8009D95C 0020023C */   lui       $v0, (0x20000020 >> 16)
/* 8E160 8009D960 0008023C */  lui        $v0, (0x8000004 >> 16)
/* 8E164 8009D964 04004234 */  ori        $v0, $v0, (0x8000004 & 0xFFFF)
/* 8E168 8009D968 9C016210 */  beq        $v1, $v0, .L8009DFDC
/* 8E16C 8009D96C 21202002 */   addu      $a0, $s1, $zero
/* 8E170 8009D970 92780208 */  j          .L8009E248
/* 8E174 8009D974 21284002 */   addu      $a1, $s2, $zero
.L8009D978:
/* 8E178 8009D978 20004234 */  ori        $v0, $v0, (0x20000020 & 0xFFFF)
/* 8E17C 8009D97C 5E016210 */  beq        $v1, $v0, .L8009DEF8
/* 8E180 8009D980 21202002 */   addu      $a0, $s1, $zero
/* 8E184 8009D984 92780208 */  j          .L8009E248
/* 8E188 8009D988 21284002 */   addu      $a1, $s2, $zero
.L8009D98C:
/* 8E18C 8009D98C 73004016 */  bnez       $s2, .L8009DB5C
/* 8E190 8009D990 02000824 */   addiu     $t0, $zero, 0x2
/* 8E194 8009D994 0400023C */  lui        $v0, (0x41001 >> 16)
/* 8E198 8009D998 01104234 */  ori        $v0, $v0, (0x41001 & 0xFFFF)
/* 8E19C 8009D99C C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 8E1A0 8009D9A0 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 8E1A4 8009D9A4 0400033C */  lui        $v1, (0x40000 >> 16)
/* 8E1A8 8009D9A8 24104300 */  and        $v0, $v0, $v1
/* 8E1AC 8009D9AC 0A004014 */  bnez       $v0, .L8009D9D8
/* 8E1B0 8009D9B0 00000000 */   nop
/* 8E1B4 8009D9B4 0000248E */  lw         $a0, 0x0($s1)
/* 8E1B8 8009D9B8 938B020C */  jal        SteerSwitchMode
/* 8E1BC 8009D9BC 21280000 */   addu      $a1, $zero, $zero
/* 8E1C0 8009D9C0 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 8E1C4 8009D9C4 00000000 */  nop
/* 8E1C8 8009D9C8 08004234 */  ori        $v0, $v0, 0x8
/* 8E1CC 8009D9CC C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 8E1D0 8009D9D0 7A760208 */  j          .L8009D9E8
/* 8E1D4 8009D9D4 03001024 */   addiu     $s0, $zero, 0x3
.L8009D9D8:
/* 8E1D8 8009D9D8 0000248E */  lw         $a0, 0x0($s1)
/* 8E1DC 8009D9DC 938B020C */  jal        SteerSwitchMode
/* 8E1E0 8009D9E0 0B000524 */   addiu     $a1, $zero, 0xB
/* 8E1E4 8009D9E4 03001024 */  addiu      $s0, $zero, 0x3
.L8009D9E8:
/* 8E1E8 8009D9E8 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 8E1EC 8009D9EC 0200033C */  lui        $v1, (0x20000 >> 16)
/* 8E1F0 8009D9F0 30FD90AF */  sw         $s0, %gp_rel(PhysicsMode)($gp)
/* 8E1F4 8009D9F4 25104300 */  or         $v0, $v0, $v1
/* 8E1F8 8009D9F8 90F982AF */  sw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 8E1FC 8009D9FC 2F97020C */  jal        razGetHeldWeapon
/* 8E200 8009DA00 1C0160AE */   sw        $zero, 0x11C($s3)
/* 8E204 8009DA04 53004010 */  beqz       $v0, .L8009DB54
/* 8E208 8009DA08 00000000 */   nop
/* 8E20C 8009DA0C 2197020C */  jal        razGetHeldItem
/* 8E210 8009DA10 00000000 */   nop
/* 8E214 8009DA14 1CFA838F */  lw         $v1, %gp_rel(Raziel + 0x3EC)($gp)
/* 8E218 8009DA18 A4FA82AF */  sw         $v0, %gp_rel(Raziel + 0x474)($gp)
/* 8E21C 8009DA1C 1E007010 */  beq        $v1, $s0, .L8009DA98
/* 8E220 8009DA20 0400622C */   sltiu     $v0, $v1, 0x4
/* 8E224 8009DA24 07004010 */  beqz       $v0, .L8009DA44
/* 8E228 8009DA28 01000224 */   addiu     $v0, $zero, 0x1
/* 8E22C 8009DA2C 0C006210 */  beq        $v1, $v0, .L8009DA60
/* 8E230 8009DA30 02000224 */   addiu     $v0, $zero, 0x2
/* 8E234 8009DA34 11006210 */  beq        $v1, $v0, .L8009DA7C
/* 8E238 8009DA38 00000000 */   nop
/* 8E23C 8009DA3C D5760208 */  j          .L8009DB54
/* 8E240 8009DA40 00000000 */   nop
.L8009DA44:
/* 8E244 8009DA44 08000224 */  addiu      $v0, $zero, 0x8
/* 8E248 8009DA48 3A006210 */  beq        $v1, $v0, .L8009DB34
/* 8E24C 8009DA4C 00100224 */   addiu     $v0, $zero, 0x1000
/* 8E250 8009DA50 18006210 */  beq        $v1, $v0, .L8009DAB4
/* 8E254 8009DA54 8000053C */   lui       $a1, (0x800104 >> 16)
/* 8E258 8009DA58 D5760208 */  j          .L8009DB54
/* 8E25C 8009DA5C 00000000 */   nop
.L8009DA60:
/* 8E260 8009DA60 E8FB828F */  lw         $v0, %gp_rel(PlayerData)($gp)
/* 8E264 8009DA64 00000000 */  nop
/* 8E268 8009DA68 1400428C */  lw         $v0, 0x14($v0)
/* 8E26C 8009DA6C 00000000 */  nop
/* 8E270 8009DA70 0000428C */  lw         $v0, 0x0($v0)
/* 8E274 8009DA74 D4760208 */  j          .L8009DB50
/* 8E278 8009DA78 00000000 */   nop
.L8009DA7C:
/* 8E27C 8009DA7C E8FB828F */  lw         $v0, %gp_rel(PlayerData)($gp)
/* 8E280 8009DA80 00000000 */  nop
/* 8E284 8009DA84 1400428C */  lw         $v0, 0x14($v0)
/* 8E288 8009DA88 00000000 */  nop
/* 8E28C 8009DA8C 0400428C */  lw         $v0, 0x4($v0)
/* 8E290 8009DA90 D4760208 */  j          .L8009DB50
/* 8E294 8009DA94 00000000 */   nop
.L8009DA98:
/* 8E298 8009DA98 E8FB828F */  lw         $v0, %gp_rel(PlayerData)($gp)
/* 8E29C 8009DA9C 00000000 */  nop
/* 8E2A0 8009DAA0 1400428C */  lw         $v0, 0x14($v0)
/* 8E2A4 8009DAA4 00000000 */  nop
/* 8E2A8 8009DAA8 0800428C */  lw         $v0, 0x8($v0)
/* 8E2AC 8009DAAC D4760208 */  j          .L8009DB50
/* 8E2B0 8009DAB0 00000000 */   nop
.L8009DAB4:
/* 8E2B4 8009DAB4 E8FB828F */  lw         $v0, %gp_rel(PlayerData)($gp)
/* 8E2B8 8009DAB8 0401A534 */  ori        $a1, $a1, (0x800104 & 0xFFFF)
/* 8E2BC 8009DABC A4FA80AF */  sw         $zero, %gp_rel(Raziel + 0x474)($gp)
/* 8E2C0 8009DAC0 1400428C */  lw         $v0, 0x14($v0)
/* 8E2C4 8009DAC4 60FA848F */  lw         $a0, %gp_rel(Raziel + 0x430)($gp)
/* 8E2C8 8009DAC8 1400428C */  lw         $v0, 0x14($v0)
/* 8E2CC 8009DACC 00000000 */  nop
/* 8E2D0 8009DAD0 94FA82AF */  sw         $v0, %gp_rel(Raziel + 0x464)($gp)
/* 8E2D4 8009DAD4 A1D1000C */  jal        INSTANCE_Post
/* 8E2D8 8009DAD8 21300000 */   addu      $a2, $zero, $zero
/* 8E2DC 8009DADC 0200033C */  lui        $v1, (0x2D000 >> 16)
/* 8E2E0 8009DAE0 00D06334 */  ori        $v1, $v1, (0x2D000 & 0xFFFF)
/* 8E2E4 8009DAE4 94FB8527 */  addiu      $a1, $gp, %gp_rel(Raziel + 0x564)
/* 8E2E8 8009DAE8 0C000624 */  addiu      $a2, $zero, 0xC
/* 8E2EC 8009DAEC 1C00A3AF */  sw         $v1, 0x1C($sp)
/* 8E2F0 8009DAF0 4CFB838F */  lw         $v1, %gp_rel(Raziel + 0x51C)($gp)
/* 8E2F4 8009DAF4 32000224 */  addiu      $v0, $zero, 0x32
/* 8E2F8 8009DAF8 1400A2AF */  sw         $v0, 0x14($sp)
/* 8E2FC 8009DAFC 55000224 */  addiu      $v0, $zero, 0x55
/* 8E300 8009DB00 1800A2AF */  sw         $v0, 0x18($sp)
/* 8E304 8009DB04 10270224 */  addiu      $v0, $zero, 0x2710
/* 8E308 8009DB08 1000A0AF */  sw         $zero, 0x10($sp)
/* 8E30C 8009DB0C 2000A2AF */  sw         $v0, 0x20($sp)
/* 8E310 8009DB10 04006334 */  ori        $v1, $v1, 0x4
/* 8E314 8009DB14 4CFB83AF */  sw         $v1, %gp_rel(Raziel + 0x51C)($gp)
/* 8E318 8009DB18 0000248E */  lw         $a0, 0x0($s1)
/* 8E31C 8009DB1C 509F020C */  jal        razSetupSoundRamp
/* 8E320 8009DB20 9CFF0724 */   addiu     $a3, $zero, -0x64
/* 8E324 8009DB24 C4FB80AF */  sw         $zero, %gp_rel(Raziel + 0x594)($gp)
/* 8E328 8009DB28 C8FB80AF */  sw         $zero, %gp_rel(Raziel + 0x598)($gp)
/* 8E32C 8009DB2C D5760208 */  j          .L8009DB54
/* 8E330 8009DB30 00000000 */   nop
.L8009DB34:
/* 8E334 8009DB34 E8FB838F */  lw         $v1, %gp_rel(PlayerData)($gp)
/* 8E338 8009DB38 01000224 */  addiu      $v0, $zero, 0x1
/* 8E33C 8009DB3C 1C0162AE */  sw         $v0, 0x11C($s3)
/* 8E340 8009DB40 1400628C */  lw         $v0, 0x14($v1)
/* 8E344 8009DB44 00000000 */  nop
/* 8E348 8009DB48 1000428C */  lw         $v0, 0x10($v0)
/* 8E34C 8009DB4C A4FA80AF */  sw         $zero, %gp_rel(Raziel + 0x474)($gp)
.L8009DB50:
/* 8E350 8009DB50 94FA82AF */  sw         $v0, %gp_rel(Raziel + 0x464)($gp)
.L8009DB54:
/* 8E354 8009DB54 98FA80AF */  sw         $zero, %gp_rel(Raziel + 0x468)($gp)
/* 8E358 8009DB58 02000824 */  addiu      $t0, $zero, 0x2
.L8009DB5C:
/* 8E35C 8009DB5C 15004816 */  bne        $s2, $t0, .L8009DBB4
/* 8E360 8009DB60 0400033C */   lui       $v1, (0x40000 >> 16)
/* 8E364 8009DB64 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 8E368 8009DB68 00000000 */  nop
/* 8E36C 8009DB6C 24104300 */  and        $v0, $v0, $v1
/* 8E370 8009DB70 08004010 */  beqz       $v0, .L8009DB94
/* 8E374 8009DB74 21280001 */   addu      $a1, $t0, $zero
/* 8E378 8009DB78 21202002 */  addu       $a0, $s1, $zero
/* 8E37C 8009DB7C 3D000624 */  addiu      $a2, $zero, 0x3D
/* 8E380 8009DB80 21380000 */  addu       $a3, $zero, $zero
/* 8E384 8009DB84 03000224 */  addiu      $v0, $zero, 0x3
/* 8E388 8009DB88 1000A2AF */  sw         $v0, 0x10($sp)
/* 8E38C 8009DB8C 18770208 */  j          .L8009DC60
/* 8E390 8009DB90 1400B2AF */   sw        $s2, 0x14($sp)
.L8009DB94:
/* 8E394 8009DB94 21202002 */  addu       $a0, $s1, $zero
/* 8E398 8009DB98 02000524 */  addiu      $a1, $zero, 0x2
/* 8E39C 8009DB9C 21300000 */  addu       $a2, $zero, $zero
/* 8E3A0 8009DBA0 2138C000 */  addu       $a3, $a2, $zero
/* 8E3A4 8009DBA4 03000224 */  addiu      $v0, $zero, 0x3
/* 8E3A8 8009DBA8 1000A2AF */  sw         $v0, 0x10($sp)
/* 8E3AC 8009DBAC 18770208 */  j          .L8009DC60
/* 8E3B0 8009DBB0 1400B2AF */   sw        $s2, 0x14($sp)
.L8009DBB4:
/* 8E3B4 8009DBB4 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 8E3B8 8009DBB8 00000000 */  nop
/* 8E3BC 8009DBBC 24104300 */  and        $v0, $v0, $v1
/* 8E3C0 8009DBC0 03004010 */  beqz       $v0, .L8009DBD0
/* 8E3C4 8009DBC4 00000000 */   nop
/* 8E3C8 8009DBC8 1D004012 */  beqz       $s2, .L8009DC40
/* 8E3CC 8009DBCC 3F000224 */   addiu     $v0, $zero, 0x3F
.L8009DBD0:
/* 8E3D0 8009DBD0 94FA838F */  lw         $v1, %gp_rel(Raziel + 0x464)($gp)
/* 8E3D4 8009DBD4 00000000 */  nop
/* 8E3D8 8009DBD8 00006290 */  lbu        $v0, 0x0($v1)
/* 8E3DC 8009DBDC 00000000 */  nop
/* 8E3E0 8009DBE0 0A004010 */  beqz       $v0, .L8009DC0C
/* 8E3E4 8009DBE4 21202002 */   addu      $a0, $s1, $zero
/* 8E3E8 8009DBE8 21304000 */  addu       $a2, $v0, $zero
/* 8E3EC 8009DBEC 01006390 */  lbu        $v1, 0x1($v1)
/* 8E3F0 8009DBF0 94FA888F */  lw         $t0, %gp_rel(Raziel + 0x464)($gp)
/* 8E3F4 8009DBF4 01000224 */  addiu      $v0, $zero, 0x1
/* 8E3F8 8009DBF8 1400A2AF */  sw         $v0, 0x14($sp)
/* 8E3FC 8009DBFC 1000A3AF */  sw         $v1, 0x10($sp)
/* 8E400 8009DC00 02000291 */  lbu        $v0, 0x2($t0)
/* 8E404 8009DC04 0B770208 */  j          .L8009DC2C
/* 8E408 8009DC08 21284002 */   addu      $a1, $s2, $zero
.L8009DC0C:
/* 8E40C 8009DC0C 21284002 */  addu       $a1, $s2, $zero
/* 8E410 8009DC10 03006690 */  lbu        $a2, 0x3($v1)
/* 8E414 8009DC14 04006390 */  lbu        $v1, 0x4($v1)
/* 8E418 8009DC18 94FA888F */  lw         $t0, %gp_rel(Raziel + 0x464)($gp)
/* 8E41C 8009DC1C 01000224 */  addiu      $v0, $zero, 0x1
/* 8E420 8009DC20 1400A2AF */  sw         $v0, 0x14($sp)
/* 8E424 8009DC24 1000A3AF */  sw         $v1, 0x10($sp)
/* 8E428 8009DC28 05000291 */  lbu        $v0, 0x5($t0)
.L8009DC2C:
/* 8E42C 8009DC2C 21380000 */  addu       $a3, $zero, $zero
/* 8E430 8009DC30 31C8010C */  jal        G2EmulationSwitchAnimationAlpha
/* 8E434 8009DC34 1800A2AF */   sw        $v0, 0x18($sp)
/* 8E438 8009DC38 1B770208 */  j          .L8009DC6C
/* 8E43C 8009DC3C 01000224 */   addiu     $v0, $zero, 0x1
.L8009DC40:
/* 8E440 8009DC40 09008212 */  beq        $s4, $v0, .L8009DC68
/* 8E444 8009DC44 21202002 */   addu      $a0, $s1, $zero
/* 8E448 8009DC48 21280000 */  addu       $a1, $zero, $zero
/* 8E44C 8009DC4C 21304000 */  addu       $a2, $v0, $zero
/* 8E450 8009DC50 2138A000 */  addu       $a3, $a1, $zero
/* 8E454 8009DC54 10000224 */  addiu      $v0, $zero, 0x10
/* 8E458 8009DC58 1000A2AF */  sw         $v0, 0x10($sp)
/* 8E45C 8009DC5C 1400A8AF */  sw         $t0, 0x14($sp)
.L8009DC60:
/* 8E460 8009DC60 20C8010C */  jal        G2EmulationSwitchAnimation
/* 8E464 8009DC64 00000000 */   nop
.L8009DC68:
/* 8E468 8009DC68 01000224 */  addiu      $v0, $zero, 0x1
.L8009DC6C:
/* 8E46C 8009DC6C 94780208 */  j          .L8009E250
/* 8E470 8009DC70 200162AE */   sw        $v0, 0x120($s3)
.L8009DC74:
/* 8E474 8009DC74 0E000524 */  addiu      $a1, $zero, 0xE
/* 8E478 8009DC78 2130A000 */  addu       $a2, $a1, $zero
/* 8E47C 8009DC7C 0000248E */  lw         $a0, 0x0($s1)
/* 8E480 8009DC80 2C010724 */  addiu      $a3, $zero, 0x12C
/* 8E484 8009DC84 9D41020C */  jal        G2Anim_InterpDisableController
/* 8E488 8009DC88 C8018424 */   addiu     $a0, $a0, 0x1C8
/* 8E48C 8009DC8C 4CFB828F */  lw         $v0, %gp_rel(Raziel + 0x51C)($gp)
/* 8E490 8009DC90 00000000 */  nop
/* 8E494 8009DC94 02004230 */  andi       $v0, $v0, 0x2
/* 8E498 8009DC98 07004010 */  beqz       $v0, .L8009DCB8
/* 8E49C 8009DC9C 21280000 */   addu      $a1, $zero, $zero
/* 8E4A0 8009DCA0 E8FB828F */  lw         $v0, %gp_rel(PlayerData)($gp)
/* 8E4A4 8009DCA4 0000238E */  lw         $v1, 0x0($s1)
/* 8E4A8 8009DCA8 2800468C */  lw         $a2, 0x28($v0)
/* 8E4AC 8009DCAC 04016484 */  lh         $a0, 0x104($v1)
/* 8E4B0 8009DCB0 7F95020C */  jal        razSetFadeEffect
/* 8E4B4 8009DCB4 23300600 */   negu      $a2, $a2
.L8009DCB8:
/* 8E4B8 8009DCB8 08004016 */  bnez       $s2, .L8009DCDC
/* 8E4BC 8009DCBC 00000000 */   nop
/* 8E4C0 8009DCC0 94FB848F */  lw         $a0, %gp_rel(Raziel + 0x564)($gp)
/* 8E4C4 8009DCC4 00000000 */  nop
/* 8E4C8 8009DCC8 04008010 */  beqz       $a0, .L8009DCDC
/* 8E4CC 8009DCCC 00000000 */   nop
/* 8E4D0 8009DCD0 1C02010C */  jal        SndEndLoop
/* 8E4D4 8009DCD4 00000000 */   nop
/* 8E4D8 8009DCD8 94FB80AF */  sw         $zero, %gp_rel(Raziel + 0x564)($gp)
.L8009DCDC:
/* 8E4DC 8009DCDC 1CFA838F */  lw         $v1, %gp_rel(Raziel + 0x3EC)($gp)
/* 8E4E0 8009DCE0 08000224 */  addiu      $v0, $zero, 0x8
/* 8E4E4 8009DCE4 07006214 */  bne        $v1, $v0, .L8009DD04
/* 8E4E8 8009DCE8 00100224 */   addiu     $v0, $zero, 0x1000
/* 8E4EC 8009DCEC 2197020C */  jal        razGetHeldItem
/* 8E4F0 8009DCF0 00000000 */   nop
/* 8E4F4 8009DCF4 39D1000C */  jal        INSTANCE_PlainDeath
/* 8E4F8 8009DCF8 21204000 */   addu      $a0, $v0, $zero
/* 8E4FC 8009DCFC 1CFA838F */  lw         $v1, %gp_rel(Raziel + 0x3EC)($gp)
/* 8E500 8009DD00 00100224 */  addiu      $v0, $zero, 0x1000
.L8009DD04:
/* 8E504 8009DD04 52016214 */  bne        $v1, $v0, .L8009E250
/* 8E508 8009DD08 8000053C */   lui       $a1, (0x800105 >> 16)
/* 8E50C 8009DD0C 60FA848F */  lw         $a0, %gp_rel(Raziel + 0x430)($gp)
/* 8E510 8009DD10 BA770208 */  j          .L8009DEE8
/* 8E514 8009DD14 0501A534 */   ori       $a1, $a1, (0x800105 & 0xFFFF)
.L8009DD18:
/* 8E518 8009DD18 A4FA828F */  lw         $v0, %gp_rel(Raziel + 0x474)($gp)
/* 8E51C 8009DD1C 00000000 */  nop
/* 8E520 8009DD20 4B014010 */  beqz       $v0, .L8009E250
/* 8E524 8009DD24 2120C002 */   addu      $a0, $s6, $zero
/* 8E528 8009DD28 F3770208 */  j          .L8009DFCC
/* 8E52C 8009DD2C 1000053C */   lui       $a1, (0x100000 >> 16)
.L8009DD30:
/* 8E530 8009DD30 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 8E534 8009DD34 0400033C */  lui        $v1, (0x40000 >> 16)
/* 8E538 8009DD38 24104300 */  and        $v0, $v0, $v1
/* 8E53C 8009DD3C 05004010 */  beqz       $v0, .L8009DD54
/* 8E540 8009DD40 21202002 */   addu      $a0, $s1, $zero
/* 8E544 8009DD44 21284002 */  addu       $a1, $s2, $zero
/* 8E548 8009DD48 0A80063C */  lui        $a2, %hi(StateHandlerSwim)
/* 8E54C 8009DD4C 63780208 */  j          .L8009E18C
/* 8E550 8009DD50 0C02C624 */   addiu     $a2, $a2, %lo(StateHandlerSwim)
.L8009DD54:
/* 8E554 8009DD54 94FA828F */  lw         $v0, %gp_rel(Raziel + 0x464)($gp)
/* 8E558 8009DD58 21200000 */  addu       $a0, $zero, $zero
/* 8E55C 8009DD5C 09004690 */  lbu        $a2, 0x9($v0)
/* 8E560 8009DD60 4FC6010C */  jal        SetControlInitIdleData
/* 8E564 8009DD64 21288000 */   addu      $a1, $a0, $zero
/* 8E568 8009DD68 21202002 */  addu       $a0, $s1, $zero
/* 8E56C 8009DD6C 21284002 */  addu       $a1, $s2, $zero
/* 8E570 8009DD70 0B80033C */  lui        $v1, %hi(StateHandlerIdle)
/* 8E574 8009DD74 E0847024 */  addiu      $s0, $v1, %lo(StateHandlerIdle)
/* 8E578 8009DD78 21300002 */  addu       $a2, $s0, $zero
/* 8E57C 8009DD7C C1CA010C */  jal        StateSwitchStateData
/* 8E580 8009DD80 21384000 */   addu      $a3, $v0, $zero
/* 8E584 8009DD84 C4FC828F */  lw         $v0, %gp_rel(PadData)($gp)
/* 8E588 8009DD88 00000000 */  nop
/* 8E58C 8009DD8C 0000438C */  lw         $v1, 0x0($v0)
/* 8E590 8009DD90 98A4828F */  lw         $v0, %gp_rel(RazielCommands + 0x14)($gp)
/* 8E594 8009DD94 00000000 */  nop
/* 8E598 8009DD98 24106200 */  and        $v0, $v1, $v0
/* 8E59C 8009DD9C 2C014010 */  beqz       $v0, .L8009E250
/* 8E5A0 8009DDA0 00000000 */   nop
/* 8E5A4 8009DDA4 94A4828F */  lw         $v0, %gp_rel(RazielCommands + 0x10)($gp)
/* 8E5A8 8009DDA8 00000000 */  nop
/* 8E5AC 8009DDAC 24106200 */  and        $v0, $v1, $v0
/* 8E5B0 8009DDB0 27014010 */  beqz       $v0, .L8009E250
/* 8E5B4 8009DDB4 21202002 */   addu      $a0, $s1, $zero
/* 8E5B8 8009DDB8 38FB90AF */  sw         $s0, %gp_rel(Raziel + 0x508)($gp)
/* 8E5BC 8009DDBC 21284002 */  addu       $a1, $s2, $zero
/* 8E5C0 8009DDC0 0B80063C */  lui        $a2, %hi(StateHandlerLookAround)
/* 8E5C4 8009DDC4 63780208 */  j          .L8009E18C
/* 8E5C8 8009DDC8 A08DC624 */   addiu     $a2, $a2, %lo(StateHandlerLookAround)
.L8009DDCC:
/* 8E5CC 8009DDCC 20014016 */  bnez       $s2, .L8009E250
/* 8E5D0 8009DDD0 0400033C */   lui       $v1, (0x40000 >> 16)
/* 8E5D4 8009DDD4 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 8E5D8 8009DDD8 00000000 */  nop
/* 8E5DC 8009DDDC 24104300 */  and        $v0, $v0, $v1
/* 8E5E0 8009DDE0 0B004010 */  beqz       $v0, .L8009DE10
/* 8E5E4 8009DDE4 00000000 */   nop
/* 8E5E8 8009DDE8 8CBE828F */  lw         $v0, %gp_rel(gameTrackerX + 0xC4)($gp)
/* 8E5EC 8009DDEC 0400A38C */  lw         $v1, 0x4($a1)
/* 8E5F0 8009DDF0 00084230 */  andi       $v0, $v0, 0x800
/* 8E5F4 8009DDF4 16014010 */  beqz       $v0, .L8009E250
/* 8E5F8 8009DDF8 00000000 */   nop
/* 8E5FC 8009DDFC 0C00648C */  lw         $a0, 0xC($v1)
/* 8E600 8009DE00 7391020C */  jal        LoseHealth
/* 8E604 8009DE04 00000000 */   nop
/* 8E608 8009DE08 94780208 */  j          .L8009E250
/* 8E60C 8009DE0C 00000000 */   nop
.L8009DE10:
/* 8E610 8009DE10 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 8E614 8009DE14 00000000 */  nop
/* 8E618 8009DE18 00404230 */  andi       $v0, $v0, 0x4000
/* 8E61C 8009DE1C 0C014014 */  bnez       $v0, .L8009E250
/* 8E620 8009DE20 00000000 */   nop
/* 8E624 8009DE24 34FA828F */  lw         $v0, %gp_rel(Raziel + 0x404)($gp)
/* 8E628 8009DE28 00000000 */  nop
/* 8E62C 8009DE2C 08014014 */  bnez       $v0, .L8009E250
/* 8E630 8009DE30 21202002 */   addu      $a0, $s1, $zero
/* 8E634 8009DE34 0400A68C */  lw         $a2, 0x4($a1)
/* 8E638 8009DE38 0A80053C */  lui        $a1, %hi(StateHandlerHitReaction)
/* 8E63C 8009DE3C A3CA010C */  jal        StateSwitchStateCharacterDataDefault
/* 8E640 8009DE40 68D5A524 */   addiu     $a1, $a1, %lo(StateHandlerHitReaction)
/* 8E644 8009DE44 90AC8427 */  addiu      $a0, $gp, %gp_rel(theCamera)
/* 8E648 8009DE48 286F000C */  jal        CAMERA_ForceEndLookaroundMode
/* 8E64C 8009DE4C 00000000 */   nop
/* 8E650 8009DE50 94780208 */  j          .L8009E250
/* 8E654 8009DE54 00000000 */   nop
.L8009DE58:
/* 8E658 8009DE58 FBFF0224 */  addiu      $v0, $zero, -0x5
/* 8E65C 8009DE5C 98FA838F */  lw         $v1, %gp_rel(Raziel + 0x468)($gp)
/* 8E660 8009DE60 94FA888F */  lw         $t0, %gp_rel(Raziel + 0x464)($gp)
/* 8E664 8009DE64 24186200 */  and        $v1, $v1, $v0
/* 8E668 8009DE68 98FA83AF */  sw         $v1, %gp_rel(Raziel + 0x468)($gp)
/* 8E66C 8009DE6C 00000291 */  lbu        $v0, 0x0($t0)
/* 8E670 8009DE70 00000000 */  nop
/* 8E674 8009DE74 15008216 */  bne        $s4, $v0, .L8009DECC
/* 8E678 8009DE78 0400033C */   lui       $v1, (0x40000 >> 16)
/* 8E67C 8009DE7C 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 8E680 8009DE80 00000000 */  nop
/* 8E684 8009DE84 24104300 */  and        $v0, $v0, $v1
/* 8E688 8009DE88 03004010 */  beqz       $v0, .L8009DE98
/* 8E68C 8009DE8C 21202002 */   addu      $a0, $s1, $zero
/* 8E690 8009DE90 EF004012 */  beqz       $s2, .L8009E250
/* 8E694 8009DE94 00000000 */   nop
.L8009DE98:
/* 8E698 8009DE98 21284002 */  addu       $a1, $s2, $zero
/* 8E69C 8009DE9C 03000691 */  lbu        $a2, 0x3($t0)
/* 8E6A0 8009DEA0 04000391 */  lbu        $v1, 0x4($t0)
/* 8E6A4 8009DEA4 94FA888F */  lw         $t0, %gp_rel(Raziel + 0x464)($gp)
/* 8E6A8 8009DEA8 01000224 */  addiu      $v0, $zero, 0x1
/* 8E6AC 8009DEAC 1400A2AF */  sw         $v0, 0x14($sp)
/* 8E6B0 8009DEB0 1000A3AF */  sw         $v1, 0x10($sp)
/* 8E6B4 8009DEB4 05000291 */  lbu        $v0, 0x5($t0)
/* 8E6B8 8009DEB8 21380000 */  addu       $a3, $zero, $zero
/* 8E6BC 8009DEBC 31C8010C */  jal        G2EmulationSwitchAnimationAlpha
/* 8E6C0 8009DEC0 1800A2AF */   sw        $v0, 0x18($sp)
/* 8E6C4 8009DEC4 94780208 */  j          .L8009E250
/* 8E6C8 8009DEC8 00000000 */   nop
.L8009DECC:
/* 8E6CC 8009DECC 06000291 */  lbu        $v0, 0x6($t0)
/* 8E6D0 8009DED0 00000000 */  nop
/* 8E6D4 8009DED4 DE008216 */  bne        $s4, $v0, .L8009E250
/* 8E6D8 8009DED8 01000224 */   addiu     $v0, $zero, 0x1
/* 8E6DC 8009DEDC DC004216 */  bne        $s2, $v0, .L8009E250
/* 8E6E0 8009DEE0 1000053C */   lui       $a1, (0x100000 >> 16)
/* 8E6E4 8009DEE4 0000248E */  lw         $a0, 0x0($s1)
.L8009DEE8:
/* 8E6E8 8009DEE8 A1D1000C */  jal        INSTANCE_Post
/* 8E6EC 8009DEEC 21300000 */   addu      $a2, $zero, $zero
/* 8E6F0 8009DEF0 94780208 */  j          .L8009E250
/* 8E6F4 8009DEF4 00000000 */   nop
.L8009DEF8:
/* 8E6F8 8009DEF8 2001628E */  lw         $v0, 0x120($s3)
/* 8E6FC 8009DEFC 00000000 */  nop
/* 8E700 8009DF00 D3004010 */  beqz       $v0, .L8009E250
/* 8E704 8009DF04 00000000 */   nop
/* 8E708 8009DF08 94FA888F */  lw         $t0, %gp_rel(Raziel + 0x464)($gp)
/* 8E70C 8009DF0C 00000000 */  nop
/* 8E710 8009DF10 03000291 */  lbu        $v0, 0x3($t0)
/* 8E714 8009DF14 00000000 */  nop
/* 8E718 8009DF18 2A008216 */  bne        $s4, $v0, .L8009DFC4
/* 8E71C 8009DF1C 8C00A426 */   addiu     $a0, $s5, 0x8C
/* 8E720 8009DF20 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 8E724 8009DF24 0400033C */  lui        $v1, (0x40000 >> 16)
/* 8E728 8009DF28 24104300 */  and        $v0, $v0, $v1
/* 8E72C 8009DF2C 03004010 */  beqz       $v0, .L8009DF3C
/* 8E730 8009DF30 21202002 */   addu      $a0, $s1, $zero
/* 8E734 8009DF34 0A004012 */  beqz       $s2, .L8009DF60
/* 8E738 8009DF38 01000224 */   addiu     $v0, $zero, 0x1
.L8009DF3C:
/* 8E73C 8009DF3C 21284002 */  addu       $a1, $s2, $zero
/* 8E740 8009DF40 21380000 */  addu       $a3, $zero, $zero
/* 8E744 8009DF44 06000691 */  lbu        $a2, 0x6($t0)
/* 8E748 8009DF48 07000391 */  lbu        $v1, 0x7($t0)
/* 8E74C 8009DF4C 01000224 */  addiu      $v0, $zero, 0x1
/* 8E750 8009DF50 1400A2AF */  sw         $v0, 0x14($sp)
/* 8E754 8009DF54 20C8010C */  jal        G2EmulationSwitchAnimation
/* 8E758 8009DF58 1000A3AF */   sw        $v1, 0x10($sp)
/* 8E75C 8009DF5C 01000224 */  addiu      $v0, $zero, 0x1
.L8009DF60:
/* 8E760 8009DF60 0E004216 */  bne        $s2, $v0, .L8009DF9C
/* 8E764 8009DF64 00000000 */   nop
/* 8E768 8009DF68 94FA828F */  lw         $v0, %gp_rel(Raziel + 0x464)($gp)
/* 8E76C 8009DF6C 00000000 */  nop
/* 8E770 8009DF70 08004390 */  lbu        $v1, 0x8($v0)
/* 8E774 8009DF74 00000000 */  nop
/* 8E778 8009DF78 40100300 */  sll        $v0, $v1, 1
/* 8E77C 8009DF7C 21104300 */  addu       $v0, $v0, $v1
/* 8E780 8009DF80 C0100200 */  sll        $v0, $v0, 3
/* 8E784 8009DF84 21104300 */  addu       $v0, $v0, $v1
/* 8E788 8009DF88 80100200 */  sll        $v0, $v0, 2
/* 8E78C 8009DF8C 8CFB82A7 */  sh         $v0, %gp_rel(Raziel + 0x55C)($gp)
/* 8E790 8009DF90 0000238E */  lw         $v1, 0x0($s1)
/* 8E794 8009DF94 8CFB8227 */  addiu      $v0, $gp, %gp_rel(Raziel + 0x55C)
/* 8E798 8009DF98 280262AC */  sw         $v0, 0x228($v1)
.L8009DF9C:
/* 8E79C 8009DF9C 200160AE */  sw         $zero, 0x120($s3)
/* 8E7A0 8009DFA0 DCFB828F */  lw         $v0, %gp_rel(Raziel + 0x5AC)($gp)
/* 8E7A4 8009DFA4 00000000 */  nop
/* 8E7A8 8009DFA8 00024230 */  andi       $v0, $v0, 0x200
/* 8E7AC 8009DFAC A8004010 */  beqz       $v0, .L8009E250
/* 8E7B0 8009DFB0 00000000 */   nop
/* 8E7B4 8009DFB4 C89E020C */  jal        razSetPlayerEventHistory
/* 8E7B8 8009DFB8 00020424 */   addiu     $a0, $zero, 0x200
/* 8E7BC 8009DFBC 94780208 */  j          .L8009E250
/* 8E7C0 8009DFC0 00000000 */   nop
.L8009DFC4:
/* 8E7C4 8009DFC4 0020053C */  lui        $a1, (0x20000020 >> 16)
/* 8E7C8 8009DFC8 2000A534 */  ori        $a1, $a1, (0x20000020 & 0xFFFF)
.L8009DFCC:
/* 8E7CC 8009DFCC 4EC3010C */  jal        EnMessageQueueData
/* 8E7D0 8009DFD0 21300000 */   addu      $a2, $zero, $zero
/* 8E7D4 8009DFD4 94780208 */  j          .L8009E250
/* 8E7D8 8009DFD8 00000000 */   nop
.L8009DFDC:
/* 8E7DC 8009DFDC 2F97020C */  jal        razGetHeldWeapon
/* 8E7E0 8009DFE0 00000000 */   nop
/* 8E7E4 8009DFE4 21804000 */  addu       $s0, $v0, $zero
/* 8E7E8 8009DFE8 99000012 */  beqz       $s0, .L8009E250
/* 8E7EC 8009DFEC 00000000 */   nop
/* 8E7F0 8009DFF0 94FA888F */  lw         $t0, %gp_rel(Raziel + 0x464)($gp)
/* 8E7F4 8009DFF4 98FA828F */  lw         $v0, %gp_rel(Raziel + 0x468)($gp)
/* 8E7F8 8009DFF8 1E000385 */  lh         $v1, 0x1E($t0)
/* 8E7FC 8009DFFC 02004230 */  andi       $v0, $v0, 0x2
/* 8E800 8009E000 0C004010 */  beqz       $v0, .L8009E034
/* 8E804 8009E004 2B380300 */   sltu      $a3, $zero, $v1
/* 8E808 8009E008 9CFA8427 */  addiu      $a0, $gp, %gp_rel(Raziel + 0x46C)
/* 8E80C 8009E00C 21280000 */  addu       $a1, $zero, $zero
/* 8E810 8009E010 18000295 */  lhu        $v0, 0x18($t0)
/* 8E814 8009E014 21180001 */  addu       $v1, $t0, $zero
/* 8E818 8009E018 1000A2AF */  sw         $v0, 0x10($sp)
/* 8E81C 8009E01C 1A006284 */  lh         $v0, 0x1A($v1)
/* 8E820 8009E020 04000624 */  addiu      $a2, $zero, 0x4
/* 8E824 8009E024 1800A0AF */  sw         $zero, 0x18($sp)
/* 8E828 8009E028 1C00A0AF */  sw         $zero, 0x1C($sp)
/* 8E82C 8009E02C 3E780208 */  j          .L8009E0F8
/* 8E830 8009E030 1400A2AF */   sw        $v0, 0x14($sp)
.L8009E034:
/* 8E834 8009E034 0CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3DC)($gp)
/* 8E838 8009E038 00000000 */  nop
/* 8E83C 8009E03C 80004230 */  andi       $v0, $v0, 0x80
/* 8E840 8009E040 25004010 */  beqz       $v0, .L8009E0D8
/* 8E844 8009E044 21280000 */   addu      $a1, $zero, $zero
/* 8E848 8009E048 18000295 */  lhu        $v0, 0x18($t0)
/* 8E84C 8009E04C 00000000 */  nop
/* 8E850 8009E050 1000A2AF */  sw         $v0, 0x10($sp)
/* 8E854 8009E054 94FA828F */  lw         $v0, %gp_rel(Raziel + 0x464)($gp)
/* 8E858 8009E058 08FA838F */  lw         $v1, %gp_rel(Raziel + 0x3D8)($gp)
/* 8E85C 8009E05C 1A004284 */  lh         $v0, 0x1A($v0)
/* 8E860 8009E060 1800A0AF */  sw         $zero, 0x18($sp)
/* 8E864 8009E064 1C00A0AF */  sw         $zero, 0x1C($sp)
/* 8E868 8009E068 1400A2AF */  sw         $v0, 0x14($sp)
/* 8E86C 8009E06C 3800648C */  lw         $a0, 0x38($v1)
/* 8E870 8009E070 BEC5010C */  jal        SetObjectThrowData
/* 8E874 8009E074 01000624 */   addiu     $a2, $zero, 0x1
/* 8E878 8009E078 21200002 */  addu       $a0, $s0, $zero
/* 8E87C 8009E07C 8000053C */  lui        $a1, (0x800010 >> 16)
/* 8E880 8009E080 1000A534 */  ori        $a1, $a1, (0x800010 & 0xFFFF)
/* 8E884 8009E084 A1D1000C */  jal        INSTANCE_Post
/* 8E888 8009E088 21304000 */   addu      $a2, $v0, $zero
/* 8E88C 8009E08C 08FA828F */  lw         $v0, %gp_rel(Raziel + 0x3D8)($gp)
/* 8E890 8009E090 00000000 */  nop
/* 8E894 8009E094 3800448C */  lw         $a0, 0x38($v0)
/* 8E898 8009E098 92D1000C */  jal        INSTANCE_Query
/* 8E89C 8009E09C 0C000524 */   addiu     $a1, $zero, 0xC
/* 8E8A0 8009E0A0 14004394 */  lhu        $v1, 0x14($v0)
/* 8E8A4 8009E0A4 00000000 */  nop
/* 8E8A8 8009E0A8 2800A3A7 */  sh         $v1, 0x28($sp)
/* 8E8AC 8009E0AC 18004394 */  lhu        $v1, 0x18($v0)
/* 8E8B0 8009E0B0 00000000 */  nop
/* 8E8B4 8009E0B4 2A00A3A7 */  sh         $v1, 0x2A($sp)
/* 8E8B8 8009E0B8 1C004294 */  lhu        $v0, 0x1C($v0)
/* 8E8BC 8009E0BC 2800A527 */  addiu      $a1, $sp, 0x28
/* 8E8C0 8009E0C0 2C00A2A7 */  sh         $v0, 0x2C($sp)
/* 8E8C4 8009E0C4 0000248E */  lw         $a0, 0x0($s1)
/* 8E8C8 8009E0C8 BC78020C */  jal        PointAt
/* 8E8CC 8009E0CC 3000A627 */   addiu     $a2, $sp, 0x30
/* 8E8D0 8009E0D0 46780208 */  j          .L8009E118
/* 8E8D4 8009E0D4 21280000 */   addu      $a1, $zero, $zero
.L8009E0D8:
/* 8E8D8 8009E0D8 21200000 */  addu       $a0, $zero, $zero
/* 8E8DC 8009E0DC 21288000 */  addu       $a1, $a0, $zero
/* 8E8E0 8009E0E0 18000295 */  lhu        $v0, 0x18($t0)
/* 8E8E4 8009E0E4 21308000 */  addu       $a2, $a0, $zero
/* 8E8E8 8009E0E8 1400A0AF */  sw         $zero, 0x14($sp)
/* 8E8EC 8009E0EC 1800A0AF */  sw         $zero, 0x18($sp)
/* 8E8F0 8009E0F0 1C00A0AF */  sw         $zero, 0x1C($sp)
/* 8E8F4 8009E0F4 1000A2AF */  sw         $v0, 0x10($sp)
.L8009E0F8:
/* 8E8F8 8009E0F8 BEC5010C */  jal        SetObjectThrowData
/* 8E8FC 8009E0FC 00000000 */   nop
/* 8E900 8009E100 21200002 */  addu       $a0, $s0, $zero
/* 8E904 8009E104 8000053C */  lui        $a1, (0x800010 >> 16)
/* 8E908 8009E108 1000A534 */  ori        $a1, $a1, (0x800010 & 0xFFFF)
/* 8E90C 8009E10C A1D1000C */  jal        INSTANCE_Post
/* 8E910 8009E110 21304000 */   addu      $a2, $v0, $zero
/* 8E914 8009E114 21280000 */  addu       $a1, $zero, $zero
.L8009E118:
/* 8E918 8009E118 E8FB828F */  lw         $v0, %gp_rel(PlayerData)($gp)
/* 8E91C 8009E11C 0000238E */  lw         $v1, 0x0($s1)
/* 8E920 8009E120 2800468C */  lw         $a2, 0x28($v0)
/* 8E924 8009E124 04016484 */  lh         $a0, 0x104($v1)
/* 8E928 8009E128 7F95020C */  jal        razSetFadeEffect
/* 8E92C 8009E12C 23300600 */   negu      $a2, $a2
/* 8E930 8009E130 8597020C */  jal        razReaverOn
/* 8E934 8009E134 00000000 */   nop
/* 8E938 8009E138 94780208 */  j          .L8009E250
/* 8E93C 8009E13C 00000000 */   nop
.L8009E140:
/* 8E940 8009E140 06004016 */  bnez       $s2, .L8009E15C
/* 8E944 8009E144 21202002 */   addu      $a0, $s1, $zero
/* 8E948 8009E148 0000248E */  lw         $a0, 0x0($s1)
/* 8E94C 8009E14C 30F68527 */  addiu      $a1, $gp, %gp_rel(Raziel)
/* 8E950 8009E150 1069020C */  jal        SetDropPhysics
/* 8E954 8009E154 00000000 */   nop
/* 8E958 8009E158 21202002 */  addu       $a0, $s1, $zero
.L8009E15C:
/* 8E95C 8009E15C 21284002 */  addu       $a1, $s2, $zero
/* 8E960 8009E160 24000624 */  addiu      $a2, $zero, 0x24
/* 8E964 8009E164 21380000 */  addu       $a3, $zero, $zero
/* 8E968 8009E168 04000224 */  addiu      $v0, $zero, 0x4
/* 8E96C 8009E16C 1000A2AF */  sw         $v0, 0x10($sp)
/* 8E970 8009E170 01000224 */  addiu      $v0, $zero, 0x1
/* 8E974 8009E174 20C8010C */  jal        G2EmulationSwitchAnimation
/* 8E978 8009E178 1400A2AF */   sw        $v0, 0x14($sp)
/* 8E97C 8009E17C 21202002 */  addu       $a0, $s1, $zero
/* 8E980 8009E180 21284002 */  addu       $a1, $s2, $zero
/* 8E984 8009E184 0B80063C */  lui        $a2, %hi(StateHandlerFall)
/* 8E988 8009E188 A8BDC624 */  addiu      $a2, $a2, %lo(StateHandlerFall)
.L8009E18C:
/* 8E98C 8009E18C C1CA010C */  jal        StateSwitchStateData
/* 8E990 8009E190 21380000 */   addu      $a3, $zero, $zero
/* 8E994 8009E194 94780208 */  j          .L8009E250
/* 8E998 8009E198 00000000 */   nop
.L8009E19C:
/* 8E99C 8009E19C 01000224 */  addiu      $v0, $zero, 0x1
/* 8E9A0 8009E1A0 2B004216 */  bne        $s2, $v0, .L8009E250
/* 8E9A4 8009E1A4 00000000 */   nop
/* 8E9A8 8009E1A8 0400A28C */  lw         $v0, 0x4($a1)
/* 8E9AC 8009E1AC 00000000 */  nop
/* 8E9B0 8009E1B0 15005214 */  bne        $v0, $s2, .L8009E208
/* 8E9B4 8009E1B4 00100224 */   addiu     $v0, $zero, 0x1000
/* 8E9B8 8009E1B8 1CFA838F */  lw         $v1, %gp_rel(Raziel + 0x3EC)($gp)
/* 8E9BC 8009E1BC 00000000 */  nop
/* 8E9C0 8009E1C0 0A006210 */  beq        $v1, $v0, .L8009E1EC
/* 8E9C4 8009E1C4 08000224 */   addiu     $v0, $zero, 0x8
/* 8E9C8 8009E1C8 09006210 */  beq        $v1, $v0, .L8009E1F0
/* 8E9CC 8009E1CC 0B80023C */   lui       $v0, %hi(StateHandlerIdle)
/* 8E9D0 8009E1D0 0000228E */  lw         $v0, 0x0($s1)
/* 8E9D4 8009E1D4 E8FB838F */  lw         $v1, %gp_rel(PlayerData)($gp)
/* 8E9D8 8009E1D8 04014484 */  lh         $a0, 0x104($v0)
/* 8E9DC 8009E1DC 24006584 */  lh         $a1, 0x24($v1)
/* 8E9E0 8009E1E0 26006684 */  lh         $a2, 0x26($v1)
/* 8E9E4 8009E1E4 7F95020C */  jal        razSetFadeEffect
/* 8E9E8 8009E1E8 00000000 */   nop
.L8009E1EC:
/* 8E9EC 8009E1EC 0B80023C */  lui        $v0, %hi(StateHandlerIdle)
.L8009E1F0:
/* 8E9F0 8009E1F0 E0844224 */  addiu      $v0, $v0, %lo(StateHandlerIdle)
/* 8E9F4 8009E1F4 38FB82AF */  sw         $v0, %gp_rel(Raziel + 0x508)($gp)
/* 8E9F8 8009E1F8 02000224 */  addiu      $v0, $zero, 0x2
/* 8E9FC 8009E1FC 98FA82AF */  sw         $v0, %gp_rel(Raziel + 0x468)($gp)
/* 8EA00 8009E200 94780208 */  j          .L8009E250
/* 8EA04 8009E204 00000000 */   nop
.L8009E208:
/* 8EA08 8009E208 21280000 */  addu       $a1, $zero, $zero
/* 8EA0C 8009E20C E8FB828F */  lw         $v0, %gp_rel(PlayerData)($gp)
/* 8EA10 8009E210 0000238E */  lw         $v1, 0x0($s1)
/* 8EA14 8009E214 26004684 */  lh         $a2, 0x26($v0)
/* 8EA18 8009E218 04016484 */  lh         $a0, 0x104($v1)
/* 8EA1C 8009E21C 7F95020C */  jal        razSetFadeEffect
/* 8EA20 8009E220 23300600 */   negu      $a2, $a2
/* 8EA24 8009E224 0E000524 */  addiu      $a1, $zero, 0xE
/* 8EA28 8009E228 2130A000 */  addu       $a2, $a1, $zero
/* 8EA2C 8009E22C 0000248E */  lw         $a0, 0x0($s1)
/* 8EA30 8009E230 58020724 */  addiu      $a3, $zero, 0x258
/* 8EA34 8009E234 9D41020C */  jal        G2Anim_InterpDisableController
/* 8EA38 8009E238 C8018424 */   addiu     $a0, $a0, 0x1C8
/* 8EA3C 8009E23C 98FA80AF */  sw         $zero, %gp_rel(Raziel + 0x468)($gp)
/* 8EA40 8009E240 94780208 */  j          .L8009E250
/* 8EA44 8009E244 00000000 */   nop
.L8009E248:
/* 8EA48 8009E248 B9BF020C */  jal        DefaultStateHandler
/* 8EA4C 8009E24C 2130E002 */   addu      $a2, $s7, $zero
.L8009E250:
/* 8EA50 8009E250 27C3010C */  jal        DeMessageQueue
/* 8EA54 8009E254 0400A426 */   addiu     $a0, $s5, 0x4
/* 8EA58 8009E258 11760208 */  j          .L8009D844
/* 8EA5C 8009E25C 00000000 */   nop
.L8009E260:
/* 8EA60 8009E260 01000224 */  addiu      $v0, $zero, 0x1
/* 8EA64 8009E264 17004216 */  bne        $s2, $v0, .L8009E2C4
/* 8EA68 8009E268 00000000 */   nop
/* 8EA6C 8009E26C 0CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3DC)($gp)
/* 8EA70 8009E270 00000000 */  nop
/* 8EA74 8009E274 80004230 */  andi       $v0, $v0, 0x80
/* 8EA78 8009E278 12004010 */  beqz       $v0, .L8009E2C4
/* 8EA7C 8009E27C 00000000 */   nop
/* 8EA80 8009E280 08FA828F */  lw         $v0, %gp_rel(Raziel + 0x3D8)($gp)
/* 8EA84 8009E284 00000000 */  nop
/* 8EA88 8009E288 3800448C */  lw         $a0, 0x38($v0)
/* 8EA8C 8009E28C 92D1000C */  jal        INSTANCE_Query
/* 8EA90 8009E290 0C000524 */   addiu     $a1, $zero, 0xC
/* 8EA94 8009E294 14004394 */  lhu        $v1, 0x14($v0)
/* 8EA98 8009E298 00000000 */  nop
/* 8EA9C 8009E29C 2800A3A7 */  sh         $v1, 0x28($sp)
/* 8EAA0 8009E2A0 18004394 */  lhu        $v1, 0x18($v0)
/* 8EAA4 8009E2A4 00000000 */  nop
/* 8EAA8 8009E2A8 2A00A3A7 */  sh         $v1, 0x2A($sp)
/* 8EAAC 8009E2AC 1C004294 */  lhu        $v0, 0x1C($v0)
/* 8EAB0 8009E2B0 2800A527 */  addiu      $a1, $sp, 0x28
/* 8EAB4 8009E2B4 2C00A2A7 */  sh         $v0, 0x2C($sp)
/* 8EAB8 8009E2B8 0000248E */  lw         $a0, 0x0($s1)
/* 8EABC 8009E2BC BC78020C */  jal        PointAt
/* 8EAC0 8009E2C0 3800A627 */   addiu     $a2, $sp, 0x38
.L8009E2C4:
/* 8EAC4 8009E2C4 6000BF8F */  lw         $ra, 0x60($sp)
/* 8EAC8 8009E2C8 5C00B78F */  lw         $s7, 0x5C($sp)
/* 8EACC 8009E2CC 5800B68F */  lw         $s6, 0x58($sp)
/* 8EAD0 8009E2D0 5400B58F */  lw         $s5, 0x54($sp)
/* 8EAD4 8009E2D4 5000B48F */  lw         $s4, 0x50($sp)
/* 8EAD8 8009E2D8 4C00B38F */  lw         $s3, 0x4C($sp)
/* 8EADC 8009E2DC 4800B28F */  lw         $s2, 0x48($sp)
/* 8EAE0 8009E2E0 4400B18F */  lw         $s1, 0x44($sp)
/* 8EAE4 8009E2E4 4000B08F */  lw         $s0, 0x40($sp)
/* 8EAE8 8009E2E8 0800E003 */  jr         $ra
/* 8EAEC 8009E2EC 6800BD27 */   addiu     $sp, $sp, 0x68
.size StateHandlerThrow2, . - StateHandlerThrow2
