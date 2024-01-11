.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RAZIEL_DebugManaSetMax
/* 956BC 800A4EBC 80200400 */  sll        $a0, $a0, 2
/* 956C0 800A4EC0 42FA84A7 */  sh         $a0, %gp_rel(Raziel + 0x412)($gp)
/* 956C4 800A4EC4 40FA84A7 */  sh         $a0, %gp_rel(Raziel + 0x410)($gp)
/* 956C8 800A4EC8 0800E003 */  jr         $ra
/* 956CC 800A4ECC 00000000 */   nop
.size RAZIEL_DebugManaSetMax, . - RAZIEL_DebugManaSetMax
