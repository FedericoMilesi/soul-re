.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GenericMessage
/* 2F2B0 8003EAB0 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 2F2B4 8003EAB4 1800B0AF */  sw         $s0, 0x18($sp)
/* 2F2B8 8003EAB8 21808000 */  addu       $s0, $a0, $zero
/* 2F2BC 8003EABC 2118C000 */  addu       $v1, $a2, $zero
/* 2F2C0 8003EAC0 0400023C */  lui        $v0, (0x4000B >> 16)
/* 2F2C4 8003EAC4 0B004234 */  ori        $v0, $v0, (0x4000B & 0xFFFF)
/* 2F2C8 8003EAC8 2000BFAF */  sw         $ra, 0x20($sp)
/* 2F2CC 8003EACC 3500A210 */  beq        $a1, $v0, .L8003EBA4
/* 2F2D0 8003EAD0 1C00B1AF */   sw        $s1, 0x1C($sp)
/* 2F2D4 8003EAD4 2B104500 */  sltu       $v0, $v0, $a1
/* 2F2D8 8003EAD8 0A004014 */  bnez       $v0, .L8003EB04
/* 2F2DC 8003EADC 0008023C */   lui       $v0, (0x8000008 >> 16)
/* 2F2E0 8003EAE0 0400023C */  lui        $v0, (0x40002 >> 16)
/* 2F2E4 8003EAE4 02004234 */  ori        $v0, $v0, (0x40002 & 0xFFFF)
/* 2F2E8 8003EAE8 3C00A210 */  beq        $a1, $v0, .L8003EBDC
/* 2F2EC 8003EAEC 0400023C */   lui       $v0, (0x4000A >> 16)
/* 2F2F0 8003EAF0 0A004234 */  ori        $v0, $v0, (0x4000A & 0xFFFF)
/* 2F2F4 8003EAF4 2700A210 */  beq        $a1, $v0, .L8003EB94
/* 2F2F8 8003EAF8 21200002 */   addu      $a0, $s0, $zero
/* 2F2FC 8003EAFC 06FB0008 */  j          .L8003EC18
/* 2F300 8003EB00 00000000 */   nop
.L8003EB04:
/* 2F304 8003EB04 08004234 */  ori        $v0, $v0, (0x8000008 & 0xFFFF)
/* 2F308 8003EB08 0E00A210 */  beq        $a1, $v0, .L8003EB44
/* 2F30C 8003EB0C 2B104500 */   sltu      $v0, $v0, $a1
/* 2F310 8003EB10 07004014 */  bnez       $v0, .L8003EB30
/* 2F314 8003EB14 0008023C */   lui       $v0, (0x8000010 >> 16)
/* 2F318 8003EB18 1000023C */  lui        $v0, (0x100007 >> 16)
/* 2F31C 8003EB1C 07004234 */  ori        $v0, $v0, (0x100007 & 0xFFFF)
/* 2F320 8003EB20 3300A210 */  beq        $a1, $v0, .L8003EBF0
/* 2F324 8003EB24 00000000 */   nop
/* 2F328 8003EB28 06FB0008 */  j          .L8003EC18
/* 2F32C 8003EB2C 00000000 */   nop
.L8003EB30:
/* 2F330 8003EB30 10004234 */  ori        $v0, $v0, (0x8000010 & 0xFFFF)
/* 2F334 8003EB34 2400A210 */  beq        $a1, $v0, .L8003EBC8
/* 2F338 8003EB38 21200002 */   addu      $a0, $s0, $zero
/* 2F33C 8003EB3C 06FB0008 */  j          .L8003EC18
/* 2F340 8003EB40 00000000 */   nop
.L8003EB44:
/* 2F344 8003EB44 1802028E */  lw         $v0, 0x218($s0)
/* 2F348 8003EB48 00000000 */  nop
/* 2F34C 8003EB4C 05004010 */  beqz       $v0, .L8003EB64
/* 2F350 8003EB50 21886000 */   addu      $s1, $v1, $zero
/* 2F354 8003EB54 0C00628C */  lw         $v0, 0xC($v1)
/* 2F358 8003EB58 21200002 */  addu       $a0, $s0, $zero
/* 2F35C 8003EB5C DBFA0008 */  j          .L8003EB6C
/* 2F360 8003EB60 1000A2AF */   sw        $v0, 0x10($sp)
.L8003EB64:
/* 2F364 8003EB64 21200002 */  addu       $a0, $s0, $zero
/* 2F368 8003EB68 1000A0AF */  sw         $zero, 0x10($sp)
.L8003EB6C:
/* 2F36C 8003EB6C 0400668C */  lw         $a2, 0x4($v1)
/* 2F370 8003EB70 0800678C */  lw         $a3, 0x8($v1)
/* 2F374 8003EB74 39C9010C */  jal        G2EmulationInstanceSetAnimation
/* 2F378 8003EB78 21280000 */   addu      $a1, $zero, $zero
/* 2F37C 8003EB7C 21200002 */  addu       $a0, $s0, $zero
/* 2F380 8003EB80 1000268E */  lw         $a2, 0x10($s1)
/* 2F384 8003EB84 71C9010C */  jal        G2EmulationInstanceSetMode
/* 2F388 8003EB88 21280000 */   addu      $a1, $zero, $zero
/* 2F38C 8003EB8C 06FB0008 */  j          .L8003EC18
/* 2F390 8003EB90 00000000 */   nop
.L8003EB94:
/* 2F394 8003EB94 E270010C */  jal        STREAM_SetInstancePosition
/* 2F398 8003EB98 21286000 */   addu      $a1, $v1, $zero
/* 2F39C 8003EB9C 06FB0008 */  j          .L8003EC18
/* 2F3A0 8003EBA0 00000000 */   nop
.L8003EBA4:
/* 2F3A4 8003EBA4 00006294 */  lhu        $v0, 0x0($v1)
/* 2F3A8 8003EBA8 00000000 */  nop
/* 2F3AC 8003EBAC 740002A6 */  sh         $v0, 0x74($s0)
/* 2F3B0 8003EBB0 02006294 */  lhu        $v0, 0x2($v1)
/* 2F3B4 8003EBB4 00000000 */  nop
/* 2F3B8 8003EBB8 760002A6 */  sh         $v0, 0x76($s0)
/* 2F3BC 8003EBBC 04006294 */  lhu        $v0, 0x4($v1)
/* 2F3C0 8003EBC0 06FB0008 */  j          .L8003EC18
/* 2F3C4 8003EBC4 780002A6 */   sh        $v0, 0x78($s0)
.L8003EBC8:
/* 2F3C8 8003EBC8 21280000 */  addu       $a1, $zero, $zero
/* 2F3CC 8003EBCC 71C9010C */  jal        G2EmulationInstanceSetMode
/* 2F3D0 8003EBD0 21306000 */   addu      $a2, $v1, $zero
/* 2F3D4 8003EBD4 06FB0008 */  j          .L8003EC18
/* 2F3D8 8003EBD8 00000000 */   nop
.L8003EBDC:
/* 2F3DC 8003EBDC 21200002 */  addu       $a0, $s0, $zero
/* 2F3E0 8003EBE0 F7F6000C */  jal        ScriptKillInstance
/* 2F3E4 8003EBE4 21286000 */   addu      $a1, $v1, $zero
/* 2F3E8 8003EBE8 06FB0008 */  j          .L8003EC18
/* 2F3EC 8003EBEC 00000000 */   nop
.L8003EBF0:
/* 2F3F0 8003EBF0 0400628C */  lw         $v0, 0x4($v1)
/* 2F3F4 8003EBF4 00000000 */  nop
/* 2F3F8 8003EBF8 0000428C */  lw         $v0, 0x0($v0)
/* 2F3FC 8003EBFC 00000000 */  nop
/* 2F400 8003EC00 140002AE */  sw         $v0, 0x14($s0)
/* 2F404 8003EC04 0400628C */  lw         $v0, 0x4($v1)
/* 2F408 8003EC08 00000000 */  nop
/* 2F40C 8003EC0C 0400428C */  lw         $v0, 0x4($v0)
/* 2F410 8003EC10 00000000 */  nop
/* 2F414 8003EC14 180002AE */  sw         $v0, 0x18($s0)
.L8003EC18:
/* 2F418 8003EC18 2000BF8F */  lw         $ra, 0x20($sp)
/* 2F41C 8003EC1C 1C00B18F */  lw         $s1, 0x1C($sp)
/* 2F420 8003EC20 1800B08F */  lw         $s0, 0x18($sp)
/* 2F424 8003EC24 0800E003 */  jr         $ra
/* 2F428 8003EC28 2800BD27 */   addiu     $sp, $sp, 0x28
.size GenericMessage, . - GenericMessage
