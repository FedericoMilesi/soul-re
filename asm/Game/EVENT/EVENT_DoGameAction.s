.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_DoGameAction
/* 542E0 80063AE0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 542E4 80063AE4 2000B2AF */  sw         $s2, 0x20($sp)
/* 542E8 80063AE8 21908000 */  addu       $s2, $a0, $zero
/* 542EC 80063AEC 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 542F0 80063AF0 01001124 */  addiu      $s1, $zero, 0x1
/* 542F4 80063AF4 2800BFAF */  sw         $ra, 0x28($sp)
/* 542F8 80063AF8 2400B3AF */  sw         $s3, 0x24($sp)
/* 542FC 80063AFC 1800B0AF */  sw         $s0, 0x18($sp)
/* 54300 80063B00 1000B1AF */  sw         $s1, 0x10($sp)
/* 54304 80063B04 1400B1AF */  sw         $s1, 0x14($sp)
/* 54308 80063B08 0000428E */  lw         $v0, 0x0($s2)
/* 5430C 80063B0C FFFF1324 */  addiu      $s3, $zero, -0x1
/* 54310 80063B10 A8005310 */  beq        $v0, $s3, .L80063DB4
/* 54314 80063B14 2120A000 */   addu      $a0, $a1, $zero
/* 54318 80063B18 1000A527 */  addiu      $a1, $sp, 0x10
/* 5431C 80063B1C 008E010C */  jal        EVENT_ParseOperand2
/* 54320 80063B20 1400A627 */   addiu     $a2, $sp, 0x14
/* 54324 80063B24 21804000 */  addu       $s0, $v0, $zero
/* 54328 80063B28 0000448E */  lw         $a0, 0x0($s2)
/* 5432C 80063B2C 87000224 */  addiu      $v0, $zero, 0x87
/* 54330 80063B30 8F008210 */  beq        $a0, $v0, .L80063D70
/* 54334 80063B34 88008228 */   slti      $v0, $a0, 0x88
/* 54338 80063B38 12004010 */  beqz       $v0, .L80063B84
/* 5433C 80063B3C 59000224 */   addiu     $v0, $zero, 0x59
/* 54340 80063B40 2E008210 */  beq        $a0, $v0, .L80063BFC
/* 54344 80063B44 5A008228 */   slti      $v0, $a0, 0x5A
/* 54348 80063B48 07004010 */  beqz       $v0, .L80063B68
/* 5434C 80063B4C 02000224 */   addiu     $v0, $zero, 0x2
/* 54350 80063B50 69008210 */  beq        $a0, $v0, .L80063CF8
/* 54354 80063B54 58000224 */   addiu     $v0, $zero, 0x58
/* 54358 80063B58 1C008210 */  beq        $a0, $v0, .L80063BCC
/* 5435C 80063B5C 00000000 */   nop
/* 54360 80063B60 6D8F0108 */  j          .L80063DB4
/* 54364 80063B64 00000000 */   nop
.L80063B68:
/* 54368 80063B68 76000224 */  addiu      $v0, $zero, 0x76
/* 5436C 80063B6C 2F008210 */  beq        $a0, $v0, .L80063C2C
/* 54370 80063B70 77000224 */   addiu     $v0, $zero, 0x77
/* 54374 80063B74 4D008210 */  beq        $a0, $v0, .L80063CAC
/* 54378 80063B78 FFFF0226 */   addiu     $v0, $s0, -0x1
/* 5437C 80063B7C 6D8F0108 */  j          .L80063DB4
/* 54380 80063B80 00000000 */   nop
.L80063B84:
/* 54384 80063B84 93000224 */  addiu      $v0, $zero, 0x93
/* 54388 80063B88 57008210 */  beq        $a0, $v0, .L80063CE8
/* 5438C 80063B8C 94008228 */   slti      $v0, $a0, 0x94
/* 54390 80063B90 07004010 */  beqz       $v0, .L80063BB0
/* 54394 80063B94 88000224 */   addiu     $v0, $zero, 0x88
/* 54398 80063B98 79008210 */  beq        $a0, $v0, .L80063D80
/* 5439C 80063B9C 8E000224 */   addiu     $v0, $zero, 0x8E
/* 543A0 80063BA0 49008210 */  beq        $a0, $v0, .L80063CC8
/* 543A4 80063BA4 00241000 */   sll       $a0, $s0, 16
/* 543A8 80063BA8 6D8F0108 */  j          .L80063DB4
/* 543AC 80063BAC 00000000 */   nop
.L80063BB0:
/* 543B0 80063BB0 96000224 */  addiu      $v0, $zero, 0x96
/* 543B4 80063BB4 76008210 */  beq        $a0, $v0, .L80063D90
/* 543B8 80063BB8 9C000224 */   addiu     $v0, $zero, 0x9C
/* 543BC 80063BBC 46008210 */  beq        $a0, $v0, .L80063CD8
/* 543C0 80063BC0 00241000 */   sll       $a0, $s0, 16
/* 543C4 80063BC4 6D8F0108 */  j          .L80063DB4
/* 543C8 80063BC8 00000000 */   nop
.L80063BCC:
/* 543CC 80063BCC 1000A28F */  lw         $v0, 0x10($sp)
/* 543D0 80063BD0 00000000 */  nop
/* 543D4 80063BD4 05004010 */  beqz       $v0, .L80063BEC
/* 543D8 80063BD8 00000000 */   nop
/* 543DC 80063BDC 4934010C */  jal        FX_Start_Snow
/* 543E0 80063BE0 64000424 */   addiu     $a0, $zero, 0x64
/* 543E4 80063BE4 6D8F0108 */  j          .L80063DB4
/* 543E8 80063BE8 00000000 */   nop
.L80063BEC:
/* 543EC 80063BEC 4934010C */  jal        FX_Start_Snow
/* 543F0 80063BF0 21200002 */   addu      $a0, $s0, $zero
/* 543F4 80063BF4 6D8F0108 */  j          .L80063DB4
/* 543F8 80063BF8 00000000 */   nop
.L80063BFC:
/* 543FC 80063BFC 1000A28F */  lw         $v0, 0x10($sp)
/* 54400 80063C00 00000000 */  nop
/* 54404 80063C04 05004010 */  beqz       $v0, .L80063C1C
/* 54408 80063C08 00000000 */   nop
/* 5440C 80063C0C 5634010C */  jal        FX_Start_Rain
/* 54410 80063C10 64000424 */   addiu     $a0, $zero, 0x64
/* 54414 80063C14 6D8F0108 */  j          .L80063DB4
/* 54418 80063C18 00000000 */   nop
.L80063C1C:
/* 5441C 80063C1C 5634010C */  jal        FX_Start_Rain
/* 54420 80063C20 21200002 */   addu      $a0, $s0, $zero
/* 54424 80063C24 6D8F0108 */  j          .L80063DB4
/* 54428 80063C28 00000000 */   nop
.L80063C2C:
/* 5442C 80063C2C 61000006 */  bltz       $s0, .L80063DB4
/* 54430 80063C30 0800033C */   lui       $v1, (0x80000 >> 16)
/* 54434 80063C34 88BE828F */  lw         $v0, %gp_rel(gameTrackerX + 0xC0)($gp)
/* 54438 80063C38 00000000 */  nop
/* 5443C 80063C3C 24104300 */  and        $v0, $v0, $v1
/* 54440 80063C40 5C004010 */  beqz       $v0, .L80063DB4
/* 54444 80063C44 00000000 */   nop
/* 54448 80063C48 14CF828F */  lw         $v0, %gp_rel(WaitingForVoiceNumber)($gp)
/* 5444C 80063C4C 00000000 */  nop
/* 54450 80063C50 0B005010 */  beq        $v0, $s0, .L80063C80
/* 54454 80063C54 00000000 */   nop
/* 54458 80063C58 1A82010C */  jal        LOAD_IsXAInQueue
/* 5445C 80063C5C 00000000 */   nop
/* 54460 80063C60 0C004014 */  bnez       $v0, .L80063C94
/* 54464 80063C64 00000000 */   nop
/* 54468 80063C68 2C82010C */  jal        LOAD_PlayXA
/* 5446C 80063C6C 21200002 */   addu      $a0, $s0, $zero
/* 54470 80063C70 58A491A7 */  sh         $s1, %gp_rel(EventAbortLine)($gp)
/* 54474 80063C74 14CF90AF */  sw         $s0, %gp_rel(WaitingForVoiceNumber)($gp)
/* 54478 80063C78 6D8F0108 */  j          .L80063DB4
/* 5447C 80063C7C 00000000 */   nop
.L80063C80:
/* 54480 80063C80 FDDC020C */  jal        VOICEXA_IsPlaying
/* 54484 80063C84 00000000 */   nop
/* 54488 80063C88 02000324 */  addiu      $v1, $zero, 0x2
/* 5448C 80063C8C 04004310 */  beq        $v0, $v1, .L80063CA0
/* 54490 80063C90 00000000 */   nop
.L80063C94:
/* 54494 80063C94 58A491A7 */  sh         $s1, %gp_rel(EventAbortLine)($gp)
/* 54498 80063C98 6D8F0108 */  j          .L80063DB4
/* 5449C 80063C9C 00000000 */   nop
.L80063CA0:
/* 544A0 80063CA0 14CF93AF */  sw         $s3, %gp_rel(WaitingForVoiceNumber)($gp)
/* 544A4 80063CA4 6D8F0108 */  j          .L80063DB4
/* 544A8 80063CA8 00000000 */   nop
.L80063CAC:
/* 544AC 80063CAC 7F00422C */  sltiu      $v0, $v0, 0x7F
/* 544B0 80063CB0 40004010 */  beqz       $v0, .L80063DB4
/* 544B4 80063CB4 00000000 */   nop
/* 544B8 80063CB8 8901010C */  jal        SOUND_SetVoiceVolume
/* 544BC 80063CBC 21200002 */   addu      $a0, $s0, $zero
/* 544C0 80063CC0 6D8F0108 */  j          .L80063DB4
/* 544C4 80063CC4 00000000 */   nop
.L80063CC8:
/* 544C8 80063CC8 5583010C */  jal        HINT_StartHint
/* 544CC 80063CCC 03240400 */   sra       $a0, $a0, 16
/* 544D0 80063CD0 6D8F0108 */  j          .L80063DB4
/* 544D4 80063CD4 00000000 */   nop
.L80063CD8:
/* 544D8 80063CD8 8183010C */  jal        HINT_KillSpecificHint
/* 544DC 80063CDC 03240400 */   sra       $a0, $a0, 16
/* 544E0 80063CE0 6D8F0108 */  j          .L80063DB4
/* 544E4 80063CE4 00000000 */   nop
.L80063CE8:
/* 544E8 80063CE8 6883010C */  jal        HINT_StopHint
/* 544EC 80063CEC 00000000 */   nop
/* 544F0 80063CF0 6D8F0108 */  j          .L80063DB4
/* 544F4 80063CF4 00000000 */   nop
.L80063CF8:
/* 544F8 80063CF8 11000412 */  beq        $s0, $a0, .L80063D40
/* 544FC 80063CFC 0300022A */   slti      $v0, $s0, 0x3
/* 54500 80063D00 05004010 */  beqz       $v0, .L80063D18
/* 54504 80063D04 03000224 */   addiu     $v0, $zero, 0x3
/* 54508 80063D08 09001112 */  beq        $s0, $s1, .L80063D30
/* 5450C 80063D0C 00000000 */   nop
/* 54510 80063D10 6D8F0108 */  j          .L80063DB4
/* 54514 80063D14 00000000 */   nop
.L80063D18:
/* 54518 80063D18 0D000212 */  beq        $s0, $v0, .L80063D50
/* 5451C 80063D1C 04000224 */   addiu     $v0, $zero, 0x4
/* 54520 80063D20 0F000212 */  beq        $s0, $v0, .L80063D60
/* 54524 80063D24 00000000 */   nop
/* 54528 80063D28 6D8F0108 */  j          .L80063DB4
/* 5452C 80063D2C 00000000 */   nop
.L80063D30:
/* 54530 80063D30 99B7000C */  jal        GAMELOOP_SetGameTime
/* 54534 80063D34 58020424 */   addiu     $a0, $zero, 0x258
/* 54538 80063D38 6D8F0108 */  j          .L80063DB4
/* 5453C 80063D3C 00000000 */   nop
.L80063D40:
/* 54540 80063D40 99B7000C */  jal        GAMELOOP_SetGameTime
/* 54544 80063D44 BC020424 */   addiu     $a0, $zero, 0x2BC
/* 54548 80063D48 6D8F0108 */  j          .L80063DB4
/* 5454C 80063D4C 00000000 */   nop
.L80063D50:
/* 54550 80063D50 99B7000C */  jal        GAMELOOP_SetGameTime
/* 54554 80063D54 08070424 */   addiu     $a0, $zero, 0x708
/* 54558 80063D58 6D8F0108 */  j          .L80063DB4
/* 5455C 80063D5C 00000000 */   nop
.L80063D60:
/* 54560 80063D60 99B7000C */  jal        GAMELOOP_SetGameTime
/* 54564 80063D64 6C070424 */   addiu     $a0, $zero, 0x76C
/* 54568 80063D68 6D8F0108 */  j          .L80063DB4
/* 5456C 80063D6C 00000000 */   nop
.L80063D70:
/* 54570 80063D70 3604010C */  jal        SOUND_SetMusicModifier
/* 54574 80063D74 21200002 */   addu      $a0, $s0, $zero
/* 54578 80063D78 6D8F0108 */  j          .L80063DB4
/* 5457C 80063D7C 00000000 */   nop
.L80063D80:
/* 54580 80063D80 6604010C */  jal        SOUND_ResetMusicModifier
/* 54584 80063D84 21200002 */   addu      $a0, $s0, $zero
/* 54588 80063D88 6D8F0108 */  j          .L80063DB4
/* 5458C 80063D8C 00000000 */   nop
.L80063D90:
/* 54590 80063D90 88CE8287 */  lh         $v0, %gp_rel(MoviePlayed)($gp)
/* 54594 80063D94 00000000 */  nop
/* 54598 80063D98 04004014 */  bnez       $v0, .L80063DAC
/* 5459C 80063D9C 00000000 */   nop
/* 545A0 80063DA0 8CCE90A7 */  sh         $s0, %gp_rel(MovieToPlay)($gp)
/* 545A4 80063DA4 258F0108 */  j          .L80063C94
/* 545A8 80063DA8 00000000 */   nop
.L80063DAC:
/* 545AC 80063DAC 88CE80A7 */  sh         $zero, %gp_rel(MoviePlayed)($gp)
/* 545B0 80063DB0 8CCE93A7 */  sh         $s3, %gp_rel(MovieToPlay)($gp)
.L80063DB4:
/* 545B4 80063DB4 2800BF8F */  lw         $ra, 0x28($sp)
/* 545B8 80063DB8 2400B38F */  lw         $s3, 0x24($sp)
/* 545BC 80063DBC 2000B28F */  lw         $s2, 0x20($sp)
/* 545C0 80063DC0 1C00B18F */  lw         $s1, 0x1C($sp)
/* 545C4 80063DC4 1800B08F */  lw         $s0, 0x18($sp)
/* 545C8 80063DC8 01000224 */  addiu      $v0, $zero, 0x1
/* 545CC 80063DCC 0800E003 */  jr         $ra
/* 545D0 80063DD0 3000BD27 */   addiu     $sp, $sp, 0x30
.size EVENT_DoGameAction, . - EVENT_DoGameAction
