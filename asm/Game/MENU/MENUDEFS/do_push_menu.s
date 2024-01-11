.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel do_push_menu
/* A8E24 800B8624 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* A8E28 800B8628 05000224 */  addiu      $v0, $zero, 0x5
/* A8E2C 800B862C 0300C210 */  beq        $a2, $v0, .L800B863C
/* A8E30 800B8630 1000BFAF */   sw        $ra, 0x10($sp)
/* A8E34 800B8634 93E10208 */  j          .L800B864C
/* A8E38 800B8638 21100000 */   addu      $v0, $zero, $zero
.L800B863C:
/* A8E3C 800B863C 2000848C */  lw         $a0, 0x20($a0)
/* A8E40 800B8640 EEDD020C */  jal        menu_push
/* A8E44 800B8644 00000000 */   nop
/* A8E48 800B8648 01000224 */  addiu      $v0, $zero, 0x1
.L800B864C:
/* A8E4C 800B864C 1000BF8F */  lw         $ra, 0x10($sp)
/* A8E50 800B8650 00000000 */  nop
/* A8E54 800B8654 0800E003 */  jr         $ra
/* A8E58 800B8658 1800BD27 */   addiu     $sp, $sp, 0x18
.size do_push_menu, . - do_push_menu
