.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SOUND_StopInstanceSound
/* 301E8 8003F9E8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 301EC 8003F9EC 1000B0AF */  sw         $s0, 0x10($sp)
/* 301F0 8003F9F0 21808000 */  addu       $s0, $a0, $zero
/* 301F4 8003F9F4 1400BFAF */  sw         $ra, 0x14($sp)
/* 301F8 8003F9F8 00000492 */  lbu        $a0, 0x0($s0)
/* 301FC 8003F9FC 32FB000C */  jal        SndGetSfxChannel
/* 30200 8003FA00 00000000 */   nop
/* 30204 8003FA04 09004010 */  beqz       $v0, .L8003FA2C
/* 30208 8003FA08 00000000 */   nop
/* 3020C 8003FA0C 0400448C */  lw         $a0, 0x4($v0)
/* 30210 8003FA10 1C02010C */  jal        SndEndLoop
/* 30214 8003FA14 00000000 */   nop
/* 30218 8003FA18 00000492 */  lbu        $a0, 0x0($s0)
/* 3021C 8003FA1C 28FB000C */  jal        SndCloseSfxChannel
/* 30220 8003FA20 00000000 */   nop
/* 30224 8003FA24 FF000224 */  addiu      $v0, $zero, 0xFF
/* 30228 8003FA28 000002A2 */  sb         $v0, 0x0($s0)
.L8003FA2C:
/* 3022C 8003FA2C 01000224 */  addiu      $v0, $zero, 0x1
/* 30230 8003FA30 010002A2 */  sb         $v0, 0x1($s0)
/* 30234 8003FA34 1400BF8F */  lw         $ra, 0x14($sp)
/* 30238 8003FA38 1000B08F */  lw         $s0, 0x10($sp)
/* 3023C 8003FA3C 0800E003 */  jr         $ra
/* 30240 8003FA40 1800BD27 */   addiu     $sp, $sp, 0x18
.size SOUND_StopInstanceSound, . - SOUND_StopInstanceSound
