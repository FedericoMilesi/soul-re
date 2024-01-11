.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BE00C
/* AE80C 800BE00C 0D80023C */  lui        $v0, %hi(CD_status)
/* AE810 800BE010 90E94290 */  lbu        $v0, %lo(CD_status)($v0)
/* AE814 800BE014 0800E003 */  jr         $ra
/* AE818 800BE018 00000000 */   nop
.size func_800BE00C, . - func_800BE00C
