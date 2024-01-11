.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel VWRAITH_VerticalMove
/* 7F62C 8008EE2C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 7F630 8008EE30 1000B0AF */  sw         $s0, 0x10($sp)
/* 7F634 8008EE34 21808000 */  addu       $s0, $a0, $zero
/* 7F638 8008EE38 1800BFAF */  sw         $ra, 0x18($sp)
/* 7F63C 8008EE3C 1400B1AF */  sw         $s1, 0x14($sp)
/* 7F640 8008EE40 6C01028E */  lw         $v0, 0x16C($s0)
/* 7F644 8008EE44 00000000 */  nop
/* 7F648 8008EE48 C400438C */  lw         $v1, 0xC4($v0)
/* 7F64C 8008EE4C 00000000 */  nop
/* 7F650 8008EE50 12006010 */  beqz       $v1, .L8008EE9C
/* 7F654 8008EE54 00000000 */   nop
/* 7F658 8008EE58 2400028E */  lw         $v0, 0x24($s0)
/* 7F65C 8008EE5C 0400638C */  lw         $v1, 0x4($v1)
/* 7F660 8008EE60 0400428C */  lw         $v0, 0x4($v0)
/* 7F664 8008EE64 60007184 */  lh         $s1, 0x60($v1)
/* 7F668 8008EE68 08004684 */  lh         $a2, 0x8($v0)
/* 7F66C 8008EE6C 8D3A020C */  jal        VWRAITH_MoveVertical
/* 7F670 8008EE70 21282002 */   addu      $a1, $s1, $zero
/* 7F674 8008EE74 9801038E */  lw         $v1, 0x198($s0)
/* 7F678 8008EE78 06000224 */  addiu      $v0, $zero, 0x6
/* 7F67C 8008EE7C 07006214 */  bne        $v1, $v0, .L8008EE9C
/* 7F680 8008EE80 00000000 */   nop
/* 7F684 8008EE84 60000286 */  lh         $v0, 0x60($s0)
/* 7F688 8008EE88 00000000 */  nop
/* 7F68C 8008EE8C 03005110 */  beq        $v0, $s1, .L8008EE9C
/* 7F690 8008EE90 21200002 */   addu      $a0, $s0, $zero
/* 7F694 8008EE94 91FE010C */  jal        MON_SwitchState
/* 7F698 8008EE98 0D000524 */   addiu     $a1, $zero, 0xD
.L8008EE9C:
/* 7F69C 8008EE9C 1800BF8F */  lw         $ra, 0x18($sp)
/* 7F6A0 8008EEA0 1400B18F */  lw         $s1, 0x14($sp)
/* 7F6A4 8008EEA4 1000B08F */  lw         $s0, 0x10($sp)
/* 7F6A8 8008EEA8 0800E003 */  jr         $ra
/* 7F6AC 8008EEAC 2000BD27 */   addiu     $sp, $sp, 0x20
.size VWRAITH_VerticalMove, . - VWRAITH_VerticalMove
