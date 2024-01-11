.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MEMPACK_Init
/* 40890 80050090 1F80023C */  lui        $v0, (0x801FF000 >> 16)
/* 40894 80050094 6490838F */  lw         $v1, %gp_rel(overlayAddress)($gp)
/* 40898 80050098 00F04234 */  ori        $v0, $v0, (0x801FF000 & 0xFFFF)
/* 4089C 8005009C 23104300 */  subu       $v0, $v0, $v1
/* 408A0 800500A0 F4C682AF */  sw         $v0, %gp_rel(newMemTracker + 0x4)($gp)
/* 408A4 800500A4 DEBA0234 */  ori        $v0, $zero, 0xBADE
/* 408A8 800500A8 F0C683AF */  sw         $v1, %gp_rel(newMemTracker)($gp)
/* 408AC 800500AC 000062A4 */  sh         $v0, 0x0($v1)
/* 408B0 800500B0 F0C6828F */  lw         $v0, %gp_rel(newMemTracker)($gp)
/* 408B4 800500B4 00000000 */  nop
/* 408B8 800500B8 020040A0 */  sb         $zero, 0x2($v0)
/* 408BC 800500BC F0C6828F */  lw         $v0, %gp_rel(newMemTracker)($gp)
/* 408C0 800500C0 00000000 */  nop
/* 408C4 800500C4 030040A0 */  sb         $zero, 0x3($v0)
/* 408C8 800500C8 F0C6838F */  lw         $v1, %gp_rel(newMemTracker)($gp)
/* 408CC 800500CC F4C6828F */  lw         $v0, %gp_rel(newMemTracker + 0x4)($gp)
/* 408D0 800500D0 00000000 */  nop
/* 408D4 800500D4 040062AC */  sw         $v0, 0x4($v1)
/* 408D8 800500D8 F0C6828F */  lw         $v0, %gp_rel(newMemTracker)($gp)
/* 408DC 800500DC F4C6838F */  lw         $v1, %gp_rel(newMemTracker + 0x4)($gp)
/* 408E0 800500E0 F8C680AF */  sw         $zero, %gp_rel(newMemTracker + 0x8)($gp)
/* 408E4 800500E4 00C780AF */  sw         $zero, %gp_rel(newMemTracker + 0x10)($gp)
/* 408E8 800500E8 21104300 */  addu       $v0, $v0, $v1
/* 408EC 800500EC FCC682AF */  sw         $v0, %gp_rel(newMemTracker + 0xC)($gp)
/* 408F0 800500F0 0800E003 */  jr         $ra
/* 408F4 800500F4 00000000 */   nop
.size MEMPACK_Init, . - MEMPACK_Init
