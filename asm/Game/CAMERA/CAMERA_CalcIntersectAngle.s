.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_CalcIntersectAngle
/* 9764 80018F64 64AC8387 */  lh         $v1, %gp_rel(camera_plane)($gp)
/* 9768 80018F68 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 976C 80018F6C 2000B0AF */  sw         $s0, 0x20($sp)
/* 9770 80018F70 21808000 */  addu       $s0, $a0, $zero
/* 9774 80018F74 2C00BFAF */  sw         $ra, 0x2C($sp)
/* 9778 80018F78 2800B2AF */  sw         $s2, 0x28($sp)
/* 977C 80018F7C 2400B1AF */  sw         $s1, 0x24($sp)
/* 9780 80018F80 00000286 */  lh         $v0, 0x0($s0)
/* 9784 80018F84 00000000 */  nop
/* 9788 80018F88 18006200 */  mult       $v1, $v0
/* 978C 80018F8C 66AC8387 */  lh         $v1, %gp_rel(camera_plane + 0x2)($gp)
/* 9790 80018F90 12480000 */  mflo       $t1
/* 9794 80018F94 02000286 */  lh         $v0, 0x2($s0)
/* 9798 80018F98 00000000 */  nop
/* 979C 80018F9C 18006200 */  mult       $v1, $v0
/* 97A0 80018FA0 68AC8387 */  lh         $v1, %gp_rel(camera_plane + 0x4)($gp)
/* 97A4 80018FA4 12400000 */  mflo       $t0
/* 97A8 80018FA8 04000286 */  lh         $v0, 0x4($s0)
/* 97AC 80018FAC 00000000 */  nop
/* 97B0 80018FB0 18006200 */  mult       $v1, $v0
/* 97B4 80018FB4 1800A427 */  addiu      $a0, $sp, 0x18
/* 97B8 80018FB8 2190E000 */  addu       $s2, $a3, $zero
/* 97BC 80018FBC 64AC8727 */  addiu      $a3, $gp, %gp_rel(camera_plane)
/* 97C0 80018FC0 4000B18F */  lw         $s1, 0x40($sp)
/* 97C4 80018FC4 21102801 */  addu       $v0, $t1, $t0
/* 97C8 80018FC8 12180000 */  mflo       $v1
/* 97CC 80018FCC 21104300 */  addu       $v0, $v0, $v1
/* 97D0 80018FD0 03130200 */  sra        $v0, $v0, 12
/* 97D4 80018FD4 BDE0010C */  jal        func_800782F4
/* 97D8 80018FD8 1000A2AF */   sw        $v0, 0x10($sp)
/* 97DC 80018FDC 16004010 */  beqz       $v0, .L80019038
/* 97E0 80018FE0 21200002 */   addu      $a0, $s0, $zero
/* 97E4 80018FE4 A65E000C */  jal        CAMERA_CalcZRotation
/* 97E8 80018FE8 1800A527 */   addiu     $a1, $sp, 0x18
/* 97EC 80018FEC 00140200 */  sll        $v0, $v0, 16
/* 97F0 80018FF0 7CAC8587 */  lh         $a1, %gp_rel(hitline_rot)($gp)
/* 97F4 80018FF4 DA59000C */  jal        CAMERA_SignedAngleDifference
/* 97F8 80018FF8 03240200 */   sra       $a0, $v0, 16
/* 97FC 80018FFC 21204000 */  addu       $a0, $v0, $zero
/* 9800 80019000 001C0400 */  sll        $v1, $a0, 16
/* 9804 80019004 00002286 */  lh         $v0, 0x0($s1)
/* 9808 80019008 031C0300 */  sra        $v1, $v1, 16
/* 980C 8001900C 2A106200 */  slt        $v0, $v1, $v0
/* 9810 80019010 02004010 */  beqz       $v0, .L8001901C
/* 9814 80019014 00000000 */   nop
/* 9818 80019018 000024A6 */  sh         $a0, 0x0($s1)
.L8001901C:
/* 981C 8001901C 00004286 */  lh         $v0, 0x0($s2)
/* 9820 80019020 00000000 */  nop
/* 9824 80019024 2A104300 */  slt        $v0, $v0, $v1
/* 9828 80019028 04004010 */  beqz       $v0, .L8001903C
/* 982C 8001902C 21106000 */   addu      $v0, $v1, $zero
/* 9830 80019030 0F640008 */  j          .L8001903C
/* 9834 80019034 000044A6 */   sh        $a0, 0x0($s2)
.L80019038:
/* 9838 80019038 F1D80224 */  addiu      $v0, $zero, -0x270F
.L8001903C:
/* 983C 8001903C 2C00BF8F */  lw         $ra, 0x2C($sp)
/* 9840 80019040 2800B28F */  lw         $s2, 0x28($sp)
/* 9844 80019044 2400B18F */  lw         $s1, 0x24($sp)
/* 9848 80019048 2000B08F */  lw         $s0, 0x20($sp)
/* 984C 8001904C 0800E003 */  jr         $ra
/* 9850 80019050 3000BD27 */   addiu     $sp, $sp, 0x30
.size CAMERA_CalcIntersectAngle, . - CAMERA_CalcIntersectAngle
