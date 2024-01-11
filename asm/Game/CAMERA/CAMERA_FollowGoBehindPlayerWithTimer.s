.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_FollowGoBehindPlayerWithTimer
/* D468 8001CC68 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* D46C 8001CC6C 1800B0AF */  sw         $s0, 0x18($sp)
/* D470 8001CC70 21808000 */  addu       $s0, $a0, $zero
/* D474 8001CC74 2000BFAF */  sw         $ra, 0x20($sp)
/* D478 8001CC78 1C00B1AF */  sw         $s1, 0x1C($sp)
/* D47C 8001CC7C 8004028E */  lw         $v0, 0x480($s0)
/* D480 8001CC80 0801118E */  lw         $s1, 0x108($s0)
/* D484 8001CC84 02004010 */  beqz       $v0, .L8001CC90
/* D488 8001CC88 A2E5023C */   lui       $v0, (0xE5A20000 >> 16)
/* D48C 8001CC8C 700402AE */  sw         $v0, 0x470($s0)
.L8001CC90:
/* D490 8001CC90 E276000C */  jal        CAMERA_FocusInstanceMoved
/* D494 8001CC94 21200002 */   addu      $a0, $s0, $zero
/* D498 8001CC98 07004010 */  beqz       $v0, .L8001CCB8
/* D49C 8001CC9C 1000033C */   lui       $v1, (0x100000 >> 16)
/* D4A0 8001CCA0 5CB1828F */  lw         $v0, %gp_rel(CameraCenterDelay)($gp)
/* D4A4 8001CCA4 00000000 */  nop
/* D4A8 8001CCA8 00190200 */  sll        $v1, $v0, 4
/* D4AC 8001CCAC 23104300 */  subu       $v0, $v0, $v1
/* D4B0 8001CCB0 37730008 */  j          .L8001CCDC
/* D4B4 8001CCB4 40130200 */   sll       $v0, $v0, 13
.L8001CCB8:
/* D4B8 8001CCB8 0CBF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x144)($gp)
/* D4BC 8001CCBC 00000000 */  nop
/* D4C0 8001CCC0 24104300 */  and        $v0, $v0, $v1
/* D4C4 8001CCC4 06004014 */  bnez       $v0, .L8001CCE0
/* D4C8 8001CCC8 00000000 */   nop
/* D4CC 8001CCCC 7004028E */  lw         $v0, 0x470($s0)
/* D4D0 8001CCD0 08C0838F */  lw         $v1, %gp_rel(gameTrackerX + 0x240)($gp)
/* D4D4 8001CCD4 00000000 */  nop
/* D4D8 8001CCD8 21104300 */  addu       $v0, $v0, $v1
.L8001CCDC:
/* D4DC 8001CCDC 700402AE */  sw         $v0, 0x470($s0)
.L8001CCE0:
/* D4E0 8001CCE0 7004028E */  lw         $v0, 0x470($s0)
/* D4E4 8001CCE4 00000000 */  nop
/* D4E8 8001CCE8 19004018 */  blez       $v0, .L8001CD50
/* D4EC 8001CCEC B6010426 */   addiu     $a0, $s0, 0x1B6
/* D4F0 8001CCF0 78002596 */  lhu        $a1, 0x78($s1)
/* D4F4 8001CCF4 20000624 */  addiu      $a2, $zero, 0x20
/* D4F8 8001CCF8 0008A524 */  addiu      $a1, $a1, 0x800
/* D4FC 8001CCFC 002C0500 */  sll        $a1, $a1, 16
/* D500 8001CD00 4C5C000C */  jal        Decouple_AngleMoveToward
/* D504 8001CD04 032C0500 */   sra       $a1, $a1, 16
/* D508 8001CD08 C0010426 */  addiu      $a0, $s0, 0x1C0
/* D50C 8001CD0C 78002596 */  lhu        $a1, 0x78($s1)
/* D510 8001CD10 20000624 */  addiu      $a2, $zero, 0x20
/* D514 8001CD14 0008A524 */  addiu      $a1, $a1, 0x800
/* D518 8001CD18 002C0500 */  sll        $a1, $a1, 16
/* D51C 8001CD1C 4C5C000C */  jal        Decouple_AngleMoveToward
/* D520 8001CD20 032C0500 */   sra       $a1, $a1, 16
/* D524 8001CD24 01000424 */  addiu      $a0, $zero, 0x1
/* D528 8001CD28 40010526 */  addiu      $a1, $s0, 0x140
/* D52C 8001CD2C C0010686 */  lh         $a2, 0x1C0($s0)
/* D530 8001CD30 78010226 */  addiu      $v0, $s0, 0x178
/* D534 8001CD34 1000A2AF */  sw         $v0, 0x10($sp)
/* D538 8001CD38 20000224 */  addiu      $v0, $zero, 0x20
/* D53C 8001CD3C 70010726 */  addiu      $a3, $s0, 0x170
/* D540 8001CD40 7E5E000C */  jal        CriticalDampAngle
/* D544 8001CD44 1400A2AF */   sw        $v0, 0x14($sp)
/* D548 8001CD48 01000224 */  addiu      $v0, $zero, 0x1
/* D54C 8001CD4C 080402A6 */  sh         $v0, 0x408($s0)
.L8001CD50:
/* D550 8001CD50 2000BF8F */  lw         $ra, 0x20($sp)
/* D554 8001CD54 1C00B18F */  lw         $s1, 0x1C($sp)
/* D558 8001CD58 1800B08F */  lw         $s0, 0x18($sp)
/* D55C 8001CD5C 0800E003 */  jr         $ra
/* D560 8001CD60 2800BD27 */   addiu     $sp, $sp, 0x28
.size CAMERA_FollowGoBehindPlayerWithTimer, . - CAMERA_FollowGoBehindPlayerWithTimer
