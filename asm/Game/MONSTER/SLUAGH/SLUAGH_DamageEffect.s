.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SLUAGH_DamageEffect
/* 7DA9C 8008D29C C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 7DAA0 8008D2A0 3800B2AF */  sw         $s2, 0x38($sp)
/* 7DAA4 8008D2A4 21908000 */  addu       $s2, $a0, $zero
/* 7DAA8 8008D2A8 3400B1AF */  sw         $s1, 0x34($sp)
/* 7DAAC 8008D2AC 2188A000 */  addu       $s1, $a1, $zero
/* 7DAB0 8008D2B0 3C00BFAF */  sw         $ra, 0x3C($sp)
/* 7DAB4 8008D2B4 3000B0AF */  sw         $s0, 0x30($sp)
/* 7DAB8 8008D2B8 6C01508E */  lw         $s0, 0x16C($s2)
/* 7DABC 8008D2BC 1D002012 */  beqz       $s1, .L8008D334
/* 7DAC0 8008D2C0 00000000 */   nop
/* 7DAC4 8008D2C4 0400028E */  lw         $v0, 0x4($s0)
/* 7DAC8 8008D2C8 00000000 */  nop
/* 7DACC 8008D2CC 01004230 */  andi       $v0, $v0, 0x1
/* 7DAD0 8008D2D0 69004014 */  bnez       $v0, .L8008D478
/* 7DAD4 8008D2D4 3000033C */   lui       $v1, (0x308000 >> 16)
/* 7DAD8 8008D2D8 00806334 */  ori        $v1, $v1, (0x308000 & 0xFFFF)
/* 7DADC 8008D2DC 21202002 */  addu       $a0, $s1, $zero
/* 7DAE0 8008D2E0 08002526 */  addiu      $a1, $s1, 0x8
/* 7DAE4 8008D2E4 0D80023C */  lui        $v0, %hi(SLUAGH_FunctionTable + 0x20)
/* 7DAE8 8008D2E8 1800A627 */  addiu      $a2, $sp, 0x18
/* 7DAEC 8008D2EC 881B4B24 */  addiu      $t3, $v0, %lo(SLUAGH_FunctionTable + 0x20)
/* 7DAF0 8008D2F0 03006889 */  lwl        $t0, 0x3($t3)
/* 7DAF4 8008D2F4 00006899 */  lwr        $t0, 0x0($t3)
/* 7DAF8 8008D2F8 07006989 */  lwl        $t1, 0x7($t3)
/* 7DAFC 8008D2FC 04006999 */  lwr        $t1, 0x4($t3)
/* 7DB00 8008D300 1B00A8AB */  swl        $t0, 0x1B($sp)
/* 7DB04 8008D304 1800A8BB */  swr        $t0, 0x18($sp)
/* 7DB08 8008D308 1F00A9AB */  swl        $t1, 0x1F($sp)
/* 7DB0C 8008D30C 1C00A9BB */  swr        $t1, 0x1C($sp)
/* 7DB10 8008D310 10002786 */  lh         $a3, 0x10($s1)
/* 7DB14 8008D314 08000224 */  addiu      $v0, $zero, 0x8
/* 7DB18 8008D318 1000A3AF */  sw         $v1, 0x10($sp)
/* 7DB1C 8008D31C F122010C */  jal        FX_Blood
/* 7DB20 8008D320 1400A2AF */   sw        $v0, 0x14($sp)
/* 7DB24 8008D324 CF29010C */  jal        FX_MakeHitFX
/* 7DB28 8008D328 21202002 */   addu      $a0, $s1, $zero
/* 7DB2C 8008D32C 1E350208 */  j          .L8008D478
/* 7DB30 8008D330 00000000 */   nop
.L8008D334:
/* 7DB34 8008D334 DC00118E */  lw         $s1, 0xDC($s0)
/* 7DB38 8008D338 00000000 */  nop
/* 7DB3C 8008D33C 37002012 */  beqz       $s1, .L8008D41C
/* 7DB40 8008D340 00000000 */   nop
/* 7DB44 8008D344 44010486 */  lh         $a0, 0x144($s0)
/* 7DB48 8008D348 00000000 */  nop
/* 7DB4C 8008D34C 02008104 */  bgez       $a0, .L8008D358
/* 7DB50 8008D350 00000000 */   nop
/* 7DB54 8008D354 FF0F8424 */  addiu      $a0, $a0, 0xFFF
.L8008D358:
/* 7DB58 8008D358 3434010C */  jal        FX_GetHealthColor
/* 7DB5C 8008D35C 03230400 */   sra       $a0, $a0, 12
/* 7DB60 8008D360 1800238E */  lw         $v1, 0x18($s1)
/* 7DB64 8008D364 00000000 */  nop
/* 7DB68 8008D368 2C006210 */  beq        $v1, $v0, .L8008D41C
/* 7DB6C 8008D36C 2800A2AF */   sw        $v0, 0x28($sp)
/* 7DB70 8008D370 1B00288A */  lwl        $t0, 0x1B($s1)
/* 7DB74 8008D374 1800289A */  lwr        $t0, 0x18($s1)
/* 7DB78 8008D378 00000000 */  nop
/* 7DB7C 8008D37C 1B00A8AB */  swl        $t0, 0x1B($sp)
/* 7DB80 8008D380 1800A8BB */  swr        $t0, 0x18($sp)
/* 7DB84 8008D384 2B00A88B */  lwl        $t0, 0x2B($sp)
/* 7DB88 8008D388 2800A89B */  lwr        $t0, 0x28($sp)
/* 7DB8C 8008D38C 00000000 */  nop
/* 7DB90 8008D390 2300A8AB */  swl        $t0, 0x23($sp)
/* 7DB94 8008D394 2000A8BB */  swr        $t0, 0x20($sp)
/* 7DB98 8008D398 1800A393 */  lbu        $v1, 0x18($sp)
/* 7DB9C 8008D39C 2000A593 */  lbu        $a1, 0x20($sp)
/* 7DBA0 8008D3A0 FF006430 */  andi       $a0, $v1, 0xFF
/* 7DBA4 8008D3A4 2B10A400 */  sltu       $v0, $a1, $a0
/* 7DBA8 8008D3A8 04004014 */  bnez       $v0, .L8008D3BC
/* 7DBAC 8008D3AC FCFF6224 */   addiu     $v0, $v1, -0x4
/* 7DBB0 8008D3B0 2B108500 */  sltu       $v0, $a0, $a1
/* 7DBB4 8008D3B4 02004010 */  beqz       $v0, .L8008D3C0
/* 7DBB8 8008D3B8 04006224 */   addiu     $v0, $v1, 0x4
.L8008D3BC:
/* 7DBBC 8008D3BC 1800A2A3 */  sb         $v0, 0x18($sp)
.L8008D3C0:
/* 7DBC0 8008D3C0 1900A393 */  lbu        $v1, 0x19($sp)
/* 7DBC4 8008D3C4 2100A593 */  lbu        $a1, 0x21($sp)
/* 7DBC8 8008D3C8 FF006430 */  andi       $a0, $v1, 0xFF
/* 7DBCC 8008D3CC 2B10A400 */  sltu       $v0, $a1, $a0
/* 7DBD0 8008D3D0 04004014 */  bnez       $v0, .L8008D3E4
/* 7DBD4 8008D3D4 FCFF6224 */   addiu     $v0, $v1, -0x4
/* 7DBD8 8008D3D8 2B108500 */  sltu       $v0, $a0, $a1
/* 7DBDC 8008D3DC 02004010 */  beqz       $v0, .L8008D3E8
/* 7DBE0 8008D3E0 04006224 */   addiu     $v0, $v1, 0x4
.L8008D3E4:
/* 7DBE4 8008D3E4 1900A2A3 */  sb         $v0, 0x19($sp)
.L8008D3E8:
/* 7DBE8 8008D3E8 1A00A393 */  lbu        $v1, 0x1A($sp)
/* 7DBEC 8008D3EC 2200A593 */  lbu        $a1, 0x22($sp)
/* 7DBF0 8008D3F0 FF006430 */  andi       $a0, $v1, 0xFF
/* 7DBF4 8008D3F4 2B10A400 */  sltu       $v0, $a1, $a0
/* 7DBF8 8008D3F8 04004014 */  bnez       $v0, .L8008D40C
/* 7DBFC 8008D3FC FCFF6224 */   addiu     $v0, $v1, -0x4
/* 7DC00 8008D400 2B108500 */  sltu       $v0, $a0, $a1
/* 7DC04 8008D404 02004010 */  beqz       $v0, .L8008D410
/* 7DC08 8008D408 04006224 */   addiu     $v0, $v1, 0x4
.L8008D40C:
/* 7DC0C 8008D40C 1A00A2A3 */  sb         $v0, 0x1A($sp)
.L8008D410:
/* 7DC10 8008D410 1800A28F */  lw         $v0, 0x18($sp)
/* 7DC14 8008D414 00000000 */  nop
/* 7DC18 8008D418 180022AE */  sw         $v0, 0x18($s1)
.L8008D41C:
/* 7DC1C 8008D41C 0400028E */  lw         $v0, 0x4($s0)
/* 7DC20 8008D420 00000000 */  nop
/* 7DC24 8008D424 01004230 */  andi       $v0, $v0, 0x1
/* 7DC28 8008D428 13004010 */  beqz       $v0, .L8008D478
/* 7DC2C 8008D42C 00000000 */   nop
/* 7DC30 8008D430 44010286 */  lh         $v0, 0x144($s0)
/* 7DC34 8008D434 00000000 */  nop
/* 7DC38 8008D438 0F004010 */  beqz       $v0, .L8008D478
/* 7DC3C 8008D43C DFFF033C */   lui       $v1, (0xFFDFFFFF >> 16)
/* 7DC40 8008D440 FFFF6334 */  ori        $v1, $v1, (0xFFDFFFFF & 0xFFFF)
/* 7DC44 8008D444 21204002 */  addu       $a0, $s2, $zero
/* 7DC48 8008D448 21280000 */  addu       $a1, $zero, $zero
/* 7DC4C 8008D44C 14000624 */  addiu      $a2, $zero, 0x14
/* 7DC50 8008D450 0000028E */  lw         $v0, 0x0($s0)
/* 7DC54 8008D454 5C010792 */  lbu        $a3, 0x15C($s0)
/* 7DC58 8008D458 24104300 */  and        $v0, $v0, $v1
/* 7DC5C 8008D45C 000002AE */  sw         $v0, 0x0($s0)
/* 7DC60 8008D460 0400028E */  lw         $v0, 0x4($s0)
/* 7DC64 8008D464 FEFF0324 */  addiu      $v1, $zero, -0x2
/* 7DC68 8008D468 5A0107A2 */  sb         $a3, 0x15A($s0)
/* 7DC6C 8008D46C 24104300 */  and        $v0, $v0, $v1
/* 7DC70 8008D470 7810020C */  jal        MON_StartSpecialFade
/* 7DC74 8008D474 040002AE */   sw        $v0, 0x4($s0)
.L8008D478:
/* 7DC78 8008D478 3C00BF8F */  lw         $ra, 0x3C($sp)
/* 7DC7C 8008D47C 3800B28F */  lw         $s2, 0x38($sp)
/* 7DC80 8008D480 3400B18F */  lw         $s1, 0x34($sp)
/* 7DC84 8008D484 3000B08F */  lw         $s0, 0x30($sp)
/* 7DC88 8008D488 0800E003 */  jr         $ra
/* 7DC8C 8008D48C 4000BD27 */   addiu     $sp, $sp, 0x40
.size SLUAGH_DamageEffect, . - SLUAGH_DamageEffect
