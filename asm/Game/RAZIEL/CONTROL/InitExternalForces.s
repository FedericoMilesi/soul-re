.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel InitExternalForces
/* 8AC78 8009A478 FFFFA524 */  addiu      $a1, $a1, -0x1
/* 8AC7C 8009A47C 0B00A010 */  beqz       $a1, .L8009A4AC
/* 8AC80 8009A480 80100500 */   sll       $v0, $a1, 2
/* 8AC84 8009A484 21104500 */  addu       $v0, $v0, $a1
/* 8AC88 8009A488 80100200 */  sll        $v0, $v0, 2
/* 8AC8C 8009A48C 21104400 */  addu       $v0, $v0, $a0
.L8009A490:
/* 8AC90 8009A490 100040A4 */  sh         $zero, 0x10($v0)
/* 8AC94 8009A494 040040AC */  sw         $zero, 0x4($v0)
/* 8AC98 8009A498 080040AC */  sw         $zero, 0x8($v0)
/* 8AC9C 8009A49C 0C0040AC */  sw         $zero, 0xC($v0)
/* 8ACA0 8009A4A0 FFFFA524 */  addiu      $a1, $a1, -0x1
/* 8ACA4 8009A4A4 FAFFA014 */  bnez       $a1, .L8009A490
/* 8ACA8 8009A4A8 ECFF4224 */   addiu     $v0, $v0, -0x14
.L8009A4AC:
/* 8ACAC 8009A4AC F0F584AF */  sw         $a0, %gp_rel(ExternalForces)($gp)
/* 8ACB0 8009A4B0 0800E003 */  jr         $ra
/* 8ACB4 8009A4B4 00000000 */   nop
.size InitExternalForces, . - InitExternalForces
