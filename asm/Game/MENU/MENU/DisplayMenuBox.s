.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DisplayMenuBox
/* A82F4 800B7AF4 90FFBD27 */  addiu      $sp, $sp, -0x70
/* A82F8 800B7AF8 6C00BFAF */  sw         $ra, 0x6C($sp)
/* A82FC 800B7AFC 6800BEAF */  sw         $fp, 0x68($sp)
/* A8300 800B7B00 6400B7AF */  sw         $s7, 0x64($sp)
/* A8304 800B7B04 6000B6AF */  sw         $s6, 0x60($sp)
/* A8308 800B7B08 5C00B5AF */  sw         $s5, 0x5C($sp)
/* A830C 800B7B0C 5800B4AF */  sw         $s4, 0x58($sp)
/* A8310 800B7B10 5400B3AF */  sw         $s3, 0x54($sp)
/* A8314 800B7B14 5000B2AF */  sw         $s2, 0x50($sp)
/* A8318 800B7B18 4C00B1AF */  sw         $s1, 0x4C($sp)
/* A831C 800B7B1C 4800B0AF */  sw         $s0, 0x48($sp)
/* A8320 800B7B20 21B80000 */  addu       $s7, $zero, $zero
/* A8324 800B7B24 F4FF8424 */  addiu      $a0, $a0, -0xC
/* A8328 800B7B28 0C00A524 */  addiu      $a1, $a1, 0xC
/* A832C 800B7B2C 9CBF838F */  lw         $v1, %gp_rel(gameTrackerX + 0x1D4)($gp)
/* A8330 800B7B30 FBFFC224 */  addiu      $v0, $a2, -0x5
/* A8334 800B7B34 4000A2AF */  sw         $v0, 0x40($sp)
/* A8338 800B7B38 0500E224 */  addiu      $v0, $a3, 0x5
/* A833C 800B7B3C 4400A2AF */  sw         $v0, 0x44($sp)
/* A8340 800B7B40 64A9828F */  lw         $v0, %gp_rel(D_800D1EFC)($gp)
/* A8344 800B7B44 08BE948F */  lw         $s4, %gp_rel(gameTrackerX + 0x40)($gp)
/* A8348 800B7B48 2338E600 */  subu       $a3, $a3, $a2
/* A834C 800B7B4C 3800A4AF */  sw         $a0, 0x38($sp)
/* A8350 800B7B50 3C00A5AF */  sw         $a1, 0x3C($sp)
/* A8354 800B7B54 40100200 */  sll        $v0, $v0, 1
/* A8358 800B7B58 2A10E200 */  slt        $v0, $a3, $v0
/* A835C 800B7B5C 09004010 */  beqz       $v0, .L800B7B84
/* A8360 800B7B60 04007524 */   addiu     $s5, $v1, 0x4
/* A8364 800B7B64 64A98327 */  addiu      $v1, $gp, %gp_rel(D_800D1EFC)
.L800B7B68:
/* A8368 800B7B68 04006324 */  addiu      $v1, $v1, 0x4
/* A836C 800B7B6C 0000628C */  lw         $v0, 0x0($v1)
/* A8370 800B7B70 00000000 */  nop
/* A8374 800B7B74 40100200 */  sll        $v0, $v0, 1
/* A8378 800B7B78 2A10E200 */  slt        $v0, $a3, $v0
/* A837C 800B7B7C FAFF4014 */  bnez       $v0, .L800B7B68
/* A8380 800B7B80 0100F726 */   addiu     $s7, $s7, 0x1
.L800B7B84:
/* A8384 800B7B84 21B00000 */  addu       $s6, $zero, $zero
/* A8388 800B7B88 64A99E27 */  addiu      $fp, $gp, %gp_rel(D_800D1EFC)
/* A838C 800B7B8C 2198E002 */  addu       $s3, $s7, $zero
.L800B7B90:
/* A8390 800B7B90 0F00622A */  slti       $v0, $s3, 0xF
/* A8394 800B7B94 3F004010 */  beqz       $v0, .L800B7C94
/* A8398 800B7B98 01007226 */   addiu     $s2, $s3, 0x1
.L800B7B9C:
/* A839C 800B7B9C 80801300 */  sll        $s0, $s3, 2
/* A83A0 800B7BA0 21801E02 */  addu       $s0, $s0, $fp
/* A83A4 800B7BA4 80881200 */  sll        $s1, $s2, 2
/* A83A8 800B7BA8 21883E02 */  addu       $s1, $s1, $fp
/* A83AC 800B7BAC 3800A68F */  lw         $a2, 0x38($sp)
/* A83B0 800B7BB0 4400A88F */  lw         $t0, 0x44($sp)
/* A83B4 800B7BB4 0000058E */  lw         $a1, 0x0($s0)
/* A83B8 800B7BB8 0000278E */  lw         $a3, 0x0($s1)
/* A83BC 800B7BBC 2120D300 */  addu       $a0, $a2, $s3
/* A83C0 800B7BC0 23280501 */  subu       $a1, $t0, $a1
/* A83C4 800B7BC4 1000A4AF */  sw         $a0, 0x10($sp)
/* A83C8 800B7BC8 4000A28F */  lw         $v0, 0x40($sp)
/* A83CC 800B7BCC 0000038E */  lw         $v1, 0x0($s0)
/* A83D0 800B7BD0 23380701 */  subu       $a3, $t0, $a3
/* A83D4 800B7BD4 21104300 */  addu       $v0, $v0, $v1
/* A83D8 800B7BD8 1400A2AF */  sw         $v0, 0x14($sp)
/* A83DC 800B7BDC 2110C000 */  addu       $v0, $a2, $zero
/* A83E0 800B7BE0 21105200 */  addu       $v0, $v0, $s2
/* A83E4 800B7BE4 1800A2AF */  sw         $v0, 0x18($sp)
/* A83E8 800B7BE8 4000A28F */  lw         $v0, 0x40($sp)
/* A83EC 800B7BEC 0000238E */  lw         $v1, 0x0($s1)
/* A83F0 800B7BF0 2130D200 */  addu       $a2, $a2, $s2
/* A83F4 800B7BF4 2000A0AF */  sw         $zero, 0x20($sp)
/* A83F8 800B7BF8 2400A0AF */  sw         $zero, 0x24($sp)
/* A83FC 800B7BFC 2800A0AF */  sw         $zero, 0x28($sp)
/* A8400 800B7C00 2C00A0AF */  sw         $zero, 0x2C($sp)
/* A8404 800B7C04 3000B4AF */  sw         $s4, 0x30($sp)
/* A8408 800B7C08 3400B5AF */  sw         $s5, 0x34($sp)
/* A840C 800B7C0C 21104300 */  addu       $v0, $v0, $v1
/* A8410 800B7C10 2FAB000C */  jal        DRAW_TranslucentQuad
/* A8414 800B7C14 1C00A2AF */   sw        $v0, 0x1C($sp)
/* A8418 800B7C18 3C00A68F */  lw         $a2, 0x3C($sp)
/* A841C 800B7C1C 4400A88F */  lw         $t0, 0x44($sp)
/* A8420 800B7C20 0000058E */  lw         $a1, 0x0($s0)
/* A8424 800B7C24 0000278E */  lw         $a3, 0x0($s1)
/* A8428 800B7C28 2320D300 */  subu       $a0, $a2, $s3
/* A842C 800B7C2C 23280501 */  subu       $a1, $t0, $a1
/* A8430 800B7C30 1000A4AF */  sw         $a0, 0x10($sp)
/* A8434 800B7C34 4000A28F */  lw         $v0, 0x40($sp)
/* A8438 800B7C38 0000038E */  lw         $v1, 0x0($s0)
/* A843C 800B7C3C 2330D200 */  subu       $a2, $a2, $s2
/* A8440 800B7C40 21104300 */  addu       $v0, $v0, $v1
/* A8444 800B7C44 1400A2AF */  sw         $v0, 0x14($sp)
/* A8448 800B7C48 3C00A28F */  lw         $v0, 0x3C($sp)
/* A844C 800B7C4C 23380701 */  subu       $a3, $t0, $a3
/* A8450 800B7C50 23105200 */  subu       $v0, $v0, $s2
/* A8454 800B7C54 1800A2AF */  sw         $v0, 0x18($sp)
/* A8458 800B7C58 4000A28F */  lw         $v0, 0x40($sp)
/* A845C 800B7C5C 0000238E */  lw         $v1, 0x0($s1)
/* A8460 800B7C60 21984002 */  addu       $s3, $s2, $zero
/* A8464 800B7C64 2000A0AF */  sw         $zero, 0x20($sp)
/* A8468 800B7C68 2400A0AF */  sw         $zero, 0x24($sp)
/* A846C 800B7C6C 2800A0AF */  sw         $zero, 0x28($sp)
/* A8470 800B7C70 2C00A0AF */  sw         $zero, 0x2C($sp)
/* A8474 800B7C74 3000B4AF */  sw         $s4, 0x30($sp)
/* A8478 800B7C78 3400B5AF */  sw         $s5, 0x34($sp)
/* A847C 800B7C7C 21104300 */  addu       $v0, $v0, $v1
/* A8480 800B7C80 2FAB000C */  jal        DRAW_TranslucentQuad
/* A8484 800B7C84 1C00A2AF */   sw        $v0, 0x1C($sp)
/* A8488 800B7C88 0F00622A */  slti       $v0, $s3, 0xF
/* A848C 800B7C8C C3FF4014 */  bnez       $v0, .L800B7B9C
/* A8490 800B7C90 01007226 */   addiu     $s2, $s3, 0x1
.L800B7C94:
/* A8494 800B7C94 3800A48F */  lw         $a0, 0x38($sp)
/* A8498 800B7C98 3C00A68F */  lw         $a2, 0x3C($sp)
/* A849C 800B7C9C 0F008424 */  addiu      $a0, $a0, 0xF
/* A84A0 800B7CA0 1000A4AF */  sw         $a0, 0x10($sp)
/* A84A4 800B7CA4 4000A28F */  lw         $v0, 0x40($sp)
/* A84A8 800B7CA8 00000000 */  nop
/* A84AC 800B7CAC 1400A2AF */  sw         $v0, 0x14($sp)
/* A84B0 800B7CB0 2110C000 */  addu       $v0, $a2, $zero
/* A84B4 800B7CB4 F1FF4224 */  addiu      $v0, $v0, -0xF
/* A84B8 800B7CB8 1800A2AF */  sw         $v0, 0x18($sp)
/* A84BC 800B7CBC 4000A28F */  lw         $v0, 0x40($sp)
/* A84C0 800B7CC0 0100D626 */  addiu      $s6, $s6, 0x1
/* A84C4 800B7CC4 2000A0AF */  sw         $zero, 0x20($sp)
/* A84C8 800B7CC8 2400A0AF */  sw         $zero, 0x24($sp)
/* A84CC 800B7CCC 2800A0AF */  sw         $zero, 0x28($sp)
/* A84D0 800B7CD0 2C00A0AF */  sw         $zero, 0x2C($sp)
/* A84D4 800B7CD4 3000B4AF */  sw         $s4, 0x30($sp)
/* A84D8 800B7CD8 3400B5AF */  sw         $s5, 0x34($sp)
/* A84DC 800B7CDC 1C00A2AF */  sw         $v0, 0x1C($sp)
/* A84E0 800B7CE0 4400A58F */  lw         $a1, 0x44($sp)
/* A84E4 800B7CE4 F1FFC624 */  addiu      $a2, $a2, -0xF
/* A84E8 800B7CE8 2FAB000C */  jal        DRAW_TranslucentQuad
/* A84EC 800B7CEC 2138A000 */   addu      $a3, $a1, $zero
/* A84F0 800B7CF0 0200C22A */  slti       $v0, $s6, 0x2
/* A84F4 800B7CF4 A6FF4014 */  bnez       $v0, .L800B7B90
/* A84F8 800B7CF8 2198E002 */   addu      $s3, $s7, $zero
/* A84FC 800B7CFC 6C00BF8F */  lw         $ra, 0x6C($sp)
/* A8500 800B7D00 6800BE8F */  lw         $fp, 0x68($sp)
/* A8504 800B7D04 6400B78F */  lw         $s7, 0x64($sp)
/* A8508 800B7D08 6000B68F */  lw         $s6, 0x60($sp)
/* A850C 800B7D0C 5C00B58F */  lw         $s5, 0x5C($sp)
/* A8510 800B7D10 5800B48F */  lw         $s4, 0x58($sp)
/* A8514 800B7D14 5400B38F */  lw         $s3, 0x54($sp)
/* A8518 800B7D18 5000B28F */  lw         $s2, 0x50($sp)
/* A851C 800B7D1C 4C00B18F */  lw         $s1, 0x4C($sp)
/* A8520 800B7D20 4800B08F */  lw         $s0, 0x48($sp)
/* A8524 800B7D24 0800E003 */  jr         $ra
/* A8528 800B7D28 7000BD27 */   addiu     $sp, $sp, 0x70
.size DisplayMenuBox, . - DisplayMenuBox
