.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_StreamLoadLevelReturn
/* 4A9F8 8005A1F8 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 4A9FC 8005A1FC 1000B0AF */  sw         $s0, 0x10($sp)
/* 4AA00 8005A200 21808000 */  addu       $s0, $a0, $zero
/* 4AA04 8005A204 1400B1AF */  sw         $s1, 0x14($sp)
/* 4AA08 8005A208 2188C000 */  addu       $s1, $a2, $zero
/* 4AA0C 8005A20C 1800BFAF */  sw         $ra, 0x18($sp)
/* 4AA10 8005A210 EBF4020C */  jal        GetRCnt
/* 4AA14 8005A214 00F2043C */   lui       $a0, (0xF2000000 >> 16)
/* 4AA18 8005A218 5890828F */  lw         $v0, %gp_rel(gameTimer)($gp)
/* 4AA1C 8005A21C F800028E */  lw         $v0, 0xF8($s0)
/* 4AA20 8005A220 04002386 */  lh         $v1, 0x4($s1)
/* 4AA24 8005A224 000022AE */  sw         $v0, 0x0($s1)
/* 4AA28 8005A228 03000224 */  addiu      $v0, $zero, 0x3
/* 4AA2C 8005A22C 07006214 */  bne        $v1, $v0, .L8005A24C
/* 4AA30 8005A230 00000000 */   nop
/* 4AA34 8005A234 0800248E */  lw         $a0, 0x8($s1)
/* 4AA38 8005A238 040020A6 */  sh         $zero, 0x4($s1)
/* 4AA3C 8005A23C 2641010C */  jal        MEMPACK_Free
/* 4AA40 8005A240 060020A6 */   sh        $zero, 0x6($s1)
/* 4AA44 8005A244 B3680108 */  j          .L8005A2CC
/* 4AA48 8005A248 080020AE */   sw        $zero, 0x8($s1)
.L8005A24C:
/* 4AA4C 8005A24C D2BD8287 */  lh         $v0, %gp_rel(gameTrackerX + 0xA)($gp)
/* 4AA50 8005A250 00000000 */  nop
/* 4AA54 8005A254 05004010 */  beqz       $v0, .L8005A26C
/* 4AA58 8005A258 00000000 */   nop
/* 4AA5C 8005A25C 4A000586 */  lh         $a1, 0x4A($s0)
/* 4AA60 8005A260 48000686 */  lh         $a2, 0x48($s0)
/* 4AA64 8005A264 9D680108 */  j          .L8005A274
/* 4AA68 8005A268 00000000 */   nop
.L8005A26C:
/* 4AA6C 8005A26C A6000586 */  lh         $a1, 0xA6($s0)
/* 4AA70 8005A270 A4000686 */  lh         $a2, 0xA4($s0)
.L8005A274:
/* 4AA74 8005A274 CC66010C */  jal        STREAM_SetStreamFog
/* 4AA78 8005A278 21202002 */   addu      $a0, $s1, $zero
/* 4AA7C 8005A27C 1368010C */  jal        STREAM_FinishLoad
/* 4AA80 8005A280 21202002 */   addu      $a0, $s1, $zero
/* 4AA84 8005A284 F4BD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 4AA88 8005A288 00000000 */  nop
/* 4AA8C 8005A28C 0F004010 */  beqz       $v0, .L8005A2CC
/* 4AA90 8005A290 00000000 */   nop
/* 4AA94 8005A294 F800038E */  lw         $v1, 0xF8($s0)
/* 4AA98 8005A298 3800428C */  lw         $v0, 0x38($v0)
/* 4AA9C 8005A29C 00000000 */  nop
/* 4AAA0 8005A2A0 0A006214 */  bne        $v1, $v0, .L8005A2CC
/* 4AAA4 8005A2A4 00000000 */   nop
/* 4AAA8 8005A2A8 9800058E */  lw         $a1, 0x98($s0)
/* 4AAAC 8005A2AC 24BF8427 */  addiu      $a0, $gp, %gp_rel(gameTrackerX + 0x15C)
/* 4AAB0 8005A2B0 1CF4020C */  jal        strcpy
/* 4AAB4 8005A2B4 00000000 */   nop
/* 4AAB8 8005A2B8 B766010C */  jal        STREAM_SetMainFog
/* 4AABC 8005A2BC 21202002 */   addu      $a0, $s1, $zero
/* 4AAC0 8005A2C0 F800028E */  lw         $v0, 0xF8($s0)
/* 4AAC4 8005A2C4 F0BD90AF */  sw         $s0, %gp_rel(gameTrackerX + 0x28)($gp)
/* 4AAC8 8005A2C8 40BF82AF */  sw         $v0, %gp_rel(gameTrackerX + 0x178)($gp)
.L8005A2CC:
/* 4AACC 8005A2CC 1800BF8F */  lw         $ra, 0x18($sp)
/* 4AAD0 8005A2D0 1400B18F */  lw         $s1, 0x14($sp)
/* 4AAD4 8005A2D4 1000B08F */  lw         $s0, 0x10($sp)
/* 4AAD8 8005A2D8 0800E003 */  jr         $ra
/* 4AADC 8005A2DC 2000BD27 */   addiu     $sp, $sp, 0x20
.size STREAM_StreamLoadLevelReturn, . - STREAM_StreamLoadLevelReturn
