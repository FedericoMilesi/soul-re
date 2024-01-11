.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _padStopCom
/* B2E84 800C2684 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B2E88 800C2688 1000BFAF */  sw         $ra, 0x10($sp)
/* B2E8C 800C268C A5FC020C */  jal        EnterCriticalSection
/* B2E90 800C2690 00000000 */   nop
/* B2E94 800C2694 03000424 */  addiu      $a0, $zero, 0x3
/* B2E98 800C2698 CC08030C */  jal        ChangeClearRCnt
/* B2E9C 800C269C 01000524 */   addiu     $a1, $zero, 0x1
/* B2EA0 800C26A0 0E80053C */  lui        $a1, %hi(StStartFrame + 0x14)
/* B2EA4 800C26A4 58FDA524 */  addiu      $a1, $a1, %lo(StStartFrame + 0x14)
/* B2EA8 800C26A8 541E030C */  jal        SysDeqIntRP
/* B2EAC 800C26AC 02000424 */   addiu     $a0, $zero, 0x2
/* B2EB0 800C26B0 11FC020C */  jal        ExitCriticalSection
/* B2EB4 800C26B4 00000000 */   nop
/* B2EB8 800C26B8 1000BF8F */  lw         $ra, 0x10($sp)
/* B2EBC 800C26BC 1800BD27 */  addiu      $sp, $sp, 0x18
/* B2EC0 800C26C0 0800E003 */  jr         $ra
/* B2EC4 800C26C4 00000000 */   nop
.size _padStopCom, . - _padStopCom
