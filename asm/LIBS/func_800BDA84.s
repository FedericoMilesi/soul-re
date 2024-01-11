.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BDA84
/* AE284 800BDA84 0E80023C */  lui        $v0, %hi(GsOUT_PACKET_P_dup1 + 0xA0)
/* AE288 800BDA88 08D74224 */  addiu      $v0, $v0, %lo(GsOUT_PACKET_P_dup1 + 0xA0)
/* AE28C 800BDA8C F0008430 */  andi       $a0, $a0, 0xF0
/* AE290 800BDA90 02008010 */  beqz       $a0, .L800BDA9C
/* AE294 800BDA94 00000000 */   nop
/* AE298 800BDA98 F0004224 */  addiu      $v0, $v0, 0xF0
.L800BDA9C:
/* AE29C 800BDA9C 0800E003 */  jr         $ra
/* AE2A0 800BDAA0 00000000 */   nop
/* AE2A4 800BDAA4 00000000 */  nop
.size func_800BDA84, . - func_800BDA84
