.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RAZIEL_TurnHead
/* A4940 800B4140 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* A4944 800B4144 3000B2AF */  sw         $s2, 0x30($sp)
/* A4948 800B4148 21908000 */  addu       $s2, $a0, $zero
/* A494C 800B414C 2800B0AF */  sw         $s0, 0x28($sp)
/* A4950 800B4150 2180A000 */  addu       $s0, $a1, $zero
/* A4954 800B4154 2C00B1AF */  sw         $s1, 0x2C($sp)
/* A4958 800B4158 2188C000 */  addu       $s1, $a2, $zero
/* A495C 800B415C 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* A4960 800B4160 0200033C */  lui        $v1, (0x20000 >> 16)
/* A4964 800B4164 24104300 */  and        $v0, $v0, $v1
/* A4968 800B4168 48004010 */  beqz       $v0, .L800B428C
/* A496C 800B416C 3400BFAF */   sw        $ra, 0x34($sp)
/* A4970 800B4170 98FA828F */  lw         $v0, %gp_rel(Raziel + 0x468)($gp)
/* A4974 800B4174 00000000 */  nop
/* A4978 800B4178 04004230 */  andi       $v0, $v0, 0x4
/* A497C 800B417C 43004014 */  bnez       $v0, .L800B428C
/* A4980 800B4180 00000000 */   nop
/* A4984 800B4184 48BE838F */  lw         $v1, %gp_rel(gameTrackerX + 0x80)($gp)
/* A4988 800B4188 00000000 */  nop
/* A498C 800B418C 02006104 */  bgez       $v1, .L800B4198
/* A4990 800B4190 AA2A043C */   lui       $a0, (0x2AAAAAAB >> 16)
/* A4994 800B4194 07006324 */  addiu      $v1, $v1, 0x7
.L800B4198:
/* A4998 800B4198 00000296 */  lhu        $v0, 0x0($s0)
/* A499C 800B419C C3180300 */  sra        $v1, $v1, 3
/* A49A0 800B41A0 21104300 */  addu       $v0, $v0, $v1
/* A49A4 800B41A4 000002A6 */  sh         $v0, 0x0($s0)
/* A49A8 800B41A8 44BE838F */  lw         $v1, %gp_rel(gameTrackerX + 0x7C)($gp)
/* A49AC 800B41AC ABAA8434 */  ori        $a0, $a0, (0x2AAAAAAB & 0xFFFF)
/* A49B0 800B41B0 18006400 */  mult       $v1, $a0
/* A49B4 800B41B4 00002296 */  lhu        $v0, 0x0($s1)
/* A49B8 800B41B8 C31F0300 */  sra        $v1, $v1, 31
/* A49BC 800B41BC 10380000 */  mfhi       $a3
/* A49C0 800B41C0 2318E300 */  subu       $v1, $a3, $v1
/* A49C4 800B41C4 23104300 */  subu       $v0, $v0, $v1
/* A49C8 800B41C8 000022A6 */  sh         $v0, 0x0($s1)
/* A49CC 800B41CC 40FB8287 */  lh         $v0, %gp_rel(Raziel + 0x510)($gp)
/* A49D0 800B41D0 00000000 */  nop
/* A49D4 800B41D4 0B004010 */  beqz       $v0, .L800B4204
/* A49D8 800B41D8 00000000 */   nop
/* A49DC 800B41DC 00000286 */  lh         $v0, 0x0($s0)
/* A49E0 800B41E0 00000396 */  lhu        $v1, 0x0($s0)
/* A49E4 800B41E4 07004010 */  beqz       $v0, .L800B4204
/* A49E8 800B41E8 00000000 */   nop
/* A49EC 800B41EC 94FA828F */  lw         $v0, %gp_rel(Raziel + 0x464)($gp)
/* A49F0 800B41F0 00000000 */  nop
/* A49F4 800B41F4 1C004294 */  lhu        $v0, 0x1C($v0)
/* A49F8 800B41F8 00000000 */  nop
/* A49FC 800B41FC 23106200 */  subu       $v0, $v1, $v0
/* A4A00 800B4200 000002A6 */  sh         $v0, 0x0($s0)
.L800B4204:
/* A4A04 800B4204 00000296 */  lhu        $v0, 0x0($s0)
/* A4A08 800B4208 40FB8397 */  lhu        $v1, %gp_rel(Raziel + 0x510)($gp)
/* A4A0C 800B420C 00F04224 */  addiu      $v0, $v0, -0x1000
/* A4A10 800B4210 21186200 */  addu       $v1, $v1, $v0
/* A4A14 800B4214 000003A6 */  sh         $v1, 0x0($s0)
/* A4A18 800B4218 1000A3A7 */  sh         $v1, 0x10($sp)
/* A4A1C 800B421C 1200A0A7 */  sh         $zero, 0x12($sp)
/* A4A20 800B4220 00002296 */  lhu        $v0, 0x0($s1)
/* A4A24 800B4224 1000A427 */  addiu      $a0, $sp, 0x10
/* A4A28 800B4228 5479020C */  jal        LimitRotation
/* A4A2C 800B422C 1400A2A7 */   sh        $v0, 0x14($sp)
/* A4A30 800B4230 21204002 */  addu       $a0, $s2, $zero
/* A4A34 800B4234 1000A297 */  lhu        $v0, 0x10($sp)
/* A4A38 800B4238 40FB8397 */  lhu        $v1, %gp_rel(Raziel + 0x510)($gp)
/* A4A3C 800B423C 00104224 */  addiu      $v0, $v0, 0x1000
/* A4A40 800B4240 23104300 */  subu       $v0, $v0, $v1
/* A4A44 800B4244 000002A6 */  sh         $v0, 0x0($s0)
/* A4A48 800B4248 1400A297 */  lhu        $v0, 0x14($sp)
/* A4A4C 800B424C 1000A527 */  addiu      $a1, $sp, 0x10
/* A4A50 800B4250 0479020C */  jal        ThrowSetFocusPoint
/* A4A54 800B4254 000022A6 */   sh        $v0, 0x0($s1)
/* A4A58 800B4258 40FB8287 */  lh         $v0, %gp_rel(Raziel + 0x510)($gp)
/* A4A5C 800B425C 00000000 */  nop
/* A4A60 800B4260 3A004010 */  beqz       $v0, .L800B434C
/* A4A64 800B4264 00000000 */   nop
/* A4A68 800B4268 90AC8427 */  addiu      $a0, $gp, %gp_rel(theCamera)
/* A4A6C 800B426C 94FA828F */  lw         $v0, %gp_rel(Raziel + 0x464)($gp)
/* A4A70 800B4270 00000386 */  lh         $v1, 0x0($s0)
/* A4A74 800B4274 1C004584 */  lh         $a1, 0x1C($v0)
/* A4A78 800B4278 00002686 */  lh         $a2, 0x0($s1)
/* A4A7C 800B427C E86E000C */  jal        CAMERA_SetLookRot
/* A4A80 800B4280 21286500 */   addu      $a1, $v1, $a1
/* A4A84 800B4284 D3D00208 */  j          .L800B434C
/* A4A88 800B4288 00000000 */   nop
.L800B428C:
/* A4A8C 800B428C 48BE838F */  lw         $v1, %gp_rel(gameTrackerX + 0x80)($gp)
/* A4A90 800B4290 00000000 */  nop
/* A4A94 800B4294 02006104 */  bgez       $v1, .L800B42A0
/* A4A98 800B4298 00000000 */   nop
/* A4A9C 800B429C 03006324 */  addiu      $v1, $v1, 0x3
.L800B42A0:
/* A4AA0 800B42A0 5555043C */  lui        $a0, (0x55555556 >> 16)
/* A4AA4 800B42A4 00000296 */  lhu        $v0, 0x0($s0)
/* A4AA8 800B42A8 83180300 */  sra        $v1, $v1, 2
/* A4AAC 800B42AC 21104300 */  addu       $v0, $v0, $v1
/* A4AB0 800B42B0 000002A6 */  sh         $v0, 0x0($s0)
/* A4AB4 800B42B4 44BE838F */  lw         $v1, %gp_rel(gameTrackerX + 0x7C)($gp)
/* A4AB8 800B42B8 56558434 */  ori        $a0, $a0, (0x55555556 & 0xFFFF)
/* A4ABC 800B42BC 18006400 */  mult       $v1, $a0
/* A4AC0 800B42C0 00002296 */  lhu        $v0, 0x0($s1)
/* A4AC4 800B42C4 C31F0300 */  sra        $v1, $v1, 31
/* A4AC8 800B42C8 10380000 */  mfhi       $a3
/* A4ACC 800B42CC 2318E300 */  subu       $v1, $a3, $v1
/* A4AD0 800B42D0 23104300 */  subu       $v0, $v0, $v1
/* A4AD4 800B42D4 000022A6 */  sh         $v0, 0x0($s1)
/* A4AD8 800B42D8 00000296 */  lhu        $v0, 0x0($s0)
/* A4ADC 800B42DC 00000000 */  nop
/* A4AE0 800B42E0 FF0F4330 */  andi       $v1, $v0, 0xFFF
/* A4AE4 800B42E4 01086228 */  slti       $v0, $v1, 0x801
/* A4AE8 800B42E8 02004014 */  bnez       $v0, .L800B42F4
/* A4AEC 800B42EC 21206000 */   addu      $a0, $v1, $zero
/* A4AF0 800B42F0 00F06434 */  ori        $a0, $v1, 0xF000
.L800B42F4:
/* A4AF4 800B42F4 000004A6 */  sh         $a0, 0x0($s0)
/* A4AF8 800B42F8 00002296 */  lhu        $v0, 0x0($s1)
/* A4AFC 800B42FC 00000000 */  nop
/* A4B00 800B4300 FF0F4330 */  andi       $v1, $v0, 0xFFF
/* A4B04 800B4304 01086228 */  slti       $v0, $v1, 0x801
/* A4B08 800B4308 02004014 */  bnez       $v0, .L800B4314
/* A4B0C 800B430C 21306000 */   addu      $a2, $v1, $zero
/* A4B10 800B4310 00F06634 */  ori        $a2, $v1, 0xF000
.L800B4314:
/* A4B14 800B4314 21204002 */  addu       $a0, $s2, $zero
/* A4B18 800B4318 1800A527 */  addiu      $a1, $sp, 0x18
/* A4B1C 800B431C 00FD0224 */  addiu      $v0, $zero, -0x300
/* A4B20 800B4320 000026A6 */  sh         $a2, 0x0($s1)
/* A4B24 800B4324 2000A2A7 */  sh         $v0, 0x20($sp)
/* A4B28 800B4328 00020224 */  addiu      $v0, $zero, 0x200
/* A4B2C 800B432C 2200A2A7 */  sh         $v0, 0x22($sp)
/* A4B30 800B4330 00FC0224 */  addiu      $v0, $zero, -0x400
/* A4B34 800B4334 2400A2A7 */  sh         $v0, 0x24($sp)
/* A4B38 800B4338 00040224 */  addiu      $v0, $zero, 0x400
/* A4B3C 800B433C 1800B0AF */  sw         $s0, 0x18($sp)
/* A4B40 800B4340 1C00B1AF */  sw         $s1, 0x1C($sp)
/* A4B44 800B4344 0B95020C */  jal        razRotateUpperBody
/* A4B48 800B4348 2600A2A7 */   sh        $v0, 0x26($sp)
.L800B434C:
/* A4B4C 800B434C 3400BF8F */  lw         $ra, 0x34($sp)
/* A4B50 800B4350 3000B28F */  lw         $s2, 0x30($sp)
/* A4B54 800B4354 2C00B18F */  lw         $s1, 0x2C($sp)
/* A4B58 800B4358 2800B08F */  lw         $s0, 0x28($sp)
/* A4B5C 800B435C 0800E003 */  jr         $ra
/* A4B60 800B4360 3800BD27 */   addiu     $sp, $sp, 0x38
.size RAZIEL_TurnHead, . - RAZIEL_TurnHead
