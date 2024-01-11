.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MainRenderLevel
/* 1F41C 8002EC1C 88FFBD27 */  addiu      $sp, $sp, -0x78
/* 1F420 8002EC20 6C00B7AF */  sw         $s7, 0x6C($sp)
/* 1F424 8002EC24 21B88000 */  addu       $s7, $a0, $zero
/* 1F428 8002EC28 7000BEAF */  sw         $fp, 0x70($sp)
/* 1F42C 8002EC2C 21F0A000 */  addu       $fp, $a1, $zero
/* 1F430 8002EC30 7400BFAF */  sw         $ra, 0x74($sp)
/* 1F434 8002EC34 6800B6AF */  sw         $s6, 0x68($sp)
/* 1F438 8002EC38 6400B5AF */  sw         $s5, 0x64($sp)
/* 1F43C 8002EC3C 6000B4AF */  sw         $s4, 0x60($sp)
/* 1F440 8002EC40 5C00B3AF */  sw         $s3, 0x5C($sp)
/* 1F444 8002EC44 5800B2AF */  sw         $s2, 0x58($sp)
/* 1F448 8002EC48 5400B1AF */  sw         $s1, 0x54($sp)
/* 1F44C 8002EC4C 5000B0AF */  sw         $s0, 0x50($sp)
/* 1F450 8002EC50 0800F08E */  lw         $s0, 0x8($s7)
/* 1F454 8002EC54 00000000 */  nop
/* 1F458 8002EC58 0000148E */  lw         $s4, 0x0($s0)
/* 1F45C 8002EC5C 6EBA000C */  jal        UpdateFogSettings
/* 1F460 8002EC60 21280002 */   addu      $a1, $s0, $zero
/* 1F464 8002EC64 C8BD9527 */  addiu      $s5, $gp, %gp_rel(gameTrackerX)
/* 1F468 8002EC68 2801A28E */  lw         $v0, 0x128($s5)
/* 1F46C 8002EC6C 00000000 */  nop
/* 1F470 8002EC70 2000E2AE */  sw         $v0, 0x20($s7)
/* 1F474 8002EC74 46000496 */  lhu        $a0, 0x46($s0)
/* 1F478 8002EC78 44000596 */  lhu        $a1, 0x44($s0)
/* 1F47C 8002EC7C C8F3020C */  jal        func_800BCF20
/* 1F480 8002EC80 40010624 */   addiu     $a2, $zero, 0x140
/* 1F484 8002EC84 21200000 */  addu       $a0, $zero, $zero
/* 1F488 8002EC88 21288000 */  addu       $a1, $a0, $zero
/* 1F48C 8002EC8C BCF4020C */  jal        func_800BD2F0
/* 1F490 8002EC90 21308000 */   addu      $a2, $a0, $zero
/* 1F494 8002EC94 3C000292 */  lbu        $v0, 0x3C($s0)
/* 1F498 8002EC98 A4BD8327 */  addiu      $v1, $gp, %gp_rel(clearRect)
/* 1F49C 8002EC9C 040062A0 */  sb         $v0, 0x4($v1)
/* 1F4A0 8002ECA0 3D000292 */  lbu        $v0, 0x3D($s0)
/* 1F4A4 8002ECA4 00000000 */  nop
/* 1F4A8 8002ECA8 050062A0 */  sb         $v0, 0x5($v1)
/* 1F4AC 8002ECAC 3E000292 */  lbu        $v0, 0x3E($s0)
/* 1F4B0 8002ECB0 00000000 */  nop
/* 1F4B4 8002ECB4 060062A0 */  sb         $v0, 0x6($v1)
/* 1F4B8 8002ECB8 3C000292 */  lbu        $v0, 0x3C($s0)
/* 1F4BC 8002ECBC B4BD8327 */  addiu      $v1, $gp, %gp_rel(clearRect + 0x10)
/* 1F4C0 8002ECC0 040062A0 */  sb         $v0, 0x4($v1)
/* 1F4C4 8002ECC4 3D000292 */  lbu        $v0, 0x3D($s0)
/* 1F4C8 8002ECC8 00000000 */  nop
/* 1F4CC 8002ECCC 050062A0 */  sb         $v0, 0x5($v1)
/* 1F4D0 8002ECD0 3E000292 */  lbu        $v0, 0x3E($s0)
/* 1F4D4 8002ECD4 00000000 */  nop
/* 1F4D8 8002ECD8 060062A0 */  sb         $v0, 0x6($v1)
/* 1F4DC 8002ECDC D0BD8487 */  lh         $a0, %gp_rel(gameTrackerX + 0x8)($gp)
/* 1F4E0 8002ECE0 E8030224 */  addiu      $v0, $zero, 0x3E8
/* 1F4E4 8002ECE4 17008210 */  beq        $a0, $v0, .L8002ED44
/* 1F4E8 8002ECE8 6210033C */   lui       $v1, (0x10624DD3 >> 16)
/* 1F4EC 8002ECEC D34D6334 */  ori        $v1, $v1, (0x10624DD3 & 0xFFFF)
/* 1F4F0 8002ECF0 00130400 */  sll        $v0, $a0, 12
/* 1F4F4 8002ECF4 18004300 */  mult       $v0, $v1
/* 1F4F8 8002ECF8 C3170200 */  sra        $v0, $v0, 31
/* 1F4FC 8002ECFC 10480000 */  mfhi       $t1
/* 1F500 8002ED00 83190900 */  sra        $v1, $t1, 6
/* 1F504 8002ED04 23306200 */  subu       $a2, $v1, $v0
/* 1F508 8002ED08 D2BD8387 */  lh         $v1, %gp_rel(gameTrackerX + 0xA)($gp)
/* 1F50C 8002ED0C 01000224 */  addiu      $v0, $zero, 0x1
/* 1F510 8002ED10 04006214 */  bne        $v1, $v0, .L8002ED24
/* 1F514 8002ED14 4800A227 */   addiu     $v0, $sp, 0x48
/* 1F518 8002ED18 00100224 */  addiu      $v0, $zero, 0x1000
/* 1F51C 8002ED1C 23304600 */  subu       $a2, $v0, $a2
/* 1F520 8002ED20 4800A227 */  addiu      $v0, $sp, 0x48
.L8002ED24:
/* 1F524 8002ED24 1000A2AF */  sw         $v0, 0x10($sp)
/* 1F528 8002ED28 40000426 */  addiu      $a0, $s0, 0x40
/* 1F52C 8002ED2C 3C000526 */  addiu      $a1, $s0, 0x3C
/* 1F530 8002ED30 00100724 */  addiu      $a3, $zero, 0x1000
/* 1F534 8002ED34 A8F3020C */  jal        func_800BCEA0
/* 1F538 8002ED38 2338E600 */   subu      $a3, $a3, $a2
/* 1F53C 8002ED3C 5CBB0008 */  j          .L8002ED70
/* 1F540 8002ED40 4800A427 */   addiu     $a0, $sp, 0x48
.L8002ED44:
/* 1F544 8002ED44 D2BD8387 */  lh         $v1, %gp_rel(gameTrackerX + 0xA)($gp)
/* 1F548 8002ED48 01000224 */  addiu      $v0, $zero, 0x1
/* 1F54C 8002ED4C 04006214 */  bne        $v1, $v0, .L8002ED60
/* 1F550 8002ED50 00000000 */   nop
/* 1F554 8002ED54 4000028E */  lw         $v0, 0x40($s0)
/* 1F558 8002ED58 5BBB0008 */  j          .L8002ED6C
/* 1F55C 8002ED5C 4800A2AF */   sw        $v0, 0x48($sp)
.L8002ED60:
/* 1F560 8002ED60 3C00028E */  lw         $v0, 0x3C($s0)
/* 1F564 8002ED64 00000000 */  nop
/* 1F568 8002ED68 4800A2AF */  sw         $v0, 0x48($sp)
.L8002ED6C:
/* 1F56C 8002ED6C 4800A427 */  addiu      $a0, $sp, 0x48
.L8002ED70:
/* 1F570 8002ED70 3000E526 */  addiu      $a1, $s7, 0x30
/* 1F574 8002ED74 CABA000C */  jal        BlendToColor
/* 1F578 8002ED78 2130A000 */   addu      $a2, $a1, $zero
/* 1F57C 8002ED7C 3000E28E */  lw         $v0, 0x30($s7)
/* 1F580 8002ED80 00000000 */  nop
/* 1F584 8002ED84 549082AF */  sw         $v0, %gp_rel(depthQBackColor)($gp)
/* 1F588 8002ED88 BEB7000C */  jal        GAMELOOP_GetTimeOfDay
/* 1F58C 8002ED8C 00000000 */   nop
/* 1F590 8002ED90 21184000 */  addu       $v1, $v0, $zero
/* 1F594 8002ED94 58020224 */  addiu      $v0, $zero, 0x258
/* 1F598 8002ED98 03006210 */  beq        $v1, $v0, .L8002EDA8
/* 1F59C 8002ED9C 08070224 */   addiu     $v0, $zero, 0x708
/* 1F5A0 8002EDA0 06006214 */  bne        $v1, $v0, .L8002EDBC
/* 1F5A4 8002EDA4 00000000 */   nop
.L8002EDA8:
/* 1F5A8 8002EDA8 CC00028E */  lw         $v0, 0xCC($s0)
/* 1F5AC 8002EDAC 00000000 */  nop
/* 1F5B0 8002EDB0 02004230 */  andi       $v0, $v0, 0x2
/* 1F5B4 8002EDB4 0C004014 */  bnez       $v0, .L8002EDE8
/* 1F5B8 8002EDB8 00000000 */   nop
.L8002EDBC:
/* 1F5BC 8002EDBC D0BD8387 */  lh         $v1, %gp_rel(gameTrackerX + 0x8)($gp)
/* 1F5C0 8002EDC0 E8030224 */  addiu      $v0, $zero, 0x3E8
/* 1F5C4 8002EDC4 08006214 */  bne        $v1, $v0, .L8002EDE8
/* 1F5C8 8002EDC8 F8FF043C */   lui       $a0, (0xFFF8F8F8 >> 16)
/* 1F5CC 8002EDCC F8F88434 */  ori        $a0, $a0, (0xFFF8F8F8 & 0xFFFF)
/* 1F5D0 8002EDD0 0400033C */  lui        $v1, (0x40404 >> 16)
/* 1F5D4 8002EDD4 5490828F */  lw         $v0, %gp_rel(depthQBackColor)($gp)
/* 1F5D8 8002EDD8 04046334 */  ori        $v1, $v1, (0x40404 & 0xFFFF)
/* 1F5DC 8002EDDC 24104400 */  and        $v0, $v0, $a0
/* 1F5E0 8002EDE0 25104300 */  or         $v0, $v0, $v1
/* 1F5E4 8002EDE4 549082AF */  sw         $v0, %gp_rel(depthQBackColor)($gp)
.L8002EDE8:
/* 1F5E8 8002EDE8 46000296 */  lhu        $v0, 0x46($s0)
/* 1F5EC 8002EDEC 44000396 */  lhu        $v1, 0x44($s0)
/* 1F5F0 8002EDF0 54908427 */  addiu      $a0, $gp, %gp_rel(depthQBackColor)
/* 1F5F4 8002EDF4 4C9082AF */  sw         $v0, %gp_rel(depthQFogStart)($gp)
/* 1F5F8 8002EDF8 509083AF */  sw         $v1, %gp_rel(depthQFogFar)($gp)
/* 1F5FC 8002EDFC B8BA000C */  jal        CheckForNoBlend
/* 1F600 8002EE00 00000000 */   nop
/* 1F604 8002EE04 02004014 */  bnez       $v0, .L8002EE10
/* 1F608 8002EE08 FFFF0234 */   ori       $v0, $zero, 0xFFFF
/* 1F60C 8002EE0C 4C90828F */  lw         $v0, %gp_rel(depthQFogStart)($gp)
.L8002EE10:
/* 1F610 8002EE10 00000000 */  nop
/* 1F614 8002EE14 489082AF */  sw         $v0, %gp_rel(depthQBlendStart)($gp)
/* 1F618 8002EE18 54908227 */  addiu      $v0, $gp, %gp_rel(depthQBackColor)
/* 1F61C 8002EE1C 2C01A58E */  lw         $a1, 0x12C($s5)
/* 1F620 8002EE20 4000A68E */  lw         $a2, 0x40($s5)
/* 1F624 8002EE24 54908393 */  lbu        $v1, %gp_rel(depthQBackColor)($gp)
/* 1F628 8002EE28 01004490 */  lbu        $a0, 0x1($v0)
/* 1F62C 8002EE2C 02004790 */  lbu        $a3, 0x2($v0)
/* 1F630 8002EE30 A4BD8227 */  addiu      $v0, $gp, %gp_rel(clearRect)
/* 1F634 8002EE34 040043A0 */  sb         $v1, 0x4($v0)
/* 1F638 8002EE38 050044A0 */  sb         $a0, 0x5($v0)
/* 1F63C 8002EE3C 060047A0 */  sb         $a3, 0x6($v0)
/* 1F640 8002EE40 B4BD8227 */  addiu      $v0, $gp, %gp_rel(clearRect + 0x10)
/* 1F644 8002EE44 040043A0 */  sb         $v1, 0x4($v0)
/* 1F648 8002EE48 050044A0 */  sb         $a0, 0x5($v0)
/* 1F64C 8002EE4C 060047A0 */  sb         $a3, 0x6($v0)
/* 1F650 8002EE50 2800848E */  lw         $a0, 0x28($s4)
/* 1F654 8002EE54 B2F0000C */  jal        PIPE3D_AnimateTerrainTextures
/* 1F658 8002EE58 2138C003 */   addu      $a3, $fp, $zero
/* 1F65C 8002EE5C 8000048E */  lw         $a0, 0x80($s0)
/* 1F660 8002EE60 2C01A58E */  lw         $a1, 0x12C($s5)
/* 1F664 8002EE64 4000A68E */  lw         $a2, 0x40($s5)
/* 1F668 8002EE68 B2F0000C */  jal        PIPE3D_AnimateTerrainTextures
/* 1F66C 8002EE6C 2138C003 */   addu      $a3, $fp, $zero
/* 1F670 8002EE70 2120E002 */  addu       $a0, $s7, $zero
/* 1F674 8002EE74 2128A002 */  addu       $a1, $s5, $zero
/* 1F678 8002EE78 2130C003 */  addu       $a2, $fp, $zero
/* 1F67C 8002EE7C 2CBA828F */  lw         $v0, %gp_rel(gLightInfo)($gp)
/* 1F680 8002EE80 90AC8727 */  addiu      $a3, $gp, %gp_rel(theCamera)
/* 1F684 8002EE84 CBED000C */  jal        PIPE3D_InstanceListTransformAndDraw
/* 1F688 8002EE88 780440AC */   sw        $zero, 0x478($v0)
/* 1F68C 8002EE8C F0AC828F */  lw         $v0, %gp_rel(theCamera + 0x60)($gp)
/* 1F690 8002EE90 90AC8927 */  addiu      $t1, $gp, %gp_rel(theCamera)
/* 1F694 8002EE94 03002A89 */  lwl        $t2, 0x3($t1)
/* 1F698 8002EE98 00002A99 */  lwr        $t2, 0x0($t1)
/* 1F69C 8002EE9C 04002B85 */  lh         $t3, 0x4($t1)
/* 1F6A0 8002EEA0 1B00AAAB */  swl        $t2, 0x1B($sp)
/* 1F6A4 8002EEA4 1800AABB */  swr        $t2, 0x18($sp)
/* 1F6A8 8002EEA8 1C00ABA7 */  sh         $t3, 0x1C($sp)
/* 1F6AC 8002EEAC 00004A8C */  lw         $t2, 0x0($v0)
/* 1F6B0 8002EEB0 04004B8C */  lw         $t3, 0x4($v0)
/* 1F6B4 8002EEB4 08004C8C */  lw         $t4, 0x8($v0)
/* 1F6B8 8002EEB8 0C00498C */  lw         $t1, 0xC($v0)
/* 1F6BC 8002EEBC 2000AAAF */  sw         $t2, 0x20($sp)
/* 1F6C0 8002EEC0 2400ABAF */  sw         $t3, 0x24($sp)
/* 1F6C4 8002EEC4 2800ACAF */  sw         $t4, 0x28($sp)
/* 1F6C8 8002EEC8 2C00A9AF */  sw         $t1, 0x2C($sp)
/* 1F6CC 8002EECC 10004A8C */  lw         $t2, 0x10($v0)
/* 1F6D0 8002EED0 14004B8C */  lw         $t3, 0x14($v0)
/* 1F6D4 8002EED4 18004C8C */  lw         $t4, 0x18($v0)
/* 1F6D8 8002EED8 1C00498C */  lw         $t1, 0x1C($v0)
/* 1F6DC 8002EEDC 3000AAAF */  sw         $t2, 0x30($sp)
/* 1F6E0 8002EEE0 3400ABAF */  sw         $t3, 0x34($sp)
/* 1F6E4 8002EEE4 3800ACAF */  sw         $t4, 0x38($sp)
/* 1F6E8 8002EEE8 3C00A9AF */  sw         $t1, 0x3C($sp)
/* 1F6EC 8002EEEC 4400828E */  lw         $v0, 0x44($s4)
/* 1F6F0 8002EEF0 00000000 */  nop
/* 1F6F4 8002EEF4 46004018 */  blez       $v0, .L8002F010
/* 1F6F8 8002EEF8 21880000 */   addu      $s1, $zero, $zero
/* 1F6FC 8002EEFC 90AC9627 */  addiu      $s6, $gp, %gp_rel(theCamera)
/* 1F700 8002EF00 21982002 */  addu       $s3, $s1, $zero
.L8002EF04:
/* 1F704 8002EF04 4800828E */  lw         $v0, 0x48($s4)
/* 1F708 8002EF08 00000000 */  nop
/* 1F70C 8002EF0C 21805300 */  addu       $s0, $v0, $s3
/* 1F710 8002EF10 1A000286 */  lh         $v0, 0x1A($s0)
/* 1F714 8002EF14 00000000 */  nop
/* 1F718 8002EF18 38004004 */  bltz       $v0, .L8002EFFC
/* 1F71C 8002EF1C 00000000 */   nop
/* 1F720 8002EF20 12000396 */  lhu        $v1, 0x12($s0)
/* 1F724 8002EF24 00000000 */  nop
/* 1F728 8002EF28 01006230 */  andi       $v0, $v1, 0x1
/* 1F72C 8002EF2C 33004014 */  bnez       $v0, .L8002EFFC
/* 1F730 8002EF30 40006230 */   andi      $v0, $v1, 0x40
/* 1F734 8002EF34 03004010 */  beqz       $v0, .L8002EF44
/* 1F738 8002EF38 21900000 */   addu      $s2, $zero, $zero
/* 1F73C 8002EF3C D4BD928F */  lw         $s2, %gp_rel(gameTrackerX + 0xC)($gp)
/* 1F740 8002EF40 D4BD80AF */  sw         $zero, %gp_rel(gameTrackerX + 0xC)($gp)
.L8002EF44:
/* 1F744 8002EF44 2000A427 */  addiu      $a0, $sp, 0x20
/* 1F748 8002EF48 4000A527 */  addiu      $a1, $sp, 0x40
/* 1F74C 8002EF4C 1800A797 */  lhu        $a3, 0x18($sp)
/* 1F750 8002EF50 0C000296 */  lhu        $v0, 0xC($s0)
/* 1F754 8002EF54 1A00A397 */  lhu        $v1, 0x1A($sp)
/* 1F758 8002EF58 F0AC868F */  lw         $a2, %gp_rel(theCamera + 0x60)($gp)
/* 1F75C 8002EF5C 2338E200 */  subu       $a3, $a3, $v0
/* 1F760 8002EF60 1400C624 */  addiu      $a2, $a2, 0x14
/* 1F764 8002EF64 90AC87A7 */  sh         $a3, %gp_rel(theCamera)($gp)
/* 1F768 8002EF68 0E000296 */  lhu        $v0, 0xE($s0)
/* 1F76C 8002EF6C 23380700 */  negu       $a3, $a3
/* 1F770 8002EF70 23186200 */  subu       $v1, $v1, $v0
/* 1F774 8002EF74 92AC83A7 */  sh         $v1, %gp_rel(theCamera + 0x2)($gp)
/* 1F778 8002EF78 10000896 */  lhu        $t0, 0x10($s0)
/* 1F77C 8002EF7C 1C00A297 */  lhu        $v0, 0x1C($sp)
/* 1F780 8002EF80 23180300 */  negu       $v1, $v1
/* 1F784 8002EF84 4000A7A7 */  sh         $a3, 0x40($sp)
/* 1F788 8002EF88 4200A3A7 */  sh         $v1, 0x42($sp)
/* 1F78C 8002EF8C 23104800 */  subu       $v0, $v0, $t0
/* 1F790 8002EF90 94AC82A7 */  sh         $v0, %gp_rel(theCamera + 0x4)($gp)
/* 1F794 8002EF94 23100200 */  negu       $v0, $v0
/* 1F798 8002EF98 1AF2020C */  jal        func_800BC868
/* 1F79C 8002EF9C 4400A2A7 */   sh        $v0, 0x44($sp)
/* 1F7A0 8002EFA0 21200002 */  addu       $a0, $s0, $zero
/* 1F7A4 8002EFA4 1CBA868F */  lw         $a2, %gp_rel(gPolytopeList)($gp)
/* 1F7A8 8002EFA8 30E5010C */  jal        func_800794C0
/* 1F7AC 8002EFAC 2128C002 */   addu      $a1, $s6, $zero
/* 1F7B0 8002EFB0 21288002 */  addu       $a1, $s4, $zero
/* 1F7B4 8002EFB4 4000A78E */  lw         $a3, 0x40($s5)
/* 1F7B8 8002EFB8 1CBA848F */  lw         $a0, %gp_rel(gPolytopeList)($gp)
/* 1F7BC 8002EFBC 0C000226 */  addiu      $v0, $s0, 0xC
/* 1F7C0 8002EFC0 1000BEAF */  sw         $fp, 0x10($sp)
/* 1F7C4 8002EFC4 1400A2AF */  sw         $v0, 0x14($sp)
/* 1F7C8 8002EFC8 5001A28E */  lw         $v0, 0x150($s5)
/* 1F7CC 8002EFCC 00000000 */  nop
/* 1F7D0 8002EFD0 09F84000 */  jalr       $v0
/* 1F7D4 8002EFD4 2130C002 */   addu      $a2, $s6, $zero
/* 1F7D8 8002EFD8 4000A38E */  lw         $v1, 0x40($s5)
/* 1F7DC 8002EFDC 00000000 */  nop
/* 1F7E0 8002EFE0 040062AC */  sw         $v0, 0x4($v1)
/* 1F7E4 8002EFE4 12000296 */  lhu        $v0, 0x12($s0)
/* 1F7E8 8002EFE8 00000000 */  nop
/* 1F7EC 8002EFEC 40004230 */  andi       $v0, $v0, 0x40
/* 1F7F0 8002EFF0 02004010 */  beqz       $v0, .L8002EFFC
/* 1F7F4 8002EFF4 00000000 */   nop
/* 1F7F8 8002EFF8 D4BD92AF */  sw         $s2, %gp_rel(gameTrackerX + 0xC)($gp)
.L8002EFFC:
/* 1F7FC 8002EFFC 4400828E */  lw         $v0, 0x44($s4)
/* 1F800 8002F000 01003126 */  addiu      $s1, $s1, 0x1
/* 1F804 8002F004 2A102202 */  slt        $v0, $s1, $v0
/* 1F808 8002F008 BEFF4014 */  bnez       $v0, .L8002EF04
/* 1F80C 8002F00C 24007326 */   addiu     $s3, $s3, 0x24
.L8002F010:
/* 1F810 8002F010 2CBA868F */  lw         $a2, %gp_rel(gLightInfo)($gp)
/* 1F814 8002F014 4CBA8787 */  lh         $a3, %gp_rel(D_800D2FE4)($gp)
/* 1F818 8002F018 90AC8927 */  addiu      $t1, $gp, %gp_rel(theCamera)
/* 1F81C 8002F01C 1B00AA8B */  lwl        $t2, 0x1B($sp)
/* 1F820 8002F020 1800AA9B */  lwr        $t2, 0x18($sp)
/* 1F824 8002F024 1C00AB87 */  lh         $t3, 0x1C($sp)
/* 1F828 8002F028 03002AA9 */  swl        $t2, 0x3($t1)
/* 1F82C 8002F02C 00002AB9 */  swr        $t2, 0x0($t1)
/* 1F830 8002F030 04002BA5 */  sh         $t3, 0x4($t1)
/* 1F834 8002F034 F0AC828F */  lw         $v0, %gp_rel(theCamera + 0x60)($gp)
/* 1F838 8002F038 90AC8527 */  addiu      $a1, $gp, %gp_rel(theCamera)
/* 1F83C 8002F03C 2000AA8F */  lw         $t2, 0x20($sp)
/* 1F840 8002F040 2400AB8F */  lw         $t3, 0x24($sp)
/* 1F844 8002F044 2800AC8F */  lw         $t4, 0x28($sp)
/* 1F848 8002F048 2C00A98F */  lw         $t1, 0x2C($sp)
/* 1F84C 8002F04C 00004AAC */  sw         $t2, 0x0($v0)
/* 1F850 8002F050 04004BAC */  sw         $t3, 0x4($v0)
/* 1F854 8002F054 08004CAC */  sw         $t4, 0x8($v0)
/* 1F858 8002F058 0C0049AC */  sw         $t1, 0xC($v0)
/* 1F85C 8002F05C 3000AA8F */  lw         $t2, 0x30($sp)
/* 1F860 8002F060 3400AB8F */  lw         $t3, 0x34($sp)
/* 1F864 8002F064 3800AC8F */  lw         $t4, 0x38($sp)
/* 1F868 8002F068 3C00A98F */  lw         $t1, 0x3C($sp)
/* 1F86C 8002F06C 10004AAC */  sw         $t2, 0x10($v0)
/* 1F870 8002F070 14004BAC */  sw         $t3, 0x14($v0)
/* 1F874 8002F074 18004CAC */  sw         $t4, 0x18($v0)
/* 1F878 8002F078 1C0049AC */  sw         $t1, 0x1C($v0)
/* 1F87C 8002F07C E6F7000C */  jal        SBSP_IntroduceInstancesAndLights
/* 1F880 8002F080 21208002 */   addu      $a0, $s4, $zero
/* 1F884 8002F084 54BA8A27 */  addiu      $t2, $gp, %gp_rel(StackSave)
/* 1F888 8002F088 00005DAD */  sw         $sp, 0x0($t2)
/* 1F88C 8002F08C 801F0C3C */  lui        $t4, (0x1F8003F0 >> 16)
/* 1F890 8002F090 F0038C35 */  ori        $t4, $t4, (0x1F8003F0 & 0xFFFF)
/* 1F894 8002F094 21E88001 */  addu       $sp, $t4, $zero
/* 1F898 8002F098 58BA848F */  lw         $a0, %gp_rel(fxTracker)($gp)
/* 1F89C 8002F09C 9CBF868F */  lw         $a2, %gp_rel(gameTrackerX + 0x1D4)($gp)
/* 1F8A0 8002F0A0 F0AC878F */  lw         $a3, %gp_rel(theCamera + 0x60)($gp)
/* 1F8A4 8002F0A4 C8BD8527 */  addiu      $a1, $gp, %gp_rel(gameTrackerX)
/* 1F8A8 8002F0A8 D913010C */  jal        FX_DrawList
/* 1F8AC 8002F0AC 00000000 */   nop
/* 1F8B0 8002F0B0 F4BD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 1F8B4 8002F0B4 00000000 */  nop
/* 1F8B8 8002F0B8 3800438C */  lw         $v1, 0x38($v0)
/* 1F8BC 8002F0BC 0000E28E */  lw         $v0, 0x0($s7)
/* 1F8C0 8002F0C0 00000000 */  nop
/* 1F8C4 8002F0C4 06006214 */  bne        $v1, $v0, .L8002F0E0
/* 1F8C8 8002F0C8 00000000 */   nop
/* 1F8CC 8002F0CC 08BE848F */  lw         $a0, %gp_rel(gameTrackerX + 0x40)($gp)
/* 1F8D0 8002F0D0 9CBF858F */  lw         $a1, %gp_rel(gameTrackerX + 0x1D4)($gp)
/* 1F8D4 8002F0D4 F0AC868F */  lw         $a2, %gp_rel(theCamera + 0x60)($gp)
/* 1F8D8 8002F0D8 C613010C */  jal        FX_DrawReaver
/* 1F8DC 8002F0DC 00000000 */   nop
.L8002F0E0:
/* 1F8E0 8002F0E0 54BA8B27 */  addiu      $t3, $gp, %gp_rel(StackSave)
/* 1F8E4 8002F0E4 00007D8D */  lw         $sp, 0x0($t3)
/* 1F8E8 8002F0E8 00000000 */  nop
/* 1F8EC 8002F0EC 7400BF8F */  lw         $ra, 0x74($sp)
/* 1F8F0 8002F0F0 7000BE8F */  lw         $fp, 0x70($sp)
/* 1F8F4 8002F0F4 6C00B78F */  lw         $s7, 0x6C($sp)
/* 1F8F8 8002F0F8 6800B68F */  lw         $s6, 0x68($sp)
/* 1F8FC 8002F0FC 6400B58F */  lw         $s5, 0x64($sp)
/* 1F900 8002F100 6000B48F */  lw         $s4, 0x60($sp)
/* 1F904 8002F104 5C00B38F */  lw         $s3, 0x5C($sp)
/* 1F908 8002F108 5800B28F */  lw         $s2, 0x58($sp)
/* 1F90C 8002F10C 5400B18F */  lw         $s1, 0x54($sp)
/* 1F910 8002F110 5000B08F */  lw         $s0, 0x50($sp)
/* 1F914 8002F114 0800E003 */  jr         $ra
/* 1F918 8002F118 7800BD27 */   addiu     $sp, $sp, 0x78
.size MainRenderLevel, . - MainRenderLevel
