.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WORSHIP_CombatEntry
/* 7F7E8 8008EFE8 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 7F7EC 8008EFEC 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 7F7F0 8008EFF0 21988000 */  addu       $s3, $a0, $zero
/* 7F7F4 8008EFF4 2000BFAF */  sw         $ra, 0x20($sp)
/* 7F7F8 8008EFF8 1800B2AF */  sw         $s2, 0x18($sp)
/* 7F7FC 8008EFFC 1400B1AF */  sw         $s1, 0x14($sp)
/* 7F800 8008F000 1000B0AF */  sw         $s0, 0x10($sp)
/* 7F804 8008F004 6C01718E */  lw         $s1, 0x16C($s3)
/* 7F808 8008F008 00000000 */  nop
/* 7F80C 8008F00C C400248E */  lw         $a0, 0xC4($s1)
/* 7F810 8008F010 00000000 */  nop
/* 7F814 8008F014 2B008010 */  beqz       $a0, .L8008F0C4
/* 7F818 8008F018 00000000 */   nop
/* 7F81C 8008F01C 6801228E */  lw         $v0, 0x168($s1)
/* 7F820 8008F020 00000000 */  nop
/* 7F824 8008F024 0800438C */  lw         $v1, 0x8($v0)
/* 7F828 8008F028 14008284 */  lh         $v0, 0x14($a0)
/* 7F82C 8008F02C 0A006384 */  lh         $v1, 0xA($v1)
/* 7F830 8008F030 00000000 */  nop
/* 7F834 8008F034 2A104300 */  slt        $v0, $v0, $v1
/* 7F838 8008F038 22004010 */  beqz       $v0, .L8008F0C4
/* 7F83C 8008F03C 01000224 */   addiu     $v0, $zero, 0x1
/* 7F840 8008F040 5E012392 */  lbu        $v1, 0x15E($s1)
/* 7F844 8008F044 00000000 */  nop
/* 7F848 8008F048 1E006214 */  bne        $v1, $v0, .L8008F0C4
/* 7F84C 8008F04C 00000000 */   nop
/* 7F850 8008F050 4C01708E */  lw         $s0, 0x14C($s3)
/* 7F854 8008F054 2400728E */  lw         $s2, 0x24($s3)
/* 7F858 8008F058 12000012 */  beqz       $s0, .L8008F0A4
/* 7F85C 8008F05C 00000000 */   nop
/* 7F860 8008F060 5001028E */  lw         $v0, 0x150($s0)
/* 7F864 8008F064 00000000 */  nop
/* 7F868 8008F068 16004014 */  bnez       $v0, .L8008F0C4
/* 7F86C 8008F06C 00000000 */   nop
/* 7F870 8008F070 24004392 */  lbu        $v1, 0x24($s2)
/* 7F874 8008F074 5401028E */  lw         $v0, 0x154($s0)
/* 7F878 8008F078 00000000 */  nop
/* 7F87C 8008F07C 11004314 */  bne        $v0, $v1, .L8008F0C4
/* 7F880 8008F080 00000000 */   nop
/* 7F884 8008F084 76D5000C */  jal        INSTANCE_UnlinkFromParent
/* 7F888 8008F088 21200002 */   addu      $a0, $s0, $zero
/* 7F88C 8008F08C 21200002 */  addu       $a0, $s0, $zero
/* 7F890 8008F090 23004692 */  lbu        $a2, 0x23($s2)
/* 7F894 8008F094 47D5000C */  jal        INSTANCE_LinkToParent
/* 7F898 8008F098 21286002 */   addu      $a1, $s3, $zero
/* 7F89C 8008F09C 2D3C0208 */  j          .L8008F0B4
/* 7F8A0 8008F0A0 00000000 */   nop
.L8008F0A4:
/* 7F8A4 8008F0A4 21206002 */  addu       $a0, $s3, $zero
/* 7F8A8 8008F0A8 23004692 */  lbu        $a2, 0x23($s2)
/* 7F8AC 8008F0AC 78F3010C */  jal        HUMAN_CreateWeapon
/* 7F8B0 8008F0B0 0B000524 */   addiu     $a1, $zero, 0xB
.L8008F0B4:
/* 7F8B4 8008F0B4 0000228E */  lw         $v0, 0x0($s1)
/* 7F8B8 8008F0B8 00000000 */  nop
/* 7F8BC 8008F0BC 20004234 */  ori        $v0, $v0, 0x20
/* 7F8C0 8008F0C0 000022AE */  sw         $v0, 0x0($s1)
.L8008F0C4:
/* 7F8C4 8008F0C4 8327020C */  jal        MON_CombatEntry
/* 7F8C8 8008F0C8 21206002 */   addu      $a0, $s3, $zero
/* 7F8CC 8008F0CC 2000BF8F */  lw         $ra, 0x20($sp)
/* 7F8D0 8008F0D0 1C00B38F */  lw         $s3, 0x1C($sp)
/* 7F8D4 8008F0D4 1800B28F */  lw         $s2, 0x18($sp)
/* 7F8D8 8008F0D8 1400B18F */  lw         $s1, 0x14($sp)
/* 7F8DC 8008F0DC 1000B08F */  lw         $s0, 0x10($sp)
/* 7F8E0 8008F0E0 0800E003 */  jr         $ra
/* 7F8E4 8008F0E4 2800BD27 */   addiu     $sp, $sp, 0x28
.size WORSHIP_CombatEntry, . - WORSHIP_CombatEntry
