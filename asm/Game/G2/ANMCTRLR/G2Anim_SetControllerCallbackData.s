.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2Anim_SetControllerCallbackData
/* 81194 80090994 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 81198 80090998 1000B0AF */  sw         $s0, 0x10($sp)
/* 8119C 8009099C 1400BFAF */  sw         $ra, 0x14($sp)
/* 811A0 800909A0 0A47020C */  jal        _G2Anim_FindController
/* 811A4 800909A4 2180E000 */   addu      $s0, $a3, $zero
/* 811A8 800909A8 040050AC */  sw         $s0, 0x4($v0)
/* 811AC 800909AC 1400BF8F */  lw         $ra, 0x14($sp)
/* 811B0 800909B0 1000B08F */  lw         $s0, 0x10($sp)
/* 811B4 800909B4 0800E003 */  jr         $ra
/* 811B8 800909B8 1800BD27 */   addiu     $sp, $sp, 0x18
.size G2Anim_SetControllerCallbackData, . - G2Anim_SetControllerCallbackData
