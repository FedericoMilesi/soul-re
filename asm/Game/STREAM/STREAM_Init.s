.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_Init
/* 49308 80058B08 21200000 */  addu       $a0, $zero, $zero
/* 4930C 80058B0C 3CC78327 */  addiu      $v1, $gp, %gp_rel(StreamTracker)
.L80058B10:
/* 49310 80058B10 040060A4 */  sh         $zero, 0x4($v1)
/* 49314 80058B14 060060A4 */  sh         $zero, 0x6($v1)
/* 49318 80058B18 000060AC */  sw         $zero, 0x0($v1)
/* 4931C 80058B1C 01008424 */  addiu      $a0, $a0, 0x1
/* 49320 80058B20 10008228 */  slti       $v0, $a0, 0x10
/* 49324 80058B24 FAFF4014 */  bnez       $v0, .L80058B10
/* 49328 80058B28 40006324 */   addiu     $v1, $v1, 0x40
/* 4932C 80058B2C 0800E003 */  jr         $ra
/* 49330 80058B30 00000000 */   nop
.size STREAM_Init, . - STREAM_Init
