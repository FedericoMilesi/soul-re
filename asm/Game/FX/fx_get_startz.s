.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel fx_get_startz
/* 3ECE8 8004E4E8 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 3ECEC 8004E4EC 3000BFAF */  sw         $ra, 0x30($sp)
/* 3ECF0 8004E4F0 000080C8 */  lwc2       $0, 0x0($a0)
/* 3ECF4 8004E4F4 040081C8 */  lwc2       $1, 0x4($a0)
/* 3ECF8 8004E4F8 00000000 */  nop
/* 3ECFC 8004E4FC 00000000 */  nop
/* 3ED00 8004E500 1200484A */  MVMVA      1, 0, 0, 0, 0
/* 3ED04 8004E504 2400A227 */  addiu      $v0, $sp, 0x24
/* 3ED08 8004E508 000059E8 */  swc2       $25, 0x0($v0)
/* 3ED0C 8004E50C 04005AE8 */  swc2       $26, 0x4($v0) # handwritten instruction
/* 3ED10 8004E510 08005BE8 */  swc2       $27, 0x8($v0) # handwritten instruction
/* 3ED14 8004E514 4AF2020C */  jal        SetTransMatrix
/* 3ED18 8004E518 1000A427 */   addiu     $a0, $sp, 0x10
/* 3ED1C 8004E51C 2C00A28F */  lw         $v0, 0x2C($sp)
/* 3ED20 8004E520 00000000 */  nop
/* 3ED24 8004E524 02004104 */  bgez       $v0, .L8004E530
/* 3ED28 8004E528 00000000 */   nop
/* 3ED2C 8004E52C 03004224 */  addiu      $v0, $v0, 0x3
.L8004E530:
/* 3ED30 8004E530 3000BF8F */  lw         $ra, 0x30($sp)
/* 3ED34 8004E534 83100200 */  sra        $v0, $v0, 2
/* 3ED38 8004E538 0800E003 */  jr         $ra
/* 3ED3C 8004E53C 3800BD27 */   addiu     $sp, $sp, 0x38
.size fx_get_startz, . - fx_get_startz
