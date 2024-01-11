.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BD704
/* ADF04 800BD704 37008290 */  lbu        $v0, 0x37($a0)
/* ADF08 800BD708 370080A0 */  sb         $zero, 0x37($a0)
/* ADF0C 800BD70C 0800E003 */  jr         $ra
/* ADF10 800BD710 380082A0 */   sb        $v0, 0x38($a0)
.size func_800BD704, . - func_800BD704
