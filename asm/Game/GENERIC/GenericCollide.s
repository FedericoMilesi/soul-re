.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GenericCollide
/* 2F0DC 8003E8DC 0800E003 */  jr         $ra
/* 2F0E0 8003E8E0 00000000 */   nop
.size GenericCollide, . - GenericCollide
