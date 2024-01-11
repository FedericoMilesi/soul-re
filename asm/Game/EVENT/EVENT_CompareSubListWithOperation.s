.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_CompareSubListWithOperation
/* 56F1C 8006671C 60A4838F */  lw         $v1, %gp_rel(CurrentEventLine)($gp)
/* 56F20 80066720 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 56F24 80066724 5000B6AF */  sw         $s6, 0x50($sp)
/* 56F28 80066728 21B08000 */  addu       $s6, $a0, $zero
/* 56F2C 8006672C 4400B3AF */  sw         $s3, 0x44($sp)
/* 56F30 80066730 2198A000 */  addu       $s3, $a1, $zero
/* 56F34 80066734 5400B7AF */  sw         $s7, 0x54($sp)
/* 56F38 80066738 21B8C000 */  addu       $s7, $a2, $zero
/* 56F3C 8006673C 5800BEAF */  sw         $fp, 0x58($sp)
/* 56F40 80066740 21F0E000 */  addu       $fp, $a3, $zero
/* 56F44 80066744 4C00B5AF */  sw         $s5, 0x4C($sp)
/* 56F48 80066748 21A80000 */  addu       $s5, $zero, $zero
/* 56F4C 8006674C 5C00BFAF */  sw         $ra, 0x5C($sp)
/* 56F50 80066750 4800B4AF */  sw         $s4, 0x48($sp)
/* 56F54 80066754 4000B2AF */  sw         $s2, 0x40($sp)
/* 56F58 80066758 3C00B1AF */  sw         $s1, 0x3C($sp)
/* 56F5C 8006675C 14006228 */  slti       $v0, $v1, 0x14
/* 56F60 80066760 05004010 */  beqz       $v0, .L80066778
/* 56F64 80066764 3800B0AF */   sw        $s0, 0x38($sp)
/* 56F68 80066768 80100300 */  sll        $v0, $v1, 2
/* 56F6C 8006676C 38CE8327 */  addiu      $v1, $gp, %gp_rel(eventListNumInstances)
/* 56F70 80066770 21104300 */  addu       $v0, $v0, $v1
/* 56F74 80066774 000040AC */  sw         $zero, 0x0($v0)
.L80066778:
/* 56F78 80066778 0400628E */  lw         $v0, 0x4($s3)
/* 56F7C 8006677C 00000000 */  nop
/* 56F80 80066780 2A10A202 */  slt        $v0, $s5, $v0
/* 56F84 80066784 3F004010 */  beqz       $v0, .L80066884
/* 56F88 80066788 21A00000 */   addu      $s4, $zero, $zero
/* 56F8C 8006678C 21908002 */  addu       $s2, $s4, $zero
.L80066790:
/* 56F90 80066790 02000224 */  addiu      $v0, $zero, 0x2
/* 56F94 80066794 1000A2AF */  sw         $v0, 0x10($sp)
/* 56F98 80066798 0000628E */  lw         $v0, 0x0($s3)
/* 56F9C 8006679C 00000000 */  nop
/* 56FA0 800667A0 21104202 */  addu       $v0, $s2, $v0
/* 56FA4 800667A4 0000438C */  lw         $v1, 0x0($v0)
/* 56FA8 800667A8 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 56FAC 800667AC 1800A2AF */  sw         $v0, 0x18($sp)
/* 56FB0 800667B0 1400A3AF */  sw         $v1, 0x14($sp)
/* 56FB4 800667B4 0800628E */  lw         $v0, 0x8($s3)
/* 56FB8 800667B8 00000000 */  nop
/* 56FBC 800667BC 0D004018 */  blez       $v0, .L800667F4
/* 56FC0 800667C0 21800000 */   addu      $s0, $zero, $zero
/* 56FC4 800667C4 21886002 */  addu       $s1, $s3, $zero
/* 56FC8 800667C8 1000A427 */  addiu      $a0, $sp, 0x10
.L800667CC:
/* 56FCC 800667CC 2128C002 */  addu       $a1, $s6, $zero
/* 56FD0 800667D0 21380000 */  addu       $a3, $zero, $zero
/* 56FD4 800667D4 0C00268E */  lw         $a2, 0xC($s1)
/* 56FD8 800667D8 BFA2010C */  jal        EVENT_TransformOperand
/* 56FDC 800667DC 04003126 */   addiu     $s1, $s1, 0x4
/* 56FE0 800667E0 0800628E */  lw         $v0, 0x8($s3)
/* 56FE4 800667E4 01001026 */  addiu      $s0, $s0, 0x1
/* 56FE8 800667E8 2A100202 */  slt        $v0, $s0, $v0
/* 56FEC 800667EC F7FF4014 */  bnez       $v0, .L800667CC
/* 56FF0 800667F0 1000A427 */   addiu     $a0, $sp, 0x10
.L800667F4:
/* 56FF4 800667F4 2120C002 */  addu       $a0, $s6, $zero
/* 56FF8 800667F8 1000A527 */  addiu      $a1, $sp, 0x10
/* 56FFC 800667FC 2130E002 */  addu       $a2, $s7, $zero
/* 57000 80066800 2E9A010C */  jal        EVENT_CompareOperandsWithOperation
/* 57004 80066804 2138C003 */   addu      $a3, $fp, $zero
/* 57008 80066808 19004010 */  beqz       $v0, .L80066870
/* 5700C 8006680C 00000000 */   nop
/* 57010 80066810 60A4848F */  lw         $a0, %gp_rel(CurrentEventLine)($gp)
/* 57014 80066814 00000000 */  nop
/* 57018 80066818 14008228 */  slti       $v0, $a0, 0x14
/* 5701C 8006681C 13004010 */  beqz       $v0, .L8006686C
/* 57020 80066820 80300400 */   sll       $a2, $a0, 2
/* 57024 80066824 38CE8227 */  addiu      $v0, $gp, %gp_rel(eventListNumInstances)
/* 57028 80066828 2138C200 */  addu       $a3, $a2, $v0
/* 5702C 8006682C 0000E58C */  lw         $a1, 0x0($a3)
/* 57030 80066830 00000000 */  nop
/* 57034 80066834 0A00A228 */  slti       $v0, $a1, 0xA
/* 57038 80066838 0C004010 */  beqz       $v0, .L8006686C
/* 5703C 8006683C 80180500 */   sll       $v1, $a1, 2
/* 57040 80066840 2110C400 */  addu       $v0, $a2, $a0
/* 57044 80066844 C0100200 */  sll        $v0, $v0, 3
/* 57048 80066848 21186200 */  addu       $v1, $v1, $v0
/* 5704C 8006684C 0000628E */  lw         $v0, 0x0($s3)
/* 57050 80066850 28CF8427 */  addiu      $a0, $gp, %gp_rel(eventListArray)
/* 57054 80066854 21104202 */  addu       $v0, $s2, $v0
/* 57058 80066858 0000428C */  lw         $v0, 0x0($v0)
/* 5705C 8006685C 21186400 */  addu       $v1, $v1, $a0
/* 57060 80066860 000062AC */  sw         $v0, 0x0($v1)
/* 57064 80066864 0100A224 */  addiu      $v0, $a1, 0x1
/* 57068 80066868 0000E2AC */  sw         $v0, 0x0($a3)
.L8006686C:
/* 5706C 8006686C 01001524 */  addiu      $s5, $zero, 0x1
.L80066870:
/* 57070 80066870 0400628E */  lw         $v0, 0x4($s3)
/* 57074 80066874 01009426 */  addiu      $s4, $s4, 0x1
/* 57078 80066878 2A108202 */  slt        $v0, $s4, $v0
/* 5707C 8006687C C4FF4014 */  bnez       $v0, .L80066790
/* 57080 80066880 04005226 */   addiu     $s2, $s2, 0x4
.L80066884:
/* 57084 80066884 2110A002 */  addu       $v0, $s5, $zero
/* 57088 80066888 5C00BF8F */  lw         $ra, 0x5C($sp)
/* 5708C 8006688C 5800BE8F */  lw         $fp, 0x58($sp)
/* 57090 80066890 5400B78F */  lw         $s7, 0x54($sp)
/* 57094 80066894 5000B68F */  lw         $s6, 0x50($sp)
/* 57098 80066898 4C00B58F */  lw         $s5, 0x4C($sp)
/* 5709C 8006689C 4800B48F */  lw         $s4, 0x48($sp)
/* 570A0 800668A0 4400B38F */  lw         $s3, 0x44($sp)
/* 570A4 800668A4 4000B28F */  lw         $s2, 0x40($sp)
/* 570A8 800668A8 3C00B18F */  lw         $s1, 0x3C($sp)
/* 570AC 800668AC 3800B08F */  lw         $s0, 0x38($sp)
/* 570B0 800668B0 0800E003 */  jr         $ra
/* 570B4 800668B4 6000BD27 */   addiu     $sp, $sp, 0x60
.size EVENT_CompareSubListWithOperation, . - EVENT_CompareSubListWithOperation
