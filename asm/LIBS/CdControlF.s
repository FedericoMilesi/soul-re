.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CdControlF
/* AEA7C 800BE27C C8FFBD27 */  addiu      $sp, $sp, -0x38
/* AEA80 800BE280 1400B1AF */  sw         $s1, 0x14($sp)
/* AEA84 800BE284 2188A000 */  addu       $s1, $a1, $zero
/* AEA88 800BE288 1C00B3AF */  sw         $s3, 0x1C($sp)
/* AEA8C 800BE28C 21988000 */  addu       $s3, $a0, $zero
/* AEA90 800BE290 1000B0AF */  sw         $s0, 0x10($sp)
/* AEA94 800BE294 03001024 */  addiu      $s0, $zero, 0x3
/* AEA98 800BE298 3000BEAF */  sw         $fp, 0x30($sp)
/* AEA9C 800BE29C 01001E24 */  addiu      $fp, $zero, 0x1
/* AEAA0 800BE2A0 1800B2AF */  sw         $s2, 0x18($sp)
/* AEAA4 800BE2A4 FF007232 */  andi       $s2, $s3, 0xFF
/* AEAA8 800BE2A8 0D80033C */  lui        $v1, %hi(ratan_tbl + 0x840)
/* AEAAC 800BE2AC BCE36324 */  addiu      $v1, $v1, %lo(ratan_tbl + 0x840)
/* AEAB0 800BE2B0 2000B4AF */  sw         $s4, 0x20($sp)
/* AEAB4 800BE2B4 0D80143C */  lui        $s4, %hi(CD_cbsync)
/* AEAB8 800BE2B8 84E9948E */  lw         $s4, %lo(CD_cbsync)($s4)
/* AEABC 800BE2BC 80101200 */  sll        $v0, $s2, 2
/* AEAC0 800BE2C0 2400B5AF */  sw         $s5, 0x24($sp)
/* AEAC4 800BE2C4 21A84300 */  addu       $s5, $v0, $v1
/* AEAC8 800BE2C8 2800B6AF */  sw         $s6, 0x28($sp)
/* AEACC 800BE2CC 21B00000 */  addu       $s6, $zero, $zero
/* AEAD0 800BE2D0 2C00B7AF */  sw         $s7, 0x2C($sp)
/* AEAD4 800BE2D4 FFFF1724 */  addiu      $s7, $zero, -0x1
/* AEAD8 800BE2D8 3400BFAF */  sw         $ra, 0x34($sp)
.L800BE2DC:
/* AEADC 800BE2DC 0D80013C */  lui        $at, %hi(CD_cbsync)
/* AEAE0 800BE2E0 0B005E12 */  beq        $s2, $fp, .L800BE310
/* AEAE4 800BE2E4 84E920AC */   sw        $zero, %lo(CD_cbsync)($at)
/* AEAE8 800BE2E8 0D80023C */  lui        $v0, %hi(CD_status)
/* AEAEC 800BE2EC 90E94290 */  lbu        $v0, %lo(CD_status)($v0)
/* AEAF0 800BE2F0 00000000 */  nop
/* AEAF4 800BE2F4 10004230 */  andi       $v0, $v0, 0x10
/* AEAF8 800BE2F8 05004010 */  beqz       $v0, .L800BE310
/* AEAFC 800BE2FC 01000424 */   addiu     $a0, $zero, 0x1
/* AEB00 800BE300 21280000 */  addu       $a1, $zero, $zero
/* AEB04 800BE304 21300000 */  addu       $a2, $zero, $zero
/* AEB08 800BE308 9E12030C */  jal        CD_cw
/* AEB0C 800BE30C 21380000 */   addu      $a3, $zero, $zero
.L800BE310:
/* AEB10 800BE310 0B002012 */  beqz       $s1, .L800BE340
/* AEB14 800BE314 00000000 */   nop
/* AEB18 800BE318 0000A28E */  lw         $v0, 0x0($s5)
/* AEB1C 800BE31C 00000000 */  nop
/* AEB20 800BE320 07004010 */  beqz       $v0, .L800BE340
/* AEB24 800BE324 02000424 */   addiu     $a0, $zero, 0x2
/* AEB28 800BE328 21282002 */  addu       $a1, $s1, $zero
/* AEB2C 800BE32C 21300000 */  addu       $a2, $zero, $zero
/* AEB30 800BE330 9E12030C */  jal        CD_cw
/* AEB34 800BE334 21380000 */   addu      $a3, $zero, $zero
/* AEB38 800BE338 0A004014 */  bnez       $v0, .L800BE364
/* AEB3C 800BE33C 00000000 */   nop
.L800BE340:
/* AEB40 800BE340 0D80013C */  lui        $at, %hi(CD_cbsync)
/* AEB44 800BE344 84E934AC */  sw         $s4, %lo(CD_cbsync)($at)
/* AEB48 800BE348 FF006432 */  andi       $a0, $s3, 0xFF
/* AEB4C 800BE34C 21282002 */  addu       $a1, $s1, $zero
/* AEB50 800BE350 21300000 */  addu       $a2, $zero, $zero
/* AEB54 800BE354 9E12030C */  jal        CD_cw
/* AEB58 800BE358 01000724 */   addiu     $a3, $zero, 0x1
/* AEB5C 800BE35C 08004010 */  beqz       $v0, .L800BE380
/* AEB60 800BE360 0100C226 */   addiu     $v0, $s6, 0x1
.L800BE364:
/* AEB64 800BE364 FFFF1026 */  addiu      $s0, $s0, -0x1
/* AEB68 800BE368 DCFF1716 */  bne        $s0, $s7, .L800BE2DC
/* AEB6C 800BE36C 00000000 */   nop
/* AEB70 800BE370 0D80013C */  lui        $at, %hi(CD_cbsync)
/* AEB74 800BE374 84E934AC */  sw         $s4, %lo(CD_cbsync)($at)
/* AEB78 800BE378 FFFF1624 */  addiu      $s6, $zero, -0x1
/* AEB7C 800BE37C 0100C226 */  addiu      $v0, $s6, 0x1
.L800BE380:
/* AEB80 800BE380 3400BF8F */  lw         $ra, 0x34($sp)
/* AEB84 800BE384 3000BE8F */  lw         $fp, 0x30($sp)
/* AEB88 800BE388 2C00B78F */  lw         $s7, 0x2C($sp)
/* AEB8C 800BE38C 2800B68F */  lw         $s6, 0x28($sp)
/* AEB90 800BE390 2400B58F */  lw         $s5, 0x24($sp)
/* AEB94 800BE394 2000B48F */  lw         $s4, 0x20($sp)
/* AEB98 800BE398 1C00B38F */  lw         $s3, 0x1C($sp)
/* AEB9C 800BE39C 1800B28F */  lw         $s2, 0x18($sp)
/* AEBA0 800BE3A0 1400B18F */  lw         $s1, 0x14($sp)
/* AEBA4 800BE3A4 1000B08F */  lw         $s0, 0x10($sp)
/* AEBA8 800BE3A8 0800E003 */  jr         $ra
/* AEBAC 800BE3AC 3800BD27 */   addiu     $sp, $sp, 0x38
.size CdControlF, . - CdControlF
