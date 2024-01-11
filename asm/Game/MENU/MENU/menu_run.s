.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel menu_run
/* A8A90 800B8290 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* A8A94 800B8294 1800B2AF */  sw         $s2, 0x18($sp)
/* A8A98 800B8298 21908000 */  addu       $s2, $a0, $zero
/* A8A9C 800B829C 2400BFAF */  sw         $ra, 0x24($sp)
/* A8AA0 800B82A0 2000B4AF */  sw         $s4, 0x20($sp)
/* A8AA4 800B82A4 1C00B3AF */  sw         $s3, 0x1C($sp)
/* A8AA8 800B82A8 1400B1AF */  sw         $s1, 0x14($sp)
/* A8AAC 800B82AC 1000B0AF */  sw         $s0, 0x10($sp)
/* A8AB0 800B82B0 8403448E */  lw         $a0, 0x384($s2)
/* A8AB4 800B82B4 2DE1020C */  jal        menu_get_ctrl
/* A8AB8 800B82B8 00000000 */   nop
/* A8ABC 800B82BC 0000438E */  lw         $v1, 0x0($s2)
/* A8AC0 800B82C0 00000000 */  nop
/* A8AC4 800B82C4 C0200300 */  sll        $a0, $v1, 3
/* A8AC8 800B82C8 21208300 */  addu       $a0, $a0, $v1
/* A8ACC 800B82CC 80200400 */  sll        $a0, $a0, 2
/* A8AD0 800B82D0 21209200 */  addu       $a0, $a0, $s2
/* A8AD4 800B82D4 E8FF9424 */  addiu      $s4, $a0, -0x18
/* A8AD8 800B82D8 0400908E */  lw         $s0, 0x4($s4)
/* A8ADC 800B82DC 21884000 */  addu       $s1, $v0, $zero
/* A8AE0 800B82E0 00111000 */  sll        $v0, $s0, 4
/* A8AE4 800B82E4 C0004224 */  addiu      $v0, $v0, 0xC0
/* A8AE8 800B82E8 5D000006 */  bltz       $s0, .L800B8460
/* A8AEC 800B82EC 21984202 */   addu      $s3, $s2, $v0
/* A8AF0 800B82F0 5B002012 */  beqz       $s1, .L800B8460
/* A8AF4 800B82F4 00000000 */   nop
/* A8AF8 800B82F8 FAE1020C */  jal        menudefs_reset_hack_attract_mode
/* A8AFC 800B82FC 00000000 */   nop
/* A8B00 800B8300 8403448E */  lw         $a0, 0x384($s2)
/* A8B04 800B8304 0400628E */  lw         $v0, 0x4($s3)
/* A8B08 800B8308 0800658E */  lw         $a1, 0x8($s3)
/* A8B0C 800B830C 09F84000 */  jalr       $v0
/* A8B10 800B8310 21302002 */   addu      $a2, $s1, $zero
/* A8B14 800B8314 05004010 */  beqz       $v0, .L800B832C
/* A8B18 800B8318 00000000 */   nop
/* A8B1C 800B831C 6FE1020C */  jal        menu_sound
/* A8B20 800B8320 21204000 */   addu      $a0, $v0, $zero
/* A8B24 800B8324 18E10208 */  j          .L800B8460
/* A8B28 800B8328 00000000 */   nop
.L800B832C:
/* A8B2C 800B832C 02000224 */  addiu      $v0, $zero, 0x2
/* A8B30 800B8330 25002212 */  beq        $s1, $v0, .L800B83C8
/* A8B34 800B8334 0300222E */   sltiu     $v0, $s1, 0x3
/* A8B38 800B8338 05004010 */  beqz       $v0, .L800B8350
/* A8B3C 800B833C 01000224 */   addiu     $v0, $zero, 0x1
/* A8B40 800B8340 08002212 */  beq        $s1, $v0, .L800B8364
/* A8B44 800B8344 00000000 */   nop
/* A8B48 800B8348 11E10208 */  j          .L800B8444
/* A8B4C 800B834C 00000000 */   nop
.L800B8350:
/* A8B50 800B8350 06000224 */  addiu      $v0, $zero, 0x6
/* A8B54 800B8354 32002212 */  beq        $s1, $v0, .L800B8420
/* A8B58 800B8358 00000000 */   nop
/* A8B5C 800B835C 11E10208 */  j          .L800B8444
/* A8B60 800B8360 00000000 */   nop
.L800B8364:
/* A8B64 800B8364 0400438E */  lw         $v1, 0x4($s2)
/* A8B68 800B8368 00000000 */  nop
/* A8B6C 800B836C 21100302 */  addu       $v0, $s0, $v1
/* A8B70 800B8370 FFFF4224 */  addiu      $v0, $v0, -0x1
/* A8B74 800B8374 1A004300 */  div        $zero, $v0, $v1
/* A8B78 800B8378 10800000 */  mfhi       $s0
/* A8B7C 800B837C 00000000 */  nop
/* A8B80 800B8380 00111000 */  sll        $v0, $s0, 4
/* A8B84 800B8384 21104202 */  addu       $v0, $s2, $v0
/* A8B88 800B8388 C400428C */  lw         $v0, 0xC4($v0)
/* A8B8C 800B838C 00000000 */  nop
/* A8B90 800B8390 2C004014 */  bnez       $v0, .L800B8444
/* A8B94 800B8394 21100302 */   addu      $v0, $s0, $v1
.L800B8398:
/* A8B98 800B8398 FFFF4224 */  addiu      $v0, $v0, -0x1
/* A8B9C 800B839C 1A004300 */  div        $zero, $v0, $v1
/* A8BA0 800B83A0 10800000 */  mfhi       $s0
/* A8BA4 800B83A4 00000000 */  nop
/* A8BA8 800B83A8 00111000 */  sll        $v0, $s0, 4
/* A8BAC 800B83AC 21104202 */  addu       $v0, $s2, $v0
/* A8BB0 800B83B0 C400428C */  lw         $v0, 0xC4($v0)
/* A8BB4 800B83B4 00000000 */  nop
/* A8BB8 800B83B8 F7FF4010 */  beqz       $v0, .L800B8398
/* A8BBC 800B83BC 21100302 */   addu      $v0, $s0, $v1
/* A8BC0 800B83C0 11E10208 */  j          .L800B8444
/* A8BC4 800B83C4 00000000 */   nop
.L800B83C8:
/* A8BC8 800B83C8 0400438E */  lw         $v1, 0x4($s2)
/* A8BCC 800B83CC 01000226 */  addiu      $v0, $s0, 0x1
/* A8BD0 800B83D0 1A004300 */  div        $zero, $v0, $v1
/* A8BD4 800B83D4 10800000 */  mfhi       $s0
/* A8BD8 800B83D8 00000000 */  nop
/* A8BDC 800B83DC 00111000 */  sll        $v0, $s0, 4
/* A8BE0 800B83E0 21104202 */  addu       $v0, $s2, $v0
/* A8BE4 800B83E4 C400428C */  lw         $v0, 0xC4($v0)
/* A8BE8 800B83E8 00000000 */  nop
/* A8BEC 800B83EC 15004014 */  bnez       $v0, .L800B8444
/* A8BF0 800B83F0 01000226 */   addiu     $v0, $s0, 0x1
.L800B83F4:
/* A8BF4 800B83F4 1A004300 */  div        $zero, $v0, $v1
/* A8BF8 800B83F8 10800000 */  mfhi       $s0
/* A8BFC 800B83FC 00000000 */  nop
/* A8C00 800B8400 00111000 */  sll        $v0, $s0, 4
/* A8C04 800B8404 21104202 */  addu       $v0, $s2, $v0
/* A8C08 800B8408 C400428C */  lw         $v0, 0xC4($v0)
/* A8C0C 800B840C 00000000 */  nop
/* A8C10 800B8410 F8FF4010 */  beqz       $v0, .L800B83F4
/* A8C14 800B8414 01000226 */   addiu     $v0, $s0, 0x1
/* A8C18 800B8418 11E10208 */  j          .L800B8444
/* A8C1C 800B841C 00000000 */   nop
.L800B8420:
/* A8C20 800B8420 0000428E */  lw         $v0, 0x0($s2)
/* A8C24 800B8424 00000000 */  nop
/* A8C28 800B8428 02004228 */  slti       $v0, $v0, 0x2
/* A8C2C 800B842C 05004014 */  bnez       $v0, .L800B8444
/* A8C30 800B8430 00000000 */   nop
/* A8C34 800B8434 6FE1020C */  jal        menu_sound
/* A8C38 800B8438 05000424 */   addiu     $a0, $zero, 0x5
/* A8C3C 800B843C 0ADE020C */  jal        menu_pop
/* A8C40 800B8440 21204002 */   addu      $a0, $s2, $zero
.L800B8444:
/* A8C44 800B8444 0400828E */  lw         $v0, 0x4($s4)
/* A8C48 800B8448 00000000 */  nop
/* A8C4C 800B844C 03000212 */  beq        $s0, $v0, .L800B845C
/* A8C50 800B8450 00000000 */   nop
/* A8C54 800B8454 6FE1020C */  jal        menu_sound
/* A8C58 800B8458 02000424 */   addiu     $a0, $zero, 0x2
.L800B845C:
/* A8C5C 800B845C 040090AE */  sw         $s0, 0x4($s4)
.L800B8460:
/* A8C60 800B8460 2400BF8F */  lw         $ra, 0x24($sp)
/* A8C64 800B8464 2000B48F */  lw         $s4, 0x20($sp)
/* A8C68 800B8468 1C00B38F */  lw         $s3, 0x1C($sp)
/* A8C6C 800B846C 1800B28F */  lw         $s2, 0x18($sp)
/* A8C70 800B8470 1400B18F */  lw         $s1, 0x14($sp)
/* A8C74 800B8474 1000B08F */  lw         $s0, 0x10($sp)
/* A8C78 800B8478 0800E003 */  jr         $ra
/* A8C7C 800B847C 2800BD27 */   addiu     $sp, $sp, 0x28
.size menu_run, . - menu_run
