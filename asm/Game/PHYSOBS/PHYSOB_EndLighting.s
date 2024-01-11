.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PHYSOB_EndLighting
/* 5B570 8006AD70 0600A010 */  beqz       $a1, .L8006AD8C
/* 5B574 8006AD74 00000000 */   nop
/* 5B578 8006AD78 D4BD828F */  lw         $v0, %gp_rel(gameTrackerX + 0xC)($gp)
/* 5B57C 8006AD7C 00000000 */  nop
/* 5B580 8006AD80 02004414 */  bne        $v0, $a0, .L8006AD8C
/* 5B584 8006AD84 00000000 */   nop
/* 5B588 8006AD88 D4BD80AF */  sw         $zero, %gp_rel(gameTrackerX + 0xC)($gp)
.L8006AD8C:
/* 5B58C 8006AD8C 0800E003 */  jr         $ra
/* 5B590 8006AD90 00000000 */   nop
.size PHYSOB_EndLighting, . - PHYSOB_EndLighting
