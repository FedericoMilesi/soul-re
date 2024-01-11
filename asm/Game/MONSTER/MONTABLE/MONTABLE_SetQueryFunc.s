.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MONTABLE_SetQueryFunc
/* 7D9A0 8008D1A0 1C00828C */  lw         $v0, 0x1C($a0)
/* 7D9A4 8008D1A4 00000000 */  nop
/* 7D9A8 8008D1A8 4000428C */  lw         $v0, 0x40($v0)
/* 7D9AC 8008D1AC 00000000 */  nop
/* 7D9B0 8008D1B0 06004010 */  beqz       $v0, .L8008D1CC
/* 7D9B4 8008D1B4 00000000 */   nop
/* 7D9B8 8008D1B8 0C00428C */  lw         $v0, 0xC($v0)
/* 7D9BC 8008D1BC 00000000 */  nop
/* 7D9C0 8008D1C0 02004010 */  beqz       $v0, .L8008D1CC
/* 7D9C4 8008D1C4 00000000 */   nop
/* 7D9C8 8008D1C8 180182AC */  sw         $v0, 0x118($a0)
.L8008D1CC:
/* 7D9CC 8008D1CC 0800E003 */  jr         $ra
/* 7D9D0 8008D1D0 00000000 */   nop
.size MONTABLE_SetQueryFunc, . - MONTABLE_SetQueryFunc
