.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_CreateNewFocuspoint
/* 57D0 80014FD0 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 57D4 80014FD4 1800B0AF */  sw         $s0, 0x18($sp)
/* 57D8 80014FD8 21808000 */  addu       $s0, $a0, $zero
/* 57DC 80014FDC 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 57E0 80014FE0 98011126 */  addiu      $s1, $s0, 0x198
/* 57E4 80014FE4 21202002 */  addu       $a0, $s1, $zero
/* 57E8 80014FE8 21280002 */  addu       $a1, $s0, $zero
/* 57EC 80014FEC 2000BFAF */  sw         $ra, 0x20($sp)
/* 57F0 80014FF0 B2040296 */  lhu        $v0, 0x4B2($s0)
/* 57F4 80014FF4 06010786 */  lh         $a3, 0x106($s0)
/* 57F8 80014FF8 3C010626 */  addiu      $a2, $s0, 0x13C
/* 57FC 80014FFC 6F5A000C */  jal        CAMERA_CalcPosition
/* 5800 80015000 3C0102A6 */   sh        $v0, 0x13C($s0)
/* 5804 80015004 00000396 */  lhu        $v1, 0x0($s0)
/* 5808 80015008 02000496 */  lhu        $a0, 0x2($s0)
/* 580C 8001500C 04000596 */  lhu        $a1, 0x4($s0)
/* 5810 80015010 98010296 */  lhu        $v0, 0x198($s0)
/* 5814 80015014 02002696 */  lhu        $a2, 0x2($s1)
/* 5818 80015018 04002796 */  lhu        $a3, 0x4($s1)
/* 581C 8001501C 23186200 */  subu       $v1, $v1, $v0
/* 5820 80015020 1000A227 */  addiu      $v0, $sp, 0x10
/* 5824 80015024 23208600 */  subu       $a0, $a0, $a2
/* 5828 80015028 2328A700 */  subu       $a1, $a1, $a3
/* 582C 8001502C 1000A3A7 */  sh         $v1, 0x10($sp)
/* 5830 80015030 020044A4 */  sh         $a0, 0x2($v0)
/* 5834 80015034 040045A4 */  sh         $a1, 0x4($v0)
/* 5838 80015038 00000296 */  lhu        $v0, 0x0($s0)
/* 583C 8001503C 00010626 */  addiu      $a2, $s0, 0x100
/* 5840 80015040 21104300 */  addu       $v0, $v0, $v1
/* 5844 80015044 000102A6 */  sh         $v0, 0x100($s0)
/* 5848 80015048 02000296 */  lhu        $v0, 0x2($s0)
/* 584C 8001504C 04000396 */  lhu        $v1, 0x4($s0)
/* 5850 80015050 21104400 */  addu       $v0, $v0, $a0
/* 5854 80015054 21186500 */  addu       $v1, $v1, $a1
/* 5858 80015058 0200C2A4 */  sh         $v0, 0x2($a2)
/* 585C 8001505C 0400C3A4 */  sh         $v1, 0x4($a2)
/* 5860 80015060 2000BF8F */  lw         $ra, 0x20($sp)
/* 5864 80015064 1C00B18F */  lw         $s1, 0x1C($sp)
/* 5868 80015068 1800B08F */  lw         $s0, 0x18($sp)
/* 586C 8001506C 0800E003 */  jr         $ra
/* 5870 80015070 2800BD27 */   addiu     $sp, $sp, 0x28
.size CAMERA_CreateNewFocuspoint, . - CAMERA_CreateNewFocuspoint
