.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_SetVelocityTowardsImpalingObject
/* 74578 80083D78 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 7457C 80083D7C 2C00B3AF */  sw         $s3, 0x2C($sp)
/* 74580 80083D80 21988000 */  addu       $s3, $a0, $zero
/* 74584 80083D84 3400BFAF */  sw         $ra, 0x34($sp)
/* 74588 80083D88 3000B4AF */  sw         $s4, 0x30($sp)
/* 7458C 80083D8C 2800B2AF */  sw         $s2, 0x28($sp)
/* 74590 80083D90 2400B1AF */  sw         $s1, 0x24($sp)
/* 74594 80083D94 2000B0AF */  sw         $s0, 0x20($sp)
/* 74598 80083D98 3800648E */  lw         $a0, 0x38($s3)
/* 7459C 80083D9C 1C66010C */  jal        STREAM_GetLevelWithID
/* 745A0 80083DA0 21A0A000 */   addu      $s4, $a1, $zero
/* 745A4 80083DA4 2400638E */  lw         $v1, 0x24($s3)
/* 745A8 80083DA8 00000000 */  nop
/* 745AC 80083DAC 1000638C */  lw         $v1, 0x10($v1)
/* 745B0 80083DB0 00000000 */  nop
/* 745B4 80083DB4 08006330 */  andi       $v1, $v1, 0x8
/* 745B8 80083DB8 43006014 */  bnez       $v1, .L80083EC8
/* 745BC 80083DBC 21804000 */   addu      $s0, $v0, $zero
/* 745C0 80083DC0 850D020C */  jal        MON_FindSphereForTerrain
/* 745C4 80083DC4 21206002 */   addu      $a0, $s3, $zero
/* 745C8 80083DC8 3F004010 */  beqz       $v0, .L80083EC8
/* 745CC 80083DCC 1800A627 */   addiu     $a2, $sp, 0x18
/* 745D0 80083DD0 0400458C */  lw         $a1, 0x4($v0)
/* 745D4 80083DD4 03004490 */  lbu        $a0, 0x3($v0)
/* 745D8 80083DD8 4000628E */  lw         $v0, 0x40($s3)
/* 745DC 80083DDC 40210400 */  sll        $a0, $a0, 5
/* 745E0 80083DE0 690D020C */  jal        MON_SphereWorldPos
/* 745E4 80083DE4 21204400 */   addu      $a0, $v0, $a0
/* 745E8 80083DE8 0000028E */  lw         $v0, 0x0($s0)
/* 745EC 80083DEC 00000000 */  nop
/* 745F0 80083DF0 0800528C */  lw         $s2, 0x8($v0)
/* 745F4 80083DF4 0C00518C */  lw         $s1, 0xC($v0)
/* 745F8 80083DF8 11004012 */  beqz       $s2, .L80083E40
/* 745FC 80083DFC 18003026 */   addiu     $s0, $s1, 0x18
.L80083E00:
/* 74600 80083E00 1400028E */  lw         $v0, 0x14($s0)
/* 74604 80083E04 00000000 */  nop
/* 74608 80083E08 00804230 */  andi       $v0, $v0, 0x8000
/* 7460C 80083E0C 08004010 */  beqz       $v0, .L80083E30
/* 74610 80083E10 21206002 */   addu      $a0, $s3, $zero
/* 74614 80083E14 1000B4AF */  sw         $s4, 0x10($sp)
/* 74618 80083E18 1800A527 */  addiu      $a1, $sp, 0x18
/* 7461C 80083E1C 20002626 */  addiu      $a2, $s1, 0x20
/* 74620 80083E20 6C0E020C */  jal        MON_ReachableIntro
/* 74624 80083E24 21380002 */   addu      $a3, $s0, $zero
/* 74628 80083E28 28004014 */  bnez       $v0, .L80083ECC
/* 7462C 80083E2C 01000224 */   addiu     $v0, $zero, 0x1
.L80083E30:
/* 74630 80083E30 FFFF5226 */  addiu      $s2, $s2, -0x1
/* 74634 80083E34 4C001026 */  addiu      $s0, $s0, 0x4C
/* 74638 80083E38 F1FF4016 */  bnez       $s2, .L80083E00
/* 7463C 80083E3C 4C003126 */   addiu     $s1, $s1, 0x4C
.L80083E40:
/* 74640 80083E40 FCBD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x34)($gp)
/* 74644 80083E44 00000000 */  nop
/* 74648 80083E48 0400508C */  lw         $s0, 0x4($v0)
/* 7464C 80083E4C 00000000 */  nop
/* 74650 80083E50 1D000012 */  beqz       $s0, .L80083EC8
/* 74654 80083E54 03001124 */   addiu     $s1, $zero, 0x3
/* 74658 80083E58 21200002 */  addu       $a0, $s0, $zero
.L80083E5C:
/* 7465C 80083E5C 92D1000C */  jal        INSTANCE_Query
/* 74660 80083E60 01000524 */   addiu     $a1, $zero, 0x1
/* 74664 80083E64 20004230 */  andi       $v0, $v0, 0x20
/* 74668 80083E68 13004010 */  beqz       $v0, .L80083EB8
/* 7466C 80083E6C 00000000 */   nop
/* 74670 80083E70 2400038E */  lw         $v1, 0x24($s0)
/* 74674 80083E74 00000000 */  nop
/* 74678 80083E78 02006294 */  lhu        $v0, 0x2($v1)
/* 7467C 80083E7C 00000000 */  nop
/* 74680 80083E80 0D005114 */  bne        $v0, $s1, .L80083EB8
/* 74684 80083E84 00000000 */   nop
/* 74688 80083E88 08006294 */  lhu        $v0, 0x8($v1)
/* 7468C 80083E8C 00000000 */  nop
/* 74690 80083E90 58004230 */  andi       $v0, $v0, 0x58
/* 74694 80083E94 08004010 */  beqz       $v0, .L80083EB8
/* 74698 80083E98 21206002 */   addu      $a0, $s3, $zero
/* 7469C 80083E9C 1000B4AF */  sw         $s4, 0x10($sp)
/* 746A0 80083EA0 1800A527 */  addiu      $a1, $sp, 0x18
/* 746A4 80083EA4 5C000626 */  addiu      $a2, $s0, 0x5C
/* 746A8 80083EA8 6C0E020C */  jal        MON_ReachableIntro
/* 746AC 80083EAC 21380000 */   addu      $a3, $zero, $zero
/* 746B0 80083EB0 06004014 */  bnez       $v0, .L80083ECC
/* 746B4 80083EB4 01000224 */   addiu     $v0, $zero, 0x1
.L80083EB8:
/* 746B8 80083EB8 0800108E */  lw         $s0, 0x8($s0)
/* 746BC 80083EBC 00000000 */  nop
/* 746C0 80083EC0 E6FF0016 */  bnez       $s0, .L80083E5C
/* 746C4 80083EC4 21200002 */   addu      $a0, $s0, $zero
.L80083EC8:
/* 746C8 80083EC8 21100000 */  addu       $v0, $zero, $zero
.L80083ECC:
/* 746CC 80083ECC 3400BF8F */  lw         $ra, 0x34($sp)
/* 746D0 80083ED0 3000B48F */  lw         $s4, 0x30($sp)
/* 746D4 80083ED4 2C00B38F */  lw         $s3, 0x2C($sp)
/* 746D8 80083ED8 2800B28F */  lw         $s2, 0x28($sp)
/* 746DC 80083EDC 2400B18F */  lw         $s1, 0x24($sp)
/* 746E0 80083EE0 2000B08F */  lw         $s0, 0x20($sp)
/* 746E4 80083EE4 0800E003 */  jr         $ra
/* 746E8 80083EE8 3800BD27 */   addiu     $sp, $sp, 0x38
.size MON_SetVelocityTowardsImpalingObject, . - MON_SetVelocityTowardsImpalingObject
