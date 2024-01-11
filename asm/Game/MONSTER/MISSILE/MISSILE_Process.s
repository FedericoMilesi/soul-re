.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MISSILE_Process
/* 6E1EC 8007D9EC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 6E1F0 8007D9F0 1000B0AF */  sw         $s0, 0x10($sp)
/* 6E1F4 8007D9F4 1400BFAF */  sw         $ra, 0x14($sp)
/* 6E1F8 8007D9F8 09AE010C */  jal        ProcessPhysicalObject
/* 6E1FC 8007D9FC 21808000 */   addu      $s0, $a0, $zero
/* 6E200 8007DA00 4801028E */  lw         $v0, 0x148($s0)
/* 6E204 8007DA04 00000000 */  nop
/* 6E208 8007DA08 0A004014 */  bnez       $v0, .L8007DA34
/* 6E20C 8007DA0C 00000000 */   nop
/* 6E210 8007DA10 9006020C */  jal        MON_GetTime
/* 6E214 8007DA14 21200002 */   addu      $a0, $s0, $zero
/* 6E218 8007DA18 A801038E */  lw         $v1, 0x1A8($s0)
/* 6E21C 8007DA1C 00000000 */  nop
/* 6E220 8007DA20 2B186200 */  sltu       $v1, $v1, $v0
/* 6E224 8007DA24 03006010 */  beqz       $v1, .L8007DA34
/* 6E228 8007DA28 00000000 */   nop
/* 6E22C 8007DA2C 85D1000C */  jal        INSTANCE_KillInstance
/* 6E230 8007DA30 21200002 */   addu      $a0, $s0, $zero
.L8007DA34:
/* 6E234 8007DA34 1400BF8F */  lw         $ra, 0x14($sp)
/* 6E238 8007DA38 1000B08F */  lw         $s0, 0x10($sp)
/* 6E23C 8007DA3C 0800E003 */  jr         $ra
/* 6E240 8007DA40 1800BD27 */   addiu     $sp, $sp, 0x18
.size MISSILE_Process, . - MISSILE_Process
