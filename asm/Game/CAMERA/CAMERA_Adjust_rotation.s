.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_Adjust_rotation
/* 76B0 80016EB0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 76B4 80016EB4 1000B0AF */  sw         $s0, 0x10($sp)
/* 76B8 80016EB8 21808000 */  addu       $s0, $a0, $zero
/* 76BC 80016EBC 1400B1AF */  sw         $s1, 0x14($sp)
/* 76C0 80016EC0 2188A000 */  addu       $s1, $a1, $zero
/* 76C4 80016EC4 00241100 */  sll        $a0, $s1, 16
/* 76C8 80016EC8 1800BFAF */  sw         $ra, 0x18($sp)
/* 76CC 80016ECC B6010586 */  lh         $a1, 0x1B6($s0)
/* 76D0 80016ED0 BC59000C */  jal        CAMERA_AngleDifference
/* 76D4 80016ED4 03240400 */   sra       $a0, $a0, 16
/* 76D8 80016ED8 00140200 */  sll        $v0, $v0, 16
/* 76DC 80016EDC 10004010 */  beqz       $v0, .L80016F20
/* 76E0 80016EE0 03000224 */   addiu     $v0, $zero, 0x3
/* 76E4 80016EE4 F60002A6 */  sh         $v0, 0xF6($s0)
/* 76E8 80016EE8 C4010286 */  lh         $v0, 0x1C4($s0)
/* 76EC 80016EEC FF0F2432 */  andi       $a0, $s1, 0xFFF
/* 76F0 80016EF0 080400A6 */  sh         $zero, 0x408($s0)
/* 76F4 80016EF4 06004014 */  bnez       $v0, .L80016F10
/* 76F8 80016EF8 040404A6 */   sh        $a0, 0x404($s0)
/* 76FC 80016EFC 21108000 */  addu       $v0, $a0, $zero
/* 7700 80016F00 B60104A6 */  sh         $a0, 0x1B6($s0)
/* 7704 80016F04 400104A6 */  sh         $a0, 0x140($s0)
/* 7708 80016F08 880404A6 */  sh         $a0, 0x488($s0)
/* 770C 80016F0C C00102A6 */  sh         $v0, 0x1C0($s0)
.L80016F10:
/* 7710 80016F10 F4BE838F */  lw         $v1, %gp_rel(gameTrackerX + 0x12C)($gp)
/* 7714 80016F14 01000224 */  addiu      $v0, $zero, 0x1
/* 7718 80016F18 AE0402A6 */  sh         $v0, 0x4AE($s0)
/* 771C 80016F1C 100403AE */  sw         $v1, 0x410($s0)
.L80016F20:
/* 7720 80016F20 1800BF8F */  lw         $ra, 0x18($sp)
/* 7724 80016F24 1400B18F */  lw         $s1, 0x14($sp)
/* 7728 80016F28 1000B08F */  lw         $s0, 0x10($sp)
/* 772C 80016F2C 0800E003 */  jr         $ra
/* 7730 80016F30 2000BD27 */   addiu     $sp, $sp, 0x20
.size CAMERA_Adjust_rotation, . - CAMERA_Adjust_rotation
