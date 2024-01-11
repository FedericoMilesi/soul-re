.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MONTABLE_GetDamageEffectFunc
/* 7D904 8008D104 1C00828C */  lw         $v0, 0x1C($a0)
/* 7D908 8008D108 00000000 */  nop
/* 7D90C 8008D10C 4000428C */  lw         $v0, 0x40($v0)
/* 7D910 8008D110 00000000 */  nop
/* 7D914 8008D114 05004010 */  beqz       $v0, .L8008D12C
/* 7D918 8008D118 00000000 */   nop
/* 7D91C 8008D11C 0800428C */  lw         $v0, 0x8($v0)
/* 7D920 8008D120 00000000 */  nop
/* 7D924 8008D124 02004014 */  bnez       $v0, .L8008D130
/* 7D928 8008D128 00000000 */   nop
.L8008D12C:
/* 7D92C 8008D12C B8A5828F */  lw         $v0, %gp_rel(DefaultFunctionTable + 0x8)($gp)
.L8008D130:
/* 7D930 8008D130 0800E003 */  jr         $ra
/* 7D934 8008D134 00000000 */   nop
.size MONTABLE_GetDamageEffectFunc, . - MONTABLE_GetDamageEffectFunc
