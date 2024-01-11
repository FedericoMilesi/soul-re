.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel menu_initialize
/* A7F00 800B7700 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* A7F04 800B7704 1000B0AF */  sw         $s0, 0x10($sp)
/* A7F08 800B7708 21808000 */  addu       $s0, $a0, $zero
/* A7F0C 800B770C 1400B1AF */  sw         $s1, 0x14($sp)
/* A7F10 800B7710 2188A000 */  addu       $s1, $a1, $zero
/* A7F14 800B7714 21280000 */  addu       $a1, $zero, $zero
/* A7F18 800B7718 1800BFAF */  sw         $ra, 0x18($sp)
/* A7F1C 800B771C 2EF2020C */  jal        func_800BC8B8
/* A7F20 800B7720 88030624 */   addiu     $a2, $zero, 0x388
/* A7F24 800B7724 FFFF0224 */  addiu      $v0, $zero, -0x1
/* A7F28 800B7728 000002AE */  sw         $v0, 0x0($s0)
/* A7F2C 800B772C 840311AE */  sw         $s1, 0x384($s0)
/* A7F30 800B7730 1800BF8F */  lw         $ra, 0x18($sp)
/* A7F34 800B7734 1400B18F */  lw         $s1, 0x14($sp)
/* A7F38 800B7738 1000B08F */  lw         $s0, 0x10($sp)
/* A7F3C 800B773C 0800E003 */  jr         $ra
/* A7F40 800B7740 2000BD27 */   addiu     $sp, $sp, 0x20
.size menu_initialize, . - menu_initialize
