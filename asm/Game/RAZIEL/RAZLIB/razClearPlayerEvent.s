.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razClearPlayerEvent
/* 982E8 800A7AE8 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 982EC 800A7AEC 1000033C */  lui        $v1, (0x100000 >> 16)
/* 982F0 800A7AF0 24104300 */  and        $v0, $v0, $v1
/* 982F4 800A7AF4 07004010 */  beqz       $v0, .L800A7B14
/* 982F8 800A7AF8 00000000 */   nop
/* 982FC 800A7AFC DCFB828F */  lw         $v0, %gp_rel(Raziel + 0x5AC)($gp)
/* 98300 800A7B00 00000000 */  nop
/* 98304 800A7B04 00204230 */  andi       $v0, $v0, 0x2000
/* 98308 800A7B08 DCFB82AF */  sw         $v0, %gp_rel(Raziel + 0x5AC)($gp)
/* 9830C 800A7B0C 0800E003 */  jr         $ra
/* 98310 800A7B10 00000000 */   nop
.L800A7B14:
/* 98314 800A7B14 DCFB80AF */  sw         $zero, %gp_rel(Raziel + 0x5AC)($gp)
/* 98318 800A7B18 0800E003 */  jr         $ra
/* 9831C 800A7B1C 00000000 */   nop
.size razClearPlayerEvent, . - razClearPlayerEvent
