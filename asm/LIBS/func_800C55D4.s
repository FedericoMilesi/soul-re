.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C55D4
/* B5DD4 800C55D4 0D80023C */  lui        $v0, %hi(CD_intstr + 0x220)
/* B5DD8 800C55D8 48EC428C */  lw         $v0, %lo(CD_intstr + 0x220)($v0)
/* B5DDC 800C55DC D8FFBD27 */  addiu      $sp, $sp, -0x28
/* B5DE0 800C55E0 1400B1AF */  sw         $s1, 0x14($sp)
/* B5DE4 800C55E4 0D80113C */  lui        $s1, %hi(CD_intstr + 0x239)
/* B5DE8 800C55E8 61EC3126 */  addiu      $s1, $s1, %lo(CD_intstr + 0x239)
/* B5DEC 800C55EC 2000BFAF */  sw         $ra, 0x20($sp)
/* B5DF0 800C55F0 1C00B3AF */  sw         $s3, 0x1C($sp)
/* B5DF4 800C55F4 1800B2AF */  sw         $s2, 0x18($sp)
/* B5DF8 800C55F8 1000B0AF */  sw         $s0, 0x10($sp)
/* B5DFC 800C55FC 00004290 */  lbu        $v0, 0x0($v0)
/* B5E00 800C5600 FFFF3326 */  addiu      $s3, $s1, -0x1
/* B5E04 800C5604 03005230 */  andi       $s2, $v0, 0x3
.L800C5608:
/* B5E08 800C5608 F30F030C */  jal        func_800C3FCC
/* B5E0C 800C560C 00000000 */   nop
/* B5E10 800C5610 21804000 */  addu       $s0, $v0, $zero
/* B5E14 800C5614 1A000012 */  beqz       $s0, .L800C5680
/* B5E18 800C5618 04000232 */   andi      $v0, $s0, 0x4
/* B5E1C 800C561C 0B004010 */  beqz       $v0, .L800C564C
/* B5E20 800C5620 02000232 */   andi      $v0, $s0, 0x2
/* B5E24 800C5624 0D80023C */  lui        $v0, %hi(CD_cbready)
/* B5E28 800C5628 88E9428C */  lw         $v0, %lo(CD_cbready)($v0)
/* B5E2C 800C562C 00000000 */  nop
/* B5E30 800C5630 05004010 */  beqz       $v0, .L800C5648
/* B5E34 800C5634 00000000 */   nop
/* B5E38 800C5638 00002492 */  lbu        $a0, 0x0($s1)
/* B5E3C 800C563C 0E80053C */  lui        $a1, %hi(StStartFrame + 0x4C)
/* B5E40 800C5640 09F84000 */  jalr       $v0
/* B5E44 800C5644 90FDA524 */   addiu     $a1, $a1, %lo(StStartFrame + 0x4C)
.L800C5648:
/* B5E48 800C5648 02000232 */  andi       $v0, $s0, 0x2
.L800C564C:
/* B5E4C 800C564C EEFF4010 */  beqz       $v0, .L800C5608
/* B5E50 800C5650 00000000 */   nop
/* B5E54 800C5654 0D80023C */  lui        $v0, %hi(CD_cbsync)
/* B5E58 800C5658 84E9428C */  lw         $v0, %lo(CD_cbsync)($v0)
/* B5E5C 800C565C 00000000 */  nop
/* B5E60 800C5660 E9FF4010 */  beqz       $v0, .L800C5608
/* B5E64 800C5664 00000000 */   nop
/* B5E68 800C5668 00006492 */  lbu        $a0, 0x0($s3)
/* B5E6C 800C566C 0E80053C */  lui        $a1, %hi(StStartFrame + 0x44)
/* B5E70 800C5670 09F84000 */  jalr       $v0
/* B5E74 800C5674 88FDA524 */   addiu     $a1, $a1, %lo(StStartFrame + 0x44)
/* B5E78 800C5678 82150308 */  j          .L800C5608
/* B5E7C 800C567C 00000000 */   nop
.L800C5680:
/* B5E80 800C5680 0D80023C */  lui        $v0, %hi(CD_intstr + 0x220)
/* B5E84 800C5684 48EC428C */  lw         $v0, %lo(CD_intstr + 0x220)($v0)
/* B5E88 800C5688 00000000 */  nop
/* B5E8C 800C568C 000052A0 */  sb         $s2, 0x0($v0)
/* B5E90 800C5690 2000BF8F */  lw         $ra, 0x20($sp)
/* B5E94 800C5694 1C00B38F */  lw         $s3, 0x1C($sp)
/* B5E98 800C5698 1800B28F */  lw         $s2, 0x18($sp)
/* B5E9C 800C569C 1400B18F */  lw         $s1, 0x14($sp)
/* B5EA0 800C56A0 1000B08F */  lw         $s0, 0x10($sp)
/* B5EA4 800C56A4 0800E003 */  jr         $ra
/* B5EA8 800C56A8 2800BD27 */   addiu     $sp, $sp, 0x28
/* B5EAC 800C56AC 00000000 */  nop
/* B5EB0 800C56B0 00000000 */  nop
.size func_800C55D4, . - func_800C55D4
