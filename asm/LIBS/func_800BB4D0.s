.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BB4D0
/* ABCD0 800BB4D0 FF07A530 */  andi       $a1, $a1, 0x7FF
/* ABCD4 800BB4D4 C02A0500 */  sll        $a1, $a1, 11
/* ABCD8 800BB4D8 FF078230 */  andi       $v0, $a0, 0x7FF
/* ABCDC 800BB4DC 00E5033C */  lui        $v1, (0xE5000000 >> 16)
/* ABCE0 800BB4E0 25104300 */  or         $v0, $v0, $v1
/* ABCE4 800BB4E4 0800E003 */  jr         $ra
/* ABCE8 800BB4E8 2510A200 */   or        $v0, $a1, $v0
.size func_800BB4D0, . - func_800BB4D0
