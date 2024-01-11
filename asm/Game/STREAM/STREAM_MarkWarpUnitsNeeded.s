.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_MarkWarpUnitsNeeded
/* 4BE90 8005B690 21200000 */  addu       $a0, $zero, $zero
/* 4BE94 8005B694 3CC78327 */  addiu      $v1, $gp, %gp_rel(StreamTracker)
.L8005B698:
/* 4BE98 8005B698 06006294 */  lhu        $v0, 0x6($v1)
/* 4BE9C 8005B69C 00000000 */  nop
/* 4BEA0 8005B6A0 01004230 */  andi       $v0, $v0, 0x1
/* 4BEA4 8005B6A4 04004010 */  beqz       $v0, .L8005B6B8
/* 4BEA8 8005B6A8 00000000 */   nop
/* 4BEAC 8005B6AC F0BE828F */  lw         $v0, %gp_rel(gameTrackerX + 0x128)($gp)
/* 4BEB0 8005B6B0 00000000 */  nop
/* 4BEB4 8005B6B4 200062AC */  sw         $v0, 0x20($v1)
.L8005B6B8:
/* 4BEB8 8005B6B8 01008424 */  addiu      $a0, $a0, 0x1
/* 4BEBC 8005B6BC 10008228 */  slti       $v0, $a0, 0x10
/* 4BEC0 8005B6C0 F5FF4014 */  bnez       $v0, .L8005B698
/* 4BEC4 8005B6C4 40006324 */   addiu     $v1, $v1, 0x40
/* 4BEC8 8005B6C8 0800E003 */  jr         $ra
/* 4BECC 8005B6CC 00000000 */   nop
.size STREAM_MarkWarpUnitsNeeded, . - STREAM_MarkWarpUnitsNeeded
