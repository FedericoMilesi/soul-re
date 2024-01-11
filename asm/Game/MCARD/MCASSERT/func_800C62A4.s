.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C62A4
/* B6AA4 800C62A4 0D80023C */  lui        $v0, %hi(_spu_RXX)
/* B6AA8 800C62A8 5CED428C */  lw         $v0, %lo(_spu_RXX)($v0)
/* B6AAC 800C62AC 0D80033C */  lui        $v1, %hi(_spu_tsa)
/* B6AB0 800C62B0 74ED6394 */  lhu        $v1, %lo(_spu_tsa)($v1)
/* B6AB4 800C62B4 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* B6AB8 800C62B8 1400B1AF */  sw         $s1, 0x14($sp)
/* B6ABC 800C62BC 2188A000 */  addu       $s1, $a1, $zero
/* B6AC0 800C62C0 2000BFAF */  sw         $ra, 0x20($sp)
/* B6AC4 800C62C4 1C00B3AF */  sw         $s3, 0x1C($sp)
/* B6AC8 800C62C8 1800B2AF */  sw         $s2, 0x18($sp)
/* B6ACC 800C62CC 1000B0AF */  sw         $s0, 0x10($sp)
/* B6AD0 800C62D0 AE014594 */  lhu        $a1, 0x1AE($v0)
/* B6AD4 800C62D4 21908000 */  addu       $s2, $a0, $zero
/* B6AD8 800C62D8 A60143A4 */  sh         $v1, 0x1A6($v0)
/* B6ADC 800C62DC 861A030C */  jal        func_800C6A18
/* B6AE0 800C62E0 FF07B330 */   andi      $s3, $a1, 0x7FF
/* B6AE4 800C62E4 39002012 */  beqz       $s1, .L800C63CC
/* B6AE8 800C62E8 4100222E */   sltiu     $v0, $s1, 0x41
.L800C62EC:
/* B6AEC 800C62EC 02004010 */  beqz       $v0, .L800C62F8
/* B6AF0 800C62F0 40001024 */   addiu     $s0, $zero, 0x40
/* B6AF4 800C62F4 21802002 */  addu       $s0, $s1, $zero
.L800C62F8:
/* B6AF8 800C62F8 0A00001A */  blez       $s0, .L800C6324
/* B6AFC 800C62FC 21180000 */   addu      $v1, $zero, $zero
/* B6B00 800C6300 0D80043C */  lui        $a0, %hi(_spu_RXX)
/* B6B04 800C6304 5CED848C */  lw         $a0, %lo(_spu_RXX)($a0)
.L800C6308:
/* B6B08 800C6308 00004296 */  lhu        $v0, 0x0($s2)
/* B6B0C 800C630C 02005226 */  addiu      $s2, $s2, 0x2
/* B6B10 800C6310 02006324 */  addiu      $v1, $v1, 0x2
/* B6B14 800C6314 A80182A4 */  sh         $v0, 0x1A8($a0)
/* B6B18 800C6318 2A107000 */  slt        $v0, $v1, $s0
/* B6B1C 800C631C FAFF4014 */  bnez       $v0, .L800C6308
/* B6B20 800C6320 00000000 */   nop
.L800C6324:
/* B6B24 800C6324 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B6B28 800C6328 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B6B2C 800C632C 00000000 */  nop
/* B6B30 800C6330 AA016494 */  lhu        $a0, 0x1AA($v1)
/* B6B34 800C6334 00000000 */  nop
/* B6B38 800C6338 CFFF8230 */  andi       $v0, $a0, 0xFFCF
/* B6B3C 800C633C 10004234 */  ori        $v0, $v0, 0x10
/* B6B40 800C6340 861A030C */  jal        func_800C6A18
/* B6B44 800C6344 AA0162A4 */   sh        $v0, 0x1AA($v1)
/* B6B48 800C6348 0D80023C */  lui        $v0, %hi(_spu_RXX)
/* B6B4C 800C634C 5CED428C */  lw         $v0, %lo(_spu_RXX)($v0)
/* B6B50 800C6350 00000000 */  nop
/* B6B54 800C6354 AE014294 */  lhu        $v0, 0x1AE($v0)
/* B6B58 800C6358 00000000 */  nop
/* B6B5C 800C635C 00044230 */  andi       $v0, $v0, 0x400
/* B6B60 800C6360 14004010 */  beqz       $v0, .L800C63B4
/* B6B64 800C6364 21180000 */   addu      $v1, $zero, $zero
/* B6B68 800C6368 01006324 */  addiu      $v1, $v1, 0x1
.L800C636C:
/* B6B6C 800C636C 010F622C */  sltiu      $v0, $v1, 0xF01
/* B6B70 800C6370 08004014 */  bnez       $v0, .L800C6394
/* B6B74 800C6374 00000000 */   nop
/* B6B78 800C6378 0180043C */  lui        $a0, %hi(D_80012D04)
/* B6B7C 800C637C 042D8424 */  addiu      $a0, $a0, %lo(D_80012D04)
/* B6B80 800C6380 0180053C */  lui        $a1, %hi(D_80012D24)
/* B6B84 800C6384 06D1010C */  jal        printf
/* B6B88 800C6388 242DA524 */   addiu     $a1, $a1, %lo(D_80012D24)
/* B6B8C 800C638C ED180308 */  j          .L800C63B4
/* B6B90 800C6390 00000000 */   nop
.L800C6394:
/* B6B94 800C6394 0D80023C */  lui        $v0, %hi(_spu_RXX)
/* B6B98 800C6398 5CED428C */  lw         $v0, %lo(_spu_RXX)($v0)
/* B6B9C 800C639C 00000000 */  nop
/* B6BA0 800C63A0 AE014294 */  lhu        $v0, 0x1AE($v0)
/* B6BA4 800C63A4 00000000 */  nop
/* B6BA8 800C63A8 00044230 */  andi       $v0, $v0, 0x400
/* B6BAC 800C63AC EFFF4014 */  bnez       $v0, .L800C636C
/* B6BB0 800C63B0 01006324 */   addiu     $v1, $v1, 0x1
.L800C63B4:
/* B6BB4 800C63B4 861A030C */  jal        func_800C6A18
/* B6BB8 800C63B8 23883002 */   subu      $s1, $s1, $s0
/* B6BBC 800C63BC 861A030C */  jal        func_800C6A18
/* B6BC0 800C63C0 00000000 */   nop
/* B6BC4 800C63C4 C9FF2016 */  bnez       $s1, .L800C62EC
/* B6BC8 800C63C8 4100222E */   sltiu     $v0, $s1, 0x41
.L800C63CC:
/* B6BCC 800C63CC 0D80023C */  lui        $v0, %hi(_spu_RXX)
/* B6BD0 800C63D0 5CED428C */  lw         $v0, %lo(_spu_RXX)($v0)
/* B6BD4 800C63D4 00000000 */  nop
/* B6BD8 800C63D8 AA014494 */  lhu        $a0, 0x1AA($v0)
/* B6BDC 800C63DC FFFF6532 */  andi       $a1, $s3, 0xFFFF
/* B6BE0 800C63E0 CFFF8330 */  andi       $v1, $a0, 0xFFCF
/* B6BE4 800C63E4 AA0143A4 */  sh         $v1, 0x1AA($v0)
/* B6BE8 800C63E8 AE014294 */  lhu        $v0, 0x1AE($v0)
/* B6BEC 800C63EC 00000000 */  nop
/* B6BF0 800C63F0 FF074230 */  andi       $v0, $v0, 0x7FF
/* B6BF4 800C63F4 14004510 */  beq        $v0, $a1, .L800C6448
/* B6BF8 800C63F8 21180000 */   addu      $v1, $zero, $zero
/* B6BFC 800C63FC 01006324 */  addiu      $v1, $v1, 0x1
.L800C6400:
/* B6C00 800C6400 010F622C */  sltiu      $v0, $v1, 0xF01
/* B6C04 800C6404 08004014 */  bnez       $v0, .L800C6428
/* B6C08 800C6408 00000000 */   nop
/* B6C0C 800C640C 0180043C */  lui        $a0, %hi(D_80012D04)
/* B6C10 800C6410 042D8424 */  addiu      $a0, $a0, %lo(D_80012D04)
/* B6C14 800C6414 0180053C */  lui        $a1, %hi(D_80012D38)
/* B6C18 800C6418 06D1010C */  jal        printf
/* B6C1C 800C641C 382DA524 */   addiu     $a1, $a1, %lo(D_80012D38)
/* B6C20 800C6420 12190308 */  j          .L800C6448
/* B6C24 800C6424 00000000 */   nop
.L800C6428:
/* B6C28 800C6428 0D80023C */  lui        $v0, %hi(_spu_RXX)
/* B6C2C 800C642C 5CED428C */  lw         $v0, %lo(_spu_RXX)($v0)
/* B6C30 800C6430 00000000 */  nop
/* B6C34 800C6434 AE014294 */  lhu        $v0, 0x1AE($v0)
/* B6C38 800C6438 00000000 */  nop
/* B6C3C 800C643C FF074230 */  andi       $v0, $v0, 0x7FF
/* B6C40 800C6440 EFFF4514 */  bne        $v0, $a1, .L800C6400
/* B6C44 800C6444 01006324 */   addiu     $v1, $v1, 0x1
.L800C6448:
/* B6C48 800C6448 2000BF8F */  lw         $ra, 0x20($sp)
/* B6C4C 800C644C 1C00B38F */  lw         $s3, 0x1C($sp)
/* B6C50 800C6450 1800B28F */  lw         $s2, 0x18($sp)
/* B6C54 800C6454 1400B18F */  lw         $s1, 0x14($sp)
/* B6C58 800C6458 1000B08F */  lw         $s0, 0x10($sp)
/* B6C5C 800C645C 0800E003 */  jr         $ra
/* B6C60 800C6460 2800BD27 */   addiu     $sp, $sp, 0x28
.size func_800C62A4, . - func_800C62A4
