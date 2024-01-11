.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2AnimSection_SetAlphaTable
/* 80908 80090108 2C00828C */  lw         $v0, 0x2C($a0)
/* 8090C 8009010C 00000000 */  nop
/* 80910 80090110 02004010 */  beqz       $v0, .L8009011C
/* 80914 80090114 00000000 */   nop
/* 80918 80090118 040045AC */  sw         $a1, 0x4($v0)
.L8009011C:
/* 8091C 8009011C 0800E003 */  jr         $ra
/* 80920 80090120 00000000 */   nop
.size G2AnimSection_SetAlphaTable, . - G2AnimSection_SetAlphaTable
