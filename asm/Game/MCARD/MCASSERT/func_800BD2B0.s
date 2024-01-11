.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BD2B0
/* ADAB0 800BD2B0 21180000 */  addu       $v1, $zero, $zero
/* ADAB4 800BD2B4 09008010 */  beqz       $a0, .L800BD2DC
/* ADAB8 800BD2B8 21100000 */   addu      $v0, $zero, $zero
/* ADABC 800BD2BC B2F40208 */  j          .L800BD2C8
/* ADAC0 800BD2C0 00000000 */   nop
.L800BD2C4:
/* ADAC4 800BD2C4 01006324 */  addiu      $v1, $v1, 0x1
.L800BD2C8:
/* ADAC8 800BD2C8 00008280 */  lb         $v0, 0x0($a0)
/* ADACC 800BD2CC 00000000 */  nop
/* ADAD0 800BD2D0 FCFF4014 */  bnez       $v0, .L800BD2C4
/* ADAD4 800BD2D4 01008424 */   addiu     $a0, $a0, 0x1
/* ADAD8 800BD2D8 21106000 */  addu       $v0, $v1, $zero
.L800BD2DC:
/* ADADC 800BD2DC 0800E003 */  jr         $ra
/* ADAE0 800BD2E0 00000000 */   nop
/* ADAE4 800BD2E4 00000000 */  nop
/* ADAE8 800BD2E8 00000000 */  nop
/* ADAEC 800BD2EC 00000000 */  nop
.size func_800BD2B0, . - func_800BD2B0
