.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel set_user_leading
/* 43D0 80013BD0 0C000224 */  addiu      $v0, $zero, 0xC
/* 43D4 80013BD4 C48B82AF */  sw         $v0, %gp_rel(cem_line_leading)($gp)
/* 43D8 80013BD8 10000224 */  addiu      $v0, $zero, 0x10
/* 43DC 80013BDC C88B82AF */  sw         $v0, %gp_rel(cem_item_leading)($gp)
/* 43E0 80013BE0 0800E003 */  jr         $ra
/* 43E4 80013BE4 00000000 */   nop
.size set_user_leading, . - set_user_leading
