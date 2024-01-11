.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_Adjust
/* 77B8 80016FB8 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 77BC 80016FBC 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 77C0 80016FC0 21888000 */  addu       $s1, $a0, $zero
/* 77C4 80016FC4 2400BFAF */  sw         $ra, 0x24($sp)
/* 77C8 80016FC8 2000B2AF */  sw         $s2, 0x20($sp)
/* 77CC 80016FCC 1800B0AF */  sw         $s0, 0x18($sp)
/* 77D0 80016FD0 C801308E */  lw         $s0, 0x1C8($s1)
/* 77D4 80016FD4 00000000 */  nop
/* 77D8 80016FD8 21000012 */  beqz       $s0, .L80017060
/* 77DC 80016FDC 2190A000 */   addu      $s2, $a1, $zero
/* 77E0 80016FE0 01004232 */  andi       $v0, $s2, 0x1
/* 77E4 80016FE4 12004010 */  beqz       $v0, .L80017030
/* 77E8 80016FE8 1000A427 */   addiu     $a0, $sp, 0x10
/* 77EC 80016FEC 10000726 */  addiu      $a3, $s0, 0x10
/* 77F0 80016FF0 00000296 */  lhu        $v0, 0x0($s0)
/* 77F4 80016FF4 02000396 */  lhu        $v1, 0x2($s0)
/* 77F8 80016FF8 04000596 */  lhu        $a1, 0x4($s0)
/* 77FC 80016FFC 10000696 */  lhu        $a2, 0x10($s0)
/* 7800 80017000 0200E894 */  lhu        $t0, 0x2($a3)
/* 7804 80017004 0400E794 */  lhu        $a3, 0x4($a3)
/* 7808 80017008 23104600 */  subu       $v0, $v0, $a2
/* 780C 8001700C 23186800 */  subu       $v1, $v1, $t0
/* 7810 80017010 2328A700 */  subu       $a1, $a1, $a3
/* 7814 80017014 1000A2A7 */  sh         $v0, 0x10($sp)
/* 7818 80017018 020083A4 */  sh         $v1, 0x2($a0)
/* 781C 8001701C 9C58000C */  jal        CAMERA_LengthSVector
/* 7820 80017020 040085A4 */   sh        $a1, 0x4($a0)
/* 7824 80017024 21202002 */  addu       $a0, $s1, $zero
/* 7828 80017028 8D5B000C */  jal        CAMERA_Adjust_distance
/* 782C 8001702C 21284000 */   addu      $a1, $v0, $zero
.L80017030:
/* 7830 80017030 02004232 */  andi       $v0, $s2, 0x2
/* 7834 80017034 05004010 */  beqz       $v0, .L8001704C
/* 7838 80017038 04004232 */   andi      $v0, $s2, 0x4
/* 783C 8001703C 08000586 */  lh         $a1, 0x8($s0)
/* 7840 80017040 7E5B000C */  jal        CAMERA_Adjust_tilt
/* 7844 80017044 21202002 */   addu      $a0, $s1, $zero
/* 7848 80017048 04004232 */  andi       $v0, $s2, 0x4
.L8001704C:
/* 784C 8001704C 04004010 */  beqz       $v0, .L80017060
/* 7850 80017050 00000000 */   nop
/* 7854 80017054 0C000586 */  lh         $a1, 0xC($s0)
/* 7858 80017058 AC5B000C */  jal        CAMERA_Adjust_rotation
/* 785C 8001705C 21202002 */   addu      $a0, $s1, $zero
.L80017060:
/* 7860 80017060 2400BF8F */  lw         $ra, 0x24($sp)
/* 7864 80017064 2000B28F */  lw         $s2, 0x20($sp)
/* 7868 80017068 1C00B18F */  lw         $s1, 0x1C($sp)
/* 786C 8001706C 1800B08F */  lw         $s0, 0x18($sp)
/* 7870 80017070 0800E003 */  jr         $ra
/* 7874 80017074 2800BD27 */   addiu     $sp, $sp, 0x28
.size CAMERA_Adjust, . - CAMERA_Adjust
