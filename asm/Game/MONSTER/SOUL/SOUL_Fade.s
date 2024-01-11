.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SOUL_Fade
/* 7E18C 8008D98C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 7E190 8008D990 1000B0AF */  sw         $s0, 0x10($sp)
/* 7E194 8008D994 21808000 */  addu       $s0, $a0, $zero
/* 7E198 8008D998 1800BFAF */  sw         $ra, 0x18($sp)
/* 7E19C 8008D99C 1400B1AF */  sw         $s1, 0x14($sp)
/* 7E1A0 8008D9A0 6C01118E */  lw         $s1, 0x16C($s0)
/* 7E1A4 8008D9A4 9006020C */  jal        MON_GetTime
/* 7E1A8 8008D9A8 00000000 */   nop
/* 7E1AC 8008D9AC 08BF838F */  lw         $v1, %gp_rel(gameTrackerX + 0x140)($gp)
/* 7E1B0 8008D9B0 00000000 */  nop
/* 7E1B4 8008D9B4 80006330 */  andi       $v1, $v1, 0x80
/* 7E1B8 8008D9B8 1A006014 */  bnez       $v1, .L8008DA24
/* 7E1BC 8008D9BC 21204000 */   addu      $a0, $v0, $zero
/* 7E1C0 8008D9C0 0C01228E */  lw         $v0, 0x10C($s1)
/* 7E1C4 8008D9C4 00000000 */  nop
/* 7E1C8 8008D9C8 2B104400 */  sltu       $v0, $v0, $a0
/* 7E1CC 8008D9CC 17004010 */  beqz       $v0, .L8008DA2C
/* 7E1D0 8008D9D0 00000000 */   nop
/* 7E1D4 8008D9D4 04010286 */  lh         $v0, 0x104($s0)
/* 7E1D8 8008D9D8 00000000 */  nop
/* 7E1DC 8008D9DC 08004014 */  bnez       $v0, .L8008DA00
/* 7E1E0 8008D9E0 00104228 */   slti      $v0, $v0, 0x1000
/* 7E1E4 8008D9E4 21200002 */  addu       $a0, $s0, $zero
/* 7E1E8 8008D9E8 00100524 */  addiu      $a1, $zero, 0x1000
/* 7E1EC 8008D9EC 7810020C */  jal        MON_StartSpecialFade
/* 7E1F0 8008D9F0 64000624 */   addiu     $a2, $zero, 0x64
/* 7E1F4 8008D9F4 04010286 */  lh         $v0, 0x104($s0)
/* 7E1F8 8008D9F8 00000000 */  nop
/* 7E1FC 8008D9FC 00104228 */  slti       $v0, $v0, 0x1000
.L8008DA00:
/* 7E200 8008DA00 0A004014 */  bnez       $v0, .L8008DA2C
/* 7E204 8008DA04 21200002 */   addu      $a0, $s0, $zero
/* 7E208 8008DA08 1800028E */  lw         $v0, 0x18($s0)
/* 7E20C 8008DA0C 0008033C */  lui        $v1, (0x8000000 >> 16)
/* 7E210 8008DA10 25104300 */  or         $v0, $v0, $v1
/* 7E214 8008DA14 9B71010C */  jal        MORPH_SetupInstanceFlags
/* 7E218 8008DA18 180002AE */   sw        $v0, 0x18($s0)
/* 7E21C 8008DA1C 8B360208 */  j          .L8008DA2C
/* 7E220 8008DA20 040100A6 */   sh        $zero, 0x104($s0)
.L8008DA24:
/* 7E224 8008DA24 64198224 */  addiu      $v0, $a0, 0x1964
/* 7E228 8008DA28 0C0122AE */  sw         $v0, 0x10C($s1)
.L8008DA2C:
/* 7E22C 8008DA2C 1800BF8F */  lw         $ra, 0x18($sp)
/* 7E230 8008DA30 1400B18F */  lw         $s1, 0x14($sp)
/* 7E234 8008DA34 1000B08F */  lw         $s0, 0x10($sp)
/* 7E238 8008DA38 0800E003 */  jr         $ra
/* 7E23C 8008DA3C 2000BD27 */   addiu     $sp, $sp, 0x20
.size SOUL_Fade, . - SOUL_Fade
