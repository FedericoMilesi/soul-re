.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_GrabbedEntry
/* 79F30 80089730 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 79F34 80089734 1000B0AF */  sw         $s0, 0x10($sp)
/* 79F38 80089738 21808000 */  addu       $s0, $a0, $zero
/* 79F3C 8008973C 1800BFAF */  sw         $ra, 0x18($sp)
/* 79F40 80089740 1400B1AF */  sw         $s1, 0x14($sp)
/* 79F44 80089744 6C01118E */  lw         $s1, 0x16C($s0)
/* 79F48 80089748 00000000 */  nop
/* 79F4C 8008974C 6801228E */  lw         $v0, 0x168($s1)
/* 79F50 80089750 00000000 */  nop
/* 79F54 80089754 0000428C */  lw         $v0, 0x0($v0)
/* 79F58 80089758 00000000 */  nop
/* 79F5C 8008975C 04004380 */  lb         $v1, 0x4($v0)
/* 79F60 80089760 0E004280 */  lb         $v0, 0xE($v0)
/* 79F64 80089764 00000000 */  nop
/* 79F68 80089768 03006214 */  bne        $v1, $v0, .L80089778
/* 79F6C 8008976C 04000524 */   addiu     $a1, $zero, 0x4
/* 79F70 80089770 E0250208 */  j          .L80089780
/* 79F74 80089774 02000624 */   addiu     $a2, $zero, 0x2
.L80089778:
/* 79F78 80089778 21200002 */  addu       $a0, $s0, $zero
/* 79F7C 8008977C 01000624 */  addiu      $a2, $zero, 0x1
.L80089780:
/* 79F80 80089780 B6FF010C */  jal        MON_PlayAnim
/* 79F84 80089784 00000000 */   nop
/* 79F88 80089788 21200002 */  addu       $a0, $s0, $zero
/* 79F8C 8008978C 1800028E */  lw         $v0, 0x18($s0)
/* 79F90 80089790 BFFF0324 */  addiu      $v1, $zero, -0x41
/* 79F94 80089794 24104300 */  and        $v0, $v0, $v1
/* 79F98 80089798 9006020C */  jal        MON_GetTime
/* 79F9C 8008979C 180002AE */   sw        $v0, 0x18($s0)
/* 79FA0 800897A0 6801238E */  lw         $v1, 0x168($s1)
/* 79FA4 800897A4 00000000 */  nop
/* 79FA8 800897A8 0800638C */  lw         $v1, 0x8($v1)
/* 79FAC 800897AC 00000000 */  nop
/* 79FB0 800897B0 08006384 */  lh         $v1, 0x8($v1)
/* 79FB4 800897B4 21200002 */  addu       $a0, $s0, $zero
/* 79FB8 800897B8 21104300 */  addu       $v0, $v0, $v1
/* 79FBC 800897BC 140122AE */  sw         $v0, 0x114($s1)
/* 79FC0 800897C0 F4BD858F */  lw         $a1, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 79FC4 800897C4 47D5000C */  jal        INSTANCE_LinkToParent
/* 79FC8 800897C8 31000624 */   addiu     $a2, $zero, 0x31
/* 79FCC 800897CC C400228E */  lw         $v0, 0xC4($s1)
/* 79FD0 800897D0 00000000 */  nop
/* 79FD4 800897D4 0400428C */  lw         $v0, 0x4($v0)
/* 79FD8 800897D8 00000000 */  nop
/* 79FDC 800897DC 78004294 */  lhu        $v0, 0x78($v0)
/* 79FE0 800897E0 00000000 */  nop
/* 79FE4 800897E4 00084224 */  addiu      $v0, $v0, 0x800
/* 79FE8 800897E8 780002A6 */  sh         $v0, 0x78($s0)
/* 79FEC 800897EC 2A0120A6 */  sh         $zero, 0x12A($s1)
/* 79FF0 800897F0 5800028E */  lw         $v0, 0x58($s0)
/* 79FF4 800897F4 00000000 */  nop
/* 79FF8 800897F8 20004234 */  ori        $v0, $v0, 0x20
/* 79FFC 800897FC 580002AE */  sw         $v0, 0x58($s0)
/* 7A000 80089800 1800BF8F */  lw         $ra, 0x18($sp)
/* 7A004 80089804 1400B18F */  lw         $s1, 0x14($sp)
/* 7A008 80089808 1000B08F */  lw         $s0, 0x10($sp)
/* 7A00C 8008980C 0800E003 */  jr         $ra
/* 7A010 80089810 2000BD27 */   addiu     $sp, $sp, 0x20
.size MON_GrabbedEntry, . - MON_GrabbedEntry
