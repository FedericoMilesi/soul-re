.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razSwitchVAnimSingle
/* 97A8C 800A728C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 97A90 800A7290 E8FB828F */  lw         $v0, %gp_rel(PlayerData)($gp)
/* 97A94 800A7294 3000A38F */  lw         $v1, 0x30($sp)
/* 97A98 800A7298 1800BFAF */  sw         $ra, 0x18($sp)
/* 97A9C 800A729C 1C00428C */  lw         $v0, 0x1C($v0)
/* 97AA0 800A72A0 C0300600 */  sll        $a2, $a2, 3
/* 97AA4 800A72A4 1000A3AF */  sw         $v1, 0x10($sp)
/* 97AA8 800A72A8 B09C020C */  jal        razSwitchVAnim
/* 97AAC 800A72AC 21304600 */   addu      $a2, $v0, $a2
/* 97AB0 800A72B0 1800BF8F */  lw         $ra, 0x18($sp)
/* 97AB4 800A72B4 00000000 */  nop
/* 97AB8 800A72B8 0800E003 */  jr         $ra
/* 97ABC 800A72BC 2000BD27 */   addiu     $sp, $sp, 0x20
.size razSwitchVAnimSingle, . - razSwitchVAnimSingle
