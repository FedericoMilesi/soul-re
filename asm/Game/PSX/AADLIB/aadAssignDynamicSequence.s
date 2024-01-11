.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadAssignDynamicSequence
/* 44DF0 800545F0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 44DF4 800545F4 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 44DF8 800545F8 21888000 */  addu       $s1, $a0, $zero
/* 44DFC 800545FC 2400B3AF */  sw         $s3, 0x24($sp)
/* 44E00 80054600 2198A000 */  addu       $s3, $a1, $zero
/* 44E04 80054604 2000B2AF */  sw         $s2, 0x20($sp)
/* 44E08 80054608 D89B848F */  lw         $a0, %gp_rel(aadMem)($gp)
/* 44E0C 8005460C 80101100 */  sll        $v0, $s1, 2
/* 44E10 80054610 2800BFAF */  sw         $ra, 0x28($sp)
/* 44E14 80054614 1800B0AF */  sw         $s0, 0x18($sp)
/* 44E18 80054618 21108200 */  addu       $v0, $a0, $v0
/* 44E1C 8005461C 0005438C */  lw         $v1, 0x500($v0)
/* 44E20 80054620 02000224 */  addiu      $v0, $zero, 0x2
/* 44E24 80054624 03006210 */  beq        $v1, $v0, .L80054634
/* 44E28 80054628 2190C000 */   addu      $s2, $a2, $zero
/* 44E2C 8005462C AC510108 */  j          .L800546B0
/* 44E30 80054630 07100224 */   addiu     $v0, $zero, 0x1007
.L80054634:
/* 44E34 80054634 80101200 */  sll        $v0, $s2, 2
/* 44E38 80054638 21108200 */  addu       $v0, $a0, $v0
/* 44E3C 8005463C 3400508C */  lw         $s0, 0x34($v0)
/* 44E40 80054640 00000000 */  nop
/* 44E44 80054644 21200002 */  addu       $a0, $s0, $zero
/* 44E48 80054648 3E0513A2 */  sb         $s3, 0x53E($s0)
/* 44E4C 8005464C DE50010C */  jal        aadInitSequenceSlot
/* 44E50 80054650 5C0511AE */   sw        $s1, 0x55C($s0)
/* 44E54 80054654 AE52010C */  jal        aadAllNotesOff
/* 44E58 80054658 21204002 */   addu      $a0, $s2, $zero
/* 44E5C 8005465C 10000296 */  lhu        $v0, 0x10($s0)
/* 44E60 80054660 00000000 */  nop
/* 44E64 80054664 09004014 */  bnez       $v0, .L8005468C
/* 44E68 80054668 0F000324 */   addiu     $v1, $zero, 0xF
/* 44E6C 8005466C 21202002 */  addu       $a0, $s1, $zero
/* 44E70 80054670 21286002 */  addu       $a1, $s3, $zero
/* 44E74 80054674 B351010C */  jal        aadGetTempoFromDynamicSequence
/* 44E78 80054678 1000A627 */   addiu     $a2, $sp, 0x10
/* 44E7C 8005467C 21204002 */  addu       $a0, $s2, $zero
/* 44E80 80054680 C751010C */  jal        aadSetSlotTempo
/* 44E84 80054684 21284000 */   addu      $a1, $v0, $zero
/* 44E88 80054688 0F000324 */  addiu      $v1, $zero, 0xF
.L8005468C:
/* 44E8C 8005468C 21100302 */  addu       $v0, $s0, $v1
/* 44E90 80054690 420500A6 */  sh         $zero, 0x542($s0)
/* 44E94 80054694 4C0500A6 */  sh         $zero, 0x54C($s0)
/* 44E98 80054698 4E0500A6 */  sh         $zero, 0x54E($s0)
.L8005469C:
/* 44E9C 8005469C C00540A0 */  sb         $zero, 0x5C0($v0)
/* 44EA0 800546A0 FFFF6324 */  addiu      $v1, $v1, -0x1
/* 44EA4 800546A4 FDFF6104 */  bgez       $v1, .L8005469C
/* 44EA8 800546A8 FFFF4224 */   addiu     $v0, $v0, -0x1
/* 44EAC 800546AC 21100000 */  addu       $v0, $zero, $zero
.L800546B0:
/* 44EB0 800546B0 2800BF8F */  lw         $ra, 0x28($sp)
/* 44EB4 800546B4 2400B38F */  lw         $s3, 0x24($sp)
/* 44EB8 800546B8 2000B28F */  lw         $s2, 0x20($sp)
/* 44EBC 800546BC 1C00B18F */  lw         $s1, 0x1C($sp)
/* 44EC0 800546C0 1800B08F */  lw         $s0, 0x18($sp)
/* 44EC4 800546C4 0800E003 */  jr         $ra
/* 44EC8 800546C8 3000BD27 */   addiu     $sp, $sp, 0x30
.size aadAssignDynamicSequence, . - aadAssignDynamicSequence
