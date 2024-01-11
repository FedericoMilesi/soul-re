.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadPutSfxCommand
/* 47AA8 800572A8 D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 47AAC 800572AC D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 47AB0 800572B0 1000B0AF */  sw         $s0, 0x10($sp)
/* 47AB4 800572B4 21808000 */  addu       $s0, $a0, $zero
/* 47AB8 800572B8 1800B2AF */  sw         $s2, 0x18($sp)
/* 47ABC 800572BC 2190A000 */  addu       $s2, $a1, $zero
/* 47AC0 800572C0 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 47AC4 800572C4 2198C000 */  addu       $s3, $a2, $zero
/* 47AC8 800572C8 2000B4AF */  sw         $s4, 0x20($sp)
/* 47ACC 800572CC 2400BFAF */  sw         $ra, 0x24($sp)
/* 47AD0 800572D0 1400B1AF */  sw         $s1, 0x14($sp)
/* 47AD4 800572D4 D6014394 */  lhu        $v1, 0x1D6($v0)
/* 47AD8 800572D8 3800B18F */  lw         $s1, 0x38($sp)
/* 47ADC 800572DC 1E00622C */  sltiu      $v0, $v1, 0x1E
/* 47AE0 800572E0 04004014 */  bnez       $v0, .L800572F4
/* 47AE4 800572E4 21A0E000 */   addu      $s4, $a3, $zero
/* 47AE8 800572E8 1F00622C */  sltiu      $v0, $v1, 0x1F
/* 47AEC 800572EC 23004010 */  beqz       $v0, .L8005737C
/* 47AF0 800572F0 04001024 */   addiu     $s0, $zero, 0x4
.L800572F4:
/* 47AF4 800572F4 A5FC020C */  jal        EnterCriticalSection
/* 47AF8 800572F8 00000000 */   nop
/* 47AFC 800572FC D89B838F */  lw         $v1, %gp_rel(aadMem)($gp)
/* 47B00 80057300 00000000 */  nop
/* 47B04 80057304 D4016490 */  lbu        $a0, 0x1D4($v1)
/* 47B08 80057308 00000000 */  nop
/* 47B0C 8005730C 40100400 */  sll        $v0, $a0, 1
/* 47B10 80057310 21104400 */  addu       $v0, $v0, $a0
/* 47B14 80057314 80100200 */  sll        $v0, $v0, 2
/* 47B18 80057318 54004224 */  addiu      $v0, $v0, 0x54
/* 47B1C 8005731C 21186200 */  addu       $v1, $v1, $v0
/* 47B20 80057320 000070A0 */  sb         $s0, 0x0($v1)
/* 47B24 80057324 010072A0 */  sb         $s2, 0x1($v1)
/* 47B28 80057328 020073A0 */  sb         $s3, 0x2($v1)
/* 47B2C 8005732C D89B848F */  lw         $a0, %gp_rel(aadMem)($gp)
/* 47B30 80057330 040074AC */  sw         $s4, 0x4($v1)
/* 47B34 80057334 080071A4 */  sh         $s1, 0x8($v1)
/* 47B38 80057338 D4018290 */  lbu        $v0, 0x1D4($a0)
/* 47B3C 8005733C 20000324 */  addiu      $v1, $zero, 0x20
/* 47B40 80057340 01004224 */  addiu      $v0, $v0, 0x1
/* 47B44 80057344 D40182A0 */  sb         $v0, 0x1D4($a0)
/* 47B48 80057348 FF004230 */  andi       $v0, $v0, 0xFF
/* 47B4C 8005734C 04004314 */  bne        $v0, $v1, .L80057360
/* 47B50 80057350 00000000 */   nop
/* 47B54 80057354 D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 47B58 80057358 00000000 */  nop
/* 47B5C 8005735C D40140A0 */  sb         $zero, 0x1D4($v0)
.L80057360:
/* 47B60 80057360 D89B838F */  lw         $v1, %gp_rel(aadMem)($gp)
/* 47B64 80057364 00000000 */  nop
/* 47B68 80057368 D6016294 */  lhu        $v0, 0x1D6($v1)
/* 47B6C 8005736C 00000000 */  nop
/* 47B70 80057370 01004224 */  addiu      $v0, $v0, 0x1
/* 47B74 80057374 11FC020C */  jal        ExitCriticalSection
/* 47B78 80057378 D60162A4 */   sh        $v0, 0x1D6($v1)
.L8005737C:
/* 47B7C 8005737C 2400BF8F */  lw         $ra, 0x24($sp)
/* 47B80 80057380 2000B48F */  lw         $s4, 0x20($sp)
/* 47B84 80057384 1C00B38F */  lw         $s3, 0x1C($sp)
/* 47B88 80057388 1800B28F */  lw         $s2, 0x18($sp)
/* 47B8C 8005738C 1400B18F */  lw         $s1, 0x14($sp)
/* 47B90 80057390 1000B08F */  lw         $s0, 0x10($sp)
/* 47B94 80057394 0800E003 */  jr         $ra
/* 47B98 80057398 2800BD27 */   addiu     $sp, $sp, 0x28
.size aadPutSfxCommand, . - aadPutSfxCommand
