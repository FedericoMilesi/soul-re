.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razProcessSAnim
/* 97B8C 800A738C D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 97B90 800A7390 2400B3AF */  sw         $s3, 0x24($sp)
/* 97B94 800A7394 21988000 */  addu       $s3, $a0, $zero
/* 97B98 800A7398 2000B2AF */  sw         $s2, 0x20($sp)
/* 97B9C 800A739C 21900000 */  addu       $s2, $zero, $zero
/* 97BA0 800A73A0 0008023C */  lui        $v0, (0x8000000 >> 16)
/* 97BA4 800A73A4 2C00BFAF */  sw         $ra, 0x2C($sp)
/* 97BA8 800A73A8 2800B4AF */  sw         $s4, 0x28($sp)
/* 97BAC 800A73AC 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 97BB0 800A73B0 0F00A210 */  beq        $a1, $v0, .L800A73F0
/* 97BB4 800A73B4 1800B0AF */   sw        $s0, 0x18($sp)
/* 97BB8 800A73B8 2A104500 */  slt        $v0, $v0, $a1
/* 97BBC 800A73BC 07004014 */  bnez       $v0, .L800A73DC
/* 97BC0 800A73C0 0008023C */   lui       $v0, (0x8000003 >> 16)
/* 97BC4 800A73C4 1000023C */  lui        $v0, (0x100015 >> 16)
/* 97BC8 800A73C8 15004234 */  ori        $v0, $v0, (0x100015 & 0xFFFF)
/* 97BCC 800A73CC 0D00A210 */  beq        $a1, $v0, .L800A7404
/* 97BD0 800A73D0 00000000 */   nop
/* 97BD4 800A73D4 0D9D0208 */  j          .L800A7434
/* 97BD8 800A73D8 00000000 */   nop
.L800A73DC:
/* 97BDC 800A73DC 03004234 */  ori        $v0, $v0, (0x8000003 & 0xFFFF)
/* 97BE0 800A73E0 0D00A210 */  beq        $a1, $v0, .L800A7418
/* 97BE4 800A73E4 00000000 */   nop
/* 97BE8 800A73E8 0D9D0208 */  j          .L800A7434
/* 97BEC 800A73EC 00000000 */   nop
.L800A73F0:
/* 97BF0 800A73F0 D8FB828F */  lw         $v0, %gp_rel(Raziel + 0x5A8)($gp)
/* 97BF4 800A73F4 00000000 */  nop
/* 97BF8 800A73F8 08004384 */  lh         $v1, 0x8($v0)
/* 97BFC 800A73FC 0A9D0208 */  j          .L800A7428
/* 97C00 800A7400 01000224 */   addiu     $v0, $zero, 0x1
.L800A7404:
/* 97C04 800A7404 D8FB828F */  lw         $v0, %gp_rel(Raziel + 0x5A8)($gp)
/* 97C08 800A7408 00000000 */  nop
/* 97C0C 800A740C 08004384 */  lh         $v1, 0x8($v0)
/* 97C10 800A7410 0A9D0208 */  j          .L800A7428
/* 97C14 800A7414 02000224 */   addiu     $v0, $zero, 0x2
.L800A7418:
/* 97C18 800A7418 D8FB828F */  lw         $v0, %gp_rel(Raziel + 0x5A8)($gp)
/* 97C1C 800A741C 00000000 */  nop
/* 97C20 800A7420 08004384 */  lh         $v1, 0x8($v0)
/* 97C24 800A7424 03000224 */  addiu      $v0, $zero, 0x3
.L800A7428:
/* 97C28 800A7428 02006214 */  bne        $v1, $v0, .L800A7434
/* 97C2C 800A742C 00000000 */   nop
/* 97C30 800A7430 01001224 */  addiu      $s2, $zero, 0x1
.L800A7434:
/* 97C34 800A7434 2B004012 */  beqz       $s2, .L800A74E4
/* 97C38 800A7438 21104002 */   addu      $v0, $s2, $zero
/* 97C3C 800A743C D8FB828F */  lw         $v0, %gp_rel(Raziel + 0x5A8)($gp)
/* 97C40 800A7440 00000000 */  nop
/* 97C44 800A7444 0400468C */  lw         $a2, 0x4($v0)
/* 97C48 800A7448 00000000 */  nop
/* 97C4C 800A744C 2000C010 */  beqz       $a2, .L800A74D0
/* 97C50 800A7450 C8016426 */   addiu     $a0, $s3, 0x1C8
/* 97C54 800A7454 D8FB86AF */  sw         $a2, %gp_rel(Raziel + 0x5A8)($gp)
/* 97C58 800A7458 0000D18C */  lw         $s1, 0x0($a2)
/* 97C5C 800A745C 00000000 */  nop
/* 97C60 800A7460 1F002012 */  beqz       $s1, .L800A74E0
/* 97C64 800A7464 21800000 */   addu      $s0, $zero, $zero
/* 97C68 800A7468 FFFF1424 */  addiu      $s4, $zero, -0x1
/* 97C6C 800A746C 21206002 */  addu       $a0, $s3, $zero
.L800A7470:
/* 97C70 800A7470 21280002 */  addu       $a1, $s0, $zero
/* 97C74 800A7474 21302002 */  addu       $a2, $s1, $zero
/* 97C78 800A7478 FFFF0724 */  addiu      $a3, $zero, -0x1
/* 97C7C 800A747C B09C020C */  jal        razSwitchVAnim
/* 97C80 800A7480 1000B4AF */   sw        $s4, 0x10($sp)
/* 97C84 800A7484 D8FB828F */  lw         $v0, %gp_rel(Raziel + 0x5A8)($gp)
/* 97C88 800A7488 C8016426 */  addiu      $a0, $s3, 0x1C8
/* 97C8C 800A748C 0C004584 */  lh         $a1, 0xC($v0)
/* 97C90 800A7490 8E3F020C */  jal        G2Anim_SetSpeedAdjustment
/* 97C94 800A7494 01001026 */   addiu     $s0, $s0, 0x1
/* 97C98 800A7498 0300022A */  slti       $v0, $s0, 0x3
/* 97C9C 800A749C F4FF4014 */  bnez       $v0, .L800A7470
/* 97CA0 800A74A0 21206002 */   addu      $a0, $s3, $zero
/* 97CA4 800A74A4 D8FB848F */  lw         $a0, %gp_rel(Raziel + 0x5A8)($gp)
/* 97CA8 800A74A8 00000000 */  nop
/* 97CAC 800A74AC 08008384 */  lh         $v1, 0x8($a0)
/* 97CB0 800A74B0 02000224 */  addiu      $v0, $zero, 0x2
/* 97CB4 800A74B4 0B006214 */  bne        $v1, $v0, .L800A74E4
/* 97CB8 800A74B8 21104002 */   addu      $v0, $s2, $zero
/* 97CBC 800A74BC 0A008484 */  lh         $a0, 0xA($a0)
/* 97CC0 800A74C0 31CC020C */  jal        SetTimer
/* 97CC4 800A74C4 00000000 */   nop
/* 97CC8 800A74C8 399D0208 */  j          .L800A74E4
/* 97CCC 800A74CC 21104002 */   addu      $v0, $s2, $zero
.L800A74D0:
/* 97CD0 800A74D0 8E3F020C */  jal        G2Anim_SetSpeedAdjustment
/* 97CD4 800A74D4 00100524 */   addiu     $a1, $zero, 0x1000
/* 97CD8 800A74D8 D8FB80AF */  sw         $zero, %gp_rel(Raziel + 0x5A8)($gp)
/* 97CDC 800A74DC 21900000 */  addu       $s2, $zero, $zero
.L800A74E0:
/* 97CE0 800A74E0 21104002 */  addu       $v0, $s2, $zero
.L800A74E4:
/* 97CE4 800A74E4 2C00BF8F */  lw         $ra, 0x2C($sp)
/* 97CE8 800A74E8 2800B48F */  lw         $s4, 0x28($sp)
/* 97CEC 800A74EC 2400B38F */  lw         $s3, 0x24($sp)
/* 97CF0 800A74F0 2000B28F */  lw         $s2, 0x20($sp)
/* 97CF4 800A74F4 1C00B18F */  lw         $s1, 0x1C($sp)
/* 97CF8 800A74F8 1800B08F */  lw         $s0, 0x18($sp)
/* 97CFC 800A74FC 0800E003 */  jr         $ra
/* 97D00 800A7500 3000BD27 */   addiu     $sp, $sp, 0x30
.size razProcessSAnim, . - razProcessSAnim
