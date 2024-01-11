.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel VOICEXA_Init
/* A72E0 800B6AE0 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* A72E4 800B6AE4 F0FE8427 */  addiu      $a0, $gp, %gp_rel(voiceTracker)
/* A72E8 800B6AE8 88BE828F */  lw         $v0, %gp_rel(gameTrackerX + 0xC0)($gp)
/* A72EC 800B6AEC 0800033C */  lui        $v1, (0x80000 >> 16)
/* A72F0 800B6AF0 5800BFAF */  sw         $ra, 0x58($sp)
/* A72F4 800B6AF4 5400B3AF */  sw         $s3, 0x54($sp)
/* A72F8 800B6AF8 5000B2AF */  sw         $s2, 0x50($sp)
/* A72FC 800B6AFC 4C00B1AF */  sw         $s1, 0x4C($sp)
/* A7300 800B6B00 24104300 */  and        $v0, $v0, $v1
/* A7304 800B6B04 22004010 */  beqz       $v0, .L800B6B90
/* A7308 800B6B08 4800B0AF */   sw        $s0, 0x48($sp)
/* A730C 800B6B0C 21880000 */  addu       $s1, $zero, $zero
/* A7310 800B6B10 2800B227 */  addiu      $s2, $sp, 0x28
/* A7314 800B6B14 0D80133C */  lui        $s3, %hi(monVersion + 0xC)
/* A7318 800B6B18 21808000 */  addu       $s0, $a0, $zero
/* A731C 800B6B1C AA0000A2 */  sb         $zero, 0xAA($s0)
/* A7320 800B6B20 AB0000A2 */  sb         $zero, 0xAB($s0)
/* A7324 800B6B24 A30000A2 */  sb         $zero, 0xA3($s0)
/* A7328 800B6B28 A40000A2 */  sb         $zero, 0xA4($s0)
/* A732C 800B6B2C A50000A2 */  sb         $zero, 0xA5($s0)
/* A7330 800B6B30 A00000A2 */  sb         $zero, 0xA0($s0)
/* A7334 800B6B34 A10000A2 */  sb         $zero, 0xA1($s0)
/* A7338 800B6B38 A20000A2 */  sb         $zero, 0xA2($s0)
/* A733C 800B6B3C A60000A2 */  sb         $zero, 0xA6($s0)
/* A7340 800B6B40 A70000A2 */  sb         $zero, 0xA7($s0)
/* A7344 800B6B44 A80000A2 */  sb         $zero, 0xA8($s0)
.L800B6B48:
/* A7348 800B6B48 21204002 */  addu       $a0, $s2, $zero
/* A734C 800B6B4C B01E6526 */  addiu      $a1, $s3, %lo(monVersion + 0xC)
/* A7350 800B6B50 1AD1010C */  jal        sprintf
/* A7354 800B6B54 21302002 */   addu      $a2, $s1, $zero
/* A7358 800B6B58 1000A427 */  addiu      $a0, $sp, 0x10
/* A735C 800B6B5C B5F9020C */  jal        CdSearchFile
/* A7360 800B6B60 21284002 */   addu      $a1, $s2, $zero
/* A7364 800B6B64 03004014 */  bnez       $v0, .L800B6B74
/* A7368 800B6B68 00000000 */   nop
/* A736C 800B6B6C E0DA0208 */  j          .L800B6B80
/* A7370 800B6B70 B00000AE */   sw        $zero, 0xB0($s0)
.L800B6B74:
/* A7374 800B6B74 56FC020C */  jal        CdPosToInt
/* A7378 800B6B78 1000A427 */   addiu     $a0, $sp, 0x10
/* A737C 800B6B7C B00002AE */  sw         $v0, 0xB0($s0)
.L800B6B80:
/* A7380 800B6B80 01003126 */  addiu      $s1, $s1, 0x1
/* A7384 800B6B84 1E00222A */  slti       $v0, $s1, 0x1E
/* A7388 800B6B88 EFFF4014 */  bnez       $v0, .L800B6B48
/* A738C 800B6B8C 04001026 */   addiu     $s0, $s0, 0x4
.L800B6B90:
/* A7390 800B6B90 5800BF8F */  lw         $ra, 0x58($sp)
/* A7394 800B6B94 5400B38F */  lw         $s3, 0x54($sp)
/* A7398 800B6B98 5000B28F */  lw         $s2, 0x50($sp)
/* A739C 800B6B9C 4C00B18F */  lw         $s1, 0x4C($sp)
/* A73A0 800B6BA0 4800B08F */  lw         $s0, 0x48($sp)
/* A73A4 800B6BA4 0800E003 */  jr         $ra
/* A73A8 800B6BA8 6000BD27 */   addiu     $sp, $sp, 0x60
.size VOICEXA_Init, . - VOICEXA_Init
