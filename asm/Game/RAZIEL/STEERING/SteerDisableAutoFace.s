.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SteerDisableAutoFace
/* 935B8 800A2DB8 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 935BC 800A2DBC 1400B1AF */  sw         $s1, 0x14($sp)
/* 935C0 800A2DC0 21888000 */  addu       $s1, $a0, $zero
/* 935C4 800A2DC4 1000B0AF */  sw         $s0, 0x10($sp)
/* 935C8 800A2DC8 C8013026 */  addiu      $s0, $s1, 0x1C8
/* 935CC 800A2DCC 21200002 */  addu       $a0, $s0, $zero
/* 935D0 800A2DD0 01000524 */  addiu      $a1, $zero, 0x1
/* 935D4 800A2DD4 1800BFAF */  sw         $ra, 0x18($sp)
/* 935D8 800A2DD8 E541020C */  jal        G2Anim_IsControllerActive
/* 935DC 800A2DDC 0A000624 */   addiu     $a2, $zero, 0xA
/* 935E0 800A2DE0 04004010 */  beqz       $v0, .L800A2DF4
/* 935E4 800A2DE4 21200002 */   addu      $a0, $s0, $zero
/* 935E8 800A2DE8 01000524 */  addiu      $a1, $zero, 0x1
/* 935EC 800A2DEC 8D41020C */  jal        G2Anim_DisableController
/* 935F0 800A2DF0 0A000624 */   addiu     $a2, $zero, 0xA
.L800A2DF4:
/* 935F4 800A2DF4 21200002 */  addu       $a0, $s0, $zero
/* 935F8 800A2DF8 0E000524 */  addiu      $a1, $zero, 0xE
/* 935FC 800A2DFC E541020C */  jal        G2Anim_IsControllerActive
/* 93600 800A2E00 2130A000 */   addu      $a2, $a1, $zero
/* 93604 800A2E04 04004010 */  beqz       $v0, .L800A2E18
/* 93608 800A2E08 21200002 */   addu      $a0, $s0, $zero
/* 9360C 800A2E0C 0E000524 */  addiu      $a1, $zero, 0xE
/* 93610 800A2E10 8D41020C */  jal        G2Anim_DisableController
/* 93614 800A2E14 2130A000 */   addu      $a2, $a1, $zero
.L800A2E18:
/* 93618 800A2E18 78002296 */  lhu        $v0, 0x78($s1)
/* 9361C 800A2E1C 64FB8397 */  lhu        $v1, %gp_rel(Raziel + 0x534)($gp)
/* 93620 800A2E20 00000000 */  nop
/* 93624 800A2E24 21104300 */  addu       $v0, $v0, $v1
/* 93628 800A2E28 780022A6 */  sh         $v0, 0x78($s1)
/* 9362C 800A2E2C 1800BF8F */  lw         $ra, 0x18($sp)
/* 93630 800A2E30 1400B18F */  lw         $s1, 0x14($sp)
/* 93634 800A2E34 1000B08F */  lw         $s0, 0x10($sp)
/* 93638 800A2E38 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 9363C 800A2E3C 64FB80AF */  sw         $zero, %gp_rel(Raziel + 0x534)($gp)
/* 93640 800A2E40 6CFB82AF */  sw         $v0, %gp_rel(Raziel + 0x53C)($gp)
/* 93644 800A2E44 0800E003 */  jr         $ra
/* 93648 800A2E48 2000BD27 */   addiu     $sp, $sp, 0x20
.size SteerDisableAutoFace, . - SteerDisableAutoFace
