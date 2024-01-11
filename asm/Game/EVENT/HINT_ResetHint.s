.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel HINT_ResetHint
/* 5152C 80060D2C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 51530 80060D30 18CF8427 */  addiu      $a0, $gp, %gp_rel(gHintSystem)
/* 51534 80060D34 21280000 */  addu       $a1, $zero, $zero
/* 51538 80060D38 1000BFAF */  sw         $ra, 0x10($sp)
/* 5153C 80060D3C 2EF2020C */  jal        func_800BC8B8
/* 51540 80060D40 10000624 */   addiu     $a2, $zero, 0x10
/* 51544 80060D44 1000BF8F */  lw         $ra, 0x10($sp)
/* 51548 80060D48 00000000 */  nop
/* 5154C 80060D4C 0800E003 */  jr         $ra
/* 51550 80060D50 1800BD27 */   addiu     $sp, $sp, 0x18
.size HINT_ResetHint, . - HINT_ResetHint
