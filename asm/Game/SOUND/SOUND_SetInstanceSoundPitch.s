.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SOUND_SetInstanceSoundPitch
/* 30340 8003FB40 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 30344 8003FB44 1400B1AF */  sw         $s1, 0x14($sp)
/* 30348 8003FB48 2188A000 */  addu       $s1, $a1, $zero
/* 3034C 8003FB4C 1000B0AF */  sw         $s0, 0x10($sp)
/* 30350 8003FB50 1800BFAF */  sw         $ra, 0x18($sp)
/* 30354 8003FB54 01008290 */  lbu        $v0, 0x1($a0)
/* 30358 8003FB58 02000324 */  addiu      $v1, $zero, 0x2
/* 3035C 8003FB5C 0F004230 */  andi       $v0, $v0, 0xF
/* 30360 8003FB60 22004314 */  bne        $v0, $v1, .L8003FBEC
/* 30364 8003FB64 2180C000 */   addu      $s0, $a2, $zero
/* 30368 8003FB68 00008490 */  lbu        $a0, 0x0($a0)
/* 3036C 8003FB6C 32FB000C */  jal        SndGetSfxChannel
/* 30370 8003FB70 00000000 */   nop
/* 30374 8003FB74 21204000 */  addu       $a0, $v0, $zero
/* 30378 8003FB78 1C008010 */  beqz       $a0, .L8003FBEC
/* 3037C 8003FB7C 00000000 */   nop
/* 30380 8003FB80 02000106 */  bgez       $s0, .L8003FB8C
/* 30384 8003FB84 00000000 */   nop
/* 30388 8003FB88 23801000 */  negu       $s0, $s0
.L8003FB8C:
/* 3038C 8003FB8C 13000012 */  beqz       $s0, .L8003FBDC
/* 30390 8003FB90 00000000 */   nop
/* 30394 8003FB94 1A003002 */  div        $zero, $s1, $s0
/* 30398 8003FB98 12100000 */  mflo       $v0
/* 3039C 8003FB9C 03002106 */  bgez       $s1, .L8003FBAC
/* 303A0 8003FBA0 1C0082A4 */   sh        $v0, 0x1C($a0)
/* 303A4 8003FBA4 ECFE0008 */  j          .L8003FBB0
/* 303A8 8003FBA8 FFFF0224 */   addiu     $v0, $zero, -0x1
.L8003FBAC:
/* 303AC 8003FBAC 01000224 */  addiu      $v0, $zero, 0x1
.L8003FBB0:
/* 303B0 8003FBB0 1E0082A4 */  sh         $v0, 0x1E($a0)
/* 303B4 8003FBB4 1A003002 */  div        $zero, $s1, $s0
/* 303B8 8003FBB8 10100000 */  mfhi       $v0
/* 303BC 8003FBBC 220080A4 */  sh         $zero, 0x22($a0)
/* 303C0 8003FBC0 180090A4 */  sh         $s0, 0x18($a0)
/* 303C4 8003FBC4 1A0090A4 */  sh         $s0, 0x1A($a0)
/* 303C8 8003FBC8 02004104 */  bgez       $v0, .L8003FBD4
/* 303CC 8003FBCC 00000000 */   nop
/* 303D0 8003FBD0 23100200 */  negu       $v0, $v0
.L8003FBD4:
/* 303D4 8003FBD4 FBFE0008 */  j          .L8003FBEC
/* 303D8 8003FBD8 200082A4 */   sh        $v0, 0x20($a0)
.L8003FBDC:
/* 303DC 8003FBDC 16008294 */  lhu        $v0, 0x16($a0)
/* 303E0 8003FBE0 180080A4 */  sh         $zero, 0x18($a0)
/* 303E4 8003FBE4 21105100 */  addu       $v0, $v0, $s1
/* 303E8 8003FBE8 160082A4 */  sh         $v0, 0x16($a0)
.L8003FBEC:
/* 303EC 8003FBEC 1800BF8F */  lw         $ra, 0x18($sp)
/* 303F0 8003FBF0 1400B18F */  lw         $s1, 0x14($sp)
/* 303F4 8003FBF4 1000B08F */  lw         $s0, 0x10($sp)
/* 303F8 8003FBF8 0800E003 */  jr         $ra
/* 303FC 8003FBFC 2000BD27 */   addiu     $sp, $sp, 0x20
.size SOUND_SetInstanceSoundPitch, . - SOUND_SetInstanceSoundPitch
