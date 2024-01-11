.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DropPhysOb
/* 60E38 80070638 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 60E3C 8007063C 1400B1AF */  sw         $s1, 0x14($sp)
/* 60E40 80070640 21888000 */  addu       $s1, $a0, $zero
/* 60E44 80070644 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 60E48 80070648 2000BFAF */  sw         $ra, 0x20($sp)
/* 60E4C 8007064C 1800B2AF */  sw         $s2, 0x18($sp)
/* 60E50 80070650 1000B0AF */  sw         $s0, 0x10($sp)
/* 60E54 80070654 4801328E */  lw         $s2, 0x148($s1)
/* 60E58 80070658 6C01308E */  lw         $s0, 0x16C($s1)
/* 60E5C 8007065C 05004012 */  beqz       $s2, .L80070674
/* 60E60 80070660 2198A000 */   addu      $s3, $a1, $zero
/* 60E64 80070664 76D5000C */  jal        INSTANCE_UnlinkFromParent
/* 60E68 80070668 00000000 */   nop
/* 60E6C 8007066C A3C10108 */  j          .L8007068C
/* 60E70 80070670 21202002 */   addu      $a0, $s1, $zero
.L80070674:
/* 60E74 80070674 7FFF033C */  lui        $v1, (0xFF7FFFFF >> 16)
/* 60E78 80070678 0000028E */  lw         $v0, 0x0($s0)
/* 60E7C 8007067C FFFF6334 */  ori        $v1, $v1, (0xFF7FFFFF & 0xFFFF)
/* 60E80 80070680 24104300 */  and        $v0, $v0, $v1
/* 60E84 80070684 000002AE */  sw         $v0, 0x0($s0)
/* 60E88 80070688 21202002 */  addu       $a0, $s1, $zero
.L8007068C:
/* 60E8C 8007068C 4CBB010C */  jal        PHYSOB_CheckDroppedLineCollision
/* 60E90 80070690 21284002 */   addu      $a1, $s2, $zero
/* 60E94 80070694 02006232 */  andi       $v0, $s3, 0x2
/* 60E98 80070698 08004010 */  beqz       $v0, .L800706BC
/* 60E9C 8007069C 6FFF0324 */   addiu     $v1, $zero, -0x91
/* 60EA0 800706A0 0000028E */  lw         $v0, 0x0($s0)
/* 60EA4 800706A4 00000000 */  nop
/* 60EA8 800706A8 24104300 */  and        $v0, $v0, $v1
/* 60EAC 800706AC 00104234 */  ori        $v0, $v0, 0x1000
/* 60EB0 800706B0 000002AE */  sw         $v0, 0x0($s0)
/* 60EB4 800706B4 C1C10108 */  j          .L80070704
/* 60EB8 800706B8 880120AE */   sw        $zero, 0x188($s1)
.L800706BC:
/* 60EBC 800706BC 04006232 */  andi       $v0, $s3, 0x4
/* 60EC0 800706C0 07004014 */  bnez       $v0, .L800706E0
/* 60EC4 800706C4 4000043C */   lui       $a0, (0x400004 >> 16)
/* 60EC8 800706C8 02004012 */  beqz       $s2, .L800706D4
/* 60ECC 800706CC 21280000 */   addu      $a1, $zero, $zero
/* 60ED0 800706D0 7CFC0524 */  addiu      $a1, $zero, -0x384
.L800706D4:
/* 60ED4 800706D4 45C0010C */  jal        PHYSOB_ReAlignFalling
/* 60ED8 800706D8 21202002 */   addu      $a0, $s1, $zero
/* 60EDC 800706DC 4000043C */  lui        $a0, (0x400004 >> 16)
.L800706E0:
/* 60EE0 800706E0 04008434 */  ori        $a0, $a0, (0x400004 & 0xFFFF)
/* 60EE4 800706E4 0000028E */  lw         $v0, 0x0($s0)
/* 60EE8 800706E8 6FEF0324 */  addiu      $v1, $zero, -0x1091
/* 60EEC 800706EC 400012AE */  sw         $s2, 0x40($s0)
/* 60EF0 800706F0 24104300 */  and        $v0, $v0, $v1
/* 60EF4 800706F4 25104400 */  or         $v0, $v0, $a0
/* 60EF8 800706F8 000002AE */  sw         $v0, 0x0($s0)
/* 60EFC 800706FC F6FF0224 */  addiu      $v0, $zero, -0xA
/* 60F00 80070700 880122AE */  sw         $v0, 0x188($s1)
.L80070704:
/* 60F04 80070704 740120AE */  sw         $zero, 0x174($s1)
/* 60F08 80070708 780120AE */  sw         $zero, 0x178($s1)
/* 60F0C 8007070C 7C0120AE */  sw         $zero, 0x17C($s1)
/* 60F10 80070710 800120AE */  sw         $zero, 0x180($s1)
/* 60F14 80070714 840120AE */  sw         $zero, 0x184($s1)
/* 60F18 80070718 2000BF8F */  lw         $ra, 0x20($sp)
/* 60F1C 8007071C 1C00B38F */  lw         $s3, 0x1C($sp)
/* 60F20 80070720 1800B28F */  lw         $s2, 0x18($sp)
/* 60F24 80070724 1400B18F */  lw         $s1, 0x14($sp)
/* 60F28 80070728 1000B08F */  lw         $s0, 0x10($sp)
/* 60F2C 8007072C 0800E003 */  jr         $ra
/* 60F30 80070730 2800BD27 */   addiu     $sp, $sp, 0x28
.size DropPhysOb, . - DropPhysOb
