.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetControllerMessages
/* A3A8C 800B328C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* A3A90 800B3290 1000B0AF */  sw         $s0, 0x10($sp)
/* A3A94 800B3294 21808000 */  addu       $s0, $a0, $zero
/* A3A98 800B3298 1400BFAF */  sw         $ra, 0x14($sp)
/* A3A9C 800B329C 0400028E */  lw         $v0, 0x4($s0)
/* A3AA0 800B32A0 8CA4838F */  lw         $v1, %gp_rel(RazielCommands + 0x8)($gp)
/* A3AA4 800B32A4 00000000 */  nop
/* A3AA8 800B32A8 24104300 */  and        $v0, $v0, $v1
/* A3AAC 800B32AC 04004010 */  beqz       $v0, .L800B32C0
/* A3AB0 800B32B0 0080053C */   lui       $a1, (0x80000000 >> 16)
/* A3AB4 800B32B4 B0FA8427 */  addiu      $a0, $gp, %gp_rel(Raziel + 0x480)
/* A3AB8 800B32B8 B6CC0208 */  j          .L800B32D8
/* A3ABC 800B32BC 00000000 */   nop
.L800B32C0:
/* A3AC0 800B32C0 0800028E */  lw         $v0, 0x8($s0)
/* A3AC4 800B32C4 00000000 */  nop
/* A3AC8 800B32C8 24104300 */  and        $v0, $v0, $v1
/* A3ACC 800B32CC 04004010 */  beqz       $v0, .L800B32E0
/* A3AD0 800B32D0 0020053C */   lui       $a1, (0x20000000 >> 16)
/* A3AD4 800B32D4 B0FA8427 */  addiu      $a0, $gp, %gp_rel(Raziel + 0x480)
.L800B32D8:
/* A3AD8 800B32D8 4EC3010C */  jal        EnMessageQueueData
/* A3ADC 800B32DC 21300000 */   addu      $a2, $zero, $zero
.L800B32E0:
/* A3AE0 800B32E0 0400028E */  lw         $v0, 0x4($s0)
/* A3AE4 800B32E4 88A4838F */  lw         $v1, %gp_rel(RazielCommands + 0x4)($gp)
/* A3AE8 800B32E8 00000000 */  nop
/* A3AEC 800B32EC 24104300 */  and        $v0, $v0, $v1
/* A3AF0 800B32F0 04004010 */  beqz       $v0, .L800B3304
/* A3AF4 800B32F4 0080053C */   lui       $a1, (0x80000002 >> 16)
/* A3AF8 800B32F8 B0FA8427 */  addiu      $a0, $gp, %gp_rel(Raziel + 0x480)
/* A3AFC 800B32FC C8CC0208 */  j          .L800B3320
/* A3B00 800B3300 0200A534 */   ori       $a1, $a1, (0x80000002 & 0xFFFF)
.L800B3304:
/* A3B04 800B3304 0800028E */  lw         $v0, 0x8($s0)
/* A3B08 800B3308 00000000 */  nop
/* A3B0C 800B330C 24104300 */  and        $v0, $v0, $v1
/* A3B10 800B3310 05004010 */  beqz       $v0, .L800B3328
/* A3B14 800B3314 0020053C */   lui       $a1, (0x20000002 >> 16)
/* A3B18 800B3318 B0FA8427 */  addiu      $a0, $gp, %gp_rel(Raziel + 0x480)
/* A3B1C 800B331C 0200A534 */  ori        $a1, $a1, (0x20000002 & 0xFFFF)
.L800B3320:
/* A3B20 800B3320 4EC3010C */  jal        EnMessageQueueData
/* A3B24 800B3324 21300000 */   addu      $a2, $zero, $zero
.L800B3328:
/* A3B28 800B3328 0400028E */  lw         $v0, 0x4($s0)
/* A3B2C 800B332C 90A4838F */  lw         $v1, %gp_rel(RazielCommands + 0xC)($gp)
/* A3B30 800B3330 00000000 */  nop
/* A3B34 800B3334 24104300 */  and        $v0, $v0, $v1
/* A3B38 800B3338 04004010 */  beqz       $v0, .L800B334C
/* A3B3C 800B333C 0080053C */   lui       $a1, (0x80000001 >> 16)
/* A3B40 800B3340 B0FA8427 */  addiu      $a0, $gp, %gp_rel(Raziel + 0x480)
/* A3B44 800B3344 DACC0208 */  j          .L800B3368
/* A3B48 800B3348 0100A534 */   ori       $a1, $a1, (0x80000001 & 0xFFFF)
.L800B334C:
/* A3B4C 800B334C 0800028E */  lw         $v0, 0x8($s0)
/* A3B50 800B3350 00000000 */  nop
/* A3B54 800B3354 24104300 */  and        $v0, $v0, $v1
/* A3B58 800B3358 05004010 */  beqz       $v0, .L800B3370
/* A3B5C 800B335C 0020053C */   lui       $a1, (0x20000001 >> 16)
/* A3B60 800B3360 B0FA8427 */  addiu      $a0, $gp, %gp_rel(Raziel + 0x480)
/* A3B64 800B3364 0100A534 */  ori        $a1, $a1, (0x20000001 & 0xFFFF)
.L800B3368:
/* A3B68 800B3368 4EC3010C */  jal        EnMessageQueueData
/* A3B6C 800B336C 21300000 */   addu      $a2, $zero, $zero
.L800B3370:
/* A3B70 800B3370 0400028E */  lw         $v0, 0x4($s0)
/* A3B74 800B3374 A0A4838F */  lw         $v1, %gp_rel(RazielCommands + 0x1C)($gp)
/* A3B78 800B3378 00000000 */  nop
/* A3B7C 800B337C 24104300 */  and        $v0, $v0, $v1
/* A3B80 800B3380 04004010 */  beqz       $v0, .L800B3394
/* A3B84 800B3384 0080053C */   lui       $a1, (0x80000004 >> 16)
/* A3B88 800B3388 B0FA8427 */  addiu      $a0, $gp, %gp_rel(Raziel + 0x480)
/* A3B8C 800B338C ECCC0208 */  j          .L800B33B0
/* A3B90 800B3390 0400A534 */   ori       $a1, $a1, (0x80000004 & 0xFFFF)
.L800B3394:
/* A3B94 800B3394 0800028E */  lw         $v0, 0x8($s0)
/* A3B98 800B3398 00000000 */  nop
/* A3B9C 800B339C 24104300 */  and        $v0, $v0, $v1
/* A3BA0 800B33A0 05004010 */  beqz       $v0, .L800B33B8
/* A3BA4 800B33A4 0020053C */   lui       $a1, (0x20000004 >> 16)
/* A3BA8 800B33A8 B0FA8427 */  addiu      $a0, $gp, %gp_rel(Raziel + 0x480)
/* A3BAC 800B33AC 0400A534 */  ori        $a1, $a1, (0x20000004 & 0xFFFF)
.L800B33B0:
/* A3BB0 800B33B0 4EC3010C */  jal        EnMessageQueueData
/* A3BB4 800B33B4 21300000 */   addu      $a2, $zero, $zero
.L800B33B8:
/* A3BB8 800B33B8 0400028E */  lw         $v0, 0x4($s0)
/* A3BBC 800B33BC 9CA4838F */  lw         $v1, %gp_rel(RazielCommands + 0x18)($gp)
/* A3BC0 800B33C0 00000000 */  nop
/* A3BC4 800B33C4 24104300 */  and        $v0, $v0, $v1
/* A3BC8 800B33C8 04004010 */  beqz       $v0, .L800B33DC
/* A3BCC 800B33CC 0080053C */   lui       $a1, (0x80000008 >> 16)
/* A3BD0 800B33D0 B0FA8427 */  addiu      $a0, $gp, %gp_rel(Raziel + 0x480)
/* A3BD4 800B33D4 FECC0208 */  j          .L800B33F8
/* A3BD8 800B33D8 0800A534 */   ori       $a1, $a1, (0x80000008 & 0xFFFF)
.L800B33DC:
/* A3BDC 800B33DC 0800028E */  lw         $v0, 0x8($s0)
/* A3BE0 800B33E0 00000000 */  nop
/* A3BE4 800B33E4 24104300 */  and        $v0, $v0, $v1
/* A3BE8 800B33E8 05004010 */  beqz       $v0, .L800B3400
/* A3BEC 800B33EC 0020053C */   lui       $a1, (0x20000008 >> 16)
/* A3BF0 800B33F0 B0FA8427 */  addiu      $a0, $gp, %gp_rel(Raziel + 0x480)
/* A3BF4 800B33F4 0800A534 */  ori        $a1, $a1, (0x20000008 & 0xFFFF)
.L800B33F8:
/* A3BF8 800B33F8 4EC3010C */  jal        EnMessageQueueData
/* A3BFC 800B33FC 21300000 */   addu      $a2, $zero, $zero
.L800B3400:
/* A3C00 800B3400 0400028E */  lw         $v0, 0x4($s0)
/* A3C04 800B3404 A8A4838F */  lw         $v1, %gp_rel(RazielCommands + 0x24)($gp)
/* A3C08 800B3408 00000000 */  nop
/* A3C0C 800B340C 24104300 */  and        $v0, $v0, $v1
/* A3C10 800B3410 04004010 */  beqz       $v0, .L800B3424
/* A3C14 800B3414 0080053C */   lui       $a1, (0x80000020 >> 16)
/* A3C18 800B3418 B0FA8427 */  addiu      $a0, $gp, %gp_rel(Raziel + 0x480)
/* A3C1C 800B341C 10CD0208 */  j          .L800B3440
/* A3C20 800B3420 2000A534 */   ori       $a1, $a1, (0x80000020 & 0xFFFF)
.L800B3424:
/* A3C24 800B3424 0800028E */  lw         $v0, 0x8($s0)
/* A3C28 800B3428 00000000 */  nop
/* A3C2C 800B342C 24104300 */  and        $v0, $v0, $v1
/* A3C30 800B3430 05004010 */  beqz       $v0, .L800B3448
/* A3C34 800B3434 0020053C */   lui       $a1, (0x20000020 >> 16)
/* A3C38 800B3438 B0FA8427 */  addiu      $a0, $gp, %gp_rel(Raziel + 0x480)
/* A3C3C 800B343C 2000A534 */  ori        $a1, $a1, (0x20000020 & 0xFFFF)
.L800B3440:
/* A3C40 800B3440 4EC3010C */  jal        EnMessageQueueData
/* A3C44 800B3444 21300000 */   addu      $a2, $zero, $zero
.L800B3448:
/* A3C48 800B3448 0400028E */  lw         $v0, 0x4($s0)
/* A3C4C 800B344C 84A4838F */  lw         $v1, %gp_rel(RazielCommands)($gp)
/* A3C50 800B3450 00000000 */  nop
/* A3C54 800B3454 24104300 */  and        $v0, $v0, $v1
/* A3C58 800B3458 05004010 */  beqz       $v0, .L800B3470
/* A3C5C 800B345C 0080053C */   lui       $a1, (0x80000010 >> 16)
/* A3C60 800B3460 B0FA8427 */  addiu      $a0, $gp, %gp_rel(Raziel + 0x480)
/* A3C64 800B3464 1000A534 */  ori        $a1, $a1, (0x80000010 & 0xFFFF)
/* A3C68 800B3468 4EC3010C */  jal        EnMessageQueueData
/* A3C6C 800B346C 21300000 */   addu      $a2, $zero, $zero
.L800B3470:
/* A3C70 800B3470 1400BF8F */  lw         $ra, 0x14($sp)
/* A3C74 800B3474 1000B08F */  lw         $s0, 0x10($sp)
/* A3C78 800B3478 21100000 */  addu       $v0, $zero, $zero
/* A3C7C 800B347C 0800E003 */  jr         $ra
/* A3C80 800B3480 1800BD27 */   addiu     $sp, $sp, 0x18
.size GetControllerMessages, . - GetControllerMessages
