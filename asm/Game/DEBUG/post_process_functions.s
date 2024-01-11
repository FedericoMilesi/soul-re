.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel post_process_functions
/* 4314 80013B14 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 4318 80013B18 1000B0AF */  sw         $s0, 0x10($sp)
/* 431C 80013B1C 21808000 */  addu       $s0, $a0, $zero
/* 4320 80013B20 0D80023C */  lui        $v0, %hi(debugSoundMenu)
/* 4324 80013B24 AC204224 */  addiu      $v0, $v0, %lo(debugSoundMenu)
/* 4328 80013B28 1F00A214 */  bne        $a1, $v0, .L80013BA8
/* 432C 80013B2C 1400BFAF */   sw        $ra, 0x14($sp)
/* 4330 80013B30 6F01010C */  jal        SOUND_SetMusicVolume
/* 4334 80013B34 FFFF0424 */   addiu     $a0, $zero, -0x1
/* 4338 80013B38 7C01010C */  jal        SOUND_SetSfxVolume
/* 433C 80013B3C FFFF0424 */   addiu     $a0, $zero, -0x1
/* 4340 80013B40 8901010C */  jal        SOUND_SetVoiceVolume
/* 4344 80013B44 FFFF0424 */   addiu     $a0, $zero, -0x1
/* 4348 80013B48 C000028E */  lw         $v0, 0xC0($s0)
/* 434C 80013B4C 0800033C */  lui        $v1, (0x80000 >> 16)
/* 4350 80013B50 24104300 */  and        $v0, $v0, $v1
/* 4354 80013B54 03004010 */  beqz       $v0, .L80013B64
/* 4358 80013B58 01000224 */   addiu     $v0, $zero, 0x1
/* 435C 80013B5C DA4E0008 */  j          .L80013B68
/* 4360 80013B60 C20102A2 */   sb        $v0, 0x1C2($s0)
.L80013B64:
/* 4364 80013B64 C20100A2 */  sb         $zero, 0x1C2($s0)
.L80013B68:
/* 4368 80013B68 C400028E */  lw         $v0, 0xC4($s0)
/* 436C 80013B6C 00000000 */  nop
/* 4370 80013B70 00104230 */  andi       $v0, $v0, 0x1000
/* 4374 80013B74 03004010 */  beqz       $v0, .L80013B84
/* 4378 80013B78 01000224 */   addiu     $v0, $zero, 0x1
/* 437C 80013B7C E24E0008 */  j          .L80013B88
/* 4380 80013B80 C10102A2 */   sb        $v0, 0x1C1($s0)
.L80013B84:
/* 4384 80013B84 C10100A2 */  sb         $zero, 0x1C1($s0)
.L80013B88:
/* 4388 80013B88 C400028E */  lw         $v0, 0xC4($s0)
/* 438C 80013B8C 00000000 */  nop
/* 4390 80013B90 00204230 */  andi       $v0, $v0, 0x2000
/* 4394 80013B94 03004010 */  beqz       $v0, .L80013BA4
/* 4398 80013B98 01000224 */   addiu     $v0, $zero, 0x1
/* 439C 80013B9C EA4E0008 */  j          .L80013BA8
/* 43A0 80013BA0 C00102A2 */   sb        $v0, 0x1C0($s0)
.L80013BA4:
/* 43A4 80013BA4 C00100A2 */  sb         $zero, 0x1C0($s0)
.L80013BA8:
/* 43A8 80013BA8 1400BF8F */  lw         $ra, 0x14($sp)
/* 43AC 80013BAC 1000B08F */  lw         $s0, 0x10($sp)
/* 43B0 80013BB0 0800E003 */  jr         $ra
/* 43B4 80013BB4 1800BD27 */   addiu     $sp, $sp, 0x18
.size post_process_functions, . - post_process_functions
