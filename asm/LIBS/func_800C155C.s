.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C155C
/* B1D5C 800C155C D0FFBD27 */  addiu      $sp, $sp, -0x30
/* B1D60 800C1560 1800B0AF */  sw         $s0, 0x18($sp)
/* B1D64 800C1564 21808000 */  addu       $s0, $a0, $zero
/* B1D68 800C1568 2000B2AF */  sw         $s2, 0x20($sp)
/* B1D6C 800C156C 2190A000 */  addu       $s2, $a1, $zero
/* B1D70 800C1570 2400B3AF */  sw         $s3, 0x24($sp)
/* B1D74 800C1574 2198C000 */  addu       $s3, $a2, $zero
/* B1D78 800C1578 2800B4AF */  sw         $s4, 0x28($sp)
/* B1D7C 800C157C 21A0E000 */  addu       $s4, $a3, $zero
/* B1D80 800C1580 21200000 */  addu       $a0, $zero, $zero
/* B1D84 800C1584 00291000 */  sll        $a1, $s0, 4
/* B1D88 800C1588 0001033C */  lui        $v1, (0x1000000 >> 16)
/* B1D8C 800C158C 2C00BFAF */  sw         $ra, 0x2C($sp)
/* B1D90 800C1590 1C00B1AF */  sw         $s1, 0x1C($sp)
/* B1D94 800C1594 801F023C */  lui        $v0, (0x1F801088 >> 16)
/* B1D98 800C1598 21104500 */  addu       $v0, $v0, $a1
/* B1D9C 800C159C 8810428C */  lw         $v0, (0x1F801088 & 0xFFFF)($v0)
/* B1DA0 800C15A0 4400B193 */  lbu        $s1, 0x44($sp)
/* B1DA4 800C15A4 24104300 */  and        $v0, $v0, $v1
/* B1DA8 800C15A8 0A004010 */  beqz       $v0, .L800C15D4
/* B1DAC 800C15AC 0100063C */   lui       $a2, (0x10000 >> 16)
.L800C15B0:
/* B1DB0 800C15B0 12008610 */  beq        $a0, $a2, .L800C15FC
/* B1DB4 800C15B4 00000000 */   nop
/* B1DB8 800C15B8 801F023C */  lui        $v0, (0x1F801088 >> 16)
/* B1DBC 800C15BC 21104500 */  addu       $v0, $v0, $a1
/* B1DC0 800C15C0 8810428C */  lw         $v0, (0x1F801088 & 0xFFFF)($v0)
/* B1DC4 800C15C4 00000000 */  nop
/* B1DC8 800C15C8 24104300 */  and        $v0, $v0, $v1
/* B1DCC 800C15CC F8FF4014 */  bnez       $v0, .L800C15B0
/* B1DD0 800C15D0 01008424 */   addiu     $a0, $a0, 0x1
.L800C15D4:
/* B1DD4 800C15D4 01000224 */  addiu      $v0, $zero, 0x1
.L800C15D8:
/* B1DD8 800C15D8 10002216 */  bne        $s1, $v0, .L800C161C
/* B1DDC 800C15DC 00000000 */   nop
/* B1DE0 800C15E0 0D80033C */  lui        $v1, %hi(CD_read_dma_mode + 0x398)
/* B1DE4 800C15E4 D8E7638C */  lw         $v1, %lo(CD_read_dma_mode + 0x398)($v1)
/* B1DE8 800C15E8 00000000 */  nop
/* B1DEC 800C15EC 02006490 */  lbu        $a0, 0x2($v1)
/* B1DF0 800C15F0 04100202 */  sllv       $v0, $v0, $s0
/* B1DF4 800C15F4 8D050308 */  j          .L800C1634
/* B1DF8 800C15F8 25108200 */   or        $v0, $a0, $v0
.L800C15FC:
/* B1DFC 800C15FC 801F013C */  lui        $at, (0x1F801088 >> 16)
/* B1E00 800C1600 21082500 */  addu       $at, $at, $a1
/* B1E04 800C1604 8810258C */  lw         $a1, (0x1F801088 & 0xFFFF)($at)
/* B1E08 800C1608 0180043C */  lui        $a0, %hi(D_80012A04)
/* B1E0C 800C160C 06D1010C */  jal        printf
/* B1E10 800C1610 042A8424 */   addiu     $a0, $a0, %lo(D_80012A04)
/* B1E14 800C1614 76050308 */  j          .L800C15D8
/* B1E18 800C1618 01000224 */   addiu     $v0, $zero, 0x1
.L800C161C:
/* B1E1C 800C161C 0D80033C */  lui        $v1, %hi(CD_read_dma_mode + 0x398)
/* B1E20 800C1620 D8E7638C */  lw         $v1, %lo(CD_read_dma_mode + 0x398)($v1)
/* B1E24 800C1624 04100202 */  sllv       $v0, $v0, $s0
/* B1E28 800C1628 02006490 */  lbu        $a0, 0x2($v1)
/* B1E2C 800C162C 27100200 */  nor        $v0, $zero, $v0
/* B1E30 800C1630 24108200 */  and        $v0, $a0, $v0
.L800C1634:
/* B1E34 800C1634 020062A0 */  sb         $v0, 0x2($v1)
/* B1E38 800C1638 0D80023C */  lui        $v0, %hi(CD_read_dma_mode + 0x398)
/* B1E3C 800C163C D8E7428C */  lw         $v0, %lo(CD_read_dma_mode + 0x398)($v0)
/* B1E40 800C1640 00000000 */  nop
/* B1E44 800C1644 0000428C */  lw         $v0, 0x0($v0)
/* B1E48 800C1648 00000000 */  nop
/* B1E4C 800C164C 1000A2AF */  sw         $v0, 0x10($sp)
/* B1E50 800C1650 80301000 */  sll        $a2, $s0, 2
/* B1E54 800C1654 0300C624 */  addiu      $a2, $a2, 0x3
/* B1E58 800C1658 01000324 */  addiu      $v1, $zero, 0x1
/* B1E5C 800C165C 0418C300 */  sllv       $v1, $v1, $a2
/* B1E60 800C1660 801F053C */  lui        $a1, (0x1F801080 >> 16)
/* B1E64 800C1664 8010A534 */  ori        $a1, $a1, (0x1F801080 & 0xFFFF)
/* B1E68 800C1668 00111000 */  sll        $v0, $s0, 4
/* B1E6C 800C166C 21284500 */  addu       $a1, $v0, $a1
/* B1E70 800C1670 0D80043C */  lui        $a0, %hi(CD_read_dma_mode + 0x394)
/* B1E74 800C1674 D4E7848C */  lw         $a0, %lo(CD_read_dma_mode + 0x394)($a0)
/* B1E78 800C1678 00141300 */  sll        $v0, $s3, 16
/* B1E7C 800C167C 0000868C */  lw         $a2, 0x0($a0)
/* B1E80 800C1680 25105400 */  or         $v0, $v0, $s4
/* B1E84 800C1684 2530C300 */  or         $a2, $a2, $v1
/* B1E88 800C1688 000086AC */  sw         $a2, 0x0($a0)
/* B1E8C 800C168C 0000B2AC */  sw         $s2, 0x0($a1)
/* B1E90 800C1690 0400A524 */  addiu      $a1, $a1, 0x4
/* B1E94 800C1694 0000A2AC */  sw         $v0, 0x0($a1)
/* B1E98 800C1698 0D80033C */  lui        $v1, %hi(CD_read_dma_mode + 0x37C)
/* B1E9C 800C169C BCE7638C */  lw         $v1, %lo(CD_read_dma_mode + 0x37C)($v1)
/* B1EA0 800C16A0 00000000 */  nop
/* B1EA4 800C16A4 00006290 */  lbu        $v0, 0x0($v1)
/* B1EA8 800C16A8 00000000 */  nop
/* B1EAC 800C16AC 40004230 */  andi       $v0, $v0, 0x40
/* B1EB0 800C16B0 06004014 */  bnez       $v0, .L800C16CC
/* B1EB4 800C16B4 0400A524 */   addiu     $a1, $a1, 0x4
.L800C16B8:
/* B1EB8 800C16B8 00006290 */  lbu        $v0, 0x0($v1)
/* B1EBC 800C16BC 00000000 */  nop
/* B1EC0 800C16C0 40004230 */  andi       $v0, $v0, 0x40
/* B1EC4 800C16C4 FCFF4010 */  beqz       $v0, .L800C16B8
/* B1EC8 800C16C8 00000000 */   nop
.L800C16CC:
/* B1ECC 800C16CC 4000A28F */  lw         $v0, 0x40($sp)
/* B1ED0 800C16D0 00000000 */  nop
/* B1ED4 800C16D4 0000A2AC */  sw         $v0, 0x0($a1)
/* B1ED8 800C16D8 0000A28C */  lw         $v0, 0x0($a1)
/* B1EDC 800C16DC 00000000 */  nop
/* B1EE0 800C16E0 1000A2AF */  sw         $v0, 0x10($sp)
/* B1EE4 800C16E4 2C00BF8F */  lw         $ra, 0x2C($sp)
/* B1EE8 800C16E8 2800B48F */  lw         $s4, 0x28($sp)
/* B1EEC 800C16EC 2400B38F */  lw         $s3, 0x24($sp)
/* B1EF0 800C16F0 2000B28F */  lw         $s2, 0x20($sp)
/* B1EF4 800C16F4 1C00B18F */  lw         $s1, 0x1C($sp)
/* B1EF8 800C16F8 1800B08F */  lw         $s0, 0x18($sp)
/* B1EFC 800C16FC 0800E003 */  jr         $ra
/* B1F00 800C1700 3000BD27 */   addiu     $sp, $sp, 0x30
.size func_800C155C, . - func_800C155C
