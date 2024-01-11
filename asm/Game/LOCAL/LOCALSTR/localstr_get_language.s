.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel localstr_get_language
/* A7E30 800B7630 1800828F */  lw         $v0, %gp_rel(the_language)($gp)
/* A7E34 800B7634 0800E003 */  jr         $ra
/* A7E38 800B7638 00000000 */   nop
.size localstr_get_language, . - localstr_get_language
