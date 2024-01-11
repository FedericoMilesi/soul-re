.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MEMPACK_GetSmallestBlockBottomTop
/* 40960 80050160 F0C6838F */  lw         $v1, %gp_rel(newMemTracker)($gp)
/* 40964 80050164 FCC6828F */  lw         $v0, %gp_rel(newMemTracker + 0xC)($gp)
/* 40968 80050168 00000000 */  nop
/* 4096C 8005016C 15006210 */  beq        $v1, $v0, .L800501C4
/* 40970 80050170 21280000 */   addu      $a1, $zero, $zero
/* 40974 80050174 21304000 */  addu       $a2, $v0, $zero
.L80050178:
/* 40978 80050178 02006290 */  lbu        $v0, 0x2($v1)
/* 4097C 8005017C 00000000 */  nop
/* 40980 80050180 0B004014 */  bnez       $v0, .L800501B0
/* 40984 80050184 00000000 */   nop
/* 40988 80050188 0400628C */  lw         $v0, 0x4($v1)
/* 4098C 8005018C 00000000 */  nop
/* 40990 80050190 2B104400 */  sltu       $v0, $v0, $a0
/* 40994 80050194 06004014 */  bnez       $v0, .L800501B0
/* 40998 80050198 00000000 */   nop
/* 4099C 8005019C 0300A010 */  beqz       $a1, .L800501AC
/* 409A0 800501A0 2B10A300 */   sltu      $v0, $a1, $v1
/* 409A4 800501A4 02004010 */  beqz       $v0, .L800501B0
/* 409A8 800501A8 00000000 */   nop
.L800501AC:
/* 409AC 800501AC 21286000 */  addu       $a1, $v1, $zero
.L800501B0:
/* 409B0 800501B0 0400628C */  lw         $v0, 0x4($v1)
/* 409B4 800501B4 00000000 */  nop
/* 409B8 800501B8 21186200 */  addu       $v1, $v1, $v0
/* 409BC 800501BC EEFF6614 */  bne        $v1, $a2, .L80050178
/* 409C0 800501C0 00000000 */   nop
.L800501C4:
/* 409C4 800501C4 0800E003 */  jr         $ra
/* 409C8 800501C8 2110A000 */   addu      $v0, $a1, $zero
.size MEMPACK_GetSmallestBlockBottomTop, . - MEMPACK_GetSmallestBlockBottomTop
