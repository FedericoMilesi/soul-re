.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel OBTABLE_InitObjectWithID
/* 2E9FC 8003E1FC D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 2EA00 8003E200 1800B2AF */  sw         $s2, 0x18($sp)
/* 2EA04 8003E204 21908000 */  addu       $s2, $a0, $zero
/* 2EA08 8003E208 2000BFAF */  sw         $ra, 0x20($sp)
/* 2EA0C 8003E20C 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 2EA10 8003E210 1400B1AF */  sw         $s1, 0x14($sp)
/* 2EA14 8003E214 68004012 */  beqz       $s2, .L8003E3B8
/* 2EA18 8003E218 1000B0AF */   sw        $s0, 0x10($sp)
/* 2EA1C 8003E21C 2C00428E */  lw         $v0, 0x2C($s2)
/* 2EA20 8003E220 0400033C */  lui        $v1, (0x40000 >> 16)
/* 2EA24 8003E224 24104300 */  and        $v0, $v0, $v1
/* 2EA28 8003E228 13004010 */  beqz       $v0, .L8003E278
/* 2EA2C 8003E22C 0D80043C */   lui       $a0, %hi(objectFunc)
/* 2EA30 8003E230 1CA3828C */  lw         $v0, %lo(objectFunc)($a0)
/* 2EA34 8003E234 00000000 */  nop
/* 2EA38 8003E238 45004010 */  beqz       $v0, .L8003E350
/* 2EA3C 8003E23C 21880000 */   addu      $s1, $zero, $zero
/* 2EA40 8003E240 0D80133C */  lui        $s3, %hi(gTimerEnabled + 0x148)
/* 2EA44 8003E244 1CA39024 */  addiu      $s0, $a0, %lo(objectFunc)
.L8003E248:
/* 2EA48 8003E248 0000048E */  lw         $a0, 0x0($s0)
/* 2EA4C 8003E24C 83F7020C */  jal        func_800BDE0C
/* 2EA50 8003E250 A80E6526 */   addiu     $a1, $s3, %lo(gTimerEnabled + 0x148)
/* 2EA54 8003E254 31004010 */  beqz       $v0, .L8003E31C
/* 2EA58 8003E258 0D80023C */   lui       $v0, %hi(objectFunc)
/* 2EA5C 8003E25C 24001026 */  addiu      $s0, $s0, 0x24
/* 2EA60 8003E260 0000028E */  lw         $v0, 0x0($s0)
/* 2EA64 8003E264 00000000 */  nop
/* 2EA68 8003E268 39004010 */  beqz       $v0, .L8003E350
/* 2EA6C 8003E26C 01003126 */   addiu     $s1, $s1, 0x1
/* 2EA70 8003E270 92F80008 */  j          .L8003E248
/* 2EA74 8003E274 00000000 */   nop
.L8003E278:
/* 2EA78 8003E278 2C00428E */  lw         $v0, 0x2C($s2)
/* 2EA7C 8003E27C 0800033C */  lui        $v1, (0x80000 >> 16)
/* 2EA80 8003E280 24104300 */  and        $v0, $v0, $v1
/* 2EA84 8003E284 13004010 */  beqz       $v0, .L8003E2D4
/* 2EA88 8003E288 00000000 */   nop
/* 2EA8C 8003E28C 1CA3828C */  lw         $v0, %lo(objectFunc)($a0)
/* 2EA90 8003E290 00000000 */  nop
/* 2EA94 8003E294 2E004010 */  beqz       $v0, .L8003E350
/* 2EA98 8003E298 21880000 */   addu      $s1, $zero, $zero
/* 2EA9C 8003E29C 0D80133C */  lui        $s3, %hi(gTimerEnabled + 0x154)
/* 2EAA0 8003E2A0 1CA39024 */  addiu      $s0, $a0, %lo(objectFunc)
.L8003E2A4:
/* 2EAA4 8003E2A4 0000048E */  lw         $a0, 0x0($s0)
/* 2EAA8 8003E2A8 83F7020C */  jal        func_800BDE0C
/* 2EAAC 8003E2AC B40E6526 */   addiu     $a1, $s3, %lo(gTimerEnabled + 0x154)
/* 2EAB0 8003E2B0 1A004010 */  beqz       $v0, .L8003E31C
/* 2EAB4 8003E2B4 0D80023C */   lui       $v0, %hi(objectFunc)
/* 2EAB8 8003E2B8 24001026 */  addiu      $s0, $s0, 0x24
/* 2EABC 8003E2BC 0000028E */  lw         $v0, 0x0($s0)
/* 2EAC0 8003E2C0 00000000 */  nop
/* 2EAC4 8003E2C4 22004010 */  beqz       $v0, .L8003E350
/* 2EAC8 8003E2C8 01003126 */   addiu     $s1, $s1, 0x1
/* 2EACC 8003E2CC A9F80008 */  j          .L8003E2A4
/* 2EAD0 8003E2D0 00000000 */   nop
.L8003E2D4:
/* 2EAD4 8003E2D4 0D80043C */  lui        $a0, %hi(objectFunc)
/* 2EAD8 8003E2D8 1CA3828C */  lw         $v0, %lo(objectFunc)($a0)
/* 2EADC 8003E2DC 00000000 */  nop
/* 2EAE0 8003E2E0 1B004010 */  beqz       $v0, .L8003E350
/* 2EAE4 8003E2E4 21880000 */   addu      $s1, $zero, $zero
/* 2EAE8 8003E2E8 1CA39024 */  addiu      $s0, $a0, %lo(objectFunc)
.L8003E2EC:
/* 2EAEC 8003E2EC 0000048E */  lw         $a0, 0x0($s0)
/* 2EAF0 8003E2F0 2000458E */  lw         $a1, 0x20($s2)
/* 2EAF4 8003E2F4 83F7020C */  jal        func_800BDE0C
/* 2EAF8 8003E2F8 00000000 */   nop
/* 2EAFC 8003E2FC 07004010 */  beqz       $v0, .L8003E31C
/* 2EB00 8003E300 0D80023C */   lui       $v0, %hi(objectFunc)
/* 2EB04 8003E304 24001026 */  addiu      $s0, $s0, 0x24
/* 2EB08 8003E308 0000028E */  lw         $v0, 0x0($s0)
/* 2EB0C 8003E30C 00000000 */  nop
/* 2EB10 8003E310 F6FF4014 */  bnez       $v0, .L8003E2EC
/* 2EB14 8003E314 01003126 */   addiu     $s1, $s1, 0x1
/* 2EB18 8003E318 0D80023C */  lui        $v0, %hi(objectFunc)
.L8003E31C:
/* 2EB1C 8003E31C 1CA34224 */  addiu      $v0, $v0, %lo(objectFunc)
/* 2EB20 8003E320 C0181100 */  sll        $v1, $s1, 3
/* 2EB24 8003E324 21187100 */  addu       $v1, $v1, $s1
/* 2EB28 8003E328 80180300 */  sll        $v1, $v1, 2
/* 2EB2C 8003E32C 21186200 */  addu       $v1, $v1, $v0
/* 2EB30 8003E330 0000628C */  lw         $v0, 0x0($v1)
/* 2EB34 8003E334 00000000 */  nop
/* 2EB38 8003E338 06004010 */  beqz       $v0, .L8003E354
/* 2EB3C 8003E33C FFFF0224 */   addiu     $v0, $zero, -0x1
/* 2EB40 8003E340 D6F80008 */  j          .L8003E358
/* 2EB44 8003E344 040051A6 */   sh        $s1, 0x4($s2)
.L8003E348:
/* 2EB48 8003E348 EEF80008 */  j          .L8003E3B8
/* 2EB4C 8003E34C 040092AC */   sw        $s2, 0x4($a0)
.L8003E350:
/* 2EB50 8003E350 FFFF0224 */  addiu      $v0, $zero, -0x1
.L8003E354:
/* 2EB54 8003E354 040042A6 */  sh         $v0, 0x4($s2)
.L8003E358:
/* 2EB58 8003E358 0D80023C */  lui        $v0, %hi(objectAccess)
/* 2EB5C 8003E35C 3CA2438C */  lw         $v1, %lo(objectAccess)($v0)
/* 2EB60 8003E360 00000000 */  nop
/* 2EB64 8003E364 14006010 */  beqz       $v1, .L8003E3B8
/* 2EB68 8003E368 3CA24424 */   addiu     $a0, $v0, %lo(objectAccess)
/* 2EB6C 8003E36C 2400458E */  lw         $a1, 0x24($s2)
/* 2EB70 8003E370 00000000 */  nop
/* 2EB74 8003E374 0000A68C */  lw         $a2, 0x0($a1)
.L8003E378:
/* 2EB78 8003E378 0000838C */  lw         $v1, 0x0($a0)
/* 2EB7C 8003E37C 00000000 */  nop
/* 2EB80 8003E380 0000628C */  lw         $v0, 0x0($v1)
/* 2EB84 8003E384 00000000 */  nop
/* 2EB88 8003E388 06004614 */  bne        $v0, $a2, .L8003E3A4
/* 2EB8C 8003E38C 00000000 */   nop
/* 2EB90 8003E390 0400638C */  lw         $v1, 0x4($v1)
/* 2EB94 8003E394 0400A28C */  lw         $v0, 0x4($a1)
/* 2EB98 8003E398 00000000 */  nop
/* 2EB9C 8003E39C EAFF6210 */  beq        $v1, $v0, .L8003E348
/* 2EBA0 8003E3A0 00000000 */   nop
.L8003E3A4:
/* 2EBA4 8003E3A4 08008424 */  addiu      $a0, $a0, 0x8
/* 2EBA8 8003E3A8 0000828C */  lw         $v0, 0x0($a0)
/* 2EBAC 8003E3AC 00000000 */  nop
/* 2EBB0 8003E3B0 F1FF4014 */  bnez       $v0, .L8003E378
/* 2EBB4 8003E3B4 00000000 */   nop
.L8003E3B8:
/* 2EBB8 8003E3B8 2000BF8F */  lw         $ra, 0x20($sp)
/* 2EBBC 8003E3BC 1C00B38F */  lw         $s3, 0x1C($sp)
/* 2EBC0 8003E3C0 1800B28F */  lw         $s2, 0x18($sp)
/* 2EBC4 8003E3C4 1400B18F */  lw         $s1, 0x14($sp)
/* 2EBC8 8003E3C8 1000B08F */  lw         $s0, 0x10($sp)
/* 2EBCC 8003E3CC 0800E003 */  jr         $ra
/* 2EBD0 8003E3D0 2800BD27 */   addiu     $sp, $sp, 0x28
.size OBTABLE_InitObjectWithID, . - OBTABLE_InitObjectWithID
