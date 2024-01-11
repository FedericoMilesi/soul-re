.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MORPH_SetupInstanceFlags
/* 4CE6C 8005C66C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 4CE70 8005C670 1000B0AF */  sw         $s0, 0x10($sp)
/* 4CE74 8005C674 21808000 */  addu       $s0, $a0, $zero
/* 4CE78 8005C678 1400BFAF */  sw         $ra, 0x14($sp)
/* 4CE7C 8005C67C 1C00028E */  lw         $v0, 0x1C($s0)
/* 4CE80 8005C680 00000000 */  nop
/* 4CE84 8005C684 0000428C */  lw         $v0, 0x0($v0)
/* 4CE88 8005C688 0800033C */  lui        $v1, (0x80000 >> 16)
/* 4CE8C 8005C68C 24104300 */  and        $v0, $v0, $v1
/* 4CE90 8005C690 3C004014 */  bnez       $v0, .L8005C784
/* 4CE94 8005C694 00000000 */   nop
/* 4CE98 8005C698 D2BD8287 */  lh         $v0, %gp_rel(gameTrackerX + 0xA)($gp)
/* 4CE9C 8005C69C 00000000 */  nop
/* 4CEA0 8005C6A0 0C004014 */  bnez       $v0, .L8005C6D4
/* 4CEA4 8005C6A4 0008023C */   lui       $v0, (0x8000000 >> 16)
/* 4CEA8 8005C6A8 1800058E */  lw         $a1, 0x18($s0)
/* 4CEAC 8005C6AC 00000000 */  nop
/* 4CEB0 8005C6B0 2410A200 */  and        $v0, $a1, $v0
/* 4CEB4 8005C6B4 12004014 */  bnez       $v0, .L8005C700
/* 4CEB8 8005C6B8 FFEF023C */   lui       $v0, (0xEFFFFFFF >> 16)
/* 4CEBC 8005C6BC FFFF4234 */  ori        $v0, $v0, (0xEFFFFFFF & 0xFFFF)
/* 4CEC0 8005C6C0 FFFB033C */  lui        $v1, (0xFBFFFFFF >> 16)
/* 4CEC4 8005C6C4 FFFF6334 */  ori        $v1, $v1, (0xFBFFFFFF & 0xFFFF)
/* 4CEC8 8005C6C8 2410A200 */  and        $v0, $a1, $v0
/* 4CECC 8005C6CC E0710108 */  j          .L8005C780
/* 4CED0 8005C6D0 24104300 */   and       $v0, $v0, $v1
.L8005C6D4:
/* 4CED4 8005C6D4 1800058E */  lw         $a1, 0x18($s0)
/* 4CED8 8005C6D8 00000000 */  nop
/* 4CEDC 8005C6DC 2410A200 */  and        $v0, $a1, $v0
/* 4CEE0 8005C6E0 07004010 */  beqz       $v0, .L8005C700
/* 4CEE4 8005C6E4 FFEF023C */   lui       $v0, (0xEFFFFFFF >> 16)
/* 4CEE8 8005C6E8 FFFF4234 */  ori        $v0, $v0, (0xEFFFFFFF & 0xFFFF)
/* 4CEEC 8005C6EC FFFB033C */  lui        $v1, (0xFBFFFFFF >> 16)
/* 4CEF0 8005C6F0 FFFF6334 */  ori        $v1, $v1, (0xFBFFFFFF & 0xFFFF)
/* 4CEF4 8005C6F4 2410A200 */  and        $v0, $a1, $v0
/* 4CEF8 8005C6F8 E0710108 */  j          .L8005C780
/* 4CEFC 8005C6FC 24104300 */   and       $v0, $v0, $v1
.L8005C700:
/* 4CF00 8005C700 0010023C */  lui        $v0, (0x10000000 >> 16)
/* 4CF04 8005C704 1C00048E */  lw         $a0, 0x1C($s0)
/* 4CF08 8005C708 2510A200 */  or         $v0, $a1, $v0
/* 4CF0C 8005C70C B841010C */  jal        MEMPACK_MemoryValidFunc
/* 4CF10 8005C710 180002AE */   sw        $v0, 0x18($s0)
/* 4CF14 8005C714 1B004010 */  beqz       $v0, .L8005C784
/* 4CF18 8005C718 0002033C */   lui       $v1, (0x2000000 >> 16)
/* 4CF1C 8005C71C 1C00028E */  lw         $v0, 0x1C($s0)
/* 4CF20 8005C720 00000000 */  nop
/* 4CF24 8005C724 2C00428C */  lw         $v0, 0x2C($v0)
/* 4CF28 8005C728 00000000 */  nop
/* 4CF2C 8005C72C 24104300 */  and        $v0, $v0, $v1
/* 4CF30 8005C730 0C004014 */  bnez       $v0, .L8005C764
/* 4CF34 8005C734 21200002 */   addu      $a0, $s0, $zero
/* 4CF38 8005C738 4801028E */  lw         $v0, 0x148($s0)
/* 4CF3C 8005C73C 00000000 */  nop
/* 4CF40 8005C740 10004010 */  beqz       $v0, .L8005C784
/* 4CF44 8005C744 00000000 */   nop
/* 4CF48 8005C748 1C00428C */  lw         $v0, 0x1C($v0)
/* 4CF4C 8005C74C 00000000 */  nop
/* 4CF50 8005C750 2C00428C */  lw         $v0, 0x2C($v0)
/* 4CF54 8005C754 00000000 */  nop
/* 4CF58 8005C758 24104300 */  and        $v0, $v0, $v1
/* 4CF5C 8005C75C 09004010 */  beqz       $v0, .L8005C784
/* 4CF60 8005C760 00000000 */   nop
.L8005C764:
/* 4CF64 8005C764 0400053C */  lui        $a1, (0x40026 >> 16)
/* 4CF68 8005C768 2600A534 */  ori        $a1, $a1, (0x40026 & 0xFFFF)
/* 4CF6C 8005C76C A1D1000C */  jal        INSTANCE_Post
/* 4CF70 8005C770 21300000 */   addu      $a2, $zero, $zero
/* 4CF74 8005C774 1800028E */  lw         $v0, 0x18($s0)
/* 4CF78 8005C778 0004033C */  lui        $v1, (0x4000000 >> 16)
/* 4CF7C 8005C77C 25104300 */  or         $v0, $v0, $v1
.L8005C780:
/* 4CF80 8005C780 180002AE */  sw         $v0, 0x18($s0)
.L8005C784:
/* 4CF84 8005C784 1400BF8F */  lw         $ra, 0x14($sp)
/* 4CF88 8005C788 1000B08F */  lw         $s0, 0x10($sp)
/* 4CF8C 8005C78C 0800E003 */  jr         $ra
/* 4CF90 8005C790 1800BD27 */   addiu     $sp, $sp, 0x18
.size MORPH_SetupInstanceFlags, . - MORPH_SetupInstanceFlags
