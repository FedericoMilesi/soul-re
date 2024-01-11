.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MEMPACK_FreeByType
/* 40D48 80050548 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 40D4C 8005054C 1800B2AF */  sw         $s2, 0x18($sp)
/* 40D50 80050550 01001224 */  addiu      $s2, $zero, 0x1
/* 40D54 80050554 1400B1AF */  sw         $s1, 0x14($sp)
/* 40D58 80050558 FF009130 */  andi       $s1, $a0, 0xFF
/* 40D5C 8005055C 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 40D60 80050560 1000B0AF */  sw         $s0, 0x10($sp)
.L80050564:
/* 40D64 80050564 F0C6848F */  lw         $a0, %gp_rel(newMemTracker)($gp)
/* 40D68 80050568 FCC6828F */  lw         $v0, %gp_rel(newMemTracker + 0xC)($gp)
/* 40D6C 8005056C 00000000 */  nop
/* 40D70 80050570 13008210 */  beq        $a0, $v0, .L800505C0
/* 40D74 80050574 21800000 */   addu      $s0, $zero, $zero
.L80050578:
/* 40D78 80050578 02008290 */  lbu        $v0, 0x2($a0)
/* 40D7C 8005057C 00000000 */  nop
/* 40D80 80050580 0A005214 */  bne        $v0, $s2, .L800505AC
/* 40D84 80050584 00000000 */   nop
/* 40D88 80050588 03008290 */  lbu        $v0, 0x3($a0)
/* 40D8C 8005058C 00000000 */  nop
/* 40D90 80050590 06005114 */  bne        $v0, $s1, .L800505AC
/* 40D94 80050594 00000000 */   nop
/* 40D98 80050598 01001024 */  addiu      $s0, $zero, 0x1
/* 40D9C 8005059C 2641010C */  jal        MEMPACK_Free
/* 40DA0 800505A0 08008424 */   addiu     $a0, $a0, 0x8
/* 40DA4 800505A4 70410108 */  j          .L800505C0
/* 40DA8 800505A8 00000000 */   nop
.L800505AC:
/* 40DAC 800505AC 0400828C */  lw         $v0, 0x4($a0)
/* 40DB0 800505B0 FCC6838F */  lw         $v1, %gp_rel(newMemTracker + 0xC)($gp)
/* 40DB4 800505B4 21208200 */  addu       $a0, $a0, $v0
/* 40DB8 800505B8 EFFF8314 */  bne        $a0, $v1, .L80050578
/* 40DBC 800505BC 00000000 */   nop
.L800505C0:
/* 40DC0 800505C0 E8FF1212 */  beq        $s0, $s2, .L80050564
/* 40DC4 800505C4 00000000 */   nop
/* 40DC8 800505C8 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 40DCC 800505CC 1800B28F */  lw         $s2, 0x18($sp)
/* 40DD0 800505D0 1400B18F */  lw         $s1, 0x14($sp)
/* 40DD4 800505D4 1000B08F */  lw         $s0, 0x10($sp)
/* 40DD8 800505D8 0800E003 */  jr         $ra
/* 40DDC 800505DC 2000BD27 */   addiu     $sp, $sp, 0x20
.size MEMPACK_FreeByType, . - MEMPACK_FreeByType
