.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_Adjust_roll
/* 7734 80016F34 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 7738 80016F38 1400B1AF */  sw         $s1, 0x14($sp)
/* 773C 80016F3C 2188A000 */  addu       $s1, $a1, $zero
/* 7740 80016F40 1000B0AF */  sw         $s0, 0x10($sp)
/* 7744 80016F44 FF0F9030 */  andi       $s0, $a0, 0xFFF
/* 7748 80016F48 07002016 */  bnez       $s1, .L80016F68
/* 774C 80016F4C 1800BFAF */   sw        $ra, 0x18($sp)
/* 7750 80016F50 00131000 */  sll        $v0, $s0, 12
/* 7754 80016F54 508E82AF */  sw         $v0, %gp_rel(current_roll_amount)($gp)
/* 7758 80016F58 4C8E82AF */  sw         $v0, %gp_rel(roll_target)($gp)
/* 775C 80016F5C 548E80AF */  sw         $zero, %gp_rel(roll_inc)($gp)
/* 7760 80016F60 E95B0008 */  j          .L80016FA4
/* 7764 80016F64 00000000 */   nop
.L80016F68:
/* 7768 80016F68 508E858F */  lw         $a1, %gp_rel(current_roll_amount)($gp)
/* 776C 80016F6C 00000000 */  nop
/* 7770 80016F70 0200A104 */  bgez       $a1, .L80016F7C
/* 7774 80016F74 21200002 */   addu      $a0, $s0, $zero
/* 7778 80016F78 FF0FA524 */  addiu      $a1, $a1, 0xFFF
.L80016F7C:
/* 777C 80016F7C 00290500 */  sll        $a1, $a1, 4
/* 7780 80016F80 DA59000C */  jal        CAMERA_SignedAngleDifference
/* 7784 80016F84 032C0500 */   sra       $a1, $a1, 16
/* 7788 80016F88 00140200 */  sll        $v0, $v0, 16
/* 778C 80016F8C 03110200 */  sra        $v0, $v0, 4
/* 7790 80016F90 1A005100 */  div        $zero, $v0, $s1
/* 7794 80016F94 12100000 */  mflo       $v0
/* 7798 80016F98 001B1000 */  sll        $v1, $s0, 12
/* 779C 80016F9C 4C8E83AF */  sw         $v1, %gp_rel(roll_target)($gp)
/* 77A0 80016FA0 548E82AF */  sw         $v0, %gp_rel(roll_inc)($gp)
.L80016FA4:
/* 77A4 80016FA4 1800BF8F */  lw         $ra, 0x18($sp)
/* 77A8 80016FA8 1400B18F */  lw         $s1, 0x14($sp)
/* 77AC 80016FAC 1000B08F */  lw         $s0, 0x10($sp)
/* 77B0 80016FB0 0800E003 */  jr         $ra
/* 77B4 80016FB4 2000BD27 */   addiu     $sp, $sp, 0x20
.size CAMERA_Adjust_roll, . - CAMERA_Adjust_roll
