.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2AnimSection_SetUnpaused
/* 80A00 80090200 00008290 */  lbu        $v0, 0x0($a0)
/* 80A04 80090204 00000000 */  nop
/* 80A08 80090208 FE004230 */  andi       $v0, $v0, 0xFE
/* 80A0C 8009020C 0800E003 */  jr         $ra
/* 80A10 80090210 000082A0 */   sb        $v0, 0x0($a0)
.size G2AnimSection_SetUnpaused, . - G2AnimSection_SetUnpaused
