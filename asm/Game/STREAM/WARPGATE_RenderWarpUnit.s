.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WARPGATE_RenderWarpUnit
/* 501AC 8005F9AC 98FFBD27 */  addiu      $sp, $sp, -0x68
/* 501B0 8005F9B0 6000BEAF */  sw         $fp, 0x60($sp)
/* 501B4 8005F9B4 21F08000 */  addu       $fp, $a0, $zero
/* 501B8 8005F9B8 4000B0AF */  sw         $s0, 0x40($sp)
/* 501BC 8005F9BC 2180A000 */  addu       $s0, $a1, $zero
/* 501C0 8005F9C0 5000B4AF */  sw         $s4, 0x50($sp)
/* 501C4 8005F9C4 21A0C000 */  addu       $s4, $a2, $zero
/* 501C8 8005F9C8 4800B2AF */  sw         $s2, 0x48($sp)
/* 501CC 8005F9CC 8CBE828F */  lw         $v0, %gp_rel(gameTrackerX + 0xC4)($gp)
/* 501D0 8005F9D0 0001033C */  lui        $v1, (0x1000000 >> 16)
/* 501D4 8005F9D4 6400BFAF */  sw         $ra, 0x64($sp)
/* 501D8 8005F9D8 5C00B7AF */  sw         $s7, 0x5C($sp)
/* 501DC 8005F9DC 5800B6AF */  sw         $s6, 0x58($sp)
/* 501E0 8005F9E0 5400B5AF */  sw         $s5, 0x54($sp)
/* 501E4 8005F9E4 4C00B3AF */  sw         $s3, 0x4C($sp)
/* 501E8 8005F9E8 4400B1AF */  sw         $s1, 0x44($sp)
/* 501EC 8005F9EC 2800118E */  lw         $s1, 0x28($s0)
/* 501F0 8005F9F0 24104300 */  and        $v0, $v0, $v1
/* 501F4 8005F9F4 05004010 */  beqz       $v0, .L8005FA0C
/* 501F8 8005F9F8 2190E000 */   addu      $s2, $a3, $zero
/* 501FC 8005F9FC 0D80043C */  lui        $a0, %hi(WarpRoomArray + 0x2C4)
/* 50200 8005FA00 5C198424 */  addiu      $a0, $a0, %lo(WarpRoomArray + 0x2C4)
/* 50204 8005FA04 C3B5000C */  jal        FONT_Print
/* 50208 8005FA08 0C002526 */   addiu     $a1, $s1, 0xC
.L8005FA0C:
/* 5020C 8005FA0C 06002296 */  lhu        $v0, 0x6($s1)
/* 50210 8005FA10 00000000 */  nop
/* 50214 8005FA14 08004230 */  andi       $v0, $v0, 0x8
/* 50218 8005FA18 03004010 */  beqz       $v0, .L8005FA28
/* 5021C 8005FA1C 21208002 */   addu      $a0, $s4, $zero
/* 50220 8005FA20 8B7E0108 */  j          .L8005FA2C
/* 50224 8005FA24 01000524 */   addiu     $a1, $zero, 0x1
.L8005FA28:
/* 50228 8005FA28 21280000 */  addu       $a1, $zero, $zero
.L8005FA2C:
/* 5022C 8005FA2C 357D010C */  jal        WARPGATE_BlockWarpGateEntrance
/* 50230 8005FA30 00000000 */   nop
/* 50234 8005FA34 21202002 */  addu       $a0, $s1, $zero
/* 50238 8005FA38 517D010C */  jal        WARPGATE_DrawWarpGateRim
/* 5023C 8005FA3C 01000524 */   addiu     $a1, $zero, 0x1
/* 50240 8005FA40 0800248E */  lw         $a0, 0x8($s1)
/* 50244 8005FA44 B841010C */  jal        MEMPACK_MemoryValidFunc
/* 50248 8005FA48 00000000 */   nop
/* 5024C 8005FA4C C1004010 */  beqz       $v0, .L8005FD54
/* 50250 8005FA50 00000000 */   nop
/* 50254 8005FA54 08BE838F */  lw         $v1, %gp_rel(gameTrackerX + 0x40)($gp)
/* 50258 8005FA58 00000000 */  nop
/* 5025C 8005FA5C 0800628C */  lw         $v0, 0x8($v1)
/* 50260 8005FA60 0400738C */  lw         $s3, 0x4($v1)
/* 50264 8005FA64 00D04224 */  addiu      $v0, $v0, -0x3000
/* 50268 8005FA68 2B106202 */  sltu       $v0, $s3, $v0
/* 5026C 8005FA6C B9004010 */  beqz       $v0, .L8005FD54
/* 50270 8005FA70 21206002 */   addu      $a0, $s3, $zero
/* 50274 8005FA74 000C0524 */  addiu      $a1, $zero, 0xC00
/* 50278 8005FA78 00306226 */  addiu      $v0, $s3, 0x3000
/* 5027C 8005FA7C DAE9020C */  jal        func_800BA768
/* 50280 8005FA80 040062AC */   sw        $v0, 0x4($v1)
/* 50284 8005FA84 00002296 */  lhu        $v0, 0x0($s1)
/* 50288 8005FA88 21200002 */  addu       $a0, $s0, $zero
/* 5028C 8005FA8C 280091AC */  sw         $s1, 0x28($a0)
/* 50290 8005FA90 0800868E */  lw         $a2, 0x8($s4)
/* 50294 8005FA94 4CBA82A7 */  sh         $v0, %gp_rel(D_800D2FE4)($gp)
/* 50298 8005FA98 EE7B010C */  jal        GetFogColor
/* 5029C 8005FA9C 21288002 */   addu      $a1, $s4, $zero
/* 502A0 8005FAA0 21204002 */  addu       $a0, $s2, $zero
/* 502A4 8005FAA4 FF0B0624 */  addiu      $a2, $zero, 0xBFF
/* 502A8 8005FAA8 21386002 */  addu       $a3, $s3, $zero
/* 502AC 8005FAAC 08BE858F */  lw         $a1, %gp_rel(gameTrackerX + 0x40)($gp)
/* 502B0 8005FAB0 21804000 */  addu       $s0, $v0, $zero
/* 502B4 8005FAB4 B77C010C */  jal        DrawFogRectangle
/* 502B8 8005FAB8 1000B0AF */   sw        $s0, 0x10($sp)
/* 502BC 8005FABC CDFD020C */  jal        func_800BF734
/* 502C0 8005FAC0 0002163C */   lui       $s6, (0x2000000 >> 16)
/* 502C4 8005FAC4 21202002 */  addu       $a0, $s1, $zero
/* 502C8 8005FAC8 21306002 */  addu       $a2, $s3, $zero
/* 502CC 8005FACC 0800858E */  lw         $a1, 0x8($s4)
/* 502D0 8005FAD0 57BC000C */  jal        StreamRenderLevel
/* 502D4 8005FAD4 21380002 */   addu      $a3, $s0, $zero
/* 502D8 8005FAD8 F6FD020C */  jal        func_800BF7D8
/* 502DC 8005FADC FF00143C */   lui       $s4, (0xFFFFFF >> 16)
/* 502E0 8005FAE0 08BE838F */  lw         $v1, %gp_rel(gameTrackerX + 0x40)($gp)
/* 502E4 8005FAE4 00000000 */  nop
/* 502E8 8005FAE8 0400708C */  lw         $s0, 0x4($v1)
/* 502EC 8005FAEC 3800B527 */  addiu      $s5, $sp, 0x38
/* 502F0 8005FAF0 0C000226 */  addiu      $v0, $s0, 0xC
/* 502F4 8005FAF4 040062AC */  sw         $v0, 0x4($v1)
/* 502F8 8005FAF8 F8BD838F */  lw         $v1, %gp_rel(gameTrackerX + 0x30)($gp)
/* 502FC 8005FAFC 88BC9727 */  addiu      $s7, $gp, %gp_rel(draw)
/* 50300 8005FB00 03004A8A */  lwl        $t2, 0x3($s2)
/* 50304 8005FB04 00004A9A */  lwr        $t2, 0x0($s2)
/* 50308 8005FB08 07004B8A */  lwl        $t3, 0x7($s2)
/* 5030C 8005FB0C 04004B9A */  lwr        $t3, 0x4($s2)
/* 50310 8005FB10 3B00AAAB */  swl        $t2, 0x3B($sp)
/* 50314 8005FB14 3800AABB */  swr        $t2, 0x38($sp)
/* 50318 8005FB18 3F00ABAB */  swl        $t3, 0x3F($sp)
/* 5031C 8005FB1C 3C00ABBB */  swr        $t3, 0x3C($sp)
/* 50320 8005FB20 40100300 */  sll        $v0, $v1, 1
/* 50324 8005FB24 21104300 */  addu       $v0, $v0, $v1
/* 50328 8005FB28 C0100200 */  sll        $v0, $v0, 3
/* 5032C 8005FB2C 23104300 */  subu       $v0, $v0, $v1
/* 50330 8005FB30 80100200 */  sll        $v0, $v0, 2
/* 50334 8005FB34 21105700 */  addu       $v0, $v0, $s7
/* 50338 8005FB38 3800A397 */  lhu        $v1, 0x38($sp)
/* 5033C 8005FB3C 08004494 */  lhu        $a0, 0x8($v0)
/* 50340 8005FB40 2128A002 */  addu       $a1, $s5, $zero
/* 50344 8005FB44 21186400 */  addu       $v1, $v1, $a0
/* 50348 8005FB48 3800A3A7 */  sh         $v1, 0x38($sp)
/* 5034C 8005FB4C 3A00A397 */  lhu        $v1, 0x3A($sp)
/* 50350 8005FB50 0A004294 */  lhu        $v0, 0xA($v0)
/* 50354 8005FB54 21200002 */  addu       $a0, $s0, $zero
/* 50358 8005FB58 21186200 */  addu       $v1, $v1, $v0
/* 5035C 8005FB5C A6EB020C */  jal        func_800BAE98
/* 50360 8005FB60 3A00A3A7 */   sh        $v1, 0x3A($sp)
/* 50364 8005FB64 FFFF9436 */  ori        $s4, $s4, (0xFFFFFF & 0xFFFF)
/* 50368 8005FB68 F82F628E */  lw         $v0, 0x2FF8($s3)
/* 5036C 8005FB6C 00000000 */  nop
/* 50370 8005FB70 24105400 */  and        $v0, $v0, $s4
/* 50374 8005FB74 25105600 */  or         $v0, $v0, $s6
/* 50378 8005FB78 000002AE */  sw         $v0, 0x0($s0)
/* 5037C 8005FB7C 24101402 */  and        $v0, $s0, $s4
/* 50380 8005FB80 F82F62AE */  sw         $v0, 0x2FF8($s3)
/* 50384 8005FB84 06002296 */  lhu        $v0, 0x6($s1)
/* 50388 8005FB88 00000000 */  nop
/* 5038C 8005FB8C 08004230 */  andi       $v0, $v0, 0x8
/* 50390 8005FB90 4A004014 */  bnez       $v0, .L8005FCBC
/* 50394 8005FB94 32001024 */   addiu     $s0, $zero, 0x32
/* 50398 8005FB98 04007126 */  addiu      $s1, $s3, 0x4
/* 5039C 8005FB9C 00004486 */  lh         $a0, 0x0($s2)
/* 503A0 8005FBA0 00004696 */  lhu        $a2, 0x0($s2)
/* 503A4 8005FBA4 02004586 */  lh         $a1, 0x2($s2)
/* 503A8 8005FBA8 04004296 */  lhu        $v0, 0x4($s2)
/* 503AC 8005FBAC 08BE888F */  lw         $t0, %gp_rel(gameTrackerX + 0x40)($gp)
/* 503B0 8005FBB0 2130C200 */  addu       $a2, $a2, $v0
/* 503B4 8005FBB4 00340600 */  sll        $a2, $a2, 16
/* 503B8 8005FBB8 1000A4AF */  sw         $a0, 0x10($sp)
/* 503BC 8005FBBC 02004296 */  lhu        $v0, 0x2($s2)
/* 503C0 8005FBC0 06004396 */  lhu        $v1, 0x6($s2)
/* 503C4 8005FBC4 03340600 */  sra        $a2, $a2, 16
/* 503C8 8005FBC8 21104300 */  addu       $v0, $v0, $v1
/* 503CC 8005FBCC 00140200 */  sll        $v0, $v0, 16
/* 503D0 8005FBD0 03140200 */  sra        $v0, $v0, 16
/* 503D4 8005FBD4 1400A2AF */  sw         $v0, 0x14($sp)
/* 503D8 8005FBD8 00004296 */  lhu        $v0, 0x0($s2)
/* 503DC 8005FBDC 04004396 */  lhu        $v1, 0x4($s2)
/* 503E0 8005FBE0 2138A000 */  addu       $a3, $a1, $zero
/* 503E4 8005FBE4 21104300 */  addu       $v0, $v0, $v1
/* 503E8 8005FBE8 00140200 */  sll        $v0, $v0, 16
/* 503EC 8005FBEC 03140200 */  sra        $v0, $v0, 16
/* 503F0 8005FBF0 1800A2AF */  sw         $v0, 0x18($sp)
/* 503F4 8005FBF4 02004396 */  lhu        $v1, 0x2($s2)
/* 503F8 8005FBF8 06004996 */  lhu        $t1, 0x6($s2)
/* 503FC 8005FBFC 01000224 */  addiu      $v0, $zero, 0x1
/* 50400 8005FC00 2000B0AF */  sw         $s0, 0x20($sp)
/* 50404 8005FC04 2400B0AF */  sw         $s0, 0x24($sp)
/* 50408 8005FC08 2800B0AF */  sw         $s0, 0x28($sp)
/* 5040C 8005FC0C 2C00A2AF */  sw         $v0, 0x2C($sp)
/* 50410 8005FC10 3000A8AF */  sw         $t0, 0x30($sp)
/* 50414 8005FC14 3400B1AF */  sw         $s1, 0x34($sp)
/* 50418 8005FC18 21186900 */  addu       $v1, $v1, $t1
/* 5041C 8005FC1C 001C0300 */  sll        $v1, $v1, 16
/* 50420 8005FC20 031C0300 */  sra        $v1, $v1, 16
/* 50424 8005FC24 2FAB000C */  jal        DRAW_TranslucentQuad
/* 50428 8005FC28 1C00A3AF */   sw        $v1, 0x1C($sp)
/* 5042C 8005FC2C 00004696 */  lhu        $a2, 0x0($s2)
/* 50430 8005FC30 00004486 */  lh         $a0, 0x0($s2)
/* 50434 8005FC34 02004586 */  lh         $a1, 0x2($s2)
/* 50438 8005FC38 04004796 */  lhu        $a3, 0x4($s2)
/* 5043C 8005FC3C 08BE888F */  lw         $t0, %gp_rel(gameTrackerX + 0x40)($gp)
/* 50440 8005FC40 2130C700 */  addu       $a2, $a2, $a3
/* 50444 8005FC44 00340600 */  sll        $a2, $a2, 16
/* 50448 8005FC48 1000A4AF */  sw         $a0, 0x10($sp)
/* 5044C 8005FC4C 02004296 */  lhu        $v0, 0x2($s2)
/* 50450 8005FC50 06004396 */  lhu        $v1, 0x6($s2)
/* 50454 8005FC54 03340600 */  sra        $a2, $a2, 16
/* 50458 8005FC58 21104300 */  addu       $v0, $v0, $v1
/* 5045C 8005FC5C 00140200 */  sll        $v0, $v0, 16
/* 50460 8005FC60 03140200 */  sra        $v0, $v0, 16
/* 50464 8005FC64 1400A2AF */  sw         $v0, 0x14($sp)
/* 50468 8005FC68 00004296 */  lhu        $v0, 0x0($s2)
/* 5046C 8005FC6C 04004396 */  lhu        $v1, 0x4($s2)
/* 50470 8005FC70 2138A000 */  addu       $a3, $a1, $zero
/* 50474 8005FC74 21104300 */  addu       $v0, $v0, $v1
/* 50478 8005FC78 00140200 */  sll        $v0, $v0, 16
/* 5047C 8005FC7C 03140200 */  sra        $v0, $v0, 16
/* 50480 8005FC80 1800A2AF */  sw         $v0, 0x18($sp)
/* 50484 8005FC84 02004396 */  lhu        $v1, 0x2($s2)
/* 50488 8005FC88 06004996 */  lhu        $t1, 0x6($s2)
/* 5048C 8005FC8C 02000224 */  addiu      $v0, $zero, 0x2
/* 50490 8005FC90 2000B0AF */  sw         $s0, 0x20($sp)
/* 50494 8005FC94 2400B0AF */  sw         $s0, 0x24($sp)
/* 50498 8005FC98 2800B0AF */  sw         $s0, 0x28($sp)
/* 5049C 8005FC9C 2C00A2AF */  sw         $v0, 0x2C($sp)
/* 504A0 8005FCA0 3000A8AF */  sw         $t0, 0x30($sp)
/* 504A4 8005FCA4 3400B1AF */  sw         $s1, 0x34($sp)
/* 504A8 8005FCA8 21186900 */  addu       $v1, $v1, $t1
/* 504AC 8005FCAC 001C0300 */  sll        $v1, $v1, 16
/* 504B0 8005FCB0 031C0300 */  sra        $v1, $v1, 16
/* 504B4 8005FCB4 2FAB000C */  jal        DRAW_TranslucentQuad
/* 504B8 8005FCB8 1C00A3AF */   sw        $v1, 0x1C($sp)
.L8005FCBC:
/* 504BC 8005FCBC 08BE838F */  lw         $v1, %gp_rel(gameTrackerX + 0x40)($gp)
/* 504C0 8005FCC0 00000000 */  nop
/* 504C4 8005FCC4 0400708C */  lw         $s0, 0x4($v1)
/* 504C8 8005FCC8 00000000 */  nop
/* 504CC 8005FCCC 0C000226 */  addiu      $v0, $s0, 0xC
/* 504D0 8005FCD0 040062AC */  sw         $v0, 0x4($v1)
/* 504D4 8005FCD4 F8BD838F */  lw         $v1, %gp_rel(gameTrackerX + 0x30)($gp)
/* 504D8 8005FCD8 2128A002 */  addu       $a1, $s5, $zero
/* 504DC 8005FCDC 40100300 */  sll        $v0, $v1, 1
/* 504E0 8005FCE0 21104300 */  addu       $v0, $v0, $v1
/* 504E4 8005FCE4 C0100200 */  sll        $v0, $v0, 3
/* 504E8 8005FCE8 23104300 */  subu       $v0, $v0, $v1
/* 504EC 8005FCEC 80100200 */  sll        $v0, $v0, 2
/* 504F0 8005FCF0 21105700 */  addu       $v0, $v0, $s7
/* 504F4 8005FCF4 08004394 */  lhu        $v1, 0x8($v0)
/* 504F8 8005FCF8 21200002 */  addu       $a0, $s0, $zero
/* 504FC 8005FCFC 3800A3A7 */  sh         $v1, 0x38($sp)
/* 50500 8005FD00 0A004394 */  lhu        $v1, 0xA($v0)
/* 50504 8005FD04 00020224 */  addiu      $v0, $zero, 0x200
/* 50508 8005FD08 3C00A2A7 */  sh         $v0, 0x3C($sp)
/* 5050C 8005FD0C F0000224 */  addiu      $v0, $zero, 0xF0
/* 50510 8005FD10 3E00A2A7 */  sh         $v0, 0x3E($sp)
/* 50514 8005FD14 A6EB020C */  jal        func_800BAE98
/* 50518 8005FD18 3A00A3A7 */   sh        $v1, 0x3A($sp)
/* 5051C 8005FD1C 0400628E */  lw         $v0, 0x4($s3)
/* 50520 8005FD20 00000000 */  nop
/* 50524 8005FD24 24105400 */  and        $v0, $v0, $s4
/* 50528 8005FD28 25105600 */  or         $v0, $v0, $s6
/* 5052C 8005FD2C 000002AE */  sw         $v0, 0x0($s0)
/* 50530 8005FD30 14C7828F */  lw         $v0, %gp_rel(s_zval)($gp)
/* 50534 8005FD34 24181402 */  and        $v1, $s0, $s4
/* 50538 8005FD38 040063AE */  sw         $v1, 0x4($s3)
/* 5053C 8005FD3C FC2F638E */  lw         $v1, 0x2FFC($s3)
/* 50540 8005FD40 80100200 */  sll        $v0, $v0, 2
/* 50544 8005FD44 21105E00 */  addu       $v0, $v0, $fp
/* 50548 8005FD48 0000448C */  lw         $a0, 0x0($v0)
/* 5054C 8005FD4C 000043AC */  sw         $v1, 0x0($v0)
/* 50550 8005FD50 000064AE */  sw         $a0, 0x0($s3)
.L8005FD54:
/* 50554 8005FD54 6400BF8F */  lw         $ra, 0x64($sp)
/* 50558 8005FD58 6000BE8F */  lw         $fp, 0x60($sp)
/* 5055C 8005FD5C 5C00B78F */  lw         $s7, 0x5C($sp)
/* 50560 8005FD60 5800B68F */  lw         $s6, 0x58($sp)
/* 50564 8005FD64 5400B58F */  lw         $s5, 0x54($sp)
/* 50568 8005FD68 5000B48F */  lw         $s4, 0x50($sp)
/* 5056C 8005FD6C 4C00B38F */  lw         $s3, 0x4C($sp)
/* 50570 8005FD70 4800B28F */  lw         $s2, 0x48($sp)
/* 50574 8005FD74 4400B18F */  lw         $s1, 0x44($sp)
/* 50578 8005FD78 4000B08F */  lw         $s0, 0x40($sp)
/* 5057C 8005FD7C 0800E003 */  jr         $ra
/* 50580 8005FD80 6800BD27 */   addiu     $sp, $sp, 0x68
.size WARPGATE_RenderWarpUnit, . - WARPGATE_RenderWarpUnit
