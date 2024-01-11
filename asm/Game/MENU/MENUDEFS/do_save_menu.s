.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel do_save_menu
/* A8F2C 800B872C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* A8F30 800B8730 05000224 */  addiu      $v0, $zero, 0x5
/* A8F34 800B8734 0300C210 */  beq        $a2, $v0, .L800B8744
/* A8F38 800B8738 1000BFAF */   sw        $ra, 0x10($sp)
/* A8F3C 800B873C D6E10208 */  j          .L800B8758
/* A8F40 800B8740 21100000 */   addu      $v0, $zero, $zero
.L800B8744:
/* A8F44 800B8744 0C80053C */  lui        $a1, %hi(memcard_pause_menu)
/* A8F48 800B8748 2000848C */  lw         $a0, 0x20($a0)
/* A8F4C 800B874C EEDD020C */  jal        menu_push
/* A8F50 800B8750 9C98A524 */   addiu     $a1, $a1, %lo(memcard_pause_menu)
/* A8F54 800B8754 01000224 */  addiu      $v0, $zero, 0x1
.L800B8758:
/* A8F58 800B8758 1000BF8F */  lw         $ra, 0x10($sp)
/* A8F5C 800B875C 00000000 */  nop
/* A8F60 800B8760 0800E003 */  jr         $ra
/* A8F64 800B8764 1800BD27 */   addiu     $sp, $sp, 0x18
.size do_save_menu, . - do_save_menu
