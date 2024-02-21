.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WCBEGG_SplitProcess
/* 7FDB8 8008F5B8 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 7FDBC 8008F5BC 1000B0AF */  sw         $s0, 0x10($sp)
/* 7FDC0 8008F5C0 21808000 */  addu       $s0, $a0, $zero
/* 7FDC4 8008F5C4 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 7FDC8 8008F5C8 2000BFAF */  sw         $ra, 0x20($sp)
/* 7FDCC 8008F5CC 1800B2AF */  sw         $s2, 0x18($sp)
/* 7FDD0 8008F5D0 1400B1AF */  sw         $s1, 0x14($sp)
/* 7FDD4 8008F5D4 6C01118E */  lw         $s1, 0x16C($s0)
/* 7FDD8 8008F5D8 9006020C */  jal        MON_GetTime
/* 7FDDC 8008F5DC 2198A000 */   addu      $s3, $a1, $zero
/* 7FDE0 8008F5E0 0D80043C */  lui        $a0, %hi(D_800D1BFC)
/* 7FDE4 8008F5E4 FC1B8424 */  addiu      $a0, $a0, %lo(D_800D1BFC)
/* 7FDE8 8008F5E8 14F9000C */  jal        OBTABLE_FindObject
/* 7FDEC 8008F5EC 21904000 */   addu      $s2, $v0, $zero
/* 7FDF0 8008F5F0 21184000 */  addu       $v1, $v0, $zero
/* 7FDF4 8008F5F4 24006010 */  beqz       $v1, .L8008F688
/* 7FDF8 8008F5F8 00000000 */   nop
/* 7FDFC 8008F5FC 2800228E */  lw         $v0, 0x28($s1)
/* 7FE00 8008F600 1C00638C */  lw         $v1, 0x1C($v1)
/* 7FE04 8008F604 C6004224 */  addiu      $v0, $v0, 0xC6
/* 7FE08 8008F608 2A104202 */  slt        $v0, $s2, $v0
/* 7FE0C 8008F60C 0400638C */  lw         $v1, 0x4($v1)
/* 7FE10 8008F610 19004014 */  bnez       $v0, .L8008F678
/* 7FE14 8008F614 21200002 */   addu      $a0, $s0, $zero
/* 7FE18 8008F618 F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 7FE1C 8008F61C 4801028E */  lw         $v0, 0x148($s0)
/* 7FE20 8008F620 00000000 */  nop
/* 7FE24 8008F624 10008214 */  bne        $a0, $v0, .L8008F668
/* 7FE28 8008F628 0400053C */   lui       $a1, (0x40005 >> 16)
/* 7FE2C 8008F62C 12006284 */  lh         $v0, 0x12($v1)
/* 7FE30 8008F630 0500A534 */  ori        $a1, $a1, (0x40005 & 0xFFFF)
/* 7FE34 8008F634 40310200 */  sll        $a2, $v0, 5
/* 7FE38 8008F638 A1D1000C */  jal        INSTANCE_Post
/* 7FE3C 8008F63C 2130C200 */   addu      $a2, $a2, $v0
/* 7FE40 8008F640 76D5000C */  jal        INSTANCE_UnlinkFromParent
/* 7FE44 8008F644 21200002 */   addu      $a0, $s0, $zero
/* 7FE48 8008F648 0000228E */  lw         $v0, 0x0($s1)
/* 7FE4C 8008F64C FFBF0324 */  addiu      $v1, $zero, -0x4001
/* 7FE50 8008F650 01104234 */  ori        $v0, $v0, 0x1001
/* 7FE54 8008F654 24104300 */  and        $v0, $v0, $v1
/* 7FE58 8008F658 000022AE */  sw         $v0, 0x0($s1)
/* 7FE5C 8008F65C 0980023C */  lui        $v0, %hi(WCBEGG_CommonPostProcess)
/* 7FE60 8008F660 9C3D0208 */  j          .L8008F670
/* 7FE64 8008F664 B4F64224 */   addiu     $v0, $v0, %lo(WCBEGG_CommonPostProcess)
.L8008F668:
/* 7FE68 8008F668 0980023C */  lui        $v0, %hi(WCBEGG_CommonPostProcess2)
/* 7FE6C 8008F66C 44F74224 */  addiu      $v0, $v0, %lo(WCBEGG_CommonPostProcess2)
.L8008F670:
/* 7FE70 8008F670 080102AE */  sw         $v0, 0x108($s0)
/* 7FE74 8008F674 21200002 */  addu       $a0, $s0, $zero
.L8008F678:
/* 7FE78 8008F678 09AE010C */  jal        ProcessPhysicalObject
/* 7FE7C 8008F67C 21286002 */   addu      $a1, $s3, $zero
/* 7FE80 8008F680 A63D0208 */  j          .L8008F698
/* 7FE84 8008F684 00000000 */   nop
.L8008F688:
/* 7FE88 8008F688 76D5000C */  jal        INSTANCE_UnlinkFromParent
/* 7FE8C 8008F68C 21200002 */   addu      $a0, $s0, $zero
/* 7FE90 8008F690 85D1000C */  jal        INSTANCE_KillInstance
/* 7FE94 8008F694 21200002 */   addu      $a0, $s0, $zero
.L8008F698:
/* 7FE98 8008F698 2000BF8F */  lw         $ra, 0x20($sp)
/* 7FE9C 8008F69C 1C00B38F */  lw         $s3, 0x1C($sp)
/* 7FEA0 8008F6A0 1800B28F */  lw         $s2, 0x18($sp)
/* 7FEA4 8008F6A4 1400B18F */  lw         $s1, 0x14($sp)
/* 7FEA8 8008F6A8 1000B08F */  lw         $s0, 0x10($sp)
/* 7FEAC 8008F6AC 0800E003 */  jr         $ra
/* 7FEB0 8008F6B0 2800BD27 */   addiu     $sp, $sp, 0x28
.size WCBEGG_SplitProcess, . - WCBEGG_SplitProcess
