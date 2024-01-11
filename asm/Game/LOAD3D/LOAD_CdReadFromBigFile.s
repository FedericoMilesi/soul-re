.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LOAD_CdReadFromBigFile
/* 28240 80037A40 1000A38F */  lw         $v1, 0x10($sp)
/* 28244 80037A44 01000224 */  addiu      $v0, $zero, 0x1
/* 28248 80037A48 98BB86AF */  sw         $a2, %gp_rel(loadStatus + 0x4)($gp)
/* 2824C 80037A4C 9CBB80AF */  sw         $zero, %gp_rel(loadStatus + 0x8)($gp)
/* 28250 80037A50 A0BB85AF */  sw         $a1, %gp_rel(loadStatus + 0xC)($gp)
/* 28254 80037A54 94BB84AF */  sw         $a0, %gp_rel(loadStatus)($gp)
/* 28258 80037A58 A8BB82AF */  sw         $v0, %gp_rel(loadStatus + 0x14)($gp)
/* 2825C 80037A5C B0BB87AF */  sw         $a3, %gp_rel(loadStatus + 0x1C)($gp)
/* 28260 80037A60 ACBB83AF */  sw         $v1, %gp_rel(loadStatus + 0x18)($gp)
/* 28264 80037A64 0800E003 */  jr         $ra
/* 28268 80037A68 00000000 */   nop
.size LOAD_CdReadFromBigFile, . - LOAD_CdReadFromBigFile
