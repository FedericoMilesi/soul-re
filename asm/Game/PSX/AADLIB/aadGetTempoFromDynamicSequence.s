.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadGetTempoFromDynamicSequence
/* 44ECC 800546CC D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 44ED0 800546D0 80200400 */  sll        $a0, $a0, 2
/* 44ED4 800546D4 21204400 */  addu       $a0, $v0, $a0
/* 44ED8 800546D8 0005838C */  lw         $v1, 0x500($a0)
/* 44EDC 800546DC 02000224 */  addiu      $v0, $zero, 0x2
/* 44EE0 800546E0 0C006214 */  bne        $v1, $v0, .L80054714
/* 44EE4 800546E4 04104500 */   sllv      $v0, $a1, $v0
/* 44EE8 800546E8 F004838C */  lw         $v1, 0x4F0($a0)
/* 44EEC 800546EC 00000000 */  nop
/* 44EF0 800546F0 21104300 */  addu       $v0, $v0, $v1
/* 44EF4 800546F4 0000438C */  lw         $v1, 0x0($v0)
/* 44EF8 800546F8 00000000 */  nop
/* 44EFC 800546FC 0400628C */  lw         $v0, 0x4($v1)
/* 44F00 80054700 00000000 */  nop
/* 44F04 80054704 0000C2AC */  sw         $v0, 0x0($a2)
/* 44F08 80054708 08006294 */  lhu        $v0, 0x8($v1)
/* 44F0C 8005470C 00000000 */  nop
/* 44F10 80054710 0400C2AC */  sw         $v0, 0x4($a2)
.L80054714:
/* 44F14 80054714 0800E003 */  jr         $ra
/* 44F18 80054718 2110C000 */   addu      $v0, $a2, $zero
.size aadGetTempoFromDynamicSequence, . - aadGetTempoFromDynamicSequence
