.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razAttachControllers
/* 97F74 800A7774 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 97F78 800A7778 1400B1AF */  sw         $s1, 0x14($sp)
/* 97F7C 800A777C 21880000 */  addu       $s1, $zero, $zero
/* 97F80 800A7780 1000B0AF */  sw         $s0, 0x10($sp)
/* 97F84 800A7784 CCA69027 */  addiu      $s0, $gp, %gp_rel(controllerList)
/* 97F88 800A7788 1800BFAF */  sw         $ra, 0x18($sp)
/* 97F8C 800A778C 01003126 */  addiu      $s1, $s1, 0x1
.L800A7790:
/* 97F90 800A7790 00000596 */  lhu        $a1, 0x0($s0)
/* 97F94 800A7794 F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 97F98 800A7798 02000696 */  lhu        $a2, 0x2($s0)
/* 97F9C 800A779C 1641020C */  jal        G2Anim_AttachControllerToSeg
/* 97FA0 800A77A0 C8018424 */   addiu     $a0, $a0, 0x1C8
/* 97FA4 800A77A4 00000596 */  lhu        $a1, 0x0($s0)
/* 97FA8 800A77A8 02000696 */  lhu        $a2, 0x2($s0)
/* 97FAC 800A77AC F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 97FB0 800A77B0 04001026 */  addiu      $s0, $s0, 0x4
/* 97FB4 800A77B4 8D41020C */  jal        G2Anim_DisableController
/* 97FB8 800A77B8 C8018424 */   addiu     $a0, $a0, 0x1C8
/* 97FBC 800A77BC 1800222A */  slti       $v0, $s1, 0x18
/* 97FC0 800A77C0 F3FF4014 */  bnez       $v0, .L800A7790
/* 97FC4 800A77C4 01003126 */   addiu     $s1, $s1, 0x1
/* 97FC8 800A77C8 1800BF8F */  lw         $ra, 0x18($sp)
/* 97FCC 800A77CC 1400B18F */  lw         $s1, 0x14($sp)
/* 97FD0 800A77D0 1000B08F */  lw         $s0, 0x10($sp)
/* 97FD4 800A77D4 0800E003 */  jr         $ra
/* 97FD8 800A77D8 2000BD27 */   addiu     $sp, $sp, 0x20
.size razAttachControllers, . - razAttachControllers
