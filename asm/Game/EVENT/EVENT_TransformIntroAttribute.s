.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_TransformIntroAttribute
/* 53EE4 800636E4 B8FFBD27 */  addiu      $sp, $sp, -0x48
/* 53EE8 800636E8 3C00B3AF */  sw         $s3, 0x3C($sp)
/* 53EEC 800636EC 2198A000 */  addu       $s3, $a1, $zero
/* 53EF0 800636F0 FCFFC324 */  addiu      $v1, $a2, -0x4
/* 53EF4 800636F4 A300622C */  sltiu      $v0, $v1, 0xA3
/* 53EF8 800636F8 4000BFAF */  sw         $ra, 0x40($sp)
/* 53EFC 800636FC 3800B2AF */  sw         $s2, 0x38($sp)
/* 53F00 80063700 3400B1AF */  sw         $s1, 0x34($sp)
/* 53F04 80063704 3000B0AF */  sw         $s0, 0x30($sp)
/* 53F08 80063708 0400678E */  lw         $a3, 0x4($s3)
/* 53F0C 8006370C 32004010 */  beqz       $v0, .L800637D8
/* 53F10 80063710 0180023C */   lui       $v0, %hi(jtbl_800109D8)
/* 53F14 80063714 D8094224 */  addiu      $v0, $v0, %lo(jtbl_800109D8)
/* 53F18 80063718 80180300 */  sll        $v1, $v1, 2
/* 53F1C 8006371C 21186200 */  addu       $v1, $v1, $v0
/* 53F20 80063720 0000628C */  lw         $v0, 0x0($v1)
/* 53F24 80063724 00000000 */  nop
/* 53F28 80063728 08004000 */  jr         $v0
/* 53F2C 8006372C 00000000 */   nop
jlabel .L80063730
/* 53F30 80063730 2C00E28C */  lw         $v0, 0x2C($a3)
/* 53F34 80063734 00000000 */  nop
/* 53F38 80063738 00404230 */  andi       $v0, $v0, 0x4000
/* 53F3C 8006373C 26004010 */  beqz       $v0, .L800637D8
/* 53F40 80063740 2120E000 */   addu      $a0, $a3, $zero
/* 53F44 80063744 20009084 */  lh         $s0, 0x20($a0)
/* 53F48 80063748 22009184 */  lh         $s1, 0x22($a0)
/* 53F4C 8006374C 24009284 */  lh         $s2, 0x24($a0)
/* 53F50 80063750 7469010C */  jal        STREAM_WhichUnitPointerIsIn
/* 53F54 80063754 00000000 */   nop
/* 53F58 80063758 21206002 */  addu       $a0, $s3, $zero
/* 53F5C 8006375C 0000428C */  lw         $v0, 0x0($v0)
/* 53F60 80063760 21280002 */  addu       $a1, $s0, $zero
/* 53F64 80063764 21302002 */  addu       $a2, $s1, $zero
/* 53F68 80063768 21384002 */  addu       $a3, $s2, $zero
/* 53F6C 8006376C 9B88010C */  jal        EVENT_ChangeOperandVector3d
/* 53F70 80063770 1000A2AF */   sw        $v0, 0x10($sp)
/* 53F74 80063774 F98D0108 */  j          .L800637E4
/* 53F78 80063778 01000224 */   addiu     $v0, $zero, 0x1
jlabel .L8006377C
/* 53F7C 8006377C 1800E294 */  lhu        $v0, 0x18($a3)
/* 53F80 80063780 21206002 */  addu       $a0, $s3, $zero
/* 53F84 80063784 1800A2A7 */  sh         $v0, 0x18($sp)
/* 53F88 80063788 1A00E294 */  lhu        $v0, 0x1A($a3)
/* 53F8C 8006378C 1800A527 */  addiu      $a1, $sp, 0x18
/* 53F90 80063790 1A00A2A7 */  sh         $v0, 0x1A($sp)
/* 53F94 80063794 1C00E394 */  lhu        $v1, 0x1C($a3)
/* 53F98 80063798 00020224 */  addiu      $v0, $zero, 0x200
/* 53F9C 8006379C 2000A2A7 */  sh         $v0, 0x20($sp)
/* 53FA0 800637A0 2400A2A7 */  sh         $v0, 0x24($sp)
/* 53FA4 800637A4 2200A2A7 */  sh         $v0, 0x22($sp)
/* 53FA8 800637A8 C588010C */  jal        EVENT_ChangeOperandRotation3d
/* 53FAC 800637AC 1C00A3A7 */   sh        $v1, 0x1C($sp)
/* 53FB0 800637B0 F98D0108 */  j          .L800637E4
/* 53FB4 800637B4 01000224 */   addiu     $v0, $zero, 0x1
jlabel .L800637B8
/* 53FB8 800637B8 21206002 */  addu       $a0, $s3, $zero
/* 53FBC 800637BC 21280000 */  addu       $a1, $zero, $zero
/* 53FC0 800637C0 9588010C */  jal        EVENT_ChangeOperandToNumber
/* 53FC4 800637C4 2130A000 */   addu      $a2, $a1, $zero
/* 53FC8 800637C8 F98D0108 */  j          .L800637E4
/* 53FCC 800637CC 01000224 */   addiu     $v0, $zero, 0x1
jlabel .L800637D0
/* 53FD0 800637D0 F88D0108 */  j          .L800637E0
/* 53FD4 800637D4 080066AE */   sw        $a2, 0x8($s3)
jlabel .L800637D8
/* 53FD8 800637D8 01000224 */  addiu      $v0, $zero, 0x1
/* 53FDC 800637DC 58A482A7 */  sh         $v0, %gp_rel(EventAbortLine)($gp)
.L800637E0:
/* 53FE0 800637E0 01000224 */  addiu      $v0, $zero, 0x1
.L800637E4:
/* 53FE4 800637E4 4000BF8F */  lw         $ra, 0x40($sp)
/* 53FE8 800637E8 3C00B38F */  lw         $s3, 0x3C($sp)
/* 53FEC 800637EC 3800B28F */  lw         $s2, 0x38($sp)
/* 53FF0 800637F0 3400B18F */  lw         $s1, 0x34($sp)
/* 53FF4 800637F4 3000B08F */  lw         $s0, 0x30($sp)
/* 53FF8 800637F8 0800E003 */  jr         $ra
/* 53FFC 800637FC 4800BD27 */   addiu     $sp, $sp, 0x48
.size EVENT_TransformIntroAttribute, . - EVENT_TransformIntroAttribute
