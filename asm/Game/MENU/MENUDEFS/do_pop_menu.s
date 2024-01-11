.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel do_pop_menu
/* A8E5C 800B865C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* A8E60 800B8660 05000224 */  addiu      $v0, $zero, 0x5
/* A8E64 800B8664 0300C210 */  beq        $a2, $v0, .L800B8674
/* A8E68 800B8668 1000BFAF */   sw        $ra, 0x10($sp)
/* A8E6C 800B866C A1E10208 */  j          .L800B8684
/* A8E70 800B8670 21100000 */   addu      $v0, $zero, $zero
.L800B8674:
/* A8E74 800B8674 2000848C */  lw         $a0, 0x20($a0)
/* A8E78 800B8678 0ADE020C */  jal        menu_pop
/* A8E7C 800B867C 00000000 */   nop
/* A8E80 800B8680 01000224 */  addiu      $v0, $zero, 0x1
.L800B8684:
/* A8E84 800B8684 1000BF8F */  lw         $ra, 0x10($sp)
/* A8E88 800B8688 00000000 */  nop
/* A8E8C 800B868C 0800E003 */  jr         $ra
/* A8E90 800B8690 1800BD27 */   addiu     $sp, $sp, 0x18
.size do_pop_menu, . - do_pop_menu
