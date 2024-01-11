.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel VM_Tick
/* 40424 8004FC24 D49A828F */  lw         $v0, %gp_rel(vmRealClock)($gp)
/* 40428 8004FC28 00000000 */  nop
/* 4042C 8004FC2C 21104400 */  addu       $v0, $v0, $a0
/* 40430 8004FC30 D49A82AF */  sw         $v0, %gp_rel(vmRealClock)($gp)
/* 40434 8004FC34 03120200 */  sra        $v0, $v0, 8
/* 40438 8004FC38 D89A82AF */  sw         $v0, %gp_rel(vmClock)($gp)
/* 4043C 8004FC3C 0800E003 */  jr         $ra
/* 40440 8004FC40 00000000 */   nop
.size VM_Tick, . - VM_Tick
