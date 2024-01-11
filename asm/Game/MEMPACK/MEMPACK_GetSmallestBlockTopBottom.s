.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MEMPACK_GetSmallestBlockTopBottom
/* 408F8 800500F8 F0C6838F */  lw         $v1, %gp_rel(newMemTracker)($gp)
/* 408FC 800500FC FCC6828F */  lw         $v0, %gp_rel(newMemTracker + 0xC)($gp)
/* 40900 80050100 00000000 */  nop
/* 40904 80050104 14006210 */  beq        $v1, $v0, .L80050158
/* 40908 80050108 21280000 */   addu      $a1, $zero, $zero
/* 4090C 8005010C 21304000 */  addu       $a2, $v0, $zero
.L80050110:
/* 40910 80050110 02006290 */  lbu        $v0, 0x2($v1)
/* 40914 80050114 00000000 */  nop
/* 40918 80050118 0A004014 */  bnez       $v0, .L80050144
/* 4091C 8005011C 00000000 */   nop
/* 40920 80050120 0400628C */  lw         $v0, 0x4($v1)
/* 40924 80050124 00000000 */  nop
/* 40928 80050128 2B104400 */  sltu       $v0, $v0, $a0
/* 4092C 8005012C 05004014 */  bnez       $v0, .L80050144
/* 40930 80050130 00000000 */   nop
/* 40934 80050134 0300A014 */  bnez       $a1, .L80050144
/* 40938 80050138 00000000 */   nop
/* 4093C 8005013C 56400108 */  j          .L80050158
/* 40940 80050140 21286000 */   addu      $a1, $v1, $zero
.L80050144:
/* 40944 80050144 0400628C */  lw         $v0, 0x4($v1)
/* 40948 80050148 00000000 */  nop
/* 4094C 8005014C 21186200 */  addu       $v1, $v1, $v0
/* 40950 80050150 EFFF6614 */  bne        $v1, $a2, .L80050110
/* 40954 80050154 00000000 */   nop
.L80050158:
/* 40958 80050158 0800E003 */  jr         $ra
/* 4095C 8005015C 2110A000 */   addu      $v0, $a1, $zero
.size MEMPACK_GetSmallestBlockTopBottom, . - MEMPACK_GetSmallestBlockTopBottom
