.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_DoObjectSoundAction
/* 5635C 80065B5C D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 56360 80065B60 1800B0AF */  sw         $s0, 0x18($sp)
/* 56364 80065B64 21808000 */  addu       $s0, $a0, $zero
/* 56368 80065B68 2000B2AF */  sw         $s2, 0x20($sp)
/* 5636C 80065B6C 01001224 */  addiu      $s2, $zero, 0x1
/* 56370 80065B70 21104002 */  addu       $v0, $s2, $zero
/* 56374 80065B74 FFFF0324 */  addiu      $v1, $zero, -0x1
/* 56378 80065B78 2400BFAF */  sw         $ra, 0x24($sp)
/* 5637C 80065B7C 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 56380 80065B80 1400A2AF */  sw         $v0, 0x14($sp)
/* 56384 80065B84 02000286 */  lh         $v0, 0x2($s0)
/* 56388 80065B88 1000078E */  lw         $a3, 0x10($s0)
/* 5638C 80065B8C 39004310 */  beq        $v0, $v1, .L80065C74
/* 56390 80065B90 2120A000 */   addu      $a0, $a1, $zero
/* 56394 80065B94 1000A527 */  addiu      $a1, $sp, 0x10
/* 56398 80065B98 0400028E */  lw         $v0, 0x4($s0)
/* 5639C 80065B9C 1400A627 */  addiu      $a2, $sp, 0x14
/* 563A0 80065BA0 04184202 */  sllv       $v1, $v0, $s2
/* 563A4 80065BA4 21186200 */  addu       $v1, $v1, $v0
/* 563A8 80065BA8 48006324 */  addiu      $v1, $v1, 0x48
/* 563AC 80065BAC 008E010C */  jal        EVENT_ParseOperand2
/* 563B0 80065BB0 2188E300 */   addu      $s1, $a3, $v1
/* 563B4 80065BB4 02000386 */  lh         $v1, 0x2($s0)
/* 563B8 80065BB8 7F000224 */  addiu      $v0, $zero, 0x7F
/* 563BC 80065BBC 20006210 */  beq        $v1, $v0, .L80065C40
/* 563C0 80065BC0 80006228 */   slti      $v0, $v1, 0x80
/* 563C4 80065BC4 07004010 */  beqz       $v0, .L80065BE4
/* 563C8 80065BC8 0D000224 */   addiu     $v0, $zero, 0xD
/* 563CC 80065BCC 10006210 */  beq        $v1, $v0, .L80065C10
/* 563D0 80065BD0 0E000224 */   addiu     $v0, $zero, 0xE
/* 563D4 80065BD4 0A006210 */  beq        $v1, $v0, .L80065C00
/* 563D8 80065BD8 00000000 */   nop
/* 563DC 80065BDC 1D970108 */  j          .L80065C74
/* 563E0 80065BE0 21900000 */   addu      $s2, $zero, $zero
.L80065BE4:
/* 563E4 80065BE4 80000224 */  addiu      $v0, $zero, 0x80
/* 563E8 80065BE8 1B006210 */  beq        $v1, $v0, .L80065C58
/* 563EC 80065BEC 84006228 */   slti      $v0, $v1, 0x84
/* 563F0 80065BF0 1F004010 */  beqz       $v0, .L80065C70
/* 563F4 80065BF4 21104002 */   addu      $v0, $s2, $zero
/* 563F8 80065BF8 1E970108 */  j          .L80065C78
/* 563FC 80065BFC 00000000 */   nop
.L80065C00:
/* 56400 80065C00 1400A28F */  lw         $v0, 0x14($sp)
/* 56404 80065C04 00000000 */  nop
/* 56408 80065C08 0100422C */  sltiu      $v0, $v0, 0x1
/* 5640C 80065C0C 1400A2AF */  sw         $v0, 0x14($sp)
.L80065C10:
/* 56410 80065C10 1400A28F */  lw         $v0, 0x14($sp)
/* 56414 80065C14 00000000 */  nop
/* 56418 80065C18 05004010 */  beqz       $v0, .L80065C30
/* 5641C 80065C1C 00000000 */   nop
/* 56420 80065C20 72FE000C */  jal        SOUND_StartInstanceSound
/* 56424 80065C24 21202002 */   addu      $a0, $s1, $zero
/* 56428 80065C28 1E970108 */  j          .L80065C78
/* 5642C 80065C2C 21104002 */   addu      $v0, $s2, $zero
.L80065C30:
/* 56430 80065C30 7AFE000C */  jal        SOUND_StopInstanceSound
/* 56434 80065C34 21202002 */   addu      $a0, $s1, $zero
/* 56438 80065C38 1E970108 */  j          .L80065C78
/* 5643C 80065C3C 21104002 */   addu      $v0, $s2, $zero
.L80065C40:
/* 56440 80065C40 0800058E */  lw         $a1, 0x8($s0)
/* 56444 80065C44 0C00068E */  lw         $a2, 0xC($s0)
/* 56448 80065C48 00FF000C */  jal        SOUND_SetInstanceSoundVolume
/* 5644C 80065C4C 21202002 */   addu      $a0, $s1, $zero
/* 56450 80065C50 1E970108 */  j          .L80065C78
/* 56454 80065C54 21104002 */   addu      $v0, $s2, $zero
.L80065C58:
/* 56458 80065C58 0800058E */  lw         $a1, 0x8($s0)
/* 5645C 80065C5C 0C00068E */  lw         $a2, 0xC($s0)
/* 56460 80065C60 D0FE000C */  jal        SOUND_SetInstanceSoundPitch
/* 56464 80065C64 21202002 */   addu      $a0, $s1, $zero
/* 56468 80065C68 1E970108 */  j          .L80065C78
/* 5646C 80065C6C 21104002 */   addu      $v0, $s2, $zero
.L80065C70:
/* 56470 80065C70 21900000 */  addu       $s2, $zero, $zero
.L80065C74:
/* 56474 80065C74 21104002 */  addu       $v0, $s2, $zero
.L80065C78:
/* 56478 80065C78 2400BF8F */  lw         $ra, 0x24($sp)
/* 5647C 80065C7C 2000B28F */  lw         $s2, 0x20($sp)
/* 56480 80065C80 1C00B18F */  lw         $s1, 0x1C($sp)
/* 56484 80065C84 1800B08F */  lw         $s0, 0x18($sp)
/* 56488 80065C88 0800E003 */  jr         $ra
/* 5648C 80065C8C 2800BD27 */   addiu     $sp, $sp, 0x28
.size EVENT_DoObjectSoundAction, . - EVENT_DoObjectSoundAction
