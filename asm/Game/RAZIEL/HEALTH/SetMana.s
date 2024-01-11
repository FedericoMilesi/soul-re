.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetMana
/* 955BC 800A4DBC 0400801C */  bgtz       $a0, .L800A4DD0
/* 955C0 800A4DC0 00000000 */   nop
/* 955C4 800A4DC4 40FA80A7 */  sh         $zero, %gp_rel(Raziel + 0x410)($gp)
/* 955C8 800A4DC8 0800E003 */  jr         $ra
/* 955CC 800A4DCC 00000000 */   nop
.L800A4DD0:
/* 955D0 800A4DD0 42FA8297 */  lhu        $v0, %gp_rel(Raziel + 0x412)($gp)
/* 955D4 800A4DD4 00000000 */  nop
/* 955D8 800A4DD8 40FA82A7 */  sh         $v0, %gp_rel(Raziel + 0x410)($gp)
/* 955DC 800A4DDC 0800E003 */  jr         $ra
/* 955E0 800A4DE0 00000000 */   nop
.size SetMana, . - SetMana
