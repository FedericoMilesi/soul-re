.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LOAD_StopLoad
/* 28CD4 800384D4 24BC838F */  lw         $v1, %gp_rel(loadStatus + 0x90)($gp)
/* 28CD8 800384D8 05000224 */  addiu      $v0, $zero, 0x5
/* 28CDC 800384DC C0BB82AF */  sw         $v0, %gp_rel(loadStatus + 0x2C)($gp)
/* 28CE0 800384E0 A8BB80AF */  sw         $zero, %gp_rel(loadStatus + 0x14)($gp)
/* 28CE4 800384E4 02006010 */  beqz       $v1, .L800384F0
/* 28CE8 800384E8 00000000 */   nop
/* 28CEC 800384EC 24BC80AF */  sw         $zero, %gp_rel(loadStatus + 0x90)($gp)
.L800384F0:
/* 28CF0 800384F0 0800E003 */  jr         $ra
/* 28CF4 800384F4 00000000 */   nop
.size LOAD_StopLoad, . - LOAD_StopLoad
