.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_GetMatrix
/* 32EB0 800426B0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 32EB4 800426B4 1400B1AF */  sw         $s1, 0x14($sp)
/* 32EB8 800426B8 21888000 */  addu       $s1, $a0, $zero
/* 32EBC 800426BC 88052426 */  addiu      $a0, $s1, 0x588
/* 32EC0 800426C0 1800BFAF */  sw         $ra, 0x18($sp)
/* 32EC4 800426C4 FB3E010C */  jal        LIST_GetFunc
/* 32EC8 800426C8 1000B0AF */   sw        $s0, 0x10($sp)
/* 32ECC 800426CC 21804000 */  addu       $s0, $v0, $zero
/* 32ED0 800426D0 05000012 */  beqz       $s0, .L800426E8
/* 32ED4 800426D4 01000224 */   addiu     $v0, $zero, 0x1
/* 32ED8 800426D8 080002AE */  sw         $v0, 0x8($s0)
/* 32EDC 800426DC 80052426 */  addiu      $a0, $s1, 0x580
/* 32EE0 800426E0 D53E010C */  jal        LIST_InsertFunc
/* 32EE4 800426E4 21280002 */   addu      $a1, $s0, $zero
.L800426E8:
/* 32EE8 800426E8 21100002 */  addu       $v0, $s0, $zero
/* 32EEC 800426EC 1800BF8F */  lw         $ra, 0x18($sp)
/* 32EF0 800426F0 1400B18F */  lw         $s1, 0x14($sp)
/* 32EF4 800426F4 1000B08F */  lw         $s0, 0x10($sp)
/* 32EF8 800426F8 0800E003 */  jr         $ra
/* 32EFC 800426FC 2000BD27 */   addiu     $sp, $sp, 0x20
.size FX_GetMatrix, . - FX_GetMatrix
