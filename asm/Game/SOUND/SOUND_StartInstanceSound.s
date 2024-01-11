.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SOUND_StartInstanceSound
/* 301C8 8003F9C8 01008290 */  lbu        $v0, 0x1($a0)
/* 301CC 8003F9CC 01000324 */  addiu      $v1, $zero, 0x1
/* 301D0 8003F9D0 0F004230 */  andi       $v0, $v0, 0xF
/* 301D4 8003F9D4 02004314 */  bne        $v0, $v1, .L8003F9E0
/* 301D8 8003F9D8 02000224 */   addiu     $v0, $zero, 0x2
/* 301DC 8003F9DC 010082A0 */  sb         $v0, 0x1($a0)
.L8003F9E0:
/* 301E0 8003F9E0 0800E003 */  jr         $ra
/* 301E4 8003F9E4 00000000 */   nop
.size SOUND_StartInstanceSound, . - SOUND_StartInstanceSound
