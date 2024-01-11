.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_TryAndDumpANonResidentObject
/* 49784 80058F84 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 49788 80058F88 1400B1AF */  sw         $s1, 0x14($sp)
/* 4978C 80058F8C 0CBE918F */  lw         $s1, %gp_rel(gameTrackerX + 0x44)($gp)
/* 49790 80058F90 1000B0AF */  sw         $s0, 0x10($sp)
/* 49794 80058F94 21800000 */  addu       $s0, $zero, $zero
/* 49798 80058F98 1800BFAF */  sw         $ra, 0x18($sp)
.L80058F9C:
/* 4979C 80058F9C 8D7F010C */  jal        STREAM_TryAndDumpNonResident
/* 497A0 80058FA0 21202002 */   addu      $a0, $s1, $zero
/* 497A4 80058FA4 06004014 */  bnez       $v0, .L80058FC0
/* 497A8 80058FA8 21100002 */   addu      $v0, $s0, $zero
/* 497AC 80058FAC 01001026 */  addiu      $s0, $s0, 0x1
/* 497B0 80058FB0 3000022A */  slti       $v0, $s0, 0x30
/* 497B4 80058FB4 F9FF4014 */  bnez       $v0, .L80058F9C
/* 497B8 80058FB8 24003126 */   addiu     $s1, $s1, 0x24
/* 497BC 80058FBC FFFF0224 */  addiu      $v0, $zero, -0x1
.L80058FC0:
/* 497C0 80058FC0 1800BF8F */  lw         $ra, 0x18($sp)
/* 497C4 80058FC4 1400B18F */  lw         $s1, 0x14($sp)
/* 497C8 80058FC8 1000B08F */  lw         $s0, 0x10($sp)
/* 497CC 80058FCC 0800E003 */  jr         $ra
/* 497D0 80058FD0 2000BD27 */   addiu     $sp, $sp, 0x20
.size STREAM_TryAndDumpANonResidentObject, . - STREAM_TryAndDumpANonResidentObject
