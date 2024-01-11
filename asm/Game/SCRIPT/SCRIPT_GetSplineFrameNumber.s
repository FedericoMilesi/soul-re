.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SCRIPT_GetSplineFrameNumber
/* 2D94C 8003D14C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 2D950 8003D150 1000B0AF */  sw         $s0, 0x10($sp)
/* 2D954 8003D154 21808000 */  addu       $s0, $a0, $zero
/* 2D958 8003D158 1400B1AF */  sw         $s1, 0x14($sp)
/* 2D95C 8003D15C 1800BFAF */  sw         $ra, 0x18($sp)
/* 2D960 8003D160 37F4000C */  jal        ScriptGetPosSpline
/* 2D964 8003D164 2188A000 */   addu      $s1, $a1, $zero
/* 2D968 8003D168 05004014 */  bnez       $v0, .L8003D180
/* 2D96C 8003D16C 00000000 */   nop
/* 2D970 8003D170 45F4000C */  jal        ScriptGetRotSpline
/* 2D974 8003D174 21200002 */   addu      $a0, $s0, $zero
/* 2D978 8003D178 63F40008 */  j          .L8003D18C
/* 2D97C 8003D17C 21204000 */   addu      $a0, $v0, $zero
.L8003D180:
/* 2D980 8003D180 37F4000C */  jal        ScriptGetPosSpline
/* 2D984 8003D184 21200002 */   addu      $a0, $s0, $zero
/* 2D988 8003D188 21204000 */  addu       $a0, $v0, $zero
.L8003D18C:
/* 2D98C 8003D18C 1605010C */  jal        SplineGetFrameNumber
/* 2D990 8003D190 21282002 */   addu      $a1, $s1, $zero
/* 2D994 8003D194 FFFF4230 */  andi       $v0, $v0, 0xFFFF
/* 2D998 8003D198 1800BF8F */  lw         $ra, 0x18($sp)
/* 2D99C 8003D19C 1400B18F */  lw         $s1, 0x14($sp)
/* 2D9A0 8003D1A0 1000B08F */  lw         $s0, 0x10($sp)
/* 2D9A4 8003D1A4 0800E003 */  jr         $ra
/* 2D9A8 8003D1A8 2000BD27 */   addiu     $sp, $sp, 0x20
.size SCRIPT_GetSplineFrameNumber, . - SCRIPT_GetSplineFrameNumber
