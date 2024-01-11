.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MENUFACE_ChangeStateRandomly
/* A9BD0 800B93D0 ECAA828F */  lw         $v0, %gp_rel(hack_initialized)($gp)
/* A9BD4 800B93D4 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* A9BD8 800B93D8 2000BFAF */  sw         $ra, 0x20($sp)
/* A9BDC 800B93DC 1C00B3AF */  sw         $s3, 0x1C($sp)
/* A9BE0 800B93E0 1800B2AF */  sw         $s2, 0x18($sp)
/* A9BE4 800B93E4 1400B1AF */  sw         $s1, 0x14($sp)
/* A9BE8 800B93E8 3B004010 */  beqz       $v0, .L800B94D8
/* A9BEC 800B93EC 1000B0AF */   sw        $s0, 0x10($sp)
/* A9BF0 800B93F0 ECAA9327 */  addiu      $s3, $gp, %gp_rel(hack_initialized)
/* A9BF4 800B93F4 80FF7126 */  addiu      $s1, $s3, -0x80
/* A9BF8 800B93F8 2B103302 */  sltu       $v0, $s1, $s3
/* A9BFC 800B93FC 36004010 */  beqz       $v0, .L800B94D8
/* A9C00 800B9400 FFFF1224 */   addiu     $s2, $zero, -0x1
/* A9C04 800B9404 8CFF7026 */  addiu      $s0, $s3, -0x74
.L800B9408:
/* A9C08 800B9408 00000296 */  lhu        $v0, 0x0($s0)
/* A9C0C 800B940C 00000000 */  nop
/* A9C10 800B9410 2C004014 */  bnez       $v0, .L800B94C4
/* A9C14 800B9414 FFFF4224 */   addiu     $v0, $v0, -0x1
/* A9C18 800B9418 FEFF0286 */  lh         $v0, -0x2($s0)
/* A9C1C 800B941C FEFF0396 */  lhu        $v1, -0x2($s0)
/* A9C20 800B9420 19004014 */  bnez       $v0, .L800B9488
/* A9C24 800B9424 00000000 */   nop
/* A9C28 800B9428 3AF2020C */  jal        func_800BC8E8
/* A9C2C 800B942C 00000000 */   nop
/* A9C30 800B9430 6210033C */  lui        $v1, (0x10624DD3 >> 16)
/* A9C34 800B9434 D34D6334 */  ori        $v1, $v1, (0x10624DD3 & 0xFFFF)
/* A9C38 800B9438 18004300 */  mult       $v0, $v1
/* A9C3C 800B943C C31F0200 */  sra        $v1, $v0, 31
/* A9C40 800B9440 10280000 */  mfhi       $a1
/* A9C44 800B9444 43210500 */  sra        $a0, $a1, 5
/* A9C48 800B9448 23208300 */  subu       $a0, $a0, $v1
/* A9C4C 800B944C 40190400 */  sll        $v1, $a0, 5
/* A9C50 800B9450 23186400 */  subu       $v1, $v1, $a0
/* A9C54 800B9454 80180300 */  sll        $v1, $v1, 2
/* A9C58 800B9458 21186400 */  addu       $v1, $v1, $a0
/* A9C5C 800B945C 80180300 */  sll        $v1, $v1, 2
/* A9C60 800B9460 19004314 */  bne        $v0, $v1, .L800B94C8
/* A9C64 800B9464 00000000 */   nop
/* A9C68 800B9468 FCFF0286 */  lh         $v0, -0x4($s0)
/* A9C6C 800B946C 00000000 */  nop
/* A9C70 800B9470 03005214 */  bne        $v0, $s2, .L800B9480
/* A9C74 800B9474 01000224 */   addiu     $v0, $zero, 0x1
/* A9C78 800B9478 32E50208 */  j          .L800B94C8
/* A9C7C 800B947C FEFF02A6 */   sh        $v0, -0x2($s0)
.L800B9480:
/* A9C80 800B9480 32E50208 */  j          .L800B94C8
/* A9C84 800B9484 FEFF12A6 */   sh        $s2, -0x2($s0)
.L800B9488:
/* A9C88 800B9488 FCFF0296 */  lhu        $v0, -0x4($s0)
/* A9C8C 800B948C 00000000 */  nop
/* A9C90 800B9490 21104300 */  addu       $v0, $v0, $v1
/* A9C94 800B9494 FCFF02A6 */  sh         $v0, -0x4($s0)
/* A9C98 800B9498 00140200 */  sll        $v0, $v0, 16
/* A9C9C 800B949C FAFF0392 */  lbu        $v1, -0x6($s0)
/* A9CA0 800B94A0 03240200 */  sra        $a0, $v0, 16
/* A9CA4 800B94A4 C0100300 */  sll        $v0, $v1, 3
/* A9CA8 800B94A8 23104300 */  subu       $v0, $v0, $v1
/* A9CAC 800B94AC FFFF4224 */  addiu      $v0, $v0, -0x1
/* A9CB0 800B94B0 03008210 */  beq        $a0, $v0, .L800B94C0
/* A9CB4 800B94B4 C8000224 */   addiu     $v0, $zero, 0xC8
/* A9CB8 800B94B8 03009214 */  bne        $a0, $s2, .L800B94C8
/* A9CBC 800B94BC 00000000 */   nop
.L800B94C0:
/* A9CC0 800B94C0 FEFF00A6 */  sh         $zero, -0x2($s0)
.L800B94C4:
/* A9CC4 800B94C4 000002A6 */  sh         $v0, 0x0($s0)
.L800B94C8:
/* A9CC8 800B94C8 10003126 */  addiu      $s1, $s1, 0x10
/* A9CCC 800B94CC 2B103302 */  sltu       $v0, $s1, $s3
/* A9CD0 800B94D0 CDFF4014 */  bnez       $v0, .L800B9408
/* A9CD4 800B94D4 10001026 */   addiu     $s0, $s0, 0x10
.L800B94D8:
/* A9CD8 800B94D8 2000BF8F */  lw         $ra, 0x20($sp)
/* A9CDC 800B94DC 1C00B38F */  lw         $s3, 0x1C($sp)
/* A9CE0 800B94E0 1800B28F */  lw         $s2, 0x18($sp)
/* A9CE4 800B94E4 1400B18F */  lw         $s1, 0x14($sp)
/* A9CE8 800B94E8 1000B08F */  lw         $s0, 0x10($sp)
/* A9CEC 800B94EC 0800E003 */  jr         $ra
/* A9CF0 800B94F0 2800BD27 */   addiu     $sp, $sp, 0x28
.size MENUFACE_ChangeStateRandomly, . - MENUFACE_ChangeStateRandomly
