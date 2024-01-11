.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel G2Anim_GetRootMotionFromTimeForDuration
/* 83AB0 800932B0 18FFBD27 */  addiu      $sp, $sp, -0xE8
/* 83AB4 800932B4 21408000 */  addu       $t0, $a0, $zero
/* 83AB8 800932B8 E000B6AF */  sw         $s6, 0xE0($sp)
/* 83ABC 800932BC 21B0C000 */  addu       $s6, $a2, $zero
/* 83AC0 800932C0 DC00B5AF */  sw         $s5, 0xDC($sp)
/* 83AC4 800932C4 21A8E000 */  addu       $s5, $a3, $zero
/* 83AC8 800932C8 CC00B1AF */  sw         $s1, 0xCC($sp)
/* 83ACC 800932CC 2188A000 */  addu       $s1, $a1, $zero
/* 83AD0 800932D0 D000B2AF */  sw         $s2, 0xD0($sp)
/* 83AD4 800932D4 24001225 */  addiu      $s2, $t0, 0x24
/* 83AD8 800932D8 E400BFAF */  sw         $ra, 0xE4($sp)
/* 83ADC 800932DC D800B4AF */  sw         $s4, 0xD8($sp)
/* 83AE0 800932E0 D400B3AF */  sw         $s3, 0xD4($sp)
/* 83AE4 800932E4 C800B0AF */  sw         $s0, 0xC8($sp)
/* 83AE8 800932E8 2C00448E */  lw         $a0, 0x2C($s2)
/* 83AEC 800932EC 00000000 */  nop
/* 83AF0 800932F0 3E008010 */  beqz       $a0, .L800933EC
/* 83AF4 800932F4 2198C002 */   addu      $s3, $s6, $zero
/* 83AF8 800932F8 0800908C */  lw         $s0, 0x8($a0)
/* 83AFC 800932FC 00000000 */  nop
/* 83B00 80093300 3A000012 */  beqz       $s0, .L800933EC
/* 83B04 80093304 00140500 */   sll       $v0, $a1, 16
/* 83B08 80093308 00008384 */  lh         $v1, 0x0($a0)
/* 83B0C 8009330C 03110200 */  sra        $v0, $v0, 4
/* 83B10 80093310 1A004300 */  div        $zero, $v0, $v1
/* 83B14 80093314 12280000 */  mflo       $a1
/* 83B18 80093318 0400848C */  lw         $a0, 0x4($a0)
/* 83B1C 8009331C 9B53020C */  jal        _G2AnimAlphaTable_GetValue
/* 83B20 80093320 00000000 */   nop
/* 83B24 80093324 21284000 */  addu       $a1, $v0, $zero
/* 83B28 80093328 20000226 */  addiu      $v0, $s0, 0x20
/* 83B2C 8009332C 26000326 */  addiu      $v1, $s0, 0x26
/* 83B30 80093330 00004C94 */  lhu        $t4, 0x0($v0)
/* 83B34 80093334 02004D94 */  lhu        $t5, 0x2($v0)
/* 83B38 80093338 04004E94 */  lhu        $t6, 0x4($v0)
/* 83B3C 8009333C 00C88C48 */  mtc2       $t4, $25 # handwritten instruction
/* 83B40 80093340 00D08D48 */  mtc2       $t5, $26 # handwritten instruction
/* 83B44 80093344 00D88E48 */  mtc2       $t6, $27 # handwritten instruction
/* 83B48 80093348 00006C94 */  lhu        $t4, 0x0($v1)
/* 83B4C 8009334C 02006D94 */  lhu        $t5, 0x2($v1)
/* 83B50 80093350 04006E94 */  lhu        $t6, 0x4($v1)
/* 83B54 80093354 00488C48 */  mtc2       $t4, $9 # handwritten instruction
/* 83B58 80093358 00508D48 */  mtc2       $t5, $10 # handwritten instruction
/* 83B5C 8009335C 00588E48 */  mtc2       $t6, $11 # handwritten instruction
/* 83B60 80093360 00408548 */  mtc2       $a1, $8 # handwritten instruction
/* 83B64 80093364 00000000 */  nop
/* 83B68 80093368 00000000 */  nop
/* 83B6C 8009336C 3E00A84B */  GPL        1
/* 83B70 80093370 00C80C48 */  mfc2       $t4, $25 # handwritten instruction
/* 83B74 80093374 00D00D48 */  mfc2       $t5, $26 # handwritten instruction
/* 83B78 80093378 00D80E48 */  mfc2       $t6, $27 # handwritten instruction
/* 83B7C 8009337C 0000ACA6 */  sh         $t4, 0x0($s5)
/* 83B80 80093380 0200ADA6 */  sh         $t5, 0x2($s5)
/* 83B84 80093384 0400AEA6 */  sh         $t6, 0x4($s5)
/* 83B88 80093388 2400548E */  lw         $s4, 0x24($s2)
/* 83B8C 8009338C 00141600 */  sll        $v0, $s6, 16
/* 83B90 80093390 06008386 */  lh         $v1, 0x6($s4)
/* 83B94 80093394 03110200 */  sra        $v0, $v0, 4
/* 83B98 80093398 1A004300 */  div        $zero, $v0, $v1
/* 83B9C 8009339C 12280000 */  mflo       $a1
/* 83BA0 800933A0 0000A286 */  lh         $v0, 0x0($s5)
/* 83BA4 800933A4 00000000 */  nop
/* 83BA8 800933A8 18004500 */  mult       $v0, $a1
/* 83BAC 800933AC 12400000 */  mflo       $t0
/* 83BB0 800933B0 0200A286 */  lh         $v0, 0x2($s5)
/* 83BB4 800933B4 00000000 */  nop
/* 83BB8 800933B8 18004500 */  mult       $v0, $a1
/* 83BBC 800933BC 12180000 */  mflo       $v1
/* 83BC0 800933C0 0400A286 */  lh         $v0, 0x4($s5)
/* 83BC4 800933C4 00000000 */  nop
/* 83BC8 800933C8 18004500 */  mult       $v0, $a1
/* 83BCC 800933CC 03130800 */  sra        $v0, $t0, 12
/* 83BD0 800933D0 0000A2A6 */  sh         $v0, 0x0($s5)
/* 83BD4 800933D4 03130300 */  sra        $v0, $v1, 12
/* 83BD8 800933D8 0200A2A6 */  sh         $v0, 0x2($s5)
/* 83BDC 800933DC 12200000 */  mflo       $a0
/* 83BE0 800933E0 03130400 */  sra        $v0, $a0, 12
/* 83BE4 800933E4 584D0208 */  j          .L80093560
/* 83BE8 800933E8 0400A2A6 */   sh        $v0, 0x4($s5)
.L800933EC:
/* 83BEC 800933EC 2400548E */  lw         $s4, 0x24($s2)
/* 83BF0 800933F0 00141100 */  sll        $v0, $s1, 16
/* 83BF4 800933F4 06008586 */  lh         $a1, 0x6($s4)
/* 83BF8 800933F8 03140200 */  sra        $v0, $v0, 16
/* 83BFC 800933FC 1A004500 */  div        $zero, $v0, $a1
/* 83C00 80093400 12100000 */  mflo       $v0
/* 83C04 80093404 06009096 */  lhu        $s0, 0x6($s4)
/* 83C08 80093408 01004224 */  addiu      $v0, $v0, 0x1
/* 83C0C 8009340C 18000202 */  mult       $s0, $v0
/* 83C10 80093410 01000424 */  addiu      $a0, $zero, 0x1
/* 83C14 80093414 04008396 */  lhu        $v1, 0x4($s4)
/* 83C18 80093418 1000A4A3 */  sb         $a0, 0x10($sp)
/* 83C1C 8009341C 12900000 */  mflo       $s2
/* 83C20 80093420 1000068D */  lw         $a2, 0x10($t0)
/* 83C24 80093424 FFFF6324 */  addiu      $v1, $v1, -0x1
/* 83C28 80093428 1800A300 */  mult       $a1, $v1
/* 83C2C 8009342C 3500A0A3 */  sb         $zero, 0x35($sp)
/* 83C30 80093430 3600A0A3 */  sb         $zero, 0x36($sp)
/* 83C34 80093434 3700A4A3 */  sb         $a0, 0x37($sp)
/* 83C38 80093438 5800B4AF */  sw         $s4, 0x58($sp)
/* 83C3C 8009343C 5C00A0AF */  sw         $zero, 0x5C($sp)
/* 83C40 80093440 2000A6AF */  sw         $a2, 0x20($sp)
/* 83C44 80093444 23101000 */  negu       $v0, $s0
/* 83C48 80093448 3A00A2A7 */  sh         $v0, 0x3A($sp)
/* 83C4C 8009344C 00141300 */  sll        $v0, $s3, 16
/* 83C50 80093450 0000A0AE */  sw         $zero, 0x0($s5)
/* 83C54 80093454 12180000 */  mflo       $v1
/* 83C58 80093458 3E004010 */  beqz       $v0, .L80093554
/* 83C5C 8009345C 0400A0A6 */   sh        $zero, 0x4($s5)
/* 83C60 80093460 00140300 */  sll        $v0, $v1, 16
/* 83C64 80093464 03B40200 */  sra        $s6, $v0, 16
.L80093468:
/* 83C68 80093468 00141100 */  sll        $v0, $s1, 16
/* 83C6C 8009346C 03140200 */  sra        $v0, $v0, 16
/* 83C70 80093470 2A105600 */  slt        $v0, $v0, $s6
/* 83C74 80093474 02004014 */  bnez       $v0, .L80093480
/* 83C78 80093478 00000000 */   nop
/* 83C7C 8009347C 01009092 */  lbu        $s0, 0x1($s4)
.L80093480:
/* 83C80 80093480 3800B1A7 */  sh         $s1, 0x38($sp)
/* 83C84 80093484 3400A427 */  addiu      $a0, $sp, 0x34
/* 83C88 80093488 0453020C */  jal        _G2AnimSection_UpdateStoredFrameFromData
/* 83C8C 8009348C 1000A527 */   addiu     $a1, $sp, 0x10
/* 83C90 80093490 23185102 */  subu       $v1, $s2, $s1
/* 83C94 80093494 21206000 */  addu       $a0, $v1, $zero
/* 83C98 80093498 001C0300 */  sll        $v1, $v1, 16
/* 83C9C 8009349C 00141300 */  sll        $v0, $s3, 16
/* 83CA0 800934A0 2A104300 */  slt        $v0, $v0, $v1
/* 83CA4 800934A4 03004010 */  beqz       $v0, .L800934B4
/* 83CA8 800934A8 00140400 */   sll       $v0, $a0, 16
/* 83CAC 800934AC 21206002 */  addu       $a0, $s3, $zero
/* 83CB0 800934B0 00140400 */  sll        $v0, $a0, 16
.L800934B4:
/* 83CB4 800934B4 031C0200 */  sra        $v1, $v0, 16
/* 83CB8 800934B8 00141000 */  sll        $v0, $s0, 16
/* 83CBC 800934BC 032C0200 */  sra        $a1, $v0, 16
/* 83CC0 800934C0 2A106500 */  slt        $v0, $v1, $a1
/* 83CC4 800934C4 05004010 */  beqz       $v0, .L800934DC
/* 83CC8 800934C8 00130300 */   sll       $v0, $v1, 12
/* 83CCC 800934CC 1A004500 */  div        $zero, $v0, $a1
/* 83CD0 800934D0 12280000 */  mflo       $a1
/* 83CD4 800934D4 384D0208 */  j          .L800934E0
/* 83CD8 800934D8 00000000 */   nop
.L800934DC:
/* 83CDC 800934DC 00100524 */  addiu      $a1, $zero, 0x1000
.L800934E0:
/* 83CE0 800934E0 0000AC96 */  lhu        $t4, 0x0($s5)
/* 83CE4 800934E4 0200AD96 */  lhu        $t5, 0x2($s5)
/* 83CE8 800934E8 0400AE96 */  lhu        $t6, 0x4($s5)
/* 83CEC 800934EC 00C88C48 */  mtc2       $t4, $25 # handwritten instruction
/* 83CF0 800934F0 00D08D48 */  mtc2       $t5, $26 # handwritten instruction
/* 83CF4 800934F4 00D88E48 */  mtc2       $t6, $27 # handwritten instruction
/* 83CF8 800934F8 08EE8927 */  addiu      $t1, $gp, %gp_rel(_segValues + 0x10)
/* 83CFC 800934FC 00002C95 */  lhu        $t4, 0x0($t1)
/* 83D00 80093500 02002D95 */  lhu        $t5, 0x2($t1)
/* 83D04 80093504 04002E95 */  lhu        $t6, 0x4($t1)
/* 83D08 80093508 00488C48 */  mtc2       $t4, $9 # handwritten instruction
/* 83D0C 8009350C 00508D48 */  mtc2       $t5, $10 # handwritten instruction
/* 83D10 80093510 00588E48 */  mtc2       $t6, $11 # handwritten instruction
/* 83D14 80093514 00408548 */  mtc2       $a1, $8 # handwritten instruction
/* 83D18 80093518 00000000 */  nop
/* 83D1C 8009351C 00000000 */  nop
/* 83D20 80093520 3E00A84B */  GPL        1
/* 83D24 80093524 00C80C48 */  mfc2       $t4, $25 # handwritten instruction
/* 83D28 80093528 00D00D48 */  mfc2       $t5, $26 # handwritten instruction
/* 83D2C 8009352C 00D80E48 */  mfc2       $t6, $27 # handwritten instruction
/* 83D30 80093530 0000ACA6 */  sh         $t4, 0x0($s5)
/* 83D34 80093534 0200ADA6 */  sh         $t5, 0x2($s5)
/* 83D38 80093538 0400AEA6 */  sh         $t6, 0x4($s5)
/* 83D3C 8009353C 21884002 */  addu       $s1, $s2, $zero
/* 83D40 80093540 23106402 */  subu       $v0, $s3, $a0
/* 83D44 80093544 21984000 */  addu       $s3, $v0, $zero
/* 83D48 80093548 00140200 */  sll        $v0, $v0, 16
/* 83D4C 8009354C C6FF4014 */  bnez       $v0, .L80093468
/* 83D50 80093550 21905002 */   addu      $s2, $s2, $s0
.L80093554:
/* 83D54 80093554 5C00A48F */  lw         $a0, 0x5C($sp)
/* 83D58 80093558 8B53020C */  jal        _G2Anim_FreeChanStatusBlockList
/* 83D5C 8009355C 00000000 */   nop
.L80093560:
/* 83D60 80093560 E400BF8F */  lw         $ra, 0xE4($sp)
/* 83D64 80093564 E000B68F */  lw         $s6, 0xE0($sp)
/* 83D68 80093568 DC00B58F */  lw         $s5, 0xDC($sp)
/* 83D6C 8009356C D800B48F */  lw         $s4, 0xD8($sp)
/* 83D70 80093570 D400B38F */  lw         $s3, 0xD4($sp)
/* 83D74 80093574 D000B28F */  lw         $s2, 0xD0($sp)
/* 83D78 80093578 CC00B18F */  lw         $s1, 0xCC($sp)
/* 83D7C 8009357C C800B08F */  lw         $s0, 0xC8($sp)
/* 83D80 80093580 0800E003 */  jr         $ra
/* 83D84 80093584 E800BD27 */   addiu     $sp, $sp, 0xE8
.size G2Anim_GetRootMotionFromTimeForDuration, . - G2Anim_GetRootMotionFromTimeForDuration
