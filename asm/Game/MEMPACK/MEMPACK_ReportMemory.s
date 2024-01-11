.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MEMPACK_ReportMemory
/* 40E2C 8005062C F0C6838F */  lw         $v1, %gp_rel(newMemTracker)($gp)
/* 40E30 80050630 FCC6828F */  lw         $v0, %gp_rel(newMemTracker + 0xC)($gp)
/* 40E34 80050634 00000000 */  nop
/* 40E38 80050638 06006210 */  beq        $v1, $v0, .L80050654
/* 40E3C 8005063C 21204000 */   addu      $a0, $v0, $zero
.L80050640:
/* 40E40 80050640 0400628C */  lw         $v0, 0x4($v1)
/* 40E44 80050644 00000000 */  nop
/* 40E48 80050648 21186200 */  addu       $v1, $v1, $v0
/* 40E4C 8005064C FCFF6414 */  bne        $v1, $a0, .L80050640
/* 40E50 80050650 00000000 */   nop
.L80050654:
/* 40E54 80050654 21280000 */  addu       $a1, $zero, $zero
/* 40E58 80050658 FCC6878F */  lw         $a3, %gp_rel(newMemTracker + 0xC)($gp)
.L8005065C:
/* 40E5C 8005065C F0C6838F */  lw         $v1, %gp_rel(newMemTracker)($gp)
/* 40E60 80050660 00000000 */  nop
/* 40E64 80050664 12006710 */  beq        $v1, $a3, .L800506B0
/* 40E68 80050668 01000424 */   addiu     $a0, $zero, 0x1
/* 40E6C 8005066C FCC6868F */  lw         $a2, %gp_rel(newMemTracker + 0xC)($gp)
.L80050670:
/* 40E70 80050670 02006290 */  lbu        $v0, 0x2($v1)
/* 40E74 80050674 00000000 */  nop
/* 40E78 80050678 08004010 */  beqz       $v0, .L8005069C
/* 40E7C 8005067C 00000000 */   nop
/* 40E80 80050680 03006290 */  lbu        $v0, 0x3($v1)
/* 40E84 80050684 00000000 */  nop
/* 40E88 80050688 04004514 */  bne        $v0, $a1, .L8005069C
/* 40E8C 8005068C 00000000 */   nop
/* 40E90 80050690 02008010 */  beqz       $a0, .L8005069C
/* 40E94 80050694 00000000 */   nop
/* 40E98 80050698 21200000 */  addu       $a0, $zero, $zero
.L8005069C:
/* 40E9C 8005069C 0400628C */  lw         $v0, 0x4($v1)
/* 40EA0 800506A0 00000000 */  nop
/* 40EA4 800506A4 21186200 */  addu       $v1, $v1, $v0
/* 40EA8 800506A8 F1FF6614 */  bne        $v1, $a2, .L80050670
/* 40EAC 800506AC 00000000 */   nop
.L800506B0:
/* 40EB0 800506B0 0100A524 */  addiu      $a1, $a1, 0x1
/* 40EB4 800506B4 3100A228 */  slti       $v0, $a1, 0x31
/* 40EB8 800506B8 E8FF4014 */  bnez       $v0, .L8005065C
/* 40EBC 800506BC 00000000 */   nop
/* 40EC0 800506C0 0800E003 */  jr         $ra
/* 40EC4 800506C4 00000000 */   nop
.size MEMPACK_ReportMemory, . - MEMPACK_ReportMemory
