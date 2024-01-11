.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_BloodCone
/* 396F8 80048EF8 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 396FC 80048EFC 0D80023C */  lui        $v0, %hi(objectAccess + 0x54)
/* 39700 80048F00 1400B1AF */  sw         $s1, 0x14($sp)
/* 39704 80048F04 90A2518C */  lw         $s1, %lo(objectAccess + 0x54)($v0)
/* 39708 80048F08 1800B2AF */  sw         $s2, 0x18($sp)
/* 3970C 80048F0C 2190C000 */  addu       $s2, $a2, $zero
/* 39710 80048F10 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 39714 80048F14 03002016 */  bnez       $s1, .L80048F24
/* 39718 80048F18 1000B0AF */   sw        $s0, 0x10($sp)
/* 3971C 80048F1C EB230108 */  j          .L80048FAC
/* 39720 80048F20 21100000 */   addu      $v0, $zero, $zero
.L80048F24:
/* 39724 80048F24 002C0500 */  sll        $a1, $a1, 16
/* 39728 80048F28 DC09010C */  jal        FX_GetParticle
/* 3972C 80048F2C 032C0500 */   sra       $a1, $a1, 16
/* 39730 80048F30 21804000 */  addu       $s0, $v0, $zero
/* 39734 80048F34 1C000012 */  beqz       $s0, .L80048FA8
/* 39738 80048F38 21202002 */   addu      $a0, $s1, $zero
/* 3973C 80048F3C 21280000 */  addu       $a1, $zero, $zero
/* 39740 80048F40 0E000224 */  addiu      $v0, $zero, 0xE
/* 39744 80048F44 01000624 */  addiu      $a2, $zero, 0x1
/* 39748 80048F48 9D19010C */  jal        FX_GetTextureObject
/* 3974C 80048F4C 1C0002A6 */   sh        $v0, 0x1C($s0)
/* 39750 80048F50 1802033C */  lui        $v1, (0x21800FF >> 16)
/* 39754 80048F54 FF006334 */  ori        $v1, $v1, (0x21800FF & 0xFFFF)
/* 39758 80048F58 21200002 */  addu       $a0, $s0, $zero
/* 3975C 80048F5C 100002AE */  sw         $v0, 0x10($s0)
/* 39760 80048F60 14000224 */  addiu      $v0, $zero, 0x14
/* 39764 80048F64 200002A6 */  sh         $v0, 0x20($s0)
/* 39768 80048F68 00010224 */  addiu      $v0, $zero, 0x100
/* 3976C 80048F6C 240002A6 */  sh         $v0, 0x24($s0)
/* 39770 80048F70 260002A6 */  sh         $v0, 0x26($s0)
/* 39774 80048F74 280002A6 */  sh         $v0, 0x28($s0)
/* 39778 80048F78 FEFF0224 */  addiu      $v0, $zero, -0x2
/* 3977C 80048F7C 300002A6 */  sh         $v0, 0x30($s0)
/* 39780 80048F80 0A000224 */  addiu      $v0, $zero, 0xA
/* 39784 80048F84 460002A2 */  sb         $v0, 0x46($s0)
/* 39788 80048F88 0A000224 */  addiu      $v0, $zero, 0xA
/* 3978C 80048F8C 2C0000A6 */  sh         $zero, 0x2C($s0)
/* 39790 80048F90 2E0000A6 */  sh         $zero, 0x2E($s0)
/* 39794 80048F94 3C0003AE */  sw         $v1, 0x3C($s0)
/* 39798 80048F98 400000AE */  sw         $zero, 0x40($s0)
/* 3979C 80048F9C 0E0012A6 */  sh         $s2, 0xE($s0)
/* 397A0 80048FA0 1B2D010C */  jal        FX_InsertGeneralEffect
/* 397A4 80048FA4 1E0002A6 */   sh        $v0, 0x1E($s0)
.L80048FA8:
/* 397A8 80048FA8 21100002 */  addu       $v0, $s0, $zero
.L80048FAC:
/* 397AC 80048FAC 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 397B0 80048FB0 1800B28F */  lw         $s2, 0x18($sp)
/* 397B4 80048FB4 1400B18F */  lw         $s1, 0x14($sp)
/* 397B8 80048FB8 1000B08F */  lw         $s0, 0x10($sp)
/* 397BC 80048FBC 0800E003 */  jr         $ra
/* 397C0 80048FC0 2000BD27 */   addiu     $sp, $sp, 0x20
.size FX_BloodCone, . - FX_BloodCone
