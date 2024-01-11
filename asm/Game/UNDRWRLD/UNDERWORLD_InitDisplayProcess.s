.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel UNDERWORLD_InitDisplayProcess
/* A55E0 800B4DE0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* A55E4 800B4DE4 1000BFAF */  sw         $ra, 0x10($sp)
.L800B4DE8:
/* A55E8 800B4DE8 E4BE848F */  lw         $a0, %gp_rel(gameTrackerX + 0x11C)($gp)
/* A55EC 800B4DEC 8494000C */  jal        func_80025210
/* A55F0 800B4DF0 00000000 */   nop
/* A55F4 800B4DF4 FCFF4014 */  bnez       $v0, .L800B4DE8
/* A55F8 800B4DF8 00000000 */   nop
/* A55FC 800B4DFC E0BE848F */  lw         $a0, %gp_rel(gameTrackerX + 0x118)($gp)
/* A5600 800B4E00 8494000C */  jal        func_80025210
/* A5604 800B4E04 00000000 */   nop
/* A5608 800B4E08 F7FF4014 */  bnez       $v0, .L800B4DE8
/* A560C 800B4E0C 48000424 */   addiu     $a0, $zero, 0x48
/* A5610 800B4E10 8140010C */  jal        MEMPACK_Malloc
/* A5614 800B4E14 18000524 */   addiu     $a1, $zero, 0x18
/* A5618 800B4E18 2CA882AF */  sw         $v0, %gp_rel(ScreenMorphArray)($gp)
/* A561C 800B4E1C 21400000 */  addu       $t0, $zero, $zero
/* A5620 800B4E20 21484000 */  addu       $t1, $v0, $zero
/* A5624 800B4E24 01000724 */  addiu      $a3, $zero, 0x1
/* A5628 800B4E28 21300001 */  addu       $a2, $t0, $zero
.L800B4E2C:
/* A562C 800B4E2C 21280000 */  addu       $a1, $zero, $zero
/* A5630 800B4E30 01000424 */  addiu      $a0, $zero, 0x1
/* A5634 800B4E34 21182001 */  addu       $v1, $t1, $zero
.L800B4E38:
/* A5638 800B4E38 21106600 */  addu       $v0, $v1, $a2
/* A563C 800B4E3C 000044A4 */  sh         $a0, 0x0($v0)
/* A5640 800B4E40 FE008424 */  addiu      $a0, $a0, 0xFE
/* A5644 800B4E44 0100A524 */  addiu      $a1, $a1, 0x1
/* A5648 800B4E48 020047A4 */  sh         $a3, 0x2($v0)
/* A564C 800B4E4C 0300A228 */  slti       $v0, $a1, 0x3
/* A5650 800B4E50 F9FF4014 */  bnez       $v0, .L800B4E38
/* A5654 800B4E54 08006324 */   addiu     $v1, $v1, 0x8
/* A5658 800B4E58 7700E724 */  addiu      $a3, $a3, 0x77
/* A565C 800B4E5C 01000825 */  addiu      $t0, $t0, 0x1
/* A5660 800B4E60 03000229 */  slti       $v0, $t0, 0x3
/* A5664 800B4E64 F1FF4014 */  bnez       $v0, .L800B4E2C
/* A5668 800B4E68 1800C624 */   addiu     $a2, $a2, 0x18
/* A566C 800B4E6C 00100224 */  addiu      $v0, $zero, 0x1000
/* A5670 800B4E70 D0FD82AF */  sw         $v0, %gp_rel(UW_scalex)($gp)
/* A5674 800B4E74 20000224 */  addiu      $v0, $zero, 0x20
/* A5678 800B4E78 D4FD82AF */  sw         $v0, %gp_rel(UW_scalexInc)($gp)
/* A567C 800B4E7C 08000224 */  addiu      $v0, $zero, 0x8
/* A5680 800B4E80 CCFD80AF */  sw         $zero, %gp_rel(UW_angle)($gp)
/* A5684 800B4E84 D8FD82AF */  sw         $v0, %gp_rel(UW_angleInc)($gp)
/* A5688 800B4E88 4DD3020C */  jal        UNDERWORLD_SetupSource
/* A568C 800B4E8C 00000000 */   nop
/* A5690 800B4E90 1000BF8F */  lw         $ra, 0x10($sp)
/* A5694 800B4E94 00000000 */  nop
/* A5698 800B4E98 0800E003 */  jr         $ra
/* A569C 800B4E9C 1800BD27 */   addiu     $sp, $sp, 0x18
.size UNDERWORLD_InitDisplayProcess, . - UNDERWORLD_InitDisplayProcess
