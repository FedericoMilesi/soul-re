.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_Sprite_Insert
/* 36E3C 8004663C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 36E40 80046640 1000B0AF */  sw         $s0, 0x10($sp)
/* 36E44 80046644 1400BFAF */  sw         $ra, 0x14($sp)
/* 36E48 80046648 D53E010C */  jal        LIST_InsertFunc
/* 36E4C 8004664C 2180A000 */   addu      $s0, $a1, $zero
/* 36E50 80046650 BCC3828F */  lw         $v0, %gp_rel(FX_LastUsedPrim)($gp)
/* 36E54 80046654 00000000 */  nop
/* 36E58 80046658 02004014 */  bnez       $v0, .L80046664
/* 36E5C 8004665C 00000000 */   nop
/* 36E60 80046660 BCC390AF */  sw         $s0, %gp_rel(FX_LastUsedPrim)($gp)
.L80046664:
/* 36E64 80046664 1400BF8F */  lw         $ra, 0x14($sp)
/* 36E68 80046668 1000B08F */  lw         $s0, 0x10($sp)
/* 36E6C 8004666C 0800E003 */  jr         $ra
/* 36E70 80046670 1800BD27 */   addiu     $sp, $sp, 0x18
.size FX_Sprite_Insert, . - FX_Sprite_Insert
