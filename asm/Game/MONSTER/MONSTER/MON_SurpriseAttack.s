.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_SurpriseAttack
/* 7B960 8008B160 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 7B964 8008B164 1000BFAF */  sw         $ra, 0x10($sp)
/* 7B968 8008B168 0B27020C */  jal        MON_Attack
/* 7B96C 8008B16C 00000000 */   nop
/* 7B970 8008B170 1000BF8F */  lw         $ra, 0x10($sp)
/* 7B974 8008B174 00000000 */  nop
/* 7B978 8008B178 0800E003 */  jr         $ra
/* 7B97C 8008B17C 1800BD27 */   addiu     $sp, $sp, 0x18
.size MON_SurpriseAttack, . - MON_SurpriseAttack
