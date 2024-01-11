.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel firstfile
/* B7E08 800C7608 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* B7E0C 800C760C 1800B2AF */  sw         $s2, 0x18($sp)
/* B7E10 800C7610 21908000 */  addu       $s2, $a0, $zero
/* B7E14 800C7614 1C00B3AF */  sw         $s3, 0x1C($sp)
/* B7E18 800C7618 2198A000 */  addu       $s3, $a1, $zero
/* B7E1C 800C761C 2000BFAF */  sw         $ra, 0x20($sp)
/* B7E20 800C7620 1400B1AF */  sw         $s1, 0x14($sp)
/* B7E24 800C7624 1000B0AF */  sw         $s0, 0x10($sp)
/* B7E28 800C7628 00004282 */  lb         $v0, 0x0($s2)
/* B7E2C 800C762C 0E80043C */  lui        $a0, %hi(_spu_RQ + 0x4C)
/* B7E30 800C7630 08FE8424 */  addiu      $a0, $a0, %lo(_spu_RQ + 0x4C)
/* B7E34 800C7634 3B004228 */  slti       $v0, $v0, 0x3B
/* B7E38 800C7638 09004014 */  bnez       $v0, .L800C7660
/* B7E3C 800C763C 21184002 */   addu      $v1, $s2, $zero
.L800C7640:
/* B7E40 800C7640 00006290 */  lbu        $v0, 0x0($v1)
/* B7E44 800C7644 01006324 */  addiu      $v1, $v1, 0x1
/* B7E48 800C7648 000082A0 */  sb         $v0, 0x0($a0)
/* B7E4C 800C764C 00006280 */  lb         $v0, 0x0($v1)
/* B7E50 800C7650 00000000 */  nop
/* B7E54 800C7654 3B004228 */  slti       $v0, $v0, 0x3B
/* B7E58 800C7658 F9FF4010 */  beqz       $v0, .L800C7640
/* B7E5C 800C765C 01008424 */   addiu     $a0, $a0, 0x1
.L800C7660:
/* B7E60 800C7660 000080A0 */  sb         $zero, 0x0($a0)
/* B7E64 800C7664 5401038C */  lw         $v1, 0x154($zero)
/* B7E68 800C7668 CCCC023C */  lui        $v0, (0xCCCCCCCD >> 16)
/* B7E6C 800C766C CDCC4234 */  ori        $v0, $v0, (0xCCCCCCCD & 0xFFFF)
/* B7E70 800C7670 19006200 */  multu      $v1, $v0
/* B7E74 800C7674 5001108C */  lw         $s0, 0x150($zero)
/* B7E78 800C7678 10300000 */  mfhi       $a2
/* B7E7C 800C767C 82190600 */  srl        $v1, $a2, 6
/* B7E80 800C7680 80100300 */  sll        $v0, $v1, 2
/* B7E84 800C7684 21104300 */  addu       $v0, $v0, $v1
/* B7E88 800C7688 00110200 */  sll        $v0, $v0, 4
/* B7E8C 800C768C 21180202 */  addu       $v1, $s0, $v0
/* B7E90 800C7690 2B100302 */  sltu       $v0, $s0, $v1
/* B7E94 800C7694 0F004010 */  beqz       $v0, .L800C76D4
/* B7E98 800C7698 00000000 */   nop
/* B7E9C 800C769C 21886000 */  addu       $s1, $v1, $zero
.L800C76A0:
/* B7EA0 800C76A0 0000048E */  lw         $a0, 0x0($s0)
/* B7EA4 800C76A4 00000000 */  nop
/* B7EA8 800C76A8 06008010 */  beqz       $a0, .L800C76C4
/* B7EAC 800C76AC 00000000 */   nop
/* B7EB0 800C76B0 0E80053C */  lui        $a1, %hi(_spu_RQ + 0x4C)
/* B7EB4 800C76B4 83F7020C */  jal        strcmp
/* B7EB8 800C76B8 08FEA524 */   addiu     $a1, $a1, %lo(_spu_RQ + 0x4C)
/* B7EBC 800C76BC 0A004010 */  beqz       $v0, .L800C76E8
/* B7EC0 800C76C0 00000000 */   nop
.L800C76C4:
/* B7EC4 800C76C4 50001026 */  addiu      $s0, $s0, 0x50
/* B7EC8 800C76C8 2B101102 */  sltu       $v0, $s0, $s1
/* B7ECC 800C76CC F4FF4014 */  bnez       $v0, .L800C76A0
/* B7ED0 800C76D0 00000000 */   nop
.L800C76D4:
/* B7ED4 800C76D4 21180000 */  addu       $v1, $zero, $zero
.L800C76D8:
/* B7ED8 800C76D8 0C006014 */  bnez       $v1, .L800C770C
/* B7EDC 800C76DC 21100000 */   addu      $v0, $zero, $zero
/* B7EE0 800C76E0 E21D0308 */  j          .L800C7788
/* B7EE4 800C76E4 00000000 */   nop
.L800C76E8:
/* B7EE8 800C76E8 3400028E */  lw         $v0, 0x34($s0)
/* B7EEC 800C76EC 0E80013C */  lui        $at, %hi(_spu_RQ + 0x44)
/* B7EF0 800C76F0 00FE22AC */  sw         $v0, %lo(_spu_RQ + 0x44)($at)
/* B7EF4 800C76F4 B61D0308 */  j          .L800C76D8
/* B7EF8 800C76F8 01000324 */   addiu     $v1, $zero, 0x1
.L800C76FC:
/* B7EFC 800C76FC 0C80023C */  lui        $v0, %hi(func_800C77A4)
/* B7F00 800C7700 A4774224 */  addiu      $v0, $v0, %lo(func_800C77A4)
/* B7F04 800C7704 DF1D0308 */  j          .L800C777C
/* B7F08 800C7708 340002AE */   sw        $v0, 0x34($s0)
.L800C770C:
/* B7F0C 800C770C 5401038C */  lw         $v1, 0x154($zero)
/* B7F10 800C7710 CCCC023C */  lui        $v0, (0xCCCCCCCD >> 16)
/* B7F14 800C7714 CDCC4234 */  ori        $v0, $v0, (0xCCCCCCCD & 0xFFFF)
/* B7F18 800C7718 19006200 */  multu      $v1, $v0
/* B7F1C 800C771C 5001108C */  lw         $s0, 0x150($zero)
/* B7F20 800C7720 10300000 */  mfhi       $a2
/* B7F24 800C7724 82190600 */  srl        $v1, $a2, 6
/* B7F28 800C7728 80100300 */  sll        $v0, $v1, 2
/* B7F2C 800C772C 21104300 */  addu       $v0, $v0, $v1
/* B7F30 800C7730 00110200 */  sll        $v0, $v0, 4
/* B7F34 800C7734 21180202 */  addu       $v1, $s0, $v0
/* B7F38 800C7738 2B100302 */  sltu       $v0, $s0, $v1
/* B7F3C 800C773C 10004010 */  beqz       $v0, .L800C7780
/* B7F40 800C7740 21204002 */   addu      $a0, $s2, $zero
/* B7F44 800C7744 21886000 */  addu       $s1, $v1, $zero
.L800C7748:
/* B7F48 800C7748 0000048E */  lw         $a0, 0x0($s0)
/* B7F4C 800C774C 00000000 */  nop
/* B7F50 800C7750 06008010 */  beqz       $a0, .L800C776C
/* B7F54 800C7754 00000000 */   nop
/* B7F58 800C7758 0E80053C */  lui        $a1, %hi(_spu_RQ + 0x4C)
/* B7F5C 800C775C 83F7020C */  jal        strcmp
/* B7F60 800C7760 08FEA524 */   addiu     $a1, $a1, %lo(_spu_RQ + 0x4C)
/* B7F64 800C7764 E5FF4010 */  beqz       $v0, .L800C76FC
/* B7F68 800C7768 00000000 */   nop
.L800C776C:
/* B7F6C 800C776C 50001026 */  addiu      $s0, $s0, 0x50
/* B7F70 800C7770 2B101102 */  sltu       $v0, $s0, $s1
/* B7F74 800C7774 F4FF4014 */  bnez       $v0, .L800C7748
/* B7F78 800C7778 00000000 */   nop
.L800C777C:
/* B7F7C 800C777C 21204002 */  addu       $a0, $s2, $zero
.L800C7780:
/* B7F80 800C7780 1C20030C */  jal        firstfile2
/* B7F84 800C7784 21286002 */   addu      $a1, $s3, $zero
.L800C7788:
/* B7F88 800C7788 2000BF8F */  lw         $ra, 0x20($sp)
/* B7F8C 800C778C 1C00B38F */  lw         $s3, 0x1C($sp)
/* B7F90 800C7790 1800B28F */  lw         $s2, 0x18($sp)
/* B7F94 800C7794 1400B18F */  lw         $s1, 0x14($sp)
/* B7F98 800C7798 1000B08F */  lw         $s0, 0x10($sp)
/* B7F9C 800C779C 0800E003 */  jr         $ra
/* B7FA0 800C77A0 2800BD27 */   addiu     $sp, $sp, 0x28
.size firstfile, . - firstfile
