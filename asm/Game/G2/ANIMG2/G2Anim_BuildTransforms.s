.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2Anim_BuildTransforms
/* 83610 80092E10 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 83614 80092E14 1000B0AF */  sw         $s0, 0x10($sp)
/* 83618 80092E18 1400BFAF */  sw         $ra, 0x14($sp)
/* 8361C 80092E1C B74B020C */  jal        G2Anim_UpdateStoredFrame
/* 83620 80092E20 21808000 */   addu      $s0, $a0, $zero
/* 83624 80092E24 24000292 */  lbu        $v0, 0x24($s0)
/* 83628 80092E28 80000324 */  addiu      $v1, $zero, 0x80
/* 8362C 80092E2C 88004230 */  andi       $v0, $v0, 0x88
/* 83630 80092E30 03004310 */  beq        $v0, $v1, .L80092E40
/* 83634 80092E34 00000000 */   nop
/* 83638 80092E38 080000AE */  sw         $zero, 0x8($s0)
/* 8363C 80092E3C 0C0000A6 */  sh         $zero, 0xC($s0)
.L80092E40:
/* 83640 80092E40 24000292 */  lbu        $v0, 0x24($s0)
/* 83644 80092E44 00000000 */  nop
/* 83648 80092E48 04004230 */  andi       $v0, $v0, 0x4
/* 8364C 80092E4C 0A004010 */  beqz       $v0, .L80092E78
/* 83650 80092E50 00000000 */   nop
/* 83654 80092E54 08000296 */  lhu        $v0, 0x8($s0)
/* 83658 80092E58 0C000396 */  lhu        $v1, 0xC($s0)
/* 8365C 80092E5C 23100200 */  negu       $v0, $v0
/* 83660 80092E60 080002A6 */  sh         $v0, 0x8($s0)
/* 83664 80092E64 0A000296 */  lhu        $v0, 0xA($s0)
/* 83668 80092E68 23180300 */  negu       $v1, $v1
/* 8366C 80092E6C 0C0003A6 */  sh         $v1, 0xC($s0)
/* 83670 80092E70 23100200 */  negu       $v0, $v0
/* 83674 80092E74 0A0002A6 */  sh         $v0, 0xA($s0)
.L80092E78:
/* 83678 80092E78 0C000296 */  lhu        $v0, 0xC($s0)
/* 8367C 80092E7C 0800038E */  lw         $v1, 0x8($s0)
/* 83680 80092E80 0CEE82A7 */  sh         $v0, %gp_rel(_segValues + 0x14)($gp)
/* 83684 80092E84 02000296 */  lhu        $v0, 0x2($s0)
/* 83688 80092E88 08EE83AF */  sw         $v1, %gp_rel(_segValues + 0x10)($gp)
/* 8368C 80092E8C 05004010 */  beqz       $v0, .L80092EA4
/* 83690 80092E90 00000000 */   nop
/* 83694 80092E94 1F43020C */  jal        _G2Anim_BuildTransformsWithControllers
/* 83698 80092E98 21200002 */   addu      $a0, $s0, $zero
/* 8369C 80092E9C AB4B0208 */  j          .L80092EAC
/* 836A0 80092EA0 00000000 */   nop
.L80092EA4:
/* 836A4 80092EA4 FB4F020C */  jal        _G2Anim_BuildTransformsNoControllers
/* 836A8 80092EA8 21200002 */   addu      $a0, $s0, $zero
.L80092EAC:
/* 836AC 80092EAC 24000292 */  lbu        $v0, 0x24($s0)
/* 836B0 80092EB0 0E000396 */  lhu        $v1, 0xE($s0)
/* 836B4 80092EB4 080000AE */  sw         $zero, 0x8($s0)
/* 836B8 80092EB8 0C0000A6 */  sh         $zero, 0xC($s0)
/* 836BC 80092EBC 7F004230 */  andi       $v0, $v0, 0x7F
/* 836C0 80092EC0 FEFF6330 */  andi       $v1, $v1, 0xFFFE
/* 836C4 80092EC4 240002A2 */  sb         $v0, 0x24($s0)
/* 836C8 80092EC8 0E0003A6 */  sh         $v1, 0xE($s0)
/* 836CC 80092ECC 1400BF8F */  lw         $ra, 0x14($sp)
/* 836D0 80092ED0 1000B08F */  lw         $s0, 0x10($sp)
/* 836D4 80092ED4 0800E003 */  jr         $ra
/* 836D8 80092ED8 1800BD27 */   addiu     $sp, $sp, 0x18
.size G2Anim_BuildTransforms, . - G2Anim_BuildTransforms
