.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DEBUG_ViewVram
/* 4E7C 8001467C D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 4E80 80014680 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 4E84 80014684 21888000 */  addu       $s1, $a0, $zero
/* 4E88 80014688 48002426 */  addiu      $a0, $s1, 0x48
/* 4E8C 8001468C 2000BFAF */  sw         $ra, 0x20($sp)
/* 4E90 80014690 1800B0AF */  sw         $s0, 0x18($sp)
/* 4E94 80014694 0400828C */  lw         $v0, 0x4($a0)
/* 4E98 80014698 00000000 */  nop
/* 4E9C 8001469C 01004230 */  andi       $v0, $v0, 0x1
/* 4EA0 800146A0 06004010 */  beqz       $v0, .L800146BC
/* 4EA4 800146A4 00000000 */   nop
/* 4EA8 800146A8 048E828F */  lw         $v0, %gp_rel(AXIS_LENGTH + 0xD8)($gp)
/* 4EAC 800146AC 00000000 */  nop
/* 4EB0 800146B0 02004004 */  bltz       $v0, .L800146BC
/* 4EB4 800146B4 E0FF4224 */   addiu     $v0, $v0, -0x20
/* 4EB8 800146B8 048E82AF */  sw         $v0, %gp_rel(AXIS_LENGTH + 0xD8)($gp)
.L800146BC:
/* 4EBC 800146BC 0400828C */  lw         $v0, 0x4($a0)
/* 4EC0 800146C0 00000000 */  nop
/* 4EC4 800146C4 02004230 */  andi       $v0, $v0, 0x2
/* 4EC8 800146C8 07004010 */  beqz       $v0, .L800146E8
/* 4ECC 800146CC 00000000 */   nop
/* 4ED0 800146D0 048E838F */  lw         $v1, %gp_rel(AXIS_LENGTH + 0xD8)($gp)
/* 4ED4 800146D4 00000000 */  nop
/* 4ED8 800146D8 10016228 */  slti       $v0, $v1, 0x110
/* 4EDC 800146DC 02004010 */  beqz       $v0, .L800146E8
/* 4EE0 800146E0 20006224 */   addiu     $v0, $v1, 0x20
/* 4EE4 800146E4 048E82AF */  sw         $v0, %gp_rel(AXIS_LENGTH + 0xD8)($gp)
.L800146E8:
/* 4EE8 800146E8 0400828C */  lw         $v0, 0x4($a0)
/* 4EEC 800146EC 00000000 */  nop
/* 4EF0 800146F0 04004230 */  andi       $v0, $v0, 0x4
/* 4EF4 800146F4 06004010 */  beqz       $v0, .L80014710
/* 4EF8 800146F8 00000000 */   nop
/* 4EFC 800146FC 008E828F */  lw         $v0, %gp_rel(AXIS_LENGTH + 0xD4)($gp)
/* 4F00 80014700 00000000 */  nop
/* 4F04 80014704 02004004 */  bltz       $v0, .L80014710
/* 4F08 80014708 E0FF4224 */   addiu     $v0, $v0, -0x20
/* 4F0C 8001470C 008E82AF */  sw         $v0, %gp_rel(AXIS_LENGTH + 0xD4)($gp)
.L80014710:
/* 4F10 80014710 0400828C */  lw         $v0, 0x4($a0)
/* 4F14 80014714 00000000 */  nop
/* 4F18 80014718 08004230 */  andi       $v0, $v0, 0x8
/* 4F1C 8001471C 07004010 */  beqz       $v0, .L8001473C
/* 4F20 80014720 00000000 */   nop
/* 4F24 80014724 008E838F */  lw         $v1, %gp_rel(AXIS_LENGTH + 0xD4)($gp)
/* 4F28 80014728 00000000 */  nop
/* 4F2C 8001472C 00026228 */  slti       $v0, $v1, 0x200
/* 4F30 80014730 02004010 */  beqz       $v0, .L8001473C
/* 4F34 80014734 20006224 */   addiu     $v0, $v1, 0x20
/* 4F38 80014738 008E82AF */  sw         $v0, %gp_rel(AXIS_LENGTH + 0xD4)($gp)
.L8001473C:
/* 4F3C 8001473C 5CBC8427 */  addiu      $a0, $gp, %gp_rel(disp)
/* 4F40 80014740 00020724 */  addiu      $a3, $zero, 0x200
/* 4F44 80014744 008E858F */  lw         $a1, %gp_rel(AXIS_LENGTH + 0xD4)($gp)
/* 4F48 80014748 048E868F */  lw         $a2, %gp_rel(AXIS_LENGTH + 0xD8)($gp)
/* 4F4C 8001474C F0001024 */  addiu      $s0, $zero, 0xF0
/* 4F50 80014750 E2F2020C */  jal        SetDefDispEnv
/* 4F54 80014754 1000B0AF */   sw        $s0, 0x10($sp)
/* 4F58 80014758 70BC8427 */  addiu      $a0, $gp, %gp_rel(disp + 0x14)
/* 4F5C 8001475C 008E858F */  lw         $a1, %gp_rel(AXIS_LENGTH + 0xD4)($gp)
/* 4F60 80014760 048E868F */  lw         $a2, %gp_rel(AXIS_LENGTH + 0xD8)($gp)
/* 4F64 80014764 00020724 */  addiu      $a3, $zero, 0x200
/* 4F68 80014768 E2F2020C */  jal        SetDefDispEnv
/* 4F6C 8001476C 1000B0AF */   sw        $s0, 0x10($sp)
/* 4F70 80014770 2C00238E */  lw         $v1, 0x2C($s1)
/* 4F74 80014774 00000000 */  nop
/* 4F78 80014778 1400628C */  lw         $v0, 0x14($v1)
/* 4F7C 8001477C 00000000 */  nop
/* 4F80 80014780 00014234 */  ori        $v0, $v0, 0x100
/* 4F84 80014784 140062AC */  sw         $v0, 0x14($v1)
/* 4F88 80014788 2000BF8F */  lw         $ra, 0x20($sp)
/* 4F8C 8001478C 1C00B18F */  lw         $s1, 0x1C($sp)
/* 4F90 80014790 1800B08F */  lw         $s0, 0x18($sp)
/* 4F94 80014794 0800E003 */  jr         $ra
/* 4F98 80014798 2800BD27 */   addiu     $sp, $sp, 0x28
.size DEBUG_ViewVram, . - DEBUG_ViewVram
