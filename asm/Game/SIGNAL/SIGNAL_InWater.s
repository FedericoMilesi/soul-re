.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SIGNAL_InWater
/* EFC8 8001E7C8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* EFCC 8001E7CC 1000B0AF */  sw         $s0, 0x10($sp)
/* EFD0 8001E7D0 21808000 */  addu       $s0, $a0, $zero
/* EFD4 8001E7D4 1400BFAF */  sw         $ra, 0x14($sp)
/* EFD8 8001E7D8 3800048E */  lw         $a0, 0x38($s0)
/* EFDC 8001E7DC 1C66010C */  jal        STREAM_GetLevelWithID
/* EFE0 8001E7E0 00000000 */   nop
/* EFE4 8001E7E4 08004010 */  beqz       $v0, .L8001E808
/* EFE8 8001E7E8 00000000 */   nop
/* EFEC 8001E7EC C400428C */  lw         $v0, 0xC4($v0)
/* EFF0 8001E7F0 00000000 */  nop
/* EFF4 8001E7F4 04004010 */  beqz       $v0, .L8001E808
/* EFF8 8001E7F8 21200002 */   addu      $a0, $s0, $zero
/* EFFC 8001E7FC 08004524 */  addiu      $a1, $v0, 0x8
/* F000 8001E800 7279000C */  jal        SIGNAL_HandleSignal
/* F004 8001E804 21300000 */   addu      $a2, $zero, $zero
.L8001E808:
/* F008 8001E808 1400BF8F */  lw         $ra, 0x14($sp)
/* F00C 8001E80C 1000B08F */  lw         $s0, 0x10($sp)
/* F010 8001E810 0800E003 */  jr         $ra
/* F014 8001E814 1800BD27 */   addiu     $sp, $sp, 0x18
.size SIGNAL_InWater, . - SIGNAL_InWater
