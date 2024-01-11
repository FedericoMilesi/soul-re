.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PHYSOBS_CheckForValidMove
/* 5FC88 8006F488 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 5FC8C 8006F48C 3800B2AF */  sw         $s2, 0x38($sp)
/* 5FC90 8006F490 21908000 */  addu       $s2, $a0, $zero
/* 5FC94 8006F494 01000224 */  addiu      $v0, $zero, 0x1
/* 5FC98 8006F498 3C00BFAF */  sw         $ra, 0x3C($sp)
/* 5FC9C 8006F49C 3400B1AF */  sw         $s1, 0x34($sp)
/* 5FCA0 8006F4A0 3000B0AF */  sw         $s0, 0x30($sp)
/* 5FCA4 8006F4A4 E0BF82A3 */  sb         $v0, %gp_rel(gameTrackerX + 0x218)($gp)
/* 5FCA8 8006F4A8 6C01508E */  lw         $s0, 0x16C($s2)
/* 5FCAC 8006F4AC 00000000 */  nop
/* 5FCB0 8006F4B0 0000028E */  lw         $v0, 0x0($s0)
/* 5FCB4 8006F4B4 07000324 */  addiu      $v1, $zero, 0x7
/* 5FCB8 8006F4B8 01004230 */  andi       $v0, $v0, 0x1
/* 5FCBC 8006F4BC 35014010 */  beqz       $v0, .L8006F994
/* 5FCC0 8006F4C0 2400A3AF */   sw        $v1, 0x24($sp)
/* 5FCC4 8006F4C4 A0000424 */  addiu      $a0, $zero, 0xA0
/* 5FCC8 8006F4C8 80020524 */  addiu      $a1, $zero, 0x280
/* 5FCCC 8006F4CC 21300000 */  addu       $a2, $zero, $zero
/* 5FCD0 8006F4D0 2138C000 */  addu       $a3, $a2, $zero
/* 5FCD4 8006F4D4 500B0224 */  addiu      $v0, $zero, 0xB50
/* 5FCD8 8006F4D8 1000A0AF */  sw         $zero, 0x10($sp)
/* 5FCDC 8006F4DC 4FC4010C */  jal        SetPhysicsGravityData
/* 5FCE0 8006F4E0 1400A2AF */   sw        $v0, 0x14($sp)
/* 5FCE4 8006F4E4 21204002 */  addu       $a0, $s2, $zero
/* 5FCE8 8006F4E8 46D9010C */  jal        PhysicsUpdateTface
/* 5FCEC 8006F4EC 21284000 */   addu      $a1, $v0, $zero
/* 5FCF0 8006F4F0 04000286 */  lh         $v0, 0x4($s0)
/* 5FCF4 8006F4F4 21204002 */  addu       $a0, $s2, $zero
/* 5FCF8 8006F4F8 40280200 */  sll        $a1, $v0, 1
/* 5FCFC 8006F4FC 2128A200 */  addu       $a1, $a1, $v0
/* 5FD00 8006F500 80280500 */  sll        $a1, $a1, 2
/* 5FD04 8006F504 2328A200 */  subu       $a1, $a1, $v0
/* 5FD08 8006F508 06000286 */  lh         $v0, 0x6($s0)
/* 5FD0C 8006F50C 80290500 */  sll        $a1, $a1, 6
/* 5FD10 8006F510 40300200 */  sll        $a2, $v0, 1
/* 5FD14 8006F514 2130C200 */  addu       $a2, $a2, $v0
/* 5FD18 8006F518 80300600 */  sll        $a2, $a2, 2
/* 5FD1C 8006F51C 2330C200 */  subu       $a2, $a2, $v0
/* 5FD20 8006F520 98BC010C */  jal        PHYSOBS_CheckForStackedForwardHits
/* 5FD24 8006F524 80310600 */   sll       $a2, $a2, 6
/* 5FD28 8006F528 1A014014 */  bnez       $v0, .L8006F994
/* 5FD2C 8006F52C 21204002 */   addu      $a0, $s2, $zero
/* 5FD30 8006F530 04000586 */  lh         $a1, 0x4($s0)
/* 5FD34 8006F534 06000686 */  lh         $a2, 0x6($s0)
/* 5FD38 8006F538 67C2010C */  jal        PHYSOB_CheckSlide
/* 5FD3C 8006F53C 2000A727 */   addiu     $a3, $sp, 0x20
/* 5FD40 8006F540 21884000 */  addu       $s1, $v0, $zero
/* 5FD44 8006F544 02002232 */  andi       $v0, $s1, 0x2
/* 5FD48 8006F548 3A004010 */  beqz       $v0, .L8006F634
/* 5FD4C 8006F54C 4F0E0524 */   addiu     $a1, $zero, 0xE4F
/* 5FD50 8006F550 2000A28F */  lw         $v0, 0x20($sp)
/* 5FD54 8006F554 00000000 */  nop
/* 5FD58 8006F558 0C004484 */  lh         $a0, 0xC($v0)
/* 5FD5C 8006F55C B6B9010C */  jal        CheckSlope
/* 5FD60 8006F560 04000624 */   addiu     $a2, $zero, 0x4
/* 5FD64 8006F564 0B014014 */  bnez       $v0, .L8006F994
/* 5FD68 8006F568 00100524 */   addiu     $a1, $zero, 0x1000
/* 5FD6C 8006F56C 2000A28F */  lw         $v0, 0x20($sp)
/* 5FD70 8006F570 00000000 */  nop
/* 5FD74 8006F574 0C004484 */  lh         $a0, 0xC($v0)
/* 5FD78 8006F578 B6B9010C */  jal        CheckSlope
/* 5FD7C 8006F57C 04000624 */   addiu     $a2, $zero, 0x4
/* 5FD80 8006F580 04014014 */  bnez       $v0, .L8006F994
/* 5FD84 8006F584 00000000 */   nop
/* 5FD88 8006F588 0000028E */  lw         $v0, 0x0($s0)
/* 5FD8C 8006F58C 00000000 */  nop
/* 5FD90 8006F590 08004230 */  andi       $v0, $v0, 0x8
/* 5FD94 8006F594 FF004010 */  beqz       $v0, .L8006F994
/* 5FD98 8006F598 04002232 */   andi      $v0, $s1, 0x4
/* 5FD9C 8006F59C FD004010 */  beqz       $v0, .L8006F994
/* 5FDA0 8006F5A0 21204002 */   addu      $a0, $s2, $zero
/* 5FDA4 8006F5A4 04000286 */  lh         $v0, 0x4($s0)
/* 5FDA8 8006F5A8 80020724 */  addiu      $a3, $zero, 0x280
/* 5FDAC 8006F5AC 40280200 */  sll        $a1, $v0, 1
/* 5FDB0 8006F5B0 2128A200 */  addu       $a1, $a1, $v0
/* 5FDB4 8006F5B4 80280500 */  sll        $a1, $a1, 2
/* 5FDB8 8006F5B8 2328A200 */  subu       $a1, $a1, $v0
/* 5FDBC 8006F5BC 06000286 */  lh         $v0, 0x6($s0)
/* 5FDC0 8006F5C0 80290500 */  sll        $a1, $a1, 6
/* 5FDC4 8006F5C4 40300200 */  sll        $a2, $v0, 1
/* 5FDC8 8006F5C8 2130C200 */  addu       $a2, $a2, $v0
/* 5FDCC 8006F5CC 80300600 */  sll        $a2, $a2, 2
/* 5FDD0 8006F5D0 2330C200 */  subu       $a2, $a2, $v0
/* 5FDD4 8006F5D4 7BBC010C */  jal        PHYSOB_CheckDirectedLineCollision
/* 5FDD8 8006F5D8 80310600 */   sll       $a2, $a2, 6
/* 5FDDC 8006F5DC ED004014 */  bnez       $v0, .L8006F994
/* 5FDE0 8006F5E0 00000000 */   nop
/* 5FDE4 8006F5E4 2000A28F */  lw         $v0, 0x20($sp)
/* 5FDE8 8006F5E8 00000000 */  nop
/* 5FDEC 8006F5EC 1E004384 */  lh         $v1, 0x1E($v0)
/* 5FDF0 8006F5F0 A9000224 */  addiu      $v0, $zero, 0xA9
/* 5FDF4 8006F5F4 23104300 */  subu       $v0, $v0, $v1
/* 5FDF8 8006F5F8 1300422C */  sltiu      $v0, $v0, 0x13
/* 5FDFC 8006F5FC E5004010 */  beqz       $v0, .L8006F994
/* 5FE00 8006F600 21204002 */   addu      $a0, $s2, $zero
/* 5FE04 8006F604 21280002 */  addu       $a1, $s0, $zero
/* 5FE08 8006F608 02000624 */  addiu      $a2, $zero, 0x2
/* 5FE0C 8006F60C 07000724 */  addiu      $a3, $zero, 0x7
/* 5FE10 8006F610 01000224 */  addiu      $v0, $zero, 0x1
/* 5FE14 8006F614 B7BC010C */  jal        PHYSOBS_SetNewAnim
/* 5FE18 8006F618 1000A2AF */   sw        $v0, 0x10($sp)
/* 5FE1C 8006F61C 2400A28F */  lw         $v0, 0x24($sp)
/* 5FE20 8006F620 FBFF0324 */  addiu      $v1, $zero, -0x5
/* 5FE24 8006F624 24104300 */  and        $v0, $v0, $v1
/* 5FE28 8006F628 08004234 */  ori        $v0, $v0, 0x8
/* 5FE2C 8006F62C 66BE0108 */  j          .L8006F998
/* 5FE30 8006F630 2400A2AF */   sw        $v0, 0x24($sp)
.L8006F634:
/* 5FE34 8006F634 00402232 */  andi       $v0, $s1, 0x4000
/* 5FE38 8006F638 99004010 */  beqz       $v0, .L8006F8A0
/* 5FE3C 8006F63C 21204002 */   addu      $a0, $s2, $zero
/* 5FE40 8006F640 0000038E */  lw         $v1, 0x0($s0)
/* 5FE44 8006F644 00000000 */  nop
/* 5FE48 8006F648 08006230 */  andi       $v0, $v1, 0x8
/* 5FE4C 8006F64C 17004010 */  beqz       $v0, .L8006F6AC
/* 5FE50 8006F650 00026230 */   andi      $v0, $v1, 0x200
/* 5FE54 8006F654 02004010 */  beqz       $v0, .L8006F660
/* 5FE58 8006F658 00802232 */   andi      $v0, $s1, 0x8000
/* 5FE5C 8006F65C 2400A0AF */  sw         $zero, 0x24($sp)
.L8006F660:
/* 5FE60 8006F660 11004014 */  bnez       $v0, .L8006F6A8
/* 5FE64 8006F664 21204002 */   addu      $a0, $s2, $zero
/* 5FE68 8006F668 04000286 */  lh         $v0, 0x4($s0)
/* 5FE6C 8006F66C 80020724 */  addiu      $a3, $zero, 0x280
/* 5FE70 8006F670 40280200 */  sll        $a1, $v0, 1
/* 5FE74 8006F674 2128A200 */  addu       $a1, $a1, $v0
/* 5FE78 8006F678 80280500 */  sll        $a1, $a1, 2
/* 5FE7C 8006F67C 2328A200 */  subu       $a1, $a1, $v0
/* 5FE80 8006F680 06000286 */  lh         $v0, 0x6($s0)
/* 5FE84 8006F684 80290500 */  sll        $a1, $a1, 6
/* 5FE88 8006F688 40300200 */  sll        $a2, $v0, 1
/* 5FE8C 8006F68C 2130C200 */  addu       $a2, $a2, $v0
/* 5FE90 8006F690 80300600 */  sll        $a2, $a2, 2
/* 5FE94 8006F694 2330C200 */  subu       $a2, $a2, $v0
/* 5FE98 8006F698 7BBC010C */  jal        PHYSOB_CheckDirectedLineCollision
/* 5FE9C 8006F69C 80310600 */   sll       $a2, $a2, 6
/* 5FEA0 8006F6A0 02004010 */  beqz       $v0, .L8006F6AC
/* 5FEA4 8006F6A4 00000000 */   nop
.L8006F6A8:
/* 5FEA8 8006F6A8 2400A0AF */  sw         $zero, 0x24($sp)
.L8006F6AC:
/* 5FEAC 8006F6AC 2400A28F */  lw         $v0, 0x24($sp)
/* 5FEB0 8006F6B0 00000000 */  nop
/* 5FEB4 8006F6B4 B9004010 */  beqz       $v0, .L8006F99C
/* 5FEB8 8006F6B8 C6FE0524 */   addiu     $a1, $zero, -0x13A
/* 5FEBC 8006F6BC 2000A28F */  lw         $v0, 0x20($sp)
/* 5FEC0 8006F6C0 00000000 */  nop
/* 5FEC4 8006F6C4 2400448C */  lw         $a0, 0x24($v0)
/* 5FEC8 8006F6C8 B6B9010C */  jal        CheckSlope
/* 5FECC 8006F6CC 04000624 */   addiu     $a2, $zero, 0x4
/* 5FED0 8006F6D0 B0004014 */  bnez       $v0, .L8006F994
/* 5FED4 8006F6D4 3A010524 */   addiu     $a1, $zero, 0x13A
/* 5FED8 8006F6D8 2000A28F */  lw         $v0, 0x20($sp)
/* 5FEDC 8006F6DC 00000000 */  nop
/* 5FEE0 8006F6E0 2400448C */  lw         $a0, 0x24($v0)
/* 5FEE4 8006F6E4 B6B9010C */  jal        CheckSlope
/* 5FEE8 8006F6E8 04000624 */   addiu     $a2, $zero, 0x4
/* 5FEEC 8006F6EC A9004014 */  bnez       $v0, .L8006F994
/* 5FEF0 8006F6F0 00000000 */   nop
/* 5FEF4 8006F6F4 0000028E */  lw         $v0, 0x0($s0)
/* 5FEF8 8006F6F8 00000000 */  nop
/* 5FEFC 8006F6FC 00024230 */  andi       $v0, $v0, 0x200
/* 5FF00 8006F700 A4004014 */  bnez       $v0, .L8006F994
/* 5FF04 8006F704 4F0E0524 */   addiu     $a1, $zero, 0xE4F
/* 5FF08 8006F708 2000A28F */  lw         $v0, 0x20($sp)
/* 5FF0C 8006F70C 00000000 */  nop
/* 5FF10 8006F710 14004484 */  lh         $a0, 0x14($v0)
/* 5FF14 8006F714 B6B9010C */  jal        CheckSlope
/* 5FF18 8006F718 04000624 */   addiu     $a2, $zero, 0x4
/* 5FF1C 8006F71C 36004010 */  beqz       $v0, .L8006F7F8
/* 5FF20 8006F720 21204002 */   addu      $a0, $s2, $zero
/* 5FF24 8006F724 2000A48F */  lw         $a0, 0x20($sp)
/* 5FF28 8006F728 00000000 */  nop
/* 5FF2C 8006F72C 10008384 */  lh         $v1, 0x10($a0)
/* 5FF30 8006F730 00000000 */  nop
/* 5FF34 8006F734 0B006228 */  slti       $v0, $v1, 0xB
/* 5FF38 8006F738 05004014 */  bnez       $v0, .L8006F750
/* 5FF3C 8006F73C F6FF6228 */   slti      $v0, $v1, -0xA
/* 5FF40 8006F740 04000286 */  lh         $v0, 0x4($s0)
/* 5FF44 8006F744 00000000 */  nop
/* 5FF48 8006F748 1700401C */  bgtz       $v0, .L8006F7A8
/* 5FF4C 8006F74C F6FF6228 */   slti      $v0, $v1, -0xA
.L8006F750:
/* 5FF50 8006F750 05004010 */  beqz       $v0, .L8006F768
/* 5FF54 8006F754 00000000 */   nop
/* 5FF58 8006F758 04000286 */  lh         $v0, 0x4($s0)
/* 5FF5C 8006F75C 00000000 */  nop
/* 5FF60 8006F760 11004004 */  bltz       $v0, .L8006F7A8
/* 5FF64 8006F764 00000000 */   nop
.L8006F768:
/* 5FF68 8006F768 12008384 */  lh         $v1, 0x12($a0)
/* 5FF6C 8006F76C 00000000 */  nop
/* 5FF70 8006F770 0B006228 */  slti       $v0, $v1, 0xB
/* 5FF74 8006F774 06004014 */  bnez       $v0, .L8006F790
/* 5FF78 8006F778 F6FF6228 */   slti      $v0, $v1, -0xA
/* 5FF7C 8006F77C 06000286 */  lh         $v0, 0x6($s0)
/* 5FF80 8006F780 00000000 */  nop
/* 5FF84 8006F784 0900401C */  bgtz       $v0, .L8006F7AC
/* 5FF88 8006F788 21204002 */   addu      $a0, $s2, $zero
/* 5FF8C 8006F78C F6FF6228 */  slti       $v0, $v1, -0xA
.L8006F790:
/* 5FF90 8006F790 80004010 */  beqz       $v0, .L8006F994
/* 5FF94 8006F794 00000000 */   nop
/* 5FF98 8006F798 06000286 */  lh         $v0, 0x6($s0)
/* 5FF9C 8006F79C 00000000 */  nop
/* 5FFA0 8006F7A0 7C004104 */  bgez       $v0, .L8006F994
/* 5FFA4 8006F7A4 00000000 */   nop
.L8006F7A8:
/* 5FFA8 8006F7A8 21204002 */  addu       $a0, $s2, $zero
.L8006F7AC:
/* 5FFAC 8006F7AC DC020724 */  addiu      $a3, $zero, 0x2DC
/* 5FFB0 8006F7B0 04000586 */  lh         $a1, 0x4($s0)
/* 5FFB4 8006F7B4 06000686 */  lh         $a2, 0x6($s0)
/* 5FFB8 8006F7B8 53FF0224 */  addiu      $v0, $zero, -0xAD
/* 5FFBC 8006F7BC 1000A2AF */  sw         $v0, 0x10($sp)
/* 5FFC0 8006F7C0 71020224 */  addiu      $v0, $zero, 0x271
/* 5FFC4 8006F7C4 1400A2AF */  sw         $v0, 0x14($sp)
/* 5FFC8 8006F7C8 C8FE0224 */  addiu      $v0, $zero, -0x138
/* 5FFCC 8006F7CC BEB9010C */  jal        CheckBlockSlope
/* 5FFD0 8006F7D0 1800A2AF */   sw        $v0, 0x18($sp)
/* 5FFD4 8006F7D4 6F004014 */  bnez       $v0, .L8006F994
/* 5FFD8 8006F7D8 21204002 */   addu      $a0, $s2, $zero
/* 5FFDC 8006F7DC 28000586 */  lh         $a1, 0x28($s0)
/* 5FFE0 8006F7E0 EEB9010C */  jal        PHYSOBS_FigureDragForSlope
/* 5FFE4 8006F7E4 2400A627 */   addiu     $a2, $sp, 0x24
/* 5FFE8 8006F7E8 6B004014 */  bnez       $v0, .L8006F998
/* 5FFEC 8006F7EC 00000000 */   nop
/* 5FFF0 8006F7F0 66BE0108 */  j          .L8006F998
/* 5FFF4 8006F7F4 2400A0AF */   sw        $zero, 0x24($sp)
.L8006F7F8:
/* 5FFF8 8006F7F8 04000286 */  lh         $v0, 0x4($s0)
/* 5FFFC 8006F7FC 00000000 */  nop
/* 60000 8006F800 80280200 */  sll        $a1, $v0, 2
/* 60004 8006F804 2128A200 */  addu       $a1, $a1, $v0
/* 60008 8006F808 06000286 */  lh         $v0, 0x6($s0)
/* 6000C 8006F80C C0290500 */  sll        $a1, $a1, 7
/* 60010 8006F810 80300200 */  sll        $a2, $v0, 2
/* 60014 8006F814 2130C200 */  addu       $a2, $a2, $v0
/* 60018 8006F818 D5BC010C */  jal        PHYSOB_CheckForEnemyInBlkSpot
/* 6001C 8006F81C C0310600 */   sll       $a2, $a2, 7
/* 60020 8006F820 11004010 */  beqz       $v0, .L8006F868
/* 60024 8006F824 21204002 */   addu      $a0, $s2, $zero
/* 60028 8006F828 04000286 */  lh         $v0, 0x4($s0)
/* 6002C 8006F82C 21380000 */  addu       $a3, $zero, $zero
/* 60030 8006F830 80280200 */  sll        $a1, $v0, 2
/* 60034 8006F834 2128A200 */  addu       $a1, $a1, $v0
/* 60038 8006F838 80280500 */  sll        $a1, $a1, 2
/* 6003C 8006F83C 2128A200 */  addu       $a1, $a1, $v0
/* 60040 8006F840 06000286 */  lh         $v0, 0x6($s0)
/* 60044 8006F844 80290500 */  sll        $a1, $a1, 6
/* 60048 8006F848 80300200 */  sll        $a2, $v0, 2
/* 6004C 8006F84C 2130C200 */  addu       $a2, $a2, $v0
/* 60050 8006F850 80300600 */  sll        $a2, $a2, 2
/* 60054 8006F854 2130C200 */  addu       $a2, $a2, $v0
/* 60058 8006F858 7BBC010C */  jal        PHYSOB_CheckDirectedLineCollision
/* 6005C 8006F85C 80310600 */   sll       $a2, $a2, 6
/* 60060 8006F860 4C004014 */  bnez       $v0, .L8006F994
/* 60064 8006F864 00000000 */   nop
.L8006F868:
/* 60068 8006F868 2000A28F */  lw         $v0, 0x20($sp)
/* 6006C 8006F86C 00100524 */  addiu      $a1, $zero, 0x1000
/* 60070 8006F870 14004484 */  lh         $a0, 0x14($v0)
/* 60074 8006F874 B6B9010C */  jal        CheckSlope
/* 60078 8006F878 04000624 */   addiu     $a2, $zero, 0x4
/* 6007C 8006F87C 45004010 */  beqz       $v0, .L8006F994
/* 60080 8006F880 21204002 */   addu      $a0, $s2, $zero
/* 60084 8006F884 21280002 */  addu       $a1, $s0, $zero
/* 60088 8006F888 28000786 */  lh         $a3, 0x28($s0)
/* 6008C 8006F88C 02000624 */  addiu      $a2, $zero, 0x2
/* 60090 8006F890 B7BC010C */  jal        PHYSOBS_SetNewAnim
/* 60094 8006F894 1000A0AF */   sw        $zero, 0x10($sp)
/* 60098 8006F898 66BE0108 */  j          .L8006F998
/* 6009C 8006F89C 00000000 */   nop
.L8006F8A0:
/* 600A0 8006F8A0 04000586 */  lh         $a1, 0x4($s0)
/* 600A4 8006F8A4 06000686 */  lh         $a2, 0x6($s0)
/* 600A8 8006F8A8 AFC2010C */  jal        PHYSOB_CheckDropOnSlope
/* 600AC 8006F8AC 2800A727 */   addiu     $a3, $sp, 0x28
/* 600B0 8006F8B0 00404230 */  andi       $v0, $v0, 0x4000
/* 600B4 8006F8B4 08004010 */  beqz       $v0, .L8006F8D8
/* 600B8 8006F8B8 00000000 */   nop
/* 600BC 8006F8BC 2800A28F */  lw         $v0, 0x28($sp)
/* 600C0 8006F8C0 00000000 */  nop
/* 600C4 8006F8C4 14004284 */  lh         $v0, 0x14($v0)
/* 600C8 8006F8C8 00000000 */  nop
/* 600CC 8006F8CC 3D0F4228 */  slti       $v0, $v0, 0xF3D
/* 600D0 8006F8D0 30004014 */  bnez       $v0, .L8006F994
/* 600D4 8006F8D4 00000000 */   nop
.L8006F8D8:
/* 600D8 8006F8D8 0000028E */  lw         $v0, 0x0($s0)
/* 600DC 8006F8DC 00000000 */  nop
/* 600E0 8006F8E0 08004230 */  andi       $v0, $v0, 0x8
/* 600E4 8006F8E4 04004010 */  beqz       $v0, .L8006F8F8
/* 600E8 8006F8E8 00802232 */   andi      $v0, $s1, 0x8000
/* 600EC 8006F8EC 02004010 */  beqz       $v0, .L8006F8F8
/* 600F0 8006F8F0 00000000 */   nop
/* 600F4 8006F8F4 2400A0AF */  sw         $zero, 0x24($sp)
.L8006F8F8:
/* 600F8 8006F8F8 28000396 */  lhu        $v1, 0x28($s0)
/* 600FC 8006F8FC 00000000 */  nop
/* 60100 8006F900 FEFF6224 */  addiu      $v0, $v1, -0x2
/* 60104 8006F904 0200422C */  sltiu      $v0, $v0, 0x2
/* 60108 8006F908 22004014 */  bnez       $v0, .L8006F994
/* 6010C 8006F90C 00000000 */   nop
/* 60110 8006F910 2400A48F */  lw         $a0, 0x24($sp)
/* 60114 8006F914 00000000 */  nop
/* 60118 8006F918 1E008010 */  beqz       $a0, .L8006F994
/* 6011C 8006F91C 00140300 */   sll       $v0, $v1, 16
/* 60120 8006F920 033C0200 */  sra        $a3, $v0, 16
/* 60124 8006F924 05000224 */  addiu      $v0, $zero, 0x5
/* 60128 8006F928 0400E214 */  bne        $a3, $v0, .L8006F93C
/* 6012C 8006F92C FAFF0224 */   addiu     $v0, $zero, -0x6
/* 60130 8006F930 24108200 */  and        $v0, $a0, $v0
/* 60134 8006F934 66BE0108 */  j          .L8006F998
/* 60138 8006F938 2400A2AF */   sw        $v0, 0x24($sp)
.L8006F93C:
/* 6013C 8006F93C 0000028E */  lw         $v0, 0x0($s0)
/* 60140 8006F940 00000000 */  nop
/* 60144 8006F944 08004230 */  andi       $v0, $v0, 0x8
/* 60148 8006F948 0B004010 */  beqz       $v0, .L8006F978
/* 6014C 8006F94C 21204002 */   addu      $a0, $s2, $zero
/* 60150 8006F950 21280002 */  addu       $a1, $s0, $zero
/* 60154 8006F954 02000624 */  addiu      $a2, $zero, 0x2
/* 60158 8006F958 0E000724 */  addiu      $a3, $zero, 0xE
/* 6015C 8006F95C 2110E000 */  addu       $v0, $a3, $zero
/* 60160 8006F960 280002A6 */  sh         $v0, 0x28($s0)
/* 60164 8006F964 01000224 */  addiu      $v0, $zero, 0x1
/* 60168 8006F968 B7BC010C */  jal        PHYSOBS_SetNewAnim
/* 6016C 8006F96C 1000A2AF */   sw        $v0, 0x10($sp)
/* 60170 8006F970 66BE0108 */  j          .L8006F998
/* 60174 8006F974 00000000 */   nop
.L8006F978:
/* 60178 8006F978 01000224 */  addiu      $v0, $zero, 0x1
/* 6017C 8006F97C 1000A2AF */  sw         $v0, 0x10($sp)
/* 60180 8006F980 21280002 */  addu       $a1, $s0, $zero
/* 60184 8006F984 B7BC010C */  jal        PHYSOBS_SetNewAnim
/* 60188 8006F988 02000624 */   addiu     $a2, $zero, 0x2
/* 6018C 8006F98C 66BE0108 */  j          .L8006F998
/* 60190 8006F990 00000000 */   nop
.L8006F994:
/* 60194 8006F994 2400A0AF */  sw         $zero, 0x24($sp)
.L8006F998:
/* 60198 8006F998 2400A28F */  lw         $v0, 0x24($sp)
.L8006F99C:
/* 6019C 8006F99C E0BF80A3 */  sb         $zero, %gp_rel(gameTrackerX + 0x218)($gp)
/* 601A0 8006F9A0 05004014 */  bnez       $v0, .L8006F9B8
/* 601A4 8006F9A4 B5FE0324 */   addiu     $v1, $zero, -0x14B
/* 601A8 8006F9A8 0000028E */  lw         $v0, 0x0($s0)
/* 601AC 8006F9AC 00000000 */  nop
/* 601B0 8006F9B0 24104300 */  and        $v0, $v0, $v1
/* 601B4 8006F9B4 000002AE */  sw         $v0, 0x0($s0)
.L8006F9B8:
/* 601B8 8006F9B8 2400A28F */  lw         $v0, 0x24($sp)
/* 601BC 8006F9BC 3C00BF8F */  lw         $ra, 0x3C($sp)
/* 601C0 8006F9C0 3800B28F */  lw         $s2, 0x38($sp)
/* 601C4 8006F9C4 3400B18F */  lw         $s1, 0x34($sp)
/* 601C8 8006F9C8 3000B08F */  lw         $s0, 0x30($sp)
/* 601CC 8006F9CC 0800E003 */  jr         $ra
/* 601D0 8006F9D0 4000BD27 */   addiu     $sp, $sp, 0x40
.size PHYSOBS_CheckForValidMove, . - PHYSOBS_CheckForValidMove
