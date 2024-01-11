.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_TurnOnAllSpheres
/* 70218 8007FA18 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 7021C 8007FA1C 1000B0AF */  sw         $s0, 0x10($sp)
/* 70220 8007FA20 1400BFAF */  sw         $ra, 0x14($sp)
/* 70224 8007FA24 B4FD010C */  jal        MON_TurnOnWeaponSpheres
/* 70228 8007FA28 21808000 */   addu      $s0, $a0, $zero
/* 7022C 8007FA2C 4EFE010C */  jal        MON_TurnOnBodySpheres
/* 70230 8007FA30 21200002 */   addu      $a0, $s0, $zero
/* 70234 8007FA34 1400BF8F */  lw         $ra, 0x14($sp)
/* 70238 8007FA38 1000B08F */  lw         $s0, 0x10($sp)
/* 7023C 8007FA3C 0800E003 */  jr         $ra
/* 70240 8007FA40 1800BD27 */   addiu     $sp, $sp, 0x18
.size MON_TurnOnAllSpheres, . - MON_TurnOnAllSpheres
