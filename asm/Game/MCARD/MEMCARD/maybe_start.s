.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel maybe_start
/* A9FDC 800B97DC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* A9FE0 800B97E0 1000B0AF */  sw         $s0, 0x10($sp)
/* A9FE4 800B97E4 21808000 */  addu       $s0, $a0, $zero
/* A9FE8 800B97E8 1400BFAF */  sw         $ra, 0x14($sp)
/* A9FEC 800B97EC 0C000286 */  lh         $v0, 0xC($s0)
/* A9FF0 800B97F0 00000000 */  nop
/* A9FF4 800B97F4 0F004014 */  bnez       $v0, .L800B9834
/* A9FF8 800B97F8 00000000 */   nop
/* A9FFC 800B97FC 0000028E */  lw         $v0, 0x0($s0)
/* AA000 800B9800 00000000 */  nop
/* AA004 800B9804 03004014 */  bnez       $v0, .L800B9814
/* AA008 800B9808 00000000 */   nop
/* AA00C 800B980C 6CE5020C */  jal        load
/* AA010 800B9810 00000000 */   nop
.L800B9814:
/* AA014 800B9814 0800048E */  lw         $a0, 0x8($s0)
/* AA018 800B9818 0400028E */  lw         $v0, 0x4($s0)
/* AA01C 800B981C 01000324 */  addiu      $v1, $zero, 0x1
/* AA020 800B9820 0C0003A6 */  sh         $v1, 0xC($s0)
/* AA024 800B9824 0C00428C */  lw         $v0, 0xC($v0)
/* AA028 800B9828 00000000 */  nop
/* AA02C 800B982C 09F84000 */  jalr       $v0
/* AA030 800B9830 00000000 */   nop
.L800B9834:
/* AA034 800B9834 1400BF8F */  lw         $ra, 0x14($sp)
/* AA038 800B9838 1000B08F */  lw         $s0, 0x10($sp)
/* AA03C 800B983C 01000224 */  addiu      $v0, $zero, 0x1
/* AA040 800B9840 0800E003 */  jr         $ra
/* AA044 800B9844 1800BD27 */   addiu     $sp, $sp, 0x18
.size maybe_start, . - maybe_start
