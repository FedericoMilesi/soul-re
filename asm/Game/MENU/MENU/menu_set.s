.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel menu_set
/* A7F94 800B7794 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* A7F98 800B7798 1000BFAF */  sw         $ra, 0x10($sp)
/* A7F9C 800B779C 000080AC */  sw         $zero, 0x0($a0)
/* A7FA0 800B77A0 EEDD020C */  jal        menu_push
/* A7FA4 800B77A4 800380AC */   sw        $zero, 0x380($a0)
/* A7FA8 800B77A8 1000BF8F */  lw         $ra, 0x10($sp)
/* A7FAC 800B77AC 00000000 */  nop
/* A7FB0 800B77B0 0800E003 */  jr         $ra
/* A7FB4 800B77B4 1800BD27 */   addiu     $sp, $sp, 0x18
.size menu_set, . - menu_set
