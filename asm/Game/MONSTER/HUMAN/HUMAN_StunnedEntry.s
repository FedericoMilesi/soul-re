.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel HUMAN_StunnedEntry
/* 6DA1C 8007D21C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 6DA20 8007D220 1000B0AF */  sw         $s0, 0x10($sp)
/* 6DA24 8007D224 21808000 */  addu       $s0, $a0, $zero
/* 6DA28 8007D228 1800BFAF */  sw         $ra, 0x18($sp)
/* 6DA2C 8007D22C 1400B1AF */  sw         $s1, 0x14($sp)
/* 6DA30 8007D230 6C01118E */  lw         $s1, 0x16C($s0)
/* 6DA34 8007D234 00000000 */  nop
/* 6DA38 8007D238 0400228E */  lw         $v0, 0x4($s1)
/* 6DA3C 8007D23C 00000000 */  nop
/* 6DA40 8007D240 10004230 */  andi       $v0, $v0, 0x10
/* 6DA44 8007D244 0C004010 */  beqz       $v0, .L8007D278
/* 6DA48 8007D248 00000000 */   nop
/* 6DA4C 8007D24C 9006020C */  jal        MON_GetTime
/* 6DA50 8007D250 00000000 */   nop
/* 6DA54 8007D254 60EA0334 */  ori        $v1, $zero, 0xEA60
/* 6DA58 8007D258 21104300 */  addu       $v0, $v0, $v1
/* 6DA5C 8007D25C 140122AE */  sw         $v0, 0x114($s1)
/* 6DA60 8007D260 21200002 */  addu       $a0, $s0, $zero
/* 6DA64 8007D264 1E000524 */  addiu      $a1, $zero, 0x1E
/* 6DA68 8007D268 B6FF010C */  jal        MON_PlayAnim
/* 6DA6C 8007D26C 01000624 */   addiu     $a2, $zero, 0x1
/* 6DA70 8007D270 A0F40108 */  j          .L8007D280
/* 6DA74 8007D274 00000000 */   nop
.L8007D278:
/* 6DA78 8007D278 1C25020C */  jal        MON_StunnedEntry
/* 6DA7C 8007D27C 21200002 */   addu      $a0, $s0, $zero
.L8007D280:
/* 6DA80 8007D280 1800BF8F */  lw         $ra, 0x18($sp)
/* 6DA84 8007D284 1400B18F */  lw         $s1, 0x14($sp)
/* 6DA88 8007D288 1000B08F */  lw         $s0, 0x10($sp)
/* 6DA8C 8007D28C 0800E003 */  jr         $ra
/* 6DA90 8007D290 2000BD27 */   addiu     $sp, $sp, 0x20
.size HUMAN_StunnedEntry, . - HUMAN_StunnedEntry
