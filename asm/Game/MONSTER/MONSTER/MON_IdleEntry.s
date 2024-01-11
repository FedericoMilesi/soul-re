.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_IdleEntry
/* 7AABC 8008A2BC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 7AAC0 8008A2C0 21288000 */  addu       $a1, $a0, $zero
/* 7AAC4 8008A2C4 FBFF043C */  lui        $a0, (0xFFFBFFFF >> 16)
/* 7AAC8 8008A2C8 1400BFAF */  sw         $ra, 0x14($sp)
/* 7AACC 8008A2CC 1000B0AF */  sw         $s0, 0x10($sp)
/* 7AAD0 8008A2D0 6C01B08C */  lw         $s0, 0x16C($a1)
/* 7AAD4 8008A2D4 FFFF8434 */  ori        $a0, $a0, (0xFFFBFFFF & 0xFFFF)
/* 7AAD8 8008A2D8 0000028E */  lw         $v0, 0x0($s0)
/* 7AADC 8008A2DC FFEF0324 */  addiu      $v1, $zero, -0x1001
/* 7AAE0 8008A2E0 24104300 */  and        $v0, $v0, $v1
/* 7AAE4 8008A2E4 24104400 */  and        $v0, $v0, $a0
/* 7AAE8 8008A2E8 01000324 */  addiu      $v1, $zero, 0x1
/* 7AAEC 8008A2EC 000002AE */  sw         $v0, 0x0($s0)
/* 7AAF0 8008A2F0 04004230 */  andi       $v0, $v0, 0x4
/* 7AAF4 8008A2F4 10004010 */  beqz       $v0, .L8008A338
/* 7AAF8 8008A2F8 080103AE */   sw        $v1, 0x108($s0)
/* 7AAFC 8008A2FC C400028E */  lw         $v0, 0xC4($s0)
/* 7AB00 8008A300 2400A38C */  lw         $v1, 0x24($a1)
/* 7AB04 8008A304 05004010 */  beqz       $v0, .L8008A31C
/* 7AB08 8008A308 2120A000 */   addu      $a0, $a1, $zero
/* 7AB0C 8008A30C 9D03020C */  jal        MON_PlayCombatIdle
/* 7AB10 8008A310 02000524 */   addiu     $a1, $zero, 0x2
/* 7AB14 8008A314 D9280208 */  j          .L8008A364
/* 7AB18 8008A318 00000000 */   nop
.L8008A31C:
/* 7AB1C 8008A31C 4400628C */  lw         $v0, 0x44($v1)
/* 7AB20 8008A320 00000000 */  nop
/* 7AB24 8008A324 00004580 */  lb         $a1, 0x0($v0)
/* 7AB28 8008A328 01FF010C */  jal        MON_PlayAnimID
/* 7AB2C 8008A32C 02000624 */   addiu     $a2, $zero, 0x2
/* 7AB30 8008A330 D9280208 */  j          .L8008A364
/* 7AB34 8008A334 00000000 */   nop
.L8008A338:
/* 7AB38 8008A338 EC01A290 */  lbu        $v0, 0x1EC($a1)
/* 7AB3C 8008A33C 00000000 */  nop
/* 7AB40 8008A340 01004230 */  andi       $v0, $v0, 0x1
/* 7AB44 8008A344 07004014 */  bnez       $v0, .L8008A364
/* 7AB48 8008A348 00000000 */   nop
/* 7AB4C 8008A34C 463F020C */  jal        G2Anim_SetLooping
/* 7AB50 8008A350 C801A424 */   addiu     $a0, $a1, 0x1C8
/* 7AB54 8008A354 0000028E */  lw         $v0, 0x0($s0)
/* 7AB58 8008A358 0004033C */  lui        $v1, (0x4000000 >> 16)
/* 7AB5C 8008A35C 25104300 */  or         $v0, $v0, $v1
/* 7AB60 8008A360 000002AE */  sw         $v0, 0x0($s0)
.L8008A364:
/* 7AB64 8008A364 1400BF8F */  lw         $ra, 0x14($sp)
/* 7AB68 8008A368 1000B08F */  lw         $s0, 0x10($sp)
/* 7AB6C 8008A36C 0800E003 */  jr         $ra
/* 7AB70 8008A370 1800BD27 */   addiu     $sp, $sp, 0x18
.size MON_IdleEntry, . - MON_IdleEntry
