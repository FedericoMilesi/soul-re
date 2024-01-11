.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_YesMonsters
/* 49744 80058F44 FFFB033C */  lui        $v1, (0xFBFFFFFF >> 16)
/* 49748 80058F48 08BF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x140)($gp)
/* 4974C 80058F4C FFFF6334 */  ori        $v1, $v1, (0xFBFFFFFF & 0xFFFF)
/* 49750 80058F50 24104300 */  and        $v0, $v0, $v1
/* 49754 80058F54 08BF82AF */  sw         $v0, %gp_rel(gameTrackerX + 0x140)($gp)
/* 49758 80058F58 0800E003 */  jr         $ra
/* 4975C 80058F5C 00000000 */   nop
.size STREAM_YesMonsters, . - STREAM_YesMonsters
