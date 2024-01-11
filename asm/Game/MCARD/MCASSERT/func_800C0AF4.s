.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C0AF4
/* B12F4 800C0AF4 1C008014 */  bnez       $a0, .L800C0B68
/* B12F8 800C0AF8 00000000 */   nop
/* B12FC 800C0AFC 0D80043C */  lui        $a0, %hi(CD_read_dma_mode + 0x36C)
/* B1300 800C0B00 ACE7848C */  lw         $a0, %lo(CD_read_dma_mode + 0x36C)($a0)
/* B1304 800C0B04 00000000 */  nop
/* B1308 800C0B08 17008014 */  bnez       $a0, .L800C0B68
/* B130C 800C0B0C 21100000 */   addu      $v0, $zero, $zero
/* B1310 800C0B10 00030308 */  j          .L800C0C00
/* B1314 800C0B14 00000000 */   nop
.L800C0B18:
/* B1318 800C0B18 2130A000 */  addu       $a2, $a1, $zero
/* B131C 800C0B1C 0000C280 */  lb         $v0, 0x0($a2)
/* B1320 800C0B20 0000C390 */  lbu        $v1, 0x0($a2)
/* B1324 800C0B24 0E004010 */  beqz       $v0, .L800C0B60
/* B1328 800C0B28 21480000 */   addu      $t1, $zero, $zero
/* B132C 800C0B2C 00160700 */  sll        $v0, $a3, 24
/* B1330 800C0B30 03460200 */  sra        $t0, $v0, 24
/* B1334 800C0B34 00160300 */  sll        $v0, $v1, 24
.L800C0B38:
/* B1338 800C0B38 03160200 */  sra        $v0, $v0, 24
/* B133C 800C0B3C 03004814 */  bne        $v0, $t0, .L800C0B4C
/* B1340 800C0B40 00000000 */   nop
/* B1344 800C0B44 D8020308 */  j          .L800C0B60
/* B1348 800C0B48 01000924 */   addiu     $t1, $zero, 0x1
.L800C0B4C:
/* B134C 800C0B4C 0100C624 */  addiu      $a2, $a2, 0x1
/* B1350 800C0B50 0000C280 */  lb         $v0, 0x0($a2)
/* B1354 800C0B54 0000C390 */  lbu        $v1, 0x0($a2)
/* B1358 800C0B58 F7FF4014 */  bnez       $v0, .L800C0B38
/* B135C 800C0B5C 00160300 */   sll       $v0, $v1, 24
.L800C0B60:
/* B1360 800C0B60 06002011 */  beqz       $t1, .L800C0B7C
/* B1364 800C0B64 00000000 */   nop
.L800C0B68:
/* B1368 800C0B68 00008790 */  lbu        $a3, 0x0($a0)
/* B136C 800C0B6C 00008280 */  lb         $v0, 0x0($a0)
/* B1370 800C0B70 00000000 */  nop
/* B1374 800C0B74 E8FF4014 */  bnez       $v0, .L800C0B18
/* B1378 800C0B78 01008424 */   addiu     $a0, $a0, 0x1
.L800C0B7C:
/* B137C 800C0B7C 1800E014 */  bnez       $a3, .L800C0BE0
/* B1380 800C0B80 FFFF8824 */   addiu     $t0, $a0, -0x1
/* B1384 800C0B84 0D80013C */  lui        $at, %hi(CD_read_dma_mode + 0x36C)
/* B1388 800C0B88 ACE720AC */  sw         $zero, %lo(CD_read_dma_mode + 0x36C)($at)
/* B138C 800C0B8C 00030308 */  j          .L800C0C00
/* B1390 800C0B90 21100000 */   addu      $v0, $zero, $zero
.L800C0B94:
/* B1394 800C0B94 FFFF80A0 */  sb         $zero, -0x1($a0)
/* B1398 800C0B98 0D80013C */  lui        $at, %hi(CD_read_dma_mode + 0x36C)
/* B139C 800C0B9C ACE724AC */  sw         $a0, %lo(CD_read_dma_mode + 0x36C)($at)
/* B13A0 800C0BA0 00030308 */  j          .L800C0C00
/* B13A4 800C0BA4 21100001 */   addu      $v0, $t0, $zero
.L800C0BA8:
/* B13A8 800C0BA8 2130A000 */  addu       $a2, $a1, $zero
/* B13AC 800C0BAC 0000C280 */  lb         $v0, 0x0($a2)
/* B13B0 800C0BB0 0000C390 */  lbu        $v1, 0x0($a2)
/* B13B4 800C0BB4 0A004010 */  beqz       $v0, .L800C0BE0
/* B13B8 800C0BB8 00160700 */   sll       $v0, $a3, 24
/* B13BC 800C0BBC 033E0200 */  sra        $a3, $v0, 24
/* B13C0 800C0BC0 00160300 */  sll        $v0, $v1, 24
.L800C0BC4:
/* B13C4 800C0BC4 03160200 */  sra        $v0, $v0, 24
/* B13C8 800C0BC8 F2FF4710 */  beq        $v0, $a3, .L800C0B94
/* B13CC 800C0BCC 0100C624 */   addiu     $a2, $a2, 0x1
/* B13D0 800C0BD0 0000C280 */  lb         $v0, 0x0($a2)
/* B13D4 800C0BD4 0000C390 */  lbu        $v1, 0x0($a2)
/* B13D8 800C0BD8 FAFF4014 */  bnez       $v0, .L800C0BC4
/* B13DC 800C0BDC 00160300 */   sll       $v0, $v1, 24
.L800C0BE0:
/* B13E0 800C0BE0 00008790 */  lbu        $a3, 0x0($a0)
/* B13E4 800C0BE4 00008280 */  lb         $v0, 0x0($a0)
/* B13E8 800C0BE8 00000000 */  nop
/* B13EC 800C0BEC EEFF4014 */  bnez       $v0, .L800C0BA8
/* B13F0 800C0BF0 01008424 */   addiu     $a0, $a0, 0x1
/* B13F4 800C0BF4 0D80013C */  lui        $at, %hi(CD_read_dma_mode + 0x36C)
/* B13F8 800C0BF8 ACE720AC */  sw         $zero, %lo(CD_read_dma_mode + 0x36C)($at)
/* B13FC 800C0BFC 21100001 */  addu       $v0, $t0, $zero
.L800C0C00:
/* B1400 800C0C00 0800E003 */  jr         $ra
/* B1404 800C0C04 00000000 */   nop
/* B1408 800C0C08 00000000 */  nop
/* B140C 800C0C0C 00000000 */  nop
/* B1410 800C0C10 00000000 */  nop
.size func_800C0AF4, . - func_800C0AF4
