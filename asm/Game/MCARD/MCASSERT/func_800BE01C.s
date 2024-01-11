.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BE01C
/* AE81C 800BE01C 0D80023C */  lui        $v0, %hi(CD_mode)
/* AE820 800BE020 A0E94290 */  lbu        $v0, %lo(CD_mode)($v0)
/* AE824 800BE024 0800E003 */  jr         $ra
/* AE828 800BE028 00000000 */   nop
.size func_800BE01C, . - func_800BE01C
