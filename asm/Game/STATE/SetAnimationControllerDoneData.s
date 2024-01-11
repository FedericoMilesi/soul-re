.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetAnimationControllerDoneData
/* 61D34 80071534 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 61D38 80071538 1000B0AF */  sw         $s0, 0x10($sp)
/* 61D3C 8007153C 21808000 */  addu       $s0, $a0, $zero
/* 61D40 80071540 1400B1AF */  sw         $s1, 0x14($sp)
/* 61D44 80071544 2188A000 */  addu       $s1, $a1, $zero
/* 61D48 80071548 1800B2AF */  sw         $s2, 0x18($sp)
/* 61D4C 8007154C 2190C000 */  addu       $s2, $a2, $zero
/* 61D50 80071550 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 61D54 80071554 2198E000 */  addu       $s3, $a3, $zero
/* 61D58 80071558 2000BFAF */  sw         $ra, 0x20($sp)
/* 61D5C 8007155C 6DC3010C */  jal        CIRC_Alloc
/* 61D60 80071560 10000424 */   addiu     $a0, $zero, 0x10
/* 61D64 80071564 000050AC */  sw         $s0, 0x0($v0)
/* 61D68 80071568 040051AC */  sw         $s1, 0x4($v0)
/* 61D6C 8007156C 080052AC */  sw         $s2, 0x8($v0)
/* 61D70 80071570 0C0053AC */  sw         $s3, 0xC($v0)
/* 61D74 80071574 2000BF8F */  lw         $ra, 0x20($sp)
/* 61D78 80071578 1C00B38F */  lw         $s3, 0x1C($sp)
/* 61D7C 8007157C 1800B28F */  lw         $s2, 0x18($sp)
/* 61D80 80071580 1400B18F */  lw         $s1, 0x14($sp)
/* 61D84 80071584 1000B08F */  lw         $s0, 0x10($sp)
/* 61D88 80071588 0800E003 */  jr         $ra
/* 61D8C 8007158C 2800BD27 */   addiu     $sp, $sp, 0x28
.size SetAnimationControllerDoneData, . - SetAnimationControllerDoneData
