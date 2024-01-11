.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetShadowSegmentData
/* 62384 80071B84 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 62388 80071B88 1000B0AF */  sw         $s0, 0x10($sp)
/* 6238C 80071B8C 21808000 */  addu       $s0, $a0, $zero
/* 62390 80071B90 1400BFAF */  sw         $ra, 0x14($sp)
/* 62394 80071B94 6DC3010C */  jal        CIRC_Alloc
/* 62398 80071B98 0C000424 */   addiu     $a0, $zero, 0xC
/* 6239C 80071B9C 000050AC */  sw         $s0, 0x0($v0)
/* 623A0 80071BA0 1400BF8F */  lw         $ra, 0x14($sp)
/* 623A4 80071BA4 1000B08F */  lw         $s0, 0x10($sp)
/* 623A8 80071BA8 0800E003 */  jr         $ra
/* 623AC 80071BAC 1800BD27 */   addiu     $sp, $sp, 0x18
.size SetShadowSegmentData, . - SetShadowSegmentData
