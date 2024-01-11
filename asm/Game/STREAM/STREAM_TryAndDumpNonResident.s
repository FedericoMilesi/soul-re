.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_TryAndDumpNonResident
/* 50634 8005FE34 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 50638 8005FE38 1800B2AF */  sw         $s2, 0x18($sp)
/* 5063C 8005FE3C 21908000 */  addu       $s2, $a0, $zero
/* 50640 8005FE40 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 50644 8005FE44 1400B1AF */  sw         $s1, 0x14($sp)
/* 50648 8005FE48 1000B0AF */  sw         $s0, 0x10($sp)
/* 5064C 8005FE4C 14004386 */  lh         $v1, 0x14($s2)
/* 50650 8005FE50 02000224 */  addiu      $v0, $zero, 0x2
/* 50654 8005FE54 44006214 */  bne        $v1, $v0, .L8005FF68
/* 50658 8005FE58 21100000 */   addu      $v0, $zero, $zero
/* 5065C 8005FE5C 1000428E */  lw         $v0, 0x10($s2)
/* 50660 8005FE60 00000000 */  nop
/* 50664 8005FE64 0000428C */  lw         $v0, 0x0($v0)
/* 50668 8005FE68 0002033C */  lui        $v1, (0x2000000 >> 16)
/* 5066C 8005FE6C 24104300 */  and        $v0, $v0, $v1
/* 50670 8005FE70 3D004014 */  bnez       $v0, .L8005FF68
/* 50674 8005FE74 21100000 */   addu      $v0, $zero, $zero
/* 50678 8005FE78 2665010C */  jal        STREAM_IsObjectInAnyUnit
/* 5067C 8005FE7C 21204002 */   addu      $a0, $s2, $zero
/* 50680 8005FE80 39004014 */  bnez       $v0, .L8005FF68
/* 50684 8005FE84 21100000 */   addu      $v0, $zero, $zero
/* 50688 8005FE88 FCBD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x34)($gp)
/* 5068C 8005FE8C 00000000 */  nop
/* 50690 8005FE90 0400508C */  lw         $s0, 0x4($v0)
/* 50694 8005FE94 00000000 */  nop
/* 50698 8005FE98 16000012 */  beqz       $s0, .L8005FEF4
/* 5069C 8005FE9C 00000000 */   nop
/* 506A0 8005FEA0 1000448E */  lw         $a0, 0x10($s2)
/* 506A4 8005FEA4 0800053C */  lui        $a1, (0x80000 >> 16)
.L8005FEA8:
/* 506A8 8005FEA8 1C00038E */  lw         $v1, 0x1C($s0)
/* 506AC 8005FEAC 0800118E */  lw         $s1, 0x8($s0)
/* 506B0 8005FEB0 0A006414 */  bne        $v1, $a0, .L8005FEDC
/* 506B4 8005FEB4 00000000 */   nop
/* 506B8 8005FEB8 4801028E */  lw         $v0, 0x148($s0)
/* 506BC 8005FEBC 00000000 */  nop
/* 506C0 8005FEC0 07004010 */  beqz       $v0, .L8005FEE0
/* 506C4 8005FEC4 21802002 */   addu      $s0, $s1, $zero
/* 506C8 8005FEC8 2C00628C */  lw         $v0, 0x2C($v1)
/* 506CC 8005FECC 00000000 */  nop
/* 506D0 8005FED0 24104500 */  and        $v0, $v0, $a1
/* 506D4 8005FED4 24004010 */  beqz       $v0, .L8005FF68
/* 506D8 8005FED8 21100000 */   addu      $v0, $zero, $zero
.L8005FEDC:
/* 506DC 8005FEDC 21802002 */  addu       $s0, $s1, $zero
.L8005FEE0:
/* 506E0 8005FEE0 F1FF0016 */  bnez       $s0, .L8005FEA8
/* 506E4 8005FEE4 00000000 */   nop
/* 506E8 8005FEE8 FCBD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x34)($gp)
/* 506EC 8005FEEC 00000000 */  nop
/* 506F0 8005FEF0 0400508C */  lw         $s0, 0x4($v0)
.L8005FEF4:
/* 506F4 8005FEF4 00000000 */  nop
/* 506F8 8005FEF8 16000012 */  beqz       $s0, .L8005FF54
/* 506FC 8005FEFC 00000000 */   nop
.L8005FF00:
/* 50700 8005FF00 1C00038E */  lw         $v1, 0x1C($s0)
/* 50704 8005FF04 1000428E */  lw         $v0, 0x10($s2)
/* 50708 8005FF08 0800118E */  lw         $s1, 0x8($s0)
/* 5070C 8005FF0C 0E006214 */  bne        $v1, $v0, .L8005FF48
/* 50710 8005FF10 00000000 */   nop
/* 50714 8005FF14 B8D8020C */  jal        SAVE_DeleteInstance
/* 50718 8005FF18 21200002 */   addu      $a0, $s0, $zero
/* 5071C 8005FF1C 4C01028E */  lw         $v0, 0x14C($s0)
/* 50720 8005FF20 00000000 */  nop
/* 50724 8005FF24 04004010 */  beqz       $v0, .L8005FF38
/* 50728 8005FF28 00000000 */   nop
/* 5072C 8005FF2C 00D6000C */  jal        INSTANCE_ReallyRemoveAllChildren
/* 50730 8005FF30 21200002 */   addu      $a0, $s0, $zero
/* 50734 8005FF34 0800118E */  lw         $s1, 0x8($s0)
.L8005FF38:
/* 50738 8005FF38 FCBD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x34)($gp)
/* 5073C 8005FF3C 21280002 */  addu       $a1, $s0, $zero
/* 50740 8005FF40 14CA000C */  jal        INSTANCE_ReallyRemoveInstance
/* 50744 8005FF44 21300000 */   addu      $a2, $zero, $zero
.L8005FF48:
/* 50748 8005FF48 21802002 */  addu       $s0, $s1, $zero
/* 5074C 8005FF4C ECFF0016 */  bnez       $s0, .L8005FF00
/* 50750 8005FF50 00000000 */   nop
.L8005FF54:
/* 50754 8005FF54 5665010C */  jal        STREAM_RemoveAllObjectsNotInUse
/* 50758 8005FF58 00000000 */   nop
/* 5075C 8005FF5C 14004286 */  lh         $v0, 0x14($s2)
/* 50760 8005FF60 00000000 */  nop
/* 50764 8005FF64 0100422C */  sltiu      $v0, $v0, 0x1
.L8005FF68:
/* 50768 8005FF68 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 5076C 8005FF6C 1800B28F */  lw         $s2, 0x18($sp)
/* 50770 8005FF70 1400B18F */  lw         $s1, 0x14($sp)
/* 50774 8005FF74 1000B08F */  lw         $s0, 0x10($sp)
/* 50778 8005FF78 0800E003 */  jr         $ra
/* 5077C 8005FF7C 2000BD27 */   addiu     $sp, $sp, 0x20
.size STREAM_TryAndDumpNonResident, . - STREAM_TryAndDumpNonResident
