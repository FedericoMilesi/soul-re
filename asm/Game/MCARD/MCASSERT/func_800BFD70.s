.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BFD70
/* B0570 800BFD70 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* B0574 800BFD74 1800B0AF */  sw         $s0, 0x18($sp)
/* B0578 800BFD78 21808000 */  addu       $s0, $a0, $zero
/* B057C 800BFD7C 2C00B5AF */  sw         $s5, 0x2C($sp)
/* B0580 800BFD80 0A00022E */  sltiu      $v0, $s0, 0xA
/* B0584 800BFD84 3000BFAF */  sw         $ra, 0x30($sp)
/* B0588 800BFD88 2800B4AF */  sw         $s4, 0x28($sp)
/* B058C 800BFD8C 2400B3AF */  sw         $s3, 0x24($sp)
/* B0590 800BFD90 2000B2AF */  sw         $s2, 0x20($sp)
/* B0594 800BFD94 1C00B1AF */  sw         $s1, 0x1C($sp)
/* B0598 800BFD98 1000A0AF */  sw         $zero, 0x10($sp)
/* B059C 800BFD9C 0A004010 */  beqz       $v0, .L800BFDC8
/* B05A0 800BFDA0 21A80000 */   addu      $s5, $zero, $zero
/* B05A4 800BFDA4 0D80033C */  lui        $v1, %hi(_spu_rev_startaddr)
/* B05A8 800BFDA8 BCED6324 */  addiu      $v1, $v1, %lo(_spu_rev_startaddr)
/* B05AC 800BFDAC 80101000 */  sll        $v0, $s0, 2
/* B05B0 800BFDB0 21884300 */  addu       $s1, $v0, $v1
/* B05B4 800BFDB4 0000248E */  lw         $a0, 0x0($s1)
/* B05B8 800BFDB8 DC1A030C */  jal        func_800C6B70
/* B05BC 800BFDBC 00000000 */   nop
/* B05C0 800BFDC0 03004010 */  beqz       $v0, .L800BFDD0
/* B05C4 800BFDC4 00000000 */   nop
.L800BFDC8:
/* B05C8 800BFDC8 B8FF0208 */  j          .L800BFEE0
/* B05CC 800BFDCC FFFF0224 */   addiu     $v0, $zero, -0x1
.L800BFDD0:
/* B05D0 800BFDD0 08000016 */  bnez       $s0, .L800BFDF4
/* B05D4 800BFDD4 0100023C */   lui       $v0, (0x10000 >> 16)
/* B05D8 800BFDD8 0D80023C */  lui        $v0, %hi(_spu_mem_mode_plus)
/* B05DC 800BFDDC 84ED428C */  lw         $v0, %lo(_spu_mem_mode_plus)($v0)
/* B05E0 800BFDE0 10000324 */  addiu      $v1, $zero, 0x10
/* B05E4 800BFDE4 04884300 */  sllv       $s1, $v1, $v0
/* B05E8 800BFDE8 F0FF0334 */  ori        $v1, $zero, 0xFFF0
/* B05EC 800BFDEC 83FF0208 */  j          .L800BFE0C
/* B05F0 800BFDF0 04904300 */   sllv      $s2, $v1, $v0
.L800BFDF4:
/* B05F4 800BFDF4 0000248E */  lw         $a0, 0x0($s1)
/* B05F8 800BFDF8 0D80033C */  lui        $v1, %hi(_spu_mem_mode_plus)
/* B05FC 800BFDFC 84ED638C */  lw         $v1, %lo(_spu_mem_mode_plus)($v1)
/* B0600 800BFE00 23104400 */  subu       $v0, $v0, $a0
/* B0604 800BFE04 04886200 */  sllv       $s1, $v0, $v1
/* B0608 800BFE08 04906400 */  sllv       $s2, $a0, $v1
.L800BFE0C:
/* B060C 800BFE0C 0D80143C */  lui        $s4, %hi(_spu_transMode)
/* B0610 800BFE10 78ED948E */  lw         $s4, %lo(_spu_transMode)($s4)
/* B0614 800BFE14 01000224 */  addiu      $v0, $zero, 0x1
/* B0618 800BFE18 04008216 */  bne        $s4, $v0, .L800BFE2C
/* B061C 800BFE1C 00000000 */   nop
/* B0620 800BFE20 0D80013C */  lui        $at, %hi(_spu_transMode)
/* B0624 800BFE24 78ED20AC */  sw         $zero, %lo(_spu_transMode)($at)
/* B0628 800BFE28 01001524 */  addiu      $s5, $zero, 0x1
.L800BFE2C:
/* B062C 800BFE2C 0D80023C */  lui        $v0, %hi(_spu_transferCallback)
/* B0630 800BFE30 94ED428C */  lw         $v0, %lo(_spu_transferCallback)($v0)
/* B0634 800BFE34 00000000 */  nop
/* B0638 800BFE38 07004010 */  beqz       $v0, .L800BFE58
/* B063C 800BFE3C 01001324 */   addiu     $s3, $zero, 0x1
/* B0640 800BFE40 0D80023C */  lui        $v0, %hi(_spu_transferCallback)
/* B0644 800BFE44 94ED428C */  lw         $v0, %lo(_spu_transferCallback)($v0)
/* B0648 800BFE48 00000000 */  nop
/* B064C 800BFE4C 1000A2AF */  sw         $v0, 0x10($sp)
/* B0650 800BFE50 0D80013C */  lui        $at, %hi(_spu_transferCallback)
/* B0654 800BFE54 94ED20AC */  sw         $zero, %lo(_spu_transferCallback)($at)
.L800BFE58:
/* B0658 800BFE58 0104222E */  sltiu      $v0, $s1, 0x401
.L800BFE5C:
/* B065C 800BFE5C 03004010 */  beqz       $v0, .L800BFE6C
/* B0660 800BFE60 00041024 */   addiu     $s0, $zero, 0x400
/* B0664 800BFE64 21802002 */  addu       $s0, $s1, $zero
/* B0668 800BFE68 21980000 */  addu       $s3, $zero, $zero
.L800BFE6C:
/* B066C 800BFE6C 02000424 */  addiu      $a0, $zero, 0x2
/* B0670 800BFE70 4819030C */  jal        func_800C6520
/* B0674 800BFE74 21284002 */   addu      $a1, $s2, $zero
/* B0678 800BFE78 4819030C */  jal        func_800C6520
/* B067C 800BFE7C 01000424 */   addiu     $a0, $zero, 0x1
/* B0680 800BFE80 03000424 */  addiu      $a0, $zero, 0x3
/* B0684 800BFE84 0D80053C */  lui        $a1, %hi(_spu_zerobuf)
/* B0688 800BFE88 ECEDA524 */  addiu      $a1, $a1, %lo(_spu_zerobuf)
/* B068C 800BFE8C 4819030C */  jal        func_800C6520
/* B0690 800BFE90 21300002 */   addu      $a2, $s0, $zero
/* B0694 800BFE94 0D80043C */  lui        $a0, %hi(_spu_EVdma)
/* B0698 800BFE98 E4EC848C */  lw         $a0, %lo(_spu_EVdma)($a0)
/* B069C 800BFE9C 00FC3126 */  addiu      $s1, $s1, -0x400
/* B06A0 800BFEA0 001B030C */  jal        func_800C6C00
/* B06A4 800BFEA4 00045226 */   addiu     $s2, $s2, 0x400
/* B06A8 800BFEA8 ECFF6016 */  bnez       $s3, .L800BFE5C
/* B06AC 800BFEAC 0104222E */   sltiu     $v0, $s1, 0x401
/* B06B0 800BFEB0 0300A012 */  beqz       $s5, .L800BFEC0
/* B06B4 800BFEB4 00000000 */   nop
/* B06B8 800BFEB8 0D80013C */  lui        $at, %hi(_spu_transMode)
/* B06BC 800BFEBC 78ED34AC */  sw         $s4, %lo(_spu_transMode)($at)
.L800BFEC0:
/* B06C0 800BFEC0 1000A28F */  lw         $v0, 0x10($sp)
/* B06C4 800BFEC4 00000000 */  nop
/* B06C8 800BFEC8 05004010 */  beqz       $v0, .L800BFEE0
/* B06CC 800BFECC 21100000 */   addu      $v0, $zero, $zero
/* B06D0 800BFED0 1000A28F */  lw         $v0, 0x10($sp)
/* B06D4 800BFED4 0D80013C */  lui        $at, %hi(_spu_transferCallback)
/* B06D8 800BFED8 94ED22AC */  sw         $v0, %lo(_spu_transferCallback)($at)
/* B06DC 800BFEDC 21100000 */  addu       $v0, $zero, $zero
.L800BFEE0:
/* B06E0 800BFEE0 3000BF8F */  lw         $ra, 0x30($sp)
/* B06E4 800BFEE4 2C00B58F */  lw         $s5, 0x2C($sp)
/* B06E8 800BFEE8 2800B48F */  lw         $s4, 0x28($sp)
/* B06EC 800BFEEC 2400B38F */  lw         $s3, 0x24($sp)
/* B06F0 800BFEF0 2000B28F */  lw         $s2, 0x20($sp)
/* B06F4 800BFEF4 1C00B18F */  lw         $s1, 0x1C($sp)
/* B06F8 800BFEF8 1800B08F */  lw         $s0, 0x18($sp)
/* B06FC 800BFEFC 0800E003 */  jr         $ra
/* B0700 800BFF00 3800BD27 */   addiu     $sp, $sp, 0x38
/* B0704 800BFF04 00000000 */  nop
/* B0708 800BFF08 00000000 */  nop
/* B070C 800BFF0C 00000000 */  nop
.size func_800BFD70, . - func_800BFD70
