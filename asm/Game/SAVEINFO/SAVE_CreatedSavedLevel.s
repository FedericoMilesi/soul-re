.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SAVE_CreatedSavedLevel
/* A6664 800B5E64 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* A6668 800B5E68 1C00B3AF */  sw         $s3, 0x1C($sp)
/* A666C 800B5E6C 21988000 */  addu       $s3, $a0, $zero
/* A6670 800B5E70 1800B2AF */  sw         $s2, 0x18($sp)
/* A6674 800B5E74 2190A000 */  addu       $s2, $a1, $zero
/* A6678 800B5E78 1000B0AF */  sw         $s0, 0x10($sp)
/* A667C 800B5E7C 21800000 */  addu       $s0, $zero, $zero
/* A6680 800B5E80 2400BFAF */  sw         $ra, 0x24($sp)
/* A6684 800B5E84 2000B4AF */  sw         $s4, 0x20($sp)
/* A6688 800B5E88 1400B1AF */  sw         $s1, 0x14($sp)
/* A668C 800B5E8C 0000428E */  lw         $v0, 0x0($s2)
/* A6690 800B5E90 00000000 */  nop
/* A6694 800B5E94 00004494 */  lhu        $a0, 0x0($v0)
/* A6698 800B5E98 4800428C */  lw         $v0, 0x48($v0)
/* A669C 800B5E9C 01008330 */  andi       $v1, $a0, 0x1
/* A66A0 800B5EA0 10005484 */  lh         $s4, 0x10($v0)
/* A66A4 800B5EA4 04006014 */  bnez       $v1, .L800B5EB8
/* A66A8 800B5EA8 21280002 */   addu      $a1, $s0, $zero
/* A66AC 800B5EAC 02008230 */  andi       $v0, $a0, 0x2
/* A66B0 800B5EB0 02004010 */  beqz       $v0, .L800B5EBC
/* A66B4 800B5EB4 00000000 */   nop
.L800B5EB8:
/* A66B8 800B5EB8 01000524 */  addiu      $a1, $zero, 0x1
.L800B5EBC:
/* A66BC 800B5EBC 4800A010 */  beqz       $a1, .L800B5FE0
/* A66C0 800B5EC0 00000000 */   nop
/* A66C4 800B5EC4 0000428E */  lw         $v0, 0x0($s2)
/* A66C8 800B5EC8 00000000 */  nop
/* A66CC 800B5ECC 4400428C */  lw         $v0, 0x44($v0)
/* A66D0 800B5ED0 00000000 */  nop
/* A66D4 800B5ED4 FEFF5124 */  addiu      $s1, $v0, -0x2
/* A66D8 800B5ED8 4900201A */  blez       $s1, .L800B6000
/* A66DC 800B5EDC 21100002 */   addu      $v0, $s0, $zero
/* A66E0 800B5EE0 2DD7020C */  jal        SAVE_HasSavedLevel
/* A66E4 800B5EE4 21206002 */   addu      $a0, $s3, $zero
/* A66E8 800B5EE8 21804000 */  addu       $s0, $v0, $zero
/* A66EC 800B5EEC 06000016 */  bnez       $s0, .L800B5F08
/* A66F0 800B5EF0 03000424 */   addiu     $a0, $zero, 0x3
/* A66F4 800B5EF4 E1D4020C */  jal        SAVE_GetSavedBlock
/* A66F8 800B5EF8 04289100 */   sllv      $a1, $s1, $a0
/* A66FC 800B5EFC 21804000 */  addu       $s0, $v0, $zero
/* A6700 800B5F00 3F000012 */  beqz       $s0, .L800B6000
/* A6704 800B5F04 21100002 */   addu      $v0, $s0, $zero
.L800B5F08:
/* A6708 800B5F08 020013A6 */  sh         $s3, 0x2($s0)
/* A670C 800B5F0C 3800438E */  lw         $v1, 0x38($s2)
/* A6710 800B5F10 01800224 */  addiu      $v0, $zero, -0x7FFF
/* A6714 800B5F14 09006210 */  beq        $v1, $v0, .L800B5F3C
/* A6718 800B5F18 21200002 */   addu      $a0, $s0, $zero
/* A671C 800B5F1C FF7F0224 */  addiu      $v0, $zero, 0x7FFF
/* A6720 800B5F20 06006210 */  beq        $v1, $v0, .L800B5F3C
/* A6724 800B5F24 00000000 */   nop
/* A6728 800B5F28 38004296 */  lhu        $v0, 0x38($s2)
/* A672C 800B5F2C 00000000 */  nop
/* A6730 800B5F30 23105400 */  subu       $v0, $v0, $s4
/* A6734 800B5F34 D2D70208 */  j          .L800B5F48
/* A6738 800B5F38 040002A6 */   sh        $v0, 0x4($s0)
.L800B5F3C:
/* A673C 800B5F3C 38004296 */  lhu        $v0, 0x38($s2)
/* A6740 800B5F40 00000000 */  nop
/* A6744 800B5F44 040082A4 */  sh         $v0, 0x4($a0)
.L800B5F48:
/* A6748 800B5F48 060091A4 */  sh         $s1, 0x6($a0)
/* A674C 800B5F4C 0000438E */  lw         $v1, 0x0($s2)
/* A6750 800B5F50 00000000 */  nop
/* A6754 800B5F54 4400628C */  lw         $v0, 0x44($v1)
/* A6758 800B5F58 00000000 */  nop
/* A675C 800B5F5C 27004018 */  blez       $v0, .L800B5FFC
/* A6760 800B5F60 21280000 */   addu      $a1, $zero, $zero
/* A6764 800B5F64 2130A000 */  addu       $a2, $a1, $zero
.L800B5F68:
/* A6768 800B5F68 4800628C */  lw         $v0, 0x48($v1)
/* A676C 800B5F6C 00000000 */  nop
/* A6770 800B5F70 21184600 */  addu       $v1, $v0, $a2
/* A6774 800B5F74 1A006294 */  lhu        $v0, 0x1A($v1)
/* A6778 800B5F78 00000000 */  nop
/* A677C 800B5F7C 01004224 */  addiu      $v0, $v0, 0x1
/* A6780 800B5F80 FFFF4230 */  andi       $v0, $v0, 0xFFFF
/* A6784 800B5F84 0200422C */  sltiu      $v0, $v0, 0x2
/* A6788 800B5F88 0C004014 */  bnez       $v0, .L800B5FBC
/* A678C 800B5F8C 00000000 */   nop
/* A6790 800B5F90 0F0085A0 */  sb         $a1, 0xF($a0)
/* A6794 800B5F94 17006788 */  lwl        $a3, 0x17($v1)
/* A6798 800B5F98 14006798 */  lwr        $a3, 0x14($v1)
/* A679C 800B5F9C 18006884 */  lh         $t0, 0x18($v1)
/* A67A0 800B5FA0 0B0087A8 */  swl        $a3, 0xB($a0)
/* A67A4 800B5FA4 080087B8 */  swr        $a3, 0x8($a0)
/* A67A8 800B5FA8 0C0088A4 */  sh         $t0, 0xC($a0)
/* A67AC 800B5FAC 12006290 */  lbu        $v0, 0x12($v1)
/* A67B0 800B5FB0 00000000 */  nop
/* A67B4 800B5FB4 0E0082A0 */  sb         $v0, 0xE($a0)
/* A67B8 800B5FB8 08008424 */  addiu      $a0, $a0, 0x8
.L800B5FBC:
/* A67BC 800B5FBC 0000438E */  lw         $v1, 0x0($s2)
/* A67C0 800B5FC0 00000000 */  nop
/* A67C4 800B5FC4 4400628C */  lw         $v0, 0x44($v1)
/* A67C8 800B5FC8 0100A524 */  addiu      $a1, $a1, 0x1
/* A67CC 800B5FCC 2A10A200 */  slt        $v0, $a1, $v0
/* A67D0 800B5FD0 E5FF4014 */  bnez       $v0, .L800B5F68
/* A67D4 800B5FD4 2400C624 */   addiu     $a2, $a2, 0x24
/* A67D8 800B5FD8 00D80208 */  j          .L800B6000
/* A67DC 800B5FDC 21100002 */   addu      $v0, $s0, $zero
.L800B5FE0:
/* A67E0 800B5FE0 2DD7020C */  jal        SAVE_HasSavedLevel
/* A67E4 800B5FE4 21206002 */   addu      $a0, $s3, $zero
/* A67E8 800B5FE8 21804000 */  addu       $s0, $v0, $zero
/* A67EC 800B5FEC 04000012 */  beqz       $s0, .L800B6000
/* A67F0 800B5FF0 21100002 */   addu      $v0, $s0, $zero
/* A67F4 800B5FF4 08D8020C */  jal        SAVE_DeleteBlock
/* A67F8 800B5FF8 21200002 */   addu      $a0, $s0, $zero
.L800B5FFC:
/* A67FC 800B5FFC 21100002 */  addu       $v0, $s0, $zero
.L800B6000:
/* A6800 800B6000 2400BF8F */  lw         $ra, 0x24($sp)
/* A6804 800B6004 2000B48F */  lw         $s4, 0x20($sp)
/* A6808 800B6008 1C00B38F */  lw         $s3, 0x1C($sp)
/* A680C 800B600C 1800B28F */  lw         $s2, 0x18($sp)
/* A6810 800B6010 1400B18F */  lw         $s1, 0x14($sp)
/* A6814 800B6014 1000B08F */  lw         $s0, 0x10($sp)
/* A6818 800B6018 0800E003 */  jr         $ra
/* A681C 800B601C 2800BD27 */   addiu     $sp, $sp, 0x28
.size SAVE_CreatedSavedLevel, . - SAVE_CreatedSavedLevel
