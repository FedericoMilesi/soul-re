.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SndGetSfxChannel
/* 2F4C8 8003ECC8 10008228 */  slti       $v0, $a0, 0x10
/* 2F4CC 8003ECCC 03004014 */  bnez       $v0, .L8003ECDC
/* 2F4D0 8003ECD0 C0100400 */   sll       $v0, $a0, 3
/* 2F4D4 8003ECD4 0800E003 */  jr         $ra
/* 2F4D8 8003ECD8 21100000 */   addu      $v0, $zero, $zero
.L8003ECDC:
/* 2F4DC 8003ECDC 21104400 */  addu       $v0, $v0, $a0
/* 2F4E0 8003ECE0 80100200 */  sll        $v0, $v0, 2
/* 2F4E4 8003ECE4 DCC08327 */  addiu      $v1, $gp, %gp_rel(soundEffectChannelTbl)
/* 2F4E8 8003ECE8 0800E003 */  jr         $ra
/* 2F4EC 8003ECEC 21104300 */   addu      $v0, $v0, $v1
.size SndGetSfxChannel, . - SndGetSfxChannel
