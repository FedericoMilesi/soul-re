.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_CleanUp
/* 7D730 8008CF30 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 7D734 8008CF34 1800B2AF */  sw         $s2, 0x18($sp)
/* 7D738 8008CF38 21908000 */  addu       $s2, $a0, $zero
/* 7D73C 8008CF3C 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 7D740 8008CF40 1400B1AF */  sw         $s1, 0x14($sp)
/* 7D744 8008CF44 1000B0AF */  sw         $s0, 0x10($sp)
/* 7D748 8008CF48 6C01508E */  lw         $s0, 0x16C($s2)
/* 7D74C 8008CF4C 2400518E */  lw         $s1, 0x24($s2)
/* 7D750 8008CF50 8209020C */  jal        MON_DropAllObjects
/* 7D754 8008CF54 00000000 */   nop
/* 7D758 8008CF58 4801428E */  lw         $v0, 0x148($s2)
/* 7D75C 8008CF5C 00000000 */  nop
/* 7D760 8008CF60 03004010 */  beqz       $v0, .L8008CF70
/* 7D764 8008CF64 00000000 */   nop
/* 7D768 8008CF68 9210020C */  jal        MON_UnlinkFromRaziel
/* 7D76C 8008CF6C 21204002 */   addu      $a0, $s2, $zero
.L8008CF70:
/* 7D770 8008CF70 58010392 */  lbu        $v1, 0x158($s0)
/* 7D774 8008CF74 03000224 */  addiu      $v0, $zero, 0x3
/* 7D778 8008CF78 08006214 */  bne        $v1, $v0, .L8008CF9C
/* 7D77C 8008CF7C 00000000 */   nop
/* 7D780 8008CF80 DC00048E */  lw         $a0, 0xDC($s0)
/* 7D784 8008CF84 00000000 */  nop
/* 7D788 8008CF88 04008010 */  beqz       $a0, .L8008CF9C
/* 7D78C 8008CF8C 00000000 */   nop
/* 7D790 8008CF90 1C02010C */  jal        SndEndLoop
/* 7D794 8008CF94 00000000 */   nop
/* 7D798 8008CF98 DC0000AE */  sw         $zero, 0xDC($s0)
.L8008CF9C:
/* 7D79C 8008CF9C 66010482 */  lb         $a0, 0x166($s0)
/* 7D7A0 8008CFA0 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 7D7A4 8008CFA4 03008210 */  beq        $a0, $v0, .L8008CFB4
/* 7D7A8 8008CFA8 00000000 */   nop
/* 7D7AC 8008CFAC E859020C */  jal        ENMYPLAN_ReleasePlanningWorkspace
/* 7D7B0 8008CFB0 00000000 */   nop
.L8008CFB4:
/* 7D7B4 8008CFB4 1A002292 */  lbu        $v0, 0x1A($s1)
/* 7D7B8 8008CFB8 00000000 */  nop
/* 7D7BC 8008CFBC 04004010 */  beqz       $v0, .L8008CFD0
/* 7D7C0 8008CFC0 C8014426 */   addiu     $a0, $s2, 0x1C8
/* 7D7C4 8008CFC4 21284000 */  addu       $a1, $v0, $zero
/* 7D7C8 8008CFC8 2441020C */  jal        G2Anim_DetachControllerFromSeg
/* 7D7CC 8008CFCC 0E000624 */   addiu     $a2, $zero, 0xE
.L8008CFD0:
/* 7D7D0 8008CFD0 22002392 */  lbu        $v1, 0x22($s1)
/* 7D7D4 8008CFD4 00000000 */  nop
/* 7D7D8 8008CFD8 09006010 */  beqz       $v1, .L8008D000
/* 7D7DC 8008CFDC 21204002 */   addu      $a0, $s2, $zero
/* 7D7E0 8008CFE0 1A002292 */  lbu        $v0, 0x1A($s1)
/* 7D7E4 8008CFE4 00000000 */  nop
/* 7D7E8 8008CFE8 04006210 */  beq        $v1, $v0, .L8008CFFC
/* 7D7EC 8008CFEC C8014426 */   addiu     $a0, $s2, 0x1C8
/* 7D7F0 8008CFF0 21286000 */  addu       $a1, $v1, $zero
/* 7D7F4 8008CFF4 2441020C */  jal        G2Anim_DetachControllerFromSeg
/* 7D7F8 8008CFF8 0E000624 */   addiu     $a2, $zero, 0xE
.L8008CFFC:
/* 7D7FC 8008CFFC 21204002 */  addu       $a0, $s2, $zero
.L8008D000:
/* 7D800 8008D000 92D1000C */  jal        INSTANCE_Query
/* 7D804 8008D004 01000524 */   addiu     $a1, $zero, 0x1
/* 7D808 8008D008 00C04230 */  andi       $v0, $v0, 0xC000
/* 7D80C 8008D00C 07004010 */  beqz       $v0, .L8008D02C
/* 7D810 8008D010 00000000 */   nop
/* 7D814 8008D014 40A8838F */  lw         $v1, %gp_rel(GlobalSave)($gp)
/* 7D818 8008D018 00000000 */  nop
/* 7D81C 8008D01C 0C006294 */  lhu        $v0, 0xC($v1)
/* 7D820 8008D020 00000000 */  nop
/* 7D824 8008D024 01004224 */  addiu      $v0, $v0, 0x1
/* 7D828 8008D028 0C0062A4 */  sh         $v0, 0xC($v1)
.L8008D02C:
/* 7D82C 8008D02C 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 7D830 8008D030 1800B28F */  lw         $s2, 0x18($sp)
/* 7D834 8008D034 1400B18F */  lw         $s1, 0x14($sp)
/* 7D838 8008D038 1000B08F */  lw         $s0, 0x10($sp)
/* 7D83C 8008D03C 0800E003 */  jr         $ra
/* 7D840 8008D040 2000BD27 */   addiu     $sp, $sp, 0x20
.size MON_CleanUp, . - MON_CleanUp
