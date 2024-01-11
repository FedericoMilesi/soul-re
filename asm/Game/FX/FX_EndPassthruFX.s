.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_EndPassthruFX
/* 40334 8004FB34 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 40338 8004FB38 1000BFAF */  sw         $ra, 0x10($sp)
/* 4033C 8004FB3C 9635010C */  jal        FX_EndInstanceEffects
/* 40340 8004FB40 00000000 */   nop
/* 40344 8004FB44 1000BF8F */  lw         $ra, 0x10($sp)
/* 40348 8004FB48 00000000 */  nop
/* 4034C 8004FB4C 0800E003 */  jr         $ra
/* 40350 8004FB50 1800BD27 */   addiu     $sp, $sp, 0x18
.size FX_EndPassthruFX, . - FX_EndPassthruFX
