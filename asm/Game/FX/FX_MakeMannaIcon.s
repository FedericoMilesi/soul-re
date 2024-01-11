.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_MakeMannaIcon
/* 372F0 80046AF0 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 372F4 80046AF4 3000B2AF */  sw         $s2, 0x30($sp)
/* 372F8 80046AF8 21908000 */  addu       $s2, $a0, $zero
/* 372FC 80046AFC 3400B3AF */  sw         $s3, 0x34($sp)
/* 37300 80046B00 2198A000 */  addu       $s3, $a1, $zero
/* 37304 80046B04 2800B0AF */  sw         $s0, 0x28($sp)
/* 37308 80046B08 2180C000 */  addu       $s0, $a2, $zero
/* 3730C 80046B0C 0D80023C */  lui        $v0, %hi(objectAccess)
/* 37310 80046B10 3800B4AF */  sw         $s4, 0x38($sp)
/* 37314 80046B14 3CA25424 */  addiu      $s4, $v0, %lo(objectAccess)
/* 37318 80046B18 3C00BFAF */  sw         $ra, 0x3C($sp)
/* 3731C 80046B1C 2C00B1AF */  sw         $s1, 0x2C($sp)
/* 37320 80046B20 A400848E */  lw         $a0, 0xA4($s4)
/* 37324 80046B24 00000000 */  nop
/* 37328 80046B28 54008010 */  beqz       $a0, .L80046C7C
/* 3732C 80046B2C 2188E000 */   addu      $s1, $a3, $zero
/* 37330 80046B30 21280000 */  addu       $a1, $zero, $zero
/* 37334 80046B34 9D19010C */  jal        FX_GetTextureObject
/* 37338 80046B38 07000624 */   addiu     $a2, $zero, 0x7
/* 3733C 80046B3C 9602083C */  lui        $t0, (0x2962828 >> 16)
/* 37340 80046B40 28280835 */  ori        $t0, $t0, (0x2962828 & 0xFFFF)
/* 37344 80046B44 21204002 */  addu       $a0, $s2, $zero
/* 37348 80046B48 21286002 */  addu       $a1, $s3, $zero
/* 3734C 80046B4C 21305002 */  addu       $a2, $s2, $s0
/* 37350 80046B50 21387102 */  addu       $a3, $s3, $s1
/* 37354 80046B54 03000324 */  addiu      $v1, $zero, 0x3
/* 37358 80046B58 1000A3AF */  sw         $v1, 0x10($sp)
/* 3735C 80046B5C 1400A2AF */  sw         $v0, 0x14($sp)
/* 37360 80046B60 1800A8AF */  sw         $t0, 0x18($sp)
/* 37364 80046B64 1C00A8AF */  sw         $t0, 0x1C($sp)
/* 37368 80046B68 2000A8AF */  sw         $t0, 0x20($sp)
/* 3736C 80046B6C 431A010C */  jal        FX_SetupPolyGT4
/* 37370 80046B70 2400A8AF */   sw        $t0, 0x24($sp)
/* 37374 80046B74 21184000 */  addu       $v1, $v0, $zero
/* 37378 80046B78 05006010 */  beqz       $v1, .L80046B90
/* 3737C 80046B7C 00000000 */   nop
/* 37380 80046B80 1A006294 */  lhu        $v0, 0x1A($v1)
/* 37384 80046B84 00000000 */  nop
/* 37388 80046B88 20004234 */  ori        $v0, $v0, 0x20
/* 3738C 80046B8C 1A0062A4 */  sh         $v0, 0x1A($v1)
.L80046B90:
/* 37390 80046B90 5400848E */  lw         $a0, 0x54($s4)
/* 37394 80046B94 00000000 */  nop
/* 37398 80046B98 38008010 */  beqz       $a0, .L80046C7C
/* 3739C 80046B9C 21280000 */   addu      $a1, $zero, $zero
/* 373A0 80046BA0 9D19010C */  jal        FX_GetTextureObject
/* 373A4 80046BA4 02000624 */   addiu     $a2, $zero, 0x2
/* 373A8 80046BA8 21A04000 */  addu       $s4, $v0, $zero
/* 373AC 80046BAC 21800000 */  addu       $s0, $zero, $zero
/* 373B0 80046BB0 0180023C */  lui        $v0, %hi(jtbl_800102E8)
/* 373B4 80046BB4 E8025124 */  addiu      $s1, $v0, %lo(jtbl_800102E8)
.L80046BB8:
/* 373B8 80046BB8 0500022E */  sltiu      $v0, $s0, 0x5
/* 373BC 80046BBC 06004010 */  beqz       $v0, .L80046BD8
/* 373C0 80046BC0 21004426 */   addiu     $a0, $s2, 0x21
/* 373C4 80046BC4 0000228E */  lw         $v0, 0x0($s1)
/* 373C8 80046BC8 00000000 */  nop
/* 373CC 80046BCC 08004000 */  jr         $v0
/* 373D0 80046BD0 00000000 */   nop
jlabel .L80046BD4
/* 373D4 80046BD4 21004426 */  addiu      $a0, $s2, 0x21
.L80046BD8:
/* 373D8 80046BD8 FFFF6526 */  addiu      $a1, $s3, -0x1
/* 373DC 80046BDC 0E000624 */  addiu      $a2, $zero, 0xE
/* 373E0 80046BE0 081B0108 */  j          .L80046C20
/* 373E4 80046BE4 0C000224 */   addiu     $v0, $zero, 0xC
jlabel .L80046BE8
/* 373E8 80046BE8 03004426 */  addiu      $a0, $s2, 0x3
/* 373EC 80046BEC 05006526 */  addiu      $a1, $s3, 0x5
/* 373F0 80046BF0 0E000624 */  addiu      $a2, $zero, 0xE
/* 373F4 80046BF4 0C000224 */  addiu      $v0, $zero, 0xC
/* 373F8 80046BF8 7002033C */  lui        $v1, (0x2704B4B >> 16)
/* 373FC 80046BFC 111B0108 */  j          .L80046C44
/* 37400 80046C00 4B4B6334 */   ori       $v1, $v1, (0x2704B4B & 0xFFFF)
jlabel .L80046C04
/* 37404 80046C04 0D004426 */  addiu      $a0, $s2, 0xD
/* 37408 80046C08 0D1B0108 */  j          .L80046C34
/* 3740C 80046C0C 04006526 */   addiu     $a1, $s3, 0x4
jlabel .L80046C10
/* 37410 80046C10 03004426 */  addiu      $a0, $s2, 0x3
/* 37414 80046C14 10006526 */  addiu      $a1, $s3, 0x10
/* 37418 80046C18 13000624 */  addiu      $a2, $zero, 0x13
/* 3741C 80046C1C 10000224 */  addiu      $v0, $zero, 0x10
.L80046C20:
/* 37420 80046C20 4B02033C */  lui        $v1, (0x24B3232 >> 16)
/* 37424 80046C24 111B0108 */  j          .L80046C44
/* 37428 80046C28 32326334 */   ori       $v1, $v1, (0x24B3232 & 0xFFFF)
jlabel .L80046C2C
/* 3742C 80046C2C 20004426 */  addiu      $a0, $s2, 0x20
/* 37430 80046C30 0D006526 */  addiu      $a1, $s3, 0xD
.L80046C34:
/* 37434 80046C34 13000624 */  addiu      $a2, $zero, 0x13
/* 37438 80046C38 10000224 */  addiu      $v0, $zero, 0x10
/* 3743C 80046C3C 9602033C */  lui        $v1, (0x2966464 >> 16)
/* 37440 80046C40 64646334 */  ori        $v1, $v1, (0x2966464 & 0xFFFF)
.L80046C44:
/* 37444 80046C44 21308600 */  addu       $a2, $a0, $a2
/* 37448 80046C48 2138A200 */  addu       $a3, $a1, $v0
/* 3744C 80046C4C 03000224 */  addiu      $v0, $zero, 0x3
/* 37450 80046C50 1000A2AF */  sw         $v0, 0x10($sp)
/* 37454 80046C54 1400B4AF */  sw         $s4, 0x14($sp)
/* 37458 80046C58 1800A3AF */  sw         $v1, 0x18($sp)
/* 3745C 80046C5C 1C00A3AF */  sw         $v1, 0x1C($sp)
/* 37460 80046C60 2000A3AF */  sw         $v1, 0x20($sp)
/* 37464 80046C64 431A010C */  jal        FX_SetupPolyGT4
/* 37468 80046C68 2400A3AF */   sw        $v1, 0x24($sp)
/* 3746C 80046C6C 01001026 */  addiu      $s0, $s0, 0x1
/* 37470 80046C70 0500022A */  slti       $v0, $s0, 0x5
/* 37474 80046C74 D0FF4014 */  bnez       $v0, .L80046BB8
/* 37478 80046C78 04003126 */   addiu     $s1, $s1, 0x4
.L80046C7C:
/* 3747C 80046C7C 3C00BF8F */  lw         $ra, 0x3C($sp)
/* 37480 80046C80 3800B48F */  lw         $s4, 0x38($sp)
/* 37484 80046C84 3400B38F */  lw         $s3, 0x34($sp)
/* 37488 80046C88 3000B28F */  lw         $s2, 0x30($sp)
/* 3748C 80046C8C 2C00B18F */  lw         $s1, 0x2C($sp)
/* 37490 80046C90 2800B08F */  lw         $s0, 0x28($sp)
/* 37494 80046C94 0800E003 */  jr         $ra
/* 37498 80046C98 4000BD27 */   addiu     $sp, $sp, 0x40
.size FX_MakeMannaIcon, . - FX_MakeMannaIcon
