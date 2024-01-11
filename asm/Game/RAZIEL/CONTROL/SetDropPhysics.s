.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetDropPhysics
/* 8AC40 8009A440 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 8AC44 8009A444 00100224 */  addiu      $v0, $zero, 0x1000
/* 8AC48 8009A448 21280000 */  addu       $a1, $zero, $zero
/* 8AC4C 8009A44C 04000624 */  addiu      $a2, $zero, 0x4
/* 8AC50 8009A450 F0F5848F */  lw         $a0, %gp_rel(ExternalForces)($gp)
/* 8AC54 8009A454 F0FF0724 */  addiu      $a3, $zero, -0x10
/* 8AC58 8009A458 1800BFAF */  sw         $ra, 0x18($sp)
/* 8AC5C 8009A45C 1000A0AF */  sw         $zero, 0x10($sp)
/* 8AC60 8009A460 2E69020C */  jal        SetExternalForce
/* 8AC64 8009A464 1400A2AF */   sw        $v0, 0x14($sp)
/* 8AC68 8009A468 1800BF8F */  lw         $ra, 0x18($sp)
/* 8AC6C 8009A46C 00000000 */  nop
/* 8AC70 8009A470 0800E003 */  jr         $ra
/* 8AC74 8009A474 2000BD27 */   addiu     $sp, $sp, 0x20
.size SetDropPhysics, . - SetDropPhysics
