.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RazielAdditionalCollide
/* A3C84 800B3484 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* A3C88 800B3488 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* A3C8C 800B348C 3000B2AF */  sw         $s2, 0x30($sp)
/* A3C90 800B3490 21908000 */  addu       $s2, $a0, $zero
/* A3C94 800B3494 3400B3AF */  sw         $s3, 0x34($sp)
/* A3C98 800B3498 2198A000 */  addu       $s3, $a1, $zero
/* A3C9C 800B349C 3800BFAF */  sw         $ra, 0x38($sp)
/* A3CA0 800B34A0 2C00B1AF */  sw         $s1, 0x2C($sp)
/* A3CA4 800B34A4 2800B0AF */  sw         $s0, 0x28($sp)
/* A3CA8 800B34A8 08004230 */  andi       $v0, $v0, 0x8
/* A3CAC 800B34AC 02004010 */  beqz       $v0, .L800B34B8
/* A3CB0 800B34B0 21800000 */   addu      $s0, $zero, $zero
/* A3CB4 800B34B4 01001024 */  addiu      $s0, $zero, 0x1
.L800B34B8:
/* A3CB8 800B34B8 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* A3CBC 800B34BC 00000000 */  nop
/* A3CC0 800B34C0 00204230 */  andi       $v0, $v0, 0x2000
/* A3CC4 800B34C4 0B004010 */  beqz       $v0, .L800B34F4
/* A3CC8 800B34C8 21200000 */   addu      $a0, $zero, $zero
/* A3CCC 800B34CC A0FF0524 */  addiu      $a1, $zero, -0x60
/* A3CD0 800B34D0 24FA8687 */  lh         $a2, %gp_rel(Raziel + 0x3F4)($gp)
/* A3CD4 800B34D4 6CFA8787 */  lh         $a3, %gp_rel(Raziel + 0x43C)($gp)
/* A3CD8 800B34D8 00010224 */  addiu      $v0, $zero, 0x100
/* A3CDC 800B34DC B4C4010C */  jal        SetPhysicsDropOffData
/* A3CE0 800B34E0 1000A2AF */   sw        $v0, 0x10($sp)
/* A3CE4 800B34E4 21204002 */  addu       $a0, $s2, $zero
/* A3CE8 800B34E8 21284000 */  addu       $a1, $v0, $zero
/* A3CEC 800B34EC 4DDC010C */  jal        PhysicsCheckDropOff
/* A3CF0 800B34F0 02000624 */   addiu     $a2, $zero, 0x2
.L800B34F4:
/* A3CF4 800B34F4 01000232 */  andi       $v0, $s0, 0x1
/* A3CF8 800B34F8 2F004010 */  beqz       $v0, .L800B35B8
/* A3CFC 800B34FC 01000224 */   addiu     $v0, $zero, 0x1
/* A3D00 800B3500 8FBF8393 */  lbu        $v1, %gp_rel(gameTrackerX + 0x1C7)($gp)
/* A3D04 800B3504 00000000 */  nop
/* A3D08 800B3508 02006214 */  bne        $v1, $v0, .L800B3514
/* A3D0C 800B350C 80000524 */   addiu     $a1, $zero, 0x80
/* A3D10 800B3510 40000524 */  addiu      $a1, $zero, 0x40
.L800B3514:
/* A3D14 800B3514 68004286 */  lh         $v0, 0x68($s2)
/* A3D18 800B3518 60004386 */  lh         $v1, 0x60($s2)
/* A3D1C 800B351C 68004496 */  lhu        $a0, 0x68($s2)
/* A3D20 800B3520 23104300 */  subu       $v0, $v0, $v1
/* A3D24 800B3524 001C0500 */  sll        $v1, $a1, 16
/* A3D28 800B3528 031C0300 */  sra        $v1, $v1, 16
/* A3D2C 800B352C 2A186200 */  slt        $v1, $v1, $v0
/* A3D30 800B3530 60004296 */  lhu        $v0, 0x60($s2)
/* A3D34 800B3534 03006010 */  beqz       $v1, .L800B3544
/* A3D38 800B3538 002C0500 */   sll       $a1, $a1, 16
/* A3D3C 800B353C 23288200 */  subu       $a1, $a0, $v0
/* A3D40 800B3540 002C0500 */  sll        $a1, $a1, 16
.L800B3544:
/* A3D44 800B3544 032C0500 */  sra        $a1, $a1, 16
/* A3D48 800B3548 4000428E */  lw         $v0, 0x40($s2)
/* A3D4C 800B354C 21300000 */  addu       $a2, $zero, $zero
/* A3D50 800B3550 3C004384 */  lh         $v1, 0x3C($v0)
/* A3D54 800B3554 1C00448C */  lw         $a0, 0x1C($v0)
/* A3D58 800B3558 6CFA8287 */  lh         $v0, %gp_rel(Raziel + 0x43C)($gp)
/* A3D5C 800B355C 2138C000 */  addu       $a3, $a2, $zero
/* A3D60 800B3560 1000A0AF */  sw         $zero, 0x10($sp)
/* A3D64 800B3564 23206400 */  subu       $a0, $v1, $a0
/* A3D68 800B3568 4FC4010C */  jal        SetPhysicsGravityData
/* A3D6C 800B356C 1400A2AF */   sw        $v0, 0x14($sp)
/* A3D70 800B3570 21204002 */  addu       $a0, $s2, $zero
/* A3D74 800B3574 21284000 */  addu       $a1, $v0, $zero
/* A3D78 800B3578 B8D3010C */  jal        PhysicsCheckGravity
/* A3D7C 800B357C 07000624 */   addiu     $a2, $zero, 0x7
/* A3D80 800B3580 01004230 */  andi       $v0, $v0, 0x1
/* A3D84 800B3584 04004010 */  beqz       $v0, .L800B3598
/* A3D88 800B3588 FBFF0324 */   addiu     $v1, $zero, -0x5
/* A3D8C 800B358C CCF9828F */  lw         $v0, %gp_rel(Raziel + 0x39C)($gp)
/* A3D90 800B3590 69CD0208 */  j          .L800B35A4
/* A3D94 800B3594 04004234 */   ori       $v0, $v0, 0x4
.L800B3598:
/* A3D98 800B3598 CCF9828F */  lw         $v0, %gp_rel(Raziel + 0x39C)($gp)
/* A3D9C 800B359C 00000000 */  nop
/* A3DA0 800B35A0 24104300 */  and        $v0, $v0, $v1
.L800B35A4:
/* A3DA4 800B35A4 CCF982AF */  sw         $v0, %gp_rel(Raziel + 0x39C)($gp)
/* A3DA8 800B35A8 A12B010C */  jal        FX_UpdateInstanceWaterSplit
/* A3DAC 800B35AC 21204002 */   addu      $a0, $s2, $zero
/* A3DB0 800B35B0 73CD0208 */  j          .L800B35CC
/* A3DB4 800B35B4 00000000 */   nop
.L800B35B8:
/* A3DB8 800B35B8 B80040AE */  sw         $zero, 0xB8($s2)
/* A3DBC 800B35BC B40040AE */  sw         $zero, 0xB4($s2)
/* A3DC0 800B35C0 BC0040AE */  sw         $zero, 0xBC($s2)
/* A3DC4 800B35C4 280140AE */  sw         $zero, 0x128($s2)
/* A3DC8 800B35C8 300140AE */  sw         $zero, 0x130($s2)
.L800B35CC:
/* A3DCC 800B35CC C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* A3DD0 800B35D0 00000000 */  nop
/* A3DD4 800B35D4 00044230 */  andi       $v0, $v0, 0x400
/* A3DD8 800B35D8 48004010 */  beqz       $v0, .L800B36FC
/* A3DDC 800B35DC 03000224 */   addiu     $v0, $zero, 0x3
/* A3DE0 800B35E0 1CFA838F */  lw         $v1, %gp_rel(Raziel + 0x3EC)($gp)
/* A3DE4 800B35E4 00000000 */  nop
/* A3DE8 800B35E8 44006210 */  beq        $v1, $v0, .L800B36FC
/* A3DEC 800B35EC 90010424 */   addiu     $a0, $zero, 0x190
/* A3DF0 800B35F0 00FF0524 */  addiu      $a1, $zero, -0x100
/* A3DF4 800B35F4 90000624 */  addiu      $a2, $zero, 0x90
/* A3DF8 800B35F8 21380000 */  addu       $a3, $zero, $zero
/* A3DFC 800B35FC 3CFF0224 */  addiu      $v0, $zero, -0xC4
/* A3E00 800B3600 1000A2AF */  sw         $v0, 0x10($sp)
/* A3E04 800B3604 F2010224 */  addiu      $v0, $zero, 0x1F2
/* A3E08 800B3608 1400A2AF */  sw         $v0, 0x14($sp)
/* A3E0C 800B360C D0F98227 */  addiu      $v0, $gp, %gp_rel(Raziel + 0x3A0)
/* A3E10 800B3610 1800A2AF */  sw         $v0, 0x18($sp)
/* A3E14 800B3614 D8F98227 */  addiu      $v0, $gp, %gp_rel(Raziel + 0x3A8)
/* A3E18 800B3618 1C00A2AF */  sw         $v0, 0x1C($sp)
/* A3E1C 800B361C F0F98227 */  addiu      $v0, $gp, %gp_rel(Raziel + 0x3C0)
/* A3E20 800B3620 6EC4010C */  jal        SetPhysicsEdgeData
/* A3E24 800B3624 2000A2AF */   sw        $v0, 0x20($sp)
/* A3E28 800B3628 21204002 */  addu       $a0, $s2, $zero
/* A3E2C 800B362C 21286002 */  addu       $a1, $s3, $zero
/* A3E30 800B3630 21884000 */  addu       $s1, $v0, $zero
/* A3E34 800B3634 21302002 */  addu       $a2, $s1, $zero
/* A3E38 800B3638 C4D5010C */  jal        PhysicsCheckEdgeGrabbing
/* A3E3C 800B363C 03000724 */   addiu     $a3, $zero, 0x3
/* A3E40 800B3640 21804000 */  addu       $s0, $v0, $zero
/* A3E44 800B3644 06000332 */  andi       $v1, $s0, 0x6
/* A3E48 800B3648 06000224 */  addiu      $v0, $zero, 0x6
/* A3E4C 800B364C 1D006214 */  bne        $v1, $v0, .L800B36C4
/* A3E50 800B3650 FDFF0324 */   addiu     $v1, $zero, -0x3
/* A3E54 800B3654 21204002 */  addu       $a0, $s2, $zero
/* A3E58 800B3658 21280000 */  addu       $a1, $zero, $zero
/* A3E5C 800B365C 2130A000 */  addu       $a2, $a1, $zero
/* A3E60 800B3660 2138A000 */  addu       $a3, $a1, $zero
/* A3E64 800B3664 4E68020C */  jal        SetPhysics
/* A3E68 800B3668 1000A0AF */   sw        $zero, 0x10($sp)
/* A3E6C 800B366C CCF9828F */  lw         $v0, %gp_rel(Raziel + 0x39C)($gp)
/* A3E70 800B3670 D0FC838F */  lw         $v1, %gp_rel(ExtraRot)($gp)
/* A3E74 800B3674 02004234 */  ori        $v0, $v0, 0x2
/* A3E78 800B3678 CCF982AF */  sw         $v0, %gp_rel(Raziel + 0x39C)($gp)
/* A3E7C 800B367C 0A006010 */  beqz       $v1, .L800B36A8
/* A3E80 800B3680 C8014426 */   addiu     $a0, $s2, 0x1C8
/* A3E84 800B3684 01000524 */  addiu      $a1, $zero, 0x1
/* A3E88 800B3688 8D41020C */  jal        G2Anim_DisableController
/* A3E8C 800B368C 0E000624 */   addiu     $a2, $zero, 0xE
/* A3E90 800B3690 D0FC828F */  lw         $v0, %gp_rel(ExtraRot)($gp)
/* A3E94 800B3694 78004396 */  lhu        $v1, 0x78($s2)
/* A3E98 800B3698 04004294 */  lhu        $v0, 0x4($v0)
/* A3E9C 800B369C D0FC80AF */  sw         $zero, %gp_rel(ExtraRot)($gp)
/* A3EA0 800B36A0 21186200 */  addu       $v1, $v1, $v0
/* A3EA4 800B36A4 780043A6 */  sh         $v1, 0x78($s2)
.L800B36A8:
/* A3EA8 800B36A8 0A002012 */  beqz       $s1, .L800B36D4
/* A3EAC 800B36AC 21204002 */   addu      $a0, $s2, $zero
/* A3EB0 800B36B0 21282002 */  addu       $a1, $s1, $zero
/* A3EB4 800B36B4 72D7010C */  jal        PhysicsDefaultEdgeGrabResponse
/* A3EB8 800B36B8 21300000 */   addu      $a2, $zero, $zero
/* A3EBC 800B36BC B6CD0208 */  j          .L800B36D8
/* A3EC0 800B36C0 02000232 */   andi      $v0, $s0, 0x2
.L800B36C4:
/* A3EC4 800B36C4 CCF9828F */  lw         $v0, %gp_rel(Raziel + 0x39C)($gp)
/* A3EC8 800B36C8 00000000 */  nop
/* A3ECC 800B36CC 24104300 */  and        $v0, $v0, $v1
/* A3ED0 800B36D0 CCF982AF */  sw         $v0, %gp_rel(Raziel + 0x39C)($gp)
.L800B36D4:
/* A3ED4 800B36D4 02000232 */  andi       $v0, $s0, 0x2
.L800B36D8:
/* A3ED8 800B36D8 04004010 */  beqz       $v0, .L800B36EC
/* A3EDC 800B36DC FEFF0324 */   addiu     $v1, $zero, -0x2
/* A3EE0 800B36E0 CCF9828F */  lw         $v0, %gp_rel(Raziel + 0x39C)($gp)
/* A3EE4 800B36E4 BECD0208 */  j          .L800B36F8
/* A3EE8 800B36E8 01004234 */   ori       $v0, $v0, 0x1
.L800B36EC:
/* A3EEC 800B36EC CCF9828F */  lw         $v0, %gp_rel(Raziel + 0x39C)($gp)
/* A3EF0 800B36F0 00000000 */  nop
/* A3EF4 800B36F4 24104300 */  and        $v0, $v0, $v1
.L800B36F8:
/* A3EF8 800B36F8 CCF982AF */  sw         $v0, %gp_rel(Raziel + 0x39C)($gp)
.L800B36FC:
/* A3EFC 800B36FC C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* A3F00 800B3700 00000000 */  nop
/* A3F04 800B3704 00014230 */  andi       $v0, $v0, 0x100
/* A3F08 800B3708 30004010 */  beqz       $v0, .L800B37CC
/* A3F0C 800B370C 20000224 */   addiu     $v0, $zero, 0x20
/* A3F10 800B3710 2F97020C */  jal        razGetHeldWeapon
/* A3F14 800B3714 00000000 */   nop
/* A3F18 800B3718 9CF98527 */  addiu      $a1, $gp, %gp_rel(Raziel + 0x36C)
/* A3F1C 800B371C 00010624 */  addiu      $a2, $zero, 0x100
/* A3F20 800B3720 A0010724 */  addiu      $a3, $zero, 0x1A0
/* A3F24 800B3724 70000324 */  addiu      $v1, $zero, 0x70
/* A3F28 800B3728 90F9848F */  lw         $a0, %gp_rel(Raziel + 0x360)($gp)
/* A3F2C 800B372C 21884000 */  addu       $s1, $v0, $zero
/* A3F30 800B3730 1000A3AF */  sw         $v1, 0x10($sp)
/* A3F34 800B3734 82240400 */  srl        $a0, $a0, 18
/* A3F38 800B3738 99C4010C */  jal        SetPhysicsSwimData
/* A3F3C 800B373C 01008430 */   andi      $a0, $a0, 0x1
/* A3F40 800B3740 21204002 */  addu       $a0, $s2, $zero
/* A3F44 800B3744 21804000 */  addu       $s0, $v0, $zero
/* A3F48 800B3748 21280002 */  addu       $a1, $s0, $zero
/* A3F4C 800B374C 6DDA010C */  jal        PhysicsCheckSwim
/* A3F50 800B3750 03000624 */   addiu     $a2, $zero, 0x3
/* A3F54 800B3754 10000396 */  lhu        $v1, 0x10($s0)
/* A3F58 800B3758 9CA682AF */  sw         $v0, %gp_rel(WaterStatus)($gp)
/* A3F5C 800B375C 10006330 */  andi       $v1, $v1, 0x10
/* A3F60 800B3760 0A006010 */  beqz       $v1, .L800B378C
/* A3F64 800B3764 00000000 */   nop
/* A3F68 800B3768 08002012 */  beqz       $s1, .L800B378C
/* A3F6C 800B376C 21202002 */   addu      $a0, $s1, $zero
/* A3F70 800B3770 92D1000C */  jal        INSTANCE_Query
/* A3F74 800B3774 04000524 */   addiu     $a1, $zero, 0x4
/* A3F78 800B3778 03000324 */  addiu      $v1, $zero, 0x3
/* A3F7C 800B377C 03004314 */  bne        $v0, $v1, .L800B378C
/* A3F80 800B3780 C8014426 */   addiu     $a0, $s2, 0x1C8
/* A3F84 800B3784 8E3F020C */  jal        G2Anim_SetSpeedAdjustment
/* A3F88 800B3788 00080524 */   addiu     $a1, $zero, 0x800
.L800B378C:
/* A3F8C 800B378C 10000296 */  lhu        $v0, 0x10($s0)
/* A3F90 800B3790 00000000 */  nop
/* A3F94 800B3794 20004230 */  andi       $v0, $v0, 0x20
/* A3F98 800B3798 0F004010 */  beqz       $v0, .L800B37D8
/* A3F9C 800B379C 00000000 */   nop
/* A3FA0 800B37A0 0D002012 */  beqz       $s1, .L800B37D8
/* A3FA4 800B37A4 21202002 */   addu      $a0, $s1, $zero
/* A3FA8 800B37A8 92D1000C */  jal        INSTANCE_Query
/* A3FAC 800B37AC 04000524 */   addiu     $a1, $zero, 0x4
/* A3FB0 800B37B0 03000324 */  addiu      $v1, $zero, 0x3
/* A3FB4 800B37B4 08004314 */  bne        $v0, $v1, .L800B37D8
/* A3FB8 800B37B8 C8014426 */   addiu     $a0, $s2, 0x1C8
/* A3FBC 800B37BC 8E3F020C */  jal        G2Anim_SetSpeedAdjustment
/* A3FC0 800B37C0 00100524 */   addiu     $a1, $zero, 0x1000
/* A3FC4 800B37C4 F6CD0208 */  j          .L800B37D8
/* A3FC8 800B37C8 00000000 */   nop
.L800B37CC:
/* A3FCC 800B37CC 9CA682AF */  sw         $v0, %gp_rel(WaterStatus)($gp)
/* A3FD0 800B37D0 A12B010C */  jal        FX_UpdateInstanceWaterSplit
/* A3FD4 800B37D4 21204002 */   addu      $a0, $s2, $zero
.L800B37D8:
/* A3FD8 800B37D8 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* A3FDC 800B37DC 00000000 */  nop
/* A3FE0 800B37E0 00804230 */  andi       $v0, $v0, 0x8000
/* A3FE4 800B37E4 28004010 */  beqz       $v0, .L800B3888
/* A3FE8 800B37E8 00010424 */   addiu     $a0, $zero, 0x100
/* A3FEC 800B37EC 00FF0524 */  addiu      $a1, $zero, -0x100
/* A3FF0 800B37F0 50000624 */  addiu      $a2, $zero, 0x50
/* A3FF4 800B37F4 21380000 */  addu       $a3, $zero, $zero
/* A3FF8 800B37F8 98FF0224 */  addiu      $v0, $zero, -0x68
/* A3FFC 800B37FC 1000A2AF */  sw         $v0, 0x10($sp)
/* A4000 800B3800 D0F98227 */  addiu      $v0, $gp, %gp_rel(Raziel + 0x3A0)
/* A4004 800B3804 1800A2AF */  sw         $v0, 0x18($sp)
/* A4008 800B3808 D8F98227 */  addiu      $v0, $gp, %gp_rel(Raziel + 0x3A8)
/* A400C 800B380C 1C00A2AF */  sw         $v0, 0x1C($sp)
/* A4010 800B3810 F0F98227 */  addiu      $v0, $gp, %gp_rel(Raziel + 0x3C0)
/* A4014 800B3814 1400A0AF */  sw         $zero, 0x14($sp)
/* A4018 800B3818 6EC4010C */  jal        SetPhysicsEdgeData
/* A401C 800B381C 2000A2AF */   sw        $v0, 0x20($sp)
/* A4020 800B3820 21204002 */  addu       $a0, $s2, $zero
/* A4024 800B3824 21286002 */  addu       $a1, $s3, $zero
/* A4028 800B3828 21304000 */  addu       $a2, $v0, $zero
/* A402C 800B382C 85D9010C */  jal        PhysicsCheckBlockers
/* A4030 800B3830 03000724 */   addiu     $a3, $zero, 0x3
/* A4034 800B3834 21804000 */  addu       $s0, $v0, $zero
/* A4038 800B3838 04000232 */  andi       $v0, $s0, 0x4
/* A403C 800B383C 04004010 */  beqz       $v0, .L800B3850
/* A4040 800B3840 FDFF0324 */   addiu     $v1, $zero, -0x3
/* A4044 800B3844 CCF9828F */  lw         $v0, %gp_rel(Raziel + 0x39C)($gp)
/* A4048 800B3848 17CE0208 */  j          .L800B385C
/* A404C 800B384C 02004234 */   ori       $v0, $v0, 0x2
.L800B3850:
/* A4050 800B3850 CCF9828F */  lw         $v0, %gp_rel(Raziel + 0x39C)($gp)
/* A4054 800B3854 00000000 */  nop
/* A4058 800B3858 24104300 */  and        $v0, $v0, $v1
.L800B385C:
/* A405C 800B385C CCF982AF */  sw         $v0, %gp_rel(Raziel + 0x39C)($gp)
/* A4060 800B3860 02000232 */  andi       $v0, $s0, 0x2
/* A4064 800B3864 04004010 */  beqz       $v0, .L800B3878
/* A4068 800B3868 FEFF0324 */   addiu     $v1, $zero, -0x2
/* A406C 800B386C CCF9828F */  lw         $v0, %gp_rel(Raziel + 0x39C)($gp)
/* A4070 800B3870 21CE0208 */  j          .L800B3884
/* A4074 800B3874 01004234 */   ori       $v0, $v0, 0x1
.L800B3878:
/* A4078 800B3878 CCF9828F */  lw         $v0, %gp_rel(Raziel + 0x39C)($gp)
/* A407C 800B387C 00000000 */  nop
/* A4080 800B3880 24104300 */  and        $v0, $v0, $v1
.L800B3884:
/* A4084 800B3884 CCF982AF */  sw         $v0, %gp_rel(Raziel + 0x39C)($gp)
.L800B3888:
/* A4088 800B3888 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* A408C 800B388C 0800033C */  lui        $v1, (0x80000 >> 16)
/* A4090 800B3890 24104300 */  and        $v0, $v0, $v1
/* A4094 800B3894 0A004010 */  beqz       $v0, .L800B38C0
/* A4098 800B3898 21200000 */   addu      $a0, $zero, $zero
/* A409C 800B389C 40FE0524 */  addiu      $a1, $zero, -0x1C0
/* A40A0 800B38A0 A0000624 */  addiu      $a2, $zero, 0xA0
/* A40A4 800B38A4 F2C4010C */  jal        SetPhysicsWallCrawlData
/* A40A8 800B38A8 46FF0724 */   addiu     $a3, $zero, -0xBA
/* A40AC 800B38AC 21204002 */  addu       $a0, $s2, $zero
/* A40B0 800B38B0 21286002 */  addu       $a1, $s3, $zero
/* A40B4 800B38B4 21304000 */  addu       $a2, $v0, $zero
/* A40B8 800B38B8 D5DC010C */  jal        PhysicsFollowWall
/* A40BC 800B38BC 07000724 */   addiu     $a3, $zero, 0x7
.L800B38C0:
/* A40C0 800B38C0 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* A40C4 800B38C4 0004033C */  lui        $v1, (0x4000000 >> 16)
/* A40C8 800B38C8 24104300 */  and        $v0, $v0, $v1
/* A40CC 800B38CC 16004010 */  beqz       $v0, .L800B3928
/* A40D0 800B38D0 00000000 */   nop
/* A40D4 800B38D4 20FA848F */  lw         $a0, %gp_rel(Raziel + 0x3F0)($gp)
/* A40D8 800B38D8 00000000 */  nop
/* A40DC 800B38DC 12008010 */  beqz       $a0, .L800B3928
/* A40E0 800B38E0 00000000 */   nop
/* A40E4 800B38E4 92D1000C */  jal        INSTANCE_Query
/* A40E8 800B38E8 02000524 */   addiu     $a1, $zero, 0x2
/* A40EC 800B38EC 08004230 */  andi       $v0, $v0, 0x8
/* A40F0 800B38F0 04004010 */  beqz       $v0, .L800B3904
/* A40F4 800B38F4 02000524 */   addiu     $a1, $zero, 0x2
/* A40F8 800B38F8 20FA848F */  lw         $a0, %gp_rel(Raziel + 0x3F0)($gp)
/* A40FC 800B38FC 44CE0208 */  j          .L800B3910
/* A4100 800B3900 21300000 */   addu      $a2, $zero, $zero
.L800B3904:
/* A4104 800B3904 20FA848F */  lw         $a0, %gp_rel(Raziel + 0x3F0)($gp)
/* A4108 800B3908 21280000 */  addu       $a1, $zero, $zero
/* A410C 800B390C 21300000 */  addu       $a2, $zero, $zero
.L800B3910:
/* A4110 800B3910 09C5010C */  jal        SetPhysicsLinkedMoveData
/* A4114 800B3914 21380000 */   addu      $a3, $zero, $zero
/* A4118 800B3918 21204002 */  addu       $a0, $s2, $zero
/* A411C 800B391C 21284000 */  addu       $a1, $v0, $zero
/* A4120 800B3920 7FD2010C */  jal        PhysicsCheckLinkedMove
/* A4124 800B3924 05000624 */   addiu     $a2, $zero, 0x5
.L800B3928:
/* A4128 800B3928 3800BF8F */  lw         $ra, 0x38($sp)
/* A412C 800B392C 3400B38F */  lw         $s3, 0x34($sp)
/* A4130 800B3930 3000B28F */  lw         $s2, 0x30($sp)
/* A4134 800B3934 2C00B18F */  lw         $s1, 0x2C($sp)
/* A4138 800B3938 2800B08F */  lw         $s0, 0x28($sp)
/* A413C 800B393C 0800E003 */  jr         $ra
/* A4140 800B3940 4000BD27 */   addiu     $sp, $sp, 0x40
.size RazielAdditionalCollide, . - RazielAdditionalCollide
