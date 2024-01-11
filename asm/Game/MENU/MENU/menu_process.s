.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel menu_process
/* A8C80 800B8480 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* A8C84 800B8484 1000B0AF */  sw         $s0, 0x10($sp)
/* A8C88 800B8488 1400BFAF */  sw         $ra, 0x14($sp)
/* A8C8C 800B848C 5CDE020C */  jal        menu_build
/* A8C90 800B8490 21808000 */   addu      $s0, $a0, $zero
/* A8C94 800B8494 4CE0020C */  jal        menu_draw
/* A8C98 800B8498 21200002 */   addu      $a0, $s0, $zero
/* A8C9C 800B849C A4E0020C */  jal        menu_run
/* A8CA0 800B84A0 21200002 */   addu      $a0, $s0, $zero
/* A8CA4 800B84A4 1400BF8F */  lw         $ra, 0x14($sp)
/* A8CA8 800B84A8 1000B08F */  lw         $s0, 0x10($sp)
/* A8CAC 800B84AC 0800E003 */  jr         $ra
/* A8CB0 800B84B0 1800BD27 */   addiu     $sp, $sp, 0x18
.size menu_process, . - menu_process
