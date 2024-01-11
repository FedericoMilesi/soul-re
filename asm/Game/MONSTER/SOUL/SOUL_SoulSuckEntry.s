.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SOUL_SoulSuckEntry
/* 7E5C4 8008DDC4 58020224 */  addiu      $v0, $zero, 0x258
/* 7E5C8 8008DDC8 8C0182AC */  sw         $v0, 0x18C($a0)
/* 7E5CC 8008DDCC 900182AC */  sw         $v0, 0x190($a0)
/* 7E5D0 8008DDD0 11000224 */  addiu      $v0, $zero, 0x11
/* 7E5D4 8008DDD4 940182AC */  sw         $v0, 0x194($a0)
/* 7E5D8 8008DDD8 1400828C */  lw         $v0, 0x14($a0)
/* 7E5DC 8008DDDC FFF70324 */  addiu      $v1, $zero, -0x801
/* 7E5E0 8008DDE0 24104300 */  and        $v0, $v0, $v1
/* 7E5E4 8008DDE4 0800E003 */  jr         $ra
/* 7E5E8 8008DDE8 140082AC */   sw        $v0, 0x14($a0)
.size SOUL_SoulSuckEntry, . - SOUL_SoulSuckEntry
