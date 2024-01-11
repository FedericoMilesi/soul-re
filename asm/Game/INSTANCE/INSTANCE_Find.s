.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel INSTANCE_Find
/* 25188 80034988 FCBD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x34)($gp)
/* 2518C 8003498C 00000000 */  nop
/* 25190 80034990 0400438C */  lw         $v1, 0x4($v0)
/* 25194 80034994 00000000 */  nop
/* 25198 80034998 09006010 */  beqz       $v1, .L800349C0
/* 2519C 8003499C 00000000 */   nop
.L800349A0:
/* 251A0 800349A0 3C00628C */  lw         $v0, 0x3C($v1)
/* 251A4 800349A4 00000000 */  nop
/* 251A8 800349A8 05004410 */  beq        $v0, $a0, .L800349C0
/* 251AC 800349AC 00000000 */   nop
/* 251B0 800349B0 0800638C */  lw         $v1, 0x8($v1)
/* 251B4 800349B4 00000000 */  nop
/* 251B8 800349B8 F9FF6014 */  bnez       $v1, .L800349A0
/* 251BC 800349BC 00000000 */   nop
.L800349C0:
/* 251C0 800349C0 0800E003 */  jr         $ra
/* 251C4 800349C4 21106000 */   addu      $v0, $v1, $zero
.size INSTANCE_Find, . - INSTANCE_Find
