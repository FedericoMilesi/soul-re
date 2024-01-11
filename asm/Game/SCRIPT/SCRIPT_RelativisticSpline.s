.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SCRIPT_RelativisticSpline
/* 2DADC 8003D2DC B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 2DAE0 8003D2E0 4800B0AF */  sw         $s0, 0x48($sp)
/* 2DAE4 8003D2E4 21808000 */  addu       $s0, $a0, $zero
/* 2DAE8 8003D2E8 4C00BFAF */  sw         $ra, 0x4C($sp)
/* 2DAEC 8003D2EC 2000038E */  lw         $v1, 0x20($s0)
/* 2DAF0 8003D2F0 00000000 */  nop
/* 2DAF4 8003D2F4 63006010 */  beqz       $v1, .L8003D484
/* 2DAF8 8003D2F8 2138A000 */   addu      $a3, $a1, $zero
/* 2DAFC 8003D2FC 1800628C */  lw         $v0, 0x18($v1)
/* 2DB00 8003D300 00000000 */  nop
/* 2DB04 8003D304 05004014 */  bnez       $v0, .L8003D31C
/* 2DB08 8003D308 00000000 */   nop
/* 2DB0C 8003D30C 1C006284 */  lh         $v0, 0x1C($v1)
/* 2DB10 8003D310 00000000 */  nop
/* 2DB14 8003D314 5C004010 */  beqz       $v0, .L8003D488
/* 2DB18 8003D318 6E000326 */   addiu     $v1, $s0, 0x6E
.L8003D31C:
/* 2DB1C 8003D31C 0000E594 */  lhu        $a1, 0x0($a3)
/* 2DB20 8003D320 0200E394 */  lhu        $v1, 0x2($a3)
/* 2DB24 8003D324 0400E494 */  lhu        $a0, 0x4($a3)
/* 2DB28 8003D328 1000A227 */  addiu      $v0, $sp, 0x10
/* 2DB2C 8003D32C 1000A5A7 */  sh         $a1, 0x10($sp)
/* 2DB30 8003D330 020043A4 */  sh         $v1, 0x2($v0)
/* 2DB34 8003D334 040044A4 */  sh         $a0, 0x4($v0)
/* 2DB38 8003D338 1200A297 */  lhu        $v0, 0x12($sp)
/* 2DB3C 8003D33C 1400A397 */  lhu        $v1, 0x14($sp)
/* 2DB40 8003D340 4000A5A7 */  sh         $a1, 0x40($sp)
/* 2DB44 8003D344 4200A2A7 */  sh         $v0, 0x42($sp)
/* 2DB48 8003D348 4400A3A7 */  sh         $v1, 0x44($sp)
/* 2DB4C 8003D34C 2000048E */  lw         $a0, 0x20($s0)
/* 2DB50 8003D350 1800A527 */  addiu      $a1, $sp, 0x18
/* 2DB54 8003D354 3DE3010C */  jal        RotMatrix
/* 2DB58 8003D358 18008424 */   addiu     $a0, $a0, 0x18
/* 2DB5C 8003D35C 4000A487 */  lh         $a0, 0x40($sp)
/* 2DB60 8003D360 1800A287 */  lh         $v0, 0x18($sp)
/* 2DB64 8003D364 00000000 */  nop
/* 2DB68 8003D368 18008200 */  mult       $a0, $v0
/* 2DB6C 8003D36C 4200A387 */  lh         $v1, 0x42($sp)
/* 2DB70 8003D370 12500000 */  mflo       $t2
/* 2DB74 8003D374 1A00A287 */  lh         $v0, 0x1A($sp)
/* 2DB78 8003D378 00000000 */  nop
/* 2DB7C 8003D37C 18006200 */  mult       $v1, $v0
/* 2DB80 8003D380 4400A587 */  lh         $a1, 0x44($sp)
/* 2DB84 8003D384 12700000 */  mflo       $t6
/* 2DB88 8003D388 1C00A287 */  lh         $v0, 0x1C($sp)
/* 2DB8C 8003D38C 00000000 */  nop
/* 2DB90 8003D390 1800A200 */  mult       $a1, $v0
/* 2DB94 8003D394 12300000 */  mflo       $a2
/* 2DB98 8003D398 1E00A287 */  lh         $v0, 0x1E($sp)
/* 2DB9C 8003D39C 00000000 */  nop
/* 2DBA0 8003D3A0 18008200 */  mult       $a0, $v0
/* 2DBA4 8003D3A4 12580000 */  mflo       $t3
/* 2DBA8 8003D3A8 2000A287 */  lh         $v0, 0x20($sp)
/* 2DBAC 8003D3AC 00000000 */  nop
/* 2DBB0 8003D3B0 18006200 */  mult       $v1, $v0
/* 2DBB4 8003D3B4 12380000 */  mflo       $a3
/* 2DBB8 8003D3B8 2200A287 */  lh         $v0, 0x22($sp)
/* 2DBBC 8003D3BC 00000000 */  nop
/* 2DBC0 8003D3C0 1800A200 */  mult       $a1, $v0
/* 2DBC4 8003D3C4 12400000 */  mflo       $t0
/* 2DBC8 8003D3C8 2400A287 */  lh         $v0, 0x24($sp)
/* 2DBCC 8003D3CC 00000000 */  nop
/* 2DBD0 8003D3D0 18008200 */  mult       $a0, $v0
/* 2DBD4 8003D3D4 12600000 */  mflo       $t4
/* 2DBD8 8003D3D8 2600A287 */  lh         $v0, 0x26($sp)
/* 2DBDC 8003D3DC 00000000 */  nop
/* 2DBE0 8003D3E0 18006200 */  mult       $v1, $v0
/* 2DBE4 8003D3E4 3400A0AF */  sw         $zero, 0x34($sp)
/* 2DBE8 8003D3E8 3000A0AF */  sw         $zero, 0x30($sp)
/* 2DBEC 8003D3EC 2C00A0AF */  sw         $zero, 0x2C($sp)
/* 2DBF0 8003D3F0 03230A00 */  sra        $a0, $t2, 12
/* 2DBF4 8003D3F4 03130E00 */  sra        $v0, $t6, 12
/* 2DBF8 8003D3F8 21208200 */  addu       $a0, $a0, $v0
/* 2DBFC 8003D3FC 12480000 */  mflo       $t1
/* 2DC00 8003D400 2800A287 */  lh         $v0, 0x28($sp)
/* 2DC04 8003D404 031B0600 */  sra        $v1, $a2, 12
/* 2DC08 8003D408 1800A200 */  mult       $a1, $v0
/* 2DC0C 8003D40C 21208300 */  addu       $a0, $a0, $v1
/* 2DC10 8003D410 031B0700 */  sra        $v1, $a3, 12
/* 2DC14 8003D414 3800A4A7 */  sh         $a0, 0x38($sp)
/* 2DC18 8003D418 03130B00 */  sra        $v0, $t3, 12
/* 2DC1C 8003D41C 21104300 */  addu       $v0, $v0, $v1
/* 2DC20 8003D420 031B0800 */  sra        $v1, $t0, 12
/* 2DC24 8003D424 21104300 */  addu       $v0, $v0, $v1
/* 2DC28 8003D428 3A00A2A7 */  sh         $v0, 0x3A($sp)
/* 2DC2C 8003D42C 03130C00 */  sra        $v0, $t4, 12
/* 2DC30 8003D430 031B0900 */  sra        $v1, $t1, 12
/* 2DC34 8003D434 21104300 */  addu       $v0, $v0, $v1
/* 2DC38 8003D438 12300000 */  mflo       $a2
/* 2DC3C 8003D43C 031B0600 */  sra        $v1, $a2, 12
/* 2DC40 8003D440 21104300 */  addu       $v0, $v0, $v1
/* 2DC44 8003D444 3C00A2A7 */  sh         $v0, 0x3C($sp)
/* 2DC48 8003D448 3800A227 */  addiu      $v0, $sp, 0x38
/* 2DC4C 8003D44C 6E000626 */  addiu      $a2, $s0, 0x6E
/* 2DC50 8003D450 02004394 */  lhu        $v1, 0x2($v0)
/* 2DC54 8003D454 04004294 */  lhu        $v0, 0x4($v0)
/* 2DC58 8003D458 6E000596 */  lhu        $a1, 0x6E($s0)
/* 2DC5C 8003D45C 0200C794 */  lhu        $a3, 0x2($a2)
/* 2DC60 8003D460 0400C694 */  lhu        $a2, 0x4($a2)
/* 2DC64 8003D464 21208500 */  addu       $a0, $a0, $a1
/* 2DC68 8003D468 5C0004A6 */  sh         $a0, 0x5C($s0)
/* 2DC6C 8003D46C 5C000426 */  addiu      $a0, $s0, 0x5C
/* 2DC70 8003D470 21186700 */  addu       $v1, $v1, $a3
/* 2DC74 8003D474 21104600 */  addu       $v0, $v0, $a2
/* 2DC78 8003D478 020083A4 */  sh         $v1, 0x2($a0)
/* 2DC7C 8003D47C 2FF50008 */  j          .L8003D4BC
/* 2DC80 8003D480 040082A4 */   sh        $v0, 0x4($a0)
.L8003D484:
/* 2DC84 8003D484 6E000326 */  addiu      $v1, $s0, 0x6E
.L8003D488:
/* 2DC88 8003D488 6E000296 */  lhu        $v0, 0x6E($s0)
/* 2DC8C 8003D48C 02006494 */  lhu        $a0, 0x2($v1)
/* 2DC90 8003D490 04006394 */  lhu        $v1, 0x4($v1)
/* 2DC94 8003D494 0000E594 */  lhu        $a1, 0x0($a3)
/* 2DC98 8003D498 0200E694 */  lhu        $a2, 0x2($a3)
/* 2DC9C 8003D49C 0400E794 */  lhu        $a3, 0x4($a3)
/* 2DCA0 8003D4A0 21104500 */  addu       $v0, $v0, $a1
/* 2DCA4 8003D4A4 5C0002A6 */  sh         $v0, 0x5C($s0)
/* 2DCA8 8003D4A8 5C000226 */  addiu      $v0, $s0, 0x5C
/* 2DCAC 8003D4AC 21208600 */  addu       $a0, $a0, $a2
/* 2DCB0 8003D4B0 21186700 */  addu       $v1, $v1, $a3
/* 2DCB4 8003D4B4 020044A4 */  sh         $a0, 0x2($v0)
/* 2DCB8 8003D4B8 040043A4 */  sh         $v1, 0x4($v0)
.L8003D4BC:
/* 2DCBC 8003D4BC 4C00BF8F */  lw         $ra, 0x4C($sp)
/* 2DCC0 8003D4C0 4800B08F */  lw         $s0, 0x48($sp)
/* 2DCC4 8003D4C4 0800E003 */  jr         $ra
/* 2DCC8 8003D4C8 5000BD27 */   addiu     $sp, $sp, 0x50
.size SCRIPT_RelativisticSpline, . - SCRIPT_RelativisticSpline
