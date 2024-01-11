.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StartTimer
/* 29354 80038B54 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 29358 80038B58 1000BFAF */  sw         $ra, 0x10($sp)
/* 2935C 80038B5C A5FC020C */  jal        EnterCriticalSection
/* 29360 80038B60 00000000 */   nop
/* 29364 80038B64 00F2043C */  lui        $a0, (0xF2000000 >> 16)
/* 29368 80038B68 02000524 */  addiu      $a1, $zero, 0x2
/* 2936C 80038B6C 00100624 */  addiu      $a2, $zero, 0x1000
/* 29370 80038B70 0280073C */  lui        $a3, %hi(TimerTick)
/* 29374 80038B74 D9FC020C */  jal        OpenEvent
/* 29378 80038B78 D851E724 */   addiu     $a3, $a3, %lo(TimerTick)
/* 2937C 80038B7C 21204000 */  addu       $a0, $v0, $zero
/* 29380 80038B80 A0BD84AF */  sw         $a0, %gp_rel(__timerEvent)($gp)
/* 29384 80038B84 D5FC020C */  jal        EnableEvent
/* 29388 80038B88 00000000 */   nop
/* 2938C 80038B8C 00F2043C */  lui        $a0, (0xF2000000 >> 16)
/* 29390 80038B90 FFFF0534 */  ori        $a1, $zero, 0xFFFF
/* 29394 80038B94 C4F4020C */  jal        SetRCnt
/* 29398 80038B98 01100624 */   addiu     $a2, $zero, 0x1001
/* 2939C 80038B9C F9F4020C */  jal        StartRCnt
/* 293A0 80038BA0 00F2043C */   lui       $a0, (0xF2000000 >> 16)
/* 293A4 80038BA4 11FC020C */  jal        ExitCriticalSection
/* 293A8 80038BA8 00000000 */   nop
/* 293AC 80038BAC 1000BF8F */  lw         $ra, 0x10($sp)
/* 293B0 80038BB0 01000224 */  addiu      $v0, $zero, 0x1
/* 293B4 80038BB4 C89782AF */  sw         $v0, %gp_rel(gTimerEnabled)($gp)
/* 293B8 80038BB8 0800E003 */  jr         $ra
/* 293BC 80038BBC 1800BD27 */   addiu     $sp, $sp, 0x18
.size StartTimer, . - StartTimer
