.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razSetDampingPhysics
/* 974A0 800A6CA0 E8FB838F */  lw         $v1, %gp_rel(PlayerData)($gp)
/* 974A4 800A6CA4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 974A8 800A6CA8 1000BFAF */  sw         $ra, 0x10($sp)
/* 974AC 800A6CAC 98F980AF */  sw         $zero, %gp_rel(Raziel + 0x368)($gp)
/* 974B0 800A6CB0 40FB80A7 */  sh         $zero, %gp_rel(Raziel + 0x510)($gp)
/* 974B4 800A6CB4 4400658C */  lw         $a1, 0x44($v1)
/* 974B8 800A6CB8 04000224 */  addiu      $v0, $zero, 0x4
/* 974BC 800A6CBC 30FD82AF */  sw         $v0, %gp_rel(PhysicsMode)($gp)
/* 974C0 800A6CC0 9A68020C */  jal        SetDampingPhysics
/* 974C4 800A6CC4 00000000 */   nop
/* 974C8 800A6CC8 1000BF8F */  lw         $ra, 0x10($sp)
/* 974CC 800A6CCC 00000000 */  nop
/* 974D0 800A6CD0 0800E003 */  jr         $ra
/* 974D4 800A6CD4 1800BD27 */   addiu     $sp, $sp, 0x18
.size razSetDampingPhysics, . - razSetDampingPhysics
