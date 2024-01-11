.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_RemoveTimer
/* 5199C 8006119C 09008010 */  beqz       $a0, .L800611C4
/* 519A0 800611A0 FEFF0324 */   addiu     $v1, $zero, -0x2
/* 519A4 800611A4 30CE828F */  lw         $v0, %gp_rel(numActiveEventTimers)($gp)
/* 519A8 800611A8 00000000 */  nop
/* 519AC 800611AC FFFF4224 */  addiu      $v0, $v0, -0x1
/* 519B0 800611B0 30CE82AF */  sw         $v0, %gp_rel(numActiveEventTimers)($gp)
/* 519B4 800611B4 0000828C */  lw         $v0, 0x0($a0)
/* 519B8 800611B8 00000000 */  nop
/* 519BC 800611BC 24104300 */  and        $v0, $v0, $v1
/* 519C0 800611C0 000082AC */  sw         $v0, 0x0($a0)
.L800611C4:
/* 519C4 800611C4 0800E003 */  jr         $ra
/* 519C8 800611C8 00000000 */   nop
.size EVENT_RemoveTimer, . - EVENT_RemoveTimer
