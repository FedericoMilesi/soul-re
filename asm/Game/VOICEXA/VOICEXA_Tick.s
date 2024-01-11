.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel VOICEXA_Tick
/* A7A9C 800B729C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* A7AA0 800B72A0 1000B0AF */  sw         $s0, 0x10($sp)
/* A7AA4 800B72A4 F0FE9027 */  addiu      $s0, $gp, %gp_rel(voiceTracker)
/* A7AA8 800B72A8 88BE828F */  lw         $v0, %gp_rel(gameTrackerX + 0xC0)($gp)
/* A7AAC 800B72AC 0800033C */  lui        $v1, (0x80000 >> 16)
/* A7AB0 800B72B0 24104300 */  and        $v0, $v0, $v1
/* A7AB4 800B72B4 4B004010 */  beqz       $v0, .L800B73E4
/* A7AB8 800B72B8 1400BFAF */   sw        $ra, 0x14($sp)
/* A7ABC 800B72BC 70DB020C */  jal        processVoiceCommands
/* A7AC0 800B72C0 21200002 */   addu      $a0, $s0, $zero
/* A7AC4 800B72C4 27DB020C */  jal        processCdCommands
/* A7AC8 800B72C8 21200002 */   addu      $a0, $s0, $zero
/* A7ACC 800B72CC A2000292 */  lbu        $v0, 0xA2($s0)
/* A7AD0 800B72D0 00000000 */  nop
/* A7AD4 800B72D4 43004014 */  bnez       $v0, .L800B73E4
/* A7AD8 800B72D8 00000000 */   nop
/* A7ADC 800B72DC A8000292 */  lbu        $v0, 0xA8($s0)
/* A7AE0 800B72E0 00000000 */  nop
/* A7AE4 800B72E4 3F004014 */  bnez       $v0, .L800B73E4
/* A7AE8 800B72E8 00000000 */   nop
/* A7AEC 800B72EC AA000392 */  lbu        $v1, 0xAA($s0)
/* A7AF0 800B72F0 00000000 */  nop
/* A7AF4 800B72F4 03006228 */  slti       $v0, $v1, 0x3
/* A7AF8 800B72F8 3A004010 */  beqz       $v0, .L800B73E4
/* A7AFC 800B72FC 00000000 */   nop
/* A7B00 800B7300 1A006014 */  bnez       $v1, .L800B736C
/* A7B04 800B7304 00000000 */   nop
/* A7B08 800B7308 36006014 */  bnez       $v1, .L800B73E4
/* A7B0C 800B730C 00000000 */   nop
/* A7B10 800B7310 A5000292 */  lbu        $v0, 0xA5($s0)
/* A7B14 800B7314 00000000 */  nop
/* A7B18 800B7318 32004010 */  beqz       $v0, .L800B73E4
/* A7B1C 800B731C 21200002 */   addu      $a0, $s0, $zero
/* A7B20 800B7320 A4000292 */  lbu        $v0, 0xA4($s0)
/* A7B24 800B7324 21280000 */  addu       $a1, $zero, $zero
/* A7B28 800B7328 40100200 */  sll        $v0, $v0, 1
/* A7B2C 800B732C 21105000 */  addu       $v0, $v0, $s0
/* A7B30 800B7330 58004794 */  lhu        $a3, 0x58($v0)
/* A7B34 800B7334 51DB020C */  jal        putVoiceCommand
/* A7B38 800B7338 01000624 */   addiu     $a2, $zero, 0x1
/* A7B3C 800B733C A5000292 */  lbu        $v0, 0xA5($s0)
/* A7B40 800B7340 A4000392 */  lbu        $v1, 0xA4($s0)
/* A7B44 800B7344 FFFF4224 */  addiu      $v0, $v0, -0x1
/* A7B48 800B7348 01006324 */  addiu      $v1, $v1, 0x1
/* A7B4C 800B734C A40003A2 */  sb         $v1, 0xA4($s0)
/* A7B50 800B7350 FF006330 */  andi       $v1, $v1, 0xFF
/* A7B54 800B7354 A50002A2 */  sb         $v0, 0xA5($s0)
/* A7B58 800B7358 04000224 */  addiu      $v0, $zero, 0x4
/* A7B5C 800B735C 21006214 */  bne        $v1, $v0, .L800B73E4
/* A7B60 800B7360 00000000 */   nop
/* A7B64 800B7364 F9DC0208 */  j          .L800B73E4
/* A7B68 800B7368 A40000A2 */   sb        $zero, 0xA4($s0)
.L800B736C:
/* A7B6C 800B736C 10000424 */  addiu      $a0, $zero, 0x10
/* A7B70 800B7370 00FF8627 */  addiu      $a2, $gp, %gp_rel(voiceTracker + 0x10)
/* A7B74 800B7374 ECF8020C */  jal        func_800BE3B0
/* A7B78 800B7378 21280000 */   addu      $a1, $zero, $zero
/* A7B7C 800B737C 13000292 */  lbu        $v0, 0x13($s0)
/* A7B80 800B7380 00000000 */  nop
/* A7B84 800B7384 02004230 */  andi       $v0, $v0, 0x2
/* A7B88 800B7388 16004010 */  beqz       $v0, .L800B73E4
/* A7B8C 800B738C 21200002 */   addu      $a0, $s0, $zero
/* A7B90 800B7390 10000392 */  lbu        $v1, 0x10($s0)
/* A7B94 800B7394 11000592 */  lbu        $a1, 0x11($s0)
/* A7B98 800B7398 12000692 */  lbu        $a2, 0x12($s0)
/* A7B9C 800B739C 02000224 */  addiu      $v0, $zero, 0x2
/* A7BA0 800B73A0 AA0002A2 */  sb         $v0, 0xAA($s0)
/* A7BA4 800B73A4 030000A2 */  sb         $zero, 0x3($s0)
/* A7BA8 800B73A8 F0FE83A3 */  sb         $v1, %gp_rel(voiceTracker)($gp)
/* A7BAC 800B73AC 010005A2 */  sb         $a1, 0x1($s0)
/* A7BB0 800B73B0 56FC020C */  jal        func_800BF158
/* A7BB4 800B73B4 020006A2 */   sb        $a2, 0x2($s0)
/* A7BB8 800B73B8 0800038E */  lw         $v1, 0x8($s0)
/* A7BBC 800B73BC 6AFF4224 */  addiu      $v0, $v0, -0x96
/* A7BC0 800B73C0 040002AE */  sw         $v0, 0x4($s0)
/* A7BC4 800B73C4 F8FF6324 */  addiu      $v1, $v1, -0x8
/* A7BC8 800B73C8 2A104300 */  slt        $v0, $v0, $v1
/* A7BCC 800B73CC 05004014 */  bnez       $v0, .L800B73E4
/* A7BD0 800B73D0 21200002 */   addu      $a0, $s0, $zero
/* A7BD4 800B73D4 01000524 */  addiu      $a1, $zero, 0x1
/* A7BD8 800B73D8 21300000 */  addu       $a2, $zero, $zero
/* A7BDC 800B73DC 51DB020C */  jal        putVoiceCommand
/* A7BE0 800B73E0 2138C000 */   addu      $a3, $a2, $zero
.L800B73E4:
/* A7BE4 800B73E4 1400BF8F */  lw         $ra, 0x14($sp)
/* A7BE8 800B73E8 1000B08F */  lw         $s0, 0x10($sp)
/* A7BEC 800B73EC 0800E003 */  jr         $ra
/* A7BF0 800B73F0 1800BD27 */   addiu     $sp, $sp, 0x18
.size VOICEXA_Tick, . - VOICEXA_Tick
