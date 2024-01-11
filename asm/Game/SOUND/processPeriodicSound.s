.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel processPeriodicSound
/* 2F984 8003F184 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 2F988 8003F188 2400B3AF */  sw         $s3, 0x24($sp)
/* 2F98C 8003F18C 5400B38F */  lw         $s3, 0x54($sp)
/* 2F990 8003F190 3000B6AF */  sw         $s6, 0x30($sp)
/* 2F994 8003F194 5000B68F */  lw         $s6, 0x50($sp)
/* 2F998 8003F198 3800BEAF */  sw         $fp, 0x38($sp)
/* 2F99C 8003F19C 21F08000 */  addu       $fp, $a0, $zero
/* 2F9A0 8003F1A0 2800B4AF */  sw         $s4, 0x28($sp)
/* 2F9A4 8003F1A4 21A0A000 */  addu       $s4, $a1, $zero
/* 2F9A8 8003F1A8 2C00B5AF */  sw         $s5, 0x2C($sp)
/* 2F9AC 8003F1AC 21A8C000 */  addu       $s5, $a2, $zero
/* 2F9B0 8003F1B0 3400B7AF */  sw         $s7, 0x34($sp)
/* 2F9B4 8003F1B4 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 2F9B8 8003F1B8 5800B18F */  lw         $s1, 0x58($sp)
/* 2F9BC 8003F1BC 01000424 */  addiu      $a0, $zero, 0x1
/* 2F9C0 8003F1C0 3C00BFAF */  sw         $ra, 0x3C($sp)
/* 2F9C4 8003F1C4 2000B2AF */  sw         $s2, 0x20($sp)
/* 2F9C8 8003F1C8 1800B0AF */  sw         $s0, 0x18($sp)
/* 2F9CC 8003F1CC 01006292 */  lbu        $v0, 0x1($s3)
/* 2F9D0 8003F1D0 D2BD9287 */  lh         $s2, %gp_rel(gameTrackerX + 0xA)($gp)
/* 2F9D4 8003F1D4 0F004330 */  andi       $v1, $v0, 0xF
/* 2F9D8 8003F1D8 17006410 */  beq        $v1, $a0, .L8003F238
/* 2F9DC 8003F1DC 21B8E000 */   addu      $s7, $a3, $zero
/* 2F9E0 8003F1E0 02006228 */  slti       $v0, $v1, 0x2
/* 2F9E4 8003F1E4 06004014 */  bnez       $v0, .L8003F200
/* 2F9E8 8003F1E8 FF000224 */   addiu     $v0, $zero, 0xFF
/* 2F9EC 8003F1EC 02000224 */  addiu      $v0, $zero, 0x2
/* 2F9F0 8003F1F0 85006210 */  beq        $v1, $v0, .L8003F408
/* 2F9F4 8003F1F4 03000224 */   addiu     $v0, $zero, 0x3
/* 2F9F8 8003F1F8 0F006210 */  beq        $v1, $v0, .L8003F238
/* 2F9FC 8003F1FC FF000224 */   addiu     $v0, $zero, 0xFF
.L8003F200:
/* 2FA00 8003F200 000062A2 */  sb         $v0, 0x0($s3)
/* 2FA04 8003F204 010064A2 */  sb         $a0, 0x1($s3)
/* 2FA08 8003F208 0C002292 */  lbu        $v0, 0xC($s1)
/* 2FA0C 8003F20C 00000000 */  nop
/* 2FA10 8003F210 020062A2 */  sb         $v0, 0x2($s3)
/* 2FA14 8003F214 0D002292 */  lbu        $v0, 0xD($s1)
/* 2FA18 8003F218 00000000 */  nop
/* 2FA1C 8003F21C F5004010 */  beqz       $v0, .L8003F5F4
/* 2FA20 8003F220 00000000 */   nop
/* 2FA24 8003F224 3AF2020C */  jal        func_800BC8E8
/* 2FA28 8003F228 00000000 */   nop
/* 2FA2C 8003F22C 0D002492 */  lbu        $a0, 0xD($s1)
/* 2FA30 8003F230 F5FC0008 */  j          .L8003F3D4
/* 2FA34 8003F234 40180400 */   sll       $v1, $a0, 1
.L8003F238:
/* 2FA38 8003F238 09008012 */  beqz       $s4, .L8003F260
/* 2FA3C 8003F23C 00000000 */   nop
/* 2FA40 8003F240 0500A012 */  beqz       $s5, .L8003F258
/* 2FA44 8003F244 00000000 */   nop
/* 2FA48 8003F248 EA004012 */  beqz       $s2, .L8003F5F4
/* 2FA4C 8003F24C 00000000 */   nop
/* 2FA50 8003F250 98FC0008 */  j          .L8003F260
/* 2FA54 8003F254 00000000 */   nop
.L8003F258:
/* 2FA58 8003F258 E6004016 */  bnez       $s2, .L8003F5F4
/* 2FA5C 8003F25C 00000000 */   nop
.L8003F260:
/* 2FA60 8003F260 03002492 */  lbu        $a0, 0x3($s1)
/* 2FA64 8003F264 21284002 */  addu       $a1, $s2, $zero
/* 2FA68 8003F268 2130E002 */  addu       $a2, $s7, $zero
/* 2FA6C 8003F26C F9FB000C */  jal        isOkayToPlaySound
/* 2FA70 8003F270 2138C002 */   addu      $a3, $s6, $zero
/* 2FA74 8003F274 DF004010 */  beqz       $v0, .L8003F5F4
/* 2FA78 8003F278 00000000 */   nop
/* 2FA7C 8003F27C 02006292 */  lbu        $v0, 0x2($s3)
/* 2FA80 8003F280 00000000 */  nop
/* 2FA84 8003F284 03004010 */  beqz       $v0, .L8003F294
/* 2FA88 8003F288 FFFF4224 */   addiu     $v0, $v0, -0x1
/* 2FA8C 8003F28C 7DFD0008 */  j          .L8003F5F4
/* 2FA90 8003F290 020062A2 */   sb        $v0, 0x2($s3)
.L8003F294:
/* 2FA94 8003F294 16FB000C */  jal        SndOpenSfxChannel
/* 2FA98 8003F298 21206002 */   addu      $a0, $s3, $zero
/* 2FA9C 8003F29C 21804000 */  addu       $s0, $v0, $zero
/* 2FAA0 8003F2A0 D4000012 */  beqz       $s0, .L8003F5F4
/* 2FAA4 8003F2A4 00000000 */   nop
/* 2FAA8 8003F2A8 0A002292 */  lbu        $v0, 0xA($s1)
/* 2FAAC 8003F2AC 00000000 */  nop
/* 2FAB0 8003F2B0 080002A6 */  sh         $v0, 0x8($s0)
/* 2FAB4 8003F2B4 0B002292 */  lbu        $v0, 0xB($s1)
/* 2FAB8 8003F2B8 00000000 */  nop
/* 2FABC 8003F2BC 0D004010 */  beqz       $v0, .L8003F2F4
/* 2FAC0 8003F2C0 00000000 */   nop
/* 2FAC4 8003F2C4 3AF2020C */  jal        func_800BC8E8
/* 2FAC8 8003F2C8 00000000 */   nop
/* 2FACC 8003F2CC 0B002392 */  lbu        $v1, 0xB($s1)
/* 2FAD0 8003F2D0 00000000 */  nop
/* 2FAD4 8003F2D4 40180300 */  sll        $v1, $v1, 1
/* 2FAD8 8003F2D8 1A004300 */  div        $zero, $v0, $v1
/* 2FADC 8003F2DC 10200000 */  mfhi       $a0
/* 2FAE0 8003F2E0 0B002292 */  lbu        $v0, 0xB($s1)
/* 2FAE4 8003F2E4 08000396 */  lhu        $v1, 0x8($s0)
/* 2FAE8 8003F2E8 23104400 */  subu       $v0, $v0, $a0
/* 2FAEC 8003F2EC 21186200 */  addu       $v1, $v1, $v0
/* 2FAF0 8003F2F0 080003A6 */  sh         $v1, 0x8($s0)
.L8003F2F4:
/* 2FAF4 8003F2F4 06002296 */  lhu        $v0, 0x6($s1)
/* 2FAF8 8003F2F8 00000000 */  nop
/* 2FAFC 8003F2FC 160002A6 */  sh         $v0, 0x16($s0)
/* 2FB00 8003F300 08002296 */  lhu        $v0, 0x8($s1)
/* 2FB04 8003F304 00000000 */  nop
/* 2FB08 8003F308 0C004010 */  beqz       $v0, .L8003F33C
/* 2FB0C 8003F30C 00000000 */   nop
/* 2FB10 8003F310 3AF2020C */  jal        func_800BC8E8
/* 2FB14 8003F314 00000000 */   nop
/* 2FB18 8003F318 08002496 */  lhu        $a0, 0x8($s1)
/* 2FB1C 8003F31C 00000000 */  nop
/* 2FB20 8003F320 40180400 */  sll        $v1, $a0, 1
/* 2FB24 8003F324 1A004300 */  div        $zero, $v0, $v1
/* 2FB28 8003F328 10180000 */  mfhi       $v1
/* 2FB2C 8003F32C 16000296 */  lhu        $v0, 0x16($s0)
/* 2FB30 8003F330 23208300 */  subu       $a0, $a0, $v1
/* 2FB34 8003F334 21104400 */  addu       $v0, $v0, $a0
/* 2FB38 8003F338 160002A6 */  sh         $v0, 0x16($s0)
.L8003F33C:
/* 2FB3C 8003F33C 01002292 */  lbu        $v0, 0x1($s1)
/* 2FB40 8003F340 00000000 */  nop
/* 2FB44 8003F344 0200422C */  sltiu      $v0, $v0, 0x2
/* 2FB48 8003F348 09004014 */  bnez       $v0, .L8003F370
/* 2FB4C 8003F34C 21180000 */   addu      $v1, $zero, $zero
/* 2FB50 8003F350 3AF2020C */  jal        func_800BC8E8
/* 2FB54 8003F354 00000000 */   nop
/* 2FB58 8003F358 01002392 */  lbu        $v1, 0x1($s1)
/* 2FB5C 8003F35C 00000000 */  nop
/* 2FB60 8003F360 1A004300 */  div        $zero, $v0, $v1
/* 2FB64 8003F364 10180000 */  mfhi       $v1
/* 2FB68 8003F368 DDFC0008 */  j          .L8003F374
/* 2FB6C 8003F36C 40100300 */   sll       $v0, $v1, 1
.L8003F370:
/* 2FB70 8003F370 40100300 */  sll        $v0, $v1, 1
.L8003F374:
/* 2FB74 8003F374 21105100 */  addu       $v0, $v0, $s1
/* 2FB78 8003F378 12004594 */  lhu        $a1, 0x12($v0)
/* 2FB7C 8003F37C 16000686 */  lh         $a2, 0x16($s0)
/* 2FB80 8003F380 08000786 */  lh         $a3, 0x8($s0)
/* 2FB84 8003F384 04002296 */  lhu        $v0, 0x4($s1)
/* 2FB88 8003F388 2120C003 */  addu       $a0, $fp, $zero
/* 2FB8C 8003F38C 1300010C */  jal        SOUND_Play3dSound
/* 2FB90 8003F390 1000A2AF */   sw        $v0, 0x10($sp)
/* 2FB94 8003F394 16004010 */  beqz       $v0, .L8003F3F0
/* 2FB98 8003F398 040002AE */   sw        $v0, 0x4($s0)
/* 2FB9C 8003F39C 02000224 */  addiu      $v0, $zero, 0x2
/* 2FBA0 8003F3A0 010062A2 */  sb         $v0, 0x1($s3)
/* 2FBA4 8003F3A4 0E002292 */  lbu        $v0, 0xE($s1)
/* 2FBA8 8003F3A8 00000000 */  nop
/* 2FBAC 8003F3AC 020062A2 */  sb         $v0, 0x2($s3)
/* 2FBB0 8003F3B0 0F002292 */  lbu        $v0, 0xF($s1)
/* 2FBB4 8003F3B4 00000000 */  nop
/* 2FBB8 8003F3B8 8E004010 */  beqz       $v0, .L8003F5F4
/* 2FBBC 8003F3BC 00000000 */   nop
/* 2FBC0 8003F3C0 3AF2020C */  jal        func_800BC8E8
/* 2FBC4 8003F3C4 00000000 */   nop
/* 2FBC8 8003F3C8 0F002492 */  lbu        $a0, 0xF($s1)
/* 2FBCC 8003F3CC 00000000 */  nop
/* 2FBD0 8003F3D0 40180400 */  sll        $v1, $a0, 1
.L8003F3D4:
/* 2FBD4 8003F3D4 1A004300 */  div        $zero, $v0, $v1
/* 2FBD8 8003F3D8 10180000 */  mfhi       $v1
/* 2FBDC 8003F3DC 02006292 */  lbu        $v0, 0x2($s3)
/* 2FBE0 8003F3E0 23208300 */  subu       $a0, $a0, $v1
/* 2FBE4 8003F3E4 21104400 */  addu       $v0, $v0, $a0
/* 2FBE8 8003F3E8 7DFD0008 */  j          .L8003F5F4
/* 2FBEC 8003F3EC 020062A2 */   sb        $v0, 0x2($s3)
.L8003F3F0:
/* 2FBF0 8003F3F0 00006492 */  lbu        $a0, 0x0($s3)
/* 2FBF4 8003F3F4 28FB000C */  jal        SndCloseSfxChannel
/* 2FBF8 8003F3F8 00000000 */   nop
/* 2FBFC 8003F3FC FF000224 */  addiu      $v0, $zero, 0xFF
/* 2FC00 8003F400 7DFD0008 */  j          .L8003F5F4
/* 2FC04 8003F404 000062A2 */   sb        $v0, 0x0($s3)
.L8003F408:
/* 2FC08 8003F408 00006492 */  lbu        $a0, 0x0($s3)
/* 2FC0C 8003F40C 32FB000C */  jal        SndGetSfxChannel
/* 2FC10 8003F410 00000000 */   nop
/* 2FC14 8003F414 21804000 */  addu       $s0, $v0, $zero
/* 2FC18 8003F418 0400048E */  lw         $a0, 0x4($s0)
/* 2FC1C 8003F41C FE01010C */  jal        SndIsPlayingOrRequested
/* 2FC20 8003F420 00000000 */   nop
/* 2FC24 8003F424 6D004010 */  beqz       $v0, .L8003F5DC
/* 2FC28 8003F428 21206002 */   addu      $a0, $s3, $zero
/* 2FC2C 8003F42C 0400048E */  lw         $a0, 0x4($s0)
/* 2FC30 8003F430 F601010C */  jal        SndIsPlaying
/* 2FC34 8003F434 00000000 */   nop
/* 2FC38 8003F438 6E004010 */  beqz       $v0, .L8003F5F4
/* 2FC3C 8003F43C 00000000 */   nop
/* 2FC40 8003F440 09008012 */  beqz       $s4, .L8003F468
/* 2FC44 8003F444 00000000 */   nop
/* 2FC48 8003F448 0500A012 */  beqz       $s5, .L8003F460
/* 2FC4C 8003F44C 00000000 */   nop
/* 2FC50 8003F450 5E004012 */  beqz       $s2, .L8003F5CC
/* 2FC54 8003F454 00000000 */   nop
/* 2FC58 8003F458 1AFD0008 */  j          .L8003F468
/* 2FC5C 8003F45C 00000000 */   nop
.L8003F460:
/* 2FC60 8003F460 5A004016 */  bnez       $s2, .L8003F5CC
/* 2FC64 8003F464 00000000 */   nop
.L8003F468:
/* 2FC68 8003F468 03002492 */  lbu        $a0, 0x3($s1)
/* 2FC6C 8003F46C 21284002 */  addu       $a1, $s2, $zero
/* 2FC70 8003F470 2130E002 */  addu       $a2, $s7, $zero
/* 2FC74 8003F474 F9FB000C */  jal        isOkayToPlaySound
/* 2FC78 8003F478 2138C002 */   addu      $a3, $s6, $zero
/* 2FC7C 8003F47C 53004010 */  beqz       $v0, .L8003F5CC
/* 2FC80 8003F480 00000000 */   nop
/* 2FC84 8003F484 02006292 */  lbu        $v0, 0x2($s3)
/* 2FC88 8003F488 00000000 */  nop
/* 2FC8C 8003F48C 3F004014 */  bnez       $v0, .L8003F58C
/* 2FC90 8003F490 FFFF4224 */   addiu     $v0, $v0, -0x1
/* 2FC94 8003F494 10002292 */  lbu        $v0, 0x10($s1)
/* 2FC98 8003F498 00000000 */  nop
/* 2FC9C 8003F49C 09004010 */  beqz       $v0, .L8003F4C4
/* 2FCA0 8003F4A0 00000000 */   nop
/* 2FCA4 8003F4A4 0400048E */  lw         $a0, 0x4($s0)
/* 2FCA8 8003F4A8 1C02010C */  jal        SndEndLoop
/* 2FCAC 8003F4AC 00000000 */   nop
/* 2FCB0 8003F4B0 21206002 */  addu       $a0, $s3, $zero
/* 2FCB4 8003F4B4 3EFC000C */  jal        setPeriodicSoundStateOff
/* 2FCB8 8003F4B8 21282002 */   addu      $a1, $s1, $zero
/* 2FCBC 8003F4BC 64FD0008 */  j          .L8003F590
/* 2FCC0 8003F4C0 00000000 */   nop
.L8003F4C4:
/* 2FCC4 8003F4C4 0B002292 */  lbu        $v0, 0xB($s1)
/* 2FCC8 8003F4C8 00000000 */  nop
/* 2FCCC 8003F4CC 0E004010 */  beqz       $v0, .L8003F508
/* 2FCD0 8003F4D0 00000000 */   nop
/* 2FCD4 8003F4D4 0A002292 */  lbu        $v0, 0xA($s1)
/* 2FCD8 8003F4D8 3AF2020C */  jal        func_800BC8E8
/* 2FCDC 8003F4DC 080002A6 */   sh        $v0, 0x8($s0)
/* 2FCE0 8003F4E0 0B002392 */  lbu        $v1, 0xB($s1)
/* 2FCE4 8003F4E4 00000000 */  nop
/* 2FCE8 8003F4E8 40180300 */  sll        $v1, $v1, 1
/* 2FCEC 8003F4EC 1A004300 */  div        $zero, $v0, $v1
/* 2FCF0 8003F4F0 10200000 */  mfhi       $a0
/* 2FCF4 8003F4F4 0B002292 */  lbu        $v0, 0xB($s1)
/* 2FCF8 8003F4F8 08000396 */  lhu        $v1, 0x8($s0)
/* 2FCFC 8003F4FC 23104400 */  subu       $v0, $v0, $a0
/* 2FD00 8003F500 21186200 */  addu       $v1, $v1, $v0
/* 2FD04 8003F504 080003A6 */  sh         $v1, 0x8($s0)
.L8003F508:
/* 2FD08 8003F508 08002296 */  lhu        $v0, 0x8($s1)
/* 2FD0C 8003F50C 00000000 */  nop
/* 2FD10 8003F510 0D004010 */  beqz       $v0, .L8003F548
/* 2FD14 8003F514 00000000 */   nop
/* 2FD18 8003F518 06002296 */  lhu        $v0, 0x6($s1)
/* 2FD1C 8003F51C 3AF2020C */  jal        func_800BC8E8
/* 2FD20 8003F520 160002A6 */   sh        $v0, 0x16($s0)
/* 2FD24 8003F524 08002496 */  lhu        $a0, 0x8($s1)
/* 2FD28 8003F528 00000000 */  nop
/* 2FD2C 8003F52C 40180400 */  sll        $v1, $a0, 1
/* 2FD30 8003F530 1A004300 */  div        $zero, $v0, $v1
/* 2FD34 8003F534 10180000 */  mfhi       $v1
/* 2FD38 8003F538 16000296 */  lhu        $v0, 0x16($s0)
/* 2FD3C 8003F53C 23208300 */  subu       $a0, $a0, $v1
/* 2FD40 8003F540 21104400 */  addu       $v0, $v0, $a0
/* 2FD44 8003F544 160002A6 */  sh         $v0, 0x16($s0)
.L8003F548:
/* 2FD48 8003F548 0E002292 */  lbu        $v0, 0xE($s1)
/* 2FD4C 8003F54C 00000000 */  nop
/* 2FD50 8003F550 020062A2 */  sb         $v0, 0x2($s3)
/* 2FD54 8003F554 0F002292 */  lbu        $v0, 0xF($s1)
/* 2FD58 8003F558 00000000 */  nop
/* 2FD5C 8003F55C 0C004010 */  beqz       $v0, .L8003F590
/* 2FD60 8003F560 00000000 */   nop
/* 2FD64 8003F564 3AF2020C */  jal        func_800BC8E8
/* 2FD68 8003F568 00000000 */   nop
/* 2FD6C 8003F56C 0F002492 */  lbu        $a0, 0xF($s1)
/* 2FD70 8003F570 00000000 */  nop
/* 2FD74 8003F574 40180400 */  sll        $v1, $a0, 1
/* 2FD78 8003F578 1A004300 */  div        $zero, $v0, $v1
/* 2FD7C 8003F57C 10180000 */  mfhi       $v1
/* 2FD80 8003F580 02006292 */  lbu        $v0, 0x2($s3)
/* 2FD84 8003F584 23208300 */  subu       $a0, $a0, $v1
/* 2FD88 8003F588 21104400 */  addu       $v0, $v0, $a0
.L8003F58C:
/* 2FD8C 8003F58C 020062A2 */  sb         $v0, 0x2($s3)
.L8003F590:
/* 2FD90 8003F590 01006392 */  lbu        $v1, 0x1($s3)
/* 2FD94 8003F594 00000000 */  nop
/* 2FD98 8003F598 10006230 */  andi       $v0, $v1, 0x10
/* 2FD9C 8003F59C 13004010 */  beqz       $v0, .L8003F5EC
/* 2FDA0 8003F5A0 EF006230 */   andi      $v0, $v1, 0xEF
/* 2FDA4 8003F5A4 010062A2 */  sb         $v0, 0x1($s3)
/* 2FDA8 8003F5A8 04002296 */  lhu        $v0, 0x4($s1)
/* 2FDAC 8003F5AC 16000686 */  lh         $a2, 0x16($s0)
/* 2FDB0 8003F5B0 08000786 */  lh         $a3, 0x8($s0)
/* 2FDB4 8003F5B4 1000A2AF */  sw         $v0, 0x10($sp)
/* 2FDB8 8003F5B8 0400058E */  lw         $a1, 0x4($s0)
/* 2FDBC 8003F5BC A200010C */  jal        SOUND_Update3dSound
/* 2FDC0 8003F5C0 2120C003 */   addu      $a0, $fp, $zero
/* 2FDC4 8003F5C4 0B004014 */  bnez       $v0, .L8003F5F4
/* 2FDC8 8003F5C8 00000000 */   nop
.L8003F5CC:
/* 2FDCC 8003F5CC 0400048E */  lw         $a0, 0x4($s0)
/* 2FDD0 8003F5D0 1C02010C */  jal        SndEndLoop
/* 2FDD4 8003F5D4 00000000 */   nop
/* 2FDD8 8003F5D8 21206002 */  addu       $a0, $s3, $zero
.L8003F5DC:
/* 2FDDC 8003F5DC 3EFC000C */  jal        setPeriodicSoundStateOff
/* 2FDE0 8003F5E0 21282002 */   addu      $a1, $s1, $zero
/* 2FDE4 8003F5E4 7DFD0008 */  j          .L8003F5F4
/* 2FDE8 8003F5E8 00000000 */   nop
.L8003F5EC:
/* 2FDEC 8003F5EC 10006234 */  ori        $v0, $v1, 0x10
/* 2FDF0 8003F5F0 010062A2 */  sb         $v0, 0x1($s3)
.L8003F5F4:
/* 2FDF4 8003F5F4 3C00BF8F */  lw         $ra, 0x3C($sp)
/* 2FDF8 8003F5F8 3800BE8F */  lw         $fp, 0x38($sp)
/* 2FDFC 8003F5FC 3400B78F */  lw         $s7, 0x34($sp)
/* 2FE00 8003F600 3000B68F */  lw         $s6, 0x30($sp)
/* 2FE04 8003F604 2C00B58F */  lw         $s5, 0x2C($sp)
/* 2FE08 8003F608 2800B48F */  lw         $s4, 0x28($sp)
/* 2FE0C 8003F60C 2400B38F */  lw         $s3, 0x24($sp)
/* 2FE10 8003F610 2000B28F */  lw         $s2, 0x20($sp)
/* 2FE14 8003F614 1C00B18F */  lw         $s1, 0x1C($sp)
/* 2FE18 8003F618 1800B08F */  lw         $s0, 0x18($sp)
/* 2FE1C 8003F61C 0800E003 */  jr         $ra
/* 2FE20 8003F620 4000BD27 */   addiu     $sp, $sp, 0x40
.size processPeriodicSound, . - processPeriodicSound
