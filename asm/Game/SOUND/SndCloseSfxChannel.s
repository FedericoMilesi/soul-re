.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SndCloseSfxChannel
/* 2F4A0 8003ECA0 10008228 */  slti       $v0, $a0, 0x10
/* 2F4A4 8003ECA4 06004010 */  beqz       $v0, .L8003ECC0
/* 2F4A8 8003ECA8 C0100400 */   sll       $v0, $a0, 3
/* 2F4AC 8003ECAC 21104400 */  addu       $v0, $v0, $a0
/* 2F4B0 8003ECB0 80100200 */  sll        $v0, $v0, 2
/* 2F4B4 8003ECB4 DCC08327 */  addiu      $v1, $gp, %gp_rel(soundEffectChannelTbl)
/* 2F4B8 8003ECB8 21104300 */  addu       $v0, $v0, $v1
/* 2F4BC 8003ECBC 000040A0 */  sb         $zero, 0x0($v0)
.L8003ECC0:
/* 2F4C0 8003ECC0 0800E003 */  jr         $ra
/* 2F4C4 8003ECC4 00000000 */   nop
.size SndCloseSfxChannel, . - SndCloseSfxChannel
