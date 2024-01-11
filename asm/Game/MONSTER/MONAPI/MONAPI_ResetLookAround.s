.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MONAPI_ResetLookAround
/* 6FAFC 8007F2FC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 6FB00 8007F300 1400BFAF */  sw         $ra, 0x14($sp)
/* 6FB04 8007F304 1000B0AF */  sw         $s0, 0x10($sp)
/* 6FB08 8007F308 6C01908C */  lw         $s0, 0x16C($a0)
/* 6FB0C 8007F30C C809020C */  jal        MON_DisableHeadMove
/* 6FB10 8007F310 00000000 */   nop
/* 6FB14 8007F314 01000224 */  addiu      $v0, $zero, 0x1
/* 6FB18 8007F318 080102AE */  sw         $v0, 0x108($s0)
/* 6FB1C 8007F31C 1400BF8F */  lw         $ra, 0x14($sp)
/* 6FB20 8007F320 1000B08F */  lw         $s0, 0x10($sp)
/* 6FB24 8007F324 0800E003 */  jr         $ra
/* 6FB28 8007F328 1800BD27 */   addiu     $sp, $sp, 0x18
.size MONAPI_ResetLookAround, . - MONAPI_ResetLookAround
