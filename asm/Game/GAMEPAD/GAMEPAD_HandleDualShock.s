.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GAMEPAD_HandleDualShock
/* 21E6C 8003166C D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 21E70 80031670 21200000 */  addu       $a0, $zero, $zero
/* 21E74 80031674 02000524 */  addiu      $a1, $zero, 0x2
/* 21E78 80031678 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 21E7C 8003167C 08C0938F */  lw         $s3, %gp_rel(gameTrackerX + 0x240)($gp)
/* 21E80 80031680 21308000 */  addu       $a2, $a0, $zero
/* 21E84 80031684 2000BFAF */  sw         $ra, 0x20($sp)
/* 21E88 80031688 1800B2AF */  sw         $s2, 0x18($sp)
/* 21E8C 8003168C 1400B1AF */  sw         $s1, 0x14($sp)
/* 21E90 80031690 EDF6020C */  jal        PadInfoMode
/* 21E94 80031694 1000B0AF */   sw        $s0, 0x10($sp)
/* 21E98 80031698 18004010 */  beqz       $v0, .L800316FC
/* 21E9C 8003169C 00000000 */   nop
/* 21EA0 800316A0 28928287 */  lh         $v0, %gp_rel(align_flag)($gp)
/* 21EA4 800316A4 00000000 */  nop
/* 21EA8 800316A8 15004014 */  bnez       $v0, .L80031700
/* 21EAC 800316AC 21800000 */   addu      $s0, $zero, $zero
/* 21EB0 800316B0 21200002 */  addu       $a0, $s0, $zero
/* 21EB4 800316B4 0D80053C */  lui        $a1, %hi(dualshock_motors)
/* 21EB8 800316B8 1CA2A524 */  addiu      $a1, $a1, %lo(dualshock_motors)
/* 21EBC 800316BC 6EF7020C */  jal        PadSetAct
/* 21EC0 800316C0 02000624 */   addiu     $a2, $zero, 0x2
/* 21EC4 800316C4 0D80123C */  lui        $s2, %hi(dualshock_align)
/* 21EC8 800316C8 0100113C */  lui        $s1, (0x1869F >> 16)
/* 21ECC 800316CC 9F863136 */  ori        $s1, $s1, (0x1869F & 0xFFFF)
.L800316D0:
/* 21ED0 800316D0 21200000 */  addu       $a0, $zero, $zero
/* 21ED4 800316D4 60F7020C */  jal        PadSetActAlign
/* 21ED8 800316D8 20A24526 */   addiu     $a1, $s2, %lo(dualshock_align)
/* 21EDC 800316DC 03004014 */  bnez       $v0, .L800316EC
/* 21EE0 800316E0 2A103002 */   slt       $v0, $s1, $s0
/* 21EE4 800316E4 FAFF4010 */  beqz       $v0, .L800316D0
/* 21EE8 800316E8 01001026 */   addiu     $s0, $s0, 0x1
.L800316EC:
/* 21EEC 800316EC 01000224 */  addiu      $v0, $zero, 0x1
/* 21EF0 800316F0 289282A7 */  sh         $v0, %gp_rel(align_flag)($gp)
/* 21EF4 800316F4 C0C50008 */  j          .L80031700
/* 21EF8 800316F8 00000000 */   nop
.L800316FC:
/* 21EFC 800316FC 289280A7 */  sh         $zero, %gp_rel(align_flag)($gp)
.L80031700:
/* 21F00 80031700 68BA828F */  lw         $v0, %gp_rel(dualshock0_time)($gp)
/* 21F04 80031704 00000000 */  nop
/* 21F08 80031708 06004018 */  blez       $v0, .L80031724
/* 21F0C 8003170C 23105300 */   subu      $v0, $v0, $s3
/* 21F10 80031710 68BA82AF */  sw         $v0, %gp_rel(dualshock0_time)($gp)
/* 21F14 80031714 0300401C */  bgtz       $v0, .L80031724
/* 21F18 80031718 0D80023C */   lui       $v0, %hi(dualshock_motors)
/* 21F1C 8003171C 68BA80AF */  sw         $zero, %gp_rel(dualshock0_time)($gp)
/* 21F20 80031720 1CA240A0 */  sb         $zero, %lo(dualshock_motors)($v0)
.L80031724:
/* 21F24 80031724 6CBA828F */  lw         $v0, %gp_rel(dualshock1_time)($gp)
/* 21F28 80031728 00000000 */  nop
/* 21F2C 8003172C 06004018 */  blez       $v0, .L80031748
/* 21F30 80031730 23105300 */   subu      $v0, $v0, $s3
/* 21F34 80031734 6CBA82AF */  sw         $v0, %gp_rel(dualshock1_time)($gp)
/* 21F38 80031738 0300401C */  bgtz       $v0, .L80031748
/* 21F3C 8003173C 0D80023C */   lui       $v0, %hi(dualshock_motors + 0x1)
/* 21F40 80031740 6CBA80AF */  sw         $zero, %gp_rel(dualshock1_time)($gp)
/* 21F44 80031744 1DA240A0 */  sb         $zero, %lo(dualshock_motors + 0x1)($v0)
.L80031748:
/* 21F48 80031748 2000BF8F */  lw         $ra, 0x20($sp)
/* 21F4C 8003174C 1C00B38F */  lw         $s3, 0x1C($sp)
/* 21F50 80031750 1800B28F */  lw         $s2, 0x18($sp)
/* 21F54 80031754 1400B18F */  lw         $s1, 0x14($sp)
/* 21F58 80031758 1000B08F */  lw         $s0, 0x10($sp)
/* 21F5C 8003175C 0800E003 */  jr         $ra
/* 21F60 80031760 2800BD27 */   addiu     $sp, $sp, 0x28
.size GAMEPAD_HandleDualShock, . - GAMEPAD_HandleDualShock
