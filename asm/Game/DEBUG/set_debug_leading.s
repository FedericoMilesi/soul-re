.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel set_debug_leading
/* 43B8 80013BB8 0A000224 */  addiu      $v0, $zero, 0xA
/* 43BC 80013BBC C48B82AF */  sw         $v0, %gp_rel(cem_line_leading)($gp)
/* 43C0 80013BC0 0C000224 */  addiu      $v0, $zero, 0xC
/* 43C4 80013BC4 C88B82AF */  sw         $v0, %gp_rel(cem_item_leading)($gp)
/* 43C8 80013BC8 0800E003 */  jr         $ra
/* 43CC 80013BCC 00000000 */   nop
.size set_debug_leading, . - set_debug_leading
