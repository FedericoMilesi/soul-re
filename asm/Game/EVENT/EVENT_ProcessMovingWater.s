.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_ProcessMovingWater
/* 51ACC 800612CC 68A4828F */  lw         $v0, %gp_rel(WaterInUse)($gp)
/* 51AD0 800612D0 00000000 */  nop
/* 51AD4 800612D4 44004010 */  beqz       $v0, .L800613E8
/* 51AD8 800612D8 21400000 */   addu      $t0, $zero, $zero
/* 51ADC 800612DC 60CB8627 */  addiu      $a2, $gp, %gp_rel(WaterLevelArray)
/* 51AE0 800612E0 05000724 */  addiu      $a3, $zero, 0x5
/* 51AE4 800612E4 74CB8527 */  addiu      $a1, $gp, %gp_rel(WaterLevelArray + 0x14)
.L800612E8:
/* 51AE8 800612E8 0000C28C */  lw         $v0, 0x0($a2)
/* 51AEC 800612EC 00000000 */  nop
/* 51AF0 800612F0 01004230 */  andi       $v0, $v0, 0x1
/* 51AF4 800612F4 38004010 */  beqz       $v0, .L800613D8
/* 51AF8 800612F8 00000000 */   nop
/* 51AFC 800612FC 0400A28C */  lw         $v0, 0x4($a1)
/* 51B00 80061300 08C0838F */  lw         $v1, %gp_rel(gameTrackerX + 0x240)($gp)
/* 51B04 80061304 0000A48C */  lw         $a0, 0x0($a1)
/* 51B08 80061308 21104300 */  addu       $v0, $v0, $v1
/* 51B0C 8006130C 0400A2AC */  sw         $v0, 0x4($a1)
/* 51B10 80061310 2A108200 */  slt        $v0, $a0, $v0
/* 51B14 80061314 02004010 */  beqz       $v0, .L80061320
/* 51B18 80061318 01000824 */   addiu     $t0, $zero, 0x1
/* 51B1C 8006131C 0400A4AC */  sw         $a0, 0x4($a1)
.L80061320:
/* 51B20 80061320 FEFFA384 */  lh         $v1, -0x2($a1)
/* 51B24 80061324 FCFFA484 */  lh         $a0, -0x4($a1)
/* 51B28 80061328 0400A28C */  lw         $v0, 0x4($a1)
/* 51B2C 8006132C 23186400 */  subu       $v1, $v1, $a0
/* 51B30 80061330 03130200 */  sra        $v0, $v0, 12
/* 51B34 80061334 18006200 */  mult       $v1, $v0
/* 51B38 80061338 0000A28C */  lw         $v0, 0x0($a1)
/* 51B3C 8006133C 12180000 */  mflo       $v1
/* 51B40 80061340 03130200 */  sra        $v0, $v0, 12
/* 51B44 80061344 00000000 */  nop
/* 51B48 80061348 1A006200 */  div        $zero, $v1, $v0
/* 51B4C 8006134C 12200000 */  mflo       $a0
/* 51B50 80061350 FAFFA294 */  lhu        $v0, -0x6($a1)
/* 51B54 80061354 F0FFA38C */  lw         $v1, -0x10($a1)
/* 51B58 80061358 21104400 */  addu       $v0, $v0, $a0
/* 51B5C 8006135C 100062A4 */  sh         $v0, 0x10($v1)
/* 51B60 80061360 FCFFA294 */  lhu        $v0, -0x4($a1)
/* 51B64 80061364 F0FFA38C */  lw         $v1, -0x10($a1)
/* 51B68 80061368 21104400 */  addu       $v0, $v0, $a0
/* 51B6C 8006136C 180062A4 */  sh         $v0, 0x18($v1)
/* 51B70 80061370 0000C28C */  lw         $v0, 0x0($a2)
/* 51B74 80061374 00000000 */  nop
/* 51B78 80061378 02004230 */  andi       $v0, $v0, 0x2
/* 51B7C 8006137C 10004010 */  beqz       $v0, .L800613C0
/* 51B80 80061380 00000000 */   nop
/* 51B84 80061384 F4FFA38C */  lw         $v1, -0xC($a1)
/* 51B88 80061388 F8FFA284 */  lh         $v0, -0x8($a1)
/* 51B8C 8006138C 0800638C */  lw         $v1, 0x8($v1)
/* 51B90 80061390 21104400 */  addu       $v0, $v0, $a0
/* 51B94 80061394 380062AC */  sw         $v0, 0x38($v1)
/* 51B98 80061398 F4FFA28C */  lw         $v0, -0xC($a1)
/* 51B9C 8006139C 00000000 */  nop
/* 51BA0 800613A0 0800428C */  lw         $v0, 0x8($v0)
/* 51BA4 800613A4 00000000 */  nop
/* 51BA8 800613A8 0000438C */  lw         $v1, 0x0($v0)
/* 51BAC 800613AC 00000000 */  nop
/* 51BB0 800613B0 00006294 */  lhu        $v0, 0x0($v1)
/* 51BB4 800613B4 00000000 */  nop
/* 51BB8 800613B8 01004234 */  ori        $v0, $v0, 0x1
/* 51BBC 800613BC 000062A4 */  sh         $v0, 0x0($v1)
.L800613C0:
/* 51BC0 800613C0 0400A38C */  lw         $v1, 0x4($a1)
/* 51BC4 800613C4 0000A28C */  lw         $v0, 0x0($a1)
/* 51BC8 800613C8 00000000 */  nop
/* 51BCC 800613CC 02006214 */  bne        $v1, $v0, .L800613D8
/* 51BD0 800613D0 00000000 */   nop
/* 51BD4 800613D4 0000C0AC */  sw         $zero, 0x0($a2)
.L800613D8:
/* 51BD8 800613D8 FFFFE724 */  addiu      $a3, $a3, -0x1
/* 51BDC 800613DC 1C00A524 */  addiu      $a1, $a1, 0x1C
/* 51BE0 800613E0 C1FFE01C */  bgtz       $a3, .L800612E8
/* 51BE4 800613E4 1C00C624 */   addiu     $a2, $a2, 0x1C
.L800613E8:
/* 51BE8 800613E8 02000015 */  bnez       $t0, .L800613F4
/* 51BEC 800613EC 00000000 */   nop
/* 51BF0 800613F0 68A480AF */  sw         $zero, %gp_rel(WaterInUse)($gp)
.L800613F4:
/* 51BF4 800613F4 0800E003 */  jr         $ra
/* 51BF8 800613F8 00000000 */   nop
.size EVENT_ProcessMovingWater, . - EVENT_ProcessMovingWater
