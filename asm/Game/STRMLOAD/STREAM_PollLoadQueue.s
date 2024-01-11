.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_PollLoadQueue
/* 509D4 800601D4 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 509D8 800601D8 1800BFAF */  sw         $ra, 0x18($sp)
/* 509DC 800601DC 1400B1AF */  sw         $s1, 0x14($sp)
/* 509E0 800601E0 EFDD000C */  jal        LOAD_ProcessReadQueue
/* 509E4 800601E4 1000B0AF */   sw        $s0, 0x10($sp)
/* 509E8 800601E8 44CB848F */  lw         $a0, %gp_rel(loadHead)($gp)
/* 509EC 800601EC 00000000 */  nop
/* 509F0 800601F0 ED008010 */  beqz       $a0, .L800605A8
/* 509F4 800601F4 00000000 */   nop
/* 509F8 800601F8 88BE828F */  lw         $v0, %gp_rel(gameTrackerX + 0xC0)($gp)
/* 509FC 800601FC 00000000 */  nop
/* 50A00 80060200 06004104 */  bgez       $v0, .L8006021C
/* 50A04 80060204 21888000 */   addu      $s1, $a0, $zero
/* 50A08 80060208 0D80043C */  lui        $a0, %hi(gCurDir + 0x28)
/* 50A0C 8006020C A4198424 */  addiu      $a0, $a0, %lo(gCurDir + 0x28)
/* 50A10 80060210 04002686 */  lh         $a2, 0x4($s1)
/* 50A14 80060214 C3B5000C */  jal        FONT_Print
/* 50A18 80060218 3C002526 */   addiu     $a1, $s1, 0x3C
.L8006021C:
/* 50A1C 8006021C 08BF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x140)($gp)
/* 50A20 80060220 00000000 */  nop
/* 50A24 80060224 00084230 */  andi       $v0, $v0, 0x800
/* 50A28 80060228 0B004010 */  beqz       $v0, .L80060258
/* 50A2C 8006022C 01000224 */   addiu     $v0, $zero, 0x1
/* 50A30 80060230 04002386 */  lh         $v1, 0x4($s1)
/* 50A34 80060234 00000000 */  nop
/* 50A38 80060238 DB006210 */  beq        $v1, $v0, .L800605A8
/* 50A3C 8006023C 05000224 */   addiu     $v0, $zero, 0x5
/* 50A40 80060240 D9006210 */  beq        $v1, $v0, .L800605A8
/* 50A44 80060244 08000224 */   addiu     $v0, $zero, 0x8
/* 50A48 80060248 D7006210 */  beq        $v1, $v0, .L800605A8
/* 50A4C 8006024C 0A000224 */   addiu     $v0, $zero, 0xA
/* 50A50 80060250 D5006210 */  beq        $v1, $v0, .L800605A8
/* 50A54 80060254 00000000 */   nop
.L80060258:
/* 50A58 80060258 04002296 */  lhu        $v0, 0x4($s1)
/* 50A5C 8006025C 00000000 */  nop
/* 50A60 80060260 FFFF4224 */  addiu      $v0, $v0, -0x1
/* 50A64 80060264 00140200 */  sll        $v0, $v0, 16
/* 50A68 80060268 031C0200 */  sra        $v1, $v0, 16
/* 50A6C 8006026C 0B00622C */  sltiu      $v0, $v1, 0xB
/* 50A70 80060270 CD004010 */  beqz       $v0, .L800605A8
/* 50A74 80060274 0180023C */   lui       $v0, %hi(jtbl_80010384)
/* 50A78 80060278 84034224 */  addiu      $v0, $v0, %lo(jtbl_80010384)
/* 50A7C 8006027C 80180300 */  sll        $v1, $v1, 2
/* 50A80 80060280 21186200 */  addu       $v1, $v1, $v0
/* 50A84 80060284 0000628C */  lw         $v0, 0x0($v1)
/* 50A88 80060288 00000000 */  nop
/* 50A8C 8006028C 08004000 */  jr         $v0
/* 50A90 80060290 00000000 */   nop
jlabel .L80060294
/* 50A94 80060294 32E1000C */  jal        LOAD_IsFileLoading
/* 50A98 80060298 00000000 */   nop
/* 50A9C 8006029C C2004014 */  bnez       $v0, .L800605A8
/* 50AA0 800602A0 00000000 */   nop
/* 50AA4 800602A4 6FF7000C */  jal        TIMER_GetTimeMS
/* 50AA8 800602A8 00000000 */   nop
/* 50AAC 800602AC 6C00238E */  lw         $v1, 0x6C($s1)
/* 50AB0 800602B0 06002492 */  lbu        $a0, 0x6($s1)
/* 50AB4 800602B4 23104300 */  subu       $v0, $v0, $v1
/* 50AB8 800602B8 0D008010 */  beqz       $a0, .L800602F0
/* 50ABC 800602BC 6C0022AE */   sw        $v0, 0x6C($s1)
/* 50AC0 800602C0 1400248E */  lw         $a0, 0x14($s1)
/* 50AC4 800602C4 1800258E */  lw         $a1, 0x18($s1)
/* 50AC8 800602C8 66E0000C */  jal        LOAD_RelocBinaryData
/* 50ACC 800602CC 00000000 */   nop
/* 50AD0 800602D0 07002392 */  lbu        $v1, 0x7($s1)
/* 50AD4 800602D4 00000000 */  nop
/* 50AD8 800602D8 04006010 */  beqz       $v1, .L800602EC
/* 50ADC 800602DC 00000000 */   nop
/* 50AE0 800602E0 1400248E */  lw         $a0, 0x14($s1)
/* 50AE4 800602E4 0541010C */  jal        MEMPACK_Return
/* 50AE8 800602E8 21284000 */   addu      $a1, $v0, $zero
.L800602EC:
/* 50AEC 800602EC 060020A2 */  sb         $zero, 0x6($s1)
.L800602F0:
/* 50AF0 800602F0 2C00228E */  lw         $v0, 0x2C($s1)
/* 50AF4 800602F4 00000000 */  nop
/* 50AF8 800602F8 03004010 */  beqz       $v0, .L80060308
/* 50AFC 800602FC 07000224 */   addiu     $v0, $zero, 0x7
/* 50B00 80060300 6A810108 */  j          .L800605A8
/* 50B04 80060304 040022A6 */   sh        $v0, 0x4($s1)
.L80060308:
/* 50B08 80060308 07002392 */  lbu        $v1, 0x7($s1)
/* 50B0C 8006030C 04000224 */  addiu      $v0, $zero, 0x4
/* 50B10 80060310 A3006010 */  beqz       $v1, .L800605A0
/* 50B14 80060314 040022A6 */   sh        $v0, 0x4($s1)
/* 50B18 80060318 1400248E */  lw         $a0, 0x14($s1)
/* 50B1C 8006031C B541010C */  jal        MEMPACK_SetMemoryDoneStreamed
/* 50B20 80060320 00000000 */   nop
/* 50B24 80060324 68810108 */  j          .L800605A0
/* 50B28 80060328 00000000 */   nop
jlabel .L8006032C
/* 50B2C 8006032C 04000224 */  addiu      $v0, $zero, 0x4
/* 50B30 80060330 FE7F010C */  jal        STREAM_RemoveQueueHead
/* 50B34 80060334 040022A6 */   sh        $v0, 0x4($s1)
/* 50B38 80060338 07002292 */  lbu        $v0, 0x7($s1)
/* 50B3C 8006033C 00000000 */  nop
/* 50B40 80060340 04004010 */  beqz       $v0, .L80060354
/* 50B44 80060344 00000000 */   nop
/* 50B48 80060348 1400248E */  lw         $a0, 0x14($s1)
/* 50B4C 8006034C B541010C */  jal        MEMPACK_SetMemoryDoneStreamed
/* 50B50 80060350 00000000 */   nop
.L80060354:
/* 50B54 80060354 E07F010C */  jal        STREAM_NextLoadFromHead
/* 50B58 80060358 00000000 */   nop
/* 50B5C 8006035C 2C00228E */  lw         $v0, 0x2C($s1)
/* 50B60 80060360 00000000 */  nop
/* 50B64 80060364 06004010 */  beqz       $v0, .L80060380
/* 50B68 80060368 00000000 */   nop
/* 50B6C 8006036C 1400248E */  lw         $a0, 0x14($s1)
/* 50B70 80060370 3000258E */  lw         $a1, 0x30($s1)
/* 50B74 80060374 3400268E */  lw         $a2, 0x34($s1)
/* 50B78 80060378 09F84000 */  jalr       $v0
/* 50B7C 8006037C 00000000 */   nop
.L80060380:
/* 50B80 80060380 E47F010C */  jal        STREAM_NextLoadAsNormal
/* 50B84 80060384 00000000 */   nop
/* 50B88 80060388 6A810108 */  j          .L800605A8
/* 50B8C 8006038C 00000000 */   nop
jlabel .L80060390
/* 50B90 80060390 6FF7000C */  jal        TIMER_GetTimeMS
/* 50B94 80060394 00000000 */   nop
/* 50B98 80060398 6C0022AE */  sw         $v0, 0x6C($s1)
/* 50B9C 8006039C 2CDF000C */  jal        LOAD_NonBlockingReadFile
/* 50BA0 800603A0 08002426 */   addiu     $a0, $s1, 0x8
/* 50BA4 800603A4 23E1000C */  jal        LOAD_ChangeDirectoryFlag
/* 50BA8 800603A8 00000000 */   nop
/* 50BAC 800603AC 0F004010 */  beqz       $v0, .L800603EC
/* 50BB0 800603B0 02000224 */   addiu     $v0, $zero, 0x2
/* 50BB4 800603B4 4080010C */  jal        STREAM_AddQueueEntryToHead
/* 50BB8 800603B8 00000000 */   nop
/* 50BBC 800603BC 21804000 */  addu       $s0, $v0, $zero
/* 50BC0 800603C0 3C004424 */  addiu      $a0, $v0, 0x3C
/* 50BC4 800603C4 0D80053C */  lui        $a1, %hi(gCurDir + 0x38)
/* 50BC8 800603C8 0C00268E */  lw         $a2, 0xC($s1)
/* 50BCC 800603CC 1AD1010C */  jal        sprintf
/* 50BD0 800603D0 B419A524 */   addiu     $a1, $a1, %lo(gCurDir + 0x38)
/* 50BD4 800603D4 0C00238E */  lw         $v1, 0xC($s1)
/* 50BD8 800603D8 0A000224 */  addiu      $v0, $zero, 0xA
/* 50BDC 800603DC 080000AE */  sw         $zero, 0x8($s0)
/* 50BE0 800603E0 040002A6 */  sh         $v0, 0x4($s0)
/* 50BE4 800603E4 6A810108 */  j          .L800605A8
/* 50BE8 800603E8 0C0003AE */   sw        $v1, 0xC($s0)
.L800603EC:
/* 50BEC 800603EC 07002392 */  lbu        $v1, 0x7($s1)
/* 50BF0 800603F0 00000000 */  nop
/* 50BF4 800603F4 04006010 */  beqz       $v1, .L80060408
/* 50BF8 800603F8 040022A6 */   sh        $v0, 0x4($s1)
/* 50BFC 800603FC 1400248E */  lw         $a0, 0x14($s1)
/* 50C00 80060400 B241010C */  jal        MEMPACK_SetMemoryBeingStreamed
/* 50C04 80060404 00000000 */   nop
.L80060408:
/* 50C08 80060408 3800238E */  lw         $v1, 0x38($s1)
/* 50C0C 8006040C 00000000 */  nop
/* 50C10 80060410 65006010 */  beqz       $v1, .L800605A8
/* 50C14 80060414 00000000 */   nop
/* 50C18 80060418 1400228E */  lw         $v0, 0x14($s1)
/* 50C1C 8006041C 6A810108 */  j          .L800605A8
/* 50C20 80060420 000062AC */   sw        $v0, 0x0($v1)
jlabel .L80060424
/* 50C24 80060424 A6E0000C */  jal        LOAD_InitBuffers
/* 50C28 80060428 00000000 */   nop
/* 50C2C 8006042C 6FF7000C */  jal        TIMER_GetTimeMS
/* 50C30 80060430 140022AE */   sw        $v0, 0x14($s1)
/* 50C34 80060434 08002426 */  addiu      $a0, $s1, 0x8
/* 50C38 80060438 4DDF000C */  jal        LOAD_CD_ReadPartOfFile
/* 50C3C 8006043C 6C0022AE */   sw        $v0, 0x6C($s1)
/* 50C40 80060440 23E1000C */  jal        LOAD_ChangeDirectoryFlag
/* 50C44 80060444 00000000 */   nop
/* 50C48 80060448 11004010 */  beqz       $v0, .L80060490
/* 50C4C 8006044C 06000224 */   addiu     $v0, $zero, 0x6
/* 50C50 80060450 4080010C */  jal        STREAM_AddQueueEntryToHead
/* 50C54 80060454 00000000 */   nop
/* 50C58 80060458 21804000 */  addu       $s0, $v0, $zero
/* 50C5C 8006045C 3C004424 */  addiu      $a0, $v0, 0x3C
/* 50C60 80060460 0D80053C */  lui        $a1, %hi(gCurDir + 0x38)
/* 50C64 80060464 0C00268E */  lw         $a2, 0xC($s1)
/* 50C68 80060468 1AD1010C */  jal        sprintf
/* 50C6C 8006046C B419A524 */   addiu     $a1, $a1, %lo(gCurDir + 0x38)
/* 50C70 80060470 0C00238E */  lw         $v1, 0xC($s1)
/* 50C74 80060474 0A000224 */  addiu      $v0, $zero, 0xA
/* 50C78 80060478 080000AE */  sw         $zero, 0x8($s0)
/* 50C7C 8006047C 040002A6 */  sh         $v0, 0x4($s0)
/* 50C80 80060480 94E0000C */  jal        LOAD_CleanUpBuffers
/* 50C84 80060484 0C0003AE */   sw        $v1, 0xC($s0)
/* 50C88 80060488 6A810108 */  j          .L800605A8
/* 50C8C 8006048C 00000000 */   nop
.L80060490:
/* 50C90 80060490 040022A6 */  sh         $v0, 0x4($s1)
/* 50C94 80060494 6A810108 */  j          .L800605A8
/* 50C98 80060498 280020AE */   sw        $zero, 0x28($s1)
jlabel .L8006049C
/* 50C9C 8006049C 32E1000C */  jal        LOAD_IsFileLoading
/* 50CA0 800604A0 00000000 */   nop
/* 50CA4 800604A4 40004014 */  bnez       $v0, .L800605A8
/* 50CA8 800604A8 00000000 */   nop
/* 50CAC 800604AC 6FF7000C */  jal        TIMER_GetTimeMS
/* 50CB0 800604B0 00000000 */   nop
/* 50CB4 800604B4 6C00248E */  lw         $a0, 0x6C($s1)
/* 50CB8 800604B8 04000324 */  addiu      $v1, $zero, 0x4
/* 50CBC 800604BC 040023A6 */  sh         $v1, 0x4($s1)
/* 50CC0 800604C0 23104400 */  subu       $v0, $v0, $a0
/* 50CC4 800604C4 FE7F010C */  jal        STREAM_RemoveQueueHead
/* 50CC8 800604C8 6C0022AE */   sw        $v0, 0x6C($s1)
/* 50CCC 800604CC 94E0000C */  jal        LOAD_CleanUpBuffers
/* 50CD0 800604D0 00000000 */   nop
/* 50CD4 800604D4 0780023C */  lui        $v0, %hi(VRAM_TransferBufferToVram)
/* 50CD8 800604D8 2C00238E */  lw         $v1, 0x2C($s1)
/* 50CDC 800604DC 70404224 */  addiu      $v0, $v0, %lo(VRAM_TransferBufferToVram)
/* 50CE0 800604E0 31006214 */  bne        $v1, $v0, .L800605A8
/* 50CE4 800604E4 00000000 */   nop
/* 50CE8 800604E8 1400248E */  lw         $a0, 0x14($s1)
/* 50CEC 800604EC 3000258E */  lw         $a1, 0x30($s1)
/* 50CF0 800604F0 3400268E */  lw         $a2, 0x34($s1)
/* 50CF4 800604F4 BAD0010C */  jal        VRAM_LoadReturn
/* 50CF8 800604F8 00000000 */   nop
/* 50CFC 800604FC 6A810108 */  j          .L800605A8
/* 50D00 80060500 00000000 */   nop
jlabel .L80060504
/* 50D04 80060504 21280000 */  addu       $a1, $zero, $zero
/* 50D08 80060508 0800248E */  lw         $a0, 0x8($s1)
/* 50D0C 8006050C 09000224 */  addiu      $v0, $zero, 0x9
/* 50D10 80060510 2DDC020C */  jal        VOICEXA_Play
/* 50D14 80060514 040022A6 */   sh        $v0, 0x4($s1)
/* 50D18 80060518 6A810108 */  j          .L800605A8
/* 50D1C 8006051C 00000000 */   nop
jlabel .L80060520
/* 50D20 80060520 FDDC020C */  jal        VOICEXA_IsPlaying
/* 50D24 80060524 00000000 */   nop
/* 50D28 80060528 1F004014 */  bnez       $v0, .L800605A8
/* 50D2C 8006052C 00000000 */   nop
/* 50D30 80060530 B5E0000C */  jal        LOAD_InitCdStreamMode
/* 50D34 80060534 00000000 */   nop
/* 50D38 80060538 68810108 */  j          .L800605A0
/* 50D3C 8006053C 00000000 */   nop
jlabel .L80060540
/* 50D40 80060540 6FF7000C */  jal        TIMER_GetTimeMS
/* 50D44 80060544 00000000 */   nop
/* 50D48 80060548 0C00248E */  lw         $a0, 0xC($s1)
/* 50D4C 8006054C DBE0000C */  jal        LOAD_ChangeDirectoryByID
/* 50D50 80060550 6C0022AE */   sw        $v0, 0x6C($s1)
/* 50D54 80060554 06004014 */  bnez       $v0, .L80060570
/* 50D58 80060558 0B000224 */   addiu     $v0, $zero, 0xB
/* 50D5C 8006055C 0C00258E */  lw         $a1, 0xC($s1)
/* 50D60 80060560 0D80043C */  lui        $a0, %hi(gCurDir + 0x40)
/* 50D64 80060564 2B52000C */  jal        DEBUG_FatalError
/* 50D68 80060568 BC198424 */   addiu     $a0, $a0, %lo(gCurDir + 0x40)
/* 50D6C 8006056C 0B000224 */  addiu      $v0, $zero, 0xB
.L80060570:
/* 50D70 80060570 6A810108 */  j          .L800605A8
/* 50D74 80060574 040022A6 */   sh        $v0, 0x4($s1)
jlabel .L80060578
/* 50D78 80060578 32E1000C */  jal        LOAD_IsFileLoading
/* 50D7C 8006057C 00000000 */   nop
/* 50D80 80060580 09004014 */  bnez       $v0, .L800605A8
/* 50D84 80060584 00000000 */   nop
/* 50D88 80060588 6FF7000C */  jal        TIMER_GetTimeMS
/* 50D8C 8006058C 00000000 */   nop
/* 50D90 80060590 6C00238E */  lw         $v1, 0x6C($s1)
/* 50D94 80060594 00000000 */  nop
/* 50D98 80060598 23104300 */  subu       $v0, $v0, $v1
/* 50D9C 8006059C 6C0022AE */  sw         $v0, 0x6C($s1)
.L800605A0:
/* 50DA0 800605A0 FE7F010C */  jal        STREAM_RemoveQueueHead
/* 50DA4 800605A4 00000000 */   nop
jlabel .L800605A8
/* 50DA8 800605A8 4CCB828F */  lw         $v0, %gp_rel(numLoads)($gp)
/* 50DAC 800605AC 1800BF8F */  lw         $ra, 0x18($sp)
/* 50DB0 800605B0 1400B18F */  lw         $s1, 0x14($sp)
/* 50DB4 800605B4 1000B08F */  lw         $s0, 0x10($sp)
/* 50DB8 800605B8 0800E003 */  jr         $ra
/* 50DBC 800605BC 2000BD27 */   addiu     $sp, $sp, 0x20
.size STREAM_PollLoadQueue, . - STREAM_PollLoadQueue
