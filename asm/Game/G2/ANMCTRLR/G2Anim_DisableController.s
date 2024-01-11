.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2Anim_DisableController
/* 80E34 80090634 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 80E38 80090638 1000B0AF */  sw         $s0, 0x10($sp)
/* 80E3C 8009063C 21808000 */  addu       $s0, $a0, $zero
/* 80E40 80090640 2120A000 */  addu       $a0, $a1, $zero
/* 80E44 80090644 2128C000 */  addu       $a1, $a2, $zero
/* 80E48 80090648 1400BFAF */  sw         $ra, 0x14($sp)
/* 80E4C 8009064C 5348020C */  jal        _G2AnimControllerST_RemoveFromList
/* 80E50 80090650 02000626 */   addiu     $a2, $s0, 0x2
/* 80E54 80090654 03004010 */  beqz       $v0, .L80090664
/* 80E58 80090658 21204000 */   addu      $a0, $v0, $zero
/* 80E5C 8009065C 5447020C */  jal        _G2AnimController_InsertIntoList
/* 80E60 80090660 04000526 */   addiu     $a1, $s0, 0x4
.L80090664:
/* 80E64 80090664 1400BF8F */  lw         $ra, 0x14($sp)
/* 80E68 80090668 1000B08F */  lw         $s0, 0x10($sp)
/* 80E6C 8009066C 0800E003 */  jr         $ra
/* 80E70 80090670 1800BD27 */   addiu     $sp, $sp, 0x18
.size G2Anim_DisableController, . - G2Anim_DisableController
