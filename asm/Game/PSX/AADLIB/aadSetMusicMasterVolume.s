.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadSetMusicMasterVolume
/* 42664 80051E64 D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 42668 80051E68 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 4266C 80051E6C 1400BFAF */  sw         $ra, 0x14($sp)
/* 42670 80051E70 1000B0AF */  sw         $s0, 0x10($sp)
/* 42674 80051E74 0400438C */  lw         $v1, 0x4($v0)
/* 42678 80051E78 21800000 */  addu       $s0, $zero, $zero
/* 4267C 80051E7C 0E006018 */  blez       $v1, .L80051EB8
/* 42680 80051E80 200044AC */   sw        $a0, 0x20($v0)
.L80051E84:
/* 42684 80051E84 D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 42688 80051E88 80181000 */  sll        $v1, $s0, 2
/* 4268C 80051E8C 21104300 */  addu       $v0, $v0, $v1
/* 42690 80051E90 3400448C */  lw         $a0, 0x34($v0)
/* 42694 80051E94 E955010C */  jal        aadUpdateSlotVolPan
/* 42698 80051E98 01001026 */   addiu     $s0, $s0, 0x1
/* 4269C 80051E9C D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 426A0 80051EA0 00000000 */  nop
/* 426A4 80051EA4 0400428C */  lw         $v0, 0x4($v0)
/* 426A8 80051EA8 00000000 */  nop
/* 426AC 80051EAC 2A100202 */  slt        $v0, $s0, $v0
/* 426B0 80051EB0 F4FF4014 */  bnez       $v0, .L80051E84
/* 426B4 80051EB4 00000000 */   nop
.L80051EB8:
/* 426B8 80051EB8 1400BF8F */  lw         $ra, 0x14($sp)
/* 426BC 80051EBC 1000B08F */  lw         $s0, 0x10($sp)
/* 426C0 80051EC0 0800E003 */  jr         $ra
/* 426C4 80051EC4 1800BD27 */   addiu     $sp, $sp, 0x18
.size aadSetMusicMasterVolume, . - aadSetMusicMasterVolume
