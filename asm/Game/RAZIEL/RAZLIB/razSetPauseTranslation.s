.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razSetPauseTranslation
/* 96B80 800A6380 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 96B84 800A6384 1800B0AF */  sw         $s0, 0x18($sp)
/* 96B88 800A6388 C8019024 */  addiu      $s0, $a0, 0x1C8
/* 96B8C 800A638C 21200002 */  addu       $a0, $s0, $zero
/* 96B90 800A6390 21280000 */  addu       $a1, $zero, $zero
/* 96B94 800A6394 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 96B98 800A6398 E541020C */  jal        G2Anim_IsControllerActive
/* 96B9C 800A639C 22000624 */   addiu     $a2, $zero, 0x22
/* 96BA0 800A63A0 05004014 */  bnez       $v0, .L800A63B8
/* 96BA4 800A63A4 21200002 */   addu      $a0, $s0, $zero
/* 96BA8 800A63A8 21280000 */  addu       $a1, $zero, $zero
/* 96BAC 800A63AC 5641020C */  jal        G2Anim_EnableController
/* 96BB0 800A63B0 22000624 */   addiu     $a2, $zero, 0x22
/* 96BB4 800A63B4 21200002 */  addu       $a0, $s0, $zero
.L800A63B8:
/* 96BB8 800A63B8 21280000 */  addu       $a1, $zero, $zero
/* 96BBC 800A63BC 22000624 */  addiu      $a2, $zero, 0x22
/* 96BC0 800A63C0 1000A727 */  addiu      $a3, $sp, 0x10
/* 96BC4 800A63C4 1000A0A7 */  sh         $zero, 0x10($sp)
/* 96BC8 800A63C8 1200A0A7 */  sh         $zero, 0x12($sp)
/* 96BCC 800A63CC 7D42020C */  jal        G2Anim_SetController_Vector
/* 96BD0 800A63D0 1400A0A7 */   sh        $zero, 0x14($sp)
/* 96BD4 800A63D4 0020033C */  lui        $v1, (0x20000000 >> 16)
/* 96BD8 800A63D8 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 96BDC 800A63DC 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 96BE0 800A63E0 1800B08F */  lw         $s0, 0x18($sp)
/* 96BE4 800A63E4 25104300 */  or         $v0, $v0, $v1
/* 96BE8 800A63E8 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 96BEC 800A63EC 0800E003 */  jr         $ra
/* 96BF0 800A63F0 2000BD27 */   addiu     $sp, $sp, 0x20
.size razSetPauseTranslation, . - razSetPauseTranslation
