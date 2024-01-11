.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_DoSoundMarkerAction
/* 56490 80065C90 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 56494 80065C94 1800B0AF */  sw         $s0, 0x18($sp)
/* 56498 80065C98 21808000 */  addu       $s0, $a0, $zero
/* 5649C 80065C9C 2000B2AF */  sw         $s2, 0x20($sp)
/* 564A0 80065CA0 01001224 */  addiu      $s2, $zero, 0x1
/* 564A4 80065CA4 21104002 */  addu       $v0, $s2, $zero
/* 564A8 80065CA8 FFFF0324 */  addiu      $v1, $zero, -0x1
/* 564AC 80065CAC 2400BFAF */  sw         $ra, 0x24($sp)
/* 564B0 80065CB0 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 564B4 80065CB4 1400A2AF */  sw         $v0, 0x14($sp)
/* 564B8 80065CB8 02000286 */  lh         $v0, 0x2($s0)
/* 564BC 80065CBC 1000078E */  lw         $a3, 0x10($s0)
/* 564C0 80065CC0 39004310 */  beq        $v0, $v1, .L80065DA8
/* 564C4 80065CC4 2120A000 */   addu      $a0, $a1, $zero
/* 564C8 80065CC8 1000A527 */  addiu      $a1, $sp, 0x10
/* 564CC 80065CCC 0400028E */  lw         $v0, 0x4($s0)
/* 564D0 80065CD0 1400A627 */  addiu      $a2, $sp, 0x14
/* 564D4 80065CD4 04184202 */  sllv       $v1, $v0, $s2
/* 564D8 80065CD8 21186200 */  addu       $v1, $v1, $v0
/* 564DC 80065CDC 08006324 */  addiu      $v1, $v1, 0x8
/* 564E0 80065CE0 008E010C */  jal        EVENT_ParseOperand2
/* 564E4 80065CE4 2188E300 */   addu      $s1, $a3, $v1
/* 564E8 80065CE8 02000386 */  lh         $v1, 0x2($s0)
/* 564EC 80065CEC 7F000224 */  addiu      $v0, $zero, 0x7F
/* 564F0 80065CF0 20006210 */  beq        $v1, $v0, .L80065D74
/* 564F4 80065CF4 80006228 */   slti      $v0, $v1, 0x80
/* 564F8 80065CF8 07004010 */  beqz       $v0, .L80065D18
/* 564FC 80065CFC 0D000224 */   addiu     $v0, $zero, 0xD
/* 56500 80065D00 10006210 */  beq        $v1, $v0, .L80065D44
/* 56504 80065D04 0E000224 */   addiu     $v0, $zero, 0xE
/* 56508 80065D08 0A006210 */  beq        $v1, $v0, .L80065D34
/* 5650C 80065D0C 00000000 */   nop
/* 56510 80065D10 6A970108 */  j          .L80065DA8
/* 56514 80065D14 21900000 */   addu      $s2, $zero, $zero
.L80065D18:
/* 56518 80065D18 80000224 */  addiu      $v0, $zero, 0x80
/* 5651C 80065D1C 1B006210 */  beq        $v1, $v0, .L80065D8C
/* 56520 80065D20 84006228 */   slti      $v0, $v1, 0x84
/* 56524 80065D24 1F004010 */  beqz       $v0, .L80065DA4
/* 56528 80065D28 21104002 */   addu      $v0, $s2, $zero
/* 5652C 80065D2C 6B970108 */  j          .L80065DAC
/* 56530 80065D30 00000000 */   nop
.L80065D34:
/* 56534 80065D34 1400A28F */  lw         $v0, 0x14($sp)
/* 56538 80065D38 00000000 */  nop
/* 5653C 80065D3C 0100422C */  sltiu      $v0, $v0, 0x1
/* 56540 80065D40 1400A2AF */  sw         $v0, 0x14($sp)
.L80065D44:
/* 56544 80065D44 1400A28F */  lw         $v0, 0x14($sp)
/* 56548 80065D48 00000000 */  nop
/* 5654C 80065D4C 05004010 */  beqz       $v0, .L80065D64
/* 56550 80065D50 00000000 */   nop
/* 56554 80065D54 72FE000C */  jal        SOUND_StartInstanceSound
/* 56558 80065D58 21202002 */   addu      $a0, $s1, $zero
/* 5655C 80065D5C 6B970108 */  j          .L80065DAC
/* 56560 80065D60 21104002 */   addu      $v0, $s2, $zero
.L80065D64:
/* 56564 80065D64 7AFE000C */  jal        SOUND_StopInstanceSound
/* 56568 80065D68 21202002 */   addu      $a0, $s1, $zero
/* 5656C 80065D6C 6B970108 */  j          .L80065DAC
/* 56570 80065D70 21104002 */   addu      $v0, $s2, $zero
.L80065D74:
/* 56574 80065D74 0800058E */  lw         $a1, 0x8($s0)
/* 56578 80065D78 0C00068E */  lw         $a2, 0xC($s0)
/* 5657C 80065D7C 00FF000C */  jal        SOUND_SetInstanceSoundVolume
/* 56580 80065D80 21202002 */   addu      $a0, $s1, $zero
/* 56584 80065D84 6B970108 */  j          .L80065DAC
/* 56588 80065D88 21104002 */   addu      $v0, $s2, $zero
.L80065D8C:
/* 5658C 80065D8C 0800058E */  lw         $a1, 0x8($s0)
/* 56590 80065D90 0C00068E */  lw         $a2, 0xC($s0)
/* 56594 80065D94 D0FE000C */  jal        SOUND_SetInstanceSoundPitch
/* 56598 80065D98 21202002 */   addu      $a0, $s1, $zero
/* 5659C 80065D9C 6B970108 */  j          .L80065DAC
/* 565A0 80065DA0 21104002 */   addu      $v0, $s2, $zero
.L80065DA4:
/* 565A4 80065DA4 21900000 */  addu       $s2, $zero, $zero
.L80065DA8:
/* 565A8 80065DA8 21104002 */  addu       $v0, $s2, $zero
.L80065DAC:
/* 565AC 80065DAC 2400BF8F */  lw         $ra, 0x24($sp)
/* 565B0 80065DB0 2000B28F */  lw         $s2, 0x20($sp)
/* 565B4 80065DB4 1C00B18F */  lw         $s1, 0x1C($sp)
/* 565B8 80065DB8 1800B08F */  lw         $s0, 0x18($sp)
/* 565BC 80065DBC 0800E003 */  jr         $ra
/* 565C0 80065DC0 2800BD27 */   addiu     $sp, $sp, 0x28
.size EVENT_DoSoundMarkerAction, . - EVENT_DoSoundMarkerAction
