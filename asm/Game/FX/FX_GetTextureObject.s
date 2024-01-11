.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_GetTextureObject
/* 36E74 80046674 2C00828C */  lw         $v0, 0x2C($a0)
/* 36E78 80046678 0020033C */  lui        $v1, (0x20000000 >> 16)
/* 36E7C 8004667C 25104300 */  or         $v0, $v0, $v1
/* 36E80 80046680 2C0082AC */  sw         $v0, 0x2C($a0)
/* 36E84 80046684 0C00828C */  lw         $v0, 0xC($a0)
/* 36E88 80046688 80280500 */  sll        $a1, $a1, 2
/* 36E8C 8004668C 2128A200 */  addu       $a1, $a1, $v0
/* 36E90 80046690 0000A28C */  lw         $v0, 0x0($a1)
/* 36E94 80046694 00000000 */  nop
/* 36E98 80046698 1400428C */  lw         $v0, 0x14($v0)
/* 36E9C 8004669C 00310600 */  sll        $a2, $a2, 4
/* 36EA0 800466A0 1400428C */  lw         $v0, 0x14($v0)
/* 36EA4 800466A4 1000C624 */  addiu      $a2, $a2, 0x10
/* 36EA8 800466A8 0800E003 */  jr         $ra
/* 36EAC 800466AC 21104600 */   addu      $v0, $v0, $a2
.size FX_GetTextureObject, . - FX_GetTextureObject
