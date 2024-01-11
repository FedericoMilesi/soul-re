.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MONTABLE_SetMessageFunc
/* 7D9D4 8008D1D4 1C00828C */  lw         $v0, 0x1C($a0)
/* 7D9D8 8008D1D8 00000000 */  nop
/* 7D9DC 8008D1DC 4000428C */  lw         $v0, 0x40($v0)
/* 7D9E0 8008D1E0 00000000 */  nop
/* 7D9E4 8008D1E4 06004010 */  beqz       $v0, .L8008D200
/* 7D9E8 8008D1E8 00000000 */   nop
/* 7D9EC 8008D1EC 1000428C */  lw         $v0, 0x10($v0)
/* 7D9F0 8008D1F0 00000000 */  nop
/* 7D9F4 8008D1F4 02004010 */  beqz       $v0, .L8008D200
/* 7D9F8 8008D1F8 00000000 */   nop
/* 7D9FC 8008D1FC 1C0182AC */  sw         $v0, 0x11C($a0)
.L8008D200:
/* 7DA00 8008D200 0800E003 */  jr         $ra
/* 7DA04 8008D204 00000000 */   nop
.size MONTABLE_SetMessageFunc, . - MONTABLE_SetMessageFunc
