.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C0C14
/* B1414 800C0C14 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* B1418 800C0C18 0E80023C */  lui        $v0, %hi(StFinalSector)
/* B141C 800C0C1C 28FD428C */  lw         $v0, %lo(StFinalSector)($v0)
/* B1420 800C0C20 01000424 */  addiu      $a0, $zero, 0x1
/* B1424 800C0C24 3E024410 */  beq        $v0, $a0, .L800C1520
/* B1428 800C0C28 3800BFAF */   sw        $ra, 0x38($sp)
/* B142C 800C0C2C 0E80023C */  lui        $v0, %hi(StRgb24)
/* B1430 800C0C30 14FD428C */  lw         $v0, %lo(StRgb24)($v0)
/* B1434 800C0C34 00000000 */  nop
/* B1438 800C0C38 17004010 */  beqz       $v0, .L800C0C98
/* B143C 800C0C3C 00000000 */   nop
/* B1440 800C0C40 0D80023C */  lui        $v0, %hi(CD_read_dma_mode + 0x39C)
/* B1444 800C0C44 DCE7428C */  lw         $v0, %lo(CD_read_dma_mode + 0x39C)($v0)
/* B1448 800C0C48 00000000 */  nop
/* B144C 800C0C4C 0000428C */  lw         $v0, 0x0($v0)
/* B1450 800C0C50 0001033C */  lui        $v1, (0x1000000 >> 16)
/* B1454 800C0C54 24104300 */  and        $v0, $v0, $v1
/* B1458 800C0C58 0F004010 */  beqz       $v0, .L800C0C98
/* B145C 800C0C5C 00000000 */   nop
/* B1460 800C0C60 0E80023C */  lui        $v0, %hi(StEmu_Addr)
/* B1464 800C0C64 04FD428C */  lw         $v0, %lo(StEmu_Addr)($v0)
/* B1468 800C0C68 0E80013C */  lui        $at, %hi(StCdIntrFlag)
/* B146C 800C0C6C 07004010 */  beqz       $v0, .L800C0C8C
/* B1470 800C0C70 04BB24AC */   sw        $a0, %lo(StCdIntrFlag)($at)
/* B1474 800C0C74 0E80023C */  lui        $v0, %hi(StEmu_Idx)
/* B1478 800C0C78 20FD428C */  lw         $v0, %lo(StEmu_Idx)($v0)
/* B147C 800C0C7C 00000000 */  nop
/* B1480 800C0C80 01004224 */  addiu      $v0, $v0, 0x1
/* B1484 800C0C84 0E80013C */  lui        $at, %hi(StEmu_Idx)
/* B1488 800C0C88 20FD22AC */  sw         $v0, %lo(StEmu_Idx)($at)
.L800C0C8C:
/* B148C 800C0C8C 0D80013C */  lui        $at, %hi(debug_cause)
/* B1490 800C0C90 48050308 */  j          .L800C1520
/* B1494 800C0C94 04E824AC */   sw        $a0, %lo(debug_cause)($at)
.L800C0C98:
/* B1498 800C0C98 3EF8020C */  jal        func_800BE0F8
/* B149C 800C0C9C 3000A527 */   addiu     $a1, $sp, 0x30
/* B14A0 800C0CA0 05000324 */  addiu      $v1, $zero, 0x5
/* B14A4 800C0CA4 1E024310 */  beq        $v0, $v1, .L800C1520
/* B14A8 800C0CA8 00000000 */   nop
/* B14AC 800C0CAC 3000A293 */  lbu        $v0, 0x30($sp)
/* B14B0 800C0CB0 3100A393 */  lbu        $v1, 0x31($sp)
/* B14B4 800C0CB4 2200A2A7 */  sh         $v0, 0x22($sp)
/* B14B8 800C0CB8 2400A3A7 */  sh         $v1, 0x24($sp)
/* B14BC 800C0CBC 2200A297 */  lhu        $v0, 0x22($sp)
/* B14C0 800C0CC0 00000000 */  nop
/* B14C4 800C0CC4 04004230 */  andi       $v0, $v0, 0x4
/* B14C8 800C0CC8 04004010 */  beqz       $v0, .L800C0CDC
/* B14CC 800C0CCC 03000224 */   addiu     $v0, $zero, 0x3
/* B14D0 800C0CD0 0D80013C */  lui        $at, %hi(debug_cause)
/* B14D4 800C0CD4 48050308 */  j          .L800C1520
/* B14D8 800C0CD8 04E822AC */   sw        $v0, %lo(debug_cause)($at)
.L800C0CDC:
/* B14DC 800C0CDC 0E80023C */  lui        $v0, %hi(StRingIdx1)
/* B14E0 800C0CE0 34FD428C */  lw         $v0, %lo(StRingIdx1)($v0)
/* B14E4 800C0CE4 0E80033C */  lui        $v1, %hi(StRingAddr)
/* B14E8 800C0CE8 30FD638C */  lw         $v1, %lo(StRingAddr)($v1)
/* B14EC 800C0CEC 40110200 */  sll        $v0, $v0, 5
/* B14F0 800C0CF0 21186200 */  addu       $v1, $v1, $v0
/* B14F4 800C0CF4 0E80013C */  lui        $at, %hi(SpuCommonError + 0x4)
/* B14F8 800C0CF8 ECFC23AC */  sw         $v1, %lo(SpuCommonError + 0x4)($at)
/* B14FC 800C0CFC 00006294 */  lhu        $v0, 0x0($v1)
/* B1500 800C0D00 00000000 */  nop
/* B1504 800C0D04 10004010 */  beqz       $v0, .L800C0D48
/* B1508 800C0D08 00000000 */   nop
/* B150C 800C0D0C 0E80023C */  lui        $v0, %hi(StEmu_Addr)
/* B1510 800C0D10 04FD428C */  lw         $v0, %lo(StEmu_Addr)($v0)
/* B1514 800C0D14 00000000 */  nop
/* B1518 800C0D18 08004010 */  beqz       $v0, .L800C0D3C
/* B151C 800C0D1C 04000224 */   addiu     $v0, $zero, 0x4
/* B1520 800C0D20 0E80023C */  lui        $v0, %hi(StEmu_Idx)
/* B1524 800C0D24 20FD428C */  lw         $v0, %lo(StEmu_Idx)($v0)
/* B1528 800C0D28 00000000 */  nop
/* B152C 800C0D2C 01004224 */  addiu      $v0, $v0, 0x1
/* B1530 800C0D30 0E80013C */  lui        $at, %hi(StEmu_Idx)
/* B1534 800C0D34 20FD22AC */  sw         $v0, %lo(StEmu_Idx)($at)
/* B1538 800C0D38 04000224 */  addiu      $v0, $zero, 0x4
.L800C0D3C:
/* B153C 800C0D3C 0D80013C */  lui        $at, %hi(debug_cause)
/* B1540 800C0D40 48050308 */  j          .L800C1520
/* B1544 800C0D44 04E822AC */   sw        $v0, %lo(debug_cause)($at)
.L800C0D48:
/* B1548 800C0D48 0D80023C */  lui        $v0, %hi(CD_read_dma_mode + 0x37C)
/* B154C 800C0D4C BCE7428C */  lw         $v0, %lo(CD_read_dma_mode + 0x37C)($v0)
/* B1550 800C0D50 00000000 */  nop
/* B1554 800C0D54 000040A0 */  sb         $zero, 0x0($v0)
/* B1558 800C0D58 0D80023C */  lui        $v0, %hi(CD_read_dma_mode + 0x388)
/* B155C 800C0D5C C8E7428C */  lw         $v0, %lo(CD_read_dma_mode + 0x388)($v0)
/* B1560 800C0D60 00000000 */  nop
/* B1564 800C0D64 000040A0 */  sb         $zero, 0x0($v0)
/* B1568 800C0D68 0D80023C */  lui        $v0, %hi(CD_read_dma_mode + 0x37C)
/* B156C 800C0D6C BCE7428C */  lw         $v0, %lo(CD_read_dma_mode + 0x37C)($v0)
/* B1570 800C0D70 0200043C */  lui        $a0, (0x20943 >> 16)
/* B1574 800C0D74 000040A0 */  sb         $zero, 0x0($v0)
/* B1578 800C0D78 0D80033C */  lui        $v1, %hi(CD_read_dma_mode + 0x388)
/* B157C 800C0D7C C8E7638C */  lw         $v1, %lo(CD_read_dma_mode + 0x388)($v1)
/* B1580 800C0D80 80000224 */  addiu      $v0, $zero, 0x80
/* B1584 800C0D84 000062A0 */  sb         $v0, 0x0($v1)
/* B1588 800C0D88 0D80023C */  lui        $v0, %hi(CD_read_dma_mode + 0x38C)
/* B158C 800C0D8C CCE7428C */  lw         $v0, %lo(CD_read_dma_mode + 0x38C)($v0)
/* B1590 800C0D90 43098434 */  ori        $a0, $a0, (0x20943 & 0xFFFF)
/* B1594 800C0D94 000044AC */  sw         $a0, 0x0($v0)
/* B1598 800C0D98 0D80033C */  lui        $v1, %hi(CD_read_dma_mode + 0x390)
/* B159C 800C0D9C D0E7638C */  lw         $v1, %lo(CD_read_dma_mode + 0x390)($v1)
/* B15A0 800C0DA0 23130224 */  addiu      $v0, $zero, 0x1323
/* B15A4 800C0DA4 000062AC */  sw         $v0, 0x0($v1)
/* B15A8 800C0DA8 0E80023C */  lui        $v0, %hi(StMode)
/* B15AC 800C0DAC B8FD428C */  lw         $v0, %lo(StMode)($v0)
/* B15B0 800C0DB0 00000000 */  nop
/* B15B4 800C0DB4 14004014 */  bnez       $v0, .L800C0E08
/* B15B8 800C0DB8 21200000 */   addu      $a0, $zero, $zero
/* B15BC 800C0DBC 2800A527 */  addiu      $a1, $sp, 0x28
.L800C0DC0:
/* B15C0 800C0DC0 0D80023C */  lui        $v0, %hi(CD_read_dma_mode + 0x384)
/* B15C4 800C0DC4 C4E7428C */  lw         $v0, %lo(CD_read_dma_mode + 0x384)($v0)
/* B15C8 800C0DC8 2118A400 */  addu       $v1, $a1, $a0
/* B15CC 800C0DCC 00004290 */  lbu        $v0, 0x0($v0)
/* B15D0 800C0DD0 01008424 */  addiu      $a0, $a0, 0x1
/* B15D4 800C0DD4 000062A0 */  sb         $v0, 0x0($v1)
/* B15D8 800C0DD8 0400822C */  sltiu      $v0, $a0, 0x4
/* B15DC 800C0DDC F8FF4014 */  bnez       $v0, .L800C0DC0
/* B15E0 800C0DE0 00000000 */   nop
/* B15E4 800C0DE4 21200000 */  addu       $a0, $zero, $zero
/* B15E8 800C0DE8 0D80033C */  lui        $v1, %hi(CD_read_dma_mode + 0x384)
/* B15EC 800C0DEC C4E7638C */  lw         $v1, %lo(CD_read_dma_mode + 0x384)($v1)
/* B15F0 800C0DF0 00000000 */  nop
.L800C0DF4:
/* B15F4 800C0DF4 00006290 */  lbu        $v0, 0x0($v1)
/* B15F8 800C0DF8 01008424 */  addiu      $a0, $a0, 0x1
/* B15FC 800C0DFC 0800822C */  sltiu      $v0, $a0, 0x8
/* B1600 800C0E00 FCFF4014 */  bnez       $v0, .L800C0DF4
/* B1604 800C0E04 00000000 */   nop
.L800C0E08:
/* B1608 800C0E08 0E80023C */  lui        $v0, %hi(StEmu_Addr)
/* B160C 800C0E0C 04FD428C */  lw         $v0, %lo(StEmu_Addr)($v0)
/* B1610 800C0E10 00000000 */  nop
/* B1614 800C0E14 0C004010 */  beqz       $v0, .L800C0E48
/* B1618 800C0E18 0011083C */   lui       $t0, (0x11000000 >> 16)
/* B161C 800C0E1C 08000624 */  addiu      $a2, $zero, 0x8
/* B1620 800C0E20 21380000 */  addu       $a3, $zero, $zero
/* B1624 800C0E24 0E80053C */  lui        $a1, %hi(StEmu_Idx)
/* B1628 800C0E28 20FDA58C */  lw         $a1, %lo(StEmu_Idx)($a1)
/* B162C 800C0E2C 0E80043C */  lui        $a0, %hi(SpuCommonError + 0x4)
/* B1630 800C0E30 ECFC848C */  lw         $a0, %lo(SpuCommonError + 0x4)($a0)
/* B1634 800C0E34 C02A0500 */  sll        $a1, $a1, 11
/* B1638 800C0E38 4C05030C */  jal        func_800C1530
/* B163C 800C0E3C 21284500 */   addu      $a1, $v0, $a1
/* B1640 800C0E40 9B030308 */  j          .L800C0E6C
/* B1644 800C0E44 00000000 */   nop
.L800C0E48:
/* B1648 800C0E48 03000424 */  addiu      $a0, $zero, 0x3
/* B164C 800C0E4C 21300000 */  addu       $a2, $zero, $zero
/* B1650 800C0E50 0E80053C */  lui        $a1, %hi(SpuCommonError + 0x4)
/* B1654 800C0E54 ECFCA58C */  lw         $a1, %lo(SpuCommonError + 0x4)($a1)
/* B1658 800C0E58 08000724 */  addiu      $a3, $zero, 0x8
/* B165C 800C0E5C 1000A8AF */  sw         $t0, 0x10($sp)
/* B1660 800C0E60 1400A0AF */  sw         $zero, 0x14($sp)
/* B1664 800C0E64 5705030C */  jal        func_800C155C
/* B1668 800C0E68 1800A0AF */   sw        $zero, 0x18($sp)
.L800C0E6C:
/* B166C 800C0E6C 0D80043C */  lui        $a0, %hi(CD_read_dma_mode + 0x3AC)
/* B1670 800C0E70 ECE7848C */  lw         $a0, %lo(CD_read_dma_mode + 0x3AC)($a0)
/* B1674 800C0E74 00000000 */  nop
/* B1678 800C0E78 0000828C */  lw         $v0, 0x0($a0)
/* B167C 800C0E7C 0001033C */  lui        $v1, (0x1000000 >> 16)
/* B1680 800C0E80 24104300 */  and        $v0, $v0, $v1
/* B1684 800C0E84 07004010 */  beqz       $v0, .L800C0EA4
/* B1688 800C0E88 21188000 */   addu      $v1, $a0, $zero
/* B168C 800C0E8C 0001043C */  lui        $a0, (0x1000000 >> 16)
.L800C0E90:
/* B1690 800C0E90 0000628C */  lw         $v0, 0x0($v1)
/* B1694 800C0E94 00000000 */  nop
/* B1698 800C0E98 24104400 */  and        $v0, $v0, $a0
/* B169C 800C0E9C FCFF4014 */  bnez       $v0, .L800C0E90
/* B16A0 800C0EA0 00000000 */   nop
.L800C0EA4:
/* B16A4 800C0EA4 0200043C */  lui        $a0, (0x20843 >> 16)
/* B16A8 800C0EA8 43088434 */  ori        $a0, $a0, (0x20843 & 0xFFFF)
/* B16AC 800C0EAC 0E80023C */  lui        $v0, %hi(SpuCommonError + 0x4)
/* B16B0 800C0EB0 ECFC428C */  lw         $v0, %lo(SpuCommonError + 0x4)($v0)
/* B16B4 800C0EB4 0D80033C */  lui        $v1, %hi(CD_read_dma_mode + 0x38C)
/* B16B8 800C0EB8 CCE7638C */  lw         $v1, %lo(CD_read_dma_mode + 0x38C)($v1)
/* B16BC 800C0EBC 2B00A58B */  lwl        $a1, 0x2B($sp)
/* B16C0 800C0EC0 2800A59B */  lwr        $a1, 0x28($sp)
/* B16C4 800C0EC4 00000000 */  nop
/* B16C8 800C0EC8 1F0045A8 */  swl        $a1, 0x1F($v0)
/* B16CC 800C0ECC 1C0045B8 */  swr        $a1, 0x1C($v0)
/* B16D0 800C0ED0 000064AC */  sw         $a0, 0x0($v1)
/* B16D4 800C0ED4 0D80033C */  lui        $v1, %hi(CD_read_dma_mode + 0x390)
/* B16D8 800C0ED8 D0E7638C */  lw         $v1, %lo(CD_read_dma_mode + 0x390)($v1)
/* B16DC 800C0EDC 25130224 */  addiu      $v0, $zero, 0x1325
/* B16E0 800C0EE0 000062AC */  sw         $v0, 0x0($v1)
/* B16E4 800C0EE4 0E80033C */  lui        $v1, %hi(StSTART_FLAG)
/* B16E8 800C0EE8 1CFD638C */  lw         $v1, %lo(StSTART_FLAG)($v1)
/* B16EC 800C0EEC 01000224 */  addiu      $v0, $zero, 0x1
/* B16F0 800C0EF0 1C006214 */  bne        $v1, $v0, .L800C0F64
/* B16F4 800C0EF4 00000000 */   nop
/* B16F8 800C0EF8 0E80043C */  lui        $a0, %hi(StStartFrame)
/* B16FC 800C0EFC 44FD848C */  lw         $a0, %lo(StStartFrame)($a0)
/* B1700 800C0F00 00000000 */  nop
/* B1704 800C0F04 17008010 */  beqz       $a0, .L800C0F64
/* B1708 800C0F08 00000000 */   nop
/* B170C 800C0F0C 0E80033C */  lui        $v1, %hi(SpuCommonError + 0x4)
/* B1710 800C0F10 ECFC638C */  lw         $v1, %lo(SpuCommonError + 0x4)($v1)
/* B1714 800C0F14 00000000 */  nop
/* B1718 800C0F18 08006294 */  lhu        $v0, 0x8($v1)
/* B171C 800C0F1C 00000000 */  nop
/* B1720 800C0F20 0E008210 */  beq        $a0, $v0, .L800C0F5C
/* B1724 800C0F24 00000000 */   nop
/* B1728 800C0F28 000060A4 */  sh         $zero, 0x0($v1)
/* B172C 800C0F2C 0E80023C */  lui        $v0, %hi(StEmu_Addr)
/* B1730 800C0F30 04FD428C */  lw         $v0, %lo(StEmu_Addr)($v0)
/* B1734 800C0F34 00000000 */  nop
/* B1738 800C0F38 79014010 */  beqz       $v0, .L800C1520
/* B173C 800C0F3C 00000000 */   nop
/* B1740 800C0F40 0E80023C */  lui        $v0, %hi(StEmu_Idx)
/* B1744 800C0F44 20FD428C */  lw         $v0, %lo(StEmu_Idx)($v0)
/* B1748 800C0F48 00000000 */  nop
/* B174C 800C0F4C 01004224 */  addiu      $v0, $v0, 0x1
/* B1750 800C0F50 0E80013C */  lui        $at, %hi(StEmu_Idx)
/* B1754 800C0F54 48050308 */  j          .L800C1520
/* B1758 800C0F58 20FD22AC */   sw        $v0, %lo(StEmu_Idx)($at)
.L800C0F5C:
/* B175C 800C0F5C 0E80013C */  lui        $at, %hi(StSTART_FLAG)
/* B1760 800C0F60 1CFD20AC */  sw         $zero, %lo(StSTART_FLAG)($at)
.L800C0F64:
/* B1764 800C0F64 0E80043C */  lui        $a0, %hi(SpuCommonError + 0x4)
/* B1768 800C0F68 ECFC848C */  lw         $a0, %lo(SpuCommonError + 0x4)($a0)
/* B176C 800C0F6C 00000000 */  nop
/* B1770 800C0F70 00008394 */  lhu        $v1, 0x0($a0)
/* B1774 800C0F74 60010224 */  addiu      $v0, $zero, 0x160
/* B1778 800C0F78 08006214 */  bne        $v1, $v0, .L800C0F9C
/* B177C 800C0F7C 00000000 */   nop
/* B1780 800C0F80 02008294 */  lhu        $v0, 0x2($a0)
/* B1784 800C0F84 0E80033C */  lui        $v1, %hi(CChannel)
/* B1788 800C0F88 08FD638C */  lw         $v1, %lo(CChannel)($v1)
/* B178C 800C0F8C 82120200 */  srl        $v0, $v0, 10
/* B1790 800C0F90 1F004230 */  andi       $v0, $v0, 0x1F
/* B1794 800C0F94 11004310 */  beq        $v0, $v1, .L800C0FDC
/* B1798 800C0F98 00000000 */   nop
.L800C0F9C:
/* B179C 800C0F9C 0E80023C */  lui        $v0, %hi(StEmu_Addr)
/* B17A0 800C0FA0 04FD428C */  lw         $v0, %lo(StEmu_Addr)($v0)
/* B17A4 800C0FA4 00000000 */  nop
/* B17A8 800C0FA8 04004010 */  beqz       $v0, .L800C0FBC
/* B17AC 800C0FAC 00000000 */   nop
/* B17B0 800C0FB0 0E80013C */  lui        $at, %hi(StEmu_Idx)
/* B17B4 800C0FB4 F0030308 */  j          .L800C0FC0
/* B17B8 800C0FB8 20FD20AC */   sw        $zero, %lo(StEmu_Idx)($at)
.L800C0FBC:
/* B17BC 800C0FBC 00008294 */  lhu        $v0, 0x0($a0)
.L800C0FC0:
/* B17C0 800C0FC0 0E80033C */  lui        $v1, %hi(SpuCommonError + 0x4)
/* B17C4 800C0FC4 ECFC638C */  lw         $v1, %lo(SpuCommonError + 0x4)($v1)
/* B17C8 800C0FC8 05000224 */  addiu      $v0, $zero, 0x5
/* B17CC 800C0FCC 0D80013C */  lui        $at, %hi(debug_cause)
/* B17D0 800C0FD0 04E822AC */  sw         $v0, %lo(debug_cause)($at)
/* B17D4 800C0FD4 48050308 */  j          .L800C1520
/* B17D8 800C0FD8 000060A4 */   sh        $zero, 0x0($v1)
.L800C0FDC:
/* B17DC 800C0FDC 0E80033C */  lui        $v1, %hi(Stsector_offset)
/* B17E0 800C0FE0 24FD6384 */  lh         $v1, %lo(Stsector_offset)($v1)
/* B17E4 800C0FE4 04008294 */  lhu        $v0, 0x4($a0)
/* B17E8 800C0FE8 00000000 */  nop
/* B17EC 800C0FEC 0A006214 */  bne        $v1, $v0, .L800C1018
/* B17F0 800C0FF0 00000000 */   nop
/* B17F4 800C0FF4 0E80033C */  lui        $v1, %hi(Stframe_no)
/* B17F8 800C0FF8 10FD638C */  lw         $v1, %lo(Stframe_no)($v1)
/* B17FC 800C0FFC 00000000 */  nop
/* B1800 800C1000 25006010 */  beqz       $v1, .L800C1098
/* B1804 800C1004 00000000 */   nop
/* B1808 800C1008 08008294 */  lhu        $v0, 0x8($a0)
/* B180C 800C100C 00000000 */  nop
/* B1810 800C1010 21006210 */  beq        $v1, $v0, .L800C1098
/* B1814 800C1014 00000000 */   nop
.L800C1018:
/* B1818 800C1018 0E80043C */  lui        $a0, %hi(StRingIdx2)
/* B181C 800C101C 38FD848C */  lw         $a0, %lo(StRingIdx2)($a0)
/* B1820 800C1020 0E80053C */  lui        $a1, %hi(StRingIdx1)
/* B1824 800C1024 34FDA58C */  lw         $a1, %lo(StRingIdx1)($a1)
/* B1828 800C1028 0E80013C */  lui        $at, %hi(Stframe_no)
/* B182C 800C102C 10FD20AC */  sw         $zero, %lo(Stframe_no)($at)
/* B1830 800C1030 0E80013C */  lui        $at, %hi(Stsector_offset)
/* B1834 800C1034 24FD20A4 */  sh         $zero, %lo(Stsector_offset)($at)
/* B1838 800C1038 361E030C */  jal        func_800C78D8
/* B183C 800C103C 2328A400 */   subu      $a1, $a1, $a0
/* B1840 800C1040 0E80023C */  lui        $v0, %hi(StRingIdx2)
/* B1844 800C1044 38FD428C */  lw         $v0, %lo(StRingIdx2)($v0)
/* B1848 800C1048 0E80033C */  lui        $v1, %hi(SpuCommonError + 0x4)
/* B184C 800C104C ECFC638C */  lw         $v1, %lo(SpuCommonError + 0x4)($v1)
/* B1850 800C1050 0E80013C */  lui        $at, %hi(StRingIdx1)
/* B1854 800C1054 34FD22AC */  sw         $v0, %lo(StRingIdx1)($at)
/* B1858 800C1058 000060A4 */  sh         $zero, 0x0($v1)
/* B185C 800C105C 0E80023C */  lui        $v0, %hi(StEmu_Addr)
/* B1860 800C1060 04FD428C */  lw         $v0, %lo(StEmu_Addr)($v0)
/* B1864 800C1064 00000000 */  nop
/* B1868 800C1068 08004010 */  beqz       $v0, .L800C108C
/* B186C 800C106C 06000224 */   addiu     $v0, $zero, 0x6
/* B1870 800C1070 0E80023C */  lui        $v0, %hi(StEmu_Idx)
/* B1874 800C1074 20FD428C */  lw         $v0, %lo(StEmu_Idx)($v0)
/* B1878 800C1078 00000000 */  nop
/* B187C 800C107C 01004224 */  addiu      $v0, $v0, 0x1
/* B1880 800C1080 0E80013C */  lui        $at, %hi(StEmu_Idx)
/* B1884 800C1084 20FD22AC */  sw         $v0, %lo(StEmu_Idx)($at)
/* B1888 800C1088 06000224 */  addiu      $v0, $zero, 0x6
.L800C108C:
/* B188C 800C108C 0D80013C */  lui        $at, %hi(debug_cause)
/* B1890 800C1090 48050308 */  j          .L800C1520
/* B1894 800C1094 04E822AC */   sw        $v0, %lo(debug_cause)($at)
.L800C1098:
/* B1898 800C1098 0E80033C */  lui        $v1, %hi(SpuCommonError + 0x4)
/* B189C 800C109C ECFC638C */  lw         $v1, %lo(SpuCommonError + 0x4)($v1)
/* B18A0 800C10A0 00000000 */  nop
/* B18A4 800C10A4 04006294 */  lhu        $v0, 0x4($v1)
/* B18A8 800C10A8 00000000 */  nop
/* B18AC 800C10AC 8D004014 */  bnez       $v0, .L800C12E4
/* B18B0 800C10B0 0A000224 */   addiu     $v0, $zero, 0xA
/* B18B4 800C10B4 08006294 */  lhu        $v0, 0x8($v1)
/* B18B8 800C10B8 0E80033C */  lui        $v1, %hi(StEndFrame)
/* B18BC 800C10BC 18FD638C */  lw         $v1, %lo(StEndFrame)($v1)
/* B18C0 800C10C0 0E80013C */  lui        $at, %hi(Stsector_offset)
/* B18C4 800C10C4 24FD20A4 */  sh         $zero, %lo(Stsector_offset)($at)
/* B18C8 800C10C8 FFFF4230 */  andi       $v0, $v0, 0xFFFF
/* B18CC 800C10CC 0E80013C */  lui        $at, %hi(Stframe_no)
/* B18D0 800C10D0 10FD22AC */  sw         $v0, %lo(Stframe_no)($at)
/* B18D4 800C10D4 2B006010 */  beqz       $v1, .L800C1184
/* B18D8 800C10D8 2B104300 */   sltu      $v0, $v0, $v1
/* B18DC 800C10DC 29004014 */  bnez       $v0, .L800C1184
/* B18E0 800C10E0 00000000 */   nop
/* B18E4 800C10E4 0E80043C */  lui        $a0, %hi(StRingIdx2)
/* B18E8 800C10E8 38FD848C */  lw         $a0, %lo(StRingIdx2)($a0)
/* B18EC 800C10EC 0E80053C */  lui        $a1, %hi(StRingIdx1)
/* B18F0 800C10F0 34FDA58C */  lw         $a1, %lo(StRingIdx1)($a1)
/* B18F4 800C10F4 0E80013C */  lui        $at, %hi(Stframe_no)
/* B18F8 800C10F8 10FD20AC */  sw         $zero, %lo(Stframe_no)($at)
/* B18FC 800C10FC 0E80013C */  lui        $at, %hi(Stsector_offset)
/* B1900 800C1100 24FD20A4 */  sh         $zero, %lo(Stsector_offset)($at)
/* B1904 800C1104 361E030C */  jal        func_800C78D8
/* B1908 800C1108 2328A400 */   subu      $a1, $a1, $a0
/* B190C 800C110C 0E80023C */  lui        $v0, %hi(StRingIdx2)
/* B1910 800C1110 38FD428C */  lw         $v0, %lo(StRingIdx2)($v0)
/* B1914 800C1114 0E80033C */  lui        $v1, %hi(SpuCommonError + 0x4)
/* B1918 800C1118 ECFC638C */  lw         $v1, %lo(SpuCommonError + 0x4)($v1)
/* B191C 800C111C 0E80013C */  lui        $at, %hi(StRingIdx1)
/* B1920 800C1120 34FD22AC */  sw         $v0, %lo(StRingIdx1)($at)
/* B1924 800C1124 000060A4 */  sh         $zero, 0x0($v1)
/* B1928 800C1128 0E80033C */  lui        $v1, %hi(StFunc2)
/* B192C 800C112C 00FD638C */  lw         $v1, %lo(StFunc2)($v1)
/* B1930 800C1130 01000224 */  addiu      $v0, $zero, 0x1
/* B1934 800C1134 0E80013C */  lui        $at, %hi(StSTART_FLAG)
/* B1938 800C1138 03006010 */  beqz       $v1, .L800C1148
/* B193C 800C113C 1CFD22AC */   sw        $v0, %lo(StSTART_FLAG)($at)
/* B1940 800C1140 09F86000 */  jalr       $v1
/* B1944 800C1144 00000000 */   nop
.L800C1148:
/* B1948 800C1148 0E80023C */  lui        $v0, %hi(StEmu_Addr)
/* B194C 800C114C 04FD428C */  lw         $v0, %lo(StEmu_Addr)($v0)
/* B1950 800C1150 00000000 */  nop
/* B1954 800C1154 08004010 */  beqz       $v0, .L800C1178
/* B1958 800C1158 07000224 */   addiu     $v0, $zero, 0x7
/* B195C 800C115C 0E80023C */  lui        $v0, %hi(StEmu_Idx)
/* B1960 800C1160 20FD428C */  lw         $v0, %lo(StEmu_Idx)($v0)
/* B1964 800C1164 00000000 */  nop
/* B1968 800C1168 01004224 */  addiu      $v0, $v0, 0x1
/* B196C 800C116C 0E80013C */  lui        $at, %hi(StEmu_Idx)
/* B1970 800C1170 20FD22AC */  sw         $v0, %lo(StEmu_Idx)($at)
/* B1974 800C1174 07000224 */  addiu      $v0, $zero, 0x7
.L800C1178:
/* B1978 800C1178 0D80013C */  lui        $at, %hi(debug_cause)
/* B197C 800C117C 48050308 */  j          .L800C1520
/* B1980 800C1180 04E822AC */   sw        $v0, %lo(debug_cause)($at)
.L800C1184:
/* B1984 800C1184 0E80023C */  lui        $v0, %hi(StRingSize)
/* B1988 800C1188 40FD428C */  lw         $v0, %lo(StRingSize)($v0)
/* B198C 800C118C 0E80033C */  lui        $v1, %hi(StRingIdx1)
/* B1990 800C1190 34FD638C */  lw         $v1, %lo(StRingIdx1)($v1)
/* B1994 800C1194 0E80043C */  lui        $a0, %hi(SpuCommonError + 0x4)
/* B1998 800C1198 ECFC848C */  lw         $a0, %lo(SpuCommonError + 0x4)($a0)
/* B199C 800C119C 23104300 */  subu       $v0, $v0, $v1
/* B19A0 800C11A0 06008394 */  lhu        $v1, 0x6($a0)
/* B19A4 800C11A4 FFFF4224 */  addiu      $v0, $v0, -0x1
/* B19A8 800C11A8 2B104300 */  sltu       $v0, $v0, $v1
/* B19AC 800C11AC 48004010 */  beqz       $v0, .L800C12D0
/* B19B0 800C11B0 00000000 */   nop
/* B19B4 800C11B4 0E80023C */  lui        $v0, %hi(StEndFrame)
/* B19B8 800C11B8 18FD428C */  lw         $v0, %lo(StEndFrame)($v0)
/* B19BC 800C11BC 00000000 */  nop
/* B19C0 800C11C0 19004014 */  bnez       $v0, .L800C1228
/* B19C4 800C11C4 01000224 */   addiu     $v0, $zero, 0x1
/* B19C8 800C11C8 000082A4 */  sh         $v0, 0x0($a0)
/* B19CC 800C11CC 0E80033C */  lui        $v1, %hi(StFunc2)
/* B19D0 800C11D0 00FD638C */  lw         $v1, %lo(StFunc2)($v1)
/* B19D4 800C11D4 01000224 */  addiu      $v0, $zero, 0x1
/* B19D8 800C11D8 0E80013C */  lui        $at, %hi(StSTART_FLAG)
/* B19DC 800C11DC 03006010 */  beqz       $v1, .L800C11EC
/* B19E0 800C11E0 1CFD22AC */   sw        $v0, %lo(StSTART_FLAG)($at)
/* B19E4 800C11E4 09F86000 */  jalr       $v1
/* B19E8 800C11E8 00000000 */   nop
.L800C11EC:
/* B19EC 800C11EC 0E80023C */  lui        $v0, %hi(StEmu_Addr)
/* B19F0 800C11F0 04FD428C */  lw         $v0, %lo(StEmu_Addr)($v0)
/* B19F4 800C11F4 00000000 */  nop
/* B19F8 800C11F8 08004010 */  beqz       $v0, .L800C121C
/* B19FC 800C11FC 08000224 */   addiu     $v0, $zero, 0x8
/* B1A00 800C1200 0E80023C */  lui        $v0, %hi(StEmu_Idx)
/* B1A04 800C1204 20FD428C */  lw         $v0, %lo(StEmu_Idx)($v0)
/* B1A08 800C1208 00000000 */  nop
/* B1A0C 800C120C 01004224 */  addiu      $v0, $v0, 0x1
/* B1A10 800C1210 0E80013C */  lui        $at, %hi(StEmu_Idx)
/* B1A14 800C1214 20FD22AC */  sw         $v0, %lo(StEmu_Idx)($at)
/* B1A18 800C1218 08000224 */  addiu      $v0, $zero, 0x8
.L800C121C:
/* B1A1C 800C121C 0D80013C */  lui        $at, %hi(debug_cause)
/* B1A20 800C1220 48050308 */  j          .L800C1520
/* B1A24 800C1224 04E822AC */   sw        $v0, %lo(debug_cause)($at)
.L800C1228:
/* B1A28 800C1228 0E80023C */  lui        $v0, %hi(StRingAddr)
/* B1A2C 800C122C 30FD428C */  lw         $v0, %lo(StRingAddr)($v0)
/* B1A30 800C1230 00000000 */  nop
/* B1A34 800C1234 00004284 */  lh         $v0, 0x0($v0)
/* B1A38 800C1238 00000000 */  nop
/* B1A3C 800C123C 11004010 */  beqz       $v0, .L800C1284
/* B1A40 800C1240 01000224 */   addiu     $v0, $zero, 0x1
/* B1A44 800C1244 000080A4 */  sh         $zero, 0x0($a0)
/* B1A48 800C1248 0E80023C */  lui        $v0, %hi(StEmu_Addr)
/* B1A4C 800C124C 04FD428C */  lw         $v0, %lo(StEmu_Addr)($v0)
/* B1A50 800C1250 00000000 */  nop
/* B1A54 800C1254 08004010 */  beqz       $v0, .L800C1278
/* B1A58 800C1258 09000224 */   addiu     $v0, $zero, 0x9
/* B1A5C 800C125C 0E80023C */  lui        $v0, %hi(StEmu_Idx)
/* B1A60 800C1260 20FD428C */  lw         $v0, %lo(StEmu_Idx)($v0)
/* B1A64 800C1264 00000000 */  nop
/* B1A68 800C1268 01004224 */  addiu      $v0, $v0, 0x1
/* B1A6C 800C126C 0E80013C */  lui        $at, %hi(StEmu_Idx)
/* B1A70 800C1270 20FD22AC */  sw         $v0, %lo(StEmu_Idx)($at)
/* B1A74 800C1274 09000224 */  addiu      $v0, $zero, 0x9
.L800C1278:
/* B1A78 800C1278 0D80013C */  lui        $at, %hi(debug_cause)
/* B1A7C 800C127C 48050308 */  j          .L800C1520
/* B1A80 800C1280 04E822AC */   sw        $v0, %lo(debug_cause)($at)
.L800C1284:
/* B1A84 800C1284 000082A4 */  sh         $v0, 0x0($a0)
/* B1A88 800C1288 0E80053C */  lui        $a1, %hi(StRingAddr)
/* B1A8C 800C128C 30FDA58C */  lw         $a1, %lo(StRingAddr)($a1)
/* B1A90 800C1290 0E80033C */  lui        $v1, %hi(SpuCommonError + 0x4)
/* B1A94 800C1294 ECFC638C */  lw         $v1, %lo(SpuCommonError + 0x4)($v1)
/* B1A98 800C1298 21200000 */  addu       $a0, $zero, $zero
/* B1A9C 800C129C 0E80013C */  lui        $at, %hi(StRingIdx1)
/* B1AA0 800C12A0 34FD20AC */  sw         $zero, %lo(StRingIdx1)($at)
.L800C12A4:
/* B1AA4 800C12A4 0000628C */  lw         $v0, 0x0($v1)
/* B1AA8 800C12A8 04006324 */  addiu      $v1, $v1, 0x4
/* B1AAC 800C12AC 01008424 */  addiu      $a0, $a0, 0x1
/* B1AB0 800C12B0 0000A2AC */  sw         $v0, 0x0($a1)
/* B1AB4 800C12B4 0800822C */  sltiu      $v0, $a0, 0x8
/* B1AB8 800C12B8 FAFF4014 */  bnez       $v0, .L800C12A4
/* B1ABC 800C12BC 0400A524 */   addiu     $a1, $a1, 0x4
/* B1AC0 800C12C0 0E80023C */  lui        $v0, %hi(StRingAddr)
/* B1AC4 800C12C4 30FD428C */  lw         $v0, %lo(StRingAddr)($v0)
/* B1AC8 800C12C8 0E80013C */  lui        $at, %hi(SpuCommonError + 0x4)
/* B1ACC 800C12CC ECFC22AC */  sw         $v0, %lo(SpuCommonError + 0x4)($at)
.L800C12D0:
/* B1AD0 800C12D0 0E80023C */  lui        $v0, %hi(StRingIdx1)
/* B1AD4 800C12D4 34FD428C */  lw         $v0, %lo(StRingIdx1)($v0)
/* B1AD8 800C12D8 0E80013C */  lui        $at, %hi(StRingIdx2)
/* B1ADC 800C12DC 38FD22AC */  sw         $v0, %lo(StRingIdx2)($at)
/* B1AE0 800C12E0 0A000224 */  addiu      $v0, $zero, 0xA
.L800C12E4:
/* B1AE4 800C12E4 0D80013C */  lui        $at, %hi(debug_cause)
/* B1AE8 800C12E8 04E822AC */  sw         $v0, %lo(debug_cause)($at)
/* B1AEC 800C12EC 0E80023C */  lui        $v0, %hi(Stsector_offset)
/* B1AF0 800C12F0 24FD4294 */  lhu        $v0, %lo(Stsector_offset)($v0)
/* B1AF4 800C12F4 0E80043C */  lui        $a0, %hi(StRingSize)
/* B1AF8 800C12F8 40FD848C */  lw         $a0, %lo(StRingSize)($a0)
/* B1AFC 800C12FC 0E80033C */  lui        $v1, %hi(StRingAddr)
/* B1B00 800C1300 30FD638C */  lw         $v1, %lo(StRingAddr)($v1)
/* B1B04 800C1304 0E80053C */  lui        $a1, %hi(StRingIdx1)
/* B1B08 800C1308 34FDA58C */  lw         $a1, %lo(StRingIdx1)($a1)
/* B1B0C 800C130C 01004224 */  addiu      $v0, $v0, 0x1
/* B1B10 800C1310 40210400 */  sll        $a0, $a0, 5
/* B1B14 800C1314 21186400 */  addu       $v1, $v1, $a0
/* B1B18 800C1318 0E80013C */  lui        $at, %hi(Stsector_offset)
/* B1B1C 800C131C 24FD22A4 */  sh         $v0, %lo(Stsector_offset)($at)
/* B1B20 800C1320 80110500 */  sll        $v0, $a1, 6
/* B1B24 800C1324 23104500 */  subu       $v0, $v0, $a1
/* B1B28 800C1328 40110200 */  sll        $v0, $v0, 5
/* B1B2C 800C132C 0E80043C */  lui        $a0, %hi(StRgb24)
/* B1B30 800C1330 14FD848C */  lw         $a0, %lo(StRgb24)($a0)
/* B1B34 800C1334 21186200 */  addu       $v1, $v1, $v0
/* B1B38 800C1338 0E80013C */  lui        $at, %hi(StRingBase)
/* B1B3C 800C133C 2CFD23AC */  sw         $v1, %lo(StRingBase)($at)
/* B1B40 800C1340 0B008010 */  beqz       $a0, .L800C1370
/* B1B44 800C1344 0011083C */   lui       $t0, (0x11000000 >> 16)
/* B1B48 800C1348 0200033C */  lui        $v1, (0x20943 >> 16)
/* B1B4C 800C134C 0D80023C */  lui        $v0, %hi(CD_read_dma_mode + 0x38C)
/* B1B50 800C1350 CCE7428C */  lw         $v0, %lo(CD_read_dma_mode + 0x38C)($v0)
/* B1B54 800C1354 43096334 */  ori        $v1, $v1, (0x20943 & 0xFFFF)
/* B1B58 800C1358 000043AC */  sw         $v1, 0x0($v0)
/* B1B5C 800C135C 0D80033C */  lui        $v1, %hi(CD_read_dma_mode + 0x390)
/* B1B60 800C1360 D0E7638C */  lw         $v1, %lo(CD_read_dma_mode + 0x390)($v1)
/* B1B64 800C1364 23130224 */  addiu      $v0, $zero, 0x1323
/* B1B68 800C1368 E3040308 */  j          .L800C138C
/* B1B6C 800C136C 000062AC */   sw        $v0, 0x0($v1)
.L800C1370:
/* B1B70 800C1370 0221033C */  lui        $v1, (0x21020843 >> 16)
/* B1B74 800C1374 43086334 */  ori        $v1, $v1, (0x21020843 & 0xFFFF)
/* B1B78 800C1378 4011083C */  lui        $t0, (0x11400100 >> 16)
/* B1B7C 800C137C 0D80023C */  lui        $v0, %hi(CD_read_dma_mode + 0x38C)
/* B1B80 800C1380 CCE7428C */  lw         $v0, %lo(CD_read_dma_mode + 0x38C)($v0)
/* B1B84 800C1384 00010835 */  ori        $t0, $t0, (0x11400100 & 0xFFFF)
/* B1B88 800C1388 000043AC */  sw         $v1, 0x0($v0)
.L800C138C:
/* B1B8C 800C138C 0E80023C */  lui        $v0, %hi(SpuCommonError + 0x4)
/* B1B90 800C1390 ECFC428C */  lw         $v0, %lo(SpuCommonError + 0x4)($v0)
/* B1B94 800C1394 00000000 */  nop
/* B1B98 800C1398 06004394 */  lhu        $v1, 0x6($v0)
/* B1B9C 800C139C 04004294 */  lhu        $v0, 0x4($v0)
/* B1BA0 800C13A0 FFFF6324 */  addiu      $v1, $v1, -0x1
/* B1BA4 800C13A4 29006214 */  bne        $v1, $v0, .L800C144C
/* B1BA8 800C13A8 01000324 */   addiu     $v1, $zero, 0x1
/* B1BAC 800C13AC 0E80023C */  lui        $v0, %hi(StEmu_Addr)
/* B1BB0 800C13B0 04FD428C */  lw         $v0, %lo(StEmu_Addr)($v0)
/* B1BB4 800C13B4 0E80013C */  lui        $at, %hi(StFinalSector)
/* B1BB8 800C13B8 28FD23AC */  sw         $v1, %lo(StFinalSector)($at)
/* B1BBC 800C13BC 11004010 */  beqz       $v0, .L800C1404
/* B1BC0 800C13C0 F8010624 */   addiu     $a2, $zero, 0x1F8
/* B1BC4 800C13C4 01000724 */  addiu      $a3, $zero, 0x1
/* B1BC8 800C13C8 0E80053C */  lui        $a1, %hi(StEmu_Idx)
/* B1BCC 800C13CC 20FDA58C */  lw         $a1, %lo(StEmu_Idx)($a1)
/* B1BD0 800C13D0 0E80043C */  lui        $a0, %hi(StRingBase)
/* B1BD4 800C13D4 2CFD848C */  lw         $a0, %lo(StRingBase)($a0)
/* B1BD8 800C13D8 C02A0500 */  sll        $a1, $a1, 11
/* B1BDC 800C13DC 21284500 */  addu       $a1, $v0, $a1
/* B1BE0 800C13E0 4C05030C */  jal        func_800C1530
/* B1BE4 800C13E4 2000A524 */   addiu     $a1, $a1, 0x20
/* B1BE8 800C13E8 0E80023C */  lui        $v0, %hi(StEmu_Idx)
/* B1BEC 800C13EC 20FD428C */  lw         $v0, %lo(StEmu_Idx)($v0)
/* B1BF0 800C13F0 00000000 */  nop
/* B1BF4 800C13F4 01004224 */  addiu      $v0, $v0, 0x1
/* B1BF8 800C13F8 0E80013C */  lui        $at, %hi(StEmu_Idx)
/* B1BFC 800C13FC 0A050308 */  j          .L800C1428
/* B1C00 800C1400 20FD22AC */   sw        $v0, %lo(StEmu_Idx)($at)
.L800C1404:
/* B1C04 800C1404 03000424 */  addiu      $a0, $zero, 0x3
/* B1C08 800C1408 21300000 */  addu       $a2, $zero, $zero
/* B1C0C 800C140C 0E80053C */  lui        $a1, %hi(StRingBase)
/* B1C10 800C1410 2CFDA58C */  lw         $a1, %lo(StRingBase)($a1)
/* B1C14 800C1414 F8010724 */  addiu      $a3, $zero, 0x1F8
/* B1C18 800C1418 1000A8AF */  sw         $t0, 0x10($sp)
/* B1C1C 800C141C 1400A3AF */  sw         $v1, 0x14($sp)
/* B1C20 800C1420 5705030C */  jal        func_800C155C
/* B1C24 800C1424 1800A0AF */   sw        $zero, 0x18($sp)
.L800C1428:
/* B1C28 800C1428 0E80023C */  lui        $v0, %hi(StCHANNEL)
/* B1C2C 800C142C 0CFD428C */  lw         $v0, %lo(StCHANNEL)($v0)
/* B1C30 800C1430 0E80013C */  lui        $at, %hi(Stsector_offset)
/* B1C34 800C1434 24FD20A4 */  sh         $zero, %lo(Stsector_offset)($at)
/* B1C38 800C1438 0E80013C */  lui        $at, %hi(Stframe_no)
/* B1C3C 800C143C 10FD20AC */  sw         $zero, %lo(Stframe_no)($at)
/* B1C40 800C1440 0E80013C */  lui        $at, %hi(CChannel)
/* B1C44 800C1444 31050308 */  j          .L800C14C4
/* B1C48 800C1448 08FD22AC */   sw        $v0, %lo(CChannel)($at)
.L800C144C:
/* B1C4C 800C144C 0E80023C */  lui        $v0, %hi(StEmu_Addr)
/* B1C50 800C1450 04FD428C */  lw         $v0, %lo(StEmu_Addr)($v0)
/* B1C54 800C1454 00000000 */  nop
/* B1C58 800C1458 11004010 */  beqz       $v0, .L800C14A0
/* B1C5C 800C145C F8010624 */   addiu     $a2, $zero, 0x1F8
/* B1C60 800C1460 21380000 */  addu       $a3, $zero, $zero
/* B1C64 800C1464 0E80053C */  lui        $a1, %hi(StEmu_Idx)
/* B1C68 800C1468 20FDA58C */  lw         $a1, %lo(StEmu_Idx)($a1)
/* B1C6C 800C146C 0E80043C */  lui        $a0, %hi(StRingBase)
/* B1C70 800C1470 2CFD848C */  lw         $a0, %lo(StRingBase)($a0)
/* B1C74 800C1474 C02A0500 */  sll        $a1, $a1, 11
/* B1C78 800C1478 21284500 */  addu       $a1, $v0, $a1
/* B1C7C 800C147C 4C05030C */  jal        func_800C1530
/* B1C80 800C1480 2000A524 */   addiu     $a1, $a1, 0x20
/* B1C84 800C1484 0E80023C */  lui        $v0, %hi(StEmu_Idx)
/* B1C88 800C1488 20FD428C */  lw         $v0, %lo(StEmu_Idx)($v0)
/* B1C8C 800C148C 00000000 */  nop
/* B1C90 800C1490 01004224 */  addiu      $v0, $v0, 0x1
/* B1C94 800C1494 0E80013C */  lui        $at, %hi(StEmu_Idx)
/* B1C98 800C1498 31050308 */  j          .L800C14C4
/* B1C9C 800C149C 20FD22AC */   sw        $v0, %lo(StEmu_Idx)($at)
.L800C14A0:
/* B1CA0 800C14A0 03000424 */  addiu      $a0, $zero, 0x3
/* B1CA4 800C14A4 21300000 */  addu       $a2, $zero, $zero
/* B1CA8 800C14A8 0E80053C */  lui        $a1, %hi(StRingBase)
/* B1CAC 800C14AC 2CFDA58C */  lw         $a1, %lo(StRingBase)($a1)
/* B1CB0 800C14B0 F8010724 */  addiu      $a3, $zero, 0x1F8
/* B1CB4 800C14B4 1000A8AF */  sw         $t0, 0x10($sp)
/* B1CB8 800C14B8 1400A0AF */  sw         $zero, 0x14($sp)
/* B1CBC 800C14BC 5705030C */  jal        func_800C155C
/* B1CC0 800C14C0 1800A0AF */   sw        $zero, 0x18($sp)
.L800C14C4:
/* B1CC4 800C14C4 0D80033C */  lui        $v1, %hi(CD_read_dma_mode + 0x390)
/* B1CC8 800C14C8 D0E7638C */  lw         $v1, %lo(CD_read_dma_mode + 0x390)($v1)
/* B1CCC 800C14CC 25130224 */  addiu      $v0, $zero, 0x1325
/* B1CD0 800C14D0 000062AC */  sw         $v0, 0x0($v1)
/* B1CD4 800C14D4 0E80033C */  lui        $v1, %hi(SpuCommonError + 0x4)
/* B1CD8 800C14D8 ECFC638C */  lw         $v1, %lo(SpuCommonError + 0x4)($v1)
/* B1CDC 800C14DC 03000224 */  addiu      $v0, $zero, 0x3
/* B1CE0 800C14E0 000062A4 */  sh         $v0, 0x0($v1)
/* B1CE4 800C14E4 0E80023C */  lui        $v0, %hi(StRingIdx1)
/* B1CE8 800C14E8 34FD428C */  lw         $v0, %lo(StRingIdx1)($v0)
/* B1CEC 800C14EC 0E80033C */  lui        $v1, %hi(StEmu_Addr)
/* B1CF0 800C14F0 04FD638C */  lw         $v1, %lo(StEmu_Addr)($v1)
/* B1CF4 800C14F4 01004224 */  addiu      $v0, $v0, 0x1
/* B1CF8 800C14F8 0E80013C */  lui        $at, %hi(StRingIdx1)
/* B1CFC 800C14FC 08006010 */  beqz       $v1, .L800C1520
/* B1D00 800C1500 34FD22AC */   sw        $v0, %lo(StRingIdx1)($at)
/* B1D04 800C1504 0E80023C */  lui        $v0, %hi(StFinalSector)
/* B1D08 800C1508 28FD428C */  lw         $v0, %lo(StFinalSector)($v0)
/* B1D0C 800C150C 00000000 */  nop
/* B1D10 800C1510 03004010 */  beqz       $v0, .L800C1520
/* B1D14 800C1514 00000000 */   nop
/* B1D18 800C1518 5107030C */  jal        func_800C1D44
/* B1D1C 800C151C 00000000 */   nop
.L800C1520:
/* B1D20 800C1520 3800BF8F */  lw         $ra, 0x38($sp)
/* B1D24 800C1524 4000BD27 */  addiu      $sp, $sp, 0x40
/* B1D28 800C1528 0800E003 */  jr         $ra
/* B1D2C 800C152C 00000000 */   nop
.size func_800C0C14, . - func_800C0C14
