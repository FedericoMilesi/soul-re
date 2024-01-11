.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StateHandlerStopMove
/* 9BA7C 800AB27C D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 9BA80 800AB280 1800B0AF */  sw         $s0, 0x18($sp)
/* 9BA84 800AB284 21808000 */  addu       $s0, $a0, $zero
/* 9BA88 800AB288 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 9BA8C 800AB28C 2188A000 */  addu       $s1, $a1, $zero
/* 9BA90 800AB290 2800B4AF */  sw         $s4, 0x28($sp)
/* 9BA94 800AB294 21A0C000 */  addu       $s4, $a2, $zero
/* 9BA98 800AB298 C0101100 */  sll        $v0, $s1, 3
/* 9BA9C 800AB29C 21105100 */  addu       $v0, $v0, $s1
/* 9BAA0 800AB2A0 C0100200 */  sll        $v0, $v0, 3
/* 9BAA4 800AB2A4 23105100 */  subu       $v0, $v0, $s1
/* 9BAA8 800AB2A8 80100200 */  sll        $v0, $v0, 2
/* 9BAAC 800AB2AC 08004224 */  addiu      $v0, $v0, 0x8
/* 9BAB0 800AB2B0 2000B2AF */  sw         $s2, 0x20($sp)
/* 9BAB4 800AB2B4 21900202 */  addu       $s2, $s0, $v0
/* 9BAB8 800AB2B8 2400B3AF */  sw         $s3, 0x24($sp)
/* 9BABC 800AB2BC FFFF1324 */  addiu      $s3, $zero, -0x1
/* 9BAC0 800AB2C0 2C00BFAF */  sw         $ra, 0x2C($sp)
.L800AB2C4:
/* 9BAC4 800AB2C4 39C3010C */  jal        PeekMessageQueue
/* 9BAC8 800AB2C8 04004426 */   addiu     $a0, $s2, 0x4
/* 9BACC 800AB2CC 21284000 */  addu       $a1, $v0, $zero
/* 9BAD0 800AB2D0 AE00A010 */  beqz       $a1, .L800AB58C
/* 9BAD4 800AB2D4 0002023C */   lui       $v0, (0x2000000 >> 16)
/* 9BAD8 800AB2D8 0000A38C */  lw         $v1, 0x0($a1)
/* 9BADC 800AB2DC 00000000 */  nop
/* 9BAE0 800AB2E0 7A006210 */  beq        $v1, $v0, .L800AB4CC
/* 9BAE4 800AB2E4 2A104300 */   slt       $v0, $v0, $v1
/* 9BAE8 800AB2E8 14004014 */  bnez       $v0, .L800AB33C
/* 9BAEC 800AB2EC 0008023C */   lui       $v0, (0x8000001 >> 16)
/* 9BAF0 800AB2F0 0080023C */  lui        $v0, (0x80000002 >> 16)
/* 9BAF4 800AB2F4 02004234 */  ori        $v0, $v0, (0x80000002 & 0xFFFF)
/* 9BAF8 800AB2F8 74006210 */  beq        $v1, $v0, .L800AB4CC
/* 9BAFC 800AB2FC 2A104300 */   slt       $v0, $v0, $v1
/* 9BB00 800AB300 06004014 */  bnez       $v0, .L800AB31C
/* 9BB04 800AB304 0080023C */   lui       $v0, (0x80000001 >> 16)
/* 9BB08 800AB308 01004234 */  ori        $v0, $v0, (0x80000001 & 0xFFFF)
/* 9BB0C 800AB30C 82006210 */  beq        $v1, $v0, .L800AB518
/* 9BB10 800AB310 21200002 */   addu      $a0, $s0, $zero
/* 9BB14 800AB314 5DAD0208 */  j          .L800AB574
/* 9BB18 800AB318 21282002 */   addu      $a1, $s1, $zero
.L800AB31C:
/* 9BB1C 800AB31C 10004234 */  ori        $v0, $v0, (0x80000010 & 0xFFFF)
/* 9BB20 800AB320 6A006210 */  beq        $v1, $v0, .L800AB4CC
/* 9BB24 800AB324 1000023C */   lui       $v0, (0x100001 >> 16)
/* 9BB28 800AB328 01004234 */  ori        $v0, $v0, (0x100001 & 0xFFFF)
/* 9BB2C 800AB32C 14006210 */  beq        $v1, $v0, .L800AB380
/* 9BB30 800AB330 21200002 */   addu      $a0, $s0, $zero
/* 9BB34 800AB334 5DAD0208 */  j          .L800AB574
/* 9BB38 800AB338 21282002 */   addu      $a1, $s1, $zero
.L800AB33C:
/* 9BB3C 800AB33C 01004234 */  ori        $v0, $v0, (0x8000001 & 0xFFFF)
/* 9BB40 800AB340 2A104300 */  slt        $v0, $v0, $v1
/* 9BB44 800AB344 0A004014 */  bnez       $v0, .L800AB370
/* 9BB48 800AB348 0010023C */   lui       $v0, (0x10000000 >> 16)
/* 9BB4C 800AB34C 0008023C */  lui        $v0, (0x8000000 >> 16)
/* 9BB50 800AB350 2A106200 */  slt        $v0, $v1, $v0
/* 9BB54 800AB354 63004010 */  beqz       $v0, .L800AB4E4
/* 9BB58 800AB358 0104023C */   lui       $v0, (0x4010080 >> 16)
/* 9BB5C 800AB35C 80004234 */  ori        $v0, $v0, (0x4010080 & 0xFFFF)
/* 9BB60 800AB360 41006210 */  beq        $v1, $v0, .L800AB468
/* 9BB64 800AB364 21200002 */   addu      $a0, $s0, $zero
/* 9BB68 800AB368 5DAD0208 */  j          .L800AB574
/* 9BB6C 800AB36C 21282002 */   addu      $a1, $s1, $zero
.L800AB370:
/* 9BB70 800AB370 36006210 */  beq        $v1, $v0, .L800AB44C
/* 9BB74 800AB374 21200002 */   addu      $a0, $s0, $zero
/* 9BB78 800AB378 5DAD0208 */  j          .L800AB574
/* 9BB7C 800AB37C 21282002 */   addu      $a1, $s1, $zero
.L800AB380:
/* 9BB80 800AB380 10002016 */  bnez       $s1, .L800AB3C4
/* 9BB84 800AB384 04000224 */   addiu     $v0, $zero, 0x4
/* 9BB88 800AB388 90F982AF */  sw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 9BB8C 800AB38C C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 9BB90 800AB390 8000033C */  lui        $v1, (0x800000 >> 16)
/* 9BB94 800AB394 24104300 */  and        $v0, $v0, $v1
/* 9BB98 800AB398 04004010 */  beqz       $v0, .L800AB3AC
/* 9BB9C 800AB39C 00000000 */   nop
/* 9BBA0 800AB3A0 C8FD83AF */  sw         $v1, %gp_rel(ControlFlag)($gp)
/* 9BBA4 800AB3A4 ECAC0208 */  j          .L800AB3B0
/* 9BBA8 800AB3A8 00000000 */   nop
.L800AB3AC:
/* 9BBAC 800AB3AC C8FD80AF */  sw         $zero, %gp_rel(ControlFlag)($gp)
.L800AB3B0:
/* 9BBB0 800AB3B0 C8FD838F */  lw         $v1, %gp_rel(ControlFlag)($gp)
/* 9BBB4 800AB3B4 03000224 */  addiu      $v0, $zero, 0x3
/* 9BBB8 800AB3B8 30FD82AF */  sw         $v0, %gp_rel(PhysicsMode)($gp)
/* 9BBBC 800AB3BC 19216334 */  ori        $v1, $v1, 0x2119
/* 9BBC0 800AB3C0 C8FD83AF */  sw         $v1, %gp_rel(ControlFlag)($gp)
.L800AB3C4:
/* 9BBC4 800AB3C4 0400A58C */  lw         $a1, 0x4($a1)
/* 9BBC8 800AB3C8 3C000224 */  addiu      $v0, $zero, 0x3C
/* 9BBCC 800AB3CC 0B00A214 */  bne        $a1, $v0, .L800AB3FC
/* 9BBD0 800AB3D0 1E000224 */   addiu     $v0, $zero, 0x1E
/* 9BBD4 800AB3D4 21282002 */  addu       $a1, $s1, $zero
/* 9BBD8 800AB3D8 58000624 */  addiu      $a2, $zero, 0x58
/* 9BBDC 800AB3DC 1000B3AF */  sw         $s3, 0x10($sp)
/* 9BBE0 800AB3E0 0000048E */  lw         $a0, 0x0($s0)
/* 9BBE4 800AB3E4 5E9C020C */  jal        razSwitchVAnimGroup
/* 9BBE8 800AB3E8 FFFF0724 */   addiu     $a3, $zero, -0x1
/* 9BBEC 800AB3EC 63004010 */  beqz       $v0, .L800AB57C
/* 9BBF0 800AB3F0 21282002 */   addu      $a1, $s1, $zero
/* 9BBF4 800AB3F4 0AAD0208 */  j          .L800AB428
/* 9BBF8 800AB3F8 02000624 */   addiu     $a2, $zero, 0x2
.L800AB3FC:
/* 9BBFC 800AB3FC 1000A214 */  bne        $a1, $v0, .L800AB440
/* 9BC00 800AB400 21200000 */   addu      $a0, $zero, $zero
/* 9BC04 800AB404 21282002 */  addu       $a1, $s1, $zero
/* 9BC08 800AB408 5C000624 */  addiu      $a2, $zero, 0x5C
/* 9BC0C 800AB40C 1000B3AF */  sw         $s3, 0x10($sp)
/* 9BC10 800AB410 0000048E */  lw         $a0, 0x0($s0)
/* 9BC14 800AB414 5E9C020C */  jal        razSwitchVAnimGroup
/* 9BC18 800AB418 FFFF0724 */   addiu     $a3, $zero, -0x1
/* 9BC1C 800AB41C 57004010 */  beqz       $v0, .L800AB57C
/* 9BC20 800AB420 21282002 */   addu      $a1, $s1, $zero
/* 9BC24 800AB424 03000624 */  addiu      $a2, $zero, 0x3
.L800AB428:
/* 9BC28 800AB428 1000B3AF */  sw         $s3, 0x10($sp)
/* 9BC2C 800AB42C 0000048E */  lw         $a0, 0x0($s0)
/* 9BC30 800AB430 A39C020C */  jal        razSwitchVAnimSingle
/* 9BC34 800AB434 FFFF0724 */   addiu     $a3, $zero, -0x1
/* 9BC38 800AB438 5FAD0208 */  j          .L800AB57C
/* 9BC3C 800AB43C 00000000 */   nop
.L800AB440:
/* 9BC40 800AB440 21288000 */  addu       $a1, $a0, $zero
/* 9BC44 800AB444 3CAD0208 */  j          .L800AB4F0
/* 9BC48 800AB448 06000624 */   addiu     $a2, $zero, 0x6
.L800AB44C:
/* 9BC4C 800AB44C 21282002 */  addu       $a1, $s1, $zero
/* 9BC50 800AB450 0B80063C */  lui        $a2, %hi(StateHandlerStartMove)
/* 9BC54 800AB454 C4A2C624 */  addiu      $a2, $a2, %lo(StateHandlerStartMove)
/* 9BC58 800AB458 C1CA010C */  jal        StateSwitchStateData
/* 9BC5C 800AB45C 21380000 */   addu      $a3, $zero, $zero
/* 9BC60 800AB460 5FAD0208 */  j          .L800AB57C
/* 9BC64 800AB464 00000000 */   nop
.L800AB468:
/* 9BC68 800AB468 44002016 */  bnez       $s1, .L800AB57C
/* 9BC6C 800AB46C 00000000 */   nop
/* 9BC70 800AB470 0400A28C */  lw         $v0, 0x4($a1)
/* 9BC74 800AB474 00000000 */  nop
/* 9BC78 800AB478 0F004014 */  bnez       $v0, .L800AB4B8
/* 9BC7C 800AB47C 00000000 */   nop
/* 9BC80 800AB480 0000048E */  lw         $a0, 0x0($s0)
/* 9BC84 800AB484 E098020C */  jal        razSetPauseTranslation
/* 9BC88 800AB488 00000000 */   nop
/* 9BC8C 800AB48C 21200000 */  addu       $a0, $zero, $zero
/* 9BC90 800AB490 21288000 */  addu       $a1, $a0, $zero
/* 9BC94 800AB494 4FC6010C */  jal        SetControlInitIdleData
/* 9BC98 800AB498 05000624 */   addiu     $a2, $zero, 0x5
/* 9BC9C 800AB49C 21200002 */  addu       $a0, $s0, $zero
/* 9BCA0 800AB4A0 0B80053C */  lui        $a1, %hi(StateHandlerIdle)
/* 9BCA4 800AB4A4 E084A524 */  addiu      $a1, $a1, %lo(StateHandlerIdle)
/* 9BCA8 800AB4A8 F4CA010C */  jal        StateSwitchStateCharacterData
/* 9BCAC 800AB4AC 21304000 */   addu      $a2, $v0, $zero
/* 9BCB0 800AB4B0 5FAD0208 */  j          .L800AB57C
/* 9BCB4 800AB4B4 00000000 */   nop
.L800AB4B8:
/* 9BCB8 800AB4B8 0000048E */  lw         $a0, 0x0($s0)
/* 9BCBC 800AB4BC FD98020C */  jal        razResetPauseTranslation
/* 9BCC0 800AB4C0 00000000 */   nop
/* 9BCC4 800AB4C4 5FAD0208 */  j          .L800AB57C
/* 9BCC8 800AB4C8 00000000 */   nop
.L800AB4CC:
/* 9BCCC 800AB4CC 8C004426 */  addiu      $a0, $s2, 0x8C
/* 9BCD0 800AB4D0 0000A58C */  lw         $a1, 0x0($a1)
/* 9BCD4 800AB4D4 4EC3010C */  jal        EnMessageQueueData
/* 9BCD8 800AB4D8 21300000 */   addu      $a2, $zero, $zero
/* 9BCDC 800AB4DC 5FAD0208 */  j          .L800AB57C
/* 9BCE0 800AB4E0 00000000 */   nop
.L800AB4E4:
/* 9BCE4 800AB4E4 21200000 */  addu       $a0, $zero, $zero
/* 9BCE8 800AB4E8 21288000 */  addu       $a1, $a0, $zero
/* 9BCEC 800AB4EC 05000624 */  addiu      $a2, $zero, 0x5
.L800AB4F0:
/* 9BCF0 800AB4F0 4FC6010C */  jal        SetControlInitIdleData
/* 9BCF4 800AB4F4 00000000 */   nop
/* 9BCF8 800AB4F8 21200002 */  addu       $a0, $s0, $zero
/* 9BCFC 800AB4FC 21282002 */  addu       $a1, $s1, $zero
/* 9BD00 800AB500 0B80063C */  lui        $a2, %hi(StateHandlerIdle)
/* 9BD04 800AB504 E084C624 */  addiu      $a2, $a2, %lo(StateHandlerIdle)
/* 9BD08 800AB508 C1CA010C */  jal        StateSwitchStateData
/* 9BD0C 800AB50C 21384000 */   addu      $a3, $v0, $zero
/* 9BD10 800AB510 5FAD0208 */  j          .L800AB57C
/* 9BD14 800AB514 00000000 */   nop
.L800AB518:
/* 9BD18 800AB518 18002016 */  bnez       $s1, .L800AB57C
/* 9BD1C 800AB51C 21280000 */   addu      $a1, $zero, $zero
/* 9BD20 800AB520 2130A000 */  addu       $a2, $a1, $zero
/* 9BD24 800AB524 10000224 */  addiu      $v0, $zero, 0x10
/* 9BD28 800AB528 90F982AF */  sw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 9BD2C 800AB52C 0000048E */  lw         $a0, 0x0($s0)
/* 9BD30 800AB530 2F9C020C */  jal        razSwitchVAnimCharacterGroup
/* 9BD34 800AB534 2138A000 */   addu      $a3, $a1, $zero
/* 9BD38 800AB538 07004010 */  beqz       $v0, .L800AB558
/* 9BD3C 800AB53C 01000224 */   addiu     $v0, $zero, 0x1
/* 9BD40 800AB540 1000A2AF */  sw         $v0, 0x10($sp)
/* 9BD44 800AB544 21200002 */  addu       $a0, $s0, $zero
/* 9BD48 800AB548 1A000524 */  addiu      $a1, $zero, 0x1A
/* 9BD4C 800AB54C 21300000 */  addu       $a2, $zero, $zero
/* 9BD50 800AB550 FCC8010C */  jal        G2EmulationSwitchAnimationCharacter
/* 9BD54 800AB554 2138C000 */   addu      $a3, $a2, $zero
.L800AB558:
/* 9BD58 800AB558 21200002 */  addu       $a0, $s0, $zero
/* 9BD5C 800AB55C 0B80053C */  lui        $a1, %hi(StateHandlerCompression)
/* 9BD60 800AB560 ACB5A524 */  addiu      $a1, $a1, %lo(StateHandlerCompression)
/* 9BD64 800AB564 F4CA010C */  jal        StateSwitchStateCharacterData
/* 9BD68 800AB568 21300000 */   addu      $a2, $zero, $zero
/* 9BD6C 800AB56C 5FAD0208 */  j          .L800AB57C
/* 9BD70 800AB570 00000000 */   nop
.L800AB574:
/* 9BD74 800AB574 B9BF020C */  jal        DefaultStateHandler
/* 9BD78 800AB578 21308002 */   addu      $a2, $s4, $zero
.L800AB57C:
/* 9BD7C 800AB57C 27C3010C */  jal        DeMessageQueue
/* 9BD80 800AB580 04004426 */   addiu     $a0, $s2, 0x4
/* 9BD84 800AB584 B1AC0208 */  j          .L800AB2C4
/* 9BD88 800AB588 00000000 */   nop
.L800AB58C:
/* 9BD8C 800AB58C 2C00BF8F */  lw         $ra, 0x2C($sp)
/* 9BD90 800AB590 2800B48F */  lw         $s4, 0x28($sp)
/* 9BD94 800AB594 2400B38F */  lw         $s3, 0x24($sp)
/* 9BD98 800AB598 2000B28F */  lw         $s2, 0x20($sp)
/* 9BD9C 800AB59C 1C00B18F */  lw         $s1, 0x1C($sp)
/* 9BDA0 800AB5A0 1800B08F */  lw         $s0, 0x18($sp)
/* 9BDA4 800AB5A4 0800E003 */  jr         $ra
/* 9BDA8 800AB5A8 3000BD27 */   addiu     $sp, $sp, 0x30
.size StateHandlerStopMove, . - StateHandlerStopMove
