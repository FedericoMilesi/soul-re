.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_GetTime
/* 72240 80081A40 1C00828C */  lw         $v0, 0x1C($a0)
/* 72244 80081A44 00000000 */  nop
/* 72248 80081A48 0000428C */  lw         $v0, 0x0($v0)
/* 7224C 80081A4C 0800033C */  lui        $v1, (0x80000 >> 16)
/* 72250 80081A50 24104300 */  and        $v0, $v0, $v1
/* 72254 80081A54 04004010 */  beqz       $v0, .L80081A68
/* 72258 80081A58 0008033C */   lui       $v1, (0x8000000 >> 16)
/* 7225C 80081A5C F4BF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x22C)($gp)
/* 72260 80081A60 0800E003 */  jr         $ra
/* 72264 80081A64 00000000 */   nop
.L80081A68:
/* 72268 80081A68 1800828C */  lw         $v0, 0x18($a0)
/* 7226C 80081A6C 00000000 */  nop
/* 72270 80081A70 24104300 */  and        $v0, $v0, $v1
/* 72274 80081A74 04004014 */  bnez       $v0, .L80081A88
/* 72278 80081A78 00000000 */   nop
/* 7227C 80081A7C F8BF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x230)($gp)
/* 72280 80081A80 0800E003 */  jr         $ra
/* 72284 80081A84 00000000 */   nop
.L80081A88:
/* 72288 80081A88 FCBF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x234)($gp)
/* 7228C 80081A8C 0800E003 */  jr         $ra
/* 72290 80081A90 00000000 */   nop
.size MON_GetTime, . - MON_GetTime
