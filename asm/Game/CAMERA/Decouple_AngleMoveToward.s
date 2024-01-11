.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Decouple_AngleMoveToward
/* 7930 80017130 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 7934 80017134 2138C000 */  addu       $a3, $a2, $zero
/* 7938 80017138 08C0838F */  lw         $v1, %gp_rel(gameTrackerX + 0x240)($gp)
/* 793C 8001713C 00100224 */  addiu      $v0, $zero, 0x1000
/* 7940 80017140 06006210 */  beq        $v1, $v0, .L8001715C
/* 7944 80017144 1000BFAF */   sw        $ra, 0x10($sp)
/* 7948 80017148 00140600 */  sll        $v0, $a2, 16
/* 794C 8001714C 03140200 */  sra        $v0, $v0, 16
/* 7950 80017150 18004300 */  mult       $v0, $v1
/* 7954 80017154 12400000 */  mflo       $t0
/* 7958 80017158 023B0800 */  srl        $a3, $t0, 12
.L8001715C:
/* 795C 8001715C 002C0500 */  sll        $a1, $a1, 16
/* 7960 80017160 00340700 */  sll        $a2, $a3, 16
/* 7964 80017164 032C0500 */  sra        $a1, $a1, 16
/* 7968 80017168 53E8000C */  jal        AngleMoveToward
/* 796C 8001716C 03340600 */   sra       $a2, $a2, 16
/* 7970 80017170 1000BF8F */  lw         $ra, 0x10($sp)
/* 7974 80017174 00000000 */  nop
/* 7978 80017178 0800E003 */  jr         $ra
/* 797C 8001717C 1800BD27 */   addiu     $sp, $sp, 0x18
.size Decouple_AngleMoveToward, . - Decouple_AngleMoveToward
