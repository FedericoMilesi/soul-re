.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_ParseOperand2
/* 54000 80063800 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 54004 80063804 1800B0AF */  sw         $s0, 0x18($sp)
/* 54008 80063808 2180A000 */  addu       $s0, $a1, $zero
/* 5400C 8006380C 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 54010 80063810 2188C000 */  addu       $s1, $a2, $zero
/* 54014 80063814 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 54018 80063818 0A008010 */  beqz       $a0, .L80063844
/* 5401C 8006381C 2000BFAF */   sw        $ra, 0x20($sp)
/* 54020 80063820 63A2010C */  jal        EVENT_GetScalerValueFromOperand
/* 54024 80063824 1000A627 */   addiu     $a2, $sp, 0x10
/* 54028 80063828 0000038E */  lw         $v1, 0x0($s0)
/* 5402C 8006382C 00000000 */  nop
/* 54030 80063830 04006014 */  bnez       $v1, .L80063844
/* 54034 80063834 00000000 */   nop
/* 54038 80063838 02004014 */  bnez       $v0, .L80063844
/* 5403C 8006383C 00000000 */   nop
/* 54040 80063840 000020AE */  sw         $zero, 0x0($s1)
.L80063844:
/* 54044 80063844 2000BF8F */  lw         $ra, 0x20($sp)
/* 54048 80063848 1C00B18F */  lw         $s1, 0x1C($sp)
/* 5404C 8006384C 1800B08F */  lw         $s0, 0x18($sp)
/* 54050 80063850 0800E003 */  jr         $ra
/* 54054 80063854 2800BD27 */   addiu     $sp, $sp, 0x28
.size EVENT_ParseOperand2, . - EVENT_ParseOperand2
