.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sfxCmdSetVoiceAttr
/* 486DC 80057EDC E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 486E0 80057EE0 1000B0AF */  sw         $s0, 0x10($sp)
/* 486E4 80057EE4 21800000 */  addu       $s0, $zero, $zero
/* 486E8 80057EE8 1800BFAF */  sw         $ra, 0x18($sp)
/* 486EC 80057EEC 1400B1AF */  sw         $s1, 0x14($sp)
/* 486F0 80057EF0 0400918C */  lw         $s1, 0x4($a0)
/* 486F4 80057EF4 01000324 */  addiu      $v1, $zero, 0x1
/* 486F8 80057EF8 0000248E */  lw         $a0, 0x0($s1)
.L80057EFC:
/* 486FC 80057EFC 00000000 */  nop
/* 48700 80057F00 24106400 */  and        $v0, $v1, $a0
/* 48704 80057F04 05004014 */  bnez       $v0, .L80057F1C
/* 48708 80057F08 00000000 */   nop
/* 4870C 80057F0C 01001026 */  addiu      $s0, $s0, 0x1
/* 48710 80057F10 1800022E */  sltiu      $v0, $s0, 0x18
/* 48714 80057F14 F9FF4014 */  bnez       $v0, .L80057EFC
/* 48718 80057F18 40180300 */   sll       $v1, $v1, 1
.L80057F1C:
/* 4871C 80057F1C 08002586 */  lh         $a1, 0x8($s1)
/* 48720 80057F20 0A002686 */  lh         $a2, 0xA($s1)
/* 48724 80057F24 D000030C */  jal        SpuSetVoiceVolume
/* 48728 80057F28 21200002 */   addu      $a0, $s0, $zero
/* 4872C 80057F2C 14002596 */  lhu        $a1, 0x14($s1)
/* 48730 80057F30 9DFE020C */  jal        SpuSetVoicePitch
/* 48734 80057F34 21200002 */   addu      $a0, $s0, $zero
/* 48738 80057F38 1C00258E */  lw         $a1, 0x1C($s1)
/* 4873C 80057F3C F000030C */  jal        SpuSetVoiceStartAddr
/* 48740 80057F40 21200002 */   addu      $a0, $s0, $zero
/* 48744 80057F44 3A002596 */  lhu        $a1, 0x3A($s1)
/* 48748 80057F48 3C002696 */  lhu        $a2, 0x3C($s1)
/* 4874C 80057F4C 2A60010C */  jal        SpuSetVoiceADSR1ADSR2
/* 48750 80057F50 21200002 */   addu      $a0, $s0, $zero
/* 48754 80057F54 1800BF8F */  lw         $ra, 0x18($sp)
/* 48758 80057F58 1400B18F */  lw         $s1, 0x14($sp)
/* 4875C 80057F5C 1000B08F */  lw         $s0, 0x10($sp)
/* 48760 80057F60 0800E003 */  jr         $ra
/* 48764 80057F64 2000BD27 */   addiu     $sp, $sp, 0x20
.size sfxCmdSetVoiceAttr, . - sfxCmdSetVoiceAttr
