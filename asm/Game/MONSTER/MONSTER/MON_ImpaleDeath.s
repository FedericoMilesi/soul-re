.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_ImpaleDeath
/* 79608 80088E08 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 7960C 80088E0C 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 79610 80088E10 21888000 */  addu       $s1, $a0, $zero
/* 79614 80088E14 2800BFAF */  sw         $ra, 0x28($sp)
/* 79618 80088E18 2400B3AF */  sw         $s3, 0x24($sp)
/* 7961C 80088E1C 2000B2AF */  sw         $s2, 0x20($sp)
/* 79620 80088E20 1800B0AF */  sw         $s0, 0x18($sp)
/* 79624 80088E24 6C01308E */  lw         $s0, 0x16C($s1)
/* 79628 80088E28 2400328E */  lw         $s2, 0x24($s1)
/* 7962C 80088E2C C3FF010C */  jal        MON_AnimPlaying
/* 79630 80088E30 0D000524 */   addiu     $a1, $zero, 0xD
/* 79634 80088E34 1E004010 */  beqz       $v0, .L80088EB0
/* 79638 80088E38 21202002 */   addu      $a0, $s1, $zero
/* 7963C 80088E3C B2C9010C */  jal        G2EmulationInstanceQueryFrame
/* 79640 80088E40 21280000 */   addu      $a1, $zero, $zero
/* 79644 80088E44 21202002 */  addu       $a0, $s1, $zero
/* 79648 80088E48 21280000 */  addu       $a1, $zero, $zero
/* 7964C 80088E4C BFC9010C */  jal        G2EmulationInstanceQueryLastFrame
/* 79650 80088E50 21984000 */   addu      $s3, $v0, $zero
/* 79654 80088E54 26004392 */  lbu        $v1, 0x26($s2)
/* 79658 80088E58 21204000 */  addu       $a0, $v0, $zero
/* 7965C 80088E5C 2A108300 */  slt        $v0, $a0, $v1
/* 79660 80088E60 09004010 */  beqz       $v0, .L80088E88
/* 79664 80088E64 2A106302 */   slt       $v0, $s3, $v1
/* 79668 80088E68 07004014 */  bnez       $v0, .L80088E88
/* 7966C 80088E6C 21302002 */   addu      $a2, $s1, $zero
/* 79670 80088E70 21202002 */  addu       $a0, $s1, $zero
/* 79674 80088E74 25004592 */  lbu        $a1, 0x25($s2)
/* 79678 80088E78 4B23010C */  jal        FX_Blood_Impale
/* 7967C 80088E7C 2138A000 */   addu      $a3, $a1, $zero
/* 79680 80088E80 AC230208 */  j          .L80088EB0
/* 79684 80088E84 00000000 */   nop
.L80088E88:
/* 79688 80088E88 27004392 */  lbu        $v1, 0x27($s2)
/* 7968C 80088E8C 00000000 */  nop
/* 79690 80088E90 2A108300 */  slt        $v0, $a0, $v1
/* 79694 80088E94 06004010 */  beqz       $v0, .L80088EB0
/* 79698 80088E98 2A106302 */   slt       $v0, $s3, $v1
/* 7969C 80088E9C 04004014 */  bnez       $v0, .L80088EB0
/* 796A0 80088EA0 21202002 */   addu      $a0, $s1, $zero
/* 796A4 80088EA4 25004592 */  lbu        $a1, 0x25($s2)
/* 796A8 80088EA8 BE23010C */  jal        FX_BloodCone
/* 796AC 80088EAC 50000624 */   addiu     $a2, $zero, 0x50
.L80088EB0:
/* 796B0 80088EB0 1800228E */  lw         $v0, 0x18($s1)
/* 796B4 80088EB4 00000000 */  nop
/* 796B8 80088EB8 10004230 */  andi       $v0, $v0, 0x10
/* 796BC 80088EBC 16004010 */  beqz       $v0, .L80088F18
/* 796C0 80088EC0 21202002 */   addu      $a0, $s1, $zero
/* 796C4 80088EC4 C3FF010C */  jal        MON_AnimPlaying
/* 796C8 80088EC8 0D000524 */   addiu     $a1, $zero, 0xD
/* 796CC 80088ECC 0A004010 */  beqz       $v0, .L80088EF8
/* 796D0 80088ED0 21202002 */   addu      $a0, $s1, $zero
/* 796D4 80088ED4 6801028E */  lw         $v0, 0x168($s0)
/* 796D8 80088ED8 00000000 */  nop
/* 796DC 80088EDC 0000428C */  lw         $v0, 0x0($v0)
/* 796E0 80088EE0 00000000 */  nop
/* 796E4 80088EE4 0D004380 */  lb         $v1, 0xD($v0)
/* 796E8 80088EE8 16004280 */  lb         $v0, 0x16($v0)
/* 796EC 80088EEC 00000000 */  nop
/* 796F0 80088EF0 05006214 */  bne        $v1, $v0, .L80088F08
/* 796F4 80088EF4 00000000 */   nop
.L80088EF8:
/* 796F8 80088EF8 91FE010C */  jal        MON_SwitchState
/* 796FC 80088EFC 17000524 */   addiu     $a1, $zero, 0x17
/* 79700 80088F00 C6230208 */  j          .L80088F18
/* 79704 80088F04 00000000 */   nop
.L80088F08:
/* 79708 80088F08 9006020C */  jal        MON_GetTime
/* 7970C 80088F0C 21202002 */   addu      $a0, $s1, $zero
/* 79710 80088F10 E8034224 */  addiu      $v0, $v0, 0x3E8
/* 79714 80088F14 140102AE */  sw         $v0, 0x114($s0)
.L80088F18:
/* 79718 80088F18 9006020C */  jal        MON_GetTime
/* 7971C 80088F1C 21202002 */   addu      $a0, $s1, $zero
/* 79720 80088F20 1401038E */  lw         $v1, 0x114($s0)
/* 79724 80088F24 00000000 */  nop
/* 79728 80088F28 2B186200 */  sltu       $v1, $v1, $v0
/* 7972C 80088F2C 0A006010 */  beqz       $v1, .L80088F58
/* 79730 80088F30 DFFF033C */   lui       $v1, (0xFFDFFFFF >> 16)
/* 79734 80088F34 FFFF6334 */  ori        $v1, $v1, (0xFFDFFFFF & 0xFFFF)
/* 79738 80088F38 0000028E */  lw         $v0, 0x0($s0)
/* 7973C 80088F3C 21202002 */  addu       $a0, $s1, $zero
/* 79740 80088F40 24104300 */  and        $v0, $v0, $v1
/* 79744 80088F44 4EFE010C */  jal        MON_TurnOnBodySpheres
/* 79748 80088F48 000002AE */   sw        $v0, 0x0($s0)
/* 7974C 80088F4C 21202002 */  addu       $a0, $s1, $zero
/* 79750 80088F50 91FE010C */  jal        MON_SwitchState
/* 79754 80088F54 04000524 */   addiu     $a1, $zero, 0x4
.L80088F58:
/* 79758 80088F58 27C3010C */  jal        DeMessageQueue
/* 7975C 80088F5C 08000426 */   addiu     $a0, $s0, 0x8
/* 79760 80088F60 24004010 */  beqz       $v0, .L80088FF4
/* 79764 80088F64 0001033C */   lui       $v1, (0x100000A >> 16)
/* 79768 80088F68 0000428C */  lw         $v0, 0x0($v0)
/* 7976C 80088F6C 0A006334 */  ori        $v1, $v1, (0x100000A & 0xFFFF)
/* 79770 80088F70 F9FF4314 */  bne        $v0, $v1, .L80088F58
/* 79774 80088F74 00000000 */   nop
/* 79778 80088F78 9006020C */  jal        MON_GetTime
/* 7977C 80088F7C 21202002 */   addu      $a0, $s1, $zero
/* 79780 80088F80 21200000 */  addu       $a0, $zero, $zero
/* 79784 80088F84 21288000 */  addu       $a1, $a0, $zero
/* 79788 80088F88 21308000 */  addu       $a2, $a0, $zero
/* 7978C 80088F8C D000038E */  lw         $v1, 0xD0($s0)
/* 79790 80088F90 30754224 */  addiu      $v0, $v0, 0x7530
/* 79794 80088F94 140102AE */  sw         $v0, 0x114($s0)
/* 79798 80088F98 3C00628C */  lw         $v0, 0x3C($v1)
/* 7979C 80088F9C 21382002 */  addu       $a3, $s1, $zero
/* 797A0 80088FA0 D40002AE */  sw         $v0, 0xD4($s0)
/* 797A4 80088FA4 03000224 */  addiu      $v0, $zero, 0x3
/* 797A8 80088FA8 21C4010C */  jal        SetObjectData
/* 797AC 80088FAC 1000A2AF */   sw        $v0, 0x10($sp)
/* 797B0 80088FB0 8000053C */  lui        $a1, (0x800002 >> 16)
/* 797B4 80088FB4 0200A534 */  ori        $a1, $a1, (0x800002 & 0xFFFF)
/* 797B8 80088FB8 D000048E */  lw         $a0, 0xD0($s0)
/* 797BC 80088FBC A1D1000C */  jal        INSTANCE_Post
/* 797C0 80088FC0 21304000 */   addu      $a2, $v0, $zero
/* 797C4 80088FC4 2000053C */  lui        $a1, (0x200003 >> 16)
/* 797C8 80088FC8 0300A534 */  ori        $a1, $a1, (0x200003 & 0xFFFF)
/* 797CC 80088FCC D000048E */  lw         $a0, 0xD0($s0)
/* 797D0 80088FD0 A1D1000C */  jal        INSTANCE_Post
/* 797D4 80088FD4 07000624 */   addiu     $a2, $zero, 0x7
/* 797D8 80088FD8 580100A2 */  sb         $zero, 0x158($s0)
/* 797DC 80088FDC 21202002 */  addu       $a0, $s1, $zero
/* 797E0 80088FE0 16000524 */  addiu      $a1, $zero, 0x16
/* 797E4 80088FE4 B6FF010C */  jal        MON_PlayAnim
/* 797E8 80088FE8 01000624 */   addiu     $a2, $zero, 0x1
/* 797EC 80088FEC D6230208 */  j          .L80088F58
/* 797F0 80088FF0 00000000 */   nop
.L80088FF4:
/* 797F4 80088FF4 2800BF8F */  lw         $ra, 0x28($sp)
/* 797F8 80088FF8 2400B38F */  lw         $s3, 0x24($sp)
/* 797FC 80088FFC 2000B28F */  lw         $s2, 0x20($sp)
/* 79800 80089000 1C00B18F */  lw         $s1, 0x1C($sp)
/* 79804 80089004 1800B08F */  lw         $s0, 0x18($sp)
/* 79808 80089008 0800E003 */  jr         $ra
/* 7980C 8008900C 3000BD27 */   addiu     $sp, $sp, 0x30
.size MON_ImpaleDeath, . - MON_ImpaleDeath
