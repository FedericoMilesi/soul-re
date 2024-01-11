.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StateHandlerWallDismount
/* 920E0 800A18E0 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 920E4 800A18E4 1800B0AF */  sw         $s0, 0x18($sp)
/* 920E8 800A18E8 21808000 */  addu       $s0, $a0, $zero
/* 920EC 800A18EC 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 920F0 800A18F0 2188A000 */  addu       $s1, $a1, $zero
/* 920F4 800A18F4 2C00B5AF */  sw         $s5, 0x2C($sp)
/* 920F8 800A18F8 21A8C000 */  addu       $s5, $a2, $zero
/* 920FC 800A18FC 2800B4AF */  sw         $s4, 0x28($sp)
/* 92100 800A1900 21A00000 */  addu       $s4, $zero, $zero
/* 92104 800A1904 C0101100 */  sll        $v0, $s1, 3
/* 92108 800A1908 21105100 */  addu       $v0, $v0, $s1
/* 9210C 800A190C C0100200 */  sll        $v0, $v0, 3
/* 92110 800A1910 23105100 */  subu       $v0, $v0, $s1
/* 92114 800A1914 80100200 */  sll        $v0, $v0, 2
/* 92118 800A1918 08004324 */  addiu      $v1, $v0, 0x8
/* 9211C 800A191C 2000B2AF */  sw         $s2, 0x20($sp)
/* 92120 800A1920 21900302 */  addu       $s2, $s0, $v1
/* 92124 800A1924 2400B3AF */  sw         $s3, 0x24($sp)
/* 92128 800A1928 21980202 */  addu       $s3, $s0, $v0
/* 9212C 800A192C 3000BFAF */  sw         $ra, 0x30($sp)
.L800A1930:
/* 92130 800A1930 39C3010C */  jal        PeekMessageQueue
/* 92134 800A1934 04004426 */   addiu     $a0, $s2, 0x4
/* 92138 800A1938 7D004010 */  beqz       $v0, .L800A1B30
/* 9213C 800A193C 1000043C */   lui       $a0, (0x100004 >> 16)
/* 92140 800A1940 0000438C */  lw         $v1, 0x0($v0)
/* 92144 800A1944 04008434 */  ori        $a0, $a0, (0x100004 & 0xFFFF)
/* 92148 800A1948 53006410 */  beq        $v1, $a0, .L800A1A98
/* 9214C 800A194C 2A108300 */   slt       $v0, $a0, $v1
/* 92150 800A1950 15004014 */  bnez       $v0, .L800A19A8
/* 92154 800A1954 0104023C */   lui       $v0, (0x4010008 >> 16)
/* 92158 800A1958 0080023C */  lui        $v0, (0x80000008 >> 16)
/* 9215C 800A195C 08004234 */  ori        $v0, $v0, (0x80000008 & 0xFFFF)
/* 92160 800A1960 6F006210 */  beq        $v1, $v0, .L800A1B20
/* 92164 800A1964 2A104300 */   slt       $v0, $v0, $v1
/* 92168 800A1968 07004014 */  bnez       $v0, .L800A1988
/* 9216C 800A196C 0080023C */   lui       $v0, (0x80000001 >> 16)
/* 92170 800A1970 6B006210 */  beq        $v1, $v0, .L800A1B20
/* 92174 800A1974 01004234 */   ori       $v0, $v0, (0x80000001 & 0xFFFF)
/* 92178 800A1978 60006210 */  beq        $v1, $v0, .L800A1AFC
/* 9217C 800A197C 21200002 */   addu      $a0, $s0, $zero
/* 92180 800A1980 C6860208 */  j          .L800A1B18
/* 92184 800A1984 21282002 */   addu      $a1, $s1, $zero
.L800A1988:
/* 92188 800A1988 20004234 */  ori        $v0, $v0, (0x80000020 & 0xFFFF)
/* 9218C 800A198C 64006210 */  beq        $v1, $v0, .L800A1B20
/* 92190 800A1990 1000023C */   lui       $v0, (0x100001 >> 16)
/* 92194 800A1994 01004234 */  ori        $v0, $v0, (0x100001 & 0xFFFF)
/* 92198 800A1998 17006210 */  beq        $v1, $v0, .L800A19F8
/* 9219C 800A199C 21200002 */   addu      $a0, $s0, $zero
/* 921A0 800A19A0 C6860208 */  j          .L800A1B18
/* 921A4 800A19A4 21282002 */   addu      $a1, $s1, $zero
.L800A19A8:
/* 921A8 800A19A8 08004234 */  ori        $v0, $v0, (0x4010008 & 0xFFFF)
/* 921AC 800A19AC 5C006210 */  beq        $v1, $v0, .L800A1B20
/* 921B0 800A19B0 2A104300 */   slt       $v0, $v0, $v1
/* 921B4 800A19B4 0A004014 */  bnez       $v0, .L800A19E0
/* 921B8 800A19B8 0204023C */   lui       $v0, (0x4020000 >> 16)
/* 921BC 800A19BC 0001023C */  lui        $v0, (0x1000001 >> 16)
/* 921C0 800A19C0 01004234 */  ori        $v0, $v0, (0x1000001 & 0xFFFF)
/* 921C4 800A19C4 56006210 */  beq        $v1, $v0, .L800A1B20
/* 921C8 800A19C8 0004023C */   lui       $v0, (0x4000001 >> 16)
/* 921CC 800A19CC 01004234 */  ori        $v0, $v0, (0x4000001 & 0xFFFF)
/* 921D0 800A19D0 53006210 */  beq        $v1, $v0, .L800A1B20
/* 921D4 800A19D4 21200002 */   addu      $a0, $s0, $zero
/* 921D8 800A19D8 C6860208 */  j          .L800A1B18
/* 921DC 800A19DC 21282002 */   addu      $a1, $s1, $zero
.L800A19E0:
/* 921E0 800A19E0 4F006210 */  beq        $v1, $v0, .L800A1B20
/* 921E4 800A19E4 0008023C */   lui       $v0, (0x8000000 >> 16)
/* 921E8 800A19E8 34006210 */  beq        $v1, $v0, .L800A1ABC
/* 921EC 800A19EC 21200002 */   addu      $a0, $s0, $zero
/* 921F0 800A19F0 C6860208 */  j          .L800A1B18
/* 921F4 800A19F4 21282002 */   addu      $a1, $s1, $zero
.L800A19F8:
/* 921F8 800A19F8 27002016 */  bnez       $s1, .L800A1A98
/* 921FC 800A19FC 01000524 */   addiu     $a1, $zero, 0x1
/* 92200 800A1A00 26000624 */  addiu      $a2, $zero, 0x26
/* 92204 800A1A04 2C010724 */  addiu      $a3, $zero, 0x12C
/* 92208 800A1A08 0000048E */  lw         $a0, 0x0($s0)
/* 9220C 800A1A0C 08000224 */  addiu      $v0, $zero, 0x8
/* 92210 800A1A10 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 92214 800A1A14 30FD80AF */  sw         $zero, %gp_rel(PhysicsMode)($gp)
/* 92218 800A1A18 9D41020C */  jal        G2Anim_InterpDisableController
/* 9221C 800A1A1C C8018424 */   addiu     $a0, $a0, 0x1C8
/* 92220 800A1A20 21280000 */  addu       $a1, $zero, $zero
/* 92224 800A1A24 0E000624 */  addiu      $a2, $zero, 0xE
/* 92228 800A1A28 0000048E */  lw         $a0, 0x0($s0)
/* 9222C 800A1A2C 2C010724 */  addiu      $a3, $zero, 0x12C
/* 92230 800A1A30 9D41020C */  jal        G2Anim_InterpDisableController
/* 92234 800A1A34 C8018424 */   addiu     $a0, $a0, 0x1C8
/* 92238 800A1A38 21280000 */  addu       $a1, $zero, $zero
/* 9223C 800A1A3C 08000624 */  addiu      $a2, $zero, 0x8
/* 92240 800A1A40 0000048E */  lw         $a0, 0x0($s0)
/* 92244 800A1A44 2C010724 */  addiu      $a3, $zero, 0x12C
/* 92248 800A1A48 9D41020C */  jal        G2Anim_InterpDisableController
/* 9224C 800A1A4C C8018424 */   addiu     $a0, $a0, 0x1C8
/* 92250 800A1A50 0E000524 */  addiu      $a1, $zero, 0xE
/* 92254 800A1A54 2130A000 */  addu       $a2, $a1, $zero
/* 92258 800A1A58 0000048E */  lw         $a0, 0x0($s0)
/* 9225C 800A1A5C 2C010724 */  addiu      $a3, $zero, 0x12C
/* 92260 800A1A60 9D41020C */  jal        G2Anim_InterpDisableController
/* 92264 800A1A64 C8018424 */   addiu     $a0, $a0, 0x1C8
/* 92268 800A1A68 32000524 */  addiu      $a1, $zero, 0x32
/* 9226C 800A1A6C 4C000624 */  addiu      $a2, $zero, 0x4C
/* 92270 800A1A70 0000048E */  lw         $a0, 0x0($s0)
/* 92274 800A1A74 2C010724 */  addiu      $a3, $zero, 0x12C
/* 92278 800A1A78 9D41020C */  jal        G2Anim_InterpDisableController
/* 9227C 800A1A7C C8018424 */   addiu     $a0, $a0, 0x1C8
/* 92280 800A1A80 3A000524 */  addiu      $a1, $zero, 0x3A
/* 92284 800A1A84 4C000624 */  addiu      $a2, $zero, 0x4C
/* 92288 800A1A88 0000048E */  lw         $a0, 0x0($s0)
/* 9228C 800A1A8C 2C010724 */  addiu      $a3, $zero, 0x12C
/* 92290 800A1A90 9D41020C */  jal        G2Anim_InterpDisableController
/* 92294 800A1A94 C8018424 */   addiu     $a0, $a0, 0x1C8
.L800A1A98:
/* 92298 800A1A98 5397020C */  jal        razReaverBladeOn
/* 9229C 800A1A9C 00000000 */   nop
/* 922A0 800A1AA0 0000038E */  lw         $v1, 0x0($s0)
/* 922A4 800A1AA4 00000000 */  nop
/* 922A8 800A1AA8 1800628C */  lw         $v0, 0x18($v1)
/* 922AC 800A1AAC 00000000 */  nop
/* 922B0 800A1AB0 40004234 */  ori        $v0, $v0, 0x40
/* 922B4 800A1AB4 C8860208 */  j          .L800A1B20
/* 922B8 800A1AB8 180062AC */   sw        $v0, 0x18($v1)
.L800A1ABC:
/* 922BC 800A1ABC 21282002 */  addu       $a1, $s1, $zero
/* 922C0 800A1AC0 24000624 */  addiu      $a2, $zero, 0x24
/* 922C4 800A1AC4 21380000 */  addu       $a3, $zero, $zero
/* 922C8 800A1AC8 04000224 */  addiu      $v0, $zero, 0x4
/* 922CC 800A1ACC 1000A2AF */  sw         $v0, 0x10($sp)
/* 922D0 800A1AD0 01000224 */  addiu      $v0, $zero, 0x1
/* 922D4 800A1AD4 20C8010C */  jal        G2EmulationSwitchAnimation
/* 922D8 800A1AD8 1400A2AF */   sw        $v0, 0x14($sp)
/* 922DC 800A1ADC 21200002 */  addu       $a0, $s0, $zero
/* 922E0 800A1AE0 21282002 */  addu       $a1, $s1, $zero
/* 922E4 800A1AE4 0B80063C */  lui        $a2, %hi(StateHandlerFall)
/* 922E8 800A1AE8 A8BDC624 */  addiu      $a2, $a2, %lo(StateHandlerFall)
/* 922EC 800A1AEC C1CA010C */  jal        StateSwitchStateData
/* 922F0 800A1AF0 21380000 */   addu      $a3, $zero, $zero
/* 922F4 800A1AF4 C8860208 */  j          .L800A1B20
/* 922F8 800A1AF8 00000000 */   nop
.L800A1AFC:
/* 922FC 800A1AFC 8C004426 */  addiu      $a0, $s2, 0x8C
/* 92300 800A1B00 0080053C */  lui        $a1, (0x80000001 >> 16)
/* 92304 800A1B04 0100A534 */  ori        $a1, $a1, (0x80000001 & 0xFFFF)
/* 92308 800A1B08 4EC3010C */  jal        EnMessageQueueData
/* 9230C 800A1B0C 21300000 */   addu      $a2, $zero, $zero
/* 92310 800A1B10 C8860208 */  j          .L800A1B20
/* 92314 800A1B14 00000000 */   nop
.L800A1B18:
/* 92318 800A1B18 B9BF020C */  jal        DefaultStateHandler
/* 9231C 800A1B1C 2130A002 */   addu      $a2, $s5, $zero
.L800A1B20:
/* 92320 800A1B20 27C3010C */  jal        DeMessageQueue
/* 92324 800A1B24 04004426 */   addiu     $a0, $s2, 0x4
/* 92328 800A1B28 4C860208 */  j          .L800A1930
/* 9232C 800A1B2C 00000000 */   nop
.L800A1B30:
/* 92330 800A1B30 3000BF8F */  lw         $ra, 0x30($sp)
/* 92334 800A1B34 2C00B58F */  lw         $s5, 0x2C($sp)
/* 92338 800A1B38 2800B48F */  lw         $s4, 0x28($sp)
/* 9233C 800A1B3C 2400B38F */  lw         $s3, 0x24($sp)
/* 92340 800A1B40 2000B28F */  lw         $s2, 0x20($sp)
/* 92344 800A1B44 1C00B18F */  lw         $s1, 0x1C($sp)
/* 92348 800A1B48 1800B08F */  lw         $s0, 0x18($sp)
/* 9234C 800A1B4C 0800E003 */  jr         $ra
/* 92350 800A1B50 3800BD27 */   addiu     $sp, $sp, 0x38
.size StateHandlerWallDismount, . - StateHandlerWallDismount
