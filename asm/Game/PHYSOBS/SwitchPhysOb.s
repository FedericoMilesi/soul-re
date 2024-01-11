.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SwitchPhysOb
/* 5A168 80069968 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 5A16C 8006996C 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 5A170 80069970 21888000 */  addu       $s1, $a0, $zero
/* 5A174 80069974 2800BFAF */  sw         $ra, 0x28($sp)
/* 5A178 80069978 2400B3AF */  sw         $s3, 0x24($sp)
/* 5A17C 8006997C 2000B2AF */  sw         $s2, 0x20($sp)
/* 5A180 80069980 1800B0AF */  sw         $s0, 0x18($sp)
/* 5A184 80069984 2400308E */  lw         $s0, 0x24($s1)
/* 5A188 80069988 CFA3010C */  jal        CheckPhysObFamily
/* 5A18C 8006998C 02000524 */   addiu     $a1, $zero, 0x2
/* 5A190 80069990 65004010 */  beqz       $v0, .L80069B28
/* 5A194 80069994 01000224 */   addiu     $v0, $zero, 0x1
/* 5A198 80069998 6C01228E */  lw         $v0, 0x16C($s1)
/* 5A19C 8006999C 00000000 */  nop
/* 5A1A0 800699A0 0000438C */  lw         $v1, 0x0($v0)
/* 5A1A4 800699A4 00000000 */  nop
/* 5A1A8 800699A8 00086334 */  ori        $v1, $v1, 0x800
/* 5A1AC 800699AC 000043AC */  sw         $v1, 0x0($v0)
/* 5A1B0 800699B0 6C01328E */  lw         $s2, 0x16C($s1)
/* 5A1B4 800699B4 00000000 */  nop
/* 5A1B8 800699B8 04004396 */  lhu        $v1, 0x4($s2)
/* 5A1BC 800699BC 00000000 */  nop
/* 5A1C0 800699C0 01006230 */  andi       $v0, $v1, 0x1
/* 5A1C4 800699C4 32004010 */  beqz       $v0, .L80069A90
/* 5A1C8 800699C8 04005326 */   addiu     $s3, $s2, 0x4
/* 5A1CC 800699CC 02006230 */  andi       $v0, $v1, 0x2
/* 5A1D0 800699D0 1E004010 */  beqz       $v0, .L80069A4C
/* 5A1D4 800699D4 21202002 */   addu      $a0, $s1, $zero
/* 5A1D8 800699D8 21280000 */  addu       $a1, $zero, $zero
/* 5A1DC 800699DC FEFF6230 */  andi       $v0, $v1, 0xFFFE
/* 5A1E0 800699E0 08004234 */  ori        $v0, $v0, 0x8
/* 5A1E4 800699E4 040042A6 */  sh         $v0, 0x4($s2)
/* 5A1E8 800699E8 0D000692 */  lbu        $a2, 0xD($s0)
/* 5A1EC 800699EC 2138A000 */  addu       $a3, $a1, $zero
/* 5A1F0 800699F0 39C9010C */  jal        G2EmulationInstanceSetAnimation
/* 5A1F4 800699F4 1000A0AF */   sw        $zero, 0x10($sp)
/* 5A1F8 800699F8 21202002 */  addu       $a0, $s1, $zero
/* 5A1FC 800699FC 21280000 */  addu       $a1, $zero, $zero
/* 5A200 80069A00 71C9010C */  jal        G2EmulationInstanceSetMode
/* 5A204 80069A04 01000624 */   addiu     $a2, $zero, 0x1
/* 5A208 80069A08 78002296 */  lhu        $v0, 0x78($s1)
/* 5A20C 80069A0C 02006396 */  lhu        $v1, 0x2($s3)
/* 5A210 80069A10 00000000 */  nop
/* 5A214 80069A14 21104300 */  addu       $v0, $v0, $v1
/* 5A218 80069A18 780022A6 */  sh         $v0, 0x78($s1)
/* 5A21C 80069A1C 0A000386 */  lh         $v1, 0xA($s0)
/* 5A220 80069A20 07000224 */  addiu      $v0, $zero, 0x7
/* 5A224 80069A24 03006214 */  bne        $v1, $v0, .L80069A34
/* 5A228 80069A28 00040224 */   addiu     $v0, $zero, 0x400
/* 5A22C 80069A2C 8EA60108 */  j          .L80069A38
/* 5A230 80069A30 020062A6 */   sh        $v0, 0x2($s3)
.L80069A34:
/* 5A234 80069A34 020060A6 */  sh         $zero, 0x2($s3)
.L80069A38:
/* 5A238 80069A38 1400228E */  lw         $v0, 0x14($s1)
/* 5A23C 80069A3C 00000000 */  nop
/* 5A240 80069A40 08004234 */  ori        $v0, $v0, 0x8
/* 5A244 80069A44 C9A60108 */  j          .L80069B24
/* 5A248 80069A48 140022AE */   sw        $v0, 0x14($s1)
.L80069A4C:
/* 5A24C 80069A4C 0F000392 */  lbu        $v1, 0xF($s0)
/* 5A250 80069A50 FF000224 */  addiu      $v0, $zero, 0xFF
/* 5A254 80069A54 33006210 */  beq        $v1, $v0, .L80069B24
/* 5A258 80069A58 21280000 */   addu      $a1, $zero, $zero
/* 5A25C 80069A5C 21306000 */  addu       $a2, $v1, $zero
/* 5A260 80069A60 2138A000 */  addu       $a3, $a1, $zero
/* 5A264 80069A64 39C9010C */  jal        G2EmulationInstanceSetAnimation
/* 5A268 80069A68 1000A0AF */   sw        $zero, 0x10($sp)
/* 5A26C 80069A6C 21202002 */  addu       $a0, $s1, $zero
/* 5A270 80069A70 21280000 */  addu       $a1, $zero, $zero
/* 5A274 80069A74 71C9010C */  jal        G2EmulationInstanceSetMode
/* 5A278 80069A78 01000624 */   addiu     $a2, $zero, 0x1
/* 5A27C 80069A7C 04004296 */  lhu        $v0, 0x4($s2)
/* 5A280 80069A80 00000000 */  nop
/* 5A284 80069A84 02004234 */  ori        $v0, $v0, 0x2
/* 5A288 80069A88 C9A60108 */  j          .L80069B24
/* 5A28C 80069A8C 040042A6 */   sh        $v0, 0x4($s2)
.L80069A90:
/* 5A290 80069A90 02006230 */  andi       $v0, $v1, 0x2
/* 5A294 80069A94 17004010 */  beqz       $v0, .L80069AF4
/* 5A298 80069A98 21202002 */   addu      $a0, $s1, $zero
/* 5A29C 80069A9C 21280000 */  addu       $a1, $zero, $zero
/* 5A2A0 80069AA0 05006234 */  ori        $v0, $v1, 0x5
/* 5A2A4 80069AA4 040042A6 */  sh         $v0, 0x4($s2)
/* 5A2A8 80069AA8 0C000692 */  lbu        $a2, 0xC($s0)
/* 5A2AC 80069AAC 2138A000 */  addu       $a3, $a1, $zero
/* 5A2B0 80069AB0 39C9010C */  jal        G2EmulationInstanceSetAnimation
/* 5A2B4 80069AB4 1000A0AF */   sw        $zero, 0x10($sp)
/* 5A2B8 80069AB8 0A000386 */  lh         $v1, 0xA($s0)
/* 5A2BC 80069ABC 07000224 */  addiu      $v0, $zero, 0x7
/* 5A2C0 80069AC0 03006214 */  bne        $v1, $v0, .L80069AD0
/* 5A2C4 80069AC4 00040224 */   addiu     $v0, $zero, 0x400
/* 5A2C8 80069AC8 B5A60108 */  j          .L80069AD4
/* 5A2CC 80069ACC 020062A6 */   sh        $v0, 0x2($s3)
.L80069AD0:
/* 5A2D0 80069AD0 020060A6 */  sh         $zero, 0x2($s3)
.L80069AD4:
/* 5A2D4 80069AD4 78002296 */  lhu        $v0, 0x78($s1)
/* 5A2D8 80069AD8 02006496 */  lhu        $a0, 0x2($s3)
/* 5A2DC 80069ADC 1400238E */  lw         $v1, 0x14($s1)
/* 5A2E0 80069AE0 21104400 */  addu       $v0, $v0, $a0
/* 5A2E4 80069AE4 08006334 */  ori        $v1, $v1, 0x8
/* 5A2E8 80069AE8 780022A6 */  sh         $v0, 0x78($s1)
/* 5A2EC 80069AEC C5A60108 */  j          .L80069B14
/* 5A2F0 80069AF0 140023AE */   sw        $v1, 0x14($s1)
.L80069AF4:
/* 5A2F4 80069AF4 0E000392 */  lbu        $v1, 0xE($s0)
/* 5A2F8 80069AF8 FF000224 */  addiu      $v0, $zero, 0xFF
/* 5A2FC 80069AFC 05006210 */  beq        $v1, $v0, .L80069B14
/* 5A300 80069B00 21280000 */   addu      $a1, $zero, $zero
/* 5A304 80069B04 21306000 */  addu       $a2, $v1, $zero
/* 5A308 80069B08 2138A000 */  addu       $a3, $a1, $zero
/* 5A30C 80069B0C 39C9010C */  jal        G2EmulationInstanceSetAnimation
/* 5A310 80069B10 1000A0AF */   sw        $zero, 0x10($sp)
.L80069B14:
/* 5A314 80069B14 21202002 */  addu       $a0, $s1, $zero
/* 5A318 80069B18 21280000 */  addu       $a1, $zero, $zero
/* 5A31C 80069B1C 71C9010C */  jal        G2EmulationInstanceSetMode
/* 5A320 80069B20 01000624 */   addiu     $a2, $zero, 0x1
.L80069B24:
/* 5A324 80069B24 21100000 */  addu       $v0, $zero, $zero
.L80069B28:
/* 5A328 80069B28 2800BF8F */  lw         $ra, 0x28($sp)
/* 5A32C 80069B2C 2400B38F */  lw         $s3, 0x24($sp)
/* 5A330 80069B30 2000B28F */  lw         $s2, 0x20($sp)
/* 5A334 80069B34 1C00B18F */  lw         $s1, 0x1C($sp)
/* 5A338 80069B38 1800B08F */  lw         $s0, 0x18($sp)
/* 5A33C 80069B3C 0800E003 */  jr         $ra
/* 5A340 80069B40 3000BD27 */   addiu     $sp, $sp, 0x30
.size SwitchPhysOb, . - SwitchPhysOb
