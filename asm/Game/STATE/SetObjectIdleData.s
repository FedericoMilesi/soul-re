.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetObjectIdleData
/* 6227C 80071A7C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 62280 80071A80 1000B0AF */  sw         $s0, 0x10($sp)
/* 62284 80071A84 21808000 */  addu       $s0, $a0, $zero
/* 62288 80071A88 1400B1AF */  sw         $s1, 0x14($sp)
/* 6228C 80071A8C 2188A000 */  addu       $s1, $a1, $zero
/* 62290 80071A90 1800BFAF */  sw         $ra, 0x18($sp)
/* 62294 80071A94 6DC3010C */  jal        CIRC_Alloc
/* 62298 80071A98 08000424 */   addiu     $a0, $zero, 0x8
/* 6229C 80071A9C 000050AC */  sw         $s0, 0x0($v0)
/* 622A0 80071AA0 040051AC */  sw         $s1, 0x4($v0)
/* 622A4 80071AA4 1800BF8F */  lw         $ra, 0x18($sp)
/* 622A8 80071AA8 1400B18F */  lw         $s1, 0x14($sp)
/* 622AC 80071AAC 1000B08F */  lw         $s0, 0x10($sp)
/* 622B0 80071AB0 0800E003 */  jr         $ra
/* 622B4 80071AB4 2000BD27 */   addiu     $sp, $sp, 0x20
.size SetObjectIdleData, . - SetObjectIdleData
