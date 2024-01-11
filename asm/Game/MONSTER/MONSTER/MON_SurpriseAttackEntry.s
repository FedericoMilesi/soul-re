.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_SurpriseAttackEntry
/* 7B8CC 8008B0CC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 7B8D0 8008B0D0 1400BFAF */  sw         $ra, 0x14($sp)
/* 7B8D4 8008B0D4 1000B0AF */  sw         $s0, 0x10($sp)
/* 7B8D8 8008B0D8 6C01908C */  lw         $s0, 0x16C($a0)
/* 7B8DC 8008B0DC 00000000 */  nop
/* 7B8E0 8008B0E0 6801028E */  lw         $v0, 0x168($s0)
/* 7B8E4 8008B0E4 2400838C */  lw         $v1, 0x24($a0)
/* 7B8E8 8008B0E8 0800428C */  lw         $v0, 0x8($v0)
/* 7B8EC 8008B0EC 00000000 */  nop
/* 7B8F0 8008B0F0 1F004280 */  lb         $v0, 0x1F($v0)
/* 7B8F4 8008B0F4 21300000 */  addu       $a2, $zero, $zero
/* 7B8F8 8008B0F8 01000724 */  addiu      $a3, $zero, 0x1
/* 7B8FC 8008B0FC 3800638C */  lw         $v1, 0x38($v1)
/* 7B900 8008B100 40110200 */  sll        $v0, $v0, 5
/* 7B904 8008B104 5F0100A2 */  sb         $zero, 0x15F($s0)
/* 7B908 8008B108 21186200 */  addu       $v1, $v1, $v0
/* 7B90C 8008B10C B80003AE */  sw         $v1, 0xB8($s0)
/* 7B910 8008B110 21286000 */  addu       $a1, $v1, $zero
/* 7B914 8008B114 6FFF010C */  jal        MON_PlayAnimFromList
/* 7B918 8008B118 1B00A524 */   addiu     $a1, $a1, 0x1B
/* 7B91C 8008B11C 5A010392 */  lbu        $v1, 0x15A($s0)
/* 7B920 8008B120 08000224 */  addiu      $v0, $zero, 0x8
/* 7B924 8008B124 0A006214 */  bne        $v1, $v0, .L8008B150
/* 7B928 8008B128 FFFF0324 */   addiu     $v1, $zero, -0x1
/* 7B92C 8008B12C 5D010282 */  lb         $v0, 0x15D($s0)
/* 7B930 8008B130 5D010492 */  lbu        $a0, 0x15D($s0)
/* 7B934 8008B134 03004310 */  beq        $v0, $v1, .L8008B144
/* 7B938 8008B138 00000000 */   nop
/* 7B93C 8008B13C 542C0208 */  j          .L8008B150
/* 7B940 8008B140 5A0104A2 */   sb        $a0, 0x15A($s0)
.L8008B144:
/* 7B944 8008B144 5B010292 */  lbu        $v0, 0x15B($s0)
/* 7B948 8008B148 00000000 */  nop
/* 7B94C 8008B14C 5A0102A2 */  sb         $v0, 0x15A($s0)
.L8008B150:
/* 7B950 8008B150 1400BF8F */  lw         $ra, 0x14($sp)
/* 7B954 8008B154 1000B08F */  lw         $s0, 0x10($sp)
/* 7B958 8008B158 0800E003 */  jr         $ra
/* 7B95C 8008B15C 1800BD27 */   addiu     $sp, $sp, 0x18
.size MON_SurpriseAttackEntry, . - MON_SurpriseAttackEntry
