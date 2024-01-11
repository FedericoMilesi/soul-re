.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_Parry
/* 78AE4 800882E4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 78AE8 800882E8 1000B0AF */  sw         $s0, 0x10($sp)
/* 78AEC 800882EC 21808000 */  addu       $s0, $a0, $zero
/* 78AF0 800882F0 1400BFAF */  sw         $ra, 0x14($sp)
/* 78AF4 800882F4 1800028E */  lw         $v0, 0x18($s0)
/* 78AF8 800882F8 00000000 */  nop
/* 78AFC 800882FC 10004230 */  andi       $v0, $v0, 0x10
/* 78B00 80088300 03004010 */  beqz       $v0, .L80088310
/* 78B04 80088304 00000000 */   nop
/* 78B08 80088308 91FE010C */  jal        MON_SwitchState
/* 78B0C 8008830C 0D000524 */   addiu     $a1, $zero, 0xD
.L80088310:
/* 78B10 80088310 0917020C */  jal        MON_DefaultQueueHandler
/* 78B14 80088314 21200002 */   addu      $a0, $s0, $zero
/* 78B18 80088318 1400BF8F */  lw         $ra, 0x14($sp)
/* 78B1C 8008831C 1000B08F */  lw         $s0, 0x10($sp)
/* 78B20 80088320 0800E003 */  jr         $ra
/* 78B24 80088324 1800BD27 */   addiu     $sp, $sp, 0x18
.size MON_Parry, . - MON_Parry
