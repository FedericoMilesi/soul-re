.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razSetFadeEffect
/* 95DFC 800A55FC 4CFB828F */  lw         $v0, %gp_rel(Raziel + 0x51C)($gp)
/* 95E00 800A5600 50FB84A7 */  sh         $a0, %gp_rel(Raziel + 0x520)($gp)
/* 95E04 800A5604 52FB85A7 */  sh         $a1, %gp_rel(Raziel + 0x522)($gp)
/* 95E08 800A5608 58FB80AF */  sw         $zero, %gp_rel(Raziel + 0x528)($gp)
/* 95E0C 800A560C 54FB86AF */  sw         $a2, %gp_rel(Raziel + 0x524)($gp)
/* 95E10 800A5610 03004234 */  ori        $v0, $v0, 0x3
/* 95E14 800A5614 4CFB82AF */  sw         $v0, %gp_rel(Raziel + 0x51C)($gp)
/* 95E18 800A5618 0800E003 */  jr         $ra
/* 95E1C 800A561C 00000000 */   nop
.size razSetFadeEffect, . - razSetFadeEffect
