.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StateInitIdle
/* 98A3C 800A823C D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 98A40 800A8240 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 98A44 800A8244 21888000 */  addu       $s1, $a0, $zero
/* 98A48 800A8248 2000B2AF */  sw         $s2, 0x20($sp)
/* 98A4C 800A824C 2190A000 */  addu       $s2, $a1, $zero
/* 98A50 800A8250 1800B0AF */  sw         $s0, 0x18($sp)
/* 98A54 800A8254 2180C000 */  addu       $s0, $a2, $zero
/* 98A58 800A8258 06000016 */  bnez       $s0, .L800A8274
/* 98A5C 800A825C 2400BFAF */   sw        $ra, 0x24($sp)
/* 98A60 800A8260 21200000 */  addu       $a0, $zero, $zero
/* 98A64 800A8264 21288000 */  addu       $a1, $a0, $zero
/* 98A68 800A8268 4FC6010C */  jal        SetControlInitIdleData
/* 98A6C 800A826C 03000624 */   addiu     $a2, $zero, 0x3
/* 98A70 800A8270 21804000 */  addu       $s0, $v0, $zero
.L800A8274:
/* 98A74 800A8274 2F97020C */  jal        razGetHeldWeapon
/* 98A78 800A8278 00000000 */   nop
/* 98A7C 800A827C 0000038E */  lw         $v1, 0x0($s0)
/* 98A80 800A8280 02000824 */  addiu      $t0, $zero, 0x2
/* 98A84 800A8284 11006814 */  bne        $v1, $t0, .L800A82CC
/* 98A88 800A8288 21204000 */   addu      $a0, $v0, $zero
/* 98A8C 800A828C 21284002 */  addu       $a1, $s2, $zero
/* 98A90 800A8290 60000624 */  addiu      $a2, $zero, 0x60
/* 98A94 800A8294 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 98A98 800A8298 1000A2AF */  sw         $v0, 0x10($sp)
/* 98A9C 800A829C 0000248E */  lw         $a0, 0x0($s1)
/* 98AA0 800A82A0 5E9C020C */  jal        razSwitchVAnimGroup
/* 98AA4 800A82A4 21384000 */   addu      $a3, $v0, $zero
/* 98AA8 800A82A8 87004010 */  beqz       $v0, .L800A84C8
/* 98AAC 800A82AC 21202002 */   addu      $a0, $s1, $zero
/* 98AB0 800A82B0 21284002 */  addu       $a1, $s2, $zero
/* 98AB4 800A82B4 8C000624 */  addiu      $a2, $zero, 0x8C
/* 98AB8 800A82B8 21380000 */  addu       $a3, $zero, $zero
/* 98ABC 800A82BC 01000224 */  addiu      $v0, $zero, 0x1
/* 98AC0 800A82C0 1000A0AF */  sw         $zero, 0x10($sp)
/* 98AC4 800A82C4 30A10208 */  j          .L800A84C0
/* 98AC8 800A82C8 1400A2AF */   sw        $v0, 0x14($sp)
.L800A82CC:
/* 98ACC 800A82CC 03000524 */  addiu      $a1, $zero, 0x3
/* 98AD0 800A82D0 11006514 */  bne        $v1, $a1, .L800A8318
/* 98AD4 800A82D4 04000224 */   addiu     $v0, $zero, 0x4
/* 98AD8 800A82D8 21284002 */  addu       $a1, $s2, $zero
/* 98ADC 800A82DC 64000624 */  addiu      $a2, $zero, 0x64
/* 98AE0 800A82E0 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 98AE4 800A82E4 1000A2AF */  sw         $v0, 0x10($sp)
/* 98AE8 800A82E8 0000248E */  lw         $a0, 0x0($s1)
/* 98AEC 800A82EC 5E9C020C */  jal        razSwitchVAnimGroup
/* 98AF0 800A82F0 21384000 */   addu      $a3, $v0, $zero
/* 98AF4 800A82F4 74004010 */  beqz       $v0, .L800A84C8
/* 98AF8 800A82F8 21202002 */   addu      $a0, $s1, $zero
/* 98AFC 800A82FC 21284002 */  addu       $a1, $s2, $zero
/* 98B00 800A8300 8D000624 */  addiu      $a2, $zero, 0x8D
/* 98B04 800A8304 21380000 */  addu       $a3, $zero, $zero
/* 98B08 800A8308 01000224 */  addiu      $v0, $zero, 0x1
/* 98B0C 800A830C 1000A0AF */  sw         $zero, 0x10($sp)
/* 98B10 800A8310 30A10208 */  j          .L800A84C0
/* 98B14 800A8314 1400A2AF */   sw        $v0, 0x14($sp)
.L800A8318:
/* 98B18 800A8318 10006214 */  bne        $v1, $v0, .L800A835C
/* 98B1C 800A831C 68000624 */   addiu     $a2, $zero, 0x68
/* 98B20 800A8320 21284002 */  addu       $a1, $s2, $zero
/* 98B24 800A8324 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 98B28 800A8328 1000A2AF */  sw         $v0, 0x10($sp)
/* 98B2C 800A832C 0000248E */  lw         $a0, 0x0($s1)
/* 98B30 800A8330 5E9C020C */  jal        razSwitchVAnimGroup
/* 98B34 800A8334 21384000 */   addu      $a3, $v0, $zero
/* 98B38 800A8338 63004010 */  beqz       $v0, .L800A84C8
/* 98B3C 800A833C 21202002 */   addu      $a0, $s1, $zero
/* 98B40 800A8340 21284002 */  addu       $a1, $s2, $zero
/* 98B44 800A8344 8E000624 */  addiu      $a2, $zero, 0x8E
/* 98B48 800A8348 21380000 */  addu       $a3, $zero, $zero
/* 98B4C 800A834C 01000224 */  addiu      $v0, $zero, 0x1
/* 98B50 800A8350 1000A0AF */  sw         $zero, 0x10($sp)
/* 98B54 800A8354 30A10208 */  j          .L800A84C0
/* 98B58 800A8358 1400A2AF */   sw        $v0, 0x14($sp)
.L800A835C:
/* 98B5C 800A835C 03008010 */  beqz       $a0, .L800A836C
/* 98B60 800A8360 01000224 */   addiu     $v0, $zero, 0x1
/* 98B64 800A8364 0C004212 */  beq        $s2, $v0, .L800A8398
/* 98B68 800A8368 FEFF6224 */   addiu     $v0, $v1, -0x2
.L800A836C:
/* 98B6C 800A836C 05006014 */  bnez       $v1, .L800A8384
/* 98B70 800A8370 01000224 */   addiu     $v0, $zero, 0x1
/* 98B74 800A8374 21202002 */  addu       $a0, $s1, $zero
/* 98B78 800A8378 21284002 */  addu       $a1, $s2, $zero
/* 98B7C 800A837C 2CA10208 */  j          .L800A84B0
/* 98B80 800A8380 21300000 */   addu      $a2, $zero, $zero
.L800A8384:
/* 98B84 800A8384 50006214 */  bne        $v1, $v0, .L800A84C8
/* 98B88 800A8388 21202002 */   addu      $a0, $s1, $zero
/* 98B8C 800A838C 21284002 */  addu       $a1, $s2, $zero
/* 98B90 800A8390 2CA10208 */  j          .L800A84B0
/* 98B94 800A8394 37000624 */   addiu     $a2, $zero, 0x37
.L800A8398:
/* 98B98 800A8398 0300422C */  sltiu      $v0, $v0, 0x3
/* 98B9C 800A839C 02004010 */  beqz       $v0, .L800A83A8
/* 98BA0 800A83A0 00000000 */   nop
/* 98BA4 800A83A4 000000AE */  sw         $zero, 0x0($s0)
.L800A83A8:
/* 98BA8 800A83A8 1CFA838F */  lw         $v1, %gp_rel(Raziel + 0x3EC)($gp)
/* 98BAC 800A83AC 00000000 */  nop
/* 98BB0 800A83B0 32006810 */  beq        $v1, $t0, .L800A847C
/* 98BB4 800A83B4 02000924 */   addiu     $t1, $zero, 0x2
/* 98BB8 800A83B8 0300622C */  sltiu      $v0, $v1, 0x3
/* 98BBC 800A83BC 07004010 */  beqz       $v0, .L800A83DC
/* 98BC0 800A83C0 00000000 */   nop
/* 98BC4 800A83C4 40006010 */  beqz       $v1, .L800A84C8
/* 98BC8 800A83C8 00000000 */   nop
/* 98BCC 800A83CC 09007210 */  beq        $v1, $s2, .L800A83F4
/* 98BD0 800A83D0 00000000 */   nop
/* 98BD4 800A83D4 32A10208 */  j          .L800A84C8
/* 98BD8 800A83D8 00000000 */   nop
.L800A83DC:
/* 98BDC 800A83DC 31006510 */  beq        $v1, $a1, .L800A84A4
/* 98BE0 800A83E0 00100224 */   addiu     $v0, $zero, 0x1000
/* 98BE4 800A83E4 10006210 */  beq        $v1, $v0, .L800A8428
/* 98BE8 800A83E8 00000000 */   nop
/* 98BEC 800A83EC 32A10208 */  j          .L800A84C8
/* 98BF0 800A83F0 00000000 */   nop
.L800A83F4:
/* 98BF4 800A83F4 0000028E */  lw         $v0, 0x0($s0)
/* 98BF8 800A83F8 00000000 */  nop
/* 98BFC 800A83FC 04004014 */  bnez       $v0, .L800A8410
/* 98C00 800A8400 21202002 */   addu      $a0, $s1, $zero
/* 98C04 800A8404 01000524 */  addiu      $a1, $zero, 0x1
/* 98C08 800A8408 2CA10208 */  j          .L800A84B0
/* 98C0C 800A840C 32000624 */   addiu     $a2, $zero, 0x32
.L800A8410:
/* 98C10 800A8410 01000524 */  addiu      $a1, $zero, 0x1
/* 98C14 800A8414 7F000624 */  addiu      $a2, $zero, 0x7F
/* 98C18 800A8418 0800028E */  lw         $v0, 0x8($s0)
/* 98C1C 800A841C 21380000 */  addu       $a3, $zero, $zero
/* 98C20 800A8420 2FA10208 */  j          .L800A84BC
/* 98C24 800A8424 1400A9AF */   sw        $t1, 0x14($sp)
.L800A8428:
/* 98C28 800A8428 0000028E */  lw         $v0, 0x0($s0)
/* 98C2C 800A842C 00000000 */  nop
/* 98C30 800A8430 0C004014 */  bnez       $v0, .L800A8464
/* 98C34 800A8434 21202002 */   addu      $a0, $s1, $zero
/* 98C38 800A8438 01000524 */  addiu      $a1, $zero, 0x1
/* 98C3C 800A843C 75000624 */  addiu      $a2, $zero, 0x75
/* 98C40 800A8440 0800028E */  lw         $v0, 0x8($s0)
/* 98C44 800A8444 21380000 */  addu       $a3, $zero, $zero
/* 98C48 800A8448 1400A9AF */  sw         $t1, 0x14($sp)
/* 98C4C 800A844C 20C8010C */  jal        G2EmulationSwitchAnimation
/* 98C50 800A8450 1000A2AF */   sw        $v0, 0x10($sp)
/* 98C54 800A8454 0698020C */  jal        razReaverScale
/* 98C58 800A8458 F00A0424 */   addiu     $a0, $zero, 0xAF0
/* 98C5C 800A845C 32A10208 */  j          .L800A84C8
/* 98C60 800A8460 00000000 */   nop
.L800A8464:
/* 98C64 800A8464 01000524 */  addiu      $a1, $zero, 0x1
/* 98C68 800A8468 89000624 */  addiu      $a2, $zero, 0x89
/* 98C6C 800A846C 0800028E */  lw         $v0, 0x8($s0)
/* 98C70 800A8470 21380000 */  addu       $a3, $zero, $zero
/* 98C74 800A8474 2FA10208 */  j          .L800A84BC
/* 98C78 800A8478 1400A9AF */   sw        $t1, 0x14($sp)
.L800A847C:
/* 98C7C 800A847C 0000028E */  lw         $v0, 0x0($s0)
/* 98C80 800A8480 00000000 */  nop
/* 98C84 800A8484 04004014 */  bnez       $v0, .L800A8498
/* 98C88 800A8488 21202002 */   addu      $a0, $s1, $zero
/* 98C8C 800A848C 01000524 */  addiu      $a1, $zero, 0x1
/* 98C90 800A8490 2CA10208 */  j          .L800A84B0
/* 98C94 800A8494 54000624 */   addiu     $a2, $zero, 0x54
.L800A8498:
/* 98C98 800A8498 01000524 */  addiu      $a1, $zero, 0x1
/* 98C9C 800A849C 2CA10208 */  j          .L800A84B0
/* 98CA0 800A84A0 7E000624 */   addiu     $a2, $zero, 0x7E
.L800A84A4:
/* 98CA4 800A84A4 21202002 */  addu       $a0, $s1, $zero
/* 98CA8 800A84A8 01000524 */  addiu      $a1, $zero, 0x1
/* 98CAC 800A84AC 62000624 */  addiu      $a2, $zero, 0x62
.L800A84B0:
/* 98CB0 800A84B0 0800028E */  lw         $v0, 0x8($s0)
/* 98CB4 800A84B4 21380000 */  addu       $a3, $zero, $zero
/* 98CB8 800A84B8 1400A8AF */  sw         $t0, 0x14($sp)
.L800A84BC:
/* 98CBC 800A84BC 1000A2AF */  sw         $v0, 0x10($sp)
.L800A84C0:
/* 98CC0 800A84C0 20C8010C */  jal        G2EmulationSwitchAnimation
/* 98CC4 800A84C4 00000000 */   nop
.L800A84C8:
/* 98CC8 800A84C8 2400BF8F */  lw         $ra, 0x24($sp)
/* 98CCC 800A84CC 2000B28F */  lw         $s2, 0x20($sp)
/* 98CD0 800A84D0 1C00B18F */  lw         $s1, 0x1C($sp)
/* 98CD4 800A84D4 1800B08F */  lw         $s0, 0x18($sp)
/* 98CD8 800A84D8 0800E003 */  jr         $ra
/* 98CDC 800A84DC 2800BD27 */   addiu     $sp, $sp, 0x28
.size StateInitIdle, . - StateInitIdle
