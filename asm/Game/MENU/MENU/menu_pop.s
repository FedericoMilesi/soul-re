.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel menu_pop
/* A8028 800B7828 0000828C */  lw         $v0, 0x0($a0)
/* A802C 800B782C 00000000 */  nop
/* A8030 800B7830 FFFF4224 */  addiu      $v0, $v0, -0x1
/* A8034 800B7834 0800E003 */  jr         $ra
/* A8038 800B7838 000082AC */   sw        $v0, 0x0($a0)
.size menu_pop, . - menu_pop
