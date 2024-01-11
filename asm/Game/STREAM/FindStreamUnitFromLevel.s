.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FindStreamUnitFromLevel
/* 493F0 80058BF0 21300000 */  addu       $a2, $zero, $zero
/* 493F4 80058BF4 2128C000 */  addu       $a1, $a2, $zero
/* 493F8 80058BF8 02000724 */  addiu      $a3, $zero, 0x2
/* 493FC 80058BFC 3CC78327 */  addiu      $v1, $gp, %gp_rel(StreamTracker)
.L80058C00:
/* 49400 80058C00 04006284 */  lh         $v0, 0x4($v1)
/* 49404 80058C04 00000000 */  nop
/* 49408 80058C08 07004714 */  bne        $v0, $a3, .L80058C28
/* 4940C 80058C0C 00000000 */   nop
/* 49410 80058C10 0800628C */  lw         $v0, 0x8($v1)
/* 49414 80058C14 00000000 */  nop
/* 49418 80058C18 04004414 */  bne        $v0, $a0, .L80058C2C
/* 4941C 80058C1C 0100A524 */   addiu     $a1, $a1, 0x1
/* 49420 80058C20 0E630108 */  j          .L80058C38
/* 49424 80058C24 21306000 */   addu      $a2, $v1, $zero
.L80058C28:
/* 49428 80058C28 0100A524 */  addiu      $a1, $a1, 0x1
.L80058C2C:
/* 4942C 80058C2C 1000A228 */  slti       $v0, $a1, 0x10
/* 49430 80058C30 F3FF4014 */  bnez       $v0, .L80058C00
/* 49434 80058C34 40006324 */   addiu     $v1, $v1, 0x40
.L80058C38:
/* 49438 80058C38 0800E003 */  jr         $ra
/* 4943C 80058C3C 2110C000 */   addu      $v0, $a2, $zero
.size FindStreamUnitFromLevel, . - FindStreamUnitFromLevel
