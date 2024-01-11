.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MEMPACK_Free
/* 40C98 80050498 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 40C9C 8005049C 1000B0AF */  sw         $s0, 0x10($sp)
/* 40CA0 800504A0 F8FF9024 */  addiu      $s0, $a0, -0x8
/* 40CA4 800504A4 1400BFAF */  sw         $ra, 0x14($sp)
/* 40CA8 800504A8 020000A2 */  sb         $zero, 0x2($s0)
/* 40CAC 800504AC 030000A2 */  sb         $zero, 0x3($s0)
/* 40CB0 800504B0 F8C6828F */  lw         $v0, %gp_rel(newMemTracker + 0x8)($gp)
/* 40CB4 800504B4 0400038E */  lw         $v1, 0x4($s0)
/* 40CB8 800504B8 00000000 */  nop
/* 40CBC 800504BC 23104300 */  subu       $v0, $v0, $v1
/* 40CC0 800504C0 F8C682AF */  sw         $v0, %gp_rel(newMemTracker + 0x8)($gp)
/* 40CC4 800504C4 0400028E */  lw         $v0, 0x4($s0)
/* 40CC8 800504C8 00000000 */  nop
/* 40CCC 800504CC 21180202 */  addu       $v1, $s0, $v0
/* 40CD0 800504D0 FCC6828F */  lw         $v0, %gp_rel(newMemTracker + 0xC)($gp)
/* 40CD4 800504D4 00000000 */  nop
/* 40CD8 800504D8 03006210 */  beq        $v1, $v0, .L800504E8
/* 40CDC 800504DC 21200002 */   addu      $a0, $s0, $zero
/* 40CE0 800504E0 F340010C */  jal        MEMORY_MergeAddresses
/* 40CE4 800504E4 21286000 */   addu      $a1, $v1, $zero
.L800504E8:
/* 40CE8 800504E8 21180002 */  addu       $v1, $s0, $zero
/* 40CEC 800504EC F8C68227 */  addiu      $v0, $gp, %gp_rel(newMemTracker + 0x8)
/* 40CF0 800504F0 F8FF508C */  lw         $s0, -0x8($v0)
/* 40CF4 800504F4 FCC6828F */  lw         $v0, %gp_rel(newMemTracker + 0xC)($gp)
/* 40CF8 800504F8 00000000 */  nop
/* 40CFC 800504FC 0E000212 */  beq        $s0, $v0, .L80050538
/* 40D00 80050500 00000000 */   nop
.L80050504:
/* 40D04 80050504 0400028E */  lw         $v0, 0x4($s0)
/* 40D08 80050508 00000000 */  nop
/* 40D0C 8005050C 21280202 */  addu       $a1, $s0, $v0
/* 40D10 80050510 0500A314 */  bne        $a1, $v1, .L80050528
/* 40D14 80050514 00000000 */   nop
/* 40D18 80050518 F340010C */  jal        MEMORY_MergeAddresses
/* 40D1C 8005051C 21200002 */   addu      $a0, $s0, $zero
/* 40D20 80050520 4E410108 */  j          .L80050538
/* 40D24 80050524 00000000 */   nop
.L80050528:
/* 40D28 80050528 FCC6828F */  lw         $v0, %gp_rel(newMemTracker + 0xC)($gp)
/* 40D2C 8005052C 2180A000 */  addu       $s0, $a1, $zero
/* 40D30 80050530 F4FF0216 */  bne        $s0, $v0, .L80050504
/* 40D34 80050534 00000000 */   nop
.L80050538:
/* 40D38 80050538 1400BF8F */  lw         $ra, 0x14($sp)
/* 40D3C 8005053C 1000B08F */  lw         $s0, 0x10($sp)
/* 40D40 80050540 0800E003 */  jr         $ra
/* 40D44 80050544 1800BD27 */   addiu     $sp, $sp, 0x18
.size MEMPACK_Free, . - MEMPACK_Free
