.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_TurnOffAllSpheres
/* 701EC 8007F9EC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 701F0 8007F9F0 1000B0AF */  sw         $s0, 0x10($sp)
/* 701F4 8007F9F4 1400BFAF */  sw         $ra, 0x14($sp)
/* 701F8 8007F9F8 76FD010C */  jal        MON_TurnOffWeaponSpheres
/* 701FC 8007F9FC 21808000 */   addu      $s0, $a0, $zero
/* 70200 8007FA00 24FE010C */  jal        MON_TurnOffBodySpheres
/* 70204 8007FA04 21200002 */   addu      $a0, $s0, $zero
/* 70208 8007FA08 1400BF8F */  lw         $ra, 0x14($sp)
/* 7020C 8007FA0C 1000B08F */  lw         $s0, 0x10($sp)
/* 70210 8007FA10 0800E003 */  jr         $ra
/* 70214 8007FA14 1800BD27 */   addiu     $sp, $sp, 0x18
.size MON_TurnOffAllSpheres, . - MON_TurnOffAllSpheres
