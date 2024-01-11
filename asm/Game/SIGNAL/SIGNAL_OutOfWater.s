.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SIGNAL_OutOfWater
/* EF78 8001E778 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* EF7C 8001E77C 1000B0AF */  sw         $s0, 0x10($sp)
/* EF80 8001E780 21808000 */  addu       $s0, $a0, $zero
/* EF84 8001E784 1400BFAF */  sw         $ra, 0x14($sp)
/* EF88 8001E788 3800048E */  lw         $a0, 0x38($s0)
/* EF8C 8001E78C 1C66010C */  jal        STREAM_GetLevelWithID
/* EF90 8001E790 00000000 */   nop
/* EF94 8001E794 08004010 */  beqz       $v0, .L8001E7B8
/* EF98 8001E798 00000000 */   nop
/* EF9C 8001E79C C800428C */  lw         $v0, 0xC8($v0)
/* EFA0 8001E7A0 00000000 */  nop
/* EFA4 8001E7A4 04004010 */  beqz       $v0, .L8001E7B8
/* EFA8 8001E7A8 21200002 */   addu      $a0, $s0, $zero
/* EFAC 8001E7AC 08004524 */  addiu      $a1, $v0, 0x8
/* EFB0 8001E7B0 7279000C */  jal        SIGNAL_HandleSignal
/* EFB4 8001E7B4 21300000 */   addu      $a2, $zero, $zero
.L8001E7B8:
/* EFB8 8001E7B8 1400BF8F */  lw         $ra, 0x14($sp)
/* EFBC 8001E7BC 1000B08F */  lw         $s0, 0x10($sp)
/* EFC0 8001E7C0 0800E003 */  jr         $ra
/* EFC4 8001E7C4 1800BD27 */   addiu     $sp, $sp, 0x18
.size SIGNAL_OutOfWater, . - SIGNAL_OutOfWater
