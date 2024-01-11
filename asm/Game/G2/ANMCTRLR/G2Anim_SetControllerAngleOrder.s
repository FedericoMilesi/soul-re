.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2Anim_SetControllerAngleOrder
/* 811BC 800909BC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 811C0 800909C0 1000B0AF */  sw         $s0, 0x10($sp)
/* 811C4 800909C4 1400BFAF */  sw         $ra, 0x14($sp)
/* 811C8 800909C8 0A47020C */  jal        _G2Anim_FindController
/* 811CC 800909CC 2180E000 */   addu      $s0, $a3, $zero
/* 811D0 800909D0 08004394 */  lhu        $v1, 0x8($v0)
/* 811D4 800909D4 00000000 */  nop
/* 811D8 800909D8 00FF6330 */  andi       $v1, $v1, 0xFF00
/* 811DC 800909DC 25187000 */  or         $v1, $v1, $s0
/* 811E0 800909E0 080043A4 */  sh         $v1, 0x8($v0)
/* 811E4 800909E4 1400BF8F */  lw         $ra, 0x14($sp)
/* 811E8 800909E8 1000B08F */  lw         $s0, 0x10($sp)
/* 811EC 800909EC 0800E003 */  jr         $ra
/* 811F0 800909F0 1800BD27 */   addiu     $sp, $sp, 0x18
.size G2Anim_SetControllerAngleOrder, . - G2Anim_SetControllerAngleOrder
