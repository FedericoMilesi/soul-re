.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _FX_SetupLighting
/* 33670 80042E70 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 33674 80042E74 3000B0AF */  sw         $s0, 0x30($sp)
/* 33678 80042E78 21808000 */  addu       $s0, $a0, $zero
/* 3367C 80042E7C 00080524 */  addiu      $a1, $zero, 0x800
/* 33680 80042E80 3400BFAF */  sw         $ra, 0x34($sp)
/* 33684 80042E84 90D7000C */  jal        LIGHT_PresetInstanceLight
/* 33688 80042E88 1000A627 */   addiu     $a2, $sp, 0x10
/* 3368C 80042E8C 1000A427 */  addiu      $a0, $sp, 0x10
/* 33690 80042E90 21308000 */  addu       $a2, $a0, $zero
/* 33694 80042E94 06010586 */  lh         $a1, 0x106($s0)
/* 33698 80042E98 4000028E */  lw         $v0, 0x40($s0)
/* 3369C 80042E9C 40290500 */  sll        $a1, $a1, 5
/* 336A0 80042EA0 BFF7020C */  jal        MulMatrix0
/* 336A4 80042EA4 21284500 */   addu      $a1, $v0, $a1
/* 336A8 80042EA8 9FF7020C */  jal        SetLightMatrix
/* 336AC 80042EAC 1000A427 */   addiu     $a0, $sp, 0x10
/* 336B0 80042EB0 3400BF8F */  lw         $ra, 0x34($sp)
/* 336B4 80042EB4 3000B08F */  lw         $s0, 0x30($sp)
/* 336B8 80042EB8 0800E003 */  jr         $ra
/* 336BC 80042EBC 3800BD27 */   addiu     $sp, $sp, 0x38
.size _FX_SetupLighting, . - _FX_SetupLighting
