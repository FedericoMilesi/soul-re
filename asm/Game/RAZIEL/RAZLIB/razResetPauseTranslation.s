.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razResetPauseTranslation
/* 96BF4 800A63F4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 96BF8 800A63F8 1000B0AF */  sw         $s0, 0x10($sp)
/* 96BFC 800A63FC C8019024 */  addiu      $s0, $a0, 0x1C8
/* 96C00 800A6400 21200002 */  addu       $a0, $s0, $zero
/* 96C04 800A6404 21280000 */  addu       $a1, $zero, $zero
/* 96C08 800A6408 1400BFAF */  sw         $ra, 0x14($sp)
/* 96C0C 800A640C E541020C */  jal        G2Anim_IsControllerActive
/* 96C10 800A6410 22000624 */   addiu     $a2, $zero, 0x22
/* 96C14 800A6414 04004010 */  beqz       $v0, .L800A6428
/* 96C18 800A6418 21200002 */   addu      $a0, $s0, $zero
/* 96C1C 800A641C 21280000 */  addu       $a1, $zero, $zero
/* 96C20 800A6420 8D41020C */  jal        G2Anim_DisableController
/* 96C24 800A6424 22000624 */   addiu     $a2, $zero, 0x22
.L800A6428:
/* 96C28 800A6428 FFDF033C */  lui        $v1, (0xDFFFFFFF >> 16)
/* 96C2C 800A642C FFFF6334 */  ori        $v1, $v1, (0xDFFFFFFF & 0xFFFF)
/* 96C30 800A6430 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 96C34 800A6434 1400BF8F */  lw         $ra, 0x14($sp)
/* 96C38 800A6438 1000B08F */  lw         $s0, 0x10($sp)
/* 96C3C 800A643C 24104300 */  and        $v0, $v0, $v1
/* 96C40 800A6440 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 96C44 800A6444 0800E003 */  jr         $ra
/* 96C48 800A6448 1800BD27 */   addiu     $sp, $sp, 0x18
.size razResetPauseTranslation, . - razResetPauseTranslation
