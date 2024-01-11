.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MONTABLE_GetCleanUpFunc
/* 7D96C 8008D16C 1C00828C */  lw         $v0, 0x1C($a0)
/* 7D970 8008D170 00000000 */  nop
/* 7D974 8008D174 4000428C */  lw         $v0, 0x40($v0)
/* 7D978 8008D178 00000000 */  nop
/* 7D97C 8008D17C 05004010 */  beqz       $v0, .L8008D194
/* 7D980 8008D180 00000000 */   nop
/* 7D984 8008D184 0400428C */  lw         $v0, 0x4($v0)
/* 7D988 8008D188 00000000 */  nop
/* 7D98C 8008D18C 02004014 */  bnez       $v0, .L8008D198
/* 7D990 8008D190 00000000 */   nop
.L8008D194:
/* 7D994 8008D194 B4A5828F */  lw         $v0, %gp_rel(DefaultFunctionTable + 0x4)($gp)
.L8008D198:
/* 7D998 8008D198 0800E003 */  jr         $ra
/* 7D99C 8008D19C 00000000 */   nop
.size MONTABLE_GetCleanUpFunc, . - MONTABLE_GetCleanUpFunc
