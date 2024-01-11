.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel womp_background
/* A8F68 800B8768 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* A8F6C 800B876C 1000B0AF */  sw         $s0, 0x10($sp)
/* A8F70 800B8770 21808000 */  addu       $s0, $a0, $zero
/* A8F74 800B8774 BC95848F */  lw         $a0, %gp_rel(mainMenuScreen)($gp)
/* A8F78 800B8778 1400BFAF */  sw         $ra, 0x14($sp)
/* A8F7C 800B877C 2641010C */  jal        MEMPACK_Free
/* A8F80 800B8780 00000000 */   nop
/* A8F84 800B8784 B9E3000C */  jal        MAIN_LoadTim
/* A8F88 800B8788 21200002 */   addu      $a0, $s0, $zero
/* A8F8C 800B878C 1400BF8F */  lw         $ra, 0x14($sp)
/* A8F90 800B8790 1000B08F */  lw         $s0, 0x10($sp)
/* A8F94 800B8794 BC9582AF */  sw         $v0, %gp_rel(mainMenuScreen)($gp)
/* A8F98 800B8798 0800E003 */  jr         $ra
/* A8F9C 800B879C 1800BD27 */   addiu     $sp, $sp, 0x18
.size womp_background, . - womp_background
