.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CheckBlockSlope
/* 5EEF8 8006E6F8 1800A700 */  mult       $a1, $a3
/* 5EEFC 8006E6FC 12580000 */  mflo       $t3
/* 5EF00 8006E700 00000000 */  nop
/* 5EF04 8006E704 00000000 */  nop
/* 5EF08 8006E708 1800C700 */  mult       $a2, $a3
/* 5EF0C 8006E70C A8FFBD27 */  addiu      $sp, $sp, -0x58
/* 5EF10 8006E710 6800A88F */  lw         $t0, 0x68($sp)
/* 5EF14 8006E714 12600000 */  mflo       $t4
/* 5EF18 8006E718 6C00A78F */  lw         $a3, 0x6C($sp)
/* 5EF1C 8006E71C 7000A98F */  lw         $t1, 0x70($sp)
/* 5EF20 8006E720 1800A700 */  mult       $a1, $a3
/* 5EF24 8006E724 4000A227 */  addiu      $v0, $sp, 0x40
/* 5EF28 8006E728 5000BFAF */  sw         $ra, 0x50($sp)
/* 5EF2C 8006E72C 2800A2AF */  sw         $v0, 0x28($sp)
/* 5EF30 8006E730 4800A227 */  addiu      $v0, $sp, 0x48
/* 5EF34 8006E734 2400A2AF */  sw         $v0, 0x24($sp)
/* 5EF38 8006E738 4000828C */  lw         $v0, 0x40($a0)
/* 5EF3C 8006E73C 00000000 */  nop
/* 5EF40 8006E740 14004394 */  lhu        $v1, 0x14($v0)
/* 5EF44 8006E744 00000000 */  nop
/* 5EF48 8006E748 4000A3A7 */  sh         $v1, 0x40($sp)
/* 5EF4C 8006E74C 18004594 */  lhu        $a1, 0x18($v0)
/* 5EF50 8006E750 12500000 */  mflo       $t2
/* 5EF54 8006E754 21186B00 */  addu       $v1, $v1, $t3
/* 5EF58 8006E758 4200A5A7 */  sh         $a1, 0x42($sp)
/* 5EF5C 8006E75C 1800C700 */  mult       $a2, $a3
/* 5EF60 8006E760 1C004294 */  lhu        $v0, 0x1C($v0)
/* 5EF64 8006E764 2128AC00 */  addu       $a1, $a1, $t4
/* 5EF68 8006E768 4000A3A7 */  sh         $v1, 0x40($sp)
/* 5EF6C 8006E76C 4200A5A7 */  sh         $a1, 0x42($sp)
/* 5EF70 8006E770 4400A2A7 */  sh         $v0, 0x44($sp)
/* 5EF74 8006E774 21104800 */  addu       $v0, $v0, $t0
/* 5EF78 8006E778 4400A2A7 */  sh         $v0, 0x44($sp)
/* 5EF7C 8006E77C 21104900 */  addu       $v0, $v0, $t1
/* 5EF80 8006E780 4C00A2A7 */  sh         $v0, 0x4C($sp)
/* 5EF84 8006E784 21186A00 */  addu       $v1, $v1, $t2
/* 5EF88 8006E788 4800A3A7 */  sh         $v1, 0x48($sp)
/* 5EF8C 8006E78C 12700000 */  mflo       $t6
/* 5EF90 8006E790 2128AE00 */  addu       $a1, $a1, $t6
/* 5EF94 8006E794 4A00A5A7 */  sh         $a1, 0x4A($sp)
/* 5EF98 8006E798 59D2010C */  jal        PHYSICS_CheckLineInWorld
/* 5EF9C 8006E79C 1000A527 */   addiu     $a1, $sp, 0x10
/* 5EFA0 8006E7A0 1000A287 */  lh         $v0, 0x10($sp)
/* 5EFA4 8006E7A4 5000BF8F */  lw         $ra, 0x50($sp)
/* 5EFA8 8006E7A8 05004238 */  xori       $v0, $v0, 0x5
/* 5EFAC 8006E7AC 0100422C */  sltiu      $v0, $v0, 0x1
/* 5EFB0 8006E7B0 0800E003 */  jr         $ra
/* 5EFB4 8006E7B4 5800BD27 */   addiu     $sp, $sp, 0x58
.size CheckBlockSlope, . - CheckBlockSlope
