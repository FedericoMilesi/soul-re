.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GAMELOOP_RequestLevelChange
/* 21958 80031158 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 2195C 8003115C 1800B2AF */  sw         $s2, 0x18($sp)
/* 21960 80031160 21908000 */  addu       $s2, $a0, $zero
/* 21964 80031164 1000B0AF */  sw         $s0, 0x10($sp)
/* 21968 80031168 2180C000 */  addu       $s0, $a2, $zero
/* 2196C 8003116C 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 21970 80031170 1400B1AF */  sw         $s1, 0x14($sp)
/* 21974 80031174 6E010286 */  lh         $v0, 0x16E($s0)
/* 21978 80031178 00000000 */  nop
/* 2197C 8003117C 10004014 */  bnez       $v0, .L800311C0
/* 21980 80031180 2188A000 */   addu      $s1, $a1, $zero
/* 21984 80031184 4001028E */  lw         $v0, 0x140($s0)
/* 21988 80031188 00000000 */  nop
/* 2198C 8003118C 01004234 */  ori        $v0, $v0, 0x1
/* 21990 80031190 B901010C */  jal        SOUND_ResetAllSound
/* 21994 80031194 400102AE */   sw        $v0, 0x140($s0)
/* 21998 80031198 0D80053C */  lui        $a1, %hi(fontsObject + 0xA4)
/* 2199C 8003119C 003C1100 */  sll        $a3, $s1, 16
/* 219A0 800311A0 5C010426 */  addiu      $a0, $s0, 0x15C
/* 219A4 800311A4 B807A524 */  addiu      $a1, $a1, %lo(fontsObject + 0xA4)
/* 219A8 800311A8 21304002 */  addu       $a2, $s2, $zero
/* 219AC 800311AC 1AD1010C */  jal        sprintf
/* 219B0 800311B0 033C0700 */   sra       $a3, $a3, 16
/* 219B4 800311B4 01000224 */  addiu      $v0, $zero, 0x1
/* 219B8 800311B8 6E0102A6 */  sh         $v0, 0x16E($s0)
/* 219BC 800311BC 6C0102A6 */  sh         $v0, 0x16C($s0)
.L800311C0:
/* 219C0 800311C0 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 219C4 800311C4 1800B28F */  lw         $s2, 0x18($sp)
/* 219C8 800311C8 1400B18F */  lw         $s1, 0x14($sp)
/* 219CC 800311CC 1000B08F */  lw         $s0, 0x10($sp)
/* 219D0 800311D0 0800E003 */  jr         $ra
/* 219D4 800311D4 2000BD27 */   addiu     $sp, $sp, 0x20
.size GAMELOOP_RequestLevelChange, . - GAMELOOP_RequestLevelChange
