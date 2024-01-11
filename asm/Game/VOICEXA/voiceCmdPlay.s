.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel voiceCmdPlay
/* A7670 800B6E70 4CA9828F */  lw         $v0, %gp_rel(voiceList)($gp)
/* A7674 800B6E74 98FFBD27 */  addiu      $sp, $sp, -0x68
/* A7678 800B6E78 5800B2AF */  sw         $s2, 0x58($sp)
/* A767C 800B6E7C 21908000 */  addu       $s2, $a0, $zero
/* A7680 800B6E80 5400B1AF */  sw         $s1, 0x54($sp)
/* A7684 800B6E84 2188A000 */  addu       $s1, $a1, $zero
/* A7688 800B6E88 5C00B3AF */  sw         $s3, 0x5C($sp)
/* A768C 800B6E8C 21982002 */  addu       $s3, $s1, $zero
/* A7690 800B6E90 6000BFAF */  sw         $ra, 0x60($sp)
/* A7694 800B6E94 4B004010 */  beqz       $v0, .L800B6FC4
/* A7698 800B6E98 5000B0AF */   sw        $s0, 0x50($sp)
/* A769C 800B6E9C 09000524 */  addiu      $a1, $zero, 0x9
/* A76A0 800B6EA0 21300000 */  addu       $a2, $zero, $zero
/* A76A4 800B6EA4 2138C000 */  addu       $a3, $a2, $zero
/* A76A8 800B6EA8 008C1100 */  sll        $s1, $s1, 16
/* A76AC 800B6EAC 03851100 */  sra        $s0, $s1, 20
/* A76B0 800B6EB0 C38B1100 */  sra        $s1, $s1, 15
/* A76B4 800B6EB4 21885100 */  addu       $s1, $v0, $s1
/* A76B8 800B6EB8 AC0050A6 */  sh         $s0, 0xAC($s2)
/* A76BC 800B6EBC 80801000 */  sll        $s0, $s0, 2
/* A76C0 800B6EC0 B0001026 */  addiu      $s0, $s0, 0xB0
/* A76C4 800B6EC4 EBDA020C */  jal        putCdCommand
/* A76C8 800B6EC8 21805002 */   addu      $s0, $s2, $s0
/* A76CC 800B6ECC 21204002 */  addu       $a0, $s2, $zero
/* A76D0 800B6ED0 0D000524 */  addiu      $a1, $zero, 0xD
/* A76D4 800B6ED4 04000624 */  addiu      $a2, $zero, 0x4
/* A76D8 800B6ED8 1000A727 */  addiu      $a3, $sp, 0x10
/* A76DC 800B6EDC 01000224 */  addiu      $v0, $zero, 0x1
/* A76E0 800B6EE0 1000A2A3 */  sb         $v0, 0x10($sp)
/* A76E4 800B6EE4 0F006232 */  andi       $v0, $s3, 0xF
/* A76E8 800B6EE8 EBDA020C */  jal        putCdCommand
/* A76EC 800B6EEC 1100A2A3 */   sb        $v0, 0x11($sp)
/* A76F0 800B6EF0 21204002 */  addu       $a0, $s2, $zero
/* A76F4 800B6EF4 0E000524 */  addiu      $a1, $zero, 0xE
/* A76F8 800B6EF8 01000624 */  addiu      $a2, $zero, 0x1
/* A76FC 800B6EFC 4800A727 */  addiu      $a3, $sp, 0x48
/* A7700 800B6F00 C8000224 */  addiu      $v0, $zero, 0xC8
/* A7704 800B6F04 EBDA020C */  jal        putCdCommand
/* A7708 800B6F08 4800A2A3 */   sb        $v0, 0x48($sp)
/* A770C 800B6F0C 0000048E */  lw         $a0, 0x0($s0)
/* A7710 800B6F10 15FC020C */  jal        func_800BF054
/* A7714 800B6F14 21284002 */   addu      $a1, $s2, $zero
/* A7718 800B6F18 00002296 */  lhu        $v0, 0x0($s1)
/* A771C 800B6F1C 0000038E */  lw         $v1, 0x0($s0)
/* A7720 800B6F20 6AFF4224 */  addiu      $v0, $v0, -0x96
/* A7724 800B6F24 21186200 */  addu       $v1, $v1, $v0
/* A7728 800B6F28 080043AE */  sw         $v1, 0x8($s2)
/* A772C 800B6F2C 0000048E */  lw         $a0, 0x0($s0)
/* A7730 800B6F30 1800B027 */  addiu      $s0, $sp, 0x18
/* A7734 800B6F34 15FC020C */  jal        func_800BF054
/* A7738 800B6F38 21280002 */   addu      $a1, $s0, $zero
/* A773C 800B6F3C 21204002 */  addu       $a0, $s2, $zero
/* A7740 800B6F40 1B000524 */  addiu      $a1, $zero, 0x1B
/* A7744 800B6F44 04000624 */  addiu      $a2, $zero, 0x4
/* A7748 800B6F48 EBDA020C */  jal        putCdCommand
/* A774C 800B6F4C 21380002 */   addu      $a3, $s0, $zero
/* A7750 800B6F50 2000A427 */  addiu      $a0, $sp, 0x20
/* A7754 800B6F54 CF3F0224 */  addiu      $v0, $zero, 0x3FCF
/* A7758 800B6F58 2000A2AF */  sw         $v0, 0x20($sp)
/* A775C 800B6F5C FF3F0224 */  addiu      $v0, $zero, 0x3FFF
/* A7760 800B6F60 84BF8397 */  lhu        $v1, %gp_rel(gameTrackerX + 0x1BC)($gp)
/* A7764 800B6F64 01000524 */  addiu      $a1, $zero, 0x1
/* A7768 800B6F68 2400A2A7 */  sh         $v0, 0x24($sp)
/* A776C 800B6F6C 2600A2A7 */  sh         $v0, 0x26($sp)
/* A7770 800B6F70 FF7F0224 */  addiu      $v0, $zero, 0x7FFF
/* A7774 800B6F74 2800A0A7 */  sh         $zero, 0x28($sp)
/* A7778 800B6F78 2A00A0A7 */  sh         $zero, 0x2A($sp)
/* A777C 800B6F7C 3400A0AF */  sw         $zero, 0x34($sp)
/* A7780 800B6F80 3800A5AF */  sw         $a1, 0x38($sp)
/* A7784 800B6F84 3C00A2A7 */  sh         $v0, 0x3C($sp)
/* A7788 800B6F88 3E00A2A7 */  sh         $v0, 0x3E($sp)
/* A778C 800B6F8C 4000A0AF */  sw         $zero, 0x40($sp)
/* A7790 800B6F90 4400A5AF */  sw         $a1, 0x44($sp)
/* A7794 800B6F94 001A0300 */  sll        $v1, $v1, 8
/* A7798 800B6F98 3000A3A7 */  sh         $v1, 0x30($sp)
/* A779C 800B6F9C DD01030C */  jal        func_800C0774
/* A77A0 800B6FA0 3200A3A7 */   sh        $v1, 0x32($sp)
/* A77A4 800B6FA4 7CBF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x1B4)($gp)
/* A77A8 800B6FA8 00000000 */  nop
/* A77AC 800B6FAC 3D00422C */  sltiu      $v0, $v0, 0x3D
/* A77B0 800B6FB0 04004014 */  bnez       $v0, .L800B6FC4
/* A77B4 800B6FB4 3C000424 */   addiu     $a0, $zero, 0x3C
/* A77B8 800B6FB8 FFFF0524 */  addiu      $a1, $zero, -0x1
/* A77BC 800B6FBC B247010C */  jal        aadStartMusicMasterVolFade
/* A77C0 800B6FC0 21300000 */   addu      $a2, $zero, $zero
.L800B6FC4:
/* A77C4 800B6FC4 6000BF8F */  lw         $ra, 0x60($sp)
/* A77C8 800B6FC8 5C00B38F */  lw         $s3, 0x5C($sp)
/* A77CC 800B6FCC 5800B28F */  lw         $s2, 0x58($sp)
/* A77D0 800B6FD0 5400B18F */  lw         $s1, 0x54($sp)
/* A77D4 800B6FD4 5000B08F */  lw         $s0, 0x50($sp)
/* A77D8 800B6FD8 0800E003 */  jr         $ra
/* A77DC 800B6FDC 6800BD27 */   addiu     $sp, $sp, 0x68
.size voiceCmdPlay, . - voiceCmdPlay
