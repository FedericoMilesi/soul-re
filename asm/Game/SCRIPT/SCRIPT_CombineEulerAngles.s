.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SCRIPT_CombineEulerAngles
/* 2D4BC 8003CCBC 98FFBD27 */  addiu      $sp, $sp, -0x68
/* 2D4C0 8003CCC0 5C00B1AF */  sw         $s1, 0x5C($sp)
/* 2D4C4 8003CCC4 21888000 */  addu       $s1, $a0, $zero
/* 2D4C8 8003CCC8 2120A000 */  addu       $a0, $a1, $zero
/* 2D4CC 8003CCCC 1000A527 */  addiu      $a1, $sp, 0x10
/* 2D4D0 8003CCD0 5800B0AF */  sw         $s0, 0x58($sp)
/* 2D4D4 8003CCD4 6000BFAF */  sw         $ra, 0x60($sp)
/* 2D4D8 8003CCD8 3DE3010C */  jal        func_80078CF4
/* 2D4DC 8003CCDC 2180C000 */   addu      $s0, $a2, $zero
/* 2D4E0 8003CCE0 21200002 */  addu       $a0, $s0, $zero
/* 2D4E4 8003CCE4 3000B027 */  addiu      $s0, $sp, 0x30
/* 2D4E8 8003CCE8 3DE3010C */  jal        func_80078CF4
/* 2D4EC 8003CCEC 21280002 */   addu      $a1, $s0, $zero
/* 2D4F0 8003CCF0 21200002 */  addu       $a0, $s0, $zero
/* 2D4F4 8003CCF4 15FD020C */  jal        func_800BF454
/* 2D4F8 8003CCF8 1000A527 */   addiu     $a1, $sp, 0x10
/* 2D4FC 8003CCFC 5000B027 */  addiu      $s0, $sp, 0x50
/* 2D500 8003CD00 21200002 */  addu       $a0, $s0, $zero
/* 2D504 8003CD04 1000A527 */  addiu      $a1, $sp, 0x10
/* 2D508 8003CD08 1758020C */  jal        G2EulerAngles_FromMatrix
/* 2D50C 8003CD0C 15000624 */   addiu     $a2, $zero, 0x15
/* 2D510 8003CD10 5000A297 */  lhu        $v0, 0x50($sp)
/* 2D514 8003CD14 02000396 */  lhu        $v1, 0x2($s0)
/* 2D518 8003CD18 04000496 */  lhu        $a0, 0x4($s0)
/* 2D51C 8003CD1C 000022A6 */  sh         $v0, 0x0($s1)
/* 2D520 8003CD20 020023A6 */  sh         $v1, 0x2($s1)
/* 2D524 8003CD24 040024A6 */  sh         $a0, 0x4($s1)
/* 2D528 8003CD28 6000BF8F */  lw         $ra, 0x60($sp)
/* 2D52C 8003CD2C 5C00B18F */  lw         $s1, 0x5C($sp)
/* 2D530 8003CD30 5800B08F */  lw         $s0, 0x58($sp)
/* 2D534 8003CD34 0800E003 */  jr         $ra
/* 2D538 8003CD38 6800BD27 */   addiu     $sp, $sp, 0x68
.size SCRIPT_CombineEulerAngles, . - SCRIPT_CombineEulerAngles
