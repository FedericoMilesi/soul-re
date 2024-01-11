.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MEMPACK_ReportMemory2
/* 40DFC 800505FC F0C6838F */  lw         $v1, %gp_rel(newMemTracker)($gp)
/* 40E00 80050600 FCC6828F */  lw         $v0, %gp_rel(newMemTracker + 0xC)($gp)
/* 40E04 80050604 00000000 */  nop
/* 40E08 80050608 06006210 */  beq        $v1, $v0, .L80050624
/* 40E0C 8005060C 21204000 */   addu      $a0, $v0, $zero
.L80050610:
/* 40E10 80050610 0400628C */  lw         $v0, 0x4($v1)
/* 40E14 80050614 00000000 */  nop
/* 40E18 80050618 21186200 */  addu       $v1, $v1, $v0
/* 40E1C 8005061C FCFF6414 */  bne        $v1, $a0, .L80050610
/* 40E20 80050620 00000000 */   nop
.L80050624:
/* 40E24 80050624 0800E003 */  jr         $ra
/* 40E28 80050628 00000000 */   nop
.size MEMPACK_ReportMemory2, . - MEMPACK_ReportMemory2
