.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_TransformObjectOnStack
/* 57DC0 800675C0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 57DC4 800675C4 21408000 */  addu       $t0, $a0, $zero
/* 57DC8 800675C8 2148A000 */  addu       $t1, $a1, $zero
/* 57DCC 800675CC 2138C000 */  addu       $a3, $a2, $zero
/* 57DD0 800675D0 1000BFAF */  sw         $ra, 0x10($sp)
/* 57DD4 800675D4 0000038D */  lw         $v1, 0x0($t0)
/* 57DD8 800675D8 00000000 */  nop
/* 57DDC 800675DC 09006010 */  beqz       $v1, .L80067604
/* 57DE0 800675E0 21100000 */   addu      $v0, $zero, $zero
/* 57DE4 800675E4 C0200300 */  sll        $a0, $v1, 3
/* 57DE8 800675E8 21208300 */  addu       $a0, $a0, $v1
/* 57DEC 800675EC 80200400 */  sll        $a0, $a0, 2
/* 57DF0 800675F0 E0FF8424 */  addiu      $a0, $a0, -0x20
/* 57DF4 800675F4 21200401 */  addu       $a0, $t0, $a0
/* 57DF8 800675F8 21280001 */  addu       $a1, $t0, $zero
/* 57DFC 800675FC BFA2010C */  jal        EVENT_TransformOperand
/* 57E00 80067600 21302001 */   addu      $a2, $t1, $zero
.L80067604:
/* 57E04 80067604 1000BF8F */  lw         $ra, 0x10($sp)
/* 57E08 80067608 00000000 */  nop
/* 57E0C 8006760C 0800E003 */  jr         $ra
/* 57E10 80067610 1800BD27 */   addiu     $sp, $sp, 0x18
.size EVENT_TransformObjectOnStack, . - EVENT_TransformObjectOnStack
