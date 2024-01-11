.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_ChooseLeftOrRight
/* 70F88 80080788 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 70F8C 8008078C 1000B0AF */  sw         $s0, 0x10($sp)
/* 70F90 80080790 1400BFAF */  sw         $ra, 0x14($sp)
/* 70F94 80080794 0400A58C */  lw         $a1, 0x4($a1)
/* 70F98 80080798 6700020C */  jal        MON_FacingOffset
/* 70F9C 8008079C 21808000 */   addu      $s0, $a0, $zero
/* 70FA0 800807A0 00140200 */  sll        $v0, $v0, 16
/* 70FA4 800807A4 031C0200 */  sra        $v1, $v0, 16
/* 70FA8 800807A8 C0FF6228 */  slti       $v0, $v1, -0x40
/* 70FAC 800807AC 1B004014 */  bnez       $v0, .L8008081C
/* 70FB0 800807B0 FFFF0224 */   addiu     $v0, $zero, -0x1
/* 70FB4 800807B4 41006228 */  slti       $v0, $v1, 0x41
/* 70FB8 800807B8 03004014 */  bnez       $v0, .L800807C8
/* 70FBC 800807BC 21200002 */   addu      $a0, $s0, $zero
/* 70FC0 800807C0 07020208 */  j          .L8008081C
/* 70FC4 800807C4 01000224 */   addiu     $v0, $zero, 0x1
.L800807C8:
/* 70FC8 800807C8 78000596 */  lhu        $a1, 0x78($s0)
/* 70FCC 800807CC 00000000 */  nop
/* 70FD0 800807D0 0004A524 */  addiu      $a1, $a1, 0x400
/* 70FD4 800807D4 002C0500 */  sll        $a1, $a1, 16
/* 70FD8 800807D8 291C020C */  jal        MONSENSE_GetDistanceInDirection
/* 70FDC 800807DC 032C0500 */   sra       $a1, $a1, 16
/* 70FE0 800807E0 21200002 */  addu       $a0, $s0, $zero
/* 70FE4 800807E4 78000596 */  lhu        $a1, 0x78($s0)
/* 70FE8 800807E8 21804000 */  addu       $s0, $v0, $zero
/* 70FEC 800807EC 00FCA524 */  addiu      $a1, $a1, -0x400
/* 70FF0 800807F0 002C0500 */  sll        $a1, $a1, 16
/* 70FF4 800807F4 291C020C */  jal        MONSENSE_GetDistanceInDirection
/* 70FF8 800807F8 032C0500 */   sra       $a1, $a1, 16
/* 70FFC 800807FC 21184000 */  addu       $v1, $v0, $zero
/* 71000 80080800 05000312 */  beq        $s0, $v1, .L80080818
/* 71004 80080804 2A180302 */   slt       $v1, $s0, $v1
/* 71008 80080808 04006014 */  bnez       $v1, .L8008081C
/* 7100C 8008080C 01000224 */   addiu     $v0, $zero, 0x1
/* 71010 80080810 07020208 */  j          .L8008081C
/* 71014 80080814 FFFF0224 */   addiu     $v0, $zero, -0x1
.L80080818:
/* 71018 80080818 21100000 */  addu       $v0, $zero, $zero
.L8008081C:
/* 7101C 8008081C 1400BF8F */  lw         $ra, 0x14($sp)
/* 71020 80080820 1000B08F */  lw         $s0, 0x10($sp)
/* 71024 80080824 0800E003 */  jr         $ra
/* 71028 80080828 1800BD27 */   addiu     $sp, $sp, 0x18
.size MON_ChooseLeftOrRight, . - MON_ChooseLeftOrRight
