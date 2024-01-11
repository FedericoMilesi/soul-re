.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LIST_GetFunc
/* 403EC 8004FBEC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 403F0 8004FBF0 1400BFAF */  sw         $ra, 0x14($sp)
/* 403F4 8004FBF4 1000B0AF */  sw         $s0, 0x10($sp)
/* 403F8 8004FBF8 0400908C */  lw         $s0, 0x4($a0)
/* 403FC 8004FBFC 00000000 */  nop
/* 40400 8004FC00 04000012 */  beqz       $s0, .L8004FC14
/* 40404 8004FC04 21100000 */   addu      $v0, $zero, $zero
/* 40408 8004FC08 E03E010C */  jal        LIST_DeleteFunc
/* 4040C 8004FC0C 21200002 */   addu      $a0, $s0, $zero
/* 40410 8004FC10 21100002 */  addu       $v0, $s0, $zero
.L8004FC14:
/* 40414 8004FC14 1400BF8F */  lw         $ra, 0x14($sp)
/* 40418 8004FC18 1000B08F */  lw         $s0, 0x10($sp)
/* 4041C 8004FC1C 0800E003 */  jr         $ra
/* 40420 8004FC20 1800BD27 */   addiu     $sp, $sp, 0x18
.size LIST_GetFunc, . - LIST_GetFunc
