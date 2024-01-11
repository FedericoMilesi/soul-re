.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_DrawAllGeneralEffects
/* 3C34C 8004BB4C C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 3C350 8004BB50 2000B0AF */  sw         $s0, 0x20($sp)
/* 3C354 8004BB54 649A908F */  lw         $s0, %gp_rel(FX_GeneralEffectTracker)($gp)
/* 3C358 8004BB58 2400B1AF */  sw         $s1, 0x24($sp)
/* 3C35C 8004BB5C 21888000 */  addu       $s1, $a0, $zero
/* 3C360 8004BB60 2C00B3AF */  sw         $s3, 0x2C($sp)
/* 3C364 8004BB64 2198A000 */  addu       $s3, $a1, $zero
/* 3C368 8004BB68 3000B4AF */  sw         $s4, 0x30($sp)
/* 3C36C 8004BB6C 21A0C000 */  addu       $s4, $a2, $zero
/* 3C370 8004BB70 2800B2AF */  sw         $s2, 0x28($sp)
/* 3C374 8004BB74 2190E000 */  addu       $s2, $a3, $zero
/* 3C378 8004BB78 62000012 */  beqz       $s0, .L8004BD04
/* 3C37C 8004BB7C 3400BFAF */   sw        $ra, 0x34($sp)
.L8004BB80:
/* 3C380 8004BB80 0C000592 */  lbu        $a1, 0xC($s0)
/* 3C384 8004BB84 00000000 */  nop
/* 3C388 8004BB88 8000A230 */  andi       $v0, $a1, 0x80
/* 3C38C 8004BB8C 59004010 */  beqz       $v0, .L8004BCF4
/* 3C390 8004BB90 00000000 */   nop
/* 3C394 8004BB94 0800048E */  lw         $a0, 0x8($s0)
/* 3C398 8004BB98 00000000 */  nop
/* 3C39C 8004BB9C 0B008010 */  beqz       $a0, .L8004BBCC
/* 3C3A0 8004BBA0 FF00A330 */   andi      $v1, $a1, 0xFF
/* 3C3A4 8004BBA4 1400828C */  lw         $v0, 0x14($a0)
/* 3C3A8 8004BBA8 00000000 */  nop
/* 3C3AC 8004BBAC 00084230 */  andi       $v0, $v0, 0x800
/* 3C3B0 8004BBB0 50004014 */  bnez       $v0, .L8004BCF4
/* 3C3B4 8004BBB4 0004033C */   lui       $v1, (0x4000000 >> 16)
/* 3C3B8 8004BBB8 1800828C */  lw         $v0, 0x18($a0)
/* 3C3BC 8004BBBC 00000000 */  nop
/* 3C3C0 8004BBC0 24104300 */  and        $v0, $v0, $v1
/* 3C3C4 8004BBC4 4B004014 */  bnez       $v0, .L8004BCF4
/* 3C3C8 8004BBC8 FF00A330 */   andi      $v1, $a1, 0xFF
.L8004BBCC:
/* 3C3CC 8004BBCC 83000224 */  addiu      $v0, $zero, 0x83
/* 3C3D0 8004BBD0 15006214 */  bne        $v1, $v0, .L8004BC28
/* 3C3D4 8004BBD4 82000224 */   addiu     $v0, $zero, 0x82
/* 3C3D8 8004BBD8 0E000286 */  lh         $v0, 0xE($s0)
/* 3C3DC 8004BBDC 0E000396 */  lhu        $v1, 0xE($s0)
/* 3C3E0 8004BBE0 09004018 */  blez       $v0, .L8004BC08
/* 3C3E4 8004BBE4 21400002 */   addu      $t0, $s0, $zero
/* 3C3E8 8004BBE8 04C08297 */  lhu        $v0, %gp_rel(gameTrackerX + 0x23C)($gp)
/* 3C3EC 8004BBEC 00000000 */  nop
/* 3C3F0 8004BBF0 23106200 */  subu       $v0, $v1, $v0
/* 3C3F4 8004BBF4 0E0002A6 */  sh         $v0, 0xE($s0)
/* 3C3F8 8004BBF8 00140200 */  sll        $v0, $v0, 16
/* 3C3FC 8004BBFC 03004104 */  bgez       $v0, .L8004BC0C
/* 3C400 8004BC00 21282002 */   addu      $a1, $s1, $zero
/* 3C404 8004BC04 0E0000A6 */  sh         $zero, 0xE($s0)
.L8004BC08:
/* 3C408 8004BC08 21282002 */  addu       $a1, $s1, $zero
.L8004BC0C:
/* 3C40C 8004BC0C 21306002 */  addu       $a2, $s3, $zero
/* 3C410 8004BC10 21388002 */  addu       $a3, $s4, $zero
/* 3C414 8004BC14 1000B2AF */  sw         $s2, 0x10($sp)
/* 3C418 8004BC18 09F2000C */  jal        PIPE3D_DoGlow
/* 3C41C 8004BC1C 1400A8AF */   sw        $t0, 0x14($sp)
/* 3C420 8004BC20 3D2F0108 */  j          .L8004BCF4
/* 3C424 8004BC24 00000000 */   nop
.L8004BC28:
/* 3C428 8004BC28 09006214 */  bne        $v1, $v0, .L8004BC50
/* 3C42C 8004BC2C 84000224 */   addiu     $v0, $zero, 0x84
/* 3C430 8004BC30 21282002 */  addu       $a1, $s1, $zero
/* 3C434 8004BC34 21306002 */  addu       $a2, $s3, $zero
/* 3C438 8004BC38 21388002 */  addu       $a3, $s4, $zero
/* 3C43C 8004BC3C 1000B2AF */  sw         $s2, 0x10($sp)
/* 3C440 8004BC40 95F1000C */  jal        PIPE3D_HalvePlaneGetRingPoints
/* 3C444 8004BC44 1400B0AF */   sw        $s0, 0x14($sp)
/* 3C448 8004BC48 3D2F0108 */  j          .L8004BCF4
/* 3C44C 8004BC4C 00000000 */   nop
.L8004BC50:
/* 3C450 8004BC50 06006214 */  bne        $v1, $v0, .L8004BC6C
/* 3C454 8004BC54 85000224 */   addiu     $v0, $zero, 0x85
/* 3C458 8004BC58 21202002 */  addu       $a0, $s1, $zero
/* 3C45C 8004BC5C 4330010C */  jal        FX_DrawBlastring
/* 3C460 8004BC60 21280002 */   addu      $a1, $s0, $zero
/* 3C464 8004BC64 3D2F0108 */  j          .L8004BCF4
/* 3C468 8004BC68 00000000 */   nop
.L8004BC6C:
/* 3C46C 8004BC6C 0E006214 */  bne        $v1, $v0, .L8004BCA8
/* 3C470 8004BC70 86000224 */   addiu     $v0, $zero, 0x86
/* 3C474 8004BC74 10000786 */  lh         $a3, 0x10($s0)
/* 3C478 8004BC78 12000386 */  lh         $v1, 0x12($s0)
/* 3C47C 8004BC7C 20000224 */  addiu      $v0, $zero, 0x20
/* 3C480 8004BC80 1400A2AF */  sw         $v0, 0x14($sp)
/* 3C484 8004BC84 1000A3AF */  sw         $v1, 0x10($sp)
/* 3C488 8004BC88 1400028E */  lw         $v0, 0x14($s0)
/* 3C48C 8004BC8C 21202002 */  addu       $a0, $s1, $zero
/* 3C490 8004BC90 1800A2AF */  sw         $v0, 0x18($sp)
/* 3C494 8004BC94 0800068E */  lw         $a2, 0x8($s0)
/* 3C498 8004BC98 773D010C */  jal        FX_LightHouse
/* 3C49C 8004BC9C 21284002 */   addu      $a1, $s2, $zero
/* 3C4A0 8004BCA0 3D2F0108 */  j          .L8004BCF4
/* 3C4A4 8004BCA4 00000000 */   nop
.L8004BCA8:
/* 3C4A8 8004BCA8 06006214 */  bne        $v1, $v0, .L8004BCC4
/* 3C4AC 8004BCAC 87000224 */   addiu     $v0, $zero, 0x87
/* 3C4B0 8004BCB0 21202002 */  addu       $a0, $s1, $zero
/* 3C4B4 8004BCB4 023B010C */  jal        FX_DrawFField
/* 3C4B8 8004BCB8 21280002 */   addu      $a1, $s0, $zero
/* 3C4BC 8004BCBC 3D2F0108 */  j          .L8004BCF4
/* 3C4C0 8004BCC0 00000000 */   nop
.L8004BCC4:
/* 3C4C4 8004BCC4 07006214 */  bne        $v1, $v0, .L8004BCE4
/* 3C4C8 8004BCC8 88000224 */   addiu     $v0, $zero, 0x88
/* 3C4CC 8004BCCC 21200002 */  addu       $a0, $s0, $zero
/* 3C4D0 8004BCD0 21282002 */  addu       $a1, $s1, $zero
/* 3C4D4 8004BCD4 262E010C */  jal        FX_DrawLightning
/* 3C4D8 8004BCD8 21304002 */   addu      $a2, $s2, $zero
/* 3C4DC 8004BCDC 3D2F0108 */  j          .L8004BCF4
/* 3C4E0 8004BCE0 00000000 */   nop
.L8004BCE4:
/* 3C4E4 8004BCE4 03006214 */  bne        $v1, $v0, .L8004BCF4
/* 3C4E8 8004BCE8 00000000 */   nop
/* 3C4EC 8004BCEC CA30010C */  jal        FX_DrawFlash
/* 3C4F0 8004BCF0 21200002 */   addu      $a0, $s0, $zero
.L8004BCF4:
/* 3C4F4 8004BCF4 0000108E */  lw         $s0, 0x0($s0)
/* 3C4F8 8004BCF8 00000000 */  nop
/* 3C4FC 8004BCFC A0FF0016 */  bnez       $s0, .L8004BB80
/* 3C500 8004BD00 00000000 */   nop
.L8004BD04:
/* 3C504 8004BD04 3400BF8F */  lw         $ra, 0x34($sp)
/* 3C508 8004BD08 3000B48F */  lw         $s4, 0x30($sp)
/* 3C50C 8004BD0C 2C00B38F */  lw         $s3, 0x2C($sp)
/* 3C510 8004BD10 2800B28F */  lw         $s2, 0x28($sp)
/* 3C514 8004BD14 2400B18F */  lw         $s1, 0x24($sp)
/* 3C518 8004BD18 2000B08F */  lw         $s0, 0x20($sp)
/* 3C51C 8004BD1C 0800E003 */  jr         $ra
/* 3C520 8004BD20 3800BD27 */   addiu     $sp, $sp, 0x38
.size FX_DrawAllGeneralEffects, . - FX_DrawAllGeneralEffects
